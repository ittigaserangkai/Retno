unit udmMain;

interface

uses
  SysUtils, Classes, DB, Windows, uConstanta, AppEvnts, ADODB,
  IdTCPConnection, IdTCPClient, IdBaseComponent, IdComponent, IdTCPServer,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Phys.MSSQLDef, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.Phys.ODBCBase, FireDAC.Phys.MSSQL,
  FireDAC.Comp.DataSet;


type
  TdmMain = class(TDataModule)
    transGoro: TFDTransaction;
    qrMultiPurpose: TFDQuery;
    spMultiPurpose: TFDStoredProc;
    qrInsert: TFDQuery;
    qrUpdate: TFDQuery;
    qrDelete: TFDQuery;
    spInsert: TFDStoredProc;
    spUpdate: TFDStoredProc;
    spDelete: TFDStoredProc;
    appevnMain: TApplicationEvents;
    adoConn: TADOConnection;
    adoQry: TADOQuery;
    fdMSSQLdl1: TFDPhysMSSQLDriverLink;
    connGoro: TFDConnection;
    ADea1: TFDEventAlerter;
    dbPOS: TFDConnection;
    TransPOS: TFDTransaction;
    procedure appevnMainException(Sender: TObject; E: Exception);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
//    FConnectionGuardian: TIBConnectionGuardian;
  public
//    property ConnectionGuardian: TIBConnectionGuardian read FConnectionGuardian;
  end;

var
  dmMain: TdmMain;

implementation

uses
  uTSCommonDlg;

{$R *.dfm}

procedure TdmMain.appevnMainException(Sender: TObject; E: Exception);
begin
  CommonDlg.ShowError(E.Message);
end;

procedure TdmMain.DataModuleCreate(Sender: TObject);
begin
//  FConnectionGuardian := TIBConnectionGuardian.Create;
end;

procedure TdmMain.DataModuleDestroy(Sender: TObject);
begin
//  FConnectionGuardian.Free;
end;

end.
