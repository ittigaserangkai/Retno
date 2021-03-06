unit ufrmDialogJurnal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxGridLevel, cxGrid,
  cxCurrencyEdit, uDMClient, cxContainer, cxLabel, cxTextEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxMemo, cxMaskEdit, cxDropDownEdit, cxCalendar,
  uModJurnal, uAppUtils,
  uConstanta, uDXUtils, cxDBExtLookupComboBox, cxCalc, Datasnap.DBClient,
  uDBUtils, uModRekening, uModCostCenter, uInterface;

type
  TfrmDialogJurnal = class(TfrmMasterDialog, ICRUDAble)
    pnlHeader: TPanel;
    cxgrdlvlDetail: TcxGridLevel;
    cxgrdJurnal: TcxGrid;
    cxGridTableJurnal: TcxGridTableView;
    cxGridColJurKode: TcxGridColumn;
    cxGridColJurNama: TcxGridColumn;
    cxGridColJurCostCenter: TcxGridColumn;
    cxGridColJurDescription: TcxGridColumn;
    cxGridColJurDebet: TcxGridColumn;
    cxGridColJurCredit: TcxGridColumn;
    lblNo: TcxLabel;
    lblJurnalDate: TcxLabel;
    lblReferensi: TcxLabel;
    lblDescription: TcxLabel;
    dtTanggal: TcxDateEdit;
    memDesc: TcxMemo;
    edReference: TcxTextEdit;
    edNo: TcxTextEdit;
    procedure actDeleteExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure cxGridColJurKodePropertiesEditValueChanged(Sender: TObject);
  private
    FCDSAccount: TClientDataSet;
    FModJurnal: TModJurnal;
    FCDSCostCenter: TClientDataSet;
    procedure DeleteData;
    function GetModJurnal: TModJurnal;
    procedure initView;
    procedure SimpanData;
    function ValidateData: Boolean;
    procedure UpdateData;
    property CDSAccount: TClientDataSet read FCDSAccount write FCDSAccount;
    property CDSCostCenter: TClientDataSet read FCDSCostCenter write FCDSCostCenter;
    property ModJurnal: TModJurnal read GetModJurnal write FModJurnal;
    { Private declarations }
  public
    procedure LoadData(ID: String);
    { Public declarations }
  end;

var
  frmDialogJurnal: TfrmDialogJurnal;

implementation

uses
  uModelHelper;

{$R *.dfm}

procedure TfrmDialogJurnal.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if TAppUtils.Confirm('Anda Yakin Menghapus Data') then DeleteData;
end;

procedure TfrmDialogJurnal.cxGridColJurKodePropertiesEditValueChanged(
  Sender: TObject);
var
  lRecordIndex: Integer;
begin
  inherited;
  //ketika kolom kode dipilih, kolom nama otomatis terisi

  //format
  //grid.datacontroller.values[ baris, kolom]

  //utk mendapatkan baris:
  lRecordIndex := cxGridTableJurnal.DataController.FocusedRecordIndex;
  cxGridTableJurnal.DataController.Values[lRecordIndex, cxGridColJurNama.Index] := CDSAccount.FieldByName('REK_NAME').AsString;

end;

procedure TfrmDialogJurnal.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
  initView;
end;

