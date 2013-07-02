unit ReportCashBook;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh, ComCtrls, ToolWin;

type
  TReportCashBookForm = class(TForm)
    Panel1: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    InsertButton: TToolButton;
    EditButton: TToolButton;
    DeleteButton: TToolButton;
    ToolButton2: TToolButton;
    Edit1: TEdit;
    ToolButton3: TToolButton;
    PrintButton: TToolButton;
    DBGridEh1: TDBGridEh;
    CloseButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CloseButtonClick(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure InsertButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReportCashBookForm: TReportCashBookForm;

implementation

uses Main, StoreDM, ReportDM, ReportCashBookDateSelect, ReportCashBookItem,
  ReportDebtorPrint;

{$R *.dfm}

procedure TReportCashBookForm.FormCreate(Sender: TObject);
begin
  CloseButton.Left := Panel1.Width - CloseButton.Width - 10;

  with ReportDataModule.CashBookDataSet do
  begin
    SelectSQL.Clear;
    SelectSQL.Add('SELECT *');
    SelectSQL.Add('FROM "CashBook"');
    SelectSQL.Add('WHERE "FirmID" = ' + IntToStr(MainFirm));
    SelectSQL.Add('ORDER BY "Date"');
//  ShowMessage(SQL.Text);
    Open;
  end;

  Caption := 'Кассовая книга';
end;

procedure TReportCashBookForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ReportDataModule.CashBookDataSet.Close;
  Release;
end;

procedure TReportCashBookForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TReportCashBookForm.PrintButtonClick(Sender: TObject);
begin
  ReportDebtorPrintForm := TReportDebtorPrintForm.Create(Self);
//  ReportDebtorPrintForm.ShowModal;
end;

procedure TReportCashBookForm.Edit1Change(Sender: TObject);
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

procedure TReportCashBookForm.InsertButtonClick(Sender: TObject);
begin
  ReportDataModule.CashBookDataSet.Append;
  ReportDataModule.CashBookDataSet['FirmID'] := MainFirm;
  ReportCashBookDateSelectForm := TReportCashBookDateSelectForm.Create(Self);
  ReportCashBookDateSelectForm.ShowModal;
  ReportDataModule.CashBookDataSet.Post;
  ReportCashBookItemForm := TReportCashBookItemForm.Create(Self);
  ReportCashBookItemForm.ShowModal;
  if ReportCashBookItemForm.ModalResult = mrOK then
    ReportDataModule.CashBookTransaction.Commit
  else
    ReportDataModule.CashBookTransaction.Rollback;
  ReportDataModule.CashBookDataSet.Open;
end;

procedure TReportCashBookForm.EditButtonClick(Sender: TObject);
begin
  ReportCashBookItemForm := TReportCashBookItemForm.Create(Self);
  ReportCashBookItemForm.ShowModal;
end;

end.
