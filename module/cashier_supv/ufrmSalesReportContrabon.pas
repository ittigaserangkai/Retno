unit ufrmSalesReportContrabon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, cxButtons, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, cxTextEdit, cxMaskEdit,
  cxCalendar, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, System.Actions, Vcl.ActnList,
  ufraFooter4Button, cxLabel, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC;

type
  TfrmSalesReportContrabon = class(TfrmMasterBrowse)
    pnlTop: TPanel;
    lbl3: TLabel;
    cbpSuplierCodeFrom: TcxExtLookupComboBox;
    edtsuplierNameFrom: TEdit;
    lbl4: TLabel;
    lbl5: TLabel;
    cbpSuplierCodeTo: TcxExtLookupComboBox;
    edtSuplierCodeTo: TEdit;
    pnlMiddle: TPanel;
    grp1: TGroupBox;
    lbl6: TLabel;
    chkAll: TCheckBox;
    cbbtipe1: TComboBox;
    cxgrdSupplier: TcxGrid;
    grdSupplier: TcxGridDBTableView;
    grdlvlSupplier: TcxGridLevel;
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actExportExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure cbpSuplierCodeFromKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbpSuplierCodeToKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbpSuplierCodeToKeyPress(Sender: TObject; var Key: Char);
    procedure cbpSuplierCodeFromKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure dtTglFromKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtTglToKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridListSuplierRowChanging(Sender: TObject; OldRow,
      NewRow: Integer; var Allow: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbpSuplierCodeFromExit(Sender: TObject);
    procedure cbpSuplierCodeToExit(Sender: TObject);
    procedure chkAllClick(Sender: TObject);
  private
    function GetSQLDetilContrabonSalesBySupCode(aSupCode: String; aDtAwal:
        TDateTime; aDtAkhir: TDateTime): string;
    function GetSQLDetilContrabonSalesBySupCodeList(aSupCOdeFrom: string;
        aSupCodeTo: string; aDtAwal: TDateTime; aDtAkhir: TDateTime; aHeader :
        string =''): string;
    function GetSQLRptContrabonByDateAndSuplier(aSupCOdeFrom: string; aSupCodeTo:
        string; aDtAwal: TDateTime; aDtAkhir: TDateTime; aHeader : string =''):
        string;
    function GetSQLSuplier(aSupCode: String =''): string;
    procedure ParseComboSuplier(cbplus:TcxExtLookupComboBox; aSql: string);
    procedure ParseDataSalesContrabon;
    procedure ParseDataSalesContrabonDetilBySupCode(ACode: string);
  public
    procedure LoadDatatipe;
  end;

var
  frmSalesReportContrabon: TfrmSalesReportContrabon;

implementation

uses  uTSCommonDlg, uConstanta, uDMReport, uAppUtils;

{$R *.dfm}
const
{No
Suplier Code
Suplier Name
Gross Sales
Disc. Amount
Tax Amount
Net Sales
Total Sales
}
  _kolNo      : Integer = 0;
  _kolSupCode : Integer = 1;
  _kolSupNm   : Integer = 2;
  _kolAmount  : Integer = 3;
  _kolDisc    : Integer = 4;
  _kolTax     : Integer = 5;
  _kolNet     : Integer = 6;
  _kolTot     : Integer = 7;
{
No
Product Code
Product Name
UOM
Qty
Unit Price
Gross Sales
Disc. Amount
Tax Amount
Net Sales
Total sales
}
  _kolDNo     : Integer = 0;
  _kolDPLU    : Integer = 1;
  _kolDPluNm  : Integer = 2;
  _kolDUom    : Integer = 3;
  _kolDQty    : Integer = 4;
  _kolDPrice  : Integer = 5;
  _kolDGross  : Integer = 6;
  _kolDDisc   : Integer = 7;
  _kolDTax    : Integer = 8;
  _kolDNet    : Integer = 9;
  _kolDTot    : Integer = 10;


procedure TfrmSalesReportContrabon.actAddExecute(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
  {
  sSQL  := GetSQLRptContrabonByDateAndSuplier(cbpSuplierCodeFrom.Text,
        cbpSuplierCodeTo.Text, dtAwalFilter.Date, dtAkhirFilter.Date,
        GetCompanyHeader(FLoginFullname, MasterNewUnit.Nama,
        dtTglFrom.Date, dtTglTo.Date));

  dmReportNew.EksekusiReport('frCetakRekapSalesContrabon', sSQL, '', True);
  }
end;

procedure TfrmSalesReportContrabon.actEditExecute(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
  {sSQL  := GetSQLDetilContrabonSalesBySupCodeList(cbpSuplierCodeFrom.Text,
          cbpSuplierCodeTo.Text, dtAwalFilter.Date, dtAkhirFilter.Date,
          GetCompanyHeader(FLoginFullname, MasterNewUnit.Nama,
          dtTglFrom.Date, dtTglTo.Date));

  dmReportNew.EksekusiReport('frCetakSalesContrabon', sSQL, '', True);
  }

end;

procedure TfrmSalesReportContrabon.actExportExecute(Sender: TObject);
var
  aLlow: Boolean;
  i: Integer;
  FSaveDlg : TSaveDialog;
begin
  inherited;

   FSaveDlg := TSaveDialog.Create(Self);
   FSaveDlg.Filter := 'File Excel|*.XLS';
   FSaveDlg.DefaultExt := 'XLS';
   {
  self.Enabled := False;
  try
    if FSaveDlg.Execute then
    begin
      cShowWaitWindow();
      try
        SaveXLS(strgGridListSuplier, FSaveDlg.FileName, '');

        for i := strgGridListSuplier.FixedRows to strgGridListSuplier.RowCount - 1 do
        begin
          cShowWaitWindow('Export kode suplier '+ strgGridListSuplier.Cells[_kolSupCode, i]);
          strgGridListSuplierRowChanging(nil,i, i, aLlow);
          SaveXLS(strgGrid, FSaveDlg.FileName, strgGridListSuplier.Cells[_kolSupCode, i]);
        end;

      finally
         cCloseWaitWindow;
      end;

       CommonDlg.ShowMessage('Sukses simpan Excel!!');

    end;
  Finally
    FSaveDlg.Free;
    Self.Enabled := True;
  end;
  }
end;

procedure TfrmSalesReportContrabon.actRefreshExecute(Sender: TObject);
begin
  inherited;
  if (dtAwalFilter.Text <> '  /  /    ') and
     (dtAkhirFilter.Text <> '  /  /    ') and
     (cbpSuplierCodeFrom.Text <> '') and
     (cbpSuplierCodeTo.Text <> '') then
  begin
    ParseDataSalesContrabon;
    actAdd.Enabled := True;
    actEdit.Enabled := True;
//    ParseDataSalesContrabonDetilBySupCode(strgGridListSuplier.Cells[_kolSupCode, 1]);
  end
  else
    CommonDlg.ShowError('Date From, Date To, Suplier From, and Suplier To ' + ER_EMPTY);
end;

procedure TfrmSalesReportContrabon.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmSalesReportContrabon.FormDestroy(Sender: TObject);
begin
  inherited;
  frmSalesReportContrabon := nil;
  frmSalesReportContrabon.Free;
end;


procedure TfrmSalesReportContrabon.cbpSuplierCodeFromKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
{  if (StrLength(cbpSuplierCodeFrom.Value) = 1) then
    ParseComboSuplier(cbpSuplierCodeFrom, GetSQLSuplier(cbpSuplierCodeFrom.Text));

  if (Key = VK_RETURN) then
  begin
    edtsuplierNameFrom.Text := cbpSuplierCodeFrom.Cells[2, cbpSuplierCodeFrom.Row];
    cbpSuplierCodeTo.SetFocus;
  end;
  }
end;

procedure TfrmSalesReportContrabon.cbpSuplierCodeToKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  {if (StrLength(cbpSuplierCodeTo.Value) = 1) then
    ParseComboSuplier(cbpSuplierCodeTo, GetSQLSuplier(cbpSuplierCodeTo.Text));

  if (Key = VK_RETURN) then
  begin
    edtSuplierCodeTo.Text := cbpSuplierCodeTo.Cells[2, cbpSuplierCodeTo.Row];
    btnView.SetFocus;
  end;
  }
end;

procedure TfrmSalesReportContrabon.cbpSuplierCodeToKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  Key := UpCase(Key);
end;

procedure TfrmSalesReportContrabon.cbpSuplierCodeFromKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  Key := UpCase(Key);
end;

procedure TfrmSalesReportContrabon.FormShow(Sender: TObject);
begin
  inherited;
  dtAwalFilter.SetFocus;
  ParseComboSuplier(cbpSuplierCodeFrom, GetSQLSuplier(cbpSuplierCodeFrom.Text));
  ParseComboSuplier(cbpSuplierCodeTo, GetSQLSuplier(cbpSuplierCodeTo.Text));
  LoadDatatipe;
end;

procedure TfrmSalesReportContrabon.dtTglFromKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
    dtAkhirFilter.SetFocus;
end;

procedure TfrmSalesReportContrabon.dtTglToKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
    cbpSuplierCodeFrom.SetFocus;
end;


procedure TfrmSalesReportContrabon.ParseDataSalesContrabon;
var
  j: Integer;
  i: Integer;
begin
  {
  with strgGridListSuplier do
  begin
    with cOpenQuery(GetSQLRptContrabonByDateAndSuplier(cbpSuplierCodeFrom.Text,
        cbpSuplierCodeTo.Text, dtTglFrom.Date, dtTglTo.Date)) do
    begin
      try
        i := FixedRows;
        if not IsEmpty then
        begin
          Last;
          RowCount := RecordCount + FixedRows;
          First;

          j := 1;
          while not Eof do
          begin
            Cells[_kolNo, i]      := IntToStr(j);
            Cells[_kolSupCode, i] := FieldByName('SUP_CODE').AsString;
            Cells[_kolSupNm, i]   := FieldByName('SUP_NAME').AsString;
            Cells[_kolAmount, i]  := FieldByName('AMOUNT').AsString;
            Cells[_kolDisc, i]    := FieldByName('AMOUNT_DISC').AsString;
            Cells[_kolTax, i]     := FieldByName('TAX_AMOUNT').AsString;
            Cells[_kolNet, i]     := FieldByName('NET_SALES').AsString;
            Cells[_kolTot, i]     := FieldByName('TOTAL_SALES').AsString;

            Inc(i);
            Inc(j);
            Next;
          end;
        end
        else
        begin
          RowCount := 2;
          Cells[_kolNo, i]      := '';
          Cells[_kolSupCode, i] := '';
          Cells[_kolSupNm, i]   := '';
          Cells[_kolAmount, i]  := '';
          Cells[_kolDisc, i]    := '';
          Cells[_kolTax, i]     := '';
          Cells[_kolNet, i]     := '';
          Cells[_kolTot, i]     := '';

        end;

        AutoSize := True;
        FixedRows := 1;

      finally
        Free;
      end
    end;
  end;
  }
end;

procedure TfrmSalesReportContrabon.ParseDataSalesContrabonDetilBySupCode(
  ACode: string);
var
  j: Integer;
    i: Integer;
begin
  {
  with strgGrid do
  begin
    with cOpenQuery(GetSQLDetilContrabonSalesBySupCode(ACode, dtTglFrom.Date, dtTglTo.Date)) do
    begin
      try
        i := FixedRows;
        if not IsEmpty then
        begin
          Last;
          RowCount := RecordCount + FixedRows;
          First;

          j := 1;
          while not Eof do
          begin
            Cells[_kolDNo, i]     := IntToStr(j);
            Cells[_kolDPLU, i]    := FieldByName('BRG_CODE').AsString;
            Cells[_kolDPluNm, i]  := FieldByName('BRG_ALIAS').AsString;
            Cells[_kolDUom, i]    := FieldByName('UOM').AsString;
            Cells[_kolDQty, i]    := FieldByName('QTY').AsString;
            Cells[_kolDPrice, i]  := FieldByName('UNIT_PRICE').AsString;
            Cells[_kolDGross, i]  := FieldByName('GROSS_SALES').AsString;
            Cells[_kolDDisc, i]   := FieldByName('AMOUNT_DISC').AsString;
            Cells[_kolDTax, i]    := FieldByName('TAX_AMOUNT').AsString;
            Cells[_kolDNet, i]    := FieldByName('NET_SALES').AsString;
            Cells[_kolDTot, i]    := FieldByName('TOTAL_SALES').AsString;

            Inc(i);
            Inc(j);
            Next;
          end;
        end
        else
        begin
          RowCount := 2;
          Cells[_kolDNo, i]     := '';
          Cells[_kolDPLU, i]    := '';
          Cells[_kolDPluNm, i]  := '';
          Cells[_kolDUom, i]    := '';
          Cells[_kolDQty, i]    := '';
          Cells[_kolDPrice, i]  := '';
          Cells[_kolDGross, i]  := '';
          Cells[_kolDDisc, i]   := '';
          Cells[_kolDTax, i]    := '';
          Cells[_kolDNet, i]    := '';
          Cells[_kolDTot, i]    := '';
        end;
      finally
        Free;
      end;

    end;
    AutoSize := True;
    FixedRows := 1;
  end;
  }
end;

procedure TfrmSalesReportContrabon.strgGridListSuplierRowChanging(
  Sender: TObject; OldRow, NewRow: Integer; var Allow: Boolean);
begin
  inherited;
//  ParseDataSalesContrabonDetilBySupCode(strgGridListSuplier.Cells[_kolSupCode, NewRow]);
end;


procedure TfrmSalesReportContrabon.FormKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//  inherited;
  if(Key = Ord('D')) and (ssctrl in Shift) then      //dulunya blm ada shortcut
    actEditExecute(sender)
  else if(Key = Ord('S')) and (ssctrl in Shift) then      //dulunya blm ada shortcut
    actAddExecute(sender)
  else if(Key = Ord('C')) and (ssctrl in Shift) then      //dulunya blm ada shortcut
    actEditExecute(sender);

end;

function TfrmSalesReportContrabon.GetSQLDetilContrabonSalesBySupCode(aSupCode:
    String; aDtAwal: TDateTime; aDtAkhir: TDateTime): string;
var
cfilter2:string;
begin
  cfilter2:='';
  if chkAll.Checked= False then
    begin
    if cbbtipe1.ItemIndex = 0 then
       cfilter2:=' and TRANSD.TRANSD_TPBRG_ID = 2'
    else
    if cbbtipe1.ItemIndex= 1 then
       cfilter2:=' and TRANSD.TRANSD_TPBRG_ID = 3';
    end
   else
       cfilter2:=' and TRANSD.TRANSD_TPBRG_ID in (2,3)';

  Result := 'SELECT BRG.BRG_CODE, BRG.BRG_NAME,BRG.BRG_ALIAS, BHJ.BHJ_SAT_CODE AS UOM,'
      + ' TRANSD.TRANSD_QTY AS QTY, TRANSD.TRANSD_SELL_PRICE AS UNIT_PRICE,'
      + ' SUM((TRANSD.TRANSD_QTY * TRANSD.TRANSD_SELL_PRICE)) AS GROSS_SALES,'
      + ' SUM(DIF(TRANSD.TRANSD_SELL_PRICE_DISC - TRANSD.TRANSD_SELL_PRICE,TRANSD.TRANSD_SELL_PRICE_DISC - TRANSD.TRANSD_SELL_PRICE,0)) AS AMOUNT_DISC,'
//      + ' SUM(((TRANSD.TRANSD_QTY * TRANSD.TRANSD_SELL_PRICE) * 0.1)) AS TAX_AMOUNT, '
      + ' SUM((PJK.PJK_PPN * TRANSD.TRANSD_QTY * TRANSD.TRANSD_SELL_PRICE_DISC) / 100) AS TAX_AMOUNT,'
      + ' SUM(((TRANSD.TRANSD_QTY * TRANSD.TRANSD_SELL_PRICE) - '
      + ' DIF(TRANSD.TRANSD_SELL_PRICE_DISC - TRANSD.TRANSD_SELL_PRICE,TRANSD.TRANSD_SELL_PRICE_DISC - TRANSD.TRANSD_SELL_PRICE,0))) AS NET_SALES, '
      + ' SUM((((TRANSD.TRANSD_QTY * TRANSD.TRANSD_SELL_PRICE) * 0.1) + '
      + ' ((TRANSD.TRANSD_QTY * TRANSD.TRANSD_SELL_PRICE) - '
      + ' DIF(TRANSD.TRANSD_SELL_PRICE_DISC - TRANSD.TRANSD_SELL_PRICE,TRANSD.TRANSD_SELL_PRICE_DISC - TRANSD.TRANSD_SELL_PRICE,0)))) AS TOTAL_SALES '
      + ' FROM TRANSAKSI_DETIL TRANSD '
      + ' LEFT JOIN BARANG_HARGA_JUAL BHJ ON BHJ.BHJ_ID = TRANSD.TRANSD_BHJ_ID '
      + ' AND BHJ.BHJ_UNT_ID = TRANSD.TRANSD_BHJ_UNT_ID AND BHJ.BHJ_BRG_CODE = TRANSD.TRANSD_BRG_CODE '
      + ' LEFT JOIN BARANG BRG ON BRG.BRG_CODE = BHJ.BHJ_BRG_CODE '
      + ' LEFT JOIN BARANG_SUPLIER BRGSUP ON BRGSUP.BRGSUP_BRG_CODE = BRG.BRG_CODE '
      + ' LEFT JOIN SUPLIER SUP ON SUP.SUP_CODE = BRGSUP.BRGSUP_SUP_CODE '
      + ' LEFT JOIN REF$PAJAK PJK ON PJK.PJK_ID = BRG.BRG_PJK_ID'
      + ' LEFT JOIN TRANSAKSI TRANS ON TRANS.TRANS_NO = TRANSD.TRANSD_TRANS_NO '
      + ' AND TRANS.TRANS_UNT_ID = TRANSD.TRANSD_TRANS_UNT_ID '
      + ' WHERE SUP.SUP_CODE = '+ QuotedStr(aSupCode)
      + ' AND TRANSD.TRANSD_UNT_ID = '+ IntToStr(MasterNewUnit)
      + cfilter2
      + ' AND TRANS.TRANS_DATE >= '+ TAppUtils.QuotD(aDtAwal)
      + ' AND TRANS.TRANS_DATE <= '+ TAppUtils.QuotD(aDtAkhir, True)
      + ' GROUP BY BRG.BRG_CODE, BRG.BRG_NAME,BRG.BRG_ALIAS, BHJ.BHJ_SAT_CODE, '
      + ' TRANSD.TRANSD_QTY, TRANSD.TRANSD_SELL_PRICE ';
end;

function TfrmSalesReportContrabon.GetSQLDetilContrabonSalesBySupCodeList(
    aSupCOdeFrom: string; aSupCodeTo: string; aDtAwal: TDateTime; aDtAkhir:
    TDateTime; aHeader : string =''): string;
var
cfilter2:string;
begin
  cfilter2:='';
  if chkAll.Checked= False then
    begin
    if cbbtipe1.ItemIndex = 0 then
       cfilter2:=' and TRANSD.TRANSD_TPBRG_ID = 2'
    else
    if cbbtipe1.ItemIndex= 1 then
       cfilter2:=' and TRANSD.TRANSD_TPBRG_ID = 3';
    end
   else
       cfilter2:=' and TRANSD.TRANSD_TPBRG_ID in (2,3)';
  Result := 'SELECT ' + aHeader
      + ' SUP.SUP_CODE, SUP.SUP_NAME, BRG.BRG_CODE, BRG.BRG_ALIAS AS BRG_NAME, BHJ.BHJ_SAT_CODE AS UOM,'
      + ' SUM(TRANSD.TRANSD_QTY) AS QTY, TRANSD.TRANSD_SELL_PRICE AS UNIT_PRICE,'
      + ' SUM(TRANSD.TRANSD_TOTAL) AS GROSS_SALES,'
//      + ' SUM(TRANSD.TRANSD_TOTAL * DIF(TRANSD.TRANSD_SELL_PRICE_DISC - TRANSD.TRANSD_SELL_PRICE, TRANSD.TRANSD_SELL_PRICE_DISC - TRANSD.TRANSD_SELL_PRICE, 0)) AS AMOUNT_DISC,'
      + ' SUM(DIF(TRANSD.TRANSD_SELL_PRICE_DISC - TRANSD.TRANSD_SELL_PRICE,TRANSD.TRANSD_SELL_PRICE_DISC - TRANSD.TRANSD_SELL_PRICE,0)) AS AMOUNT_DISC,'
//      + ' SUM((PJK.PJK_PPN * TRANSD.TRANSD_TOTAL) / 100) AS TAX_AMOUNT,'
      + ' SUM((PJK.PJK_PPN * TRANSD.TRANSD_QTY * TRANSD.TRANSD_SELL_PRICE_DISC) / 100) AS TAX_AMOUNT,'
//      + ' (SUM(TRANSD.TRANSD_TOTAL) - SUM(DIF(TRANSD.TRANSD_SELL_PRICE_DISC - TRANSD.TRANSD_SELL_PRICE, TRANSD.TRANSD_SELL_PRICE_DISC - TRANSD.TRANSD_SELL_PRICE, 0))) AS NET_SALES,'
      + ' SUM(((TRANSD.TRANSD_QTY * TRANSD.TRANSD_SELL_PRICE) - DIF(TRANSD.TRANSD_SELL_PRICE_DISC - TRANSD.TRANSD_SELL_PRICE,TRANSD.TRANSD_SELL_PRICE_DISC - TRANSD.TRANSD_SELL_PRICE,0))) AS NET_SALES,'
//      + ' (SUM((DIF(PJK.PJK_PPN, PJK.PJK_PPN, 0) * TRANSD.TRANSD_TOTAL) / 100) +'
//      + ' (SUM(TRANSD.TRANSD_TOTAL) - SUM(DIF(TRANSD.TRANSD_SELL_PRICE_DISC - TRANSD.TRANSD_SELL_PRICE, TRANSD.TRANSD_SELL_PRICE_DISC - TRANSD.TRANSD_SELL_PRICE, 0)))) AS TOTAL_SALES,'
      + ' SUM((((TRANSD.TRANSD_QTY * TRANSD.TRANSD_SELL_PRICE) * PJK.PJK_PPN /100) + ((TRANSD.TRANSD_QTY * TRANSD.TRANSD_SELL_PRICE) - DIF(TRANSD.TRANSD_SELL_PRICE_DISC -'
      + '     TRANSD.TRANSD_SELL_PRICE,TRANSD.TRANSD_SELL_PRICE_DISC - TRANSD.TRANSD_SELL_PRICE,0)))) AS TOTAL_SALES,'
      + ' ((SUM(TRANSD.TRANSD_TOTAL) - SUM(DIF(TRANSD.TRANSD_SELL_PRICE_DISC - TRANSD.TRANSD_SELL_PRICE, TRANSD.TRANSD_SELL_PRICE_DISC - TRANSD.TRANSD_SELL_PRICE, 0))) / '
      + ' (SUM((DIF(PJK.PJK_PPN, PJK.PJK_PPN, 0) * TRANSD.TRANSD_TOTAL) / 100) + '
      + ' (SUM(TRANSD.TRANSD_TOTAL) - SUM(DIF(TRANSD.TRANSD_SELL_PRICE_DISC - TRANSD.TRANSD_SELL_PRICE, TRANSD.TRANSD_SELL_PRICE_DISC - TRANSD.TRANSD_SELL_PRICE, 0))))) AS PERSENTASE '
      + ' FROM TRANSAKSI_DETIL TRANSD '
      + ' LEFT JOIN BARANG_HARGA_JUAL BHJ ON BHJ.BHJ_ID = TRANSD.TRANSD_BHJ_ID '
      + ' AND BHJ.BHJ_ID = TRANSD.TRANSD_BHJ_ID '
      + ' LEFT JOIN BARANG BRG ON BRG.BRG_CODE = BHJ.BHJ_BRG_CODE '
      + ' LEFT JOIN BARANG_SUPLIER BRGSUP ON BRGSUP.BRGSUP_BRG_CODE = BRG.BRG_CODE '
      + ' LEFT JOIN SUPLIER SUP ON SUP.SUP_CODE = BRGSUP.BRGSUP_SUP_CODE '
      + ' LEFT JOIN REF$PAJAK PJK ON PJK.PJK_ID = BRG.BRG_PJK_ID '
      + ' LEFT JOIN TRANSAKSI TRANS ON TRANS.TRANS_NO = TRANSD.TRANSD_TRANS_NO '
      + ' AND TRANS.TRANS_UNT_ID = TRANSD.TRANSD_TRANS_UNT_ID '
      + ' WHERE SUP.SUP_CODE >= '+ QuotedStr(aSupCOdeFrom)
      + ' AND SUP.SUP_CODE <= '+ QuotedStr(aSupCodeTo)
      + ' AND TRANS.TRANS_DATE >= '+ TAppUtils.QuotD(aDtAwal)
      + ' AND TRANS.TRANS_DATE <= '+ TAppUtils.QuotD(aDtAkhir, True)
      + ' AND TRANSD.TRANSD_UNT_ID = '+ IntToStr(MasterNewUnit)
      + cfilter2
      + ' GROUP BY SUP.SUP_CODE, SUP.SUP_NAME, BRG.BRG_CODE, BRG.BRG_ALIAS,'
      + ' BHJ.BHJ_SAT_CODE, TRANSD.TRANSD_SELL_PRICE '
      + ' ORDER BY SUP.SUP_CODE '
end;

function TfrmSalesReportContrabon.GetSQLRptContrabonByDateAndSuplier(
    aSupCOdeFrom: string; aSupCodeTo: string; aDtAwal: TDateTime; aDtAkhir:
    TDateTime; aHeader : string =''): string;
var
  sSQL: string;
  cfilter:string;
begin
  cfilter:='';
  if chkAll.Checked= False then
    begin
    if cbbtipe1.ItemIndex = 0 then
       cfilter:=' and TRANSD.TRANSD_TPBRG_ID = 2'
    else
    if cbbtipe1.ItemIndex= 1 then
       cfilter:=' and TRANSD.TRANSD_TPBRG_ID = 3';
    end
   else
       cfilter:=' and TRANSD.TRANSD_TPBRG_ID in (2,3)';


  sSQL := 'SELECT '+ aHeader
    + ' SUP.SUP_CODE, SUP.SUP_NAME, SUM(TRANSD.TRANSD_TOTAL) AS AMOUNT,'
    + ' SUM(DIF(TRANSD.TRANSD_SELL_PRICE_DISC - TRANSD.TRANSD_SELL_PRICE,TRANSD.TRANSD_SELL_PRICE_DISC - TRANSD.TRANSD_SELL_PRICE,0)) AS AMOUNT_DISC,'
    + ' SUM((DIF(PJK.PJK_PPN, PJK.PJK_PPN, 0) * TRANSD.TRANSD_TOTAL) / 100) AS TAX_AMOUNT,'
    + ' (SUM(TRANSD.TRANSD_TOTAL) - SUM(DIF(TRANSD.TRANSD_SELL_PRICE_DISC - TRANSD.TRANSD_SELL_PRICE,TRANSD.TRANSD_SELL_PRICE_DISC - TRANSD.TRANSD_SELL_PRICE,0))) AS NET_SALES,'
    + ' (SUM((DIF(PJK.PJK_PPN, PJK.PJK_PPN, 0) * TRANSD.TRANSD_TOTAL) / 100) +'
    + ' (SUM(TRANSD.TRANSD_TOTAL) - SUM(DIF(TRANSD.TRANSD_SELL_PRICE_DISC - TRANSD.TRANSD_SELL_PRICE,TRANSD.TRANSD_SELL_PRICE_DISC - TRANSD.TRANSD_SELL_PRICE,0)))) AS TOTAL_SALES,'
    + ' ((SUM(TRANSD.TRANSD_TOTAL) - SUM(DIF(TRANSD.TRANSD_SELL_PRICE_DISC - TRANSD.TRANSD_SELL_PRICE,TRANSD.TRANSD_SELL_PRICE_DISC - TRANSD.TRANSD_SELL_PRICE,0))) /'
    + ' (SUM((DIF(PJK.PJK_PPN, PJK.PJK_PPN, 0) * TRANSD.TRANSD_TOTAL) / 100) +'
    + ' (SUM(TRANSD.TRANSD_TOTAL) - SUM(DIF(TRANSD.TRANSD_SELL_PRICE_DISC - TRANSD.TRANSD_SELL_PRICE,TRANSD.TRANSD_SELL_PRICE_DISC - TRANSD.TRANSD_SELL_PRICE,0))))) AS PERSENTASE'
    + ' FROM TRANSAKSI_DETIL TRANSD '
    + ' LEFT JOIN BARANG_HARGA_JUAL BHJ ON BHJ.BHJ_ID = TRANSD.TRANSD_BHJ_ID '
    + ' AND BHJ.BHJ_UNT_ID = TRANSD.TRANSD_BHJ_UNT_ID '
    + ' LEFT JOIN BARANG BRG ON BRG.BRG_CODE = BHJ.BHJ_BRG_CODE '
    + ' LEFT JOIN BARANG_SUPLIER BRGSUP ON BRGSUP.BRGSUP_BRG_CODE = BRG.BRG_CODE '
    + ' LEFT JOIN SUPLIER SUP ON SUP.SUP_CODE = BRGSUP.BRGSUP_SUP_CODE '
    + ' LEFT JOIN REF$PAJAK PJK ON PJK.PJK_ID = BRG.BRG_PJK_ID '
    + ' LEFT JOIN TRANSAKSI TRANS ON TRANS.TRANS_NO = TRANSD.TRANSD_TRANS_NO '
    + ' AND TRANS.TRANS_UNT_ID = TRANSD.TRANSD_TRANS_UNT_ID '
    + ' WHERE '
    + ' SUP.SUP_CODE >= '+ QuotedStr(aSupCOdeFrom)
    + ' AND SUP.SUP_CODE <= '+ QuotedStr(aSupCodeTo)
    + cfilter
    + ' AND TRANS.TRANS_DATE >= '+ TAppUtils.QuotD(aDtAwal)
    + ' AND TRANS.TRANS_DATE <= '+ TAppUtils.QuotD(aDtAkhir, True)
    + ' AND TRANSD.TRANSD_UNT_ID = '+ IntToStr(MasterNewUnit)
    + ' GROUP BY SUP.SUP_CODE, SUP.SUP_NAME ';

  Result := sSQL;
end;

function TfrmSalesReportContrabon.GetSQLSuplier(aSupCode: String =''): string;
begin
  aSupCode := trim(aSupCode);
  if aSupCode = '' then
    aSupCode := 'A%'
  else
    aSupCode := aSupCode + '%';

  Result := 'SELECT SUP_CODE, SUP_NAME FROM SUPLIER'
        + ' WHERE SUP_CODE LIKE '+ QuotedStr(aSupCode);
end;

procedure TfrmSalesReportContrabon.cbpSuplierCodeFromExit(Sender: TObject);
begin
  inherited;
//  edtsuplierNameFrom.Text := cbpSuplierCodeFrom.Cells[2, cbpSuplierCodeFrom.Row];
  cbpSuplierCodeTo.SetFocus;
end;

procedure TfrmSalesReportContrabon.cbpSuplierCodeToExit(Sender: TObject);
begin
  inherited;
//  edtSuplierCodeTo.Text := cbpSuplierCodeTo.Cells[2, cbpSuplierCodeTo.Row];
  btnSearch.SetFocus;
end;


procedure TfrmSalesReportContrabon.ParseComboSuplier(cbplus:TcxExtLookupComboBox;
    aSql: string);
var
    i: Integer;
begin
  {
  with cbplus do
  begin
    ClearGridData;

    with cOpenQuery(aSql) do
    begin
      try
        if not IsEmpty then
        begin
          Last;
          RowCount := RecordCount + 1;
          First;
          AddRow(['Id', 'Suplier Code', 'Suplier Name']);

          i := 1;
          while not Eof do
          begin
            AddRow([IntToStr(i),
              FieldByName('SUP_CODE').AsString,
              FieldByName('SUP_NAME').AsString]);

            Inc(i);
            Next;
          end;
        end
        else
        begin
          RowCount := 2;
          AddRow(['Id', 'Suplier Code', 'Suplier Name']);
          AddRow(['1', ' ', ' ']);
        end;

      finally
        Free;
      end;
    end;
    FixedRows := 1;
    SizeGridToData;
    Text := Value;
  end;
  }
end;

procedure TfrmSalesReportContrabon.chkAllClick(Sender: TObject);
begin
  inherited;
  if chkAll.Checked= True then
    begin
      cbbTipe1.Text:='All';
      cbbTipe1.Enabled:=False;
    end
   else
      cbbTipe1.Enabled:=True;
end;

procedure TfrmSalesReportContrabon.LoadDatatipe;
var
  sSQL: string;
begin
  sSQL := 'select tpbrg_id,tpbrg_name from ref$tipe_BARANG where tpbrg_id in (2,3)';
//  cQueryToComboObject(cbbtipe1, sSQL);
end;
end.






