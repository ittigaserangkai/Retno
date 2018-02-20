unit ufrmDialogTransferBarang;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, cxMaskEdit, cxCalendar, cxTextEdit, Vcl.StdCtrls,uInterface,
  cxMemo, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  cxButtonEdit, cxCurrencyEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxClasses, cxGridCustomView, cxGrid, uDXUtils, uDMClient,
  uModTransferBarang, Datasnap.DBClient, uDBUtils, uAppUtils, uModGudang,
  uConstanta, uRetnoUnit;

type
  TfrmDialogTransferBarang = class(TfrmMasterDialog, ICRUDAble)
    pnlHeader: TPanel;
    lblNO: TLabel;
    edNO: TcxTextEdit;
    lblTanggal: TLabel;
    dtTanggal: TcxDateEdit;
    cxLookUpGudangAsal: TcxExtLookupComboBox;
    lblGudang: TLabel;
    cxLookUpGudangTujuan: TcxExtLookupComboBox;
    lblGudangTujuan: TLabel;
    lblKeteranan: TLabel;
    memDesc: TcxMemo;
    cxgrdTransfer: TcxGrid;
    cxGridTableGR: TcxGridTableView;
    cxGridColPLU: TcxGridColumn;
    cxGridColNama: TcxGridColumn;
    cxGridColPLU_ID: TcxGridColumn;
    cxGridColQty: TcxGridColumn;
    cxGridColUOM: TcxGridColumn;
    cxgrdlvlTransfer: TcxGridLevel;
    lblNoRef: TLabel;
    edReferensi: TcxTextEdit;
    cxGridColUOMid: TcxGridColumn;
    cxGridColIsDecimal: TcxGridColumn;
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxGridColPLUPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxGridColPLUPropertiesEditValueChanged(Sender: TObject);
    procedure cxGridColUOMPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    FCDSBarang: TClientDataset;
    FCDSItems: TClientDataSet;
    FModTransferBarang: TModTransferBarang;
    procedure DeleteData;
    function GetModTransferBarang: TModTransferBarang;
    procedure InitLookup;
    procedure LookupBarang;
    procedure LookupUOM(ABarangID: String);
    procedure SetBarangToGrid(APLU: String);
    procedure SimpanData;
    procedure UpdateData;
    function ValidateData: Boolean;
    property CDSBarang: TClientDataset read FCDSBarang write FCDSBarang;
    property CDSItems: TClientDataSet read FCDSItems write FCDSItems;
    property ModTransferBarang: TModTransferBarang read GetModTransferBarang write
        FModTransferBarang;
    { Private declarations }
  public
    procedure LoadData(AID : String);
    { Public declarations }
  end;

var
  frmDialogTransferBarang: TfrmDialogTransferBarang;

implementation

uses
  ufrmCXLookup, Data.DB, uModBarang, uModelHelper, uModSatuan;

{$R *.dfm}

procedure TfrmDialogTransferBarang.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if TAppUtils.Confirm('Anda Yakin Menghapus Data') then DeleteData;
end;

