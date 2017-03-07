unit ufrmListOmzet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, SUIButton, ComCtrls, uConn, JclStrings,
  uGTSUICommonDlg, ufraFooter5Button, ActnList, frxClass;

type
  TfrmListOmzet = class(TfrmMaster)
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    dtpFrom: TDateTimePicker;
    dtpTo: TDateTimePicker;
    btnPrint: TsuiButton;
    edtMemberNoFrom: TEdit;
    edtMemberNoTo: TEdit;
    fraFooter5Button1: TfraFooter5Button;
    actlstOmzet: TActionList;
    actListPrintOmzet: TAction;
    procedure btnPrintClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actListPrintOmzetExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnPrintEnter(Sender: TObject);
    procedure btnPrintExit(Sender: TObject);
    procedure edtMemberNoFromKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListOmzet: TfrmListOmzet;

implementation

uses suithemes, ufrmDialogPrintPreview, uPurchasingOrder, urMSUnit,
  udmReportNew;

{$R *.dfm}

procedure TfrmListOmzet.btnPrintClick(Sender: TObject);
begin
  actListPrintOmzetExecute(Sender);
end;

procedure TfrmListOmzet.FormShow(Sender: TObject);
begin
  inherited;
  dtpFrom.Date := Now;
  dtpTo.Date := Now;
end;

procedure TfrmListOmzet.actListPrintOmzetExecute(Sender: TObject);
var
//  SeparatorDate: Char;
  sFilterTrader: string;
  sSQLHeader: string;
  sSQL: string;
//  data: TResultDataSet;
//  ParamList: TStringList;
//  formatTanggalPendek: string;
//  arrParam: TArr;
begin
  inherited;
  edtMemberNoFrom.Text := Trim(edtMemberNoFrom.Text);
  edtMemberNoTo.Text := Trim(edtMemberNoTo.Text);
  sFilterTrader := ' and c.trd_code between ' + Quot(edtMemberNoFrom.Text) + ' and ' + Quot(edtMemberNoTo.Text);

  sSQL := 'select c.trd_code, c.trd_name, a.doas_no, b.doasd_qty_receipt, b.doasd_sell_price,'
          + ' b.doasd_disc, b.doasd_disc_member_receipt,  d.bss_harga_transaksi, e.BRG_TPBRG_ID'
          + ' from do_assgros a, do_assgros_detil b, trader c, barang_stok_sirkulasi d, barang e'
          + ' where a.doas_no = b.doasd_doas_no'
          + ' and a.doas_unt_id = b.doasd_doas_unt_id'
          + ' and a.DOAS_TRD_ID = c.trd_id'
          + ' and a.DOAS_TRD_unt_ID = c.trd_unt_id'
          + ' and b.doasd_brg_code = d.bss_brg_code'
          + ' and b.doasd_sat_code = d.bss_sat_code'
          + ' and d.bss_type = ' + Quot('KRING')
          + ' and d.bss_doc_no = a.doas_no'
          + ' and d.bss_unt_id = a.doas_unt_id'
          + ' and b.doasd_brg_code = e.brg_code'
          + ' and a.doas_status in (' + Quot('INVOICING') + ',' + Quot('PAID')+ ',' + Quot('CLOSED') + ',' + Quot('POS') + ')'
          + ' and a.doas_unt_id = ' + IntToStr(MasterNewUnit.ID)
          + ' and a.doas_date_receipt between ' + QuotDTNol(dtpFrom.DateTime) + ' and ' + QuotD(dtpTo.DateTime, True)
          + sFilterTrader
          + ' order by c.trd_code, a.doas_no';

  sSQLHeader := 'select ' + GetCompanyHeader(FLoginUsername, MasterNewUnit.Nama, dtpFrom.DateTime, dtpTo.DateTime)
                + Quot(edtMemberNoFrom.Text) + ' as KodeFrom, ' + Quot(edtMemberNoTo.Text) + ' as KodeTo'
                + ' from rdb$database';
                
dmReportNew.EksekusiReport('OmsetKring33',sSQL, sSQLHeader, True);

end;

procedure TfrmListOmzet.FormDestroy(Sender: TObject);
begin
  inherited;
  frmListOmzet := nil;
end;

procedure TfrmListOmzet.btnPrintEnter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmListOmzet.btnPrintExit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

procedure TfrmListOmzet.edtMemberNoFromKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  sSQL: string;
begin
  inherited;
  if Key = VK_F5 then
  begin
    sSQL := 'select trd_code as Kode, trd_name as Nama'
            + ' from trader'
            + ' where trd_unt_id = ' + IntToStr(MasterNewUnit.ID);

    with cLookUp('Daftar Trader', sSQL) do
    begin
      try
        if Trim(Strings[0]) = '' then
          Exit;

        (Sender as TEdit).Text := Strings[0];  
      finally
        Free;
      end;
    end;

  end;
end;

end.

