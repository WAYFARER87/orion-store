unit Measure;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh,
  DB, ComCtrls, ToolWin;

type
  TMeasureForm = class(TForm)
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
  MeasureForm: TMeasureForm;

implementation

uses StoreDM, MeasureItem;

{$R *.dfm}

procedure TMeasureForm.FormCreate(Sender: TObject);
begin
  StoreDataModule.MeasureDataSet.Open;
  Caption := 'Справочник Единиц Измерения';
end;

procedure TMeasureForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with StoreDataModule.MeasureDataSet do
  begin
    CurMeasureID := FieldValues['MeasureID'];
    CurMeasureName := FieldValues['MeasureName'];
    Close;
    SelectSQL.Strings[3] := '';
  end;
  Release;
end;

procedure TMeasureForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TMeasureForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TMeasureForm.Edit1Change(Sender: TObject);
var
  Find : String;
begin
  Find := AnsiUpperCase(Edit1.Text);
  with StoreDataModule.MeasureDataSet do
  begin
    Close;
    SelectSQL.Strings[3] := 'AND (UPPER("MeasureName") CONTAINING ''' + Find + ''')';
    Open;
  end;
end;

procedure TMeasureForm.InsertButtonClick(Sender: TObject);
begin
  StoreDataModule.MeasureDataSet.Append;
  MeasureItemForm := TMeasureItemForm.Create(Self);
  MeasureItemForm.ShowModal;
end;

procedure TMeasureForm.EditButtonClick(Sender: TObject);
begin
  StoreDataModule.MeasureDataSet.Edit;
  MeasureItemForm := TMeasureItemForm.Create(Self);
  MeasureItemForm.ShowModal;
end;

procedure TMeasureForm.DeleteButtonClick(Sender: TObject);
var
  MeasureStr : String;
begin
  MeasureStr := StoreDataModule.MeasureDataSet['MeasureName'];
  if Application.MessageBox(PChar('Вы действительно хотите удалить запись"' +
    MeasureStr + '"?'),
    'Удаление записи',
    mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
  try
    StoreDataModule.MeasureDataSet.Delete;
  except
    Application.MessageBox(PChar('Запись "' + MeasureStr + '" удалять нельзя.'),
      'Ошибка удаления', mb_IconStop);
  end;
end;

procedure TMeasureForm.DBGridEh1DblClick(Sender: TObject);
begin
  OKButton.Click;
end;

procedure TMeasureForm.FormKeyDown(Sender: TObject; var Key: Word;
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
