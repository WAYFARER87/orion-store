unit SaleOrderItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, ExtCtrls, DBLookupEh, Grids, DBGridEh,
  DB, Buttons, ComCtrls, ToolWin;

type
  TSaleOrderItemForm = class(TForm)
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    InsertButton: TToolButton;
    EditButton: TToolButton;
    DeleteButton: TToolButton;
    ToolButton2: TToolButton;
    Panel1: TPanel;
    Label1: TLabel;
    DBEditEh1: TDBEditEh;
    Label2: TLabel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBEditEh4: TDBEditEh;
    Label6: TLabel;
    Label3: TLabel;
    DBDateTimeEditEh2: TDBDateTimeEditEh;
    Label5: TLabel;
    Panel3: TPanel;
    OKButton: TButton;
    CancelButton: TButton;
    Label4: TLabel;
    DBEditEh2: TDBEditEh;
    Label4a: TLabel;
    Label5a: TLabel;
    DBEditEh3: TDBEditEh;
    Label7: TLabel;
    DBEditEh5: TDBEditEh;
    procedure EnabledButtons;
    procedure SaleOrderPost;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure Panel1Enter(Sender: TObject);
    procedure Panel1Exit(Sender: TObject);
    procedure InsertButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure DBEditEh4EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBEditEh4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PrintButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBEditEh2EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBEditEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEditEh3EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SaleOrderItemForm: TSaleOrderItemForm;

implementation

uses StoreDM, SaleStructure, CustomerSelect, DivisionSelect, TypePrice;

{$R *.dfm}

procedure TSaleOrderItemForm.EnabledButtons;
begin
//  Если записей нету, то Деактивируем кнопки "Редактировать" и "Удалить",
//  а если есть, Активируем.
  if StoreDataModule.SaleStructureDataSet.IsEmpty then
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

procedure TSaleOrderItemForm.SaleOrderPost;
begin
  with StoreDataModule do
  begin
    if SaleOrderDataSet.Modified then
    try
      SaleOrderDataSet.Post;
//      OKButton.Visible := True;
//      CancelButton.Caption := 'Cancel';
      SaleOrderDataSet.Close;
      SaleOrderDataSet.Open;
    except
      Application.MessageBox('Недопустимые значения данных',
        'Ошибка ввода', mb_IconStop);
      Abort;
    end
    else
      SaleOrderDataSet.Cancel;
  end;
end;

procedure TSaleOrderItemForm.FormCreate(Sender: TObject);
begin
//  OKButton.Visible := False;
//  CancelButton.Caption := 'Exit';
  EnabledButtons;
//  Запоминаем положение Курсора, что бы вернуться на прежнее место
  CurOrderID := StoreDataModule.SaleOrderDataSet['OrderID'];
  StoreDataModule.TypePriceDataSet.Open;
  Caption := 'Расходная накладная';
  Label4a.Caption := StoreDataModule.SaleOrderDataSet['DivisionName'];
  StoreDataModule.TypePriceDataSet.Locate('PriceID', StoreDataModule.SaleOrderDataSet['PriceID'], []);
  Label5a.Caption := StoreDataModule.TypePriceDataSet['PriceName'];
end;

procedure TSaleOrderItemForm.FormShow(Sender: TObject);
begin
  if DBEditEh4.Value = '' then
    DBEditEh4.SetFocus
  else
    DBGridEh1.SetFocus;
end;

procedure TSaleOrderItemForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with StoreDataModule do
  try
    try
      if ModalResult = mrOk then
      begin
        if SaleOrderDataSet.Modified then
          SaleOrderDataSet.Post;
        SaleOrderTransaction.Commit;
      end
      else
        SaleOrderTransaction.Rollback;
    except
      Application.MessageBox('Недопустимые значения данных',
        'Ошибка ввода', mb_IconStop);
      Abort;
    end; {try except}
  finally
    if TypePriceDataSet.Active = True then
      TypePriceDataSet.Close;
//    Открываем Таблицы "Документы", "Строки Документов" после Commit'а транзакции
    SaleOrderDataSet.Open;
    SaleStructureDataSet.Open;
  end; {try finally}
  Release;
end;

