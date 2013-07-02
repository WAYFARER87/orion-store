unit HomeTypeSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  THomeTypeSelectForm = class(TForm)
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
  HomeTypeSelectForm: THomeTypeSelectForm;

implementation

uses StoreDM;

{$R *.dfm}

procedure THomeTypeSelectForm.FormCreate(Sender: TObject);
begin
  Caption := 'Выбор Типа';
end;

procedure THomeTypeSelectForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult = mrOk then
  begin
    case RadioGroup1.ItemIndex of
      0: CurType := 1; //Расход
      1: CurType := -1; //Приход
    end;
  end;
  Release;
end;

procedure THomeTypeSelectForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure THomeTypeSelectForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure THomeTypeSelectForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    OKButton.Click;
end;

end.
