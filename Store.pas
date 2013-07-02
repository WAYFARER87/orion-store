unit Store;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh,
  DB, RpCon, RpConDS, RpBase, RpSystem, RpDefine, RpRave, FR_DSet, FR_DBSet,
  FR_Class, ComCtrls, ToolWin;

type
  TStoreForm = class(TForm)
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    Panel1: TPanel;
    CloseButton: TButton;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    Splitter1: TSplitter;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    EditButton: TToolButton;
    ToolButton3: TToolButton;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CloseButtonClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StoreForm: TStoreForm;

implementation

uses StoreDM, StoreItem;

{$R *.dfm}

procedure TStoreForm.FormCreate(Sender: TObject);
begin
  with StoreDataModule do
  begin
    with StoreProductDataSet do
    begin
      SelectSQL.Strings[3] :=
        'AND "Products"."ProductID" IN (SELECT "ProductID" FROM "Store" WHERE "Store"."StoreID" IN (SELECT "StoreID" FROM "StoreQty" WHERE ("StoreQty"."DivisionID" IN ' +
        '(SELECT "DivisionID" FROM "Divisions" WHERE "CustomerID" = ' + IntToStr(MainFirm) + '))';
      SelectSQL.Strings[4] := 'AND ("StoreQty"."Qty" > 0)))';
//      ShowMessage(SelectSQL.Text);
      Open;
    end;
//    StoreDataSet.ParamByName('MainFirm').Value := MainFirm;
    StoreQtyQuery.Open;
//    DivisionSelectQuery.Open;
  end;
  CloseButton.Left := Panel1.Width - CloseButton.Width - 10;
  Caption := 'Наличие Товара';
end;

procedure TStoreForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with StoreDataModule do
  begin
    with StoreProductDataSet do
    begin
      Close;
      SelectSQL.Strings[3] := '';
      SelectSQL.Strings[4] := '';
      SelectSQL.Strings[5] := '';
    end;{}
    StoreQtyQuery.Close;
//    DivisionSelectQuery.Close;
  end;
// Удаление формы при ее закрытии
  StoreForm := nil;
  Action    := caFree;
end;

procedure TStoreForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TStoreForm.CheckBox1Click(Sender: TObject);
begin
  with StoreDataModule do
  begin
    with StoreProductDataSet do
    begin
      CurrentProductID := FieldByName('ProductID').AsInteger;
      Close;
      if CheckBox1.Checked then
        SelectSQL.Strings[4] := 'AND ("StoreQty"."Qty" >= 0)))'
      else
        SelectSQL.Strings[4] := 'AND ("StoreQty"."Qty" > 0)))';
      Open;
    end;
    with StoreQtyQuery do
    begin
      CurStoreID := FieldByName('StoreID').AsInteger;
      Close;
      if CheckBox1.Checked then
        SQL.Strings[3] := 'AND ("StoreQty"."Qty" >= 0)'
      else
        SQL.Strings[3] := 'AND ("StoreQty"."Qty" > 0)';
      Open;
    end;
  end;
end;

procedure TStoreForm.Edit1Change(Sender: TObject);
var
  Find : String;
begin
  Find := AnsiUpperCase(Edit1.Text);
  with StoreDataModule.StoreProductDataSet do
  begin
    Close;
    SelectSQL.Strings[5] := 'AND ((UPPER("Categories"."CategoryName" || '' '' || "Products"."ProductName") CONTAINING ''' + Find + '''))';
    Open;
  end;
end;

procedure TStoreForm.EditButtonClick(Sender: TObject);
begin
  StoreDataModule.StoreDataSet.Open;
  StoreDataModule.StoreDataSet.Edit;
  StoreItemForm := TStoreItemForm.Create(Self);
  StoreItemForm.ShowModal;
  StoreDataModule.StoreDataSet.Close;
end;

procedure TStoreForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F3 : EditButton.Click;
    VK_F4 : Edit1.SetFocus;
  end;
end;

procedure TStoreForm.DBGridEh2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var
  ItemNo: String;
begin
//Проставляем номера по порядку в строках Партии
  with DBGridEh2.Canvas do
  begin
    if StoreDataModule.StoreQtyQuery.RecNo <> 0 then
      ItemNo := IntToStr(StoreDataModule.StoreQtyQuery.RecNo)
    else
      ItemNo := '';
    if Column.Index = 0 then
    begin
      FillRect(Rect);
      TextOut(Rect.Right - 3 - TextWidth(ItemNo), Rect.Top, ItemNo);
    end
    else
      DBGridEh2.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

end.
