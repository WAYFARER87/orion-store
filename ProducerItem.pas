unit ProducerItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, ExtCtrls;

type
  TProducerItemForm = class(TForm)
    OKButton: TButton;
    CancelButton: TButton;
    Bevel1: TBevel;
    DBEditEh1: TDBEditEh;
    DBEditEh2: TDBEditEh;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ProducerItemForm: TProducerItemForm;

implementation

uses StoreDM;

{$R *.dfm}

procedure TProducerItemForm.FormCreate(Sender: TObject);
begin
  CurProducerID := StoreDataModule.ProducerDataSet['ProducerID'];
  Caption := StoreDataModule.ProducerDataSet.FieldByName('ProducerName').AsString;
end;

procedure TProducerItemForm.FormShow(Sender: TObject);
begin
  DBEditEh2.SetFocus;
end;

procedure TProducerItemForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with StoreDataModule do
  try
    if ModalResult = mrOk then
      ProducerDataSet.Post
    else
      ProducerDataSet.Cancel;
  except
    Application.MessageBox('Недопустимые значения данных',
      'Ошибка ввода', mb_IconStop);
    Abort;
  end; {try except}
  StoreDataModule.ProducerDataSet.Close;
  StoreDataModule.ProducerDataSet.Open;
  Release;
end;

procedure TProducerItemForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TProducerItemForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TProducerItemForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
   begin
      OKButton.Click;
      SelectNext(ActiveControl As TWinControl, True, True);
      key:=0;
    end;
end;


end.