procedure TfrmDialogTransferBarang.actSaveExecute(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  UpdateData;
  SimpanData;
end;

procedure TfrmDialogTransferBarang.cxGridColPLUPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  LookupBarang;
end;

procedure TfrmDialogTransferBarang.cxGridColPLUPropertiesEditValueChanged(
  Sender: TObject);
var
  iCurrentRow: Integer;
  sPLU: string;
begin
  inherited;
  cxGridTableGR.DataController.Post();
  iCurrentRow := cxGridTableGR.DataController.FocusedRecordIndex;
  sPLU        := vartostr(cxGridTableGR.DataController.Values[iCurrentRow, cxGridColPLU.Index]);
  SetBarangToGrid(sPLU);

end;

procedure TfrmDialogTransferBarang.cxGridColUOMPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  iCurrentRow: Integer;
  LBarangID: string;
begin
  inherited;
  iCurrentRow := cxGridTableGR.DataController.FocusedRecordIndex;
  LBarangID := VarToStr(cxGridTableGR.DataController.Values[iCurrentRow, cxGridColPLU_ID.Index]);
  if LBarangID = '' then
    begin
      TAppUtils.Warning('PLU belum dipilih');
      exit;
    end;

  LookupUOM(LBarangID);
end;

procedure TfrmDialogTransferBarang.DeleteData;
begin
  if not Assigned(ModTransferBarang) then
    Raise Exception.Create('Data not Loaded');

  if ModTransferBarang.ID = '' then
  begin
    TAppUtils.Error('Tidak ada data yang dihapus');
    exit;
  end;

  Try
    DMClient.CrudClient.DeleteFromDB(ModTransferBarang);
    TAppUtils.Information(CONF_DELETE_SUCCESSFULLY);
    Self.ModalResult := mrOk;
  except
    TAppUtils.Error(ER_DELETE_FAILED);
    raise;
  End;
end;

procedure TfrmDialogTransferBarang.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
  //biar kl 'enter' langsung turun ke bawahnya
  //jangan lupa uDXUtils di-'uses'
  InitLookup;
  //untuk komponen yg di kanannya ada segitiga yg kl diklik muncul daftar pilihan
  LoadData('');
  //biasanya ini jarang dipanggil untuk form create, tapi ini digunakan untuk
  //generate tanggal hari ini yg ada di 'LoadData'
  //karena 'LoadData' harusnya dengan parameter, maka parameternya dikosongi.
end;

function TfrmDialogTransferBarang.GetModTransferBarang: TModTransferBarang;
begin
  if FModTransferBarang = nil then
    FModTransferBarang := TModTransferBarang.Create;
  Result := FModTransferBarang;
end;

procedure TfrmDialogTransferBarang.InitLookup;
begin
  cxLookUpGudangAsal.LoadFromDS(
    DMClient.DSProviderClient.Gudang_GetDSLookUp,
    {id field} 'GUDANG_ID', {display field} 'GUD_NAME',
    ['GUDANG_ID'] {hidden field},self
  );
  cxLookUpGudangAsal.SetMultiPurposeLookup;
  //biar bisa filter manual, ga dipake juga gpp sih, buat pengetahuan aja

  cxLookUpGudangTujuan.LoadFromDS(
    DMClient.DSProviderClient.Gudang_GetDSLookUp,
    {id field} 'GUDANG_ID', {display field} 'GUD_NAME',
    ['GUDANG_ID'] {hidden field},self
  );

end;

procedure TfrmDialogTransferBarang.LoadData(AID : String);
var
  i: Integer;
  iRec: Integer;
  lItem: TModTransferBarangItem;
begin
  if AID <> '' then
  //untuk identifikasi parameter AID kosong atau isi
  begin
    FModTransferbarang            := DMclient.CrudClient.Retrieve(TModTransferbarang.ClassName, AID) as TModTransferBarang;
    // dijalankan kl parameter AID terisi
  end else
  begin
    FModTransferBarang            := TModTransferBarang.Create;
    FModTransferBarang.TB_TANGGAL := Now();
    //Tanggal Otomatis
    FModTransferBarang.TB_NO      := DMClient.CRUDTransferBarangClient.GenerateNo(ModTransferBarang.ClassName);
    //dijalankan kl parameter AID kosong
  end;

  //header
  edNO.Text         := ModTransferBarang.TB_NO;
  dtTanggal.Date    := ModTransferBarang.TB_TANGGAL;

  if ModTransferBarang.TB_GUDANG_ASAL <> nil then
    cxLookUpGudangAsal.EditValue    := ModTransferBarang.TB_GUDANG_ASAL.ID;
  if ModTransferBarang.TB_GUDANG_ASAL <> nil then
    cxLookUpGudangTujuan.EditValue  := ModTransferBarang.TB_GUDANG_TUJUAN.ID;

  edReferensi.Text  := ModTransferBarang.TB_REFERENSI;
  memDesc.Text  := ModTransferBarang.TB_Keterangan;

  //detail lanjut sesuk
  cxGridTableGR.ClearRows;
  for i := 0 to ModTransferBarang.TB_TransferBarangItems.Count-1 do
  begin
    lItem := ModTransferBarang.TB_TransferBarangItems[i];
    iRec  := cxGridTableGR.DataController.AppendRecord;
    //persingkat dengan buat variabel lokal
    lItem.TBI_Barang.Reload();
    lItem.TBI_UOM.Reload();
    //load TB_TransferBarangItems dan TBI_Barang
    cxGridTableGR.DataController.Values[iRec,cxGridColPLU_ID.Index] := litem.TBI_Barang.ID;
    cxGridTableGR.DataController.Values[iRec,cxGridColPLU.Index]    := lItem.TBI_Barang.BRG_CODE;
    cxGridTableGR.DataController.Values[iRec,cxGridColNama.Index]   := lItem.TBI_Barang.BRG_NAME;
    cxGridTableGR.DataController.Values[iRec,cxGridColQty.Index]    := lItem.TBI_Qty;
    cxGridTableGR.DataController.Values[iRec,cxGridColUOM.Index]    := lItem.TBI_UOM.SAT_CODE;
    cxGridTableGR.DataController.Values[iRec,cxGridColUOMid.Index]  := lItem.TBI_UOM.ID;
  end;
end;

procedure TfrmDialogTransferBarang.LookupBarang;
var
  cxLookup: TfrmCXLookup;
//  lCDS: tclientDataset;
begin
  if not Assigned(CDSBarang) then
    CDSBarang := TDBUtils.DSToCDS(DMClient.DSProviderClient.Barang_GetDSLookup(''), Self);
  cxLookup := TfrmCXLookup.Execute(CDSBarang);
  Try
    cxLookup.HideFields(['BARANG_ID']);
    if cxLookup.ShowModal = mrOK then
    begin
      SetBarangToGrid(cxLookup.Data.FieldByname('BRG_CODE').AsString);
    end;
  Finally
    cxLookup.Free;
  End;
end;

procedure TfrmDialogTransferBarang.LookupUOM(ABarangID: String);
var
  cxLookup: TfrmCXLookup;
  iCurrentRow: Integer;
  LCDSuom: TClientDataset;
begin
  LCDSuom := TDBUtils.DSToCDS(DMClient.DSProviderClient.KonversiSatuan_GetDS(ABarangID), Self);
  cxLookup := TfrmCXLookup.Execute(LCDSuom);
  Try
    cxLookup.HideFields(['REF$SATUAN_ID', 'BARANG_ID', 'BRG_NAME', 'KONVSAT_SCALE']);
    if cxLookup.ShowModal = mrOK then
    begin
      //ambil data dari cxLookup :
      //cxLookup.Data.FieldByName(namafield).Axxxx
      iCurrentRow := cxGridTableGR.DataController.FocusedRecordIndex;
      cxGridTableGR.DataController.Values[iCurrentRow, cxGridColUOMid.Index]  :=  cxLookup.Data.FieldByName('Ref$Satuan_ID').AsString;
      cxGridTableGR.DataController.Values[iCurrentRow, cxGridColUOM.Index]    :=  cxLookup.Data.FieldByName('SAT_CODE').AsString;
      //isi data dari lookup ke grid
    end;
  Finally
    cxLookup.Free;
    LCDSUOM.Free;
  End;
end;

procedure TfrmDialogTransferBarang.SetBarangToGrid(APLU: String);
var
  i: Integer;
  iCurrentRow: Integer;
  lModBarang: TModBarang;
begin
  lModBarang := TCRUDObj.RetrieveCode<TModBarang>(APLU);
  //Jare Manda, cara retrieve yg lebih simpel. Tur aku ra paham. wkwkwk
  Try
    if lModBarang.ID = '' then
    begin
      TAppUtils.Warning('PLU Tidak Ditemukan!');
      Abort;
//      exit;
    end;
    //diwoco kudune ngerti, soale jelaske kangelan. wkwkwk

    iCurrentRow := cxGridTableGR.DataController.FocusedRecordIndex;
    //mendapatkan baris grid yg sedang fokus;

    //cara mengisi grid, format :
    //'namaGrid'.DataController.Values[ 'index baris', 'index kolom'] = xxx
    cxGridTableGR.DataController.Values[iCurrentRow, cxGridColPLU.Index]      := lModBarang.BRG_CODE;
    cxGridTableGR.DataController.Values[iCurrentRow, cxGridColNama.Index]     := lModBarang.BRG_NAME;
    cxGridTableGR.DataController.Values[iCurrentRow, cxGridColPLU_ID.Index]   := lModBarang.ID;
    cxGridTableGR.DataController.Values[iCurrentRow, cxGridColIsDecimal.Index]:= lModBarang.BRG_IS_DECIMAL;

    //Set UOM Default
    if lModBarang.SATUAN_STOCK <> nil then
    begin
      lModBarang.SATUAN_STOCK.Reload();
      cxGridTableGR.DataController.Values[iCurrentRow, cxGridColUOMid.Index] := lModBarang.SATUAN_STOCK.ID;
      cxGridTableGR.DataController.Values[iCurrentRow, cxGridColUOM.Index]   := lModBarang.SATUAN_STOCK.SAT_CODE;
    end;

  Finally
    lModBarang.Free;
  End;

end;

procedure TfrmDialogTransferBarang.SimpanData;
begin
  try
    DMClient.CRUDJurnalClient.SaveToDB(ModTransferBarang);
    TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
    self.ModalResult:=mrOk;
  except
    TAppUtils.Error(ER_INSERT_FAILED);
    raise;
  end;
end;

procedure TfrmDialogTransferBarang.UpdateData;
var
  i: Integer;
  lItem: TModTransferBarangItem;  //var nama bebas untuk detail
begin
//header
  if ModTransferBarang.ID = '' then
    edNO.Text := DMClient.CRUDTransferBarangClient.GenerateNo(ModTransferBarang.ClassName);
    //generate nomor otomatis,
    {
      mau tau detailnya? coba ctrl+klik 'GenerateNo' yg di situ.
      Kl udah kebuka balik sini lagi, lanjut baca.

      Udah kebuka kan tadi? Kliatan kan tulisan 'TCRUDTransferBarang.GenerateNo'?
      Itu lokasinya ada di server. uServerClases.TCRUDTransferBarang.GenerateNo
      TCRUDTCRUDTransferBarang itu inherit dari TCRUD yang di-'overide' di bagian  TCRUD.
      Jangan tanya gimana! Aku yo ra isoh jelaske. wkwkwk
      Nah, kl mau bikin custom no yg serupa copy aja, trus rename, isinya disesuaikan.
      Abis itu daftarkan di uDMClient, metodenya sama copy-paste.
      Buka ServerContainerUnit, register di method RegisterServerClases.
      Jalankan server, generate data snap clientclasses.

      Sementara ini dulu, besok dilanjut.

    }

  ModTransferBarang.TB_NO             := edNO.Text;
  ModTransferBarang.TB_TANGGAL        := dtTanggal.date;
  ModTransferBarang.TB_GUDANG_ASAL    := TModGudang.CreateID(cxLookUpGudangAsal.EditValue);
  ModTransferBarang.TB_GUDANG_TUJUAN  := TModGudang.CreateID(cxLookUpGudangTujuan.EditValue);
  ModTransferBarang.TB_REFERENSI      := edReferensi.Text;
  ModTransferBarang.TB_Keterangan     := memDesc.Text;
  ModTransferBarang.TB_Unit           := TRetno.UnitStore;
  ModTransferBarang.TB_COLIE          := cxGridTableGR.GetFooterSummary(cxGridColQty);

//detail
  ModTransferBarang.TB_TransferBarangItems.Clear; //hapus yg sudah ada, biasanya kl edit, biar ga dobel.

  for i := 0 to cxGridTableGR.DataController.RecordCount-1 do
    begin
      lItem := TModTransferBarangItem.Create;
      lItem.TBI_Barang  := TModBarang.CreateID(cxGridTableGR.Values(i,cxGridColPLU_ID.Index));
      lItem.TBI_UOM     := TModSatuan.CreateID(cxGridTableGR.Values(i,cxGridColUOMid.Index));
      //                     Mod Asal             tabel                kolom
      lItem.TBI_Qty     :=  VarToFloat(cxGridTableGR.Values(i,cxGridColQty.Index));
      //                    Konversi Varchar ke Double

      ModTransferBarang.TB_TransferBarangItems.Add(lItem)
    end;


end;

function TfrmDialogTransferBarang.ValidateData: Boolean;
var
  a: Integer;
  i: Integer;
  lQty: Double;
  iCurrentRow: Integer;
  lModBarang: TModBarang;
  lModSatuan: TModSatuan;

begin
  Result := False;
  cxGridTableGR.DataController.Post();

  if not ValidateEmptyCtrl([0,1]) then exit;

  //validasi tidak boleh gudang yg sama
  if cxLookUpGudangAsal.EditValue = cxLookUpGudangTujuan.EditValue then
  begin
    TAppUtils.Warning('Gudang asal dan tujuan tidak boleh sama');
    exit;
  end;

  //validasi harus ada minim 1 baris
  if cxGridTableGR.DataController.RecordCount < 1 then
  begin
    TAppUtils.Warning('Item minimal 1 baris');
    exit;
  end;

  //validasi qty harus lebih dari 0
  if cxGridTableGR.GetFooterSummary(cxGridColQty) <= 0 then
  begin
    TAppUtils.Warning('Quantity pada baris ke-'+IntToStr(i+1)+' salah');
    exit;
  end;

  //validasi harus terisi: PLU, UOM, qty
  for i := 0 to cxGridTableGR.DataController.RecordCount-1 do
  begin
    lQty := VarToFloat(cxGridTableGR.Values(i,cxGridColQty.Index));
    if (Frac(lQTY) <> 0) and (cxGridTableGR.Values(i,cxGridColIsDecimal.Index) = 0) then
    begin
       TAppUtils.Warning('Quantity pada baris ke-'+IntToStr(i+1)+' tidak boleh desimal. Hubungi bagian buyer untuk mengubah deskripsi barang.');
      exit;
    end;

    if varisnull (cxGridTableGR.Values(i,cxGridColPLU_ID.Index)) then
    begin
      TAppUtils.Warning('PLU pada baris ke-'+IntToStr(i+1)+' belum diisi.');
      exit;
    end;

    if varisnull (cxGridTableGR.Values(i,cxGridColUOMid.Index)) then
    begin
      TAppUtils.Warning('UOM pada baris ke-'+IntToStr(i+1)+' belum diisi.');
      exit;
    end;

    if varisnull (cxGridTableGR.Values(i,cxGridColQty.Index)) then
    begin
      TAppUtils.Warning('Quantity pada baris ke-'+IntToStr(i+1)+' belum diisi.');
      exit;
    end;
  end;

  for i := 0 to cxGridTableGR.DataController.RecordCount -1 do
  begin
    for a := 0 to cxGridTableGR.DataController.RecordCount -1 do
    begin
      if i = a then
      Continue;
      if (cxGridTableGR.DataController.Values[i,cxGridColPLU_ID.Index] = cxGridTableGR.DataController.Values[a,cxGridColPLU_ID.Index])
       and (cxGridTableGR.DataController.Values[i,cxGridColUOMid.Index] = cxGridTableGR.DataController.Values[a,cxGridColUOMid.Index]) then
      begin
        TAppUtils.Warning('PLU baris ke-'+IntToStr(i+1)+' dan ke-' +IntToStr(a+1)+' tidak boleh dengan UoM yang sama.');
        exit;
      end;
    end;
  end;


  Result := True;
end;

end.