procedure TfrmDialogJurnal.actSaveExecute(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  UpdateData;
  SimpanData;
end;

procedure TfrmDialogJurnal.DeleteData;
begin
  if not Assigned(ModJurnal) then
    Raise Exception.Create('Data not Loaded');

  if ModJurnal.ID = '' then
  begin
    TAppUtils.Error('Tidak ada data yang dihapus');
    exit;
  end;

  Try
    DMClient.CrudClient.DeleteFromDB(ModJurnal);
    TAppUtils.Information(CONF_DELETE_SUCCESSFULLY);
    Self.ModalResult := mrOk;
  except
    TAppUtils.Error(ER_DELETE_FAILED);
    raise;
  End;
end;

function TfrmDialogJurnal.GetModJurnal: TModJurnal;
begin
  if FModJurnal = nil then
    FModJUrnal := TModJurnal.Create;
  Result := FModJurnal;
end;

procedure TfrmDialogJurnal.initView;
begin
  With DMClient.DSProviderClient do
  begin
    CDSAccount := TDBUtils.DSToCDS(Rekening_GetDSLookup, Self); //konversi dataset ke client dataset
    TcxExtLookup(cxGridColJurKode.Properties).LoadFromCDS(
      CDSAccount, 'REKENING_ID','REK_CODE', Self
    );  //method utk mengisi property dari kolom kode, menjadi lookup dari cdsaccount

    TcxExtLookup(cxGridColJurKode.Properties).SetMultiPurposeLookup;

    CDSCostCenter := TDBUtils.DSToCDS(CostCenter_GetDSLookup, Self);
    TcxExtLookup(cxGridColJurCostCenter.Properties).LoadFromCDS(
      CDSCostCenter, 'COST_CENTER_ID','COCTER_CODE', Self
    );
  end;

  LoadData('');
end;

procedure TfrmDialogJurnal.LoadData(ID: String);
var
  i: Integer;
  iRec: Integer;
  lItem: TModJurnalItem;
begin
  if ID <> '' then //berarti lihat/edit
  begin
    FModJurnal      := DMclient.CrudClient.Retrieve(TModJurnal.ClassName, ID) as TModJurnal;
  end else
  begin
    FModJurnal            := TModJurnal.Create;
    FModJurnal.JUR_DATE   := Now();
//    FModJurnal.JUR_NO     := 'Otomatis';
    FModJurnal.JUR_NO     := DMClient.CRUDJurnalClient.GenerateNo(ModJurnal.ClassName);
  end;

  //isi dari modjurnal
  edNo.Text         := ModJurnal.JUR_NO;
  dtTanggal.Date    := ModJurnal.JUR_DATE;
  edReference.Text  := ModJurnal.JUR_REF_NO;
  memDesc.Text      := ModJurnal.JUR_DESCRIPTION;

  //load detail

  cxGridTableJurnal.ClearRows;
  for i := 0 to ModJurnal.JUR_JURNALITEMS.Count-1 do
  begin
    lItem := ModJurnal.JUR_JURNALITEMS[i];
    iRec  := cxGridTableJurnal.DataController.AppendRecord;
    cxGridTableJurnal.DataController.Values[iRec,cxGridColJurKode.Index] := lItem.JURD_REKENING.ID;

    //rekening di load dulu, karena sebelumny cuma isi ID saja. biar REK_NAME bisa diakses
    lItem.JURD_REKENING.Reload();
    cxGridTableJurnal.DataController.Values[iRec,cxGridColJurNama.Index] := lItem.JURD_REKENING.REK_NAME;
    cxGridTableJurnal.DataController.Values[iRec,cxGridColJurCostCenter.Index] := lItem.JURD_COCENTER.ID;
    cxGridTableJurnal.DataController.Values[iRec,cxGridColJurDescription.Index] := lItem.JURD_DESCRIPTION;
    cxGridTableJurnal.DataController.Values[iRec,cxGridColJurDebet.Index] := lItem.JURD_DEBET;
    cxGridTableJurnal.DataController.Values[iRec,cxGridColJurCredit.Index] := lItem.JURD_CREDIT;
  end;
end;

procedure TfrmDialogJurnal.SimpanData;
begin
  try
    DMClient.CRUDJurnalClient.SaveToDB(ModJurnal);
    TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
    self.ModalResult:=mrOk;
  except
    TAppUtils.Error(ER_INSERT_FAILED);
    raise;
  end;
end;

function TfrmDialogJurnal.ValidateData: Boolean;
var
  i: Integer;
  lTotalCredit: Double;
  lTotalDebet: Double;

begin
  Result := False;
  cxGridTableJurnal.DataController.Post();

  if not ValidateEmptyCtrl([0,1]) then exit;
  // validasi total debet = total credit
  lTotalDebet := cxGridTableJurnal.GetFooterSummary(cxGridColJurDebet);
  lTotalCredit:= cxGridTableJurnal.GetFooterSummary(cxGridColJurCredit);
  if not (lTotalDebet = lTotalCredit) then
  begin
    TAppUtils.Warning('Total debet dan kredit tidak sama');
    exit;
  end;

  //validasi antara total D dan K tidak boleh 0
  if (lTotalDebet = 0) or (lTotalCredit = 0) then
  begin
    TAppUtils.Warning('Total Debet atau Kredit tidak boleh 0');
    exit;
  end;

  //validasi jumlah baris harus lebih dari 1
  if cxGridTableJurnal.DataController.RecordCount < 2 then
  begin
    TAppUtils.Warning('Jurnal minimal 2 baris');
    exit;
  end;

  //validasi harus terisi: kode (rekening), deskripsi,
  for i := 0 to cxGridTableJurnal.DataController.RecordCount-1 do
    begin
    if varisnull (cxGridTableJurnal.Values(i,cxGridColJurKode.Index)) then
      begin
        TAppUtils.Warning('Rekening belum diisi pada baris ke-'+IntToStr(i+1));
        exit;
      end;
    end;

  //validasi ga boleh ada baris D K 0

  Result := True;
end;

procedure TfrmDialogJurnal.UpdateData;
var
  i: Integer;
  lItem: TModJurnalItem;  //var nama bebas
begin
//header
  if ModJurnal.ID = '' then
    edNo.Text := DMClient.CRUDJurnalClient.GenerateNo(ModJurnal.ClassName);
    //generate nomor otomatis,
    {
      mau tau detailnya? coba ctrl+klik 'GenerateNo' yg di situ.
      Kl udah kebuka balik sini lagi, lanjut baca.

      Udah kebuka kan tadi? Kliatan kan tulisan 'TCRUDJurnal.GenerateNo'?
      Itu lokasinya ada di server. uServerClases.TCRUDJurnal.GenerateNo
      TCRUDJurnal itu inherit dari TCRUD yang di-'overide' di bagian  TCRUD.
      Jangan tanya gimana! Aku yo ra mudeng. wkwkwk
      Nah, kl mau bikin custom no yg serupa copy aja, trus rename, isinya disesuaikan.
      Abis itu daftarkan di uDMClient, metodenya sama copy-paste.
      Buka ServerContainerUnit, register di method RegisterServerClases.
      Jalankan server, generate data snap clientclasses.

      Sementara ini dulu, besok dilanjut.

    }

  ModJurnal.JUR_NO          := edNo.Text;
  ModJurnal.JUR_DATE        := dtTanggal.Date;
  ModJurnal.JUR_REF_NO      := edReference.Text;
  ModJurnal.JUR_DESCRIPTION := memDesc.Text;
  ModJurnal.JUR_CREDIT      := cxGridTableJurnal.GetFooterSummary(cxGridColJurCredit);
  ModJurnal.JUR_DEBET       := cxGridTableJurnal.GetFooterSummary(cxGridColJurDebet);
//detail
  ModJurnal.JUR_JURNALITEMS.Clear; //hapus yg sudah ada, biasanya kl edit, biar ga dobel.

  for i := 0 to cxGridTableJurnal.DataController.RecordCount-1 do
    begin
      lItem := TModJurnalItem.Create;
      lItem.JURD_REKENING := TModRekening.CreateID(cxGridTableJurnal.Values(i,cxGridColJurKode.Index));
      if not VarIsNull(cxGridTableJurnal.Values(i,cxGridColJurCostCenter.Index)) then
        lItem.JURD_COCENTER := TModCostCenter.CreateID(cxGridTableJurnal.Values(i,cxGridColJurCostCenter.Index));
      if not VarIsNull(cxGridTableJurnal.Values(i,cxGridColJurDescription.Index)) then
        lItem.JURD_DESCRIPTION  := cxGridTableJurnal.Values(i,cxGridColJurDescription.Index);
      lItem.JURD_DEBET        := VarToFloat(cxGridTableJurnal.Values(i,cxGridColJurDebet.Index));
      lItem.JURD_CREDIT       := VarToFloat(cxGridTableJurnal.Values(i,cxGridColJurCredit.Index));
      ModJurnal.JUR_JURNALITEMS.Add(lItem)
    end;


end;

end.
