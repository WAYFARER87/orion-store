unit ReportCirculate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh, ComCtrls, ToolWin,
  DateUtils;

type
  TReportCirculateForm = class(TForm)
    Panel1: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    SaveButton: TToolButton;
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
    procedure SaveButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReportCirculateForm: TReportCirculateForm;

implementation

uses Main, StoreDM, ReportDM, ReportDebtorPrint;

{$R *.dfm}

procedure TReportCirculateForm.FormCreate(Sender: TObject);
begin
  CloseButton.Left := Panel1.Width - CloseButton.Width - 10;

  if (TopDate = DateToStr(StartOfAMonth(YearOf(StrToDate(TopDate)), MonthOf(StrToDate(TopDate))))) and (BottomDate = DateToStr(EndOfAMonth(YearOf(StrToDate(BottomDate)), MonthOf(StrToDate(BottomDate))))) and (MonthOf(StrToDate(TopDate)) = MonthOf(StrToDate(BottomDate))) then
    SaveButton.Enabled := True
  else
    SaveButton.Enabled := False;

  with ReportDataModule.CirculateQuery do
  begin
    SQL.Clear;
    SQL.Add('SELECT *');
    SQL.Add('FROM "Store_Qty"(:MainFirm, ''' + TopDate + ''', ''' + BottomDate + ''')');
    SQL.Add('');
    SQL.Add('ORDER BY "ProductFullName"');
    ParamByName('MainFirm').Value := MainFirm;
//  ShowMessage(SQL.Text);
    Open;
  end;

  DBGridEh1.Columns[3].Title.Caption := 'Остатки на ' + TopDate + '|Кол-во';
  DBGridEh1.Columns[4].Title.Caption := 'Остатки на ' + TopDate + '|Сумма';
  DBGridEh1.Columns[9].Title.Caption := 'Остатки на ' + BottomDate + '|Кол-во';
  DBGridEh1.Columns[10].Title.Caption := 'Остатки на ' + BottomDate + '|Сумма';

  Caption := 'Оборотно-сальдовая ведомость (' + TopDate + '-' + BottomDate + ')';
end;

procedure TReportCirculateForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ReportDataModule.CirculateQuery.Close;
  Release;
end;

procedure TReportCirculateForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TReportCirculateForm.PrintButtonClick(Sender: TObject);
begin
  ReportDebtorPrintForm := TReportDebtorPrintForm.Create(Self);
  ReportDebtorPrintForm.ShowModal;
end;

procedure TReportCirculateForm.Edit1Change(Sender: TObject);
var
  Find : String;
begin
  Find := AnsiUpperCase(Edit1.Text);
  with ReportDataModule.CirculateQuery do
  begin
    Close;
    SQL.Strings[2] := 'WHERE (UPPER("ProductFullName" COLLATE PXW_CYRL) CONTAINING ''' + Find + ''')';
    Open;
  end;
end;

procedure TReportCirculateForm.SaveButtonClick(Sender: TObject);
begin
  ReportDataModule.DateQuery.SQL.Strings[2] := 'WHERE "Date" = ''' + DateToStr(StrToDate(BottomDate) + 1) + '''';
  ReportDataModule.DateQuery.Open;
  if ReportDataModule.DateQuery['Date'] <> Null then
  begin
    if Application.MessageBox(PChar('На ' +
      DateToStr(StrToDate(BottomDate) + 1) + ' остатки сохранены. Пересчитать?'),
      'Перерасчет',
      mb_YesNo + mb_IconQuestion + mb_DefButton2) = idNo then
    Abort;
  end;
  with ReportDataModule.QtyDateStoredProc do
  try
    ParamByName('MainFirm').Value := MainFirm;
    ParamByName('TopDate').Value := TopDate;
    ParamByName('BottomDate').Value := DateToStr(StrToDate(BottomDate) + 1);
    ExecProc;
    Application.MessageBox(PChar('Остатки на ' + DateToStr(StrToDate(BottomDate) + 1) + ' сохранены.'),
      'Подтвеждение', mb_IconInformation);
  except
    Application.MessageBox(PChar('Нарушение целостности данных.'),
      'Ошибка', mb_IconStop);
  end;
end;

end.
