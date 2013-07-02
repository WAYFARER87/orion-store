unit Country;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh,
  DB, ComCtrls, ToolWin;

type
  TCountryForm = class(TForm)
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
  CountryForm: TCountryForm;

implementation

uses StoreDM, CountryItem;

{$R *.dfm}

procedure TCountryForm.FormCreate(Sender: TObject);
begin
  StoreDataModule.CountryDataSet.Open;
  Caption := 'Справочник Стран';
end;

procedure TCountryForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with StoreDataModule do
  begin
    CurCountryID := CountryDataSet['CountryID'];
    CurCountryName := CountryDataSet['CountryName'];
    CountryDataSet.Close;
    CountryDataSet.SelectSQL.Strings[3] := '';
  end;
  Release;
end;

procedure TCountryForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TCountryForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TCountryForm.Edit1Change(Sender: TObject);
var
  Find : String;
begin
  Find := AnsiUpperCase(Edit1.Text);
  with StoreDataModule.CountryDataSet do
  begin
    Close;
    SelectSQL.Strings[3] := 'AND (UPPER("CountryName") CONTAINING ''' + Find + ''')';
    Open;
  end;
end;

procedure TCountryForm.InsertButtonClick(Sender: TObject);
begin
  StoreDataModule.CountryDataSet.Append;
  CountryItemForm := TCountryItemForm.Create(Self);
  CountryItemForm.ShowModal;
end;

procedure TCountryForm.EditButtonClick(Sender: TObject);
begin
  StoreDataModule.CountryDataSet.Edit;
  CountryItemForm := TCountryItemForm.Create(Self);
  CountryItemForm.ShowModal;
end;

procedure TCountryForm.DeleteButtonClick(Sender: TObject);
var
  CountryStr : String;
begin
  CountryStr := StoreDataModule.CountryDataSet['CountryName'];
  if Application.MessageBox(PChar('Вы действительно хотите удалить запись"' +
    CountryStr + '"?'),
    'Удаление записи',
    mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
  try
    StoreDataModule.CountryDataSet.Delete;
  except
    Application.MessageBox(PChar('Запись "' + CountryStr + '" удалять нельзя.'),
      'Ошибка удаления', mb_IconStop);
  end;
end;

procedure TCountryForm.DBGridEh1DblClick(Sender: TObject);
begin
  OKButton.Click;
end;

procedure TCountryForm.FormKeyDown(Sender: TObject; var Key: Word;
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
