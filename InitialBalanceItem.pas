unit InitialBalanceItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, ExtCtrls, DBLookupEh, Grids, DBGridEh,
  DB,ComCtrls, ToolWin;

type
  TInitialBalanceItemForm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBEditEh1: TDBEditEh;
    Panel2: TPanel;
    OKButton: TButton;
    CancelButton: TButton;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBNumberEditEh1: TDBNumberEditEh;
    Label6: TLabel;
    DBEditEh2: TDBEditEh;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure DBEditEh1EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBEditEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
  InitialBalanceItemForm: TInitialBalanceItemForm;

implementation

uses StoreDM, CustomerSelect, VATRate;

{$R *.dfm}

procedure TInitialBalanceItemForm.FormCreate(Sender: TObject);
begin
//  Запоминаем положение Курсора, что бы вернуться на прежнее место
  CurCustomerID := StoreDataModule.InitialBalanceDataSet['CustomerID'];
  Caption := 'Ввод остатков по кредиту';
end;

procedure TInitialBalanceItemForm.FormShow(Sender: TObject);
begin
  if DBEditEh1.Value = '' then
    DBEditEh1.SetFocus
  else
    DBNumberEditEh1.SetFocus;
end;

procedure TInitialBalanceItemForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with StoreDataModule do
  try
    try
      if ModalResult = mrOk then
      begin
        InitialBalanceDataSet.Post;
        InitialBalanceTransaction.Commit;
      end
      else
        InitialBalanceTransaction.Rollback;
    except
      Application.MessageBox('Недопустимые значения данных',
        'Ошибка ввода', mb_IconStop);
      Abort;
    end; {try except}
  finally
//    Открываем Таблицы "Сальдо на начало" после Commit'а транзакции
    InitialBalanceDataSet.Open;
  end; {try finally}
  Release;
end;

procedure TInitialBalanceItemForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TInitialBalanceItemForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TInitialBalanceItemForm.DBEditEh1EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  with StoreDataModule do
  begin
    if InitialBalanceDataSet['CustomerID'] <> Null then
      CurCustomerID := InitialBalanceDataSet['CustomerID'];
    CustomerSelectForm := TCustomerSelectForm.Create(Self);
    CustomerSelectForm.ShowModal;
    if CustomerSelectForm.ModalResult = mrOk then
    begin
      InitialBalanceDataSet['CustomerID'] := CurCustomerID;
      InitialBalanceDataSet['CustomerName'] := CurCustomerName;
    end;
    DBNumberEditEh1.SetFocus;
  end;
end;

procedure TInitialBalanceItemForm.DBEditEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBEditEh1EditButtons0Click(Self, h);
end;

procedure TInitialBalanceItemForm.DBEditEh2EditButtons0Click(
  Sender: TObject; var Handled: Boolean);
begin
  VATRateForm := TVATRateForm.Create(Self);
  VATRateForm.ShowModal;
  if VATRateForm.ModalResult = mrOK then
    StoreDataModule.InitialBalanceDataSet['VATRate'] := CurVATRate;
end;

procedure TInitialBalanceItemForm.DBEditEh2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBEditEh2EditButtons0Click(Self, h);
end;

procedure TInitialBalanceItemForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    SelectNext(ActiveControl As TWinControl, True, True);
end;

end.
