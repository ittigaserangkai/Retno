unit ufrmImportFromStore;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxButtonEdit, Vcl.ComCtrls, uModBeginningBalance, uModApp, uModBarang,
  uModSatuan, uModUnit, uModAuthApp, uModSetupPOS, uModAuthUser, uModShift,
  uModMember, uModRefPajak, uModCreditCard, uModTransKuponBotol, uModVoucher;

type
  TfrmImportFromStore = class(TForm)
    btnLoad: TButton;
    btSimpan: TButton;
    dtTanggal: TDateTimePicker;
    edtFileName: TcxButtonEdit;
    Label1: TLabel;
    Label2: TLabel;
    lblHeader: TLabel;
    mmoImport: TMemo;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    pnlBody: TPanel;
    pnlHeader: TPanel;
    procedure btnLoadClick(Sender: TObject);
    procedure btSimpanClick(Sender: TObject);
    procedure edtFileNamePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
//    Cnn : TConnection;
    FDefUnitID: string;
    FModAutApp: TModAutApp;
    FModAutUser: TModAuthUser;
    FModBarang: TModBarang;
    FModBB: TModBeginningBalance;
    FModBeginningBalance: TModBeginningBalance;
    FModBHJ: TModBarangHargaJual;
    FModCreditCard: TModCreditCard;
    FModDiscMember: TModRefDiscMember;
    FModGrupMember: TModRefGrupMember;
    FModKonversi: TModKonversi;
    FModKuponBotolDetil: TModTransKuponBotolDetil;
    FModKuponBotol: TModTransKuponBotol;
    FModMember: TModMember;
    FModMemberActivasi: TModMemberActivasi;
    FModMemberKeluarga: TModMemberKeluarga;
    FModPajak: TModRefPajak;
    FModTipeMember: TModRefTipeMember;
    FModSatuan: TModSatuan;
    FModSetupPOS: TModSetupPOS;
    FModShift: TModShift;
    FModTipeBrg: TModTipeBarang;
    FModTipeHrg: TModTipeHarga;
    FModUnit: TModUnit;
    FModVoucher: TModVoucher;
    FModVoucherDetil: TModVoucherDetil;
    FUnitID: string;
    function GetModAutApp: TModAutApp;
    function GetModAutUser: TModAuthUser;
    function GetModBarang: TModBarang;
    function GetModBB: TModBeginningBalance;
    function GetModBeginningBalance: TModBeginningBalance;
    function GetModBHJ: TModBarangHargaJual;
    function GetModCreditCard: TModCreditCard;
    function GetModDiscMember: TModRefDiscMember;
    function GetModGrupMember: TModRefGrupMember;
    function GetModKonversi: TModKonversi;
    function GetModKuponBotolDetil: TModTransKuponBotolDetil;
    function GetModKuponBotol: TModTransKuponBotol;
    function GetModMember: TModMember;
    function GetModMemberActivasi: TModMemberActivasi;
    function GetModMemberKeluarga: TModMemberKeluarga;
    function GetModPajak: TModRefPajak;
    function GetModTipeMember: TModRefTipeMember;
    function GetModSatuan: TModSatuan;
    function GetModSetupPOS: TModSetupPOS;
    function GetModShift: TModShift;
    function GetModTipeBrg: TModTipeBarang;
    function GetModTipeHrg: TModTipeHarga;
    function GetModUnit: TModUnit;
    function GetModVoucher: TModVoucher;
    function GetModVoucherDetil: TModVoucherDetil;
    function LoadData(aObject: TModApp; aFilterSelect: string = ''; aFilterUpdate:
        string = ''): Boolean;
    function LoadDataStore: Boolean;
    property ModAutApp: TModAutApp read GetModAutApp write FModAutApp;
    property ModAutUser: TModAuthUser read GetModAutUser write FModAutUser;
    property ModBarang: TModBarang read GetModBarang write FModBarang;
    property ModBB: TModBeginningBalance read GetModBB write FModBB;
    property ModBeginningBalance: TModBeginningBalance read GetModBeginningBalance
        write FModBeginningBalance;
    property ModBHJ: TModBarangHargaJual read GetModBHJ write FModBHJ;
    property ModCreditCard: TModCreditCard read GetModCreditCard write
        FModCreditCard;
    property ModDiscMember: TModRefDiscMember read GetModDiscMember write
        FModDiscMember;
    property ModGrupMember: TModRefGrupMember read GetModGrupMember write
        FModGrupMember;
    property ModKonversi: TModKonversi read GetModKonversi write FModKonversi;
    property ModKuponBotolDetil: TModTransKuponBotolDetil read
        GetModKuponBotolDetil write FModKuponBotolDetil;
    property ModKuponBotol: TModTransKuponBotol read GetModKuponBotol write
        FModKuponBotol;
    property ModMember: TModMember read GetModMember write FModMember;
    property ModMemberActivasi: TModMemberActivasi read GetModMemberActivasi write
        FModMemberActivasi;
    property ModMemberKeluarga: TModMemberKeluarga read GetModMemberKeluarga write
        FModMemberKeluarga;
    property ModPajak: TModRefPajak read GetModPajak write FModPajak;
    property ModTipeMember: TModRefTipeMember read GetModTipeMember write
        FModTipeMember;
    property ModSatuan: TModSatuan read GetModSatuan write FModSatuan;
    property ModSetupPOS: TModSetupPOS read GetModSetupPOS write FModSetupPOS;
    property ModShift: TModShift read GetModShift write FModShift;
    property ModTipeBrg: TModTipeBarang read GetModTipeBrg write FModTipeBrg;
    property ModTipeHrg: TModTipeHarga read GetModTipeHrg write FModTipeHrg;
    property ModUnit: TModUnit read GetModUnit write FModUnit;
    property ModVoucher: TModVoucher read GetModVoucher write FModVoucher;
    property ModVoucherDetil: TModVoucherDetil read GetModVoucherDetil write
        FModVoucherDetil;
  public
    function OlahStringField(aArrayOfField : String; aTableName : String): string;
    function OlahStringSQL(aStringSQL : String): string;
    function SimpanDataStore: Boolean;
    property UnitID: string read FUnitID write FUnitID;
  end;

