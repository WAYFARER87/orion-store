unit ReportCashBookDateSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, DBCtrlsEh;

type
  TReportCashBookDateSelectForm = class(TForm)
    CancelButton: TButton;
    OKButton: TButton;
    Bevel1: TBevel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
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
  ReportCashBookDateSelectForm: TReportCashBookDateSelectForm;

implementation

uses ReportDM;

{$R *.dfm}

procedure TReportCashBookDateSelectForm.FormCreate(Sender: TObject);
begin
  DBDateTimeEditEh1.Value := Now;
  Caption := 'Выбор даты';
end;

procedure TReportCashBookDateSelectForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult = mrOk then
  begin
    ReportDataModule.CashBookDataSet['Date'] := DBDateTimeEditEh1.Value;
  end;
  Release;
end;

procedure TReportCashBookDateSelectForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TReportCashBookDateSelectForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TReportCashBookDateSelectForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    OKButton.Click;
end;

end.
