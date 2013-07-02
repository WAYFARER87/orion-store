unit VATRate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh,
  DB, ComCtrls, ToolWin;

type
  TVATRateForm = class(TForm)
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    OKButton: TButton;
    CancelButton: TButton;
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
  VATRateForm: TVATRateForm;
  CustomerID : String;

implementation

uses StoreDM, VATItem;

{$R *.dfm}

procedure TVATRateForm.FormCreate(Sender: TObject);
begin
  StoreDataModule.VATRateQuery.Open;
  StoreDataModule.VATRateQuery.Locate('VATRateID', StoreDataModule.VATDataSet['VATRateID'], []);
  Caption := 'Стаки НДС';
end;

procedure TVATRateForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult = mrOk then
  with StoreDataModule.GroupDataSet do
  begin
    CurVATRateID := StoreDataModule.VATRateQuery['VATRateID'];
    CurVATRateName := StoreDataModule.VATRateQuery['VATRateName'];
    CurVATRate := StoreDataModule.VATRateQuery['VATRate'];
  end;
  StoreDataModule.VATRateQuery.Close;
  Release;
end;

procedure TVATRateForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TVATRateForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TVATRateForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    OKButton.Click;
end;

end.
