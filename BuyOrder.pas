unit BuyOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ExtCtrls, StdCtrls, ComCtrls, ToolWin;

type
  TBuyOrderForm = class(TForm)
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
  BuyOrderForm: TBuyOrderForm;

implementation

uses Main, StoreDM, BuyOrderItem, BuyStructure, PaymentOrder;

{$R *.dfm}

procedure TBuyOrderForm.EnabledButtons;
begin
//  Если записей нету, то Деактивируем кнопки "Редактировать" и "Удалить",
//  а если есть, Активируем.
  if StoreDataModule.BuyOrderDataSet.IsEmpty then
  begin
    EditButton.Enabled := False;
    EditButton.ShowHint := False;
    DeleteButton.Enabled := False;
    DeleteButton.ShowHint := False;
    PayButton.Enabled := False;
    PayButton.ShowHint := False;
  end
  else
  begin
    EditButton.Enabled := True;
    EditButton.ShowHint := True;
    DeleteButton.Enabled := True;
    DeleteButton.ShowHint := True;
    PayButton.Enabled := True;
    PayButton.ShowHint := True;
  end;
end;

procedure TBuyOrderForm.FormCreate(Sender: TObject);
begin
  with StoreDataModule do
  begin
    BuyOrderDataSet.Open;
    BuyStructureDataSet.Open;
  end;
  CloseButton.Left := Panel1.Width - CloseButton.Width - 10;
  Caption := 'Приходные документы (' + TopDate + '-' + BottomDate + ')';
  EnabledButtons;
end;

procedure TBuyOrderForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CurOrderID := 0;
  with StoreDataModule do
  begin
    BuyOrderDataSet.Close;
    BuyOrderDataSet.SelectSQL.Strings[4] := '';
    BuyOrderDataSet.SelectSQL.Strings[BuyOrderDataSet.SelectSQL.Count - 1] := 'ORDER BY "Date", "OrderID"';
    BuyStructureDataSet.Close;
  end;
// Удаление форму при ее закрытии
  BuyOrderForm := nil;
  Action       := caFree;
end;

procedure TBuyOrderForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TBuyOrderForm.Edit1Change(Sender: TObject);
var
  Find : String;
begin
  Find := AnsiUpperCase(Edit1.Text);
  with StoreDataModule.BuyOrderDataSet do
  begin
    Close;
    SelectSQL.Strings[4] := 'AND (UPPER("CustomerName") CONTAINING ''' + Find + ''')';
    Open;
  end;
end;

procedure TBuyOrderForm.InsertButtonClick(Sender: TObject);
begin
  StoreDataModule.BuyOrderDataSet.Append;
  StoreDataModule.BuyOrderDataSet['FirmID'] := MainFirm;
  StoreDataModule.BuyOrderDataSet['InDivisionID'] := MainDivision;
  StoreDataModule.BuyOrderDataSet['Date'] := Now;
  StoreDataModule.BuyOrderDataSet['PayDate'] := Now;
  StoreDataModule.BuyOrderDataSet['PriceID'] := 1;
  StoreDataModule.BuyOrderDataSet['ProperID'] := 0;
  StoreDataModule.BuyOrderDataSet.Post;
  EnabledButtons;
  BuyOrderItemForm := TBuyOrderItemForm.Create(Self);
  BuyOrderItemForm.ShowModal;
end;

procedure TBuyOrderForm.EditButtonClick(Sender: TObject);
begin
//  StoreDataModule.BuyOrderDataSet.Edit;
  BuyOrderItemForm := TBuyOrderItemForm.Create(Self);
  BuyOrderItemForm.ShowModal;
end;

procedure TBuyOrderForm.DeleteButtonClick(Sender: TObject);
var
  DeletedStr : String;
begin
  with StoreDataModule do
  try
    DeletedStr := BuyOrderDataSet.FieldByName('OrderID').AsString;
    if Application.MessageBox(PChar('Вы действительно хотите удалить запись "' +
      DeletedStr + '"?'),
      'Удаление записи',
      mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
    try
      BuyOrderDataSet.Delete;
      BuyOrderTransaction.Commit;
      EnabledButtons;
    except
      Application.MessageBox(PChar('Запись "' + DeletedStr + '" удалять нельзя.'),
        'Ошибка удаления', mb_IconStop);
    end; {try except}
  finally
    if BuyOrderDataSet.Active = False then
      BuyOrderDataSet.Open;
  end; {try finally}
end;

procedure TBuyOrderForm.PayButtonClick(Sender: TObject);
begin
  CurProperID := StoreDataModule.BuyOrderDataSet['ProperID'];
  PaymentOrderForm := TPaymentOrderForm.Create(Self);
  PaymentOrderForm.ShowModal;
  CurOrderID := StoreDataModule.BuyOrderDataSet['OrderID'];
  StoreDataModule.BuyOrderDataSet.Close;
  StoreDataModule.BuyOrderDataSet.Open;
end;

procedure TBuyOrderForm.RefreshButtonClick(Sender: TObject);
begin
  CurOrderID := StoreDataModule.BuyOrderDataSet['OrderID'];
  StoreDataModule.BuyOrderDataSet.Close;
  StoreDataModule.BuyOrderDataSet.Open;
  Caption := 'Приходные документы (' + TopDate + '-' + BottomDate + ')';
end;

procedure TBuyOrderForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F2 : InsertButton.Click;
    VK_F3 : EditButton.Click;
    VK_F8 : DeleteButton.Click;
    VK_F4 : Edit1.SetFocus;
    VK_F9 : PayButton.Click;
    VK_F5 : RefreshButton.Click;
  end;
end;

procedure TBuyOrderForm.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
//Выделяем КРАСНЫМ (СИНИМ) просроченную Оплату
  with DBGridEh1.Canvas do
  begin
    if (StoreDataModule.BuyOrderDataSet['Debt'] > 0) and
      not (gdFocused in State) then
    begin
      if (StoreDataModule.BuyOrderDataSet['PayDate'] < now) then
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

procedure TBuyOrderForm.DBGridEh1TitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
var
  i: Integer;
begin
//Сортировка по клику на заголовке столбца
  CurOrderID := StoreDataModule.BuyOrderDataSet['OrderID'];
  if Column.Title.Font.Color = clRed then
  with StoreDataModule.BuyOrderDataSet do
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
  with StoreDataModule.BuyOrderDataSet do
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

procedure TBuyOrderForm.DBGridEh2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var
  ItemNo: String;
begin
//Проставляем номера по порядку в строках Документа
  with DBGridEh2.Canvas do
  begin
    if StoreDataModule.BuyStructureDataSet.RecNo <> 0 then
      ItemNo := IntToStr(StoreDataModule.BuyStructureDataSet.RecNo)
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
