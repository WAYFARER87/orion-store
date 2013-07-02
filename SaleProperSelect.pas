unit SaleProperSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TSaleProperSelectForm = class(TForm)
    CancelButton: TButton;
    OKButton: TButton;
    RadioGroup1: TRadioGroup;
    procedure FormCreate(Sender: TObject);
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
  SaleProperSelectForm: TSaleProperSelectForm;

implementation

uses StoreDM, SaleOrder;

{$R *.dfm}

procedure TSaleProperSelectForm.FormCreate(Sender: TObject);
begin
  Caption := 'Выбор вида Расхода';
end;

procedure TSaleProperSelectForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult = mrOk then
  begin
    case RadioGroup1.ItemIndex of
      0: CurProperID := 1; //Опт
      1: CurProperID := 2; //Розница
    end;
  end;
  Release;
end;

procedure TSaleProperSelectForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TSaleProperSelectForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TSaleProperSelectForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    OKButton.Click;
end;

end.
