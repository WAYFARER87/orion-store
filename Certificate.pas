unit Certificate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh,
  DB, ComCtrls, ToolWin;

type
  TCertificateForm = class(TForm)
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
  CertificateForm: TCertificateForm;

implementation

uses StoreDM, CertificateItem;

{$R *.dfm}

procedure TCertificateForm.FormCreate(Sender: TObject);
begin
  StoreDataModule.CertificateDataSet.Open;
  Caption := 'Справочник Сертификатов';
end;

procedure TCertificateForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with StoreDataModule do
  begin
    CurCertificateID := CertificateDataSet['CertificateID'];
    CurCertificateName := CertificateDataSet['CertificateName'];
    CertificateDataSet.Close;
    CertificateDataSet.SelectSQL.Strings[3] := '';
  end;
  Release;
end;

procedure TCertificateForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TCertificateForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TCertificateForm.Edit1Change(Sender: TObject);
var
  Find : String;
begin
  Find := AnsiUpperCase(Edit1.Text);
  with StoreDataModule.CertificateDataSet do
  begin
    Close;
    SelectSQL.Strings[3] := 'AND (UPPER("CertificateName") CONTAINING ''' + Find + ''')';
    Open;
  end;
end;

procedure TCertificateForm.InsertButtonClick(Sender: TObject);
begin
  StoreDataModule.CertificateDataSet.Append;
  CertificateItemForm := TCertificateItemForm.Create(Self);
  CertificateItemForm.ShowModal;
end;

procedure TCertificateForm.EditButtonClick(Sender: TObject);
begin
  StoreDataModule.CertificateDataSet.Edit;
  CertificateItemForm := TCertificateItemForm.Create(Self);
  CertificateItemForm.ShowModal;
end;

procedure TCertificateForm.DeleteButtonClick(Sender: TObject);
var
  DeletedStr : String;
begin
  DeletedStr := StoreDataModule.CertificateDataSet['CertificateName'];
  if Application.MessageBox(PChar('Вы действительно хотите удалить запись"' +
    DeletedStr + '"?'),
    'Удаление записи',
    mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
  try
    StoreDataModule.CertificateDataSet.Delete;
  except
    Application.MessageBox(PChar('Запись "' + DeletedStr + '" удалять нельзя.'),
      'Ошибка удаления', mb_IconStop);
  end;
end;

procedure TCertificateForm.DBGridEh1DblClick(Sender: TObject);
begin
  OKButton.Click;
end;

procedure TCertificateForm.FormKeyDown(Sender: TObject; var Key: Word;
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
