unit Firm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh,
  DB, ComCtrls, ToolWin;

type
  TFirmForm = class(TForm)
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
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FirmForm: TFirmForm;

implementation

uses StoreDM, DivisionItem, FirmItem;

{$R *.dfm}

procedure TFirmForm.FormCreate(Sender: TObject);
begin
  CloseButton.Left := Panel1.Width - CloseButton.Width - 10; 
  with StoreDataModule do
  begin
    FirmDataSet.Open;
    FirmDataSet.Locate('CustomerID', MainFirm, []);
  end;
  Caption := 'Справочник Фирм';
end;

procedure TFirmForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with StoreDataModule do
  begin
    FirmDataSet.Close;
  end;
// Удаление форму при ее закрытии
  FirmForm := nil;
  Action   := caFree;
end;

procedure TFirmForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TFirmForm.Edit1Change(Sender: TObject);
begin
  StoreDataModule.FirmDataSet.Locate('CustomerName', Edit1.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TFirmForm.InsertButtonClick(Sender: TObject);
begin
  StoreDataModule.FirmDataSet.Append;
  StoreDataModule.FirmDataSet['Firm'] := '1';
  FirmItemForm := TFirmItemForm.Create(Self);
  FirmItemForm.ShowModal;
//  StoreDataModule.FirmDataSet.Locate('CustomerID', CurCustomerID, []);
end;

procedure TFirmForm.EditButtonClick(Sender: TObject);
begin
  StoreDataModule.FirmDataSet.Edit;
  FirmItemForm := TFirmItemForm.Create(Self);
  FirmItemForm.ShowModal;
//  StoreDataModule.FirmDataSet.Locate('CustomerID', CurCustomerID, []);
end;

procedure TFirmForm.DeleteButtonClick(Sender: TObject);
var
  FirmStr : String;
begin
  FirmStr := StoreDataModule.FirmDataSet.FieldByName('CustomerName').AsString;
  if Application.MessageBox(PChar('Вы действительно хотите удалить запись"' +
    FirmStr + '"?'),
    'Удаление записи',
    mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
  try
    StoreDataModule.FirmDataSet.Delete;
  except
    Application.MessageBox(PChar('Запись "' + FirmStr + '" удалять нельзя.'),
      'Ошибка удаления', mb_IconStop);
  end;
end;

procedure TFirmForm.DBGridEh1DblClick(Sender: TObject);
begin
  EditButton.Click;
end;

procedure TFirmForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F2 : InsertButton.Click;
    VK_F3 : EditButton.Click;
    VK_F8 : DeleteButton.Click;
    VK_F4 : Edit1.SetFocus;
  end;
end;

end.
