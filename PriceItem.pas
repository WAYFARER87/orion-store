unit PriceItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, ExtCtrls, DBLookupEh;

type
  TPriceItemForm = class(TForm)
    OKButton: TButton;
    CancelButton: TButton;
    Bevel1: TBevel;
    DBEditEh1: TDBEditEh;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBNumberEditEh2: TDBNumberEditEh;
    DBEditEh2: TDBEditEh;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure DBLookupComboboxEh1EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBLookupComboboxEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure OKButtonKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PriceItemForm: TPriceItemForm;
  CurrentCustomerID : Integer;

implementation

uses StoreDM, TypePrice;

{$R *.dfm}

procedure TPriceItemForm.FormCreate(Sender: TObject);
begin
  Caption := StoreDataModule.PriceDataSet.FieldByName('PriceName').AsString;
end;

procedure TPriceItemForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with StoreDataModule do
  try
    if ModalResult = mrOk then
    begin
//      CurrentCustomerID := CustomerDataSet['CustomerID']; Енто я не помню что це таке... :(
      PriceDataSet.Post;
    end
    else
      PriceDataSet.Cancel;
  except
    Application.MessageBox('Недопустимые значения данных',
      'Ошибка ввода', mb_IconStop);
    Abort;
  end;
  Release;
end;

procedure TPriceItemForm.FormShow(Sender: TObject);
begin
  DBLookupComboboxEh1.SetFocus;
end;

procedure TPriceItemForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TPriceItemForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TPriceItemForm.DBLookupComboboxEh1EditButtons0Click(
  Sender: TObject; var Handled: Boolean);
begin
  TypePriceForm := TTypePriceForm.Create(Self);
  TypePriceForm.ShowModal;
  if TypePriceForm.ModalResult = mrOk then
  with StoreDataModule do
  begin
    PriceDataSet['PriceID'] := TypePriceDataSet['PriceID'];
    PriceDataSet['Price'] := StoreOrderQuery['Price'] + (StoreOrderQuery['Price'] * CurPriceMarkup) / 100;
  end;
end;

procedure TPriceItemForm.DBLookupComboboxEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBLookupComboboxEh1EditButtons0Click(Self, h);
end;

procedure TPriceItemForm.OKButtonKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    SelectNext(ActiveControl As TWinControl, True, True);
end;

end.
