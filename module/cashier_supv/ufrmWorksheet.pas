unit ufrmWorksheet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, uFormProperty, ComCtrls, StdCtrls,
  ExtCtrls, ActnList, Math,   System.Actions, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, dxCore, cxDateUtils, Vcl.Menus, ufraFooter4Button,
  cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxPC;

type
  TfrmWorksheet = class(TfrmMasterBrowse)
    dlgSaveFile: TSaveDialog;
    pnlButtonUP: TPanel;
    rgReportType: TRadioGroup;
    procedure actExportExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure Detil;
    procedure InitGrid;
  public
  end;

var
  frmWorksheet: TfrmWorksheet;

const
  _Kol_No       : integer = 0;
  _Kol_Date     : integer = 1;
  _Kol_POS      : integer = 2;
  _Kol_Shift    : integer = 3;
  _Kol_Cashier  : integer = 4;
  _Kol_TransNo  : integer = 5;
  _Kol_Init     : integer = 6;
  _Kol_Cash     : integer = 7;
  _Kol_VAH      : integer = 8;
  _Kol_BAH      : integer = 9;
  _Kol_Db_Card  : integer = 10;
  _Kol_Cr_Card  : integer = 11;
  _kol_Disc_cc  : Integer = 12;
  _Kol_BCA      : integer = 13;
  _Kol_Physical : integer = 14;
  _Kol_DeltaCash: integer = 15;
  _Kol_Total    : integer = 16;
  _ColCount     : Integer = 18;
  _Kol_toko         : Integer = 17;
  _RowCount     : Integer = 2;


implementation

uses udmReport, ufrmPopupGrid, uTSCommonDlg;

{$R *.dfm}

procedure TfrmWorksheet.actExportExecute(Sender: TObject);
begin
  inherited;
  {if GrdMain.Cells[0,0] = '' then exit;
  dlgSaveFile.InitialDir := ExtractFilePath(Application.ExeName);
  if dlgSaveFile.Execute then
  begin
      GrdMain.SaveToXLS(dlgSaveFile.FileName);
  end;
  }
end;

procedure TfrmWorksheet.actPrintExecute(Sender: TObject);
var
  sSQL: string;
  ss:string;
begin
  inherited;
  {
  frVariables.Variable['PERIODE'] := dtp1.Date;

  if FTipeApp = TSTORE then
  begin
  if rgReportType.ItemIndex = 0 then
   begin
    sSQL := 'select wr.*, fp.FINPAYMENT_GRAND_TOTAL '
         + ' from PROC_TR$WORKSHEET_RPT(' + QuotD(dtp1.Date)+ ',' + IntToStr(masternewunit.id) + ') wr'
         + ' Left join  FINAL_PAYMENT fp on wr.BAL_ID = fp.FINPAYMENT_BALANCE_ID and wr.Bal_unt_ID=fp.FINPAYMENT_BALANCE_UNT_ID where o_pos<> ' + Quot('-');
         dmReportNew.EksekusiReport('frWorksheetReportByValue',sSQL,'');
   end
  else
   begin
    sSQL := 'select * from PROC_TR$WORKSHEET_RPT_TRANS(' + QuotD(dtp1.Date)
      + ',' + IntToStr(masternewunit.id) + ')';
         dmReportNew.EksekusiReport('frWorksheetReportByTrans',sSQL,'');
   end;
  end
  else
  begin
       SS := 'select unt_id,unt_name from aut$unit where unt_is_active=1';
       sSQL := '';
      with cOpenQuery(ss) do
      begin
         while not Eof do
         begin
            if sSql <> '' then
            sSQL := sSQL + ' union ';

            if rgReportType.ItemIndex = 0 then
              sSQL := sSQL + 'select unt_id,unt_name, wr.*, fp.FINPAYMENT_GRAND_TOTAL '
               + ' from PROC_TR$WORKSHEET_RPT(' + QuotD(dtp1.Date)+ ',' + IntToStr(Fields[0].AsInteger) + ') wr'
               + ' Left join  FINAL_PAYMENT fp on wr.BAL_ID = fp.FINPAYMENT_BALANCE_ID and wr.Bal_unt_ID=fp.FINPAYMENT_BALANCE_UNT_ID'
               + ' inner join aut$unit on unt_id= ' + IntToStr(Fields[0].AsInteger) + ' where e_total<>0  and o_pos<> ' + Quot('-')

            else
              sSQL := sSQL + 'select unt_id,unt_name,a.* from PROC_TR$WORKSHEET_RPT_TRANS(' + QuotD(dtp1.Date)
              + ',' + IntToStr(Fields[0].AsInteger) + ') a'
              + ' inner join aut$unit on unt_id= ' + IntToStr(Fields[0].AsInteger) + ' where e_total<>0 and o_pos<> ' + Quot('-');
           next;
         end;
     end;
       if rgReportType.ItemIndex = 0 then
       dmReportNew.EksekusiReport('frWorksheetReportByValue',sSQL,'')
       else
       dmReportNew.EksekusiReport('frWorksheetReportByTrans',sSQL,'');
  end;
  }

