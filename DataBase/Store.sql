/*
 * Copyright 2013 Anton  A. Lindeberg <anton@antonpc>
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 * MA 02110-1301, USA.
 * 
 * 
 */
/* Задаем параметры по умолчанию */
SET SQL DIALECT 3;
SET NAMES WIN1251;

/* Создаем базу данных */
CREATE DATABASE 'C:\Store\Data\\store.gdb'
  USER 'SYSDBA' PASSWORD 'masterkey'
  DEFAULT CHARACTER SET WIN1251;

/* Соединяемся с базой данных */
CONNECT 'C:\Store\Data\\store.gdb'
  USER 'SYSDBA' PASSWORD 'masterkey';

/******************************************************************************/
/****                               Domains                                ****/
/******************************************************************************/


/* Создаем Домен Идентификатора с Первичным Ключем */
CREATE DOMAIN PK_DOMAIN AS
    INTEGER
    NOT NULL;

/* Создаем Домен Идентификатора с Вторичным Ключем */
CREATE DOMAIN FK_DOMAIN AS
    INTEGER;

/* Создаем Домен Наименования */
CREATE DOMAIN NAME_DOMAIN AS
    VARCHAR(84)
    COLLATE PXW_CYRL;

/* Создаем Домен Короткого Наименования */
CREATE DOMAIN SHORTNAME_DOMAIN AS
    VARCHAR(12)
    COLLATE PXW_CYRL;

/* Создаем Домен Количества */
CREATE DOMAIN QTY_DOMAIN AS
    NUMERIC(9,3)
    NOT NULL;
    /*CHECK (VALUE >= 0);*/

/* Создаем Домен Текущей Даты */
CREATE DOMAIN DATE_DOMAIN AS
    DATE;

/* Создаем Домен Цены */
CREATE DOMAIN PRICE_DOMAIN AS
    NUMERIC(9,2)
    NOT NULL
    CHECK (VALUE >= 0);

/* Создаем Домен Суммы */
CREATE DOMAIN AMOUNT_DOMAIN AS
    NUMERIC(15,2)
    DEFAULT 0
    NOT NULL;

/* Создаем Домен маленьких цифр */
CREATE DOMAIN SMALL_DOMAIN AS
    SMALLINT;



/******************************************************************************/
/****                              Generators                              ****/
/******************************************************************************/


/* Создаем генератор для поля "CustomerID" */
CREATE GENERATOR "CustomerID_GEN";
SET GENERATOR "CustomerID_GEN" TO -1;

/* Создаем генератор для поля "EmployeeID" */
CREATE GENERATOR "EmployeeID_GEN";
SET GENERATOR "EmployeeID_GEN" TO 0;

/* Создаем генератор для поля "JobTitleID" */
CREATE GENERATOR "JobTitleID_GEN";
SET GENERATOR "JobTitleID_GEN" TO -1;

/* Создаем генератор для поля "BankID" */
CREATE GENERATOR "BankID_GEN";
SET GENERATOR "BankID_GEN" TO -1;

/* Создаем генератор для поля "GroupID" */
CREATE GENERATOR "GroupID_GEN";
SET GENERATOR "GroupID_GEN" TO -1;

/* Создаем генератор для поля "CategoryID" */
CREATE GENERATOR "CategoryID_GEN";
SET GENERATOR "CategoryID_GEN" TO -1;

/* Создаем генератор для поля "VATRateID" */
CREATE GENERATOR "VATRateID_GEN";
SET GENERATOR "VATRateID_GEN" TO 0;

/* Создаем генератор для поля "ProductID" */
CREATE GENERATOR "ProductID_GEN";
SET GENERATOR "ProductID_GEN" TO 0;

/* Создаем генератор для поля "MeasureID" */
CREATE GENERATOR "MeasureID_GEN";
SET GENERATOR "MeasureID_GEN" TO -1;

/* Создаем генератор для поля "ProducerID" */
CREATE GENERATOR "ProducerID_GEN";
SET GENERATOR "ProducerID_GEN" TO -1;

/* Создаем генератор для поля "PriceID" */
CREATE GENERATOR "PriceID_GEN";
SET GENERATOR "PriceID_GEN" TO -1;

/* Создаем генератор для поля "StoreID" */
CREATE GENERATOR "StoreID_GEN";
SET GENERATOR "StoreID_GEN" TO 0;

/* Создаем генератор для поля "DateID" */
CREATE GENERATOR "DateID_GEN";
SET GENERATOR "DateID_GEN" TO -1;

/* Создаем генератор для поля "CountryID" */
CREATE GENERATOR "CountryID_GEN";
SET GENERATOR "CountryID_GEN" TO -1;

/* Создаем генератор для поля "CCDID" */
CREATE GENERATOR "CCDID_GEN";
SET GENERATOR "CCDID_GEN" TO -1;

/* Создаем генератор для поля "CertificateID" */
CREATE GENERATOR "CertificateID_GEN";
SET GENERATOR "CertificateID_GEN" TO -1;

/* Создаем генератор для поля "ProperID" */
CREATE GENERATOR "ProperID_GEN";
SET GENERATOR "ProperID_GEN" TO -1;

/* Создаем генератор для поля "OrderID" */
CREATE GENERATOR "OrderID_GEN";
SET GENERATOR "OrderID_GEN" TO 0;

/* Создаем генератор для поля "PaymentID" */
CREATE GENERATOR "PaymentID_GEN";
SET GENERATOR "PaymentID_GEN" TO 0;

/* Создаем генератор для поля "PageID" */
CREATE GENERATOR "PageID_GEN";
SET GENERATOR "PageID_GEN" TO 0;



/******************************************************************************/
/****                              Exceptions                              ****/
/******************************************************************************/


/* Создаем Исключение для Склада */
CREATE EXCEPTION "Non_Delete" 'Fatal Error';



/******************************************************************************/
/****                          Stored Procedures                           ****/
/******************************************************************************/


/* Процедура выбора НДС для "Группы" на дату */
CREATE PROCEDURE "Category_VATRate"(
    "WorkDate" DATE
    )
RETURNS (
    "CategoryID" INTEGER,
    "CategoryName" VARCHAR(84),
    "Date" DATE,
    "VATRateName" VARCHAR(84),
    "VATRate" NUMERIC(4,2)
    )
AS
BEGIN
  EXIT;
END;

/* Процедура выбора Должников на дату */
CREATE PROCEDURE "Customer_Debtor"(
    "MainFirm" INTEGER,
    "WorkDate" DATE,
    "Arrear" INTEGER
    )
RETURNS (
    "CustomerID" INTEGER,
    "CustomerName" VARCHAR(84),
    "SumDebt" NUMERIC(15,2)
    )
AS
BEGIN
  EXIT;
END;

/* Процедура выбора Долга по Накладной на дату */
CREATE PROCEDURE "Debtor_Order"(
    "MainFirm" INTEGER,
    "WorkDate" DATE,
    "Arrear" INTEGER
    )
RETURNS (
    "OrderID" INTEGER,
    "Date" DATE,
    "Number" VARCHAR(10),
    "CustomerID" INTEGER,
    "TotalAmount" NUMERIC(15,2),
    "PayDate" DATE,
    "Pay" NUMERIC(15,2),
    "Debt" NUMERIC(15,2),
    "ProperID" INTEGER
    )
AS
BEGIN
  EXIT;
END;

/* Процедура выборки для "Оборотно-сальдовой ведомости" */
CREATE PROCEDURE "Store_Qty"(
    "MainFirm" INTEGER,
    "TopDate" DATE,
    "BottomDate" DATE
    )
RETURNS (
    "StoreID" INTEGER,
    "ProductID" INTEGER,
    "AccountPrice" NUMERIC(15,2),
    "ProductFullName" VARCHAR(84),
    "DivisionID" INTEGER,
    "TopQty" NUMERIC(9,3),
    "TopAmount" NUMERIC(15,2),
    "ReceiptQty" NUMERIC(9,3),
    "ReceiptAmount" NUMERIC(15,2),
    "ExpenseQty" NUMERIC(9,3),
    "ExpenseAmount" NUMERIC(15,2),
    "BottomQty" NUMERIC(9,3),
    "BottomAmount" NUMERIC(15,2)
    )
AS
BEGIN
  EXIT;
END;

/* Процедура переноса Остатков с одной Даты на другую Дату */
CREATE PROCEDURE "Store_Qty_Date"(
    "MainFirm" INTEGER,
    "TopDate" DATE,
    "BottomDate" DATE
    )
AS
BEGIN
  EXIT;
END;

/* Процедура выборки для "Остатки по сладам" */
CREATE PROCEDURE "Remains_Qty"(
    "MainFirm" INTEGER,
    "DivisionID" INTEGER,
    "PriceID" INTEGER,
    "WokrDate" DATE
    )
RETURNS (
    "StoreID" INTEGER,
    "ProductID" INTEGER,
    "CategoryID" INTEGER,
    "ProductFullName" VARCHAR(84),
    "Pack" SMALLINT,
    "MeasureName" VARCHAR(84),
    "Price" NUMERIC(15,2),
    "TallyQty" NUMERIC(9,3),
    "TallyAmount" NUMERIC(15,2)
    )
AS
BEGIN
  EXIT;
END;



/******************************************************************************/
/****                                Tables                                ****/
/******************************************************************************/


/* Создаем таблицу "Клиент" */
CREATE TABLE "Customers"(
    "CustomerID" PK_DOMAIN,                    /* Код Клиента */
    "CustomerName" NAME_DOMAIN,                    /* Наименование Клиента */
    "CustomerFullName" NAME_DOMAIN,                /* Полное Наименование Клиента */
    "Address" NAME_DOMAIN,                    /* Адрес Клиента */
    "Phone" VARCHAR(15),                    /* Телефон */
    "OKONH" VARCHAR(12),                    /* ОКОНХ Клиента */
    "OKPO" VARCHAR(12),                        /* ОКПО Клиента */
    "INN" VARCHAR(12),                        /* ИНН Клиента */
    "KPP" VARCHAR(9),                        /* КПП Клиента */
    "Registration" NAME_DOMAIN,                    /* Реквизиты свидетельства о гос. регистрации индивидуального предпринимателя */
    "PassSeries" VARCHAR(12),                    /* Паспорт: Серия */
    "PassNo" VARCHAR(12),                    /* Паспорт: Номер */
    "PassIssuer" NAME_DOMAIN,                    /* Паспорт: Орган выдачи */
    "PassDate" DATE,                        /* Паспорт: Дата выдачи */
    "BankID" FK_DOMAIN,                        /* Код Банка */
    "Account" VARCHAR(20),                    /* Счет в Банке */
    "PriceID" FK_DOMAIN,                    /* Код Типа Цены */
    "DelayPay" SMALL_DOMAIN,                    /* Отсрочка платежа */
    "Note" BLOB,                        /* Примечание */
    "VAT" SMALL_DOMAIN,                        /* Признак "с НДС": 0 - Нет, 1 - Да */
    "Firm" SMALL_DOMAIN                        /* Признак "Фирма" */
    );

/* Создаем таблицу "Сальдо" */
CREATE TABLE "Balance"(
    "FirmID" PK_DOMAIN,                        /* Код Фирмы */
    "CustomerID" PK_DOMAIN,                    /* Код Клиента */
    "Debt" AMOUNT_DOMAIN                    /* Сумма задолженности */
    );

/* Создаем таблицу "Бульдо" */
CREATE TABLE "InitialBalance"(
    "FirmID" PK_DOMAIN,                        /* Код Фирмы */
    "CustomerID" PK_DOMAIN,                    /* Код Клиента */
    "Date" DATE,                        /* Дата */
    "TotalAmount" AMOUNT_DOMAIN,                /* Сумма начальной задолженности */
    "VATRate" NUMERIC(4,2),                    /* Ставка НДС в % */
    "Pay" AMOUNT_DOMAIN,                    /* Оплата начальной задолженности */
    "Debt" NUMERIC(15,2) COMPUTED BY ("TotalAmount" - "Pay")    /* Остаток начальной задолженности */
    );

/* Создаем таблицу "Подразделения" */
CREATE TABLE "Divisions"(
    "DivisionID" PK_DOMAIN,                    /* Код Подразделения */
    "DivisionName" NAME_DOMAIN,                    /* Наименование Подразделения */
    "Address" NAME_DOMAIN,                    /* Адрес Подразделения */
    "CustomerID" FK_DOMAIN                    /* Код Клиента */
    );

/* Создаем таблицу "Служащие" */
CREATE TABLE "Employees"(
    "EmployeeID" PK_DOMAIN,                    /* Код Служащего */
    "FirstName" NAME_DOMAIN,                    /* Фамилия */
    "SecondName" NAME_DOMAIN,                    /* Имя */
    "ThirdName" NAME_DOMAIN,                    /* Отчество */
    "JobTitleID" FK_DOMAIN,                    /* Код Должности */
    "TableNo" SHORTNAME_DOMAIN,                    /* Табельный Номер */
    "PassSeries" SHORTNAME_DOMAIN,                /* Паспорт: Серия */
    "PassNo" SHORTNAME_DOMAIN,                    /* Паспорт: Номер */
    "PassIssuer" NAME_DOMAIN,                    /* Паспорт: Орган выдачи */
    "PassDate" DATE,                        /* Паспорт: Дата выдачи */
    "CustomerID" FK_DOMAIN                    /* Код Клиента */
    );

/* Создаем таблицу "Должности" */
CREATE TABLE "JobTitles"(
    "JobTitleID" PK_DOMAIN,                    /* Код Должности */
    "JobTitleName" NAME_DOMAIN                    /* Наименование Должности */
    );

/* Создаем таблицу "Банки" */
CREATE TABLE "Banks"(
    "BankID" PK_DOMAIN,                        /* Код Банка */
    "BankName" NAME_DOMAIN,                    /* Наименование Банка */
    "Address" NAME_DOMAIN,                    /* Адрес Банка */
    "Account" VARCHAR(20),                    /* Кор. Счет Банка */
    "BIC" VARCHAR(9)                        /* БИК Банка */
    );

/* Создаем таблицу "Группы" */
CREATE TABLE "Groups"(
    "GroupID" PK_DOMAIN,                    /* Код Группы товара */
    "GroupName" NAME_DOMAIN,                    /* Наименование Группы товара */
    "Priorit" SMALL_DOMAIN                    /* Приоритет для сортировки */
    );

/* Создаем таблицу "Категория" */
CREATE TABLE "Categories"(
    "CategoryID" PK_DOMAIN,                    /* Код Типа товара */
    "CategoryName" NAME_DOMAIN,                    /* Наименование Типа товара */
    "GroupID" FK_DOMAIN                        /* Код Группы товара */
    );

/* Создаем таблицу "НДС" */
CREATE TABLE "VAT"(
    "CategoryID" PK_DOMAIN,                    /* Код типа товара */
    "Date" DATE_DOMAIN,                        /* Дата введения */
    "VATRateID" FK_DOMAIN                    /* Ставка НДС в % */
    );

/* Создаем таблицу "Ставки НДС" */
CREATE TABLE "VATRates"(
    "VATRateID" PK_DOMAIN,                    /* Код типа товара */
    "VATRateName" NAME_DOMAIN,                    /* Дата введения */
    "VATRate" NUMERIC(4,2)                    /* Ставка НДС в % */
    );

/* Создаем таблицу "Товар" */
CREATE TABLE "Products"(
    "ProductID" PK_DOMAIN,                    /* Код товара */
    "Article" NAME_DOMAIN,                    /* Артикул */
    "ProductName" NAME_DOMAIN,                    /* Наименование товара */
    "Note" VARCHAR(255),                    /* Примечания */
    "CategoryID" FK_DOMAIN,                    /* Код типа товара */
    "MeasureID" FK_DOMAIN,                    /* Код Единицы измерения */
    "Pack" SMALL_DOMAIN,                    /* Количество в упаковке */
    "ProducerID" FK_DOMAIN,                    /* Код Производителя */
    "CountryID" FK_DOMAIN,                    /* Код Страны происхождения */
    "Description" BLOB,                        /* Описание Продукта */
    "Weight" SMALL_DOMAIN                    /* Признак "Весовой": 0 - Нет, 1 - Да */
    );

/* Создаем таблицу "Единицы измерений" */
CREATE TABLE "Measures"(
    "MeasureID" PK_DOMAIN,                    /* Код Единицы измерения */
    "MeasureName" SHORTNAME_DOMAIN                /* Наименование Единицы измерения */
    );

/* Создаем таблицу "Производители" */
CREATE TABLE "Producers"(
    "ProducerID" PK_DOMAIN,                    /* Код Производителя */
    "ProducerName" NAME_DOMAIN                    /* Наименование Производителя */
    );

