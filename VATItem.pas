unit VATItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, ExtCtrls;

type
  TVATItemForm = class(TForm)
    OKButton: TButton;
    CancelButton: TButton;
    Bevel1: TBevel;
    DBEditEh1: TDBEditEh;
    DBEditEh2: TDBEditEh;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure DBEditEh2EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBEditEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VATItemForm: TVATItemForm;

implementation

uses StoreDM, VATRate;

{$R *.dfm}

procedure TVATItemForm.FormCreate(Sender: TObject);
begin
  Caption := StoreDataModule.VATDataSet.FieldByName('VATRateName').AsString;
end;

procedure TVATItemForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with StoreDataModule do
  try
    if ModalResult = mrOk then
      VATDataSet.Post
    else
      VATDataSet.Cancel;
  except
    Application.MessageBox('Недопустимые значения данных',
      'Ошибка ввода', mb_IconStop);
    Abort;
  end;
  Release;
end;

procedure TVATItemForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TVATItemForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TVATItemForm.DBEditEh2EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  VATRateForm := TVATRateForm.Create(Self);
  VATRateForm.ShowModal;
  if VATRateForm.ModalResult = mrOk then
  with StoreDataModule do
  begin
    VATDataSet['VATRateID'] := CurVATRateID;
    VATDataSet['VATRateName'] := CurVATRateName;
    VATDataSet['VATRate'] := CurVATRate;
  end;
  Caption := 'Ставка ' + StoreDataModule.VATDataSet.FieldByName('VATRateName').AsString;
end;

procedure TVATItemForm.DBEditEh2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBEditEh2EditButtons0Click(Self, h);
end;

procedure TVATItemForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    SelectNext(ActiveControl As TWinControl, True, True);
end;

end.
