unit BuyStoreSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh, ComCtrls, ToolWin;

type
  TBuyStoreSelectForm = class(TForm)
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
  BuyStoreSelectForm: TBuyStoreSelectForm;

implementation

uses StoreDM, BuyStoreItem;

{$R *.dfm}

procedure TBuyStoreSelectForm.FormCreate(Sender: TObject);
begin
  with StoreDataModule do
  begin
    BuyStoreDataSet.Locate('StoreID', BuyStructureDataSet['StoreID'], []);
  end;
end;

procedure TBuyStoreSelectForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
{  with StoreDataModule do
  begin

  end;{}
end;

procedure TBuyStoreSelectForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TBuyStoreSelectForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TBuyStoreSelectForm.InsertButtonClick(Sender: TObject);
begin
  StoreDataModule.BuyStoreDataSet.Append;
  StoreDataModule.BuyStoreDataSet['DivisionID'] := StoreDataModule.DivisionSelectQuery['DivisionID'];
  StoreDataModule.BuyStoreDataSet['DivisionName'] := StoreDataModule.DivisionSelectQuery['DivisionName'];
  StoreDataModule.BuyStoreDataSet['ProductID'] := StoreDataModule.BuyStructureDataSet['ProductID'];
  BuyStoreItemForm := TBuyStoreItemForm.Create(Self);
  BuyStoreItemForm.ShowModal;
end;

procedure TBuyStoreSelectForm.EditButtonClick(Sender: TObject);
begin
  StoreDataModule.BuyStoreDataSet.Edit;
  BuyStoreItemForm := TBuyStoreItemForm.Create(Self);
  BuyStoreItemForm.ShowModal;
end;

procedure TBuyStoreSelectForm.DeleteButtonClick(Sender: TObject);
var
  StoreStr : String;
begin
  StoreStr := StoreDataModule.BuyStoreDataSet['StoreID'];
  if Application.MessageBox(PChar('Вы действительно хотите удалить запись"' +
    StoreStr + '"?'),
    'Удаление записи',
    mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
  try
    StoreDataModule.BuyStoreDataSet.Delete;
  except
    Application.MessageBox(PChar('Запись "' + StoreStr + '" удалять нельзя.'),
      'Ошибка удаления', mb_IconStop);
  end;
end;

procedure TBuyStoreSelectForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    postmessage(OKButton.handle,cn_command,bn_clicked,0);
end;

end.
