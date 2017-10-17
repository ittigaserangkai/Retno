unit ufrmKuponBotol;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterBrowse, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  System.Actions, Vcl.ActnList, ufraFooter4Button, Vcl.StdCtrls, cxButtons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC, Vcl.ExtCtrls, cxCurrencyEdit, cxButtonEdit,
  Datasnap.DBClient, uModTransKuponBotol, cxSpinEdit;

type
  TfrmKuponBotol = class(TfrmMasterBrowse)
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    dtpTanggal: TcxDateEdit;
    edTransactionNo: TcxButtonEdit;
    edtKodeMember: TcxTextEdit;
    edtMemberName: TcxTextEdit;
    edtPOSTransNo: TcxTextEdit;
    edtStatus: TcxTextEdit;
    edtKeterangan: TcxTextEdit;
    cxLabel8: TcxLabel;
    curredtTotalPrice: TcxCurrencyEdit;
    cxGridViewDetail: TcxGridTableView;
    colPLU: TcxGridColumn;
    colProductName: TcxGridColumn;
    colUoM: TcxGridColumn;
    colQty: TcxGridColumn;
    colSellPrice: TcxGridColumn;
    colDisc: TcxGridColumn;
    colSellPriceDisc: TcxGridColumn;
    colTotal: TcxGridColumn;
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edTransactionNoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    FModKuponBotol: TModTransKuponBotol;
    procedure ClearForm;
    function GetModKuponBotol: TModTransKuponBotol;
    procedure ParseDataDetilTransaksiKuponBotol(ATransNo: string);
    property ModKuponBotol: TModTransKuponBotol read GetModKuponBotol write
        FModKuponBotol;
  public
    procedure RefreshData; override;
  end;

var
  frmKuponBotol: TfrmKuponBotol;

implementation

uses
  ufrmCXLookup, uDMClient, uDXUtils, uModelHelper, uDBUtils, uRetnoUnit,
  ufrmDialogKuponBotol;

{$R *.dfm}

procedure TfrmKuponBotol.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogKuponBotol, '');
end;

procedure TfrmKuponBotol.actEditExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogKuponBotol, edTransactionNo.EditValue);
end;

procedure TfrmKuponBotol.actPrintExecute(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmKuponBotol.ClearForm;
begin
  ClearByTag([0]);
  cxGridViewDetail.ClearRows;
end;

procedure TfrmKuponBotol.FormDestroy(Sender: TObject);
begin
  inherited;
  frmKuponBotol := nil;
end;

procedure TfrmKuponBotol.edTransactionNoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  lCDS: TClientDataSet;
begin
  inherited;
  lCDS := TDBUtils.DSToCDS(DMClient.DSProviderClient.KuponBotol_GetDSLookUp(dtpTanggal.Date, TRetno.UnitStore.ID) ,Self );
  if Assigned(lCDS) then
  begin
    with TfrmCXLookup.Execute(lCDS, False, 'Look Up Voucher Botol') do
    begin
      Try
        if ShowModal = mrOK then
        begin
          edTransactionNo.EditValue := Data.FieldByName('NO_VOUCHER').AsString;
          ParseDataDetilTransaksiKuponBotol(edTransactionNo.Text);
        end;
      Finally
        Free;
      End;
    end;
  end;
end;

procedure TfrmKuponBotol.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption    := 'TRANSAKSI KUPON BOTOL';
  dtpTanggal.EditValue := Now;
  AutoRefreshData      := True;
end;

function TfrmKuponBotol.GetModKuponBotol: TModTransKuponBotol;
begin
  if not Assigned(FModKuponBotol) then
    FModKuponBotol := TModTransKuponBotol.Create;

  Result := FModKuponBotol;
end;

procedure TfrmKuponBotol.ParseDataDetilTransaksiKuponBotol(ATransNo: string);
var
  lDC: TcxGridDataController;
  i: Integer;
  iRec: Integer;
  lItem: TModTransKuponBotolDetil;
begin
  if Assigned(FModKuponBotol) then
    FreeAndNil(FModKuponBotol);

  FModKuponBotol := DMClient.CrudClient.RetrieveByCode(TModTransKuponBotol.ClassName, ATransNo) as TModTransKuponBotol;
  FModKuponBotol.MEMBER.Reload();

  edTransactionNo.EditValue := FModKuponBotol.TKB_NO;
  edtKodeMember.EditValue   := FModKuponBotol.MEMBER.MEMBER_CARD_NO;
  edtMemberName.EditValue   := FModKuponBotol.MEMBER.MEMBER_NAME;
  edtPOSTransNo.EditValue   := FModKuponBotol.TKB_POS_TRANS_NO;
  edtStatus.EditValue       := FModKuponBotol.TKB_STATUS;
  edtKeterangan.EditValue   := FModKuponBotol.TKB_DESCRIPTION;

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

procedure TfrmKuponBotol.RefreshData;
var
  lCDS: TClientDataSet;
begin
  inherited;
  ClearForm;
  lCDS := TDBUtils.DSToCDS(DMClient.DSProviderClient.KuponBotol_GetDSLookUp(dtpTanggal.Date, TRetno.UnitStore.ID) ,Self );
  if Assigned(lCDS) then
  begin
    lCDS.Last;
    ParseDataDetilTransaksiKuponBotol(lCDS.FieldByName('NO_VOUCHER').AsString);
  end;
end;

end.
