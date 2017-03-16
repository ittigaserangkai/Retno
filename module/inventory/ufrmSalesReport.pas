unit ufrmSalesReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, ufraFooter5Button, Mask, JvToolEdit,
  Grids, BaseGrid, AdvGrid, uConn, JclStrings, SUIButton, AdvCGrid, IBQuery,
  udmReportNew, suithemes, uGTSUICommonDlg, uRMSUnit, dateutils, DB, AdvObj,
  JvExMask,  uADStanIntf, uADStanOption, uADStanError, uADGUIxIntf, uADPhysIntf,
  uADStanDef, uADStanPool, uADStanAsync, uADPhysManager, uADStanParam,
  uADDatSManager, uADDAptIntf, uADDAptManager, FireDAC.Comp.Client, uADCompDataSet;


type
  TTypeQuery = (Today, UpToYesterday, MonthToDate);

  TfrmSalesReport = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    pnlTop: TPanel;
    lbl1: TLabel;
    dtPeriod: TJvDateEdit;
    pnlMiddle: TPanel;
    btnView: TsuiButton;
    sgData: TAdvColumnGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnViewClick(Sender: TObject);
    procedure fraFooter5Button1btnAddClick(Sender: TObject);
    procedure btnViewEnter(Sender: TObject);
    procedure btnViewExit(Sender: TObject);
    procedure dtPeriodKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sgDataCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure sgDataGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure sgDataGetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
  private
    procedure AturLebarKolomSgData;
    function GetSQL(aPeriod: TDateTime; aUnitID: Integer; aTypeQuery: TTypeQuery =
        Today): string;
    procedure MoveDataFromQtoGrid(aQ: TFDQuery);
  end;

var
  frmSalesReport: TfrmSalesReport;

implementation

const
  {_KolKodeSupplier    : Integer = 1;
  _KolNamaSupplier    : Integer = 2;
  _KolGrosssales      : Integer = 3;
  _KolDiskonPenjualan : Integer = 4;
  _KolPPN             : Integer = 5;
  _KolDiskonAMC       : Integer = 6;
  _KolTotal           : Integer = 7;

  _DKolBRGCode        : Integer = 1;
  _DKolUOM            : Integer = 2;
  _DKolQty            : Integer = 3;
  _DKolHarga          : Integer = 4;
  _DKolDiskon         : Integer = 5;
  _DKolPPNPersen      : Integer = 6;
  _DKolTotalGrossSales: Integer = 7;
  _DKolTotalDisc      : Integer = 8;
  _DKolTotalPPN       : Integer = 9;
  _DKolTotalAMC       : Integer = 10;
  _DKolTotal          : Integer = 11;}

  _KolShift           : Integer = 1;
  _KolBSK             : Integer = 2;
  _KolKodeKasir       : Integer = 3;
  _KolNamaKasir       : Integer = 4;
  _KolTrans           : Integer = 5;
  _KolGross           : Integer = 6;
  _KolDisc            : Integer = 7;
  _KolNetto           : Integer = 8;
  _KolSetorankasir    : Integer = 9;
  _KolCard            : Integer = 10;
  _KolSelisih         : Integer = 11;
  _KolKomSelisih      : Integer = 12;
  _KolSuspend         : Integer = 13;

{$R *.dfm}

procedure TfrmSalesReport.AturLebarKolomSgData;
begin
  with sgData do
  begin
    AutoSizeColumns(True, 5);
//    Columns[_KolTgl].Width          := 100;
//    Columns[_KolGross].Width        := 100;
//    Columns[_KolDiskon].Width       := 100;
//    Columns[_KolNetto].Width        := 90;
//    Columns[_KolSetorankasir].Width := 90;
  end;
end;

procedure TfrmSalesReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmSalesReport.FormDestroy(Sender: TObject);
begin
  inherited;
  frmSalesReport := nil;
  frmSalesReport.Free;
end;

procedure TfrmSalesReport.FormShow(Sender: TObject);
begin
  inherited;
  fraFooter5Button1.btnAdd.Enabled := True;
  fraFooter5Button1.btnUpdate.Enabled := True;
  
  cClearGrid(sgData, False);

  dtPeriod.Date := StartOfTheDay(cGetServerTime);
  dtPeriod.SetFocus;
end;

procedure TfrmSalesReport.btnViewClick(Sender: TObject);
var
  Q: TFDQuery;
begin
  inherited;

  Self.Enabled := True;
  try
    cClearGrid(sgData, False);

    Q := cOpenQuery(GetSQL(dtPeriod.Date, MasterNewUnit.ID));
    try
      MoveDataFromQtoGrid(Q);
    finally
      Q.Free;
    end;

    SetWarnaBarisSG(sgData);
    AturLebarKolomSgData;
  finally
    Self.Enabled := True;
  end;
end;

procedure TfrmSalesReport.fraFooter5Button1btnAddClick(
  Sender: TObject);
var
  sSQL: string;
