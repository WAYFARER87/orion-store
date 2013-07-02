unit StoreItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, ExtCtrls, DBLookupEh, ComCtrls,
  Grids, DBGridEh, ToolWin;

type
  TStoreItemForm = class(TForm)
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
    TabSheet4: TTabSheet;
    DBGridEh2: TDBGridEh;
    Label6: TLabel;
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
    Label8: TLabel;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    Label9: TLabel;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBGridEh3: TDBGridEh;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StoreItemForm: TStoreItemForm;

implementation

uses StoreDM, ProductSelect, DivisionSelect, PriceItem, Country, CCD, Certificate;

{$R *.dfm}

procedure TStoreItemForm.FormCreate(Sender: TObject);
begin
  with StoreDataModule do
  begin
//  Передаем таблице "Цены" параметры "Мастера"
    PriceDataSet.DataSource := StoreDataSource;
    PriceDataSet.Open;
    CountryDataSet.Open;
    CCDDataSet.Open;
    CertificateDataSet.Open;
    StoreOrderQuery.Open;
    QtyStoreQuery.Open;
//  В заголовок формы передаем Наименование "Товара"
    Caption := StoreProductDataSet.FieldByName('ProductFullName').AsString;
  end;
end;

procedure TStoreItemForm.FormShow(Sender: TObject);
begin
  DBEditEh3.SetFocus;
end;

procedure TStoreItemForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with StoreDataModule do
  try
    if ModalResult = mrOk then
    begin
      StoreDataSet.Post;
    end
    else
      StoreDataSet.Cancel;
  except
    Application.MessageBox('Недопустимые значения данных',
      'Ошибка ввода', mb_IconStop);
    Abort;
  end;
  with StoreDataModule do
  begin
    PriceDataSet.Close;
    CountryDataSet.Close;
    CCDDataSet.Close;
    CertificateDataSet.Close;
    StoreOrderQuery.Close;
    QtyStoreQuery.Close;
  end;
  Release;
end;

procedure TStoreItemForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TStoreItemForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TStoreItemForm.DBLookupComboboxEh1EditButtons0Click(
  Sender: TObject; var Handled: Boolean);
begin
  CCDForm := TCCDForm.Create(Self);
  CCDForm.ShowModal;
  if CCDForm.ModalResult = mrOK then
    StoreDataModule.StoreDataSet['CCDID'] := CurCCDID;
  StoreDataModule.CCDDataSet.Open;
end;

procedure TStoreItemForm.DBLookupComboboxEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBLookupComboboxEh1EditButtons0Click(Self, h);
end;

procedure TStoreItemForm.DBLookupComboboxEh2EditButtons0Click(
  Sender: TObject; var Handled: Boolean);
begin
  CertificateForm := TCertificateForm.Create(Self);
  CertificateForm.ShowModal;
  if CertificateForm.ModalResult = mrOK then
    StoreDataModule.StoreDataSet['CertificateID'] := CurCertificateID;
  StoreDataModule.CertificateDataSet.Open;
end;

procedure TStoreItemForm.DBLookupComboboxEh2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBLookupComboboxEh2EditButtons0Click(Self, h);
end;

procedure TStoreItemForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    SelectNext(ActiveControl As TWinControl, True, True);
end;

procedure TStoreItemForm.InsertButtonClick(Sender: TObject);
begin
  StoreDataModule.PriceDataSet.Append;
  StoreDataModule.PriceDataSet['StoreID'] := StoreDataModule.StoreDataSet['StoreID'];
  PriceItemForm := TPriceItemForm.Create(Self);
  PriceItemForm.ShowModal;
end;

procedure TStoreItemForm.EditButtonClick(Sender: TObject);
begin
  StoreDataModule.PriceDataSet.Edit;
  PriceItemForm := TPriceItemForm.Create(Self);
  PriceItemForm.ShowModal;
end;

procedure TStoreItemForm.DeleteButtonClick(Sender: TObject);
var
  TPriceStr : String;
  PriceStr : String;
begin
  TPriceStr := StoreDataModule.PriceDataSet.FieldByName('PriceName').AsString;
  PriceStr := Format('%0:n', [StoreDataModule.PriceDataSet.FieldByName('Price').AsCurrency]);
  if Application.MessageBox(PChar('Вы действительно хотите удалить запись"' +
    TPriceStr + ' = ' + PriceStr + '"?'),
    'Удаление записи',
    mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
  try
    StoreDataModule.PriceDataSet.Delete;
  except
    Application.MessageBox(PChar('Запись "' + TPriceStr + '=' + PriceStr + '" удалять нельзя.'),
      'Ошибка удаления', mb_IconStop);
  end;
end;

procedure TStoreItemForm.ToolButton3Click(Sender: TObject);
var
  Markup: Real;
begin
  if Application.MessageBox(PChar('Пересчитать ВСЕ Цены?'),
    'Внимание!',
    mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
  with StoreDataModule do
  try
    PriceDataSet.Close;
    DeletePriceStoreQuery.ExecSQL;
    PriceDataSet.Open;
    TypePriceDataSet.Open;
    TypePriceDataSet.First;
    while not TypePriceDataSet.EOF do
    begin
      PriceDataSet.Append;
      PriceDataSet['StoreID'] := StoreDataSet['StoreID'];
      PriceDataSet['PriceID'] := TypePriceDataSet['PriceID'];
      if TypePriceDataSet['Markup'] <> Null then
        Markup := TypePriceDataSet['Markup']
      else
        Markup := 0;
      PriceDataSet['Price'] := StoreOrderQuery['Price'] + (StoreOrderQuery['Price'] * Markup) / 100;
      TypePriceDataSet.Next;
    end;
    PriceDataSet.Post;
  except
    Application.MessageBox('Недопустимые значения данных',
      'Ошибка ввода', mb_IconStop);
    PriceDataSet.Cancel;
    Abort;
  end;
end;

end.
