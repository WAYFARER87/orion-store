unit VAT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh,
  DB, ComCtrls, ToolWin;

type
  TVATForm = class(TForm)
    Panel1: TPanel;
    ExitButton: TButton;
    DBGridEh1: TDBGridEh;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    InsertButton: TToolButton;
    EditButton: TToolButton;
    DeleteButton: TToolButton;
    ToolButton2: TToolButton;
    Edit1: TEdit;
    procedure EnabledButtons;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExitButtonClick(Sender: TObject);
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
  VATForm: TVATForm;
  CustomerID : String;

implementation

uses StoreDM, VATItem;

{$R *.dfm}

procedure TVATForm.EnabledButtons;
begin
//  Если записей нету, то Деактивируем кнопки "Редактировать" и "Удалить",
//  а если есть, Активируем.
  if StoreDataModule.VATDataSet.IsEmpty then
  begin
    EditButton.Enabled := False;
    DeleteButton.Enabled := False
  end
  else
  begin
    EditButton.Enabled := True;
    DeleteButton.Enabled := True
  end;
end;

procedure TVATForm.FormCreate(Sender: TObject);
begin
  StoreDataModule.VATDataSet.Open;
  StoreDataModule.VATDataSet.Locate('VATRateName', StoreDataModule.CategoryDataSet['VATRateName'], []);
  Caption := 'Стаки НДС: ' + StoreDataModule.CategoryDataSet.FieldByName('CategoryName').AsString;
  EnabledButtons;
end;

procedure TVATForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  CurVATRateName := StoreDataModule.VATDataSet['VATRateName'];
  StoreDataModule.VATDataSet.Close;
  Release;
end;

procedure TVATForm.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TVATForm.InsertButtonClick(Sender: TObject);
begin
  with StoreDataModule do
  begin
    VATDataSet.Append;
    VATDataSet['CategoryID'] := CategoryDataSet['CategoryID'];
    VATDataSet['Date'] := now;
    VATDataSet['VATRateID'] := 1;
    VATDataSet['VATRateName'] := 'Без НДС';
    VATDataSet['VATRate'] := 0;
  end;
  VATItemForm := TVATItemForm.Create(Self);
  VATItemForm.ShowModal;
  if VATItemForm.ModalResult = mrOK then
    EnabledButtons;
end;

procedure TVATForm.EditButtonClick(Sender: TObject);
begin
  StoreDataModule.VATDataSet.Edit;
  VATItemForm := TVATItemForm.Create(Self);
  VATItemForm.ShowModal;
end;

procedure TVATForm.DeleteButtonClick(Sender: TObject);
var
  DeletedStr: String;
begin
  DeletedStr := StoreDataModule.VATDataSet.FieldByName('VATRateName').AsString;
  if Application.MessageBox(PChar('Вы действительно хотите удалить запись"' +
    DeletedStr + '"?'),
    'Удаление записи',
    mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
  try
    StoreDataModule.VATDataSet.Delete;
    EnabledButtons;
  except
    Application.MessageBox(PChar('Запись "' + DeletedStr + '" удалять нельзя.'),
      'Ошибка удаления', mb_IconStop);
  end;
end;

procedure TVATForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F2 : InsertButton.Click;
    VK_F3 : EditButton.Click;
    VK_F8 : DeleteButton.Click;
    VK_F4 : Edit1.SetFocus;
    VK_RETURN: ExitButton.Click;
  end;
end;

end.