var
  frmImportFromStore: TfrmImportFromStore;

implementation

uses uTSCommonDlg, uAppUtils, udmMain, Datasnap.DBClient, uDMClient, uDBUtils;

{$R *.dfm}

procedure TfrmImportFromStore.btnLoadClick(Sender: TObject);
begin
//  mmoImport.Lines.LoadFromFile(edtFileName.Text);
  LoadDataStore;
end;

procedure TfrmImportFromStore.btSimpanClick(Sender: TObject);
begin
  {
  try
    if SimPanDataStore then
    begin
      cCommitTrans;
      CommonDlg.ShowMessage('Simpan Data Store');
      FormShow(nil);
    end
    else
    begin
      cRollbackTrans;
      CommonDlg.ShowError('Gagal Data Store');
    end;
  finally
    cRollbackTrans;
  end;
  }
end;

procedure TfrmImportFromStore.edtFileNamePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  if OpenDialog1.Execute then
  begin
    edtFileName.Text := OpenDialog1.FileName;
  end;
end;

procedure TfrmImportFromStore.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmImportFromStore.FormShow(Sender: TObject);
begin
//  ClearByTag(Self, [0]);
  dtTanggal.DateTime := Now;
  FDefUnitID := dmMain.getGlobalVar('UNITID');
end;

function TfrmImportFromStore.GetModAutApp: TModAutApp;
begin
  if FModAutApp = nil then
    FModAutApp := TModAutApp.Create;

  Result := FModAutApp;
end;

function TfrmImportFromStore.GetModAutUser: TModAuthUser;
begin
  if FModAutUser = nil then
    FModAutUser := TModAuthUser.Create;

  Result := FModAutUser;
end;

function TfrmImportFromStore.GetModBarang: TModBarang;
begin
  if FModBarang = nil then
    FModBarang := TModBarang.Create;

  Result := FModBarang;
end;

function TfrmImportFromStore.GetModBB: TModBeginningBalance;
begin
  if FModBB = nil then
    FModBB := TModBeginningBalance.Create;

  Result := FModBB;
end;

function TfrmImportFromStore.GetModBeginningBalance: TModBeginningBalance;
begin
  if FModBeginningBalance = nil then
    FModBeginningBalance := TModBeginningBalance.Create;

  Result := FModBeginningBalance;
end;

function TfrmImportFromStore.GetModBHJ: TModBarangHargaJual;
begin
  if FModBHJ = nil then
    FModBHJ := TModBarangHargaJual.Create;

  Result := FModBHJ;
end;

function TfrmImportFromStore.GetModCreditCard: TModCreditCard;
begin
  if FModCreditCard = nil then
    FModCreditCard := TModCreditCard.Create;

  Result := FModCreditCard;
end;

function TfrmImportFromStore.GetModDiscMember: TModRefDiscMember;
begin
  if FModDiscMember = nil then
    FModDiscMember := TModRefDiscMember.Create;

  Result := FModDiscMember;
end;

function TfrmImportFromStore.GetModGrupMember: TModRefGrupMember;
begin
  if FModGrupMember = nil then
    FModGrupMember := TModRefGrupMember.Create;

  Result := FModGrupMember;
