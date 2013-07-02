unit PaymentCash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh,
  DB, ComCtrls, ToolWin;

type
  TPaymentCashForm = class(TForm)
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
  PaymentCashForm: TPaymentCashForm;

implementation

uses StoreDM, PaymentCashItem;

{$R *.dfm}

procedure TPaymentCashForm.FormCreate(Sender: TObject);
begin
  CloseButton.Left := Panel1.Width - CloseButton.Width - 10;
  with StoreDataModule do
  begin
    PaymentCashTransaction.Active := True;
    PaymentCashDataSet.ParamByName('MainFirm').Value := MainFirm;
    PaymentCashDataSet.Open;
    PayOrderCashDataSet.Open;
  end;
  Caption := 'Оплата через Кассу (' + TopDate + '-' + BottomDate + ')';
end;

procedure TPaymentCashForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CurPaymentID := 0;
  if StoreDataModule.PaymentCashTransaction.InTransaction then
    StoreDataModule.PaymentCashTransaction.Commit;
  StoreDataModule.PaymentCashDataSet.Close;
  StoreDataModule.PaymentCashDataSet.SelectSQL.Strings[4] := '';
  StoreDataModule.PayOrderCashDataSet.Close;
// Удаление формы при ее закрытии
  PaymentCashForm := nil;
  Action          := caFree;
end;

procedure TPaymentCashForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TPaymentCashForm.Edit1Change(Sender: TObject);
var
  Find : String;
begin
  Find := AnsiUpperCase(Edit1.Text);
  with StoreDataModule.PaymentCashDataSet do
  begin
    Close;
    SelectSQL.Strings[4] := 'AND (UPPER("CustomerName") CONTAINING ''' + Find + ''')';
    Open;
  end;
end;

procedure TPaymentCashForm.InsertButtonClick(Sender: TObject);
begin
  StoreDataModule.PaymentCashDataSet.Append;
  StoreDataModule.PaymentCashDataSet['Cash'] := 1;
  StoreDataModule.PaymentCashDataSet['Date'] := Now;
  StoreDataModule.PaymentCashDataSet['FirmID'] := MainFirm;
  PaymentCashItemForm := TPaymentCashItemForm.Create(Self);
  PaymentCashItemForm.ShowModal;
end;

procedure TPaymentCashForm.EditButtonClick(Sender: TObject);
begin
  StoreDataModule.PaymentCashDataSet.Edit;
  PaymentCashItemForm := TPaymentCashItemForm.Create(Self);
  PaymentCashItemForm.ShowModal;
end;

procedure TPaymentCashForm.DeleteButtonClick(Sender: TObject);
var
  PayStr: String;
begin
  PayStr := StoreDataModule.PaymentCashDataSet['CustomerName'];
  if Application.MessageBox(PChar('Вы действительно хотите удалить запись оплаты "' +
    PayStr + '"?'),
    'Удаление записи',
    mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
  try
    StoreDataModule.PaymentCashDataSet.Delete;
    StoreDataModule.PaymentCashTransaction.CommitRetaining;
  except
    Application.MessageBox(PChar('Запись "' + PayStr + '" удалять нельзя.'),
      'Ошибка удаления', mb_IconStop);
  end;
end;

procedure TPaymentCashForm.RefreshButtonClick(Sender: TObject);
begin
  StoreDataModule.PaymentCashDataSet.Close;
  StoreDataModule.PaymentCashDataSet.Open;
  Caption := 'Оплата через Кассу (' + TopDate + '-' + BottomDate + ')';
end;

procedure TPaymentCashForm.DBGridEh1DblClick(Sender: TObject);
begin
  EditButton.Click;
end;

procedure TPaymentCashForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F2 : InsertButton.Click;
    VK_F3 : EditButton.Click;
    VK_F8 : DeleteButton.Click;
    VK_F4 : Edit1.SetFocus;
  end;
end;

end.
