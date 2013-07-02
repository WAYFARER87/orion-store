unit SaleOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ExtCtrls, StdCtrls, ComCtrls, ToolWin,
  DateUtils;

type
  TSaleOrderForm = class(TForm)
    Panel1: TPanel;
    CloseButton: TButton;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    InsertButton: TToolButton;
    EditButton: TToolButton;
    DeleteButton: TToolButton;
    ToolButton2: TToolButton;
    Edit1: TEdit;
    ToolButton3: TToolButton;
    PayButton: TToolButton;
    PrintButton: TToolButton;
    Splitter1: TSplitter;
    ToolButton4: TToolButton;
    RefreshButton: TToolButton;
    procedure EnabledButtons;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CloseButtonClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure InsertButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure PayButtonClick(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure DBGridEh2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SaleOrderForm: TSaleOrderForm;

implementation

uses Main, StoreDM, SaleProperSelect, SaleOrderItem, SaleStructure, PaymentOrder,
  PrintOrder;

{$R *.dfm}

procedure TSaleOrderForm.EnabledButtons;
begin
//  Если записей нету, то Деактивируем кнопки "Редактировать" и "Удалить",
//  а если есть, Активируем.
  if StoreDataModule.SaleOrderDataSet.IsEmpty then
  begin
    EditButton.Enabled := False;
    EditButton.ShowHint := False;
    DeleteButton.Enabled := False;
    DeleteButton.ShowHint := False;
    PayButton.Enabled := False;
    PayButton.ShowHint := False;
    PrintButton.Enabled := False;
    PrintButton.ShowHint := False;
  end
  else
  begin
    EditButton.Enabled := True;
    EditButton.ShowHint := True;
    DeleteButton.Enabled := True;
    DeleteButton.ShowHint := True;
    PayButton.Enabled := True;
    PayButton.ShowHint := True;
    PrintButton.Enabled := True;
    PrintButton.ShowHint := True;
  end;
end;

procedure TSaleOrderForm.FormCreate(Sender: TObject);
begin
  with StoreDataModule do
  begin
//    SaleOrderDataSet.SelectSQL.Strings[3] := 'AND ("Orders"."Date" >= ''' + TopDate + ''' AND ' + '"Orders"."Date" <= ''' + BottomDate + ''')';
//    ShowMessage(SaleOrderDataSet.SelectSQL.Text);
    SaleOrderDataSet.Open;
    SaleStructureDataSet.Open;
  end;
  CloseButton.Left := Panel1.Width - CloseButton.Width - 10;
  Caption := 'Расходные документы (' + TopDate + '-' + BottomDate + ')';
  EnabledButtons;
end;

procedure TSaleOrderForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CurOrderID := 0;
  with StoreDataModule do
  begin
    SaleOrderDataSet.Close;
    SaleOrderDataSet.SelectSQL.Strings[4] := '';
    SaleOrderDataSet.SelectSQL.Strings[SaleOrderDataSet.SelectSQL.Count - 1] := 'ORDER BY "Date", "OrderID"';
    SaleStructureDataSet.Close;
  end;
//  Удаление форму при ее закрытии
  SaleOrderForm := nil;
  Action        := caFree;
end;

procedure TSaleOrderForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TSaleOrderForm.Edit1Change(Sender: TObject);
var
  Find : String;
begin
  Find := AnsiUpperCase(Edit1.Text);
  with StoreDataModule.SaleOrderDataSet do
  begin
    Close;
    SelectSQL.Strings[4] := 'AND (UPPER("CustomerName") CONTAINING ''' + Find + ''')';
    Open;
  end;
end;

procedure TSaleOrderForm.InsertButtonClick(Sender: TObject);
begin
  StoreDataModule.SaleOrderDataSet.Append;
  StoreDataModule.SaleOrderDataSet['FirmID'] := MainFirm;
  StoreDataModule.SaleOrderDataSet['OutDivisionID'] := MainDivision;
  StoreDataModule.SaleOrderDataSet['Date'] := Now;
  StoreDataModule.SaleOrderDataSet['PayDate'] := Now;
  StoreDataModule.SaleOrderDataSet['PriceID'] := MainPrice;
  
//Выбираем Вид Расхода: Опт или Розница
  SaleProperSelectForm := TSaleProperSelectForm.Create(Self);
  SaleProperSelectForm.ShowModal;
  if SaleProperSelectForm.ModalResult = mrOK then
  begin
    StoreDataModule.SaleOrderDataSet['ProperID'] := CurProperID;
    if CurProperID = 2 then
      StoreDataModule.SaleOrderDataSet['CustomerID'] := RetailCustomerID; //Проставляем Покупателя "Розница"
    StoreDataModule.SaleOrderDataSet.Post;
    EnabledButtons;
    SaleOrderItemForm := TSaleOrderItemForm.Create(Self);
    SaleOrderItemForm.ShowModal;
  end
  else
  begin
    StoreDataModule.SaleOrderDataSet.Cancel;
  end;
end;

procedure TSaleOrderForm.EditButtonClick(Sender: TObject);
begin
//  StoreDataModule.SaleOrderDataSet.Edit;
  SaleOrderItemForm := TSaleOrderItemForm.Create(Self);
  SaleOrderItemForm.ShowModal;
end;

procedure TSaleOrderForm.DeleteButtonClick(Sender: TObject);
var
  SaleOrderStr : String;
begin
  with StoreDataModule do
  try
    SaleOrderStr := SaleOrderDataSet.FieldByName('OrderID').AsString;
    if Application.MessageBox(PChar('Вы действительно хотите удалить запись "' +
      SaleOrderStr + '"?'),
      'Удаление записи',
      mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
    try
      SaleOrderDataSet.Delete;
      SaleOrderTransaction.Commit;
      EnabledButtons;
    except
      Application.MessageBox(PChar('Запись "' + SaleOrderStr + '" удалять нельзя.'),
        'Ошибка удаления', mb_IconStop);
    end; {try except}
  finally
    if SaleOrderDataSet.Active = False then
      SaleOrderDataSet.Open;
  end; {try finally}
end;

procedure TSaleOrderForm.PayButtonClick(Sender: TObject);
begin
  CurProperID := StoreDataModule.SaleOrderDataSet['ProperID'];
  PaymentOrderForm := TPaymentOrderForm.Create(Self);
  PaymentOrderForm.ShowModal;
  CurOrderID := StoreDataModule.SaleOrderDataSet['OrderID'];
  StoreDataModule.SaleOrderDataSet.Close;
  StoreDataModule.SaleOrderDataSet.Open;
end;

procedure TSaleOrderForm.PrintButtonClick(Sender: TObject);
begin
  PrintOrderForm := TPrintOrderForm.Create(Self);
  PrintOrderForm.ShowModal;
end;

procedure TSaleOrderForm.RefreshButtonClick(Sender: TObject);
begin
  CurOrderID := StoreDataModule.SaleOrderDataSet['OrderID'];
  StoreDataModule.SaleOrderDataSet.Close;
  StoreDataModule.SaleOrderDataSet.Open;
  Caption := 'Расходные документы (' + TopDate + '-' + BottomDate + ')';
end;

procedure TSaleOrderForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F2 : InsertButton.Click;
    VK_F3 : EditButton.Click;
    VK_F8 : DeleteButton.Click;
    VK_F4 : Edit1.SetFocus;
    VK_F9 : PayButton.Click;
    VK_F10 : PrintButton.Click;
    VK_F5 : RefreshButton.Click;
  end;
end;

procedure TSaleOrderForm.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
//Выделяем КРАСНЫМ (СИНИМ) просроченную Оплату
  with DBGridEh1.Canvas do
  begin
    if (StoreDataModule.SaleOrderDataSet['Debt'] > 0) and
      not (gdFocused in State) then
    begin
      if (StoreDataModule.SaleOrderDataSet['PayDate'] < now) then
        Font.Color := clRed
      else
        Font.Color := clBlue;
      FillRect(Rect);
      TextOut(Rect.Left, Rect.Top, Column.DisplayText);
    end
    else
      DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TSaleOrderForm.DBGridEh1TitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
var
  i: Integer;
begin
//Сортировка по клику на заголовке столбца
  CurOrderID := StoreDataModule.SaleOrderDataSet['OrderID'];
  if Column.Title.Font.Color = clRed then
  with StoreDataModule.SaleOrderDataSet do
  begin
    SelectSQL.Strings[SelectSQL.Count - 1] := 'ORDER BY "OrderID"';
    Close;
    Open;
    for i := 0 to DBGridEh1.Columns.Count - 1 do
    begin
      DBGridEh1.Columns.Items[i].Title.Font.Color := clWindowText;
    end;
  end
  else
  with StoreDataModule.SaleOrderDataSet do
  begin
    SelectSQL.Strings[SelectSQL.Count - 1] := 'ORDER BY "' + Column.FieldName + '", "OrderID"';
    Close;
    Open;
    for i := 0 to DBGridEh1.Columns.Count - 1 do
    begin
      DBGridEh1.Columns.Items[i].Title.Font.Color := clWindowText;
    end;
    Column.Title.Font.Color := clRed;
  end;
end;

procedure TSaleOrderForm.DBGridEh2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var
  ItemNo: String;
begin
//Проставляем номера по порядку в строках Документа
  with DBGridEh2.Canvas do
  begin
    if StoreDataModule.SaleStructureDataSet.RecNo <> 0 then
      ItemNo := IntToStr(StoreDataModule.SaleStructureDataSet.RecNo)
    else
      ItemNo := '';
    if Column.Index = 0 then
    begin
      FillRect(Rect);
      TextOut(Rect.Right - 3 - TextWidth(ItemNo), Rect.Top, ItemNo);
    end
    else
      DBGridEh2.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

end.
