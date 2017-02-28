unit ufrmTest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxButtons;

type
  TfrmTest = class(TForm)
    cxButton1: TcxButton;
    procedure Button1Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTest: TfrmTest;

implementation

uses
  uModTest, uClientClasses, uDMClient;

{$R *.dfm}

procedure TfrmTest.Button1Click(Sender: TObject);
begin
  with TTestMethodClient.Create(DMClient.RestConn) do
  begin
    showmessage(Hallo('test'));
  end;
end;

procedure TfrmTest.cxButton1Click(Sender: TObject);
var
  lTest: TModTest;
  i: Integer;
  lTestItem: TModTestItem;
begin
  lTest := TModTest.Create;
  lTest.RefNo := 'Halo';
  lTest.RefDate := Now();

  for i := 0 to 5 do
  begin
    lTestItem := TModTestItem.Create;
    lTestItem.ItemCode := 'ItemCode_' + inttostr(i);
    lTestItem.ItemName := 'ItemName_' + inttostr(i);
    lTestItem.QTY := i;
    lTest.Items.Add(lTestItem);
  end;

end;

end.
