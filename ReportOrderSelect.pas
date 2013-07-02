unit ReportOrderSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh;

type
  TReportOrderSelectForm = class(TForm)
    Panel1: TPanel;
    CancelButton: TButton;
    OKButton: TButton;
    DBGridEh1: TDBGridEh;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReportOrderSelectForm: TReportOrderSelectForm;

implementation

uses StoreDM;

{$R *.dfm}

procedure TReportOrderSelectForm.FormCreate(Sender: TObject);
begin
  Caption := 'Выбор Накладной';
end;

procedure TReportOrderSelectForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ReportOrderSelectForm.ModalResult = mrOk then
    CurOrderID := StoreDataModule.ReportOrderQuery['OrderID'];
  Release;
end;

procedure TReportOrderSelectForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TReportOrderSelectForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TReportOrderSelectForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    OKButton.Click;
end;

end.
