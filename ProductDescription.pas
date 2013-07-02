unit ProductDescription;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ExtCtrls;

type
  TProductDescriptionForm = class(TForm)
    Panel1: TPanel;
    OKButton: TButton;
    procedure OKButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ProductDescriptionForm: TProductDescriptionForm;

implementation

uses StoreDM;

{$R *.dfm}

procedure TProductDescriptionForm.OKButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TProductDescriptionForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Release;
end;

end.
