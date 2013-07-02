unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ToolWin, ExtCtrls, FR_Class, FR_Desgn, DateUtils,
  XPMan, IniFiles;

type
  TMainForm = class(TForm)
    StatusBar: TStatusBar;
    MainMenu: TMainMenu;
    MenuFile: TMenuItem;
    MenuConnect: TMenuItem;
    MenuSetarator1: TMenuItem;
    MenuPrintSetup: TMenuItem;
    MenuPrintDlg: TMenuItem;
    MenuSeparator2: TMenuItem;
    MenuExit: TMenuItem;
    MenuDirectory: TMenuItem;
    MenuCustomer: TMenuItem;
    MenuCategory: TMenuItem;
    MenuProduct: TMenuItem;
    MenuDocument: TMenuItem;
    MenuReceiptOrder: TMenuItem;
    MenuExpenseOrder: TMenuItem;
    MenuPayment: TMenuItem;
    MenuSeparator4: TMenuItem;
    MenuStore: TMenuItem;
    MenuReports: TMenuItem;
    MenuPriceList: TMenuItem;
    MenuService: TMenuItem;
    MenuOptions: TMenuItem;
    MenuWindow: TMenuItem;
    MenuCascade: TMenuItem;
    MenuTileHorizontal: TMenuItem;
    MenuTileVertical: TMenuItem;
    MenuSeparator8: TMenuItem;
    MenuClose: TMenuItem;
    MenuHelp: TMenuItem;
    MenuAbout: TMenuItem;
    MenuSeparator5: TMenuItem;
    MenuConvert: TMenuItem;
    PrinterSetupDialog: TPrinterSetupDialog;
    MenuBank: TMenuItem;
    MenuSeparator3: TMenuItem;
    MenuFirm: TMenuItem;
    MenuPaymentCash: TMenuItem;
    MenuPaymentBank: TMenuItem;
    Timer1: TTimer;
    MenuTools: TMenuItem;
    MenuFastRerort: TMenuItem;
    frReport1: TfrReport;
    MenuCalc: TMenuItem;
    MenuPrice: TMenuItem;
    MenuSeparator9: TMenuItem;
    MenuRegistration: TMenuItem;
    MenuSeparator6: TMenuItem;
    MenuDebtor: TMenuItem;
    MenuSeparator7: TMenuItem;
    MenuCashBook: TMenuItem;
    MenuRemain: TMenuItem;
    MenuRemainCredit: TMenuItem;
    MenuRemainGoods: TMenuItem;
    MenuCirculate: TMenuItem;
    MenuRemains: TMenuItem;
    MenuCommodityMoney: TMenuItem;
    MenuRevise: TMenuItem;
    MenuInterval: TMenuItem;
    frDesigner1: TfrDesigner;
    MItdesigner: TMenuItem;
    N1: TMenuItem;
    ODlg1: TOpenDialog;
    frReport2: TfrReport;
    XPManifest1: TXPManifest;
    N2: TMenuItem;
    MenuSQLMonitor: TMenuItem;
    procedure EnabledMenuItems;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormResize(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure MenuExitClick(Sender: TObject);
    procedure MenuPrintSetupClick(Sender: TObject);
    procedure MenuAboutClick(Sender: TObject);
    procedure MenuOptionsClick(Sender: TObject);
    procedure MenuConnectClick(Sender: TObject);
    procedure MenuCascadeClick(Sender: TObject);
    procedure MenuTileHorizontalClick(Sender: TObject);
    procedure MenuTileVerticalClick(Sender: TObject);
    procedure MenuCloseClick(Sender: TObject);
    procedure MenuCustomerClick(Sender: TObject);
    procedure MenuCategoryClick(Sender: TObject);
    procedure MenuProductClick(Sender: TObject);
    procedure MenuReceiptOrderClick(Sender: TObject);
    procedure MenuExpenseOrderClick(Sender: TObject);
    procedure MenuPaymentCashClick(Sender: TObject);
    procedure MenuPaymentBankClick(Sender: TObject);
    procedure MenuConvertClick(Sender: TObject);
    procedure MenuStoreClick(Sender: TObject);
    procedure MenuBankClick(Sender: TObject);
    procedure MenuFirmClick(Sender: TObject);
    procedure MenuFastRerortClick(Sender: TObject);
    procedure MenuCalcClick(Sender: TObject);
    procedure MenuPriceListClick(Sender: TObject);
    procedure MenuPriceClick(Sender: TObject);
    procedure MenuRegistrationClick(Sender: TObject);
    procedure MenuDebtorClick(Sender: TObject);
    procedure MenuCashBookClick(Sender: TObject);
    procedure MenuRemainCreditClick(Sender: TObject);
    procedure MenuRemainGoodsClick(Sender: TObject);
    procedure MenuCirculateClick(Sender: TObject);
    procedure MenuRemainsClick(Sender: TObject);
    procedure MenuCommodityMoneyClick(Sender: TObject);
    procedure MenuReviseClick(Sender: TObject);
    procedure MenuIntervalClick(Sender: TObject);
    procedure MItdesignerClick(Sender: TObject);
    procedure MenuSQLMonitorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  KeyName: String;
  Key: String;
  NonReg: String = '';

implementation

uses Registry, StoreDM, About, Registration, Options, IntervalSelect, Login, FirstAid,
     Firm, Customer, Bank, Product, Category, BuyOrder, Store, SaleOrder,
     PaymentCash, PaymentBank, HomeOrder, InitialBalance, InitialRemains,
     ReportPriceList, ReportPrice, ReportDebtor, ReportDebtorSelect,
     ReportRemains, ReportCirculate, ReportCirculateSelect, ReportCashBook,
     ReportCommodityMoney, ReportRevise, Coding, SQLMonitorForm;

{$R *.dfm}

procedure TMainForm.EnabledMenuItems;
begin
  if (MainFirm = 0) or (MainDivision = 0) then
  begin
    MenuDocument.Enabled := False;
    MenuReports.Enabled := False;
  end
  else
  begin
    MenuDocument.Enabled := True;
    MenuReports.Enabled := True;
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);