begin
  inherited;
  sSQL := GetSQL(dtPeriod.Date, MasterNewUnit.ID);
  sSQL := sSQL + ' UNION ALL ' + GetSQL(dtPeriod.Date, MasterNewUnit.ID, UpToYesterday);
  sSQL := sSQL + ' UNION ALL ' + GetSQL(dtPeriod.Date, MasterNewUnit.ID, MonthToDate);

  dmReportNew.EksekusiReport('SalesReportByCashier',sSQL,'');
end;

procedure TfrmSalesReport.btnViewEnter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmSalesReport.btnViewExit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

procedure TfrmSalesReport.dtPeriodKeyUp(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
    btnView.SetFocus;
end;

function TfrmSalesReport.GetSQL(aPeriod: TDateTime; aUnitID: Integer;
    aTypeQuery: TTypeQuery = Today): string;
begin
  Result := 'select ';

  case aTypeQuery of
    Today:
    begin
      Result := Result + ' cast(' + Quot('Today') + ' as VARCHAR(15)) as grup, ';
      Result := Result + ' cast(p.SETUPPOS_TERMINAL_CODE || ' + Quot('-') + ' || bb.BALANCE_ID as VARCHAR(24)) as BSK, ';
      Result := Result + ' s.SHIFT_NAME, ';
      Result := Result + ' u.USR_USERNAME, ';
      Result := Result + ' u.USR_FULLNAME, ';
    end;

    UpToYesterday:
    begin
      Result := Result + ' cast(' + Quot('Up to Yesterday') + ' as VARCHAR(15)) as grup, ';
      Result := Result + ' cast(0 as VARCHAR(24)) as BSK, ';
      Result := Result + ' cast(' + Quot('-') + ' as VARCHAR(25)) as SHIFT_NAME, ';
      Result := Result + ' cast(' + Quot('-') + ' as VARCHAR(16)) as USR_USERNAME, ';
      Result := Result + ' cast(' + Quot('-') + ' as VARCHAR(64)) as USR_FULLNAME, ';
    end;

    MonthToDate:
    begin
      Result := Result + ' cast(' + Quot('Month to Date') + ' as VARCHAR(15)) as grup, ';
      Result := Result + ' cast(0 as VARCHAR(24)) as BSK, ';
      Result := Result + ' cast(' + Quot('-') + ' as VARCHAR(25)) as SHIFT_NAME, ';
      Result := Result + ' cast(' + Quot('-') + ' as VARCHAR(16)) as USR_USERNAME, ';
      Result := Result + ' cast(' + Quot('-') + ' as VARCHAR(64)) as USR_FULLNAME, ';
    end;
  end;

  Result := Result + ' CAST(' + QuotD(aPeriod) + ' as date) as RptPeriod, ';
  Result := Result + ' a.UNT_CODE, ';
  Result := Result + ' a.UNT_NAME, ';
  Result := Result + ' sum(t.TRANS_COUNT) as Trans, ';
  Result := Result + ' sum(t.TRANS_TOTAL) as Netto, ';
  Result := Result + ' sum(t.TRANS_CREDIT) + sum(t.TRANS_DEBIT) + sum(t.TRANS_VOUCHER) + sum(f.FINPAYMENT_TOTAL) - sum(bb.BALANCE_MODAL) as SetoranKasir, ';
  Result := Result + ' sum(t.TRANS_CREDIT) as CreditCard, ';
  Result := Result + ' sum(t.TRANS_DEBIT) as DebitCard, ';
  Result := Result + ' sum(t.TRANS_VOUCHER) as Voucher, ';
  Result := Result + ' sum(t.TRANS_CREDIT) + sum(t.TRANS_DEBIT) + sum(t.TRANS_VOUCHER) + sum(f.FINPAYMENT_TOTAL) - sum(bb.BALANCE_MODAL) - sum(t.TRANS_TOTAL) as Selisih, ';
  Result := Result + ' sum(t.TRANS_GROSS) as Gross, ';
  Result := Result + ' sum(t.TRANS_DISC) as Disc, ';
  Result := Result + ' sum(t.TRANS_RETUR) - sum(t.TRANS_RETUR_DISC) as Retur ';
  Result := Result + ' from SETUPPOS p ';
  Result := Result + ' inner join AUT$UNIT a on p.SETUPPOS_UNT_ID = a.UNT_ID ';
  Result := Result + ' inner join BEGINNING_BALANCE bb on p.SETUPPOS_ID = bb.BALANCE_SETUPPOS_ID ';
  Result := Result + ' and p.SETUPPOS_UNT_ID = bb.BALANCE_SETUPPOS_UNT_ID ';
  Result := Result + ' inner join AUT$USER u on bb.BALANCE_USR_ID = u.USR_ID ';
  Result := Result + ' and bb.BALANCE_USR_UNT_ID = u.USR_UNT_ID ';
  Result := Result + ' inner join SHIFT s on bb.BALANCE_SHIFT_ID = s.SHIFT_ID ';
  Result := Result + ' and bb.BALANCE_SHIFT_UNT_ID = s.SHIFT_UNT_ID ';
  Result := Result + ' left outer join FINAL_PAYMENT f on bb.BALANCE_ID = f.FINPAYMENT_BALANCE_ID ';
  Result := Result + ' and bb.BALANCE_UNT_ID = f.FINPAYMENT_BALANCE_UNT_ID ';
  Result := Result + ' left outer join SP_REKAP_TRANS t on bb.BALANCE_ID = t.TRANS_BALANCE_ID ';
  Result := Result + ' and bb.BALANCE_UNT_ID = t.TRANS_BALANCE_UNT_ID ';
  Result := Result + ' where p.SETUPPOS_UNT_ID = ' + IntToStr(aUnitID);
  Result := Result + ' and extract(month from p.SETUPPOS_DATE) = ' + IntToStr(MonthOf(aPeriod));

  case aTypeQuery of
    Today:
    begin
      Result := Result + ' and CAST(p.SETUPPOS_DATE as date) = CAST(' + QuotD(aPeriod) + ' as date) ';
      Result := Result + ' group by ';
      Result := Result + ' p.SETUPPOS_TERMINAL_CODE, ';
      Result := Result + ' bb.BALANCE_ID, ';
      Result := Result + ' s.SHIFT_NAME, ';
      Result := Result + ' u.USR_USERNAME, ';
      Result := Result + ' u.USR_FULLNAME, ';
    end;

    UpToYesterday:
    begin
      Result := Result + ' and CAST(p.SETUPPOS_DATE as date) < CAST(' + QuotD(aPeriod) + ' as date) ';
      Result := Result + ' group by ';
    end;

    MonthToDate:
    begin
      Result := Result + ' and CAST(p.SETUPPOS_DATE as date) <= CAST(' + QuotD(aPeriod) + ' as date) ';
      Result := Result + ' group by ';
    end;
  end;

  Result := Result + ' a.UNT_CODE, ';
  Result := Result + ' a.UNT_NAME ';

//  Result := Result + ' order by ';
//  Result := Result + ' s.SHIFT_ID, ';
//  Result := Result + ' f.FINPAYMENT_ID ';
end;

procedure TfrmSalesReport.MoveDataFromQtoGrid(aQ: TFDQuery);
var
  iBaris: Integer;
begin
  while not aQ.Eof do
  begin
    iBaris := GetBarisKosong(sgData,_KolBSK);
    if iBaris > 0 then
    begin
      sgData.Ints[0,iBaris]                   := iBaris;
      sgData.Cells[_KolBSK,iBaris]            := aQ.FieldByName('BSK').AsString;
      sgData.Cells[_KolShift,iBaris]          := 'Shift ' + aQ.FieldByName('SHIFT_NAME').AsString;
      sgData.Cells[_KolKodeKasir,iBaris]      := aQ.FieldByName('USR_USERNAME').AsString;
      sgData.Cells[_KolNamaKasir,iBaris]      := aQ.FieldByName('USR_FULLNAME').AsString;
      sgData.Ints[_KolTrans,iBaris]           := aQ.FieldByName('Trans').AsInteger;
      sgData.Floats[_KolGross,iBaris]         := aQ.FieldByName('Gross').AsFloat;
      sgData.Floats[_KolDisc,iBaris]          := aQ.FieldByName('Disc').AsFloat;
      sgData.Floats[_KolNetto,iBaris]         := aQ.FieldByName('Netto').AsFloat;
      sgData.Floats[_KolSetorankasir,iBaris]  := aQ.FieldByName('SetoranKasir').AsFloat;
      sgData.Floats[_KolCard,iBaris]          := aQ.FieldByName('CreditCard').AsFloat
                                               + aQ.FieldByName('DebitCard').AsFloat
                                               + aQ.FieldByName('Voucher').AsFloat;
      sgData.Floats[_KolSelisih,iBaris]       := aQ.FieldByName('Selisih').AsFloat;
      sgData.Floats[_KolSuspend,iBaris]       := aQ.FieldByName('Retur').AsFloat;
      sgData.Floats[_KolKomSelisih,iBaris]    := sgData.Floats[_KolKomSelisih,iBaris-1] + aQ.FieldByName('Selisih').AsFloat;
    end;
    aQ.Next;
  end;
end;

procedure TfrmSalesReport.sgDataCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  inherited;
  CanEdit := False;
end;

procedure TfrmSalesReport.sgDataGetAlignment(Sender: TObject;
  ARow, ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  inherited;
  if ARow < 1 then
    HAlign := taCenter
  else
  if ACol in [0, _KolTrans, _KolGross, _KolDisc, _KolNetto, _KolSetorankasir,
              _KolCard, _KolSelisih, _KolKomSelisih, _KolSuspend] then
    HAlign := taRightJustify
  else
    HAlign := taLeftJustify;    
end;

procedure TfrmSalesReport.sgDataGetFloatFormat(Sender: TObject;
  ACol, ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  inherited;
  FloatFormat := '%.2n';
  if ARow < 1 then
    IsFloat := False
  else
  if ACol in [_KolGross, _KolDisc, _KolNetto, _KolSetorankasir, _KolCard,
              _KolSelisih, _KolKomSelisih, _KolSuspend] then
    IsFloat := True
  else
    IsFloat := False;
end;

end.


