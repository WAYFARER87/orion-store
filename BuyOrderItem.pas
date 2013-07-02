unit BuyOrderItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, ExtCtrls, DBLookupEh, Grids, DBGridEh,
  DB, RpCon, RpConDS, RpBase, RpSystem, RpDefine, RpRave, ComCtrls, ToolWin;

type
  TBuyOrderItemForm = class(TForm)
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    InsertButton: TToolButton;
    EditButton: TToolButton;
    DeleteButton: TToolButton;
    ToolButton2: TToolButton;
    Panel1: TPanel;
    Label1: TLabel;
    DBEditEh1: TDBEditEh;
    Label5: TLabel;
    DBDateTimeEditEh2: TDBDateTimeEditEh;
    Label4: TLabel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    Label3: TLabel;
    DBEditEh3: TDBEditEh;
    Panel3: TPanel;
    OKButton: TButton;
    CancelButton: TButton;
    DBEditEh2: TDBEditEh;
    Label2: TLabel;
    Label4a: TLabel;
    Label6: TLabel;
    DBDateTimeEditEh3: TDBDateTimeEditEh;
    Label7: TLabel;
    DBEditEh4: TDBEditEh;
    procedure EnabledButtons;
    procedure BuyOrderPost;
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
    procedure DBEditEh2EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBEditEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BuyOrderItemForm: TBuyOrderItemForm;

implementation

uses StoreDM, BuyStructure, CustomerSelect, DivisionSelect;

{$R *.dfm}

procedure TBuyOrderItemForm.EnabledButtons;
begin
//  Если записей нету, то Деактивируем кнопки "Редактировать" и "Удалить",
//  а если есть, Активируем.
  if StoreDataModule.BuyStructureDataSet.IsEmpty then
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

procedure TBuyOrderItemForm.BuyOrderPost;
begin
  with StoreDataModule do
  begin
    if BuyOrderDataSet.Modified then
    try
      BuyOrderDataSet.Post;
      BuyOrderDataSet.Close;
      BuyOrderDataSet.Open
    except
      Application.MessageBox('Недопустимые значения данных',
        'Ошибка ввода', mb_IconStop);
      Abort;
    end
    else
      BuyOrderDataSet.Cancel;
  end;
end;

procedure TBuyOrderItemForm.FormCreate(Sender: TObject);
begin
  EnabledButtons;
//  Запоминаем положение Курсора, что бы вернуться на прежнее место
  CurOrderID := StoreDataModule.BuyOrderDataSet['OrderID'];
  Caption := 'Приходная накладная';
  Label4a.Caption := StoreDataModule.BuyOrderDataSet['DivisionName'];
end;

procedure TBuyOrderItemForm.FormShow(Sender: TObject);
begin
  if DBEditEh3.Value = '' then
    DBEditEh3.SetFocus
  else
    DBGridEh1.SetFocus;
end;

procedure TBuyOrderItemForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with StoreDataModule do
  try
    try
      if ModalResult = mrOk then
      begin
        if BuyOrderDataSet.Modified then
          BuyOrderDataSet.Post;
        BuyOrderTransaction.Commit;
      end
      else
        BuyOrderTransaction.Rollback;
    except
      Application.MessageBox('Недопустимые значения данных',
        'Ошибка ввода', mb_IconStop);
      Abort;
    end; {try except}
  finally
//    Открываем Таблицы "Документы", "Строки Документов" после Commit'а транзакции
    BuyOrderDataSet.Open;
    BuyStructureDataSet.Open;
  end; {try finally}
  Release;
end;

procedure TBuyOrderItemForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TBuyOrderItemForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TBuyOrderItemForm.InsertButtonClick(Sender: TObject);
begin
  with StoreDataModule do
  try
    if BuyOrderDataSet.Modified then
      BuyOrderDataSet.Post;
  except
    Application.MessageBox('Недопустимые значения данных',
      'Ошибка ввода', mb_IconStop);
    Abort;
  end;
  StoreDataModule.BuyStructureDataSet.Append;
  StoreDataModule.BuyStructureDataSet['OrderID'] := StoreDataModule.BuyOrderDataSet['OrderID'];
  StoreDataModule.BuyStructureDataSet['Type'] := -1;
  BuyStructureForm := TBuyStructureForm.Create(Self);
  BuyStructureForm.ShowModal;
  if BuyStructureForm.ModalResult = mrOK then
  begin
    StoreDataModule.BuyStructureDataSet.Close;
    StoreDataModule.BuyStructureDataSet.Open;
