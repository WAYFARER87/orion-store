unit CustomerItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, ExtCtrls, DBLookupEh, ComCtrls,
  DBCtrls;

type
  TCustomerItemForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Bevel1: TBevel;
    Label1: TLabel;
    DBEditEh1: TDBEditEh;
    DBEditEh2: TDBEditEh;
    Label2: TLabel;
    Label3: TLabel;
    DBEditEh3: TDBEditEh;
    DBEditEh4: TDBEditEh;
    Label4: TLabel;
    Label5: TLabel;
    DBEditEh5: TDBEditEh;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    OKButton: TButton;
    CancelButton: TButton;
    TabSheet4: TTabSheet;
    Bevel4: TBevel;
    Label6: TLabel;
    DBEditEh6: TDBEditEh;
    DBEditEh7: TDBEditEh;
    Label7: TLabel;
    DBEditEh8: TDBEditEh;
    Label8: TLabel;
    DBEditEh9: TDBEditEh;
    TabSheet5: TTabSheet;
    Bevel3: TBevel;
    Label12: TLabel;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    Label13: TLabel;
    DBEditEh12: TDBEditEh;
    Label14: TLabel;
    DBMemo1: TDBMemo;
    Bevel2: TBevel;
    Label10: TLabel;
    Label11: TLabel;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    DBEditEh11: TDBEditEh;
    CheckBox1: TCheckBox;
    Label9: TLabel;
    DBEditEh10: TDBEditEh;
    CheckBox2: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure DBEditEh2Exit(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure DBLookupComboboxEh1EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBLookupComboboxEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CustomerItemForm: TCustomerItemForm;

implementation

uses StoreDM, Bank;

{$R *.dfm}

procedure TCustomerItemForm.FormCreate(Sender: TObject);
begin
  CurCustomerID := StoreDataModule.CustomerDataSet['CustomerID'];
  if StoreDataModule.CustomerDataSet['Registration'] <> Null then
    CheckBox1.Checked := True;
  if StoreDataModule.CustomerDataSet['VAT'] = 1 then
    CheckBox2.Checked := True;
  StoreDataModule.BankDataSet.Open;
  StoreDataModule.TypePriceDataSet.Open;
  Caption := 'Сведения о Клиенте: ' + StoreDataModule.CustomerDataSet.FieldByName('CustomerName').AsString;
end;

procedure TCustomerItemForm.FormShow(Sender: TObject);
begin
  DBEditEh2.SetFocus;
end;

procedure TCustomerItemForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with StoreDataModule do
  try
    if ModalResult = mrOk then
    begin
//      CurCustomerID := CustomerDataSet['CustomerID'];
      CustomerDataSet.Post;
      CustomerTransaction.CommitRetaining;
//      CustomerDataSet.Close;
//      CustomerDataSet.Open;
    end
    else
      CustomerDataSet.Cancel;
  except
    Application.MessageBox('Недопустимые значения данных',
      'Ошибка ввода', mb_IconStop);
    Abort;
  end;
  StoreDataModule.BankDataSet.Close;
  StoreDataModule.TypePriceDataSet.Close;
  Release;
end;

procedure TCustomerItemForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TCustomerItemForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TCustomerItemForm.DBEditEh2Exit(Sender: TObject);
begin
  if StoreDataModule.CustomerDataSet['CustomerFullName'] = Null then
    StoreDataModule.CustomerDataSet['CustomerFullName'] := DBEditEh2.Text;
end;

procedure TCustomerItemForm.CheckBox1Click(Sender: TObject);
begin
  case CheckBox1.State of
    cbChecked :
    begin
      if StoreDataModule.CustomerDataSet['Registration'] = Null then
        StoreDataModule.CustomerDataSet['Registration'] := '№';
      DBEditEh10.Enabled := True;
    end;
    cbUnchecked :
    begin
      StoreDataModule.CustomerDataSet['Registration'] := Null;
      DBEditEh10.Enabled := False;
    end;
  end;
end;

procedure TCustomerItemForm.CheckBox2Click(Sender: TObject);
begin
  case CheckBox2.State of
    cbChecked : StoreDataModule.CustomerDataSet['VAT'] := 1;
    cbUnchecked : StoreDataModule.CustomerDataSet['VAT'] := 0;
  end;
end;

procedure TCustomerItemForm.DBLookupComboboxEh1EditButtons0Click(
  Sender: TObject; var Handled: Boolean);
begin
  BankForm := TBankForm.Create(Self);
  BankForm.ShowModal;
  if BankForm.ModalResult = mrOk then
  with StoreDataModule do
  begin
    CustomerDataSet['BankID'] := CurBankID;
    BankDataSet.Close;
    BankDataSet.Open;
  end;
end;

procedure TCustomerItemForm.DBLookupComboboxEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBLookupComboboxEh1EditButtons0Click(Self, h);
end;

procedure TCustomerItemForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  lforward: boolean;
begin
  lforward:=not (ssctrl in shift);
  if Key = VK_RETURN then
    SelectNext(ActiveControl As TWinControl, lforward, True);
end;

end.
