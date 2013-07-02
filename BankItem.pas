unit BankItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, ExtCtrls;

type
  TBankItemForm = class(TForm)
    OKButton: TButton;
    CancelButton: TButton;
    Bevel1: TBevel;
    DBEditEh1: TDBEditEh;
    DBEditEh2: TDBEditEh;
    DBEditEh3: TDBEditEh;
    DBEditEh4: TDBEditEh;
    DBEditEh5: TDBEditEh;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
  BankItemForm: TBankItemForm;

implementation

uses StoreDM;

{$R *.dfm}

procedure TBankItemForm.FormCreate(Sender: TObject);
begin
  CurBankID := StoreDataModule.BankDataSet['BankID'];
  Caption := StoreDataModule.BankDataSet.FieldByName('BankName').AsString;
end;

procedure TBankItemForm.FormShow(Sender: TObject);
begin
  DBEditEh2.SetFocus;
end;

procedure TBankItemForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with StoreDataModule do
  try
    if ModalResult = mrOk then
      BankDataSet.Post
    else
      BankDataSet.Cancel;
  except
    Application.MessageBox('Недопустимые значения данных',
      'Ошибка ввода', mb_IconStop);
    Abort;
  end;
  StoreDataModule.BankDataSet.Close;
  StoreDataModule.BankDataSet.Open;
  Release;
end;

procedure TBankItemForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TBankItemForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TBankItemForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    SelectNext(ActiveControl As TWinControl, True, True);
end;

end.
