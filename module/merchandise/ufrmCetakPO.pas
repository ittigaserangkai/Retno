unit ufrmCetakPO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, Mask, StdCtrls, ExtCtrls, ActnList, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, AdvUtil,
  cxButtonEdit, System.Actions, ufraFooter4Button, cxButtons, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxPC;

type
  TfrmCetakPO = class(TfrmMasterBrowse)
    pnlTop: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    edtNoPO1: TEdit;
    edtNoPO2: TEdit;
    btnShowPO: TcxButtonEdit;
    edtNamaSuplier: TEdit;
    Label1: TLabel;
    cbpMerchandCode: TComboBox;
    chkMerchandize: TCheckBox;
    chkReprint: TCheckBox;
    edtDd: TEdit;
    edtMm: TEdit;
    edtYy: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    CbpKodeSuplier: TcxButtonEdit;
    procedure actPrintExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnShowPOClick(Sender: TObject);
    procedure strgGridCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNoPO1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbpKodeSuplierKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure strgGridGetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
    procedure CbpKodeSuplierClickBtn(Sender: TObject);
    procedure CbpKodeSuplierKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CbpKodeSuplierExit(Sender: TObject);
    procedure chkMerchandizeClick(Sender: TObject);
    procedure edtDdKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

//    FPO : TPO;
    procedure LoadDropDownDataMerchandise;
    procedure ParseGridData();
    procedure ParseHeaderGrid();

  public
    function GetFilterNoPO: string;
    { Public declarations }
  end;

var
  frmCetakPO: TfrmCetakPO;

implementation

uses udmReport, Math, uConstanta, ufrmDialogPrintPreview, uTSCommonDlg, uAppUtils;

const
  _kolPrintDesc = 7;
  _kolPOStatus = 6;
  _kolTotalPurchase = 5;
  _kolValidDate = 4;
  _kolKodeSuplier = 3;
  _kolPODate = 2;
  _kolPONo = 1;
  _kolNo = 0;
  KetCetak : string = ' Cetakan Ulang';

{$R *.dfm}

procedure TfrmCetakPO.actPrintExecute(Sender: TObject);
var
  sKetCetak: string;
  sSQL2: string;
  sJoin: string;
  sKolom: string;
  sSQL: string;
  sFilterNoPO: string;
  sNoBukti: string;
    countI  : Integer;
    chkStatue: Boolean;
    _str_keterangan: string;
  isBookMerchan : boolean;
