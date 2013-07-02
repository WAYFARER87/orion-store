unit PaymentOrderItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, ExtCtrls, DBLookupEh, Buttons,
  ComCtrls;

type
  TPaymentOrderItemForm = class(TForm)
    OKButton: TButton;
    CancelButton: TButton;
    Bevel1: TBevel;
    DBEditEh1: TDBEditEh;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBNumberEditEh1: TDBNumberEditEh;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBComboBoxEh1: TDBComboBoxEh;
    Label5: TLabel;
    DBEditEh2: TDBEditEh;
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
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PaymentOrderItemForm: TPaymentOrderItemForm;

implementation

uses StoreDM, PayOrderSelect, CustomerSelect;

{$R *.dfm}

procedure TPaymentOrderItemForm.FormCreate(Sender: TObject);
begin
  Caption := 'Оплата по Накладной';
end;

procedure TPaymentOrderItemForm.FormShow(Sender: TObject);
begin
  DBEditEh2.SetFocus;
end;

procedure TPaymentOrderItemForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  Param: Variant;
begin
  with StoreDataModule do
  try
    Param := PaymentOrderDataSet.ParamByName('OrderID').Value;
    if ModalResult = mrOk then
    begin
      if PaymentOrderDataSet.Modified then
        PaymentOrderDataSet.Post;
      PaymentOrderTransaction.Commit;
    end
    else
    begin
      PaymentOrderDataSet.Cancel;
      PaymentOrderTransaction.Rollback;
    end;
  except
    Application.MessageBox('Недопустимые значения данных',
      'Ошибка ввода', mb_IconStop);
    Abort;
  end;

//Открываем после Commit/Rollback
  if StoreDataModule.PaymentOrderDataSet.Active = False then
  begin
    StoreDataModule.PaymentOrderTransaction.Active := True;
    StoreDataModule.PaymentOrderDataSet.ParamByName('OrderID').Value := Param;
    StoreDataModule.PaymentOrderDataSet.Open;
  end;
  Release;
end;

procedure TPaymentOrderItemForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TPaymentOrderItemForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TPaymentOrderItemForm.DBEditEh1EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  PayOrderSelectForm := TPayOrderSelectForm.Create(Self);
  PayOrderSelectForm.ShowModal;
end;

procedure TPaymentOrderItemForm.DBEditEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBEditEh1EditButtons0Click(Self, h);
end;

procedure TPaymentOrderItemForm.DBEditEh2EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  CustomerSelectForm := TCustomerSelectForm.Create(Self);
  CustomerSelectForm.ShowModal;
end;

procedure TPaymentOrderItemForm.DBEditEh2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBEditEh2EditButtons0Click(Self, h);
end;

procedure TPaymentOrderItemForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    SelectNext(ActiveControl As TWinControl, True, True);
end;

end.
