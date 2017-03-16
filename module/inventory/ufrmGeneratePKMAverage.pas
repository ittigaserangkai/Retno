unit ufrmGeneratePKMAverage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, Grids, BaseGrid, AdvGrid, AdvCGrid, StdCtrls,
  cbxbase, dblup1a, AdvEdit, AdvEdBtn, SUIButton, Mask, JvToolEdit,
  ufraFooter5Button, ExtCtrls, uSetCbMerchandise, ComCtrls, uGTSUICommonDlg,
  IB, AdvObj;

type
  TfrmGeneratePKMAverage = class(TfrmMaster)
    sgData: TAdvColumnGrid;
    AdvGridTmp: TAdvStringGrid;
    frftr5btn1: TfraFooter5Button;
    pnl1: TPanel;
    edtSearch: TEdit;
    Label3: TLabel;
    btnTransfer: TsuiButton;
    btnPkmAvDPrint: TsuiButton;
    btnProses: TsuiButton;
    edtMerchandName: TEdit;
    edtNoBukti: TEdit;
    cbpMerchandise: TColumnComboBox;
    dtmTanggal: TDateTimePicker;
    Label2: TLabel;
    lbl3: TLabel;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure cbpMerchandiseChange(Sender: TObject);
    procedure cbpMerchandiseExit(Sender: TObject);
    procedure btnProsesClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure IsiGridAwal;
    procedure IsiGridFix;
    procedure frftr5btn1btnAddClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure frftr5btn1btnRefreshClick(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure sgDataEditChange(Sender: TObject; ACol, ARow: Integer;
      Value: String);
    procedure frftr5btn1btnUpdateClick(Sender: TObject);
    procedure btnTransferClick(Sender: TObject);
    procedure btnPkmAvDPrintClick(Sender: TObject);
    procedure btnProsesEnter(Sender: TObject);
    procedure btnPkmAvDPrintEnter(Sender: TObject);
    procedure btnTransferEnter(Sender: TObject);
    procedure btnTransferExit(Sender: TObject);
    procedure btnPkmAvDPrintExit(Sender: TObject);
    procedure btnProsesExit(Sender: TObject);
    procedure frftr5btn1btnCloseClick(Sender: TObject);

  protected
    bis_edited  : Boolean;
    sNOBukti    : string;
    bis_Save    : Boolean;

  private
    { Private declarations }
    iDayWeekFrst  : Integer;
    iDayWeekFor   : Integer;
    SetCbMerchandise : TSetCbMerchandise;
    function GetSQLQty(sMMddYY1, sMMddYY2, UnitID : string): string;
    function StrPadLeft(const S: String; Len: Integer; C: Char): String;

  public
    { Public declarations }

  end;

var
  frmGeneratePKMAverage: TfrmGeneratePKMAverage;


implementation

{$R *.dfm}
uses suithemes, uRmsUnit, DateUtils, udmReportNew;

const
  _inHari     : Integer = 6;
  _inHariDlta : Integer = 1;
  _inBlnAmbil : Integer = 2;
  _inBln      : Integer = 3;
  _stpBln     : integer = 1;
  _kolTmpKode : Integer = 1;
  _kolTmpQty  : Integer = 2;
  _kolGenNo   : Integer = 0;
  _kolGenKode : Integer = 1;
  _kolGenNm   : Integer = 2;
  _kolGenQty  : Integer = 3;
  _kolGenUom  : Integer = 4;
  _kolPVMADId : Integer = 5;
  _kolLdSts   : Integer = 6;
  _HeaderFlag : Integer = 100003;




function TfrmGeneratePKMAverage.StrPadLeft(const S: String; Len: Integer; C: Char): String;
var
  L,i   : Integer;
  temp  : string;
begin                 /// pindahkan ke urmsUnit
  L := Length(S);
  if L < Len then
  begin
    temp:= S;
    for i:=1 to (Len-L) do
      temp := C + temp;
    Result := temp;
  end
  else if (L = Len) then
  begin
    Result := S;
  end
  else
  begin
    temp:= '';
    for i:=1 to Len do
      temp :=  S[i] + temp;
    Result := temp;
  end;
end;

procedure TfrmGeneratePKMAverage.IsiGridFix;
var
  i,j   : integer;
  tmp   : double;

begin

  for i:= sgData.FixedRows to sgData.RowCount - 1 do
  begin
    cShowWaitWindow( IntToStr(sgData.RowCount - 1) + ' / '+ IntToStr(i) );
    Application.ProcessMessages;

    with AdvGridTmp do
    begin
      Filter.Clear;
      FilterActive := False;
      with Filter.Add do
      begin
        Condition := sgData.Cells[_kolGenKode , i];
        Column := _kolTmpKode;
      end;

    FilterActive := True;

    tmp:= 0;

      for j:= FixedRows to RowCount - 1 do
      begin
        Application.ProcessMessages;
        tmp := tmp + Floats[_kolTmpQty, j];
      end;

    end;

    sgData.Floats[_kolGenQty,i]:= (-1 * tmp) / ((_inHari + _inHariDlta)*_inBlnAmbil*
                      (_inBln - 1) + iDayWeekFrst + iDayWeekFor );

  end;

  AdvGridTmp.FilterActive:= False;
  cCloseWaitWindow;

end;

procedure TfrmGeneratePKMAverage.IsiGridAwal;
var
    sSQL : string;
begin

  sSQL := 'SELECT a.BRG_CODE as Kode, a.BRG_NAME as Nama'
        + ' FROM BARANG a'
        + ' inner join REF$MERCHANDISE b on a.BRG_MERCHAN_ID = b.MERCHAN_ID'
        + ' where  b.MERCHAN_CODE='+ Quot(cbpMerchandise.Cells[1,cbpMerchandise.Row])
        + ' AND a.BRG_IS_ACTIVE=1'
        + ' ORDER BY a.BRG_CODE';

  cShowWaitWindow('Get Data Merchandise') ;
  Application.ProcessMessages;

  cQueryToGrid(sSQL, sgData);


//  sgData.ColWidths[_kolGenKode] := 64;
//  sgData.ColWidths[_kolGenNm] := 200;
  sgData.ColCount := sgData.ColCount + 1;
  sgData.Columns[_kolGenQty].Header:= 'Qty';
//  sgData.ColWidths[_kolGenQty] := 64;
  sgData.AutoSizeColumns(True, 5);

  cCloseWaitWindow;
end;

function TfrmGeneratePKMAverage.GetSQLQty(sMMddYY1, sMMddYY2, UnitID : string): string;
begin


  Result := 'SELECT A.BSS_BRG_CODE as Kode_barang,'
          + ' sum(A.BSS_QTY * B.KONVSAT_SCALE) AS QTY'
          + ' FROM BARANG_STOK_SIRKULASI A, REF$KONVERSI_SATUAN B, BARANG BRG,'
          + ' REF$MERCHANDISE C'
          + ' WHERE (B.KONVSAT_BRG_CODE = A.BSS_BRG_CODE)'
          + ' AND (B.KONVSAT_SAT_CODE_FROM = A.BSS_SAT_CODE)'
          + ' AND (A.BSS_DATE BETWEEN '+ sMMddYY1 +' AND '+ sMMddYY2 +') AND'
          + ' (A.BSS_BRG_CODE = BRG.BRG_CODE)'
          + ' and (BRG.BRG_MERCHAN_ID = C.MERCHAN_ID)'
          + ' AND (C.MERCHAN_CODE = '+  Quot(cbpMerchandise.Cells[1,cbpMerchandise.Row]) + ')'
          + ' AND (A.BSS_TYPE = '+  Quot('POS')
          + ' OR  A.BSS_TYPE = '+ Quot('KRING') + ')'
          + ' AND brg.BRG_IS_ACTIVE = 1'
          + ' AND BRG.BRG_IS_STOCK = 1'
//          + ' AND (BRG.BRG_CODE = '000232')
          + ' GROUP BY A.BSS_BRG_CODE'
end;

procedure TfrmGeneratePKMAverage.FormShow(Sender: TObject);
begin
  inherited;

  dtmTanggal.Date:= cGetServerTime;

  if not assigned(SetCbMerchandise) then
    SetCbMerchandise := TSetCbMerchandise.Create;

  SetCbMerchandise.SetComboMerchan(cbpMerchandise);

end;

procedure TfrmGeneratePKMAverage.cbpMerchandiseChange(Sender: TObject);
begin
  inherited;

  edtMerchandName.Clear;
  if cbpMerchandise.Row > 0 then
    edtMerchandName.Text := cbpMerchandise.Cells[2,cbpMerchandise.Row];

  cClearGrid(sgData, False);

end;

procedure TfrmGeneratePKMAverage.cbpMerchandiseExit(Sender: TObject);
begin
  inherited;

  if cbpMerchandise.Text = '' then edtMerchandName.Clear;

end;

procedure TfrmGeneratePKMAverage.btnProsesClick(Sender: TObject);
var
  iBln    : integer;
  iTh     : integer;
  i       : integer;
  iTglNow : Integer;
  iTgl1   : Integer;
  iTgl2   : Integer;
  tDt1    : TDate;
  tDt2    : TDate;
  tDt3    : TDate;
  tDt4    : TDate;
  tDt     : TDate;
  bAkrBln : Boolean;
  SS      : TStringList;

begin
  inherited;

  if Trim(edtMerchandName.Text) = '' then
  begin
    CommonDlg.ShowMessage('Tipe Merchandise belum diisi');
    Exit;
  end;


  bis_edited := False;
  bAkrBln    := False;

  if bis_Save then
  begin
    bis_Save  := False;
    sNOBukti  := cbpMerchandise.Cells[1,cbpMerchandise.Row] + '/'
                 + StrPadLeft(IntToStr(MasterNewUnit.ID),2,'0') +'/'+
                  FormatDateTime('yyyy-mm-dd', dtmTanggal.DateTime)
                 + '/' + FormatDateTime('hh:mm:ss', cGetServerTime);

    edtNoBukti.Text:= sNOBukti;

  end;


  FormatSettings.DateSeparator   := '/';
  FormatSettings.ShortDateFormat := 'mm/dd/yyyy';

  iBln := StrToInt(FormatDateTime('MM', cGetServerTime));
  iTh  := StrToInt(FormatDateTime('YYYY', cGetServerTime));

  SS := TStringList.Create;
  Self.Enabled := False;
  cShowWaitWindow;

  try

    tDt := StrToDate(IntToStr(iBln + _stpBln ) + FormatSettings.DateSeparator + '01'+
                        FormatSettings.DateSeparator + IntToStr(iTh));

    for i:=0 to (_inBln -1) do
    begin
      if i = 0 then
      begin
          //inisialisasi
          tDt3 := Now;
          tDt4 := Now;

          tDt1    := IncDay( IncMonth( tDt, - i ), - 1 - _inHari );
          tDt2    := IncDay( IncMonth( tDt, - i ), - 1 );
          iTglNow := StrToInt(FormatDateTime('DD', dtmTanggal.Date));
          iTgl1   := StrToInt(FormatDateTime('DD', tDt1));
          iTgl2   := StrToInt(FormatDateTime('DD', tDt2));

          if (iTglNow > 7) and (iTglNow < iTgl1) then
          begin
            tDt1 := IncMonth( tDt, ( -1 -i ) );
            tDt2 := IncDay( IncMonth( tDt, ( -1 -i ) ), _inHari );

            iDayWeekFrst  := _inHari + _inHariDlta;
            iDayWeekFor   := 0;

          end
          else if(iTglNow >= iTgl1) and (iTglNow <= iTgl2 ) then
          begin
            tDt1 := IncMonth( tDt, ( -1 -i ) );
            tDt2 := IncDay( IncMonth( tDt, ( -1 -i ) ), _inHari );
            tDt3 := IncDay( IncMonth( tDt, ( -1 -i ) ), iTgl1 );
            tDt4 := IncDay( IncMonth( tDt, ( -1 -i ) ), iTglNow );
            bAkrBln := True;

            iDayWeekFrst  := _inHari + _inHariDlta;
            iDayWeekFor   := iTglNow - iTgl1 + _inHariDlta;
          end
          else// iTglNow >= 1 and iTglNow <=7
          begin
            tDt2 := IncDay( IncMonth( tDt, ( -1 -i ) ), iTglNow );
            tDt1 := IncMonth( tDt, ( -1 -i ) );

            iDayWeekFrst  := iTglNow;
            iDayWeekFor   := 0;

          end;


        SS.Add(GetSQLQty(QuotDTNol(tDt1), QuotD(tDt2, True), IntToStr(MasterNewUnit.ID)));

        if bAkrBln = True then
        begin
          SS.Add(GetSQLQty(QuotDTNol(tDt3), QuotD(tDt4, True), IntToStr(MasterNewUnit.ID)));
          bAkrBln:= False;
        end;

      end
      else
      begin
        tDt2 := IncDay( IncMonth( tDt, - i ), - 1 );
        tDt1 := IncDay( IncMonth( tDt, - i ), - 1 - _inHari );

        SS.Add(GetSQLQty(QuotDTNol(tDt1), QuotD(tDt2, True), IntToStr(MasterNewUnit.ID)));

        tDt2 := IncDay( IncMonth( tDt, ( -1 -i ) ), _inHari );
        tDt1 := IncMonth( tDt, ( -1 -i ) );

        SS.Add(GetSQLQty(QuotDTNol(tDt1), QuotD(tDt2, True), IntToStr(MasterNewUnit.ID)));

      end;

    end;
//    tmpS := GetSQLQty(Quot('12/01/2008 00:00:00'), Quot('02/28/2009 00:00:00'), IntToStr(MasterNewUnit.ID));
//      SS.Add(tmpS);
      SS.SaveToFile('sql.txt');

      SetCbMerchandise.kOpSQLs(SS, AdvGridTmp);
      IsiGridAwal;
      IsiGridFix;

  finally
    cCloseWaitWindow;
    Self.Enabled := True;
    SS.Free;
  end;

end;

procedure TfrmGeneratePKMAverage.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  //frmMain.DestroyMenu((Sender as TForm));
  Action := caFree;
end;

procedure TfrmGeneratePKMAverage.FormDestroy(Sender: TObject);
begin
  inherited;
   frmGeneratePKMAverage := nil;
end;

procedure TfrmGeneratePKMAverage.FormActivate(Sender: TObject);
begin
  inherited;
  //frmMain.CreateMenu((Sender as TForm));
end;

procedure TfrmGeneratePKMAverage.frftr5btn1btnAddClick(Sender: TObject);
var
  SSd       : TStringList;
  i         : Integer;
  sSQL      : string;
  ihNextId  : Integer;
  idNextId  : Integer;
//  cDtSep    : Char;
  sShrDt    : String;
//  cDesSep   : Char;
  dQty      : Double;

begin
  inherited;

  SSd := TStringList.Create;


//  cDtSep            := DateSeparator;
  FormatSettings.DateSeparator     := '/';
  sShrDt            := FormatSettings.ShortDateFormat;
  FormatSettings.ShortDateFormat   := 'mm/dd/yyyy';
//  cDesSep           := DecimalSeparator;
//  DecimalSeparator  := '.';

  try
    cShowWaitWindow;
    Self.Enabled  := False;
    if bis_edited = False then
    begin
      ihNextId := cGetNextID('gen_pkm_average_id');
      sSQL := 'INSERT INTO pkm_average(pkmave_id,pkmave_unt_id, pkmave_date_create,'
              + ' NOBUKTI) VALUES('
              + Quot(IntToStr(ihNextId))
              + ', '+ Quot(IntToStr(MasterNewUnit.ID))
              + ', '+ Quot(FormatDateTime('mm/dd/yyyy', dtmTanggal.Date))
              + ', '+ Quot(sNOBukti)
              + ' )';
      try

        cExecSQL(sSQL, False , _HeaderFlag);
        SimpanBlob(sSQL, _HeaderFlag);
        for i:= sgData.FixedRows to sgData.RowCount - 1 do
        begin
          dQty     := sgData.Floats[_kolGenQty,i];
          idNextId := cGetNextID('gen_pkm_average_id_detail');


            sSQL := 'INSERT INTO pkm_average_detail (pkmad_header_id, pkmad_header_unt_id,'
                  + ' pkmad_id, pkmad_brg_kode, pkmad_qty) VALUES('
                  +   Quot(IntToStr(ihNextId))
                  + ', '+ Quot(IntToStr(MasterNewUnit.ID))
                  + ', '+ Quot(IntToStr(idNextId))
                  + ', '+ Quot(sgData.Cells[_kolGenKode , i])
                  + ', '+ QuotedStr(FormatFloat('0.00', dQty ))
                  + ')';

            SSd.Add(sSQL);

        end;

        SimpanBlob(SSd, _HeaderFlag);
        kExecuteSQLs(_HeaderFlag,SSd);
        cCommitTrans;
        bis_Save  := True;
        CommonDlg.ShowMessage('Data telah disimpan.');
      except
        on E: EIBError do
        begin
          cRollbackTrans;
          CommonDlg.ShowError('Data gagal disimpan.');
          exit;
        end;
      end;

    end
    else
    begin
      try
        for i:= sgData.FixedRows to sgData.RowCount - 1 do
        begin
          if sgData.Ints[_kolLdSts, i] =1 then
          begin
            dQty := sgData.Floats[_kolGenQty,i];
            sSQL := 'UPDATE pkm_average_detail a SET a.pkmad_qty = '
                  +   QuotedStr(FormatFloat('0.00', dQty ))
                  + ' WHERE A.PKMAD_ID = ' + Quot(sgData.Cells[_kolPVMADId, i])
                  + ' AND A.PKMAD_HEADER_UNT_ID = ' + IntToStr(MasterNewUnit.ID)
                  + ';';

            SSd.Add(sSQL);
          end;

        end;

        kExecuteSQLs(_HeaderFlag,SSd);
        SimpanBlob(SSd, _HeaderFlag);
        CommonDlg.ShowMessage('Data telah disimpan.');

      except
        on E: EIBError do
        begin
          cRollbackTrans;
          CommonDlg.ShowError('Data gagal disimpan.');
        end;
      end;

    end;



  finally
    SSd.Free;
    cCloseWaitWindow;
    Self.Enabled      := True;
//    DateSeparator     := cDtSep;
    FormatSettings.ShortDateFormat   := sShrDt;
//    DecimalSeparator  := cDesSep;

  end;


end;

procedure TfrmGeneratePKMAverage.FormCreate(Sender: TObject);
begin
  inherited;

  dtmTanggal.Date   := cGetServerTime;
  FormatSettings.DateSeparator     := ',';
  bis_Save          := True;
  lblHeader.Caption := 'GENERATE PKM AVERAGE';

end;

procedure TfrmGeneratePKMAverage.frftr5btn1btnRefreshClick(
  Sender: TObject);
var
  sSQL : string;
begin
  inherited;

  cShowWaitWindow;
  Application.ProcessMessages;

  sSQL := 'SELECT A.PKMAD_BRG_KODE as KODE, C.BRG_ALIAS as NAMA, A.PKMAD_QTY as Qty,'
        + ' C.BRG_SAT_CODE_STOCK as "SATUAN STOCK", PKMAD_ID AS Id'
        + ' FROM PKM_AVERAGE_DETAIL A'
        + ' INNER JOIN PKM_AVERAGE B ON A.PKMAD_HEADER_ID = B.PKMAVE_ID'
        + ' AND A.PKMAD_HEADER_UNT_ID = B.PKMAVE_UNT_ID'
        + ' INNER JOIN BARANG C ON A.PKMAD_BRG_KODE = C.BRG_CODE'
        + ' WHERE B.IS_PROSES=0'
        + ' AND B.NOBUKTI='+ Quot(edtNoBukti.Text)
        + ' AND B.PKMAVE_UNT_ID = ' + IntToStr(MasterNewUnit.ID) ;

  cQueryToGrid(sSQL, sgData);

//  sgData.ColWidths[_kolGenKode] := 64;
//  sgData.ColWidths[_kolGenNm] := 200;
//  sgData.ColWidths[_kolGenQty] := 64;
//  sgData.ColWidths[_kolGenUom] := 64;
//  sgData.ColWidths[_kolPVMADId] := 64;
  sgData.Columns[_kolPVMADId].ReadOnly := True;
  sgData.ColCount := sgData.ColCount + 1;
  sgData.Columns[_kolLdSts].Header := 'Flag';
//  sgData.ColWidths[_kolLdSts] := 64;
  sgData.Columns[_kolLdSts].ReadOnly := True;
  sgData.AutoSizeColumns(True, 5);

  cCloseWaitWindow;
  bis_Save  := True;

end;

procedure TfrmGeneratePKMAverage.edtSearchChange(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  for i := sgData.FixedRows to sgData.RowCount - 1 do
  begin
    if Pos(edtSearch.Text, sgData.Cells[_kolGenKode,i]) > 0 then
    begin
      sgData.Row := i;
      sgData.Col := _kolGenKode;
      Exit;
    end
  end;
end;

procedure TfrmGeneratePKMAverage.sgDataEditChange(Sender: TObject; ACol,
  ARow: Integer; Value: String);
begin
  inherited;

  if bis_edited = True then
    if ACol = _kolGenQty then
      sgData.Ints[_kolLdSts, ARow]:= 1;

end;

procedure TfrmGeneratePKMAverage.frftr5btn1btnUpdateClick(Sender: TObject);
var
  sSQL  : string;

begin
  inherited;

  sSQL := 'SELECT nobukti FROM pkm_average';

  with cLookUp('Daftar Generate PKM', sSQL) do
  begin
    try
      if Strings[0] <> '' then
      begin
        edtNoBukti.Text := Strings[0];
        bis_edited := True;
      end
      else
        cClearGrid(sgData, False);

    finally
      Free;
    end;
  end;

end;

procedure TfrmGeneratePKMAverage.btnTransferClick(Sender: TObject);
var
  dQty      : Double;
  SS        : TStringList;
//  cDesSep   : Char;
  sSQL      : string;
  i         : Integer;

begin
  inherited;


  if edtNoBukti.Text <> '' then
  begin
    if (CommonDlg.Confirm('Anda yakin transfer data ' + Application.Title +' ?') = mrYes) then
    begin

//      cDesSep           := DecimalSeparator;
//      DecimalSeparator  := '.';

      SS := TStringList.Create;

      try
        Self.Enabled  := False;
//        try
          for i:= sgData.FixedRows to sgData.RowCount - 1 do
          begin

            dQty := sgData.Floats[_kolGenQty,i];

            sSQL := 'UPDATE barang SET BRG_PKM_AVERAGE='
                  +  QuotedStr(FormatFloat('0.00', dQty ))
                  + ' WHERE BRG_CODE = ' + Quot( sgData.Cells[_kolGenKode, i])
                  + ';';

            SS.Add(sSQL);

          end;

          sSQL := 'UPDATE pkm_average SET IS_PROSES=1'
                + ' WHERE NOBUKTI='+ Quot(edtNoBukti.Text)
                + ' AND PKMAVE_UNT_ID = ' + IntToStr(MasterNewUnit.ID)
                + ';';

          if (SimpanBlob(SS, _HeaderFlag) and kExecuteSQLs(_HeaderFlag,SS)) and
              (cExecSQL(sSQL,False,_HeaderFlag) and SimpanBlob(sSQL, _HeaderFlag)) then
          begin
            cCommitTrans;
            CommonDlg.ShowMessage('Transfer selesai.')
          end
          else
          begin
            cRollbackTrans;
            CommonDlg.ShowMessage('Gagal Transfer data.')
          end;




//        except
//          on E: EIBError do
//          begin
//
//          end;
//        end;

      finally
        SS.Free;
        Self.Enabled      := True;
//        DecimalSeparator  := cDesSep;
      end;
    end;
  end;


end;

procedure TfrmGeneratePKMAverage.btnPkmAvDPrintClick(Sender: TObject);
var
  sSQL : string;
begin
  inherited;

  if edtNoBukti.Text <> '' then
  begin

    sSQL := 'SELECT '+ GetCompanyHeader(FLoginFullname,MasterNewUnit.Nama,
                                        cGetServerTime , dtmTanggal.DateTime)
          + ' B.NOBUKTI, A.PKMAD_BRG_KODE as KODE, C.BRG_ALIAS as NAMA,'
          + ' A.PKMAD_QTY as Qty,'
          + ' C.BRG_SAT_CODE_STOCK as "SATUAN STOCK"'
          + ' FROM PKM_AVERAGE_DETAIL A'
          + ' INNER JOIN PKM_AVERAGE B ON A.PKMAD_HEADER_ID = B.PKMAVE_ID'
          + ' AND A.PKMAD_HEADER_UNT_ID = B.PKMAVE_UNT_ID'
          + ' INNER JOIN BARANG C ON A.PKMAD_BRG_KODE = C.BRG_CODE'
          + ' AND B.NOBUKTI='+ Quot(edtNoBukti.Text)
          + ' ORDER BY A.PKMAD_BRG_KODE' ;

    dmReportNew.EksekusiReport('frcetakPKMaVe_detail', sSQL,'',True);

  end;

end;

procedure TfrmGeneratePKMAverage.btnProsesEnter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmGeneratePKMAverage.btnPkmAvDPrintEnter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmGeneratePKMAverage.btnTransferEnter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmGeneratePKMAverage.btnTransferExit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

procedure TfrmGeneratePKMAverage.btnPkmAvDPrintExit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

procedure TfrmGeneratePKMAverage.btnProsesExit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

procedure TfrmGeneratePKMAverage.frftr5btn1btnCloseClick(Sender: TObject);
begin
  inherited;
  frftr5btn1.btnCloseClick(Sender);

end;

end.
