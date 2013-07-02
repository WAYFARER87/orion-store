unit InitialRemains;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, ExtCtrls, DBLookupEh, Grids, DBGridEh,
  DB, RpCon, RpConDS, RpBase, RpSystem, RpDefine, RpRave, ComCtrls, ToolWin;

type
  TInitialRemainsForm = class(TForm)
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
    Label3a: TLabel;
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
  InitialRemainsForm: TInitialRemainsForm;

implementation

uses StoreDM, HomeStructure, HomeTypeSelect, DivisionSelect;

{$R *.dfm}

procedure TInitialRemainsForm.EnabledButtons;
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

procedure TInitialRemainsForm.HomeOrderPost;
begin
  with StoreDataModule do
  begin
    if HomeOrderDataSet.Modified then
    try
      HomeOrderDataSet.Post;
      HomeOrderDataSet.Close;
      HomeOrderDataSet.Open;
      HomeOrderDataSet.Last;
    except
      Application.MessageBox('Недопустимые значения данных'+#10#13+
        '(TInitialRemainsForm.HomeOrderPost)',
        'Ошибка ввода', mb_IconStop);
      Abort;
    end
  else
    HomeOrderDataSet.Cancel;
  end;
end;

procedure TInitialRemainsForm.FormCreate(Sender: TObject);
begin
//  OKButton.Visible := False;
//  CancelButton.Caption := 'Закрыть';

  StoreDataModule.HomeOrderDataSet.Open;
  StoreDataModule.HomeOrderDataSet.Locate('ProperID', 5, []);
//  Если не находим "Документ", то создаем и вводим Данные в заголовок
  if StoreDataModule.HomeOrderDataSet['ProperID'] <> 5 then
  begin
    StoreDataModule.HomeOrderDataSet.Append;
    StoreDataModule.HomeOrderDataSet['FirmID'] := MainFirm;
    StoreDataModule.HomeOrderDataSet['Date'] := Now;
    StoreDataModule.HomeOrderDataSet['CustomerID'] := MainFirm;
    StoreDataModule.HomeOrderDataSet['PriceID'] := 1;//"Цена Закупа"
    StoreDataModule.HomeOrderDataSet['ProperID'] := 5;//"Ввод остатков"
    StoreDataModule.HomeOrderDataSet['InDivisionID'] := MainDivision;
    StoreDataModule.HomeOrderDataSet.Post;
  end;
//  Открываем "Строки Документа"
  StoreDataModule.HomeStructureDataSet.Open;
  StoreDataModule.HomeStructureDataSet.Last;
  EnabledButtons;

//  Запоминаем положение Курсора, чтобы вернуться на прежнее место
  CurOrderID := StoreDataModule.HomeOrderDataSet['OrderID'];
  StoreDataModule.TypePriceDataSet.Open;
  Caption := 'Ввод начальных остатков';
  StoreDataModule.DivisionSelectQuery.Open;
  if StoreDataModule.HomeOrderDataSet['InDivisionID'] <> Null then
  begin
    StoreDataModule.DivisionSelectQuery.Locate('DivisionID', StoreDataModule.HomeOrderDataSet['InDivisionID'], []);
    Label3a.Caption := StoreDataModule.DivisionSelectQuery.FieldByName('DivisionName').AsString;
  end;
  StoreDataModule.DivisionSelectQuery.Close;
end;

procedure TInitialRemainsForm.FormShow(Sender: TObject);
begin
{  if StoreDataModule.HomeOrderDataSet.State = dsInsert then
  begin
    OKButton.Visible := True;
    CancelButton.Caption := 'Cancel';
  end;{}
end;

procedure TInitialRemainsForm.FormClose(Sender: TObject;
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
      Application.MessageBox('Недопустимые значения данных'+#10#13+'(HomeOrderDataSet)',
        'Ошибка ввода', mb_IconStop);
      Abort;
    end; {try except}
  finally
    if TypePriceDataSet.Active then
      TypePriceDataSet.Close;
  end; {try finally}
  Release;
end;

procedure TInitialRemainsForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TInitialRemainsForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TInitialRemainsForm.InsertButtonClick(Sender: TObject);
begin
  StoreDataModule.HomeStructureDataSet.Append;
  StoreDataModule.HomeStructureDataSet['OrderID'] := StoreDataModule.HomeOrderDataSet['OrderID'];
  StoreDataModule.HomeStructureDataSet['Type'] := -1;
  HomeStructureForm := THomeStructureForm.Create(Self);
  HomeStructureForm.ShowModal;
end;

procedure TInitialRemainsForm.EditButtonClick(Sender: TObject);
begin
  StoreDataModule.HomeStructureDataSet.Edit;
  HomeStructureForm := THomeStructureForm.Create(Self);
  HomeStructureForm.ShowModal;
end;

procedure TInitialRemainsForm.DeleteButtonClick(Sender: TObject);
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

procedure TInitialRemainsForm.DBEditEh3EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  with StoreDataModule do
  begin
    if HomeOrderDataSet.State = dsBrowse then
      HomeOrderDataSet.Edit;

    DivisionSelectForm := TDivisionSelectForm.Create(Self);
    DivisionSelectForm.ShowModal;
    if DivisionSelectForm.ModalResult = mrOk then
    begin
      HomeOrderDataSet['InDivisionID'] := CurDivisionID;
      HomeOrderPost;
      Label3a.Caption := CurDivisionName;
    end
    else
      HomeOrderDataSet.Cancel;
  end;
  DBGridEh1.SetFocus;
end;

procedure TInitialRemainsForm.DBEditEh3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBEditEh3EditButtons0Click(Self, h);
end;

procedure TInitialRemainsForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    OKButton.Click;
end;

procedure TInitialRemainsForm.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_F2 : InsertButton.Click;
    VK_F3 : EditButton.Click;
    VK_F8 : DeleteButton.Click;
  end;
end;

procedure TInitialRemainsForm.DBGridEh1DrawColumnCell(Sender: TObject;
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
