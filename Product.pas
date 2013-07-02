unit Product;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh,
  DB, ComCtrls, ToolWin;

type
  TProductForm = class(TForm)
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    CloseButton: TButton;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    InsertButton: TToolButton;
    EditButton: TToolButton;
    DeleteButton: TToolButton;
    ToolButton2: TToolButton;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CloseButtonClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure InsertButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure DBGridEh1SortMarkingChanged(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
//    SaveRecPos: TBookMark;
  public
    { Public declarations }
  end;

var
  ProductForm: TProductForm;

implementation

uses StoreDM, ProductItem, ssdefines;

{$R *.dfm}

procedure TProductForm.FormCreate(Sender: TObject);
begin
  CloseButton.Left := Panel1.Width - CloseButton.Width - 10;
  StoreDataModule.ProductDataSet.Open;
  Caption := 'Справочник Товаров';
end;

procedure TProductForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with StoreDataModule.ProductDataSet do
  begin
    Close;
    SelectSQL.Strings[3] := '';
  end;
// Удаление формы при ее закрытии
  ProductForm := nil;
  Action      := caFree;
end;

procedure TProductForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TProductForm.Edit1Change(Sender: TObject);
var
  Find : String;
begin
  Find := AnsiUpperCase(Edit1.Text);
  with StoreDataModule.ProductDataSet do
  begin
    Close;
    SelectSQL.Strings[3] := 'AND (UPPER("ProductName") CONTAINING ''' + Find + ''')';
    Open;
  end;
end;

procedure TProductForm.InsertButtonClick(Sender: TObject);
begin
  if assigned(ProductItemForm) then showmessage('form is assigned to');
  StoreDataModule.ProductDataSet.Append;
  ProductItemForm := TProductItemForm.Create(insertbutton);
  productitemform.ModeAEC:=mAdd;
  ProductItemForm.ShowModal;
  freeandnil(ProductItemForm);
end;

procedure TProductForm.EditButtonClick(Sender: TObject);
begin
  if assigned(ProductItemForm) then showmessage('form is assigned to');
  StoreDataModule.ProductDataSet.Edit;
  ProductItemForm := TProductItemForm.Create(Self);
  productitemform.ModeAEC:=mEdit;
  ProductItemForm.ShowModal;
  freeandnil(ProductItemForm);
end;

procedure TProductForm.DeleteButtonClick(Sender: TObject);
var
  ProductStr: String;
begin
  ProductStr := StoreDataModule.ProductDataSet.FieldByName('ProductName').AsString;
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
end;

procedure TProductForm.DBGridEh1DblClick(Sender: TObject);
begin
  EditButton.Click;
end;

procedure TProductForm.DBGridEh1TitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
//var
//  i: Integer;
begin
//Сортировка по клику на заголовке столбца
{  CurrentProductID := StoreDataModule.ProductDataSet['ProductID'];
  if Column.Title.Font.Color = clRed then
  with StoreDataModule.ProductDataSet do
  begin
    SelectSQL.Strings[SelectSQL.Count - 1] := 'ORDER BY "ProductName", "ProductID"';
    Close;
    Open;
    for i := 0 to DBGridEh1.Columns.Count - 1 do
    begin
      DBGridEh1.Columns.Items[i].Title.Font.Color := clWindowText;
    end;
  end
  else
  with StoreDataModule.ProductDataSet do
  begin
    SelectSQL.Strings[SelectSQL.Count - 1] := 'ORDER BY "' + Column.FieldName + '", "ProductID"';
    Close;
    Open;
    for i := 0 to DBGridEh1.Columns.Count - 1 do
    begin
      DBGridEh1.Columns.Items[i].Title.Font.Color := clWindowText;
    end;
    Column.Title.Font.Color := clRed;
  end;{}
end;

procedure TProductForm.DBGridEh1SortMarkingChanged(Sender: TObject);
var i: Integer;
    s: String;
   function DeleteStr(Str: String; SubStr: String): String;
   begin
     i := Pos(SubStr, Str);
     if i <> 0 then
       Delete(Str, i, Length(SubStr));
     Result := Str;
   end;
begin
  CurrentProductID := StoreDataModule.ProductDataSet['ProductID'];
  s := '';
  for i := 0 to DBGridEh1.SortMarkedColumns.Count-1 do
  if DBGridEh1.SortMarkedColumns[i].Title.SortMarker = smUpEh then
    s := s + '"' + DBGridEh1.SortMarkedColumns[i].FieldName + '"' + ' DESC , '
  else
    s := s + '"' + DBGridEh1.SortMarkedColumns[i].FieldName + '"' + ', ';
  if s <> '' then
    s := 'ORDER BY ' + Copy(s, 1, Length(s) - 2);
  s := DeleteStr(s, '1');
  StoreDataModule.ProductDataSet.SelectSQL.Strings[4] := s;
  StoreDataModule.ProductDataSet.Close;
  StoreDataModule.ProductDataSet.Open;
end;

procedure TProductForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F2 : InsertButton.Click;
    VK_F3 : EditButton.Click;
    VK_F7 : Edit1.SetFocus;
    VK_F8 : DeleteButton.Click;
  end;
end;

end.
