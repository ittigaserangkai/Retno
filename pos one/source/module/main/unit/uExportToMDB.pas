unit uExportToMDB;

interface

uses
  classes, SysUtils, DB, uGTINIFile, uConstanta;

const
  sSeparator: String = '~';

function GetDataBeginningBalance(aUnitID: Integer; aTgl: TDateTime): TStrings;

function GetDataSetupPOS(aUnitID : Integer; aTgl : TDateTime): TStrings;

function GetDataTransaksi(aUnitID : Integer; aTgl : TDateTime): TStrings;

function GetDataTransaksiCard(aUnitID : Integer; aTgl : TDateTime): TStrings;

function GetDataTransaksiDetail(aUnitID : Integer; aTgl : TDateTime): TStrings;

function GetDataTransaksiVoucher(aUnitID : Integer; aTgl : TDateTime): TStrings;

function GetDataTransaksiVoucherassalam(aUnitID : Integer; aTgl : TDateTime): TStrings;

function IsExist(ASQL: string): Boolean;

procedure ProsesSQLExportonline(aTableName: String; AKeyFields: Array of
    String; aSQL: String; var aList: TStrings);

function GetDataShift(aUnitID: Integer; aTgl: TDateTime): TStrings;

function GetDataFinalPayment(aUnitID: Integer; aTgl: TDateTime): TStrings;

function GetDataCashDropping(aUnitID: Integer; aTgl: TDateTime): TStrings;

function GetDataTransaksiPending(aUnitID: Integer; aTgl: TDateTime): TStrings;

function GetDataTransaksiRetur(aUnitID: Integer; aTgl: TDateTime): TStrings;

implementation

uses
  uRMSUnit, ADODB, JvProgressDlg, IBQuery, Forms;

function GetDataTransaksi(aUnitID : INteger; aTgl : TDateTime): TStrings;
var
  aList: TStrings;
  sSQL: string;
begin
  aList := TStringList.Create;
  sSQL := 'select A.TRANS_NO, A.TRANS_UNT_ID, A.TRANS_DATE, A.TRANS_MEMBER_ID, '
        + ' A.TRANS_MEMBER_UNT_ID, A.TRANS_BALANCE_ID, A.TRANS_BALANCE_UNT_ID, '
        + ' A.TRANS_TOTAL_TRANSACTION, A.TRANS_TOTAL_DISC_GMC, '
        + ' A.TRANS_DISC_GMC_PERSEN, A.TRANS_DISC_GMC_NOMINAL, '
        + ' A.TRANS_TOTAL_BAYAR, A.TRANS_PEMBULAT, A.TRANS_BAYAR_CASH, '
        + ' A.TRANS_BAYAR_CARD, A.TRANS_IS_ACTIVE, A.OP_CREATE, A.DATE_CREATE, '
        + ' A.OP_MODIFY, A.DATE_MODIFY, A.OPC_UNIT, A.OPM_UNIT, A.TRANS_ID, '
        + ' A.TRANS_IS_PENDING, A.TRANS_TOTAL_PPN, A.TRANS_IS_JURNAL, '
        + ' A.TRANS_DISC_CARD, B.UNT_CODE '
        + ' from TRANSAKSI A '
        + ' inner join AUT$UNIT B on A.TRANS_UNT_ID = B.UNT_ID '
        + ' inner join BEGINNING_BALANCE C on A.TRANS_BALANCE_ID = C.BALANCE_ID '
        + ' and A.TRANS_BALANCE_UNT_ID = C.BALANCE_UNT_ID '
        + ' where CAST(C.BALANCE_SHIFT_DATE AS DATE) = ' + QuotD(aTgl)
        + ' and C.BALANCE_UNT_ID = ' + IntToStr(aUnitID)
        + ' and A.TRANS_IS_PENDING = 0 ';

  ProsesSQLExportonline('TRANSAKSI', ['TRANS_NO','TRANS_UNT_ID'], sSQL, alist);
  aList.SaveToFile(cGetAppPath + 'TRANSAKSI.txt');
  Result := aList;