begin
  Caption := '...';
 // IniFile:=TIniFile.Create('store.cfg');
//Присваиваем Переменным дат текущие значения
  TopDate := DateToStr(StartOfAMonth(YearOf(Now), MonthOf(Now)));
  BottomDate := DateToStr(EndOfAMonth(YearOf(Now), MonthOf(Now)));

{Временно отключено....
 При обратном включении надо будет
 отключить в IBDataBase ВСЁ....  }

  with TLoginForm.Create(nil) do
  try
    ShowModal;
    if ModalResult <> mrOk then
      Application.Terminate;
  finally
    Free;
  end;
{}

{
Если включен предыдущий кусок, то этот надо отключить...
}
 { with StoreDataModule do
  begin
    FirmSelectQuery.Open;
    FirmSelectQuery.Locate('CustomerID', MainFirm, []);
    if (FirmName <> FirmSelectQuery['CustomerName']) or (Key <> Code(FirmSelectQuery.FieldByName('INN').AsString)) then
    begin
      NonReg := ' - не зарегистрировано';
      Application.MessageBox('Пожалуйста, зарегистрируйтесь.',
        'Предупреждение', mb_IconWarning);
    end;
    if (MainFirm <> FirmSelectQuery['CustomerID']) and (FirmName <> FirmSelectQuery['CustomerName']) then
    begin
      MainFirm := 0;
      FirmName := '';
      MainDivision := 0;
      MainPrice := 0;
      RetailCustomerID := 0;
    end;
    FirmSelectQuery.Close;
  end;
  Caption := 'Склад - ' + FirmName +
//             ' (' + StoreDataModule.DataBase.Params.Values['user_name'] + ')' +
             NonReg;
//Влкючаем\Отключаем "Меню" Докуметнтов и Отчетов
  EnabledMenuItems;     }
{}
end;

// Прекращение работы приложения
procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if StoreDataModule.Database.Connected then
    StoreDataModule.Database.Close;
  Application.Terminate;
end;

