unit ReportCommodityMoney;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, DBCtrlsEh,
  DateUtils, FR_DSet, FR_DBSet, FR_Class;

type
  TReportCommodityMoneyForm = class(TForm)
    CancelButton: TButton;
    OKButton: TButton;
    Bevel1: TBevel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    Label3: TLabel;
    DBEditEh2: TDBEditEh;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    frDBDataSet2: TfrDBDataSet;
    DBDateTimeEditEh2: TDBDateTimeEditEh;
    frReport2: TfrReport;
    frCompositeReport1: TfrCompositeReport;
    frReport3: TfrReport;
    frDBDataSet3: TfrDBDataSet;
    CheckBox2: TCheckBox;
    Label2: TLabel;
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
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReportCommodityMoneyForm: TReportCommodityMoneyForm;

implementation

uses StoreDM, ReportDM, DivisionSelect, TypePrice;

{$R *.dfm}

procedure TReportCommodityMoneyForm.FormCreate(Sender: TObject);
begin
  StoreDataModule.ReportFirmQuery.ParamByName('MainFirm').Value := MainFirm;
  StoreDataModule.ReportFirmQuery.Open;
  StoreDataModule.DivisionSelectQuery.Open;
  StoreDataModule.DivisionSelectQuery.Locate('DivisionID', MainDivision, []);
  DBDateTimeEditEh1.Value := Now;
  DBDateTimeEditEh2.Value := Now;
  Caption := 'Выбор параметров отчета';
end;

procedure TReportCommodityMoneyForm.FormShow(Sender: TObject);
begin
  DBDateTimeEditEh1.SetFocus;
end;

procedure TReportCommodityMoneyForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult = mrOk then
  begin
    ReportDataModule.CommodityExpenseQuery.Close;
    ReportDataModule.CommodityReceiptQuery.Close;
    if CheckBox1.Checked then
    begin
      ReportDataModule.CommodityExpenseQuery.ParamByName('MainFirm').Value := MainFirm;
      ReportDataModule.CommodityExpenseQuery.ParamByName('DivisionID').Value := Null;
      ReportDataModule.CommodityReceiptQuery.ParamByName('MainFirm').Value := MainFirm;
      ReportDataModule.CommodityReceiptQuery.ParamByName('DivisionID').Value := Null;
      ReportDataModule.CommodityPaymentQuery.ParamByName('MainFirm').Value := MainFirm;
      ReportDataModule.CommodityPaymentQuery.ParamByName('DivisionID').Value := Null;
      frVariables['frDivisionName'] := 'По всем складам';
    end
    else
    begin
      ReportDataModule.CommodityExpenseQuery.ParamByName('MainFirm').Value := Null;
      ReportDataModule.CommodityExpenseQuery.ParamByName('DivisionID').Value := StoreDataModule.DivisionSelectQuery['DivisionID'];
      ReportDataModule.CommodityReceiptQuery.ParamByName('MainFirm').Value := Null;
      ReportDataModule.CommodityReceiptQuery.ParamByName('DivisionID').Value := StoreDataModule.DivisionSelectQuery['DivisionID'];
      ReportDataModule.CommodityPaymentQuery.ParamByName('MainFirm').Value := Null;
      ReportDataModule.CommodityPaymentQuery.ParamByName('DivisionID').Value := StoreDataModule.DivisionSelectQuery['DivisionID'];
      frVariables['frDivisionName'] := StoreDataModule.DivisionSelectQuery.FieldByName('DivisionName').AsString;
    end;
    ReportDataModule.CommodityExpenseQuery.ParamByName('TopDate').Value := DBDateTimeEditEh1.Value;
    ReportDataModule.CommodityExpenseQuery.ParamByName('BottomDate').Value := DBDateTimeEditEh2.Value;
    ReportDataModule.CommodityReceiptQuery.ParamByName('TopDate').Value := DBDateTimeEditEh1.Value;
    ReportDataModule.CommodityReceiptQuery.ParamByName('BottomDate').Value := DBDateTimeEditEh2.Value;
    ReportDataModule.CommodityPaymentQuery.ParamByName('TopDate').Value := DBDateTimeEditEh1.Value;
    ReportDataModule.CommodityPaymentQuery.ParamByName('BottomDate').Value := DBDateTimeEditEh2.Value;
    frVariables['frTopDate'] := DBDateTimeEditEh1.Value;
    frVariables['frBottomDate'] := DBDateTimeEditEh2.Value;
    ReportDataModule.CommodityExpenseQuery.Open;
    ReportDataModule.CommodityReceiptQuery.Open;
    ReportDataModule.CommodityPaymentQuery.Open;

    frReport1.Clear;
    frReport1.LoadFromFile('Reports\ReportCommodityExpense.frf');
    frReport2.Clear;
    frReport2.LoadFromFile('Reports\ReportCommodityReceipt.frf');
    frReport3.Clear;
    frReport3.LoadFromFile('Reports\ReportCommodityPayment.frf');
    frCompositeReport1.Reports.Clear;
    frCompositeReport1.Reports.Add(frReport1);
    frCompositeReport1.Reports.Add(frReport2);
    if CheckBox2.Checked then
      frCompositeReport1.Reports.Add(frReport3);
    frCompositeReport1.ShowReport;
    frReport1.Clear;
    frReport2.Clear;
    frReport3.Clear;
    frCompositeReport1.Clear;

  end;
  ReportDataModule.CommodityExpenseQuery.Close;
  ReportDataModule.CommodityReceiptQuery.Close;
  ReportDataModule.CommodityPaymentQuery.Close;
  StoreDataModule.ReportFirmQuery.Close;
  StoreDataModule.DivisionSelectQuery.Close;
  Release;
end;

procedure TReportCommodityMoneyForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TReportCommodityMoneyForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TReportCommodityMoneyForm.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
    DBEditEh2.Enabled := False
  else
    DBEditEh2.Enabled := True;
end;

procedure TReportCommodityMoneyForm.DBEditEh2EditButtons0Click(
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

procedure TReportCommodityMoneyForm.DBEditEh2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBEditEh2EditButtons0Click(Self, h);
end;

procedure TReportCommodityMoneyForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    if not (DBDateTimeEditEh1.CalendarVisible or DBDateTimeEditEh2.CalendarVisible) then
    SelectNext(ActiveControl As TWinControl, True, True);
end;

end.
