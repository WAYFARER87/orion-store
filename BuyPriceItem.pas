unit BuyPriceItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, ExtCtrls, DBLookupEh;

type
  TBuyPriceItemForm = class(TForm)
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
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BuyPriceItemForm: TBuyPriceItemForm;
  CurCustomerID : Integer;

implementation

uses StoreDM, TypePrice;

{$R *.dfm}

procedure TBuyPriceItemForm.FormCreate(Sender: TObject);
begin
//  StoreDataModule.BuyPriceDataSet.Open;
  Caption := 'Цена';
end;

procedure TBuyPriceItemForm.FormShow(Sender: TObject);
begin
  DBLookupComboboxEh1.SetFocus;
end;

procedure TBuyPriceItemForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with StoreDataModule do
  try
    if ModalResult = mrOk then
    begin
//      CurCustomerID := CustomerDataSet['CustomerID']; Енто я не помню что це таке... :(
      BuyPriceDataSet.Post;
    end
    else
      BuyPriceDataSet.Cancel;
  except
    Application.MessageBox('Недопустимые значения данных',
      'Ошибка ввода', mb_IconStop);
    Abort;
  end;
//  StoreDataModule.BuyPriceDataSet.Close;
  Release;
end;

procedure TBuyPriceItemForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TBuyPriceItemForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TBuyPriceItemForm.DBLookupComboboxEh1EditButtons0Click(
  Sender: TObject; var Handled: Boolean);
begin
  TypePriceForm := TTypePriceForm.Create(Self);
  TypePriceForm.ShowModal;
  if TypePriceForm.ModalResult = mrOk then
  with StoreDataModule do
  begin
    BuyPriceDataSet['PriceID'] := CurPriceID;
    BuyPriceDataSet['Price'] := BuyStructureDataSet['Price'] + (BuyStructureDataSet['Price'] * CurPriceMarkup) / 100;
  end;
end;

procedure TBuyPriceItemForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    if DBNumberEditEh2.Focused then
      OKButton.Click
    else
      SelectNext(ActiveControl As TWinControl, True, True);
  end;
end;

end.
