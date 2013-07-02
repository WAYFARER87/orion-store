unit StoreSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh;

type
  TStoreSelectForm = class(TForm)
    Panel1: TPanel;
    CancelButton: TButton;
    OKButton: TButton;
    DBGridEh1: TDBGridEh;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StoreSelectForm: TStoreSelectForm;

implementation

uses StoreDM;

{$R *.dfm}

procedure TStoreSelectForm.FormCreate(Sender: TObject);
begin
  with StoreDataModule do
  begin
    if StoreSelectQuery.Active = True then
      StoreSelectQuery.Close;
    StoreSelectQuery.ParamByName('ProductID').Value := CurrentProductID;
    StoreSelectQuery.ParamByName('DivisionID').Value := CurDivisionID;
    StoreSelectQuery.ParamByName('PriceID').Value := CurPriceID;
    StoreSelectQuery.Open;
    StoreSelectQuery.Locate('StoreID', CurStoreID, []);
//  В заголовок формы передаем Наименование "Товара"
    Caption := CurProductFullName;
  end;
end;

procedure TStoreSelectForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with StoreDataModule do
  begin
    if ModalResult = mrOk then
    begin
      CurStoreID := StoreSelectQuery['StoreID'];
      CurPrice := StoreSelectQuery['Price'];
    end;
    if StoreSelectQuery.Active = True then
      StoreSelectQuery.Close;
  end;
end;

procedure TStoreSelectForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TStoreSelectForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TStoreSelectForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    postmessage(OKButton.handle,cn_command,bn_clicked,0);
end;

end.
