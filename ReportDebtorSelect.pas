unit ReportDebtorSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, DBCtrlsEh;

type
  TReportDebtorSelectForm = class(TForm)
    CancelButton: TButton;
    OKButton: TButton;
    Bevel1: TBevel;
    CheckBox1: TCheckBox;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    Label1: TLabel;
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
  ReportDebtorSelectForm: TReportDebtorSelectForm;

implementation

uses StoreDM, ReportDM;

{$R *.dfm}

procedure TReportDebtorSelectForm.FormCreate(Sender: TObject);
begin
  DBDateTimeEditEh1.Value := Now;
  Caption := 'Выбор';
end;

procedure TReportDebtorSelectForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult = mrOk then
  begin
    WorkDate := DBDateTimeEditEh1.Value;
    if CheckBox1.Checked then
      Arrear := 1
    else
      Arrear := 0;
  end;
  Release;
end;

procedure TReportDebtorSelectForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TReportDebtorSelectForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TReportDebtorSelectForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    SelectNext(ActiveControl As TWinControl, True, True);
end;

end.
