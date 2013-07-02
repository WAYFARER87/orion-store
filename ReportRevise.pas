unit ReportRevise;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, DBCtrlsEh,
  DateUtils, FR_DSet, FR_DBSet, FR_Class;

type
  TReportReviseForm = class(TForm)
    CancelButton: TButton;
    OKButton: TButton;
    Bevel1: TBevel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    Label1: TLabel;
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
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
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
  ReportReviseForm: TReportReviseForm;

implementation

uses StoreDM, ReportDM, CustomerSelect;

{$R *.dfm}

procedure TReportReviseForm.FormCreate(Sender: TObject);
begin
  StoreDataModule.ReportFirmQuery.ParamByName('MainFirm').Value := MainFirm;
  StoreDataModule.ReportFirmQuery.Open;
  StoreDataModule.CustomerSelectQuery.Open;
  StoreDataModule.CustomerSelectQuery.Locate('CustomerID', CurCustomerID, []);
  DBDateTimeEditEh1.Value := Now;
  DBDateTimeEditEh2.Value := Now;
  Caption := 'Акт сверки';
end;

procedure TReportReviseForm.FormShow(Sender: TObject);
begin
  DBDateTimeEditEh1.SetFocus;
end;

procedure TReportReviseForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult = mrOk then
  try

    with ReportDataModule.DebtorQuery do
    begin
      SQL.Clear;
      SQL.Add('SELECT *');
      SQL.Add('FROM "Customer_Debtor"(''' + IntToStr(MainFirm) + ''', ''' + DateToStr(DBDateTimeEditEh1.Value - 1) + ''', ''' + IntToStr(0) + ''')');
      SQL.Add('WHERE "CustomerID" = ' + IntToStr(CurCustomerID));
      Open;
      if ReportDataModule.DebtorQuery['SumDebt'] <> Null then
        frVariables['frTopSumDebt'] := ReportDataModule.DebtorQuery['SumDebt']
      else
        frVariables['frTopSumDebt'] := 0;
      Close;
      SQL.Strings[1] := 'FROM "Customer_Debtor"(''' + IntToStr(MainFirm) + ''', ''' + DBDateTimeEditEh2.Text + ''', ''' + IntToStr(0) + ''')';
      Open;
      if ReportDataModule.DebtorQuery['SumDebt'] <> Null then
        frVariables['frBottomSumDebt'] := ReportDataModule.DebtorQuery['SumDebt']
      else
        frVariables['frBottomSumDebt'] := 0;
      Close;
    end;

    ReportDataModule.ReviseExpenseQuery.Close;
    ReportDataModule.ReviseReceiptQuery.Close;

    ReportDataModule.ReviseExpenseQuery.ParamByName('MainFirm').Value := MainFirm;
    ReportDataModule.ReviseReceiptQuery.ParamByName('MainFirm').Value := MainFirm;
    ReportDataModule.ReviseExpenseQuery.ParamByName('CustomerID').Value := CurCustomerID;
    ReportDataModule.ReviseReceiptQuery.ParamByName('CustomerID').Value := CurCustomerID;
    ReportDataModule.RevisePaymentQuery.ParamByName('MainFirm').Value := MainFirm;
    ReportDataModule.RevisePaymentQuery.ParamByName('CustomerID').Value := CurCustomerID;

    ReportDataModule.ReviseExpenseQuery.ParamByName('TopDate').Value := DBDateTimeEditEh1.Value;
    ReportDataModule.ReviseExpenseQuery.ParamByName('BottomDate').Value := DBDateTimeEditEh2.Value;
    ReportDataModule.ReviseReceiptQuery.ParamByName('TopDate').Value := DBDateTimeEditEh1.Value;
    ReportDataModule.ReviseReceiptQuery.ParamByName('BottomDate').Value := DBDateTimeEditEh2.Value;
    ReportDataModule.RevisePaymentQuery.ParamByName('TopDate').Value := DBDateTimeEditEh1.Value;
    ReportDataModule.RevisePaymentQuery.ParamByName('BottomDate').Value := DBDateTimeEditEh2.Value;

    frVariables['frTopDate'] := DBDateTimeEditEh1.Value;
    frVariables['frBottomDate'] := DBDateTimeEditEh2.Value;

    ReportDataModule.ReviseExpenseQuery.Open;
    ReportDataModule.ReviseReceiptQuery.Open;
    ReportDataModule.RevisePaymentQuery.Open;

    frReport1.Clear;
    frReport1.LoadFromFile('Reports\ReportReviseExpense.frf');
    frReport2.Clear;
    frReport2.LoadFromFile('Reports\ReportReviseReceipt.frf');
    frReport3.Clear;
    frReport3.LoadFromFile('Reports\ReportRevisePayment.frf');
    frCompositeReport1.Reports.Clear;
    frCompositeReport1.Reports.Add(frReport1);
    frCompositeReport1.Reports.Add(frReport2);
    frCompositeReport1.Reports.Add(frReport3);
    frCompositeReport1.ShowReport;
    frReport1.Clear;
    frReport2.Clear;
    frReport3.Clear;
    frCompositeReport1.Clear;

  finally
    with ReportDataModule.DebtorQuery do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT *');
      SQL.Add('FROM "Customer_Debtor"(:MainFirm, ''Now'', ''0'')');
      SQL.Add('');
      SQL.Add('ORDER BY "CustomerName"');
    end;
  end;
  ReportDataModule.ReviseExpenseQuery.Close;
  ReportDataModule.ReviseReceiptQuery.Close;
  ReportDataModule.RevisePaymentQuery.Close;
  StoreDataModule.ReportFirmQuery.Close;
  StoreDataModule.CustomerSelectQuery.Close;
  Release;
end;

procedure TReportReviseForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TReportReviseForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TReportReviseForm.DBEditEh2EditButtons0Click(
  Sender: TObject; var Handled: Boolean);
begin
  CurCustomerID := StoreDataModule.CustomerSelectQuery['CustomerID'];
  CustomerSelectForm := TCustomerSelectForm.Create(Self);
  CustomerSelectForm.ShowModal;
  if StoreDataModule.CustomerSelectQuery.Active = False then
    StoreDataModule.CustomerSelectQuery.Open;
  if CustomerSelectForm.ModalResult = mrOK then
    StoreDataModule.CustomerSelectQuery.Locate('CustomerID', CurCustomerID, []);
end;

procedure TReportReviseForm.DBEditEh2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBEditEh2EditButtons0Click(Self, h);
end;

procedure TReportReviseForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    if not (DBDateTimeEditEh1.CalendarVisible or DBDateTimeEditEh2.CalendarVisible) then
    SelectNext(ActiveControl As TWinControl, True, True);
end;

end.
