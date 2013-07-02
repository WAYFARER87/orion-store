unit SaleStructure;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, ExtCtrls, DBLookupEh,
  DB, Grids, DBGridEh;

type
  TSaleStructureForm = class(TForm)
    OKButton: TButton;
    CancelButton: TButton;
    Bevel1: TBevel;
    DBEditEh1: TDBEditEh;
    DBEditEh2: TDBEditEh;
    DBNumberEditEh1: TDBNumberEditEh;
    DBNumberEditEh3: TDBNumberEditEh;
    DBNumberEditEh4: TDBNumberEditEh;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label4: TLabel;
    DBNumberEditEh2: TDBNumberEditEh;
    Label5: TLabel;
    procedure StoreOutput;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure DBEditEh1EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBEditEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEditEh2EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBEditEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBNumberEditEh1Enter(Sender: TObject);
    procedure DBNumberEditEh1Exit(Sender: TObject);
    procedure DBNumberEditEh2Exit(Sender: TObject);
    procedure DBNumberEditEh3Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SaleStructureForm: TSaleStructureForm;

implementation

uses StoreDM, ProductSelect, StoreSelect;

var
  OldProductID : Variant;
  OldStoreID : Variant;
  OldPrice : Variant;

{$R *.dfm}

procedure TSaleStructureForm.StoreOutput;
begin
{  with StoreDataModule do
  begin
//  После выбора "Продукта" проставляем "Партию" и закупную "Цену"
    if StoreSelectQuery.Active = True then
      StoreSelectQuery.Close;
    StoreSelectQuery.ParamByName('ProductID').Value := SaleStructureDataSet['ProductID'];
    StoreSelectQuery.ParamByName('PriceID').Value := SaleOrderDataSet['PriceID'];
    StoreSelectQuery.Open;
    StoreSelectQuery.Locate('ProductID', DBNumberEditEh1.Text, []);
    SaleStructureDataSet['StoreID'] := StoreSelectQuery['StoreID'];
    StoreSelectQuery.Close;
    if PriceSelectQuery.Active = True then
      PriceSelectQuery.Close;
    PriceSelectQuery.Params[0].Value := SaleStructureDataSet['StoreID'];
    PriceSelectQuery.Params[1].Value := SaleOrderDataSet['PriceID'];
    PriceSelectQuery.Open;
    SaleStructureDataSet['Price'] := PriceSelectQuery['Price'];
    PriceSelectQuery.Close;
  end;{}
end;

procedure TSaleStructureForm.FormCreate(Sender: TObject);
begin
  with StoreDataModule do
  begin
    OldProductID := SaleStructureDataSet['ProductID'];
    OldStoreID := SaleStructureDataSet['StoreID'];
    OldPrice := SaleStructureDataSet['Price'];

//  Строим запрос, показывающий товар с ненулевыми осттками...
    ProductSelectQuery.SQL.Strings[3] :=
      'AND "Products"."ProductID" IN (SELECT "ProductID" FROM "Store" WHERE "Store"."StoreID" IN (SELECT "StoreID" FROM "StoreQty" WHERE "StoreQty"."DivisionID" = ' + SaleOrderDataSet.FieldByName('OutDivisionID').AsString + ' AND "StoreQty"."Qty" > 0)' +
      ' AND "Store"."StoreID" IN (SELECT "StoreID" FROM "Structure" WHERE "Structure"."Type" = -1 AND "Structure"."OrderID" IN (SELECT "OrderID" FROM "Orders" WHERE "Orders"."Date" <= ''' + DateToStr(SaleOrderDataSet['Date']) + ''')))';
    StoreSelectQuery.SQL.Strings[3] :=
      'AND "Store"."StoreID" IN (SELECT "StoreID" FROM "Structure" WHERE "Structure"."Type" = -1 AND "Structure"."OrderID" IN (SELECT "OrderID" FROM "Orders" WHERE "Orders"."Date" <= ''' + DateToStr(SaleOrderDataSet['Date']) + '''))';

    if SaleStructureDataSet.State = dsEdit then
    begin
//    Если осаток по партии равен Нулю, то перестраивим запросы
      if SaleStructureDataSet['RemainQty'] = 0 then
      begin
        ProductSelectQuery.SQL.Strings[3] :=
          'AND "Products"."ProductID" IN (SELECT "ProductID" FROM "Store" WHERE "Store"."StoreID" IN (SELECT "StoreID" FROM "StoreQty" WHERE "StoreQty"."DivisionID" = ' + SaleOrderDataSet.FieldByName('OutDivisionID').AsString + ' AND ("StoreQty"."Qty" > 0 OR "Store"."StoreID" = ' + SaleStructureDataSet.FieldByName('StoreID').AsString + '))' +
          ' AND "Store"."StoreID" IN (SELECT "StoreID" FROM "Structure" WHERE "Structure"."Type" = -1 AND "Structure"."OrderID" IN (SELECT "OrderID" FROM "Orders" WHERE "Orders"."Date" <= ''' + DateToStr(SaleOrderDataSet['Date']) + ''')))';
        StoreSelectQuery.SQL.Strings[4] :=
          'AND ("StoreQty"."Qty" > 0 OR "Store"."StoreID" = ' + SaleStructureDataSet.FieldByName('StoreID').AsString + ')';
      end;

//    Просчитываем общее количество выбранного Товара на Складе и выводим в заголовок
//      RemainProductQuery.ParamByName('ProductID').Value := SaleStructureDataSet['ProductID'];
//      RemainProductQuery.Open;
      Caption := SaleStructureDataSet.FieldByName('ProductFullName').AsString;// + ' - ' + FloatToStr(RemainProductQuery['SUM']);
//      RemainProductQuery.Close;
      DBEditEh2.Enabled := True;
      DBNumberEditEh2.Enabled := True;
      DBNumberEditEh3.Enabled := True;
      DBNumberEditEh4.Enabled := True;
    end
    else
      Caption := '...';
  end;
end;

procedure TSaleStructureForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  Count: Integer;
  CurOrderID: Variant;
//  CurProductID: Variant;
  CurStoreID: Variant;
  CurPrice: Variant;
  CurQty: Variant;
begin
  with StoreDataModule do
  try
    if ModalResult = mrOk then
    begin
      CurOrderID := SaleStructureDataSet['OrderID'];
//        CurProductID := SaleStructureDataSet['ProductID'];
      CurStoreID := SaleStructureDataSet['StoreID'];
      CurPrice := SaleStructureDataSet['Price'];
      CurQty := SaleStructureDataSet['Qty'];
      OrderStoreQuery.ParamByName('OrderID').Value := CurOrderID;
//        OrderStoreQuery.ParamByName('ProductID').Value := CurProductID;
      OrderStoreQuery.ParamByName('StoreID').Value := CurStoreID;
      OrderStoreQuery.ParamByName('Price').Value := CurPrice;
      OrderStoreQuery.Open;
      Count := OrderStoreQuery['COUNT'];
      if (Count > 0) then
      begin
        case SaleStructureDataSet.State of
          dsEdit:
          begin
            if (OldStoreID <> CurStoreID) or (OldPrice <> CurPrice) then
            begin
              SaleStructureDataSet.Cancel;
              SaleStructureDataSet.Delete;
              SaleStructureDataSet.Locate('OrderID; StoreID; Price', VarArrayOf([CurOrderID, CurStoreID, CurPrice]), []);
              SaleStructureDataSet.Edit;
              SaleStructureDataSet['Qty'] := SaleStructureDataSet['Qty'] + CurQty;
            end;
          end;
          dsInsert:
          begin
            SaleStructureDataSet.Cancel;
            SaleStructureDataSet.Locate('OrderID; StoreID; Price', VarArrayOf([CurOrderID, CurStoreID, CurPrice]), []);
            SaleStructureDataSet.Edit;
            SaleStructureDataSet['Qty'] := SaleStructureDataSet['Qty'] + CurQty;
          end;
        end;
      end;
      if SaleStructureDataSet.Modified then
        SaleStructureDataSet.Post;
      SaleOrderTransaction.Commit;
    end
    else
    begin
      SaleStructureDataSet.Cancel;
//        SaleOrderTransaction.Rollback;
    end;
  except
    Application.MessageBox('Недопустимые значения данных',
      'Ошибка ввода', mb_IconStop);
    Abort;
  end; {try except}

//Перестраиваем запрос на выборку товара
  with StoreDataModule do
  begin
    if ProductSelectQuery.Active = True then
      ProductSelectQuery.Close;
    ProductSelectQuery.SQL.Strings[3] := '';
    if StoreSelectQuery.Active = True then
      StoreSelectQuery.Close;
    StoreSelectQuery.SQL.Strings[3] := '';
    StoreSelectQuery.SQL.Strings[4] := 'AND ("StoreQty"."Qty" > 0)';
    if PriceSelectQuery.Active = True then
      PriceSelectQuery.Close;
    if OrderStoreQuery.Active = True then
      OrderStoreQuery.Close;

//Открываем Таблицы "Документы", "Строки Документов" после Commit'а транзакции
    SaleOrderDataSet.Open;
    SaleStructureDataSet.Open;
  end;

  Release;
end;

procedure TSaleStructureForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TSaleStructureForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TSaleStructureForm.DBNumberEditEh1Enter(Sender: TObject);
begin
  if DBNumberEditEh1.Text <> '' then
    CurrentProductID := StrToInt(DBNumberEditEh1.Text)
  else
    CurrentProductID := 0;
end;

procedure TSaleStructureForm.DBNumberEditEh1Exit(Sender: TObject);
var
  ProductStr : String;
begin
  if (DBNumberEditEh1.Text <> '') and (DBNumberEditEh1.Text <> OldProductID) then
  with StoreDataModule do
  begin
//  При выходе из поля "Код Продукта" проставляем "Наименование"
    if ProductSelectQuery.Active = False then
      ProductSelectQuery.Open;
//  Проверяем наличие "Товара" на складе
    if not ProductSelectQuery.Locate('ProductID', DBNumberEditEh1.Text, []) then
    begin
      ProductStr := DBNumberEditEh1.Text;
      Application.MessageBox(PChar('Товара с кодом "' + ProductStr + '" в наличии нет.'),
        'Ошибка', mb_IconStop);
      if CurrentProductID <> 0 then
        DBNumberEditEh1.Text := IntToStr(CurrentProductID)
      else
        DBNumberEditEh1.Text := '';
      DBNumberEditEh1.SetFocus;
      Abort;
    end;
    SaleStructureDataSet['ProductID'] := ProductSelectQuery['ProductID'];
    SaleStructureDataSet['ProductFullName'] := ProductSelectQuery['ProductFullName'];
    SaleStructureDataSet['VATRate'] := ProductSelectQuery['VATRate'];
    SaleStructureDataSet['Pack'] := ProductSelectQuery['Pack'];
    if ProductSelectQuery.Active = True then
      ProductSelectQuery.Close;

//  Подставляем "Партию"  и "Цену"
//    StoreOutput;
    if StoreSelectQuery.Active = True then
      StoreSelectQuery.Close;
    StoreSelectQuery.ParamByName('ProductID').Value := SaleStructureDataSet['ProductID'];
    StoreSelectQuery.ParamByName('PriceID').Value := SaleOrderDataSet['PriceID'];
    StoreSelectQuery.ParamByName('DivisionID').Value := SaleOrderDataSet['OutDivisionID'];
    StoreSelectQuery.Open;
    StoreSelectQuery.First;{First : FIFO, Last : LIFO}
    SaleStructureDataSet['StoreID'] := StoreSelectQuery['StoreID'];
    SaleStructureDataSet['Price'] := StoreSelectQuery['Price'];
    StoreSelectQuery.Close;

//  Просчитываем общее количество выбранного Товара на Складе и выводим в заголовок
//    RemainProductQuery.ParamByName('ProductID').Value := SaleStructureDataSet['ProductID'];
//    RemainProductQuery.Open;
    Caption := SaleStructureDataSet.FieldByName('ProductFullName').AsString;// + ' - ' + RemainProductQuery.FieldByName('SUM').AsString;
//    RemainProductQuery.Close;

    DBEditEh2.Enabled := True;
    DBNumberEditEh2.Enabled := True;
    DBNumberEditEh3.Enabled := True;
    DBNumberEditEh4.Enabled := True;
//    DBNumberEditEh2.SetFocus;
  end;
  if DBNumberEditEh1.Text = '' then
  with StoreDataModule do
  begin
    DBEditEh1.Text := '';
    DBEditEh2.Text := '';
    DBEditEh2.Enabled := False;
    DBNumberEditEh2.Text := '';
    DBNumberEditEh2.Enabled := False;
    DBNumberEditEh3.Text := '';
    DBNumberEditEh3.Enabled := False;
    DBNumberEditEh4.Text := '';
    DBNumberEditEh4.Enabled := False;
    Caption := '...';
  end;
end;

procedure TSaleStructureForm.DBEditEh1EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  if StoreDataModule.SaleStructureDataSet['ProductID'] <> Null then
    CurrentProductID := StoreDataModule.SaleStructureDataSet['ProductID'];
  CurPriceID := StoreDataModule.SaleOrderDataSet['PriceID'];
  CurDivisionID := StoreDataModule.SaleOrderDataSet['OutDivisionID'];
  CurDate := StoreDataModule.SaleOrderDataSet['Date'];
  CurStoreID := StoreDataModule.SaleStructureDataSet['StoreID'];
  CurType := StoreDataModule.SaleStructureDataSet['Type'];

//  ShowMessage(StoreDataModule.ProductSelectQuery.SQL.Text);

  ProductSelectForm := TProductSelectForm.Create(Self);
  ProductSelectForm.ShowModal;
  if ProductSelectForm.ModalResult = mrOk then
  begin
    with StoreDataModule do
    begin
      SaleStructureDataSet['ProductID'] := CurrentProductID;
      SaleStructureDataSet['ProductFullName'] := CurProductFullName;
      SaleStructureDataSet['VATRate'] := CurVATRate;
      SaleStructureDataSet['Pack'] := CurPack;

//    Проставляем "Партию"  и "Цену"
      SaleStructureDataSet['StoreID'] := CurStoreID;
      SaleStructureDataSet['Price'] := CurPrice;

//    Просчитываем общее количество выбранного Товара на Складе и выводим в заголовок
//      RemainProductQuery.ParamByName('ProductID').Value := SaleStructureDataSet['ProductID'];
//      RemainProductQuery.Open;
      Caption := SaleStructureDataSet.FieldByName('ProductFullName').AsString;// + ' - ' + RemainProductQuery.FieldByName('SUM').AsString;
//      RemainProductQuery.Close;

//    При выходе из поля "Наименование Продукта" проставляем "Партию"  и "Цену"
//      StoreOutput;

      DBEditEh2.Enabled := True;
      DBNumberEditEh2.Enabled := True;
      DBNumberEditEh3.Enabled := True;
      DBNumberEditEh4.Enabled := True;
      DBNumberEditEh2.SetFocus;
    end;
  end;
//  DBEditEh3.SetFocus;
end;

procedure TSaleStructureForm.DBEditEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBEditEh1EditButtons0Click(Self, h);
end;

procedure TSaleStructureForm.DBEditEh2EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
//  StoreDataModule.StoreSelectQuery.Locate('StoreID', StoreDataModule.SaleStructureDataSet['StoreID'], []);
  CurrentProductID := StoreDataModule.SaleStructureDataSet['ProductID'];
  CurDivisionID := StoreDataModule.SaleOrderDataSet['OutDivisionID'];
  CurPriceID := StoreDataModule.SaleOrderDataSet['PriceID'];
  CurStoreID := StoreDataModule.SaleStructureDataSet['StoreID'];
  CurProductFullName := StoreDataModule.SaleStructureDataSet.FieldByName('ProductFullName').AsString;
  StoreSelectForm := TStoreSelectForm.Create(Self);
  StoreSelectForm.ShowModal;
  if StoreSelectForm.ModalResult = mrOk then
  with StoreDataModule do
  begin
    SaleStructureDataSet['StoreID'] := CurStoreID;
    SaleStructureDataSet['Price'] := CurPrice;
  end;
  DBNumberEditEh2.SetFocus;
end;

procedure TSaleStructureForm.DBEditEh2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBEditEh2EditButtons0Click(Self, h);
end;

procedure TSaleStructureForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    SelectNext(ActiveControl As TWinControl, True, True);
end;

procedure TSaleStructureForm.DBNumberEditEh2Exit(Sender: TObject);
begin
  StoreDataModule.SaleStructureDataSet['Qty'] := DBNumberEditEh2.Value * StoreDataModule.SaleStructureDataSet['Pack'];
end;

procedure TSaleStructureForm.DBNumberEditEh3Change(Sender: TObject);
begin
  DBNumberEditEh2.Value := DBNumberEditEh3.Value div StoreDataModule.SaleStructureDataSet['Pack'];
  if (DBNumberEditEh3.Value mod StoreDataModule.SaleStructureDataSet['Pack']) > 0 then
    Label5.Caption := '+ ' + VarToStr(DBNumberEditEh3.Value mod StoreDataModule.SaleStructureDataSet['Pack']) + ' ед.'
  else
    Label5.Caption := '';
end;

end.
