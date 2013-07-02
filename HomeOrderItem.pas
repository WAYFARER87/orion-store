unit HomeOrderItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, ExtCtrls, DBLookupEh, Grids, DBGridEh,
  DB, RpCon, RpConDS, RpBase, RpSystem, RpDefine, RpRave, ComCtrls, ToolWin;

type
  THomeOrderItemForm = class(TForm)
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    InsertButton: TToolButton;
    EditButton: TToolButton;
    DeleteButton: TToolButton;
    ToolButton2: TToolButton;
    Panel1: TPanel;
    Label2: TLabel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    Panel3: TPanel;
    OKButton: TButton;
    CancelButton: TButton;
    Label1: TLabel;
    DBEditEh1: TDBEditEh;
    DBEditEh3: TDBEditEh;
    Label3: TLabel;
    Label4: TLabel;
    DBEditEh4: TDBEditEh;
    Label3a: TLabel;
    Label4a: TLabel;
    procedure EnabledButtons;
    procedure HomeOrderPost;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure InsertButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure DBEditEh3EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBEditEh3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEditEh4EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBEditEh4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HomeOrderItemForm: THomeOrderItemForm;

implementation

uses StoreDM, HomeStructure, HomeTypeSelect, DivisionSelect;

{$R *.dfm}

procedure THomeOrderItemForm.EnabledButtons;
begin
//  Если записей нету, то Деактивируем кнопки "Редактировать" и "Удалить",
//  а если есть, Активируем.
  if StoreDataModule.HomeStructureDataSet.IsEmpty then
  begin
    EditButton.Enabled := False;
    EditButton.ShowHint := False;
    DeleteButton.Enabled := False;
    DeleteButton.ShowHint := False;
  end
  else
  begin
    EditButton.Enabled := True;
    EditButton.ShowHint := True;
    DeleteButton.Enabled := True;
    DeleteButton.ShowHint := True;
  end;
end;

procedure THomeOrderItemForm.HomeOrderPost;
begin
  with StoreDataModule do
  begin
    if HomeOrderDataSet.Modified then
    try
      HomeOrderDataSet.Post;
      HomeOrderDataSet.Close;
      HomeOrderDataSet.Open
    except
      Application.MessageBox('Недопустимые значения данных',
        'Ошибка ввода', mb_IconStop);
      Abort;
    end
  else
    HomeOrderDataSet.Cancel;
  end;
end;

procedure THomeOrderItemForm.FormCreate(Sender: TObject);
begin
//  OKButton.Visible := False;
//  CancelButton.Caption := 'Exit';
  EnabledButtons;
//  Запоминаем положение Курсора, что бы вернуться на прежнее место
  CurOrderID := StoreDataModule.HomeOrderDataSet['OrderID'];
  StoreDataModule.TypePriceDataSet.Open;
  Caption := 'Внутренняя накладная';
  case StoreDataModule.HomeOrderDataSet['ProperID'] of
    5:
    begin
      Caption := Caption + ' - Вввод остатков';
      DBEditEh3.Visible := False;
      Label3.Visible := False;
      Label3a.Visible := False;
    end;
    6:
    begin
      Caption := Caption + ' - Излишки';
      DBEditEh3.Visible := False;
      Label3.Visible := False;
      Label3a.Visible := False;
    end;
    7:
    begin
      Caption := Caption + ' - Списание';
      DBEditEh4.Visible := False;
      Label4.Visible := False;
      Label4a.Visible := False;
    end;
    8:
    begin
      Caption := Caption + ' - Пересорт';
      DBEditEh4.Visible := False;
      Label4.Visible := False;
      Label4a.Visible := False;
    end;
    9:
    begin
      Caption := Caption + ' - Перемещение';
      Label3.Caption := 'Склад отправитель:';
      Label3a.Left := 184;
      Label4.Caption := 'Склад получатель:';
      Label4a.Left := 184;
    end;
  end;
  StoreDataModule.DivisionSelectQuery.Open;
  if StoreDataModule.HomeOrderDataSet['OutDivisionID'] <> Null then
  begin
    StoreDataModule.DivisionSelectQuery.Locate('DivisionID', StoreDataModule.HomeOrderDataSet['OutDivisionID'], []);
    Label3a.Caption := StoreDataModule.DivisionSelectQuery.FieldByName('DivisionName').AsString;
  end;
  if StoreDataModule.HomeOrderDataSet['InDivisionID'] <> Null then
  begin
    StoreDataModule.DivisionSelectQuery.Locate('DivisionID', StoreDataModule.HomeOrderDataSet['InDivisionID'], []);
    Label4a.Caption := StoreDataModule.DivisionSelectQuery.FieldByName('DivisionName').AsString;
  end;
  StoreDataModule.DivisionSelectQuery.Close;
