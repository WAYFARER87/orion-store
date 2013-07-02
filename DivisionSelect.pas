unit DivisionSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh,
  DB;

type
  TDivisionSelectForm = class(TForm)
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
  DivisionSelectForm: TDivisionSelectForm;

implementation

uses StoreDM;

{$R *.dfm}

procedure TDivisionSelectForm.FormCreate(Sender: TObject);
begin
  if StoreDataModule.DivisionSelectQuery.Active = False then
    StoreDataModule.DivisionSelectQuery.Open;
  Caption := 'Выбор подразделения';
end;

procedure TDivisionSelectForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult = mrOK then
  begin
    CurDivisionID := StoreDataModule.DivisionSelectQuery['DivisionID'];
    CurDivisionName := StoreDataModule.DivisionSelectQuery['DivisionName'];
  end;
  StoreDataModule.DivisionSelectQuery.Close;
  Release;
end;

procedure TDivisionSelectForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TDivisionSelectForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TDivisionSelectForm.DBGridEh1DblClick(Sender: TObject);
begin
  OKButton.Click;
end;

procedure TDivisionSelectForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    OKButton.Click;
end;

end.
