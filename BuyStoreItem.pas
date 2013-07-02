unit BuyStoreItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, ExtCtrls, DBLookupEh, ComCtrls,
  Grids, DBGridEh, ToolWin;

type
  TBuyStoreItemForm = class(TForm)
    Panel1: TPanel;
    OKButton: TButton;
    CancelButton: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Bevel1: TBevel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    DBEditEh1: TDBEditEh;
    DBEditEh2: TDBEditEh;
    DBEditEh3: TDBEditEh;
    DBNumberEditEh1: TDBNumberEditEh;
    DBGridEh1: TDBGridEh;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    InsertButton: TToolButton;
    EditButton: TToolButton;
    DeleteButton: TToolButton;
    ToolButton2: TToolButton;
    Label5: TLabel;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    Label6: TLabel;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    DBGridEh2: TDBGridEh;
    Label7: TLabel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    ToolButton3: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure DBLookupComboboxEh1EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBLookupComboboxEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboboxEh2EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBLookupComboboxEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure InsertButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BuyStoreItemForm: TBuyStoreItemForm;

implementation

uses StoreDM, ProductSelect, DivisionSelect, BuyPriceItem, Country, CCD, Certificate;

{$R *.dfm}

procedure TBuyStoreItemForm.FormCreate(Sender: TObject);
begin
  with StoreDataModule do
  begin
    BuyQtyDataSet.Open;
//  Передаем таблице "Цены" параметры "Мастера"
    BuyPriceDataSet.DataSource := BuyStoreDataSource;
    BuyPriceDataSet.Open;
    CountryDataSet.Open;
    CCDDataSet.Open;
    CertificateDataSet.Open;

//  В заголовок формы передаем Наименование "Товара"
    Caption := BuyStructureDataSet.FieldByName('ProductFullName').AsString;
  end;
end;

procedure TBuyStoreItemForm.FormShow(Sender: TObject);
begin
  DBEditEh3.SetFocus;
end;

procedure TBuyStoreItemForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with StoreDataModule do
  try
    if ModalResult = mrOk then
    begin
      if BuyStoreDataSet.Modified then
        BuyStoreDataSet.Post;
    end
    else
      BuyStoreDataSet.Cancel;
  except
    Application.MessageBox('Недопустимые значения данных',
      'Ошибка ввода', mb_IconStop);
    Abort;
  end;
  with StoreDataModule do
  begin
    BuyQtyDataSet.Close;
    BuyPriceDataSet.Close;
    CountryDataSet.Close;
    CCDDataSet.Close;
    CertificateDataSet.Close;
//    StoreOrderDataSet.Close;
  end;
  Release;
end;

procedure TBuyStoreItemForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TBuyStoreItemForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TBuyStoreItemForm.DBLookupComboboxEh1EditButtons0Click(
  Sender: TObject; var Handled: Boolean);
begin
  CCDForm := TCCDForm.Create(Self);
  CCDForm.ShowModal;
  if CCDForm.ModalResult = mrOK then
    StoreDataModule.BuyStoreDataSet['CCDID'] := CurCCDID;
  StoreDataModule.CCDDataSet.Open;
end;

procedure TBuyStoreItemForm.DBLookupComboboxEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBLookupComboboxEh1EditButtons0Click(Self, h);
end;

procedure TBuyStoreItemForm.DBLookupComboboxEh2EditButtons0Click(
  Sender: TObject; var Handled: Boolean);
begin
  CertificateForm := TCertificateForm.Create(Self);
  CertificateForm.ShowModal;
  if CertificateForm.ModalResult = mrOK then
    StoreDataModule.BuyStoreDataSet['CertificateID'] := CurCertificateID;
  StoreDataModule.CertificateDataSet.Open;
end;

procedure TBuyStoreItemForm.DBLookupComboboxEh2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBLookupComboboxEh2EditButtons0Click(Self, h);
end;

procedure TBuyStoreItemForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
{    if DBDateTimeEditEh1.Focused then
      OKButton.Click
    else{}
      SelectNext(ActiveControl As TWinControl, True, True);
  end;
end;

procedure TBuyStoreItemForm.InsertButtonClick(Sender: TObject);
begin
  StoreDataModule.BuyPriceDataSet.Append;
  StoreDataModule.BuyPriceDataSet['StoreID'] := StoreDataModule.BuyStoreDataSet['StoreID'];
  BuyPriceItemForm := TBuyPriceItemForm.Create(Self);
  BuyPriceItemForm.ShowModal;
end;

procedure TBuyStoreItemForm.EditButtonClick(Sender: TObject);
begin
  StoreDataModule.BuyPriceDataSet.Edit;
  BuyPriceItemForm := TBuyPriceItemForm.Create(Self);
  BuyPriceItemForm.ShowModal;
end;

procedure TBuyStoreItemForm.DeleteButtonClick(Sender: TObject);
var
  TPriceStr : String;
  PriceStr : String;
begin
  TPriceStr := StoreDataModule.BuyPriceDataSet.FieldByName('PriceName').AsString;
  PriceStr := StoreDataModule.BuyPriceDataSet.FieldByName('Price').AsString;
  if Application.MessageBox(PChar('Вы действительно хотите удалить запись"' +
    TPriceStr + '=' + PriceStr + '"?'),
    'Удаление записи',
    mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
  try
    StoreDataModule.BuyPriceDataSet.Delete;
  except
    Application.MessageBox(PChar('Запись "' + TPriceStr + '=' + PriceStr + '" удалять нельзя.'),
      'Ошибка удаления', mb_IconStop);
  end;
end;

procedure TBuyStoreItemForm.ToolButton3Click(Sender: TObject);
var
  Markup: Real;
begin
  if Application.MessageBox(PChar('Пересчитать ВСЕ Цены?'),
    'Внимание!',
    mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
  with StoreDataModule do
  try
    BuyPriceDataSet.Close;
    DeletePriceBuyStoreQuery.ExecSQL;
    BuyPriceDataSet.Open;
    TypePriceDataSet.Open;
    TypePriceDataSet.First;
    while not TypePriceDataSet.EOF do
    begin
      BuyPriceDataSet.Append;
      BuyPriceDataSet['StoreID'] := BuyStoreDataSet['StoreID'];
      BuyPriceDataSet['PriceID'] := TypePriceDataSet['PriceID'];
      if TypePriceDataSet['Markup'] <> Null then
        Markup := TypePriceDataSet['Markup']
      else
        Markup := 0;
      BuyPriceDataSet['Price'] := BuyStructureDataSet['Price'] + (BuyStructureDataSet['Price'] * Markup) / 100;
      TypePriceDataSet.Next;
    end;
    BuyPriceDataSet.Post;
  except
    Application.MessageBox('Недопустимые значения данных',
      'Ошибка ввода', mb_IconStop);
    BuyPriceDataSet.Cancel;
    Abort;
  end;
end;

procedure TBuyStoreItemForm.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_F2 : InsertButton.Click;
    VK_F3 : EditButton.Click;
    VK_F8 : DeleteButton.Click;
    VK_F12 : ToolButton3.Click;
  end;
end;

end.