begin
  inherited;
  {
  isBookMerchan := Trim(getGlobalVar('BOOKS_MERCHANDISE_ID'))=IntToStr(cGetIDfromCombo(cbpMerchandCode));

  try
    for countI := 1 to strgGrid.RowCount-1 do
    begin
      strgGrid.GetCheckBoxState(0,countI,chkStatue);
      if chkStatue then
      with strgGrid do
      begin
          if Trim(Cells[9, countI]) = '' then
            _str_keterangan := 'PO Di-copy 2 Lbr'
          else
            _str_keterangan := Cells[9, countI];

          sNoBukti := Cells[1, countI];

          if FPO.LoadByNoBukti(strgGrid.Cells[_kolPONO, countI],MasterNewUnit.ID) then
          begin
            if not chkReprint.Checked then
            begin
              if not FPO.updateValidDate(cGetServerTime) then
              begin
                cRollbackTrans;
                CommonDlg.ShowMessage('Gagal Update Status PO Menjadi Ordered');
                Exit;
              end;
            end;

            if not (FPO.UpdateStatusPO( 4,FLoginId, FLoginUnitId) and
                  FPO.UpdatePrintDesc(_str_keterangan) and
                  FPO.updatePrintCount)
            then
            begin
              cRollbackTrans;
              CommonDlg.ShowMessage('Gagal Update Status PO Menjadi Ordered');
              Exit;
            end
            else
              cCommitTrans;

          end
          else
          begin
            CommonDlg.ShowMessage('Gagal Load PO Berdasar No. Bukti');
            Exit;
          end;

      end;
    end;

    sFilterNoPO := GetFilterNoPO;
    if isBookMerchan then
    begin


      sSQL := 'SELECT '+ IntToStr(LEAD_TIME) + ' as LeadTime,'
            + Quot(sKetCetak) + ' as CetakanUlang, 1 as isBook,'
            + ' bs.BRGSUP_MARK_UP, a.PO_VALID_DATE, c.SUPMG_LEAD_TIME,'
            + ' d.SUP_IS_PKP,  a.PO_PRINTCOUNT,  a.PO_GR_ALAMAT,'
            + ' au.UNT_NAME as GR_UNIT_NAME,  a.PO_NO, a.PO_DATE, d.SUP_CODE,'
            + ' d.SUP_NAME, e.MERCHANGRUP_CODE, e.MERCHANGRUP_NAME, f.BRG_CODE,'
            + ' f.BRG_NAME, d.sup_address, d.sup_city, d.sup_post_code,'
            + ' d.sup_fax, d.sup_telp, c.supmg_top, f.brg_catalog,'
            + ' f.brg_merk, b.pod_sat_code_order, a.po_desc_print,'
            + ' a.PO_disc,  a.PO_PPN,a.po_ppnbm ,d.SUP_CONTACT_PERSON,'
            + ' (SELECT SUM(pod1.POD_TOTAL_DISC)'
            + ' FROM PO_DETIL pod1'
            + ' WHERE pod1.POD_IS_BKP = 0'
            + ' AND pod1.POD_PO_NO = a.PO_NO '
            + ' and pod1.POD_PO_UNT_ID = a.PO_UNT_ID'
            + ' ) AS BTKP,'
            + ' (SELECT SUM(pod2.POD_TOTAL_DISC)'
            + ' FROM PO_DETIL pod2'
            + ' WHERE pod2.POD_IS_BKP = 1'
            + ' AND pod2.POD_PO_NO = a.PO_NO'
            + ' and pod2.POD_PO_UNT_ID = a.PO_UNT_ID'
            + ' ) AS BKP,'
            + ' h.BHJ_SELL_PRICE, h.BHJ_DISC_NOMINAL,'
            + ' h.BHJ_DISC_PERSEN, i.TPPO_CODE, i.TPPO_NAME,'
            + ' b.*, aau.UNT_NAME, aau.UNT_FAX,'
            + ' aau.UNT_PHONE, Uti.UTI_ADDRESS, Uti.UTI_NPWP'
            + ' FROM PO a'
            + ' inner join PO_DETIL b on a.PO_NO = b.POD_PO_NO'
            + ' and a.PO_UNT_ID = b.POD_UNT_ID'
            + ' and a.PO_NO in ' + sFilterNoPO
            + ' and a.PO_UNT_ID = ' + IntToStr(MasterNewUnit.ID)
            + ' inner join barang_harga_jual h on b.pod_brg_code = h.bhj_brg_code'
            + ' inner join UNIT_INFO Uti on Uti.UTI_UNT_ID = SUBSTR(a.PO_NO, 1,2)'
            + ' inner join SUPLIER_MERCHAN_GRUP c on a.PO_SUPMG_SUB_CODE = c.SUPMG_SUB_CODE'
            + ' inner join SUPLIER d on c.SUPMG_CODE = d.SUP_CODE'
            + ' inner join ref$merchandise_grup e on c.SUPMG_MERCHANGRUP_ID = e.MERCHANGRUP_ID'
            + ' inner join barang f on b.POD_BRG_CODE = f.BRG_CODE'
            + ' inner join BARANG_SUPLIER bs on bs.BRGSUP_BRG_CODE=b.POD_BRG_CODE'
            + ' and BS.BRGSUP_SUP_CODE=c.SUPMG_CODE'
            + ' and h.bhj_tphrg_id = 2'
            + ' inner join REF$TIPE_PO i on a.PO_TPPO_ID = i.TPPO_ID'
            + ' inner join AUT$UNIT au on au.UNT_ID = a.PO_GR_UNT_ID'
            + ' inner join AUT$UNIT aau on aau.UNT_ID = SUBSTR(a.PO_NO, 1,2)'
            + 'order by a.po_date desc, a.PO_NO desc, b.POD_ID';

      sKolom  := ' , ((a.POD_PRICE * a.POD_DISC1/ 100) + ((a.POD_PRICE - (a.POD_PRICE * a.POD_DISC1/ 100)) * a.POD_DISC2 / 100) + a.POD_DISC3) * ( 1 + bs.BRGSUP_MARK_UP - bs.BRGSUP_MARK_UP / 100 ) as adiscTot';
      sJoin   := ' inner join BARANG_SUPLIER bs on bs.BRGSUP_BRG_CODE=a.POD_BRG_CODE'
              + ' and BS.BRGSUP_SUP_CODE=d.SUPMG_CODE';
    end
    else
    begin
      sSQL := 'SELECT ' // + GetCompanyHeader(FLoginFullname,MasterNewUnit.Nama,cGetServerTime, cGetServerTime)
              + IntToStr(LEAD_TIME) + ' as LeadTime,'
              + Quot(sKetCetak) + ' as CetakanUlang,'
              + ' 0 as isBook,'
              + ' a.PO_VALID_DATE, c.SUPMG_LEAD_TIME,'//-7 PO_VALID_DATE, '
              + ' d.SUP_IS_PKP, '
              + ' a.PO_PRINTCOUNT, '
              + ' a.PO_GR_ALAMAT, '
              + ' au.UNT_NAME as GR_UNIT_NAME, '
              + ' a.PO_NO, a.PO_DATE, d.SUP_CODE, d.SUP_NAME, e.MERCHANGRUP_CODE, e.MERCHANGRUP_NAME, f.BRG_CODE, f.BRG_NAME, d.sup_address,'
              + ' d.sup_city, d.sup_post_code, d.sup_fax, d.sup_telp, c.supmg_top, f.brg_catalog, f.brg_merk, b.pod_sat_code_order, a.po_desc_print, a.PO_disc, '
              + ' a.PO_PPN,a.po_ppnbm ,d.SUP_CONTACT_PERSON,'
              + '(SELECT SUM(POD_TOTAL_DISC) FROM PO_DETIL WHERE POD_IS_BKP = 0 AND POD_PO_NO = a.PO_NO) AS BTKP, '
              + '(SELECT SUM(POD_TOTAL_DISC) FROM PO_DETIL WHERE POD_IS_BKP = 1 AND POD_PO_NO = a.PO_NO) AS BKP, '
              + ' i.TPPO_CODE, i.TPPO_NAME,'
              + ' b.*,'
              + ' aau.UNT_NAME, aau.UNT_FAX, aau.UNT_PHONE,'
              + ' Uti.UTI_ADDRESS, Uti.UTI_NPWP '
              + ' FROM PO a, PO_DETIL b, SUPLIER_MERCHAN_GRUP c, SUPLIER d,'
              + ' ref$merchandise_grup e, barang f,'
              + ' AUT$UNIT au, REF$TIPE_PO i, UNIT_INFO Uti, AUT$UNIT aau'
              + ' where a.PO_NO in ' + sFilterNoPO
              + ' and a.PO_UNT_ID = ' + IntToStr(MasterNewUnit.ID)
              + ' and a.PO_NO = b.POD_PO_NO'
              + ' and a.PO_UNT_ID = b.POD_UNT_ID'
              + ' and a.PO_SUPMG_SUB_CODE = c.SUPMG_SUB_CODE'
              + ' and c.SUPMG_CODE = d.SUP_CODE'
              + ' and c.SUPMG_MERCHANGRUP_ID = e.MERCHANGRUP_ID'
              + ' and b.POD_BRG_CODE = f.BRG_CODE'
              + ' and au.UNT_ID = a.PO_GR_UNT_ID'
              + ' and a.PO_TPPO_ID = i.TPPO_ID'
              + ' and Uti.UTI_UNT_ID = SUBSTR(a.PO_NO, 1,2)'
              + ' and aau.UNT_ID = SUBSTR(a.PO_NO, 1,2)'
              + ' order by a.po_date desc, a.PO_NO desc, b.POD_ID';

      skolom :=  ' , ((a.POD_PRICE * a.POD_DISC1/ 100) + ((a.POD_PRICE - (a.POD_PRICE * a.POD_DISC1/ 100)) * a.POD_DISC2 / 100)  + a.POD_DISC3) as adiscTot'
    end;

    sSQL2 := 'Select ' //+  GetExCompanyHeader(cGetServerTime, cGetServerTime, MasterNewUnit.ID,FLoginUsername, FLoginFullname)
        + IntToStr(LEAD_TIME) + ' as LeadTime,'
        + Quot(sKetCetak) + ' as CetakanUlang,'
        + ' c.PO_GR_ALAMAT, '
        + ' au.UNT_NAME as GR_UNIT_NAME, '
        + ' b.POSTORE_UNT_ID, b.POSTORE_QTYORDER as POD_QTY_ORDER,'
        + ' a.POD_PRICE, POD_PPN, POD_PPNBM, au.UNT_ID '
        + ' , (a.POD_PRICE * a.POD_DISC1/ 100) as adisc1'
        + ' , ((a.POD_PRICE - (a.POD_PRICE * a.POD_DISC1/ 100)) * a.POD_DISC2 / 100)  as adisc2'
        + ' , a.POD_DISC3, a.POD_IS_BKP'
        + skolom
        + ' ,PL.UNT_DESCRIPTION as PL_DESC,  PL.UNT_NAME as PL_UNIT_NAME,  c.PO_NO, c.PO_DATE,'
        + ' e.SUP_CODE, e.SUP_NAME, f.MERCHANGRUP_CODE, f.MERCHANGRUP_NAME, g.BRG_CODE,'
        + ' g.BRG_NAME, e.sup_address, e.sup_city, e.sup_post_code, e.sup_fax,'
        + ' e.sup_telp, d.supmg_top, g.brg_catalog, g.brg_merk, a.pod_sat_code_order,'
        + ' c.po_desc_print, c.PO_disc,  c.PO_PPN, c.po_ppnbm ,e.SUP_CONTACT_PERSON,'
        + ' (SELECT SUM((a1.POD_PRICE * a1.POD_DISC1/ 100) + ((a1.POD_PRICE - (a1.POD_PRICE * a1.POD_DISC1/ 100)) * a1.POD_DISC2 / 100)  + a1.POD_DISC3)'
        + ' FROM PO_DETIL a1 WHERE POD_IS_BKP = 0 AND POD_PO_NO = c.PO_NO) AS BTKP'
        + ' , (SELECT SUM((a1.POD_PRICE * a1.POD_DISC1/ 100) + ((a1.POD_PRICE - (a1.POD_PRICE * a1.POD_DISC1/ 100)) * a1.POD_DISC2 / 100)  + a1.POD_DISC3)'
        + ' FROM PO_DETIL a1 WHERE POD_IS_BKP = 1 AND POD_PO_NO = c.PO_NO) AS BKP'
        + ' from PO_DETIL a'
        + ' inner join TPOSTORE b on a.POD_PO_NO = b.PO_NO'
        + ' and a.POD_ID = b.POD_ID'
        + ' and a.POD_UNT_ID = b.UNT_ID'
        + ' and a.POD_PO_NO in ' + sFilterNoPO
        + ' inner join PO c on c.PO_NO = a.POD_PO_NO'
        + ' and c.PO_UNT_ID = a.POD_UNT_ID'
        + ' and c.PO_UNT_ID = ' + IntToStr(MasterNewUnit.ID)
        + ' inner join SUPLIER_MERCHAN_GRUP d on c.PO_SUPMG_SUB_CODE = d.SUPMG_SUB_CODE'
        + ' inner join SUPLIER e on d.SUPMG_CODE = e.SUP_CODE'
        + ' inner join ref$merchandise_grup f on d.SUPMG_MERCHANGRUP_ID = f.MERCHANGRUP_ID'
        + ' inner join barang g on a.POD_BRG_CODE = g.BRG_CODE'
        +  sJoin
        + ' inner join AUT$UNIT au on au.UNT_ID = c.PO_GR_UNT_ID'
        + ' inner join AUT$UNIT PL on PL.UNT_ID = b.POSTORE_UNT_ID'
        + ' order by b.POSTORE_UNT_ID, c.PO_NO, g.BRG_CODE' ;//c.po_date desc'; //b.POSTORE_UNT_ID, a.POD_BRG_CODE

    GetExCompanyHeader(cGetServerTime, cGetServerTime, MasterNewUnit.ID,
                FLoginUsername, FLoginFullname);

    dmReportNew.EksekusiReport('frcetakPO_Fresh', sSQL, '',True,8,0,33);


  finally
    btnShowPOClick(nil);
  end;
  }