end;

procedure TfrmWorksheet.FormShow(Sender: TObject);
begin
  inherited;
  dtAwalFilter.Date                := Now;
  actRefresh.Enabled := True;
  actExport.Enabled    := True;
  InitGrid;
end;

procedure TfrmWorksheet.FormDestroy(Sender: TObject);
begin
  inherited;
  frmWorksheet := nil;
end;

procedure TfrmWorksheet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmWorksheet.actRefreshExecute(Sender: TObject);
var
  sSQL: string;
  i   : integer;
  SS        : string;
begin
  inherited;
  {
  if FTipeApp = TSTORE then
  begin
  if rgReportType.ItemIndex = 0 then
    sSQL := 'select wr.*, fp.FINPAYMENT_GRAND_TOTAL '
         + ' from PROC_TR$WORKSHEET_RPT(' + QuotD(dtp1.Date)+ ',' + IntToStr(masternewunit.id) + ') wr'
         + ' Left join  FINAL_PAYMENT fp on wr.BAL_ID = fp.FINPAYMENT_BALANCE_ID and wr.Bal_unt_ID=fp.FINPAYMENT_BALANCE_UNT_ID'
  else
    sSQL := 'select * from PROC_TR$WORKSHEET_RPT_TRANS(' + QuotD(dtp1.Date)
      + ',' + IntToStr(masternewunit.id) + ')';
  end
  else
  begin
       SS := 'select unt_id,unt_name from aut$unit where unt_is_active=1';
       sSQL := '';
      with cOpenQuery(ss) do
      begin
         while not Eof do
         begin
            if sSql <> '' then
            sSQL := sSQL + ' union ';

            if rgReportType.ItemIndex = 0 then
              sSQL := sSQL + 'select unt_id,unt_name, wr.*, fp.FINPAYMENT_GRAND_TOTAL '
               + ' from PROC_TR$WORKSHEET_RPT(' + QuotD(dtp1.Date)+ ',' + IntToStr(Fields[0].AsInteger) + ') wr'
               + ' Left join  FINAL_PAYMENT fp on wr.BAL_ID = fp.FINPAYMENT_BALANCE_ID and wr.Bal_unt_ID=fp.FINPAYMENT_BALANCE_UNT_ID'
               + ' inner join aut$unit on unt_id= ' + IntToStr(Fields[0].AsInteger) + ' where e_total<>0'
            else
              sSQL := sSQL + 'select unt_id,unt_name,a.* from PROC_TR$WORKSHEET_RPT_TRANS(' + QuotD(dtp1.Date)
              + ',' + IntToStr(Fields[0].AsInteger) + ') a'
              + ' inner join aut$unit on unt_id= ' + IntToStr(Fields[0].AsInteger) + ' where e_total<>0';
           next;
         end;
     end;
  end;
  InitGrid;
  i := 1;
  with cOpenQuery(sSQL) do
  begin
      try
        with GrdMain do
        begin
            while not Eof do
            begin
              if (FieldByName('O_POS').AsString <> '-') or (FieldByName('O_SHIFT').AsString <> '-') then
              begin
                 AddRow;
                 Dates[_Kol_Date, i]     := FieldByName('O_DATE').AsDateTime;

                 if FTipeApp = TSTORE then
                  Cells[_Kol_POS, i]      := FieldByName('O_POS').AsString
                 else
                 Cells[_Kol_POS, i]      := FieldByName('UNT_NAME').AsString;

                 Cells[_Kol_Shift, i]    := FieldByName('O_SHIFT').AsString;
                 Cells[_Kol_Cashier, i]  := FieldByName('CSR_ID').AsString
                                            + ' - ' + FieldByName('CSR_NAME').AsString;
                 if rgReportType.ItemIndex = 0 then
                 begin
                   Cells[_Kol_TransNo, i]  := '';
                   Cells[_Kol_Physical, i] := FieldByName('FINPAYMENT_GRAND_TOTAL').AsString;
                   Floats[_Kol_DeltaCash, i]:= FieldByName('FINPAYMENT_GRAND_TOTAL').AsFloat
                                            - Round((FieldByName('E_INIT').AsFloat + FieldByName('E_CASH').AsFloat) - Floor(FieldByName('E_DISCCC').AsFloat));
                 end
                 else
                 begin
                   Cells[_Kol_TransNo, i]  := FieldByName('TR_NO').AsString;
                   Cells[_Kol_Physical, i] := '0';
                   Cells[_Kol_DeltaCash, i]:= '0';
                 end;
                 if FTipeApp = TSTORE THEN
                 begin
                     if (Cells[_Kol_Shift, i-1 ]  <> FieldByName('O_SHIFT').AsString) or
                         (Cells[_Kol_Cashier, i-1] <> FieldByName('CSR_ID').AsString + ' - ' + FieldByName('CSR_NAME').AsString) or
                          (Cells[_Kol_POS, i-1] <> FieldByName('O_POS').AsString) then
                     Floats[_Kol_Init, i]    := FieldByName('E_INIT').AsFloat;
                 end
                 else
                 begin
                     if (Cells[_Kol_Shift, i-1 ]  <> FieldByName('O_SHIFT').AsString) or
                         (Cells[_Kol_Cashier, i-1] <> FieldByName('CSR_ID').AsString + ' - ' + FieldByName('CSR_NAME').AsString) or
                          (Cells[_Kol_POS, i-1] <> FieldByName('UNT_NAME').AsString)  then
                     Floats[_Kol_Init, i]    := FieldByName('E_INIT').AsFloat;
                 end;

    //               ShowMessage(FieldByName('E_DISCCC').AsString);
                 Floats[_Kol_Cash, i]    := Round(FieldByName('E_CASH').AsFloat
                                          - Floor(FieldByName('E_DISCCC').AsFloat));
                 Floats[_Kol_VAH, i]     := FieldByName('E_VOCR').AsFloat;
                 Floats[_Kol_BAH, i]     := FieldByName('E_BTL').AsFloat;
                 Floats[_Kol_Db_Card, i] := FieldByName('E_DEB').AsFloat;
                 Floats[_Kol_Cr_Card, i] := FieldByName('E_CRE').AsFloat;
                 Floats[_kol_Disc_cc, i] := FieldByName('E_DISCCC').AsFloat;
                 Floats[_Kol_BCA, i]     := FieldByName('E_BCA').AsFloat;
                 if rgReportType.ItemIndex = 0 then
                    Floats[_Kol_Total, i]   := FieldByName('E_total').AsFloat
                 else
                    Floats[_Kol_Total, i]   := FieldByName('E_total').AsFloat + Floats[_Kol_Init, i] ;
                 IF FTipeApp = THO then
                 Ints[_Kol_toko,i]      := FieldByName('UNT_id').AsInteger;
    //                                          Round(FieldByName('E_TOTAL').AsFloat
    //                                          - Floor(FieldByName('E_DISCCC').AsFloat));
                 i := i + 1;
              end;
               Next;
            End;
            SplitAllCells;
            AutoNumberCol(_Kol_No);
            FloatingFooter.Visible  := True;
            if rgReportType.ItemIndex = 0 then
            begin
              for i := _Kol_Init to _Kol_Total do
              begin
                   Floats[i, RowCount-1] := ColumnSum(i, 1, RowCount-2);
              end;
              AutoSize  := True;
              Columns[_Kol_TransNo].Width   := 0;
            end
            else
            begin
              for i := _Kol_Cash to _Kol_Total do
              begin
                        Floats[i, RowCount-1] := ColumnSum(i, 1, RowCount-2);


              end;
              AutoSize  := True;
              Columns[_Kol_Physical].Width   := 0;
              Columns[_Kol_DeltaCash].Width  := 0;
            end;
            MergeCells(_Kol_No, RowCount-1, _Kol_Cash, 1);
            Cells[_Kol_No, RowCount-1] := 'G R A N D   T O T A L';
        end;
      finally
        SetWarnaBarisSG(GrdMain);
        Free;
      end;   //try
  end; //with
  }