end;

function GetDataTransaksiDetail(aUnitID : INteger; aTgl : TDateTime): TStrings;
var
  aList: TStrings;
  sSQL: string;
begin
  aList := TStringList.Create;
  sSQL := 'select A.*, B.UNT_CODE from TRANSAKSI_DETIL A '
        + ' inner join AUT$UNIT B on A.TRANSD_UNT_ID = B.UNT_ID '
        + ' inner join TRANSAKSI C on A.TRANSD_TRANS_NO = C.TRANS_NO '
        + ' and A.TRANSD_TRANS_UNT_ID = C.TRANS_UNT_ID '
        + ' inner join BEGINNING_BALANCE D on C.TRANS_BALANCE_ID = D.BALANCE_ID '
        + ' and C.TRANS_BALANCE_UNT_ID = D.BALANCE_UNT_ID '
        + ' where CAST(D.BALANCE_SHIFT_DATE AS DATE) = ' + QuotD(aTgl)
        + ' and D.BALANCE_UNT_ID = ' + IntToStr(aUnitID);

  ProsesSQLExportonline('TRANSAKSI_DETIL', ['TRANSD_ID','TRANSD_UNT_ID'], sSQL, alist);
  aList.SaveToFile(cGetAppPath + 'TRANSAKSI_DETIL.txt');
  Result := aList;
end;

function GetDataTransaksiCard(aUnitID : INteger; aTgl : TDateTime): TStrings;
var
  aList: TStrings;
  sSQL: string;
begin
  aList := TStringList.Create;
  sSQL := 'select A.*, B.UNT_CODE from TRANSAKSI_CARD A '
        + ' inner join AUT$UNIT B on A.TRANSC_UNT_ID = B.UNT_ID '
        + ' inner join TRANSAKSI C on A.TRANSC_TRANS_NO = C.TRANS_NO '
        + ' and A.TRANSC_TRANS_UNT_ID = C.TRANS_UNT_ID '
        + ' inner join BEGINNING_BALANCE D on C.TRANS_BALANCE_ID = D.BALANCE_ID '
        + ' and C.TRANS_BALANCE_UNT_ID = D.BALANCE_UNT_ID '
        + ' where CAST(D.BALANCE_SHIFT_DATE AS DATE) = ' + QuotD(aTgl)
        + ' and D.BALANCE_UNT_ID = ' + IntToStr(aUnitID);

  ProsesSQLExportonline('TRANSAKSI_CARD', ['TRANSC_ID','TRANSC_UNT_ID'], sSQL, alist);
  aList.SaveToFile(cGetAppPath + 'TRANSAKSI_CARD.txt');
  Result := aList;
end;

function GetDataTransaksiVoucher(aUnitID : INteger; aTgl : TDateTime): TStrings;
var
  aList: TStrings;
  sSQL: string;
begin
  aList := TStringList.Create;
  sSQL := 'select A.*, B.UNT_CODE from VOUCHER_LAIN_LAIN A '
        + ' inner join AUT$UNIT B on A.VCRL_UNT_ID = B.UNT_ID '
        + ' inner join TRANSAKSI C on A.VCRL_TRANS_NO = C.TRANS_NO '
        + ' and A.VCRL_TRANS_UNT_ID = C.TRANS_UNT_ID '
        + ' inner join BEGINNING_BALANCE D on C.TRANS_BALANCE_ID = D.BALANCE_ID '
        + ' and C.TRANS_BALANCE_UNT_ID = D.BALANCE_UNT_ID '
        + ' where CAST(D.BALANCE_SHIFT_DATE AS DATE) = ' + QuotD(aTgl)
        + ' and D.BALANCE_UNT_ID = ' + IntToStr(aUnitID);

  ProsesSQLExportonline('VOUCHER_LAIN_LAIN', ['VCRL_ID','VCRL_UNT_ID'], sSQL, alist);
  aList.SaveToFile(cGetAppPath + 'VOUCHER_LAIN_LAIN.txt');
  Result := aList;
end;

