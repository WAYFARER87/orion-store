unit ProductItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, ExtCtrls, DBLookupEh, DBCtrls,
  ComCtrls, ssdefines;

type
  TProductItemForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Bevel1: TBevel;
    Label1: TLabel;
    DBEditEh1: TDBEditEh;
    Label2: TLabel;
    DBEditEh2: TDBEditEh;
    Label3: TLabel;
    DBEditEh3: TDBEditEh;
    Label4: TLabel;
    Label5: TLabel;
    DBEditEh4: TDBEditEh;
    Label6: TLabel;
    DBEditEh5: TDBEditEh;
    TabSheet3: TTabSheet;
    DBMemo1: TDBMemo;
    Panel1: TPanel;
    OKButton: TButton;
    CancelButton: TButton;
    Label9: TLabel;
    DBEditEh8: TDBEditEh;
    TabSheet2: TTabSheet;
    Bevel2: TBevel;
    Label8: TLabel;
    Label7: TLabel;
    DBEditEh6: TDBEditEh;
    DBNumberEditEh1: TDBNumberEditEh;
    DBEditEh7: TDBEditEh;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure DBEditEh4EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBEditEh4EditButtons1Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBEditEh4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEditEh5EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBEditEh5EditButtons1Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBEditEh5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEditEh6EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBEditEh6EditButtons1Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBEditEh6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEditEh7EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBEditEh7EditButtons1Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBEditEh7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    ModeAEC: TModeAEC;
    { Public declarations }
  end;

var
  ProductItemForm: TProductItemForm;

implementation

uses StoreDM, Measure, Producer, ProductDescription, Category, Country,
  CCD, Certificate;

{$R *.dfm}

procedure TProductItemForm.FormCreate(Sender: TObject);
begin
  CurrentProductID := StoreDataModule.ProductDataSet['ProductID'];
end;

procedure TProductItemForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with StoreDataModule do
  try
    if ModalResult = mrOk then
    begin
      ProductDataSet.Post;
      ProductTransaction.CommitRetaining;
    end
    else
    begin
      ProductDataSet.Cancel;
    end;
  except
    Application.MessageBox('Недопустимые значения данных',
      'Ошибка ввода', mb_IconStop);
    Abort;
  end;
//  if StoreDataModule.ProductDataSet.Active = False then
//    StoreDataModule.ProductDataSet.Open;
  Release;
end;

procedure TProductItemForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TProductItemForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TProductItemForm.DBEditEh4EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  CategoryForm := TCategoryForm.Create(Self);
  CategoryForm.ShowModal;
  if CategoryForm.ModalResult = mrOk then
  with StoreDataModule do
  begin
    ProductDataSet['CategoryID'] := CurCategoryID;
    ProductDataSet['CategoryName'] := CurrentCategoryName;
  end;
end;

procedure TProductItemForm.DBEditEh4EditButtons1Click(Sender: TObject;
  var Handled: Boolean);
begin
  StoreDataModule.ProductDataSet['CategoryID'] := 0;
  StoreDataModule.ProductDataSet['CategoryName'] := '';
end;

procedure TProductItemForm.DBEditEh4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBEditEh4EditButtons0Click(Self, h);
  if Key = VK_F8 then
    DBEditEh4EditButtons1Click(Self, h);
end;

procedure TProductItemForm.DBEditEh5EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  CurMeasureID := StoreDataModule.ProductDataSet['MeasureID'];
  MeasureForm := TMeasureForm.Create(Self);
  MeasureForm.ShowModal;
  if MeasureForm.ModalResult = mrOK then
  with StoreDataModule do
  begin
    ProductDataSet['MeasureID'] := CurMeasureID;
    ProductDataSet['MeasureName'] := CurMeasureName;
  end;
end;

procedure TProductItemForm.DBEditEh5EditButtons1Click(Sender: TObject;
  var Handled: Boolean);
begin
  StoreDataModule.ProductDataSet['MeasureID'] := 0;
  StoreDataModule.ProductDataSet['MeasureName'] := '';
end;

procedure TProductItemForm.DBEditEh5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBEditEh5EditButtons0Click(Self, h);
  if Key = VK_F8 then
    DBEditEh5EditButtons1Click(Self, h);
end;

procedure TProductItemForm.DBEditEh6EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  CurProducerID := StoreDataModule.ProductDataSet['ProducerID'];
  ProducerForm := TProducerForm.Create(Self);
  ProducerForm.ShowModal;
  if ProducerForm.ModalResult = mrOK then
  with StoreDataModule do
  begin
    ProductDataSet['ProducerID'] := CurProducerID;
    ProductDataSet['ProducerName'] := CurProducerName;
  end;
end;

procedure TProductItemForm.DBEditEh6EditButtons1Click(Sender: TObject;
  var Handled: Boolean);
begin
  StoreDataModule.ProductDataSet['ProducerID'] := 0;
  StoreDataModule.ProductDataSet['ProducerName'] := '';
end;

procedure TProductItemForm.DBEditEh6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBEditEh6EditButtons0Click(Self, h);
  if Key = VK_F8 then
    DBEditEh6EditButtons1Click(Self, h);
end;

procedure TProductItemForm.DBEditEh7EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  CurCountryID := StoreDataModule.ProductDataSet['CountryID'];
  CountryForm := TCountryForm.Create(Self);
  CountryForm.ShowModal;
  if CountryForm.ModalResult = mrOK then
  with StoreDataModule do
  begin
    ProductDataSet['CountryID'] := CurCountryID;
    ProductDataSet['CountryName'] := CurCountryName;
  end;
end;

procedure TProductItemForm.DBEditEh7EditButtons1Click(Sender: TObject;
  var Handled: Boolean);
begin
  StoreDataModule.ProductDataSet['CountryID'] := 0;
  StoreDataModule.ProductDataSet['CountryName'] := '';
end;

procedure TProductItemForm.DBEditEh7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBEditEh7EditButtons0Click(Self, h);
  if Key = VK_F8 then
    DBEditEh7EditButtons1Click(Self, h);
end;

procedure TProductItemForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  lforward: boolean;
begin
  lforward:=not (ssctrl in shift);
  if Key = VK_RETURN then
    if not DBNumberEditEh1.CalculatorVisible then  // Енто что бы не уходил из калькулятора
    SelectNext(ActiveControl As TWinControl, lforward, True);
end;

procedure TProductItemForm.FormShow(Sender: TObject);
begin
  case ModeAEC of
    mEdit:
      Caption:=StoreDataModule.ProductDataSet.FieldByName('ProductName').AsString+'. Редактирование записи';
    mAdd:
      Caption:='Добавление записи.';
  end;
end;

end.
