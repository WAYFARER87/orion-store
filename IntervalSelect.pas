unit IntervalSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, DBCtrlsEh;

type
  TIntervalSelectForm = class(TForm)
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
  IntervalSelectForm: TIntervalSelectForm;

implementation

uses Main, StoreDM;

{$R *.dfm}

procedure TIntervalSelectForm.FormCreate(Sender: TObject);
begin
  DBDateTimeEditEh1.Value := TopDate;
  DBDateTimeEditEh2.Value := BottomDate;
  Caption := 'Выбор рабочего периода';
end;

procedure TIntervalSelectForm.FormShow(Sender: TObject);
begin
  DBDateTimeEditEh1.SetFocus;
end;

procedure TIntervalSelectForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult = mrOk then
  begin
    TopDate := DBDateTimeEditEh1.Value;
    BottomDate := DBDateTimeEditEh2.Value;
  end;
  Release;
end;

procedure TIntervalSelectForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TIntervalSelectForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TIntervalSelectForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    SelectNext(ActiveControl As TWinControl, True, True);
end;

end.
