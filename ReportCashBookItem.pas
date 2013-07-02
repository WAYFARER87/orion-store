unit ReportCashBookItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh, ComCtrls, ToolWin;

type
  TReportCashBookItemForm = class(TForm)
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
    CancelButton: TButton;
    OKButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure InsertButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReportCashBookItemForm: TReportCashBookItemForm;

implementation

uses Main, StoreDM, ReportDM;

{$R *.dfm}

procedure TReportCashBookItemForm.FormCreate(Sender: TObject);
begin
{  with ReportDataModule.CashBookDataSet do
  begin
    SelectSQL.Clear;
    SelectSQL.Add('SELECT *');
    SelectSQL.Add('FROM "CashBook"');
    SelectSQL.Add('WHERE "FirmID" = ' + IntToStr(MainFirm));
    SelectSQL.Add('ORDER BY "Date"');
//  ShowMessage(SQL.Text);
    Open;
  end;{}

  ReportDataModule.CashBookItemQuery.Open;
  Caption := 'Вкладной лист Кассовой книги';
end;

procedure TReportCashBookItemForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ReportDataModule.CashBookItemQuery.Close;
  Release;
end;

procedure TReportCashBookItemForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TReportCashBookItemForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TReportCashBookItemForm.PrintButtonClick(Sender: TObject);
begin
//  ReportDebtorPrintForm := TReportDebtorPrintForm.Create(Self);
//  ReportDebtorPrintForm.ShowModal;
end;

procedure TReportCashBookItemForm.Edit1Change(Sender: TObject);
{var
  Find : String;{}
begin
{  Find := AnsiUpperCase(Edit1.Text);
  with ReportDataModule.DebtorQuery do
  begin
    Close;
    SQL.Strings[2] := 'WHERE (UPPER("CustomerName" COLLATE PXW_CYRL) CONTAINING ''' + Find + ''')';
    Open;
  end;{}
end;

procedure TReportCashBookItemForm.InsertButtonClick(Sender: TObject);
begin
//
end;

end.