/* Создаем таблицу "Типы Цен" */
CREATE TABLE "TypePrices"(
    "PriceID" PK_DOMAIN,                    /* Код Типа Цены */
    "PriceName" NAME_DOMAIN,                    /* Наименование Цены */
    "Markup" NUMERIC(4,2),                    /* Наценка в % */
    "Round" PRICE_DOMAIN                    /* Округлять до */
    );

/* Создаем таблицу "Партии" */
CREATE TABLE "Store"(
    "StoreID" PK_DOMAIN,                    /* Код партии товара */
    "ProductID" FK_DOMAIN,                    /* Код товара */
    "AccountPrice" PRICE_DOMAIN,                /* Учетная цена */
    "CCDID" FK_DOMAIN,                        /* Код Грузовой Таможенной Декларации */
    "CertificateID" FK_DOMAIN,                    /* Код Сертификата */
    "Serial" NAME_DOMAIN,                    /* Серийный номер */
    "BeforeDate" DATE_DOMAIN                    /* Дата документа */
    );

/* Создаем таблицу "Кол-во" */
CREATE TABLE "StoreQty"(
    "StoreID" PK_DOMAIN,                    /* Код партии товара */
    "DivisionID" PK_DOMAIN,                    /* Код Подразделения */
    "Qty" QTY_DOMAIN                        /* Количество */
    );

/* Создаем таблицу "Даты для Партий" */
CREATE TABLE "DateStore"(
    "DateID" PK_DOMAIN,                        /* Код Даты */
    "Date" DATE_DOMAIN NOT NULL                    /* Дата */
    );

/* Создаем таблицу "Кол-во на дату" */
CREATE TABLE "StoreQtyDate"(
    "DateID" FK_DOMAIN,                        /* Код Даты */
    "StoreID" FK_DOMAIN,                    /* Код партии товара */
    "DivisionID" FK_DOMAIN,                    /* Код Подразделения */
    "Qty" QTY_DOMAIN                        /* Количество */
    );

/* Создаем таблицу "Цены" */
CREATE TABLE "Prices"(
    "StoreID" PK_DOMAIN,                    /* Код партии товара */
    "PriceID" PK_DOMAIN,                    /* Код Типа Цены */
    "Price" PRICE_DOMAIN                    /* Значение Цены */
    );

/* Создаем таблицу "Страны происхождения" */
CREATE TABLE "Countrys"(
    "CountryID" PK_DOMAIN,                    /* Код Страны происхождения */
    "CountryName" NAME_DOMAIN                    /* Наименование Страны происхождения */
    );

/* Создаем таблицу "Грузовая Таможенная Декларация" */
CREATE TABLE "CCD"(
    "CCDID" PK_DOMAIN,                        /* Код Грузовой Таможенной Декларации */
    "CCDName" NAME_DOMAIN                    /* Наименование Грузовой Таможенной Декларации */
    );

/* Создаем таблицу "Сертификаты" */
CREATE TABLE "Certificates"(
    "CertificateID" PK_DOMAIN,                    /* Код Сертификата */
    "CertificateName" NAME_DOMAIN                /* Наименование Сертификата */
    );

/* Создаем таблицу "Виды Документов" */
CREATE TABLE "Propers"(
    "ProperID" PK_DOMAIN,                    /* Код Вида Документа */
    "ProperName" NAME_DOMAIN                    /* Наименование Вида Документа */
    );

/* Создаем таблицу "Приходные/Расходные Документы" */
CREATE TABLE "Orders"(
    "OrderID" PK_DOMAIN,                    /* Код Приходного/Расходные Документа */
    "FirmID" FK_DOMAIN,                        /* Код Фирмы */
    "InDivisionID" FK_DOMAIN,                    /* Код Подразделения - Приход */
    "OutDivisionID" FK_DOMAIN,                    /* Код Подразделения - Расход */
    "CustomerID" FK_DOMAIN,                    /* Код Клиента */
    "Date" DATE_DOMAIN DEFAULT 'now',                /* Дата прихода/расхода */
    "Number" VARCHAR(10),                    /* Номер документа */
    "IssueDate" DATE_DOMAIN,                    /* Дата документа */
    "InAmountVAT" AMOUNT_DOMAIN,                /* Сумма НДС - Приход */
    "InAmount" AMOUNT_DOMAIN,                    /* Сумма документа - Приход */
    "OutAmountVAT" AMOUNT_DOMAIN,                /* Сумма НДС - Расход */
    "OutAmount" AMOUNT_DOMAIN,                    /* Сумма документа - Расход */
    "TotalAmountVAT" AMOUNT_DOMAIN,                /* Сумма НДС документа */
    "TotalAmount" AMOUNT_DOMAIN,                /* Сумма документа */
    "PayDate" DATE_DOMAIN,                    /* Дата оплаты */
    "Pay" AMOUNT_DOMAIN,                    /* Оплата документа */
    "Debt" NUMERIC(15,2) COMPUTED BY ("TotalAmount" - "Pay"),    /* Долг по документу */
    "PriceID" FK_DOMAIN,                    /* Код Типа Цены для Расходной накладной */
    "Note" VARCHAR(255),                    /* Примечания */
    "UserName" VARCHAR(31),                    /* Имя Юзера */
    "ProperID" FK_DOMAIN                    /* Вид документа: 0 - Приход; 1 - Расход */
    );

/* Создаем таблицу "Состав Документа" */
CREATE TABLE "Structure"(
    "OrderID" FK_DOMAIN,                    /* Код Приходного/Расходного документа */
    "ProductID" FK_DOMAIN,                    /* Код товара */
    "StoreID" FK_DOMAIN,                    /* Код партии товара */
    "Qty" QTY_DOMAIN,                        /* Количество товара */
    "PriceNonVAT" PRICE_DOMAIN,                    /* Цена без НДС */
    "Price" PRICE_DOMAIN,                    /* Цена */
    "VATRate" NUMERIC(4,2),                    /* Ставка НДС в % */
    "AmountVAT" AMOUNT_DOMAIN,                    /* Сумма НДС */
    "Amount" AMOUNT_DOMAIN,                    /* Сумма */
    "Type" SMALL_DOMAIN                        /* Тип строки: -1 - Приход; 1 - Расход */
    );

/* Создаем таблицу "Оплата" */
CREATE TABLE "Payments"(
    "PaymentID" PK_DOMAIN,                    /* Код Оплаты */
    "FirmID" FK_DOMAIN,                        /* Код Фирмы */
    "OrderID" INTEGER,                        /* Код документа */
    "CustomerID" FK_DOMAIN,                    /* Код Клиента */
    "Cash" SMALL_DOMAIN,                    /* Вид оплаты: 0 - Безнаничный; 1 - Наличный расчет */
    "Date" DATE_DOMAIN DEFAULT 'now',                /* Дата оплаты */
    "Number" VARCHAR(10),                    /* Номер платежного документа */
    "TotalPay" AMOUNT_DOMAIN,                    /* Сумма оплаты */
    "Debit" INTEGER,                        /* Счет по Дебету */
    "DebitSub" INTEGER,                        /* Субсчет по Дебету */
    "Credit" INTEGER,                        /* Счет по Кредиту */
    "CreditSub" INTEGER,                    /* Субсчет по Кредиту */
    "PageID" FK_DOMAIN,                        /* Код листа Кассовой книги */
    "UserName" VARCHAR(31),                    /* Имя Юзера */
    "Type" SMALL_DOMAIN                        /* Тип строки: -1 - Приход; 1 - Расход */
    );

/* Создаем таблицу "Оплата по Документам" */
CREATE TABLE "PayOrders"(
    "PaymentID" FK_DOMAIN,                    /* Код Оплаты */
    "OrderID" INTEGER,                        /* Код документа */
    "Pay" AMOUNT_DOMAIN                        /* Сумма оплаты */
    );

/* Создаем таблицу "Кассовая книга" */
CREATE TABLE "CashBook"(
    "PageID" PK_DOMAIN,                        /* Код страницы */
    "FirmID" FK_DOMAIN,                        /* Код Фирмы */
    "Date" DATE,                        /* Дата */
    "Number" INTEGER,                        /* Номер страницы */
    "InitialAmount" AMOUNT_DOMAIN,                /* Сумма на начало дня */
    "FinalAmount" AMOUNT_DOMAIN                    /* Сумма на конец дня */
    );



/******************************************************************************/
/****                             Primary Keys                             ****/
/******************************************************************************/


/* Создаем певичные ключи */
ALTER TABLE "Customers" ADD CONSTRAINT "pkCustomersTable" PRIMARY KEY ("CustomerID");
ALTER TABLE "Balance" ADD CONSTRAINT "pkBalanceTable" PRIMARY KEY ("FirmID", "CustomerID");
ALTER TABLE "InitialBalance" ADD CONSTRAINT "pkInitialBalanceTable" PRIMARY KEY ("FirmID", "CustomerID");
ALTER TABLE "Divisions" ADD CONSTRAINT "pkDivisionsTable" PRIMARY KEY ("DivisionID");
ALTER TABLE "Employees" ADD CONSTRAINT "pkEmployeesTable" PRIMARY KEY ("EmployeeID");
ALTER TABLE "JobTitles" ADD CONSTRAINT "pkJobTitlesTable" PRIMARY KEY ("JobTitleID");
ALTER TABLE "Banks" ADD CONSTRAINT "pkBanksTable" PRIMARY KEY ("BankID");
ALTER TABLE "Groups" ADD CONSTRAINT "pkGroupsTable" PRIMARY KEY ("GroupID");
ALTER TABLE "Categories" ADD CONSTRAINT "pkCategoriesTable" PRIMARY KEY ("CategoryID");
ALTER TABLE "VATRates" ADD CONSTRAINT "pkVATRateTable" PRIMARY KEY ("VATRateID");
ALTER TABLE "Products" ADD CONSTRAINT "pkProductsTable" PRIMARY KEY ("ProductID");
ALTER TABLE "Measures" ADD CONSTRAINT "pkMeasuresTable" PRIMARY KEY ("MeasureID");
ALTER TABLE "Producers" ADD CONSTRAINT "pkProducersTable" PRIMARY KEY ("ProducerID");
ALTER TABLE "TypePrices" ADD CONSTRAINT "pkTypePricesTable" PRIMARY KEY ("PriceID");
ALTER TABLE "Store" ADD CONSTRAINT "pkStoreTable" PRIMARY KEY ("StoreID");
ALTER TABLE "StoreQty" ADD CONSTRAINT "pkStoreQtyTable" PRIMARY KEY ("StoreID", "DivisionID");
ALTER TABLE "DateStore" ADD CONSTRAINT "pkDateStoreTable" PRIMARY KEY ("DateID");
ALTER TABLE "Prices" ADD CONSTRAINT "pkPricesTable" PRIMARY KEY ("StoreID", "PriceID");
ALTER TABLE "Countrys" ADD CONSTRAINT "pkCountrysTable" PRIMARY KEY ("CountryID");
ALTER TABLE "CCD" ADD CONSTRAINT "pkCCDTable" PRIMARY KEY ("CCDID");
ALTER TABLE "Certificates" ADD CONSTRAINT "pkCertificateTable" PRIMARY KEY ("CertificateID");
ALTER TABLE "Propers" ADD CONSTRAINT "pkProperTable" PRIMARY KEY ("ProperID");
ALTER TABLE "Orders" ADD CONSTRAINT "pkOrdersTable" PRIMARY KEY ("OrderID");
ALTER TABLE "Payments" ADD CONSTRAINT "pkPaymentsTable" PRIMARY KEY ("PaymentID");
ALTER TABLE "CashBook" ADD CONSTRAINT "pkCashBookTable" PRIMARY KEY ("PageID");



/******************************************************************************/
/****                             Foreign Keys                             ****/
/******************************************************************************/


/* Создаем внешние ключи */
ALTER TABLE "Customers" ADD CONSTRAINT "fkBank" FOREIGN KEY ("BankID") REFERENCES "Banks" ("BankID");
ALTER TABLE "Customers" ADD CONSTRAINT "fkTypePriceCustomer" FOREIGN KEY ("PriceID") REFERENCES "TypePrices" ("PriceID");
ALTER TABLE "Balance" ADD CONSTRAINT "fkBalanceFirm" FOREIGN KEY ("FirmID") REFERENCES "Customers" ("CustomerID");
ALTER TABLE "Balance" ADD CONSTRAINT "fkBalanceCustomer" FOREIGN KEY ("CustomerID") REFERENCES "Customers" ("CustomerID");
ALTER TABLE "InitialBalance" ADD CONSTRAINT "fkInitialBalanceFirm" FOREIGN KEY ("FirmID") REFERENCES "Customers" ("CustomerID");
ALTER TABLE "InitialBalance" ADD CONSTRAINT "fkInitialBalanceCustomer" FOREIGN KEY ("CustomerID") REFERENCES "Customers" ("CustomerID");
ALTER TABLE "Divisions" ADD CONSTRAINT "fkDivision" FOREIGN KEY ("CustomerID") REFERENCES "Customers" ("CustomerID") ON DELETE CASCADE;
ALTER TABLE "Employees" ADD CONSTRAINT "fkEmployee" FOREIGN KEY ("CustomerID") REFERENCES "Customers" ("CustomerID") ON DELETE CASCADE;
ALTER TABLE "Employees" ADD CONSTRAINT "fkJobTitle" FOREIGN KEY ("JobTitleID") REFERENCES "JobTitles" ("JobTitleID");
ALTER TABLE "Categories" ADD CONSTRAINT "fkGroup" FOREIGN KEY ("GroupID") REFERENCES "Groups" ("GroupID");
ALTER TABLE "VAT" ADD CONSTRAINT "fkVAT" FOREIGN KEY ("CategoryID") REFERENCES "Categories" ("CategoryID") ON DELETE CASCADE;
ALTER TABLE "VAT" ADD CONSTRAINT "fkVATRate" FOREIGN KEY ("VATRateID") REFERENCES "VATRates" ("VATRateID");
ALTER TABLE "Products" ADD CONSTRAINT "fkCategory" FOREIGN KEY ("CategoryID") REFERENCES "Categories" ("CategoryID");
ALTER TABLE "Products" ADD CONSTRAINT "fkMeasure" FOREIGN KEY ("MeasureID") REFERENCES "Measures" ("MeasureID");
ALTER TABLE "Products" ADD CONSTRAINT "fkProducer" FOREIGN KEY ("ProducerID") REFERENCES "Producers" ("ProducerID");
ALTER TABLE "Products" ADD CONSTRAINT "fkCountry" FOREIGN KEY ("CountryID") REFERENCES "Countrys" ("CountryID");
ALTER TABLE "Store" ADD CONSTRAINT "fkProduct" FOREIGN KEY ("ProductID") REFERENCES "Products" ("ProductID");
ALTER TABLE "Store" ADD CONSTRAINT "fkCCD" FOREIGN KEY ("CCDID") REFERENCES "CCD" ("CCDID");
ALTER TABLE "Store" ADD CONSTRAINT "fkCertificate" FOREIGN KEY ("CertificateID") REFERENCES "Certificates" ("CertificateID");
ALTER TABLE "StoreQty" ADD CONSTRAINT "fkStoreQtyStore" FOREIGN KEY ("StoreID") REFERENCES "Store" ("StoreID") ON DELETE CASCADE;
ALTER TABLE "StoreQty" ADD CONSTRAINT "fkStoreQtyDivision" FOREIGN KEY ("DivisionID") REFERENCES "Divisions" ("DivisionID");
ALTER TABLE "StoreQtyDate" ADD CONSTRAINT "fkStoreQtyDateDate" FOREIGN KEY ("DateID") REFERENCES "DateStore" ("DateID") ON DELETE CASCADE;
ALTER TABLE "StoreQtyDate" ADD CONSTRAINT "fkStoreQtyDateStore" FOREIGN KEY ("StoreID") REFERENCES "Store" ("StoreID") ON DELETE CASCADE;
ALTER TABLE "StoreQtyDate" ADD CONSTRAINT "fkStoreQtyDateDivision" FOREIGN KEY ("DivisionID") REFERENCES "Divisions" ("DivisionID");
ALTER TABLE "Prices" ADD CONSTRAINT "fkPrice" FOREIGN KEY ("StoreID") REFERENCES "Store" ("StoreID") ON DELETE CASCADE;
ALTER TABLE "Prices" ADD CONSTRAINT "fkTypePrice" FOREIGN KEY ("PriceID") REFERENCES "TypePrices" ("PriceID");
ALTER TABLE "Orders" ADD CONSTRAINT "fkOrderProper" FOREIGN KEY ("ProperID") REFERENCES "Propers" ("ProperID");
ALTER TABLE "Orders" ADD CONSTRAINT "fkOrderFirm" FOREIGN KEY ("FirmID") REFERENCES "Customers" ("CustomerID");
ALTER TABLE "Orders" ADD CONSTRAINT "fkOrderInDivision" FOREIGN KEY ("InDivisionID") REFERENCES "Divisions" ("DivisionID");
ALTER TABLE "Orders" ADD CONSTRAINT "fkOrderOutDivision" FOREIGN KEY ("OutDivisionID") REFERENCES "Divisions" ("DivisionID");
ALTER TABLE "Orders" ADD CONSTRAINT "fkOrderCustomer" FOREIGN KEY ("CustomerID") REFERENCES "Customers" ("CustomerID");
ALTER TABLE "Orders" ADD CONSTRAINT "fkOrderTypePrice" FOREIGN KEY ("PriceID") REFERENCES "TypePrices" ("PriceID");
ALTER TABLE "Structure" ADD CONSTRAINT "fkOrder" FOREIGN KEY ("OrderID") REFERENCES "Orders" ("OrderID");
ALTER TABLE "Structure" ADD CONSTRAINT "fkStructureProduct" FOREIGN KEY ("ProductID") REFERENCES "Products" ("ProductID");
ALTER TABLE "Structure" ADD CONSTRAINT "fkStructureStore" FOREIGN KEY ("StoreID") REFERENCES "Store" ("StoreID");
ALTER TABLE "Payments" ADD CONSTRAINT "fkPayFirm" FOREIGN KEY ("FirmID") REFERENCES "Customers" ("CustomerID");
ALTER TABLE "Payments" ADD CONSTRAINT "fkPayCustomer" FOREIGN KEY ("CustomerID") REFERENCES "Customers" ("CustomerID");
ALTER TABLE "PayOrders" ADD CONSTRAINT "fkPayPayment" FOREIGN KEY ("PaymentID") REFERENCES "Payments" ("PaymentID") ON DELETE CASCADE;
ALTER TABLE "PayOrders" ADD CONSTRAINT "fkPayOrder" FOREIGN KEY ("OrderID") REFERENCES "Orders" ("OrderID") ON DELETE CASCADE;
ALTER TABLE "CashBook" ADD CONSTRAINT "fkCashBookFirm" FOREIGN KEY ("FirmID") REFERENCES "Customers" ("CustomerID");






