unit ReportDebtorPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, FR_DSet, FR_DBSet, FR_Class, Mask, DBCtrlsEh,
  DBLookupEh, Grids, DBGridEh;

type
  TReportDebtorPrintForm = class(TForm)
    CancelButton: TButton;
    OKButton: TButton;
    Bevel1: TBevel;
    CheckBox1: TCheckBox;
    frReport1: TfrReport;
    DebtorDBDataSet: TfrDBDataSet;
    DebtorOrderDBDataSet: TfrDBDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReportDebtorPrintForm: TReportDebtorPrintForm;

implementation

uses StoreDM, ReportDM;

{$R *.dfm}

procedure TReportDebtorPrintForm.FormCreate(Sender: TObject);
begin
  StoreDataModule.ReportFirmQuery.ParamByName('MainFirm').Value := MainFirm;
  StoreDataModule.ReportFirmQuery.Open;
  Caption := 'Отчет по должникам';
end;

procedure TReportDebtorPrintForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult = mrOk then
  begin
    frVariables['frWorkDate'] := WorkDate;
    frReport1.Clear;
    if CheckBox1.Checked then
      frReport1.LoadFromFile('Reports\ReportDebtorUnroll.frf')
    else
      frReport1.LoadFromFile('Reports\ReportDebtor.frf');
    frReport1.ShowReport;
    frReport1.Clear;
  end;
  Release;
end;

procedure TReportDebtorPrintForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TReportDebtorPrintForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TReportDebtorPrintForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    OKButton.Click;
end;

end.
