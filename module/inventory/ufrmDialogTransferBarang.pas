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
  uModTransferBarang, Datasnap.DBClient, uDBUtils, uAppUtils;

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
    function GetModTransferBarang: TModTransferBarang;
    procedure InitLookup;
    procedure LookupBarang;
    procedure LookupUOM(ABarangID: String);
    procedure SetBarangToGrid(APLU: String);
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
begin
  inherited;
  iCurrentRow := cxGridTableGR.DataController.FocusedRecordIndex;

  LookupUOM(cxGridTableGR.DataController.Values[iCurrentRow, cxGridColPLU_ID.Index]);
end;

procedure TfrmDialogTransferBarang.FormCreate(Sender: TObject);
begin
  inherited;
  InitLookup;
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
  cxLookUpGudangAsal.SetMultiPurposeLookup;    //biar bisa filter manual

  cxLookUpGudangTujuan.LoadFromDS(
    DMClient.DSProviderClient.Gudang_GetDSLookUp,
    {id field} 'GUDANG_ID', {display field} 'GUD_NAME',
    ['GUDANG_ID'] {hidden field},self
  );

end;

procedure TfrmDialogTransferBarang.LoadData(AID : String);
begin
  // TODO -cMM: TfrmMasterDialog1.LoadData default body inserted
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
    if cxLookup.ShowModal = mrOK then
    begin
//      ShowMessage(cxLookup.Data.Fields[1].AsString);
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
    cxLookup.HideFields(['REF$SATUAN_ID']);
    if cxLookup.ShowModal = mrOK then
    begin
      //ambil data dari cxLookup :
      //cxLookup.Data.FieldByName(namafield).Asxxxx
      iCurrentRow := cxGridTableGR.DataController.FocusedRecordIndex;
      cxGridTableGR.DataController.Values[iCurrentRow, cxGridColUOMid.Index] :=  cxLookup.Data.FieldByName('Ref$Satuan_ID').AsString;
      cxGridTableGR.DataController.Values[iCurrentRow, cxGridColUOM.Index] :=  cxLookup.Data.FieldByName('SAT_CODE').AsString;      //isi data dari lookup ke grid
      //
    end;
  Finally
    cxLookup.Free;
    LCDSUOM.Free;
  End;


  //isi barang by sat_code
  //buat method SetSatuanToGrid(parameter SatCode);
end;

procedure TfrmDialogTransferBarang.SetBarangToGrid(APLU: String);
var
  iCurrentRow: Integer;
  lModBarang: TModBarang;
begin
//  lModBarang := DMClient.CrudClient.Retrieve(TModBarang.ClassName, APLU) as TModBarang;
  lModBarang := TCRUDObj.RetrieveCode<TModBarang>(APLU);   //cara retrieve yg lebih simpel
  Try
    iCurrentRow := cxGridTableGR.DataController.FocusedRecordIndex; //mendapatkan baris grid yg sedang fokus;

    if lModBarang.ID = '' then
      TAppUtils.Warning('PLU Tidak Ditemukan!');
    //cara mengisi grid, format :
    //namaGrid.DataController.Values[ index baris, index kolom] = xxx
    cxGridTableGR.DataController.Values[iCurrentRow, cxGridColPLU.Index]    := lModBarang.BRG_CODE;
    cxGridTableGR.DataController.Values[iCurrentRow, cxGridColNama.Index]   := lModBarang.BRG_NAME;
    cxGridTableGR.DataController.Values[iCurrentRow, cxGridColPLU_ID.Index] := lModBarang.ID;

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

end.