/******************************************************************************/
/****                               Triggers                               ****/
/******************************************************************************/


/* Создаем триггер для генерации ID новой записи таблицы "Клиент" */
CREATE TRIGGER "Customer_BI_0" FOR "Customers"
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW."CustomerID" IS NULL) THEN
    NEW."CustomerID" = GEN_ID("CustomerID_GEN",1);
END;

/* Создаем триггер для генерации ID новой записи таблицы "Сотрудники" */
CREATE TRIGGER "Employee_BI_0" FOR "Employees"
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW."EmployeeID" IS NULL) THEN
    NEW."EmployeeID" = GEN_ID("EmployeeID_GEN",1);
END;

/* Создаем триггер для генерации ID новой записи таблицы "Должности" */
CREATE TRIGGER "JobTitle_BI_0" FOR "JobTitles"
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW."JobTitleID" IS NULL) THEN
    NEW."JobTitleID" = GEN_ID("JobTitleID_GEN",1);
END;

/* Создаем триггер для генерации ID новой записи таблицы "Банк" */
CREATE TRIGGER "Bank_BI_0" FOR "Banks"
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW."BankID" IS NULL) THEN
    NEW."BankID" = GEN_ID("BankID_GEN",1);
END;

/* Создаем триггер для генерации ID новой записи таблицы "Подразделения" */
CREATE TRIGGER "Division_BI_0" FOR "Divisions"
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW."DivisionID" IS NULL) THEN
    NEW."DivisionID" = GEN_ID("CustomerID_GEN",1);
END;

/* Создаем триггер для генерации ID новой записи таблицы "Группы" */
CREATE TRIGGER "Group_BI_0" FOR "Groups"
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW."GroupID" IS NULL) THEN
    NEW."GroupID" = GEN_ID("GroupID_GEN",1);
END;

/* Создаем триггер для генерации ID новой записи таблицы "Категория" */
CREATE TRIGGER "Category_BI_0" FOR "Categories"
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW."CategoryID" IS NULL) THEN
    NEW."CategoryID" = GEN_ID("CategoryID_GEN",1);
END;

/* Создаем триггер для генерации ID новой записи таблицы "Ставки НДС" */
CREATE TRIGGER "VATRate_BI_0" FOR "VATRates"
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW."VATRateID" IS NULL) THEN
    NEW."VATRateID" = GEN_ID("VATRateID_GEN",1);
END;

/* Создаем триггер для генерации ID новой записи таблицы "Товар" */
CREATE TRIGGER "Product_BI_0" FOR "Products"
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW."ProductID" IS NULL) THEN
    NEW."ProductID" = GEN_ID("ProductID_GEN",1);
END;

/* Создаем триггер для генерации ID новой записи таблицы "Единицы измерений" */
CREATE TRIGGER "Measure_BI_0" FOR "Measures"
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW."MeasureID" IS NULL) THEN
    NEW."MeasureID" = GEN_ID("MeasureID_GEN",1);
END;

/* Создаем триггер для генерации ID новой записи таблицы "Производители" */
CREATE TRIGGER "Producer_BI_0" FOR "Producers"
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW."ProducerID" IS NULL) THEN
    NEW."ProducerID" = GEN_ID("ProducerID_GEN",1);
END;

/* Создаем триггер для генерации ID новой записи таблицы "Типы Цен" */
CREATE TRIGGER "TypePrice_BI_0" FOR "TypePrices"
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW."PriceID" IS NULL) THEN
    NEW."PriceID" = GEN_ID("PriceID_GEN",1);
END;

/* Создаем триггер для генерации ID новой записи таблицы "Партии" */
CREATE TRIGGER "Store_BI_0" FOR "Store"
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW."StoreID" IS NULL) THEN
    NEW."StoreID" = GEN_ID("StoreID_GEN",1);
END;

/* Создаем триггер для генерации ID новой записи таблицы "Даты для Партий" */
CREATE TRIGGER "Date_BI_0" FOR "DateStore"
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW."DateID" IS NULL) THEN
    NEW."DateID" = GEN_ID("DateID_GEN",1);
END;

/* Создаем триггер для генерации ID новой записи таблицы "Страны происхождения" */
CREATE TRIGGER "Country_BI_0" FOR "Countrys"
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW."CountryID" IS NULL) THEN
    NEW."CountryID" = GEN_ID("CountryID_GEN",1);
END;

/* Создаем триггер для генерации ID новой записи таблицы "Грузовая Таможенная Декларация" */
CREATE TRIGGER "CCD_BI_0" FOR "CCD"
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW."CCDID" IS NULL) THEN
    NEW."CCDID" = GEN_ID("CCDID_GEN",1);
END;

/* Создаем триггер для генерации ID новой записи таблицы "Сертификаты" */
CREATE TRIGGER "Certificate_BI_0" FOR "Certificates"
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW."CertificateID" IS NULL) THEN
    NEW."CertificateID" = GEN_ID("CertificateID_GEN",1);
END;

/* Создаем триггер для генерации ID новой записи таблицы "Виды Документов" */
CREATE TRIGGER "Proper_BI_0" FOR "Propers"
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW."ProperID" IS NULL) THEN
    NEW."ProperID" = GEN_ID("ProperID_GEN",1);
END;

/* Создаем триггер для генерации ID новой записи таблицы "Приходные/Расходные документы" */
CREATE TRIGGER "Order_BI_0" FOR "Orders"
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW."OrderID" IS NULL) THEN
    NEW."OrderID" = GEN_ID("OrderID_GEN",1);
END;

/* Создаем триггер для генерации ID новой записи таблицы "Оплата документа" */
CREATE TRIGGER "Payment_BI_0" FOR "Payments"
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW."PaymentID" IS NULL) THEN
    NEW."PaymentID" = GEN_ID("PaymentID_GEN",1);
END;

/* Создаем триггер для генерации ID новой записи таблицы "Кассавоя книга" */
CREATE TRIGGER "CashBook_BI_0" FOR "CashBook"
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW."PageID" IS NULL) THEN
    NEW."PageID" = GEN_ID("PageID_GEN",1);
END;







/* Перед добавлением новой записи в таблицу "Клиенты" */
/* устанавливаем значение "Фирма", равный "0" */
/* устанавливаем "Нулевое" значение "Код Банка" */
CREATE TRIGGER "Customer_BI_1" FOR "Customers"
ACTIVE BEFORE INSERT POSITION 1
AS
BEGIN
  IF (NEW."Firm" IS NULL) THEN
    NEW."Firm" = 0;
  IF (NEW."BankID" IS NULL) THEN
    NEW."BankID" = 0;
END;

/* Перед изменением записи в таблице "Клиенты" */
/* если "Код" = 0, то вызываем исключение */
CREATE TRIGGER "Customer_BU_0" FOR "Customers"
ACTIVE BEFORE UPDATE POSITION 0
AS
BEGIN
  IF (OLD."CustomerID" = 0) THEN
    EXCEPTION "Non_Delete";
END;

/* Перед удалением записи в таблице "Клиенты" */
/* если "Код" = 0, то вызываем исключение */
CREATE TRIGGER "Customer_BD_0" FOR "Customers"
ACTIVE BEFORE DELETE POSITION 0
AS
BEGIN
  IF (OLD."CustomerID" = 0) THEN
    EXCEPTION "Non_Delete";
END;

/* Перед добавлением новой записи в таблицу "" */
/* устанавливаем "Нулевое" значение "" */
CREATE TRIGGER "Balance_BI_0" FOR "Balance"
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW."Debt" IS NULL) THEN
    NEW."Debt" = 0;
END;

/* Перед добавлением новой записи в таблицу "" */
/* устанавливаем "Нулевое" значение "" */
CREATE TRIGGER "InitialBalance_BI_0" FOR "InitialBalance"
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW."TotalAmount" IS NULL) THEN
    NEW."TotalAmount" = 0;
  IF (NEW."VATRate" IS NULL) THEN
    NEW."VATRate" = 18;
  IF (NEW."Pay" IS NULL) THEN
    NEW."Pay" = 0;
END;

/* После добавления новой записи в "Бульдо": */
/* ищем запись по данному "Клиенту" и "Фирме" в таблице "Баланс", */
/* и если не находим таковой, то создаем оную в таблице "Баланс" */
CREATE TRIGGER "InitialBalance_AI_0" FOR "InitialBalance"
ACTIVE AFTER INSERT POSITION 0
AS
DECLARE VARIABLE "CustomerDebt" NUMERIC(15,2);
BEGIN
  IF (NEW."CustomerID" IS NOT NULL) THEN
  BEGIN
    SELECT "Debt"
    FROM "Balance"
    WHERE ("FirmID" = NEW."FirmID") AND ("CustomerID" = NEW."CustomerID")
    INTO :"CustomerDebt";
    IF ("CustomerDebt" IS NULL) THEN
      INSERT INTO "Balance" ("FirmID", "CustomerID", "Debt")
        VALUES(NEW."FirmID", NEW."CustomerID", NEW."Debt");
    ELSE
    BEGIN
      UPDATE "Balance"
      SET "Debt" = "Debt" + NEW."TotalAmount"
      WHERE ("FirmID" = NEW."FirmID") AND ("CustomerID" = NEW."CustomerID");
    END
  END
END;

/* После изменения записи в "Бульдо": */
/* проставляем сумму в "Долг" в таблице "Баланс" */
CREATE TRIGGER "InitialBalance_AU_0" FOR "InitialBalance"
ACTIVE AFTER UPDATE POSITION 0
AS
DECLARE VARIABLE "CustomerDebt" NUMERIC(15,2);
BEGIN
  UPDATE "Balance"
  SET "Debt" = "Debt" - OLD."Debt"
  WHERE ("FirmID" = OLD."FirmID") AND ("CustomerID" = OLD."CustomerID");
  SELECT "Debt"
  FROM "Balance"
  WHERE ("FirmID" = NEW."FirmID") AND ("CustomerID" = NEW."CustomerID")
  INTO :"CustomerDebt";
  IF ("CustomerDebt" IS NULL) THEN
    INSERT INTO "Balance" ("FirmID", "CustomerID", "Debt")
    VALUES(NEW."FirmID", NEW."CustomerID", NEW."Debt");
  UPDATE "Balance"
  SET "Debt" = "Debt" + NEW."Debt"
  WHERE ("FirmID" = NEW."FirmID") AND ("CustomerID" = NEW."CustomerID");
END;

/* После удаления записи в "Бульдо": */
/* изменяем сумму "Долг" в таблице "Баланс". */
CREATE TRIGGER "InitialBalance_AD_0" FOR "InitialBalance"
ACTIVE AFTER DELETE POSITION 0
AS
BEGIN
  UPDATE "Balance"
  SET "Debt" = "Debt" - OLD."Debt"
  WHERE ("FirmID" = OLD."FirmID") AND ("CustomerID" = OLD."CustomerID");
END;

/* Перед добавлением новой записи в таблицу "" */
/* устанавливаем "Нулевое" значение "" */
CREATE TRIGGER "Employee_BI_1" FOR "Employees"
ACTIVE BEFORE INSERT POSITION 1
AS
BEGIN
  IF (NEW."JobTitleID" IS NULL) THEN
    NEW."JobTitleID" = 0;
END;

/* Перед добавлением новой записи в таблицу "" */
/* устанавливаем "Нулевое" значение "" */
CREATE TRIGGER "Category_BI_1" FOR "Categories"
ACTIVE BEFORE INSERT POSITION 1
AS
BEGIN
  IF (NEW."GroupID" IS NULL) THEN
    NEW."GroupID" = 0;
END;

/* Перед добавлением новой записи в таблицу "" */
/* устанавливаем "Нулевое" значение "" */
CREATE TRIGGER "TypePrice_BI_1" FOR "TypePrices"
ACTIVE BEFORE INSERT POSITION 1
AS
BEGIN
  IF (NEW."Markup" IS NULL) THEN
    NEW."Markup" = 0;
  IF (NEW."Round" IS NULL) THEN
    NEW."Round" = 0.01;
END;

/* Перед добавлением новой записи в таблицу "" */
/* устанавливаем "Нулевое" значение "" */
CREATE TRIGGER "Product_BI_1" FOR "Products"
ACTIVE BEFORE INSERT POSITION 1
AS
BEGIN
  IF (NEW."CategoryID" IS NULL) THEN
    NEW."CategoryID" = 0;
  IF (NEW."MeasureID" IS NULL) THEN
    NEW."MeasureID" = 0;
  IF (NEW."ProducerID" IS NULL) THEN
    NEW."ProducerID" = 0;
  IF (NEW."CountryID" IS NULL) THEN
    NEW."CountryID" = 0;
  IF (NEW."Pack" IS NULL) THEN
    NEW."Pack" = 1;
END;

/* Перед добавлением новой записи в "Склад": */
/* проставляем "Номер" партии
CREATE TRIGGER "Store_BI_1" FOR "Store"
ACTIVE BEFORE INSERT POSITION 1
AS
DECLARE VARIABLE "Maximum" INTEGER;
BEGIN
  IF (NEW."ProductID" IS NOT NULL) THEN
  BEGIN
    SELECT MAX("StoreID")
    FROM "Store"
    WHERE ("ProductID" = NEW."ProductID")
    INTO :"Maximum";
    IF ("Maximum" IS NOT NULL) THEN
      NEW."StoreID" = :"Maximum" + 1;
    ELSE
      NEW."StoreID" = 1;
  END
END; */

/* Перед добавлением новой записи в таблицу "Склад": */
/* устанавливаем значение "Начальный", равный Нулю; */
CREATE TRIGGER "Store_BI_1" FOR "Store"
ACTIVE BEFORE INSERT POSITION 1
AS
BEGIN
  IF (NEW."CCDID" IS NULL) THEN
    NEW."CCDID" = 0;
  IF (NEW."CertificateID" IS NULL) THEN
    NEW."CertificateID" = 0;
END;