end;

procedure TfrmWorksheet.Detil;
var
  sDtFormat: string;
  dtTrans : TDateTime;
  sSQL    : string;
  sFilter : string;
  sfield  : string;
begin
  {
  sDtFormat := FormatSettings.ShortDateFormat;
  FormatSettings.ShortDateFormat := 'DD-MM-YYYY';
  if not TryStrToDate(GrdMain.Cells[_Kol_Date, GrdMain.Row], dtTrans) then
  begin
    FormatSettings.ShortDateFormat := 'MM-DD-YYYY';
    if not TryStrToDate(GrdMain.Cells[_Kol_Date, GrdMain.Row], dtTrans) then
    begin
      CommonDlg.ShowError('Tidak bisa melakukan konversi tanggal transaksi');
      Exit;
    end;
  end;

  FormatSettings.ShortDateFormat := sDtFormat;

  if FTipeApp = TSTORE then
     sFilter :=' and a.TRANSD_UNT_ID= '+ IntToStr(MasterNewUnit.ID)
  else
     sFilter := ' and a.TRANSD_UNT_ID= '+ IntToStr(GrdMain.ints[_Kol_toko, grdmain.row]);

  if FTipeApp = TSTORE then
     sfield :=''
  else
     sfield :=  IntToStr(GrdMain.ints[_Kol_toko, grdmain.row]) + ' as "Toko", ';

  sSQL := 'select e.SUP_CODE as "Kode Suplier", e.SUP_NAME as "Nama Suplier",'
      + sfield
      + ' f.MERCHAN_CODE ||''  ''|| f.MERCHAN_NAME as "Divisi",'
      + ' g.MERCHANGRUP_CODE ||''  ''||g.MERCHANGRUP_NAME as "Kategori",'
      + ' a.TRANSD_BRG_CODE as "Plu", c.BRG_ALIAS as "Nama Barang",'
      + ' cast(sum(a.TRANSD_QTY) as double precision) as "Qty Sales",'
      + ' cast(sum(a.TRANSD_SELL_PRICE * a.TRANSD_QTY) as double precision)as "Gross",'
      + ' cast(sum(a.TRANSD_TOTAL - (a.TRANSD_DISC_CARD * a.TRANSD_QTY) - a.TRANSD_DISC_GMC_NOMINAL) as double precision) as "Netto",'
      + ' cast(sum(a.TRANSD_SELL_PRICE * a.TRANSD_QTY - a.TRANSD_TOTAL + a.TRANSD_DISC_CARD + a.TRANSD_DISC_GMC_NOMINAL) as double precision) as "Diskon"'
      + ' from TRANSAKSI_DETIL a'
      + ' inner join TRANSAKSI b on a.TRANSD_TRANS_NO = b.TRANS_NO'
      + ' and a.TRANSD_TRANS_UNT_ID = b.TRANS_UNT_ID'
      + sfilter
      + ' and b.TRANS_IS_PENDING = 0'
      + ' and (b.TRANS_DATE BETWEEN '+ QuotDT(dtTrans)
      + ' and '+ QuotD(dtTrans, True) + ')'
      + ' inner join barang c on a.TRANSD_BRG_CODE = c.BRG_CODE'
      + ' inner join BARANG_SUPLIER d on c.BRG_CODE = d.BRGSUP_BRG_CODE'
      + ' inner join SUPLIER e on d.BRGSUP_SUP_CODE = e.SUP_CODE'
      + ' and d.BRGSUP_IS_PRIMARY = 1'
      + ' inner join REF$MERCHANDISE f on c.BRG_MERCHAN_ID = f.MERCHAN_ID'
      + ' inner join REF$MERCHANDISE_GRUP g on c.BRG_MERCHANGRUP_ID = g.MERCHANGRUP_ID'
      + ' group by a.TRANSD_BRG_CODE, c.BRG_ALIAS,'
      + ' e.SUP_CODE, e.SUP_NAME, f.MERCHAN_CODE, f.MERCHAN_NAME,'
      + ' g.MERCHANGRUP_CODE, g.MERCHANGRUP_NAME';

  if not Assigned(frmPopupGrid) then
    frmPopupGrid  := TfrmPopupGrid.Create(Self);

  frmPopupGrid.Init(sSQL, 'TRANSAKSI TANGGAL '+ GrdMain.Cells[_Kol_Date, GrdMain.Row]);
  frmPopupGrid.ShowModal;
  }
