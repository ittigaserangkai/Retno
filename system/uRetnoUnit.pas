unit uRetnoUnit;

interface
uses
  ExtCtrls, Controls, Graphics, uConstanta, udmMain, Windows, Classes, SysUtils,
  Forms, uTSINIFile, uAppUtils, uModUnit, uDMClient, uDMReport;

type
  TTag = set of byte;

  TTipeTransaksi = (TTSO, TTPO, TTDO, TTReturSupplier, TTPOS,
                    TTKring, TTStockAdj,TTWastage, TTransferBonus);

  TMutasiType = (TyOut, TyIn);

  TRetno = class(TObject)
  private
  class var
    FUnitStore: TModUnit;
    class function GetUnitStore: TModUnit; static;
    class procedure SetUnitStore(const Value: TModUnit); static;
  protected
  public
    class procedure KartuAP(AOrgID : String; APeriodeAwal, APreiodeAkhir :
        TDatetime);
    class procedure LapHistoryAP(ANoAP : String);
    class property UnitStore: TModUnit read GetUnitStore write SetUnitStore;
  end;

function getGlobalVar(aVarString : string): string;

function IsHODeveloperMode: Boolean;

function IsStoreDeveloperMode: Boolean;

function GetReportPath: string;

function GetIsStoreUnitID(aUnit_ID : Integer): Integer;

procedure cShowWaitWindow(aCaption : String = 'Mohon Ditunggu ...'; aOwner :
    TComponent = nil);

procedure cSetShowWaitWindowCaption(aCaption : String = 'Mohon Ditunggu ...');

procedure cCloseWaitWindow;

function GetLastEODDate(aUNitID : Integer): TDateTime;

const
  _add = 5;
  _Div = 7;
  _DigitNoBukti = 6;
  _pertanyaanMaunDesign = 'Anda mempunyai authority untuk design report '
                        + #13 + #10 + 'Apakah anda akan melakukan design sekarang ? '
                        + #13 + #10 + 'Pilih NO kalau anda hanya akan melihat report ...';

var
  lCaption        : String;
  FMaxRowsAllowed : Integer;

  FWaitForm   : TForm;
  strUOM      : string;

  lUnitId     : Integer;
  aListMerID  : TStrings;
  iMaxGen     : Integer = 5;
  //dibawah ini dipindah ke variabel global database saja ya..
  //Product  ig=integer global
  igProd_Code_Length : Integer = 6;  // max 9 ya. integer safe , def = 6
  //Precision Harga di Transaksi End user dan Kring , def = -2
  igPrice_Precision  : Integer = -2;
  //Precision Qty di Transaksi End user dan Kring , def = -3
  igQty_Precision    : Integer = -3;

implementation

function getGlobalVar(aVarString : string): string;
var
  sSQL: string;
begin
  Result := '';
//  sSQL := ' select PAR_VALUE '
//          + ' from SYS$PARAMETER '
//          + ' where PAR_NAME = ' + QuotedStr(aVarString) ;
//
//  with cOpenQuery(sSQL) do
//  begin
//    try
//    if not FieldByName('PAR_VALUE').IsNull then
//      Result := fieldbyname('PAR_VALUE').AsString;
//    finally
//      Free;
//    end;
//  end;
end;