/* После добавлением новой записи в таблицу "Склад": */
/* проставляем все цены */
CREATE TRIGGER "Store_AI_0" FOR "Store"
ACTIVE AFTER INSERT POSITION 0
AS
DECLARE VARIABLE "PriceID" INTEGER;
DECLARE VARIABLE "Markup" NUMERIC(4,2);
DECLARE VARIABLE "Round" NUMERIC(9,2);
DECLARE VARIABLE "Price" NUMERIC(9,2);
DECLARE VARIABLE "Price100" INTEGER;
BEGIN
  FOR
    SELECT "PriceID", "Markup", "Round"
    FROM "TypePrices"
    INTO :"PriceID", :"Markup", :"Round"
  DO
  BEGIN
    IF (:"PriceID" > 0) THEN
    BEGIN
      "Price100" =  NEW."AccountPrice" * (100 + :"Markup") / ("Round" * 100);
      "Price" = "Price100" * "Round";
      INSERT INTO "Prices" ("StoreID", "PriceID", "Price")
        VALUES(NEW."StoreID", :"PriceID", :"Price");
    END
  END
END;

/* После изменения записи в таблицу "Склад": */
/* пересчитываем все цены */
CREATE TRIGGER "Store_AU_0" FOR "Store"
ACTIVE AFTER UPDATE POSITION 0
AS
DECLARE VARIABLE "PriceID" INTEGER;
DECLARE VARIABLE "Markup" NUMERIC(4,2);
DECLARE VARIABLE "Round" NUMERIC(9,2);
DECLARE VARIABLE "Price" NUMERIC(9,2);
DECLARE VARIABLE "Price100" INTEGER;
BEGIN
  IF (OLD."AccountPrice" <> NEW."AccountPrice") THEN
  BEGIN
    FOR
      SELECT "PriceID", "Markup", "Round"
      FROM "TypePrices"
      INTO :"PriceID", :"Markup", :"Round"
    DO
    BEGIN
      IF (:"PriceID" > 0) THEN
      BEGIN
        "Price100" =  NEW."AccountPrice" * (100 + :"Markup") / ("Round" * 100);
        "Price" = "Price100" * "Round";
        UPDATE "Prices"
        SET "Price" = :"Price"
        WHERE ("StoreID" = NEW."StoreID") AND ("PriceID" = :"PriceID");
      END
    END
  END
END;

/* Перед добавлением новой записи в "Документ": */
/* проставляем начальные данные в "Юзер" и "Клиент", */
/* а так же нулевые суммы в "Итог" и "Оплату" */
CREATE TRIGGER "Order_BI_1" FOR "Orders"
ACTIVE BEFORE INSERT POSITION 1
AS
BEGIN
  IF (NEW."UserName" IS NULL) THEN
    NEW."UserName" = User;
  IF (NEW."CustomerID" IS NULL) THEN
    NEW."CustomerID" = 0;
  IF (NEW."InAmountVAT" IS NULL) THEN
    NEW."InAmountVAT" = 0;
  IF (NEW."InAmount" IS NULL) THEN
    NEW."InAmount" = 0;
  IF (NEW."OutAmountVAT" IS NULL) THEN
    NEW."OutAmountVAT" = 0;
  IF (NEW."OutAmount" IS NULL) THEN
    NEW."OutAmount" = 0;
  IF (NEW."TotalAmountVAT" IS NULL) THEN
    NEW."TotalAmountVAT" = 0;
  IF (NEW."TotalAmount" IS NULL) THEN
    NEW."TotalAmount" = 0;
  IF (NEW."Pay" IS NULL) THEN
    NEW."Pay" = 0;
END;

/* Перед добавлением новой записи в "Документ": */
/* проставляем "Тип Цен" для конкретного покупателя */
CREATE TRIGGER "Order_BI_2" FOR "Orders"
ACTIVE BEFORE INSERT POSITION 2
AS
DECLARE VARIABLE "CurPriceID" INTEGER;
BEGIN
  IF (NEW."CustomerID" IS NOT NULL) THEN
  BEGIN
    SELECT "PriceID"
    FROM "Customers"
    WHERE ("CustomerID" = NEW."CustomerID")
    INTO :"CurPriceID";
    IF ("CurPriceID" IS NOT NULL) THEN
      NEW."PriceID" = :"CurPriceID";
  END
END;

/* Перед добавлением новой записи в "Документ": */
/* если Расход: проставляем "Номер" */
CREATE TRIGGER "Order_BI_3" FOR "Orders"
ACTIVE BEFORE INSERT POSITION 3
AS
DECLARE VARIABLE "CurYear" INTEGER;
DECLARE VARIABLE "Maximum" INTEGER;
BEGIN
  "CurYear" = EXTRACT (YEAR FROM NEW."Date");
  IF (("CurYear" IS NOT NULL) AND (NEW."ProperID" = 1)) THEN
  BEGIN
    SELECT MAX(CAST("Number" AS INTEGER))
    FROM "Orders"
    WHERE ("FirmID" = NEW."FirmID") AND (EXTRACT (YEAR FROM "Date") = :"CurYear") AND ("ProperID" = 1)
    INTO :"Maximum";
    IF ("Maximum" IS NOT NULL) THEN
      NEW."Number" = :"Maximum" + 1;
    ELSE
      NEW."Number" = 1;
  END
END;

/* Перед изменением записи в "Документ": */
/* если изменен склад Прихода, то: */
CREATE TRIGGER "Order_BU_0" FOR "Orders"
ACTIVE BEFORE UPDATE POSITION 0
AS
DECLARE VARIABLE "StoreID" INTEGER;
DECLARE VARIABLE "DivisionID" INTEGER;
DECLARE VARIABLE "Qty" NUMERIC(9,3);
BEGIN
  IF (OLD."InDivisionID" <> NEW."InDivisionID") THEN
  BEGIN
    FOR
      SELECT "StoreID", "Qty"
      FROM "Structure"
      WHERE ("OrderID" = NEW."OrderID")
      INTO :"StoreID", :"Qty"
    DO
    BEGIN
      UPDATE "StoreQty"
        SET "Qty" = "Qty" - :"Qty"
        WHERE ("StoreID" = :"StoreID") AND ("DivisionID" = OLD."InDivisionID");
      SELECT "DivisionID"
      FROM "StoreQty"
      WHERE ("StoreID" = :"StoreID") AND ("DivisionID" = NEW."InDivisionID")
      INTO :"DivisionID";
      IF (:"DivisionID" IS NOT NULL) THEN
        UPDATE "StoreQty"
          SET "Qty" = "Qty" + :"Qty"
          WHERE ("StoreID" = :"StoreID") AND ("DivisionID" = NEW."InDivisionID");
      ELSE
        INSERT INTO "StoreQty" ("StoreID", "Qty", "DivisionID")
          VALUES(:"StoreID", :"Qty", NEW."InDivisionID");
    END
  END
END;

/* Перед изменением записи в "Документ": */
/* если изменен склад Расхода, то: */
CREATE TRIGGER "Order_BU_1" FOR "Orders"
ACTIVE BEFORE UPDATE POSITION 1
AS
DECLARE VARIABLE "StoreID" INTEGER;
DECLARE VARIABLE "DivisionID" INTEGER;
DECLARE VARIABLE "Qty" NUMERIC(9,3);
BEGIN
  IF (OLD."OutDivisionID" <> NEW."OutDivisionID") THEN
  BEGIN
    FOR
      SELECT "StoreID", "Qty"
      FROM "Structure"
      WHERE ("OrderID" = NEW."OrderID")
      INTO :"StoreID", :"Qty"
    DO
    BEGIN
      UPDATE "StoreQty"
        SET "Qty" = "Qty" + :"Qty"
        WHERE ("StoreID" = :"StoreID") AND ("DivisionID" = OLD."OutDivisionID");
      SELECT "DivisionID"
      FROM "StoreQty"
      WHERE ("StoreID" = :"StoreID") AND ("DivisionID" = NEW."OutDivisionID")
      INTO :"DivisionID";
      IF (:"DivisionID" IS NOT NULL) THEN
        UPDATE "StoreQty"
          SET "Qty" = "Qty" - :"Qty"
          WHERE ("StoreID" = :"StoreID") AND ("DivisionID" = NEW."OutDivisionID");
      ELSE
        INSERT INTO "StoreQty" ("StoreID", "Qty", "DivisionID")
          VALUES(:"StoreID", :"Qty", NEW."OutDivisionID");
    END
  END
END;

/* Перед удалением записи в "Документ": */
/* сперва удаляем строки "Состава" Документа (взаместо ON DELETE CASCADE) */
CREATE TRIGGER "Order_BD_0" FOR "Orders"
ACTIVE BEFORE DELETE POSITION 0
AS
BEGIN
  DELETE
  FROM "Structure"
  WHERE ("OrderID" = OLD."OrderID");
END;

/* После добавления новой записи в "Документ": */
/* ищем запись по данному "Клиенту" и "Фирме" в таблице "Баланс", */
/* и если не находим таковой, то создаем оную в таблице "Баланс" */
CREATE TRIGGER "Order_AI_0" FOR "Orders"
ACTIVE AFTER INSERT POSITION 0
AS
DECLARE VARIABLE "CustomerDebt" NUMERIC(15,2);
BEGIN
  IF (NEW."CustomerID" IS NOT NULL) THEN
  BEGIN
    SELECT "Debt"
    FROM "Balance"
    WHERE ("FirmID" = NEW."FirmID") AND ("CustomerID" = NEW."CustomerID")
    INTO :"CustomerDebt";
    IF ("CustomerDebt" IS NULL) THEN
      INSERT INTO "Balance" ("FirmID", "CustomerID", "Debt")
        VALUES(NEW."FirmID", NEW."CustomerID", 0);
    ELSE
    BEGIN
      IF (NEW."ProperID" = 0) THEN
        UPDATE "Balance"
        SET "Debt" = "Debt" - NEW."TotalAmount"
        WHERE ("FirmID" = NEW."FirmID") AND ("CustomerID" = NEW."CustomerID");
      IF ((NEW."ProperID" = 1) OR (NEW."ProperID" = 2)) THEN
        UPDATE "Balance"
        SET "Debt" = "Debt" + NEW."TotalAmount"
        WHERE ("FirmID" = NEW."FirmID") AND ("CustomerID" = NEW."CustomerID");
    END
  END
END;

/* После изменения записи в "Документе", если изменен "Тип Цен", то: */
/* меняем все цены в "Составе" Документа */
CREATE TRIGGER "Order_AU_0" FOR "Orders"
ACTIVE AFTER UPDATE POSITION 0
AS
DECLARE VARIABLE "Price" NUMERIC(9,2);
BEGIN
  IF (NEW."PriceID" <> OLD."PriceID") THEN
  FOR
    SELECT "Price"
    FROM "Structure"
    WHERE ("OrderID" = NEW."OrderID")
    INTO :"Price"
  DO
    UPDATE "Structure"
      SET "Price" = (SELECT "Price"
                     FROM "Prices"
                     WHERE ("PriceID" = NEW."PriceID") AND
                           ("StoreID" = "Structure"."StoreID"))
      WHERE ("OrderID" = NEW."OrderID");
END;

/* После изменения записи в "Документе": */
/* проставляем сумму в "Долг" в таблице "Баланс" */
CREATE TRIGGER "Order_AU_1" FOR "Orders"
ACTIVE AFTER UPDATE POSITION 1
AS
DECLARE VARIABLE "CustomerDebt" NUMERIC(15,2);
BEGIN
  IF (NEW."ProperID" = 0) THEN
  BEGIN
    UPDATE "Balance"
    SET "Debt" = "Debt" + OLD."TotalAmount"
    WHERE ("FirmID" = OLD."FirmID") AND ("CustomerID" = OLD."CustomerID");
    SELECT "Debt"
    FROM "Balance"
    WHERE ("FirmID" = NEW."FirmID") AND ("CustomerID" = NEW."CustomerID")
    INTO :"CustomerDebt";
    IF ("CustomerDebt" IS NULL) THEN
      INSERT INTO "Balance" ("FirmID", "CustomerID", "Debt")
      VALUES(NEW."FirmID", NEW."CustomerID", 0);
    UPDATE "Balance"
    SET "Debt" = "Debt" - NEW."TotalAmount"
    WHERE ("FirmID" = NEW."FirmID") AND ("CustomerID" = NEW."CustomerID");
  END
  IF ((NEW."ProperID" = 1) OR (NEW."ProperID" = 2)) THEN
  BEGIN
    UPDATE "Balance"
    SET "Debt" = "Debt" - OLD."TotalAmount"
    WHERE ("FirmID" = OLD."FirmID") AND ("CustomerID" = OLD."CustomerID");
    SELECT "Debt"
    FROM "Balance"
    WHERE ("FirmID" = NEW."FirmID") AND ("CustomerID" = NEW."CustomerID")
    INTO :"CustomerDebt";
    IF ("CustomerDebt" IS NULL) THEN
      INSERT INTO "Balance" ("FirmID", "CustomerID", "Debt")
      VALUES(NEW."FirmID", NEW."CustomerID", 0);
    UPDATE "Balance"
    SET "Debt" = "Debt" + NEW."TotalAmount"
    WHERE ("FirmID" = NEW."FirmID") AND ("CustomerID" = NEW."CustomerID");
  END
END;

/* После удаления записи в "Документе": */
/* изменяем сумму "Долг" в таблице "Баланс". Это я убрал потому, что срабатывает триггер на UPDATE после каскадного удаления строк.
CREATE TRIGGER "Order_AD_0" FOR "Orders"
ACTIVE AFTER DELETE POSITION 0
AS
BEGIN
  IF (OLD."ProperID" = 0) THEN
    UPDATE "Balance"
    SET "Debt" = "Debt" + OLD."TotalAmount"
    WHERE ("FirmID" = OLD."FirmID") AND ("CustomerID" = OLD."CustomerID");
  IF ((OLD."ProperID" = 1) OR (OLD."ProperID" = 2)) THEN
    UPDATE "Balance"
    SET "Debt" = "Debt" - OLD."TotalAmount"
    WHERE ("FirmID" = OLD."FirmID") AND ("CustomerID" = OLD."CustomerID");
END; */

/* Перед добавлением новой записи в "Составе" Документа */
/* просчитываем Сумму товара, Сумму НДС и Цену без НДС */
CREATE TRIGGER "Structure_BI_0" FOR "Structure"
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW."PriceNonVAT" IS NULL) THEN
  BEGIN
    NEW."Amount" = NEW."Price" * NEW."Qty";
    NEW."AmountVAT" = NEW."Amount" * NEW."VATRate" / (100 + NEW."VATRate");
    NEW."PriceNonVAT" = (NEW."Amount" - NEW."AmountVAT") / NEW."Qty";
  END
  ELSE
  BEGIN
    NEW."Price" = NEW."PriceNonVAT" * (1 + NEW."VATRate" / 100);
    NEW."Amount" = NEW."PriceNonVAT" * (1 + NEW."VATRate" / 100) * NEW."Qty";
    NEW."AmountVAT" = NEW."Amount" - NEW."PriceNonVAT" * NEW."Qty";
  END
END;

/* Перед добавлением новой записи в "Состав" Документа: */
/* если Расход: из "Остатка" на "Складе" отнимаем количество выписанного товара */
CREATE TRIGGER "Structure_BI_1" FOR "Structure"
ACTIVE BEFORE INSERT POSITION 1
AS
DECLARE VARIABLE "DivisionID" INTEGER;
BEGIN
  IF (NEW."Type" = 1) THEN
  BEGIN
    SELECT "OutDivisionID"
    FROM "Orders"
    WHERE ("OrderID" = NEW."OrderID")
    INTO :"DivisionID";
    IF ("DivisionID" IS NOT NULL) THEN
      UPDATE "StoreQty"
        SET "Qty" = "Qty" - NEW."Qty"
        WHERE ("StoreID" = NEW."StoreID") AND ("DivisionID" = :"DivisionID");
  END
END;

/* Перед добавлением новой записи в "Состав" Документа: */
/* если Приход: создаем "Партию" на "Складе" и проставляем в "Составе" */
CREATE TRIGGER "Structure_BI_2" FOR "Structure"
ACTIVE BEFORE INSERT POSITION 2
AS
DECLARE VARIABLE "StoreID" INTEGER;
BEGIN
  IF (NEW."Type" = -1) THEN
  BEGIN
    INSERT INTO "Store" ("ProductID", "AccountPrice")
      VALUES(NEW."ProductID", NEW."Price");
    SELECT MAX("StoreID")
    FROM "Store"
    INTO :"StoreID";
    NEW."StoreID" = :"StoreID";
  END
END;

/* Перед добавлением новой записи в "Состав" Документа: */
/* если Приход: создаем новый "Остаток" */
CREATE TRIGGER "Structure_BI_3" FOR "Structure"
ACTIVE BEFORE INSERT POSITION 3
AS
DECLARE VARIABLE "DivisionID" INTEGER;
BEGIN
  IF (NEW."Type" = -1) THEN
  BEGIN
    SELECT "InDivisionID"
    FROM "Orders"
    WHERE ("OrderID" = NEW."OrderID")
    INTO :"DivisionID";
    INSERT INTO "StoreQty" ("StoreID", "Qty", "DivisionID")
      VALUES(NEW."StoreID", NEW."Qty", :"DivisionID");
  END
