unit CustomerSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh,
  DB, ComCtrls, ToolWin;

type
  TCustomerSelectForm = class(TForm)
    Panel1: TPanel;
    CancelButton: TButton;
    OKButton: TButton;
    DBGridEh1: TDBGridEh;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    InsertButton: TToolButton;
    EditButton: TToolButton;
    DeleteButton: TToolButton;
    ToolButton2: TToolButton;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure InsertButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CustomerSelectForm: TCustomerSelectForm;

implementation

uses StoreDM, CustomerItem;

var
  CloseStatus : Boolean;

{$R *.dfm}

procedure TCustomerSelectForm.FormCreate(Sender: TObject);
begin
  with StoreDataModule.CustomerSelectQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT "Customers"."CustomerID", "Customers"."CustomerName", "Customers"."PriceID", "Customers"."DelayPay"');
    SQL.Add('FROM "Customers"');
    SQL.Add('WHERE ("Customers"."CustomerID" <> :MainFirm AND "Customers"."CustomerID" > 0)');
    SQL.Add('');
    SQL.Add('ORDER BY "Customers"."CustomerName"');{}
    Open;
  end;
  Caption := 'Выбери меня, выбери меня...';
end;

procedure TCustomerSelectForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with StoreDataModule.CustomerSelectQuery do
  begin
    if CustomerSelectForm.ModalResult = mrOk then
    begin
      CurCustomerID := FieldByName('CustomerID').Value;
      CurCustomerName := FieldByName('CustomerName').Value;
      if FieldByName('Debt').IsNull then
        CurDebt := 0
      else
        CurDebt := FieldByName('Debt').Value;
      if FieldByName('PriceID').IsNull then
        CurPriceID := MainPrice // Если у Клиента нет "Типа Цен", то проставляем "Тип Цены" по-умолчанию
      else
        CurPriceID := FieldByName('PriceID').Value;
      if FieldByName('DelayPay').IsNull then
        CurrentDelayPay := 0 // Если у Клиента нет "Отсрочки платежа", то проставляем "Ноль"
      else
        CurrentDelayPay := FieldByName('DelayPay').Value;
    end;
    Close;
    SQL.Clear;
    SQL.Add('SELECT "Customers"."CustomerID", "Customers"."CustomerName", "Customers"."PriceID", "Customers"."DelayPay"');
    SQL.Add('FROM "Customers"');
    SQL.Add('WHERE ("Customers"."CustomerID" <> :MainFirm AND "Customers"."CustomerID" > 0)');
    SQL.Add('');
    SQL.Add('ORDER BY "Customers"."CustomerName"');{}
  end;
  StoreDataModule.DebtQuery.Close;
end;

procedure TCustomerSelectForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TCustomerSelectForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TCustomerSelectForm.CheckBox1Click(Sender: TObject);
begin
  with StoreDataModule.CustomerSelectQuery do
  begin
    Close;
    if CheckBox1.Checked then
    begin
      SQL.Strings[1] := 'FROM "Customers", "Balance"';
      SQL.Strings[2] := 'WHERE ("Customers"."CustomerID" <> :MainFirm AND "Customers"."CustomerID" > 0) AND ("Customers"."CustomerID" = "Balance"."CustomerID") AND ("Balance"."FirmID" = :MainFirm AND "Balance"."Debt" <> 0)';
    end
    else
    begin
      SQL.Strings[1] := 'FROM "Customers"';
      SQL.Strings[2] := 'WHERE ("Customers"."CustomerID" <> :MainFirm AND "Customers"."CustomerID" > 0)';
    end;
    Open;
  end
end;

procedure TCustomerSelectForm.Edit1Change(Sender: TObject);
var
  Find : String;
begin
  Find := AnsiUpperCase(Edit1.Text);
  with StoreDataModule.CustomerSelectQuery do
  begin
    Close;
    SQL.Strings[3] := ' AND (UPPER("Customers"."CustomerName") LIKE ''%' + Find + '%'')';
    Open;
  end;
end;

procedure TCustomerSelectForm.InsertButtonClick(Sender: TObject);
begin
  if StoreDataModule.CustomerDataSet.Active = False then
  begin
    CloseStatus := True;
    StoreDataModule.CustomerDataSet.Open;
  end;
  StoreDataModule.CustomerDataSet.Append;
  CustomerItemForm := TCustomerItemForm.Create(Self);
  CustomerItemForm.ShowModal;
  if CustomerItemForm.ModalResult = mrOK then
  begin
    StoreDataModule.CustomerSelectQuery.Close;
    StoreDataModule.DebtQuery.Close;
    StoreDataModule.CustomerSelectQuery.Open;
  end;
  if CloseStatus = True then
  begin
    StoreDataModule.CustomerDataSet.Close;
    CloseStatus := False;
  end;
end;

procedure TCustomerSelectForm.EditButtonClick(Sender: TObject);
begin
  if StoreDataModule.CustomerDataSet.Active = False then
  begin
    CloseStatus := True;
    StoreDataModule.CustomerDataSet.Open;
  end;
  StoreDataModule.CustomerDataSet.Edit;
  StoreDataModule.CustomerDataSet.Locate('CustomerID', StoreDataModule.CustomerSelectQuery['CustomerID'], []);
  CustomerItemForm := TCustomerItemForm.Create(Self);
  CustomerItemForm.ShowModal;
  if CustomerItemForm.ModalResult = mrOK then
  begin
    StoreDataModule.CustomerSelectQuery.Close;
    StoreDataModule.DebtQuery.Close;
    StoreDataModule.CustomerSelectQuery.Open;
  end;
  if CloseStatus = True then
  begin
    StoreDataModule.CustomerDataSet.Close;
    CloseStatus := False;
  end;
end;

procedure TCustomerSelectForm.DeleteButtonClick(Sender: TObject);
var
  CustomerStr : String;
begin
  if StoreDataModule.CustomerDataSet.Active = False then
  begin
    CloseStatus := True;
    StoreDataModule.CustomerDataSet.Open;
  end;
  StoreDataModule.CustomerDataSet.Locate('CustomerID', StoreDataModule.CustomerSelectQuery['CustomerID'], []);
  CustomerStr := StoreDataModule.CustomerDataSet.FieldByName('CustomerName').AsString;
  if Application.MessageBox(PChar('Вы действительно хотите удалить запись"' +
    CustomerStr + '"?'),
    'Удаление записи',
    mb_YesNo + mb_IconQuestion + mb_DefButton2) = idYes then
  try
    StoreDataModule.CustomerDataSet.Delete;
  except
    Application.MessageBox(PChar('Запись "' + CustomerStr + '" удалять нельзя.'),
      'Ошибка удаления', mb_IconStop);
  end;
  if CloseStatus = True then
  begin
    StoreDataModule.CustomerDataSet.Close;
    CloseStatus := False;
  end;
  StoreDataModule.CustomerSelectQuery.Close;
  StoreDataModule.CustomerSelectQuery.Open;
end;

procedure TCustomerSelectForm.DBGridEh1DblClick(Sender: TObject);
begin
  OKButton.Click;
end;

procedure TCustomerSelectForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN : OKButton.Click;
    VK_F2 : InsertButton.Click;
    VK_F3 : EditButton.Click;
    VK_F8 : DeleteButton.Click;
    VK_F4 : Edit1.SetFocus;
  end;
end;

end.
