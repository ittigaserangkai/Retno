unit ufrmExportToMDB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ComCtrls, ExtCtrls, uTSCommonDlg, uRetnoUnit,
  uTSINIFile, uConstanta, Types, OleCtrls, DateUtils;

type
  TfrmExportToMDB = class(TfrmMaster)
    Panel1: TPanel;
    Label1: TLabel;
    btnExport: TButton;
    dtTanggal: TDateTimePicker;
    mmoExport: TMemo;
    dtLastExport: TDateTimePicker;
    Label2: TLabel;
    procedure btnExportClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    FCompID: Integer;
    FPosCode: string;
    FMDBPath, FMDBPass: String;
    FUnitID: Integer;
    FUserID: Integer;
    function cZipFile(AFileName, APassword: string): Boolean;
    function GetExportFileName: string;
    function IsExportSuccess: Boolean;
    function IsParameterValid: Boolean;
    procedure LoadConfig;
    procedure SetMDBPass(const Value: string);
    procedure SetMDBPath(const Value: string);
  public
    property CompID: Integer read FCompID write FCompID;
    property PosCode: string read FPosCode write FPosCode;
    property UnitID: Integer read FUnitID write FUnitID;
    property UserID: Integer read FUserID write FUserID;
  published
    property MDBPass: string read FMDBPass write SetMDBPass;
    property MDBPath: string read FMDBPath write SetMDBPath;
  end;

var
  frmExportToMDB: TfrmExportToMDB;

implementation

uses uAppUtils;

{$R *.dfm}

procedure TfrmExportToMDB.btnExportClick(Sender: TObject);
begin
  inherited;
  if IsParameterValid then
  begin
    mmoExport.Clear;
    if IsExportSuccess then
      CommonDlg.ShowMessage('Export Data Sukses')
    else
      CommonDlg.ShowError('Export Data Gagal');
  end;
end;

function TfrmExportToMDB.cZipFile(AFileName, APassword: string): Boolean;
//var
//  AbZipp: TZipMaster;
//  NamaZip: string;
begin
//  Result := False;
//  AbZipp.Create(Self);
  try
//    AbZipp  := TZipMaster.create(Self);
//    NamaZip := ChangeFileExt(AFileName,'.zip');
//
//    AbZipp.FSpecArgs.Add(AFileName);
//    AbZipp.Verbose := False;
//    AbZipp.Trace := False;
//    AbZipp.ZipFileName := ExtractFileName(NamaZip);
//    AbZipp.Add;
//
//    if AbZipp.SuccessCnt >0 then
      Result := True;

  finally
//    AbZipp.Free;
  end;
end;

procedure TfrmExportToMDB.FormKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmExportToMDB.FormShow(Sender: TObject);
var
//  lQ: TIBQuery;
  sSQL: string;
begin
  inherited;
//  ClearByTag(Self, [0]);
//  dtTanggal.DateTime    := cGetServerTime;
  dtLastExport.DateTime := 0;
  LoadConfig;

  sSQL := 'select LOG_DATEBYUSER from TLOGEXIMMDB '
        + ' where LOG_ISEXPORT = 1 order by LOG_DATE desc rows 1';
  {
  lQ := cOpenQuery(sSQL);
  try
    if not lQ.Eof then
    begin
      dtLastExport.DateTime := lQ.Fields[0].AsDateTime;
    end;
  finally
    lQ.Free;
  end;
  }
end;

function TfrmExportToMDB.GetExportFileName: string;
//var
//  lUnit: TUnit;
begin
  //Get Kode Cabang
 { lUnit := TUnit.Create(Self);
  try
    if lUnit.LoadByID(UnitID) then
      Result := lUnit.Kode;
  finally
    lUnit.Free;
  end;
  }
  //Get kode POS
  Result := Result + PosCode;

  //Get Date
  Result := Result + FormatDateTime('YYYYMMDD', dtTanggal.DateTime);

