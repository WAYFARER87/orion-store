unit TypePrice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh,
  DB, ComCtrls, ToolWin;

type
  TTypePriceForm = class(TForm)
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
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TypePriceForm: TTypePriceForm;

implementation

uses StoreDM, TypePriceItem;

{$R *.dfm}

procedure TTypePriceForm.FormCreate(Sender: TObject);
begin
  StoreDataModule.TypePriceDataSet.Locate('PriceID', StoreDataModule.PriceDataSet['PriceID'], []);
  Caption := 'Справочник Типов Цен';
end;

procedure TTypePriceForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult = mrOk then
  begin
    CurPriceID := StoreDataModule.TypePriceDataSet['PriceID'];
    CurPriceName := StoreDataModule.TypePriceDataSet['PriceName'];
    CurPriceMarkup := StoreDataModule.TypePriceDataSet['Markup'];
  end;
  with StoreDataModule.TypePriceDataSet do
  begin
    Close;
    SelectSQL.Strings[3] := '';
    Open;
  end;
  Release;
end;

procedure TTypePriceForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TTypePriceForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TTypePriceForm.Edit1Change(Sender: TObject);
var
  Find : String;
begin
  Find := AnsiUpperCase(Edit1.Text);
  with StoreDataModule.TypePriceDataSet do
  begin
    Close;
    SelectSQL.Strings[3] := 'AND UPPER("PriceName") LIKE ''%' + Find + '%''';
    Open;
  end;
//  StoreDataModule.CustomerSelectQuery.Locate('CustomerName', Edit1.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TTypePriceForm.InsertButtonClick(Sender: TObject);
begin
  StoreDataModule.TypePriceDataSet.Append;
  TypePriceItemForm := TTypePriceItemForm.Create(Self);
  TypePriceItemForm.ShowModal;
end;

procedure TTypePriceForm.EditButtonClick(Sender: TObject);
begin
  StoreDataModule.TypePriceDataSet.Edit;
  TypePriceItemForm := TTypePriceItemForm.Create(Self);
  TypePriceItemForm.ShowModal;
end;

procedure TTypePriceForm.DeleteButtonClick(Sender: TObject);
var
  PriceStr : String;
begin
  PriceStr := StoreDataModule.TypePriceDataSet['PriceName'];
  if Application.MessageBox(PChar('Вы действительно хотите удалить запись"' +
    PriceStr + '"?'),
    'Удаление записи',
    mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
  try
    StoreDataModule.TypePriceDataSet.Delete;
  except
    Application.MessageBox(PChar('Запись "' + PriceStr + '" удалять нельзя.'),
      'Ошибка удаления', mb_IconStop);
  end;
end;

procedure TTypePriceForm.FormKeyDown(Sender: TObject; var Key: Word;
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
