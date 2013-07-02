unit TypePriceItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, ExtCtrls;

type
  TTypePriceItemForm = class(TForm)
    OKButton: TButton;
    CancelButton: TButton;
    Bevel1: TBevel;
    DBEditEh1: TDBEditEh;
    DBEditEh2: TDBEditEh;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBNumberEditEh1: TDBNumberEditEh;
    Label4: TLabel;
    DBNumberEditEh2: TDBNumberEditEh;
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
  TypePriceItemForm: TTypePriceItemForm;

implementation

uses StoreDM;

{$R *.dfm}

procedure TTypePriceItemForm.FormCreate(Sender: TObject);
begin
  CurPriceID := StoreDataModule.TypePriceDataSet['PriceID'];
  Caption := 'Тип Цены: ' + StoreDataModule.TypePriceDataSet.FieldByName('PriceName').AsString;
end;

procedure TTypePriceItemForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with StoreDataModule do
  try
    try
      if ModalResult = mrOk then
      begin
        if TypePriceDataSet.Modified then
          TypePriceDataSet.Post;
        TypePriceTransaction.Commit;
      end
      else
        TypePriceTransaction.Rollback;
    except
      Application.MessageBox('Недопустимые значения данных',
        'Ошибка ввода', mb_IconStop);
      Abort;
    end; {try except}
  finally
//    Открываем Таблицы "Типы цен" после Commit'а транзакции
    TypePriceDataSet.Open;
  end; {try finally}
  Release;
end;

procedure TTypePriceItemForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TTypePriceItemForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TTypePriceItemForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    SelectNext(ActiveControl As TWinControl, True, True);
end;

end.
