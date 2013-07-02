unit ReportPriceList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, FR_DSet, FR_DBSet, FR_Class, Mask, DBCtrlsEh,
  DBLookupEh, Grids, DBGridEh;

type
  TReportPriceListForm = class(TForm)
    CancelButton: TButton;
    OKButton: TButton;
    Bevel1: TBevel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    DBNumberEditEh1: TDBNumberEditEh;
    DBEditEh1: TDBEditEh;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEditEh1EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReportPriceListForm: TReportPriceListForm;

implementation

uses StoreDM, ReportDM, TypePrice;

{$R *.dfm}

procedure TReportPriceListForm.FormCreate(Sender: TObject);
begin
  StoreDataModule.ReportFirmQuery.ParamByName('MainFirm').Value := MainFirm;
  StoreDataModule.ReportFirmQuery.Open;
  StoreDataModule.TypePriceDataSet.Open;
  StoreDataModule.TypePriceDataSet.Locate('PriceID', MainPrice, []);
  Caption := 'Прайс-лист';
  ReportDataModule.PriceListQuery.Open;
end;

procedure TReportPriceListForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult = mrOk then
  try
    with ReportDataModule.PriceListQuery do
    begin
      SQL.Clear;
      SQL.Add('SELECT "Products"."ProductID", "Products"."ProductName", "Products"."Note", "Products"."Description", "Categories"."CategoryName", "Groups"."GroupName", "Groups"."Priorit", "Measures"."MeasureName", "Prices"."Price"');
      SQL.Add('FROM "Store", "StoreQty", "Products", "Categories", "Groups", "Measures", "Prices"');
      SQL.Add('WHERE ("Products"."ProductID" = "Store"."ProductID") AND ("StoreQty"."StoreID" = "Store"."StoreID") AND ("Products"."CategoryID" = "Categories"."CategoryID") AND ("Categories"."GroupID" = "Groups"."GroupID")' +
              ' AND ("Products"."MeasureID" = "Measures"."MeasureID") AND ("Prices"."StoreID" = "Store"."StoreID" AND "Prices"."PriceID" = :"PriceID") AND ("StoreQty"."Qty" >= ' + IntToStr(DBNumberEditEh1.Value) + ')' +
              ' AND ("StoreQty"."DivisionID" IN (SELECT "DivisionID" FROM "Divisions" WHERE "CustomerID" = ' + IntToStr(MainFirm) + '))');
      SQL.Add('ORDER BY "Priorit", "CategoryName", "ProductName"');
    end;
    frReport1.Clear;
    if CheckBox1.Checked then
      frReport1.LoadFromFile('Reports\PriceListGroup.frf')
    else
      frReport1.LoadFromFile('Reports\PriceList.frf');
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
  StoreDataModule.ReportFirmQuery.Close;
  ReportDataModule.PriceListQuery.Close;
  StoreDataModule.TypePriceDataSet.Close;
  Release;
end;

procedure TReportPriceListForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TReportPriceListForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TReportPriceListForm.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked then
    DBNumberEditEh1.Enabled := True
  else
  begin
    DBNumberEditEh1.Value := 0;
    DBNumberEditEh1.Enabled := False;
  end;
end;

procedure TReportPriceListForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    OKButton.Click;
end;

procedure TReportPriceListForm.DBEditEh1EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  TypePriceForm := TTypePriceForm.Create(Self);
  TypePriceForm.ShowModal;
  if TypePriceForm.ModalResult = mrOK then
    StoreDataModule.TypePriceDataSet.Locate('PriceID', CurPriceID, [])
  else
    StoreDataModule.TypePriceDataSet.Locate('PriceID', MainPrice, []);
end;

end.