end;

procedure TfrmCetakPO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmCetakPO.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'PRINT PURCHASE ORDER';
//  FPO := TPO.Create(Self);
end;

procedure TfrmCetakPO.FormDestroy(Sender: TObject);
begin
  inherited;
  frmCetakPO := nil;
end;

procedure TfrmCetakPO.FormShow(Sender: TObject);
begin
  inherited;
  if (FMasterIsHO <> 1) and (FMasterIsStore <> 0) then
  begin
    CommonDlg.ShowError('Hanya unit merchandise yang bisa membuat PSL!');
    Close;
    exit;
  end;
  LoadDropDownDataMerchandise;
  ParseHeaderGrid;
  CbpKodeSuplier.Text := '';
end;

procedure TfrmCetakPO.ParseGridData();
var
  strDatePo: string;
  dtPo: TDateTime;
  sStatusPo: string;
  sFilterNoPO: string;
  sFilterSuplier: string;
  sFilterMerchan: string;
  sSQL: string;
    countI: Integer;
    separatorDate : Char;
begin
  separatorDate := FormatSettings.DateSeparator;
  FormatSettings.DateSeparator:= '/';

  if (edtDd.Text <> '') and (edtMm.Text <> '') and (edtYy.Text <> '')
  then
  begin
    if (TryEncodeDate(StrToInt(edtYy.Text), StrToInt(edtMm.Text),
        StrToInt(edtDd.Text), dtPo))
    then
      strDatePo := ' and EXTRACTDATE(P.PO_DATE) = '+TAppUtils.QuotD(dtPo)

    else
      CommonDlg.ShowMessage('Imput tanggal salah'+ #13
                            + 'Parameter tanggal diabaikan');
  end;


  if (Trim(cbpMerchandCode.Text) <> '') and (not chkMerchandize.Checked) then
  begin
