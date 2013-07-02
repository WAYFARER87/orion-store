unit HomeStructure;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, ExtCtrls, DBLookupEh,
  DB, Grids, DBGridEh;

type
  THomeStructureForm = class(TForm)
    OKButton: TButton;
    CancelButton: TButton;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBNumberEditEh1: TDBNumberEditEh;
    DBEditEh1: TDBEditEh;
    DBEditEh2: TDBEditEh;
    DBNumberEditEh2: TDBNumberEditEh;
    DBNumberEditEh3: TDBNumberEditEh;
    procedure StoreInput;
    procedure StoreOutput;
    procedure PriceCalculate;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure DBComboBoxEh1Exit(Sender: TObject);
    procedure DBNumberEditEh1Enter(Sender: TObject);
    procedure DBNumberEditEh1Exit(Sender: TObject);
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HomeStructureForm: THomeStructureForm;

implementation

uses StoreDM, ProductSelect, HomeStoreSelect, HomeStoreItem,
  StoreSelect;

var
  OldProductID : Variant;
  OldStoreID : Variant;
  OldPrice : Variant;

{$R *.dfm}

procedure THomeStructureForm.StoreInput;
{var
  Pack: Variant;
  CountryID: Variant;
  CCDID: Variant;
  CertificateID: Variant;
  i: Integer;
  A: Array of Array of Real;{}
begin
{  with StoreDataModule do
  begin
//  После выбора "Продукта" ищем последнюю "Партию"
    HomeStoreDataSet.Close;
    HomeStoreDataSet.Open;
    HomeStoreDataSet.Last;
    Pack := HomeStoreDataSet['Pack'];
    CountryID := HomeStoreDataSet['CountryID'];
    CCDID := HomeStoreDataSet['CCDID'];
    CertificateID := HomeStoreDataSet['CertificateID'];
{    with HomePriceDataSet do
    begin
      Close;
      Open;
      Last;
      if not IsEmpty then
      begin
        i := RecNo;
        SetLength(A, i, 2);
        First;
        while not EOF do
        begin
          i := RecNo;
          A[i - 1, 0] := HomePriceDataSet['PriceID'];
          A[i - 1, 1] := HomePriceDataSet['Price'];
          Next;
        end;
      end;
    end;{}
//  После выбора "Товара" создаем новую "Партию" и присваиваем ей  свойства последней найденной
{    HomeStoreDataSet.Append;
    DivisionSelectQuery.Open;
    HomeStoreDataSet['DivisionID'] := DivisionSelectQuery['DivisionID'];
    HomeStoreDataSet['DivisionName'] := DivisionSelectQuery['DivisionName'];
    DivisionSelectQuery.Close;
    HomeStoreDataSet['ProductID'] := HomeStructureDataSet['ProductID'];
    HomeStoreDataSet['Pack'] := Pack;
    HomeStoreDataSet['CountryID'] := CountryID;
    HomeStoreDataSet['CCDID'] := CCDID;
    HomeStoreDataSet['CertificateID'] := CertificateID;
    if HomeStoreDataSet.FieldByName('AccountPrice').IsNull then
      HomeStoreDataSet['AccountPrice'] := 0;
    HomeStoreDataSet.Post;
    HomeStructureDataSet['StoreID'] := HomeStoreDataSet['StoreID'];
//  После занесения "Партии" проставляем "Цены"
{    for i := 0 to High(A) do
    begin
      HomePriceDataSet.Append;
      HomePriceDataSet['StoreID'] := HomeStoreDataSet['StoreID'];
      HomePriceDataSet['PriceID'] := A[i, 0];
      HomePriceDataSet['Price'] := A[i, 1];
    end;
    if HomePriceDataSet.Modified then
      HomePriceDataSet.Post;
  end;{}
end;

procedure THomeStructureForm.StoreOutput;
begin
{  with StoreDataModule do
  begin
//  После выбора "Продукта" проставляем "Партию" и закупную "Цену"
    if StoreSelectQuery.Active = True then
      StoreSelectQuery.Close;
    StoreSelectQuery.ParamByName('ProductID').Value := HomeStructureDataSet['ProductID'];
    StoreSelectQuery.ParamByName('PriceID').Value := HomeOrderDataSet['PriceID'];
    StoreSelectQuery.ParamByName('Date').Value := HomeOrderDataSet['Date'];
    StoreSelectQuery.Open;
    StoreSelectQuery.Locate('ProductID', DBNumberEditEh1.Text, []);
    HomeStructureDataSet['StoreID'] := StoreSelectQuery['StoreID'];
    HomeStructureDataSet['Price'] := StoreSelectQuery['Price'];//Или ['AccountPrice']
    StoreSelectQuery.Close;
  end;{}
end;

//  Расчет всех Цен от значения "Приходная Цена"
procedure THomeStructureForm.PriceCalculate;
{var
  Markup: Real;{}
begin
{  with StoreDataModule do
  try
    HomeStoreDataSet.Edit;
    HomeStoreDataSet['AccountPrice'] := DBNumberEditEh3.Value;
    HomeStoreDataSet.Post;
    HomePriceDataSet.Close;
    DeletePriceHomeStoreQuery.ExecSQL;
    HomePriceDataSet.Open;
    TypePriceDataSet.Open;
    if not TypePriceDataSet.IsEmpty then
    begin
      TypePriceDataSet.First;
      while not TypePriceDataSet.EOF do
      begin
        HomePriceDataSet.Append;
        HomePriceDataSet['StoreID'] := HomeStoreDataSet['StoreID'];
        HomePriceDataSet['PriceID'] := TypePriceDataSet['PriceID'];
        if TypePriceDataSet['Markup'] <> Null then
          Markup := TypePriceDataSet['Markup']
        else
          Markup := 0;
        HomePriceDataSet['Price'] := DBNumberEditEh3.Value + (DBNumberEditEh3.Value * Markup) / 100;
        TypePriceDataSet.Next;
      end;
      HomePriceDataSet.Post;
    end;
  except
{    Application.MessageBox('Недопустимые значения данных',
      'Ошибка ввода', mb_IconStop);{}
{    HomePriceDataSet.Cancel;
    Abort;
  end;{}
end;

procedure THomeStructureForm.FormCreate(Sender: TObject);
begin
  with StoreDataModule do
  begin
    OldProductID := HomeStructureDataSet['ProductID'];
    OldStoreID := HomeStructureDataSet['StoreID'];
    OldPrice := HomeStructureDataSet['Price'];

//  Если расход, то прописываем в запросе выбор Ненулевых остатков
    if (HomeStructureDataSet['Type'] = 1) or (HomeStructureDataSet['Type'] = 0) then
    begin
      ProductSelectQuery.SQL.Strings[3] :=
        'AND "Products"."ProductID" IN (SELECT "ProductID" FROM "Store" WHERE "Store"."StoreID" IN (SELECT "StoreID" FROM "StoreQty" WHERE "StoreQty"."DivisionID" = ' + HomeOrderDataSet.FieldByName('OutDivisionID').AsString + ' AND "StoreQty"."Qty" > 0)' +
        ' AND "Store"."StoreID" IN (SELECT "StoreID" FROM "Structure" WHERE "Structure"."Type" = -1 AND "Structure"."OrderID" IN (SELECT "OrderID" FROM "Orders" WHERE "Orders"."Date" <= ''' + DateToStr(HomeOrderDataSet['Date']) + ''')))';
      StoreSelectQuery.SQL.Strings[3] :=
        'AND "Store"."StoreID" IN (SELECT "StoreID" FROM "Structure" WHERE "Structure"."Type" = -1 AND "Structure"."OrderID" IN (SELECT "OrderID" FROM "Orders" WHERE "Orders"."Date" <= ''' + DateToStr(HomeOrderDataSet['Date']) + '''))';

      if (HomeStructureDataSet.State = dsEdit) then//and
//    Если осаток по партии равен Нулю, то перестраивим запрос
//        (HomeStructureDataSet['RemainQty'] = 0) then //Надо бы это дело как-то пнрнсмотреть...
      begin
        ProductSelectQuery.SQL.Strings[3] :=
          'AND "Products"."ProductID" IN (SELECT "ProductID" FROM "Store" WHERE "Store"."StoreID" IN (SELECT "StoreID" FROM "StoreQty" WHERE "StoreQty"."DivisionID" = ' + HomeOrderDataSet.FieldByName('OutDivisionID').AsString + ' AND ("StoreQty"."Qty" > 0 OR "Store"."StoreID" = ' + HomeStructureDataSet.FieldByName('StoreID').AsString + '))' +
          ' AND "Store"."StoreID" IN (SELECT "StoreID" FROM "Structure" WHERE "Structure"."Type" = -1 AND "Structure"."OrderID" IN (SELECT "OrderID" FROM "Orders" WHERE "Orders"."Date" <= ''' + DateToStr(HomeOrderDataSet['Date']) + ''')))';
        StoreSelectQuery.SQL.Strings[4] :=
          'AND ("StoreQty"."Qty" > 0 OR "Store"."StoreID" = ' + HomeStructureDataSet.FieldByName('StoreID').AsString + ')';
      end;
    end;
    if HomeStructureDataSet['Type'] = -1 then
    begin
      if not HomeStoreDataSet.Active then
        HomeStoreDataSet.Open;
    end;
    if HomeStructureDataSet.State = dsEdit then
    begin
//    Просчитываем общее количество выбранного Товара на Складе и выводим в заголовок
//      RemainProductQuery.ParamByName('ProductID').Value := HomeStructureDataSet['ProductID'];
//      RemainProductQuery.Open;
      Caption := HomeStructureDataSet.FieldByName('ProductFullName').AsString;// + ' - ' + FloatToStr(RemainProductQuery['SUM']);
//      RemainProductQuery.Close;
      DBEditEh2.Enabled := True;
      DBNumberEditEh2.Enabled := True;
      DBNumberEditEh3.Enabled := True;
    end
    else
      Caption := '...';
  end;
end;

procedure THomeStructureForm.FormShow(Sender: TObject);
begin
  DBNumberEditEh1.SetFocus;
end;

procedure THomeStructureForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  Count: Integer;
  CurOrderID: Variant;
  CurStoreID: Variant;
  CurPrice: Variant;
  CurQty: Variant;
begin
  with StoreDataModule do
  try
    try
      if ModalResult = mrOk then
      begin
//      Если "Расход", то:
        if (HomeStructureDataSet['Type'] = 1) or (HomeStructureDataSet['Type'] = 0) then
        begin
          CurOrderID := HomeStructureDataSet['OrderID'];
          CurStoreID := HomeStructureDataSet['StoreID'];
          CurPrice := HomeStructureDataSet['Price'];
          CurQty := HomeStructureDataSet['Qty'];
          OrderStoreQuery.ParamByName('OrderID').Value := CurOrderID;
          OrderStoreQuery.ParamByName('StoreID').Value := CurStoreID;
          OrderStoreQuery.ParamByName('Price').Value := CurPrice;
          OrderStoreQuery.Open;
          Count := OrderStoreQuery['COUNT'];
          OrderStoreQuery.Close;
          if (Count > 0) then
          begin
            case HomeStructureDataSet.State of
              dsEdit:
              begin
                if (OldStoreID <> CurStoreID) or (OldPrice <> CurPrice) then
                begin
                  HomeStructureDataSet.Cancel;
                  HomeStructureDataSet.Delete;
                  HomeStructureDataSet.Locate('OrderID; StoreID; Price', VarArrayOf([CurOrderID, CurStoreID, CurPrice]), []);
                  HomeStructureDataSet.Edit;
                  HomeStructureDataSet['Qty'] := HomeStructureDataSet['Qty'] + CurQty;
                end;
              end;
              dsInsert:
              begin
                HomeStructureDataSet.Cancel;
                HomeStructureDataSet.Locate('OrderID; StoreID; Price', VarArrayOf([CurOrderID, CurStoreID, CurPrice]), []);
                HomeStructureDataSet.Edit;
                HomeStructureDataSet['Qty'] := HomeStructureDataSet['Qty'] + CurQty;
              end;
            end;
          end;
        end;
//      Если "Приход", то:
//        if StoreDataModule.HomeStructureDataSet['Type'] = -1 then
//          PriceCalculate;
        if HomeStructureDataSet.Modified then
          HomeStructureDataSet.Post;
        HomeTransaction.Commit;
      end
      else
      begin
        HomeStructureDataSet.Cancel;
//        HomeTransaction.Rollback;
      end;
    except
      Application.MessageBox('Недопустимые значения данных',
        'Ошибка ввода', mb_IconStop);
      Abort;
    end; {try except}
  finally
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
    if HomeStoreDataSet.Active = True then
      HomeStoreDataSet.Close;
//    Открываем Таблицы "Документы", "Строки Документов" после Commit'а транзакции
    HomeOrderDataSet.Open;
    HomeStructureDataSet.Open;
  end; {try finally}
  Release;
end;

procedure THomeStructureForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure THomeStructureForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure THomeStructureForm.DBComboBoxEh1Exit(Sender: TObject);
begin
{  with StoreDataModule.ProductSelectQuery do
  begin
//Если "Приход", то делаем запрос выбора ВСЕГО "Товара"
    if DBComboBoxEh1.Value = 0 then
      SQL.Strings[2] := 'WHERE "Products"."CategoryID" = "Categories"."CategoryID"'
//Если "Расход", то делаем запрос выбора НЕНУЛЕВЫХ "Товара"
    else
      SQL.Strings[2] := 'WHERE ("Products"."CategoryID" = "Categories"."CategoryID") AND' +
                        '      ("Products"."ProductID" IN (SELECT "ProductID"' +
                        '                                  FROM "Store"' +
                        '                                  WHERE "RemainQty" > 0))';
    Open;
  end;{}
end;

procedure THomeStructureForm.DBNumberEditEh1Enter(Sender: TObject);
begin
  if DBNumberEditEh1.Text <> '' then
    CurrentProductID := StrToInt(DBNumberEditEh1.Text)
  else
    CurrentProductID := 0;
end;

procedure THomeStructureForm.DBNumberEditEh1Exit(Sender: TObject);
var
  ProductStr : String;
begin
  if (DBNumberEditEh1.Text <> '') and (DBNumberEditEh1.Text <> OldProductID) then
  with StoreDataModule do
  begin
//При выходе из поля "Код Продукта" проставляем "Наименование"
    if ProductSelectQuery.Active = False then
      ProductSelectQuery.Open;
//Проверяем наличие "Товара" на складе
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
    HomeStructureDataSet['ProductID'] := ProductSelectQuery['ProductID'];
    HomeStructureDataSet['ProductFullName'] := ProductSelectQuery['ProductFullName'];
    HomeStructureDataSet['VATRate'] := ProductSelectQuery['VATRate'];
    if ProductSelectQuery.Active = True then
      ProductSelectQuery.Close;

//  Подставляем "Партию"  и "Цену"
//    StoreOutput;
    if (HomeStructureDataSet['Type'] = 1) or (HomeStructureDataSet['Type'] = 0) then
    begin
      if StoreSelectQuery.Active = True then
        StoreSelectQuery.Close;
      StoreSelectQuery.ParamByName('ProductID').Value := HomeStructureDataSet['ProductID'];
      StoreSelectQuery.ParamByName('PriceID').Value := HomeOrderDataSet['PriceID'];
      StoreSelectQuery.ParamByName('DivisionID').Value := HomeOrderDataSet['OutDivisionID'];
      StoreSelectQuery.Open;
      StoreSelectQuery.First;{First : FIFO, Last : LIFO}
      HomeStructureDataSet['StoreID'] := StoreSelectQuery['StoreID'];
      HomeStructureDataSet['Price'] := StoreSelectQuery['Price'];
      StoreSelectQuery.Close;
    end;

//  Просчитываем общее количество выбранного Товара на Складе и выводим в заголовок
//    RemainProductQuery.ParamByName('ProductID').Value := HomeStructureDataSet['ProductID'];
//    RemainProductQuery.Open;
    Caption := HomeStructureDataSet.FieldByName('ProductFullName').AsString;// + ' - ' + VarToStr(RemainProductQuery['SUM']);
//    RemainProductQuery.Close;

    DBNumberEditEh2.Enabled := True;
    DBNumberEditEh3.Enabled := True;
    DBNumberEditEh2.SetFocus;
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
    Caption := '...';
  end;
end;

procedure THomeStructureForm.DBEditEh1EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  if StoreDataModule.HomeStructureDataSet['ProductID'] <> Null then
    CurrentProductID := StoreDataModule.HomeStructureDataSet['ProductID'];
  CurPriceID := 1;
  CurDivisionID := StoreDataModule.HomeOrderDataSet['OutDivisionID'];
  CurDate := StoreDataModule.HomeOrderDataSet['Date'];
  CurStoreID := StoreDataModule.HomeStructureDataSet['StoreID'];
  CurType := StoreDataModule.HomeStructureDataSet['Type'];

  ProductSelectForm := TProductSelectForm.Create(Self);
  ProductSelectForm.ShowModal;
  if ProductSelectForm.ModalResult = mrOk then
  begin
    with StoreDataModule do
    begin
      HomeStructureDataSet['ProductID'] := CurrentProductID;
      HomeStructureDataSet['ProductFullName'] := CurProductFullName;
      HomeStructureDataSet['VATRate'] := CurVATRate;

//    Если "Расход", то:
//    Проставляем "Партию"  и "Цену"
      if (HomeStructureDataSet['Type'] = 1) or (HomeStructureDataSet['Type'] = 0) then
      begin
        HomeStructureDataSet['StoreID'] := CurStoreID;
        HomeStructureDataSet['Price'] := CurPrice;
      end;

//    Просчитываем общее количество выбранного Товара на Складе и выводим в заголовок
//      RemainProductQuery.ParamByName('ProductID').Value := HomeStructureDataSet['ProductID'];
//      RemainProductQuery.Open;
      Caption := HomeStructureDataSet.FieldByName('ProductFullName').AsString;// + ' - ' + VarToStr(RemainProductQuery['SUM']);
//      RemainProductQuery.Close;

//      DBEditEh2.Enabled := True;
      DBNumberEditEh2.Enabled := True;
      DBNumberEditEh3.Enabled := True;
      DBNumberEditEh2.SetFocus;
    end;
  end;
end;

procedure THomeStructureForm.DBEditEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBEditEh1EditButtons0Click(Self, h);
end;

procedure THomeStructureForm.DBEditEh2EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  with StoreDataModule do
  begin
//Если "Расход", то:
    if (HomeStructureDataSet['Type'] = 1) or (HomeStructureDataSet['Type'] = 0) then
    begin
      CurrentProductID := HomeStructureDataSet['ProductID'];
      CurDivisionID := HomeOrderDataSet['OutDivisionID'];
      CurPriceID := 1; // Енто временно: 1 - Цена Закупа
      CurStoreID := HomeStructureDataSet['StoreID'];
      CurProductFullName := HomeStructureDataSet.FieldByName('ProductFullName').AsString;
      StoreSelectForm := TStoreSelectForm.Create(Self);
      StoreSelectForm.ShowModal;
      if StoreSelectForm.ModalResult = mrOk then
      begin
//Проставляем "Партию" и "Цену"
        HomeStructureDataSet['StoreID'] := CurStoreID;
        HomeStructureDataSet['Price'] := CurPrice;
      end;
    end;
//Если "Приход", то:
    if HomeStructureDataSet['Type'] = -1 then
    begin
      HomeStoreDataSet.Edit;
      HomeStoreItemForm := THomeStoreItemForm.Create(Self);
      HomeStoreItemForm.ShowModal;
    end;
  end;
end;

procedure THomeStructureForm.DBEditEh2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBEditEh2EditButtons0Click(Self, h);
end;

procedure THomeStructureForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    SelectNext(ActiveControl As TWinControl, True, True);
end;

end.
