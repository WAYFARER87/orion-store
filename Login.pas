unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,
  IB, Mask, DBCtrlsEh, IniFiles;

type
  TLoginForm = class(TForm)
    OpenDialog1: TOpenDialog;
    CancelButton: TButton;
    ConnectButton: TButton;
    Bevel1: TBevel;
    Label1: TLabel;
    Bevel2: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBNameEditEh: TDBEditEh;
    UserNameEditEh: TDBEditEh;
    PasswordEditEh: TDBEditEh;
    RoleNameEditEh: TDBEditEh;
    SavePasswodCheckBox: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBNameEditEhEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBNameEditEhKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ConnectButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure DataBaseConnect;
  public
    { Public declarations }
  end;

var
  LoginForm: TLoginForm;

implementation

uses Registry, StoreDM, Main, Coding, ssdefines;

{$R *.dfm}

procedure TLoginForm.FormCreate(Sender: TObject);
begin
  Caption := 'Соединение...';
end;

procedure TLoginForm.FormShow(Sender: TObject);
var
  Registry: TRegistry;
  IniFile:  TIniFile;
begin
//Читаем из реестра текущие настройки
  IniFile:=TIniFile.Create( ExtractFilePath(Application.ExeName)+'/store.cfg');
  try
   if FileExists(ExtractFilePath(Application.ExeName)+'/store.cfg') then
   begin
      DBNameEditEh.Text := IniFile.ReadString('DataBase','DBName','');
      UserNameEditEh.Text := IniFile.ReadString('DataBase','UserName','');
      RoleNameEditEh.Text := IniFile.ReadString('DataBase','RoleName','');
   end;
  finally
     IniFile.Free;
  end;

  if Length(DBNameEditEh.Text) = 0 then
    ActiveControl := DBNameEditEh
  else
    if Length(UserNameEditEh.Text) = 0 then
      ActiveControl := UserNameEditEh
    else
      if Length(PasswordEditEh.Text) = 0 then
        ActiveControl := PasswordEditEh;
end;

procedure TLoginForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  Registry: TRegistry;
  IniFile: TIniFile;

begin
  if ModalResult = mrOk then
  begin
    DataBaseConnect;
   IniFile:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'/store.cfg');

//  Это кусок из "MainForm.FormCreate"
    Registry := TRegistry.Create;
    Registry.RootKey := HKEY_LOCAL_MACHINE;
    try
        if not IniFile.ValueExists('Firm','FirmID') then
          IniFile.WriteInteger('Firm','FirmID', 0);
        MainFirm := IniFile.ReadInteger('Firm','FirmID', 0);
        if not IniFile.ValueExists('DataBase', 'DBName') then
          IniFile.WriteString('DataBase', 'DBName', ExtractFilePath(Application.ExeName) + 'DataBase\store.gdb');
        DBName := IniFile.ReadString('DataBase', 'DBName','');
        KeyName := IntToStr(MainFirm);

          FirmName := IniFile.ReadString('Firm','FirmName','');
          Key := IniFile.ReadString('Firm','Key','');
          if not IniFile.ValueExists('Firm', 'DivisionID') then
            IniFile.WriteInteger('Firm','DivisionID', 0);
          MainDivision := IniFile.ReadInteger('Firm','DivisionID',0);
          if not IniFile.ValueExists('Firm','PriceID') then
            IniFile.WriteInteger('Firm','PriceID', 0);
          MainPrice := IniFile.ReadInteger('Firm','PriceID',0);
          if not IniFile.ValueExists('Firm','RetailCustID') then
            IniFile.WriteInteger('Firm','RetailCustID', 0);
          RetailCustomerID := IniFile.ReadInteger('Firm','RetailCustID',0);



    finally
      IniFile.Free;
    end;



    with StoreDataModule do
    begin
      FirmSelectQuery.Open;
      FirmSelectQuery.Locate('CustomerID', MainFirm, []);
      if (FirmName <> FirmSelectQuery['CustomerName']) or (Key <> Code(FirmSelectQuery.FieldByName('INN').AsString)) then
      begin
        NonReg := ' - не зарегистрировано';
        Application.MessageBox('Пожалуйста, зарегистрируйтесь.',
          'Предупреждение', mb_IconWarning);
      end;
      if (MainFirm <> FirmSelectQuery['CustomerID']) and (FirmName <> FirmSelectQuery['CustomerName']) then
      begin
        MainFirm := 0;
        FirmName := '';
        MainDivision := 0;
        MainPrice := 0;
        RetailCustomerID := 0;
      end;
      FirmSelectQuery.Close;
    end;
    MainForm.Caption := 'Склад - ' + FirmName +
