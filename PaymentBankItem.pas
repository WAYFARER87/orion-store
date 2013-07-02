unit PaymentBankItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, ExtCtrls, DBLookupEh, Buttons,
  ComCtrls, Grids, DBGridEh, ToolWin;

type
  TPaymentBankItemForm = class(TForm)
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
    DBGridEh1: TDBGridEh;
    Label6: TLabel;
    DBEditEh1: TDBEditEh;
    DBEditEh2: TDBEditEh;
    DBEditEh3: TDBEditEh;
    DBComboBoxEh1: TDBComboBoxEh;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBNumberEditEh1: TDBNumberEditEh;
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
  PaymentBankItemForm: TPaymentBankItemForm;

implementation

uses StoreDM, PayOrderSelect, CustomerSelect;

{$R *.dfm}

procedure TPaymentBankItemForm.FormCreate(Sender: TObject);
begin
//  Запоминаем положение Курсора, что бы вернуться на прежнее место
  CurPaymentID := StoreDataModule.PaymentBankDataSet['PaymentID'];
  Caption := 'Сведения об Оплате';
end;

procedure TPaymentBankItemForm.FormShow(Sender: TObject);
begin
  DBEditEh1.SetFocus;
end;

procedure TPaymentBankItemForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with StoreDataModule do
  try
    if ModalResult = mrOk then
    begin
      if PaymentBankDataSet.Modified then
        PaymentBankDataSet.Post;
      PaymentBankTransaction.Commit;
    end
    else
    begin
      PaymentBankDataSet.Cancel;
      PaymentBankTransaction.Rollback;
    end;
  except
    Application.MessageBox('Недопустимые значения данных',
      'Ошибка ввода', mb_IconStop);
    Abort;
  end;
//Открываем после Commit/Rollback
  if StoreDataModule.PaymentBankDataSet.Active = False then
    StoreDataModule.PaymentBankDataSet.Open;
  Release;
end;

procedure TPaymentBankItemForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TPaymentBankItemForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TPaymentBankItemForm.DBEditEh1EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  PayOrderSelectForm := TPayOrderSelectForm.Create(Self);
  PayOrderSelectForm.ShowModal;
  if PayOrderSelectForm.ModalResult = mrOk then
  begin
    StoreDataModule.PaymentBankDataSet['OrderID'] := CurOrderID;
    StoreDataModule.PaymentBankDataSet['CustomerID'] := CurCustomerID;
    StoreDataModule.PaymentBankDataSet['CustomerName'] := CurCustomerName;
    StoreDataModule.PaymentBankDataSet['TotalPay'] := CurPay;
    if CurType = 0 then
      StoreDataModule.PaymentBankDataSet['Type'] := 1;
    if CurType = 1 then
      StoreDataModule.PaymentBankDataSet['Type'] := -1;
  end;
end;

procedure TPaymentBankItemForm.DBEditEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBEditEh1EditButtons0Click(Self, h);
end;

procedure TPaymentBankItemForm.DBEditEh2EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  CurCustomerID := StoreDataModule.PaymentBankDataSet['CustomerID'];
  CustomerSelectForm := TCustomerSelectForm.Create(Self);
  CustomerSelectForm.ShowModal;
  if CustomerSelectForm.ModalResult = mrOK then
  with StoreDataModule do
  begin
    PaymentBankDataSet['OrderID'] := Null;
    PaymentBankDataSet['CustomerID'] := CurCustomerID;
    PaymentBankDataSet['CustomerName'] := CurCustomerName;
    PaymentBankDataSet['TotalPay'] := Abs(CurDebt);
    if CurDebt >= 0 then
      PaymentBankDataSet['Type'] := -1
    else
      PaymentBankDataSet['Type'] := 1;
  end;
end;

procedure TPaymentBankItemForm.DBEditEh2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBEditEh2EditButtons0Click(Self, h);
end;

procedure TPaymentBankItemForm.TabSheet2Enter(Sender: TObject);
begin
  if StoreDataModule.PaymentBankDataSet.Modified then
  begin
    StoreDataModule.PaymentBankDataSet.Post;
    StoreDataModule.PaymentBankDataSet.Close;
    StoreDataModule.PaymentBankDataSet.Open;
  end;
end;

procedure TPaymentBankItemForm.InsertButtonClick(Sender: TObject);
begin
{  with StoreDataModule do
  try
    if PayOrderSelectQuery.Active = True then
      PayOrderSelectQuery.Close;
    if PaymentBankDataSet['Type'] = 1 then
      PayOrderSelectQuery.SQL.Strings[3] := 'AND ("Orders"."ProperID" = 0)'
    else
      PayOrderSelectQuery.SQL.Strings[3] := 'AND ("Orders"."ProperID" = 1)';
    PayOrderSelectQuery.SQL.Strings[4] := 'AND ("Orders"."CustomerID" = ' + PaymentBankDataSet.FieldByName('CustomerID').AsString + ')';

    PayOrderSelectForm := TPayOrderSelectForm.Create(Self);
    PayOrderSelectForm.ShowModal;
    if PayOrderSelectForm.ModalResult = mrOk then
    begin
      PayOrderBankDataSet.Append;
      PayOrderBankDataSet['PaymentID'] := PaymentBankDataSet['PaymentID'];
      PayOrderBankDataSet['OrderID'] := CurOrderID;
      PayOrderBankDataSet['Pay'] := CurPay;
      PayOrderBankDataSet.Post;
      PaymentBankTransaction.CommitRetaining;
    end;

  finally
    if PayOrderSelectQuery.Active = True then
      PayOrderSelectQuery.Close;
    PayOrderSelectQuery.SQL.Strings[3] := 'AND ("Orders"."ProperID" IN (0, 1, 2))';
    PayOrderSelectQuery.SQL.Strings[4] := '';
  end;{}
end;

procedure TPaymentBankItemForm.EditButtonClick(Sender: TObject);
begin
//
end;

procedure TPaymentBankItemForm.DeleteButtonClick(Sender: TObject);
begin
//
end;

procedure TPaymentBankItemForm.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl As TWinControl, True, True);
    Key := #0;
  end;
end;

end.
