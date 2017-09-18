unit ufrmExportOfflinePOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls , IdBaseComponent, IdMailBox,
  Datasnap.DBClient, uModApp, uModTransaksi, uModVoucher, uModVoucherLainLain,
  uModTransKuponBotol;

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
    FDefUnitID: string;
//    FLDateImp : TDateTime;
    FModTrans: TModTransaksi;
    FModTransCard: TModTransaksiCard;
    FModTransDetail: TModTransaksiDetil;
    FModTransKuponBotol: TModTransKuponBotol;
    FModTransKuponBotolDetil: TModTransKuponBotolDetil;
    FModVoucher: TModVoucher;
    FModVoucherDetil: TModVoucherDetil;
    FModVoucherLain: TModVoucherLainLain;
    FUnitID: string;
    function GetModTrans: TModTransaksi;
    function GetModTransCard: TModTransaksiCard;
    function GetModTransDetail: TModTransaksiDetil;
    function GetModTransKuponBotol: TModTransKuponBotol;
    function GetModTransKuponBotolDetil: TModTransKuponBotolDetil;
    function GetModVoucher: TModVoucher;
    function GetModVoucherDetil: TModVoucherDetil;
    function GetModVoucherLain: TModVoucherLainLain;
    function UpdateData(aTgl: TDateTime; aModel: TModApp; aWhere: string = ''):
        Boolean;
    property ModTrans: TModTransaksi read GetModTrans write FModTrans;
    property ModTransCard: TModTransaksiCard read GetModTransCard write
        FModTransCard;
    property ModTransDetail: TModTransaksiDetil read GetModTransDetail write
        FModTransDetail;
    property ModTransKuponBotol: TModTransKuponBotol read GetModTransKuponBotol
        write FModTransKuponBotol;
    property ModTransKuponBotolDetil: TModTransKuponBotolDetil read
        GetModTransKuponBotolDetil write FModTransKuponBotolDetil;
    property ModVoucher: TModVoucher read GetModVoucher write FModVoucher;
    property ModVoucherDetil: TModVoucherDetil read GetModVoucherDetil write
        FModVoucherDetil;
    property ModVoucherLain: TModVoucherLainLain read GetModVoucherLain write
        FModVoucherLain;
  public
    property UnitID: string read FUnitID write FUnitID;
  published
  end;

var
  frmExportOfflinePOS: TfrmExportOfflinePOS;

implementation

uses
  uTSCommonDlg, udmMain, uAppUtils, uDMClient, uDBUtils, strUtils;

{$R *.dfm}

procedure TfrmExportOfflinePOS.FormShow(Sender: TObject);
var
  ssql:string;
begin
  dtTanggal.DateTime := Now;
  FDefUnitID := dmMain.getGlobalVar('UNITID');
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
//  if UnitID <= 0 then
  if UnitID = '' then
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
    mmoExport.Clear;
    UpdateData(dtTanggal.DateTime, ModTrans);
    UpdateData(dtTanggal.DateTime, ModTransDetail);
    UpdateData(dtTanggal.DateTime, ModTransCard);
//    UpdateData(dtTanggal.DateTime, ModVoucher);
    UpdateData(dtTanggal.DateTime, ModVoucherDetil, 'VCRD_STATUS = ''CLOSE'' ');
    UpdateData(dtTanggal.DateTime, ModVoucherLain);
    UpdateData(dtTanggal.DateTime, ModTransKuponBotol, 'TKB_STATUS = ''CLOSE'' ');
    UpdateData(dtTanggal.DateTime, ModTransKuponBotolDetil);
    mmoExport.Lines.Add('selesai eksport ');

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

function TfrmExportOfflinePOS.GetModTrans: TModTransaksi;
begin
  if FModTrans = nil then
    FModTrans := TModTransaksi.Create;

  Result := FModTrans;
end;

function TfrmExportOfflinePOS.GetModTransCard: TModTransaksiCard;
begin
  if FModTransCard = nil then
    FModTransCard := TModTransaksiCard.Create;

  Result := FModTransCard;
end;

function TfrmExportOfflinePOS.GetModTransDetail: TModTransaksiDetil;
begin
  if FModTransDetail = nil then
    FModTransDetail := TModTransaksiDetil.Create;

  Result := FModTransDetail;
end;

function TfrmExportOfflinePOS.GetModTransKuponBotol: TModTransKuponBotol;
begin
  if FModTransKuponBotol = nil then
    FModTransKuponBotol := TModTransKuponBotol.Create;

  Result := FModTransKuponBotol;
end;

function TfrmExportOfflinePOS.GetModTransKuponBotolDetil:
    TModTransKuponBotolDetil;
begin
  if FModTransKuponBotolDetil = nil then
    FModTransKuponBotolDetil := TModTransKuponBotolDetil.Create;

  Result := FModTransKuponBotolDetil;
end;

function TfrmExportOfflinePOS.GetModVoucher: TModVoucher;
begin
  if FModVoucher = nil then
    FModVoucher := TModVoucher.Create;

  Result := FModVoucher;
end;

function TfrmExportOfflinePOS.GetModVoucherDetil: TModVoucherDetil;
begin
  if FModVoucherDetil = nil then
    FModVoucherDetil := TModVoucherDetil.Create;

  Result := FModVoucherDetil;
end;

function TfrmExportOfflinePOS.GetModVoucherLain: TModVoucherLainLain;
begin
  if FModVoucherLain = nil then
    FModVoucherLain := TModVoucherLainLain.Create;

  Result := FModVoucherLain;
end;

function TfrmExportOfflinePOS.UpdateData(aTgl: TDateTime; aModel: TModApp;
    aWhere: string = ''): Boolean;
var
  i: Integer;
  lCDS: TClientDataSet;
//  lModUpdatePOS: TModUpdatePOS;
  sSQL: string;
//  sID: string;
begin
  Result := False;
  sSQL := 'select * from ' + aModel.GetTableName;
  if aWhere <> '' then
    sSQL := sSQL + ' where ' + aWhere;

  lCDS := cOpenDataset(sSQL);
  try
    Result := DMClient.CrudUpdatePOSClient.UpdateToDB(lCDS, aModel.ClassName);

    if Result then
    begin
      mmoExport.Lines.Add('sukses eksport ' + aModel.GetTableName);
    end else
    begin
      mmoExport.Lines.Add('gagal eksport ' + aModel.GetTableName);
    end;
//    for i:= 0 to lModUpdatePOS.ModUpdatePOSDetails.Count-1 do
//    begin
//      sID := cRemoveBracket(lModUpdatePOS.ModUpdatePOSDetails[i].PrimaryValue);// Copy(lModUpdatePOS.ModUpdatePOSDetails[i].PrimaryValue,2,lModUpdatePOS.ModUpdatePOSDetails[i].PrimaryValue.Length-2);
//
//      sSQL := 'update ' + lModUpdatePOS.TableName
//            + ' set ' + lModUpdatePOS.PrimaryField
//            + ' = ' + QuotedStr(sID)
//            + ' where ' + lModUpdatePOS.POSField
//            + ' = ' + IntToStr(lModUpdatePOS.ModUpdatePOSDetails[i].POSValue);
//      cExecSQL(sSQL);
//    end;
//    cCommitTrans();
  finally
//    lModUpdatePOS.Free;
    lCDS.Free;
  end;
end;

end.
