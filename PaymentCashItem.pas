unit PaymentCashItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, ExtCtrls, DBLookupEh, Buttons,
  ComCtrls, Grids, DBGridEh, ToolWin;

type
  TPaymentCashItemForm = class(TForm)
    Panel1: TPanel;
    OKButton: TButton;
    CancelButton: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    TabSheet2: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    InsertButton: TToolButton;
    EditButton: TToolButton;
    DeleteButton: TToolButton;
    ToolButton2: TToolButton;
    Edit1: TEdit;
    DBGridEh1: TDBGridEh;
    Label6: TLabel;
    DBNumberEditEh1: TDBNumberEditEh;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBComboBoxEh1: TDBComboBoxEh;
    DBEditEh3: TDBEditEh;
    DBEditEh2: TDBEditEh;
    DBEditEh1: TDBEditEh;
    Label7: TLabel;
    DBEditEh4: TDBEditEh;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure DBEditEh1EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBEditEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEditEh2EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBEditEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TabSheet2Enter(Sender: TObject);
    procedure InsertButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PaymentCashItemForm: TPaymentCashItemForm;

implementation

uses StoreDM, PayOrderSelect, CustomerSelect;

{$R *.dfm}

procedure TPaymentCashItemForm.FormCreate(Sender: TObject);
begin
//  Запоминаем положение Курсора, что бы вернуться на прежнее место
  CurPaymentID := StoreDataModule.PaymentCashDataSet['PaymentID'];
  Caption := 'Сведения об Оплате';
end;

procedure TPaymentCashItemForm.FormShow(Sender: TObject);
begin
  DBEditEh1.SetFocus;
end;

procedure TPaymentCashItemForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with StoreDataModule do
  try
    if ModalResult = mrOk then
    begin
      if PaymentCashDataSet.Modified then
        PaymentCashDataSet.Post;
      PaymentCashTransaction.Commit;
    end
    else
    begin
      PaymentCashDataSet.Cancel;
      PaymentCashTransaction.Rollback;
    end;
  except
    Application.MessageBox('Недопустимые значения данных',
      'Ошибка ввода', mb_IconStop);
    Abort;
  end;

//Открываем после Commit/Rollback
  if StoreDataModule.PaymentCashDataSet.Active = False then
    StoreDataModule.PaymentCashDataSet.Open;
  Release;
end;

procedure TPaymentCashItemForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TPaymentCashItemForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TPaymentCashItemForm.DBEditEh1EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  PayOrderSelectForm := TPayOrderSelectForm.Create(Self);
  PayOrderSelectForm.ShowModal;
  if PayOrderSelectForm.ModalResult = mrOk then
  begin
    StoreDataModule.PaymentCashDataSet['OrderID'] := CurOrderID;
    StoreDataModule.PaymentCashDataSet['CustomerID'] := CurCustomerID;
    StoreDataModule.PaymentCashDataSet['CustomerName'] := CurCustomerName;
    StoreDataModule.PaymentCashDataSet['TotalPay'] := CurPay;
    if CurType = 0 then
      StoreDataModule.PaymentCashDataSet['Type'] := 1;
    if CurType = 1 then
      StoreDataModule.PaymentCashDataSet['Type'] := -1;
  end;
end;

procedure TPaymentCashItemForm.DBEditEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBEditEh1EditButtons0Click(Self, h);
end;

procedure TPaymentCashItemForm.DBEditEh2EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  CustomerSelectForm := TCustomerSelectForm.Create(Self);
  CustomerSelectForm.ShowModal;
  if CustomerSelectForm.ModalResult = mrOK then
  with StoreDataModule do
  begin
    PaymentCashDataSet['OrderID'] := Null;
    PaymentCashDataSet['CustomerID'] := CurCustomerID;
    PaymentCashDataSet['CustomerName'] := CurCustomerName;
    PaymentCashDataSet['TotalPay'] := Abs(CurDebt);
    if CurDebt >= 0 then
      PaymentCashDataSet['Type'] := -1
    else
      PaymentCashDataSet['Type'] := 1;
  end;
end;

procedure TPaymentCashItemForm.DBEditEh2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBEditEh2EditButtons0Click(Self, h);
end;

procedure TPaymentCashItemForm.TabSheet2Enter(Sender: TObject);
begin
{  if StoreDataModule.PaymentCashDataSet.Modified then
  begin
    StoreDataModule.PaymentCashDataSet.Post;
    StoreDataModule.PaymentCashDataSet.Close;
    StoreDataModule.PaymentCashDataSet.Open;
  end;{}
end;

procedure TPaymentCashItemForm.InsertButtonClick(Sender: TObject);
begin
{  with StoreDataModule do
  try
    if PayOrderSelectQuery.Active = True then
      PayOrderSelectQuery.Close;
    if PaymentBankDataSet['Type'] = 1 then
      PayOrderSelectQuery.SQL.Strings[3] := 'AND ("Orders"."ProperID" = 0)'
    else
      PayOrderSelectQuery.SQL.Strings[3] := 'AND ("Orders"."ProperID" IN (1, 2))';
    PayOrderSelectQuery.SQL.Strings[4] := 'AND ("Orders"."CustomerID" = ' + PaymentCashDataSet.FieldByName('CustomerID').AsString + ')';

    PayOrderSelectForm := TPayOrderSelectForm.Create(Self);
    PayOrderSelectForm.ShowModal;
    if PayOrderSelectForm.ModalResult = mrOk then
    begin
      PayOrderCashDataSet.Append;
      PayOrderCashDataSet['PaymentID'] := PaymentCashDataSet['PaymentID'];
      PayOrderCashDataSet['OrderID'] := CurOrderID;
      PayOrderCashDataSet['Pay'] := CurPay;
      PayOrderCashDataSet.Post;
      PaymentCashTransaction.CommitRetaining;
    end;

  finally
    if PayOrderSelectQuery.Active = True then
      PayOrderSelectQuery.Close;
    PayOrderSelectQuery.SQL.Strings[3] := 'AND ("Orders"."ProperID" IN (0, 1, 2))';
    PayOrderSelectQuery.SQL.Strings[4] := '';
  end;{}
end;

procedure TPaymentCashItemForm.EditButtonClick(Sender: TObject);
begin
//
end;

procedure TPaymentCashItemForm.DeleteButtonClick(Sender: TObject);
begin
//
end;

procedure TPaymentCashItemForm.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    SelectNext(ActiveControl As TWinControl, True, True);
  Key := #0;
end;

end.