function GetDataSetupPOS(aUnitID : Integer; aTgl : TDateTime): TStrings;
var
  aList: TStrings;
  sSQL: string;
begin
  aList := TStringList.Create;
  sSQL := 'select distinct A.*, B.UNT_CODE from SETUPPOS A '
        + ' inner join AUT$UNIT B on A.SETUPPOS_UNT_ID = B.UNT_ID '
        + ' inner join BEGINNING_BALANCE C on C.BALANCE_SETUPPOS_ID = A.SETUPPOS_ID '
        + ' and C.BALANCE_SETUPPOS_UNT_ID = A.SETUPPOS_UNT_ID '
        + ' where (CAST(C.BALANCE_SHIFT_DATE AS DATE) = ' + QuotD(aTgl)
        + ' and C.BALANCE_UNT_ID = ' + IntToStr(aUnitID) + ')';

  ProsesSQLExportonline('SETUPPOS', ['SETUPPOS_ID','SETUPPOS_UNT_ID'], sSQL, alist);
  aList.SaveToFile(cGetAppPath + 'SETUPPOS.txt');
  Result := aList;
end;

procedure ProsesSQLExportonline(aTableName: String; AKeyFields: Array of
    String; aSQL: String; var aList: TStrings);
var
  sData: string;
  sString: string;
  i: Integer;
  lIBQ: TIBQuery;
  ljvProgressDlg: TJvProgressDlg;
  n: Integer;
  sFilter: string;
  sKeyVal: string;
  sSQLCek: string;
begin
  ljvProgressDlg := TJvProgressDlg.Create(nil);
  lIBQ := cOpenQuery(aSQL);

  try
    lIBQ.Last;
    with ljvProgressDlg do
    begin
      Value := 0;
      Text := 'Preparing data '+ aTableName +' ';
      Value := 0;
      Maximum := lIBQ.RecordCount;
      Show;
      StartProgression;
    end;

    lIBQ.First;
    while not lIBQ.Eof do
    begin
      sSQLCek := '';
      for n:= Low(AKeyFields) to High(AKeyFields) do
      begin
        if lIBQ.FieldByName(AKeyFields[n]).DataType in [ftDate, ftTime, ftDateTime] then
          sKeyVal := Quot(FormatDateTime('YYYY/MM/DD hh:mm:ss', lIBQ.FieldByName(AKeyFields[n]).AsDateTime))
        else if lIBQ.FieldByName(AKeyFields[n]).DataType in [ftstring] then
          sKeyVal := Quot(StringReplace(lIBQ.FieldByName(AKeyFields[n]).AsString,sSeparator,'-',[rfReplaceAll, rfIgnoreCase]))
        else
          sKeyVal := lIBQ.FieldByName(AKeyFields[n]).AsString ;

        if sSQLCek = '' then
          sSQLCek := sSQLCek + ' select 1 from '+ aTableName +' where '+ AKeyFields[n] +' = '+ sKeyVal
        else
          sSQLCek := sSQLCek + ' and '+ AKeyFields[n] +' = '+ sKeyVal;
      end;

      if not IsExist(sSQLCek) then
      begin
        sString := 'insert into '+ aTableName + '(';
        for i := 0 to lIBQ.FieldCount - 1 do
        begin
          sString := sString + lIBQ.FieldDefs[i].Name + ',';
        end;
        sString := sString + ' DATE_EXPORT) values (';

        for i := 0 to lIBQ.FieldCount - 1 do
        begin
          if lIBQ.FieldDefs[i].DataType in [ftDate, ftTime, ftDateTime] then
            sData := Quot(FormatDateTime('YYYY/MM/DD hh:mm:ss', lIBQ.FieldByName(lIBQ.FieldDefs[i].Name).AsDateTime))
          else if lIBQ.FieldDefs[i].DataType in [ftstring] then
            sData :=  Quot(StringReplace(lIBQ.FieldByName(lIBQ.FieldDefs[i].Name).AsString,sSeparator,'-',[rfReplaceAll, rfIgnoreCase]))
          else
            sData := lIBQ.FieldByName(lIBQ.FieldDefs[i].Name).AsString ;
          if sdata='' then
            sdata := '0';

          sString := sString + sData + ',';
        end;
        sString := sString + Quot(FormatDateTime('YYYY/MM/DD hh:mm:ss', cGetServerTime))+ ');'
      end
      else
      begin
        sString := 'update '+ aTableName + ' set ';
        sFilter := '';
        for i := 0 to lIBQ.FieldCount - 1 do
        begin
          //sData
          if lIBQ.FieldDefs[i].DataType in [ftDate, ftTime, ftDateTime] then
            sData := Quot(FormatDateTime('YYYY/MM/DD hh:mm:ss', lIBQ.FieldByName(lIBQ.FieldDefs[i].Name).AsDateTime))
          else if lIBQ.FieldDefs[i].DataType in [ftstring] then
            sData := Quot(StringReplace(lIBQ.FieldByName(lIBQ.FieldDefs[i].Name).AsString,sSeparator,'-',[rfReplaceAll, rfIgnoreCase]))
          else
            sData := lIBQ.FieldByName(lIBQ.FieldDefs[i].Name).AsString ;

          if sdata = '' then
            sdata := '0';

          //sString
          sString := sString + lIBQ.FieldDefs[i].Name + ' = ';

          //sFilter
          for n:= Low(AKeyFields) to High(AKeyFields) do
          begin
            if AKeyFields[n] = lIBQ.FieldDefs[i].Name then
            begin
              if sFilter = '' then
                sFilter := sFilter + ' where '+ AKeyFields[n] +' = '+ sdata
              else
                sFilter := sFilter + ' and '+ AKeyFields[n] +' = '+ sdata;
              Break;
            end;
          end;

          sString := sString + sData + ',';
        end;

        sString := sString
                + ' DATE_EXPORT = '
                + Quot(FormatDateTime('YYYY/MM/DD hh:mm:ss', cGetServerTime))
                + ' '
                + sFilter
                + ';';
      end;

      aList.Add(sString);
      Application.ProcessMessages;
      StepProgress(LjvProgressDlg, 'Preparing data '+ aTableName +' ');
      lIBQ.Next;
    end;
  finally
    ljvProgressDlg.Close;
    ljvProgressDlg.Free;
    lIBQ.Free;
  end;
