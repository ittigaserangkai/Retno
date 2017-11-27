unit ufrmReprintNota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, ActnList, Printers, ComCtrls,
  DateUtils, System.Actions, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  dxCore, cxDateUtils, Vcl.Menus, cxCurrencyEdit, ufraFooter4Button, cxButtons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC, uDMClient, uAppUtils, Datasnap.DBClient,
  uDBUtils, uDXUtils, uModTransaksi, uModelHelper;

type
  TfrmReprintNota = class(TfrmMasterBrowse)
    procedure actPrintExecute(Sender: TObject);
  private
    FCDS: TClientDataSet;
    FModTransaksi: TModTransaksi;
    procedure LoadTransaksi(aID: string);
    procedure PrintStruk;
    property CDS: TClientDataSet read FCDS write FCDS;
    property ModTransaksi: TModTransaksi read FModTransaksi write FModTransaksi;
    { Private declarations }
  protected
    procedure RefreshData; override;
  public
  end;

var
  frmReprintNota: TfrmReprintNota;

implementation

uses
  uPrintStruk;

{$R *.dfm}

procedure TfrmReprintNota.actPrintExecute(Sender: TObject);
begin
  inherited;
  PrintStruk;
end;

procedure TfrmReprintNota.LoadTransaksi(aID: string);
begin
  if Assigned(FModTransaksi) then FreeAndNil(FModTransaksi);
  FModTransaksi := TCRUDObj.Retrieve<TModTransaksi>(aID);

end;

procedure TfrmReprintNota.PrintStruk;
var
  lPrint: TPrintStruk;
begin
  if CDS.Eof then exit;
  LoadTransaksi(CDS.FieldByName('Transaksi_ID').AsString);
  lPrint := TPrintStruk.Create;
  try
    lPrint.ModTransaksi         := ModTransaksi;
    ModTransaksi.BALANCE.Reload();;
    ModTransaksi.BALANCE.SETUPPOS.Reload();
    ModTransaksi.BALANCE.AUTUSER.Reload();
    //??? => artinya tidak tahu kalau reprint ngambil field dari mana

    lPrint.POSCode              := ModTransaksi.BALANCE.SETUPPOS.SETUPPOS_TERMINAL_CODE;
    lPrint.CashierCode          := ModTransaksi.BALANCE.AUTUSER.USR_USERNAME;
    lPrint.CashierName          := ModTransaksi.BALANCE.AUTUSER.USR_FULLNAME;
    lPrint.CashBackVal          := 0; // ???
    lPrint.IsCashBack           := False; // ???
    lPrint.CreditCardAuthNo     := '';// ???
    lPrint.PaymentVal           := ModTransaksi.TRANS_BAYAR_CASH + ModTransaksi.TRANS_BAYAR_CARD;
    lPrint.KuponBotolVal        := ModTransaksi.GetKuponBotol;
    lPrint.KuponBotolQty        := ModTransaksi.GetKuponBotolQty;
    lPrint.CreditCardCharge     := 0;// ???
    lPrint.CreditCardDisc       := 0;// ???
    lPrint.CreditCardNo         := '';// ???
    lPrint.VoucherVal           := 0;// ???
    lPrint.ShowFooterKembalian  := False;
    lPrint.Reprint              := True;
    lPrint.PrintStruk;
  finally
    lPrint.Free;
  end;
end;

procedure TfrmReprintNota.RefreshData;
begin
  inherited;
  try
    TAppUtils.cShowWaitWindow('Mohon Ditunggu');
    if Assigned(FCDS) then FreeAndNil(FCDS);

    CDS := TDBUtils.DSToCDS(
      DMClient.POSClient.GetListTransaksi(dtAwalFilter.Date,dtAkhirFilter.Date),
      Self
    );

    cxGridView.LoadFromCDS(FCDS);
    cxGridView.SetVisibleColumns(['TRANSAKSI_ID', 'MEMBER_ID'],False);
  finally
    TAppUtils.cCloseWaitWindow;
  end;
end;

end.




