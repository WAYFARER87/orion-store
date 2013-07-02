unit Bank;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh,
  DB, ComCtrls, ToolWin;

type
  TBankForm = class(TForm)
    Panel1: TPanel;
    CancelButton: TButton;
    DBGridEh1: TDBGridEh;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    InsertButton: TToolButton;
    EditButton: TToolButton;
    DeleteButton: TToolButton;
    ToolButton2: TToolButton;
    Edit1: TEdit;
    OKButton: TButton;
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
  BankForm: TBankForm;

implementation

uses StoreDM, BankItem;

{$R *.dfm}

procedure TBankForm.FormCreate(Sender: TObject);
begin
  StoreDataModule.BankDataSet.Locate('BankID', StoreDataModule.CustomerDataSet['BankID'], []);
  Caption := 'Справочник Банков';
end;

procedure TBankForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult = mrOK then
    CurBankID := StoreDataModule.BankDataSet['BankID'];
  with StoreDataModule.BankDataSet do
  begin
    Close;
    SelectSQL.Strings[3] := '';
    Open;
  end;
  Release;
end;

procedure TBankForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TBankForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TBankForm.Edit1Change(Sender: TObject);
var
  Find : String;
begin
  Find := AnsiUpperCase(Edit1.Text);
  with StoreDataModule.BankDataSet do
  begin
    Close;
    SelectSQL.Strings[3] := 'AND (UPPER("BankName") CONTAINING ''' + Find + ''')';
    Open;
  end;
end;

procedure TBankForm.InsertButtonClick(Sender: TObject);
begin
  StoreDataModule.BankDataSet.Append;
  BankItemForm := TBankItemForm.Create(Self);
  BankItemForm.ShowModal;
end;

procedure TBankForm.EditButtonClick(Sender: TObject);
begin
  StoreDataModule.BankDataSet.Edit;
  BankItemForm := TBankItemForm.Create(Self);
  BankItemForm.ShowModal;
end;

procedure TBankForm.DeleteButtonClick(Sender: TObject);
var
  DeletedStr : String;
begin
  DeletedStr := StoreDataModule.BankDataSet.FieldByName('BankName').AsString;
  if Application.MessageBox(PChar('Вы действительно хотите удалить запись"' +
    DeletedStr + '"?'),
    'Удаление записи',
    mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
  try
    StoreDataModule.BankDataSet.Delete;
  except
    Application.MessageBox(PChar('Запись "' + DeletedStr + '" удалять нельзя.'),
      'Ошибка удаления', mb_IconStop);
  end;
end;

procedure TBankForm.DBGridEh1DblClick(Sender: TObject);
begin
  OKButton.Click;
end;

procedure TBankForm.FormKeyDown(Sender: TObject; var Key: Word;
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
