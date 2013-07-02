unit RemainCredit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh, ComCtrls, ToolWin;

type
  TRemainCreditForm = class(TForm)
    Panel1: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    InsertButton: TToolButton;
    EditButton: TToolButton;
    DeleteButton: TToolButton;
    ToolButton2: TToolButton;
    Edit1: TEdit;
    ToolButton3: TToolButton;
    PayButton: TToolButton;
    PrintButton: TToolButton;
    DBGridEh1: TDBGridEh;
    Splitter1: TSplitter;
    DBGridEh2: TDBGridEh;
    CloseButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CloseButtonClick(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RemainCreditForm: TRemainCreditForm;

implementation

uses Main, StoreDM, ReportDM, ReportDebtorPrint;

{$R *.dfm}

procedure TRemainCreditForm.FormCreate(Sender: TObject);
begin
  CloseButton.Left := Panel1.Width - CloseButton.Width - 10;

  with ReportDataModule.DebtorQuery do
  begin
    SQL.Clear;
    SQL.Add('SELECT *');
    SQL.Add('FROM "Customer_Debtor"(''' + IntToStr(MainFirm) + ''', ''' + WorkDate + ''', ''' + IntToStr(Arrear) + ''')');
    SQL.Add('');
    SQL.Add('ORDER BY "CustomerName"');
//  ShowMessage(SQL.Text);
    Open;
  end;

  with ReportDataModule.DebtorOrderQuery do
  begin
    if Arrear = 1 then
      SQL.Strings[3] := 'AND ("Orders"."PayDate" < ''' + WorkDate + ''')'
    else
      SQL.Strings[3] := 'AND ("Orders"."Date" <= ''' + WorkDate + ''')';
    ParamByName('MainFirm').Value := MainFirm;
    Open;
  end;
  
  Caption := 'Список должников';
end;

procedure TRemainCreditForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ReportDataModule.DebtorQuery.Close;
  ReportDataModule.DebtorOrderQuery.Close;
  Release;
end;

procedure TRemainCreditForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TRemainCreditForm.PrintButtonClick(Sender: TObject);
begin
//  ReportDataModule.DebtorQuery.DisableControls;
  ReportDebtorPrintForm := TReportDebtorPrintForm.Create(Self);
  ReportDebtorPrintForm.ShowModal;
end;

procedure TRemainCreditForm.Edit1Change(Sender: TObject);
var
  Find : String;
begin
  Find := AnsiUpperCase(Edit1.Text);
  with ReportDataModule.DebtorQuery do
  begin
    Close;
    SQL.Strings[2] := 'WHERE (UPPER("CustomerName" COLLATE PXW_CYRL) CONTAINING ''' + Find + ''')';
    Open;
  end;
end;

procedure TRemainCreditForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F4 : Edit1.SetFocus;
    VK_F10 : PrintButton.Click;
  end;
end;

procedure TRemainCreditForm.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    DBGridEh1.SetFocus;
end;

end.
