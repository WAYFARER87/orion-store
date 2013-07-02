unit FirstAid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, DBCtrlsEh;

type
  TFirstAidForm = class(TForm)
    OKButton: TButton;
    CancelButton: TButton;
    Bevel1: TBevel;
    DBEditEh1: TDBEditEh;
    DBEditEh2: TDBEditEh;
    DBEditEh3: TDBEditEh;
    DBEditEh4: TDBEditEh;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
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
  FirstAidForm: TFirstAidForm;

implementation

uses Registry, StoreDM, Main;

{$R *.dfm}

procedure TFirstAidForm.FormCreate(Sender: TObject);
begin
  Caption := 'Первая помощь';
  DBEditEh1.Text := 'ООО "Моя Фирма"';
  DBEditEh2.Text := 'Склад';
  DBEditEh3.Text := 'Отпускная';
  DBEditEh4.Text := 'Розница';
end;

procedure TFirstAidForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  Registry: TRegistry;
begin
  if ModalResult = mrOk then
  begin
//  Тра-та-та да тра-та-та...
    if DBEditEh1.Text = '' then
    begin
      Application.MessageBox('Не указано Наименование Фирмы', '', MB_ICONSTOP);
      DBEditEh1.SetFocus;
      Abort;
    end;
    if DBEditEh2.Text = '' then
    begin
      Application.MessageBox('Не указан Склад Фирмы', '', MB_ICONSTOP);
      DBEditEh2.SetFocus;
      Abort;
    end;
    if DBEditEh3.Text = '' then
    begin
      Application.MessageBox('Не указаны Отпускные Цены', '', MB_ICONSTOP);
      DBEditEh3.SetFocus;
      Abort;
    end;
    if DBEditEh4.Text = '' then
    begin
      Application.MessageBox('Не указан Покупатель для Розницы', '', MB_ICONSTOP);
      DBEditEh4.SetFocus;
      Abort;
    end;{}
//  Тру-ля-ля и тру-ля-ля...
    with StoreDataModule do
    try
//
      FirmDataSet.Open;
      FirmDataSet.Append;
      FirmDataSet['CustomerName'] := DBEditEh1.Text;
      FirmDataSet['CustomerFullName'] := DBEditEh1.Text;
      FirmDataSet['Firm'] := '1';
      MainFirm := FirmDataSet['CustomerID'];
      FirmName := FirmDataSet.FieldByName('CustomerName').AsString;
      KeyName := FirmDataSet.FieldByName('CustomerID').AsString;
      FirmDataSet.Post;
//
      DivisionDataSet.Open;
      DivisionDataSet.Append;
      DivisionDataSet['DivisionName'] := DBEditEh2.Text;
      DivisionDataSet['CustomerID'] := MainFirm;
      MainDivision := DivisionDataSet['DivisionID'];
      DivisionDataSet.Post;
//
      TypePriceDataSet.Open;
      TypePriceDataSet.Append;
      TypePriceDataSet['PriceName'] := DBEditEh3.Text;
      TypePriceDataSet['Markup'] := 10;
      TypePriceDataSet['Round'] := 0.01;
      MainPrice := TypePriceDataSet['PriceID'];
      TypePriceDataSet.Post;
//
      CustomerDataSet.Open;
      CustomerDataSet.Append;
      CustomerDataSet['CustomerName'] := DBEditEh4.Text;
      CustomerDataSet['CustomerFullName'] := DBEditEh4.Text;
      RetailCustomerID := CustomerDataSet['CustomerID'];
      CustomerDataSet.Post;
//
      FirmTransaction.Commit;
      TypePriceTransaction.Commit;
      CustomerTransaction.Commit;
//
      Registry := TRegistry.Create;
      Registry.RootKey := HKEY_LOCAL_MACHINE;
      try
        if Registry.OpenKey('\SOFTWARE\Logos\IBStore\', false) then
        begin
          Registry.WriteInteger('FirmID', MainFirm);
          if Registry.OpenKey(KeyName, true) then
          begin
            Registry.WriteString('FirmName', FirmName);
            Registry.WriteInteger('DivisionID', MainDivision);
            Registry.WriteInteger('PriceID', MainPrice);
            Registry.WriteInteger('RetailCustID', RetailCustomerID);
          end;
          Registry.CloseKey;
        end;
      finally
        Registry.Free;
      end;
      MainForm.Caption := 'Склад - ' + FirmName +
//                          ' (' + StoreDataModule.DataBase.Params.Values['user_name'] + ')' +
                          NonReg;
    except
      Application.MessageBox('Недопустимые значения данных',
        'Ошибка ввода', mb_IconStop);
      Abort;
    end; {try except}
  end
  else
  if Application.MessageBox('Вы отказываетесь от Первой помощи?',
    'Вопрос',
    mb_YesNo + mb_IconQuestion + mb_DefButton2) = idNo then
    Abort;
//Влкючаем\Отключаем "Меню" Докуметнтов и Отчетов
  MainForm.EnabledMenuItems;
  Release;
end;

procedure TFirstAidForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFirstAidForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFirstAidForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    SelectNext(ActiveControl As TWinControl, True, True);
end;

end.
