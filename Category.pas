unit Category;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh,
  DB, ComCtrls, ToolWin;

type
  TCategoryForm = class(TForm)
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
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure InsertButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CategoryForm: TCategoryForm;

implementation

uses StoreDM, CategoryItem;

{$R *.dfm}

procedure TCategoryForm.FormCreate(Sender: TObject);
begin
  StoreDataModule.CategoryDataSet.Open;
  StoreDataModule.CategoryVATQuery.Open;
  StoreDataModule.CategoryVATQuery.Locate('CategoryID', StoreDataModule.ProductDataSet['CategoryID'], []);
  Caption := 'Справочник Категорий';
end;

procedure TCategoryForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with StoreDataModule.CategoryVATQuery do
  begin
    CurCategoryID := FieldByName('CategoryID').AsInteger;
    CurrentCategoryName := FieldByName('CategoryName').AsString;
    Close;
    SQL.Strings[3] := '';
  end;
  StoreDataModule.CategoryDataSet.Close;
  Release;
end;

procedure TCategoryForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TCategoryForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TCategoryForm.Edit1Change(Sender: TObject);
var
  Find : String;
begin
  Find := AnsiUpperCase(Edit1.Text);
  with StoreDataModule.CategoryVATQuery do
  begin
    Close;
    SQL.Strings[3] := 'AND (UPPER("CategoryName" COLLATE PXW_CYRL) CONTAINING ''' + Find + ''')';
    Open;
  end;
end;

procedure TCategoryForm.InsertButtonClick(Sender: TObject);
begin
  StoreDataModule.CategoryDataSet.Append;
  CategoryItemForm := TCategoryItemForm.Create(Self);
  CategoryItemForm.ShowModal;
end;

procedure TCategoryForm.EditButtonClick(Sender: TObject);
begin
  StoreDataModule.CategoryDataSet.Locate('CategoryID', StoreDataModule.CategoryVATQuery['CategoryID'], []);
  StoreDataModule.CategoryDataSet.Edit;
  CategoryItemForm := TCategoryItemForm.Create(Self);
  CategoryItemForm.ShowModal;
end;

procedure TCategoryForm.DeleteButtonClick(Sender: TObject);
var
  DeletedStr : String;
begin
  StoreDataModule.CategoryDAtaSet.Locate('CategoryID', StoreDataModule.CategoryVATQuery['CategoryID'], []);
  DeletedStr := StoreDataModule.CategoryDataSet.FieldByName('CategoryName').AsString;
  if Application.MessageBox(PChar('Вы действительно хотите удалить запись"' +
    DeletedStr + '"?'),
    'Удаление записи',
    mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
  try
    StoreDataModule.CategoryDataSet.Delete;
    StoreDataModule.CategoryVATQuery.Close;
    StoreDataModule.CategoryVATQuery.Open;
  except
    Application.MessageBox(PChar('Запись "' + DeletedStr + '" удалять нельзя.'),
      'Ошибка удаления', mb_IconStop);
  end;
end;

procedure TCategoryForm.DBGridEh1DblClick(Sender: TObject);
begin
  OKButton.Click;
end;

procedure TCategoryForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN : OKButton.Click;
    VK_F2 : InsertButton.Click;
    VK_F3 : EditButton.Click;
    VK_F8 : DeleteButton.Click;
    VK_F4 : Edit1.SetFocus;
  end;
end;

end.
