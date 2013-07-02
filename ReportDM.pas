unit ReportDM;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, IBDatabase, IBStoredProc;

type
  TReportDataModule = class(TDataModule)
    PriceListQuery: TIBQuery;
    ProductStoreQuery: TIBQuery;
    ProductStoreQueryMeasureName: TIBStringField;
    ProductStoreQueryCountryName: TIBStringField;
    ProductStoreQueryCCDName: TIBStringField;
    DebtorQuery: TIBQuery;
    DebtorDataSource: TDataSource;
    DebtorOrderQuery: TIBQuery;
    DebtorOrderDataSource: TDataSource;
    CashBookDataSet: TIBDataSet;
    CashBookDataSource: TDataSource;
    CashBookDataSetPageID: TIntegerField;
    CashBookDataSetFirmID: TIntegerField;
    CashBookDataSetNumber: TIntegerField;
    CashBookDataSetDate: TDateField;
    CashBookDataSetInitialAmount: TIBBCDField;
    CashBookDataSetFinalAmount: TIBBCDField;
    CashBookTransaction: TIBTransaction;
    CashBookItemQuery: TIBQuery;
    CashBookItemDataSource: TDataSource;
    CashBookItemQueryDate: TDateField;
    CashBookItemQueryNumber: TIBStringField;
    CashBookItemQueryDebit: TIntegerField;
    CashBookItemQueryTotalPay: TIBBCDField;
    CashBookItemQueryCustomerName: TIBStringField;
    CashBookItemQueryReceipt: TFloatField;
    CashBookItemQueryExpense: TFloatField;
    CashBookItemQueryType: TSmallintField;
    DebtorQueryCustomerID: TIntegerField;
    DebtorQueryCustomerName: TIBStringField;
    DebtorQueryInitialDebt: TIBBCDField;
    DebtorQuerySumDebt: TIBBCDField;
    CirculateQuery: TIBQuery;
    CirculateTransaction: TIBTransaction;
    CirculateDataSource: TDataSource;
    CirculateQueryStoreID: TIntegerField;
    CirculateQueryProductID: TIntegerField;
    CirculateQueryAccountPrice: TIBBCDField;
    CirculateQueryProductFullName: TIBStringField;
    CirculateQueryDivisionID: TIntegerField;
    CirculateQueryTopQty: TIBBCDField;
    CirculateQueryTopAmount: TIBBCDField;
    CirculateQueryReceiptQty: TIBBCDField;
    CirculateQueryReceiptAmount: TIBBCDField;
    CirculateQueryExpenseQty: TIBBCDField;
    CirculateQueryExpenseAmount: TIBBCDField;
    CirculateQueryBottomQty: TIBBCDField;
    CirculateQueryBottomAmount: TIBBCDField;
    QtyDateStoredProc: TIBStoredProc;
    QtyDateTransaction: TIBTransaction;
    DateQuery: TIBQuery;
    DateQueryDate: TDateField;
    RemainsQuery: TIBQuery;
    RemainsTransaction: TIBTransaction;
    CategoryDataSource: TDataSource;
    RemainsQueryStoreID: TIntegerField;
    RemainsQueryProductID: TIntegerField;
    RemainsQueryCategoryID: TIntegerField;
    RemainsQueryProductFullName: TIBStringField;
    RemainsQueryPack: TSmallintField;
    RemainsQueryPrice: TIBBCDField;
    RemainsQueryTallyQty: TIBBCDField;
    RemainsQueryTallyAmount: TIBBCDField;
    CategoryQuery: TIBQuery;
    CategoryQueryCategoryID: TIntegerField;
    CategoryQueryCategoryName: TIBStringField;
    CategoryQueryGroupID: TIntegerField;
    RemainsQueryMeasureName: TIBStringField;
    CommodityExpenseQuery: TIBQuery;
    CommodityExpenseQueryCustomerName: TIBStringField;
    CommodityExpenseQueryDate: TDateField;
    CommodityExpenseQueryProperID: TIntegerField;
    CommodityReceiptQuery: TIBQuery;
    IBStringField1: TIBStringField;
    DateField1: TDateField;
    IntegerField2: TIntegerField;
    CommodityExpenseQueryOutAmount: TIBBCDField;
    CommodityExpenseQueryOutAmountVAT: TIBBCDField;
    CommodityReceiptQueryInAmount: TIBBCDField;
    CommodityReceiptQueryInAmountVAT: TIBBCDField;
    CommodityPaymentQuery: TIBQuery;
    CommodityPaymentQueryCustomerName: TIBStringField;
    CommodityPaymentQueryDate: TDateField;
    CommodityPaymentQueryNumber: TIBStringField;
    CommodityPaymentQueryCash: TSmallintField;
    CommodityPaymentQueryPayDate: TDateField;
    CommodityExpenseQueryNumber: TIBStringField;
    CommodityReceiptQueryNumber: TIBStringField;
    CommodityPaymentQueryPay: TIBBCDField;
    CommodityExpenseQueryPayDate: TDateField;
    CommodityPaymentQueryProperID: TIntegerField;
    ReviseExpenseQuery: TIBQuery;
    ReviseReceiptQuery: TIBQuery;
    RevisePaymentQuery: TIBQuery;
    DateField5: TDateField;
    IBStringField7: TIBStringField;
    IntegerField4: TIntegerField;
    DateField6: TDateField;
    IBBCDField5: TIBBCDField;
    SmallintField1: TSmallintField;
    ReviseExpenseQueryDate: TDateField;
    ReviseExpenseQueryNumber: TIBStringField;
    ReviseExpenseQueryPayDate: TDateField;
    ReviseExpenseQueryTotalAmount: TIBBCDField;
    ReviseExpenseQueryPay: TIBBCDField;
    ReviseExpenseQueryProperID: TIntegerField;
    ReviseReceiptQueryDate: TDateField;
    ReviseReceiptQueryNumber: TIBStringField;
    ReviseReceiptQueryTotalAmount: TIBBCDField;
    ReviseReceiptQueryPay: TIBBCDField;
    ReviseReceiptQueryProperID: TIntegerField;
    ReviseExpenseQueryDivisionName: TIBStringField;
    ReviseReceiptQueryDivisionName: TIBStringField;
    ReviseReceiptQueryPayDate: TDateField;
    RevisePaymentQueryType: TSmallintField;
    DebtorOrderQueryOrderID: TIntegerField;
    DebtorOrderQueryDate: TDateField;
    DebtorOrderQueryNumber: TIBStringField;
    DebtorOrderQueryCustomerID: TIntegerField;
    DebtorOrderQueryTotalAmount: TIBBCDField;
    DebtorOrderQueryPayDate: TDateField;
    DebtorOrderQueryPay: TIBBCDField;
    DebtorOrderQueryDebt: TIBBCDField;
    DebtorOrderQueryProperID: TIntegerField;
    CommodityReceiptQueryPayDate: TDateField;
    ProductStoreQueryCertificateName: TIBStringField;
    procedure CashBookItemQueryCalcFields(DataSet: TDataSet);
    procedure CirculateQueryBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReportDataModule: TReportDataModule;

//Переменные
  WorkDate: String;
  Arrear: Integer;
  ReportTopDate: String;
  ReportBottomDate: String;

implementation

uses StoreDM;

{$R *.dfm}

procedure TReportDataModule.CashBookItemQueryCalcFields(DataSet: TDataSet);
begin
  if CashBookItemQuery['Type'] = -1 then
    CashBookItemQuery['Receipt'] := CashBookItemQuery['TotalPay'];
  if CashBookItemQuery['Type'] = 1 then
    CashBookItemQuery['Expense'] := CashBookItemQuery['TotalPay'];
end;

procedure TReportDataModule.CirculateQueryBeforeOpen(DataSet: TDataSet);
begin
  CirculateQuery.ParamByName('MainFirm').Value := MainFirm;
end;

end.