//    sFilterMerchan := ' AND MG.MERCHANGRUP_MERCHAN_ID = ' + IntToStr(cGetIDfromCombo(cbpMerchandCode));
  end
  else
    sFilterMerchan := '';

  if Trim(CbpKodeSuplier.Text) <> '' then
  begin
    sFilterSuplier := ' AND SMG.SUPMG_CODE = ' + QuotedStr(CbpKodeSuplier.Text) ;
  end
  else
    sFilterSuplier := '';

  if (Trim(edtNoPO1.Text) <> '') and (Trim(edtNoPO2.Text) <> '') then
  begin
    sFilterNoPO := ' AND P.PO_NO >= ' + QuotedStr(edtNoPO1.Text)
                   + ' AND P.PO_NO <= ' + QuotedStr(edtNoPO2.Text);
  end else if Trim(edtNoPO1.Text) <> '' then
    sFilterNoPO := ' AND P.PO_NO = ' + QuotedStr(edtNoPO1.Text)
  else if Trim(edtNoPO2.Text) <> '' then
    sFilterNoPO := ' AND P.PO_NO = ' + QuotedStr(edtNoPO2.Text)
  else
    sFilterNoPO := '';

  if chkReprint.Checked then
    sStatusPo := ' AND P.PO_STAPO_ID = 4'
  else
    sStatusPo := ' AND P.PO_STAPO_ID = 2';



  sSQL := ' SELECT P.PO_NO, P.PO_DATE,SMG.SUPMG_CODE,  P.PO_VALID_DATE,'
        + ' P.PO_TOTAL, P.PO_DISC, P.PO_PPN, P.PO_PPNBM, STA.STAPO_NAME,'
        + ' P.PO_DESC_PRINT'
        + ' FROM PO P'
        + ' inner join REF$STATUS_PO STA on STA.STAPO_ID=P.PO_STAPO_ID'
        + sFilterNoPO
        + sStatusPo
        + strDatePo
        + ' AND P.IS_PO_BONUS = 0'
        + ' inner join SUPLIER_MERCHAN_GRUP SMG on SMG.SUPMG_SUB_CODE=P.PO_SUPMG_SUB_CODE'
        + ' inner join REF$MERCHANDISE_GRUP MG on MG.MERCHANGRUP_ID = SMG.SUPMG_MERCHANGRUP_ID'
        + sFilterSuplier
        + sFilterMerchan
        + ' ORDER BY P.PO_DATE desc';
  {
  ParseHeaderGrid;
  with cOpenQuery(sSQL) do
  begin
      if not Eof then
      begin
        Last;
        strgGrid.RowCount := RecordCount + strgGrid.FixedRows;
        First;
      end;

      countI := strgGrid.FixedRows;
      while not(Eof) do
      begin
        strgGrid.AddCheckBox(_kolNo,countI,False,False);

        strgGrid.Cells[_kolPONo,countI]           := FieldByName('PO_NO').AsString;
        strgGrid.Cells[_kolPODate,countI]         := FormatDateTime('dd-mm-yyyy', FieldByName('PO_DATE').AsDateTime);
        strgGrid.Cells[_kolKodeSuplier,countI]    := FieldByName('SUPMG_CODE').AsString;
        strgGrid.Cells[_kolValidDate,countI]      := FormatDateTime('dd-mm-yyyy',FieldByName('PO_VALID_DATE').AsDateTime);
        strgGrid.Floats[_kolTotalPurchase,countI] := FieldByName('PO_TOTAL').AsFloat
                                          - FieldByName('PO_DISC').AsFloat
                                          + FieldByName('PO_PPN').AsFloat
                                          + FieldByName('PO_PPNBM').AsFloat ;

        strgGrid.Alignments[_kolTotalPurchase, countI]:= taRightJustify;
        strgGrid.Cells[_kolPOStatus,countI]           := FieldByName('STAPO_NAME').AsString;
        strgGrid.Cells[_kolPrintDesc,countI]          := FieldByName('PO_DESC_PRINT').AsString;

        Inc(countI);
        Next;
      end;
      strgGrid.AutoSize := True;

  end;
  FormatSettings.DateSeparator:= separatorDate;

  HapusBarisKosong(strgGrid,_kolPONo);
  }
