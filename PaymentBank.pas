unit PaymentBank;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh,
  DB, ComCtrls, ToolWin;

type
  TPaymentBankForm = class(TForm)
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    CloseButton: TButton;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    InsertButton: TToolButton;
    EditButton: TToolButton;
    DeleteButton: TToolButton;
    ToolButton2: TToolButton;
    Edit1: TEdit;
    ToolButton3: TToolButton;
    RefreshButton: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CloseButtonClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure InsertButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PaymentBankForm: TPaymentBankForm;

implementation

uses StoreDM, PaymentBankItem;

{$R *.dfm}

procedure TPaymentBankForm.FormCreate(Sender: TObject);
begin
  CloseButton.Left := Panel1.Width - CloseButton.Width - 10;
  with StoreDataModule do
  begin
    PaymentBankTransaction.Active := True;
    PaymentBankDataSet.ParamByName('MainFirm').Value := MainFirm;
    PaymentBankDataSet.Open;
    PayOrderBankDataSet.Open;
  end;
  Caption := 'Оплата через Банк (' + TopDate + '-' + BottomDate + ')';
end;

procedure TPaymentBankForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CurPaymentID := 0;
  if StoreDataModule.PaymentBankTransaction.InTransaction then
    StoreDataModule.PaymentBankTransaction.Commit;
  StoreDataModule.PaymentBankDataSet.Close;
  StoreDataModule.PaymentBankDataSet.SelectSQL.Strings[4] := '';
  StoreDataModule.PayOrderBankDataSet.Close;
// Удаление формы при ее закрытии
  PaymentBankForm := nil;
  Action          := caFree;
end;

procedure TPaymentBankForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TPaymentBankForm.Edit1Change(Sender: TObject);
var
  Find : String;
begin
  Find := AnsiUpperCase(Edit1.Text);
  with StoreDataModule.PaymentBankDataSet do
  begin
    Close;
    SelectSQL.Strings[4] := 'AND (UPPER("CustomerName") CONTAINING ''' + Find + ''')';
    Open;
  end;
end;

procedure TPaymentBankForm.InsertButtonClick(Sender: TObject);
begin
  StoreDataModule.PaymentBankDataSet.Append;
  StoreDataModule.PaymentBankDataSet['Cash'] := 0;
  StoreDataModule.PaymentBankDataSet['Date'] := Now;
  StoreDataModule.PaymentBankDataSet['FirmID'] := MainFirm;
  PaymentBankItemForm := TPaymentBankItemForm.Create(Self);
  PaymentBankItemForm.ShowModal;
end;

procedure TPaymentBankForm.EditButtonClick(Sender: TObject);
begin
  StoreDataModule.PaymentBankDataSet.Edit;
  PaymentBankItemForm := TPaymentBankItemForm.Create(Self);
  PaymentBankItemForm.ShowModal;
end;

procedure TPaymentBankForm.DeleteButtonClick(Sender: TObject);
var
  PayStr: String;
begin
  PayStr := StoreDataModule.PaymentBankDataSet.FieldByName('CustomerName').AsString;
  if Application.MessageBox(PChar('Вы действительно хотите удалить запись оплаты "' +
    PayStr + '"?'),
    'Удаление записи',
    mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
  try
    StoreDataModule.PaymentBankDataSet.Delete;
    StoreDataModule.PaymentBankTransaction.CommitRetaining;
  except
    Application.MessageBox(PChar('Запись "' + PayStr + '" удалять нельзя.'),
      'Ошибка удаления', mb_IconStop);
  end;
end;

procedure TPaymentBankForm.RefreshButtonClick(Sender: TObject);
begin
  StoreDataModule.PaymentBankDataSet.Close;
  StoreDataModule.PaymentBankDataSet.Open;
  Caption := 'Оплата через Банк (' + TopDate + '-' + BottomDate + ')';
end;

procedure TPaymentBankForm.DBGridEh1DblClick(Sender: TObject);
begin
  EditButton.Click;
end;

procedure TPaymentBankForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F2 : InsertButton.Click;
    VK_F3 : EditButton.Click;
    VK_F8 : DeleteButton.Click;
    VK_F4 : Edit1.SetFocus;
    VK_F5 : RefreshButton.Click;
  end;
end;

end.