procedure TSaleOrderItemForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TSaleOrderItemForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TSaleOrderItemForm.Panel1Enter(Sender: TObject);
begin
{  if StoreDataModule.SaleOrderDataSet.State = dsBrowse then
    StoreDataModule.SaleOrderDataSet.Edit;{}
end;

procedure TSaleOrderItemForm.Panel1Exit(Sender: TObject);
begin
{  with StoreDataModule do
  try
    if SaleOrderDataSet.Modified then
    begin
      SaleOrderDataSet.Post;
      OKButton.Visible := True;
      CancelButton.Caption := 'Cancel';
    end
    else
      SaleOrderDataSet.Cancel;
  except
    Application.MessageBox('Недопустимые значения данных',
      'Ошибка ввода', mb_IconStop);
    Abort;
  end;{}
end;

procedure TSaleOrderItemForm.InsertButtonClick(Sender: TObject);
begin
  StoreDataModule.SaleStructureDataSet.Append;
  StoreDataModule.SaleStructureDataSet['OrderID'] := StoreDataModule.SaleOrderDataSet['OrderID'];
  StoreDataModule.SaleStructureDataSet['Type'] := 1;
  SaleStructureForm := TSaleStructureForm.Create(Self);
  SaleStructureForm.ShowModal;
  if SaleStructureForm.ModalResult = mrOK then
  begin
//    OKButton.Visible := True;
//    CancelButton.Caption := 'Cancel';
    EnabledButtons;
  end;
end;

procedure TSaleOrderItemForm.EditButtonClick(Sender: TObject);
begin
  StoreDataModule.SaleStructureDataSet.Edit;
  SaleStructureForm := TSaleStructureForm.Create(Self);
  SaleStructureForm.ShowModal;
  if SaleStructureForm.ModalResult = mrOK then
  begin
//    OKButton.Visible := True;
//    CancelButton.Caption := 'Cancel';
  end;
end;

procedure TSaleOrderItemForm.DeleteButtonClick(Sender: TObject);
var
  SaleStrucStr : String;
begin
  SaleStrucStr := StoreDataModule.SaleStructureDataSet.FieldByName('ProductFullName').AsString;
  if Application.MessageBox(PChar('Вы действительно хотите удалить запись"' +
    SaleStrucStr + '"?'),
    'Удаление записи',
    mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
  try
    StoreDataModule.SaleStructureDataSet.Delete;
//    OKButton.Visible := True;
//    CancelButton.Caption := 'Cancel';
    EnabledButtons;
  except
    Application.MessageBox(PChar('Запись "' + SaleStrucStr + '" удалять нельзя.'),
      'Ошибка удаления', mb_IconStop);
  end;
end;

procedure TSaleOrderItemForm.DBEditEh4EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  with StoreDataModule do
  begin
    if SaleOrderDataSet.State = dsBrowse then
      SaleOrderDataSet.Edit;
    if SaleOrderDataSet['CustomerID'] <> Null then
      CurCustomerID := SaleOrderDataSet['CustomerID'];
    CustomerSelectForm := TCustomerSelectForm.Create(Self);
    CustomerSelectForm.ShowModal;
    if CustomerSelectForm.ModalResult = mrOk then
    begin
      SaleOrderDataSet['CustomerID'] := CurCustomerID;
      SaleOrderDataSet['PriceID'] := CurPriceID;
      SaleOrderDataSet['PayDate'] := SaleOrderDataSet['Date'] + CurrentDelayPay;

      TypePriceDataSet.Open;
      TypePriceDataSet.Locate('PriceID', CurPriceID, []);
      Label5a.Caption := TypePriceDataSet.FieldByName('PriceName').AsString;
      TypePriceDataSet.Close;

      SaleOrderPost;
      DBGridEh1.SetFocus;
    end
    else
      SaleOrderDataSet.Cancel;
  end;
end;

procedure TSaleOrderItemForm.DBEditEh4KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBEditEh4EditButtons0Click(Self, h);
end;

procedure TSaleOrderItemForm.PrintButtonClick(Sender: TObject);
begin
{  PrintOrderForm := TPrintOrderForm.Create(Self);
  PrintOrderForm.ShowModal;{}
end;

procedure TSaleOrderItemForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN : OKButton.Click;
{    VK_F10 : PrintButton.Click;
    VK_F11 :
    begin
      StoreDataModule.ReportFirmQuery.ParamByName('MainFirm').Value := MainFirm;
      StoreDataModule.ReportCustomerQuery.ParamByName('CustomerID').Value := StoreDataModule.SaleOrderDataSet['CustomerID'];
      frReport1.Clear;
      frReport1.LoadFromFile('FastReports\SaleOrder.frf');
      frReport1.DesignReport;
      frReport1.Clear;
      StoreDataModule.ReportFirmQuery.Close;
      StoreDataModule.ReportCustomerQuery.Close;
    end;{}
  end;
end;

procedure TSaleOrderItemForm.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_F2 : InsertButton.Click;
    VK_F3 : if EditButton.Enabled = true then
            EditButton.Click;
    VK_F8 : if DeleteButton.Enabled = true then
            DeleteButton.Click;
  end;
end;

procedure TSaleOrderItemForm.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var
  ItemNo: String;
begin
//Проставляем номера по порядку в строках Документа
  with DBGridEh1.Canvas do
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
      DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TSaleOrderItemForm.DBEditEh2EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  with StoreDataModule do
  begin
    if SaleOrderDataSet.State = dsBrowse then
      SaleOrderDataSet.Edit;
    if SaleOrderDataSet['OutDivisionID'] <> Null then
      CurDivisionID := SaleOrderDataSet['OutDivisionID'];
    DivisionSelectForm := TDivisionSelectForm.Create(Self);
    DivisionSelectForm.ShowModal;
    if DivisionSelectForm.ModalResult = mrOk then
    begin
      SaleOrderDataSet['OutDivisionID'] := CurDivisionID;
      SaleOrderPost;
      Label4a.Caption := CurDivisionName;
      DBGridEh1.SetFocus;
    end
    else
      SaleOrderDataSet.Cancel;
  end;
end;

procedure TSaleOrderItemForm.DBEditEh2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBEditEh2EditButtons0Click(Self, h);
end;

procedure TSaleOrderItemForm.DBEditEh3EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  with StoreDataModule do
  begin
    if SaleOrderDataSet.State = dsBrowse then
      SaleOrderDataSet.Edit;
    if SaleOrderDataSet['PriceID'] <> Null then
      CurPriceID := SaleOrderDataSet['PriceID'];
    TypePriceForm := TTypePriceForm.Create(Self);
    TypePriceForm.ShowModal;
    if TypePriceForm.ModalResult = mrOk then
    begin
      if Application.MessageBox(PChar('Все цены будут пересчитаны.' + #13 +
        'Продолжить?'),
        'Внимание',
        mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
      begin
        SaleOrderDataSet['PriceID'] := CurPriceID;
        SaleOrderPost;
        Label5a.Caption := CurPriceName;
        DBGridEh1.SetFocus;
      end
      else
        SaleOrderDataSet.Cancel;
    end
    else
      SaleOrderDataSet.Cancel;
  end;
end;

end.
