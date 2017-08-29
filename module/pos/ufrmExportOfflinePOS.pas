unit ufrmExportOfflinePOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls , IdBaseComponent, IdMailBox,
  Datasnap.DBClient, uModApp, uModTransaksi;

type
  TfrmExportOfflinePOS = class(TForm)
    pnlBody: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    dtTanggal: TDateTimePicker;
    btnExport: TButton;
    mmoExport: TMemo;
    pnlHeader: TPanel;
    lblHeader: TLabel;
    dlgSave: TSaveDialog;
    chkOnline: TCheckBox;
    idmlExpPOS: TIdMailBox;
    procedure FormShow(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
//    Cnn : TConnection;
    FDefUnitID: Integer;
    FLDateImp : TDateTime;
    FmodTrans: TModTransaksi;
    FModTransDetail: TModTransaksi_Detil;
    FUnitID: Integer;
    function GetmodTrans: TModTransaksi;
    function GetModTransDetail: TModTransaksi_Detil;
    function UpdateData(aUnitID: Integer; aTgl: TDateTime; aModel: TModApp):
        Boolean;
    property modTrans: TModTransaksi read GetmodTrans write FmodTrans;
    property ModTransDetail: TModTransaksi_Detil read GetModTransDetail write
        FModTransDetail;
  public
    property UnitID: Integer read FUnitID write FUnitID;
  published
  end;

var
  frmExportOfflinePOS: TfrmExportOfflinePOS;

implementation

uses
  uTSCommonDlg, udmMain, uAppUtils, uDMClient, uDBUtils;

{$R *.dfm}

procedure TfrmExportOfflinePOS.FormShow(Sender: TObject);
var
  ssql:string;
begin
  dtTanggal.DateTime := Now;
  FDefUnitID := StrToInt(dmMain.getGlobalVar('UNITID'));
//  sSQL := 'select UPRD_DATE from ULINK_PRD order by UPRD_DATE desc rows 1';
//
//  with cOpenQuery(sSQL) do
//  begin
//    try
//      if not Eof then
//      begin
//        FLDateImp := Fields[0].AsDateTime;
//      end;
//    finally
//      Free;
//    end;
//  end;
end;

procedure TfrmExportOfflinePOS.btnExportClick(Sender: TObject);
var
  aListAll : TStrings;
  SS    : TStrings;
  sSql: String;
begin
  if UnitID <= 0 then
  begin
    CommonDlg.ShowError('Unit Belum Dipilih');
    Close;
  end;
  if chkOnline.Checked = False then
  begin
    {
    mmoExport.Clear;
    LoadDataSetupPOS(UnitID, FLDateImp, mmoExport);
    //LoadDataBeginningBalance(UnitID, dtTanggal.DateTime,mmoExport);
    LoadDataTransaksi(UnitID, FLDateImp, mmoExport);
    LoadDataTransaksiDetil(UnitID, FLDateImp,mmoExport);
    LoadDataTransaksiCard(UnitID, FLDateImp,mmoExport);
    LoadDataTransaksiVoucherLain(UnitID, FLDateImp,mmoExport);
    LoadDataTransaksiVoucherAssalam(UnitID, FLDateImp,mmoExport);
    LoadDataTransaksiKuponBotol(UnitID, FLDateImp,mmoExport);

    if dlgSave.Execute then
    begin
      mmoExport.Lines.SaveToFile(dlgSave.FileName);
      sSql  := 'insert into uLINK_PRD (uPRD_DATE, uPRD_UNIT, uPRD_POSCODE) values('
          + Quot(FormatDateTime('MM-DD-YYYY hh:mm:ss', cGetServerTime))
          + ', ' + IntToStr(FDefUnitID)
          + ', ' + Quot(frmMain.FPOSCode)
          + ');';
      cExecSQLDoNotUseIt(ssQL);
      CommonDlg.ShowMessage('Sukses Export file');
      cCommitTrans;

    end;
    }
  end
  else
  begin
//    UpdateData(FDefUnitID, dtTanggal.DateTime, modTrans);
    UpdateData(FDefUnitID, dtTanggal.DateTime, modTransDetail);
//    UpdateData(FDefUnitID, dtTanggal.DateTime, modTransCard);
//    UpdateData(FDefUnitID, dtTanggal.DateTime, modTransVoucher);
//    UpdateData(FDefUnitID, dtTanggal.DateTime, modTransVoucherAssalam);
//    UpdateData(FDefUnitID, dtTanggal.DateTime, modTransKuponBotol);

    {
    aListAll := TStringList.Create;

    SS  := GetDataTransaksi(FDefUnitID,FLDateImp);
    aListALL.AddStrings(SS);
    SS.Free;

    SS  := GetDataTransaksiDetail(FDefUnitID,FLDateImp);
    aListAll.AddStrings(SS);
    SS.Free;

    SS  := GetDataTransaksiCard(FDefUnitID,FLDateImp);
    aListAll.AddStrings(SS);
    SS.Free;

    SS  := GetDataTransaksiVoucher(FDefUnitID,FLDateImp);
    aListAll.AddStrings(SS);
    SS.Free;

    SS  := GetDataTransaksiVoucherAssalam(FDefUnitID,FLDateImp);
    aListAll.AddStrings(SS);
    SS.Free;

    SS  := GetDataTransaksiKuponBotol(FDefUnitID,FLDateImp);
    aListAll.AddStrings(SS);
    SS.Free;

    SS  := GetDatasetuppos(FDefUnitID,FLDateImp);
    aListAll.AddStrings(SS);
    SS.Free;

    try
      aListAll.SaveToFile(FormatDateTime('DDMMYYYYhhmmss', cGetServerTime) + '.txt');
      Cnn.kExecuteSQLs(aListAll);
      Cnn.cCommitTrans;
      sSql  := 'insert into uLINK_PRD (uPRD_DATE, uPRD_UNIT, uPRD_POSCODE) values('
            + Quot(FormatDateTime('MM-DD-YYYY hh:mm:ss', cGetServerTime))
            + ', ' + IntToStr(FDefUnitID)
            + ', ' + Quot(frmMain.FPOSCode)
            + ');';
      cExecSQLDoNotUseIt(ssQL);
      CommonDlg.ShowMessage('Sukses Export file');
      cCommitTrans; 
    except
      CommonDlg.ShowError('Gagal Export file');
      exit;
    end;

    }
  end;
end;

procedure TfrmExportOfflinePOS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

function TfrmExportOfflinePOS.GetmodTrans: TModTransaksi;
begin
  if FmodTrans = nil then
    FmodTrans := TModTransaksi.Create;

  Result := FmodTrans;
end;

function TfrmExportOfflinePOS.GetModTransDetail: TModTransaksi_Detil;
begin
  if FModTransDetail = nil then
    FModTransDetail := TModTransaksi_Detil.Create;

  Result := FModTransDetail;
end;

function TfrmExportOfflinePOS.UpdateData(aUnitID: Integer; aTgl: TDateTime;
    aModel: TModApp): Boolean;
var
  i: Integer;
  lCDS: TClientDataSet;
  ss: TStrings;
  sSQL: string;
begin
  Result := False;
  sSQL := 'select * from ' + aModel.GetTableName;
  lCDS := cOpenDataset(sSQL);
  ss := DMClient.CrudClient.UpdateToDB(lCDS, aModel.ClassName);
  try
    for i:=0 to ss.Count-1 do
    begin
      cExecSQL(ss.Strings[i])
    end;
    cCommitTrans();
  finally
    ss.Free;
    lCDS.Free;
  end;
end;

end.