end;

procedure TfrmWorksheet.InitGrid;
var
  i : integer;
begin
  // TODO -cMM: TfrmWorksheet.InitGrid default body inserted
  {
  with GrdMain do
  begin
      FloatingFooter.Visible        := False;
      ClearNormalCells;
      ColCount := _ColCount;
      RowCount := _RowCount;
      Columns[_Kol_No].Header       := 'No.';
      Columns[_Kol_Date].Header     := 'Date';
      if FTipeApp = TSTORE then
         Columns[_Kol_POS].Header      := 'POS'
      else
         Columns[_Kol_POS].Header      := 'STORE';

      Columns[_Kol_POS].Alignment   := taCenter;
      Columns[_Kol_Shift].Header    := 'Shift';
      Columns[_Kol_Shift].Alignment := taCenter;
      Columns[_Kol_Cashier].Header  := 'ID & Cashier Name';
      if rgReportType.ItemIndex = 0 then
      begin
         Columns[_Kol_TransNo].Width   := 0;
         Columns[_Kol_Physical].Width  := 20;
         Columns[_Kol_DeltaCash].Width := 20;
         Columns[_Kol_Physical].Header  := 'LAST FINAL PAY.';
         Columns[_Kol_DeltaCash].Header := 'SELISIH CASH';
      end
      else
      begin
         Columns[_Kol_TransNo].Header  := 'Trans. No.';
         Columns[_Kol_TransNo].Width   := 20;
         Columns[_Kol_Physical].Width  := 0;
         Columns[_Kol_DeltaCash].Width := 0;

      end;
      Columns[_Kol_toko].Width := 0;      
      Columns[_Kol_Init].Header     := 'Init Amount';
      Columns[_Kol_Cash].Header     := 'Cash Amount';
      Columns[_Kol_VAH].Header      := 'Voucher';
      Columns[_Kol_BAH].Header      := 'B.Assalaam';
      Columns[_Kol_Db_Card].Header  := 'Db. Card';
      Columns[_Kol_Cr_Card].Header  := 'Cr. Card';
      Columns[_kol_Disc_cc].Header  := 'Disc. Card';
      Columns[_Kol_BCA].Header      := 'Cash Back';
      Columns[_Kol_Total].Header    := 'T o t a l';
      for i := _Kol_Init to _Kol_Total do
      begin
           Columns[i].Alignment   := taRightJustify;
      end;
  end;
  }
end;

procedure TfrmWorksheet.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if(Key = Ord('D'))and(ssctrl in Shift) then
    Detil;
end;

end.



