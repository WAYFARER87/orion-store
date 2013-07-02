unit ReportCirculateSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, DBCtrlsEh,
  DateUtils;

type
  TReportCirculateSelectForm = class(TForm)
    CancelButton: TButton;
    OKButton: TButton;
    Bevel1: TBevel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBDateTimeEditEh2: TDBDateTimeEditEh;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReportCirculateSelectForm: TReportCirculateSelectForm;

implementation

uses StoreDM, ReportDM;

{$R *.dfm}

procedure TReportCirculateSelectForm.FormCreate(Sender: TObject);
begin
  DBDateTimeEditEh1.Value := StartOfAMonth(YearOf(Now), MonthOf(Now));
  DBDateTimeEditEh2.Value := EndOfAMonth(YearOf(Now), MonthOf(Now));
  Caption := 'Выбор периода';
end;

procedure TReportCirculateSelectForm.FormShow(Sender: TObject);
begin
  DBDateTimeEditEh1.SetFocus;
end;

procedure TReportCirculateSelectForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult = mrOk then
  begin
    ReportTopDate := DBDateTimeEditEh1.Value;
    ReportBottomDate := DBDateTimeEditEh2.Value;
  end;
  Release;
end;

procedure TReportCirculateSelectForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TReportCirculateSelectForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TReportCirculateSelectForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    SelectNext(ActiveControl As TWinControl, True, True);
end;

end.