END;

/* Перед добавлением новой записи в "Состав" Документа: */
/* если "Переброска" */
CREATE TRIGGER "Structure_BI_4" FOR "Structure"
ACTIVE BEFORE INSERT POSITION 4
AS
DECLARE VARIABLE "OutDivisionID" INTEGER;
DECLARE VARIABLE "InDivisionID" INTEGER;
DECLARE VARIABLE "Qty" NUMERIC(9,3);
BEGIN
  IF (NEW."Type" = 0) THEN
  BEGIN
    SELECT "OutDivisionID", "InDivisionID"
    FROM "Orders"
    WHERE ("OrderID" = NEW."OrderID")
    INTO :"OutDivisionID", :"InDivisionID";
    IF (:"OutDivisionID" IS NOT NULL) THEN
      UPDATE "StoreQty"
        SET "Qty" = "Qty" - NEW."Qty"
        WHERE ("StoreID" = NEW."StoreID") AND ("DivisionID" = :"OutDivisionID");
    SELECT "Qty"
    FROM "StoreQty"
    WHERE ("StoreID" = NEW."StoreID") AND ("DivisionID" = :"InDivisionID")
    INTO :"Qty";
    IF (:"Qty" IS NOT NULL) THEN
      UPDATE "StoreQty"
        SET "Qty" = "Qty" + NEW."Qty"
        WHERE ("StoreID" = NEW."StoreID") AND ("DivisionID" = :"InDivisionID");
    ELSE
    INSERT INTO "StoreQty" ("StoreID", "Qty", "DivisionID")
      VALUES(NEW."StoreID", NEW."Qty", :"InDivisionID");
  END
END;

/* Перед добавлением новой записи в "Состав" Документа: */
/* если не указана цена, берем из справочника "Цен"
CREATE TRIGGER "Structure_BI_4" FOR "Structure"
ACTIVE BEFORE INSERT POSITION 4
AS
DECLARE VARIABLE "Price" NUMERIC(9,2);
BEGIN
  IF (NEW."StoreID" IS NOT NULL) THEN
  BEGIN
    SELECT "Price"
    FROM "Prices"
    WHERE ("ProductID" = NEW."ProductID") AND ("StoreID" = NEW."StoreID") AND
          ("PriceID" = (SELECT "PriceID"
                        FROM "Orders"
                        WHERE "OrderID" = NEW."OrderID"))
    INTO :"Price";
    IF (NEW."Price" IS NULL) THEN
      NEW."Price" = :"Price";
  END
END; */

/* Перед изменением записи в "Составе" Документа */
/* пересчитываем Сумму товара, Сумму НДС и Цену без НДС */
CREATE TRIGGER "Structure_BU_0" FOR "Structure"
ACTIVE BEFORE UPDATE POSITION 0
AS
BEGIN
  IF (NEW."PriceNonVAT" IS NULL) THEN
  BEGIN
    NEW."Amount" = NEW."Price" * NEW."Qty";
    NEW."AmountVAT" = NEW."Amount" * NEW."VATRate" / (100 + NEW."VATRate");
    NEW."PriceNonVAT" = (NEW."Amount" - NEW."AmountVAT") / NEW."Qty";
  END
  ELSE
  BEGIN
    NEW."Price" = NEW."PriceNonVAT" * (1 + NEW."VATRate" / 100);
    NEW."Amount" = NEW."PriceNonVAT" * (1 + NEW."VATRate" / 100) * NEW."Qty";
    NEW."AmountVAT" = NEW."Amount" - NEW."PriceNonVAT" * NEW."Qty";
  END
END;

/* Перед изменением записи в "Составе" Документа, */
/* если "Расход": к Остатку на "Складе" прибавляем старое Количество "Товара" и отнимаем новое */
CREATE TRIGGER "Structure_BU_1" FOR "Structure"
ACTIVE BEFORE UPDATE POSITION 1
AS
DECLARE VARIABLE "DivisionID" INTEGER;
BEGIN
  IF (NEW."Type" = 1) THEN
  BEGIN
    SELECT "OutDivisionID"
    FROM "Orders"
    WHERE ("OrderID" = NEW."OrderID")
    INTO :"DivisionID";
    UPDATE "StoreQty"
      SET "Qty" = "Qty" + OLD."Qty"
      WHERE ("StoreID" = OLD."StoreID") AND ("DivisionID" = :"DivisionID");
    UPDATE "StoreQty"
      SET "Qty" = "Qty" - NEW."Qty"
      WHERE ("StoreID" = NEW."StoreID") AND ("DivisionID" = :"DivisionID");
  END
END;

/* Перед изменением записи в "Состав" Документа: */
/* если Приход:  */
CREATE TRIGGER "Structure_BU_2" FOR "Structure"
ACTIVE BEFORE UPDATE POSITION 2
AS
DECLARE VARIABLE "StoreID" INTEGER;
BEGIN
  IF (NEW."Type" = -1) THEN
  BEGIN
    IF (NEW."ProductID" = OLD."ProductID") THEN
      UPDATE "Store"
        SET "AccountPrice" = NEW."Price"
        WHERE "StoreID" = NEW."StoreID";
    ELSE
    BEGIN
      DELETE
      FROM "Store"
      WHERE "StoreID" = OLD."StoreID";
      INSERT INTO "Store" ("ProductID", "AccountPrice")
        VALUES(NEW."ProductID", NEW."Price");
      SELECT MAX("StoreID")
      FROM "Store"
      INTO :"StoreID";
      NEW."StoreID" = :"StoreID";
    END
  END
END;

/* Перед изменением записи в "Составе" Документа, */
/* если "Приход": к Начальному и Остатку на "Складе" прибавляем новое Количество "Товара" и отнимаем старое */
CREATE TRIGGER "Structure_BU_3" FOR "Structure"
ACTIVE BEFORE UPDATE POSITION 3
AS
DECLARE VARIABLE "DivisionID" INTEGER;
DECLARE VARIABLE "Qty" NUMERIC(9,3);
BEGIN
  IF (NEW."Type" = -1) THEN
  BEGIN
    SELECT "InDivisionID"
    FROM "Orders"
    WHERE ("OrderID" = NEW."OrderID")
    INTO :"DivisionID";
    UPDATE "StoreQty"
      SET "Qty" = "Qty" - OLD."Qty"
      WHERE ("StoreID" = OLD."StoreID") AND ("DivisionID" = :"DivisionID");
    SELECT "Qty"
    FROM "StoreQty"
    WHERE ("StoreID" = NEW."StoreID") AND ("DivisionID" = :"DivisionID")
    INTO :"Qty";
    IF (:"Qty" IS NOT NULL) THEN
      UPDATE "StoreQty"
        SET "Qty" = "Qty" + NEW."Qty"
        WHERE ("StoreID" = NEW."StoreID") AND ("DivisionID" = :"DivisionID");
    ELSE
    INSERT INTO "StoreQty" ("StoreID", "Qty", "DivisionID")
      VALUES(NEW."StoreID", NEW."Qty", :"DivisionID");
  END
END;

/* Перед изменением записи в "Составе" Документа: */
/* если "Переброска": то */
CREATE TRIGGER "Structure_BU_4" FOR "Structure"
ACTIVE BEFORE UPDATE POSITION 4
AS
DECLARE VARIABLE "OutDivisionID" INTEGER;
DECLARE VARIABLE "InDivisionID" INTEGER;
DECLARE VARIABLE "Qty" NUMERIC(9,3);
BEGIN
  IF (OLD."Type" = 0) THEN
  BEGIN
    SELECT "OutDivisionID", "InDivisionID"
    FROM "Orders"
    WHERE ("OrderID" = OLD."OrderID")
    INTO :"OutDivisionID", :"InDivisionID";
    IF (:"InDivisionID" IS NOT NULL) THEN
      UPDATE "StoreQty"
        SET "Qty" = "Qty" - OLD."Qty"
        WHERE ("StoreID" = OLD."StoreID") AND ("DivisionID" = :"InDivisionID");
    SELECT "Qty"
    FROM "StoreQty"
    WHERE ("StoreID" = OLD."StoreID") AND ("DivisionID" = :"OutDivisionID")
    INTO :"Qty";
    IF (:"Qty" IS NOT NULL) THEN
      UPDATE "StoreQty"
        SET "Qty" = "Qty" + OLD."Qty"
        WHERE ("StoreID" = OLD."StoreID") AND ("DivisionID" = :"OutDivisionID");
    ELSE
    INSERT INTO "StoreQty" ("StoreID", "Qty", "DivisionID")
      VALUES(OLD."StoreID", OLD."Qty", :"OutDivisionID");
    SELECT "OutDivisionID", "InDivisionID"
    FROM "Orders"
    WHERE ("OrderID" = NEW."OrderID")
    INTO :"OutDivisionID", :"InDivisionID";
    IF (:"OutDivisionID" IS NOT NULL) THEN
      UPDATE "StoreQty"
        SET "Qty" = "Qty" - NEW."Qty"
        WHERE ("StoreID" = NEW."StoreID") AND ("DivisionID" = :"OutDivisionID");
    SELECT "Qty"
    FROM "StoreQty"
    WHERE ("StoreID" = NEW."StoreID") AND ("DivisionID" = :"InDivisionID")
    INTO :"Qty";
    IF (:"Qty" IS NOT NULL) THEN
      UPDATE "StoreQty"
        SET "Qty" = "Qty" + NEW."Qty"
        WHERE ("StoreID" = NEW."StoreID") AND ("DivisionID" = :"InDivisionID");
    ELSE
    INSERT INTO "StoreQty" ("StoreID", "Qty", "DivisionID")
      VALUES(NEW."StoreID", NEW."Qty", :"InDivisionID");
  END
END;

/* Перед удалением записи из "Состава" Документа: */
/* если "Расход": Количество отписанного Товара возвращаем на "Склад" */
CREATE TRIGGER "Structure_BD_0" FOR "Structure"
ACTIVE BEFORE DELETE POSITION 0
AS
DECLARE VARIABLE "DivisionID" INTEGER;
BEGIN
  IF (OLD."Type" = 1) THEN
  BEGIN
    SELECT "OutDivisionID"
    FROM "Orders"
    WHERE ("OrderID" = OLD."OrderID")
    INTO :"DivisionID";
    UPDATE "StoreQty"
      SET "Qty" = "Qty" + OLD."Qty"
      WHERE ("StoreID" = OLD."StoreID") AND ("DivisionID" = :"DivisionID");
  END
END;

/* Перед удалением записи из "Состава" Документа: */
/* если "Приход": Количество оприходованного Товара удаляем со "Склад"
CREATE TRIGGER "Structure_BD_1" FOR "Structure"
ACTIVE BEFORE DELETE POSITION 1
AS
DECLARE VARIABLE "DivisionID" INTEGER;
BEGIN
  IF (OLD."Type" = -1) THEN
  BEGIN
    SELECT "InDivisionID"
    FROM "Orders"
    WHERE ("OrderID" = OLD."OrderID")
    INTO :"DivisionID";
    UPDATE "StoreQty"
      SET "Qty" = "Qty" - OLD."Qty"
      WHERE ("ProductID" = OLD."ProductID") AND ("StoreID" = OLD."StoreID") AND ("DivisionID" = :"DivisionID");
  END
END; */

/* Перед удалением записи из "Состава" Документа: */
/* если "Переброска": */
CREATE TRIGGER "Structure_BD_1" FOR "Structure"
ACTIVE BEFORE DELETE POSITION 1
AS
DECLARE VARIABLE "OutDivisionID" INTEGER;
DECLARE VARIABLE "InDivisionID" INTEGER;
DECLARE VARIABLE "Qty" NUMERIC(9,3);
BEGIN
  IF (OLD."Type" = 0) THEN
  BEGIN
    SELECT "OutDivisionID", "InDivisionID"
    FROM "Orders"
    WHERE ("OrderID" = OLD."OrderID")
    INTO :"OutDivisionID", :"InDivisionID";
    IF (:"InDivisionID" IS NOT NULL) THEN
      UPDATE "StoreQty"
        SET "Qty" = "Qty" - OLD."Qty"
        WHERE ("StoreID" = OLD."StoreID") AND ("DivisionID" = :"InDivisionID");
    SELECT "Qty"
    FROM "StoreQty"
    WHERE ("StoreID" = OLD."StoreID") AND ("DivisionID" = :"OutDivisionID")
    INTO :"Qty";
    IF (:"Qty" IS NOT NULL) THEN
      UPDATE "StoreQty"
        SET "Qty" = "Qty" + OLD."Qty"
        WHERE ("StoreID" = OLD."StoreID") AND ("DivisionID" = :"OutDivisionID");
    ELSE
    INSERT INTO "StoreQty" ("StoreID", "Qty", "DivisionID")
      VALUES(OLD."StoreID", OLD."Qty", :"OutDivisionID");
  END
END;

/* После добавления новой записи в "Состав" Документа */
/* пересчитываем Суммы Прихода и Расхода "Документа" */
CREATE TRIGGER "Structure_AI_0" FOR "Structure"
ACTIVE AFTER INSERT POSITION 0
AS
DECLARE VARIABLE "InSumma" NUMERIC(15,2);
DECLARE VARIABLE "InSummaVAT" NUMERIC(15,2);
DECLARE VARIABLE "OutSumma" NUMERIC(15,2);
DECLARE VARIABLE "OutSummaVAT" NUMERIC(15,2);
DECLARE VARIABLE "Summa" NUMERIC(15,2);
DECLARE VARIABLE "SummaVAT" NUMERIC(15,2);
BEGIN
  IF (NEW."Type" = -1) THEN
  BEGIN
    SELECT SUM("Amount"), SUM("AmountVAT")
    FROM "Structure"
    WHERE ("OrderID" = NEW."OrderID") AND ("Type" = -1)
    INTO :"InSumma", :"InSummaVAT";
    IF ("InSumma" IS NULL) THEN
      "InSumma" = 0;
    IF ("InSummaVAT" IS NULL) THEN
      "InSummaVAT" = 0;
    UPDATE "Orders"
      SET "InAmount" = :"InSumma",
          "InAmountVAT" = :"InSummaVAT"
      WHERE ("OrderID" = NEW."OrderID");
  END
  IF (NEW."Type" = 1) THEN
  BEGIN
    SELECT SUM("Amount"), SUM("AmountVAT")
    FROM "Structure"
    WHERE ("OrderID" = NEW."OrderID") AND ("Type" = 1)
    INTO :"OutSumma", :"OutSummaVAT";
    IF ("OutSumma" IS NULL) THEN
      "OutSumma" = 0;
    IF ("OutSummaVAT" IS NULL) THEN
      "OutSummaVAT" = 0;
    UPDATE "Orders"
      SET "OutAmount" = :"OutSumma",
          "OutAmountVAT" = :"OutSummaVAT"
      WHERE ("OrderID" = NEW."OrderID");
  END
  IF (NEW."Type" = 0) THEN
  BEGIN
    SELECT SUM("Amount"), SUM("AmountVAT")
    FROM "Structure"
    WHERE ("OrderID" = NEW."OrderID") AND ("Type" = 0)
    INTO :"Summa", :"SummaVAT";
    IF ("Summa" IS NULL) THEN
      "Summa" = 0;
    IF ("SummaVAT" IS NULL) THEN
      "SummaVAT" = 0;
    UPDATE "Orders"
      SET "InAmount" = :"Summa",
          "InAmountVAT" = :"SummaVAT",
          "OutAmount" = :"Summa",
          "OutAmountVAT" = :"SummaVAT"
      WHERE ("OrderID" = NEW."OrderID");
  END
END;

/* После добавления новой записи в "Состав" Документа */
/* пересчитываем общую Сумму "Документа" */
CREATE TRIGGER "Structure_AI_1" FOR "Structure"
ACTIVE AFTER INSERT POSITION 1
AS
DECLARE VARIABLE "Summa" NUMERIC(15,2);
DECLARE VARIABLE "SummaVAT" NUMERIC(15,2);
BEGIN
  SELECT SUM("Amount" * "Type"), SUM("AmountVAT" * "Type")
  FROM "Structure"
  WHERE ("OrderID" = NEW."OrderID")
  INTO :"Summa", :"SummaVAT";
  IF ("Summa" IS NULL) THEN
    "Summa" = 0;
  IF ("SummaVAT" IS NULL) THEN
    "SummaVAT" = 0;
  IF ("Summa" < 0) THEN
    "Summa" = "Summa" * (-1);
  IF ("SummaVAT" < 0) THEN
    "SummaVAT" = "SummaVAT" * (-1);
  UPDATE "Orders"
    SET "TotalAmount" = :"Summa",
        "TotalAmountVAT" = :"SummaVAT"
    WHERE ("OrderID" = NEW."OrderID");