end;

function GetDataTransaksiVoucherAssalam(aUnitID : Integer; aTgl : TDateTime): TStrings;
var
  aList: TStrings;
  sSQL: string;
begin
  aList := TStringList.Create;
  sSQL := 'select A.*, B.UNT_CODE from VOUCHER_DETIL A '
        + ' inner join AUT$UNIT B on A.VCRD_UNT_ID = B.UNT_ID '
        + ' where (CAST(A.DATE_MODIFY AS DATE) = ' + QuotD(aTgl)
        + ' or CAST(A.DATE_CREATE AS DATE) = ' + QuotD(aTgl) + ')'
        + ' and A.VCRD_UNT_ID = ' + IntToStr(aUnitID);

  ProsesSQLExportonline('VOUCHER_DETIL', ['VCRD_ID','VCRD_UNT_ID'], sSQL , alist);
  aList.SaveToFile(cGetAppPath + 'VOUCHER_DETIL.txt');
  Result := aList;
end;

function IsExist(ASQL: string): Boolean;
var
  lAQ: TADOQuery;
begin
  Result := False;
  lAQ := cAdoOpenQuery(ASQL);
  if lAQ.RecordCount > 0 then
    Result := True;
end;

function GetDataBeginningBalance(aUnitID: Integer; aTgl: TDateTime): TStrings;
var
  aList: TStrings;
  sSQL: string;
