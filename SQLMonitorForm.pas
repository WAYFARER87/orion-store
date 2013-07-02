unit SQLMonitorForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBSQLMonitor, StdCtrls, ComCtrls, Menus;

type
  TSQLMonitor = class(TForm)
    mmo1: TMemo;
    IBSQLMonitor1: TIBSQLMonitor;
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    MenuSave: TMenuItem;
    MenuClear: TMenuItem;
    SaveDialog1: TSaveDialog;
    procedure IBSQLMonitor1SQL(EventText: String; EventTime: TDateTime);
    procedure MenuSaveClick(Sender: TObject);
    procedure MenuClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SQLMonitor: TSQLMonitor;


implementation

{$R *.dfm}

procedure TSQLMonitor.IBSQLMonitor1SQL(EventText: String; EventTime: TDateTime);
begin
 mmo1.Lines.Add(DateTimeToStr(EventTime));
 mmo1.Lines.Add(EventText);
 mmo1.Lines.Add('______________________________')
end;

procedure TSQLMonitor.MenuSaveClick(Sender: TObject);
begin
 if SaveDialog1.Execute then
 mmo1.Lines.SaveToFile(SaveDialog1.FileName); 
end;

procedure TSQLMonitor.MenuClearClick(Sender: TObject);
begin
 mmo1.Clear;
end;

end.
