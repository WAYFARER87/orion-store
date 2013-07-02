unit FirmItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, ExtCtrls, DBLookupEh, Grids,
  DBGridEh, ComCtrls, ToolWin;

type
  TFirmItemForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEditEh1: TDBEditEh;
    DBEditEh2: TDBEditEh;
    DBEditEh3: TDBEditEh;
    DBEditEh4: TDBEditEh;
    DBEditEh5: TDBEditEh;
    TabSheet4: TTabSheet;
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    CancelButton: TButton;
    OKButton: TButton;
    TabSheet3: TTabSheet;
    Bevel3: TBevel;
    Label10: TLabel;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    Label11: TLabel;
    DBEditEh11: TDBEditEh;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    InsertButton: TToolButton;
    EditButton: TToolButton;
    DeleteButton: TToolButton;
    ToolButton2: TToolButton;
    TabSheet2: TTabSheet;
    Bevel2: TBevel;
    Label6: TLabel;
    DBEditEh6: TDBEditEh;
    DBEditEh7: TDBEditEh;
    Label9: TLabel;
    DBEditEh10: TDBEditEh;
    Label7: TLabel;
    Label8: TLabel;
    DBEditEh8: TDBEditEh;
    DBEditEh9: TDBEditEh;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure InsertButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure DBEditEh2Exit(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure DBLookupComboboxEh1EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure DBLookupComboboxEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FirmItemForm: TFirmItemForm;
  CurCustomerID : Integer;

implementation

uses StoreDM, Bank, DivisionItem;

{$R *.dfm}

procedure TFirmItemForm.FormCreate(Sender: TObject);
begin
  CurCustomerID := StoreDataModule.FirmDataSet['CustomerID'];
  if StoreDataModule.FirmDataSet['Registration'] <> Null then
    CheckBox1.Checked := True;
  StoreDataModule.BankDataSet.Open;
  StoreDataModule.DivisionDataSet.Open;
  Caption := 'Сведения о Фирме: ' + StoreDataModule.FirmDataSet.FieldByName('CustomerName').AsString;
end;

procedure TFirmItemForm.FormShow(Sender: TObject);
begin
  DBEditEh2.SetFocus;
end;

procedure TFirmItemForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with StoreDataModule do
  try
    try
      if ModalResult = mrOk then
      begin
        if FirmDataSet.Modified then
          FirmDataSet.Post;
        FirmTransaction.Commit;
      end
      else
        FirmTransaction.Rollback;
    except
      Application.MessageBox('Недопустимые значения данных',
        'Ошибка ввода', mb_IconStop);
      Abort;
    end; {try except}
  finally
//    Открываем Таблицы "Фирма" после Commit'а транзакции
    BankDataSet.Close;
    FirmDataSet.Open;
    FirmDataSet.Locate('CustomerID', CurCustomerID, []);
  end; {try finally}
  Release;
end;

procedure TFirmItemForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFirmItemForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFirmItemForm.InsertButtonClick(Sender: TObject);
begin
  StoreDataModule.FirmDataSet.Post;
  StoreDataModule.DivisionDataSet.Append;
  StoreDataModule.DivisionDataSet['CustomerID'] := StoreDataModule.FirmDataSet['CustomerID'];
  DivisionItemForm := TDivisionItemForm.Create(Self);
  DivisionItemForm.ShowModal;
  StoreDataModule.FirmDataSet.Edit;
end;

procedure TFirmItemForm.EditButtonClick(Sender: TObject);
begin
  StoreDataModule.DivisionDataSet.Edit;
  DivisionItemForm := TDivisionItemForm.Create(Self);
  DivisionItemForm.ShowModal;
end;

procedure TFirmItemForm.DeleteButtonClick(Sender: TObject);
var
  DivisionStr : String;
begin
//  StoreDataModule.DivisionDataSet.Locate('DivisionID', StoreDataModule.CustomerSelectQuery['CustomerID'], []);
  DivisionStr := StoreDataModule.DivisionDataSet['DivisionName'];
  if Application.MessageBox(PChar('Вы действительно хотите удалить запись"' +
    DivisionStr + '"?'),
    'Удаление записи',
    mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
  try
    StoreDataModule.DivisionDataSet.Delete;
  except
    Application.MessageBox(PChar('Запись "' + DivisionStr + '" удалять нельзя.'),
      'Ошибка удаления', mb_IconStop);
  end;
end;

procedure TFirmItemForm.DBEditEh2Exit(Sender: TObject);
begin
  if StoreDataModule.FirmDataSet['CustomerFullName'] = Null then
    StoreDataModule.FirmDataSet['CustomerFullName'] := DBEditEh2.Text;
end;

procedure TFirmItemForm.CheckBox1Click(Sender: TObject);
begin
  case CheckBox1.State of
    cbChecked :
    begin
      if StoreDataModule.FirmDataSet['Registration'] = Null then
        StoreDataModule.FirmDataSet['Registration'] := '№';
      DBEditEh10.Enabled := True;
    end;
    cbUnchecked :
    begin
      StoreDataModule.FirmDataSet['Registration'] := Null;
      DBEditEh10.Enabled := False;
    end;
  end;
end;

procedure TFirmItemForm.DBLookupComboboxEh1EditButtons0Click(
  Sender: TObject; var Handled: Boolean);
begin
  BankForm := TBankForm.Create(Self);
  BankForm.ShowModal;
  if BankForm.ModalResult = mrOk then
  with StoreDataModule do
  begin
    FirmDataSet['BankID'] := CurBankID;
    BankDataSet.Close;
    BankDataSet.Open;
  end;
end;

procedure TFirmItemForm.DBLookupComboboxEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  h: Boolean;
begin
  if Key = VK_F3 then
    DBLookupComboboxEh1EditButtons0Click(Self, h);
end;

procedure TFirmItemForm.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F2 : InsertButton.Click;
    VK_F3 : EditButton.Click;
    VK_F8 : DeleteButton.Click;
  end;
end;

procedure TFirmItemForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    SelectNext(ActiveControl As TWinControl, True, True);
end;

end.
