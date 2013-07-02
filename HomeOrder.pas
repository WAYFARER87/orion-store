unit HomeOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh,
  DB, ComCtrls, ToolWin;

type
  THomeOrderForm = class(TForm)
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    CloseButton: TButton;
    DBGridEh2: TDBGridEh;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    InsertButton: TToolButton;
    EditButton: TToolButton;
    DeleteButton: TToolButton;
    ToolButton2: TToolButton;
    Edit1: TEdit;
    ToolButton3: TToolButton;
    Splitter1: TSplitter;
    RefreshButton: TToolButton;
    procedure EnabledButtons;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CloseButtonClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure InsertButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
  HomeOrderForm: THomeOrderForm;

implementation

uses StoreDM, HomeProperSelect, HomeOrderItem;

{$R *.dfm}

procedure THomeOrderForm.EnabledButtons;
begin
//  Если записей нету, то Деактивируем кнопки "Редактировать" и "Удалить",
//  а если есть, Активируем.
  if StoreDataModule.HomeOrderDataSet.IsEmpty then
  begin
    EditButton.Enabled := False;
    EditButton.ShowHint := False;
    DeleteButton.Enabled := False;
    DeleteButton.ShowHint := False;
  end
  else
  begin
    EditButton.Enabled := True;
    EditButton.ShowHint := True;
    DeleteButton.Enabled := True;
    DeleteButton.ShowHint := True;
  end;
end;

procedure THomeOrderForm.FormCreate(Sender: TObject);
begin
  with StoreDataModule do
  begin
    HomeOrderDataSet.Open;
    HomeStructureDataSet.Open;
  end;
  CloseButton.Left := Panel1.Width - CloseButton.Width - 10;
  Caption := 'Складские документы (' + TopDate + '-' + BottomDate + ')';
  EnabledButtons;
end;

procedure THomeOrderForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CurOrderID := 0;
  with StoreDataModule do
  begin
    HomeOrderDataSet.Close;
    HomeOrderDataSet.SelectSQL.Strings[HomeOrderDataSet.SelectSQL.Count - 1] := 'ORDER BY "Date", "OrderID"';
    HomeStructureDataSet.Close;
  end;
// Удаление формы при ее закрытии
  HomeOrderForm := nil;
  Action      := caFree;
end;

procedure THomeOrderForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure THomeOrderForm.Edit1Change(Sender: TObject);
begin
//  StoreDataModule.ConvertDataSet.Locate('CategoryName', Edit1.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure THomeOrderForm.InsertButtonClick(Sender: TObject);
begin
  StoreDataModule.HomeOrderDataSet.Append;
  StoreDataModule.HomeOrderDataSet['FirmID'] := MainFirm;
  StoreDataModule.HomeOrderDataSet['Date'] := Now;
  StoreDataModule.HomeOrderDataSet['CustomerID'] := MainFirm;
  StoreDataModule.HomeOrderDataSet['PriceID'] := 1;//"Цена Закупа"
//Выбираем Вид Накладной
  HomeProperSelectForm := THomeProperSelectForm.Create(Self);
  HomeProperSelectForm.ShowModal;
  if HomeProperSelectForm.ModalResult = mrOK then
  begin
    StoreDataModule.HomeOrderDataSet['ProperID'] := CurProperID;
    if CurProperID = 6 then
      StoreDataModule.HomeOrderDataSet['InDivisionID'] := MainDivision;
    if CurProperID = 7 then
      StoreDataModule.HomeOrderDataSet['OutDivisionID'] := MainDivision;
    if CurProperID = 8 then
    begin
      StoreDataModule.HomeOrderDataSet['OutDivisionID'] := MainDivision;
      StoreDataModule.HomeOrderDataSet['InDivisionID'] := MainDivision;
    end;
    if CurProperID = 9 then
    begin
      StoreDataModule.HomeOrderDataSet['OutDivisionID'] := MainDivision;
//      StoreDataModule.HomeOrderDataSet['InDivisionID'] := MainDivision;
    end;
    StoreDataModule.HomeOrderDataSet.Post;
    EnabledButtons;
    HomeOrderItemForm := THomeOrderItemForm.Create(Self);
    HomeOrderItemForm.ShowModal;
  end
  else
  begin
    StoreDataModule.HomeOrderDataSet.Cancel;
  end;
end;

procedure THomeOrderForm.EditButtonClick(Sender: TObject);
begin
//  StoreDataModule.HomeOrderDataSet.Edit;
  HomeOrderItemForm := THomeOrderItemForm.Create(Self);
  HomeOrderItemForm.ShowModal;
end;

procedure THomeOrderForm.DeleteButtonClick(Sender: TObject);
var
  OrderStr: String;
begin
  with StoreDataModule do
  try
    OrderStr := HomeOrderDataSet.FieldByName('OrderID').AsString;
    if Application.MessageBox(PChar('Вы действительно хотите удалить запись"' +
      OrderStr + '"?'),
      'Удаление записи',
      mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
    try
      HomeOrderDataSet.Delete;
      HomeTransaction.Commit;
      EnabledButtons;
    except
      Application.MessageBox(PChar('Запись "' + OrderStr + '" удалять нельзя.'),
        'Ошибка удаления', mb_IconStop);
    end; {try except}
  finally
    if HomeOrderDataSet.Active = False then
      HomeOrderDataSet.Open;
  end; {try finally}
end;

procedure THomeOrderForm.RefreshButtonClick(Sender: TObject);
begin
  CurOrderID := StoreDataModule.HomeOrderDataSet['OrderID'];
  StoreDataModule.HomeOrderDataSet.Close;
  StoreDataModule.HomeOrderDataSet.Open;
  Caption := 'Складские документы (' + TopDate + '-' + BottomDate + ')';
end;

procedure THomeOrderForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F2 : InsertButton.Click;
    VK_F3 : EditButton.Click;
    VK_F8 : DeleteButton.Click;
    VK_F5 : RefreshButton.Click;
  end;
end;

procedure THomeOrderForm.DBGridEh1TitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
var
  i: Integer;
begin
//Сортировка по клику на заголовке столбца
  CurOrderID := StoreDataModule.HomeOrderDataSet['OrderID'];
  if Column.Title.Font.Color = clRed then
  with StoreDataModule.HomeOrderDataSet do
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
  with StoreDataModule.HomeOrderDataSet do
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

procedure THomeOrderForm.DBGridEh2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var
  ItemNo: String;
begin
//Проставляем номера по порядку в строках Документа
  with DBGridEh2.Canvas do
  begin
    if StoreDataModule.HomeStructureDataSet.RecNo <> 0 then
      ItemNo := IntToStr(StoreDataModule.HomeStructureDataSet.RecNo)
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
