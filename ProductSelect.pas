unit ProductSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh,
  DB, ComCtrls, ToolWin;

type
  TProductSelectForm = class(TForm)
    Panel1: TPanel;
    CancelButton: TButton;
    OKButton: TButton;
    DBGridEh1: TDBGridEh;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    InsertButton: TToolButton;
    EditButton: TToolButton;
    DeleteButton: TToolButton;
    ToolButton2: TToolButton;
    Edit1: TEdit;
    DBGridEh2: TDBGridEh;
    Splitter1: TSplitter;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure InsertButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ProductSelectForm: TProductSelectForm;

implementation

uses StoreDM, ProductItem;

var
  CloseStatus : Boolean;

{$R *.dfm}

procedure TProductSelectForm.FormCreate(Sender: TObject);
var
  SQLTxt: String;
begin
  with StoreDataModule do
  begin
    if ProductSelectQuery.Active = False then
      ProductSelectQuery.Open;
    ProductSelectQuery.Locate('ProductID', CurrentProductID, []);

//Если енто расход, то подключаем Партии и отключаем Кнопки "F2", "F8"
    if (CurType = 1) or (CurType = 0) then
    begin
      if StoreSelectQuery.Active = True then
        StoreSelectQuery.Close;

//Перезаписывается SQL-запрос для обновления параметров...
      SQLTxt := StoreSelectQuery.SQL.Text;
      StoreSelectQuery.SQL.Clear;
      StoreSelectQuery.SQL.SetText(PChar(SQLTxt));

      StoreSelectQuery.DataSource := ProductSelectDataSource;
      StoreSelectQuery.ParamByName('PriceID').Value := CurPriceID;
      StoreSelectQuery.ParamByName('DivisionID').Value := CurDivisionID;
      StoreSelectQuery.Open;
      StoreSelectQuery.Locate('StoreID', CurStoreID, []);

      InsertButton.Visible := False;
      InsertButton.Enabled := False;
      DeleteButton.Visible := False;
      DeleteButton.Enabled := False;
    end
    else
      DBGridEh2.Visible := False;
  end;
  Caption := 'Выбор Товара';
end;

procedure TProductSelectForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with StoreDataModule do
  try
    try
      if ModalResult = mrOk then
      begin
        CurrentProductID := ProductSelectQuery['ProductID'];
        CurProductFullName := ProductSelectQuery['ProductFullName'];
        CurVATRate := ProductSelectQuery['VATRate'];
        CurPack := ProductSelectQuery['Pack'];
        if (CurType = 1) or (CurType = 0) then
        begin
          CurStoreID := StoreSelectQuery['StoreID'];
          CurPrice := StoreSelectQuery['Price'];
        end;
      end;
    except
      Application.MessageBox('Недопустимые значения данных',
        'Ошибка ввода', mb_IconStop);
      Abort;
    end;
  finally
    if ProductSelectQuery.Active = True then
      ProductSelectQuery.Close;
    ProductSelectQuery.SQL.Strings[4] := '';
    if StoreSelectQuery.Active = True then
      StoreSelectQuery.Close;
    StoreSelectQuery.DataSource := nil;
  end; {try finally}
end;

procedure TProductSelectForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TProductSelectForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TProductSelectForm.Edit1Change(Sender: TObject);
var
  Find : String;
begin
  Find := AnsiUpperCase(Edit1.Text);
  with StoreDataModule.ProductSelectQuery do
  begin
    Close;
    SQL.Strings[4] := ' AND ((UPPER("Categories"."CategoryName" || '' '' || "Products"."ProductName") LIKE ''%' + Find + '%''))';
    Open;
  end;
end;

procedure TProductSelectForm.InsertButtonClick(Sender: TObject);
begin
  if StoreDataModule.ProductDataSet.Active = False then
  begin
    CloseStatus := True;
    StoreDataModule.ProductDataSet.Open;
  end;
  StoreDataModule.ProductDataSet.Append;
  ProductItemForm := TProductItemForm.Create(Self);
  ProductItemForm.ShowModal;
  if ProductItemForm.ModalResult = mrOK then
  begin
    StoreDataModule.ProductSelectQuery.Close;
    StoreDataModule.ProductSelectQuery.Open;
    StoreDataModule.ProductSelectQuery.Locate('ProductID', CurrentProductID, []);
  end;
  if CloseStatus = True then
  begin
    StoreDataModule.ProductDataSet.Close;
    CloseStatus := False;
  end;
end;

procedure TProductSelectForm.EditButtonClick(Sender: TObject);
begin
  if StoreDataModule.ProductDataSet.Active = False then
  begin
    CloseStatus := True;
    StoreDataModule.ProductDataSet.Open;
  end;
  StoreDataModule.ProductDataSet.Locate('ProductID', StoreDataModule.ProductSelectQuery['ProductID'], []);
  StoreDataModule.ProductDataSet.Edit;
  ProductItemForm := TProductItemForm.Create(Self);
  ProductItemForm.ShowModal;
  if ProductItemForm.ModalResult = mrOK then
  begin
    StoreDataModule.ProductSelectQuery.Close;
    StoreDataModule.ProductSelectQuery.Open;
    StoreDataModule.ProductSelectQuery.Locate('ProductID', CurrentProductID, []);
  end;
  if CloseStatus = True then
  begin
    StoreDataModule.ProductDataSet.Close;
    CloseStatus := False;
  end;
end;

procedure TProductSelectForm.DeleteButtonClick(Sender: TObject);
var
  ProductStr : String;
begin
  ProductStr := StoreDataModule.ProductSelectQuery.FieldByName('ProductFullName').AsString;
  if StoreDataModule.ProductDataSet.Active = False then
  begin
    CloseStatus := True;
    StoreDataModule.ProductDataSet.Open;
  end;
  StoreDataModule.ProductDataSet.Locate('ProductID', StoreDataModule.ProductSelectQuery['ProductID'], []);
  if Application.MessageBox(PChar('Вы действительно хотите удалить запись"' +
    ProductStr + '"?'),
    'Удаление записи',
    mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
  try
    StoreDataModule.ProductDataSet.Delete;
  except
    Application.MessageBox(PChar('Запись "' + ProductStr + '" удалять нельзя.'),
      'Ошибка удаления', mb_IconStop);
  end;
  if CloseStatus = True then
  begin
    StoreDataModule.ProductDataSet.Close;
    CloseStatus := False;
  end;
  StoreDataModule.ProductSelectQuery.Close;
  StoreDataModule.ProductSelectQuery.Open;
end;

procedure TProductSelectForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN : OKButton.Click;
    VK_F2 : if InsertButton.Enabled = true then
            InsertButton.Click;
    VK_F3 : if EditButton.Enabled = true then
            EditButton.Click;
    VK_F8 : if DeleteButton.Enabled = true then
            DeleteButton.Click;
    VK_F4 : Edit1.SetFocus;
  end;
end;

end.
