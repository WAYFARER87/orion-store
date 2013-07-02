object StoreDataModule: TStoreDataModule
  OldCreateOrder = False
  Left = 426
  Top = 100
  Height = 620
  Width = 852
  object CustomerDataSource: TDataSource
    DataSet = CustomerDataSet
    Left = 232
    Top = 104
  end
  object ProductDataSource: TDataSource
    DataSet = ProductDataSet
    Left = 464
    Top = 104
  end
  object CategoryDataSource: TDataSource
    DataSet = CategoryDataSet
    Left = 352
    Top = 104
  end
  object Database: TIBDatabase
    LoginPrompt = False
    DefaultTransaction = DefaultTransaction
    TraceFlags = [tfQPrepare, tfQExecute, tfQFetch, tfError, tfStmt, tfConnect, tfTransact, tfBlob, tfService, tfMisc]
    AfterConnect = rrr
    BeforeConnect = DatabaseBeforeConnect
    Left = 24
    Top = 8
  end
  object CustomerDataSet: TIBDataSet
    Database = Database
    Transaction = CustomerTransaction
    AfterOpen = CustomerDataSetAfterOpen
    DeleteSQL.Strings = (
      'DELETE FROM "Customers"'
      'WHERE'
      '  "CustomerID" = :"OLD_CustomerID"')
    InsertSQL.Strings = (
      'INSERT INTO "Customers"'
      
        '  ("CustomerID", "CustomerName", "CustomerFullName", "Address", ' +
        '"Phone", "OKONH", "OKPO", "INN", "KPP", "Registration", "PassSer' +
        'ies", "PassNo", "PassIssuer", "PassDate", "BankID", "Account", "' +
        'PriceID", "DelayPay", "Note", "VAT",  "Firm")'
      'VALUES'
      
        '  (:"CustomerID", :"CustomerName", :"CustomerFullName", :"Addres' +
        's", :"Phone", :"OKONH", :"OKPO", :"INN", :"KPP", :"Registration"' +
        ', :"PassSeries", :"PassNo", :"PassIssuer", :"PassDate", :"BankID' +
        '", :"Account", :"PriceID", :"DelayPay", :"Note", :"VAT",  :"Firm' +
        '")')
    RefreshSQL.Strings = (
      'SELECT'
      '  "CustomerID",'
      '  "CustomerName",'
      '  "CustomerFullName",'
      '  "Address",'
      '  "Phone",'
      '  "OKONH",'
      '  "OKPO",'
      '  "INN",'
      '  "KPP",'
      '  "Registration",'
      '  "PassSeries",'
      '  "PassNo",'
      '  "PassIssuer",'
      '  "PassDate",'
      '  "BankID",'
      '  "Account",'
      '  "PriceID",'
      '  "DelayPay",'
      '  "Note",'
      '  "VAT",'
      '  "Firm"'
      'FROM "Customers"'
      'WHERE'
      '  "CustomerID" = :"CustomerID"')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM "Customers"'
      'WHERE ("Firm" != 1) AND ("CustomerID" > 0)'
      ''
      'ORDER BY "CustomerName"')
    ModifySQL.Strings = (
      'UPDATE "Customers"'
      'SET'
      '  "CustomerID" = :"CustomerID",'
      '  "CustomerName" = :"CustomerName",'
      '  "CustomerFullName" = :"CustomerFullName",'
      '  "Address" = :"Address",'
      '  "Phone" = :"Phone",'
      '  "OKONH" = :"OKONH",'
      '  "OKPO" = :"OKPO",'
      '  "INN" = :"INN",'
      '  "KPP" = :"KPP",'
      '  "Registration" = :"Registration",'
      '  "PassSeries" = :"PassSeries",'
      '  "PassNo" = :"PassNo",'
      '  "PassIssuer" = :"PassIssuer",'
      '  "PassDate" = :"PassDate",'
      '  "BankID" = :"BankID",'
      '  "Account" = :"Account",'
      '  "PriceID" = :"PriceID",'
      '  "DelayPay" = :"DelayPay",'
      '  "Note" = :"Note",'
      '  "VAT" = :"VAT",'
      '  "Firm" = :"Firm"'
      'WHERE'
      '  "CustomerID" = :"OLD_CustomerID"')
    GeneratorField.Field = 'CustomerID'
    GeneratorField.Generator = 'CustomerID_GEN'
    Left = 232
    Top = 8
    object CustomerDataSetCustomerID: TIntegerField
      FieldName = 'CustomerID'
      Origin = 'Customer.CustomerID'
      Required = True
    end
    object CustomerDataSetCustomerName: TIBStringField
      FieldName = 'CustomerName'
      Origin = '"Customers"."CustomerName"'
      Size = 84
    end
    object CustomerDataSetCustomerFullName: TIBStringField
      FieldName = 'CustomerFullName'
      Origin = '"Customers"."CustomerFullName"'
      Size = 84
    end
    object CustomerDataSetAddress: TIBStringField
      FieldName = 'Address'
      Origin = '"Customer"."Address"'
      Size = 125
    end
    object CustomerDataSetPhone: TIBStringField
      FieldName = 'Phone'
      Origin = '"Customers"."Phone"'
      Size = 15
    end
    object CustomerDataSetOKONH: TIBStringField
      FieldName = 'OKONH'
      Origin = '"Customers"."OKONH"'
      Size = 12
    end
    object CustomerDataSetOKPO: TIBStringField
      FieldName = 'OKPO'
      Origin = '"Customers"."OKPO"'
      Size = 12
    end
    object CustomerDataSetINN: TIBStringField
      FieldName = 'INN'
      Origin = 'Customer.INN'
      Size = 12
    end
    object CustomerDataSetKPP: TIBStringField
      FieldName = 'KPP'
      Origin = '"Customer"."KPP"'
      Size = 9
    end
    object CustomerDataSetRegistration: TIBStringField
      FieldName = 'Registration'
      Origin = '"Customer"."Registration"'
      Size = 125
    end
    object CustomerDataSetPassSeries: TIBStringField
      FieldName = 'PassSeries'
      Origin = '"Customers"."PassSeries"'
      Size = 12
    end
    object CustomerDataSetPassNo: TIBStringField
      FieldName = 'PassNo'
      Origin = '"Customers"."PassNo"'
      Size = 12
    end
    object CustomerDataSetPassIssuer: TIBStringField
      FieldName = 'PassIssuer'
      Origin = '"Customers"."PassIssuer"'
      Size = 84
    end
    object CustomerDataSetPassDate: TDateField
      FieldName = 'PassDate'
      Origin = '"Customers"."PassDate"'
    end
    object CustomerDataSetBankID: TIntegerField
      FieldName = 'BankID'
      Origin = '"Customer"."BankID"'
    end
    object CustomerDataSetAccount: TIBStringField
      FieldName = 'Account'
      Origin = '"Customer"."Account"'
    end
    object CustomerDataSetPriceID: TIntegerField
      FieldName = 'PriceID'
      Origin = '"Customers"."PriceID"'
    end
    object CustomerDataSetDelayPay: TSmallintField
      FieldName = 'DelayPay'
      Origin = '"Customers"."DelayPay"'
    end
    object CustomerDataSetNote: TBlobField
      FieldName = 'Note'
      Origin = '"Customers"."Note"'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object CustomerDataSetVAT: TSmallintField
      FieldName = 'VAT'
      Origin = '"Customers"."VAT"'
    end
    object CustomerDataSetFirm: TSmallintField
      FieldName = 'Firm'
      Origin = '"Customers"."Firm"'
    end
  end
  object CategoryDataSet: TIBDataSet
    Database = Database
    Transaction = CategoryTransaction
    AfterOpen = CategoryDataSetAfterOpen
    DeleteSQL.Strings = (
      'DELETE FROM "Categories"'
      'WHERE'
      '  "CategoryID" = :"OLD_CategoryID"')
    InsertSQL.Strings = (
      'INSERT INTO "Categories"'
      '  ("CategoryID", "CategoryName", "GroupID")'
      'VALUES'
      '  (:"CategoryID", :"CategoryName", :"GroupID")')
    RefreshSQL.Strings = (
      'SELECT'
      '  "CategoryID",'
      '  "CategoryName",'
      '  "GroupID"'
      'FROM "Categories"'
      'WHERE'
      '  "CategoryID" = :"CategoryID"')
    SelectSQL.Strings = (
      'SELECT "Categories".*, "Groups"."GroupName"'
      'FROM "Categories", "Groups"'
      
        'WHERE ("Categories"."CategoryID" > 0) AND ("Categories"."GroupID' +
        '" = "Groups"."GroupID")'
      'ORDER BY "CategoryName"')
    ModifySQL.Strings = (
      'UPDATE "Categories"'
      'SET'
      '  "CategoryID" = :"CategoryID",'
      '  "CategoryName" = :"CategoryName",'
      '  "GroupID" = :"GroupID"'
      'WHERE'
      '  "CategoryID" = :"OLD_CategoryID"')
    GeneratorField.Field = 'CategoryID'
    GeneratorField.Generator = 'CategoryID_GEN'
    Left = 352
    Top = 8
    object CategoryDataSetCategoryID: TIntegerField
      FieldName = 'CategoryID'
      Origin = '"Category"."CategoryID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CategoryDataSetCategoryName: TIBStringField
      FieldName = 'CategoryName'
      Origin = '"Category"."CategoryName"'
      Size = 125
    end
    object CategoryDataSetGroupID: TIntegerField
      FieldName = 'GroupID'
      Origin = '"Categories"."GroupID"'
    end
    object CategoryDataSetGroupName: TIBStringField
      FieldName = 'GroupName'
      Origin = '"Groups"."GroupName"'
      Size = 84
    end
    object CategoryDataSetVATRateName: TStringField
      FieldKind = fkLookup
      FieldName = 'VATRateName'
      LookupDataSet = CategoryVATQuery
      LookupKeyFields = 'CategoryID'
      LookupResultField = 'VATRateName'
      KeyFields = 'CategoryID'
      Lookup = True
    end
  end
  object ProductDataSet: TIBDataSet
    Database = Database
    Transaction = ProductTransaction
    AfterOpen = ProductDataSetAfterOpen
    DeleteSQL.Strings = (
      'DELETE FROM "Products"'
      'WHERE'
      '  "ProductID" = :"OLD_ProductID"')
    InsertSQL.Strings = (
      'INSERT INTO "Products"'
      
        '  ("ProductID", "Article", "ProductName", "Note", "CategoryID", ' +
        '"MeasureID", "Pack", "ProducerID", "CountryID", "Description", "' +
        'Weight")'
      'VALUES'
      
        '  (:"ProductID", :"Article", :"ProductName", :"Note", :"Category' +
        'ID", :"MeasureID", :"Pack", :"ProducerID", :"CountryID", :"Descr' +
        'iption", :"Weight")')
    RefreshSQL.Strings = (
      'SELECT'
      '  "ProductID",'
      '  "Article",'
      '  "ProductName",'
      '  "Note",'
      '  "CategoryID",'
      '  "MeasureID",'
      '  "Pack",'
      '  "ProducerID",'
      '  "CountryID",'
      '  "Description",'
      '  "Weight"'
      'FROM "Products"'
      'WHERE'
      '  "ProductID" = :"ProductID"')
    SelectSQL.Strings = (
      
        'SELECT "Products".*, "Categories"."CategoryName", "Measures"."Me' +
        'asureName", "Producers"."ProducerName", "Countrys"."CountryName"'
      
        'FROM "Products", "Categories", "Measures", "Producers", "Country' +
        's"'
      
        'WHERE ("Products"."CategoryID" = "Categories"."CategoryID") AND ' +
        '("Products"."MeasureID" = "Measures"."MeasureID") AND ("Products' +
        '"."ProducerID" = "Producers"."ProducerID") AND ("Products"."Coun' +
        'tryID" = "Countrys"."CountryID")'
      ''
      'ORDER BY "ProductName"')
    ModifySQL.Strings = (
      'UPDATE "Products"'
      'SET'
      '  "ProductID" = :"ProductID",'
      '  "Article" = :"Article",'
      '  "ProductName" = :"ProductName",'
      '  "Note" = :"Note",'
      '  "CategoryID" = :"CategoryID",'
      '  "MeasureID" = :"MeasureID",'
      '  "Pack" = :"Pack",'
      '  "ProducerID" = :"ProducerID",'
      '  "CountryID" = :"CountryID",'
      '  "Description" = :"Description",'
      '  "Weight" = :"Weight"'
      'WHERE'
      '  "ProductID" = :"OLD_ProductID"')
    GeneratorField.Field = 'ProductID'
    GeneratorField.Generator = 'ProductID_GEN'
    Left = 464
    Top = 8
    object ProductDataSetProductID: TIntegerField
      FieldName = 'ProductID'
      Origin = '"Products"."ProductID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ProductDataSetProductName: TIBStringField
      FieldName = 'ProductName'
      Origin = '"Products"."ProductName"'
      Size = 125
    end
    object ProductDataSetArticle: TIBStringField
      FieldName = 'Article'
      Origin = '"Products"."Article"'
      Size = 125
    end
    object ProductDataSetNote: TIBStringField
      FieldName = 'Note'
      Origin = '"Products"."Note"'
      Size = 84
    end
    object ProductDataSetCategoryID: TIntegerField
      DisplayWidth = 10
      FieldName = 'CategoryID'
      Origin = '"Goods"."CategoryID"'
    end
    object ProductDataSetMeasureID: TIntegerField
      FieldName = 'MeasureID'
      Origin = '"Products"."MeasureID"'
    end
    object ProductDataSetPack: TSmallintField
      FieldName = 'Pack'
      Origin = '"Products"."Pack"'
    end
    object ProductDataSetProducerID: TIntegerField
      FieldName = 'ProducerID'
      Origin = '"Products"."ProducerID"'
    end
    object ProductDataSetCountryID: TIntegerField
      FieldName = 'CountryID'
      Origin = '"Products"."CountryID"'
    end
    object ProductDataSetDescription: TBlobField
      FieldName = 'Description'
      Origin = '"Products"."Description"'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object ProductDataSetWeight: TSmallintField
      FieldName = 'Weight'
      Origin = '"Products"."Weight"'
    end
    object ProductDataSetCategoryName: TIBStringField
      FieldName = 'CategoryName'
      Origin = '"Categories"."CategoryName"'
      Size = 84
    end
    object ProductDataSetMeasureName: TIBStringField
      FieldName = 'MeasureName'
      Origin = '"Measures"."MeasureName"'
      Size = 10
    end
    object ProductDataSetProducerName: TIBStringField
      FieldName = 'ProducerName'
      Origin = '"Producers"."ProducerName"'
      Size = 84
    end
    object ProductDataSetCountryName: TIBStringField
      FieldName = 'CountryName'
      Origin = '"Countrys"."CountryName"'
      Size = 84
    end
  end
  object CategoryTransaction: TIBTransaction
    DefaultDatabase = Database
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saCommit
    Left = 368
    Top = 56
  end
  object ProductTransaction: TIBTransaction
    DefaultDatabase = Database
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saCommit
    Left = 464
    Top = 56
  end
  object BuyOrderDataSet: TIBDataSet
    Database = Database
    Transaction = BuyOrderTransaction
    AfterOpen = BuyOrderDataSetAfterOpen
    BeforeOpen = BuyOrderDataSetBeforeOpen
    DeleteSQL.Strings = (
      'DELETE FROM "Orders"'
      'WHERE'
      '  "OrderID" = :"OLD_OrderID"')
    InsertSQL.Strings = (
      'INSERT INTO "Orders"'
      
        '  ("OrderID", "FirmID", "InDivisionID", "CustomerID", "Date", "N' +
        'umber", "IssueDate", "TotalAmountVAT", "TotalAmount", "Pay", "Pa' +
        'yDate", "PriceID", "Note", "ProperID")'
      'VALUES'
      
        '  (:"OrderID", :"FirmID", :"InDivisionID", :"CustomerID", :"Date' +
        '", :"Number", :"IssueDate", :"TotalAmountVAT", :"TotalAmount", :' +
        '"Pay", :"PayDate", :"PriceID", :"Note", :"ProperID")')
    RefreshSQL.Strings = (
      
        'SELECT "Orders".*,  "Customers"."CustomerName", "Divisions"."Div' +
        'isionName"'
      'FROM "Orders", "Customers", "Divisions"'
      'WHERE'
      
        '  ("Orders"."OrderID" = :"OrderID") AND ("Orders"."CustomerID" =' +
        ' "Customers"."CustomerID") AND ("Orders"."InDivisionID" = "Divis' +
        'ions"."DivisionID")')
    SelectSQL.Strings = (
      
        'SELECT "Orders".*, "Customers"."CustomerName", "Divisions"."Divi' +
        'sionName"'
      'FROM "Orders", "Customers", "Divisions"'
      
        'WHERE (("Orders"."FirmID" = :MainFirm) AND ("Orders"."ProperID" ' +
        '= 0)) AND ("Orders"."CustomerID" = "Customers"."CustomerID") AND' +
        ' ("Orders"."InDivisionID" = "Divisions"."DivisionID")'
      
        'AND ("Orders"."Date" >= :TopDate AND "Orders"."Date" <= :BottomD' +
        'ate)'
      ''
      'ORDER BY "Date", "OrderID"')
    ModifySQL.Strings = (
      'UPDATE "Orders"'
      'SET'
      '  "OrderID" = :"OrderID",'
      '  "FirmID" = :"FirmID",'
      '  "InDivisionID" = :"InDivisionID",'
      '  "CustomerID" = :"CustomerID",'
      '  "Date" = :"Date",'
      '  "Number" = :"Number",'
      '  "IssueDate" = :"IssueDate",'
      '  "TotalAmountVAT" = :"TotalAmountVAT",'
      '  "TotalAmount" = :"TotalAmount",'
      '  "Pay" = :"Pay",'
      '  "PayDate" = :"PayDate",'
      '  "PriceID" = :"PriceID",'
      '  "Note" = :"Note",'
      '  "ProperID" = :"ProperID"'
      'WHERE'
      '  "OrderID" = :"OLD_OrderID"')
    GeneratorField.Field = 'OrderID'
    GeneratorField.Generator = 'OrderID_GEN'
    Left = 640
    Top = 16
    object BuyOrderDataSetOrderID: TIntegerField
      FieldName = 'OrderID'
      Origin = '"Orders"."OrderID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object BuyOrderDataSetFirmID: TIntegerField
      FieldName = 'FirmID'
      Origin = '"Orders"."FirmID"'
    end
    object BuyOrderDataSetInDivisionID: TIntegerField
      FieldName = 'InDivisionID'
      Origin = '"Orders"."InDivisionID"'
    end
    object BuyOrderDataSetCustomerID: TIntegerField
      FieldName = 'CustomerID'
      Origin = '"Orders"."CustomerID"'
    end
    object BuyOrderDataSetDate: TDateField
      FieldName = 'Date'
      Origin = 'Invoice.Date'
    end
    object BuyOrderDataSetNumber: TIBStringField
      FieldName = 'Number'
      Origin = '"BuyInvoice"."Number"'
      Size = 10
    end
    object BuyOrderDataSetIssueDate: TDateField
      FieldName = 'IssueDate'
      Origin = '"BuyInvoice"."IssueDate"'
    end
    object BuyOrderDataSetTotalAmountVAT: TIBBCDField
      FieldName = 'TotalAmountVAT'
      Origin = '"Orders"."TotalAmountVAT"'
      Precision = 15
      Size = 2
    end
    object BuyOrderDataSetTotalAmount: TIBBCDField
      FieldName = 'TotalAmount'
      Origin = '"Orders"."TotalAmount"'
      Size = 2
    end
    object BuyOrderDataSetPay: TIBBCDField
      FieldName = 'Pay'
      Origin = 'BuyInvoice.Pay'
      Precision = 18
      Size = 2
    end
    object BuyOrderDataSetPayDate: TDateField
      FieldName = 'PayDate'
      Origin = '"Orders"."PayDate"'
    end
    object BuyOrderDataSetDebt: TIBBCDField
      FieldKind = fkInternalCalc
      FieldName = 'Debt'
      Origin = '"BuyInvoice"."Debt"'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object BuyOrderDataSetPriceID: TIntegerField
      FieldName = 'PriceID'
      Origin = '"Orders"."PriceID"'
    end
    object BuyOrderDataSetNote: TIBStringField
      FieldName = 'Note'
      Origin = '"Orders"."Note"'
      Size = 255
    end
    object BuyOrderDataSetUserName: TIBStringField
      FieldName = 'UserName'
      Origin = '"Orders"."UserName"'
      Size = 31
    end
    object BuyOrderDataSetProperID: TIntegerField
      FieldName = 'ProperID'
      Origin = '"Orders"."ProperID"'
    end
    object BuyOrderDataSetCustomerName: TIBStringField
      FieldName = 'CustomerName'
      Origin = '"Customers"."CustomerName"'
      Size = 84
    end
    object BuyOrderDataSetDivisionName: TIBStringField
      FieldName = 'DivisionName'
      Origin = '"Divisions"."DivisionName"'
      Size = 84
    end
  end
  object BuyOrderTransaction: TIBTransaction
    DefaultDatabase = Database
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saCommit
    Left = 688
    Top = 64
  end
  object BuyOrderDataSource: TDataSource
    DataSet = BuyOrderDataSet
    Left = 640
    Top = 112
  end
  object BuyStructureDataSource: TDataSource
    DataSet = BuyStructureDataSet
    Left = 672
    Top = 112
  end
  object CustomerTransaction: TIBTransaction
    DefaultDatabase = Database
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saCommit
    Left = 232
    Top = 56
  end
  object StoreTransaction: TIBTransaction
    DefaultDatabase = Database
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saCommit
    Left = 32
    Top = 200
  end
  object StoreQtyDataSource: TDataSource
    DataSet = StoreQtyQuery
    Left = 48
    Top = 248
  end
  object StoreProductDataSet: TIBDataSet
    Database = Database
    Transaction = StoreTransaction
    AfterOpen = StoreProductDataSetAfterOpen
    BeforeClose = StoreProductDataSetBeforeClose
    DeleteSQL.Strings = (
      'DELETE FROM "Products"'
      'WHERE'
      '  "ProductID" = :"OLD_ProductID"')
    InsertSQL.Strings = (
      'INSERT INTO "Products"'
      
        '  ("ProductID", "Article", "ProductName", "CategoryID", "Measure' +
        'ID", "ProducerID")'
      'VALUES'
      
        '  (:"ProductID", :"Article", :"ProductName", :"CategoryID", :"Me' +
        'asureID", :"ProducerID")')
    RefreshSQL.Strings = (
      'SELECT'
      '  "ProductID",'
      '  "Article",'
      '  "ProductName",'
      '  "CategoryID",'
      '  "MeasureID",'
      '  "ProducerID"'
      'FROM "Products"'
      'WHERE'
      '  "ProductID" = :"ProductID"')
    SelectSQL.Strings = (
      
        'SELECT "Products".*, "Categories"."CategoryName" || '#39' '#39' || "Prod' +
        'ucts"."ProductName" AS "ProductFullName", "Measures"."MeasureNam' +
        'e", "Producers"."ProducerName"'
      'FROM "Products", "Categories", "Measures", "Producers"'
      
        'WHERE ("Products"."CategoryID" = "Categories"."CategoryID") AND ' +
        '("Products"."MeasureID" = "Measures"."MeasureID") AND ("Products' +
        '"."ProducerID" = "Producers"."ProducerID")'
      ''
      ''
      ''
      'ORDER BY "Categories"."CategoryName", "Products"."ProductName"')
    ModifySQL.Strings = (
      'UPDATE "Products"'
      'SET'
      '  "ProductID" = :"ProductID",'
      '  "Article" = :"Article",'
      '  "ProductName" = :"ProductName",'
      '  "CategoryID" = :"CategoryID",'
      '  "MeasureID" = :"MeasureID",'
      '  "ProducerID" = :"ProducerID"'
      'WHERE'
      '  "ProductID" = :"OLD_ProductID"')
    GeneratorField.Field = 'ProductID'
    GeneratorField.Generator = 'ProductID_GEN'
    Left = 8
    Top = 152
    object StoreProductDataSetProductID: TIntegerField
      FieldName = 'ProductID'
      Origin = '"Products"."ProductID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StoreProductDataSetArticle: TIBStringField
      FieldName = 'Article'
      Origin = '"Products"."Article"'
      Size = 125
    end
    object StoreProductDataSetProductName: TIBStringField
      FieldName = 'ProductName'
      Origin = '"Products"."ProductName"'
      Size = 125
    end
    object IntegerField2: TIntegerField
      DisplayWidth = 10
      FieldName = 'CategoryID'
      Origin = '"Goods"."CategoryID"'
    end
    object StoreProductDataSetMeasureID: TIntegerField
      FieldName = 'MeasureID'
      Origin = '"Products"."MeasureID"'
    end
    object StoreProductDataSetProducerID: TIntegerField
      FieldName = 'ProducerID'
      Origin = '"Products"."ProducerID"'
    end
    object StoreProductDataSetProductFullName: TIBStringField
      FieldName = 'ProductFullName'
      ProviderFlags = []
      Size = 169
    end
    object StoreProductDataSetMeasureName: TIBStringField
      FieldName = 'MeasureName'
      Origin = '"Measures"."MeasureName"'
      Size = 10
    end
    object StoreProductDataSetProducerName: TIBStringField
      FieldName = 'ProducerName'
      Origin = '"Producers"."ProducerName"'
      Size = 84
    end
  end
  object StoreProductDataSource: TDataSource
    DataSet = StoreProductDataSet
    Left = 8
    Top = 248
  end
  object SaleStructureDataSet: TIBDataSet
    Database = Database
    Transaction = SaleOrderTransaction
    DeleteSQL.Strings = (
      'DELETE FROM "Structure"'
      'WHERE'
      
        '  ("OrderID" = :"OLD_OrderID") AND ("ProductID" = :"OLD_ProductI' +
        'D") AND ("StoreID" = :"OLD_StoreID") AND ("Price" = :"OLD_Price"' +
        ')')
    InsertSQL.Strings = (
      'INSERT INTO "Structure"'
      
        '  ("OrderID", "ProductID", "StoreID", "Qty", "Price", "VATRate",' +
        ' "Type")'
      'VALUES'
      
        '  (:"OrderID", :"ProductID", :"StoreID", :"Qty", :"Price", :"VAT' +
        'Rate", :"Type")')
    RefreshSQL.Strings = (
      'SELECT'
      '  "OrderID",'
      '  "ProductID",'
      '  "StoreID",'
      '  "Qty",'
      '  "Price",'
      '  "VATRate",'
      '  "AmountVAT",'
      '  "Amount",'
      '  "Type"'
      'FROM "Structure"'
      'WHERE'
      
        '  ("OrderID" = :"OrderID") AND ("ProductID" = :"OLD_ProductID") ' +
        'AND ("StoreID" = :"StoreID") AND ("Price" = :"Price")')
    SelectSQL.Strings = (
      
        'SELECT "Structure".*, "Categories"."CategoryName" || '#39' '#39' || "Pro' +
        'ducts"."ProductName" AS "ProductFullName", "StoreQty"."Qty" AS "' +
        'RemainQty", "Divisions"."DivisionName", "Products"."Pack"'
      
        'FROM "Structure", "Products", "Categories", "StoreQty", "Divisio' +
        'ns"'
      
        'WHERE ("Structure"."OrderID" = :"OrderID") AND (("Products"."Pro' +
        'ductID" = "Structure"."ProductID") AND ("Categories"."CategoryID' +
        '" = "Products"."CategoryID")) AND ("StoreQty"."StoreID" = "Struc' +
        'ture"."StoreID" AND "StoreQty"."DivisionID" = :"OutDivisionID") ' +
        'AND ("StoreQty"."DivisionID" = "Divisions"."DivisionID")')
    ModifySQL.Strings = (
      'UPDATE "Structure"'
      'SET'
      '  "OrderID" = :"OrderID",'
      '  "ProductID" = :"ProductID",'
      '  "StoreID" = :"StoreID",'
      '  "Qty" = :"Qty",'
      '  "Price" = :"Price",'
      '  "VATRate" = :"VATRate",'
      '  "Type" = :"Type"'
      'WHERE'
      
        '  ("OrderID" = :"OLD_OrderID") AND ("ProductID" = :"OLD_ProductI' +
        'D") AND ("StoreID" = :"OLD_StoreID") AND ("Price" = :"OLD_Price"' +
        ')')
    DataSource = SaleOrderDataSource
    Left = 848
    Top = 16
    object SaleStructureDataSetOrderID: TIntegerField
      FieldName = 'OrderID'
      Origin = '"SaleStructure"."OrderID"'
    end
    object SaleStructureDataSetProductID: TIntegerField
      FieldName = 'ProductID'
      Origin = '"SaleStructure"."ProductID"'
    end
    object SaleStructureDataSetStoreID: TIntegerField
      FieldName = 'StoreID'
      Origin = '"SaleStructure"."StoreID"'
    end
    object SaleStructureDataSetPrice: TIBBCDField
      FieldName = 'Price'
      Origin = '"Structure"."Price"'
      Precision = 9
      Size = 2
    end
    object SaleStructureDataSetQty: TIBBCDField
      FieldName = 'Qty'
      Origin = '"Structure"."Qty"'
      Precision = 9
      Size = 3
    end
    object SaleStructureDataSetVATRate: TIBBCDField
      FieldName = 'VATRate'
      Origin = '"Structure"."VATRate"'
      Precision = 4
      Size = 2
    end
    object SaleStructureDataSetAmountVAT: TIBBCDField
      FieldKind = fkInternalCalc
      FieldName = 'AmountVAT'
      Origin = '"SaleStructure"."AmountVAT"'
      ProviderFlags = []
      ReadOnly = True
      Precision = 15
      Size = 2
    end
    object SaleStructureDataSetAmount: TIBBCDField
      FieldKind = fkInternalCalc
      FieldName = 'Amount'
      Origin = '"SaleStructure"."Amount"'
      ProviderFlags = []
      ReadOnly = True
      Precision = 15
      Size = 2
    end
    object SaleStructureDataSetType: TSmallintField
      FieldName = 'Type'
      Origin = '"Structure"."Type"'
    end
    object SaleStructureDataSetProductFullName: TIBStringField
      FieldName = 'ProductFullName'
      ProviderFlags = []
      Size = 169
    end
    object SaleStructureDataSetRemainQty: TIBBCDField
      FieldName = 'RemainQty'
      Origin = '"Qty"."Qty"'
      Precision = 9
      Size = 3
    end
    object SaleStructureDataSetDivisionName: TIBStringField
      FieldName = 'DivisionName'
      Origin = '"Divisions"."DivisionName"'
      Size = 84
    end
    object SaleStructureDataSetPack: TSmallintField
      FieldName = 'Pack'
      Origin = '"Products"."Pack"'
    end
  end
  object SaleOrderTransaction: TIBTransaction
    DefaultDatabase = Database
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saCommit
    Left = 840
    Top = 72
  end
  object SaleOrderDataSource: TDataSource
    DataSet = SaleOrderDataSet
    Left = 800
    Top = 112
  end
  object SaleStructureDataSource: TDataSource
    DataSet = SaleStructureDataSet
    Left = 832
    Top = 112
  end
  object DivisionDataSet: TIBDataSet
    Database = Database
    Transaction = FirmTransaction
    DeleteSQL.Strings = (
      'DELETE FROM "Divisions"'
      'WHERE'
      '  "DivisionID" = :"OLD_DivisionID"')
    InsertSQL.Strings = (
      'INSERT INTO "Divisions"'
      '  ("DivisionID", "DivisionName", "Address", "CustomerID")'
      'VALUES'
      '  (:"DivisionID", :"DivisionName", :"Address", :"CustomerID")')
    RefreshSQL.Strings = (
      'SELECT'
      '  "DivisionID",'
      '  "DivisionName",'
      '  "Address",'
      '  "CustomerID"'
      'FROM "Divisions"'
      'WHERE'
      '  "DivisionID" = :"DivisionID"')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM "Divisions"'
      'WHERE "CustomerID" = :"CustomerID"')
    ModifySQL.Strings = (
      'UPDATE "Divisions"'
      'SET'
      '  "DivisionID" = :"DivisionID",'
      '  "DivisionName" = :"DivisionName",'
      '  "Address" = :"Address",'
      '  "CustomerID" = :"CustomerID"'
      'WHERE'
      '  "DivisionID" = :"OLD_DivisionID"')
    GeneratorField.Field = 'DivisionID'
    GeneratorField.Generator = 'CustomerID_GEN'
    DataSource = FirmDataSource
    Left = 112
    Top = 8
    object DivisionDataSetDivisionID: TIntegerField
      FieldName = 'DivisionID'
      Origin = 'Division.DivisionID'
      Required = True
    end
    object DivisionDataSetDivisionName: TIBStringField
      FieldName = 'DivisionName'
      Origin = 'Division.DivisionName'
      Size = 125
    end
    object DivisionDataSetAddress: TIBStringField
      FieldName = 'Address'
      Origin = '"Divisions"."Address"'
      Size = 125
    end
    object DivisionDataSetCustomerID: TIntegerField
      FieldName = 'CustomerID'
      Origin = 'Division.CustomerID'
    end
  end
  object DivisionDataSource: TDataSource
    DataSet = DivisionDataSet
    Left = 112
    Top = 104
  end
  object OrderStoreQuery: TIBQuery
    Database = Database
    Transaction = DefaultTransaction
    DataSource = SaleStructureDataSource
    SQL.Strings = (
      'SELECT COUNT(*)'
      'FROM "Structure"'
      
        'WHERE ("OrderID" = :"OrderID") AND ("StoreID" = :"StoreID")  AND' +
        ' ("Price" = :"Price")')
    Left = 40
    Top = 304
    ParamData = <
      item
        DataType = ftInteger
        Name = 'OrderID'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'StoreID'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftBCD
        NumericScale = 2
        Name = 'Price'
        ParamType = ptUnknown
        Size = 8
      end>
    object OrderStoreQueryCOUNT: TIntegerField
      FieldName = 'COUNT'
      Required = True
    end
  end
  object OrderStoreDataSource: TDataSource
    DataSet = OrderStoreQuery
    Left = 40
    Top = 360
  end
  object PayOrderSelectQuery: TIBQuery
    Database = Database
    Transaction = DefaultTransaction
    SQL.Strings = (
      'SELECT "Orders".*, "Customers"."CustomerName"'
      'FROM "Orders", "Customers"'
      
        'WHERE ("Orders"."FirmID" = :MainFirm) AND ("Customers"."Customer' +
        'ID" = "Orders"."CustomerID") AND ("Orders"."Debt" > 0)'
      'AND ("Orders"."ProperID" IN (0, 1, 2))'
      ''
      'ORDER BY "Orders"."Date"')
    Left = 120
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'MainFirm'
        ParamType = ptUnknown
      end>
    object PayOrderSelectQueryOrderID: TIntegerField
      FieldName = 'OrderID'
      Origin = '"Orders"."OrderID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object PayOrderSelectQueryFirmID: TIntegerField
      FieldName = 'FirmID'
      Origin = '"Orders"."FirmID"'
    end
    object PayOrderSelectQueryCustomerID: TIntegerField
      FieldName = 'CustomerID'
      Origin = '"Orders"."CustomerID"'
    end
    object PayOrderSelectQueryDate: TDateField
      FieldName = 'Date'
      Origin = '"Orders"."Date"'
    end
    object PayOrderSelectQueryNumber: TIBStringField
      FieldName = 'Number'
      Origin = '"Orders"."Number"'
      Size = 10
    end
    object PayOrderSelectQueryIssueDate: TDateField
      FieldName = 'IssueDate'
      Origin = '"Orders"."IssueDate"'
    end
    object PayOrderSelectQueryTotalAmount: TIBBCDField
      FieldName = 'TotalAmount'
      Origin = '"Orders"."TotalAmount"'
      Precision = 15
      Size = 2
    end
    object PayOrderSelectQueryPay: TIBBCDField
      FieldName = 'Pay'
      Origin = '"Orders"."Pay"'
      Precision = 15
      Size = 2
    end
    object PayOrderSelectQueryPayDate: TDateField
      FieldName = 'PayDate'
      Origin = '"Orders"."PayDate"'
    end
    object PayOrderSelectQueryDebt: TIBBCDField
      FieldKind = fkInternalCalc
      FieldName = 'Debt'
      Origin = '"Orders"."Debt"'
      ProviderFlags = []
      ReadOnly = True
      Precision = 15
      Size = 2
    end
    object PayOrderSelectQueryPriceID: TIntegerField
      FieldName = 'PriceID'
      Origin = '"Orders"."PriceID"'
    end
    object PayOrderSelectQueryProperID: TIntegerField
      FieldName = 'ProperID'
      Origin = '"Orders"."ProperID"'
    end
    object PayOrderSelectQueryCustomerName: TIBStringField
      FieldName = 'CustomerName'
      Origin = '"Customers"."CustomerName"'
      Size = 84
    end
  end
  object PayOrderSelectDataSource: TDataSource
    DataSet = PayOrderSelectQuery
    Left = 120
    Top = 360
  end
  object CustomerSelectQuery: TIBQuery
    Database = Database
    Transaction = DefaultTransaction
    AfterOpen = CustomerSelectQueryAfterOpen
    BeforeOpen = CustomerSelectQueryBeforeOpen
    OnCalcFields = CustomerSelectQueryCalcFields
    SQL.Strings = (
      
        'SELECT "Customers"."CustomerID", "Customers"."CustomerName", "Cu' +
        'stomers"."PriceID", "Customers"."DelayPay"'
      'FROM "Customers"'
      
        'WHERE ("Customers"."CustomerID" <> :MainFirm AND "Customers"."Cu' +
        'stomerID" > 0)'
      ''
      'ORDER BY "Customers"."CustomerName"')
    Left = 312
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'MainFirm'
        ParamType = ptUnknown
      end>
    object CustomerSelectQueryCustomerID: TIntegerField
      FieldName = 'CustomerID'
      Origin = '"Customers"."CustomerID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CustomerSelectQueryCustomerName: TIBStringField
      FieldName = 'CustomerName'
      Origin = '"Customers"."CustomerName"'
      Size = 84
    end
    object CustomerSelectQueryPriceID: TIntegerField
      FieldName = 'PriceID'
      Origin = '"Customers"."PriceID"'
    end
    object CustomerSelectQueryDelayPay: TSmallintField
      FieldName = 'DelayPay'
      Origin = '"Customers"."DelayPay"'
    end
    object CustomerSelectQueryDebt: TFloatField
      FieldKind = fkLookup
      FieldName = 'Debt'
      LookupDataSet = DebtQuery
      LookupKeyFields = 'CustomerID'
      LookupResultField = 'Debt'
      KeyFields = 'CustomerID'
      Lookup = True
    end
    object CustomerSelectQueryDebtStr: TStringField
      Alignment = taRightJustify
      FieldKind = fkCalculated
      FieldName = 'DebtStr'
      Calculated = True
    end
  end
  object CustomerSelectDataSource: TDataSource
    DataSet = CustomerSelectQuery
    Left = 312
    Top = 360
  end
  object ProductSelectQuery: TIBQuery
    Database = Database
    Transaction = DefaultTransaction
    SQL.Strings = (
      
        'SELECT "Products"."ProductID", "Products"."Article", "Products".' +
        '"Pack", "Categories"."CategoryName" || '#39' '#39' || "Products"."Produc' +
        'tName" AS "ProductFullName", "Categories"."CategoryID"'
      'FROM "Products", "Categories"'
      'WHERE ("Products"."CategoryID" = "Categories"."CategoryID")'
      ''
      ''
      'ORDER BY "CategoryName", "ProductName"')
    Left = 496
    Top = 304
    object ProductSelectQueryProductID: TIntegerField
      FieldName = 'ProductID'
      Origin = '"Products"."ProductID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ProductSelectQueryArticle: TIBStringField
      FieldName = 'Article'
      Origin = '"Products"."Article"'
      Size = 125
    end
    object ProductSelectQueryPack: TSmallintField
      FieldName = 'Pack'
      Origin = '"Products"."Pack"'
    end
    object ProductSelectQueryProductFullName: TIBStringField
      FieldName = 'ProductFullName'
      ProviderFlags = []
      Size = 169
    end
    object ProductSelectQueryCategoryID: TIntegerField
      FieldName = 'CategoryID'
      Origin = '"Categories"."CategoryID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ProductSelectQueryVATRate: TFloatField
      FieldKind = fkLookup
      FieldName = 'VATRate'
      LookupDataSet = CategoryVATQuery
      LookupKeyFields = 'CategoryID'
      LookupResultField = 'VATRate'
      KeyFields = 'CategoryID'
      Lookup = True
    end
  end
  object StoreSelectQuery: TIBQuery
    Database = Database
    Transaction = DefaultTransaction
    BeforeOpen = StoreSelectQueryBeforeOpen
    OnCalcFields = StoreSelectQueryCalcFields
    SQL.Strings = (
      'SELECT "Store".*, "StoreQty".*, "Prices"."Price"'
      'FROM "Store", "StoreQty", "Prices"'
      
        'WHERE ("Store"."ProductID" = :"ProductID") AND ("Store"."StoreID' +
        '" = "StoreQty"."StoreID" AND "StoreQty"."DivisionID" = :"Divisio' +
        'nID") AND ("Store"."StoreID" = "Prices"."StoreID" AND "Prices"."' +
        'PriceID" = :"PriceID")'
      ''
      'AND ("StoreQty"."Qty" > 0)')
    Left = 560
    Top = 304
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ProductID'
        ParamType = ptUnknown
        Size = 4
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
      end>
    object StoreSelectQueryStoreID: TIntegerField
      FieldName = 'StoreID'
      Origin = '"Store"."StoreID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StoreSelectQueryProductID: TIntegerField
      FieldName = 'ProductID'
      Origin = '"Store"."ProductID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StoreSelectQueryQty: TIBBCDField
      FieldName = 'Qty'
      Origin = '"Qty"."Qty"'
      Precision = 9
      Size = 3
    end
    object StoreSelectQueryDivisionID: TIntegerField
      FieldName = 'DivisionID'
      Origin = '"Qty"."DivisionID"'
    end
    object StoreSelectQueryPrice: TIBBCDField
      FieldName = 'Price'
      Origin = '"Prices"."Price"'
      Precision = 9
      Size = 2
    end
    object StoreSelectQueryCurAmountRemain: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CurAmountRemain'
      Calculated = True
    end
  end
  object ProductSelectDataSource: TDataSource
    DataSet = ProductSelectQuery
    Left = 496
    Top = 360
  end
  object StoreSelectDataSource: TDataSource
    DataSet = StoreSelectQuery
    Left = 560
    Top = 360
  end
  object DefaultTransaction: TIBTransaction
    DefaultDatabase = Database
    Params.Strings = (
      'read'
      'concurrency'
      'nowait')
    AutoStopAction = saCommit
    Left = 24
    Top = 64
  end
  object HomeOrderDataSet: TIBDataSet
    Database = Database
    Transaction = HomeTransaction
    AfterOpen = HomeOrderDataSetAfterOpen
    BeforeOpen = HomeOrderDataSetBeforeOpen
    DeleteSQL.Strings = (
      'DELETE FROM "Orders"'
      'WHERE'
      '  "OrderID" = :"OLD_OrderID"')
    InsertSQL.Strings = (
      'INSERT INTO "Orders"'
      
        '  ("OrderID", "FirmID", "InDivisionID", "OutDivisionID", "Custom' +
        'erID", "Date", "Number", "TotalAmountVAT", "TotalAmount", "Pay",' +
        ' "PriceID", "ProperID", "UserName")'
      'VALUES'
      
        '  (:"OrderID", :"FirmID", :"InDivisionID", :"OutDivisionID", :"C' +
        'ustomerID", :"Date", :"Number", :"TotalAmountVAT", :"TotalAmount' +
        '", :"Pay", :"PriceID", :"ProperID", :"UserName")')
    RefreshSQL.Strings = (
      'SELECT'
      '  "OrderID",'
      '  "FirmID",'
      '  "InDivisionID",'
      '  "OutDivisionID",'
      '  "CustomerID",'
      '  "Date",'
      '  "Number",'
      '  "TotalAmountVAT",'
      '  "TotalAmount",'
      '  "Pay",'
      '  "Debt",'
      '  "PriceID",'
      '  "ProperID",'
      '  "UserName"'
      'FROM "Orders"'
      'WHERE'
      '  "OrderID" = :"OrderID"')
    SelectSQL.Strings = (
      
        'SELECT "OrderID", "FirmID", "InDivisionID", "OutDivisionID", "Cu' +
        'stomerID", "Date", "Number", "TotalAmountVAT", "TotalAmount", "P' +
        'ay", "Debt", "PriceID", "ProperID", "UserName"'
      'FROM "Orders"'
      'WHERE ("FirmID" = :MainFirm) AND ("ProperID" > 4)'
      
        'AND ("Orders"."Date" >= :TopDate AND "Orders"."Date" <= :BottomD' +
        'ate)'
      'ORDER BY "OrderID"')
    ModifySQL.Strings = (
      'UPDATE "Orders"'
      'SET'
      '  "OrderID" = :"OrderID",'
      '  "FirmID" = :"FirmID",'
      '  "InDivisionID" = :"InDivisionID",'
      '  "OutDivisionID" = :"OutDivisionID",'
      '  "CustomerID" = :"CustomerID",'
      '  "Date" = :"Date",'
      '  "Number" = :"Number",'
      '  "TotalAmountVAT" = :"TotalAmountVAT",'
      '  "TotalAmount" = :"TotalAmount",'
      '  "Pay" = :"Pay",'
      '  "PriceID" = :"PriceID",'
      '  "ProperID" = :"ProperID",'
      '  "UserName" = :"UserName"'
      'WHERE'
      '  "OrderID" = :"OLD_OrderID"')
    GeneratorField.Field = 'OrderID'
    GeneratorField.Generator = 'OrderID_GEN'
    Left = 640
    Top = 160
    object HomeOrderDataSetOrderID: TIntegerField
      FieldName = 'OrderID'
      Origin = '"Orders"."OrderID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object HomeOrderDataSetFirmID: TIntegerField
      FieldName = 'FirmID'
      Origin = '"Orders"."FirmID"'
    end
    object HomeOrderDataSetInDivisionID: TIntegerField
      FieldName = 'InDivisionID'
      Origin = '"Orders"."InDivisionID"'
    end
    object HomeOrderDataSetOutDivisionID: TIntegerField
      FieldName = 'OutDivisionID'
      Origin = '"Orders"."OutDivisionID"'
    end
    object HomeOrderDataSetCustomerID: TIntegerField
      FieldName = 'CustomerID'
      Origin = '"Orders"."CustomerID"'
    end
    object HomeOrderDataSetDate: TDateField
      FieldName = 'Date'
      Origin = '"Invoice"."Date"'
    end
    object HomeOrderDataSetNumber: TIBStringField
      FieldName = 'Number'
      Origin = '"Invoice"."Number"'
      Size = 10
    end
    object HomeOrderDataSetTotalAmountVAT: TIBBCDField
      FieldName = 'TotalAmountVAT'
      Origin = '"Orders"."TotalAmountVAT"'
      Precision = 15
      Size = 2
    end
    object HomeOrderDataSetTotalAmount: TIBBCDField
      FieldName = 'TotalAmount'
      Origin = '"Orders"."TotalAmount"'
      Size = 2
    end
    object HomeOrderDataSetPay: TIBBCDField
      FieldName = 'Pay'
      Origin = '"Invoice"."Pay"'
      Size = 2
    end
    object HomeOrderDataSetDebt: TIBBCDField
      FieldKind = fkInternalCalc
      FieldName = 'Debt'
      Origin = '"Orders"."Debt"'
      ProviderFlags = []
      ReadOnly = True
      Precision = 15
      Size = 2
    end
    object HomeOrderDataSetPriceID: TIntegerField
      FieldName = 'PriceID'
      Origin = '"Orders"."PriceID"'
    end
    object HomeOrderDataSetUserName: TIBStringField
      FieldName = 'UserName'
      Origin = '"Orders"."UserName"'
      Size = 31
    end
    object HomeOrderDataSetProperID: TIntegerField
      FieldName = 'ProperID'
      Origin = '"Orders"."ProperID"'
    end
  end
  object HomeTransaction: TIBTransaction
    DefaultDatabase = Database
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saCommit
    Left = 704
    Top = 208
  end
  object HomeOrderDataSource: TDataSource
    DataSet = HomeOrderDataSet
    Left = 616
    Top = 248
  end
  object HomeStructureDataSource: TDataSource
    DataSet = HomeStructureDataSet
    Left = 656
    Top = 248
  end
  object DivisionSelectQuery: TIBQuery
    Database = Database
    Transaction = DefaultTransaction
    AfterOpen = DivisionSelectQueryAfterOpen
    BeforeOpen = DivisionSelectQueryBeforeOpen
    SQL.Strings = (
      'SELECT *'
      'FROM "Divisions"'
      'WHERE ("CustomerID" = :MainFirm)'
      ''
      'ORDER BY "DivisionName"')
    Left = 256
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'MainFirm'
        ParamType = ptUnknown
      end>
    object DivisionSelectQueryDivisionID: TIntegerField
      FieldName = 'DivisionID'
      Origin = '"Division"."DivisionID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object DivisionSelectQueryDivisionName: TIBStringField
      FieldName = 'DivisionName'
      Origin = '"Division"."DivisionName"'
      Size = 125
    end
    object DivisionSelectQueryAddress: TIBStringField
      FieldName = 'Address'
      Origin = '"Divisions"."Address"'
      Size = 125
    end
    object DivisionSelectQueryCustomerID: TIntegerField
      FieldName = 'CustomerID'
      Origin = '"Divisions"."CustomerID"'
    end
  end
  object DivisionSelectDataSource: TDataSource
    DataSet = DivisionSelectQuery
    Left = 256
    Top = 360
  end
  object BankDataSet: TIBDataSet
    Database = Database
    Transaction = BankTransaction
    AfterOpen = BankDataSetAfterOpen
    DeleteSQL.Strings = (
      'DELETE FROM "Banks"'
      'WHERE'
      '  "BankID" = :"OLD_BankID"')
    InsertSQL.Strings = (
      'INSERT INTO "Banks"'
      '  ("BankID", "BankName", "Address", "Account", "BIC")'
      'VALUES'
      '  (:"BankID", :"BankName", :"Address", :"Account", :"BIC")')
    RefreshSQL.Strings = (
      'SELECT'
      '  "BankID",'
      '  "BankName",'
      '  "Address",'
      '  "Account",'
      '  "BIC"'
      'FROM "Banks"'
      'WHERE'
      '  "BankID" = :"BankID"')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM "Banks"'
      'WHERE "BankID" > 0'
      ''
      'ORDER BY "BankName"')
    ModifySQL.Strings = (
      'UPDATE "Banks"'
      'SET'
      '  "BankID" = :"BankID",'
      '  "BankName" = :"BankName",'
      '  "Address" = :"Address",'
      '  "Account" = :"Account",'
      '  "BIC" = :"BIC"'
      'WHERE'
      '  "BankID" = :"OLD_BankID"')
    GeneratorField.Field = 'BankID'
    GeneratorField.Generator = 'BankID_GEN'
    DataSource = CustomerDataSource
    Left = 272
    Top = 8
    object BankDataSetBankID: TIntegerField
      FieldName = 'BankID'
      Origin = '"Bank"."BankID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object BankDataSetBankName: TIBStringField
      FieldName = 'BankName'
      Origin = '"Banks"."BankName"'
      Size = 84
    end
    object BankDataSetAddress: TIBStringField
      FieldName = 'Address'
      Origin = '"Bank"."Address"'
      Size = 125
    end
    object BankDataSetAccount: TIBStringField
      FieldName = 'Account'
      Origin = '"Bank"."Account"'
    end
    object BankDataSetBIC: TIBStringField
      FieldName = 'BIC'
      Origin = '"Banks"."BIC"'
      Size = 9
    end
  end
  object BankTransaction: TIBTransaction
    DefaultDatabase = Database
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saCommit
    Left = 272
    Top = 56
  end
  object BankDataSource: TDataSource
    DataSet = BankDataSet
    Left = 272
    Top = 104
  end
  object VATDataSet: TIBDataSet
    Database = Database
    Transaction = CategoryTransaction
    DeleteSQL.Strings = (
      'DELETE FROM "VAT"'
      'WHERE'
      '  ("CategoryID" = :"OLD_CategoryID") AND'
      '  ("Date" = :"OLD_Date")')
    InsertSQL.Strings = (
      'INSERT INTO "VAT"'
      '  ("CategoryID", "Date", "VATRateID")'
      'VALUES'
      '  (:"CategoryID", :"Date", :"VATRateID")')
    RefreshSQL.Strings = (
      'SELECT'
      '  "CategoryID",'
      '  "Date",'
      '  "VATRateID"'
      'FROM "VAT"'
      'WHERE'
      '  ("CategoryID" = :"CategoryID") AND'
      '  ("Date" = :"Date")')
    SelectSQL.Strings = (
      'SELECT "VAT".*, "VATRates"."VATRateName", "VATRates"."VATRate"'
      'FROM "VAT", "VATRates"'
      
        'WHERE ("VAT"."CategoryID" = :"CategoryID") AND ("VAT"."VATRateID' +
        '" = "VATRates"."VATRateID")')
    ModifySQL.Strings = (
      'UPDATE "VAT"'
      'SET'
      '  "CategoryID" = :"CategoryID",'
      '  "Date" = :"Date",'
      '  "VATRateID" = :"VATRateID"'
      'WHERE'
      '  ("CategoryID" = :"OLD_CategoryID") AND'
      '  ("Date" = :"OLD_Date")')
    GeneratorField.ApplyEvent = gamOnPost
    DataSource = CategoryDataSource
    Left = 424
    Top = 8
    object VATDataSetCategoryID: TIntegerField
      FieldName = 'CategoryID'
      Origin = '"NDS"."CategoryID"'
      Required = True
    end
    object VATDataSetDate: TDateField
      FieldName = 'Date'
      Origin = '"NDS"."Date"'
    end
    object VATDataSetVATRateID: TIntegerField
      FieldName = 'VATRateID'
      Origin = '"VAT"."VATRateID"'
    end
    object VATDataSetVATRateName: TIBStringField
      FieldName = 'VATRateName'
      Origin = '"VATRates"."VATRateName"'
      Size = 84
    end
    object VATDataSetVATRate: TIBBCDField
      FieldName = 'VATRate'
      Origin = '"VATRates"."VATRate"'
      Precision = 4
      Size = 2
    end
  end
  object VATDataSource: TDataSource
    DataSet = VATDataSet
    Left = 424
    Top = 104
  end
  object CategoryVATQuery: TIBQuery
    Database = Database
    Transaction = CategoryTransaction
    AfterOpen = CategoryVATQueryAfterOpen
    SQL.Strings = (
      'SELECT *'
      'FROM "Category_VATRate"('#39'now'#39')'
      'WHERE ("CategoryID" > 0)'
      ''
      'ORDER BY "CategoryName"')
    Left = 384
    Top = 8
    object CategoryVATQueryCategoryID: TIntegerField
      FieldName = 'CategoryID'
      Origin = '"Category_VATRate"."CategoryID"'
    end
    object CategoryVATQueryCategoryName: TIBStringField
      FieldName = 'CategoryName'
      Origin = '"Category_VATRate"."CategoryName"'
      Size = 84
    end
    object CategoryVATQueryDate: TDateField
      FieldName = 'Date'
      Origin = '"Category_VATRate"."Date"'
    end
    object CategoryVATQueryVATRateName: TIBStringField
      FieldName = 'VATRateName'
      Origin = '"Category_VATRate"."VATRateName"'
      Size = 84
    end
    object CategoryVATQueryVATRate: TIBBCDField
      FieldName = 'VATRate'
      Origin = '"Category_VATRate"."VATRate"'
      Precision = 4
      Size = 2
    end
  end
  object CategoryVATDataSource: TDataSource
    DataSet = CategoryVATQuery
    Left = 384
    Top = 104
  end
  object MeasureDataSet: TIBDataSet
    Database = Database
    Transaction = MeasureTransaction
    AfterOpen = MeasureDataSetAfterOpen
    DeleteSQL.Strings = (
      'DELETE FROM "Measures"'
      'WHERE'
      '  "MeasureID" = :"OLD_MeasureID"')
    InsertSQL.Strings = (
      'INSERT INTO "Measures"'
      '  ("MeasureID", "MeasureName")'
      'VALUES'
      '  (:"MeasureID", :"MeasureName")')
    RefreshSQL.Strings = (
      'SELECT'
      '  "MeasureID",'
      '  "MeasureName"'
      'FROM "Measures"'
      'WHERE'
      '  "MeasureID" = :"MeasureID"')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM "Measures"'
      'WHERE "MeasureID" > 0'
      ''
      'ORDER BY "MeasureName"')
    ModifySQL.Strings = (
      'UPDATE "Measures"'
      'SET'
      '  "MeasureID" = :"MeasureID",'
      '  "MeasureName" = :"MeasureName"'
      'WHERE'
      '  "MeasureID" = :"OLD_MeasureID"')
    GeneratorField.Field = 'MeasureID'
    GeneratorField.Generator = 'MeasureID_GEN'
    Left = 504
    Top = 8
    object MeasureDataSetMeasureID: TIntegerField
      FieldName = 'MeasureID'
      Origin = '"Measures"."MeasureID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object MeasureDataSetMeasureName: TIBStringField
      FieldName = 'MeasureName'
      Origin = '"Measures"."MeasureName"'
      Size = 10
    end
  end
  object MeasureTransaction: TIBTransaction
    DefaultDatabase = Database
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saCommit
    Left = 504
    Top = 56
  end
  object MeasureDataSource: TDataSource
    DataSet = MeasureDataSet
    Left = 504
    Top = 104
  end
  object ProducerDataSet: TIBDataSet
    Database = Database
    Transaction = ProducerTransaction
    AfterOpen = ProducerDataSetAfterOpen
    DeleteSQL.Strings = (
      'DELETE FROM "Producers"'
      'WHERE'
      '  "ProducerID" = :"OLD_ProducerID"')
    InsertSQL.Strings = (
      'INSERT INTO "Producers"'
      '  ("ProducerID", "ProducerName")'
      'VALUES'
      '  (:"ProducerID", :"ProducerName")')
    RefreshSQL.Strings = (
      'SELECT'
      '  "ProducerID",'
      '  "ProducerName"'
      'FROM "Producers"'
      'WHERE'
      '  "ProducerID" = :"ProducerID"')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM "Producers"'
      'WHERE "ProducerID" > 0'
      ''
      'ORDER BY "ProducerName"')
    ModifySQL.Strings = (
      'UPDATE "Producers"'
      'SET'
      '  "ProducerID" = :"ProducerID",'
      '  "ProducerName" = :"ProducerName"'
      'WHERE'
      '  "ProducerID" = :"OLD_ProducerID"')
    GeneratorField.Field = 'ProducerID'
    GeneratorField.Generator = 'ProducerID_GEN'
    Left = 544
    Top = 8
    object ProducerDataSetProducerID: TIntegerField
      FieldName = 'ProducerID'
      Origin = '"Producers"."ProducerID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ProducerDataSetProducerName: TIBStringField
      FieldName = 'ProducerName'
      Origin = '"Producers"."ProducerName"'
      Size = 125
    end
  end
  object ProducerTransaction: TIBTransaction
    DefaultDatabase = Database
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saCommit
    Left = 544
    Top = 56
  end
  object ProducerDataSource: TDataSource
    DataSet = ProducerDataSet
    Left = 544
    Top = 104
  end
  object CountryDataSet: TIBDataSet
    Database = Database
    Transaction = CountryTransaction
    AfterOpen = CountryDataSetAfterOpen
    DeleteSQL.Strings = (
      'DELETE FROM "Countrys"'
      'WHERE'
      '  "CountryID" = :"OLD_CountryID"')
    InsertSQL.Strings = (
      'INSERT INTO "Countrys"'
      '  ("CountryID", "CountryName")'
      'VALUES'
      '  (:"CountryID", :"CountryName")')
    RefreshSQL.Strings = (
      'SELECT'
      '  "CountryID",'
      '  "CountryName"'
      'FROM "Countrys"'
      'WHERE'
      '  "CountryID" = :"CountryID"')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM "Countrys"'
      'WHERE "CountryID" > 0'
      ''
      'ORDER BY "CountryName"')
    ModifySQL.Strings = (
      'UPDATE "Countrys"'
      'SET'
      '  "CountryID" = :"CountryID",'
      '  "CountryName" = :"CountryName"'
      'WHERE'
      '  "CountryID" = :"OLD_CountryID"')
    GeneratorField.Field = 'CountryID'
    GeneratorField.Generator = 'CountryID_GEN'
    Left = 224
    Top = 152
    object CountryDataSetCountryID: TIntegerField
      FieldName = 'CountryID'
      Origin = '"Countrys"."CountryID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CountryDataSetCountryName: TIBStringField
      FieldName = 'CountryName'
      Origin = '"Countrys"."CountryName"'
      Size = 125
    end
  end
  object CountryTransaction: TIBTransaction
    DefaultDatabase = Database
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saCommit
    Left = 224
    Top = 200
  end
  object CountryDataSource: TDataSource
    DataSet = CountryDataSet
    Left = 224
    Top = 248
  end
  object CCDDataSet: TIBDataSet
    Database = Database
    Transaction = CCDTransaction
    AfterOpen = CCDDataSetAfterOpen
    DeleteSQL.Strings = (
      'DELETE FROM "CCD"'
      'WHERE'
      '  "CCDID" = :"OLD_CCDID"')
    InsertSQL.Strings = (
      'INSERT INTO "CCD"'
      '  ("CCDID", "CCDName")'
      'VALUES'
      '  (:"CCDID", :"CCDName")')
    RefreshSQL.Strings = (
      'SELECT'
      '  "CCDID",'
      '  "CCDName"'
      'FROM "CCD"'
      'WHERE'
      '  "CCDID" = :"CCDID"')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM "CCD"'
      'WHERE "CCDID" > 0'
      ''
      'ORDER BY "CCDName"')
    ModifySQL.Strings = (
      'UPDATE "CCD"'
      'SET'
      '  "CCDID" = :"CCDID",'
      '  "CCDName" = :"CCDName"'
      'WHERE'
      '  "CCDID" = :"OLD_CCDID"')
    GeneratorField.Field = 'CCDID'
    GeneratorField.Generator = 'CCDID_GEN'
    Left = 272
    Top = 152
    object CCDDataSetCCDID: TIntegerField
      FieldName = 'CCDID'
      Origin = '"CCD"."CCDID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CCDDataSetCCDName: TIBStringField
      FieldName = 'CCDName'
      Origin = '"CCD"."CCDName"'
      Size = 125
    end
  end
  object CCDTransaction: TIBTransaction
    DefaultDatabase = Database
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saCommit
    Left = 272
    Top = 200
  end
  object CCDDataSource: TDataSource
    DataSet = CCDDataSet
    Left = 272
    Top = 248
  end
  object CertificateDataSet: TIBDataSet
    Database = Database
    Transaction = CertificateTransaction
    AfterOpen = CertificateDataSetAfterOpen
    DeleteSQL.Strings = (
      'DELETE FROM "Certificates"'
      'WHERE'
      '  "CertificateID" = :"OLD_CertificateID"')
    InsertSQL.Strings = (
      'INSERT INTO "Certificates"'
      '  ("CertificateID", "CertificateName")'
      'VALUES'
      '  (:"CertificateID", :"CertificateName")')
    RefreshSQL.Strings = (
      'SELECT'
      '  "CertificateID",'
      '  "CertificateName"'
      'FROM "Certificates"'
      'WHERE'
      '  "CertificateID" = :"CertificateID"')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM "Certificates"'
      'WHERE "CertificateID" > 0'
      ''
      'ORDER BY "CertificateName"')
    ModifySQL.Strings = (
      'UPDATE "Certificates"'
      'SET'
      '  "CertificateID" = :"CertificateID",'
      '  "CertificateName" = :"CertificateName"'
      'WHERE'
      '  "CertificateID" = :"OLD_CertificateID"')
    GeneratorField.Field = 'CertificateID'
    GeneratorField.Generator = 'CertificateID_GEN'
    Left = 320
    Top = 152
    object CertificateDataSetCertificateID: TIntegerField
      FieldName = 'CertificateID'
      Origin = '"Certificates"."CertificateID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CertificateDataSetCertificateName: TIBStringField
      FieldName = 'CertificateName'
      Origin = '"Certificates"."CertificateName"'
      Size = 125
    end
  end
  object CertificateTransaction: TIBTransaction
    DefaultDatabase = Database
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saCommit
    Left = 320
    Top = 200
  end
  object CertificateDataSource: TDataSource
    DataSet = CertificateDataSet
    Left = 320
    Top = 248
  end
  object PaymentOrderDataSet: TIBDataSet
    Database = Database
    Transaction = PaymentOrderTransaction
    DeleteSQL.Strings = (
      'DELETE FROM "Payments"'
      'WHERE'
      '  "PaymentID" = :"OLD_PaymentID"')
    InsertSQL.Strings = (
      'INSERT INTO "Payments"'
      
        '  ("PaymentID", "FirmID", "OrderID", "CustomerID", "Cash", "Date' +
        '", "Number", "TotalPay", "Debit", "Credit", "Type")'
      'VALUES'
      
        '  (:"PaymentID", :"FirmID", :"OrderID", :"CustomerID", :"Cash", ' +
        ':"Date", :"Number", :"TotalPay", :"Debit", :"Credit", :"Type")')
    RefreshSQL.Strings = (
      'SELECT '
      '  "PaymentID",'
      '  "FirmID",'
      '  "OrderID",'
      '  "CustomerID",'
      '  "Cash",'
      '  "Date",'
      '  "Number",'
      '  "TotalPay",'
      '  "Debit",'
      '  "Credit",'
      '  "Type"'
      'FROM "Payments"'
      'WHERE'
      '  "PaymentID" = :"PaymentID"')
    SelectSQL.Strings = (
      'SELECT "Payments".*, "Customers"."CustomerName"'
      'FROM "Payments", "Customers"'
      
        'WHERE (("Payments"."OrderID" = :"OrderID") OR "Payments"."Paymen' +
        'tID" IN (SELECT "PayOrders"."PaymentID" FROM "PayOrders" WHERE "' +
        'PayOrders"."OrderID" = :"OrderID")) AND ("Customers"."CustomerID' +
        '" = "Payments"."CustomerID")'
      ''
      'ORDER BY "PaymentID"')
    ModifySQL.Strings = (
      'UPDATE "Payments"'
      'SET'
      '  "PaymentID" = :"PaymentID",'
      '  "FirmID" = :"FirmID",'
      '  "OrderID" = :"OrderID",'
      '  "CustomerID" = :"CustomerID",'
      '  "Cash" = :"Cash",'
      '  "Date" = :"Date",'
      '  "Number" = :"Number",'
      '  "TotalPay" = :"TotalPay",'
      '  "Debit" = :"Debit",'
      '  "Credit" = :"Credit",'
      '  "Type" = :"Type"'
      'WHERE'
      '  "PaymentID" = :"OLD_PaymentID"')
    GeneratorField.Field = 'PaymentID'
    GeneratorField.Generator = 'PaymentID_GEN'
    Left = 536
    Top = 152
    object IntegerField1: TIntegerField
      FieldName = 'PaymentID'
      Origin = 'Payment.PaymentID'
      Required = True
    end
    object PaymentOrderDataSetFirmID: TIntegerField
      FieldName = 'FirmID'
      Origin = '"Payments"."FirmID"'
    end
    object IntegerField4: TIntegerField
      FieldName = 'OrderID'
      Origin = '"Payment"."OrderID"'
    end
    object IntegerField6: TIntegerField
      FieldName = 'CustomerID'
      Origin = 'Payment.CustomerID'
    end
    object SmallintField1: TSmallintField
      FieldName = 'Cash'
      Origin = 'Payment.Cash'
    end
    object PaymentOrderDataSetDate: TDateField
      FieldName = 'Date'
      Origin = '"Payments"."Date"'
    end
    object PaymentOrderDataSetNumber: TIBStringField
      FieldName = 'Number'
      Origin = '"Payments"."Number"'
      Size = 10
    end
    object PaymentOrderDataSetTotalPay: TIBBCDField
      FieldName = 'TotalPay'
      Origin = '"Payments"."TotalPay"'
      Precision = 15
      Size = 2
    end
    object PaymentOrderDataSetDebit: TIntegerField
      FieldName = 'Debit'
      Origin = '"Payments"."Debit"'
    end
    object PaymentOrderDataSetCredit: TIntegerField
      FieldName = 'Credit'
      Origin = '"Payments"."Credit"'
    end
    object PaymentOrderDataSetUserName: TIBStringField
      FieldName = 'UserName'
      Origin = '"Payments"."UserName"'
      Size = 31
    end
    object PaymentOrderDataSetType: TSmallintField
      FieldName = 'Type'
      Origin = '"Payments"."Type"'
    end
    object PaymentOrderDataSetCustomerName: TIBStringField
      FieldName = 'CustomerName'
      Origin = '"Customers"."CustomerName"'
      Size = 84
    end
  end
  object PaymentOrderTransaction: TIBTransaction
    DefaultDatabase = Database
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saCommit
    Left = 536
    Top = 200
  end
  object PaymentOrderDataSource: TDataSource
    DataSet = PaymentOrderDataSet
    Left = 536
    Top = 248
  end
  object FirmDataSet: TIBDataSet
    Database = Database
    Transaction = FirmTransaction
    DeleteSQL.Strings = (
      'DELETE FROM "Customers"'
      'WHERE'
      '  "CustomerID" = :"OLD_CustomerID"')
    InsertSQL.Strings = (
      'INSERT INTO "Customers"'
      
        '  ("CustomerID", "CustomerName", "CustomerFullName", "Address", ' +
        '"Phone", "OKONH", "OKPO", "INN", "KPP", "Registration", "BankID"' +
        ', "Account", "Firm")'
      'VALUES'
      
        '  (:"CustomerID", :"CustomerName", :"CustomerFullName", :"Addres' +
        's", :"Phone", :"OKONH", :"OKPO", :"INN", :"KPP", :"Registration"' +
        ', :"BankID", :"Account", :"Firm")')
    RefreshSQL.Strings = (
      'SELECT'
      '  "CustomerID",'
      '  "CustomerName",'
      '  "CustomerFullName",'
      '  "Address",'
      '  "Phone",'
      '  "OKONH",'
      '  "OKPO",'
      '  "INN",'
      '  "KPP",'
      '  "Registration",'
      '  "BankID",'
      '  "Account",'
      '  "Firm"'
      'FROM "Customers"'
      'WHERE'
      '  "CustomerID" = :"CustomerID"')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM "Customers"'
      'WHERE "Firm" = 1'
      'ORDER BY "CustomerName"')
    ModifySQL.Strings = (
      'UPDATE "Customers"'
      'SET'
      '  "CustomerID" = :"CustomerID",'
      '  "CustomerName" = :"CustomerName",'
      '  "CustomerFullName" = :"CustomerFullName",'
      '  "Address" = :"Address",'
      '  "Phone" = :"Phone",'
      '  "OKONH" = :"OKONH",'
      '  "OKPO" = :"OKPO",'
      '  "INN" = :"INN",'
      '  "KPP" = :"KPP",'
      '  "Registration" = :"Registration",'
      '  "BankID" = :"BankID",'
      '  "Account" = :"Account",'
      '  "Firm" = :"Firm"'
      'WHERE'
      '  "CustomerID" = :"OLD_CustomerID"')
    GeneratorField.Field = 'CustomerID'
    GeneratorField.Generator = 'CustomerID_GEN'
    Left = 72
    Top = 8
    object IntegerField7: TIntegerField
      FieldName = 'CustomerID'
      Origin = 'Customer.CustomerID'
      Required = True
    end
    object FirmDataSetCustomerName: TIBStringField
      FieldName = 'CustomerName'
      Origin = '"Customers"."CustomerName"'
      Size = 84
    end
    object FirmDataSetCustomerFullName: TIBStringField
      FieldName = 'CustomerFullName'
      Origin = '"Customers"."CustomerFullName"'
      Size = 84
    end
    object IBStringField3: TIBStringField
      FieldName = 'Address'
      Origin = '"Customer"."Address"'
      Size = 125
    end
    object FirmDataSetPhone: TIBStringField
      FieldName = 'Phone'
      Origin = '"Customers"."Phone"'
      Size = 15
    end
    object FirmDataSetOKONH: TIBStringField
      FieldName = 'OKONH'
      Origin = '"Customers"."OKONH"'
      Size = 12
    end
    object FirmDataSetOKPO: TIBStringField
      FieldName = 'OKPO'
      Origin = '"Customers"."OKPO"'
      Size = 12
    end
    object IBStringField4: TIBStringField
      FieldName = 'INN'
      Origin = 'Customer.INN'
      Size = 12
    end
    object IBStringField5: TIBStringField
      FieldName = 'KPP'
      Origin = '"Customer"."KPP"'
      Size = 9
    end
    object IBStringField6: TIBStringField
      FieldName = 'Registration'
      Origin = '"Customer"."Registration"'
      Size = 125
    end
    object IntegerField9: TIntegerField
      FieldName = 'BankID'
      Origin = '"Customer"."BankID"'
    end
    object IBStringField7: TIBStringField
      FieldName = 'Account'
      Origin = '"Customer"."Account"'
    end
    object SmallintField2: TSmallintField
      FieldName = 'Firm'
      Origin = '"Customers"."Firm"'
    end
  end
  object FirmTransaction: TIBTransaction
    DefaultDatabase = Database
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saCommit
    Left = 96
    Top = 56
  end
  object FirmDataSource: TDataSource
    DataSet = FirmDataSet
    Left = 72
    Top = 104
  end
  object FirmSelectQuery: TIBQuery
    Database = Database
    Transaction = DefaultTransaction
    SQL.Strings = (
      'SELECT "CustomerID", "CustomerName", "INN"'
      'FROM "Customers"'
      'WHERE ("Firm" = 1) AND ("CustomerID" > 0)'
      'ORDER BY "CustomerName"')
    Left = 192
    Top = 304
    object IntegerField10: TIntegerField
      FieldName = 'CustomerID'
      Origin = '"Customer"."CustomerID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBStringField8: TIBStringField
      FieldName = 'CustomerName'
      Origin = '"Customer"."CustomerName"'
      Size = 125
    end
    object FirmSelectQueryINN: TIBStringField
      FieldName = 'INN'
      Origin = '"Customers"."INN"'
      Size = 12
    end
  end
  object FirmSelectDataSource: TDataSource
    DataSet = FirmSelectQuery
    Left = 192
    Top = 360
  end
  object TypePriceDataSet: TIBDataSet
    Database = Database
    Transaction = TypePriceTransaction
    AfterOpen = TypePriceDataSetAfterOpen
    DeleteSQL.Strings = (
      'delete from "TypePrices"'
      'where'
      '  "PriceID" = :"OLD_PriceID"')
    InsertSQL.Strings = (
      'insert into "TypePrices"'
      '  ("Markup", "PriceID", "PriceName", "Round")'
      'values'
      '  (:"Markup", :"PriceID", :"PriceName", :"Round")')
    RefreshSQL.Strings = (
      'Select '
      '  "PriceID",'
      '  "PriceName",'
      '  "Markup",'
      '  "Round"'
      'from "TypePrices" '
      'where'
      '  "PriceID" = :"PriceID"')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM "TypePrices"'
      'WHERE ("PriceID" > 0)'
      ''
      'ORDER BY "PriceName"')
    ModifySQL.Strings = (
      'update "TypePrices"'
      'set'
      '  "Markup" = :"Markup",'
      '  "PriceID" = :"PriceID",'
      '  "PriceName" = :"PriceName",'
      '  "Round" = :"Round"'
      'where'
      '  "PriceID" = :"OLD_PriceID"')
    GeneratorField.Field = 'PriceID'
    GeneratorField.Generator = 'PriceID_GEN'
    Left = 584
    Top = 8
    object TypePriceDataSetPriceID: TIntegerField
      FieldName = 'PriceID'
      Origin = '"TypePrices"."PriceID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TypePriceDataSetPriceName: TIBStringField
      FieldName = 'PriceName'
      Origin = '"TypePrices"."PriceName"'
      Size = 125
    end
    object TypePriceDataSetMarkup: TIBBCDField
      FieldName = 'Markup'
      Origin = '"TypePrices"."Markup"'
      Precision = 4
      Size = 2
    end
    object TypePriceDataSetRound: TIBBCDField
      FieldName = 'Round'
      Origin = '"TypePrices"."Round"'
      Required = True
      Size = 2
    end
  end
  object TypePriceTransaction: TIBTransaction
    DefaultDatabase = Database
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saCommit
    Left = 584
    Top = 56
  end
  object TypePriceDataSource: TDataSource
    DataSet = TypePriceDataSet
    Left = 584
    Top = 104
  end
  object PriceDataSet: TIBDataSet
    Database = Database
    Transaction = StoreTransaction
    DeleteSQL.Strings = (
      'DELETE FROM "Prices"'
      'WHERE'
      '  ("StoreID" = :"OLD_StoreID") AND ("PriceID" = :"OLD_PriceID")')
    InsertSQL.Strings = (
      'INSERT INTO "Prices"'
      '  ("StoreID", "PriceID", "Price")'
      'VALUES'
      '  (:"StoreID", :"PriceID", :"Price")')
    RefreshSQL.Strings = (
      'SELECT'
      '  "StoreID",'
      '  "PriceID",'
      '  "Price"'
      'FROM "Prices"'
      'WHERE'
      '  ("StoreID" = :"StoreID") AND ("PriceID" = :"PriceID")')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM "Prices"'
      'WHERE ("StoreID" = :"StoreID")')
    ModifySQL.Strings = (
      'UPDATE "Prices"'
      'SET'
      '  "StoreID" = :"StoreID",'
      '  "PriceID" = :"PriceID",'
      '  "Price" = :"Price"'
      'WHERE'
      '  ("StoreID" = :"OLD_StoreID") AND ("PriceID" = :"OLD_PriceID")')
    Left = 144
    Top = 152
    object PriceDataSetStoreID: TIntegerField
      FieldName = 'StoreID'
      Origin = '"Prices"."StoreID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object PriceDataSetPriceID: TIntegerField
      FieldName = 'PriceID'
      Origin = '"Prices"."PriceID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object PriceDataSetPrice: TIBBCDField
      FieldName = 'Price'
      Origin = '"Prices"."Price"'
      Precision = 9
      Size = 2
    end
    object PriceDataSetPriceName: TStringField
      FieldKind = fkLookup
      FieldName = 'PriceName'
      LookupDataSet = TypePriceDataSet
      LookupKeyFields = 'PriceID'
      LookupResultField = 'PriceName'
      KeyFields = 'PriceID'
      Lookup = True
    end
  end
  object PriceTransaction: TIBTransaction
    DefaultDatabase = Database
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saCommit
    Left = 184
    Top = 200
  end
  object PriceDataSource: TDataSource
    DataSet = PriceDataSet
    Left = 184
    Top = 248
  end
  object PriceSelectQuery: TIBQuery
    Database = Database
    Transaction = DefaultTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM "Prices"'
      
        'WHERE ("StoreID" = :"CurrentStoreID") AND ("PriceID" = :"Current' +
        'PriceID")')
    Left = 624
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CurrentStoreID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CurrentPriceID'
        ParamType = ptUnknown
      end>
    object PriceSelectQueryStoreID: TIntegerField
      FieldName = 'StoreID'
      Origin = '"Prices"."StoreID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object PriceSelectQueryPriceID: TIntegerField
      FieldName = 'PriceID'
      Origin = '"Prices"."PriceID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object PriceSelectQueryPrice: TIBBCDField
      FieldName = 'Price'
      Origin = '"Prices"."Price"'
      Precision = 9
      Size = 2
    end
    object PriceSelectQueryPriceName: TStringField
      FieldKind = fkLookup
      FieldName = 'PriceName'
      LookupDataSet = TypePriceDataSet
      LookupKeyFields = 'PriceID'
      LookupResultField = 'PriceName'
      KeyFields = 'PriceID'
      Lookup = True
    end
  end
  object PriceSelectDataSource: TDataSource
    DataSet = PriceSelectQuery
    Left = 624
    Top = 360
  end
  object ImageList1: TImageList
    Left = 672
    Top = 512
    Bitmap = {
      494C010107000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006C6A6A006C6A6A0000000000000000006C6A6A006C6A6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006C6A
      6A00AAA5A500A59F9F006C6A6A006C6A6A006C6A6A00E6E3E1006C6A6A006C6A
      6A006C6A6A0000000000000000000000000000000000000000006A2900006A29
      00005B230000522000004F1F00004F1F00004F1F00004F1F00004F1F00004F1F
      00004F1F00004F1F000000000000000000000000000000000000812B2800812B
      2800B0828200B0828200B0828200B0828200B0828200B0828200B0828200791C
      1C00812B28000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006C6A6A00DBD9
      D800A59F9F00A59F9F00A59F9F0036363600353535006C6A6A00C1BFBE00E6E3
      E100B8B6B6006C6A6A006C6A6A006C6A6A0000000000953A0000BE4A0000B647
      0000AA420000A23F00009A3C0000993C0000993C0000993C0000993C0000993C
      0000A03E00007E3100004F1F00000000000000000000812B2800BD4D4D00B548
      4800D9D4D8007816160078161600DFDFE000DCDADC00D9D6D800BFBCBD007816
      1600852B2900812B280000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006C6A6A00D5D3D200CAC8
      C700948D8C00948D8C00948D8C003C363B000A0A0A00070707000B0B0B000707
      07007C6F6A00BCBABA006C6A6A000000000000000000B9480000E45C0200CB52
      0200C84F0100C04B0000B9480000B2450000AE440000AE440000AE440000AE44
      0000B2450000A03E00004F1F00000000000000000000812B2800BE4A4B00B047
      4700DBD9DA007816160078161600DAD8D900DFDFE000DBD9DA00BFBDBF007816
      1600852B2900812B280000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006C6A6A00CAC8C700CAC8C700948D
      8C00D8D6D500CECBCB00BFBDBC00AFAFAF00A59F9F00948C8A005B5A5A000707
      070009090900080808006C6A6A00786D6B0000000000C54D0000E65D0200DA5D
      0700CB520200D4600D00E7844600E7844600E7844600D4600D00A7410000A741
      0000AE440000993C00004F1F00000000000000000000812B2800BE4A4B00B047
      4700DDDCDE007816160078161600D9D4D800DFDFE000DDDCDE00BFBEBE007816
      1600852B2900812B280000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006C6A6A00CAC8C700948D8C00F1EE
      E900F8F3EC00F8F3EC00E6E3E100E0DEDD00E0DEDD00D1CFCF00BFBDBC00ACAB
      AB00948C8A00575555007C6F6A00786D6B0000000000C84F0100EE660800EB60
      0400EB8D4200FBFBFA00FBFBFA00FBFBFA00FBFBFA00F6BC8800AA420000A741
      0000AE440000993C00004F1F00000000000000000000812B2800BE4A4B00B047
      4700DFDFE000DDDCDE00D9D4D800D9D4D800DAD8D900DAD8D900BFBEBE007817
      1700852B2900812B280000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006C6A6A00948D8C00F8F3EC00F8F3
      EC00F8F3EC00D5D3D200999392009F9A9A00B3ADAB00C4C1C100D8D6D500DBD9
      D800C7C5C400B8B6B60096908F006C69690000000000C84F0100F06F1100EF6C
      0E00FBFBFA00F4AE7000D4600D00D35D0C00CF580700C04B0000B6470000AA42
      0000AE440000993C00004F1F00000000000000000000812B2800BB484900B948
      4900BE4C4C00B7575600B7575600BB4E4E00B7494900B8525100BE4B4C00B548
      4800BE4A4B00812B280000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006C6A6A006C6A6A00EFEC
      E700ADA8A8007C6F6A00948C8A009993920096908F009B969500999392009F9A
      9A00BCBABA00D1CFCF00C4C1C1006C6A6A0000000000C84F0100EF914400F06F
      1100FBFBFA00EF6C0E00E45C0200DE5C0500CB520200F6BA8400C04B0000B948
      0000B64700009D3D00004F1F00000000000000000000812B2800A44B4B00B65F
      5D00BB878700BC908F00BC908F00BC908F00BC898800BC898800B9939300B997
      9700BE4B4C00812B280000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006C6A
      6A00B7847E00A47E74008B766D007C6F6A0067656500786D6B00948D8C00A8A2
      A200CECBCB00C4C1C1006C6A6A000000000000000000C84F0100F29D5400F06F
      1100FBFBFA00F1944600E95E0200E95E0200DE5C0500FBFBFA00F6B57C00C54D
      0000C04B0000A5400000572200000000000000000000812B2800BE4B4C00F6F6
      F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6
      F600BE4B4C00812B280000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B8837E00FBDBB700F8D1A600EAC9A900B7847E00B7847E00B8837E008172
      6B006C6A6A006C6A6A00000000000000000000000000C84F0100F3A46000EA89
      3F00F6BA8400FBFBFA00FAD6B500FAD6B500FBE7D400FBFBFA00FBFBFA00F8C7
      9A00C9500100B24500006A2900000000000000000000812B2800BE4B4C00F6F6
      F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6
      F600BE4B4C00812B280000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B8837E00FCDCBA00F8D3AA00F7D0A500F7D0A500F7D0A500B8837E000000
      00000000000000000000000000000000000000000000C84F0100F3AC6D00EA89
      3F00F06F1100F29D5400F8C08E00F6BC8800FAD6B500FBFBFA00FBFBFA00F8C0
      8E00DA5D0700BE4A0000772E00000000000000000000812B2800BE4B4C00F6F6
      F600BFBEBE00BFBEBE00BFBEBE00BFBEBE00BFBEBE00BFBEBE00BFBEBE00F6F6
      F600BE4B4C00812B280000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B784
      7E00FCE7CF00FBE1C300F9D8B300F8D1A600F7D0A500B8837E00000000000000
      00000000000000000000000000000000000000000000C84F0100F6B57C00F194
      4600F06F1100F06F1100F06F1100EF6C0E00EF690B00FBFBFA00F4AE7000E95E
      0200E45C0200C84F0100853400000000000000000000812B2800BE4B4C00F6F6
      F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6
      F600BE4B4C00812B280000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B883
      7E00FBEBD700FCE4CA00FCDEBD00F9D8B300F8D1A600B8837E00000000000000
      00000000000000000000000000000000000000000000C84F0100F6B88000F5B2
      7700F3A46000F2994E00ED8F4300EA893F00F06F1100F4AE7000EB600400E95E
      0200E95E0200DA5D0700953A00000000000000000000812B2800BE4B4C00F6F6
      F600BFBEBE00BFBEBE00BFBEBE00BFBEBE00BFBEBE00BFBEBE00BFBEBE00F6F6
      F600BE4B4C00812B280000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B8837E00F8F3
      EC00F8F3EC00FBEBD700FCE4CA00FCDEBD00EFCBA500B8837E00000000000000
      00000000000000000000000000000000000000000000C84F0100F3A46000F6BA
      8400F6BC8800F6B57C00F3AA6A00F29D5400EA893F00F06F1100EE660800EB60
      0400EB600400E45C0200A23F00000000000000000000812B2800BE4B4C00F6F6
      F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6
      F600BE4B4C00812B280000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B8837E00B883
      7E00B8837E00F9EFE100FCE7CF00FBE1C300B8837E0000000000000000000000
      0000000000000000000000000000000000000000000000000000D25B0800D460
      0D00D4600D00D4600D00D4600D00D4600D00D25B0800CC540400CB520200C950
      0100C9500100B948000000000000000000000000000000000000812B2800F6F6
      F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6
      F600812B28000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B8837E00B8837E00B8837E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A3676900A367
      6900A3676900A3676900A3676900A3676900A3676900A3676900A3676900A367
      6900A3676900A3676900A367690000000000000000000274AC000274AC000274
      AC000274AC000274AC000274AC000274AC000274AC000274AC000274AC000274
      AC000274AC000274AC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000005B7000005B7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B18C8400F7E5
      D000F1D7B900EECFAD00EECBA100EEC99600ECC58E00EAC18B00EAC18B00EAC1
      8B00EAC18B00EDC79100A3676900000000000274AC001489BB0041B6E20065D3
      F8004EC2F1004EC2F1004EC2F1004EC2F1004EC2F1004EC2F1004EC2F1004EC2
      F1002399C8000274AC000000000000000000000000000005B7000005B7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000005B7000005B70000000000000000000000000004640900025F
      070002580600014F0400014C0400014C0400014C0400014C0400014C0400014C
      0400014C0400014C040000000000000000000000000000000000B1908900F7E5
      D000F2D8BC00F0D4B600EDCDA800EECBA100EDC79100EBC38C00E9BF8800E9BF
      8800E9BF8800EBC38C00A3676900000000000274AC0035ACD7001F94C40077E1
      FA0054C7F60054C7F60054C7F60054C7F60054C7F60054C7F60054C7F60054C7
      F600279DCB0065D3F8000274AC0000000000000000000005B7000005B7000005
      B700000000000000000000000000000000000000000000000000000000000000
      00000005B7000005B7000000000000000000000000000C8E170010A12C000893
      1300069611000696110002900A0002900A0002900A0002900A0002900A000290
      0A0003970A0002700800014C0400000000000000000000000000B2928B00F9ED
      DF00F4DEC600F2D8BC00F0D4B600EECFAD00EECBA100EEC99600EBC38C00E9BF
      8800E9BF8800EBC38C00A3676900000000000274AC0058CAF7000274AC0098F4
      FC005FD0F8005FD0F8005FD0F8005FD0F8005FD0F8005FD0F8005FD0F8005FD0
      F80029A0CE0098F4FC000274AC0000000000000000000005B7000005B6000005
      B7000005B7000000000000000000000000000000000000000000000000000005
      B7000005B7000000000000000000000000000000000010A12C0017AA38000FA4
      2C000FA42C0005981000049A0E00F6FDF80017AA3800039B0C00039B0C00039B
      0C00039B0C0003970A00014C0400000000000000000000000000B2968E00FAF2
      E800F7E5D000F4DEC600F2D8BC00F0D4B600EDCDA800EECBA100EDC79100EBC3
      8C00E9BF8800EBC38C00A3676900000000000274AC005FD0F8000C7FB40075DF
      F90077E1FA006DDAF9006DDAF9006DDAF9006DDAF9006DDAF9006DDAF9006DDA
      F9002DA4D100A2F5FC000274AC000000000000000000000000000005D8000005
      BA000005B7000005B700000000000000000000000000000000000005B7000005
      B700000000000000000000000000000000000000000010A12C0020B1490017AA
      38001FB046009CE3B300A3E6B900D4F6E000A3E6B90039BC6200039B0C00039B
      0C00039B0C0002900A00014D0400000000000000000000000000B19D9700FCF8
      F300F9EDDF00F7E5D000F4DEC600F2D8BC00F0D4B600EECFAD00EECBA100EDC7
      9100EBC38C00ECC58E00A3676900000000000274AC006DDAF9002DA4D1003BB1
      DC0098F4FC0078E5FA0078E5FA0078E5FA0078E5FA0078E5FA0078E5FA000464
      0B0031A8D400A2F5FC0048BDEA000274AC000000000000000000000000000000
      00000005B7000005B7000005B600000000000005B6000005B7000005B7000000
      0000000000000000000000000000000000000000000010A12C0031B85A0022B2
      4D0043C26E00F6FDF8002DB65500B5EDC7006FD29100F6FDF80039BC6200039B
      0C00039B0C0002900A00014C0400000000000000000000000000AFA19C00FDFC
      FB00FAF2E800F8E8D600F7E5D000F4DEC600F2D8BC00F0D4B600EDCDA800EECA
      9C00EDC79100EDC79100A3676900000000000274AC0071DDF9005FD0F8000C7F
      B400CDF3F900B4F5FC00BDF5FC00BDF5FC00BDF5FC00B4F5FC0004640B0021AA
      420004640B00CDF3F900CAF2F8000274AC000000000000000000000000000000
      0000000000000005B6000005C8000005C8000005CD000005B400000000000000
      0000000000000000000000000000000000000000000010A12C0043C26E0034BA
      5D0048C4740074D495000FA42C00B5EDC7004DC67700F6FDF80081D99E00049A
      0E00039B0C0002900A00014C0400000000000000000000000000E2AC9A00FDFC
      FB00FCF8F300FAF2E800F8E8D600F7E5D000F4DEC600F2D8BC00F0D4B600EDCD
      A800EECBA100EEC99600A3676900000000000274AC007EEBFB007EEBFB000C7F
      B4000274AC000274AC000274AC000274AC000274AC0004640B0024AF680024AF
      680023AD4F0004640B000274AC000274AC000000000000000000000000000000
      000000000000000000000005C1000005C1000005D80000000000000000000000
      0000000000000000000000000000000000000000000010A12C005DCC850039BC
      62002DB757002AB5540043C26E00CEF4DC00EFFDF400F6FDF8006FD291000893
      13000598100002900A00014D0400000000000000000000000000E2AC9A00FDFC
      FB00FDFCFB00FBF5EF00FAF2E800F8E8D600F7E5D000F4DEC600F2D8BC00F0D4
      B600EDCDA800EECBA100A3676900000000000274AC0086F1FC0087F3FC0087F3
      FC0086F1FC0087F3FC0087F3FC0086F1FC0004640B0023AD4F0024AF680024AF
      680024AF680023AD4F0004640B00000000000000000000000000000000000000
      0000000000000005B6000005D8000005CD000005D8000005E700000000000000
      0000000000000000000000000000000000000000000010A12C0074D4950043C2
      6E0034BA5D00ADEAC100F6FDF800F6FDF800F6FDF80093DFAC001FB046000FA4
      2C000FA42C000696110001540500000000000000000000000000E2AC9A00FDFC
      FB00FDFCFB00FDFCFB00FCF8F300FAF2E800F8E8D600F7E5D000F4DEC600F1D7
      B900F1D7B900EDCCA500A3676900000000000274AC00CDF3F9008AF3FC008AF3
      FC008AF3FC008AF3FC008AF3FC0004640B0004640B0004640B0004640B0024AF
      680023AD4F0004640B0004640B0004640B000000000000000000000000000000
      00000005E3000005D8000005D40000000000000000000005E3000005EF000000
      0000000000000000000000000000000000000000000010A12C0081D99E004DC6
      770054C87D00F6FDF800DAF8E400E3FBEB0048C474001FB0460013A633000FA4
      2C000FA42C0008931300025F0700000000000000000000000000E3B29600FDFC
      FB00FDFCFB00FDFCFB00FDFCFB00FCF8F300FAF2E800F8E8D600F7E5D000F7E5
      D000EED0B200B29B9300A367690000000000000000000274AC00CDF3F9008EF4
      FC008EF4FC008EF4FC000274AB002DA4D1002DA4D1002DA4D10004640B0022AB
      610020A83C0004640B0000000000000000000000000000000000000000000005
      F2000005D8000005EF00000000000000000000000000000000000005F2000005
      F200000000000000000000000000000000000000000010A12C008ADCA40054C8
      7D005DCC8500F6FDF80081D99E00B9EECB003DBF6800B5EDC70043C26E001AAD
      3D0013A6330010A12C0006670B00000000000000000000000000E3B29600FDFC
      FB00FDFCFB00FDFCFB00FDFCFB00FDFCFB00FBF5EF00FAF2E800F4DEC600B088
      7E00A3706F00A3706F00A36769000000000000000000000000000274AC000274
      AC000274AC000274AC000000000000000000000000000000000004640B0023AD
      4F0004640B0000000000000000000000000000000000000000000005F2000005
      F2000005F2000000000000000000000000000000000000000000000000000005
      F2000005F2000000000000000000000000000000000010A12C0093DFAC0065CF
      8A0043C26E00A3E6B900C3F1D300CEF4DC00B9EECB00E3FBEB004DC677001FB0
      46001CAE410010A12C0002700800000000000000000000000000E3B29600FDFC
      FB00FDFCFB00FDFCFB00FDFCFB00FDFCFB00FDFCFB00FDFAF700C4BDBC00B16F
      5B00D5863D00D6863C00B5725800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000004640B001BA233001BA2
      330004640B00000000000000000000000000000000000005F2000005F2000005
      F200000000000000000000000000000000000000000000000000000000000000
      0000000000000005F20000000000000000000000000010A12C009CE3B30093DF
      AC006AD18F005DCC850074D49500F6FDF80093DFAC0048C474002AB5540022B2
      4D0022B24D0017AA380008931300000000000000000000000000EDCCA500FDFC
      FB00FDFCFB00FDFCFB00FDFCFB00FDFCFB00FDFCFB00FDFCFB00C4BDBC00B585
      7400E9BF8800BF774F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000004640B001BA233000464
      0B00000000000000000000000000000000000005F2000005F2000005F2000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010A12C007AD699009CE3
      B3009CE3B30093DFAC0081D99E006FD2910054C87D003DBF68002DB757002AB5
      54002DB757001CAE41000C8E1700000000000000000000000000E5BB8E00FBF5
      EF00FBF5EF00FBF5EF00FBF5EF00FBF5EF00FBF5EF00FBF5EF00C4BDBC00B773
      5600B58574000000000000000000000000000000000000000000000000000000
      000000000000000000000000000004640B0004640B0004640B0004640B000000
      0000000000000000000000000000000000000005F2000005F200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001CAE41002DB6
      55002DB655002DB6550025B3500020B149001CAE410017AA380013A6330013A6
      330010A42E0010A12C0000000000000000000000000000000000EECFAD00EED0
      B200EED0B200EED0B200EED0B200EED0B200EED0B200EED0B200EED0B200AC6C
      5F00000000000000000000000000000000000000000000000000000000000000
      00000000000004640B0004640B0004640B0004640B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000F33FFFFFFFFF0000E007C003C0070000
      C000800180030000800180018003000000008001800300000000800180030000
      00008001800300008000800180030000E001800180030000F003800180030000
      F01F800180030000E03F800180030000E03F800180030000C03F800180030000
      C07FC003C0070000F8FFFFFFFFFF0000C0018003FFFCFFFFC00100039FF9C003
      C00100018FF38001C001000187E78001C0010001C3CF8001C0010000F11F8001
      C0010000F83F8001C0010000FC7F8001C0010001F83F8001C0010000F19F8001
      C0018003E3CF8001C001C3C7C7E78001C001FF878FFB8001C003FF8F1FFF8001
      C007FE1F3FFFC003C00FF87FFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object PaymentBankDataSet: TIBDataSet
    Database = Database
    Transaction = PaymentBankTransaction
    AfterOpen = PaymentBankDataSetAfterOpen
    BeforeOpen = PaymentBankDataSetBeforeOpen
    DeleteSQL.Strings = (
      'DELETE FROM "Payments"'
      'WHERE'
      '  "PaymentID" = :"OLD_PaymentID"')
    InsertSQL.Strings = (
      'INSERT INTO "Payments"'
      
        '  ("PaymentID", "FirmID", "OrderID", "CustomerID", "Cash", "Date' +
        '", "Number", "TotalPay", "Debit", "Credit", "Type")'
      'VALUES'
      
        '  (:"PaymentID", :"FirmID", :"OrderID", :"CustomerID", :"Cash", ' +
        ':"Date", :"Number", :"TotalPay", :"Debit", :"Credit", :"Type")')
    RefreshSQL.Strings = (
      'SELECT '
      '  "PaymentID",'
      '  "FirmID",'
      '  "OrderID",'
      '  "CustomerID",'
      '  "Cash",'
      '  "Date",'
      '  "Number",'
      '  "TotalPay",'
      '  "Debit",'
      '  "Credit",'
      '  "Type"'
      'FROM "Payments"'
      'WHERE'
      '  "PaymentID" = :"PaymentID"')
    SelectSQL.Strings = (
      'SELECT "Payments".*, "Customers"."CustomerName"'
      'FROM "Payments", "Customers"'
      
        'WHERE ("Cash" = 0) AND ("FirmID" = :MainFirm) AND ("Customers"."' +
        'CustomerID" = "Payments"."CustomerID")'
      
        'AND ("Payments"."Date" >= :TopDate AND "Payments"."Date" <= :Bot' +
        'tomDate)'
      ''
      'ORDER BY "PaymentID"')
    ModifySQL.Strings = (
      'UPDATE "Payments"'
      'SET'
      '  "PaymentID" = :"PaymentID",'
      '  "FirmID" = :"FirmID",'
      '  "OrderID" = :"OrderID",'
      '  "CustomerID" = :"CustomerID",'
      '  "Cash" = :"Cash",'
      '  "Date" = :"Date",'
      '  "Number" = :"Number",'
      '  "TotalPay" = :"TotalPay",'
      '  "Debit" = :"Debit",'
      '  "Credit" = :"Credit",'
      '  "Type" = :"Type"'
      'WHERE'
      '  "PaymentID" = :"OLD_PaymentID"')
    GeneratorField.Field = 'PaymentID'
    GeneratorField.Generator = 'PaymentID_GEN'
    Left = 360
    Top = 152
    object IntegerField11: TIntegerField
      FieldName = 'PaymentID'
      Origin = 'Payment.PaymentID'
      Required = True
    end
    object PaymentBankDataSetFirmID: TIntegerField
      FieldName = 'FirmID'
      Origin = '"Payments"."FirmID"'
    end
    object IntegerField14: TIntegerField
      FieldName = 'OrderID'
      Origin = '"Payment"."OrderID"'
    end
    object IntegerField15: TIntegerField
      FieldName = 'CustomerID'
      Origin = 'Payment.CustomerID'
    end
    object SmallintField3: TSmallintField
      FieldName = 'Cash'
      Origin = 'Payment.Cash'
    end
    object PaymentBankDataSetDate: TDateField
      FieldName = 'Date'
      Origin = '"Payments"."Date"'
    end
    object PaymentBankDataSetNumber: TIBStringField
      FieldName = 'Number'
      Origin = '"Payments"."Number"'
      Size = 10
    end
    object PaymentBankDataSetTotalPay: TIBBCDField
      FieldName = 'TotalPay'
      Origin = '"Payments"."TotalPay"'
      Precision = 15
      Size = 2
    end
    object PaymentBankDataSetDebit: TIntegerField
      FieldName = 'Debit'
      Origin = '"Payments"."Debit"'
    end
    object PaymentBankDataSetCredit: TIntegerField
      FieldName = 'Credit'
      Origin = '"Payments"."Credit"'
    end
    object PaymentBankDataSetUserName: TIBStringField
      FieldName = 'UserName'
      Origin = '"Payments"."UserName"'
      Size = 31
    end
    object PaymentBankDataSetType: TSmallintField
      FieldName = 'Type'
      Origin = '"Payments"."Type"'
    end
    object PaymentBankDataSetCustomerName: TIBStringField
      FieldName = 'CustomerName'
      Origin = '"Customers"."CustomerName"'
      Size = 84
    end
  end
  object PaymentBankTransaction: TIBTransaction
    DefaultDatabase = Database
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saCommit
    Left = 384
    Top = 200
  end
  object PaymentBankDataSource: TDataSource
    DataSet = PaymentBankDataSet
    Left = 360
    Top = 248
  end
  object BuyStructureDataSet: TIBDataSet
    Database = Database
    Transaction = BuyOrderTransaction
    DeleteSQL.Strings = (
      'DELETE FROM "Structure"'
      'WHERE'
      
        '  ("OrderID" = :"OLD_OrderID") AND ("ProductID" = :"OLD_ProductI' +
        'D") AND ("StoreID" = :"OLD_StoreID") AND ("Price" = :"OLD_Price"' +
        ')')
    InsertSQL.Strings = (
      'INSERT INTO "Structure"'
      
        '  ("OrderID", "ProductID", "StoreID", "Qty", "PriceNonVAT", "Pri' +
        'ce", "VATRate", "Type")'
      'VALUES'
      
        '  (:"OrderID", :"ProductID", :"StoreID", :"Qty", :"PriceNonVAT",' +
        ' :"Price", :"VATRate", :"Type")')
    RefreshSQL.Strings = (
      'SELECT'
      '  "OrderID",'
      '  "ProductID",'
      '  "StoreID",'
      '  "Qty",'
      '  "PriceNonVAT",'
      '  "Price",'
      '  "VATRate",'
      '  "AmountVAT",'
      '  "Amount",'
      '  "Type"'
      'FROM "Structure"'
      'WHERE'
      
        '  ("OrderID" = :"OrderID") AND ("ProductID" = :"OLD_ProductID") ' +
        'AND ("StoreID" = :"StoreID") AND ("Price" = :"OLD_Price")')
    SelectSQL.Strings = (
      
        'SELECT "Structure".*, "Categories"."CategoryName" || '#39' '#39' || "Pro' +
        'ducts"."ProductName" AS "ProductFullName", "StoreQty"."Qty" AS "' +
        'RemainQty", "Divisions"."DivisionName"'
      
        'FROM "Structure", "Products", "Categories", "StoreQty", "Divisio' +
        'ns"'
      
        'WHERE ("Structure"."OrderID" = :"OrderID") AND (("Products"."Pro' +
        'ductID" = "Structure"."ProductID") AND ("Categories"."CategoryID' +
        '" = "Products"."CategoryID")) AND ("StoreQty"."StoreID" = "Struc' +
        'ture"."StoreID" AND "StoreQty"."DivisionID" = :"InDivisionID") A' +
        'ND ("StoreQty"."DivisionID" = "Divisions"."DivisionID")')
    ModifySQL.Strings = (
      'UPDATE "Structure"'
      'SET'
      '  "OrderID" = :"OrderID",'
      '  "ProductID" = :"ProductID",'
      '  "StoreID" = :"StoreID",'
      '  "Qty" = :"Qty",'
      '  "PriceNonVAT" = :"PriceNonVAT",'
      '  "Price" = :"Price",'
      '  "VATRate" = :"VATRate",'
      '  "Type" = :"Type"'
      'WHERE'
      
        '  ("OrderID" = :"OLD_OrderID") AND ("ProductID" = :"OLD_ProductI' +
        'D") AND ("StoreID" = :"OLD_StoreID") AND ("Price" = :"OLD_Price"' +
        ')')
    DataSource = BuyOrderDataSource
    Left = 672
    Top = 16
    object IntegerField16: TIntegerField
      FieldName = 'OrderID'
      Origin = '"SaleStructure"."OrderID"'
    end
    object IntegerField17: TIntegerField
      FieldName = 'ProductID'
      Origin = '"SaleStructure"."ProductID"'
    end
    object IntegerField18: TIntegerField
      FieldName = 'StoreID'
      Origin = '"SaleStructure"."StoreID"'
    end
    object BuyStructureDataSetQty: TIBBCDField
      FieldName = 'Qty'
      Origin = '"Structure"."Qty"'
      Precision = 9
      Size = 3
    end
    object BuyStructureDataSetPriceNonVAT: TIBBCDField
      FieldName = 'PriceNonVAT'
      Origin = '"Structure"."PriceNonVAT"'
      Precision = 9
      Size = 2
    end
    object IBBCDField6: TIBBCDField
      FieldName = 'Price'
      Origin = '"Structure"."Price"'
      Precision = 9
      Size = 2
    end
    object BuyStructureDataSetVATRate: TIBBCDField
      FieldName = 'VATRate'
      Origin = '"Structure"."VATRate"'
      Precision = 4
      Size = 2
    end
    object IBBCDField8: TIBBCDField
      FieldKind = fkInternalCalc
      FieldName = 'AmountVAT'
      Origin = '"SaleStructure"."AmountVAT"'
      ProviderFlags = []
      ReadOnly = True
      Precision = 15
      Size = 2
    end
    object IBBCDField9: TIBBCDField
      FieldKind = fkInternalCalc
      FieldName = 'Amount'
      Origin = '"SaleStructure"."Amount"'
      ProviderFlags = []
      ReadOnly = True
      Precision = 15
      Size = 2
    end
    object SmallintField4: TSmallintField
      FieldName = 'Type'
      Origin = '"Structure"."Type"'
    end
    object BuyStructureDataSetProductFullName: TIBStringField
      FieldName = 'ProductFullName'
      ProviderFlags = []
      Size = 169
    end
    object BuyStructureDataSetRemainQty: TIBBCDField
      FieldName = 'RemainQty'
      Origin = '"Qty"."Qty"'
      Precision = 9
      Size = 3
    end
    object BuyStructureDataSetDivisionName: TIBStringField
      FieldName = 'DivisionName'
      Origin = '"Divisions"."DivisionName"'
      Size = 84
    end
  end
  object BuyStoreDataSet: TIBDataSet
    Database = Database
    Transaction = BuyOrderTransaction
    BeforeOpen = BuyStoreDataSetBeforeOpen
    DeleteSQL.Strings = (
      'DELETE FROM "Store"'
      'WHERE'
      '  "StoreID" = :"OLD_StoreID"')
    InsertSQL.Strings = (
      'INSERT INTO "Store"'
      
        '  ("StoreID", "ProductID", "AccountPrice", "CCDID", "Certificate' +
        'ID", "Serial", "BeforeDate")'
      'VALUES'
      
        '  (:"StoreID", :"ProductID", :"AccountPrice", :"CCDID", :"Certif' +
        'icateID", :"Serial", :"BeforeDate")')
    RefreshSQL.Strings = (
      'SELECT'
      '  "StoreID",'
      '  "ProductID",'
      '  "AccountPrice",'
      '  "CCDID",'
      '  "CertificateID",'
      '  "Serial",'
      '  "BeforeDate"'
      'FROM "Store"'
      'WHERE'
      '  "StoreID" = :"OLD_StoreID"')
    SelectSQL.Strings = (
      'SELECT "Store".*'
      'FROM "Store"'
      'WHERE ("Store"."StoreID" = :"StoreID")')
    ModifySQL.Strings = (
      'UPDATE "Store"'
      'SET'
      '  "StoreID" = :"StoreID",'
      '  "ProductID" = :"ProductID",'
      '  "AccountPrice" = :"AccountPrice",'
      '  "CCDID" = :"CCDID",'
      '  "CertificateID" = :"CertificateID",'
      '  "Serial" = :"Serial",'
      '  "BeforeDate" = :"BeforeDate"'
      'WHERE'
      '  "StoreID" = :"OLD_StoreID"')
    DataSource = BuyStructureDataSource
    Left = 704
    Top = 16
    object IntegerField22: TIntegerField
      FieldName = 'ProductID'
      Origin = '"Store"."ProductID"'
    end
    object IntegerField21: TIntegerField
      FieldName = 'StoreID'
      Origin = '"Store"."StoreID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object BuyStoreDataSetAccountPrice: TIBBCDField
      FieldName = 'AccountPrice'
      Origin = '"Store"."AccountPrice"'
      Precision = 9
      Size = 2
    end
    object BuyStoreDataSetCCDID: TIntegerField
      FieldName = 'CCDID'
      Origin = '"Store"."CCDID"'
    end
    object BuyStoreDataSetCertificateID: TIntegerField
      FieldName = 'CertificateID'
      Origin = '"Store"."CertificateID"'
    end
    object BuyStoreDataSetSerial: TIBStringField
      FieldName = 'Serial'
      Origin = '"Store"."Serial"'
      Size = 84
    end
    object BuyStoreDataSetBeforeDate: TDateField
      FieldName = 'BeforeDate'
      Origin = '"Store"."BeforeDate"'
    end
  end
  object BuyStoreDataSource: TDataSource
    DataSet = BuyStoreDataSet
    Left = 704
    Top = 112
  end
  object ImageList3: TImageList
    Left = 768
    Top = 512
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000008740D0008740D0008740D0008740D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000008740D001DAF310021A9330008740D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000008740D001DAF31001DAF310008740D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000874
      0D0008740D0008740D0008740D0023B93B001FB4340008740D0008740D000874
      0D0008740D000000000000000000000000000000000000000000000000000000
      0000000199000001990000019900000199000001990000019900000199000001
      9900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000874
      0D0038D05D0036CE5A0031C953002BC2490028BF430022B839001FB434001DAF
      310008740D000000000000000000000000000000000000000000000000000000
      0000000199000321DE000321DE000321DE000321DE000321DE00021EDA000001
      9900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000874
      0D0038D05D0038D05D0038D05D0034CC57002EC54D002BC2490025BB3E0020B6
      370008740D000000000000000000000000000000000000000000000000000000
      0000000199000321DE000321DE000321DE000321DE000321DE000321DE000001
      9900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000874
      0D0008740D0008740D0008740D0038D05D0038D05D0008740D0008740D000874
      0D0008740D000000000000000000000000000000000000000000000000000000
      0000000199000001990000019900000199000001990000019900000199000001
      9900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000008740D0038D05D0038D05D0008740D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000008740D0038D05D0038D05D0008740D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000008740D0008740D0008740D0008740D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000FFFFFFFF00000000
      FFFFFFFF00000000FC3FFFFF00000000FC3FFFFF00000000FC3FFFFF00000000
      E007F00F00000000E007F00F00000000E007F00F00000000E007F00F00000000
      FC3FFFFF00000000FC3FFFFF00000000FC3FFFFF00000000FFFFFFFF00000000
      FFFFFFFF00000000FFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object HomeStructureDataSet: TIBDataSet
    Database = Database
    Transaction = HomeTransaction
    DeleteSQL.Strings = (
      'DELETE FROM "Structure"'
      'WHERE'
      
        '  ("OrderID" = :"OLD_OrderID") AND ("ProductID" = :"OLD_ProductI' +
        'D") AND ("StoreID" = :"OLD_StoreID") AND ("Price" = :"OLD_Price"' +
        ')')
    InsertSQL.Strings = (
      'INSERT INTO "Structure"'
      
        '  ("OrderID", "ProductID", "StoreID", "Qty", "Price", "VATRate",' +
        ' "Type")'
      'VALUES'
      
        '  (:"OrderID", :"ProductID", :"StoreID", :"Qty", :"Price", :"VAT' +
        'Rate", :"Type")')
    RefreshSQL.Strings = (
      'SELECT'
      '  "OrderID",'
      '  "ProductID",'
      '  "StoreID",'
      '  "Qty",'
      '  "Price",'
      '  "VATRate",'
      '  "AmountVAT",'
      '  "Amount",'
      '  "Type"'
      'FROM "Structure"'
      'WHERE'
      
        '  ("OrderID" = :"OrderID") AND ("ProductID" = :"OLD_ProductID") ' +
        'AND ("StoreID" = :"StoreID") AND ("Price" = :"OLD_Price")')
    SelectSQL.Strings = (
      
        'SELECT "Structure".*, "Categories"."CategoryName" || '#39' '#39' || "Pro' +
        'ducts"."ProductName" AS "ProductFullName", "Measures"."MeasureNa' +
        'me", "Countrys"."CountryName"'
      
        'FROM "Structure", "Products", "Categories", "Measures", "Country' +
        's"'
      
        'WHERE ("Structure"."OrderID" = :"OrderID") AND (("Products"."Pro' +
        'ductID" = "Structure"."ProductID") AND ("Categories"."CategoryID' +
        '" = "Products"."CategoryID")) AND ("Measures"."MeasureID" = "Pro' +
        'ducts"."MeasureID") AND ("Countrys"."CountryID" = "Products"."Co' +
        'untryID")')
    ModifySQL.Strings = (
      'UPDATE "Structure"'
      'SET'
      '  "OrderID" = :"OrderID",'
      '  "ProductID" = :"ProductID",'
      '  "StoreID" = :"StoreID",'
      '  "Qty" = :"Qty",'
      '  "Price" = :"Price",'
      '  "VATRate" = :"VATRate",'
      '  "Type" = :"Type"'
      'WHERE'
      
        '  ("OrderID" = :"OLD_OrderID") AND ("ProductID" = :"OLD_ProductI' +
        'D") AND ("StoreID" = :"OLD_StoreID") AND ("Price" = :"OLD_Price"' +
        ')')
    DataSource = HomeOrderDataSource
    Left = 680
    Top = 160
    object IntegerField3: TIntegerField
      FieldName = 'OrderID'
      Origin = '"SaleStructure"."OrderID"'
    end
    object IntegerField5: TIntegerField
      FieldName = 'ProductID'
      Origin = '"SaleStructure"."ProductID"'
    end
    object IntegerField8: TIntegerField
      FieldName = 'StoreID'
      Origin = '"SaleStructure"."StoreID"'
    end
    object HomeStructureDataSetQty: TIBBCDField
      FieldName = 'Qty'
      Origin = '"Structure"."Qty"'
      Precision = 9
      Size = 3
    end
    object IBBCDField1: TIBBCDField
      FieldName = 'Price'
      Origin = '"Structure"."Price"'
      Precision = 9
      Size = 2
    end
    object HomeStructureDataSetVATRate: TIBBCDField
      FieldName = 'VATRate'
      Origin = '"Structure"."VATRate"'
      Precision = 4
      Size = 2
    end
    object IBBCDField5: TIBBCDField
      FieldKind = fkInternalCalc
      FieldName = 'AmountVAT'
      Origin = '"SaleStructure"."AmountVAT"'
      ProviderFlags = []
      ReadOnly = True
      Precision = 15
      Size = 2
    end
    object IBBCDField14: TIBBCDField
      FieldKind = fkInternalCalc
      FieldName = 'Amount'
      Origin = '"SaleStructure"."Amount"'
      ProviderFlags = []
      ReadOnly = True
      Precision = 15
      Size = 2
    end
    object SmallintField6: TSmallintField
      FieldName = 'Type'
      Origin = '"Structure"."Type"'
    end
    object HomeStructureDataSetProductFullName: TIBStringField
      FieldName = 'ProductFullName'
      ProviderFlags = []
      Size = 169
    end
    object HomeStructureDataSetMeasureName: TIBStringField
      FieldName = 'MeasureName'
      Origin = '"Measures"."MeasureName"'
      Size = 12
    end
    object HomeStructureDataSetCountryName: TIBStringField
      FieldName = 'CountryName'
      Origin = '"Countrys"."CountryName"'
      Size = 84
    end
  end
  object HomeStoreDataSource: TDataSource
    DataSet = HomeStoreDataSet
    Left = 696
    Top = 248
  end
  object SaleOrderDataSet: TIBDataSet
    Database = Database
    Transaction = SaleOrderTransaction
    AfterOpen = SaleOrderDataSetAfterOpen
    BeforeOpen = SaleOrderDataSetBeforeOpen
    DeleteSQL.Strings = (
      'DELETE FROM "Orders"'
      'WHERE'
      '  "OrderID" = :"OLD_OrderID"')
    InsertSQL.Strings = (
      'INSERT INTO "Orders"'
      
        '  ("OrderID", "FirmID", "OutDivisionID", "CustomerID", "Date", "' +
        'Number", "IssueDate", "TotalAmountVAT", "TotalAmount", "Pay", "P' +
        'ayDate", "PriceID", "Note", "ProperID")'
      'VALUES'
      
        '  (:"OrderID", :"FirmID", :"OutDivisionID", :"CustomerID", :"Dat' +
        'e", :"Number", :"IssueDate", :"TotalAmountVAT", :"TotalAmount", ' +
        ':"Pay", :"PayDate", :"PriceID", :"Note", :"ProperID")')
    RefreshSQL.Strings = (
      
        'SELECT "Orders".*, "Customers"."CustomerName", "Divisions"."Divi' +
        'sionName"'
      'FROM "Orders", "Customers", "Divisions"'
      'WHERE'
      
        '  ("Orders"."OrderID" = :"OrderID") AND ("Orders"."CustomerID" =' +
        ' "Customers"."CustomerID") AND ("Orders"."OutDivisionID" = "Divi' +
        'sions"."DivisionID")')
    SelectSQL.Strings = (
      
        'SELECT "Orders".*, "Customers"."CustomerName", "Divisions"."Divi' +
        'sionName"'
      'FROM "Orders", "Customers", "Divisions"'
      
        'WHERE (("Orders"."FirmID" = :MainFirm) AND ("Orders"."ProperID" ' +
        '= 1 OR "Orders"."ProperID" = 2)) AND ("Orders"."CustomerID" = "C' +
        'ustomers"."CustomerID") AND ("Orders"."OutDivisionID" = "Divisio' +
        'ns"."DivisionID")'
      
        'AND ("Orders"."Date" >= :TopDate AND "Orders"."Date" <= :BottomD' +
        'ate)'
      ''
      'ORDER BY "Date", "OrderID"')
    ModifySQL.Strings = (
      'UPDATE "Orders"'
      'SET'
      '  "OrderID" = :"OrderID",'
      '  "FirmID" = :"FirmID",'
      '  "OutDivisionID" = :"OutDivisionID",'
      '  "CustomerID" = :"CustomerID",'
      '  "Date" = :"Date",'
      '  "Number" = :"Number",'
      '  "IssueDate" = :"IssueDate",'
      '  "TotalAmountVAT" = :"TotalAmountVAT",'
      '  "TotalAmount" = :"TotalAmount",'
      '  "Pay" = :"Pay",'
      '  "PayDate" = :"PayDate",'
      '  "PriceID" = :"PriceID",'
      '  "Note" = :"Note",'
      '  "ProperID" = :"ProperID"'
      'WHERE'
      '  "OrderID" = :"OLD_OrderID"')
    GeneratorField.Field = 'OrderID'
    GeneratorField.Generator = 'OrderID_GEN'
    Left = 800
    Top = 16
    object IntegerField39: TIntegerField
      FieldName = 'OrderID'
      Origin = '"Orders"."OrderID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField40: TIntegerField
      FieldName = 'FirmID'
      Origin = '"Orders"."FirmID"'
    end
    object SaleOrderDataSetOutDivisionID: TIntegerField
      FieldName = 'OutDivisionID'
      Origin = '"Orders"."OutDivisionID"'
    end
    object IntegerField41: TIntegerField
      FieldName = 'CustomerID'
      Origin = '"Orders"."CustomerID"'
    end
    object DateField3: TDateField
      FieldName = 'Date'
      Origin = 'Invoice.Date'
    end
    object IBStringField13: TIBStringField
      FieldName = 'Number'
      Origin = '"BuyInvoice"."Number"'
      Size = 10
    end
    object SaleOrderDataSetTotalAmountVAT: TIBBCDField
      FieldName = 'TotalAmountVAT'
      Origin = '"Orders"."TotalAmountVAT"'
      Precision = 15
      Size = 2
    end
    object IBBCDField19: TIBBCDField
      FieldName = 'TotalAmount'
      Origin = '"Orders"."TotalAmount"'
      Size = 2
    end
    object IBBCDField20: TIBBCDField
      FieldName = 'Pay'
      Origin = 'BuyInvoice.Pay'
      Precision = 18
      Size = 2
    end
    object DateField5: TDateField
      FieldName = 'PayDate'
      Origin = '"Orders"."PayDate"'
    end
    object IBBCDField21: TIBBCDField
      FieldKind = fkInternalCalc
      FieldName = 'Debt'
      Origin = '"BuyInvoice"."Debt"'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object SaleOrderDataSetPriceID: TIntegerField
      FieldName = 'PriceID'
      Origin = '"Orders"."PriceID"'
    end
    object SaleOrderDataSetNote: TIBStringField
      FieldName = 'Note'
      Origin = '"Orders"."Note"'
      Size = 255
    end
    object SaleOrderDataSetUserName: TIBStringField
      FieldName = 'UserName'
      Origin = '"Orders"."UserName"'
      Size = 31
    end
    object SaleOrderDataSetProperID: TIntegerField
      FieldName = 'ProperID'
      Origin = '"Orders"."ProperID"'
    end
    object IBStringField14: TIBStringField
      FieldName = 'CustomerName'
      Origin = '"Customers"."CustomerName"'
      Size = 84
    end
    object SaleOrderDataSetDivisionName: TIBStringField
      FieldName = 'DivisionName'
      Origin = '"Divisions"."DivisionName"'
      Size = 84
    end
  end
  object SampleMeasureQuery: TIBQuery
    Database = Database
    Transaction = DefaultTransaction
    SQL.Strings = (
      'SELECT "Measures".*, "Products"."ProductID"'
      'FROM "Measures", "Products"'
      'WHERE "Measures"."MeasureID" = "Products"."MeasureID"')
    Left = 184
    Top = 416
    object SampleMeasureQueryMeasureID: TIntegerField
      FieldName = 'MeasureID'
      Origin = '"Measures"."MeasureID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SampleMeasureQueryMeasureName: TIBStringField
      FieldName = 'MeasureName'
      Origin = '"Measures"."MeasureName"'
      Size = 10
    end
    object SampleMeasureQueryProductID: TIntegerField
      FieldName = 'ProductID'
      Origin = '"Products"."ProductID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object SampleMeasureDataSource: TDataSource
    DataSet = SampleMeasureQuery
    Left = 184
    Top = 464
  end
  object ReportFirmQuery: TIBQuery
    Database = Database
    Transaction = ReportTransaction
    SQL.Strings = (
      'SELECT "Customers".*, "Banks".*'
      'FROM "Customers", "Banks"'
      
        'WHERE ("Customers"."CustomerID" = :MainFirm) AND ("Customers"."B' +
        'ankID" = "Banks"."BankID")')
    Left = 40
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'MainFirm'
        ParamType = ptUnknown
      end>
    object ReportFirmQueryCustomerID: TIntegerField
      FieldName = 'CustomerID'
      Origin = '"Customers"."CustomerID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ReportFirmQueryCustomerName: TIBStringField
      FieldName = 'CustomerName'
      Origin = '"Customers"."CustomerName"'
      Size = 84
    end
    object ReportFirmQueryCustomerFullName: TIBStringField
      FieldName = 'CustomerFullName'
      Origin = '"Customers"."CustomerFullName"'
      Size = 84
    end
    object ReportFirmQueryAddress: TIBStringField
      FieldName = 'Address'
      Origin = '"Customers"."Address"'
      Size = 84
    end
    object ReportFirmQueryPhone: TIBStringField
      FieldName = 'Phone'
      Origin = '"Customers"."Phone"'
      Size = 15
    end
    object ReportFirmQueryOKONH: TIBStringField
      FieldName = 'OKONH'
      Origin = '"Customers"."OKONH"'
      Size = 12
    end
    object ReportFirmQueryOKPO: TIBStringField
      FieldName = 'OKPO'
      Origin = '"Customers"."OKPO"'
      Size = 12
    end
    object ReportFirmQueryINN: TIBStringField
      FieldName = 'INN'
      Origin = '"Customers"."INN"'
      Size = 12
    end
    object ReportFirmQueryKPP: TIBStringField
      FieldName = 'KPP'
      Origin = '"Customers"."KPP"'
      Size = 9
    end
    object ReportFirmQueryRegistration: TIBStringField
      FieldName = 'Registration'
      Origin = '"Customers"."Registration"'
      Size = 84
    end
    object ReportFirmQueryBankID: TIntegerField
      FieldName = 'BankID'
      Origin = '"Customers"."BankID"'
    end
    object ReportFirmQueryAccount: TIBStringField
      FieldName = 'Account'
      Origin = '"Customers"."Account"'
    end
    object ReportFirmQueryPriceID: TIntegerField
      FieldName = 'PriceID'
      Origin = '"Customers"."PriceID"'
    end
    object ReportFirmQueryDelayPay: TSmallintField
      FieldName = 'DelayPay'
      Origin = '"Customers"."DelayPay"'
    end
    object ReportFirmQueryNote: TBlobField
      FieldName = 'Note'
      Origin = '"Customers"."Note"'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object ReportFirmQueryFirm: TSmallintField
      FieldName = 'Firm'
      Origin = '"Customers"."Firm"'
    end
    object ReportFirmQueryBankID1: TIntegerField
      FieldName = 'BankID1'
      Origin = '"Banks"."BankID"'
      Required = True
    end
    object ReportFirmQueryBankName: TIBStringField
      FieldName = 'BankName'
      Origin = '"Banks"."BankName"'
      Size = 84
    end
    object ReportFirmQueryAddress1: TIBStringField
      FieldName = 'Address1'
      Origin = '"Banks"."Address"'
      Size = 84
    end
    object ReportFirmQueryAccount1: TIBStringField
      FieldName = 'Account1'
      Origin = '"Banks"."Account"'
    end
    object ReportFirmQueryBIC: TIBStringField
      FieldName = 'BIC'
      Origin = '"Banks"."BIC"'
      Size = 9
    end
  end
  object ReportFirmDataSource: TDataSource
    DataSet = ReportFirmQuery
    Left = 32
    Top = 520
  end
  object ReportCustomerQuery: TIBQuery
    Database = Database
    Transaction = ReportTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM "Customers"'
      'WHERE "CustomerID" = :CustomerID')
    Left = 80
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CustomerID'
        ParamType = ptUnknown
      end>
    object IntegerField42: TIntegerField
      FieldName = 'CustomerID'
      Origin = '"Customers"."CustomerID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBStringField15: TIBStringField
      FieldName = 'CustomerName'
      Origin = '"Customers"."CustomerName"'
      Size = 84
    end
    object IBStringField16: TIBStringField
      FieldName = 'CustomerFullName'
      Origin = '"Customers"."CustomerFullName"'
      Size = 84
    end
    object IBStringField17: TIBStringField
      FieldName = 'Address'
      Origin = '"Customers"."Address"'
      Size = 84
    end
    object IBStringField18: TIBStringField
      FieldName = 'Phone'
      Origin = '"Customers"."Phone"'
      Size = 15
    end
    object IBStringField19: TIBStringField
      FieldName = 'OKONH'
      Origin = '"Customers"."OKONH"'
      Size = 12
    end
    object IBStringField20: TIBStringField
      FieldName = 'OKPO'
      Origin = '"Customers"."OKPO"'
      Size = 12
    end
    object IBStringField21: TIBStringField
      FieldName = 'INN'
      Origin = '"Customers"."INN"'
      Size = 12
    end
    object IBStringField22: TIBStringField
      FieldName = 'KPP'
      Origin = '"Customers"."KPP"'
      Size = 9
    end
    object IBStringField23: TIBStringField
      FieldName = 'Registration'
      Origin = '"Customers"."Registration"'
      Size = 84
    end
    object IntegerField43: TIntegerField
      FieldName = 'BankID'
      Origin = '"Customers"."BankID"'
    end
    object IBStringField24: TIBStringField
      FieldName = 'Account'
      Origin = '"Customers"."Account"'
    end
    object IntegerField44: TIntegerField
      FieldName = 'PriceID'
      Origin = '"Customers"."PriceID"'
    end
    object SmallintField9: TSmallintField
      FieldName = 'DelayPay'
      Origin = '"Customers"."DelayPay"'
    end
    object BlobField1: TBlobField
      FieldName = 'Note'
      Origin = '"Customers"."Note"'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object SmallintField10: TSmallintField
      FieldName = 'Firm'
      Origin = '"Customers"."Firm"'
    end
  end
  object ReportCustomerDataSource: TDataSource
    DataSet = ReportCustomerQuery
    Left = 80
    Top = 520
  end
  object ReportTransaction: TIBTransaction
    DefaultDatabase = Database
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saCommit
    Left = 56
    Top = 472
  end
  object SampleCountryQuery: TIBQuery
    Database = Database
    Transaction = DefaultTransaction
    SQL.Strings = (
      'SELECT "Countrys".*, "Store"."StoreID"'
      'FROM "Countrys", "Store"'
      'WHERE "Countrys"."CountryID" = "Store"."CountryID"')
    Left = 248
    Top = 416
    object SampleCountryQueryCountryID: TIntegerField
      FieldName = 'CountryID'
      Origin = '"Countrys"."CountryID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SampleCountryQueryCountryName: TIBStringField
      FieldName = 'CountryName'
      Origin = '"Countrys"."CountryName"'
      Size = 84
    end
    object SampleCountryQueryStoreID: TIntegerField
      FieldName = 'StoreID'
      Origin = '"Store"."StoreID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object SampleCountryDataSource: TDataSource
    DataSet = SampleCountryQuery
    Left = 248
    Top = 464
  end
  object SampleCCDDataSource: TDataSource
    DataSet = SampleCCDQuery
    Left = 312
    Top = 464
  end
  object SampleCCDQuery: TIBQuery
    Database = Database
    Transaction = DefaultTransaction
    SQL.Strings = (
      'SELECT "CCD".*, "Store"."StoreID"'
      'FROM "CCD", "Store"'
      'WHERE "CCD"."CCDID" = "Store"."CCDID"')
    Left = 312
    Top = 416
    object SampleCCDQueryCCDID: TIntegerField
      FieldName = 'CCDID'
      Origin = '"CCD"."CCDID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SampleCCDQueryCCDName: TIBStringField
      FieldName = 'CCDName'
      Origin = '"CCD"."CCDName"'
      Size = 84
    end
    object SampleCCDQueryStoreID: TIntegerField
      FieldName = 'StoreID'
      Origin = '"Store"."StoreID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object GroupVATQuery: TIBQuery
    Database = Database
    Transaction = DefaultTransaction
    DataSource = SaleOrderDataSource
    SQL.Strings = (
      'SELECT "VATRate", SUM("AmountVAT")'
      'FROM "Structure"'
      'WHERE "Structure"."OrderID" = :"OrderID"'
      'GROUP BY "VATRate"')
    Left = 376
    Top = 416
    ParamData = <
      item
        DataType = ftInteger
        Name = 'OrderID'
        ParamType = ptUnknown
        Size = 4
      end>
    object GroupVATQueryVATRate: TIBBCDField
      FieldName = 'VATRate'
      ProviderFlags = []
      Precision = 4
      Size = 2
    end
    object GroupVATQuerySUM: TIBBCDField
      FieldName = 'SUM'
      ProviderFlags = []
      Precision = 15
      Size = 2
    end
  end
  object GroupVATDataSource: TDataSource
    DataSet = GroupVATQuery
    Left = 376
    Top = 464
  end
  object TestDaysQuery: TIBQuery
    Database = Database
    Transaction = DefaultTransaction
    BeforeOpen = TestDaysQueryBeforeOpen
    SQL.Strings = (
      'SELECT (MAX("Date") - MIN("Date")) AS "Test"'
      'FROM "Orders"'
      'WHERE "Orders"."FirmID" = :MainFirm')
    Left = 752
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'MainFirm'
        ParamType = ptUnknown
      end>
    object TestDaysQueryTest: TIntegerField
      FieldName = 'Test'
      ProviderFlags = []
    end
  end
  object TestDaysDataSource: TDataSource
    DataSet = TestDaysQuery
    Left = 752
    Top = 360
  end
  object StoreOrderDataSource: TDataSource
    DataSet = StoreOrderQuery
    Left = 144
    Top = 248
  end
  object BuyPriceDataSource: TDataSource
    DataSet = BuyPriceDataSet
    Left = 768
    Top = 112
  end
  object BuyPriceDataSet: TIBDataSet
    Database = Database
    Transaction = BuyOrderTransaction
    DeleteSQL.Strings = (
      'DELETE FROM "Prices"'
      'WHERE'
      '  ("StoreID" = :"OLD_StoreID") AND ("PriceID" = :"OLD_PriceID")')
    InsertSQL.Strings = (
      'INSERT INTO "Prices"'
      '  ("StoreID", "PriceID", "Price")'
      'VALUES'
      '  (:"StoreID", :"PriceID", :"Price")')
    RefreshSQL.Strings = (
      'SELECT'
      '  "StoreID",'
      '  "PriceID",'
      '  "Price"'
      'FROM "Prices"'
      'WHERE'
      '  ("StoreID" = :"StoreID") AND ("PriceID" = :"PriceID")')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM "Prices"'
      'WHERE "StoreID" = :"StoreID"')
    ModifySQL.Strings = (
      'UPDATE "Prices"'
      'SET'
      '  "StoreID" = :"StoreID",'
      '  "PriceID" = :"PriceID",'
      '  "Price" = :"Price"'
      'WHERE'
      '  ("StoreID" = :"OLD_StoreID") AND ("PriceID" = :"OLD_PriceID")')
    DataSource = BuyStoreDataSource
    Left = 768
    Top = 16
    object IntegerField45: TIntegerField
      FieldName = 'StoreID'
      Origin = '"Prices"."StoreID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField46: TIntegerField
      FieldName = 'PriceID'
      Origin = '"Prices"."PriceID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBBCDField22: TIBBCDField
      FieldName = 'Price'
      Origin = '"Prices"."Price"'
      Precision = 9
      Size = 2
    end
    object StringField3: TStringField
      FieldKind = fkLookup
      FieldName = 'PriceName'
      LookupDataSet = TypePriceDataSet
      LookupKeyFields = 'PriceID'
      LookupResultField = 'PriceName'
      KeyFields = 'PriceID'
      Lookup = True
    end
  end
  object ImageList2: TImageList
    Left = 720
    Top = 512
    Bitmap = {
      494C010107000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000989898009898980000000000000000009898980098989800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009898
      9800BFBFBF00B9B9B900989898009898980098989800E1E1E100989898009898
      9800989898000000000000000000000000000000000000000000888888008888
      8800838383007F7F7F007E7E7E007E7E7E007E7E7E007E7E7E007E7E7E007E7E
      7E007E7E7E0079797900000000000000000000000000000000008E8E8E008E8E
      8E00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD008686
      86008E8E8E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000098989800DBDB
      DB00B9B9B900B9B9B900B9B9B900727272007272720099999900CCCCCC00DFDF
      DF00C8C8C8009898980098989800989898000000000096969600A0A0A0009E9E
      9E009B9B9B009898980096969600969696009696960096969600969696009696
      9600989898008E8E8E007979790000000000000000008E8E8E00B7B7B700B1B1
      B100EDEDED008383830083838300F0F0F000EEEEEE00E8E8E800D9D9D9007E7E
      7E00929292008E8E8E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000098989800D7D7D700D3D3
      D300AEAEAE00AEAEAE00AEAEAE00727272004747470045454500494949004545
      4500A2A2A200CACACA009898980000000000000000009F9F9F00AAAAAA00A9A9
      A900A3A1A300A2A1A2009F9F9F009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009E9E9E00989898007E7E7E0000000000000000008E8E8E00B5B5B500B1B1
      B100F0F0F0008383830083838300EDEDED00F0F0F000EDEDED00DCDCDC007F7F
      7F00929292008E8E8E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000098989800D3D3D300D3D3D300AEAE
      AE00D8D8D800D3D3D300CBCBCB00C3C3C300B9B9B900AAAAAA008F8F8F004545
      45004747470046464600989898009C9C9C0000000000A2A1A200ADADAD00A9A9
      A900A9A9A900B1B1B100C1C1C100C7C7C700C4C4C400B6B6B6009A9A9A009A9A
      9A009C9C9C00969696007E7E7E0000000000000000008E8E8E00B5B5B500B1B1
      B100F3F3F3008383830083838300EAEAEA00EEEEEE00EEEEEE00E0E0E0007C7C
      7C00929292008E8E8E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000098989800D3D3D300AEAEAE00E6E6
      E600E8E7E800E8E7E800DFDFDF00DEDEDE00DEDEDE00D5D5D500CACACA00C2C2
      C200ADADAD008C8C8C00A2A2A2009C9C9C0000000000A3A1A300B5B5B500B1B1
      B100CCCCCC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00E2E2E2009B9B9B009A9A
      9A009C9C9C00969696007E7E7E0000000000000000008E8E8E00B5B5B500B1B1
      B100F3F3F300F3F3F300EDEDED00EAEAEA00EDEDED00EDEDED00E0E0E0008585
      8500929292008E8E8E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000098989800AEAEAE00E8E7E800E8E7
      E800E8E7E800D8D8D800B3B3B300B6B6B600C2C2C200CDCDCD00DADADA00DBDB
      DB00D0D0D000C8C8C800AFAFAF009797970000000000A3A1A300C1C1C100B8B8
      B800FCFCFC00E1E1E100B3B3B300AFAFAF00ABABAB00A3A1A3009E9E9E009B9B
      9B009C9C9C00969696007E7E7E0000000000000000008E8E8E00B1B1B100B1B1
      B100B2B2B200B7B7B700B6B6B600B1B1B100B1B1B100B5B5B500B2B2B200B1B1
      B100B3B3B3008E8E8E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009898980098989800E6E6
      E600C2C2C2009F9F9F00AAAAAA00B2B2B200B2B2B200B6B6B600B3B3B300B6B6
      B600C9C9C900D7D7D700CECECE009898980000000000A3A1A300CECECE00BDBD
      BD00FCFCFC00B8B8B800ABABAB00A9A9A900A9A9A900E4E4E400A1A0A1009F9F
      9F009F9F9F00979797007E7E7E0000000000000000008E8E8E00B1B1B100B6B6
      B600CBCBCB00D0D0D000D0D0D000D0D0D000D0D0D000CBCBCB00D0D0D000D6D6
      D600B3B3B3008E8E8E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009898
      9800A7A7A700999999008C8C8C009A9A9A00969696009F9F9F00AEAEAE00BDBD
      BD00D3D3D300CDCDCD00989898000000000000000000A3A1A300D8D8D800C1C1
      C100FCFCFC00D1D1D100AEAEAE00ADADAD00AAAAAA00FCFCFC00E1E1E100A2A1
      A200A1A0A1009A9A9A008181810000000000000000008E8E8E00B3B3B300FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00B3B3B3008E8E8E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A9A9A900D3D3D300CCCCCC00B9B9B900A7A7A7009F9F9F00A9A9A900A5A5
      A5009898980098989800000000000000000000000000A3A1A300DCDCDC00C4C4
      C400E7E7E700FCFCFC00F7F7F700F7F7F700FCFCFC00FCFCFC00FCFCFC00ECEC
      EC00A3A1A3009C9C9C008888880000000000000000008E8E8E00B3B3B300FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00B3B3B3008E8E8E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A9A9A900D5D5D500CFCFCF00CBCBCB00C6C6C600C3C3C300A9A9A9000000
      00000000000000000000000000000000000000000000A3A1A300DFDFDF00C9C9
      C900C1C1C100D8D8D800E9E9E900E9E9E900F6F6F600FCFCFC00FCFCFC00E9E9
      E900A9A9A900A1A0A1008C8C8C0000000000000000008E8E8E00B3B3B300FEFE
      FE00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00FEFE
      FE00B3B3B3008E8E8E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000ABAB
      AB00DEDEDE00D8D8D800D3D3D300CECECE00CACACA00A9A9A900000000000000
      00000000000000000000000000000000000000000000A3A1A300E5E5E500D2D2
      D200C4C4C400C1C1C100BBBBBB00B8B8B800B6B6B600FCFCFC00E1E1E100ADAD
      AD00ABABAB00A3A1A3009191910000000000000000008E8E8E00B3B3B300FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00B3B3B3008E8E8E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A9A9
      A900E0E0E000DCDCDC00D7D7D700D3D3D300CDCDCD00A9A9A900000000000000
      00000000000000000000000000000000000000000000A3A1A300E6E6E600E3E3
      E300DADADA00D5D5D500CECECE00C7C7C700C1C1C100E1E1E100B1B1B100AFAF
      AF00AFAFAF00A9A9A9009696960000000000000000008E8E8E00B3B3B300FEFE
      FE00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00FEFE
      FE00B3B3B3008E8E8E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A9A9A900E8E7
      E800E8E7E800E1E1E100DCDCDC00D7D7D700CBCBCB00A9A9A900000000000000
      00000000000000000000000000000000000000000000A3A1A300DBDBDB00E7E7
      E700E9E9E900E5E5E500DFDFDF00D5D5D500C9C9C900BDBDBD00B3B3B300B1B1
      B100B1B1B100ABABAB009898980000000000000000008E8E8E00B3B3B300FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00B3B3B3008E8E8E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A9A9A900A9A9
      A900A9A9A900E3E3E300DCDCDC00D8D8D800A9A9A90000000000000000000000
      0000000000000000000000000000000000000000000000000000ADADAD00B8B8
      B800B8B8B800B8B8B800B6B6B600B3B3B300ADADAD00A9A9A900A9A9A900A3A1
      A300A3A1A3009F9F9F00000000000000000000000000000000008E8E8E00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE008E8E8E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A9A9A900A9A9A900A9A9A9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C00000000000000000091919100919191009191
      9100919191009191910091919100919191009191910091919100919191009191
      9100919191009191910000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000081818100818181000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C9C9C00EAEA
      EA00DEDEDE00D9D9D900D4D4D400D0D0D000CBCBCB00C5C5C500C3C3C300C5C5
      C500C5C5C500C8C8C8009C9C9C0000000000919191009E9E9E00CACACA00D4D4
      D400CACACA00CACACA00CACACA00CACACA00CACACA00CACACA00CACACA00CACA
      CA00A9A9A9009191910000000000000000000000000081818100818181000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000081818100818181000000000000000000000000007F7F7F007F7F
      7F007B7B7B007777770076767600767676007676760076767600767676007676
      76007676760070707000000000000000000000000000000000009C9C9C00EBEB
      EB00E0E0E000DBDBDB00D7D7D700D2D2D200CDCDCD00C9C9C900C3C3C300C2C2
      C200C2C2C200C6C6C6009C9C9C000000000091919100B5B5B500A5A5A500DFDF
      DF00CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCBCB00CACA
      CA00AAAAAA00CDCDCD0091919100000000000000000081818100818181008181
      8100000000000000000000000000000000000000000000000000000000000000
      000081818100818181000000000000000000000000008D8D8D00979797009595
      950093939300909090008E8E8E008D8D8D008D8D8D008E8E8E008E8E8E008D8D
      8D008F8F8F00858585007070700000000000000000000000000095959500F1F1
      F100E5E5E500E0E0E000DBDBDB00D7D7D700D2D2D200CECECE00C9C9C900C5C5
      C500C2C2C200C6C6C6009C9C9C000000000091919100CCCCCC0089898900E5E5
      E500D1D1D100D1D1D100D1D1D100D1D1D100D1D1D100D1D1D100CFCFCF00CFCF
      CF00ACACAC00E5E5E50091919100000000000000000081818100818181008181
      8100818181000000000000000000000000000000000000000000000000008181
      8100818181000000000000000000000000000000000097979700A5A5A5009D98
      9D009B9A9B009797970095959500FDFDFD00A5A5A5008E8E8E00939393009494
      9400969696008F8F8F007676760000000000000000000000000095959500F5F5
      F500EAEAEA00E4E4E400E0E0E000DBDBDB00D6D6D600D2D2D200CDCDCD00C8C8
      C800C5C5C500C5C5C5009C9C9C000000000091919100D1D1D10093939300D9D9
      D900D9D9D900D4D4D400D4D4D400D4D4D400D4D4D400D4D4D400D4D4D400D4D4
      D400AFAFAF00E7E7E70091919100000000000000000000000000888888008282
      8200818181008181810000000000000000000000000000000000818181008181
      810000000000000000000000000000000000000000009B9A9B00A6A6A600A5A5
      A500A8A8A800E2E2E200E5E5E500F7F7F700E5E5E500B6B6B600909090009292
      9200949494008E8E8E00767676000000000000000000000000009F9F9F00F9F9
      F900EFEFEF00EAEAEA00E5E5E500E0E0E000DBDBDB00D7D7D700D1D1D100CDCD
      CD00C8C8C800C8C8C8009C9C9C000000000091919100D4D4D400ADADAD00B7B7
      B700E5E5E500D8D8D800D8D8D800D8D8D800D8D8D800D8D8D800D8D8D8008888
      8800B0B0B000E7E7E700B7B7B700919191000000000000000000000000000000
      0000818181008181810081818100000000008181810081818100818181000000
      000000000000000000000000000000000000000000009C999C00ACACAC00A8A8
      A800BBBBBB00FDFDFD00AEAEAE00EAEAEA00CECECE00FDFDFD00B9B9B9009292
      9200949494008E8E8E00767676000000000000000000000000009F9F9F00FEFE
      FE00F3F3F300EEEEEE00EAEAEA00E4E4E400DFDFDF00DBDBDB00D7D7D700D1D1
      D100CCCCCC00CCCCCC009C9C9C000000000091919100D8D8D800CCCCCC009A9A
      9A00F3F2F300F0F0F000F0F0F000F0F0F000F0F0F000F0F0F00088888800B2B2
      B20088888800F3F2F300F3F2F300919191000000000000000000000000000000
      0000000000008181810085858500858585008686860080808000000000000000
      000000000000000000000000000000000000000000009C999C00B9B9B900B0B0
      B000BCBCBC00D2D2D20095959500EAEAEA00C0C0C000FDFDFD00D6D6D6009393
      9300949494008E8E8E0076767600000000000000000000000000A1A0A100FEFE
      FE00F9F9F900F3F3F300EEEEEE00EAEAEA00E5E5E500DFDFDF00DBDBDB00D7D7
      D700D2D2D200D1D1D1009C9C9C000000000091919100DBDBDB00DBDBDB009292
      9200898989008989890089898900898989008989890088888800CACACA00D4D4
      D400B7B7B7008888880089898900919191000000000000000000000000000000
      0000000000000000000083838300848484008989890000000000000000000000
      000000000000000000000000000000000000000000009C999C00C6C6C600B6B6
      B600ACACAC00AAAAAA00BBBBBB00F5F5F500FDFDFD00FDFDFD00D0D0D0009797
      9700969696008E8E8E0076767600000000000000000000000000A1A0A100FEFE
      FE00FEFEFE00F8F8F800F3F3F300EEEEEE00EAEAEA00E4E4E400E0E0E000DBDB
      DB00D6D6D600D6D6D6009C9C9C000000000091919100DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE0088888800B7B7B700CDCDCD00CCCC
      CC00D4D4D400B5B5B50088888800000000000000000000000000000000000000
      000000000000818181008888880086868600888888008B8B8B00000000000000
      000000000000000000000000000000000000000000009C999C00CFCFCF00BBBB
      BB00B0B0B000E6E6E600FDFDFD00FDFDFD00FDFDFD00DDDDDD00A9A9A9009A9A
      9A00999899009090900079797900000000000000000000000000B6B6B600FEFE
      FE00FEFEFE00FEFEFE00F9F9F900F3F3F300EEEEEE00EAEAEA00E4E4E400DFDF
      DF00DBDBDB00D2D2D2009C9C9C000000000091919100F3F2F300E0E0E000E0E0
      E000E0E0E000E0E0E000E0E0E00088888800888888008888880088888800CBCB
      CB00B7B7B7008888880088888800888888000000000000000000000000000000
      00008B8B8B00898989008787870000000000000000008B8B8B008C8C8C000000
      000000000000000000000000000000000000000000009C999C00D3D3D300BDBD
      BD00C2C2C200FDFDFD00F9F9F900FBFBFB00BDBDBD00A5A5A5009D989D009D98
      9D009C999C00959595007F7F7F00000000000000000000000000B6B6B600FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00F8F8F800F3F3F300EEEEEE00EBEBEB00EAEA
      EA00D5D5D500B7B7B7009C9C9C00000000000000000091919100F3F2F300E3E3
      E300E3E3E300E3E3E30091919100ADADAD00ADADAD00ADADAD0088888800CACA
      CA00AFAFAF008888880000000000000000000000000000000000000000008E8E
      8E00898989008D8D8D00000000000000000000000000000000008E8E8E008E8E
      8E0000000000000000000000000000000000000000009C999C00D6D6D600C2C2
      C200C5C5C500FDFDFD00D3D3D300ECECEC00B6B6B600EAEAEA00BDBDBD00A5A5
      A5009D989D009898980085858500000000000000000000000000B9B9B900FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00F8F8F800F4F4F400E3E3E3009999
      990099999900999999009C9C9C00000000000000000000000000919191009191
      910091919100919191000000000000000000000000000000000088888800B7B7
      B7008888880000000000000000000000000000000000000000008E8E8E008E8E
      8E008E8E8E000000000000000000000000000000000000000000000000008E8E
      8E008E8E8E00000000000000000000000000000000009C999C00DCDCDC00CACA
      CA00BBBBBB00E5E5E500F3F3F300F3F3F300ECECEC00FBFBFB00C1C1C100A5A5
      A500A5A5A5009B9A9B0088888800000000000000000000000000B9B9B900FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FDFDFD00FCFCFC00D6D6D6009999
      9900B6B6B6009B9B9B0097979700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000088888800A9A9A900ABAB
      AB0088888800000000000000000000000000000000008E8E8E008E8E8E008E8E
      8E00000000000000000000000000000000000000000000000000000000000000
      0000000000008E8E8E000000000000000000000000009C999C00E1E1E100DCDC
      DC00CECECE00C6C6C600CECECE00FDFDFD00DCDCDC00BBBBBB00AAAAAA00A6A6
      A600A6A6A6009D989D008E8E8E00000000000000000000000000C0C0C000FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00DBDBDB009999
      9900B9B9B900A1A0A10000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000088888800A5A5A5008888
      8800000000000000000000000000000000008E8E8E008E8E8E008E8E8E000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C999C00D2D2D200E1E1
      E100E1E1E100DCDCDC00D6D6D600CECECE00C0C0C000B3B3B300ACACAC00A8A8
      A800A9A9A900A5A5A50092929200000000000000000000000000C0C0C000F8F8
      F800F7F7F700F7F7F700F7F7F700F6F6F600F6F6F600F6F6F600D7D7D7009999
      9900A798A7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000888888008888880088888800888888000000
      0000000000000000000000000000000000008E8E8E008E8E8E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5A5A500B3B3
      B300B3B3B300B3B3B300B0B0B000ACACAC00A5A5A500A5A5A5009D989D009C99
      9C009D989D009797970000000000000000000000000000000000C0C0C000B6B6
      B600B6B6B600B6B6B600B6B6B600B6B6B600B6B6B600B6B6B600B6B6B6009999
      9900000000000000000000000000000000000000000000000000000000000000
      0000000000008888880088888800888888008888880000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000F33FFFFFFFFF0000E007C003C0070000
      C000800180030000800180018003000000008001800300000000800180030000
      00008001800300008000800180030000E001800180030000F003800180030000
      F01F800180030000E03F800180030000E03F800180030000C03F800180030000
      C07FC003C0070000F8FFFFFFFFFF0000C0018003FFFCFFFFC00100039FF9C003
      C00100018FF38001C001000187E78001C0010001C3CF8001C0010000F11F8001
      C0010000F83F8001C0010000FC7F8001C0010001F83F8001C0010000F19F8001
      C0018003E3CF8001C001C3C7C7E78001C001FF878FFB8001C003FF8F1FFF8001
      C007FE1F3FFFC003C00FF87FFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object HomePriceDataSource: TDataSource
    DataSet = HomePriceDataSet
    Left = 776
    Top = 248
  end
  object HomePriceDataSet: TIBDataSet
    Database = Database
    Transaction = HomeTransaction
    DeleteSQL.Strings = (
      'DELETE FROM "Prices"'
      'WHERE'
      '  ("StoreID" = :"OLD_StoreID") AND ("PriceID" = :"OLD_PriceID")')
    InsertSQL.Strings = (
      'INSERT INTO "Prices"'
      '  ("StoreID", "PriceID", "Price")'
      'VALUES'
      '  (:"StoreID", :"PriceID", :"Price")')
    RefreshSQL.Strings = (
      'SELECT'
      '  "StoreID",'
      '  "PriceID",'
      '  "Price"'
      'FROM "Prices"'
      'WHERE'
      '  ("StoreID" = :"StoreID") AND ("PriceID" = :"PriceID")')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM "Prices"'
      'WHERE "StoreID" = :"StoreID"')
    ModifySQL.Strings = (
      'UPDATE "Prices"'
      'SET'
      '  "StoreID" = :"StoreID",'
      '  "PriceID" = :"PriceID",'
      '  "Price" = :"Price"'
      'WHERE'
      '  ("StoreID" = :"OLD_StoreID") AND ("PriceID" = :"OLD_PriceID")')
    DataSource = HomeStoreDataSource
    Left = 800
    Top = 160
    object IntegerField13: TIntegerField
      FieldName = 'StoreID'
      Origin = '"Prices"."StoreID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField20: TIntegerField
      FieldName = 'PriceID'
      Origin = '"Prices"."PriceID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBBCDField23: TIBBCDField
      FieldName = 'Price'
      Origin = '"Prices"."Price"'
      Precision = 9
      Size = 2
    end
    object StringField4: TStringField
      FieldKind = fkLookup
      FieldName = 'PriceName'
      LookupDataSet = TypePriceDataSet
      LookupKeyFields = 'PriceID'
      LookupResultField = 'PriceName'
      KeyFields = 'PriceID'
      Lookup = True
    end
  end
  object PayOrderBankDataSet: TIBDataSet
    Database = Database
    Transaction = PaymentBankTransaction
    DeleteSQL.Strings = (
      'DELETE FROM "PayOrders"'
      'WHERE'
      
        '  ("PaymentID" = :"OLD_PaymentID") AND ("OrderID" = :"OLD_OrderI' +
        'D")')
    InsertSQL.Strings = (
      'INSERT INTO "PayOrders"'
      '  ("PaymentID", "OrderID", "Pay")'
      'VALUES'
      '  (:"PaymentID", :"OrderID", :"Pay")')
    RefreshSQL.Strings = (
      'SELECT '
      '  "PaymentID",'
      '  "OrderID",'
      '  "Pay"'
      'FROM "PayOrders"'
      'WHERE'
      
        '  ("PaymentID" = :"OLD_PaymentID") AND ("OrderID" = :"OLD_OrderI' +
        'D")')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM "PayOrders"'
      'WHERE ("PaymentID" = :"PaymentID")'
      'ORDER BY "OrderID"')
    ModifySQL.Strings = (
      'UPDATE "PayOrders"'
      'SET'
      '  "PaymentID" = :"PaymentID",'
      '  "OrderID" = :"OrderID",'
      '  "Pay" = :"Pay"'
      'WHERE'
      
        '  ("PaymentID" = :"OLD_PaymentID") AND ("OrderID" = :"OLD_OrderI' +
        'D")')
    DataSource = PaymentBankDataSource
    Left = 408
    Top = 152
    object PayOrderBankDataSetPaymentID: TIntegerField
      FieldName = 'PaymentID'
      Origin = '"PayOrders"."PaymentID"'
    end
    object PayOrderBankDataSetOrderID: TIntegerField
      FieldName = 'OrderID'
      Origin = '"PayOrders"."OrderID"'
    end
    object PayOrderBankDataSetPay: TIBBCDField
      FieldName = 'Pay'
      Origin = '"PayOrders"."Pay"'
      Precision = 15
      Size = 2
    end
  end
  object PayOrderBankDataSource: TDataSource
    DataSet = PayOrderBankDataSet
    Left = 408
    Top = 248
  end
  object PaymentCashDataSet: TIBDataSet
    Database = Database
    Transaction = PaymentCashTransaction
    AfterOpen = PaymentCashDataSetAfterOpen
    BeforeOpen = PaymentCashDataSetBeforeOpen
    DeleteSQL.Strings = (
      'DELETE FROM "Payments"'
      'WHERE'
      '  "PaymentID" = :"OLD_PaymentID"')
    InsertSQL.Strings = (
      'INSERT INTO "Payments"'
      
        '  ("PaymentID", "FirmID", "OrderID", "CustomerID", "Cash", "Date' +
        '", "Number", "TotalPay", "Debit", "Credit", "Type")'
      'VALUES'
      
        '  (:"PaymentID", :"FirmID", :"OrderID", :"CustomerID", :"Cash", ' +
        ':"Date", :"Number", :"TotalPay", :"Debit", :"Credit", :"Type")')
    RefreshSQL.Strings = (
      'SELECT '
      '  "PaymentID",'
      '  "FirmID",'
      '  "OrderID",'
      '  "CustomerID",'
      '  "Cash",'
      '  "Date",'
      '  "Number",'
      '  "TotalPay",'
      '  "Debit",'
      '  "Credit",'
      '  "Type"'
      'FROM "Payments"'
      'WHERE'
      '  "PaymentID" = :"PaymentID"')
    SelectSQL.Strings = (
      'SELECT "Payments".*, "Customers"."CustomerName"'
      'FROM "Payments", "Customers"'
      
        'WHERE ("Cash" = 1) AND ("FirmID" = :MainFirm) AND ("Customers"."' +
        'CustomerID" = "Payments"."CustomerID")'
      
        'AND ("Payments"."Date" >= :TopDate AND "Payments"."Date" <= :Bot' +
        'tomDate)'
      ''
      'ORDER BY "PaymentID"')
    ModifySQL.Strings = (
      'UPDATE "Payments"'
      'SET'
      '  "PaymentID" = :"PaymentID",'
      '  "FirmID" = :"FirmID",'
      '  "OrderID" = :"OrderID",'
      '  "CustomerID" = :"CustomerID",'
      '  "Cash" = :"Cash",'
      '  "Date" = :"Date",'
      '  "Number" = :"Number",'
      '  "TotalPay" = :"TotalPay",'
      '  "Debit" = :"Debit",'
      '  "Credit" = :"Credit",'
      '  "Type" = :"Type"'
      'WHERE'
      '  "PaymentID" = :"OLD_PaymentID"')
    GeneratorField.Field = 'PaymentID'
    GeneratorField.Generator = 'PaymentID_GEN'
    Left = 448
    Top = 152
    object IntegerField47: TIntegerField
      FieldName = 'PaymentID'
      Origin = 'Payment.PaymentID'
      Required = True
    end
    object IntegerField48: TIntegerField
      FieldName = 'FirmID'
      Origin = '"Payments"."FirmID"'
    end
    object IntegerField49: TIntegerField
      FieldName = 'OrderID'
      Origin = '"Payment"."OrderID"'
    end
    object IntegerField50: TIntegerField
      FieldName = 'CustomerID'
      Origin = 'Payment.CustomerID'
    end
    object SmallintField11: TSmallintField
      FieldName = 'Cash'
      Origin = 'Payment.Cash'
    end
    object PaymentCashDataSetDate: TDateField
      FieldName = 'Date'
      Origin = '"Payments"."Date"'
    end
    object IBStringField25: TIBStringField
      FieldName = 'Number'
      Origin = '"Payments"."Number"'
      Size = 10
    end
    object IBBCDField2: TIBBCDField
      FieldName = 'TotalPay'
      Origin = '"Payments"."TotalPay"'
      Precision = 15
      Size = 2
    end
    object PaymentCashDataSetDebit: TIntegerField
      FieldName = 'Debit'
      Origin = '"Payments"."Debit"'
    end
    object PaymentCashDataSetCredit: TIntegerField
      FieldName = 'Credit'
      Origin = '"Payments"."Credit"'
    end
    object PaymentCashDataSetUserName: TIBStringField
      FieldName = 'UserName'
      Origin = '"Payments"."UserName"'
      Size = 31
    end
    object SmallintField12: TSmallintField
      FieldName = 'Type'
      Origin = '"Payments"."Type"'
    end
    object PaymentCashDataSetCustomerName: TIBStringField
      FieldName = 'CustomerName'
      Origin = '"Customers"."CustomerName"'
      Size = 84
    end
  end
  object PayOrderCashDataSet: TIBDataSet
    Database = Database
    Transaction = PaymentCashTransaction
    DeleteSQL.Strings = (
      'DELETE FROM "PayOrders"'
      'WHERE'
      
        '  ("PaymentID" = :"OLD_PaymentID") AND ("OrderID" = :"OLD_OrderI' +
        'D")')
    InsertSQL.Strings = (
      'INSERT INTO "PayOrders"'
      '  ("PaymentID", "OrderID", "Pay")'
      'VALUES'
      '  (:"PaymentID", :"OrderID", :"Pay")')
    RefreshSQL.Strings = (
      'SELECT '
      '  "PaymentID",'
      '  "OrderID",'
      '  "Pay"'
      'FROM "PayOrders"'
      'WHERE'
      
        '  ("PaymentID" = :"OLD_PaymentID") AND ("OrderID" = :"OLD_OrderI' +
        'D")')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM "PayOrders"'
      'WHERE ("PaymentID" = :"PaymentID")'
      'ORDER BY "OrderID"')
    ModifySQL.Strings = (
      'UPDATE "PayOrders"'
      'SET'
      '  "PaymentID" = :"PaymentID",'
      '  "OrderID" = :"OrderID",'
      '  "Pay" = :"Pay"'
      'WHERE'
      
        '  ("PaymentID" = :"OLD_PaymentID") AND ("OrderID" = :"OLD_OrderI' +
        'D")')
    DataSource = PaymentCashDataSource
    Left = 496
    Top = 152
    object IntegerField51: TIntegerField
      FieldName = 'PaymentID'
      Origin = '"PayOrders"."PaymentID"'
    end
    object IntegerField52: TIntegerField
      FieldName = 'OrderID'
      Origin = '"PayOrders"."OrderID"'
    end
    object IBBCDField24: TIBBCDField
      FieldName = 'Pay'
      Origin = '"PayOrders"."Pay"'
      Precision = 15
      Size = 2
    end
  end
  object PaymentCashTransaction: TIBTransaction
    DefaultDatabase = Database
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saCommit
    Left = 472
    Top = 200
  end
  object PaymentCashDataSource: TDataSource
    DataSet = PaymentCashDataSet
    Left = 448
    Top = 248
  end
  object PayOrderCashDataSource: TDataSource
    DataSet = PayOrderCashDataSet
    Left = 496
    Top = 248
  end
  object DeletePriceStoreQuery: TIBQuery
    Database = Database
    Transaction = StoreTransaction
    DataSource = StoreQtyDataSource
    SQL.Strings = (
      'DELETE'
      'FROM "Prices"'
      'WHERE ("StoreID" = :"StoreID")')
    Left = 184
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'StoreID'
        ParamType = ptUnknown
        Size = 4
      end>
  end
  object EmployeeDataSet: TIBDataSet
    Database = Database
    Transaction = EmployeeTransaction
    DeleteSQL.Strings = (
      'DELETE FROM "Employees"'
      'WHERE'
      '  "EmployeeID" = :"OLD_EmployeeID"')
    InsertSQL.Strings = (
      'INSERT INTO "Employees"'
      
        '  ("EmployeeID", "FirstName", "SecondName", "ThirdName", "JobTit' +
        'leID", "TableNo", "PassSeries", "PassNo", "PassIssuer", "PassDat' +
        'e", "CustomerID")'
      'VALUES'
      
        '  (:"EmployeeID", :"FirstName", :"SecondName", :"ThirdName", :"J' +
        'obTitleID", :"TableNo", :"PassSeries", :"PassNo", :"PassIssuer",' +
        ' :"PassDate", :"CustomerID")')
    RefreshSQL.Strings = (
      'SELECT'
      '  "EmployeeID",'
      '  "FirstName",'
      '  "SecondName",'
      '  "ThirdName",'
      '  "JobTitleID",'
      '  "TableNo",'
      '  "PassSeries",'
      '  "PassNo",'
      '  "PassIssuer",'
      '  "PassDate",'
      '  "CustomerID"'
      'FROM "Employees"'
      'WHERE'
      '  "EmployeeID" = :"EmployeeID"')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM "Employees"'
      'WHERE "CustomerID" = :"CustomerID"')
    ModifySQL.Strings = (
      'UPDATE "Employees"'
      'SET'
      '  "EmployeeID" = :"EmployeeID",'
      '  "FirstName" = :"FirstName",'
      '  "SecondName" = :"SecondName",'
      '  "ThirdName" = :"ThirdName",'
      '  "JobTitleID" = :"JobTitleID",'
      '  "TableNo" = :"TableNo",'
      '  "PassSeries" = :"PassSeries",'
      '  "PassNo" = :"PassNo",'
      '  "PassIssuer" = :"PassIssuer",'
      '  "PassDate" = :"PassDate",'
      '  "CustomerID" = :"CustomerID"'
      'WHERE'
      '  "EmployeeID" = :"OLD_EmployeeID"')
    GeneratorField.Field = 'EmployeeID'
    GeneratorField.Generator = 'EmployeeID_GEN'
    DataSource = FirmDataSource
    Left = 152
    Top = 8
    object EmployeeDataSetEmployeeID: TIntegerField
      FieldName = 'EmployeeID'
      Origin = '"Employees"."EmployeeID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object EmployeeDataSetFirstName: TIBStringField
      FieldName = 'FirstName'
      Origin = '"Employees"."FirstName"'
      Size = 84
    end
    object EmployeeDataSetSecondName: TIBStringField
      FieldName = 'SecondName'
      Origin = '"Employees"."SecondName"'
      Size = 84
    end
    object EmployeeDataSetThirdName: TIBStringField
      FieldName = 'ThirdName'
      Origin = '"Employees"."ThirdName"'
      Size = 84
    end
    object EmployeeDataSetJobTitleID: TIntegerField
      FieldName = 'JobTitleID'
      Origin = '"Employees"."JobTitleID"'
    end
    object EmployeeDataSetTableNo: TIBStringField
      FieldName = 'TableNo'
      Origin = '"Employees"."TableNo"'
      Size = 12
    end
    object EmployeeDataSetPassSeries: TIBStringField
      FieldName = 'PassSeries'
      Origin = '"Employees"."PassSeries"'
      Size = 12
    end
    object EmployeeDataSetPassNo: TIBStringField
      FieldName = 'PassNo'
      Origin = '"Employees"."PassNo"'
      Size = 12
    end
    object EmployeeDataSetPassIssuer: TIBStringField
      FieldName = 'PassIssuer'
      Origin = '"Employees"."PassIssuer"'
      Size = 84
    end
    object EmployeeDataSetPassDate: TDateField
      FieldName = 'PassDate'
      Origin = '"Employees"."PassDate"'
    end
    object EmployeeDataSetCustomerID: TIntegerField
      FieldName = 'CustomerID'
      Origin = '"Employees"."CustomerID"'
    end
  end
  object EmployeeTransaction: TIBTransaction
    DefaultDatabase = Database
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saCommit
    Left = 152
    Top = 56
  end
  object EmployeeDataSource: TDataSource
    DataSet = EmployeeDataSet
    Left = 152
    Top = 104
  end
  object JobTitleDataSet: TIBDataSet
    Database = Database
    Transaction = JobTitleTransaction
    DeleteSQL.Strings = (
      'DELETE FROM "JobTitles"'
      'WHERE'
      '  "JobTitleID" = :"OLD_JobTitleID"')
    InsertSQL.Strings = (
      'INSERT INTO "JobTitles"'
      '  ("JobTitleID", "JobTitleName")'
      'VALUES'
      '  (:"JobTitleID", :"JobTitleName")')
    RefreshSQL.Strings = (
      'SELECT'
      '  "JobTitleID",'
      '  "JobTitleName"'
      'FROM "JobTitles"'
      'WHERE'
      '  "JobTitleID" = :"JobTitleID"')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM "JobTitles"'
      'WHERE "JobTitleID" > 0')
    ModifySQL.Strings = (
      'UPDATE "JobTitles"'
      'SET'
      '  "JobTitleID" = :"JobTitleID",'
      '  "JobTitleName" = :"JobTitleName"'
      'WHERE'
      '  "JobTitleID" = :"OLD_JobTitleID"')
    GeneratorField.Field = 'JobTitleID'
    GeneratorField.Generator = 'JobTitleID_GEN'
    Left = 192
    Top = 8
    object JobTitleDataSetJobTitleID: TIntegerField
      FieldName = 'JobTitleID'
      Origin = '"JobTitles"."JobTitleID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object JobTitleDataSetJobTitleName: TIBStringField
      FieldName = 'JobTitleName'
      Origin = '"JobTitles"."JobTitleName"'
      Size = 84
    end
  end
  object JobTitleTransaction: TIBTransaction
    DefaultDatabase = Database
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saCommit
    Left = 192
    Top = 56
  end
  object JobTitleDataSource: TDataSource
    DataSet = JobTitleDataSet
    Left = 192
    Top = 104
  end
  object DeletePriceBuyStoreQuery: TIBQuery
    Database = Database
    Transaction = BuyOrderTransaction
    DataSource = BuyStoreDataSource
    SQL.Strings = (
      'DELETE'
      'FROM "Prices"'
      'WHERE ("StoreID" = :"StoreID")')
    Left = 768
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'StoreID'
        ParamType = ptUnknown
        Size = 4
      end>
  end
  object GroupDataSet: TIBDataSet
    Database = Database
    Transaction = CategoryTransaction
    AfterOpen = GroupDataSetAfterOpen
    DeleteSQL.Strings = (
      'DELETE FROM "Groups"'
      'WHERE'
      '  "GroupID" = :"OLD_GroupID"')
    InsertSQL.Strings = (
      'INSERT INTO "Groups"'
      '  ("GroupID", "GroupName", "Priorit")'
      'VALUES'
      '  (:"GroupID", :"GroupName", :"Priorit")')
    RefreshSQL.Strings = (
      'SELECT'
      '  "GroupID",'
      '  "GroupName",'
      '  "Priorit"'
      'FROM "Groups"'
      'WHERE'
      '  "GroupID" = :"GroupID"')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM "Groups"'
      'WHERE "GroupID" > 0'
      ''
      'ORDER BY "Priorit"')
    ModifySQL.Strings = (
      'UPDATE "Groups"'
      'SET'
      '  "GroupID" = :"GroupID",'
      '  "GroupName" = :"GroupName",'
      '  "Priorit" = :"Priorit"'
      'WHERE'
      '  "GroupID" = :"OLD_GroupID"')
    GeneratorField.Field = 'GroupID'
    GeneratorField.Generator = 'GroupID_GEN'
    Left = 312
    Top = 8
    object GroupDataSetGroupID: TIntegerField
      FieldName = 'GroupID'
      Origin = '"Groups"."GroupID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object GroupDataSetGroupName: TIBStringField
      FieldName = 'GroupName'
      Origin = '"Groups"."GroupName"'
      Size = 84
    end
    object GroupDataSetPriorit: TSmallintField
      FieldName = 'Priorit'
      Origin = '"Groups"."Priorit"'
    end
  end
  object GroupDataSource: TDataSource
    DataSet = GroupDataSet
    Left = 312
    Top = 104
  end
  object ReportOrderQuery: TIBQuery
    Database = Database
    Transaction = DefaultTransaction
    SQL.Strings = (
      'SELECT *'
      'FROM "Orders"'
      'WHERE ("FirmID" = :MainFirm) AND ("ProperID" IN (0, 5))')
    Left = 440
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'MainFirm'
        ParamType = ptUnknown
      end>
    object IntegerField12: TIntegerField
      FieldName = 'OrderID'
      Origin = '"Orders"."OrderID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField19: TIntegerField
      FieldName = 'FirmID'
      Origin = '"Orders"."FirmID"'
    end
    object IntegerField23: TIntegerField
      FieldName = 'CustomerID'
      Origin = '"Orders"."CustomerID"'
    end
    object DateField6: TDateField
      FieldName = 'Date'
      Origin = '"Orders"."Date"'
    end
    object IBStringField9: TIBStringField
      FieldName = 'Number'
      Origin = '"Orders"."Number"'
      Size = 10
    end
    object DateField7: TDateField
      FieldName = 'IssueDate'
      Origin = '"Orders"."IssueDate"'
    end
    object IBBCDField10: TIBBCDField
      FieldName = 'TotalAmount'
      Origin = '"Orders"."TotalAmount"'
      Precision = 15
      Size = 2
    end
    object IBBCDField12: TIBBCDField
      FieldName = 'Pay'
      Origin = '"Orders"."Pay"'
      Precision = 15
      Size = 2
    end
    object DateField8: TDateField
      FieldName = 'PayDate'
      Origin = '"Orders"."PayDate"'
    end
    object IBBCDField15: TIBBCDField
      FieldKind = fkInternalCalc
      FieldName = 'Debt'
      Origin = '"Orders"."Debt"'
      ProviderFlags = []
      ReadOnly = True
      Precision = 15
      Size = 2
    end
    object IntegerField24: TIntegerField
      FieldName = 'PriceID'
      Origin = '"Orders"."PriceID"'
    end
    object ReportOrderQueryProperID: TIntegerField
      FieldName = 'ProperID'
      Origin = '"Orders"."ProperID"'
    end
    object StringField9: TStringField
      FieldKind = fkLookup
      FieldName = 'CustomerName'
      LookupDataSet = CustomerDataSet
      LookupKeyFields = 'CustomerID'
      LookupResultField = 'CustomerName'
      KeyFields = 'CustomerID'
      Size = 84
      Lookup = True
    end
  end
  object ReportOrderDataSource: TDataSource
    DataSet = ReportOrderQuery
    Left = 440
    Top = 464
  end
  object StoreOrderQuery: TIBQuery
    Database = Database
    Transaction = StoreTransaction
    DataSource = StoreQtyDataSource
    SQL.Strings = (
      
        'SELECT "Structure".*, "Orders"."Date", "Orders"."ProperID", "Cus' +
        'tomers"."CustomerName"'
      'FROM "Structure", "Orders", "Customers"'
      
        'WHERE ("Structure"."StoreID" = :"StoreID") AND ("Structure"."Ord' +
        'erID" = "Orders"."OrderID") AND ("Orders"."CustomerID" = "Custom' +
        'ers"."CustomerID")'
      'ORDER BY "Orders"."Date"')
    Left = 112
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'StoreID'
        ParamType = ptUnknown
        Size = 4
      end>
    object StoreOrderQueryOrderID: TIntegerField
      FieldName = 'OrderID'
      Origin = '"Structure"."OrderID"'
    end
    object StoreOrderQueryProductID: TIntegerField
      FieldName = 'ProductID'
      Origin = '"Structure"."ProductID"'
    end
    object StoreOrderQueryStoreID: TIntegerField
      FieldName = 'StoreID'
      Origin = '"Structure"."StoreID"'
    end
    object StoreOrderQueryQty: TIBBCDField
      FieldName = 'Qty'
      Origin = '"Structure"."Qty"'
      Precision = 9
      Size = 3
    end
    object StoreOrderQueryPrice: TIBBCDField
      FieldName = 'Price'
      Origin = '"Structure"."Price"'
      Precision = 9
      Size = 2
    end
    object StoreOrderQueryVATRate: TIBBCDField
      FieldName = 'VATRate'
      Origin = '"Structure"."VATRate"'
      Precision = 4
      Size = 2
    end
    object StoreOrderQueryAmountVAT: TIBBCDField
      FieldKind = fkInternalCalc
      FieldName = 'AmountVAT'
      Origin = '"Structure"."AmountVAT"'
      ProviderFlags = []
      ReadOnly = True
      Precision = 15
      Size = 2
    end
    object StoreOrderQueryAmount: TIBBCDField
      FieldKind = fkInternalCalc
      FieldName = 'Amount'
      Origin = '"Structure"."Amount"'
      ProviderFlags = []
      ReadOnly = True
      Precision = 15
      Size = 2
    end
    object StoreOrderQueryType: TSmallintField
      FieldName = 'Type'
      Origin = '"Structure"."Type"'
    end
    object StoreOrderQueryDate: TDateField
      FieldName = 'Date'
      Origin = '"Orders"."Date"'
    end
    object StoreOrderQueryProperID: TIntegerField
      FieldName = 'ProperID'
      Origin = '"Orders"."ProperID"'
    end
    object StoreOrderQueryCustomerName: TIBStringField
      FieldName = 'CustomerName'
      Origin = '"Customers"."CustomerName"'
      Size = 84
    end
  end
  object VATRateQuery: TIBQuery
    Database = Database
    Transaction = DefaultTransaction
    AfterOpen = VATRateQueryAfterOpen
    SQL.Strings = (
      'SELECT *'
      'FROM "VATRates"')
    Left = 432
    Top = 304
    object VATRateQueryVATRateID: TIntegerField
      FieldName = 'VATRateID'
      Origin = '"VATRates"."VATRateID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object VATRateQueryVATRateName: TIBStringField
      FieldName = 'VATRateName'
      Origin = '"VATRates"."VATRateName"'
      Size = 84
    end
    object VATRateQueryVATRate: TIBBCDField
      FieldName = 'VATRate'
      Origin = '"VATRates"."VATRate"'
      Precision = 4
      Size = 2
    end
  end
  object VATRateDataSource: TDataSource
    DataSet = VATRateQuery
    Left = 432
    Top = 360
  end
  object DebtQuery: TIBQuery
    Database = Database
    Transaction = DefaultTransaction
    BeforeOpen = DebtQueryBeforeOpen
    SQL.Strings = (
      'SELECT *'
      'FROM "Balance"'
      'WHERE "FirmID" = :MainFirm')
    Left = 368
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'MainFirm'
        ParamType = ptUnknown
      end>
    object DebtQueryFirmID: TIntegerField
      FieldName = 'FirmID'
      Origin = '"Balance"."FirmID"'
    end
    object DebtQueryCustomerID: TIntegerField
      FieldName = 'CustomerID'
      Origin = '"Balance"."CustomerID"'
    end
    object DebtQueryDebt: TIBBCDField
      FieldName = 'Debt'
      Origin = '"Balance"."Debt"'
      Precision = 15
      Size = 2
    end
  end
  object DeletePriceHomeStoreQuery: TIBQuery
    Database = Database
    Transaction = HomeTransaction
    DataSource = HomeStoreDataSource
    SQL.Strings = (
      'DELETE'
      'FROM "Prices"'
      'WHERE ("StoreID" = :"StoreID")')
    Left = 800
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'StoreID'
        ParamType = ptUnknown
        Size = 4
      end>
  end
  object StoreQtyQuery: TIBQuery
    Database = Database
    Transaction = StoreTransaction
    AfterOpen = StoreQtyQueryAfterOpen
    BeforeOpen = StoreQtyQueryBeforeOpen
    DataSource = StoreProductDataSource
    SQL.Strings = (
      'SELECT "Store".*, "StoreQty"."Qty", "Divisions"."DivisionName"'
      'FROM "Store", "StoreQty", "Divisions"'
      
        'WHERE ("Store"."ProductID" = :"ProductID") AND ("Store"."StoreID' +
        '" = "StoreQty"."StoreID") AND ("StoreQty"."DivisionID" IN (SELEC' +
        'T "DivisionID" FROM "Divisions" WHERE "CustomerID" = :MainFirm) ' +
        'AND "Divisions"."DivisionID" = "StoreQty"."DivisionID")'
      'AND ("StoreQty"."Qty" > 0)')
    Left = 48
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ProductID'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftUnknown
        Name = 'MainFirm'
        ParamType = ptUnknown
      end>
    object StoreQtyQueryProductID: TIntegerField
      FieldName = 'ProductID'
      Origin = '"Store"."ProductID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StoreQtyQueryStoreID: TIntegerField
      FieldName = 'StoreID'
      Origin = '"Store"."StoreID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StoreQtyQueryAccountPrice: TIBBCDField
      FieldName = 'AccountPrice'
      Origin = '"Store"."AccountPrice"'
      Precision = 9
      Size = 2
    end
    object StoreQtyQueryQty: TIBBCDField
      FieldName = 'Qty'
      Origin = '"Qty"."Qty"'
      Precision = 9
      Size = 3
    end
    object StoreQtyQueryDivisionName: TIBStringField
      FieldName = 'DivisionName'
      Origin = '"Divisions"."DivisionName"'
      Size = 84
    end
  end
  object BuyQtyDataSet: TIBDataSet
    Database = Database
    Transaction = BuyOrderTransaction
    BeforeOpen = BuyStoreDataSetBeforeOpen
    DeleteSQL.Strings = (
      'DELETE FROM "StoreQty"'
      'WHERE'
      '  "StoreID" = :"OLD_StoreID"')
    InsertSQL.Strings = (
      'INSERT INTO "StoreQty"'
      '  ("StoreID", "Qty", "DivisionID")'
      'VALUES'
      '  (:"StoreID", :"Qty", :"DivisionID")')
    RefreshSQL.Strings = (
      'SELECT'
      '  "StoreID",'
      '  "Qty",'
      '  "DivisionID"'
      'FROM "StoreQty"'
      'WHERE'
      '  "StoreID" = :"OLD_StoreID"')
    SelectSQL.Strings = (
      'SELECT "StoreQty".*, "Divisions"."DivisionName"'
      'FROM "StoreQty", "Divisions"'
      
        'WHERE ("StoreQty"."StoreID" = :"StoreID") AND ("StoreQty"."Divis' +
        'ionID" = "Divisions"."DivisionID")')
    ModifySQL.Strings = (
      'UPDATE "StoreQty"'
      'SET'
      '  "StoreID" = :"StoreID",'
      '  "Qty" = :"Qty",'
      '  "DivisionID" = :"DivisionID"'
      'WHERE'
      '  "StoreID" = :"OLD_StoreID"')
    DataSource = BuyStructureDataSource
    Left = 736
    Top = 16
    object BuyQtyDataSetStoreID: TIntegerField
      FieldName = 'StoreID'
      Origin = '"Qty"."StoreID"'
    end
    object BuyQtyDataSetQty: TIBBCDField
      FieldName = 'Qty'
      Origin = '"Qty"."Qty"'
      Precision = 9
      Size = 3
    end
    object BuyQtyDataSetDivisionID: TIntegerField
      FieldName = 'DivisionID'
      Origin = '"Qty"."DivisionID"'
    end
    object BuyQtyDataSetDivisionName: TIBStringField
      FieldName = 'DivisionName'
      Origin = '"Divisions"."DivisionName"'
      Size = 84
    end
  end
  object BuyQtyDataSource: TDataSource
    DataSet = BuyQtyDataSet
    Left = 736
    Top = 112
  end
  object HomeStoreDataSet: TIBDataSet
    Database = Database
    Transaction = HomeTransaction
    BeforeOpen = BuyStoreDataSetBeforeOpen
    DeleteSQL.Strings = (
      'DELETE FROM "Store"'
      'WHERE'
      '  "StoreID" = :"OLD_StoreID"')
    InsertSQL.Strings = (
      'INSERT INTO "Store"'
      
        '  ("StoreID", "ProductID", "AccountPrice", "CCDID", "Certificate' +
        'ID", "Serial", "BeforeDate")'
      'VALUES'
      
        '  (:"StoreID", :"ProductID", :"AccountPrice", :"CCDID", :"Certif' +
        'icateID", :"Serial", :"BeforeDate")')
    RefreshSQL.Strings = (
      'SELECT'
      '  "StoreID",'
      '  "ProductID",'
      '  "AccountPrice",'
      '  "CCDID",'
      '  "CertificateID",'
      '  "Serial",'
      '  "BeforeDate"'
      'FROM "Store"'
      'WHERE'
      '  "StoreID" = :"OLD_StoreID"')
    SelectSQL.Strings = (
      'SELECT "Store".*'
      'FROM "Store"'
      'WHERE ("Store"."StoreID" = :"StoreID")')
    ModifySQL.Strings = (
      'UPDATE "Store"'
      'SET'
      '  "StoreID" = :"StoreID",'
      '  "ProductID" = :"ProductID",'
      '  "AccountPrice" = :"AccountPrice",'
      '  "CCDID" = :"CCDID",'
      '  "CertificateID" = :"CertificateID",'
      '  "Serial" = :"Serial",'
      '  "BeforeDate" = :"BeforeDate"'
      'WHERE'
      '  "StoreID" = :"OLD_StoreID"')
    DataSource = HomeStructureDataSource
    Left = 720
    Top = 160
    object IntegerField25: TIntegerField
      FieldName = 'ProductID'
      Origin = '"Store"."ProductID"'
    end
    object IntegerField26: TIntegerField
      FieldName = 'StoreID'
      Origin = '"Store"."StoreID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBBCDField3: TIBBCDField
      FieldName = 'AccountPrice'
      Origin = '"Store"."AccountPrice"'
      Precision = 9
      Size = 2
    end
    object IntegerField27: TIntegerField
      FieldName = 'CCDID'
      Origin = '"Store"."CCDID"'
    end
    object IntegerField28: TIntegerField
      FieldName = 'CertificateID'
      Origin = '"Store"."CertificateID"'
    end
    object IBStringField10: TIBStringField
      FieldName = 'Serial'
      Origin = '"Store"."Serial"'
      Size = 84
    end
    object DateField9: TDateField
      FieldName = 'BeforeDate'
      Origin = '"Store"."BeforeDate"'
    end
  end
  object HomeQtyDataSet: TIBDataSet
    Database = Database
    Transaction = HomeTransaction
    BeforeOpen = BuyStoreDataSetBeforeOpen
    DeleteSQL.Strings = (
      'DELETE FROM "StoreQty"'
      'WHERE'
      '  "StoreID" = :"OLD_StoreID"')
    InsertSQL.Strings = (
      'INSERT INTO "StoreQty"'
      '  ("StoreID", "Qty", "DivisionID")'
      'VALUES'
      '  (:"StoreID", :"Qty", :"DivisionID")')
    RefreshSQL.Strings = (
      'SELECT'
      '  "StoreID",'
      '  "Qty",'
      '  "DivisionID"'
      'FROM "StoreQty"'
      'WHERE'
      '  "StoreID" = :"OLD_StoreID"')
    SelectSQL.Strings = (
      'SELECT "StoreQty".*, "Divisions"."DivisionName"'
      'FROM "StoreQty", "Divisions"'
      
        'WHERE ("StoreQty"."StoreID" = :"StoreID") AND ("StoreQty"."Divis' +
        'ionID" = "Divisions"."DivisionID")')
    ModifySQL.Strings = (
      'UPDATE "StoreQty"'
      'SET'
      '  "StoreID" = :"StoreID",'
      '  "Qty" = :"Qty",'
      '  "DivisionID" = :"DivisionID"'
      'WHERE'
      '  "StoreID" = :"OLD_StoreID"')
    DataSource = HomeStructureDataSource
    Left = 760
    Top = 160
    object IntegerField29: TIntegerField
      FieldName = 'StoreID'
      Origin = '"Qty"."StoreID"'
    end
    object IBBCDField7: TIBBCDField
      FieldName = 'Qty'
      Origin = '"Qty"."Qty"'
      Precision = 9
      Size = 3
    end
    object IntegerField30: TIntegerField
      FieldName = 'DivisionID'
      Origin = '"Qty"."DivisionID"'
    end
    object IBStringField11: TIBStringField
      FieldName = 'DivisionName'
      Origin = '"Divisions"."DivisionName"'
      Size = 84
    end
  end
  object HomeQtyDataSource: TDataSource
    DataSet = HomeQtyDataSet
    Left = 736
    Top = 248
  end
  object StoreDataSet: TIBDataSet
    Database = Database
    Transaction = StoreTransaction
    BeforeOpen = BuyStoreDataSetBeforeOpen
    DeleteSQL.Strings = (
      'DELETE FROM "Store"'
      'WHERE'
      '  "StoreID" = :"OLD_StoreID"')
    InsertSQL.Strings = (
      'INSERT INTO "Store"'
      
        '  ("StoreID", "ProductID", "AccountPrice", "CCDID", "Certificate' +
        'ID", "Serial", "BeforeDate")'
      'VALUES'
      
        '  (:"StoreID", :"ProductID", :"AccountPrice", :"CCDID", :"Certif' +
        'icateID", :"Serial", :"BeforeDate")')
    RefreshSQL.Strings = (
      'SELECT'
      '  "StoreID",'
      '  "ProductID",'
      '  "AccountPrice",'
      '  "CCDID",'
      '  "CertificateID",'
      '  "Serial",'
      '  "BeforeDate"'
      'FROM "Store"'
      'WHERE'
      '  "StoreID" = :"OLD_StoreID"')
    SelectSQL.Strings = (
      'SELECT "Store".*'
      'FROM "Store"'
      'WHERE ("Store"."StoreID" = :"StoreID")')
    ModifySQL.Strings = (
      'UPDATE "Store"'
      'SET'
      '  "StoreID" = :"StoreID",'
      '  "ProductID" = :"ProductID",'
      '  "AccountPrice" = :"AccountPrice",'
      '  "CCDID" = :"CCDID",'
      '  "CertificateID" = :"CertificateID",'
      '  "Serial" = :"Serial",'
      '  "BeforeDate" = :"BeforeDate"'
      'WHERE'
      '  "StoreID" = :"OLD_StoreID"')
    DataSource = StoreQtyDataSource
    Left = 128
    Top = 200
    object IntegerField31: TIntegerField
      FieldName = 'ProductID'
      Origin = '"Store"."ProductID"'
    end
    object IntegerField32: TIntegerField
      FieldName = 'StoreID'
      Origin = '"Store"."StoreID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBBCDField11: TIBBCDField
      FieldName = 'AccountPrice'
      Origin = '"Store"."AccountPrice"'
      Precision = 9
      Size = 2
    end
    object IntegerField33: TIntegerField
      FieldName = 'CCDID'
      Origin = '"Store"."CCDID"'
    end
    object IntegerField34: TIntegerField
      FieldName = 'CertificateID'
      Origin = '"Store"."CertificateID"'
    end
    object IBStringField12: TIBStringField
      FieldName = 'Serial'
      Origin = '"Store"."Serial"'
      Size = 84
    end
    object DateField10: TDateField
      FieldName = 'BeforeDate'
      Origin = '"Store"."BeforeDate"'
    end
  end
  object StoreDataSource: TDataSource
    DataSet = StoreDataSet
    Left = 112
    Top = 248
  end
  object InitialBalanceDataSet: TIBDataSet
    Database = Database
    Transaction = InitialBalanceTransaction
    AfterOpen = InitialBalanceDataSetAfterOpen
    BeforeOpen = InitialBalanceDataSetBeforeOpen
    DeleteSQL.Strings = (
      'DELETE FROM "InitialBalance"'
      'WHERE'
      
        '  ("FirmID" = :"OLD_FirmID") AND ("CustomerID" = :"OLD_CustomerI' +
        'D")')
    InsertSQL.Strings = (
      'INSERT INTO "InitialBalance"'
      
        '  ("FirmID", "CustomerID", "Date", "TotalAmount", "VATRate", "Pa' +
        'y")'
      'VALUES'
      
        '  (:"FirmID", :"CustomerID", :"Date", :"TotalAmount", :"VATRate"' +
        ', :"Pay")')
    RefreshSQL.Strings = (
      'SELECT'
      '  "FirmID",'
      '  "CustomerID",'
      '  "Date",'
      '  "TotalAmount",'
      '  "VATRate",'
      '  "Pay"'
      'FROM "InitialBalance"'
      'WHERE'
      '  ("FirmID" = :"FirmID") AND ("CustomerID" = :"CustomerID")')
    SelectSQL.Strings = (
      'SELECT "InitialBalance".*, "Customers"."CustomerName"'
      'FROM "InitialBalance", "Customers"'
      
        'WHERE ("InitialBalance"."FirmID" = :MainFirm) AND ("Customers"."' +
        'CustomerID" = "InitialBalance"."CustomerID")'
      ''
      'ORDER BY "Customers"."CustomerName"')
    ModifySQL.Strings = (
      'UPDATE "InitialBalance"'
      'SET'
      '  "FirmID" = :"FirmID",'
      '  "CustomerID" = :"CustomerID",'
      '  "Date" = :"Date",'
      '  "TotalAmount" = :"TotalAmount",'
      '  "VATRate" = :"VATRate",'
      '  "Pay" = :"Pay"'
      'WHERE'
      
        '  ("FirmID" = :"OLD_FirmID") AND ("CustomerID" = :"OLD_CustomerI' +
        'D")')
    Left = 576
    Top = 152
    object InitialBalanceDataSetFirmID: TIntegerField
      FieldName = 'FirmID'
      Origin = '"InitialBalance"."FirmID"'
    end
    object InitialBalanceDataSetCustomerID: TIntegerField
      FieldName = 'CustomerID'
      Origin = '"InitialBalance"."CustomerID"'
    end
    object InitialBalanceDataSetDate: TDateField
      FieldName = 'Date'
      Origin = '"InitialBalance"."Date"'
    end
    object InitialBalanceDataSetTotalAmount: TIBBCDField
      FieldName = 'TotalAmount'
      Origin = '"InitialBalance"."TotalAmount"'
      Precision = 15
      Size = 2
    end
    object InitialBalanceDataSetVATRate: TIBBCDField
      FieldName = 'VATRate'
      Origin = '"InitialBalance"."VATRate"'
      Precision = 4
      Size = 2
    end
    object InitialBalanceDataSetPay: TIBBCDField
      FieldName = 'Pay'
      Origin = '"InitialBalance"."Pay"'
      Precision = 15
      Size = 2
    end
    object InitialBalanceDataSetDebt: TIBBCDField
      FieldKind = fkInternalCalc
      FieldName = 'Debt'
      Origin = '"InitialBalance"."Debt"'
      ProviderFlags = []
      ReadOnly = True
      Precision = 15
      Size = 2
    end
    object InitialBalanceDataSetCustomerName: TIBStringField
      FieldName = 'CustomerName'
      Origin = '"Customers"."CustomerName"'
      Size = 84
    end
  end
  object InitialBalanceTransaction: TIBTransaction
    DefaultDatabase = Database
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saCommit
    Left = 576
    Top = 200
  end
  object InitialBalanceDataSource: TDataSource
    DataSet = InitialBalanceDataSet
    Left = 576
    Top = 248
  end
  object QtyStoreQuery: TIBQuery
    Database = Database
    Transaction = StoreTransaction
    DataSource = StoreQtyDataSource
    SQL.Strings = (
      'SELECT "StoreQty".*, "Divisions"."DivisionName"'
      'FROM "StoreQty", "Divisions"'
      
        'WHERE ("StoreQty"."StoreID" = :"StoreID") AND ("StoreQty"."Divis' +
        'ionID" = "Divisions"."DivisionID")')
    Left = 80
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'StoreID'
        ParamType = ptUnknown
        Size = 4
      end>
    object QtyStoreQueryStoreID: TIntegerField
      FieldName = 'StoreID'
      Origin = '"Qty"."StoreID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QtyStoreQueryDivisionID: TIntegerField
      FieldName = 'DivisionID'
      Origin = '"Qty"."DivisionID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QtyStoreQueryQty: TIBBCDField
      FieldName = 'Qty'
      Origin = '"Qty"."Qty"'
      Precision = 9
      Size = 3
    end
    object QtyStoreQueryDivisionName: TIBStringField
      FieldName = 'DivisionName'
      Origin = '"Divisions"."DivisionName"'
      Size = 84
    end
  end
  object QtyStoreDataSource: TDataSource
    DataSet = QtyStoreQuery
    Left = 80
    Top = 248
  end
end
