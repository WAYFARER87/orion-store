unit ReportPrice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, FR_DSet, FR_DBSet, FR_Class, Mask, DBCtrlsEh,
  DBLookupEh,
  MString;

type
  TReportPriceForm = class(TForm)
    CancelButton: TButton;
    OKButton: TButton;
    Bevel1: TBevel;
    CheckBox1: TCheckBox;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    DBEditEh1: TDBEditEh;
    Label1: TLabel;
    Label2: TLabel;
    DBEditEh2: TDBEditEh;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEditEh1EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBEditEh2EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReportPriceForm: TReportPriceForm;

implementation

uses StoreDM, ReportDM, TypePrice, ReportOrderSelect;

{$R *.dfm}

procedure TReportPriceForm.FormCreate(Sender: TObject);
begin
  StoreDataModule.ReportOrderQuery.ParamByName('MainFirm').Value := MainFirm;
  StoreDataModule.ReportOrderQuery.Open;
  StoreDataModule.ReportFirmQuery.ParamByName('MainFirm').Value := MainFirm;
  StoreDataModule.TypePriceDataSet.Open;
  StoreDataModule.TypePriceDataSet.Locate('PriceID', MainPrice, []);
  Caption := 'Ценник';
end;

procedure TReportPriceForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult = mrOk then
  try
    with ReportDataModule.PriceListQuery do
    begin
      SQL.Clear;
      SQL.Add('SELECT "Products"."ProductID", "Products"."ProductName", "Products"."Note", "Products"."Description", "Categories"."CategoryName", "Measures"."MeasureName", "Countrys"."CountryName", "Prices"."Price"');
      SQL.Add('FROM "Store", "Products", "Categories", "Measures", "Countrys", "Prices", "Structure"');
      SQL.Add('WHERE ("Products"."ProductID" = "Store"."ProductID") AND ("Products"."CategoryID" = "Categories"."CategoryID") AND ("Products"."MeasureID" = "Measures"."MeasureID") AND ("Products"."CountryID" = "Countrys"."CountryID")' +
              ' AND ("Prices"."StoreID" = "Store"."StoreID" AND "Prices"."PriceID" = :"PriceID")' +
              ' AND ("Store"."StoreID" = "Structure"."StoreID" AND "Structure"."OrderID" = ' + DBEditEh2.Value + ')');
      SQL.Add('ORDER BY "CategoryName", "ProductName"');
    end;
    frReport1.Clear;
    if CheckBox1.Checked then
      frReport1.LoadFromFile('Reports\PriceBig.frf')
    else
      frReport1.LoadFromFile('Reports\Price.frf');
    frReport1.ShowReport;
    frReport1.Clear;
  finally
    with ReportDataModule.PriceListQuery do
    begin
      SQL.Clear;
      SQL.Add('SELECT "Products"."ProductID", "Products"."ProductName", "Products"."Note", "Products"."Description", "Categories"."CategoryName", "Groups"."GroupName", "Measures"."MeasureName", "Prices"."Price"');
      SQL.Add('FROM "Store", "StoreQty", "Products", "Categories", "Groups", "Measures", "Prices"');
      SQL.Add('WHERE ("Products"."ProductID" = "Store"."ProductID") AND ("StoreQty"."StoreID" = "Store"."StoreID") AND ("Products"."CategoryID" = "Categories"."CategoryID") AND ("Categories"."GroupID" = "Groups"."GroupID")' +
              ' AND ("Products"."MeasureID" = "Measures"."MeasureID") AND ("Prices"."StoreID" = "Store"."StoreID" AND "Prices"."PriceID" = :"PriceID") AND ("StoreQty"."Qty" > 0)');
      SQL.Add('ORDER BY "CategoryName", "ProductName"');
    end;
  end;
  StoreDataModule.ReportOrderQuery.Close;
  StoreDataModule.TypePriceDataSet.Close;
  Release;
end;

procedure TReportPriceForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TReportPriceForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TReportPriceForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    OKButton.Click;
end;

procedure TReportPriceForm.DBEditEh1EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  TypePriceForm := TTypePriceForm.Create(Self);
  TypePriceForm.ShowModal;
  if TypePriceForm.ModalResult = mrOK then
    StoreDataModule.TypePriceDataSet.Locate('PriceID', CurPriceID, [])
  else
    StoreDataModule.TypePriceDataSet.Locate('PriceID', MainPrice, []);
end;

procedure TReportPriceForm.DBEditEh2EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  ReportOrderSelectForm := TReportOrderSelectForm.Create(Self);
  ReportOrderSelectForm.ShowModal;
  if ReportOrderSelectForm.ModalResult = mrOK then
    StoreDataModule.ReportOrderQuery.Locate('OrderID', CurOrderID, []);
end;

end.