//  Result := Result + '.MDB';
end;

function TfrmExportToMDB.IsExportSuccess: Boolean;
var
  aListAll: TStrings;
  FSaveDlg: TSaveDialog;
  sErrorCreateDB: string;
  SS: TStrings;
  sSQL: String;
begin
  Result := False;
  aListAll := TStringList.Create;
  try

    FSaveDlg := TSaveDialog.Create(Self);
    FSaveDlg.FileName := GetExportFileName;

    if not FSaveDlg.Execute then
      Exit;

    if FileExists(FSaveDlg.FileName) then
    begin
      ShowMessage('File dengan nama tersebut sudah ada');
      Exit;
    end;

    FMDBPath := FSaveDlg.FileName;
//    sErrorCreateDB := cAdoCreateDB(FMDBPath, FMDBPass);
    if sErrorCreateDB <> '' then
      ShowMessage(sErrorCreateDB);

      {
    if cAdoConnect(FMDBPath, FMDBPass) then
    begin
      mmoExport.Lines.Add('0. Create Table for Export ...');
      aListALL.Add(SQL_CREATE_TABLE_TRANSAKSI);
      aListALL.Add(SQL_CREATE_TABLE_TRANSAKSI_PENDING);
      aListALL.Add(SQL_CREATE_TABLE_TRANSAKSI_DETIL);
      aListALL.Add(SQL_CREATE_TABLE_TRANSAKSI_CARD);
      aListALL.Add(SQL_CREATE_TABLE_VOUCHER_LAIN_LAIN);
      aListALL.Add(SQL_CREATE_TABLE_SETUPPOS);
      aListALL.Add(SQL_CREATE_TABLE_BEGINNING_BALANCE);
      aListALL.Add(SQL_CREATE_TABLE_SHIFT);
      aListALL.Add(SQL_CREATE_TABLE_FINAL_PAYMENT);
      aListALL.Add(SQL_CREATE_TABLE_TRANSAKSI_RETUR_NOTA);
      aListALL.Add(SQL_CREATE_TABLE_CASH_DROPPING);

      if not cAdoExecSQLs(aListAll, FMDBPath, FMDBPass) then
      begin
        DeleteFile(FMDBPath);
        mmoExport.Lines.Add(' Gagal Create DB ...');
        Exit;
      end;

      aListAll.Clear;
      mmoExport.Lines.Add('1. Preparing Data Transaksi ...');
      SS := GetDataTransaksi(UnitID, dtTanggal.DateTime);
      aListALL.AddStrings(SS);
      SS.Free;

      mmoExport.Lines.Add('2. Preparing Data TransaksiPending ...');
      SS := GetDataTransaksiPending(UnitID, dtTanggal.DateTime);
      aListALL.AddStrings(SS);
      SS.Free;

      mmoExport.Lines.Add('3. Preparing Data TransaksiDetil ...');
      SS := GetDataTransaksiDetail(UnitID, dtTanggal.DateTime);
      aListAll.AddStrings(SS);
      SS.Free;

      mmoExport.Lines.Add('4. Preparing Data TransaksiCard ...');
      SS := GetDataTransaksiCard(UnitID, dtTanggal.DateTime);
      aListAll.AddStrings(SS);
      SS.Free;

      mmoExport.Lines.Add('5. Preparing Data TransaksiVoucher ...');
      SS := GetDataTransaksiVoucher(UnitID, dtTanggal.DateTime);
      aListAll.AddStrings(SS);
      SS.Free;

      mmoExport.Lines.Add('6. Preparing Data TransaksiRetur ...');
      SS := GetDataTransaksiRetur(UnitID, dtTanggal.DateTime);
      aListAll.AddStrings(SS);
      SS.Free;

      mmoExport.Lines.Add('7. Preparing Data SetupPOS ...');
      SS := GetDataSetupPOS(UnitID, dtTanggal.DateTime);
      aListAll.AddStrings(SS);
      SS.Free;

      mmoExport.Lines.Add('8. Preparing Data BeginningBalance ...');
      SS := GetDataBeginningBalance(UnitID, dtTanggal.DateTime);
      aListAll.AddStrings(SS);
      SS.Free;

      mmoExport.Lines.Add('9. Preparing Data Shift ...');
      SS := GetDataShift(UnitID, dtTanggal.DateTime);
      aListAll.AddStrings(SS);
      SS.Free;

      mmoExport.Lines.Add('10. Preparing Data Final Payment ...');
      SS := GetDataFinalPayment(UnitID, dtTanggal.DateTime);
      aListAll.AddStrings(SS);
      SS.Free;

//      Disable by request user (TSN)
//      mmoExport.Lines.Add('11. Preparing Data Cash Dropping ...');
//      SS := GetDataCashDropping(UnitID, dtTanggal.DateTime);
//      aListAll.AddStrings(SS);
//      SS.Free;


//      SS := GetDataTransaksiVoucherAssalam(UnitID, dtTanggal.DateTime);
//      aListAll.AddStrings(SS);
//      SS.Free;


      mmoExport.Lines.Add('11. Exporting Data ...');
      aListAll.SaveToFile(cGetAppPath + FormatDateTime('YYYYMMDDhhmmss', cGetServerTime) + '.txt');

      if cAdoExecSQLs(aListAll, FMDBPath, FMDBPass) then
      begin
//        if cZipFile(FMDBPath, FMDBPass) then
//        begin
          mmoExport.Lines.Add('12.Insert LOG ...');
          sSQL  := 'insert into TLOGEXIMMDB ( '
                + ' LOG_DATE, LOG_DATEBYUSER, LOG_UNIT, LOG_POSCODE, LOG_ISEXPORT '
                + ' ) values( '
                + Quot(FormatDateTime('MM-DD-YYYY hh:mm:ss', cGetServerTime))
                + ', ' + QuotDT(dtTanggal.DateTime)
                + ', ' + IntToStr(UnitID)
                + ', ' + Quot(POSCode)
                + ', 1 );';
          cExecSQL(sSQL);
          cCommitTrans;
          mmoExport.Lines.Add(' Sukses Export Data ...');
          dtLastExport.DateTime := dtTanggal.DateTime;
          Result := True;
//        end
//        else
//        begin
//          mmoExport.Lines.Add(' Gagal Compress Data ...');
//        end;
      end
      else
      begin
        DeleteFile(FMDBPath);
        mmoExport.Lines.Add(' Gagal Export Data ...');
      end;
    end;
    }
  finally
//    cRollbackTrans;
    aListAll.Free;
  end;
end;

function TfrmExportToMDB.IsParameterValid: Boolean;
begin
  Result := False;
  if CompID <= 0 then
    CommonDlg.ShowMessage('Company belum dipilih')
  else
  if UnitID <= 0 then
    CommonDlg.ShowMessage('Unit belum dipilih')
  else
  if UserID <= 0 then
    CommonDlg.ShowMessage('User tidak valid')
  else
    Result := True;
end;

procedure TfrmExportToMDB.LoadConfig;
begin
  FMDBPath := _INIReadString(CONFIG_FILE, DB_POS, 'MDBPath');
  FPOSCode := _INIReadString(CONFIG_FILE, DB_POS, 'POSCode');
  FMDBPass := TAppUtils._Decrypt(TAppUtils._MakeOriginal(_INIReadString(CONFIG_FILE,DB_POS,'MDBPass')),START_KEY,MULTI_KEY,ADD_KEY);
end;

procedure TfrmExportToMDB.SetMDBPass(const Value: string);
begin
  FMDBPass := Value;
end;

procedure TfrmExportToMDB.SetMDBPath(const Value: string);
begin
  FMDBPath := Value;
end;

end.