end;

procedure THomeOrderItemForm.FormShow(Sender: TObject);
begin
{  if StoreDataModule.HomeOrderDataSet.State = dsInsert then
  begin
    OKButton.Visible := True;
    CancelButton.Caption := 'Cancel';
  end;{}
end;

procedure THomeOrderItemForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with StoreDataModule do
  try
    try
      if ModalResult = mrOk then
      begin
        if HomeOrderDataSet.Modified then
          HomeOrderDataSet.Post;
        HomeTransaction.Commit;
      end
      else
        HomeTransaction.Rollback;
    except
      Application.MessageBox('Недопустимые значения данных',
        'Ошибка ввода', mb_IconStop);
      Abort;
    end; {try except}
  finally
    if TypePriceDataSet.Active = True then
      TypePriceDataSet.Close;
//    Открываем Таблицы "Документы", "Строки Документов" после Commit(Rollback)'а транзакции
    HomeOrderDataSet.Open;
    HomeStructureDataSet.Open;
//    Возвращаемся на прежнее место
//    HomeOrderDataSet.Locate('OrderID', CurOrderID, []);
  end; {try finally}
  Release;
end;

procedure THomeOrderItemForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure THomeOrderItemForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure THomeOrderItemForm.InsertButtonClick(Sender: TObject);
begin
{  with StoreDataModule do
  try
    if HomeOrderDataSet.Modified then
      HomeOrderDataSet.Post;
  except
    Application.MessageBox('Недопустимые значения данных',
      'Ошибка ввода', mb_IconStop);
    Abort;
  end;{}
  StoreDataModule.HomeStructureDataSet.Append;
  StoreDataModule.HomeStructureDataSet['OrderID'] := StoreDataModule.HomeOrderDataSet['OrderID'];
  if StoreDataModule.HomeOrderDataSet['ProperID'] = 6 then
  begin
    StoreDataModule.HomeStructureDataSet['Type'] := -1;
    HomeStructureForm := THomeStructureForm.Create(Self);
    HomeStructureForm.ShowModal;
  end;
  if StoreDataModule.HomeOrderDataSet['ProperID'] = 7 then
  begin
    StoreDataModule.HomeStructureDataSet['Type'] := 1;
    HomeStructureForm := THomeStructureForm.Create(Self);
    HomeStructureForm.ShowModal;
  end;
  if StoreDataModule.HomeOrderDataSet['ProperID'] = 8 then
  begin
//Выбираем Вид Накладной
    HomeTypeSelectForm := THomeTypeSelectForm.Create(Self);
    HomeTypeSelectForm.ShowModal;
    if HomeTypeSelectForm.ModalResult = mrOK then
    begin
      StoreDataModule.HomeStructureDataSet['Type'] := CurType;
      HomeStructureForm := THomeStructureForm.Create(Self);
      HomeStructureForm.ShowModal;
    end
    else
    begin
      StoreDataModule.HomeStructureDataSet.Cancel;
    end;
  end;
  if StoreDataModule.HomeOrderDataSet['ProperID'] = 9 then
  begin
    StoreDataModule.HomeStructureDataSet['Type'] := 0;
    HomeStructureForm := THomeStructureForm.Create(Self);
    HomeStructureForm.ShowModal;
  end;
end;

procedure THomeOrderItemForm.EditButtonClick(Sender: TObject);
begin
  StoreDataModule.HomeStructureDataSet.Edit;
  HomeStructureForm := THomeStructureForm.Create(Self);
  HomeStructureForm.ShowModal;
end;

procedure THomeOrderItemForm.DeleteButtonClick(Sender: TObject);
var
  HomeStrucStr : String;
begin
  HomeStrucStr := StoreDataModule.HomeStructureDataSet.FieldByName('ProductFullName').AsString;
  if Application.MessageBox(PChar('Вы действительно хотите удалить запись"' +
    HomeStrucStr + '"?'),
    'Удаление записи',
    mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
  try
    StoreDataModule.HomeStructureDataSet.Delete;
  except
    Application.MessageBox(PChar('Запись "' + HomeStrucStr + '" удалять нельзя.'),
      'Ошибка удаления', mb_IconStop);
  end;
end;

procedure THomeOrderItemForm.DBEditEh3EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  with StoreDataModule do
  try
    if HomeOrderDataSet.State = dsBrowse then
      HomeOrderDataSet.Edit;
    if HomeOrderDataSet['OutDivisionID'] <> Null then
      CurDivisionID := HomeOrderDataSet['OutDivisionID'];

//  перестраиваем запрос, что бы не видно было "Склад получатель"
    if HomeOrderDataSet['InDivisionID'] <> null then
      DivisionSelectQuery.SQL.Strings[3] := 'AND ("DivisionID" <> ' + HomeOrderDataSet.FieldByName('InDivisionID').AsString + ')';
    DivisionSelectForm := TDivisionSelectForm.Create(Self);
    DivisionSelectForm.ShowModal;
    if DivisionSelectForm.ModalResult = mrOk then
    begin
      HomeOrderDataSet['OutDivisionID'] := CurDivisionID;
      HomeOrderPost;
      Label3a.Caption := CurDivisionName;
    end
    else
      HomeOrderDataSet.Cancel;
  finally
    DivisionSelectQuery.SQL.Strings[3] := '';
  end;
  DBGridEh1.SetFocus;
end;

procedure THomeOrderItemForm.DBEditEh3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBEditEh3EditButtons0Click(Self, h);
end;

procedure THomeOrderItemForm.DBEditEh4EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  with StoreDataModule do
  try
    if HomeOrderDataSet.State = dsBrowse then
      HomeOrderDataSet.Edit;
    if HomeOrderDataSet['InDivisionID'] <> Null then
      CurDivisionID := HomeOrderDataSet['InDivisionID'];

//  перестраиваем запрос, что бы не видно было "Склад отправитель"
    if HomeOrderDataSet['OutDivisionID'] <> null then
      DivisionSelectQuery.SQL.Strings[3] := 'AND ("DivisionID" <> ' + HomeOrderDataSet.FieldByName('OutDivisionID').AsString + ')';
    DivisionSelectForm := TDivisionSelectForm.Create(Self);
    DivisionSelectForm.ShowModal;
    if DivisionSelectForm.ModalResult = mrOk then
    begin
      HomeOrderDataSet['InDivisionID'] := CurDivisionID;
      HomeOrderPost;
      Label4a.Caption := CurDivisionName;
    end
    else
      HomeOrderDataSet.Cancel;
  finally
    DivisionSelectQuery.SQL.Strings[3] := '';
  end;
  DBGridEh1.SetFocus;
end;

procedure THomeOrderItemForm.DBEditEh4KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBEditEh4EditButtons0Click(Self, h);
end;

procedure THomeOrderItemForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    OKButton.Click;
end;

procedure THomeOrderItemForm.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_F2 : InsertButton.Click;
    VK_F3 : EditButton.Click;
    VK_F8 : DeleteButton.Click;
  end;
end;

procedure THomeOrderItemForm.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var
  ItemNo: String;
begin
//Проставляем номера по порядку в строках Документа
  with DBGridEh1.Canvas do
  begin
    if StoreDataModule.HomeStructureDataSet.RecNo <> 0 then
      ItemNo := IntToStr(StoreDataModule.HomeStructureDataSet.RecNo)
    else
      ItemNo := '';
    if Column.Index = 0 then
    begin
      FillRect(Rect);
      TextOut(Rect.Right - 3 - TextWidth(ItemNo), Rect.Top, ItemNo);
    end
    else
      DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

end.