//               ' (' + StoreDataModule.DataBase.Params.Values['user_name'] + ')' +
               NonReg;
  end;
//Влкючаем\Отключаем "Меню" Докуметнтов и Отчетов
  MainForm.EnabledMenuItems;
  Release;
end;

procedure TLoginForm.DBNameEditEhEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  OpenDialog1.InitialDir := DBNameEditEh.Text;
  if OpenDialog1.Execute then
    DBNameEditEh.Text := OpenDialog1.FileName;
end;

procedure TLoginForm.DBNameEditEhKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBNameEditEhEditButtons0Click(Self, h);
end;

var
  i : Word = 0;
procedure TLoginForm.DataBaseConnect;
var
  OldDBName : String;
  OldDBParams : String;
  ErrorStr: String;
  Registry: TRegistry;
  IniFile : TIniFile;
begin
  if MainForm.MDIChildCount > 0 then
  begin
    Application.MessageBox('При переподключении необходимо закрыть все активные таблицы.',
      'Предупреждение', mb_IconWarning);
    Exit;
  end; {if}
  if DBNameEditEh.Text = '' then
  begin
    Application.MessageBox('Не указан файл базы данных.',
      'Ошибка подключения', mb_IconStop);
    DBNameEditEh.SetFocus;
    i := i + 1;
    if i < 3 then
      Abort
    else
    begin
      i := 0;
      Exit;
    end;
  end; {if}
  with StoreDataModule.DataBase do
  try
    if Connected then
    begin
      Close;
      OldDBName := DatabaseName;
      OldDBParams := Params.Text;
      DatabaseName := '';
      Params.Text := '';
    end; {if}
    Params.Add(Format('user_name=%s', [UserNameEditEh.Text]));
    Params.Add(Format('password=%s', [PasswordEditEh.Text]));
    if Length(RoleNameEditEh.Text) <> 0 then
      Params.Add(Format('sql_role_name=%s', [RoleNameEditEh.Text]));
    Params.Add(Format('lc_ctype=%s', ['WIN1251']));
    DBName := GetCorrectWayToIBDB(DBNameEditEh.Text);
    Open;

//Если подключились к новой базе, то Сохраняем в реестре настройки
 {   Registry := TRegistry.Create;
    Registry.RootKey := HKEY_LOCAL_MACHINE;
    try
      if Registry.OpenKey('\SOFTWARE\Logos\IBStore\', false) then
      begin
        Registry.WriteString('DBName', DBNameEditEh.Text);
        Registry.WriteString('UserName', UserNameEditEh.Text);
        Registry.WriteString('RoleName', RoleNameEditEh.Text);
        Registry.CloseKey;
      end;
    finally
      Registry.Free;
    end;  }

    IniFile:=TIniFile.Create( ExtractFilePath(Application.ExeName)+'//store.cfg');
    IniFile.WriteString('DataBase', 'DBName', DBNameEditEh.Text);
    IniFile.WriteString('DataBase','UserName', UserNameEditEh.Text);
    IniFile.WriteString('DataBase','RoleName', RoleNameEditEh.Text);

    IniFile.Free;
    UserName := UserNameEditEh.Text;

  except
    on SQLError: EIBInterBaseError do
    begin
      case SQLError.IBErrorCode of
        335544344: ErrorStr := 'Файл ' + DBNameEditEh.Text + ' не найден.';
        335544323: ErrorStr := 'Файл ' + DBNameEditEh.Text + ' не является базой данных.';
        335544421, 335544461, 335544462: ErrorStr := 'Ошибка соединения.';
        335544325, 335544441, 335544648: ErrorStr := 'Ошибка при подключении.';
        335544472: ErrorStr := 'Ваше имя и пароль не определены.';
    end; {on EIBError}
    Application.MessageBox(PChar(ErrorStr),
      'Ошибка доступа', mb_IconStop);
    i := i + 1;
    UserNameEditEh.SetFocus;
    if (Length(OldDBName) <> 0) and (OldDBParams <> '') then
    begin
      DatabaseName := OldDBName;
      Params.Text := OldDBParams;
      Open;
    end; {if}
    if i < 3 then
      Abort
    else
    begin
      i := 0;
      ModalResult := mrCancel;
      Exit;
    end;
  end; {try}
  end;
end;

procedure TLoginForm.ConnectButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TLoginForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TLoginForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    ConnectButton.Click;
end;

end.