begin
  aList := TStringList.Create;
  sSQL := 'select DISTINCT A.*, B.UNT_CODE, '
        + ' D.SETUPPOS_TERMINAL_CODE || ''-'' || CAST(A.BALANCE_ID AS VARCHAR(16)) AS BALANCE_CODE, '
        + ' E.USR_USERNAME '
        + ' from BEGINNING_BALANCE A '
        + ' inner join AUT$UNIT B on A.BALANCE_UNT_ID = B.UNT_ID '
        + ' inner join SETUPPOS D on A.BALANCE_SETUPPOS_ID = D.SETUPPOS_ID '
        + ' and A.BALANCE_SETUPPOS_UNT_ID = D.SETUPPOS_UNT_ID '
        + ' inner join AUT$USER E on A.BALANCE_USR_ID = E.USR_ID '
        + ' and A.BALANCE_USR_UNT_ID = E.USR_UNT_ID '
        + ' where (CAST(A.BALANCE_SHIFT_DATE AS DATE) = ' + QuotD(aTgl)
        + ' and A.BALANCE_UNT_ID = ' + IntToStr(aUnitID) + ')';

  ProsesSQLExportonline('BEGINNING_BALANCE', ['BALANCE_ID','BALANCE_UNT_ID'], sSQL, alist);
  aList.SaveToFile(cGetAppPath + 'BEGINNING_BALANCE.txt');
  Result := aList;
end;

function GetDataShift(aUnitID: Integer; aTgl: TDateTime): TStrings;
var
  aList: TStrings;
  sSQL: string;
begin
  aList := TStringList.Create;
  sSQL := 'select A.*, B.UNT_CODE from SHIFT A '
        + ' inner join AUT$UNIT B on A.SHIFT_UNT_ID = B.UNT_ID '
        + ' where A.SHIFT_UNT_ID = ' + IntToStr(aUnitID);

  ProsesSQLExportonline('SHIFT', ['SHIFT_ID','SHIFT_UNT_ID'], sSQL, alist);
  aList.SaveToFile(cGetAppPath + 'SHIFT.txt');
  Result := aList;
end;

function GetDataFinalPayment(aUnitID: Integer; aTgl: TDateTime): TStrings;
var
  aList: TStrings;
  sSQL: string;
begin
  aList := TStringList.Create;
  sSQL := 'select A.*, B.UNT_CODE from FINAL_PAYMENT A '
        + ' inner join AUT$UNIT B on A.FINPAYMENT_UNT_ID = B.UNT_ID '
        + ' inner join BEGINNING_BALANCE C on A.FINPAYMENT_BALANCE_ID = C.BALANCE_ID '
        + ' and A.FINPAYMENT_BALANCE_UNT_ID = C.BALANCE_UNT_ID '
        + ' where CAST(C.BALANCE_SHIFT_DATE AS DATE) = ' + QuotD(aTgl)
        + ' and C.BALANCE_UNT_ID = ' + IntToStr(aUnitID);

  ProsesSQLExportonline('FINAL_PAYMENT', ['FINPAYMENT_ID','FINPAYMENT_UNT_ID'], sSQL, alist);
  aList.SaveToFile(cGetAppPath + 'FINAL_PAYMENT.txt');
  Result := aList;
end;

function GetDataCashDropping(aUnitID: Integer; aTgl: TDateTime): TStrings;
var
  aList: TStrings;
  sSQL: string;
begin
  aList := TStringList.Create;
  sSQL := 'select A.*, B.UNT_CODE from CASH_DROPPING A '
        + ' inner join AUT$UNIT B on A.CASHDROP_UNT_ID = B.UNT_ID '
        + ' inner join BEGINNING_BALANCE C on A.CASHDROP_BALANCE_ID = C.BALANCE_ID '
        + ' and A.CASHDROP_BALANCE_UNT_ID = C.BALANCE_UNT_ID '
        + ' where CAST(C.BALANCE_SHIFT_DATE AS DATE) = ' + QuotD(aTgl)
        + ' and C.BALANCE_UNT_ID = ' + IntToStr(aUnitID);

  ProsesSQLExportonline('CASH_DROPPING', ['CASHDROP_ID','CASHDROP_UNT_ID'], sSQL, alist);
  aList.SaveToFile(cGetAppPath + 'CASH_DROPPING.txt');
  Result := aList;
end;

