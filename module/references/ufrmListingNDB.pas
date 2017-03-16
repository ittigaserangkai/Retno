unit ufrmListingNDB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, te_controls, ComCtrls;

type
  TfrmListingNDB = class(TfrmMaster)
    dtAwal: TDateTimePicker;
    dtAkhir: TDateTimePicker;
    lbl1: TLabel;
    TeLabel1: TTeLabel;
    Button1: TButton;
    btnClose: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListingNDB: TfrmListingNDB;

implementation

uses dateutils, uRetnoUnit,  udmReportNew;

{$R *.dfm}

procedure TfrmListingNDB.Button1Click(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
  sSQL := 'select ' + GetCompanyHeader(FLoginFullname,MasterNewUnit.Nama,dtAwal.DateTime, dtAkhir.DateTime)
          + ' a.projas_code, a.projas_name, a.projas_qty,'
          + ' ('
          + ' select sum(q.agrd_qty)'//count(q.agrd_projas_code)'
          + ' from agreement p, agreement_detil q'
          + ' where p.agr_id = q.agrd_agr_id'
          + ' and p.agr_unt_id = q.agrd_agr_unt_id'
          + ' and p.agr_unt_id = a.projas_unt_id'
          + ' and q.agrd_projas_code = a.projas_code'
          + ' and q.agrd_projas_unt_id = a.projas_unt_id'
          + ' and (cast(p.agr_date_start as date) >= ' + QuotD(dtAwal.DateTime) + ' or cast(p.agr_date_end as date)<= ' + QuotD(dtAkhir.DateTime) + ')'
          + ' ) as QtySewa'
          + ' from produk_jasa a'
          + ' where a.projas_unt_id = ' + IntToStr(MasterNewUnit.ID);

  dmReportNew.EksekusiReport('LaporanNBD',sSQL, '',True);
end;

procedure TfrmListingNDB.FormShow(Sender: TObject);
begin
  inherited;
  lblHeader.Caption:='Listing Product Sewa';
  dtAwal.DateTime := StartOfTheMonth(cGetServerTime);
  dtAkhir.DateTime:= EndOfTheMonth(cGetServerTime);
end;

procedure TfrmListingNDB.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmListingNDB.btnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
