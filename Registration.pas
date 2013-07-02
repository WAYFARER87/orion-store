unit Registration;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, ExtCtrls, Buttons, ComCtrls, IniFiles;

type
  TRegistrationForm = class(TForm)
    OKButton: TButton;
    CancelButton: TButton;
    Bevel1: TBevel;
    DBEditEh1: TDBEditEh;
    Label1: TLabel;
    Label2: TLabel;
    KeyEdit1: TEdit;
    KeyEdit2: TEdit;
    KeyEdit3: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure DBEditEh1EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBEditEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEditEh3EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure KeyEdit1Change(Sender: TObject);
    procedure KeyEdit2Change(Sender: TObject);
    procedure KeyEdit3Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RegistrationForm: TRegistrationForm;

implementation

uses Registry, StoreDM, Main, FirmSelect, Coding;

{$R *.dfm}

procedure TRegistrationForm.FormCreate(Sender: TObject);
begin
  with StoreDataModule do
  begin
    FirmSelectQuery.Open;
    FirmSelectQuery.Locate('CustomerID', MainFirm, []);
  end;
  Caption := 'Регистрация';
end;

procedure TRegistrationForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var

  IniFile : TIniFile;

begin
  if ModalResult = mrOk then
  begin
    KeyName := StoreDataModule.FirmSelectQuery.FieldByName('CustomerID').AsString;
    Key := KeyEdit1.Text + KeyEdit2.Text + KeyEdit3.Text;

    if Key = Code(StoreDataModule.FirmSelectQuery.FieldByName('INN').AsString) then
    begin

      IniFile:= TIniFile.Create(ExtractFilePath(Application.ExeName)+'/store.cfg');
        try
             IniFile.WriteString('Firm','Key', Key);
            if not IniFile.ValueExists('Firm','FirmName') then
              IniFile.WriteString('Firm','FirmName', StoreDataModule.FirmSelectQuery.FieldByName('CustomerName').AsString);
            if not IniFile.ValueExists('Firm','DivisionID') then
              IniFile.WriteInteger('Firm','DivisionID', 1);
            if not IniFile.ValueExists('Firm','PriceID') then
              IniFile.WriteInteger('Firm','PriceID', 0);
            if not IniFile.ValueExists('Firm','RetailCustID') then
              IniFile.WriteInteger('Firm','RetailCustID', 0);


      finally
        IniFile.Free;
      end;

      Application.MessageBox('Регистрация произведена успешно.',
        'Спасибо', mb_IconInformation);
      if KeyName = IntToStr(MainFirm) then
      begin
        NonReg := '';
        MainForm.Caption := 'Склад - ' + FirmName +
//                            ' (' + StoreDataModule.DataBase.Params.Values['user_name'] + ')' +
                            NonReg;
      end;
    end
    else
    begin
      Application.MessageBox('Неверен код регистрации.',
        'Ошибка', mb_IconStop);
      Abort;
    end;
  end;
  with StoreDataModule do
  begin
    FirmSelectQuery.Close;
  end;
  Release;
end;

procedure TRegistrationForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TRegistrationForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TRegistrationForm.DBEditEh1EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  FirmSelectForm := TFirmSelectForm.Create(Self);
  FirmSelectForm.ShowModal;
end;

procedure TRegistrationForm.DBEditEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBEditEh1EditButtons0Click(Self, h);
end;

procedure TRegistrationForm.DBEditEh3EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
{  CurCustomerID := RetailCustomerID;
  CustomerSelectForm := TCustomerSelectForm.Create(Self);
  CustomerSelectForm.ShowModal;
  StoreDataModule.CustomerSelectQuery.Open;
  if CustomerSelectForm.ModalResult = mrOK then
    StoreDataModule.CustomerSelectQuery.Locate('CustomerID', CurCustomerID, [])
  else
    StoreDataModule.CustomerSelectQuery.Locate('CustomerID', RetailCustomerID, []);{}
end;

procedure TRegistrationForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    OKButton.Click;
end;

procedure TRegistrationForm.KeyEdit1Change(Sender: TObject);
begin
  if Length(KeyEdit1.Text) = 4 then
    KeyEdit2.SetFocus;
end;

procedure TRegistrationForm.KeyEdit2Change(Sender: TObject);
begin
  if Length(KeyEdit2.Text) = 4 then
    KeyEdit3.SetFocus;
end;

procedure TRegistrationForm.KeyEdit3Change(Sender: TObject);
begin
  if Length(KeyEdit3.Text) = 4 then
  begin
    OKButton.SetFocus;
    DBEditEh1.Enabled := False;
    KeyEdit1.Enabled := False;
    KeyEdit2.Enabled := False;
    KeyEdit3.Enabled := False;
  end;
end;

end.
