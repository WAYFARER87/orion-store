unit PrintOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, FR_Class, FR_DSet, FR_DBSet, FR_Desgn,
  MString;

type
  TPrintOrderForm = class(TForm)
    CancelButton: TButton;
    PrintButton: TButton;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    RadioGroup1: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrintOrderForm: TPrintOrderForm;

implementation

uses StoreDM, PaymentOrder;

{$R *.dfm}

procedure TPrintOrderForm.FormCreate(Sender: TObject);
var
  FullAmountStr : String;
begin
  if StoreDataModule.SaleOrderDataSet['ProperID'] = 1 then
  begin
    RadioGroup1.Items.Add('Накладная');
    RadioGroup1.Items.Add('Счет-фактура');
    RadioGroup1.Items.Add('Сертификаты');
    RadioGroup1.Items.Add('Счет на оплату');
  end
  else
    RadioGroup1.Items.Add('Товарный чек');
  RadioGroup1.ItemIndex := 0;
  FullAmountStr := MoneyStr(StoreDataModule.SaleOrderDataSet['TotalAmount']);
  StoreDataModule.ReportFirmQuery.ParamByName('MainFirm').Value := MainFirm;
  StoreDataModule.ReportCustomerQuery.ParamByName('CustomerID').Value := StoreDataModule.SaleOrderDataSet['CustomerID'];
  with StoreDataModule.GroupVATQuery do
  begin
    Open;
    First;
    while not EOF do
    begin
      FullAmountStr := FullAmountStr + ', ';
      if RecNo = 1 then
        FullAmountStr := FullAmountStr + 'в том числе ';
      FullAmountStr := FullAmountStr + 'НДС ' + FloatToStr(FieldByName('VATRate').Value) + '% - ' + ShortMoneyStr(FieldByName('SUM').Value);
      Next;
    end;
  end;
  frVariables['frFullAmountStr'] := FullAmountStr;
  frVariables['frAmountStr'] := MoneyStr(StoreDataModule.SaleOrderDataSet['TotalAmount']);
  frVariables['frShortAmountStr'] := ShortMoneyStr(StoreDataModule.SaleOrderDataSet['TotalAmount']);
  Caption := 'Печать';
end;

procedure TPrintOrderForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  StoreDataModule.ReportFirmQuery.Close;
  StoreDataModule.ReportCustomerQuery.Close;
  StoreDataModule.GroupVATQuery.Close;
  StoreDataModule.PaymentOrderDataSet.Close;
  Release;
end;

procedure TPrintOrderForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TPrintOrderForm.PrintButtonClick(Sender: TObject);
begin
  frReport1.Clear;
  if StoreDataModule.SaleOrderDataSet['ProperID'] = 2 then
    frReport1.LoadFromFile('Reports\Cheque.frf') //Товарный чек
  else
  begin
    case RadioGroup1.ItemIndex of
      0: frReport1.LoadFromFile('Reports\Invoice.frf'); //Накладная
      1: frReport1.LoadFromFile('Reports\Order.frf'); //Счет-фактура
      2: frReport1.LoadFromFile('Reports\Certificates.frf'); //Сертификаты
      3: frReport1.LoadFromFile('Reports\Bill.frf'); //Счет на оплату
    end;
  end;
  frReport1.ShowReport;
  frReport1.Clear;
end;

end.