END;

/* После изменения новой записи в "Состав" Документа */
/* пересчитываем Суммы Прихода и Расхода "Документа" */
CREATE TRIGGER "Structure_AU_0" FOR "Structure"
ACTIVE AFTER UPDATE POSITION 0
AS
DECLARE VARIABLE "InSumma" NUMERIC(15,2);
DECLARE VARIABLE "InSummaVAT" NUMERIC(15,2);
DECLARE VARIABLE "OutSumma" NUMERIC(15,2);
DECLARE VARIABLE "OutSummaVAT" NUMERIC(15,2);
DECLARE VARIABLE "Summa" NUMERIC(15,2);
DECLARE VARIABLE "SummaVAT" NUMERIC(15,2);
BEGIN
  IF (NEW."Type" = -1) THEN
  BEGIN
    SELECT SUM("Amount"), SUM("AmountVAT")
    FROM "Structure"
    WHERE ("OrderID" = NEW."OrderID") AND ("Type" = -1)
    INTO :"InSumma", :"InSummaVAT";
    IF ("InSumma" IS NULL) THEN
      "InSumma" = 0;
    IF ("InSummaVAT" IS NULL) THEN
      "InSummaVAT" = 0;
    UPDATE "Orders"
      SET "InAmount" = :"InSumma",
          "InAmountVAT" = :"InSummaVAT"
      WHERE ("OrderID" = NEW."OrderID");
  END
  IF (NEW."Type" = 1) THEN
  BEGIN
    SELECT SUM("Amount"), SUM("AmountVAT")
    FROM "Structure"
    WHERE ("OrderID" = NEW."OrderID") AND ("Type" = 1)
    INTO :"OutSumma", :"OutSummaVAT";
    IF ("OutSumma" IS NULL) THEN
      "OutSumma" = 0;
    IF ("OutSummaVAT" IS NULL) THEN
      "OutSummaVAT" = 0;
    UPDATE "Orders"
      SET "OutAmount" = :"OutSumma",
          "OutAmountVAT" = :"OutSummaVAT"
      WHERE ("OrderID" = NEW."OrderID");
  END
  IF (NEW."Type" = 0) THEN
  BEGIN
    SELECT SUM("Amount"), SUM("AmountVAT")
    FROM "Structure"
    WHERE ("OrderID" = NEW."OrderID") AND ("Type" = 0)
    INTO :"Summa", :"SummaVAT";
    IF ("Summa" IS NULL) THEN
      "Summa" = 0;
    IF ("SummaVAT" IS NULL) THEN
      "SummaVAT" = 0;
    UPDATE "Orders"
      SET "InAmount" = :"Summa",
          "InAmountVAT" = :"SummaVAT",
          "OutAmount" = :"Summa",
          "OutAmountVAT" = :"SummaVAT"
      WHERE ("OrderID" = NEW."OrderID");
  END
END;

/* После изменения записи в "Составе" Документа: */
/* пересчитываем общую Сумму "Документа" */
CREATE TRIGGER "Structure_AU_1" FOR "Structure"
ACTIVE AFTER UPDATE POSITION 1
AS
DECLARE VARIABLE "Summa" NUMERIC(15,2);
DECLARE VARIABLE "SummaVAT" NUMERIC(15,2);
BEGIN
  SELECT SUM("Amount" * "Type"), SUM("AmountVAT" * "Type")
  FROM "Structure"
  WHERE ("OrderID" = NEW."OrderID")
  INTO :"Summa", :"SummaVAT";
  IF ("Summa" IS NULL) THEN
    "Summa" = 0;
  IF ("SummaVAT" IS NULL) THEN
    "SummaVAT" = 0;
  IF ("Summa" < 0) THEN
    "Summa" = "Summa" * (-1);
  IF ("SummaVAT" < 0) THEN
    "SummaVAT" = "SummaVAT" * (-1);
  UPDATE "Orders"
    SET "TotalAmount" = :"Summa",
        "TotalAmountVAT" = :"SummaVAT"
    WHERE ("OrderID" = NEW."OrderID");
END;

/* После удаления новой записи в "Состав" Документа */
/* пересчитываем Суммы Прихода и Расхода "Документа" */
CREATE TRIGGER "Structure_AD_0" FOR "Structure"
ACTIVE AFTER DELETE POSITION 0
AS
DECLARE VARIABLE "InSumma" NUMERIC(15,2);
DECLARE VARIABLE "InSummaVAT" NUMERIC(15,2);
DECLARE VARIABLE "OutSumma" NUMERIC(15,2);
DECLARE VARIABLE "OutSummaVAT" NUMERIC(15,2);
DECLARE VARIABLE "Summa" NUMERIC(15,2);
DECLARE VARIABLE "SummaVAT" NUMERIC(15,2);
BEGIN
  IF (OLD."Type" = -1) THEN
  BEGIN
    SELECT SUM("Amount"), SUM("AmountVAT")
    FROM "Structure"
    WHERE ("OrderID" = OLD."OrderID") AND ("Type" = -1)
    INTO :"InSumma", :"InSummaVAT";
    IF ("InSumma" IS NULL) THEN
      "InSumma" = 0;
    IF ("InSummaVAT" IS NULL) THEN
      "InSummaVAT" = 0;
    UPDATE "Orders"
      SET "InAmount" = :"InSumma",
          "InAmountVAT" = :"InSummaVAT"
      WHERE ("OrderID" = OLD."OrderID");
  END
  IF (OLD."Type" = 1) THEN
  BEGIN
    SELECT SUM("Amount"), SUM("AmountVAT")
    FROM "Structure"
    WHERE ("OrderID" = OLD."OrderID") AND ("Type" = 1)
    INTO :"OutSumma", :"OutSummaVAT";
    IF ("OutSumma" IS NULL) THEN
      "OutSumma" = 0;
    IF ("OutSummaVAT" IS NULL) THEN
      "OutSummaVAT" = 0;
    UPDATE "Orders"
      SET "OutAmount" = :"OutSumma",
          "OutAmountVAT" = :"OutSummaVAT"
      WHERE ("OrderID" = OLD."OrderID");
  END
  IF (OLD."Type" = 0) THEN
  BEGIN
    SELECT SUM("Amount"), SUM("AmountVAT")
    FROM "Structure"
    WHERE ("OrderID" = OLD."OrderID") AND ("Type" = 0)
    INTO :"Summa", :"SummaVAT";
    IF ("Summa" IS NULL) THEN
      "Summa" = 0;
    IF ("SummaVAT" IS NULL) THEN
      "SummaVAT" = 0;
    UPDATE "Orders"
      SET "InAmount" = :"Summa",
          "InAmountVAT" = :"SummaVAT",
          "OutAmount" = :"Summa",
          "OutAmountVAT" = :"SummaVAT"
      WHERE ("OrderID" = OLD."OrderID");
  END
END;

/* После удаления записи в "Составе" Документа: */
/* пересчитываем общую Сумму "Документа" */
CREATE TRIGGER "Structure_AD_1" FOR "Structure"
ACTIVE AFTER DELETE POSITION 1
AS
DECLARE VARIABLE "Summa" NUMERIC(15,2);
DECLARE VARIABLE "SummaVAT" NUMERIC(15,2);
BEGIN
  SELECT SUM("Amount" * "Type"), SUM("AmountVAT" * "Type")
  FROM "Structure"
  WHERE ("OrderID" = OLD."OrderID")
  INTO :"Summa", :"SummaVAT";
  IF ("Summa" IS NULL) THEN
    "Summa" = 0;
  IF ("SummaVAT" IS NULL) THEN
    "SummaVAT" = 0;
  IF ("Summa" < 0) THEN
    "Summa" = "Summa" * (-1);
  IF ("SummaVAT" < 0) THEN
    "SummaVAT" = "SummaVAT" * (-1);
  UPDATE "Orders"
    SET "TotalAmount" = :"Summa",
        "TotalAmountVAT" = :"SummaVAT"
    WHERE ("OrderID" = OLD."OrderID");
END;

/* После удаления записи в "Составе" Документа: */
/* если "Приход", то удаляем запись из "Склада" */
CREATE TRIGGER "Structure_AD_2" FOR "Structure"
ACTIVE AFTER DELETE POSITION 2
AS
BEGIN
  IF (OLD."Type" = -1) THEN
    DELETE
    FROM "Store"
    WHERE "StoreID" = OLD."StoreID";
END;

/* Перед добавлением новой записи в таблицу "Оплата" Документа: */
/* устанавливаем значение "Оплата", равный Нулю; */
/* устанавливаем значение "Остаток Оплаты", равный "Начальному" */
CREATE TRIGGER "Payment_BI_1" FOR "Payments"
ACTIVE BEFORE INSERT POSITION 1
AS
BEGIN
  IF (NEW."UserName" IS NULL) THEN
    NEW."UserName" = User;
  IF (NEW."TotalPay" IS NULL) THEN
    NEW."TotalPay" = 0;
END;

/* Перед добавлением новой записи в таблицу "Оплата" Документа: */
/* если Наличка: проставляем "Номер" */
CREATE TRIGGER "Payment_BI_2" FOR "Payments"
ACTIVE BEFORE INSERT POSITION 2
AS
DECLARE VARIABLE "CurYear" INTEGER;
DECLARE VARIABLE "Maximum" INTEGER;
BEGIN
  "CurYear" = EXTRACT (YEAR FROM NEW."Date");
  IF (("CurYear" IS NOT NULL) AND (NEW."Cash" = 1)) THEN
  BEGIN
    IF (NEW."Type" = 1) THEN
      SELECT MAX(CAST("Number" AS INTEGER))
      FROM "Payments"
      WHERE ("FirmID" = NEW."FirmID") AND (EXTRACT (YEAR FROM "Date") = :"CurYear") AND ("Cash" = 1) AND ("Type" = 1)
      INTO :"Maximum";
    ELSE
      SELECT MAX(CAST("Number" AS INTEGER))
      FROM "Payments"
      WHERE ("FirmID" = NEW."FirmID") AND (EXTRACT (YEAR FROM "Date") = :"CurYear") AND ("Cash" = 1) AND ("Type" = -1)
      INTO :"Maximum";
    IF ("Maximum" IS NOT NULL) THEN
      NEW."Number" = :"Maximum" + 1;
    ELSE
      NEW."Number" = 1;
  END
END;

/* Перед добавлением новой записи в таблицу "Оплата" Документа: */
/* если Наличка и Приход: проставляем Дебет 50 */
CREATE TRIGGER "Payment_BI_3" FOR "Payments"
ACTIVE BEFORE INSERT POSITION 3
AS
BEGIN
  IF ((NEW."Cash" = 1) AND (NEW."Type" = -1)) THEN
  BEGIN
    IF (NEW."Debit" IS NULL) THEN
      NEW."Debit" = 50;
  END
END;

/* После добавления новой записи в "Оплату Документа": */
/* к Сумме оплаты "Документа" прибавляем Оплату */
CREATE TRIGGER "Payment_AI_0" FOR "Payments"
ACTIVE AFTER INSERT POSITION 0
AS
DECLARE VARIABLE "Summa" NUMERIC(15,2);
DECLARE VARIABLE "OrderID" INTEGER;
DECLARE VARIABLE "Debt" NUMERIC(15,2);
BEGIN
  IF (NEW."OrderID" IS NOT NULL) THEN
  BEGIN
    INSERT INTO "PayOrders" ("PaymentID", "OrderID", "Pay")
      VALUES(NEW."PaymentID", NEW."OrderID", NEW."TotalPay");
  END
  ELSE
  BEGIN
    "Summa" = NEW."TotalPay";
    FOR
      SELECT "OrderID", "Debt"
      FROM "Orders"
      WHERE "FirmID" = NEW."FirmID" AND "CustomerID" = NEW."CustomerID" AND "Debt" > 0
      ORDER BY "Date"
      INTO :"OrderID", :"Debt"
    DO
    BEGIN
      IF ("Summa" > :"Debt") THEN
      BEGIN
        INSERT INTO "PayOrders" ("PaymentID", "OrderID", "Pay")
          VALUES(NEW."PaymentID", :"OrderID", :"Debt");
        "Summa" = "Summa" - "Debt";
      END
      ELSE
      BEGIN
        INSERT INTO "PayOrders" ("PaymentID", "OrderID", "Pay")
          VALUES(NEW."PaymentID", :"OrderID", :"Summa");
        "Summa" = 0;
      END
    END
  END
END;

/* После добавления новой записи в "Оплата Документа": */
/* ищем запись по данному "Клиенту" и "Фирме" в таблице "Баланс", */
/* и если не находим таковой, то создаем оную в таблице "Баланс" */
CREATE TRIGGER "Payment_AI_1" FOR "Payments"
ACTIVE AFTER INSERT POSITION 1
AS
DECLARE VARIABLE "PayDebt" NUMERIC(15,2);
BEGIN
  SELECT "Debt"
  FROM "Balance"
  WHERE ("FirmID" = NEW."FirmID") AND ("CustomerID" = NEW."CustomerID")
  INTO :"PayDebt";
  IF ("PayDebt" IS NULL) THEN
    INSERT INTO "Balance" ("FirmID", "CustomerID", "Debt")
    VALUES(NEW."FirmID", NEW."CustomerID", 0);
  IF (NEW."Type" = -1) THEN
    UPDATE "Balance"
    SET "Debt" = "Debt" - NEW."TotalPay"
    WHERE ("FirmID" = NEW."FirmID") AND ("CustomerID" = NEW."CustomerID");
  IF (NEW."Type" = 1) THEN
    UPDATE "Balance"
    SET "Debt" = "Debt" + NEW."TotalPay"
    WHERE ("FirmID" = NEW."FirmID") AND ("CustomerID" = NEW."CustomerID");
END;

/* После изменения записи в "Оплате" Документа: */
/* от Суммы оплаты "Документа" отнимаем Сумму старой записи и прибавляем Сумму новой */
CREATE TRIGGER "Payment_AU_0" FOR "Payments"
ACTIVE AFTER UPDATE POSITION 0
AS
DECLARE VARIABLE "Summa" NUMERIC(15,2);
DECLARE VARIABLE "OrderID" INTEGER;
DECLARE VARIABLE "Debt" NUMERIC(15,2);
BEGIN
  IF (NEW."TotalPay" <> OLD."TotalPay") THEN
  BEGIN
    IF (NEW."OrderID" IS NOT NULL) THEN
    BEGIN
      UPDATE "PayOrders"
        SET "Pay" = "Pay" - OLD."TotalPay" + NEW."TotalPay"
        WHERE ("PaymentID" = NEW."PaymentID") AND
              ("OrderID" = NEW."OrderID");
    END
    ELSE
    BEGIN
      DELETE
      FROM "PayOrders"
      WHERE ("PaymentID" = OLD."PaymentID") AND
            ("OrderID" = OLD."OrderID");
      "Summa" = NEW."TotalPay";
      FOR
        SELECT "OrderID", "Debt"
        FROM "Orders"
        WHERE "FirmID" = NEW."FirmID" AND "CustomerID" = NEW."CustomerID" AND "Debt" > 0
        ORDER BY "Date"
        INTO :"OrderID", :"Debt"
      DO
      BEGIN
        IF ("Summa" > :"Debt") THEN
        BEGIN
          INSERT INTO "PayOrders" ("PaymentID", "OrderID", "Pay")
            VALUES(NEW."PaymentID", :"OrderID", :"Debt");
          "Summa" = "Summa" - "Debt";
        END
        ELSE
        BEGIN
          INSERT INTO "PayOrders" ("PaymentID", "OrderID", "Pay")
            VALUES(NEW."PaymentID", :"OrderID", :"Summa");
          "Summa" = 0;
        END
      END
    END
  END
END;

