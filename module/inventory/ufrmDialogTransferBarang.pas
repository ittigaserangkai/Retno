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
  uModTransferBarang, Datasnap.DBClient, uDBUtils;

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
    procedure FormCreate(Sender: TObject);
  private
    FCDSItems: TClientDataSet;
    FModTransferBarang: TModTransferBarang;
    function GetModTransferBarang: TModTransferBarang;
    procedure InitLookup;
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

{$R *.dfm}

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

//  With DMClient.DSProviderClient do
//  begin
//    CDSItems := TDBUtils.DSToCDS(Barang_GetDSLookup(''), self);
//    // PARAMETER YG DIMAKSUD KI PY YA..?
//    TcxExtLookup(cxGridColPLU.Properties).LoadFromCDS(
//      CDSItems, 'BARANG_ID', 'BRG_CODE', self
//    );
//    TcxExtLookup(cxGridColPLU.Properties).SetMultiPurposeLookup;
//  end;
// CEK MOD JURNAL, TAKOKKE PY CRITANE. WKWKWKWKWK

end;

procedure TfrmDialogTransferBarang.LoadData(AID : String);
begin
  // TODO -cMM: TfrmMasterDialog1.LoadData default body inserted
end;

end.
