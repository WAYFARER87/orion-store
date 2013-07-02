unit PayOrderSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh;

type
  TPayOrderSelectForm = class(TForm)
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
  PayOrderSelectForm: TPayOrderSelectForm;

implementation

uses StoreDM;

{$R *.dfm}

procedure TPayOrderSelectForm.FormCreate(Sender: TObject);
begin
  with StoreDataModule do
  begin
    PayOrderSelectQuery.Close;
    PayOrderSelectQuery.ParamByName('MainFirm').Value := MainFirm;
    PayOrderSelectQuery.Open;
  end;
  Caption := 'Выбор Накладной';
end;

procedure TPayOrderSelectForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with StoreDataModule do
  begin
    if PayOrderSelectForm.ModalResult = mrOk then
    begin
      CurOrderID := PayOrderSelectQuery['OrderID'];
      CurType := PayOrderSelectQuery['ProperID'];
      CurCustomerID := PayOrderSelectQuery['CustomerID'];
      CurCustomerName := PayOrderSelectQuery['CustomerName'];
      CurPay := PayOrderSelectQuery['Debt'];
    end;
    PayOrderSelectQuery.Close;
  end;
  Release;
end;

procedure TPayOrderSelectForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TPayOrderSelectForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TPayOrderSelectForm.DBGridEh1DblClick(Sender: TObject);
begin
  OKButton.Click;
end;

procedure TPayOrderSelectForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    OKButton.Click;
end;

end.
