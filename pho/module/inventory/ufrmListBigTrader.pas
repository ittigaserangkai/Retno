unit ufrmListBigTrader;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, JvEdit,  ComCtrls, uRMSUnit, udmReportNew, DateUtils,
  JvExStdCtrls, JvValidateEdit;

type
  TfrmListBigTrader = class(TfrmMaster)
    lbl1: TLabel;
    lbl2: TLabel;
    dtpAkhir: TDateTimePicker;
    dtpAwal: TDateTimePicker;
    edRangking: TJvValidateEdit;
    lbl3: TLabel;
    btnCetak: TButton;
    btnClose: TButton;
    cbbPenjualanDari: TComboBox;
    lbl4: TLabel;
    procedure btnCetakClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListBigTrader: TfrmListBigTrader;

implementation

{$R *.dfm}

procedure TfrmListBigTrader.btnCetakClick(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
  if cbbPenjualanDari.ItemIndex = 0 then // trader
  begin
    sSQL := 'select '
            + ' b.trd_name, sum(a.doas_total_recipt) as Nominal,'
            + GetCompanyHeader(FLoginUsername, MasterNewUnit.Nama,dtpAwal.DateTime, dtpAkhir.DateTime)
            + ' b.trd_code'
            + ' from DO_ASSGROS a, TRADER b'
            + ' where a.doas_trd_id = b.trd_id'
            + ' and a.doas_trd_unt_id = b.trd_unt_id'
            + ' and a.doas_status in (' + Quot('INVOICING') + ',' + Quot('PAID') + ',' + Quot('CLOSED') + ',' + Quot('POS')+ ')'
//            + ' and a.DOAS_NO = c.bss_doc_no'
//            + ' and a.doas_unt_id = c.bss_unt_id'
//            + ' and c.bss_type = ' + Quot('KRING')
            + ' and a.doas_unt_id = ' + IntToStr(MasterNewUnit.ID)
            + ' and cast(a.doas_date_receipt as date) between ' + QuotD(dtpAwal.DateTime) + ' and ' + QuotD(dtpAkhir.DateTime)
            + ' group by b.trd_code, b.trd_name'
            + ' order by 2 desc rows ' + IntToStr(edRangking.Value);
  end else begin
    sSQL := 'select '
            + ' b.member_name as trd_name,sum(a.trans_total_transaction) as nominal,'
            + GetCompanyHeader(FLoginUsername, MasterNewUnit.Nama,dtpAwal.DateTime, dtpAkhir.DateTime)
            + ' b.MEMBER_CARD_NO as trd_code'
            + ' from transaksi a, member b'
            + ' where a.trans_member_id = b.member_id'
            + ' and a.trans_member_unt_id = b.member_unt_id'
            + ' and a.trans_date between ' + QuotD(dtpAwal.DateTime) + ' and ' + QuotD(dtpAkhir.DateTime, True)
            + ' and a.trans_unt_id = ' + IntToStr(MasterNewUnit.ID)
            + ' group by b.member_name, b.MEMBER_CARD_NO'
            + ' order by 2 desc rows ' + IntToStr(edRangking.Value);

            {+ ' b.trd_name, sum(a.doas_total_recipt) as Nominal,'

            + ' b.trd_code'
            + ' from DO_ASSGROS a, TRADER b, barang_stok_sirkulasi c'
            + ' where a.doas_trd_id = b.trd_id'
            + ' and a.doas_trd_unt_id = b.trd_unt_id'
            + ' and a.DOAS_NO = c.bss_doc_no'
            + ' and a.doas_unt_id = c.bss_unt_id'
            + ' and c.bss_type = ' + Quot('KRING')
            + ' and cast(a.doas_date_receipt as date) between '
            + ' group by b.trd_code, b.trd_name'
            }

  end;
  dmReportNew.EksekusiReport('ListBigTrader', sSQL,'',True);
end;

procedure TfrmListBigTrader.FormShow(Sender: TObject);
begin
  inherited;
  dtpAwal.DateTime  := StartOfTheMonth(cGetServerDateTime);
  dtpAkhir.DateTime := EndOfTheMonth(cGetServerDateTime);

end;

procedure TfrmListBigTrader.btnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
