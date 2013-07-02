unit FirmSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh,
  DB;

type
  TFirmSelectForm = class(TForm)
    Panel1: TPanel;
    CancelButton: TButton;
    OKButton: TButton;
    DBGridEh1: TDBGridEh;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FirmSelectForm: TFirmSelectForm;

implementation

uses StoreDM, Options;

var
  OldFirmID : Integer;

{$R *.dfm}

procedure TFirmSelectForm.FormCreate(Sender: TObject);
begin
  OldFirmID := StoreDataModule.FirmSelectQuery.FieldByName('CustomerID').AsInteger;
  Caption := 'Выбор Фирмы';
end;

procedure TFirmSelectForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with StoreDataModule.FirmSelectQuery do
  begin
    if ModalResult = mrOk then
      Locate('CustomerID', FieldByName('CustomerID').AsInteger, [])
    else
      Locate('CustomerID', OldFirmID, []);
  end;
  Release;
end;

procedure TFirmSelectForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFirmSelectForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFirmSelectForm.DBGridEh1DblClick(Sender: TObject);
begin
  OKButton.Click;
end;

procedure TFirmSelectForm.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    OKButton.Click;
end;

end.
