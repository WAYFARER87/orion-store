unit InitialBalance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh, ComCtrls, ToolWin;

type
  TInitialBalanceForm = class(TForm)
    Panel1: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    InsertButton: TToolButton;
    EditButton: TToolButton;
    DeleteButton: TToolButton;
    ToolButton2: TToolButton;
    Edit1: TEdit;
    ToolButton3: TToolButton;
    PayButton: TToolButton;
    PrintButton: TToolButton;
    DBGridEh1: TDBGridEh;
    CloseButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CloseButtonClick(Sender: TObject);
    procedure InsertButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DeleteButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  InitialBalanceForm: TInitialBalanceForm;

implementation

uses Main, StoreDM, InitialBalanceItem;

{$R *.dfm}

procedure TInitialBalanceForm.FormCreate(Sender: TObject);
begin
  CloseButton.Left := Panel1.Width - CloseButton.Width - 10;
  StoreDataModule.InitialBalanceDataSet.Open;
  Caption := 'Ввод остатка кредита';
end;

procedure TInitialBalanceForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  StoreDataModule.InitialBalanceDataSet.Close;
  Release;
end;

procedure TInitialBalanceForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TInitialBalanceForm.InsertButtonClick(Sender: TObject);
begin
  StoreDataModule.InitialBalanceDataSet.Append;
  StoreDataModule.InitialBalanceDataSet['Date'] := Now;
  StoreDataModule.InitialBalanceDataSet['FirmID'] := MainFirm;
  InitialBalanceItemForm := TInitialBalanceItemForm.Create(Self);
  InitialBalanceItemForm.ShowModal;
end;

procedure TInitialBalanceForm.EditButtonClick(Sender: TObject);
begin
  StoreDataModule.InitialBalanceDataSet.Edit;
  InitialBalanceItemForm := TInitialBalanceItemForm.Create(Self);
  InitialBalanceItemForm.ShowModal;
end;

procedure TInitialBalanceForm.DeleteButtonClick(Sender: TObject);
var
  InitialBalanceStr : String;
begin
  InitialBalanceStr := StoreDataModule.InitialBalanceDataSet.FieldByName('CustomerName').AsString;
  if Application.MessageBox(PChar('Вы действительно хотите удалить запись "' +
    InitialBalanceStr + '"?'),
    'Удаление записи',
    mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
  try
    StoreDataModule.InitialBalanceDataSet.Delete;
  except
    Application.MessageBox(PChar('Запись "' + InitialBalanceStr + '" удалять нельзя.'),
      'Ошибка удаления', mb_IconStop);
  end;
end;

procedure TInitialBalanceForm.PrintButtonClick(Sender: TObject);
begin
//
end;

procedure TInitialBalanceForm.Edit1Change(Sender: TObject);
var
  Find : String;
begin
  Find := AnsiUpperCase(Edit1.Text);
  with StoreDataModule.InitialBalanceDataSet do
  begin
    Close;
    SelectSQL.Strings[2] := 'WHERE (UPPER("CustomerName") CONTAINING ''' + Find + ''')';
    Open;
  end;{}
end;

procedure TInitialBalanceForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F2 : InsertButton.Click;
    VK_F3 : EditButton.Click;
    VK_F8 : DeleteButton.Click;
    VK_F4 : Edit1.SetFocus;
  end;
end;

procedure TInitialBalanceForm.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    DBGridEh1.SetFocus;
end;

end.
