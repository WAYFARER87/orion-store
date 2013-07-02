unit MeasureItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, ExtCtrls;

type
  TMeasureItemForm = class(TForm)
    OKButton: TButton;
    CancelButton: TButton;
    Bevel1: TBevel;
    DBEditEh1: TDBEditEh;
    DBEditEh2: TDBEditEh;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MeasureItemForm: TMeasureItemForm;

implementation

uses StoreDM;

{$R *.dfm}

procedure TMeasureItemForm.FormCreate(Sender: TObject);
begin
  Caption := StoreDataModule.MeasureDataSet.FieldByName('MeasureName').AsString;
end;

procedure TMeasureItemForm.FormShow(Sender: TObject);
begin
  DBEditEh2.SetFocus;
end;

procedure TMeasureItemForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with StoreDataModule do
  try
    try
      if ModalResult = mrOk then
      begin
        if MeasureDataSet.Modified then
          MeasureDataSet.Post;
        MeasureTransaction.Commit;
      end
      else
        MeasureTransaction.Rollback;
    except
      Application.MessageBox('Недопустимые значения данных',
        'Ошибка ввода', mb_IconStop);
      Abort;
    end; {try except}
  finally
//Открываем Таблицы "Единицы измерения" после Commit'а транзакции
    MeasureDataSet.Open;
  end; {try finally}
  Release;
end;

procedure TMeasureItemForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TMeasureItemForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TMeasureItemForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    SelectNext(ActiveControl As TWinControl, True, True);
end;

end.