end;

procedure TfrmCetakPO.btnShowPOClick(Sender: TObject);
begin
  inherited;
  Screen.Cursor := crHourGlass;
  self.Enabled  := False;
  try
    ParseGridData();
  finally
    Screen.Cursor := crDefault;
    self.Enabled  := True;
  end;

end;

procedure TfrmCetakPO.strgGridCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  inherited;
  if ACol in [0, 9] then CanEdit := True
  else CanEdit := False;
end;

procedure TfrmCetakPO.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if(Key = Ord('P'))and(ssctrl in Shift) then
    actPrintExecute(Self);
end;

procedure TfrmCetakPO.edtNoPO1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if(Key = 13) then
  begin
    ParseGridData()
  end;

end;

procedure TfrmCetakPO.cbpKodeSuplierKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := UpCase(Key);
end;

procedure TfrmCetakPO.FormActivate(Sender: TObject);
begin
  inherited;
  frmCetakPO.Caption := 'PRINT PO';
  lblHeader.Caption := 'PRINT PO';
end;

procedure TfrmCetakPO.ParseHeaderGrid();
begin
  {with strgGrid do
  begin
    Clear;
    RowCount  := 2;
    ColCount  := 7;
    FixedRows := 1;

    Cells[_kolNo,0]           := '';
    Cells[_kolPONo,0]         := 'PO NO. / SPB';
    Cells[_kolPODate,0]       := 'PO DATE';
    Cells[_kolKodeSuplier,0]  := 'SUPPLIER CODE';
    Cells[_kolValidDate,0]    := 'PO VALID DATE';
    Cells[_kolTotalPurchase,0]:= 'TOTAL PURCH.';
    Cells[_kolPOStatus,0]     := 'PO STATUS';
    Cells[_kolPrintDesc,0]    := 'PRINT DESCRIPTION';


    AutoSize := True;
  end;
  }