end;

function TfrmImportFromStore.GetModKonversi: TModKonversi;
begin
  if FModKonversi = nil then
    FModKonversi := TModKonversi.Create;

  Result := FModKonversi;
end;

function TfrmImportFromStore.GetModKuponBotolDetil: TModTransKuponBotolDetil;
begin
  if FModKuponBotolDetil = nil then
    FModKuponBotolDetil := TModTransKuponBotolDetil.Create;

  Result := FModKuponBotolDetil;
end;

function TfrmImportFromStore.GetModKuponBotol: TModTransKuponBotol;
begin
  if FModKuponBotol = nil then
    FModKuponBotol := TModTransKuponBotol.Create;

  Result := FModKuponBotol;
end;

function TfrmImportFromStore.GetModMember: TModMember;
begin
  if FModMember = nil then
    FModMember := TModMember.Create;

  Result := FModMember;
end;

function TfrmImportFromStore.GetModMemberActivasi: TModMemberActivasi;
begin
  if FModMemberActivasi = nil then
    FModMemberActivasi := TModMemberActivasi.Create;

  Result := FModMemberActivasi;
end;

function TfrmImportFromStore.GetModMemberKeluarga: TModMemberKeluarga;
begin
  if FModMemberKeluarga = nil then
    FModMemberKeluarga := TModMemberKeluarga.Create;

  Result := FModMemberKeluarga;
end;

function TfrmImportFromStore.GetModPajak: TModRefPajak;
begin
  if FModPajak = nil then
    FModPajak := TModRefPajak.Create;

  Result := FModPajak;
end;

function TfrmImportFromStore.GetModTipeMember: TModRefTipeMember;
begin
  if FModTipeMember = nil then
    FModTipeMember := TModRefTipeMember.Create;

  Result := FModTipeMember;
end;

function TfrmImportFromStore.GetModSatuan: TModSatuan;
begin
  if FModSatuan = nil then
    FModSatuan := TModSatuan.Create;

  Result := FModSatuan;
end;

function TfrmImportFromStore.GetModSetupPOS: TModSetupPOS;
begin
  if FModSetupPOS = nil then
    FModSetupPOS := TModSetupPOS.Create;

  Result := FModSetupPOS;
end;

function TfrmImportFromStore.GetModShift: TModShift;
begin
  if FModShift = nil then
    FModShift := TModShift.Create;

  Result := FModShift;
end;

function TfrmImportFromStore.GetModTipeBrg: TModTipeBarang;
begin
  if FModTipeBrg = nil then
    FModTipeBrg := TModTipeBarang.Create;

  Result := FModTipeBrg;
end;

function TfrmImportFromStore.GetModTipeHrg: TModTipeHarga;
begin
  if FModTipeHrg = nil then
    FModTipeHrg := TModTipeHarga.Create;

  Result := FModTipeHrg;
end;

function TfrmImportFromStore.GetModUnit: TModUnit;
begin
  if FModUnit = nil then
    FModUnit := TModUnit.Create;

  Result := FModUnit;
end;

function TfrmImportFromStore.GetModVoucher: TModVoucher;
begin
  if FModVoucher = nil then
    FModVoucher := TModVoucher.Create;

  Result := FModVoucher;
end;

function TfrmImportFromStore.GetModVoucherDetil: TModVoucherDetil;
begin
  if FModVoucherDetil = nil then
    FModVoucherDetil := TModVoucherDetil.Create;

  Result := FModVoucherDetil;
end;

function TfrmImportFromStore.LoadData(aObject: TModApp; aFilterSelect: string =
    ''; aFilterUpdate: string = ''): Boolean;
var
  lCDS: TClientDataSet;
  sSQL: string;
begin
  Result := True;

  lCDS := TDBUtils.DSToCDS(DMClient.CrudUpdatePOSClient.RetreiveSyncronData(aObject.ClassName,aFilterSelect),Self);
  lCDS.First;
  while not lCDS.Eof do
  begin
    TDBUtils.LoadFromDataset(aObject, lCDS, False);
    Result := Result and cSaveToDB(aObject, aFilterUpdate);

    if not Result then
      Break;

    lCDS.Next;
  end;

  if Result then
  begin
    mmoImport.Lines.Add('sukses import ' + aObject.GetTableName);
    cCommitTrans();
  end else
  begin
    mmoImport.Lines.Add('gagal import ' + aObject.GetTableName);
    cRollbackTrans();
  end;
end;

