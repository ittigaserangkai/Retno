unit ufrmTest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxButtons, cxControls,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView, DBClient,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxContainer, cxTextEdit;

type
  TfrmTest = class(TForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    DataSource1: TDataSource;
    cxButton3: TcxButton;
    cxTextEdit1: TcxTextEdit;
    cxTextEdit2: TcxTextEdit;
    procedure Button1Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTest: TfrmTest;

implementation

uses
  uModTest, uClientClasses, uDMClient, uDBUtils;

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
  Crud: TCrudClient;
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

  Crud := TCrudClient.Create(DMCLient.RestConn);
  Try
    Crud.SaveToDB(lTest);
  Finally
    Crud.Free;
  End;



end;

procedure TfrmTest.cxButton2Click(Sender: TObject);
var
  Crud: TCrudClient;
  CDS: TClientDataSet;
begin
  Crud := TCrudClient.Create(DMCLient.RestConn);
  Try
    CDS :=  TDBUtils.DSToCDS( Crud.OpenQuery('select * from ttest'),Self );
  Finally
    Crud.Free;
  End;

  DataSource1.DataSet := CDS;
  cxGrid1DBTableView1.DataController.CreateAllItems(True);
end;

procedure TfrmTest.cxButton3Click(Sender: TObject);
var
  CDS: TClientDataSet;
  Crud: TCrudClient;
  ID: string;
  lTest: TModTest;
begin
  CDS := TClientDataSet(DataSource1.DataSet);
  ID := CDS.FieldByName('ID').AsString;
  Crud := TCrudClient.Create(DMCLient.RestConn);
  Try
    lTest := Crud.Retrieve(TModTest.ClassName,ID )  as TModTest;
    cxTextEdit1.Text := lTest.ID;
    cxTextEdit2.Text := lTest.RefNo;
  Finally
    Crud.Free;
  End;
end;

end.
