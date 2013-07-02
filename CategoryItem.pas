unit CategoryItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, ExtCtrls, DBLookupEh, DB;

type
  TCategoryItemForm = class(TForm)
    OKButton: TButton;
    CancelButton: TButton;
    Bevel1: TBevel;
    DBEditEh1: TDBEditEh;
    DBEditEh2: TDBEditEh;
    DBEditEh4: TDBEditEh;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    DBEditEh3: TDBEditEh;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure DBEditEh3EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBEditEh3EditButtons1Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBEditEh3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEditEh4EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBEditEh4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CategoryItemForm: TCategoryItemForm;

implementation

uses StoreDM, VAT, Group;

{$R *.dfm}

procedure TCategoryItemForm.FormCreate(Sender: TObject);
begin
  if StoreDataModule.CategoryDataSet['CategoryName'] <> Null then
    Caption := StoreDataModule.CategoryDataSet.FieldByName('CategoryName').AsString +
               ' - ' +
               StoreDataModule.CategoryDataSet.FieldByName('VATRateName').AsString
  else
    Caption := StoreDataModule.CategoryDataSet.FieldByName('CategoryName').AsString;
end;

procedure TCategoryItemForm.FormShow(Sender: TObject);
begin
  DBEditEh2.SetFocus;
end;

procedure TCategoryItemForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CurCategoryID := StoreDataModule.CategoryDataSet['CategoryID'];
  with StoreDataModule do
  try
    try
      if ModalResult = mrOk then
      begin
        if CategoryDataSet.Modified then
          CategoryDataSet.Post;
        CategoryTransaction.Commit;
      end
      else
        CategoryTransaction.Rollback;
    except
      Application.MessageBox('Недопустимые значения данных',
        'Ошибка ввода', mb_IconStop);
      Abort;
    end; {try except}
  finally
//    Открываем Таблицы "Категории" после Commit'а транзакции
    CategoryDataSet.Open;
  end; {try finally}
  Release;
end;

procedure TCategoryItemForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TCategoryItemForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TCategoryItemForm.DBEditEh3EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  CurGroupID := StoreDataModule.CategoryDataSet.FieldByName('GroupID').AsInteger;
  GroupForm := TGroupForm.Create(Self);
  GroupForm.ShowModal;
  if GroupForm.ModalResult = mrOk then
  with StoreDataModule do
  begin
    CategoryDataSet['GroupID'] := CurGroupID;
    CategoryDataSet['GroupName'] := CurGroupName;
  end;
end;

procedure TCategoryItemForm.DBEditEh3EditButtons1Click(Sender: TObject;
  var Handled: Boolean);
begin
  StoreDataModule.CategoryDataSet['GroupID'] := 0;
  StoreDataModule.CategoryDataSet['GroupName'] := '';
end;

procedure TCategoryItemForm.DBEditEh3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBEditEh3EditButtons0Click(Self, h);
  if Key = VK_F8 then
    DBEditEh3EditButtons1Click(Self, h);
end;

procedure TCategoryItemForm.DBEditEh4EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  if StoreDataModule.CategoryDataSet.State = dsInsert then
    StoreDataModule.CategoryDataSet.Post;
  VATForm := TVATForm.Create(Self);
  VATForm.ShowModal;
  CurCategoryID := StoreDataModule.CategoryDataSet['CategoryID'];
//Переоткрываем таблицы для обновления
  StoreDataModule.CategoryVATQuery.Close;
  StoreDataModule.CategoryDataSet.Close;
  StoreDataModule.CategoryVATQuery.Open;
  StoreDataModule.CategoryDataSet.Open;
end;

procedure TCategoryItemForm.DBEditEh4KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBEditEh4EditButtons0Click(Self, h);
end;

procedure TCategoryItemForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    SelectNext(ActiveControl As TWinControl, True, True);
end;

end.
