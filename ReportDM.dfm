object ReportDataModule: TReportDataModule
  OldCreateOrder = False
  Left = 426
  Top = 104
  Height = 527
  Width = 795
  object PriceListQuery: TIBQuery
    Database = StoreDataModule.Database
    Transaction = StoreDataModule.DefaultTransaction
    DataSource = StoreDataModule.TypePriceDataSource
    SQL.Strings = (
      
        'SELECT "Products"."ProductID", "Products"."ProductName", "Produc' +
        'ts"."Note", "Products"."Description", "Categories"."CategoryName' +
        '", "Groups"."GroupName", "Measures"."MeasureName", "Prices"."Pri' +
        'ce"'
      
        'FROM "Store", "StoreQty", "Products", "Categories", "Groups", "M' +
        'easures", "Prices"'
      
        'WHERE ("Products"."ProductID" = "Store"."ProductID") AND ("Store' +
        'Qty"."StoreID" = "Store"."StoreID") AND ("Products"."CategoryID"' +
        ' = "Categories"."CategoryID") AND ("Categories"."GroupID" = "Gro' +
        'ups"."GroupID") AND ("Products"."MeasureID" = "Measures"."Measur' +
        'eID") AND ("Prices"."StoreID" = "Store"."StoreID" AND "Prices"."' +
        'PriceID" = :"PriceID") AND ("StoreQty"."Qty" > 0)'
      'ORDER BY "CategoryName", "ProductName"')
    Left = 112
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PriceID'
        ParamType = ptUnknown
        Size = 4
      end>
  end
  object ProductStoreQuery: TIBQuery
    Database = StoreDataModule.Database
    Transaction = StoreDataModule.DefaultTransaction
    DataSource = StoreDataModule.SaleStructureDataSource
    SQL.Strings = (
      
        'SELECT "Measures"."MeasureName", "Countrys"."CountryName", "CCD"' +
        '."CCDName", "Certificates"."CertificateName"'
      
        'FROM "Store", "Products", "Measures", "Countrys", "CCD", "Certif' +
        'icates"'
      
        'WHERE ("Store"."StoreID" = :"StoreID") AND ("Products"."ProductI' +
        'D" = "Store"."ProductID") AND ("Measures"."MeasureID" = "Product' +
        's"."MeasureID") AND ("Countrys"."CountryID" = "Products"."Countr' +
        'yID") AND ("CCD"."CCDID" = "Store"."CCDID") AND ("Certificates".' +
        '"CertificateID" = "Store"."CertificateID")')
    Left = 40
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'StoreID'
        ParamType = ptUnknown
        Size = 4
      end>
    object ProductStoreQueryMeasureName: TIBStringField
      FieldName = 'MeasureName'
      Origin = '"Measures"."MeasureName"'
      Size = 12
    end
    object ProductStoreQueryCountryName: TIBStringField
      FieldName = 'CountryName'
      Origin = '"Countrys"."CountryName"'
      Size = 84
    end
    object ProductStoreQueryCCDName: TIBStringField
      FieldName = 'CCDName'
      Origin = '"CCD"."CCDName"'
      Size = 84
    end
    object ProductStoreQueryCertificateName: TIBStringField
      FieldName = 'CertificateName'
      Origin = '"Certificates"."CertificateName"'
      Size = 84
    end
  end
  object DebtorQuery: TIBQuery
    Database = StoreDataModule.Database
    Transaction = StoreDataModule.DefaultTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM "Customer_Debtor"(:MainFirm, '#39'Now'#39', 0)'
      ''
      'ORDER BY "CustomerName"')
    Left = 32
    Top = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'MainFirm'
        ParamType = ptUnknown
      end>
    object DebtorQueryCustomerID: TIntegerField
      FieldName = 'CustomerID'
      Origin = '"Customer_Debtor"."CustomerID"'
    end
    object DebtorQueryCustomerName: TIBStringField
      FieldName = 'CustomerName'
      Origin = '"Customer_Debtor"."CustomerName"'
      Size = 84
    end
    object DebtorQueryInitialDebt: TIBBCDField
      FieldName = 'InitialDebt'
      Origin = '"Customer_Debtor"."InitialDebt"'
      Precision = 15
      Size = 2
    end
    object DebtorQuerySumDebt: TIBBCDField
      FieldName = 'SumDebt'
      Origin = '"Customer_Debtor"."SumDebt"'
      Precision = 15
      Size = 2
    end
  end
  object DebtorDataSource: TDataSource
    DataSet = DebtorQuery
    Left = 32
    Top = 400
  end
  object DebtorOrderQuery: TIBQuery
    Database = StoreDataModule.Database
    Transaction = StoreDataModule.DefaultTransaction
    DataSource = DebtorDataSource
    SQL.Strings = (
      'SELECT *'
      'FROM "Debtor_Order"(:MainFirm, :WorkDate, :Arrear)'
      'WHERE "CustomerID" = :"CustomerID"'
      'ORDER BY "OrderID"')
    Left = 96
    Top = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'MainFirm'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WorkDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Arrear'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CustomerID'
        ParamType = ptUnknown
      end>
    object DebtorOrderQueryOrderID: TIntegerField
      FieldName = 'OrderID'
      Origin = '"Debtor_Order"."OrderID"'
    end
    object DebtorOrderQueryDate: TDateField
      FieldName = 'Date'
      Origin = '"Debtor_Order"."Date"'
    end
    object DebtorOrderQueryNumber: TIBStringField
      FieldName = 'Number'
      Origin = '"Debtor_Order"."Number"'
      Size = 10
    end
    object DebtorOrderQueryCustomerID: TIntegerField
      FieldName = 'CustomerID'
      Origin = '"Debtor_Order"."CustomerID"'
    end
    object DebtorOrderQueryTotalAmount: TIBBCDField
      FieldName = 'TotalAmount'
      Origin = '"Debtor_Order"."TotalAmount"'
      Precision = 15
      Size = 2
    end
    object DebtorOrderQueryPayDate: TDateField
      FieldName = 'PayDate'
      Origin = '"Debtor_Order"."PayDate"'
    end
    object DebtorOrderQueryPay: TIBBCDField
      FieldName = 'Pay'
      Origin = '"Debtor_Order"."Pay"'
      Precision = 15
      Size = 2
    end
    object DebtorOrderQueryDebt: TIBBCDField
      FieldName = 'Debt'
      Origin = '"Debtor_Order"."Debt"'
      Precision = 15
      Size = 2
    end
    object DebtorOrderQueryProperID: TIntegerField
      FieldName = 'ProperID'
      Origin = '"Debtor_Order"."ProperID"'
    end
  end
  object DebtorOrderDataSource: TDataSource
    DataSet = DebtorOrderQuery
    Left = 96
    Top = 400
  end
  object CashBookDataSet: TIBDataSet
    Database = StoreDataModule.Database
    Transaction = CashBookTransaction
    InsertSQL.Strings = (
      'INSERT INTO "CashBook"'
      
        '  ("PageID", "FirmID", "Date", "Number", "InitialAmount", "Final' +
        'Amount")'
      'VALUES'
      
        '  (:"PageID", :"FirmID", :"Date", :"Number", :"InitialAmount", :' +
        '"FinalAmount")')
    RefreshSQL.Strings = (
      'SELECT'
      '  "PageID",'
      '  "FirmID",'
      '  "Date",'
      '  "Number",'
      '  "InitialAmount",'
      '  "FinalAmount"'
      'FROM "CashBook "'
      'WHERE'
      '  "PageID" = :"PageID"')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM "CashBook"'
      'WHERE "FirmID" = :MainFirm')
    GeneratorField.Field = 'PageID'
    GeneratorField.Generator = 'PageID_GEN'
    Left = 176
    Top = 16
    object CashBookDataSetPageID: TIntegerField
      FieldName = 'PageID'
      Origin = '"CashBook"."PageID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CashBookDataSetFirmID: TIntegerField
      FieldName = 'FirmID'
      Origin = '"CashBook"."FirmID"'
    end
    object CashBookDataSetDate: TDateField
      FieldName = 'Date'
      Origin = '"CashBook"."Date"'
    end
    object CashBookDataSetNumber: TIntegerField
      FieldName = 'Number'
      Origin = '"CashBook"."Number"'
    end
    object CashBookDataSetInitialAmount: TIBBCDField
      FieldName = 'InitialAmount'
      Origin = '"CashBook"."InitialAmount"'
      Precision = 15
      Size = 2
    end
    object CashBookDataSetFinalAmount: TIBBCDField
      FieldName = 'FinalAmount'
      Origin = '"CashBook"."FinalAmount"'
      Precision = 15
      Size = 2
    end
  end
  object CashBookDataSource: TDataSource
    DataSet = CashBookDataSet
    Left = 168
    Top = 112
  end
  object CashBookTransaction: TIBTransaction
    DefaultDatabase = StoreDataModule.Database
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saCommit
    Left = 200
    Top = 64
  end
  object CashBookItemQuery: TIBQuery
    Database = StoreDataModule.Database
    Transaction = CashBookTransaction
    OnCalcFields = CashBookItemQueryCalcFields
    DataSource = CashBookDataSource
    SQL.Strings = (
      
        'SELECT "Payments"."Date", "Payments"."Number", "Payments"."Debit' +
        '", "Payments"."TotalPay", "Payments"."Type", "Customers"."Custom' +
        'erName"'
      'FROM "Payments", "Customers"'
      
        'WHERE ("Payments"."PageID" = :"PageID") AND ("Payments"."Custome' +
        'rID" = "Customers"."CustomerID")')
    Left = 232
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PageID'
        ParamType = ptUnknown
        Size = 4
      end>
    object CashBookItemQueryDate: TDateField
      FieldName = 'Date'
      Origin = '"Payments"."Date"'
    end
    object CashBookItemQueryNumber: TIBStringField
      FieldName = 'Number'
      Origin = '"Payments"."Number"'
      Size = 10
    end
    object CashBookItemQueryDebit: TIntegerField
      FieldName = 'Debit'
      Origin = '"Payments"."Debit"'
    end
    object CashBookItemQueryTotalPay: TIBBCDField
      FieldName = 'TotalPay'
      Origin = '"Payments"."TotalPay"'
      Precision = 15
      Size = 2
    end
    object CashBookItemQueryType: TSmallintField
      FieldName = 'Type'
      Origin = '"Payments"."Type"'
    end
    object CashBookItemQueryCustomerName: TIBStringField
      FieldName = 'CustomerName'
      Origin = '"Customers"."CustomerName"'
      Size = 84
    end
    object CashBookItemQueryReceipt: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Receipt'
      Calculated = True
    end
    object CashBookItemQueryExpense: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Expense'
      Calculated = True
    end
  end
  object CashBookItemDataSource: TDataSource
    DataSet = CashBookItemQuery
    Left = 232
    Top = 112
  end
  object CirculateQuery: TIBQuery
    Database = StoreDataModule.Database
    Transaction = CirculateTransaction
    BeforeOpen = CirculateQueryBeforeOpen
    OnCalcFields = CashBookItemQueryCalcFields
    SQL.Strings = (
      'SELECT *'
      'FROM "Store_Qty"(:MainFirm, now, now)'
      ''
      'ORDER BY "ProductFullName"')
    Left = 360
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'MainFirm'
        ParamType = ptUnknown
      end>
    object CirculateQueryStoreID: TIntegerField
      FieldName = 'StoreID'
      Origin = '"Store_Qty"."StoreID"'
    end
    object CirculateQueryProductID: TIntegerField
      FieldName = 'ProductID'
      Origin = '"Store_Qty"."ProductID"'
    end
    object CirculateQueryAccountPrice: TIBBCDField
      FieldName = 'AccountPrice'
      Origin = '"Store_Qty"."AccountPrice"'
      Precision = 15
      Size = 2
    end
    object CirculateQueryProductFullName: TIBStringField
      FieldName = 'ProductFullName'
      Origin = '"Store_Qty"."ProductFullName"'
      Size = 84
    end
    object CirculateQueryDivisionID: TIntegerField
      FieldName = 'DivisionID'
      Origin = '"Store_Qty"."DivisionID"'
    end
    object CirculateQueryTopQty: TIBBCDField
      FieldName = 'TopQty'
      Origin = '"Store_Qty"."TopQty"'
      Precision = 9
      Size = 3
    end
    object CirculateQueryTopAmount: TIBBCDField
      FieldName = 'TopAmount'
      Origin = '"Store_Qty"."TopAmount"'
      Precision = 15
      Size = 2
    end
    object CirculateQueryReceiptQty: TIBBCDField
      FieldName = 'ReceiptQty'
      Origin = '"Store_Qty"."ReceiptQty"'
      Precision = 9
      Size = 3
    end
    object CirculateQueryReceiptAmount: TIBBCDField
      FieldName = 'ReceiptAmount'
      Origin = '"Store_Qty"."ReceiptAmount"'
      Precision = 15
      Size = 2
    end
    object CirculateQueryExpenseQty: TIBBCDField
      FieldName = 'ExpenseQty'
      Origin = '"Store_Qty"."ExpenseQty"'
      Precision = 9
      Size = 3
    end
    object CirculateQueryExpenseAmount: TIBBCDField
      FieldName = 'ExpenseAmount'
      Origin = '"Store_Qty"."ExpenseAmount"'
      Precision = 15
      Size = 2
    end
    object CirculateQueryBottomQty: TIBBCDField
      FieldName = 'BottomQty'
      Origin = '"Store_Qty"."BottomQty"'
      Precision = 9
      Size = 3
    end
    object CirculateQueryBottomAmount: TIBBCDField
      FieldName = 'BottomAmount'
      Origin = '"Store_Qty"."BottomAmount"'
      Precision = 15
      Size = 2
    end
  end
  object CirculateTransaction: TIBTransaction
    DefaultDatabase = StoreDataModule.Database
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saCommit
    Left = 376
    Top = 64
  end
  object CirculateDataSource: TDataSource
    DataSet = CirculateQuery
    Left = 360
    Top = 112
  end
  object QtyDateStoredProc: TIBStoredProc
    Database = StoreDataModule.Database
    Transaction = QtyDateTransaction
    StoredProcName = 'Store_Qty_Date'
    Left = 456
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'MAINFIRM'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'TOPDATE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'BOTTOMDATE'
        ParamType = ptInput
      end>
  end
  object QtyDateTransaction: TIBTransaction
    DefaultDatabase = StoreDataModule.Database
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saCommit
    Left = 456
    Top = 64
  end
  object DateQuery: TIBQuery
    Database = StoreDataModule.Database
    Transaction = CirculateTransaction
    SQL.Strings = (
      'SELECT "Date"'
      'FROM "DateStore"'
      ''
      'ORDER BY "Date"')
    Left = 400
    Top = 16
    object DateQueryDate: TDateField
      FieldName = 'Date'
      Origin = '"DateStore"."Date"'
      Required = True
    end
  end
  object RemainsQuery: TIBQuery
    Database = StoreDataModule.Database
    Transaction = RemainsTransaction
    BeforeOpen = CirculateQueryBeforeOpen
    OnCalcFields = CashBookItemQueryCalcFields
    DataSource = CategoryDataSource
    SQL.Strings = (
      'SELECT *'
      'FROM "Remains_Qty"(:MainFirm, :DivisionID, :PriceID, :WorkDate)'
      'WHERE "CategoryID" = :"CategoryID"'
      'ORDER BY "ProductFullName"')
    Left = 320
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'MainFirm'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DivisionID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PriceID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WorkDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CategoryID'
        ParamType = ptUnknown
      end>
    object RemainsQueryStoreID: TIntegerField
      FieldName = 'StoreID'
      Origin = '"Remains_Qty"."StoreID"'
    end
    object RemainsQueryProductID: TIntegerField
      FieldName = 'ProductID'
      Origin = '"Remains_Qty"."ProductID"'
    end
    object RemainsQueryCategoryID: TIntegerField
      FieldName = 'CategoryID'
      Origin = '"Remains_Qty"."CategoryID"'
    end
    object RemainsQueryProductFullName: TIBStringField
      FieldName = 'ProductFullName'
      Origin = '"Remains_Qty"."ProductFullName"'
      Size = 84
    end
    object RemainsQueryPack: TSmallintField
      FieldName = 'Pack'
      Origin = '"Remains_Qty"."Pack"'
    end
    object RemainsQueryMeasureName: TIBStringField
      FieldName = 'MeasureName'
      Origin = '"Remains_Qty"."MeasureName"'
      Size = 84
    end
    object RemainsQueryPrice: TIBBCDField
      FieldName = 'Price'
      Origin = '"Remains_Qty"."Price"'
      Precision = 15
      Size = 2
    end
    object RemainsQueryTallyQty: TIBBCDField
      FieldName = 'TallyQty'
      Origin = '"Remains_Qty"."TallyQty"'
      Precision = 9
      Size = 3
    end
    object RemainsQueryTallyAmount: TIBBCDField
      FieldName = 'TallyAmount'
      Origin = '"Remains_Qty"."TallyAmount"'
      Precision = 15
      Size = 2
    end
  end
  object RemainsTransaction: TIBTransaction
    DefaultDatabase = StoreDataModule.Database
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saCommit
    Left = 296
    Top = 64
  end
  object CategoryDataSource: TDataSource
    DataSet = CategoryQuery
    Left = 280
    Top = 112
  end
  object CategoryQuery: TIBQuery
    Database = StoreDataModule.Database
    Transaction = RemainsTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM "Categories"'
      'ORDER BY "CategoryName"')
    Left = 280
    Top = 16
    object CategoryQueryCategoryID: TIntegerField
      FieldName = 'CategoryID'
      Origin = '"Categories"."CategoryID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CategoryQueryCategoryName: TIBStringField
      FieldName = 'CategoryName'
      Origin = '"Categories"."CategoryName"'
      Size = 84
    end
    object CategoryQueryGroupID: TIntegerField
      FieldName = 'GroupID'
      Origin = '"Categories"."GroupID"'
    end
  end
  object CommodityExpenseQuery: TIBQuery
    Database = StoreDataModule.Database
    Transaction = StoreDataModule.DefaultTransaction
    SQL.Strings = (
      
        'SELECT "Customers"."CustomerName", "Orders"."Date", "Orders"."Nu' +
        'mber", "Orders"."PayDate", "Orders"."OutAmount", "Orders"."OutAm' +
        'ountVAT", "Orders"."ProperID"'
      'FROM "Orders", "Customers"'
      
        'WHERE ("Orders"."OutDivisionID" = :DivisionID OR "Orders"."OutDi' +
        'visionID" IN (SELECT "DivisionID" FROM "Divisions" WHERE "Custom' +
        'erID" = :MainFirm)) AND ("Orders"."CustomerID" = "Customers"."Cu' +
        'stomerID") AND ("Orders"."ProperID" IN (1, 2))'
      'AND ("Orders"."Date" BETWEEN :TopDate AND :BottomDate)'
      'ORDER BY "Orders"."Date"')
    Left = 544
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DivisionID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MainFirm'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TopDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BottomDate'
        ParamType = ptUnknown
      end>
    object CommodityExpenseQueryCustomerName: TIBStringField
      FieldName = 'CustomerName'
      Origin = '"Customers"."CustomerName"'
      Size = 84
    end
    object CommodityExpenseQueryDate: TDateField
      FieldName = 'Date'
      Origin = '"Orders"."Date"'
    end
    object CommodityExpenseQueryNumber: TIBStringField
      FieldName = 'Number'
      Origin = '"Orders"."Number"'
      Size = 10
    end
    object CommodityExpenseQueryPayDate: TDateField
      FieldName = 'PayDate'
      Origin = '"Orders"."PayDate"'
    end
    object CommodityExpenseQueryOutAmount: TIBBCDField
      FieldName = 'OutAmount'
      Origin = '"Orders"."OutAmount"'
      Precision = 15
      Size = 2
    end
    object CommodityExpenseQueryOutAmountVAT: TIBBCDField
      FieldName = 'OutAmountVAT'
      Origin = '"Orders"."OutAmountVAT"'
      Precision = 15
      Size = 2
    end
    object CommodityExpenseQueryProperID: TIntegerField
      FieldName = 'ProperID'
      Origin = '"Orders"."ProperID"'
    end
  end
  object CommodityReceiptQuery: TIBQuery
    Database = StoreDataModule.Database
    Transaction = StoreDataModule.DefaultTransaction
    SQL.Strings = (
      
        'SELECT "Customers"."CustomerName", "Orders"."Date", "Orders"."Nu' +
        'mber", "Orders"."PayDate", "Orders"."InAmount", "Orders"."InAmou' +
        'ntVAT", "Orders"."ProperID"'
      'FROM "Orders", "Customers"'
      
        'WHERE ("Orders"."InDivisionID" = :DivisionID OR "Orders"."InDivi' +
        'sionID" IN (SELECT "DivisionID" FROM "Divisions" WHERE "Customer' +
        'ID" = :MainFirm)) AND ("Orders"."CustomerID" = "Customers"."Cust' +
        'omerID") AND ("Orders"."ProperID" = 0)'
      'AND ("Orders"."Date" BETWEEN :TopDate AND :BottomDate)'
      'ORDER BY "Orders"."Date"')
    Left = 592
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DivisionID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MainFirm'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TopDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BottomDate'
        ParamType = ptUnknown
      end>
    object IBStringField1: TIBStringField
      FieldName = 'CustomerName'
      Origin = '"Customers"."CustomerName"'
      Size = 84
    end
    object DateField1: TDateField
      FieldName = 'Date'
      Origin = '"Orders"."Date"'
    end
    object CommodityReceiptQueryNumber: TIBStringField
      FieldName = 'Number'
      Origin = '"Orders"."Number"'
      Size = 10
    end
    object CommodityReceiptQueryPayDate: TDateField
      FieldName = 'PayDate'
      Origin = '"Orders"."PayDate"'
    end
    object CommodityReceiptQueryInAmount: TIBBCDField
      FieldName = 'InAmount'
      Origin = '"Orders"."InAmount"'
      Precision = 15
      Size = 2
    end
    object CommodityReceiptQueryInAmountVAT: TIBBCDField
      FieldName = 'InAmountVAT'
      Origin = '"Orders"."InAmountVAT"'
      Precision = 15
      Size = 2
    end
    object IntegerField2: TIntegerField
      FieldName = 'ProperID'
      Origin = '"Orders"."ProperID"'
    end
  end
  object CommodityPaymentQuery: TIBQuery
    Database = StoreDataModule.Database
    Transaction = StoreDataModule.DefaultTransaction
    SQL.Strings = (
      
        'SELECT "Customers"."CustomerName", "Orders"."Date", "Orders"."Nu' +
        'mber", "Orders"."ProperID", "Payments"."Date" AS "PayDate", "Pay' +
        'Orders"."Pay", "Payments"."Cash"'
      'FROM "Orders", "Customers","Payments", "PayOrders"'
      
        'WHERE ("Orders"."OutDivisionID" = :DivisionID OR "Orders"."OutDi' +
        'visionID" IN (SELECT "DivisionID" FROM "Divisions" WHERE "Custom' +
        'erID" = :MainFirm)) AND ("PayOrders"."OrderID" = "Orders"."Order' +
        'ID") AND ("PayOrders"."PaymentID" = "Payments"."PaymentID") AND ' +
        '("Payments"."CustomerID" = "Customers"."CustomerID") AND ("Payme' +
        'nts"."Type" = -1)'
      'AND ("Payments"."Date" BETWEEN :TopDate AND :BottomDate)'
      'ORDER BY "Orders"."Date", "Orders"."Number", "Payments"."Date"')
    Left = 544
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DivisionID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MainFirm'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TopDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BottomDate'
        ParamType = ptUnknown
      end>
    object CommodityPaymentQueryCustomerName: TIBStringField
      FieldName = 'CustomerName'
      Origin = '"Customers"."CustomerName"'
      Size = 84
    end
    object CommodityPaymentQueryDate: TDateField
      FieldName = 'Date'
      Origin = '"Orders"."Date"'
    end
    object CommodityPaymentQueryNumber: TIBStringField
      FieldName = 'Number'
      Origin = '"Orders"."Number"'
      Size = 10
    end
    object CommodityPaymentQueryProperID: TIntegerField
      FieldName = 'ProperID'
      Origin = '"Orders"."ProperID"'
    end
    object CommodityPaymentQueryPayDate: TDateField
      FieldName = 'PayDate'
      Origin = '"Payments"."Date"'
    end
    object CommodityPaymentQueryPay: TIBBCDField
      FieldName = 'Pay'
      Origin = '"PayOrders"."Pay"'
      Precision = 15
      Size = 2
    end
    object CommodityPaymentQueryCash: TSmallintField
      FieldName = 'Cash'
      Origin = '"Payments"."Cash"'
    end
  end
  object ReviseExpenseQuery: TIBQuery
    Database = StoreDataModule.Database
    Transaction = StoreDataModule.DefaultTransaction
    SQL.Strings = (
      
        'SELECT "Orders"."Date", "Orders"."Number", "Orders"."PayDate", "' +
        'Orders"."TotalAmount", "Orders"."Pay", "Orders"."ProperID", "Div' +
        'isions"."DivisionName"'
      'FROM "Orders", "Divisions"'
      
        'WHERE ("Orders"."FirmID" = :MainFirm) AND ("Orders"."CustomerID"' +
        ' = :"CustomerID") AND ("Orders"."OutDivisionID" = "Divisions"."D' +
        'ivisionID") AND ("Orders"."ProperID" IN (1, 2))'
      'AND ("Orders"."Date" BETWEEN :TopDate AND :BottomDate)'
      'ORDER BY "Orders"."Date"')
    Left = 664
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'MainFirm'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CustomerID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TopDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BottomDate'
        ParamType = ptUnknown
      end>
    object ReviseExpenseQueryDate: TDateField
      FieldName = 'Date'
      Origin = '"Orders"."Date"'
    end
    object ReviseExpenseQueryNumber: TIBStringField
      FieldName = 'Number'
      Origin = '"Orders"."Number"'
      Size = 10
    end
    object ReviseExpenseQueryPayDate: TDateField
      FieldName = 'PayDate'
      Origin = '"Orders"."PayDate"'
    end
    object ReviseExpenseQueryTotalAmount: TIBBCDField
      FieldName = 'TotalAmount'
      Origin = '"Orders"."TotalAmount"'
      Precision = 15
      Size = 2
    end
    object ReviseExpenseQueryPay: TIBBCDField
      FieldName = 'Pay'
      Origin = '"Orders"."Pay"'
      Precision = 15
      Size = 2
    end
    object ReviseExpenseQueryProperID: TIntegerField
      FieldName = 'ProperID'
      Origin = '"Orders"."ProperID"'
    end
    object ReviseExpenseQueryDivisionName: TIBStringField
      FieldName = 'DivisionName'
      Origin = '"Divisions"."DivisionName"'
      Size = 84
    end
  end
  object ReviseReceiptQuery: TIBQuery
    Database = StoreDataModule.Database
    Transaction = StoreDataModule.DefaultTransaction
    SQL.Strings = (
      
        'SELECT "Orders"."Date", "Orders"."Number", "Orders"."PayDate", "' +
        'Orders"."TotalAmount", "Orders"."Pay", "Orders"."ProperID", "Div' +
        'isions"."DivisionName"'
      'FROM "Orders", "Divisions"'
      
        'WHERE ("Orders"."FirmID" = :MainFirm) AND ("Orders"."CustomerID"' +
        ' = :"CustomerID") AND ("Orders"."InDivisionID" = "Divisions"."Di' +
        'visionID") AND ("Orders"."ProperID" = 0)'
      'AND ("Orders"."Date" BETWEEN :TopDate AND :BottomDate)'
      'ORDER BY "Orders"."Date"')
    Left = 712
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'MainFirm'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CustomerID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TopDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BottomDate'
        ParamType = ptUnknown
      end>
    object ReviseReceiptQueryDate: TDateField
      FieldName = 'Date'
      Origin = '"Orders"."Date"'
    end
    object ReviseReceiptQueryNumber: TIBStringField
      FieldName = 'Number'
      Origin = '"Orders"."Number"'
      Size = 10
    end
    object ReviseReceiptQueryPayDate: TDateField
      FieldName = 'PayDate'
      Origin = '"Orders"."PayDate"'
    end
    object ReviseReceiptQueryTotalAmount: TIBBCDField
      FieldName = 'TotalAmount'
      Origin = '"Orders"."TotalAmount"'
      Precision = 15
      Size = 2
    end
    object ReviseReceiptQueryPay: TIBBCDField
      FieldName = 'Pay'
      Origin = '"Orders"."Pay"'
      Precision = 15
      Size = 2
    end
    object ReviseReceiptQueryProperID: TIntegerField
      FieldName = 'ProperID'
      Origin = '"Orders"."ProperID"'
    end
    object ReviseReceiptQueryDivisionName: TIBStringField
      FieldName = 'DivisionName'
      Origin = '"Divisions"."DivisionName"'
      Size = 84
    end
  end
  object RevisePaymentQuery: TIBQuery
    Database = StoreDataModule.Database
    Transaction = StoreDataModule.DefaultTransaction
    SQL.Strings = (
      
        'SELECT "Orders"."Date", "Orders"."Number", "Orders"."ProperID", ' +
        '"Payments"."Date" AS "PayDate", "PayOrders"."Pay", "Payments"."C' +
        'ash", "Payments"."Type"'
      'FROM "Orders", "Customers","Payments", "PayOrders"'
      
        'WHERE ("Orders"."FirmID" = :MainFirm) AND ("Orders"."CustomerID"' +
        ' = :"CustomerID") AND ("PayOrders"."OrderID" = "Orders"."OrderID' +
        '") AND ("PayOrders"."PaymentID" = "Payments"."PaymentID") AND ("' +
        'Payments"."CustomerID" = "Customers"."CustomerID")'
      'AND ("Payments"."Date" BETWEEN :TopDate AND :BottomDate)'
      'ORDER BY "Orders"."Date", "Orders"."Number", "Payments"."Date"')
    Left = 664
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'MainFirm'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CustomerID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TopDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BottomDate'
        ParamType = ptUnknown
      end>
    object DateField5: TDateField
      FieldName = 'Date'
      Origin = '"Orders"."Date"'
    end
    object IBStringField7: TIBStringField
      FieldName = 'Number'
      Origin = '"Orders"."Number"'
      Size = 10
    end
    object IntegerField4: TIntegerField
      FieldName = 'ProperID'
      Origin = '"Orders"."ProperID"'
    end
    object DateField6: TDateField
      FieldName = 'PayDate'
      Origin = '"Payments"."Date"'
    end
    object IBBCDField5: TIBBCDField
      FieldName = 'Pay'
      Origin = '"PayOrders"."Pay"'
      Precision = 15
      Size = 2
    end
    object SmallintField1: TSmallintField
      FieldName = 'Cash'
      Origin = '"Payments"."Cash"'
    end
    object RevisePaymentQueryType: TSmallintField
      FieldName = 'Type'
      Origin = '"Payments"."Type"'
    end
  end
end
