unit BuyStructure;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, ExtCtrls, DBLookupEh,
  DB, Grids, DBGridEh;

type
  TBuyStructureForm = class(TForm)
    OKButton: TButton;
    CancelButton: TButton;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBNumberEditEh1: TDBNumberEditEh;
    DBEditEh1: TDBEditEh;
    DBEditEh2: TDBEditEh;
    DBNumberEditEh2: TDBNumberEditEh;
    DBNumberEditEh3: TDBNumberEditEh;
    RadioGroup1: TRadioGroup;
    procedure StoreInput;
    procedure PriceCalculate;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
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
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BuyStructureForm: TBuyStructureForm;

implementation

uses StoreDM, ProductSelect, BuyStoreItem;

var
  OldProductID : Variant;
//  OldStoreID : Variant;

{$R *.dfm}

procedure TBuyStructureForm.StoreInput;
{var
  Pack: Variant;
  CountryID: Variant;
  CCDID: Variant;
  CertificateID: Variant;
  i: Integer;
  A: Array of Array of Variant;{}
begin
  with StoreDataModule do
  begin
//  После выбора "Продукта" ищем последнюю "Партию"
{    BuyStoreDataSet.Close;
    BuyStoreDataSet.Open;
    BuyStoreDataSet.Last;
    Pack := BuyStoreDataSet['Pack'];
    CountryID := BuyStoreDataSet['CountryID'];
    CCDID := BuyStoreDataSet['CCDID'];
    CertificateID := BuyStoreDataSet['CertificateID'];
    with BuyPriceDataSet do
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
          A[i - 1, 0] := BuyPriceDataSet['PriceID'];
          A[i - 1, 1] := BuyPriceDataSet['Price'];
          Next;
        end;
      end;
    end;{}
//  После выбора "Товара" создаем новую "Партию" и присваиваем ей  свойства последней найденной
{    BuyStoreDataSet.Append;
    DivisionSelectQuery.Open;
    BuyStoreDataSet['DivisionID'] := DivisionSelectQuery['DivisionID'];
    BuyStoreDataSet['DivisionName'] := DivisionSelectQuery['DivisionName'];
    DivisionSelectQuery.Close;
    if BuyStoreDataSet['DivisionID'] = null then
    begin
      Application.MessageBox('Не определен склад оприходования.',
        'Предупреждение', mb_IconWarning);
      BuyStoreDataSet.Cancel;
      Exit;
    end;
    BuyStoreDataSet['ProductID'] := BuyStructureDataSet['ProductID'];
    BuyStoreDataSet['Pack'] := Pack;
    BuyStoreDataSet['CountryID'] := CountryID;
    BuyStoreDataSet['CCDID'] := CCDID;
    BuyStoreDataSet['CertificateID'] := CertificateID;
    if BuyStoreDataSet.FieldByName('AccountPrice').IsNull then
      BuyStoreDataSet['AccountPrice'] := 0;
    BuyStoreDataSet.Post;
    BuyStructureDataSet['StoreID'] := BuyStoreDataSet['StoreID'];{}
//  После занесения "Партии" проставляем "Цены"
{    for i := 0 to High(A) do
    begin
      BuyPriceDataSet.Append;
      BuyPriceDataSet['StoreID'] := BuyStoreDataSet['StoreID'];
      BuyPriceDataSet['PriceID'] := A[i, 0];
      BuyPriceDataSet['Price'] := A[i, 1];
    end;
    if BuyPriceDataSet.Modified then
      BuyPriceDataSet.Post;{}
  end;
end;

//  Расчет всех Цен от значения "Приходная Цена"
procedure TBuyStructureForm.PriceCalculate;
{var
  Markup: Real;{}
begin
//  with StoreDataModule do
//  try
{    BuyStoreDataSet.Edit;
    BuyStoreDataSet['AccountPrice'] := DBNumberEditEh3.Value;
    BuyStoreDataSet.Post;
    BuyPriceDataSet.Close;{}
{    DeletePriceBuyStoreQuery.ExecSQL;
    BuyPriceDataSet.Open;
    TypePriceDataSet.Open;
    if not TypePriceDataSet.IsEmpty then
    begin
      TypePriceDataSet.First;
      while not TypePriceDataSet.EOF do
      begin
        BuyPriceDataSet.Append;
        BuyPriceDataSet['StoreID'] := BuyStoreDataSet['StoreID'];
        BuyPriceDataSet['PriceID'] := TypePriceDataSet['PriceID'];
        if TypePriceDataSet['Markup'] <> Null then
          Markup := TypePriceDataSet['Markup']
        else
          Markup := 0;
        BuyPriceDataSet['Price'] := DBNumberEditEh3.Value + (DBNumberEditEh3.Value * Markup) / 100;
        TypePriceDataSet.Next;
      end;
      BuyPriceDataSet.Post;
    end;
  except{}
{    Application.MessageBox('Недопустимые значения данных',
      'Ошибка ввода', mb_IconStop);{}
{    BuyPriceDataSet.Cancel;
    Abort;{}
//  end;
end;

procedure TBuyStructureForm.FormCreate(Sender: TObject);
begin
  with StoreDataModule do
  begin
    OldProductID := BuyStructureDataSet['ProductID'];
    if BuyStructureDataSet.State = dsEdit then
    begin
//      RemainProductQuery.ParamByName('ProductID').Value := BuyStructureDataSet['ProductID'];
//      RemainProductQuery.Open;
      Caption := BuyStructureDataSet.FieldByName('ProductFullName').AsString;// + ' - ' + RemainProductQuery.FieldByName('SUM').AsString;
//      RemainProductQuery.Close;
      DBNumberEditEh2.Enabled := True;
      DBNumberEditEh3.Enabled := True;
      DBEditEh2.Enabled := True;
//      CheckBox1.Enabled := True;
    end
    else
      Caption := '...';
    if BuyStoreDataSet.Active = False then
      BuyStoreDataSet.Open;
  end;
//    BuyStoreDataSet.Locate('StoreID', BuyStructureDataSet['StoreID'], []);
end;

procedure TBuyStructureForm.FormShow(Sender: TObject);
begin
  DBNumberEditEh1.SetFocus;
end;

procedure TBuyStructureForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with StoreDataModule do
  try
    try
      if ModalResult = mrOk then
      begin

        case RadioGroup1.ItemIndex of
          0: BuyStructureDataSet['PriceNonVAT'] := Null; //НДС выделить
          1: BuyStructureDataSet['Price'] := Null; //НДС начислить
        end;

//        PriceCalculate;
        if BuyStructureDataSet.Modified then
          BuyStructureDataSet.Post;
        BuyOrderTransaction.Commit;
      end
      else
      begin
        BuyStructureDataSet.Cancel;
//        BuyOrderTransaction.Rollback;
      end;
    except
      on E: Exception do begin

         Application.MessageBox(pchar(e.message),
        'Ошибка ввода', mb_IconStop);
      Abort; end;
    end; {try except}
  finally
//    Открываем Таблицы "Документы", "Строки Документов" после Commit'а транзакции
    BuyOrderDataSet.Open;
    BuyStructureDataSet.Open;
    if BuyStoreDataSet.Active = True then
      BuyStoreDataSet.Close;
  end; {try finally}
  Release;
end;

procedure TBuyStructureForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TBuyStructureForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TBuyStructureForm.DBNumberEditEh1Enter(Sender: TObject);
begin
  if DBNumberEditEh1.Text <> '' then
    CurrentProductID := StrToInt(DBNumberEditEh1.Text)
  else
    CurrentProductID := 0;
end;

procedure TBuyStructureForm.DBNumberEditEh1Exit(Sender: TObject);
var
  ProductStr: String;
begin
  if (DBNumberEditEh1.Text <> '') and (DBNumberEditEh1.Text <> OldProductID) then
  with StoreDataModule do
  begin
//  При выходе из поля "Код Продукта" проставляем "Наименование"
    if ProductSelectQuery.Active = False then
      ProductSelectQuery.Open;
//  Проверяем наличие "Продукта" по Коду в картотеке
    if not ProductSelectQuery.Locate('ProductID', DBNumberEditEh1.Text, []) then
    begin
      ProductStr := DBNumberEditEh1.Text;
      Application.MessageBox(PChar('Товара с кодом "' + ProductStr + '" в картотеке нет.'),
        'Ошибка', mb_IconStop);
      if CurrentProductID <> 0 then
        DBNumberEditEh1.Text := IntToStr(CurrentProductID)
      else
        DBNumberEditEh1.Text := '';
      DBNumberEditEh1.SetFocus;
      Abort;
    end;
    BuyStructureDataSet['ProductID'] := ProductSelectQuery['ProductID'];
    BuyStructureDataSet['ProductFullName'] := ProductSelectQuery['ProductFullName'];
//    BuyStructureDataSet['CategoryName'] := ProductSelectQuery['CategoryName'];
    BuyStructureDataSet['VATRate'] := ProductSelectQuery['VATRate'];
    if ProductSelectQuery.Active = True then
      ProductSelectQuery.Close;

//  Просчитываем общее количество выбранного Товара на Складе и выводим в заголовок
//    RemainProductQuery.ParamByName('ProductID').Value := BuyStructureDataSet['ProductID'];
//    RemainProductQuery.Open;
    Caption := BuyStructureDataSet.FieldByName('ProductFullName').AsString;// + ' - ' + VarToStr(RemainProductQuery['SUM']);
//    RemainProductQuery.Close;

//  После выбора "Продукта" заносим "Партию" и "Цены"
//    StoreInput;

    DBNumberEditEh2.Enabled := True;
    DBNumberEditEh3.Enabled := True;
//    DBEditEh2.Enabled := True;
//    OKButton.Visible := True;
    DBNumberEditEh2.SetFocus;
  end;
  if DBNumberEditEh1.Text = '' then
  with StoreDataModule do
  begin
    Caption := '...';
    DBEditEh1.Text := '';
    DBNumberEditEh2.Text := '';
    DBNumberEditEh2.Enabled := False;
    DBNumberEditEh3.Text := '';
    DBNumberEditEh3.Enabled := False;
    DBEditEh2.Text := '';
    DBEditEh2.Enabled := False;
  end;
end;

procedure TBuyStructureForm.DBEditEh1EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  if StoreDataModule.BuyStructureDataSet['ProductID'] <> Null then
    CurrentProductID := StoreDataModule.BuyStructureDataSet['ProductID'];
  CurType := StoreDataModule.BuyStructureDataSet['Type'];
  ProductSelectForm := TProductSelectForm.Create(Self);
  ProductSelectForm.ShowModal;
  if (ProductSelectForm.ModalResult = mrOk) and (CurrentProductID <> OldProductID) then
  begin
    with StoreDataModule do
    begin
      BuyStructureDataSet['ProductID'] := CurrentProductID;
      BuyStructureDataSet['ProductFullName'] := CurProductFullName;
//      BuyStructureDataSet['CategoryName'] := CurrentCategoryName;
      BuyStructureDataSet['VATRate'] := CurVATRate;

//    После выбора "Продукта" заносим "Партию" и "Цены"
//      StoreInput;

//      DBEditEh2.Enabled := True;
      DBNumberEditEh2.Enabled := True;
      DBNumberEditEh3.Enabled := True;
//      OKButton.Visible := True;
      DBNumberEditEh2.SetFocus;
    end;
  end;
end;

procedure TBuyStructureForm.DBEditEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBEditEh1EditButtons0Click(Self, h);
end;

procedure TBuyStructureForm.DBEditEh2EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  StoreDataModule.BuyStoreDataSet.Edit;
  BuyStoreItemForm := TBuyStoreItemForm.Create(Self);
  BuyStoreItemForm.ShowModal;
end;

procedure TBuyStructureForm.DBEditEh2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBEditEh2EditButtons0Click(Self, h);
end;

procedure TBuyStructureForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  if OKButton.Visible = True then
    if Key = VK_RETURN then
      SelectNext(ActiveControl As TWinControl, True, True);
//      OKButton.Click;
end;

procedure TBuyStructureForm.RadioGroup1Click(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
    0: DBNumberEditEh3.DataField := 'Price'; //НДС выделить
    1: DBNumberEditEh3.DataField := 'PriceNonVAT'; //НДС начислить
  end;
end;

end.
