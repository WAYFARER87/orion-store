unit HomeProperSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  THomeProperSelectForm = class(TForm)
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
  HomeProperSelectForm: THomeProperSelectForm;

implementation

uses StoreDM{, PaymentOrder};

{$R *.dfm}

procedure THomeProperSelectForm.FormCreate(Sender: TObject);
begin
  Caption := 'Выбор вида Расхода';
end;

procedure THomeProperSelectForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult = mrOk then
  begin
    case RadioGroup1.ItemIndex of
      0: CurProperID := 6; //Излишки
      1: CurProperID := 7; //Списание
      2: CurProperID := 8; //Пересорт
      3: CurProperID := 9; //Перемещение
    end;
  end;
  Release;
end;

procedure THomeProperSelectForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure THomeProperSelectForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure THomeProperSelectForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    OKButton.Click;
end;

end.
