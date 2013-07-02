unit ReportRemains;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, DBCtrlsEh,
  DateUtils, FR_DSet, FR_DBSet, FR_Class;

type
  TReportRemainsForm = class(TForm)
    CancelButton: TButton;
    OKButton: TButton;
    Bevel1: TBevel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    Label2: TLabel;
    Label3: TLabel;
    DBEditEh2: TDBEditEh;
    DBEditEh3: TDBEditEh;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    frDBDataSet2: TfrDBDataSet;
    CheckBox2: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure DBEditEh2EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBEditEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEditEh3EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBEditEh3KeyDown(Sender: TObject; var Key: Word;
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
  ReportRemainsForm: TReportRemainsForm;

implementation

uses StoreDM, ReportDM, DivisionSelect, TypePrice, ssdefines;

{$R *.dfm}

procedure TReportRemainsForm.FormCreate(Sender: TObject);
begin
  StoreDataModule.ReportFirmQuery.ParamByName('MainFirm').Value := MainFirm;
  StoreDataModule.ReportFirmQuery.Open;
  StoreDataModule.DivisionSelectQuery.Open;
  StoreDataModule.DivisionSelectQuery.Locate('DivisionID', MainDivision, []);
  StoreDataModule.TypePriceDataSet.Open;
  StoreDataModule.TypePriceDataSet.Locate('PriceID', MainPrice, []);
  DBDateTimeEditEh1.Value := Now;
  Caption := 'Выбор параметров отчета';
end;

procedure TReportRemainsForm.FormShow(Sender: TObject);
begin
  DBDateTimeEditEh1.SetFocus;
end;

procedure TReportRemainsForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult = mrOk then
  begin

    ReportDataModule.CategoryQuery.Open;
    ReportDataModule.RemainsQuery.Close;
    ReportDataModule.RemainsQuery.ParamByName('MainFirm').Value := MainFirm;
    if CheckBox1.Checked then
    begin
      ReportDataModule.RemainsQuery.ParamByName('DivisionID').Value := Null;
      frVariables['frDivisionName'] := 'По всем складам';
    end
    else
    begin
      ReportDataModule.RemainsQuery.ParamByName('DivisionID').Value := StoreDataModule.DivisionSelectQuery['DivisionID'];
      frVariables['frDivisionName'] := StoreDataModule.DivisionSelectQuery.FieldByName('DivisionName').AsString;
    end;
    ReportDataModule.RemainsQuery.ParamByName('PriceID').Value := StoreDataModule.TypePriceDataSet['PriceID'];
    frVariables['frPriceName'] := StoreDataModule.TypePriceDataSet.FieldByName('PriceName').AsString;
    ReportDataModule.RemainsQuery.ParamByName('WorkDate').Value := DBDateTimeEditEh1.Value;
    frVariables['frWorkDate'] := DBDateTimeEditEh1.Value;
    ReportDataModule.RemainsQuery.Open;

    frReport1.Clear;
    frReport1.LoadFromFile('Reports\'+ifex(checkbox2.checked,'r','ReportR')+'emains.frf');
    frReport1.ShowReport;
    frReport1.Clear;

  end;
  ReportDataModule.CategoryQuery.Close;
  StoreDataModule.ReportFirmQuery.Close;
  StoreDataModule.DivisionSelectQuery.Close;
  StoreDataModule.TypePriceDataSet.Close;
  Release;
end;

procedure TReportRemainsForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TReportRemainsForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TReportRemainsForm.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
    DBEditEh2.Enabled := False
  else
    DBEditEh2.Enabled := True;
end;

procedure TReportRemainsForm.DBEditEh2EditButtons0Click(
  Sender: TObject; var Handled: Boolean);
begin
  CurDivisionID := StoreDataModule.DivisionSelectQuery['DivisionID'];
  DivisionSelectForm := TDivisionSelectForm.Create(Self);
  DivisionSelectForm.ShowModal;
  if StoreDataModule.DivisionSelectQuery.Active = False then
    StoreDataModule.DivisionSelectQuery.Open;
  if DivisionSelectForm.ModalResult = mrOK then
    StoreDataModule.DivisionSelectQuery.Locate('DivisionID', CurDivisionID, []);
end;

procedure TReportRemainsForm.DBEditEh2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBEditEh2EditButtons0Click(Self, h);
end;

procedure TReportRemainsForm.DBEditEh3EditButtons0Click(
  Sender: TObject; var Handled: Boolean);
begin
  TypePriceForm := TTypePriceForm.Create(Self);
  TypePriceForm.ShowModal;
  if TypePriceForm.ModalResult = mrOK then
    StoreDataModule.TypePriceDataSet.Locate('PriceID', CurPriceID, []);
end;

procedure TReportRemainsForm.DBEditEh3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBEditEh3EditButtons0Click(Self, h);
end;

procedure TReportRemainsForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    SelectNext(ActiveControl As TWinControl, True, True);
end;

procedure TReportRemainsForm.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked then
    DBEditEh3.Enabled := False
  else
    DBEditEh3.Enabled := True;

end;

end.
