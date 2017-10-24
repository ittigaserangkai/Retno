unit ufrmFakturPajakAgreement;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmInvoice, ActnList,
  StdCtrls, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, System.Actions,
  cxLabel, cxCurrencyEdit, cxButtonEdit, cxButtons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxPC, ufraFooter4Button;

type
  TfrmFakturPajakAgreement = class(TfrmInvoice)
    Label1: TLabel;
    edtNoSeri: TEdit;
    procedure actPrintInvoiceExecute(Sender: TObject);
    procedure edbInvoiceScheduleClickBtn(Sender: TObject);
  private
    { Private declarations }
  public
    function GetPajakNo(aID : Integer; aUnitID : Integer): string;
    { Public declarations }
  end;

var
  frmFakturPajakAgreement: TfrmFakturPajakAgreement;

implementation

uses uTSCommonDlg, uRetnoUnit;

{$R *.dfm}

procedure TfrmFakturPajakAgreement.actPrintInvoiceExecute(Sender: TObject);
var
  s2: string;
  s: string;
begin
  //inherited;

  if (Trim(edtInvoiceNo.Text) = '') then
  begin
    CommonDlg.ShowError('No Invoice masih kosong ..');
    Exit;
  end;

  if (Trim(edtNoSeri.Text) = '') then
  begin
    CommonDlg.ShowError('No Seri Faktur Pajak masih kosong ..');
    Exit;
  end;


  try
    Self.Enabled := False;

//    if uNewMasterAgreement.UpdateAgreementJadwalPajakNo(FAgreementJadwalID, MasterNewUnit.ID, edtNoSeri.Text) then
//    begin
//      cCommitTrans;
//    end
//    else
//    begin
//      cRollbackTrans;
//      CommonDlg.ShowError('Gagal mengupdate no seri faktur pajak');
//      Exit;
//    end;

//    s := 'Select ' + GetCompanyHeader(FLoginFullname, MasterNewUnit.Nama, dtRecv.Date, dtRecv.Date)
//       + ' RDB$RELATION_ID FROM RDB$DATABASE';

    s2 := 'SELECT a.AGRD_PROJAS_CODE, d.PROJAS_NAME,'
          + ' a.AGRD_QTY, a.AGRD_PRICE, d.PROJAS_SATNBD_CODE, e.SATNBD_NAME,'
          + ' c.AGRJDWL_INV_TOTAL AS TOTAL, c.AGRJDWL_INV_NO,'
          + ' b.AGR_NO, f.CUST_CODE, f.CUST_NAME, f.CUST_ADDRESS, f.CUST_CITY,'
          + ' f.CUST_CONTACT_PERSON, f.CUST_TITLE, f.CUST_DESCRIPTION, f.CUST_NPWP,'
          + ' a.AGRD_SUBTOTAL, b.AGR_IS_PPN, b.AGR_IS_PPH23, h.PJK_PPN, c.AGRJDWL_PAJAK_NO,'
          + ' h.PJK_PPNBM'
          + ' FROM AGREEMENT_DETIL a INNER JOIN AGREEMENT b ON b.AGR_ID = a.AGRD_AGR_ID'
          + ' AND b.AGR_UNT_ID = a.AGRD_AGR_UNT_ID'
          + ' LEFT JOIN AGREEMENT_JADWAL c ON c.AGRJDWL_AGR_ID = b.AGR_ID'
          + ' AND c.AGRJDWL_AGR_UNT_ID = b.AGR_UNT_ID'
          + ' LEFT JOIN PRODUK_JASA d ON d.PROJAS_CODE = a.AGRD_PROJAS_CODE'
          + ' AND d.PROJAS_UNT_ID = a.AGRD_PROJAS_UNT_ID'
          + ' LEFT JOIN REF$SATUAN_NBD e ON e.SATNBD_CODE = d.PROJAS_SATNBD_CODE '
          + ' AND e.SATNBD_UNT_ID = d.PROJAS_SATNBD_UNT_ID'
          + ' LEFT JOIN CUSTOMER f ON f.CUST_CODE = b.AGR_CUST_CODE'
          + ' AND f.CUST_UNT_ID = b.AGR_CUST_UNT_ID'
          + ' LEFT JOIN REF$PERIODE g ON g.PER_ID = b.AGR_PER_ID'
          + ' AND g.PER_UNT_ID = b.AGR_PER_UNT_ID'
          + ' LEFT JOIN REF$PAJAK h ON h.PJK_ID = b.AGR_PJK_ID'
          + ' AND h.PJK_UNT_ID = b.AGR_PJK_UNT_ID'
          + ' WHERE c.AGRJDWL_ID = ' + IntToStr(FAgreementJadwalID)
          + ' AND c.AGRJDWL_INV_NO = ' + QuotedStr(edtInvoiceNo.Text)
//          + ' AND c.AGRJDWL_UNT_ID = ' + IntToStr(MasterNewUnit.ID);

//    dmReportNew.EksekusiReport('frFakturPajakAgreement', s, s2, False, 8);

  finally
    Self.Enabled := True;
  end;

end;

function TfrmFakturPajakAgreement.GetPajakNo(aID : Integer; aUnitID : Integer):
    string;
var
  s: string;
begin
  // TODO -cMM: TfrmFakturPajakAgreement.GetPajakNo default body inserted
  Result := '';
  s := 'Select AGRJDWL_PAJAK_NO FROM AGREEMENT_JADWAL'
     + ' WHERE AGRJDWL_ID = ' + IntToStr(aID)
     + ' AND AGRJDWL_UNT_ID = ' + IntToStr(aUnitID);
//  with copenquery(s) do
//  begin
//    Try
//      if not Eof then Result := FieldByName('AGRJDWL_PAJAK_NO').AsString;
//
//    Finally
//      Free;
//    End
//  end;
end;

procedure TfrmFakturPajakAgreement.edbInvoiceScheduleClickBtn(
  Sender: TObject);
begin
  inherited;
//  edtNoSeri.Text := GetPajakNo(FAgreementJadwalID, MasterNewUnit.ID);
end;

end.
