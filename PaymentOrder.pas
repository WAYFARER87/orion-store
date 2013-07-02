unit PaymentOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh,
  DB, ComCtrls, ToolWin, FR_Class, MString;

type
  TPaymentOrderForm = class(TForm)
    Panel1: TPanel;
    CancelButton: TButton;
    DBGridEh1: TDBGridEh;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    InsertButton: TToolButton;
    EditButton: TToolButton;
    DeleteButton: TToolButton;
    ToolButton2: TToolButton;
    Edit1: TEdit;
    ToolButton3: TToolButton;
    PrintButton: TToolButton;
    frReport1: TfrReport;
    procedure EnabledButtons;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure InsertButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PaymentOrderForm: TPaymentOrderForm;

implementation

uses StoreDM, PaymentOrderItem;

{$R *.dfm}

procedure TPaymentOrderForm.EnabledButtons;
begin
//  Если записей нету, то Деактивируем кнопки "Редактировать" и "Удалить",
//  а если есть, Активируем.
  if StoreDataModule.PaymentOrderDataSet.IsEmpty then
  begin
    EditButton.Enabled := False;
    DeleteButton.Enabled := False;
    PrintButton.Enabled := False
  end
  else
  begin
    EditButton.Enabled := True;
    DeleteButton.Enabled := True;
    PrintButton.Enabled := True
  end;
//  Если это приходная накладная, то отключаем кнопку "Печать ПКО"
  if CurProperID = 0 then
    PrintButton.Visible := False;
end;

procedure TPaymentOrderForm.FormCreate(Sender: TObject);
begin
  with StoreDataModule do
  begin
    PaymentOrderTransaction.Active := True;
    case CurProperID of
      0 : PaymentOrderDataSet.ParamByName('OrderID').Value := BuyOrderDataSet['OrderID'];
      1, 2 : PaymentOrderDataSet.ParamByName('OrderID').Value := SaleOrderDataSet['OrderID'];
    end;
    PaymentOrderDataSet.Open;
  end;
  EnabledButtons;
  Caption := 'Оплата по Накладной';
end;

procedure TPaymentOrderForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  StoreDataModule.PaymentOrderDataSet.Close;
  Release;
end;

procedure TPaymentOrderForm.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TPaymentOrderForm.InsertButtonClick(Sender: TObject);
begin
  with StoreDataModule do
  begin
    PaymentOrderDataSet.Append;
    PaymentOrderDataSet['Date'] := Now;
    PaymentOrderDataSet['FirmID'] := MainFirm;
    PaymentOrderDataSet['Cash'] := 1;
    case CurProperID of
    0 : begin
          PaymentOrderDataSet['OrderID'] := BuyOrderDataSet['OrderID'];
          PaymentOrderDataSet['CustomerID'] := BuyOrderDataSet['CustomerID'];
          PaymentOrderDataSet['CustomerName'] := BuyOrderDataSet['CustomerName'];
          PaymentOrderDataSet['TotalPay'] := BuyOrderDataSet['Debt'];
          PaymentOrderDataSet['Type'] := 1;
        end;
    1 : begin
          PaymentOrderDataSet['OrderID'] := SaleOrderDataSet['OrderID'];
          PaymentOrderDataSet['CustomerID'] := SaleOrderDataSet['CustomerID'];
          PaymentOrderDataSet['CustomerName'] := SaleOrderDataSet['CustomerName'];
          PaymentOrderDataSet['TotalPay'] := SaleOrderDataSet['Debt'];
          PaymentOrderDataSet['Type'] := -1;
        end;
    end;
  end;
  PaymentOrderItemForm := TPaymentOrderItemForm.Create(Self);
  PaymentOrderItemForm.ShowModal;

  EnabledButtons;
end;

procedure TPaymentOrderForm.EditButtonClick(Sender: TObject);
begin
  StoreDataModule.PaymentOrderDataSet.Edit;
  PaymentOrderItemForm := TPaymentOrderItemForm.Create(Self);
  PaymentOrderItemForm.ShowModal;
end;

procedure TPaymentOrderForm.DeleteButtonClick(Sender: TObject);
var
  PaymentOrderStr: String;
begin
  PaymentOrderStr := StoreDataModule.PaymentOrderDataSet['PaymentID'];
  if Application.MessageBox(PChar('Вы действительно хотите удалить запись"' +
    PaymentOrderStr + '"?'),
    'Удаление записи',
    mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
  try
    StoreDataModule.PaymentOrderDataSet.Delete;
    StoreDataModule.PaymentOrderTransaction.CommitRetaining;
    EnabledButtons;
  except
    Application.MessageBox(PChar('Запись "' + PaymentOrderStr + '" удалять нельзя.'),
      'Ошибка удаления', mb_IconStop);
  end;
end;

procedure TPaymentOrderForm.PrintButtonClick(Sender: TObject);
begin
  frReport1.Clear;
  with StoreDataModule do
  begin
    ReportFirmQuery.ParamByName('MainFirm').Value := MainFirm;
    ReportCustomerQuery.ParamByName('CustomerID').Value := PaymentOrderDataSet['CustomerID'];
    frVariables['frPayStr'] := MoneyStr(PaymentOrderDataSet['TotalPay']);
    frVariables['frShortPayStr'] := ShortMoneyStr(PaymentOrderDataSet['TotalPay']);
    frVariables['frVATStr'] := 'НДС - ' + ShortMoneyStr(PaymentOrderDataSet['TotalPay'] / SaleOrderDataSet['TotalAmount'] * SaleOrderDataSet['TotalAmountVAT']);
  end;
  frReport1.LoadFromFile('Reports\PayOrder.frf');
  frReport1.ShowReport;
  frReport1.Clear;
end;

procedure TPaymentOrderForm.DBGridEh1DblClick(Sender: TObject);
begin
  EditButton.Click;
end;

procedure TPaymentOrderForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F2 : InsertButton.Click;
    VK_F3 : EditButton.Click;
    VK_F8 : DeleteButton.Click;
    VK_F4 : Edit1.SetFocus;
    VK_F10 : PrintButton.Click;
  end;
end;

end.
