unit HomeStoreSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh, ComCtrls, ToolWin;

type
  THomeStoreSelectForm = class(TForm)
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
  HomeStoreSelectForm: THomeStoreSelectForm;

implementation

uses StoreDM, HomeStoreItem;

{$R *.dfm}

procedure THomeStoreSelectForm.FormCreate(Sender: TObject);
begin
  with StoreDataModule do
  begin
    if HomeStructureDataSet['Type'] = 1 then
      ToolBar1.Visible := False;
    HomeStoreDataSet.Locate('StoreID', HomeStructureDataSet['StoreID'], []);
  end;
end;

procedure THomeStoreSelectForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ToolBar1.Visible := True;
end;

procedure THomeStoreSelectForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure THomeStoreSelectForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure THomeStoreSelectForm.InsertButtonClick(Sender: TObject);
begin
  StoreDataModule.HomeStoreDataSet.Append;
  StoreDataModule.HomeStoreDataSet['DivisionID'] := StoreDataModule.DivisionSelectQuery['DivisionID'];
  StoreDataModule.HomeStoreDataSet['DivisionName'] := StoreDataModule.DivisionSelectQuery['DivisionName'];
  StoreDataModule.HomeStoreDataSet['ProductID'] := StoreDataModule.HomeStructureDataSet['ProductID'];
  HomeStoreItemForm := THomeStoreItemForm.Create(Self);
  HomeStoreItemForm.ShowModal;
end;

procedure THomeStoreSelectForm.EditButtonClick(Sender: TObject);
begin
  StoreDataModule.HomeStoreDataSet.Edit;
  HomeStoreItemForm := THomeStoreItemForm.Create(Self);
  HomeStoreItemForm.ShowModal;
end;

procedure THomeStoreSelectForm.DeleteButtonClick(Sender: TObject);
var
  StoreStr : String;
begin
  StoreStr := StoreDataModule.HomeStoreDataSet['StoreID'];
  if Application.MessageBox(PChar('Вы действительно хотите удалить запись"' +
    StoreStr + '"?'),
    'Удаление записи',
    mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
  try
    StoreDataModule.HomeStoreDataSet.Delete;
  except
    Application.MessageBox(PChar('Запись "' + StoreStr + '" удалять нельзя.'),
      'Ошибка удаления', mb_IconStop);
  end;
end;

procedure THomeStoreSelectForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    postmessage(OKButton.handle,cn_command,bn_clicked,0);
end;

end.