// Подтверждение завершения работы с программой
procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
{
Временно отключено....

  Application.Restore;
  if Application.MessageBox('Вы действительно хотите завершить работу с программой?',
    'Завершение работы',
    mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
    CanClose := True
  else
    CanClose := False;
{}
end;

//
procedure TMainForm.FormResize(Sender: TObject);
begin
  StatusBar.Panels[0].Width := MainForm.ClientWidth -
    StatusBar.Panels[1].Width - StatusBar.Panels[2].Width;
end;

//Если таблица "Фирмы" пустая, вызываем форму "Первой Помощи"
procedure TMainForm.FormPaint(Sender: TObject);
begin
  if FirmIsEmpty = 1 then
  begin
    FirmIsEmpty := 0;
    with TFirstAidForm.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
  end;
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
begin
  StatusBar.Panels[1].Text := FormatDateTime('dddd', Now) + ' - ' + FormatDateTime('ddddd', Now);
  StatusBar.Panels[2].Text := FormatDateTime('tt', Now);
end;

// Выход из программы...
procedure TMainForm.MenuExitClick(Sender: TObject);
begin
  Close;
end;

// Настройка принтера
procedure TMainForm.MenuPrintSetupClick(Sender: TObject);
begin
  PrinterSetupDialog.Execute;
end;

// Создание экземпляра формы "О программе..."
procedure TMainForm.MenuAboutClick(Sender: TObject);
begin
  with TAboutBox.Create(nil) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

// Создание экземпляра формы "Настройки"
procedure TMainForm.MenuOptionsClick(Sender: TObject);
begin
  with TOptionsForm.Create(nil) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

// Создание экземпляра формы "Подключение"
procedure TMainForm.MenuConnectClick(Sender: TObject);
begin
  with TLoginForm.Create(nil) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

// Упорядочивание дочених окон каскадом
procedure TMainForm.MenuCascadeClick(Sender: TObject);
begin
  Cascade;
end;

// Упорядочивание дочених окон по горизонтали
procedure TMainForm.MenuTileHorizontalClick(Sender: TObject);
begin
  TileMode := tbHorizontal;
  Tile;
end;

// Упорядочивание дочених окон по верикали
procedure TMainForm.MenuTileVerticalClick(Sender: TObject);
begin
  TileMode := tbVertical;
  Tile;
end;

// Закрытие всех дочерних окон
procedure TMainForm.MenuCloseClick(Sender: TObject);
var
  n: Integer;
begin
  for n := 0 to MDIChildCount - 1 do
    MDIChildren[n].Close;
end;

// Создание экземпляра формы "Фирмы"
procedure TMainForm.MenuFirmClick(Sender: TObject);
begin
  if FirmForm = nil then
    FirmForm := TFirmForm.Create(Self)
  else FirmForm.Show;
end;

// Создание экземпляра формы "Клиенты"
procedure TMainForm.MenuCustomerClick(Sender: TObject);
begin
  if CustomerForm = nil then
    CustomerForm := TCustomerForm.Create(Self)
  else CustomerForm.Show;
end;

// Создание экземпляра формы "Банки"
procedure TMainForm.MenuBankClick(Sender: TObject);
begin
  if BankForm = nil then
    BankForm := TBankForm.Create(Self)
  else BankForm.Show;
end;

// Создание экземпляра формы "Группы Товара"
procedure TMainForm.MenuCategoryClick(Sender: TObject);
begin
  if CategoryForm = nil then
    CategoryForm := TCategoryForm.Create(Self)
  else CategoryForm.Show;
end;

// Создание экземпляра формы "Товар"
procedure TMainForm.MenuProductClick(Sender: TObject);
begin
  if ProductForm = nil then
    ProductForm := TProductForm.Create(Self)
  else ProductForm.Show;
end;

// Создание экземпляра формы "Приход"
procedure TMainForm.MenuReceiptOrderClick(Sender: TObject);
var
  Test: Integer;
begin
  StoreDataModule.TestDaysQuery.Open;
  Test := StoreDataModule.TestDaysQuery.FieldByName('Test').AsInteger;
  StoreDataModule.TestDaysQuery.Close;
  if (NonReg <> '') and (Test > 90) then
  begin
    Application.MessageBox('Для продолжения работы,' + #10#13 + 'пожалуйста, зарегистрируйтесь.',
      'Предупреждение', mb_IconWarning);
  end
  else
  begin
    if BuyOrderForm = nil then
      BuyOrderForm := TBuyOrderForm.Create(Self)
    else BuyOrderForm.Show;
  end;
end;

// Создание экземпляра формы "Расход"
procedure TMainForm.MenuExpenseOrderClick(Sender: TObject);
var
  Test: Integer;
begin
  StoreDataModule.TestDaysQuery.Open;
  Test := StoreDataModule.TestDaysQuery.FieldByName('Test').AsInteger;
  StoreDataModule.TestDaysQuery.Close;
  if (NonReg <> '') and (Test > 90) then
  begin
    Application.MessageBox('Для продолжения работы,' + #10#13 + 'пожалуйста, зарегистрируйтесь.',
      'Предупреждение', mb_IconWarning);
  end
  else
  begin
    if SaleOrderForm = nil then
      SaleOrderForm := TSaleOrderForm.Create(Self)
    else SaleOrderForm.Show;
  end;
end;

// Создание экземпляра формы "Оплата Наличными"
procedure TMainForm.MenuPaymentCashClick(Sender: TObject);
begin
  if PaymentCashForm = nil then
    PaymentCashForm := TPaymentCashForm.Create(Self)
  else PaymentCashForm.Show;
end;

// Создание экземпляра формы "Оплата через Банк"
procedure TMainForm.MenuPaymentBankClick(Sender: TObject);
begin
  if PaymentBankForm = nil then
    PaymentBankForm := TPaymentBankForm.Create(Self)
  else PaymentBankForm.Show;
end;

// Создание экземпляра формы "Сборка"
procedure TMainForm.MenuConvertClick(Sender: TObject);
var
  Test: Integer;
begin
  StoreDataModule.TestDaysQuery.Open;
  Test := StoreDataModule.TestDaysQuery.FieldByName('Test').AsInteger;
  StoreDataModule.TestDaysQuery.Close;
  if (NonReg <> '') and (Test > 90) then
  begin
    Application.MessageBox('Для продолжения работы,' + #10#13 + 'пожалуйста, зарегистрируйтесь.',
      'Предупреждение', mb_IconWarning);
  end
  else
  begin
    if HomeOrderForm = nil then
      HomeOrderForm := THomeOrderForm.Create(Self)
    else HomeOrderForm.Show;
  end;
end;

// Создание экземпляра формы "Склад"
procedure TMainForm.MenuStoreClick(Sender: TObject);
begin
  if StoreForm = nil then
    StoreForm := TStoreForm.Create(Self)
  else StoreForm.Show;
end;

procedure TMainForm.MenuFastRerortClick(Sender: TObject);
begin
  frReport1.Clear;
//  frReport1.LoadFromFile('Reports\Empty.frf');
  frReport1.DesignReport;
  frReport1.Clear;
end;

procedure TMainForm.MenuCalcClick(Sender: TObject);
begin
  WinExec(PChar('calc.exe'), SW_ShowNormal);
end;

procedure TMainForm.MenuPriceListClick(Sender: TObject);
begin
  with TReportPriceListForm.Create(nil) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TMainForm.MenuPriceClick(Sender: TObject);
begin
  with TReportPriceForm.Create(nil) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TMainForm.MenuRegistrationClick(Sender: TObject);
begin
  with TRegistrationForm.Create(nil) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TMainForm.MenuDebtorClick(Sender: TObject);
begin
  ReportDebtorSelectForm := TReportDebtorSelectForm.Create(Self);
  ReportDebtorSelectForm.ShowModal;
  if ReportDebtorSelectForm.ModalResult = mrOK then
  with TReportDebtorForm.Create(nil) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TMainForm.MenuCashBookClick(Sender: TObject);
begin
  with TReportCashBookForm.Create(nil) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TMainForm.MenuRemainCreditClick(Sender: TObject);
begin
  with TInitialBalanceForm.Create(nil) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TMainForm.MenuRemainGoodsClick(Sender: TObject);
begin
  with TInitialRemainsForm.Create(nil) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TMainForm.MenuCirculateClick(Sender: TObject);
begin
  ReportCirculateSelectForm := TReportCirculateSelectForm.Create(Self);
  ReportCirculateSelectForm.ShowModal;
  if ReportCirculateSelectForm.ModalResult = mrOK then
  with TReportCirculateForm.Create(nil) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TMainForm.MenuRemainsClick(Sender: TObject);
begin
  with TReportRemainsForm.Create(nil) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TMainForm.MenuCommodityMoneyClick(Sender: TObject);
begin
  with TReportCommodityMoneyForm.Create(nil) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TMainForm.MenuReviseClick(Sender: TObject);
begin
  with TReportReviseForm.Create(nil) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

//Выбираем Интервал рабочих дат
procedure TMainForm.MenuIntervalClick(Sender: TObject);
begin
  with TIntervalSelectForm.Create(nil) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TMainForm.MItdesignerClick(Sender: TObject);
begin
  ODlg1.Filter:='Файлы отчетов FastReport (*.frf)|*.frf';
  odlg1.InitialDir:=extractfilepath(application.ExeName)+'Reports';
  if odlg1.Execute and fileexists(odlg1.FileName) then
    begin
      frreport2.Clear;
      frreport2.LoadFromFile(odlg1.FileName);
      frreport2.DesignReport;
      frreport2.Clear;
    end;
end;

procedure TMainForm.MenuSQLMonitorClick(Sender: TObject);
begin
  if SQLMonitor = nil then
     SQLMonitor := TSQLMonitor.Create(Self)
  else SQLMonitor.Show;

end;

end.
