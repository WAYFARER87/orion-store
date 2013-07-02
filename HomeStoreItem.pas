unit HomeStoreItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, ExtCtrls, DBLookupEh, ComCtrls,
  Grids, DBGridEh, ToolWin;

type
  THomeStoreItemForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Bevel1: TBevel;
    Label1: TLabel;
    DBEditEh1: TDBEditEh;
    Label3: TLabel;
    DBEditEh3: TDBEditEh;
    DBNumberEditEh1: TDBNumberEditEh;
    Label4: TLabel;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    OKButton: TButton;
    CancelButton: TButton;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    InsertButton: TToolButton;
    EditButton: TToolButton;
    DeleteButton: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    Label2: TLabel;
    DBEditEh2: TDBEditEh;
    Label5: TLabel;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    Label6: TLabel;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    Label7: TLabel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBGridEh2: TDBGridEh;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure DBLookupComboboxEh1EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBLookupComboboxEh2EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBLookupComboboxEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboboxEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure InsertButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HomeStoreItemForm: THomeStoreItemForm;

implementation

uses StoreDM, ProductSelect, DivisionSelect,{ HomePriceItem,} Country, CCD, Certificate;

{$R *.dfm}

procedure THomeStoreItemForm.FormCreate(Sender: TObject);
begin
  with StoreDataModule do
  begin
    HomeQtyDataSet.Open;
//  Передаем таблице "Цены" параметры "Мастера"
    HomePriceDataSet.DataSource := HomeStoreDataSource;
    HomePriceDataSet.Open;
    CountryDataSet.Open;
    CCDDataSet.Open;
    CertificateDataSet.Open;
//    StoreOrderDataSet.Open;
//  В заголовок формы передаем Наименование "Товара"
    Caption := HomeStructureDataSet.FieldByName('ProductFullName').AsString;
  end;
end;

procedure THomeStoreItemForm.FormShow(Sender: TObject);
begin
  DBEditEh3.SetFocus;
end;

procedure THomeStoreItemForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with StoreDataModule do
  try
    if ModalResult = mrOk then
    begin
      if HomeStoreDataSet.Modified then
        HomeStoreDataSet.Post;
    end
    else
      HomeStoreDataSet.Cancel;
  except
    Application.MessageBox('Недопустимые значения данных'+#10#13+'(HomeStoreDataSet.Post)',
      'Ошибка ввода', mb_IconStop);
    Abort;
  end;
  with StoreDataModule do
  begin
    HomeQtyDataSet.Close;
    HomePriceDataSet.Close;
    CountryDataSet.Close;
    CCDDataSet.Close;
    CertificateDataSet.Close;
//    StoreOrderDataSet.Close;
  end;
  Release;
end;

procedure THomeStoreItemForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure THomeStoreItemForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure THomeStoreItemForm.DBLookupComboboxEh1EditButtons0Click(
  Sender: TObject; var Handled: Boolean);
begin
  CCDForm := TCCDForm.Create(Self);
  CCDForm.ShowModal;
  if CCDForm.ModalResult = mrOK then
    StoreDataModule.HomeStoreDataSet['CCDID'] := CurCCDID;
  StoreDataModule.CCDDataSet.Open;
end;

procedure THomeStoreItemForm.DBLookupComboboxEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBLookupComboboxEh1EditButtons0Click(Self, h);
end;

procedure THomeStoreItemForm.DBLookupComboboxEh2EditButtons0Click(
  Sender: TObject; var Handled: Boolean);
begin
  CertificateForm := TCertificateForm.Create(Self);
  CertificateForm.ShowModal;
  if CertificateForm.ModalResult = mrOK then
    StoreDataModule.HomeStoreDataSet['CertificateID'] := CurCertificateID;
  StoreDataModule.CertificateDataSet.Open;
end;

procedure THomeStoreItemForm.DBLookupComboboxEh2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBLookupComboboxEh2EditButtons0Click(Self, h);
end;

procedure THomeStoreItemForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    SelectNext(ActiveControl As TWinControl, True, True);
end;

procedure THomeStoreItemForm.InsertButtonClick(Sender: TObject);
begin
{  StoreDataModule.HomePriceDataSet.Append;
  StoreDataModule.HomePriceDataSet['StoreID'] := StoreDataModule.HomeStoreDataSet['StoreID'];
  HomePriceItemForm := THomePriceItemForm.Create(Self);
  HomePriceItemForm.ShowModal;}
end;

procedure THomeStoreItemForm.EditButtonClick(Sender: TObject);
begin
{  StoreDataModule.HomePriceDataSet.Edit;
  HomePriceItemForm := THomePriceItemForm.Create(Self);
  HomePriceItemForm.ShowModal;}
end;

procedure THomeStoreItemForm.DeleteButtonClick(Sender: TObject);
{var
  TPriceStr : String;
  PriceStr : String;{}
begin
{  TPriceStr := StoreDataModule.HomePriceDataSet.FieldByName('PriceName').AsString;
  PriceStr := StoreDataModule.HomePriceDataSet.FieldByName('Price').AsString;
  if Application.MessageBox(PChar('Вы действительно хотите удалить запись"' +
    TPriceStr + '=' + PriceStr + '"?'),
    'Удаление записи',
    mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
  try
    StoreDataModule.HomePriceDataSet.Delete;
  except
    Application.MessageBox(PChar('Запись "' + TPriceStr + '=' + PriceStr + '" удалять нельзя.'),
      'Ошибка удаления', mb_IconStop);
  end;{}
end;

procedure THomeStoreItemForm.ToolButton3Click(Sender: TObject);
var
  Markup: Real;
begin
  if Application.MessageBox(PChar('Пересчитать ВСЕ Цены?'),
    'Внимание!',
    mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
  with StoreDataModule do
  try
    HomePriceDataSet.Close;
    DeletePriceHomeStoreQuery.ExecSQL;
    HomePriceDataSet.Open;
    TypePriceDataSet.Open;
    TypePriceDataSet.First;
    while not TypePriceDataSet.EOF do
    begin
      HomePriceDataSet.Append;
      HomePriceDataSet['StoreID'] := HomeStoreDataSet['StoreID'];
      HomePriceDataSet['PriceID'] := TypePriceDataSet['PriceID'];
      if TypePriceDataSet['Markup'] <> Null then
        Markup := TypePriceDataSet['Markup']
      else
        Markup := 0;
      HomePriceDataSet['Price'] := HomeStructureDataSet['Price'] + (HomeStructureDataSet['Price'] * Markup) / 100;
      TypePriceDataSet.Next;
    end;
    HomePriceDataSet.Post;
  except
    on e: exception do begin
    Application.MessageBox(pchar(e.message),
      'Ошибка ввода', mb_IconStop);
    HomePriceDataSet.Cancel;
    Abort; end;
  end;
end;

end.