function IsHODeveloperMode: Boolean;
begin
  Result := UpperCase(TAppUtils.GetAppPath) = UpperCase('D:\SharedProjects\Projects\RMS One SQLServer\bin\');
end;

function IsStoreDeveloperMode: Boolean;
begin
  Result := UpperCase(TAppUtils.GetAppPath) = UpperCase('D:\SharedProjects\Projects\RMS One SQLServer\bin\');
end;

function GetReportPath: string;
begin
  Result := _INIReadString(CONFIG_FILE, PATH_TEMPLATE, 'PathReport');;
end;

{function FormatedStringToFloat(aFormatedString : String): Double;
var
  tmp: string;
begin
  //Result := 0;
  if trim(aFormatedString) = '' then
  begin
    Result := 0;
  end else begin
    tmp := StringReplace(aFormatedString,ThousandSeparator, '',[rfReplaceAll]);
    Result := StrToFloat(tmp) ;
  end;
end;
}
{function FloatToFormatedString(aInputFloat : Double): string;
begin
  Result :='' ;
//  ThousandSeparator := '.';
//  DecimalSeparator := ',';
  Result := Format('%7.2n', [aInputFloat]);
end;
}

function GetIsStoreUnitID(aUnit_ID : Integer): Integer;
var
  sSQL: string;
begin
  Result := 0;
//  sSQL := 'select UNT_IS_STORE, UNT_IS_HO from aut$unit'
//        + ' where UNT_ID = '+ IntToStr(aUnit_ID);
//  with cOpenQuery(sSQL) do
//  begin
//    try
//      if Fields[0].AsInteger <> 0 then
//        Result  := Fields[0].AsInteger;
//    finally
//      Free;
//    end;
//  end;
end;

procedure cShowWaitWindow(aCaption : String = 'Mohon Ditunggu ...'; aOwner :
    TComponent = nil);
begin
    // TODO -cMM: cShowWaitWindow default body inserted
    if FWaitForm = nil then
    begin
        if aOwner = nil then
          FWaitForm := TForm.Create(Application)
        else
          FWaitForm := TForm.Create(aowner);

        FWaitForm.BorderStyle := bsNone;
        FWaitForm.Width := Screen.Width div 3;
        FWaitForm.Height := Screen.Height div 10;
        FWaitForm.Position := poScreenCenter;
        FWaitForm.FormStyle := fsStayOnTop;

        with TPanel.Create(FWaitForm) do
        begin
            Parent := FWaitForm;
            Align := alClient;
            Font.Name := 'Verdana';
            Font.Size := 10;
            Font.Style := [fsBold];
            Font.Color := clBlue;
            Caption := aCaption;
            BevelInner := bvLowered;
            //Color := clYellow;
            Color := clGradientActiveCaption;
        end;
    end else
    begin
        cSetShowWaitWindowCaption(aCaption);
    end;
    FWaitForm.Show;
    screen.Cursor := crDefault;
end;

procedure cSetShowWaitWindowCaption(aCaption : String = 'Mohon Ditunggu ...');
begin
    if FWaitForm <> nil then
    begin
        (FWaitForm.Components[0] as TPanel).Caption := aCaption;
    end;
end;

procedure cCloseWaitWindow;
begin
    // TODO -cMM: cCloseWaitWindow default body inserted
    {if FWaitForm <> nil then
    begin
      FWaitForm.Release;
      FWaitForm := nil;
      Screen.Cursor := crDefault;
    end;
    }

    FreeAndNil(FWaitForm);
    Screen.Cursor := crDefault;
end;

function GetLastEODDate(aUNitID : Integer): TDateTime;
//var
//  sSQL: string;
begin
  Result := Now;
//  sSQL := 'select max(le_tanggal) '
//          + ' from log_eod'
//          + ' where unit_id = ' + IntToStr(aUNitID);

{  with cOpenQuery(sSQL) do
  begin
    try
      Result := Fields[0].AsDateTime;
    finally
      Free;
    end;
  end;
}
end;

class function TRetno.GetUnitStore: TModUnit;
begin
  if (FUnitStore)=nil then
    FUnitStore := TModUnit.Create;
  Result := FUnitStore;
end;

class procedure TRetno.KartuAP(AOrgID : String; APeriodeAwal, APreiodeAkhir :
    TDatetime);
begin
  with DMReport do
  begin
    AddReportVariable('UserCetak', 'USER');
    AddReportVariable('P1', FormatDateTime('dd/MM/yyyy',APeriodeAwal));
    AddReportVariable('P2', FormatDateTime('dd/MM/yyyy',APreiodeAkhir));

    ExecuteReport('reports/KartuAP',
                  ReportClient.KartuAP(AOrgID, APeriodeAwal, APreiodeAkhir),
                  ['QKartuAP']
                 );
  end;
end;

class procedure TRetno.LapHistoryAP(ANoAP : String);
begin
  with DMReport do
  begin
    AddReportVariable('UserCetak', 'USER');
    ExecuteReport('reports/History_AP' ,ReportClient.HistoryAP(ANoAP), ['QAP','QAP_HISTORY']);
  end;
end;

class procedure TRetno.SetUnitStore(const Value: TModUnit);
begin
  FreeAndNil(FUnitStore);
  FUnitStore := Value;
end;

end.
