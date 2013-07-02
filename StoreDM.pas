unit StoreDM;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBDatabase, IBQuery, ImgList,
  Controls, Variants, dialogs;

type
  TStoreDataModule = class(TDataModule)
    CustomerDataSource: TDataSource;
    CategoryDataSource: TDataSource;
    ProductDataSource: TDataSource;
    Database: TIBDatabase;
    CustomerDataSet: TIBDataSet;
    CategoryDataSet: TIBDataSet;
    ProductDataSet: TIBDataSet;
    CategoryTransaction: TIBTransaction;
    ProductTransaction: TIBTransaction;
    CategoryDataSetCategoryID: TIntegerField;
    CategoryDataSetCategoryName: TIBStringField;
    ProductDataSetCategoryID: TIntegerField;
    BuyOrderDataSet: TIBDataSet;
    BuyOrderTransaction: TIBTransaction;
    BuyOrderDataSource: TDataSource;
    BuyStructureDataSource: TDataSource;
    BuyOrderDataSetNumber: TIBStringField;
    BuyOrderDataSetIssueDate: TDateField;
    BuyOrderDataSetDebt: TIBBCDField;
    CustomerTransaction: TIBTransaction;
    StoreTransaction: TIBTransaction;
    StoreQtyDataSource: TDataSource;
    StoreProductDataSet: TIBDataSet;
    IntegerField2: TIntegerField;
    StoreProductDataSource: TDataSource;
    SaleStructureDataSet: TIBDataSet;
    SaleOrderTransaction: TIBTransaction;
    SaleOrderDataSource: TDataSource;
    SaleStructureDataSource: TDataSource;
    DivisionDataSet: TIBDataSet;
    DivisionDataSource: TDataSource;
    DivisionDataSetDivisionID: TIntegerField;
    DivisionDataSetDivisionName: TIBStringField;
    DivisionDataSetCustomerID: TIntegerField;
    BuyOrderDataSetPay: TIBBCDField;
    BuyOrderDataSetDate: TDateField;
    CustomerDataSetCustomerID: TIntegerField;
    OrderStoreQuery: TIBQuery;
    OrderStoreQueryCOUNT: TIntegerField;
    OrderStoreDataSource: TDataSource;
    PayOrderSelectQuery: TIBQuery;
    PayOrderSelectDataSource: TDataSource;
    CustomerSelectQuery: TIBQuery;
    CustomerSelectDataSource: TDataSource;
    ProductSelectQuery: TIBQuery;
    StoreSelectQuery: TIBQuery;
    ProductSelectDataSource: TDataSource;
    StoreSelectDataSource: TDataSource;
    DefaultTransaction: TIBTransaction;
    CustomerDataSetINN: TIBStringField;
    HomeOrderDataSet: TIBDataSet;
    HomeTransaction: TIBTransaction;
    HomeOrderDataSource: TDataSource;
    HomeOrderDataSetDate: TDateField;
    HomeOrderDataSetNumber: TIBStringField;
    HomeOrderDataSetPay: TIBBCDField;
    HomeStructureDataSource: TDataSource;
    DivisionSelectQuery: TIBQuery;
    DivisionSelectDataSource: TDataSource;
    DivisionSelectQueryDivisionID: TIntegerField;
    DivisionSelectQueryDivisionName: TIBStringField;
    CustomerDataSetAddress: TIBStringField;
    CustomerDataSetKPP: TIBStringField;
    CustomerDataSetRegistration: TIBStringField;
    CustomerDataSetBankID: TIntegerField;
    CustomerDataSetAccount: TIBStringField;
    BankDataSet: TIBDataSet;
    BankTransaction: TIBTransaction;
    BankDataSource: TDataSource;
    BankDataSetBankID: TIntegerField;
    BankDataSetAddress: TIBStringField;
    BankDataSetAccount: TIBStringField;
    VATDataSet: TIBDataSet;
    VATDataSource: TDataSource;
    VATDataSetCategoryID: TIntegerField;
    VATDataSetDate: TDateField;
    CategoryVATQuery: TIBQuery;
    CategoryVATDataSource: TDataSource;
    ProductDataSetProductID: TIntegerField;
    ProductDataSetProductName: TIBStringField;
    BuyOrderDataSetOrderID: TIntegerField;
    BuyOrderDataSetTotalAmount: TIBBCDField;
    StoreProductDataSetProductID: TIntegerField;
    StoreProductDataSetProductName: TIBStringField;
    HomeOrderDataSetOrderID: TIntegerField;
    HomeOrderDataSetTotalAmount: TIBBCDField;
    ProductSelectQueryProductID: TIntegerField;
    ProductDataSetMeasureID: TIntegerField;
    ProductDataSetProducerID: TIntegerField;
    StoreProductDataSetMeasureID: TIntegerField;
    StoreProductDataSetProducerID: TIntegerField;
    DivisionDataSetAddress: TIBStringField;
    DivisionSelectQueryAddress: TIBStringField;
    ProductDataSetDescription: TBlobField;
    DivisionSelectQueryCustomerID: TIntegerField;
    MeasureDataSet: TIBDataSet;
    MeasureTransaction: TIBTransaction;
    MeasureDataSource: TDataSource;
    MeasureDataSetMeasureID: TIntegerField;
    MeasureDataSetMeasureName: TIBStringField;
    ProducerDataSet: TIBDataSet;
    ProducerTransaction: TIBTransaction;
    ProducerDataSource: TDataSource;
    ProducerDataSetProducerID: TIntegerField;
    ProducerDataSetProducerName: TIBStringField;
    CountryDataSet: TIBDataSet;
    CountryTransaction: TIBTransaction;
    CountryDataSource: TDataSource;
    CountryDataSetCountryID: TIntegerField;
    CountryDataSetCountryName: TIBStringField;
    CCDDataSet: TIBDataSet;
    CCDTransaction: TIBTransaction;
    CCDDataSource: TDataSource;
    CCDDataSetCCDID: TIntegerField;
    CCDDataSetCCDName: TIBStringField;
    CertificateDataSet: TIBDataSet;
    CertificateTransaction: TIBTransaction;
    CertificateDataSource: TDataSource;
    CertificateDataSetCertificateID: TIntegerField;
    CertificateDataSetCertificateName: TIBStringField;
    PaymentOrderDataSet: TIBDataSet;
    IntegerField1: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField6: TIntegerField;
    SmallintField1: TSmallintField;
    PaymentOrderTransaction: TIBTransaction;
    PaymentOrderDataSource: TDataSource;
    BankDataSetBIC: TIBStringField;
    CustomerDataSetFirm: TSmallintField;
    FirmDataSet: TIBDataSet;
    IntegerField7: TIntegerField;
    IBStringField3: TIBStringField;
    IBStringField4: TIBStringField;
    IBStringField5: TIBStringField;
    IBStringField6: TIBStringField;
    IntegerField9: TIntegerField;
    IBStringField7: TIBStringField;
    SmallintField2: TSmallintField;
    FirmTransaction: TIBTransaction;
    FirmDataSource: TDataSource;
    ProductDataSetArticle: TIBStringField;
    FirmSelectQuery: TIBQuery;
    IntegerField10: TIntegerField;
    IBStringField8: TIBStringField;
    FirmSelectDataSource: TDataSource;
    CustomerDataSetPhone: TIBStringField;
    FirmDataSetPhone: TIBStringField;
    CustomerDataSetOKONH: TIBStringField;
    CustomerDataSetOKPO: TIBStringField;
    FirmDataSetOKONH: TIBStringField;
    FirmDataSetOKPO: TIBStringField;
    StoreProductDataSetArticle: TIBStringField;
    ProductSelectQueryArticle: TIBStringField;
    TypePriceDataSet: TIBDataSet;
    TypePriceTransaction: TIBTransaction;
    TypePriceDataSource: TDataSource;
    TypePriceDataSetPriceID: TIntegerField;
    TypePriceDataSetPriceName: TIBStringField;
    PriceDataSet: TIBDataSet;
    PriceTransaction: TIBTransaction;
    PriceDataSource: TDataSource;
    PriceDataSetStoreID: TIntegerField;
    PriceDataSetPriceID: TIntegerField;
    PriceDataSetPrice: TIBBCDField;
    PriceDataSetPriceName: TStringField;
    PriceSelectQuery: TIBQuery;
    PriceSelectDataSource: TDataSource;
    PriceSelectQueryStoreID: TIntegerField;
    PriceSelectQueryPriceID: TIntegerField;
    PriceSelectQueryPrice: TIBBCDField;
    PriceSelectQueryPriceName: TStringField;
    CustomerDataSetPriceID: TIntegerField;
    ImageList1: TImageList;
    SaleStructureDataSetOrderID: TIntegerField;
    SaleStructureDataSetProductID: TIntegerField;
    SaleStructureDataSetStoreID: TIntegerField;
    SaleStructureDataSetAmountVAT: TIBBCDField;
    SaleStructureDataSetAmount: TIBBCDField;
    PaymentBankDataSet: TIBDataSet;
    IntegerField11: TIntegerField;
    IntegerField14: TIntegerField;
    IntegerField15: TIntegerField;
    SmallintField3: TSmallintField;
    PaymentBankTransaction: TIBTransaction;
    PaymentBankDataSource: TDataSource;
    SaleStructureDataSetPrice: TIBBCDField;
    SaleStructureDataSetType: TSmallintField;
    BuyStructureDataSet: TIBDataSet;
    IntegerField16: TIntegerField;
    IntegerField17: TIntegerField;
    IntegerField18: TIntegerField;
    IBBCDField6: TIBBCDField;
    IBBCDField8: TIBBCDField;
    IBBCDField9: TIBBCDField;
    SmallintField4: TSmallintField;
    BuyStoreDataSet: TIBDataSet;
    IntegerField21: TIntegerField;
    IntegerField22: TIntegerField;
    BuyStoreDataSource: TDataSource;
    ImageList3: TImageList;
    PaymentBankDataSetFirmID: TIntegerField;
    PaymentBankDataSetType: TSmallintField;
    PaymentOrderDataSetFirmID: TIntegerField;
    PaymentOrderDataSetType: TSmallintField;
    BuyOrderDataSetFirmID: TIntegerField;
    BuyOrderDataSetCustomerID: TIntegerField;
    BuyOrderDataSetPayDate: TDateField;
    PayOrderSelectQueryOrderID: TIntegerField;
    PayOrderSelectQueryFirmID: TIntegerField;
    PayOrderSelectQueryCustomerID: TIntegerField;
    PayOrderSelectQueryDate: TDateField;
    PayOrderSelectQueryNumber: TIBStringField;
    PayOrderSelectQueryIssueDate: TDateField;
    PayOrderSelectQueryTotalAmount: TIBBCDField;
    PayOrderSelectQueryPay: TIBBCDField;
    PayOrderSelectQueryPayDate: TDateField;
    PayOrderSelectQueryDebt: TIBBCDField;
    PayOrderSelectQueryPriceID: TIntegerField;
    HomeOrderDataSetFirmID: TIntegerField;
    HomeOrderDataSetCustomerID: TIntegerField;
    HomeOrderDataSetDebt: TIBBCDField;
    HomeStructureDataSet: TIBDataSet;
    IntegerField3: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField8: TIntegerField;
    IBBCDField1: TIBBCDField;
    IBBCDField5: TIBBCDField;
    IBBCDField14: TIBBCDField;
    SmallintField6: TSmallintField;
    HomeStoreDataSource: TDataSource;
    BuyOrderDataSetCustomerName: TIBStringField;
    SaleOrderDataSet: TIBDataSet;
    IntegerField39: TIntegerField;
    IntegerField40: TIntegerField;
    IntegerField41: TIntegerField;
    DateField3: TDateField;
    IBStringField13: TIBStringField;
    IBBCDField19: TIBBCDField;
    IBBCDField20: TIBBCDField;
    DateField5: TDateField;
    IBBCDField21: TIBBCDField;
    IBStringField14: TIBStringField;
    SaleOrderDataSetPriceID: TIntegerField;
    CustomerDataSetDelayPay: TSmallintField;
    CustomerDataSetNote: TBlobField;
    SampleMeasureQuery: TIBQuery;
    SampleMeasureDataSource: TDataSource;
    SampleMeasureQueryMeasureID: TIntegerField;
    SampleMeasureQueryMeasureName: TIBStringField;
    SampleMeasureQueryProductID: TIntegerField;
    ReportFirmQuery: TIBQuery;
    ReportFirmDataSource: TDataSource;
    ReportFirmQueryCustomerID: TIntegerField;
    ReportFirmQueryCustomerName: TIBStringField;
    ReportFirmQueryCustomerFullName: TIBStringField;
    ReportFirmQueryAddress: TIBStringField;
    ReportFirmQueryPhone: TIBStringField;
    ReportFirmQueryOKONH: TIBStringField;
    ReportFirmQueryOKPO: TIBStringField;
    ReportFirmQueryINN: TIBStringField;
    ReportFirmQueryKPP: TIBStringField;
    ReportFirmQueryRegistration: TIBStringField;
    ReportFirmQueryBankID: TIntegerField;
    ReportFirmQueryAccount: TIBStringField;
    ReportFirmQueryPriceID: TIntegerField;
    ReportFirmQueryDelayPay: TSmallintField;
    ReportFirmQueryNote: TBlobField;
    ReportFirmQueryFirm: TSmallintField;
    ReportCustomerQuery: TIBQuery;
    IntegerField42: TIntegerField;
    IBStringField15: TIBStringField;
    IBStringField16: TIBStringField;
    IBStringField17: TIBStringField;
    IBStringField18: TIBStringField;
    IBStringField19: TIBStringField;
    IBStringField20: TIBStringField;
    IBStringField21: TIBStringField;
    IBStringField22: TIBStringField;
    IBStringField23: TIBStringField;
    IntegerField43: TIntegerField;
    IBStringField24: TIBStringField;
    IntegerField44: TIntegerField;
    SmallintField9: TSmallintField;
    BlobField1: TBlobField;
    SmallintField10: TSmallintField;
    ReportCustomerDataSource: TDataSource;
    ReportTransaction: TIBTransaction;
    SampleCountryQuery: TIBQuery;
    SampleCountryDataSource: TDataSource;
    SampleCountryQueryCountryID: TIntegerField;
    SampleCountryQueryCountryName: TIBStringField;
    SampleCCDDataSource: TDataSource;
    SampleCCDQuery: TIBQuery;
    SampleCCDQueryCCDID: TIntegerField;
    SampleCCDQueryCCDName: TIBStringField;
    SampleCountryQueryStoreID: TIntegerField;
    SampleCCDQueryStoreID: TIntegerField;
    SaleOrderDataSetTotalAmountVAT: TIBBCDField;
    GroupVATQuery: TIBQuery;
    GroupVATDataSource: TDataSource;
    GroupVATQuerySUM: TIBBCDField;
    PaymentOrderDataSetNumber: TIBStringField;
    TestDaysQuery: TIBQuery;
    TestDaysDataSource: TDataSource;
    StoreOrderDataSource: TDataSource;
    BuyPriceDataSource: TDataSource;
    BuyPriceDataSet: TIBDataSet;
    IntegerField45: TIntegerField;
    IntegerField46: TIntegerField;
    IBBCDField22: TIBBCDField;
    StringField3: TStringField;
    ImageList2: TImageList;
    HomePriceDataSource: TDataSource;
    HomePriceDataSet: TIBDataSet;
    IntegerField13: TIntegerField;
    IntegerField20: TIntegerField;
    IBBCDField23: TIBBCDField;
    StringField4: TStringField;
    PayOrderBankDataSet: TIBDataSet;
    PayOrderBankDataSource: TDataSource;
    PayOrderBankDataSetPaymentID: TIntegerField;
    PayOrderBankDataSetOrderID: TIntegerField;
    PayOrderBankDataSetPay: TIBBCDField;
    PaymentBankDataSetNumber: TIBStringField;
    CustomerSelectQueryCustomerID: TIntegerField;
    CustomerSelectQueryCustomerName: TIBStringField;
    CustomerSelectQueryPriceID: TIntegerField;
    CustomerSelectQueryDelayPay: TSmallintField;
    PaymentOrderDataSetTotalPay: TIBBCDField;
    PaymentBankDataSetTotalPay: TIBBCDField;
    PaymentCashDataSet: TIBDataSet;
    IntegerField47: TIntegerField;
    IntegerField48: TIntegerField;
    IntegerField49: TIntegerField;
    IntegerField50: TIntegerField;
    SmallintField11: TSmallintField;
    IBStringField25: TIBStringField;
    IBBCDField2: TIBBCDField;
    SmallintField12: TSmallintField;
    PayOrderCashDataSet: TIBDataSet;
    IntegerField51: TIntegerField;
    IntegerField52: TIntegerField;
    IBBCDField24: TIBBCDField;
    PaymentCashTransaction: TIBTransaction;
    PaymentCashDataSource: TDataSource;
    PayOrderCashDataSource: TDataSource;
    ReportFirmQueryBankID1: TIntegerField;
    ReportFirmQueryBankName: TIBStringField;
    ReportFirmQueryAddress1: TIBStringField;
    ReportFirmQueryAccount1: TIBStringField;
    ReportFirmQueryBIC: TIBStringField;
    ProductDataSetCategoryName: TIBStringField;
    ProductDataSetMeasureName: TIBStringField;
    ProductDataSetProducerName: TIBStringField;
    TypePriceDataSetMarkup: TIBBCDField;
    BuyStoreDataSetAccountPrice: TIBBCDField;
    DeletePriceStoreQuery: TIBQuery;
    EmployeeDataSet: TIBDataSet;
    EmployeeTransaction: TIBTransaction;
    EmployeeDataSource: TDataSource;
    EmployeeDataSetEmployeeID: TIntegerField;
    EmployeeDataSetFirstName: TIBStringField;
    EmployeeDataSetSecondName: TIBStringField;
    EmployeeDataSetThirdName: TIBStringField;
    EmployeeDataSetTableNo: TIBStringField;
    EmployeeDataSetPassSeries: TIBStringField;
    EmployeeDataSetPassNo: TIBStringField;
    EmployeeDataSetPassIssuer: TIBStringField;
    EmployeeDataSetPassDate: TDateField;
    EmployeeDataSetCustomerID: TIntegerField;
    EmployeeDataSetJobTitleID: TIntegerField;
    JobTitleDataSet: TIBDataSet;
    JobTitleTransaction: TIBTransaction;
    JobTitleDataSource: TDataSource;
    JobTitleDataSetJobTitleID: TIntegerField;
    JobTitleDataSetJobTitleName: TIBStringField;
    DeletePriceBuyStoreQuery: TIBQuery;
    BuyOrderDataSetTotalAmountVAT: TIBBCDField;
    GroupDataSet: TIBDataSet;
    GroupDataSource: TDataSource;
    GroupDataSetGroupID: TIntegerField;
    GroupDataSetGroupName: TIBStringField;
    CategoryDataSetGroupID: TIntegerField;
    ProductDataSetNote: TIBStringField;
    CategoryDataSetGroupName: TIBStringField;
    BuyStructureDataSetQty: TIBBCDField;
    SaleStructureDataSetQty: TIBBCDField;
    HomeStructureDataSetQty: TIBBCDField;
    BuyStructureDataSetProductFullName: TIBStringField;
    SaleStructureDataSetProductFullName: TIBStringField;
    ProductSelectQueryProductFullName: TIBStringField;
    CustomerDataSetPassSeries: TIBStringField;
    CustomerDataSetPassNo: TIBStringField;
    CustomerDataSetPassIssuer: TIBStringField;
    CustomerDataSetPassDate: TDateField;
    ReportOrderQuery: TIBQuery;
    IntegerField12: TIntegerField;
    IntegerField19: TIntegerField;
    IntegerField23: TIntegerField;
    DateField6: TDateField;
    IBStringField9: TIBStringField;
    DateField7: TDateField;
    IBBCDField10: TIBBCDField;
    IBBCDField12: TIBBCDField;
    DateField8: TDateField;
    IBBCDField15: TIBBCDField;
    IntegerField24: TIntegerField;
    StringField9: TStringField;
    ReportOrderDataSource: TDataSource;
    GroupDataSetPriorit: TSmallintField;
    StoreOrderQuery: TIBQuery;
    StoreOrderQueryOrderID: TIntegerField;
    StoreOrderQueryProductID: TIntegerField;
    StoreOrderQueryStoreID: TIntegerField;
    StoreOrderQueryQty: TIBBCDField;
    StoreOrderQueryPrice: TIBBCDField;
    StoreOrderQueryAmountVAT: TIBBCDField;
    StoreOrderQueryAmount: TIBBCDField;
    StoreOrderQueryType: TSmallintField;
    StoreOrderQueryDate: TDateField;
    StoreOrderQueryCustomerName: TIBStringField;
    StoreProductDataSetProductFullName: TIBStringField;
    StoreProductDataSetMeasureName: TIBStringField;
    StoreProductDataSetProducerName: TIBStringField;
    HomeStructureDataSetProductFullName: TIBStringField;
    ProductSelectQueryCategoryID: TIntegerField;
    VATDataSetVATRateID: TIntegerField;
    VATDataSetVATRateName: TIBStringField;
    VATDataSetVATRate: TIBBCDField;
    BuyStructureDataSetVATRate: TIBBCDField;
    SaleStructureDataSetVATRate: TIBBCDField;
    GroupVATQueryVATRate: TIBBCDField;
    StoreOrderQueryVATRate: TIBBCDField;
    ProductSelectQueryVATRate: TFloatField;
    VATRateQuery: TIBQuery;
    VATRateDataSource: TDataSource;
    VATRateQueryVATRateID: TIntegerField;
    VATRateQueryVATRateName: TIBStringField;
    VATRateQueryVATRate: TIBBCDField;
    DebtQuery: TIBQuery;
    DebtQueryFirmID: TIntegerField;
    DebtQueryCustomerID: TIntegerField;
    DebtQueryDebt: TIBBCDField;
    CustomerSelectQueryDebt: TFloatField;
    CustomerSelectQueryDebtStr: TStringField;
    HomeStructureDataSetVATRate: TIBBCDField;
    DeletePriceHomeStoreQuery: TIBQuery;
    HomeOrderDataSetTotalAmountVAT: TIBBCDField;
    HomeOrderDataSetPriceID: TIntegerField;
    CategoryVATQueryCategoryID: TIntegerField;
    CategoryVATQueryCategoryName: TIBStringField;
    CategoryVATQueryDate: TDateField;
    CategoryVATQueryVATRateName: TIBStringField;
    CategoryVATQueryVATRate: TIBBCDField;
    CategoryDataSetVATRateName: TStringField;
    BuyOrderDataSetDivisionName: TIBStringField;
    BuyOrderDataSetPriceID: TIntegerField;
    BuyStructureDataSetRemainQty: TIBBCDField;
    ProductDataSetPack: TSmallintField;
    ProductDataSetCountryID: TIntegerField;
    SaleOrderDataSetDivisionName: TIBStringField;
    SaleStructureDataSetRemainQty: TIBBCDField;
    StoreSelectQueryProductID: TIntegerField;
    StoreSelectQueryStoreID: TIntegerField;
    StoreSelectQueryQty: TIBBCDField;
    StoreSelectQueryPrice: TIBBCDField;
    StoreSelectQueryCurAmountRemain: TFloatField;
    StoreSelectQueryDivisionID: TIntegerField;
    ProductDataSetCountryName: TIBStringField;
    StoreQtyQuery: TIBQuery;
    StoreQtyQueryProductID: TIntegerField;
    StoreQtyQueryStoreID: TIntegerField;
    StoreQtyQueryAccountPrice: TIBBCDField;
    StoreQtyQueryQty: TIBBCDField;
    StoreQtyQueryDivisionName: TIBStringField;
    BuyStructureDataSetDivisionName: TIBStringField;
    SaleStructureDataSetDivisionName: TIBStringField;
    BuyStoreDataSetCCDID: TIntegerField;
    BuyStoreDataSetCertificateID: TIntegerField;
    BuyStoreDataSetSerial: TIBStringField;
    BuyStoreDataSetBeforeDate: TDateField;
    BuyQtyDataSet: TIBDataSet;
    BuyQtyDataSetStoreID: TIntegerField;
    BuyQtyDataSetQty: TIBBCDField;
    BuyQtyDataSetDivisionID: TIntegerField;
    BuyQtyDataSetDivisionName: TIBStringField;
    BuyQtyDataSource: TDataSource;
    BuyOrderDataSetInDivisionID: TIntegerField;
    SaleOrderDataSetOutDivisionID: TIntegerField;
    HomeOrderDataSetInDivisionID: TIntegerField;
    HomeOrderDataSetOutDivisionID: TIntegerField;
    HomeStructureDataSetMeasureName: TIBStringField;
    HomeStructureDataSetCountryName: TIBStringField;
    HomeStoreDataSet: TIBDataSet;
    IntegerField25: TIntegerField;
    IntegerField26: TIntegerField;
    IBBCDField3: TIBBCDField;
    IntegerField27: TIntegerField;
    IntegerField28: TIntegerField;
    IBStringField10: TIBStringField;
    DateField9: TDateField;
    HomeQtyDataSet: TIBDataSet;
    IntegerField29: TIntegerField;
    IBBCDField7: TIBBCDField;
    IntegerField30: TIntegerField;
    IBStringField11: TIBStringField;
    HomeQtyDataSource: TDataSource;
    BuyOrderDataSetUserName: TIBStringField;
    SaleOrderDataSetUserName: TIBStringField;
    HomeOrderDataSetUserName: TIBStringField;
    StoreDataSet: TIBDataSet;
    IntegerField31: TIntegerField;
    IntegerField32: TIntegerField;
    IBBCDField11: TIBBCDField;
    IntegerField33: TIntegerField;
    IntegerField34: TIntegerField;
    IBStringField12: TIBStringField;
    DateField10: TDateField;
    StoreDataSource: TDataSource;
    PaymentBankDataSetDate: TDateField;
    PaymentCashDataSetDate: TDateField;
    PaymentOrderDataSetDate: TDateField;
    PaymentBankDataSetDebit: TIntegerField;
    PaymentBankDataSetCredit: TIntegerField;
    PaymentCashDataSetDebit: TIntegerField;
    PaymentCashDataSetCredit: TIntegerField;
    PaymentOrderDataSetDebit: TIntegerField;
    PaymentOrderDataSetCredit: TIntegerField;
    FirmDataSetCustomerName: TIBStringField;
    FirmDataSetCustomerFullName: TIBStringField;
    CustomerDataSetCustomerName: TIBStringField;
    CustomerDataSetCustomerFullName: TIBStringField;
    BankDataSetBankName: TIBStringField;
    PaymentBankDataSetCustomerName: TIBStringField;
    PaymentCashDataSetCustomerName: TIBStringField;
    PaymentOrderDataSetCustomerName: TIBStringField;
    PayOrderSelectQueryCustomerName: TIBStringField;
    InitialBalanceDataSet: TIBDataSet;
    InitialBalanceTransaction: TIBTransaction;
    InitialBalanceDataSource: TDataSource;
    InitialBalanceDataSetFirmID: TIntegerField;
    InitialBalanceDataSetCustomerID: TIntegerField;
    InitialBalanceDataSetDate: TDateField;
    InitialBalanceDataSetTotalAmount: TIBBCDField;
    InitialBalanceDataSetPay: TIBBCDField;
    InitialBalanceDataSetDebt: TIBBCDField;
    InitialBalanceDataSetCustomerName: TIBStringField;
    InitialBalanceDataSetVATRate: TIBBCDField;
    QtyStoreQuery: TIBQuery;
    QtyStoreDataSource: TDataSource;
    QtyStoreQueryStoreID: TIntegerField;
    QtyStoreQueryDivisionID: TIntegerField;
    QtyStoreQueryQty: TIBBCDField;
    QtyStoreQueryDivisionName: TIBStringField;
    BuyOrderDataSetProperID: TIntegerField;
    SaleOrderDataSetProperID: TIntegerField;
    PayOrderSelectQueryProperID: TIntegerField;
    HomeOrderDataSetProperID: TIntegerField;
    StoreOrderQueryProperID: TIntegerField;
    ReportOrderQueryProperID: TIntegerField;
    BuyStructureDataSetPriceNonVAT: TIBBCDField;
    ProductSelectQueryPack: TSmallintField;
    FirmSelectQueryINN: TIBStringField;
    TestDaysQueryTest: TIntegerField;
    ProductDataSetWeight: TSmallintField;
    BuyOrderDataSetNote: TIBStringField;
    SaleOrderDataSetNote: TIBStringField;
    CustomerDataSetVAT: TSmallintField;
    SaleStructureDataSetPack: TSmallintField;
    PaymentBankDataSetUserName: TIBStringField;
    PaymentCashDataSetUserName: TIBStringField;
    PaymentOrderDataSetUserName: TIBStringField;
    TypePriceDataSetRound: TIBBCDField;
    procedure DatabaseBeforeConnect(Sender: TObject);
    procedure BuyOrderDataSetBeforeOpen(DataSet: TDataSet);
    procedure BuyOrderDataSetAfterOpen(DataSet: TDataSet);
    procedure BuyStoreDataSetBeforeOpen(DataSet: TDataSet);
    procedure SaleOrderDataSetBeforeOpen(DataSet: TDataSet);
    procedure SaleOrderDataSetAfterOpen(DataSet: TDataSet);
    procedure HomeOrderDataSetBeforeOpen(DataSet: TDataSet);
    procedure HomeOrderDataSetAfterOpen(DataSet: TDataSet);
    procedure HomeStoreDataSetBeforeOpen(DataSet: TDataSet);
    procedure PaymentBankDataSetBeforeOpen(DataSet: TDataSet);
    procedure PaymentBankDataSetAfterOpen(DataSet: TDataSet);
    procedure PaymentCashDataSetBeforeOpen(DataSet: TDataSet);
    procedure PaymentCashDataSetAfterOpen(DataSet: TDataSet);
    procedure DivisionSelectQueryBeforeOpen(DataSet: TDataSet);
    procedure DivisionSelectQueryAfterOpen(DataSet: TDataSet);
    procedure CustomerSelectQueryBeforeOpen(DataSet: TDataSet);
    procedure CustomerSelectQueryDebtGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure CustomerSelectQueryCalcFields(DataSet: TDataSet);
    procedure DebtQueryBeforeOpen(DataSet: TDataSet);
    procedure ProductDataSetAfterOpen(DataSet: TDataSet);
    procedure BankDataSetAfterOpen(DataSet: TDataSet);
    procedure CategoryDataSetAfterOpen(DataSet: TDataSet);
    procedure GroupDataSetAfterOpen(DataSet: TDataSet);
    procedure MeasureDataSetAfterOpen(DataSet: TDataSet);
    procedure ProducerDataSetAfterOpen(DataSet: TDataSet);
    procedure CountryDataSetAfterOpen(DataSet: TDataSet);
    procedure CCDDataSetAfterOpen(DataSet: TDataSet);
    procedure CertificateDataSetAfterOpen(DataSet: TDataSet);
    procedure CustomerDataSetAfterOpen(DataSet: TDataSet);
    procedure CustomerSelectQueryAfterOpen(DataSet: TDataSet);
    procedure StoreProductDataSetAfterOpen(DataSet: TDataSet);
    procedure StoreProductDataSetBeforeClose(DataSet: TDataSet);
    procedure StoreQtyQueryBeforeOpen(DataSet: TDataSet);
    procedure StoreQtyQueryAfterOpen(DataSet: TDataSet);
    procedure TypePriceDataSetAfterOpen(DataSet: TDataSet);
    procedure StoreSelectQueryBeforeOpen(DataSet: TDataSet);
    procedure StoreSelectQueryCalcFields(DataSet: TDataSet);
    procedure CategoryVATQueryAfterOpen(DataSet: TDataSet);
    procedure InitialBalanceDataSetBeforeOpen(DataSet: TDataSet);
    procedure InitialBalanceDataSetAfterOpen(DataSet: TDataSet);
    procedure VATRateQueryAfterOpen(DataSet: TDataSet);
    procedure TestDaysQueryBeforeOpen(DataSet: TDataSet);
    procedure rrr(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StoreDataModule: TStoreDataModule;
//  Глобальные переменные
  FirmIsEmpty: SmallInt;
  DBName: String;
  MainFirm : Integer;
  MainDivision : Integer;
  MainPrice : Integer;
  RetailCustomerID: Integer;
  FirmName: String;
  UserName: String;
//  Переменные Дат
  TopDate: String;
  BottomDate: String;
//  Переменные выбора Типа Документа
  CurProperID : SmallInt;
  CurType : SmallInt;
//  Переменные текущего значения "Клиента"
  CurCustomerID : Variant;
  CurCustomerName : Variant;
  CurDivisionID : Variant;
  CurDivisionName : Variant;
  CurBankID : Integer;
  CurrentCustomerName : String;
  CurPriceID : Variant;
  CurPriceName : Variant;
  CurPriceMarkup : Variant;
  CurrentDelayPay : Integer;
//  Переменная текущего "Документа"
  CurOrderID : Variant;
  CurDate : Variant;
//  Переменные для Товара
  CurrentProductID : Integer;
  CurCategoryID : Integer;
  CurPack : Integer;
  CurProductFullName : String;
  CurrentProductName : String;
  CurrentCategoryName : String;
  CurGroupID : Integer;
  CurGroupName : String;
  CurVATRateID : Variant;
  CurVATRateName : Variant;
  CurVATRate : Integer;
  CurMeasureID : Variant;
  CurMeasureName : Variant;
  CurProducerID : Variant;
  CurProducerName : Variant;
  CurCountryID : Variant;
  CurCountryName : Variant;
  CurCCDID : Variant;
  CurCCDName : Variant;
  CurCertificateID : Variant;
  CurCertificateName : Variant;
//  Переменные выбраной Партии для Накладной
  CurStoreID : Variant;
  CurPrice : Variant;
//  Переменные выбраной Оплаты
  CurPaymentID : Integer;
//  CurType : Integer;
  CurPay : Currency;
  CurDebt : Currency;

implementation

uses Login, ssdefines;

{$R *.dfm}

procedure TStoreDataModule.DatabaseBeforeConnect(Sender: TObject);
begin
  with DataBase do
  begin
    DatabaseName := GetCorrectWayToIBDB(DBName);
    Params.Add(Format('lc_ctype=%s', ['WIN1251']));
    if Params.Values['user_name'] = '' then
    begin
      Params.Add(Format('user_name=%s', ['SYSDBA']));
      Params.Add(Format('password=%s', ['masterkey']));
      Params.Add(Format('sql_role_name=%s', ['']));
    end;
  end;
end;

procedure TStoreDataModule.BuyOrderDataSetBeforeOpen(DataSet: TDataSet);
begin
  BuyOrderTransaction.Active := True;
  BuyOrderDataSet.ParamByName('MainFirm').Value := MainFirm;
  BuyOrderDataSet.ParamByName('TopDate').Value := TopDate;
  BuyOrderDataSet.ParamByName('BottomDate').Value := BottomDate;
end;

procedure TStoreDataModule.BuyOrderDataSetAfterOpen(DataSet: TDataSet);
begin
  if CurOrderID <> 0 then
    BuyOrderDataSet.Locate('OrderID', CurOrderID, [])
  else
  BuyOrderDataSet.Last;
end;

procedure TStoreDataModule.BuyStoreDataSetBeforeOpen(DataSet: TDataSet);
begin
//  BuyStoreDataSet.ParamByName('ProductID').Value := BuyStructureDataSet['ProductID'];
//  BuyStoreDataSet.ParamByName('CustomerID').Value := MainFirm;
end;

procedure TStoreDataModule.SaleOrderDataSetBeforeOpen(DataSet: TDataSet);
begin
  SaleOrderTransaction.Active := True;
  SaleOrderDataSet.ParamByName('MainFirm').Value := MainFirm;
  SaleOrderDataSet.ParamByName('TopDate').Value := TopDate;
  SaleOrderDataSet.ParamByName('BottomDate').Value := BottomDate;
end;

procedure TStoreDataModule.SaleOrderDataSetAfterOpen(DataSet: TDataSet);
begin
  if CurOrderID <> 0 then
    SaleOrderDataSet.Locate('OrderID', CurOrderID, [])
  else
    SaleOrderDataSet.Last;
end;

procedure TStoreDataModule.HomeOrderDataSetBeforeOpen(DataSet: TDataSet);
begin
  HomeTransaction.Active := True;
  HomeOrderDataSet.ParamByName('MainFirm').Value := MainFirm;
  HomeOrderDataSet.ParamByName('TopDate').Value := TopDate;
  HomeOrderDataSet.ParamByName('BottomDate').Value := BottomDate;
end;

procedure TStoreDataModule.HomeOrderDataSetAfterOpen(DataSet: TDataSet);
begin
  if CurOrderID <> 0 then
    HomeOrderDataSet.Locate('OrderID', CurOrderID, [])
  else
    HomeOrderDataSet.Last;
end;

procedure TStoreDataModule.HomeStoreDataSetBeforeOpen(DataSet: TDataSet);
begin
//  HomeStoreDataSet.ParamByName('ProductID').Value := HomeStructureDataSet['ProductID'];
//  HomeStoreDataSet.ParamByName('MainFirm').Value := MainFirm;
end;

procedure TStoreDataModule.PaymentBankDataSetBeforeOpen(DataSet: TDataSet);
begin
  PaymentBankTransaction.Active := True;
  PaymentBankDataSet.ParamByName('MainFirm').Value := MainFirm;
  PaymentBankDataSet.ParamByName('TopDate').Value := TopDate;
  PaymentBankDataSet.ParamByName('BottomDate').Value := BottomDate;
end;

procedure TStoreDataModule.PaymentBankDataSetAfterOpen(DataSet: TDataSet);
begin
  if CurPaymentID <> 0 then
    PaymentBankDataSet.Locate('PaymentID', CurPaymentID, [])
  else
  PaymentBankDataSet.Last;
end;

procedure TStoreDataModule.PaymentCashDataSetBeforeOpen(DataSet: TDataSet);
begin
  PaymentCashTransaction.Active := True;
  PaymentCashDataSet.ParamByName('MainFirm').Value := MainFirm;
  PaymentCashDataSet.ParamByName('TopDate').Value := TopDate;
  PaymentCashDataSet.ParamByName('BottomDate').Value := BottomDate;
end;

procedure TStoreDataModule.PaymentCashDataSetAfterOpen(DataSet: TDataSet);
begin
  if CurPaymentID <> 0 then
    PaymentCashDataSet.Locate('PaymentID', CurPaymentID, [])
  else
  PaymentCashDataSet.Last;
end;

procedure TStoreDataModule.DivisionSelectQueryBeforeOpen(DataSet: TDataSet);
begin
  DivisionSelectQuery.ParamByName('MainFirm').Value := MainFirm;
end;

procedure TStoreDataModule.DivisionSelectQueryAfterOpen(DataSet: TDataSet);
begin
  if CurDivisionID <> 0 then
    DivisionSelectQuery.Locate('DivisionID', CurDivisionID, [])
  else
    DivisionSelectQuery.First;
end;

procedure TStoreDataModule.CustomerSelectQueryBeforeOpen(DataSet: TDataSet);
begin
  CustomerSelectQuery.ParamByName('MainFirm').Value := MainFirm;
end;

procedure TStoreDataModule.CustomerSelectQueryAfterOpen(DataSet: TDataSet);
begin
  if CurCustomerID <> 0 then
    CustomerSelectQuery.Locate('CustomerID', CurCustomerID, []);
end;

procedure TStoreDataModule.CustomerSelectQueryDebtGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
{  if CustomerSelectQuery.FieldByName('Debt').IsNull then
    Text := '0'
  else
    Text := CustomerSelectQuery.FieldByName('Debt').AsString;{}
end;

procedure TStoreDataModule.CustomerSelectQueryCalcFields(DataSet: TDataSet);
begin
  if CustomerSelectQuery.FieldByName('Debt').IsNull then
    CustomerSelectQuery.FieldByName('DebtStr').AsString := '0'
  else
  begin
    if CustomerSelectQuery.FieldByName('Debt').Value = 0 then
      CustomerSelectQuery.FieldByName('DebtStr').AsString := '0'
    else
      CustomerSelectQuery.FieldByName('DebtStr').AsString := Format('%0:n', [CustomerSelectQuery.FieldByName('Debt').AsCurrency]) + ' р';
  end;
end;

procedure TStoreDataModule.DebtQueryBeforeOpen(DataSet: TDataSet);
begin
  DebtQuery.ParamByName('MainFirm').Value := MainFirm;
end;

procedure TStoreDataModule.ProductDataSetAfterOpen(DataSet: TDataSet);
begin
  ProductDataSet.DisableControls;
  ProductDataSet.Last;
  if CurrentProductID <> 0 then
    ProductDataSet.Locate('ProductID', CurrentProductID, [])
  else
    ProductDataSet.First;
  ProductDataSet.EnableControls;
end;

procedure TStoreDataModule.BankDataSetAfterOpen(DataSet: TDataSet);
begin
  if CurBankID <> 0 then
    BankDataSet.Locate('BankID', CurBankID, []);
end;

procedure TStoreDataModule.CategoryDataSetAfterOpen(DataSet: TDataSet);
begin
  if CurCategoryID <> 0 then
    CategoryDataSet.Locate('CategoryID', CurCategoryID, []);
end;

procedure TStoreDataModule.CategoryVATQueryAfterOpen(DataSet: TDataSet);
begin
  if CurCategoryID <> 0 then
    CategoryVATQuery.Locate('CategoryID', CurCategoryID, []);
end;

procedure TStoreDataModule.GroupDataSetAfterOpen(DataSet: TDataSet);
begin
  if CurGroupID <> 0 then
    GroupDataSet.Locate('GroupID', CurGroupID, []);
end;

procedure TStoreDataModule.MeasureDataSetAfterOpen(DataSet: TDataSet);
begin
  if CurMeasureID > 0 then
    MeasureDataSet.Locate('MeasureID', CurMeasureID, []);
end;

procedure TStoreDataModule.ProducerDataSetAfterOpen(DataSet: TDataSet);
begin
  if CurProducerID > 0 then
    ProducerDataSet.Locate('ProducerID', CurProducerID, []);
end;

procedure TStoreDataModule.CountryDataSetAfterOpen(DataSet: TDataSet);
begin
  if CurCountryID > 0 then
    CountryDataSet.Locate('CountryID', CurCountryID, [])
  else
    CountryDataSet.Locate('CountryID', 1, []);
end;

procedure TStoreDataModule.CCDDataSetAfterOpen(DataSet: TDataSet);
begin
  if CurCCDID > 0 then
    CCDDataSet.Locate('CCDID', CurCCDID, []);
end;

procedure TStoreDataModule.CertificateDataSetAfterOpen(DataSet: TDataSet);
begin
  if CurCertificateID > 0 then
    CertificateDataSet.Locate('CertificateID', CurCertificateID, []);
end;

procedure TStoreDataModule.CustomerDataSetAfterOpen(DataSet: TDataSet);
begin
  CustomerDataSet.DisableControls;
  CustomerDataSet.Last;
  if CurCustomerID <> 0 then
    CustomerDataSet.Locate('CustomerID', CurCustomerID, [])
  else
    CustomerDataSet.First;
  CustomerDataSet.EnableControls;
end;

procedure TStoreDataModule.StoreProductDataSetAfterOpen(DataSet: TDataSet);
begin
  if CurrentProductID <> 0 then
    StoreProductDataSet.Locate('ProductID', CurrentProductID, []);
end;

procedure TStoreDataModule.StoreProductDataSetBeforeClose(
  DataSet: TDataSet);
begin
  CurrentProductID := StoreProductDataSet.FieldByName('ProductID').AsInteger;
end;

procedure TStoreDataModule.StoreQtyQueryBeforeOpen(DataSet: TDataSet);
begin
  StoreQtyQuery.ParamByName('MainFirm').Value := MainFirm;
end;

procedure TStoreDataModule.StoreQtyQueryAfterOpen(DataSet: TDataSet);
begin
  if CurStoreID <> 0 then
    StoreQtyQuery.Locate('ProductID; StoreID', VarArrayOf([CurrentProductID, CurStoreID]), []);
end;

procedure TStoreDataModule.TypePriceDataSetAfterOpen(DataSet: TDataSet);
begin
  if CurPriceID <> 0 then
    TypePriceDataSet.Locate('PriceID', CurPriceID, []);
end;

procedure TStoreDataModule.StoreSelectQueryBeforeOpen(DataSet: TDataSet);
begin
//  StoreSelectQuery.ParamByName('MainFirm').Value := MainFirm;
end;

procedure TStoreDataModule.StoreSelectQueryCalcFields(DataSet: TDataSet);
begin
  StoreSelectQuery['CurAmountRemain'] := StoreSelectQuery['Price'] * StoreSelectQuery['Qty'];
end;

procedure TStoreDataModule.InitialBalanceDataSetBeforeOpen(
  DataSet: TDataSet);
begin
  InitialBalanceTransaction.Active := True;
  InitialBalanceDataSet.ParamByName('MainFirm').Value := MainFirm;
end;

procedure TStoreDataModule.InitialBalanceDataSetAfterOpen(
  DataSet: TDataSet);
begin
  if CurCustomerID <> 0 then
    InitialBalanceDataSet.Locate('CustomerID', CurCustomerID, [])
  else
  InitialBalanceDataSet.First;
end;

procedure TStoreDataModule.VATRateQueryAfterOpen(DataSet: TDataSet);
begin
  VATRateQuery.Locate('VATRate', 18, []);//По умолчанию Ставка НДС 18%
end;

procedure TStoreDataModule.TestDaysQueryBeforeOpen(DataSet: TDataSet);
begin
  TestDaysQuery.ParamByName('MainFirm').Value := MainFirm;
end;

procedure TStoreDataModule.rrr(Sender: TObject);
begin
  FirmSelectQuery.Open;
  if FirmSelectQuery.IsEmpty then
    FirmIsEmpty := 1
  else
    FirmIsEmpty := 0;
  FirmSelectQuery.Close;
end;

end.