function TfrmImportFromStore.LoadDataStore: Boolean;
begin
  Result := False;
  mmoImport.Lines.Clear;

  //barang
  LoadData(ModTipeHrg);
  LoadData(ModTipeBrg);
  LoadData(ModSatuan);
  LoadData(ModKonversi);
//  LoadData(ModBHJ);
//  LoadData(ModBarang, ' where brg_name like ''AQ%'' ');

  //member
  LoadData(ModTipeMember);
  LoadData(ModDiscMember);
//      LoadData(ModGrupMember);
//      LoadData(ModMemberKeluarga);
//      LoadData(ModMemberActivasi);
  LoadData(ModMember);

  //unit
  LoadData(ModAutApp);
  LoadData(ModUnit);
  LoadData(ModPajak);
  LoadData(ModCreditCard);

  //SetupPOS
  LoadData(ModSetupPOS);

  //BeginningBalance
  LoadData(ModAutUser);
  LoadData(ModShift);
  LoadData(ModBeginningBalance);

  //Kupon
  LoadData(ModKuponBotol);
  LoadData(ModKuponBotolDetil);

  //Voucher
  LoadData(ModVoucher);
  Loaddata(ModVoucherDetil, 'VCRD_STATUS = ''OPEN'' ','VCRD_STATUS = ''OPEN'' ');

  mmoImport.Lines.Add('selesai import ');
end;

function TfrmImportFromStore.OlahStringField(aArrayOfField : String; aTableName
    : String): string;
var
  sStringField: string;
begin
  sStringField := StringReplace(aArrayOfField,'<FIELD>','', [rfReplaceAll,rfIgnoreCase]); // menghilangkan <FIELD>
  sStringField := StringReplace(sStringField,'</FIELD>','', [rfReplaceAll,rfIgnoreCase]); // menghilangkan </FIELD>
  sStringField := StringReplace(sStringField, '~',',', [rfReplaceAll,rfIgnoreCase]) ; // menghilangkan ~
  sStringField := Copy(sStringField, 1, Length(sStringField) - 1); // menhilangkan koma terkahir
  Result := 'insert into ' + aTableName + ' (' + sStringField + ')';
end;

function TfrmImportFromStore.OlahStringSQL(aStringSQL : String): string;
var
  sStringSQL: string;
begin
  //Result := '';
  sStringSQL  := StringReplace(aStringSQL,'<SQL>','', [rfReplaceAll, rfIgnoreCase]);
  sStringSQL  := StringReplace(sStringSQL,'</SQL>','', [rfReplaceAll, rfIgnoreCase]);
  sStringSQL  := StringReplace(sStringSQL,'~',''',''', [rfReplaceAll, rfIgnoreCase]);
  sStringSQL  := StringReplace(sStringSQL,''''',''','null,''', [rfReplaceAll, rfIgnoreCase]);
  sStringSQL  := Copy(sStringSQL, 1, Length(sStringSQL) - 2);
  sStringSQL  := '''' +  sStringSQL;// + '''';
  Result      := sStringSQL;
end;

function TfrmImportFromStore.SimpanDataStore: Boolean;
var
  sNamaTable: string;
  sSQL: string;
  SS: TStrings;
  sInsertInto: string;
  i: Integer;
begin
  Result := False;

  SS := TStringList.Create;
  try
    for i := 0 to mmoImport.Lines.Count - 1 do
    begin

      if (Pos('<TABLE>', mmoImport.Lines[i]) > 0)
                    and (Pos('</TABLE>', mmoImport.Lines[i]) > 0) then // table
      begin
        sNamaTable := StringReplace(mmoImport.Lines[i],'<TABLE>','', [rfReplaceAll,rfIgnoreCase]);
        sNamaTable := StringReplace(sNamaTable,'</TABLE>','', [rfReplaceAll,rfIgnoreCase]);

        sInsertInto := '';
        sSQL        := '';
      end
      else if (Pos('<FIELD>', mmoImport.Lines[i]) > 0)
                and (Pos('</FIELD>', mmoImport.Lines[i]) > 0) then // nama field
      begin
        sInsertInto := OlahStringField(mmoImport.Lines[i], sNamaTable);
      end
      else if (Pos('<SQL>', mmoImport.Lines[i]) > 0) and (Pos('</SQL>', mmoImport.Lines[i]) > 0) then // SQL
      begin
        sSQL := sInsertInto + 'values(' +  OlahStringSQL(mmoImport.Lines[i]) + ');';
        SS.Add(sSQL);
      end;
    end;

    SS.SaveToFile(TAppUtils.GetAppPath + 'InsertDataStore.txt');

    {
    if kExecuteSQLs(123, SS) then
      Result := True;
     }
  finally
    SS.Free;
  end;

end;


end.