function GetDataTransaksiPending(aUnitID: Integer; aTgl: TDateTime): TStrings;
var
  aList: TStrings;
  sSQL: string;
begin
  aList := TStringList.Create;
  sSQL := 'select A.TRANS_NO, A.TRANS_UNT_ID, A.TRANS_DATE, A.TRANS_MEMBER_ID, '
        + ' A.TRANS_MEMBER_UNT_ID, A.TRANS_BALANCE_ID, A.TRANS_BALANCE_UNT_ID, '
        + ' A.TRANS_TOTAL_TRANSACTION, A.TRANS_TOTAL_DISC_GMC, '
        + ' A.TRANS_DISC_GMC_PERSEN, A.TRANS_DISC_GMC_NOMINAL, '
        + ' A.TRANS_TOTAL_BAYAR, A.TRANS_PEMBULAT, A.TRANS_BAYAR_CASH, '
        + ' A.TRANS_BAYAR_CARD, A.TRANS_IS_ACTIVE, A.OP_CREATE, A.DATE_CREATE, '
        + ' A.OP_MODIFY, A.DATE_MODIFY, A.OPC_UNIT, A.OPM_UNIT, A.TRANS_ID, '
        + ' A.TRANS_IS_PENDING, A.TRANS_TOTAL_PPN, A.TRANS_IS_JURNAL, '
        + ' A.TRANS_DISC_CARD, B.UNT_CODE '
        + ' from TRANSAKSI A '
        + ' inner join AUT$UNIT B on A.TRANS_UNT_ID = B.UNT_ID '
        + ' inner join BEGINNING_BALANCE C on A.TRANS_BALANCE_ID = C.BALANCE_ID '
        + ' and A.TRANS_BALANCE_UNT_ID = C.BALANCE_UNT_ID '
        + ' where CAST(C.BALANCE_SHIFT_DATE AS DATE) = ' + QuotD(aTgl)
        + ' and C.BALANCE_UNT_ID = ' + IntToStr(aUnitID)
        + ' and A.TRANS_IS_PENDING = 1 ';

  ProsesSQLExportonline('TRANSAKSI_PENDING', ['TRANS_NO','TRANS_UNT_ID'], sSQL, alist);
  aList.SaveToFile(cGetAppPath + 'TRANSAKSI_PENDING.txt');
  Result := aList;
end;

function GetDataTransaksiRetur(aUnitID: Integer; aTgl: TDateTime): TStrings;
var
  aList: TStrings;
  sSQL: string;