/* После изменения записи в таблице "Оплата Документа": */
/* проставляем сумму в "Долг" в таблице "Баланс" */
CREATE TRIGGER "Payment_AU_1" FOR "Payments"
ACTIVE AFTER UPDATE POSITION 1
AS
DECLARE VARIABLE "PayDebt" NUMERIC(15,2);
BEGIN
  SELECT "Debt"
  FROM "Balance"
  WHERE ("FirmID" = NEW."FirmID") AND ("CustomerID" = NEW."CustomerID")
  INTO :"PayDebt";
  IF ("PayDebt" IS NULL) THEN
    INSERT INTO "Balance" ("FirmID", "CustomerID", "Debt")
    VALUES(NEW."FirmID", NEW."CustomerID", 0);
  IF (OLD."Type" = -1) THEN
  BEGIN
    UPDATE "Balance"
    SET "Debt" = "Debt" + OLD."TotalPay"
    WHERE ("FirmID" = OLD."FirmID") AND ("CustomerID" = OLD."CustomerID");
  END
  IF (OLD."Type" = 1) THEN
  BEGIN
    UPDATE "Balance"
    SET "Debt" = "Debt" - OLD."TotalPay"
    WHERE ("FirmID" = OLD."FirmID") AND ("CustomerID" = OLD."CustomerID");
  END
  IF (NEW."Type" = -1) THEN
  BEGIN
    UPDATE "Balance"
    SET "Debt" = "Debt" - NEW."TotalPay"
    WHERE ("FirmID" = NEW."FirmID") AND ("CustomerID" = NEW."CustomerID");
  END
  IF (NEW."Type" = 1) THEN
  BEGIN
    UPDATE "Balance"
    SET "Debt" = "Debt" + NEW."TotalPay"
    WHERE ("FirmID" = NEW."FirmID") AND ("CustomerID" = NEW."CustomerID");
  END
END;

/* После удаления записи в таблице "Оплата Документа": */
/* изменяем сумму "Долг" в таблице "Баланс" */
CREATE TRIGGER "Payment_AD_0" FOR "Payments"
ACTIVE AFTER DELETE POSITION 0
AS
BEGIN
  IF (OLD."Type" = -1) THEN
    UPDATE "Balance"
    SET "Debt" = "Debt" + OLD."TotalPay"
    WHERE ("FirmID" = OLD."FirmID") AND ("CustomerID" = OLD."CustomerID");
  IF (OLD."Type" = 1) THEN
    UPDATE "Balance"
    SET "Debt" = "Debt" - OLD."TotalPay"
    WHERE ("FirmID" = OLD."FirmID") AND ("CustomerID" = OLD."CustomerID");
END;

/* После добавления новой записи в таблицу "Оплата по Документам": */
/* к Сумме оплаты "Документа" прибавляем Оплату */
CREATE TRIGGER "PayOrders_AI_0" FOR "PayOrders"
ACTIVE AFTER INSERT POSITION 0
AS
BEGIN
  IF (NEW."Pay" IS NOT NULL) THEN
  BEGIN
    UPDATE "Orders"
      SET "Pay" = "Pay" + NEW."Pay"
      WHERE "OrderID" = NEW."OrderID";
  END
END;

/* После добавления новой записи в таблицу "Оплата по Документам": */
/* из Остатка "Оплаты Документа" вычитаем Оплату
CREATE TRIGGER "PayOrders_AI_1" FOR "PayOrders"
ACTIVE AFTER INSERT POSITION 1
AS
BEGIN
  IF (NEW."Pay" IS NOT NULL) THEN
  BEGIN
    UPDATE "Payments"
      SET "RemainPay" = "RemainPay" - NEW."Pay"
      WHERE "PaymentID" = NEW."PaymentID";
  END
END; */

/* После изменения записи в таблицу "Оплата по Документам": */
/* от Суммы оплаты "Документа" отнимаем Сумму старой записи и прибавляем Сумму новой */
CREATE TRIGGER "PayOrders_AU_0" FOR "PayOrders"
ACTIVE AFTER UPDATE POSITION 0
AS
BEGIN
  IF (NEW."Pay" IS NOT NULL) THEN
  BEGIN
    UPDATE "Orders"
      SET "Pay" = "Pay" - OLD."Pay" + NEW."Pay"
      WHERE "OrderID" = NEW."OrderID";
  END
END;

/* После изменения записи в таблицу "Оплата по Документам": */
/* к Остатку "Оплаты Документа" прибавляем Сумму старой записи и вычитаем Сумму новой
CREATE TRIGGER "PayOrders_AU_1" FOR "PayOrders"
ACTIVE AFTER UPDATE POSITION 1
AS
BEGIN
  IF (NEW."Pay" IS NOT NULL) THEN
  BEGIN
    UPDATE "Payments"
      SET "RemainPay" = "RemainPay" + OLD."Pay" - NEW."Pay"
      WHERE "PaymentID" = NEW."PaymentID";
  END
END; */

/* После удаления записи в таблицу "Оплата по Документам": */
/* от Суммы оплаты "Документа" отнимаем Оплату старой записи */
CREATE TRIGGER "PayOrders_AD_0" FOR "PayOrders"
ACTIVE AFTER DELETE POSITION 0
AS
BEGIN
  IF (OLD."Pay" IS NOT NULL) THEN
  BEGIN
    UPDATE "Orders"
      SET "Pay" = "Pay" - OLD."Pay"
      WHERE "OrderID" = OLD."OrderID";
  END
END;

/* После удаления записи в таблицу "Оплата по Документам": */
/* к Остатку "Оплаты Документа" прибавляем Оплату старой записи
CREATE TRIGGER "PayOrders_AD_1" FOR "PayOrders"
ACTIVE AFTER DELETE POSITION 1
AS
BEGIN
  IF (OLD."Pay" IS NOT NULL) THEN
  BEGIN
    UPDATE "Payments"
      SET "RemainPay" = "RemainPay" + OLD."Pay"
      WHERE "PaymentID" = OLD."PaymentID";
  END
END; */

/* Перед добавлением новой записи в "Кассовая книга": */
/* проставляем текущую "Дату" */
CREATE TRIGGER "CashBook_BI_1" FOR "CashBook"
ACTIVE BEFORE INSERT POSITION 1
AS
BEGIN
  IF (NEW."Date" IS NULL) THEN
    NEW."Date" = 'Now';
END;

/* Перед добавлением новой записи в "Кассовая книга": */
/* проставляем "Номер" и "Сумму на начало" */
CREATE TRIGGER "CashBook_BI_2" FOR "CashBook"
ACTIVE BEFORE INSERT POSITION 2
AS
DECLARE VARIABLE "CurYear" INTEGER;
DECLARE VARIABLE "Maximum" INTEGER;
DECLARE VARIABLE "TransitAmount" NUMERIC(15,2);
BEGIN
  "CurYear" = EXTRACT (YEAR FROM NEW."Date");
  IF ("CurYear" IS NOT NULL) THEN
  BEGIN
    SELECT MAX("Number")
    FROM "CashBook"
    WHERE ("FirmID" = NEW."FirmID") AND (EXTRACT (YEAR FROM "Date") = :"CurYear")
    INTO :"Maximum";
    IF ("Maximum" IS NOT NULL) THEN
      NEW."Number" = :"Maximum" + 1;
    ELSE
      NEW."Number" = 1;
    SELECT "FinalAmount"
    FROM "CashBook"
    WHERE ("FirmID" = NEW."FirmID") AND (EXTRACT (YEAR FROM "Date") = :"CurYear") AND ("Number" = :"Maximum")
    INTO "TransitAmount";
    IF ("TransitAmount" IS NOT NULL) THEN
      NEW."InitialAmount" = :"TransitAmount";
    ELSE
      NEW."InitialAmount" = 0;
  END
END;

/* Перед добавлением новой записи в "Кассовая книга": */
/* проставляем "Номер" и "Сумму на начало" */
CREATE TRIGGER "CashBook_BI_3" FOR "CashBook"
ACTIVE BEFORE INSERT POSITION 3
AS
DECLARE VARIABLE "AmountPay" NUMERIC(15,2);
BEGIN
  SELECT SUM("TotalPay" * (-1 * "Type"))
  FROM "Payments"
  WHERE ("FirmID" = NEW."FirmID") AND ("Date" = NEW."Date") AND ("Cash" = 1)
  INTO :"AmountPay";
  IF ("AmountPay" IS NOT NULL) THEN
    NEW."FinalAmount" = NEW."InitialAmount" + :"AmountPay";
  ELSE
    NEW."FinalAmount" = NEW."InitialAmount";
END;

/* Перед добавлением новой записи в "Кассовая книга": */
/* проставляем Код страницы Кассовой книги в Приходные(расходные) Ордера */
CREATE TRIGGER "CashBook_BI_4" FOR "CashBook"
ACTIVE BEFORE INSERT POSITION 4
AS
BEGIN
  IF (NEW."PageID" IS NOT NULL) THEN
  BEGIN
    UPDATE "Payments"
      SET "PageID" = NEW."PageID"
      WHERE ("FirmID" = NEW."FirmID") AND ("Date" = NEW."Date") AND ("Cash" = 1);
  END
END;



/* Перед удалением записи в таблице "Даты для Партий" */
/* если запись НЕ последняя, то вызываем исключение */
CREATE TRIGGER "DateStore_BD_0" FOR "DateStore"
ACTIVE BEFORE DELETE POSITION 0
AS
DECLARE VARIABLE "MaxDateID" INTEGER;
BEGIN
  SELECT MAX("DateID")
  FROM "DateStore"
  INTO :"MaxDateID";
  IF (OLD."DateID" < "MaxDateID") THEN
    EXCEPTION "Non_Delete";
END;



/******************************************************************************/
/****                          Stored Procedures                           ****/
/******************************************************************************/


/* Процедура выбора НДС для "Группы" на дату */
ALTER PROCEDURE "Category_VATRate"(
    "WorkDate" DATE
    )
RETURNS (
    "CategoryID" INTEGER,
    "CategoryName" VARCHAR(84),
    "Date" DATE,
    "VATRateName" VARCHAR(84),
    "VATRate" NUMERIC(4,2)
    )
AS
BEGIN
  FOR
    SELECT "CategoryID", "CategoryName"
    FROM "Categories"
    INTO :"CategoryID", :"CategoryName"
  DO
  BEGIN
    SELECT MAX("Date")
    FROM "VAT"
    WHERE ("VAT"."CategoryID" = :"CategoryID") AND ("VAT"."Date" <= :"WorkDate")
    INTO :"Date";
    IF ("Date" IS NOT NULL) THEN
      SELECT "VAT"."Date", "VATRates"."VATRateName", "VATRates"."VATRate"
      FROM "VAT", "VATRates"
      WHERE ("VAT"."CategoryID" = :"CategoryID") AND ("VAT"."Date" = :"Date") AND ("VATRates"."VATRateID" = "VAT"."VATRateID")
      INTO :"Date", :"VATRateName", :"VATRate";
    ELSE
    BEGIN
      "Date" = '01.01.1980';
      "VATRateName" = 'Без НДС';
      "VATRate" = 0;
    END
    SUSPEND;
  END
END;

/* Процедура выбора Должников на дату */
ALTER PROCEDURE "Customer_Debtor"(
    "MainFirm" INTEGER,
    "WorkDate" DATE,
    "Arrear" INTEGER
    )
RETURNS (
    "CustomerID" INTEGER,
    "CustomerName" VARCHAR(84),
    "InitialDebt" NUMERIC(15,2),
    "SumDebt" NUMERIC(15,2)
    )
AS
DECLARE VARIABLE "Summa" NUMERIC(15,2);
BEGIN
  FOR
    SELECT "CustomerID", "CustomerName"
    FROM "Customers"
    INTO :"CustomerID", :"CustomerName"
  DO
  BEGIN
    "InitialDebt" = 0;
    SELECT "InitialBalance"."Debt"
    FROM "InitialBalance"
    WHERE ("InitialBalance"."FirmID" = :"MainFirm") AND ("InitialBalance"."CustomerID" = :"CustomerID")
    INTO :"InitialDebt";
    "SumDebt" = "InitialDebt";
    IF ("Arrear" = 1) THEN
      SELECT SUM("Orders"."TotalAmount")
      FROM "Orders"
      WHERE ("Orders"."FirmID" = :"MainFirm") AND ("Orders"."CustomerID" = :"CustomerID") AND ("Orders"."ProperID" IN (1, 2, 3)) AND ("Orders"."PayDate" < :"WorkDate")
      INTO :"Summa";
    ELSE
      SELECT SUM("Orders"."TotalAmount")
      FROM "Orders"
      WHERE ("Orders"."FirmID" = :"MainFirm") AND ("Orders"."CustomerID" = :"CustomerID") AND ("Orders"."ProperID" IN (1, 2, 3)) AND ("Orders"."Date" <= :"WorkDate")
      INTO :"Summa";
    IF ("Summa" IS NULL) THEN
      "Summa" = 0;
    "SumDebt" = "SumDebt" + "Summa";
    IF ("Arrear" = 1) THEN
      SELECT SUM("Orders"."TotalAmount")
      FROM "Orders"
      WHERE ("Orders"."FirmID" = :"MainFirm") AND ("Orders"."CustomerID" = :"CustomerID") AND ("Orders"."ProperID" IN (0, 4)) AND ("Orders"."PayDate" < :"WorkDate")
      INTO :"Summa";
    ELSE
      SELECT SUM("Orders"."TotalAmount")
      FROM "Orders"
      WHERE ("Orders"."FirmID" = :"MainFirm") AND ("Orders"."CustomerID" = :"CustomerID") AND ("Orders"."ProperID" IN (0, 4)) AND ("Orders"."Date" <= :"WorkDate")
      INTO :"Summa";
    IF ("Summa" IS NULL) THEN
      "Summa" = 0;
    "SumDebt" = "SumDebt" - "Summa";
    SELECT SUM("Payments"."TotalPay" * "Payments"."Type")
    FROM "Payments"
    WHERE ("Payments"."FirmID" = :"MainFirm") AND ("Payments"."CustomerID" = :"CustomerID") AND ("Payments"."Date" <= :"WorkDate")
    INTO :"Summa";
    IF ("Summa" IS NULL) THEN
      "Summa" = 0;
    "SumDebt" = "SumDebt" + "Summa";
    IF ("SumDebt" <> 0) THEN
      SUSPEND;
  END
END;

/* Процедура выбора Долга по Накладной на дату */
ALTER PROCEDURE "Debtor_Order"(
    "MainFirm" INTEGER,
    "WorkDate" DATE,
    "Arrear" INTEGER
    )
RETURNS (
    "OrderID" INTEGER,
    "Date" DATE,
    "Number" VARCHAR(10),
    "CustomerID" INTEGER,
    "TotalAmount" NUMERIC(15,2),
    "PayDate" DATE,
    "Pay" NUMERIC(15,2),
    "Debt" NUMERIC(15,2),
    "ProperID" INTEGER
    )
AS
BEGIN
  IF ("Arrear" = 1) THEN
  FOR
    SELECT "OrderID", "Date", "Number", "CustomerID", "TotalAmount", "PayDate", "ProperID"
    FROM "Orders"
    WHERE ("Orders"."FirmID" = :"MainFirm") AND ("Orders"."ProperID" IN (0, 1)) AND ("Orders"."PayDate" < :"WorkDate")
    INTO :"OrderID", :"Date", :"Number", :"CustomerID", :"TotalAmount", :"PayDate", :"ProperID"
  DO
  BEGIN
    SELECT SUM("PayOrders"."Pay")
    FROM "PayOrders"
    WHERE ("PayOrders"."OrderID" = :"OrderID") AND ("PayOrders"."PaymentID" IN (SELECT "PaymentID" FROM "Payments" WHERE "Payments"."Date" <= :"WorkDate"))
    INTO :"Pay";
    IF ("Pay" IS NULL) THEN
      "Pay" = 0;
    "Debt" = "TotalAmount" - "Pay";
    IF ("Debt" <> 0) THEN
      SUSPEND;
  END
  ELSE
  FOR
    SELECT "OrderID", "Date", "Number", "CustomerID", "TotalAmount", "PayDate", "ProperID"
    FROM "Orders"
    WHERE ("Orders"."FirmID" = :"MainFirm") AND ("Orders"."ProperID" IN (0, 1)) AND ("Orders"."Date" <= :"WorkDate")
    INTO :"OrderID", :"Date", :"Number", :"CustomerID", :"TotalAmount", :"PayDate", :"ProperID"
  DO
  BEGIN
    SELECT SUM("PayOrders"."Pay")
    FROM "PayOrders"
    WHERE ("PayOrders"."OrderID" = :"OrderID") AND ("PayOrders"."PaymentID" IN (SELECT "PaymentID" FROM "Payments" WHERE "Payments"."Date" <= :"WorkDate"))
    INTO :"Pay";
    IF ("Pay" IS NULL) THEN
      "Pay" = 0;
    "Debt" = "TotalAmount" - "Pay";
    IF ("Debt" <> 0) THEN
      SUSPEND;
  END
END;

/* Процедура выборки для "Оборотно-сальдовой ведомости" */
ALTER PROCEDURE "Store_Qty"(
    "MainFirm" INTEGER,
    "TopDate" DATE,
    "BottomDate" DATE
    )
