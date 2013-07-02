unit Options;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, ExtCtrls, Buttons, ComCtrls;

type
  TOptionsForm = class(TForm)
    OKButton: TButton;
    CancelButton: TButton;
    Bevel1: TBevel;
    DBEditEh1: TDBEditEh;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    DBEditEh3: TDBEditEh;
    Label3: TLabel;
    DBEditEh4: TDBEditEh;
    Label4: TLabel;
    Label2: TLabel;
    DBEditEh2: TDBEditEh;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure DBEditEh1EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBEditEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEditEh2EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBEditEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEditEh3EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBEditEh3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEditEh4EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBEditEh4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEditEh1Enter(Sender: TObject);
    procedure DBEditEh1Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OptionsForm: TOptionsForm;

implementation

uses Registry, StoreDM, Main, FirmSelect, DivisionSelect, TypePrice, CustomerSelect,
 Coding;

var
  OldFirm : Integer;

{$R *.dfm}

procedure TOptionsForm.FormCreate(Sender: TObject);
begin
  with StoreDataModule do
  begin
    OldFirm := MainFirm;
    FirmSelectQuery.Open;
    FirmSelectQuery.Locate('CustomerID', MainFirm, []);
    DivisionSelectQuery.Open;
    DivisionSelectQuery.Locate('DivisionID', MainDivision, []);
    TypePriceDataSet.Open;
    TypePriceDataSet.Locate('PriceID', MainPrice, []);
    CustomerSelectQuery.Open;
    CustomerSelectQuery.Locate('CustomerID', RetailCustomerID, []);
  end;
  Caption := 'Настройки';
end;

