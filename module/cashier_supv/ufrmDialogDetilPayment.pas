unit ufrmDialogDetilPayment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ExtCtrls, StdCtrls, System.Actions, Vcl.ActnList,
  ufraFooterDialog3Button, DB;

type
  TfrmDialogDetilPayment = class(TfrmMasterDialog)
    pnl1: TPanel;
    pnl2: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    edtTotalNilai: TEdit;
    edtDiskon: TEdit;
    edtPPn: TEdit;
    edtTotPenjualan: TEdit;
    edtPembulatan: TEdit;
    edtBayarTunai: TEdit;
    edtKembalian: TEdit;
    edtNilaiBersih: TEdit;
    edtKartu: TEdit;
    edtNoKartu: TEdit;
    edtOtorisasi: TEdit;
    edtAmount: TEdit;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    lbl21: TLabel;
    lbl23: TLabel;
    lbl25: TLabel;
    lbl26: TLabel;
    edtTotalTunai: TEdit;
    edtDebetCard: TEdit;
    edtCreditCard: TEdit;
    edtNilaiKupon: TEdit;
    edtBayarKupon: TEdit;
    edtKuponBotol: TEdit;
    edtNilaiKpn: TEdit;
    edtByrDgnKpn: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
//    myTransact: TTransact;
    FData: TDataSet;
    FDataSummary: TDataSet;
    FTransNo: string;
    procedure ParseDataPembayaranDetil;
  public
    property Data: TDataSet read FData write FData;
    property DataSummary: TDataSet read FDataSummary write FDataSummary;
    property TransNo: string read FTransNo write FTransNo;
  end;

var
  frmDialogDetilPayment: TfrmDialogDetilPayment;

implementation

uses uAppUtils;

{$R *.dfm}

procedure TfrmDialogDetilPayment.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogDetilPayment.FormDestroy(Sender: TObject);
begin
  inherited;
//  FreeAndNil(myTransact);
  frmDialogDetilPayment := nil;
end;

procedure TfrmDialogDetilPayment.ParseDataPembayaranDetil;
begin
  if not Data.IsEmpty then
  begin
    edtTotalNilai.Text := FormatCurr('#,##0.##', Data.fieldbyname('TRANS_TOTAL_TRANSACTION').AsCurrency);
    edtDiskon.Text := FormatCurr('#,##0.##', Data.fieldbyname('TRANS_DISC_GMC_NOMINAL').AsCurrency);
    edtPPn.Text := FormatCurr('#,##0.##', Data.fieldbyname('TRANS_PPN').AsCurrency);
    edtTotPenjualan.Text := FormatCurr('#,##0.##', Data.fieldbyname('TOTAL_PENJUALAN').AsCurrency);
    edtPembulatan.Text := FormatCurr('#,##0.##', Data.fieldbyname('TRANS_PEMBULAT').AsCurrency);
    edtBayarTunai.Text := FormatCurr('#,##0.##', Data.fieldbyname('TRANS_BAYAR_CASH').AsCurrency);
    edtKembalian.Text := '0';//FormatCurr('#,##0.##', Data.fieldbyname('').AsCurrency);
    edtNilaiBersih.Text := FormatCurr('#,##0.##', Data.fieldbyname('TRANS_TOTAL_TRANSACTION').AsCurrency);
    edtKartu.Text := Data.fieldbyname('CARD_NAME').AsString;
    edtNoKartu.Text := Data.fieldbyname('TRANSC_NOMOR').AsString;
    edtOtorisasi.Text := Data.fieldbyname('TRANSC_NO_OTORISASI').AsString;
    edtAmount.Text := FormatCurr('#,##0.##', Data.fieldbyname('TRANS_BAYAR_CARD').AsCurrency);
  end;

//  DataSummary := myTransact.GetSummaryPembayaranByTransNo(TransNo, dialogunit);

  if not DataSummary.IsEmpty then
  begin
    edtTotalTunai.Text := FormatCurr('#,##0.##', DataSummary.fieldbyname('TRANS_TOTAL_BAYAR').AsCurrency);
    edtDebetCard.Text := FormatCurr('#,##0.##', DataSummary.fieldbyname('TRANS_CARD_DEBET').AsCurrency);
    edtCreditCard.Text := FormatCurr('#,##0.##', DataSummary.fieldbyname('TRANS_CARD_CREDIT').AsCurrency);
    edtNilaiKupon.Text := FormatCurr('#,##0.##', DataSummary.fieldbyname('NILAI_KUPON').AsCurrency);
    edtBayarKupon.Text := FormatCurr('#,##0.##', DataSummary.fieldbyname('NILAI_KUPON').AsCurrency);
    edtKuponBotol.Text := FormatCurr('#,##0.##', DataSummary.fieldbyname('NILAI_KUPON_BOTOL').AsCurrency);
    edtNilaiKpn.Text := FormatCurr('#,##0.##', DataSummary.fieldbyname('NILAI_KUPON_BOTOL').AsCurrency);
    edtByrDgnKpn.Text := FormatCurr('#,##0.##', DataSummary.fieldbyname('NILAI_KUPON_BOTOL').AsCurrency);
  end;
end;

procedure TfrmDialogDetilPayment.FormShow(Sender: TObject);
begin
  inherited;
  ParseDataPembayaranDetil;
end;

procedure TfrmDialogDetilPayment.FormCreate(Sender: TObject);
begin
  inherited;
//  if not Assigned(myTransact) then
//    myTransact := TTransact.Create;
end;

end.