//    OKButton.Visible := True;
//    CancelButton.Caption := 'Cancel';
    EnabledButtons;
  end;
end;

procedure TBuyOrderItemForm.EditButtonClick(Sender: TObject);
begin
{  with StoreDataModule do
  try
    if BuyOrderDataSet.Modified then
      BuyOrderDataSet.Post;
  except
    Application.MessageBox('Недопустимые значения данных',
      'Ошибка ввода', mb_IconStop);
    Abort;
  end;{}
  StoreDataModule.BuyStructureDataSet.Edit;
  BuyStructureForm := TBuyStructureForm.Create(Self);
  BuyStructureForm.ShowModal;
end;

procedure TBuyOrderItemForm.DeleteButtonClick(Sender: TObject);
var
  DeletedStr : String;
begin
  DeletedStr := StoreDataModule.BuyStructureDataSet.FieldByName('ProductFullName').AsString;
  if Application.MessageBox(PChar('Вы действительно хотите удалить запись"' +
    DeletedStr + '"?'),
    'Удаление записи',
    mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
  try
    StoreDataModule.BuyStructureDataSet.Delete;
    EnabledButtons;
  except
    Application.MessageBox(PChar('Запись "' + DeletedStr + '" удалять нельзя.'),
      'Ошибка удаления', mb_IconStop);
  end;
end;

procedure TBuyOrderItemForm.DBEditEh3EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  with StoreDataModule do
  begin
    if BuyOrderDataSet.State = dsBrowse then
      BuyOrderDataSet.Edit;
    if BuyOrderDataSet['CustomerID'] <> Null then
      CurCustomerID := BuyOrderDataSet['CustomerID'];
    CustomerSelectForm := TCustomerSelectForm.Create(Self);
    CustomerSelectForm.ShowModal;
    if CustomerSelectForm.ModalResult = mrOk then
    begin
      BuyOrderDataSet['CustomerID'] := CurCustomerID;
      BuyOrderPost;
      DBGridEh1.SetFocus;
    end
    else
      BuyOrderDataSet.Cancel;
  end;
end;

procedure TBuyOrderItemForm.DBEditEh3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBEditEh3EditButtons0Click(Self, h);
end;

procedure TBuyOrderItemForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    OKButton.Click;
end;

procedure TBuyOrderItemForm.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_F2 : InsertButton.Click;
    VK_F3 : if EditButton.Enabled = true then
            EditButton.Click;
    VK_F8 : if DeleteButton.Enabled = true then
            DeleteButton.Click;
  end;
end;

procedure TBuyOrderItemForm.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var
  ItemNo: String;
begin
//Проставляем номера по порядку в строках Документа
  with DBGridEh1.Canvas do
  begin
    if StoreDataModule.BuyStructureDataSet.RecNo <> 0 then
      ItemNo := IntToStr(StoreDataModule.BuyStructureDataSet.RecNo)
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

procedure TBuyOrderItemForm.DBEditEh2EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  with StoreDataModule do
  begin
    if BuyOrderDataSet.State = dsBrowse then
      BuyOrderDataSet.Edit;
    if BuyOrderDataSet['InDivisionID'] <> Null then
      CurDivisionID := BuyOrderDataSet['InDivisionID'];
    DivisionSelectForm := TDivisionSelectForm.Create(Self);
    DivisionSelectForm.ShowModal;
    if DivisionSelectForm.ModalResult = mrOk then
    begin
      BuyOrderDataSet['InDivisionID'] := CurDivisionID;
      BuyOrderPost;
      Label4a.Caption := CurDivisionName;
      DBGridEh1.SetFocus;
    end
    else
      BuyOrderDataSet.Cancel;
  end;
end;

procedure TBuyOrderItemForm.DBEditEh2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBEditEh2EditButtons0Click(Self, h);
end;

end.