RETURNS (
    "StoreID" INTEGER,
    "ProductID" INTEGER,
    "AccountPrice" NUMERIC(15,2),
    "ProductFullName" VARCHAR(84),
    "DivisionID" INTEGER,
    "TopQty" NUMERIC(9,3),
    "TopAmount" NUMERIC(15,2),
    "ReceiptQty" NUMERIC(9,3),
    "ReceiptAmount" NUMERIC(15,2),
    "ExpenseQty" NUMERIC(9,3),
    "ExpenseAmount" NUMERIC(15,2),
    "BottomQty" NUMERIC(9,3),
    "BottomAmount" NUMERIC(15,2)
    )
AS
DECLARE VARIABLE "PrevDateID" INTEGER;
DECLARE VARIABLE "PrevDate" DATE;
DECLARE VARIABLE "PrevQty" NUMERIC(9,3);
BEGIN
  SELECT MAX("Date")
  FROM "DateStore"
  WHERE ("Date" <= :"TopDate")
  INTO :"PrevDate";
  SELECT "DateID"
  FROM "DateStore"
  WHERE ("Date" = :"PrevDate")
  INTO :"PrevDateID";
  FOR
    SELECT "StoreID","ProductID", "AccountPrice"
    FROM "Store"
    INTO :"StoreID", :"ProductID", :"AccountPrice"
  DO
  BEGIN
    SELECT "Categories"."CategoryName" || ' ' || "Products"."ProductName" AS "ProductFullName"
    FROM "Products", "Categories"
    WHERE ("Products"."ProductID" = :"ProductID") AND ("Categories"."CategoryID" = "Products"."CategoryID")
    INTO :"ProductFullName";
    FOR
      SELECT "DivisionID"
      FROM "Divisions"
      WHERE "CustomerID" = :"MainFirm"
      INTO :"DivisionID"
    DO
    BEGIN
      "TopQty" = 0;
      SELECT "Qty"
      FROM "StoreQtyDate"
      WHERE ("StoreID" = :"StoreID") AND ("DivisionID" = :"DivisionID") AND ("DateID" = :"PrevDateID")
      INTO :"TopQty";
      SELECT SUM("Qty" * "Type")
      FROM "Structure"
      WHERE ("StoreID" = :"StoreID") AND ("OrderID" IN (SELECT "OrderID" FROM "Orders" WHERE ("Date" >= :"PrevDate" AND "Date" < :"TopDate") AND ("InDivisionID" = :"DivisionID" OR "OutDivisionID" = :"DivisionID")))
      INTO :"PrevQty";
      IF ("PrevQty" IS NOT NULL) THEN
        "TopQty" = "TopQty" - "PrevQty";
      SELECT SUM("Qty")
      FROM "Structure"
      WHERE ("StoreID" = :"StoreID") AND ("Type" = -1) AND ("OrderID" IN (SELECT "OrderID" FROM "Orders" WHERE ("Date" >= :"TopDate" AND "Date" <= :"BottomDate") AND ("InDivisionID" = :"DivisionID" OR "OutDivisionID" = :"DivisionID")))
      INTO :"ReceiptQty";
      IF ("ReceiptQty" IS NULL) THEN
        "ReceiptQty" = 0;
      SELECT SUM("Qty")
      FROM "Structure"
      WHERE ("StoreID" = :"StoreID") AND ("Type" = 1) AND ("OrderID" IN (SELECT "OrderID" FROM "Orders" WHERE ("Date" >= :"TopDate" AND "Date" <= :"BottomDate") AND ("InDivisionID" = :"DivisionID" OR "OutDivisionID" = :"DivisionID")))
      INTO :"ExpenseQty";
      IF ("ExpenseQty" IS NULL) THEN
        "ExpenseQty" = 0;
      IF (("TopQty" > 0) OR ("ReceiptQty" > 0) OR ("ExpenseQty" > 0)) THEN
      BEGIN
        "BottomQty" = "TopQty" + "ReceiptQty" - "ExpenseQty";
        "TopAmount" = "AccountPrice" * "TopQty";
        "ReceiptAmount" = "AccountPrice" * "ReceiptQty";
        "ExpenseAmount" = "AccountPrice" * "ExpenseQty";
        "BottomAmount" = "AccountPrice" * "BottomQty";
        SUSPEND;
      END
    END
  END
END;

/* Процедура переноса Остатков с одной Даты на другую Дату */
ALTER PROCEDURE "Store_Qty_Date"(
    "MainFirm" INTEGER,
    "TopDate" DATE,
    "BottomDate" DATE
    )
AS
DECLARE VARIABLE "StoreID" INTEGER;
DECLARE VARIABLE "DivisionID" INTEGER;
DECLARE VARIABLE "PrevDateID" INTEGER;
DECLARE VARIABLE "NextDateID" INTEGER;
DECLARE VARIABLE "TopQty" NUMERIC(9,3);
DECLARE VARIABLE "SumQty" NUMERIC(9,3);
DECLARE VARIABLE "BottomQty" NUMERIC(9,3);
BEGIN
  SELECT "DateID"
  FROM "DateStore"
  WHERE ("Date" = :"TopDate")
  INTO :"PrevDateID";
  SELECT "DateID"
  FROM "DateStore"
  WHERE ("Date" = :"BottomDate")
  INTO :"NextDateID";
  IF ("NextDateID" IS NOT NULL) THEN
    DELETE FROM "DateStore"
    WHERE "DateID" = :"NextDateID";
  INSERT INTO "DateStore"("Date")
  VALUES(:"BottomDate");
  SELECT "DateID"
  FROM "DateStore"
  WHERE ("Date" = :"BottomDate")
  INTO :"NextDateID";
  FOR
    SELECT "StoreID"
    FROM "Store"
    INTO :"StoreID"
  DO
  BEGIN
    FOR
      SELECT "DivisionID"
      FROM "Divisions"
      WHERE "CustomerID" = :"MainFirm"
      INTO :"DivisionID"
    DO
    BEGIN
      "TopQty" = 0;
      SELECT "Qty"
      FROM "StoreQtyDate"
      WHERE ("StoreID" = :"StoreID") AND ("DivisionID" = :"DivisionID") AND ("DateID" = :"PrevDateID")
      INTO :"TopQty";
      IF ("TopQty" IS NOT NULL) THEN
        "BottomQty" = "TopQty";
      SELECT SUM("Qty")
      FROM "Structure"
      WHERE ("StoreID" = :"StoreID") AND ("OrderID" IN (SELECT "OrderID" FROM "Orders" WHERE ("Date" >= :"TopDate" AND "Date" < :"BottomDate") AND ("InDivisionID" = :"DivisionID")))
      INTO :"SumQty";
      IF ("SumQty" IS NOT NULL) THEN
        "BottomQty" = "BottomQty" + "SumQty";
      SELECT SUM("Qty")
      FROM "Structure"
      WHERE ("StoreID" = :"StoreID") AND ("OrderID" IN (SELECT "OrderID" FROM "Orders" WHERE ("Date" >= :"TopDate" AND "Date" < :"BottomDate") AND ("OutDivisionID" = :"DivisionID")))
      INTO :"SumQty";
      IF ("SumQty" IS NOT NULL) THEN
        "BottomQty" = "BottomQty" - "SumQty";
      IF ("BottomQty" > 0) THEN
        INSERT INTO "StoreQtyDate"("DateID", "StoreID", "DivisionID", "Qty")
        VALUES(:"NextDateID", :"StoreID", :"DivisionID", :"BottomQty");
    END
  END
END;

/* Процедура выборки для "Остатки по складам" */
ALTER PROCEDURE "Remains_Qty"(
    "MainFirm" INTEGER,
    "DivisionID" INTEGER,
    "PriceID" INTEGER,
    "WokrDate" DATE
    )
RETURNS (
    "StoreID" INTEGER,
    "ProductID" INTEGER,
    "CategoryID" INTEGER,
    "ProductFullName" VARCHAR(84),
    "Pack" SMALLINT,
    "MeasureName" VARCHAR(84),
    "Price" NUMERIC(15,2),
    "TallyQty" NUMERIC(9,3),
    "TallyAmount" NUMERIC(15,2)
    )
AS
DECLARE VARIABLE "MeasureID" INTEGER;
DECLARE VARIABLE "TopQty" NUMERIC(9,3);
DECLARE VARIABLE "PrevDateID" INTEGER;
DECLARE VARIABLE "PrevDate" DATE;
DECLARE VARIABLE "PrevQty" NUMERIC(9,3);
BEGIN
  SELECT MAX("Date")
  FROM "DateStore"
  WHERE ("Date" <= :"WokrDate")
  INTO :"PrevDate";
  SELECT "DateID"
  FROM "DateStore"
  WHERE ("Date" = :"PrevDate")
  INTO :"PrevDateID";
  FOR
    SELECT "StoreID","ProductID"
    FROM "Store"
    INTO :"StoreID", :"ProductID"
  DO
  BEGIN
    SELECT "Categories"."CategoryName" || ' ' || "Products"."ProductName" AS "ProductFullName", "Products"."CategoryID", "Products"."Pack", "Products"."MeasureID"
    FROM "Products", "Categories"
    WHERE ("Products"."ProductID" = :"ProductID") AND ("Categories"."CategoryID" = "Products"."CategoryID")
    INTO :"ProductFullName", :"CategoryID", :"Pack", :"MeasureID";
    SELECT "Price"
    FROM "Prices"
    WHERE ("StoreID" = :"StoreID") AND ("PriceID" = :"PriceID")
    INTO :"Price";
    SELECT "MeasureName"
    FROM "Measures"
    WHERE ("MeasureID" = :"MeasureID")
    INTO :"MeasureName";
    "TallyQty" = 0;
    IF ("DivisionID" IS NULL) THEN
    BEGIN
      FOR
        SELECT "DivisionID"
        FROM "Divisions"
        WHERE "CustomerID" = :"MainFirm"
        INTO :"DivisionID"
      DO
      BEGIN
        "TopQty" = 0;
        "PrevQty" = 0;
        SELECT "Qty"
        FROM "StoreQtyDate"
        WHERE ("StoreID" = :"StoreID") AND ("DivisionID" = :"DivisionID") AND ("DateID" = :"PrevDateID")
        INTO :"TopQty";
        IF ("TopQty" IS NOT NULL) THEN
          "TallyQty" = "TallyQty" + "TopQty";
        SELECT SUM("Qty" * "Type")
        FROM "Structure"
        WHERE ("StoreID" = :"StoreID") AND ("OrderID" IN (SELECT "OrderID" FROM "Orders" WHERE ("Date" >= :"PrevDate" AND "Date" < :"WokrDate") AND ("InDivisionID" = :"DivisionID" OR "OutDivisionID" = :"DivisionID")))
        INTO :"PrevQty";
        IF ("PrevQty" IS NOT NULL) THEN
          "TallyQty" = "TallyQty" - "PrevQty";
      END
      "DivisionID" = Null;
    END
    ELSE
    BEGIN
      "TopQty" = 0;
      "PrevQty" = 0;
      SELECT "Qty"
      FROM "StoreQtyDate"
      WHERE ("StoreID" = :"StoreID") AND ("DivisionID" = :"DivisionID") AND ("DateID" = :"PrevDateID")
      INTO :"TopQty";
      IF ("TopQty" IS NOT NULL) THEN
        "TallyQty" = "TallyQty" + "TopQty";
      SELECT SUM("Qty")
      FROM "Structure"
      WHERE ("StoreID" = :"StoreID") AND ("OrderID" IN (SELECT "OrderID" FROM "Orders" WHERE ("Date" >= :"PrevDate" AND "Date" < :"WokrDate") AND ("InDivisionID" = :"DivisionID")))
      INTO :"PrevQty";
      IF ("PrevQty" IS NOT NULL) THEN
        "TallyQty" = "TallyQty" + "PrevQty";
      SELECT SUM("Qty")
      FROM "Structure"
      WHERE ("StoreID" = :"StoreID") AND ("OrderID" IN (SELECT "OrderID" FROM "Orders" WHERE ("Date" >= :"PrevDate" AND "Date" < :"WokrDate") AND ("OutDivisionID" = :"DivisionID")))
      INTO :"PrevQty";
      IF ("PrevQty" IS NOT NULL) THEN
        "TallyQty" = "TallyQty" - "PrevQty";
    END
    IF ("TallyQty" > 0) THEN
    BEGIN
      "TallyAmount" = "Price" * "TallyQty";
      SUSPEND;
    END
  END
END;



/******************************************************************************/
/****                            Entering Data                             ****/
/******************************************************************************/


/* Заносим данные в таблицу "Виды Документов" */
INSERT INTO "Propers"("ProperName")
VALUES('Приходная накладная');

/* Заносим данные в таблицу "Виды Документов" */
INSERT INTO "Propers"("ProperName")
VALUES('Расходная накладная');

/* Заносим данные в таблицу "Виды Документов" */
INSERT INTO "Propers"("ProperName")
VALUES('Товарный чек');

/* Заносим данные в таблицу "Виды Документов" */
INSERT INTO "Propers"("ProperName")
VALUES('Возврат Поставщику');

/* Заносим данные в таблицу "Виды Документов" */
INSERT INTO "Propers"("ProperName")
VALUES('Возврат от Покупателя');

/* Заносим данные в таблицу "Виды Документов" */
INSERT INTO "Propers"("ProperName")
VALUES('Ввод остатков товаров');

/* Заносим данные в таблицу "Виды Документов" */
INSERT INTO "Propers"("ProperName")
VALUES('Оприходование излишек');

/* Заносим данные в таблицу "Виды Документов" */
INSERT INTO "Propers"("ProperName")
VALUES('Акт списания');

/* Заносим данные в таблицу "Виды Документов" */
INSERT INTO "Propers"("ProperName")
VALUES('Пересорт');

/* Заносим данные в таблицу "Виды Документов" */
INSERT INTO "Propers"("ProperName")
VALUES('Накладная на Перемещение');

/* Заносим "Нулевую" строку в таблицу "" */
INSERT INTO "Banks"("BankName")
VALUES(NULL);

/* Заносим "Нулевую" строку в таблицу "Клиенты" */
INSERT INTO "Customers"("CustomerName")
VALUES(NULL);

/* Заносим "Нулевую" строку в таблицу "" */
INSERT INTO "JobTitles"("JobTitleName")
VALUES(NULL);

/* Заносим "Нулевую" строку в таблицу "" */
INSERT INTO "Groups"("GroupName")
VALUES(NULL);

/* Заносим "Нулевую" строку в таблицу "" */
INSERT INTO "Categories"("CategoryName")
VALUES('');

/* Заносим "Нулевую" строку в таблицу "" */
INSERT INTO "Measures"("MeasureName")
VALUES(NULL);

/* Заносим "Нулевую" строку в таблицу "" */
INSERT INTO "Producers"("ProducerName")
VALUES(NULL);

/* Заносим "Нулевую" строку в таблицу "" */
INSERT INTO "CCD"("CCDName")
VALUES(NULL);

/* Заносим "Нулевую" строку в таблицу "" */
INSERT INTO "Certificates"("CertificateName")
VALUES(NULL);

/* Заносим "Нулевую" строку в таблицу "Страны происхождения" */
INSERT INTO "Countrys"("CountryName")
VALUES(NULL);

/* Заносим строку "Россия" в таблицу "Страны происхождения" */
INSERT INTO "Countrys"("CountryName")
VALUES('Россия');

/* Заносим "Нулевую" строку в таблицу "Типы Цен" */
INSERT INTO "TypePrices"("PriceName")
VALUES(NULL);

/* Заносим строку "Закупная" в таблицу "Типы Цен" */
INSERT INTO "TypePrices"("PriceName", "Markup")
VALUES('Закупочная', '0');

/* Заносим данные в таблицу "Ставки НДС" */
INSERT INTO "VATRates"("VATRateName", "VATRate")
VALUES('Без НДС', '0');

/* Заносим данные в таблицу "Ставки НДС" */
INSERT INTO "VATRates"("VATRateName", "VATRate")
VALUES('НДС 10%', '10');

/* Заносим данные в таблицу "Ставки НДС" */
INSERT INTO "VATRates"("VATRateName", "VATRate")
VALUES('НДС 18%', '18');

/* Заносим данные в таблицу "НДС" */
INSERT INTO "VAT"("CategoryID", "Date", "VATRateID")
VALUES('0', '01.01.1980', '1');

/* Заносим данные в таблицу "Даты для Партий" */
INSERT INTO "DateStore"("Date")
VALUES('01.01.1980');



COMMIT WORK;


