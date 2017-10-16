unit ufrmDialogKuponBotol;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  ufrmMasterDialog, System.Actions, Vcl.ActnList, ufraFooterDialog3Button,
  Vcl.ExtCtrls, uInterface, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  cxGroupBox, cxCurrencyEdit, cxTextEdit, cxButtonEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxSpinEdit, uModTransKuponBotol;

type
  TfrmDialogKuponBotol = class(TfrmMasterDialog, ICRUDAble)
    cxLabel1: TcxLabel;
    dtpTanggal: TcxDateEdit;
    cxLabel2: TcxLabel;
    edtKodeMember: TcxButtonEdit;
    cxLabel3: TcxLabel;
    edTransactionNo: TcxTextEdit;
    cxLabel4: TcxLabel;
    edtMemberName: TcxTextEdit;
    cxLabel7: TcxLabel;
    edtKeterangan: TcxTextEdit;
    cxLabel8: TcxLabel;
    curredtTotalPrice: TcxCurrencyEdit;
    cxGroupBox5: TcxGroupBox;
    Label29: TLabel;
    btnDeletePrice: TcxButton;
    btnAddPrice: TcxButton;
    cxGrid: TcxGrid;
    cxGridView: TcxGridDBTableView;
    cxGridViewDetail: TcxGridTableView;
    colPLU: TcxGridColumn;
    colProductName: TcxGridColumn;
    colUoM: TcxGridColumn;
    colQty: TcxGridColumn;
    colSellPrice: TcxGridColumn;
    colDisc: TcxGridColumn;
    colSellPriceDisc: TcxGridColumn;
    colTotal: TcxGridColumn;
    cxlvMaster: TcxGridLevel;
  private
    FModKuponBotol: TModTransKuponBotol;
    function GetModKuponBotol: TModTransKuponBotol;
    property ModKuponBotol: TModTransKuponBotol read GetModKuponBotol write
        FModKuponBotol;
  public
    procedure LoadData(AID: string);
  end;

var
  frmDialogKuponBotol: TfrmDialogKuponBotol;

implementation

uses
  uDXUtils, uDMClient, uModelHelper;

{$R *.dfm}

function TfrmDialogKuponBotol.GetModKuponBotol: TModTransKuponBotol;
begin
  if not Assigned(FModKuponBotol) then
    FModKuponBotol := TModTransKuponBotol.Create();

  Result := FModKuponBotol;
end;

procedure TfrmDialogKuponBotol.LoadData(AID: string);
var
  lDC: TcxGridDataController;
  i: Integer;
  iRec: Integer;
  lItem: TModTransKuponBotolDetil;
begin
  ClearByTag([0]);
  if AID = '' then Exit;
  if Assigned(FModKuponBotol) then FreeAndNil(FModKuponBotol);

  FModKuponBotol := DMClient.CrudDNClient.Retrieve(TModTransKuponBotol.ClassName, aID) as TModTransKuponBotol;
  ModKuponBotol.MEMBER.Reload();

  dtpTanggal.EditValue      := ModKuponBotol.TKB_DATE;
  edTransactionNo.EditValue := ModKuponBotol.TKB_NO;
  edtKodeMember.EditValue   := ModKuponBotol.MEMBER.MEMBER_CARD_NO;
  edtMemberName.EditValue   := ModKuponBotol.MEMBER.MEMBER_NAME;
  edtKeterangan.EditValue   := ModKuponBotol.TKB_DESCRIPTION;

  cxGridViewDetail.ClearRows;
  lDC := cxGridViewDetail.DataController;
  for i := 0 to FModKuponBotol.KuponBotolDetils.Count-1 do
  begin
    lItem := FModKuponBotol.KuponBotolDetils[i];
    lItem.BARANG.Reload();
    lItem.SATUAN.Reload();
    iRec := lDC.AppendRecord;
    lDC.Values[iRec, colPLU.Index]           := lItem.BARANG.BRG_CODE;
    lDC.Values[iRec, colProductName.Index]   := lItem.BARANG.BRG_NAME;
    lDC.Values[iRec, colUoM.Index]           := lItem.SATUAN.SAT_CODE;
    lDC.Values[iRec, colQty.Index]           := lItem.TKBD_QTY;
    lDC.Values[iRec, colSellPrice.Index]     := lItem.TKBD_SELL_PRICE;
    lDC.Values[iRec, colDisc.Index]          := lItem.TKBD_DISC;
    lDC.Values[iRec, colSellPriceDisc.Index] := lItem.TKBD_TOTAL_SELL_PRICE_DISC;
    lDC.Values[iRec, colTotal.Index]         := lItem.TKBD_QTY * lItem.TKBD_TOTAL_SELL_PRICE_DISC;
  end;
  curredtTotalPrice.EditValue := cxGridViewDetail.GetFooterSummary(colTotal);
  cxGridViewDetail.ApplyBestFit();
end;

end.
