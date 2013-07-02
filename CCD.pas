unit CCD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh,
  DB, ComCtrls, ToolWin;

type
  TCCDForm = class(TForm)
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
  CCDForm: TCCDForm;

implementation

uses StoreDM, CCDItem;

{$R *.dfm}

procedure TCCDForm.FormCreate(Sender: TObject);
begin
  StoreDataModule.CCDDataSet.Open;
  Caption := 'Справочник ГТД';
end;

procedure TCCDForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with StoreDataModule do
  begin
    CurCCDID := CCDDataSet['CCDID'];
    CurCCDName := CCDDataSet['CCDName'];
    CCDDataSet.Close;
    CCDDataSet.SelectSQL.Strings[3] := '';
  end;
  Release;
end;

procedure TCCDForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TCCDForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TCCDForm.Edit1Change(Sender: TObject);
var
  Find : String;
begin
  Find := AnsiUpperCase(Edit1.Text);
  with StoreDataModule.CCDDataSet do
  begin
    Close;
    SelectSQL.Strings[3] := 'AND (UPPER("CCDName") CONTAINING ''' + Find + ''')';
    Open;
  end;
end;

procedure TCCDForm.InsertButtonClick(Sender: TObject);
begin
  StoreDataModule.CCDDataSet.Append;
  CCDItemForm := TCCDItemForm.Create(Self);
  CCDItemForm.ShowModal;
end;

procedure TCCDForm.EditButtonClick(Sender: TObject);
begin
  StoreDataModule.CCDDataSet.Edit;
  CCDItemForm := TCCDItemForm.Create(Self);
  CCDItemForm.ShowModal;
end;

procedure TCCDForm.DeleteButtonClick(Sender: TObject);
var
  DeletedStr : String;
begin
  DeletedStr := StoreDataModule.CCDDataSet['CCDName'];
  if Application.MessageBox(PChar('Вы действительно хотите удалить запись"' +
    DeletedStr + '"?'),
    'Удаление записи',
    mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
  try
    StoreDataModule.CCDDataSet.Delete;
  except
    Application.MessageBox(PChar('Запись "' + DeletedStr + '" удалять нельзя.'),
      'Ошибка удаления', mb_IconStop);
  end;
end;

procedure TCCDForm.DBGridEh1DblClick(Sender: TObject);
begin
  OKButton.Click;
end;

procedure TCCDForm.FormKeyDown(Sender: TObject; var Key: Word;
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