procedure TOptionsForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  Registry: TRegistry;
begin
  if ModalResult = mrOk then
  begin
    if DBEditEh2.Text = '' then
    begin
      Application.MessageBox('Не указан склад Фирмы.',
        'Предупреждение', mb_IconWarning);
      Abort;
    end;
    FirmName := StoreDataModule.FirmSelectQuery.FieldByName('CustomerName').AsString;
    KeyName := StoreDataModule.FirmSelectQuery.FieldByName('CustomerID').AsString;
    Registry := TRegistry.Create;
    Registry.RootKey := HKEY_LOCAL_MACHINE;
    try
      if Registry.OpenKey('\SOFTWARE\Logos\IBStore\', false) then
      begin
        Registry.WriteInteger('FirmID', StoreDataModule.FirmSelectQuery.FieldByName('CustomerID').AsInteger);
        if Registry.OpenKey(KeyName, true) then
        begin
          MainFirm := StoreDataModule.FirmSelectQuery.FieldByName('CustomerID').AsInteger;
          Registry.WriteString('FirmName', StoreDataModule.FirmSelectQuery.FieldByName('CustomerName').AsString);
          if DBEditEh2.Text <> '' then
          begin
            MainDivision := StoreDataModule.DivisionSelectQuery.FieldByName('DivisionID').AsInteger;
            Registry.WriteInteger('DivisionID', MainDivision);
          end;
          if DBEditEh3.Text <> '' then
          begin
            MainPrice := StoreDataModule.TypePriceDataSet.FieldByName('PriceID').AsInteger;
            Registry.WriteInteger('PriceID', MainPrice);
          end;
          if DBEditEh4.Text <> '' then
          begin
            RetailCustomerID := StoreDataModule.CustomerSelectQuery.FieldByName('CustomerID').AsInteger;
            Registry.WriteInteger('RetailCustID', RetailCustomerID);
          end;
          if (Registry.ReadString('FirmName') <> StoreDataModule.FirmSelectQuery['CustomerName']) or (Registry.ReadString('Key') <> Code(StoreDataModule.FirmSelectQuery.FieldByName('INN').AsString)) then
            NonReg := ' - не зарегистрировано'
          else
            NonReg := '';
        end;
        Registry.CloseKey;
      end;
    finally
      Registry.Free;
    end;
    MainForm.Caption := 'Склад - ' + FirmName +
//                        ' (' + StoreDataModule.DataBase.Params.Values['user_name'] + ')' +
                        NonReg;
  end
  else
    MainFirm := OldFirm;
  with StoreDataModule do
  begin
    FirmSelectQuery.Close;
    DivisionSelectQuery.Close;
    TypePriceDataSet.Close;
    CustomerSelectQuery.Close;
    DebtQuery.Close;
  end;
//Влкючаем\Отключаем "Меню" Докуметнтов и Отчетов
  MainForm.EnabledMenuItems;
  Release;
end;

procedure TOptionsForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TOptionsForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TOptionsForm.DBEditEh1EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var
  Registry: TRegistry;
begin
  FirmSelectForm := TFirmSelectForm.Create(Self);
  FirmSelectForm.ShowModal;
  if FirmSelectForm.ModalResult = mrOk then
  begin
    Registry := TRegistry.Create;
    Registry.RootKey := HKEY_LOCAL_MACHINE;
    try
      if Registry.OpenKey('\SOFTWARE\Logos\IBStore\', false) then
      begin
        MainFirm := StoreDataModule.FirmSelectQuery['CustomerID'];
        KeyName := StoreDataModule.FirmSelectQuery.FieldByName('CustomerID').AsString;
        StoreDataModule.DivisionSelectQuery.Close;
        StoreDataModule.DivisionSelectQuery.Open;
        if Registry.OpenKey(KeyName, false) then
        begin
          StoreDataModule.DivisionSelectQuery.Locate('DivisionID', Registry.ReadInteger('DivisionID'), []);
          StoreDataModule.TypePriceDataSet.Locate('PriceID', Registry.ReadInteger('PriceID'), []);
          StoreDataModule.CustomerSelectQuery.Locate('CustomerID', Registry.ReadInteger('RetailCustID'), []);
        end;
        Registry.CloseKey;
      end;
    finally
      Registry.Free;
    end;
  end;
end;

procedure TOptionsForm.DBEditEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBEditEh1EditButtons0Click(Self, h);
end;

procedure TOptionsForm.DBEditEh2EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  DivisionSelectForm := TDivisionSelectForm.Create(Self);
  DivisionSelectForm.ShowModal;
  if StoreDataModule.DivisionSelectQuery.Active = False then
    StoreDataModule.DivisionSelectQuery.Open;
  if DivisionSelectForm.ModalResult = mrOK then
  begin
    DBEditEh2.DataSource := StoreDataModule.DivisionSelectDataSource;
    DBEditEh2.DataField := 'DivisionName';
    StoreDataModule.DivisionSelectQuery.Locate('DivisionID', CurDivisionID, []);
  end
  else
    StoreDataModule.DivisionSelectQuery.Locate('DivisionID', MainDivision, []);
end;

procedure TOptionsForm.DBEditEh2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBEditEh2EditButtons0Click(Self, h);
end;

procedure TOptionsForm.DBEditEh3EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  TypePriceForm := TTypePriceForm.Create(Self);
  TypePriceForm.ShowModal;
  if TypePriceForm.ModalResult = mrOK then
  begin
    DBEditEh3.DataSource := StoreDataModule.TypePriceDataSource;
    DBEditEh3.DataField := 'PriceName';
    StoreDataModule.TypePriceDataSet.Locate('PriceID', CurPriceID, []);
  end
  else
    StoreDataModule.TypePriceDataSet.Locate('PriceID', MainPrice, []);
end;

procedure TOptionsForm.DBEditEh3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBEditEh3EditButtons0Click(Self, h);
end;

procedure TOptionsForm.DBEditEh4EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  CurCustomerID := RetailCustomerID;
  CustomerSelectForm := TCustomerSelectForm.Create(Self);
  CustomerSelectForm.ShowModal;
  if StoreDataModule.CustomerSelectQuery.Active = False then
    StoreDataModule.CustomerSelectQuery.Open;
  if CustomerSelectForm.ModalResult = mrOK then
  begin
    DBEditEh4.DataSource := StoreDataModule.CustomerSelectDataSource;
    DBEditEh4.DataField := 'CustomerName';
    StoreDataModule.CustomerSelectQuery.Locate('CustomerID', CurCustomerID, []);
  end
  else
    StoreDataModule.CustomerSelectQuery.Locate('CustomerID', RetailCustomerID, []);
end;

procedure TOptionsForm.DBEditEh4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBEditEh4EditButtons0Click(Self, h);
end;

procedure TOptionsForm.DBEditEh1Enter(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := 'Нажмите F3 для вызова справочника';
end;

procedure TOptionsForm.DBEditEh1Exit(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := '';
end;

procedure TOptionsForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    SelectNext(ActiveControl As TWinControl, True, True);
end;

end.
