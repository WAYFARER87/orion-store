unit Group;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh,
  DB, ComCtrls, ToolWin;

type
  TGroupForm = class(TForm)
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
  GroupForm: TGroupForm;

implementation

uses StoreDM, GroupItem;

{$R *.dfm}

procedure TGroupForm.FormCreate(Sender: TObject);
begin
  StoreDataModule.GroupDataSet.Open;
//  StoreDataModule.GroupDataSet.Locate('GroupID', StoreDataModule.CategoryDataSet['GroupID'], []);
  Caption := 'Справочник Групп';
end;

procedure TGroupForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with StoreDataModule.GroupDataSet do
  begin
    CurGroupID := FieldByName('GroupID').AsInteger;
    CurGroupName := FieldByName('GroupName').AsString;
    Close;
    SelectSQL.Strings[3] := '';
  end;
  Release;
end;

procedure TGroupForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TGroupForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TGroupForm.Edit1Change(Sender: TObject);
var
  Find : String;
begin
  Find := AnsiUpperCase(Edit1.Text);
  with StoreDataModule.GroupDataSet do
  begin
    Close;
    SelectSQL.Strings[3] := 'AND (UPPER("GroupName") CONTAINING ''' + Find + ''')';
    Open;
  end;
end;

procedure TGroupForm.InsertButtonClick(Sender: TObject);
begin
  StoreDataModule.GroupDataSet.Append;
  GroupItemForm := TGroupItemForm.Create(Self);
  GroupItemForm.ShowModal;{}
end;

procedure TGroupForm.EditButtonClick(Sender: TObject);
begin
  StoreDataModule.GroupDataSet.Edit;
  GroupItemForm := TGroupItemForm.Create(Self);
  GroupItemForm.ShowModal;{}
end;

procedure TGroupForm.DeleteButtonClick(Sender: TObject);
var
  GroupStr : String;
begin
  GroupStr := StoreDataModule.GroupDataSet.FieldByName('GroupName').AsString;
  if Application.MessageBox(PChar('Вы действительно хотите удалить запись"' +
    GroupStr + '"?'),
    'Удаление записи',
    mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
  try
    StoreDataModule.GroupDataSet.Delete;
  except
    Application.MessageBox(PChar('Запись "' + GroupStr + '" удалять нельзя.'),
      'Ошибка удаления', mb_IconStop);
  end;
end;

procedure TGroupForm.DBGridEh1DblClick(Sender: TObject);
begin
  OKButton.Click;
end;

procedure TGroupForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN : OKButton.Click;
    VK_F2 : InsertButton.Click;
    VK_F3 : EditButton.Click;
    VK_F8 : DeleteButton.Click;
  end;
end;

end.
