unit Producer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh,
  DB, ComCtrls, ToolWin;

type
  TProducerForm = class(TForm)
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
  ProducerForm: TProducerForm;

implementation

uses StoreDM, ProducerItem;

{$R *.dfm}

procedure TProducerForm.FormCreate(Sender: TObject);
begin
  StoreDataModule.ProducerDataSet.Open;
  Caption := 'Справочник Производителей';
end;

procedure TProducerForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with StoreDataModule.ProducerDataSet do
  begin
    CurProducerID := FieldValues['ProducerID'];
    CurProducerName := FieldValues['ProducerName'];
    Close;
    SelectSQL.Strings[3] := '';
  end;
  Release;
end;

procedure TProducerForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TProducerForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TProducerForm.Edit1Change(Sender: TObject);
var
  Find : String;
begin
  Find := AnsiUpperCase(Edit1.Text);
  with StoreDataModule.ProducerDataSet do
  begin
    Close;
    SelectSQL.Strings[3] := 'AND (UPPER("ProducerName") CONTAINING ''' + Find + ''')';
    Open;
  end;
end;

procedure TProducerForm.InsertButtonClick(Sender: TObject);
begin
  StoreDataModule.ProducerDataSet.Append;
  ProducerItemForm := TProducerItemForm.Create(Self);
  ProducerItemForm.ShowModal;
end;

procedure TProducerForm.EditButtonClick(Sender: TObject);
begin
  StoreDataModule.ProducerDataSet.Edit;
  ProducerItemForm := TProducerItemForm.Create(Self);
  ProducerItemForm.ShowModal;
end;

procedure TProducerForm.DeleteButtonClick(Sender: TObject);
var
  ProducerStr : String;
begin
  ProducerStr := StoreDataModule.ProducerDataSet['ProducerName'];
  if Application.MessageBox(PChar('Вы действительно хотите удалить запись"' +
    ProducerStr + '"?'),
    'Удаление записи',
    mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
  try
    StoreDataModule.ProducerDataSet.Delete;
  except
    Application.MessageBox(PChar('Запись "' + ProducerStr + '" удалять нельзя.'),
      'Ошибка удаления', mb_IconStop);
  end;
end;

procedure TProducerForm.DBGridEh1DblClick(Sender: TObject);
begin
  OKButton.Click;
end;

procedure TProducerForm.FormKeyDown(Sender: TObject; var Key: Word;
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
