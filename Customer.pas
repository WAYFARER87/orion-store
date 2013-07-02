unit Customer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh,
  DB, ComCtrls, ToolWin;

type
  TCustomerForm = class(TForm)
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
  CustomerForm: TCustomerForm;

implementation

uses StoreDM, DivisionItem, CustomerItem;

{$R *.dfm}

procedure TCustomerForm.FormCreate(Sender: TObject);
begin
  CloseButton.Left := Panel1.Width - CloseButton.Width - 10;
  with StoreDataModule.CustomerDataSet do
  begin
    Open;
    Last;
    First;
  end;
  Caption := 'Справочник Клиентов';
end;

procedure TCustomerForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with StoreDataModule.CustomerDataSet do
  begin
    Close;
    SelectSQL.Strings[3] := '';
  end;
// Удаление форму при ее закрытии
  CustomerForm := nil;
  Action       := caFree;
end;

procedure TCustomerForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TCustomerForm.Edit1Change(Sender: TObject);
var
  Find : String;
begin
  Find := AnsiUpperCase(Edit1.Text);
  with StoreDataModule.CustomerDataSet do
  begin
    Close;
    SelectSQL.Strings[3] := 'AND (UPPER("CustomerName") CONTAINING ''' + Find + ''')';
    Open;
  end;
end;

procedure TCustomerForm.InsertButtonClick(Sender: TObject);
begin
  StoreDataModule.CustomerDataSet.Append;
  CustomerItemForm := TCustomerItemForm.Create(Self);
  CustomerItemForm.ShowModal;
end;

procedure TCustomerForm.EditButtonClick(Sender: TObject);
begin
  StoreDataModule.CustomerDataSet.Edit;
  CustomerItemForm := TCustomerItemForm.Create(Self);
  CustomerItemForm.ShowModal;
end;

procedure TCustomerForm.DeleteButtonClick(Sender: TObject);
var
  CustomerStr : String;
begin
  CustomerStr := StoreDataModule.CustomerDataSet.FieldByName('CustomerName').AsString;
  if Application.MessageBox(PChar('Вы действительно хотите удалить запись"' +
    CustomerStr + '"?'),
    'Удаление записи',
    mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
  try
    StoreDataModule.CustomerDataSet.Delete;
  except
    Application.MessageBox(PChar('Запись "' + CustomerStr + '" удалять нельзя.'),
      'Ошибка удаления', mb_IconStop);
  end;
end;

procedure TCustomerForm.DBGridEh1DblClick(Sender: TObject);
begin
  EditButton.Click;
end;

procedure TCustomerForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F2 : InsertButton.Click;
    VK_F3 : EditButton.Click;
    VK_F8 : DeleteButton.Click;
    VK_F7 : Edit1.SetFocus;
  end;
end;

end.