end;

procedure TfrmCetakPO.strgGridGetFloatFormat(Sender: TObject; ACol,
  ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  inherited;
  FloatFormat := '%.2n';
  if ACol in [_kolTotalPurchase] then
    IsFloat := True
  else
    IsFloat := False;
end;

procedure TfrmCetakPO.LoadDropDownDataMerchandise;
var
  sSQL: string;
begin
  sSQL := ' select merchan_id, merchan_Name '
          + ' from ref$merchandise ';
//  cQueryToComboObject(cbpMerchandCode,sSQL);
end;

procedure TfrmCetakPO.CbpKodeSuplierClickBtn(Sender: TObject);
var
  sFromMErchan: string;
  sFilterMerchan: string;
  sSQL: string;
begin
  inherited;
  {
  if cbpMerchandCode.Text <> '' then
  begin
    sFilterMerchan := ' where B.MERCHANGRUP_MERCHAN_ID = ' + IntToStr(cGetIDfromCombo(cbpMerchandCode))
                      + ' AND C.SUPMG_MERCHANGRUP_ID = B.MERCHANGRUP_ID '
                      + ' AND A.SUP_CODE = C.SUPMG_CODE ';
    sFromMErchan := ', REF$MERCHANDISE_GRUP B, SUPLIER_MERCHAN_GRUP C'
  end
  else
  begin
    sFilterMerchan := '';
    sFromMErchan := '';
  end;

  sSQL := ' SELECT A.SUP_CODE, A.SUP_NAME, B.MERCHANGRUP_CODE, B.MERCHANGRUP_NAME '
          + ' FROM SUPLIER A ' + sFromMErchan
          + sFilterMerchan;

  with cLookUp(' Daftar Suplier',sSQL) do
  begin
    try
      cbpKodeSuplier.Text := Strings[0];
      edtNamaSuplier.Text := Strings[1];
    finally
      Free;
    end;
  end;
   }
end;

procedure TfrmCetakPO.CbpKodeSuplierKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
    CbpKodeSuplierExit(nil);
end;

procedure TfrmCetakPO.CbpKodeSuplierExit(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
  sSQL := 'select sup_code, sup_name '
          + ' from suplier '
          + ' where sup_code = ' + QuotedStr(UpperCase(CbpKodeSuplier.Text));
  {
  with cOpenQuery(sSQL) do
  begin
    try
      edtNamaSuplier.Text := fieldByName('sup_name').AsString;
      CbpKodeSuplier.Text := fieldByName('Sup_code').AsString;
    finally
      Free;
    end;
  end;
  }
end;

function TfrmCetakPO.GetFilterNoPO: string;
var
  IsChecked: Boolean;
  i: Integer;
begin
  {Result := '(' + Quot('0xxxxx0') ;
  for i := 1 to strgGrid.RowCount - 1 do
  begin
    strgGrid.GetCheckBoxState(_kolNo, i, IsChecked);
    if IsChecked then
    begin
      Result := Result + ',' + Quot(strgGrid.Cells[_kolpono,i]) ;
    end
  end;

  Result := Result + ')';
  }
end;

procedure TfrmCetakPO.chkMerchandizeClick(Sender: TObject);
begin
  inherited;
  cbpMerchandCode.Enabled := not chkMerchandize.Checked;
end;

procedure TfrmCetakPO.edtDdKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

end.