begin
  aList := TStringList.Create;

  sSQL := 'select A.*, B.UNT_CODE from TRANSAKSI_RETUR_NOTA A '
        + ' inner join AUT$UNIT B on A.TRANSRET_UNT_ID = B.UNT_ID '
        + ' inner join TRANSAKSI C on C.TRANS_NO = A.TRANSRET_POS_TRANS_NO '
        + '  and C.TRANS_UNT_ID = A.TRANSRET_UNT_ID '
        + ' inner join BEGINNING_BALANCE E on C.TRANS_BALANCE_ID = E.BALANCE_ID '
        + ' and C.TRANS_BALANCE_UNT_ID = E.BALANCE_UNT_ID '
        + ' where CAST(E.BALANCE_SHIFT_DATE AS DATE) = ' + QuotD(aTgl)
        + ' and E.BALANCE_UNT_ID = ' + IntToStr(aUnitID);
  ProsesSQLExportonline('TRANSAKSI_RETUR_NOTA', ['TRANSRET_NO','TRANSRET_UNT_ID','TRANSRET_TRANS_NO','TRANSRET_TRANS_UNT_ID','TRANSRET_BRG_CODE','TRANSRET_UOM'], sSQL, alist);

  sSQL := 'select '
        + ' GEN_ID(GEN_TRANSAKSI_DETIL_ID,1) AS TRANSD_ID, '
        + ' A.TRANSRET_UNT_ID as TRANSD_UNT_ID, '
        + ' A.TRANSRET_POS_TRANS_NO as TRANSD_TRANS_NO, '
        + ' A.TRANSRET_TRANS_UNT_ID as TRANSD_TRANS_UNT_ID, '
        + ' D.TRANSD_BHJ_ID, '
        + ' D.TRANSD_BHJ_UNT_ID, '
        + ' D.TRANSD_BRG_IS_GMC, '
        + ' -A.TRANSRET_QTY as TRANSD_QTY, '
        + ' -A.TRANSRET_TOTAL_PRICE as TRANSD_TOTAL, '
        + ' D.TRANSD_SELL_PRICE, '
        + ' D.TRANSD_SELL_PRICE_DISC, '
        + ' -A.TRANSRET_TOTAL_PRICE as TRANSD_TOTAL_CEIL, '
        + ' -A.TRANSRET_TOTAL_PRICE as TRANSD_TOTAL_B4_TAX, '
        + ' 0 as TRANSD_COGS, '
        + ' D.TRANSD_LAST_COST, '
        + ' D.TRANSD_IS_BKP, '
        + ' D.TRANSD_PPN, '
        + ' D.TRANSD_PPNBM, '
        + ' D.TRANSD_BRG_IS_PJK_INCLUDE, '
        + ' A.OP_CREATE, '
        + ' A.DATE_CREATE, '
        + ' A.OP_MODIFY, '
        + ' A.DATE_MODIFY, '
        + ' A.TRANSRET_BRG_CODE as TRANSD_BRG_CODE, '
        + ' D.TRANSD_TPBRG_ID, '
        + ' A.OPC_UNIT, '
        + ' A.OPM_UNIT, '
        + ' C.TRANS_ID as TRANSD_TRANS_ID, '
        + ' -D.TRANSD_DISC_GMC_NOMINAL as TRANSD_DISC_GMC_NOMINAL, '
        + ' -D.TRANSD_DISC_CARD as TRANSD_DISC_CARD, '
        + ' D.TRANSD_SAT_CODE, '
        + ' D.TRANSD_DISC_MAN as TRANSD_DISC_MAN, '
        + ' D.OTO_CODE, '
        + ' B.UNT_CODE from TRANSAKSI_RETUR_NOTA A '
        + ' inner join AUT$UNIT B on A.TRANSRET_UNT_ID = B.UNT_ID '
        + ' inner join TRANSAKSI C on C.TRANS_NO = A.TRANSRET_POS_TRANS_NO '
        + '  and C.TRANS_UNT_ID = A.TRANSRET_UNT_ID '
        + ' inner join TRANSAKSI_DETIL D on D.TRANSD_ID = A.TRANSRET_TRANSD_ID '
        + '  and D.TRANSD_UNT_ID = A.TRANSRET_TRANSD_UNT_ID '
        + ' inner join BEGINNING_BALANCE E on C.TRANS_BALANCE_ID = E.BALANCE_ID '
        + ' and C.TRANS_BALANCE_UNT_ID = E.BALANCE_UNT_ID '
        + ' where CAST(E.BALANCE_SHIFT_DATE AS DATE) = ' + QuotD(aTgl)
        + ' and E.BALANCE_UNT_ID = ' + IntToStr(aUnitID);

  ProsesSQLExportonline('TRANSAKSI_DETIL', ['TRANSD_ID','TRANSD_UNT_ID'], sSQL, alist);

  if aList.Count > 0 then
  begin
    sSQL := 'UPDATE TRANSAKSI_RETUR_NOTA '
          + ' INNER JOIN TRANSAKSI ON TRANSAKSI_RETUR_NOTA.TRANSRET_POS_TRANS_NO = '
          + ' TRANSAKSI.TRANS_NO '
          + ' SET TRANSAKSI.TRANS_TOTAL_TRANSACTION = '
          + ' TRANSAKSI.TRANS_TOTAL_TRANSACTION - TRANSAKSI_RETUR_NOTA.TRANSRET_TOTAL_PRICE';
    aList.Add(sSQL);
  end;

  aList.SaveToFile(cGetAppPath + 'TRANSAKSI_RETUR.txt');
  Result := aList;
end;

end.
