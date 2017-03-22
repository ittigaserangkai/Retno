unit uFrmGenPO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialogBrowse, StdCtrls, ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, System.Actions, ufraFooterDialog3Button, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxButtons, Vcl.Menus, Vcl.ActnList;

type
  TfrmGenPO = class(TfrmMasterDialogBrowse)
    pnTop: TPanel;
    cbbMerchanGroup: TComboBox;
    lbl3: TLabel;
    lbl4: TLabel;
    dtTglSOAwal: TcxDateEdit;
    dtTglSOAkhir: TcxDateEdit;
    lb1: TLabel;
    btAmbilSO: TcxButton;
    bvl1: TBevel;
    lb2: TLabel;
    dtTglPo: TcxDateEdit;
    lb3: TLabel;
    edKet: TEdit;
    pnSummary: TPanel;
    lbRefreshGroup: TLabel;
    lbDelRow: TLabel;
    lbAddRow: TLabel;
    pmAgPO: TPopupMenu;
    popAddItem: TMenuItem;
    popRemoveItem: TMenuItem;
    cboTipePo: TComboBox;
    Label1: TLabel;
    dtTglValid: TcxDateEdit;
    Label2: TLabel;
    chkOtomatis: TCheckBox;
    chkManual: TCheckBox;
    lb5: TLabel;
    Label3: TLabel;
    edGRAlamat: TEdit;
    edGRUnitCode: TEdit;
    edGRUniNama: TEdit;
    lbHint: TLabel;
    spmn1: TPopupMenu;
    POGLOBALsatuPOuntuksemuastore1: TMenuItem;
    POTerpisahPOsatuanuntukmasing2store1: TMenuItem;
    lb6: TLabel;
    RefreshUrutanData1: TMenuItem;
    chk714: TCheckBox;
    btnAmbilPlu: TcxButton;
    dtPluFrom: TcxDateEdit;
    dtPluTo: TcxDateEdit;
    Label5: TLabel;
    btnRefresh: TcxButton;
    procedure actSaveExecute(Sender: TObject);
    procedure btAmbilSOClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure agSODataCellValidate(Sender: TObject; ACol, ARow: Integer;
      var Value: String; var Valid: Boolean);
    procedure lbRefreshGroupClick(Sender: TObject);
    procedure agSODataKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure agSODataKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure agSODataRowUpdate(Sender: TObject; OldRow, NewRow: Integer);
    procedure lbAddRowClick(Sender: TObject);
    procedure lbDelRowClick(Sender: TObject);
    procedure popAddItemClick(Sender: TObject);
    procedure popRemoveItemClick(Sender: TObject);
    procedure agSODataEllipsClick(Sender: TObject; ACol, ARow: Integer;
      var S: String);
    procedure btnRefreshClick(Sender: TObject);
    procedure cboTipePoChange(Sender: TObject);
    procedure agSODataCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure agSODataClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure chkOtomatisClick(Sender: TObject);
    procedure chkManualClick(Sender: TObject);
    procedure edGRUnitCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure agSODataCellChanging(Sender: TObject; OldRow, OldCol, NewRow,
      NewCol: Integer; var Allow: Boolean);
    procedure POGLOBALsatuPOuntuksemuastore1Click(Sender: TObject);
    procedure POTerpisahPOsatuanuntukmasing2store1Click(Sender: TObject);
    procedure cbbMerchanGroupChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chk714Click(Sender: TObject);
    procedure btnAmbilPluClick(Sender: TObject);
  private
    FFixedRow: Integer;
    FIDTrans: Integer;
//    FPO: TPO;
    FGRUnitID: Integer;
    FIncUnit: string;
    FSSTipePO: TStrings;
    FTPPOID: Integer;
    isKeyDownDetect: Boolean;
    iStartDynCol, iDynColCount : Integer;
    iLastGenID : Integer;
    procedure CalcFooter;
    procedure clearRow(aRow:integer);
    procedure deleteEmptyQty;
    procedure GetUnitQty;
    function iContainedIn(aBrgCode: string; aCurrentRow:integer; var
        aFoundRow:integer): Boolean;
    procedure insertCalc(aRow: integer);
    procedure isiPOItems(itemRow, aPOItemID:integer; isPOGlobal:boolean;
        aUnitGR:integer=0);
    function isiPOHeader(aRow, genID: integer; isPOGlobal:boolean; aUntGR:integer;
        aAlamatGR:string; aPONumPx:integer): Integer;
    function isiPOStores(aKol, aRow, aPOItemID : Integer): Double;
    procedure LoadDataToCbbMerchanGrup;
    procedure LoadUnit4Grid;
    procedure NotCekFixedRow;
    procedure saveAndGenerate(isPOGlobal : boolean);
    procedure SetComboTipePo;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGenPO: TfrmGenPO;

implementation

uses uRetnoUnit, uTSCommonDlg, DateUtils, ufrmPODisp, uFormProperty, uAppUtils;

const
  _rtItem   : Integer = 1;
  _rtSubKat : Integer = 2;
  _rtKat    : Integer = 3;
  _rtDiv    : Integer = 4;

  _Kol_x_Node : string = 'Kol_x_Node';
  _Kol_i_No : string = 'Kol_i_No';
  _Kol_i_RowType : string = 'Kol_i_RowType';
  _Kol_s_Sort : string = 'Kol_s_Sort';
  _kol_b_Cek : string = '_kol_b_Chek';
  _Kol_s_TipeBrgPO : string = 'Kol_s_TipeBrgPO';
  _Kol_s_SupKode : string = 'Kol_s_SupKode';
//  _Kol_s_SupMGKode : string = 'Kol_s_SupMGKode';
  _Kol_s_SupNama : string = 'Kol_s_SupNama';
  _Kol_i_BrgSup_ID : String = 'Kol_i_BrgSup_ID';
  _Kol_i_BrgSup_Unit : String = 'Kol_i_BrgSup_Unit';
  _Kol_s_BrgKode : string = 'Kol_s_BrgKode';
  _Kol_s_BrgNama : string = 'Kol_s_BrgNama';
  _Kol_f_Harga : string = 'Kol_f_Harga';
  _kol_f_Tax : String = 'Kol_f_Tax';
  _Kol_s_Satuan : string = 'Kol_s_Satuan';
  _Kol_f_Disc1 : String = 'Kol_f_Disk1';
  _Kol_f_Disc2 : String = 'Kol_f_Disk2';
  _Kol_f_Disc3 : String = 'Kol_f_Disk3';
  _Kol_i_isBKP : string = 'Kol_i_isBKP';
  _kol_i_isSupPKP : String = 'kol_i_isSupPKP';
  _Kol_i_isStok : String = 'Kol_i_isStok';
  _Kol_f_PPN : String = 'Kol_f_PPN';
  _Kol_f_PPNPersen : String = 'Kol_f_PPNPersen';
  _Kol_f_PPNBM : String = 'Kol_f_PPNBM';
  _Kol_f_PPNBMPersen : String = 'Kol_f_PPNBMPersen';
  _Kol_f_TotalDisc : String = 'Kol_f_TotalDisc';
  _Kol_f_Unt_Qty_ : string = 'Kol_f_Unt_Qty_';
  _Kol_i_Unt_SODID_ : string = 'Kol_i_Unt_SODID_';
  _Kol_f_Unt_SODQty_ : string = 'Kol_i_Unt_SODQty_';
  _Kol_f_Unt_3M_ : string = 'Kol_i_Unt_3M_';
  _Kol_f_Unt_OHand_ : string = 'Kol_i_Unt_OHand_';
  _Kol_f_JmlQty : string = 'Kol_f_JmlQty';
  _Kol_f_JmlHrg : string = 'Kol_f_JmlHrg';
  _Kol_f_TotalHrg : String = 'Kol_f_TotalHrg';
  _kol_f_HargaJual : String = 'Kol_f_HargaJual';
  _kol_f_HargaJualDisc : String = 'Kol_f_HargaJualDisc';

//  _Kol_i_TipeBrg  : string = '_Kol_i_TipeBrg';

  sSQL4Unit : string = 'select distinct UNT_ID, UNT_CODE, UNT_NAME'
                     + ' from Aut$Unit'
                     + ' where UNT_IS_ACTIVE = 1'
                     + ' order by UNT_ID';
  sLmt  : string = '||';

{$R *.dfm}

procedure TfrmGenPO.actSaveExecute(Sender: TObject);
var
  isKonsinyasi: Boolean;
  aSql: string;
begin
  inherited;
  {
   ISPATRACONTRABON = 0 -> brang kredit
   ISPATRACONTRABON = 1 -> kontrabon
   ISPATRACONTRABON = 2 -> barang konsinyasi (murni barang titipan, Join Businis
  }
  isKonsinyasi := False;
  aSql := 'Select TPBRG_ID from REF$TIPE_BARANG'
      + ' where ISPATRACONTRABON = 2';
  {with cOpenQuery(aSql) do
  begin
    try
      while not Eof do
      begin
        if FTPPOID = Fields[0].AsInteger then
        begin
          isKonsinyasi := True;
          Break;
        end;
        Next;
      end;
    finally
      Free;
    end;
  end;
  }
  if not isKonsinyasi then
    spmn1.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y)
  else
    POTerpisahPOsatuanuntukmasing2store1Click(nil);
end;

procedure TfrmGenPO.LoadUnit4Grid;
var i, iTempCount: integer;
begin
  {
  agSOData.Clear;
  agSOData.RowCount := 2;
  agSOData.ColCount := 1;

  agSOData.Columns[0].Name      := _Kol_x_Node;
  agSOData.Columns[0].Header    := '';
  agSOData.Columns[0].Width     := 0;
  agSOData.MergeCells(0,0,1,2);

  iStartDynCol := 28;

  for i:= 1 to iStartDynCol-1 do
  begin
    with agSOData.Columns.Add do
    case i of
    1 : begin
          Name      := _Kol_i_No;
          Header    := 'Analisa PR Konsolidasi';
          Alignment := taCenter;
          Width     := 35;
          agSOData.Cells[Index,1] := 'No';
        end;
    2 : begin
          Name      := _Kol_i_RowType;
          Header    := '';
          Width     := 0;
        end;
    3 : begin
          Name      := _Kol_s_Sort;
          Header    := '';
          Width     := 0;
        end;
    4 : begin
          Name      := _kol_b_Cek;
          Header    := '';
          Alignment := tacenter;
          ReadOnly  := True;
          Color     := clBtnFace;
          Width     := 30;
          agSOData.Cells[Index,1] := 'All';
        end;

    5 : begin
          Name      := _Kol_s_TipeBrgPO;
          Header    := '';
          Alignment := taLeftJustify;
          ReadOnly  := True;
          Color     := clBtnFace;
          Width     := 100;
          agSOData.Cells[Index,1] := 'PO Item Type';
        end;
    6 : begin
          Name      := _Kol_s_SupKode;
          Header    := 'Kode Suplier';
          Alignment := taLeftJustify;
          Width     := 70;
          Editor    := edEditBtn;
          agSOData.Cells[Index,1] := 'Kd Suplier';
        end;
    7 : begin
          Name      := _Kol_s_SupNama;
          Header    := 'Nama Suplier';
          Alignment := taLeftJustify;
          ReadOnly  := True;
          Color     := clBtnFace;
          Width     := 200;
          agSOData.Cells[Index,1] := 'Nama Suplier';
        end;
    8 : begin
          Name      := _Kol_i_BrgSup_ID;
          Header    := 'BrgSup_ID';
          Alignment := taLeftJustify;
          ReadOnly  := True;
          Color     := clBtnFace;
          Fixed     := True;
          Width     := 0;
          agSOData.Cells[Index,1] := 'Nama Suplier';
        end;

    9 : begin
          Name      := _Kol_i_BrgSup_Unit;
          Header    := 'BrgSup_Unit';
          Alignment := taLeftJustify;
          ReadOnly  := True;
          Color     := clBtnFace;
          Fixed     := True;
          Width     := 0;
          agSOData.Cells[Index,1] := 'Nama Suplier';
        end;

    10: begin
          Name      := _Kol_s_BrgKode;
          Header    := 'Kode Barang';
          Alignment := taLeftJustify;
          Width     := 70;
          Editor    := edEditBtn;
          agSOData.Cells[Index,1] := 'PLU';
        end;
    11: begin
          Name      := _Kol_s_BrgNama;
          Header    := 'Nama';
          Alignment := taLeftJustify;
          ReadOnly  := True;
          Color     := clBtnFace;
          Width     := 200;
          agSOData.Cells[Index,1] := 'Nama Item';
        end;
    12: begin
          Name      := _Kol_f_Harga;
          Header    := 'Harga';
          Alignment := taRightJustify;
          Width     := 100;
          ReadOnly  := True;
          Color     := clBtnFace;
          agSOData.Cells[Index,1] := 'Harga Beli';
        end;
    13: begin
          Name      := _kol_f_Tax;
          Header    := 'Total Pajak';
          Alignment := taRightJustify;
          Width     := 0;
          Fixed     := True;
          ReadOnly  := True;
          Color     := clBtnFace;
          agSOData.Cells[Index,1] := 'Total Pajak';
        end;
    14: begin
          Name      := _Kol_s_Satuan;
          Header    := 'Satuan';
          Alignment := taLeftJustify;
          Width     := 60;
          ReadOnly  := True;
          Color     := clBtnFace;
          agSOData.Cells[Index,1] := 'UOM';
          agSOData.MergeCells(1,0,i,1);
        end;
    15: begin
          Name      := _Kol_f_Disc1;
          Header    := 'Discount Beli';
          Alignment := taLeftJustify;
          Width     := 80;
          ReadOnly  := True;
          Color     := clBtnFace;
          agSOData.Cells[Index,1] := 'Disc1 %';
        end;
    16: begin
          Name      := _Kol_f_Disc2;
          Header    := 'Disc2 %';
          Alignment := taLeftJustify;
          Width     := 80;
          ReadOnly  := True;
          Color     := clBtnFace;
          agSOData.Cells[Index,1] := 'Disc2 %';
        end;
    17: begin
          Name      := _Kol_f_Disc3;
          Header    := 'Disc3 Rp';
          Alignment := taLeftJustify;
          Width     := 80;
          ReadOnly  := True;
          Color     := clBtnFace;
          agSOData.Cells[Index,1] := 'Disc3 Rp';
          agSOData.MergeCells(i-2,0,3,1);
        end;
    18: begin
          Name      := _Kol_i_isBKP;
          Header    := 'is BKP';
          Alignment := taLeftJustify;
          Width     := 0;
          Fixed     := True;
          ReadOnly  := True;
          Color     := clBtnFace;
          agSOData.Cells[Index,1] := 'is BKP';
        end;
    19: begin
          Name      := _kol_i_isSupPKP;
          Header    := 'is Sup PKP';
          Alignment := taLeftJustify;
          Width     := 0;
          Fixed     := True;
          ReadOnly  := True;
          Color     := clBtnFace;
          agSOData.Cells[Index,1] := 'is Sup PKP';
        end;
    20: begin
          Name      := _Kol_i_isStok;
          Header    := 'is Stock';
          Alignment := taLeftJustify;
          Width     := 0;
          Fixed     := True;
          ReadOnly  := True;
          Color     := clBtnFace;
          agSOData.Cells[Index,1] := 'is Stock';
        end;
    21: begin
          Name      := _Kol_f_PPN;
          Header    := 'PPN';
          Alignment := taLeftJustify;
          Width     := 0;
          Fixed     := True;
          ReadOnly  := True;
          Color     := clBtnFace;
          agSOData.Cells[Index,1] := 'PPN';
        end;
    22: begin
          Name      := _Kol_f_PPNPersen;
          Header    := 'TAX';
          Alignment := taLeftJustify;
          Width     := 80;
          ReadOnly  := True;
          Color     := clBtnFace;
          agSOData.Cells[Index,1] := 'PPN %';
        end;
    23: begin
          Name      := _Kol_f_PPNBM;
          Header    := 'PPNBM';
          Alignment := taLeftJustify;
          Width     := 0;
          Fixed     := True;
          ReadOnly  := True;
          Color     := clBtnFace;
          agSOData.Cells[Index,1] := 'PPNBM';
        end;
    24: begin
          Name      := _Kol_f_PPNBMPersen;
          Header    := 'PPNBM %';
          Alignment := taLeftJustify;
          Width     := 80;
          ReadOnly  := True;
          Color     := clBtnFace;
          agSOData.Cells[Index,1] := 'PPNBM %';
          agSOData.MergeCells(i-2,0,3,1);
        end;
    25: begin
          Name      := _Kol_f_TotalDisc;
          Header    := 'Total Disc';
          Alignment := taLeftJustify;
          Width     := 0;
          Fixed     := True;
          ReadOnly  := True;
          Color     := clBtnFace;
          agSOData.Cells[Index,1] := 'Total Disc';
        end;
    26: begin
          Name      := _kol_f_HargaJual;
          Header    := 'Harga Jual';
          Alignment := taRightJustify;
          Width     := 100;
          Fixed     := True;
          ReadOnly  := True;
          Color     := clBtnFace;
          agSOData.Cells[Index,1] := 'Harga';
        end;
    27: begin
          Name      := _kol_f_HargaJualDisc;
          Alignment := taRightJustify;
          Width     := 80;
          Fixed     := True;
          ReadOnly  := True;
          Color     := clBtnFace;
          agSOData.Cells[Index,1] := 'Disc %';
          agSOData.MergeCells(i-1,0,2,1);
        end;

    end;
  end;

  iTempCount := 0;
  agSOData.AddRow;

  with cOpenQuery(sSQL4Unit) do
  try

    while not EOF do
    begin
      iTempCount := iTempCount + 1;
      with agSOData.Columns.Add do
      begin
        Name        := _Kol_f_Unt_Qty_+fieldByName('UNT_ID').AsString;
        Header      := fieldByName('UNT_CODE').AsString;
        Alignment   := taRightJustify;
        Color       := clYellow;
        Width       := 50;

        agSOData.Cells[Index,1] := 'QTY';
      end;

      iTempCount := iTempCount + 1;
      with agSOData.Columns.Add do
      begin
        Name        := _Kol_i_Unt_SODID_+fieldByName('UNT_ID').AsString;
        ReadOnly    := true;
        Width       := 0;
        Fixed       := True;
        Color       := clBtnFace;

        agSOData.Cells[Index,1] := 'SO Num';
      end;

      iTempCount := iTempCount + 1;
      with agSOData.Columns.Add do
      begin
        Name        := _Kol_f_Unt_SODQty_+fieldByName('UNT_ID').AsString;
        ReadOnly    := true;
        Width       := 0;
        Fixed       := True;
        Color       := clBtnFace;
        agSOData.Cells[Index,1] := 'SODQty_'+fieldByName('UNT_ID').AsString;
      end;

      iTempCount := iTempCount + 1;
      with agSOData.Columns.Add do
      begin
        Name        := _Kol_f_Unt_3M_+fieldByName('UNT_ID').AsString;
        ReadOnly    := true;
        Width       := 0;
        Fixed       := True;
        Color       := clBtnFace;
        agSOData.Cells[Index,1] := '3M_'+fieldByName('UNT_ID').AsString;
      end;

      iTempCount := iTempCount + 1;
      with agSOData.Columns.Add do
      begin
        Name        := _Kol_f_Unt_OHand_+fieldByName('UNT_ID').AsString;
        ReadOnly    := true;
        Width       := 0;
        Fixed       := True;
        Color       := clBtnFace;
        agSOData.Cells[Index,1] := 'Hand_'+fieldByName('UNT_ID').AsString;
      end;

      next;
    end;
  finally
    Free;
  end;
  iDynColCount := iTempCount;

  with agSOData.Columns.Add do
  begin
    Name        := _Kol_f_JmlQty;
    Header      := 'Jumlah';
    Alignment   := taRightJustify;
    ReadOnly    := True;
    Color       := clBtnFace;
    Font.Style  := [fsBold];
    Width       := 70;

    agSOData.Cells[Index,1] := 'QTY';
  end;

  with agSOData.Columns.Add do
  begin
    Name        := _Kol_f_JmlHrg;
    Header      := 'Jumlah';
    Alignment   := taRightJustify;
    ReadOnly    := True;
    Color       := clBtnFace;
    Font.Style  := [fsBold];
    Width       := 120;

    agSOData.Cells[Index,1] := 'Harga';
    agSOData.MergeCells(Index-1,0,2,1);
  end;

  with agSOData.Columns.Add do
  begin
    Name        := _Kol_f_TotalHrg;
    Header      := 'Jumlah';
    Alignment   := taRightJustify;
    ReadOnly    := True;
    Color       := clMoneyGreen;
    Font.Style  := [fsBold];
    Width       := 120;

    agSOData.Cells[Index,1] := 'Total';
  end;

  agSOData.AddRow;

  agSOData.FixedRows := 2;
  agSOData.FixedCols := 4;
  agSOData.FixedFooters := 1;
  agSOData.FloatingFooter.Visible := true;
  }

end;

procedure TfrmGenPO.btAmbilSOClick(Sender: TObject);
var sSQL : string;
  iEnableCN: Integer;
    i: Integer;
    serverDate : TDateTime;
    dTotalDisc, dTmpQty{, dRTmpHarga, dPriceUse} : Double;
    isBookMerchan : Boolean;
begin
  inherited;
  {
  if (agSOData.RowCount < agSOData.FixedRows+agSOData.FixedFooters + 1)
    or (
      (agSOData.RowCount = agSOData.FixedRows+agSOData.FixedFooters + 1)
      and (Trim(agSOData.Cells[agSOData.ColumnByName[_Kol_s_BrgNama].index, agSOData.FixedRows]) <> '')
    ) or (agSOData.RowCount > agSOData.FixedRows+agSOData.FixedFooters + 1)
  then
    if not (CommonDlg.Confirm('Masih ada data dalam Grid,'#13'Tetap akan Mengambil data SO?'#13#13'(Data yang telah berubah tidak akan di simpan)') = mrYes) then
      Exit;


  serverDate := cGetServerTime;

  isBookMerchan := Trim(GetParameterValue('BOOKS_MERCHANDISE_ID',MasterCompany.ID))=IntToStr(cGetIDfromCombo(cbbMerchanGroup));

  sSQL := 'select '+
          '  a.*, '+

          '  (SELECT Z(SUM(bss.bss_qty*ks.KONVSAT_SCALE)*-1) '+
          '  from barang_stok_sirkulasi bss, REF$KONVERSI_SATUAN ks '+
          '  where '+
          '    bss.bss_brg_code=a.SOD_BRG_CODE '+
          '    and bss.bss_date BETWEEN '+QuotD(IncDay(serverDate,-90))+' and '+QuotD(serverDate, True)+' '+
          '    and ks.KONVSAT_BRG_CODE = bss.BSS_BRG_CODE '+
          '    AND ks.KONVSAT_SAT_CODE_FROM = bss.BSS_SAT_CODE '+
          '    and bss.bss_type='+Quot('POS')+') three_m_sales, '+
          '  (SELECT Z(SUM(bss.bss_qty*ks.KONVSAT_SCALE)) '+
          '  from barang_stok_sirkulasi bss, REF$KONVERSI_SATUAN ks '+
          '  where '+
          '    bss.bss_brg_code=a.SOD_BRG_CODE'+
          '    and bss.bss_date <= '+QuotD(serverDate, True)+' '+
          '    and ks.KONVSAT_BRG_CODE = bss.BSS_BRG_CODE '+
          '    AND ks.KONVSAT_SAT_CODE_FROM = bss.BSS_SAT_CODE '+
          '    ) on_hand, '+

          '  i.BHJ_SELL_PRICE, '+
          '  i.BHJ_DISC_PERSEN, '+
          '  h.tpbrg_name, '+
          '  c.brg_tpbrg_id, '+
          '  e.sup_name, '+
          '  e.sup_code, '+
          '  e.sup_is_PKP, '+
          '  d.BRGSUP_SUPMG_SUB_CODE, '+
          '  c.BRG_IS_STOCK, '+
          '  c.brg_name, '+
          '  f.SUPMG_LEAD_TIME, '+
          '  g.PJK_PPN, '+
          '  g.PJK_PPNBM, '+
          '  d.BRGSUP_MARK_UP, '+
          '  d.BRGSUP_IS_ENABLE_CN '+
          'from '+
          '  so_detil a '+
          '  join so b on (b.so_no = a.sod_so_no and b.so_unt_id = a.sod_so_unt_id) '+
          '  join barang c on (c.brg_code = a.sod_brg_code) '+
          '  join barang_suplier d on (d.brgsup_id=a.sod_brgsup_id ) '+
          '  join suplier e on (e.sup_code=d.brgsup_sup_code) '+
          '  JOIN SUPLIER_MERCHAN_GRUP f ON (f.SUPMG_SUB_CODE=d.BRGSUP_SUPMG_SUB_CODE) '+
          '  JOIN REF$PAJAK g ON (g.PJK_ID=c.BRG_PJK_ID '+
          '    ) '+
          '  join REF$TIPE_BARANG h on (h.tpbrg_id=c.brg_tpbrg_id ) '+
          '  join BARANG_HARGA_JUAL i on (i.BHJ_BRG_CODE=a.SOD_BRG_CODE'+
          '    and i.BHJ_SAT_CODE=a.SOD_SAT_CODE ) '+
          '  join REF$TIPE_PO_BARANG tp on (tp.POBRG_TPBRG_ID=c.BRG_TPBRG_ID ) '+
          'where '+
          '  b.so_date between '+QuotD(dtTglSOAwal.Date)+' and '+QuotD(dtTglSOAkhir.Date)+' '+
          '  and a.sod_is_ordered <> 1 '+
          '  and c.brg_merchan_id='+IntToStr(cGetIDfromCombo(cbbMerchanGroup)) +
          '  and tp.POBRG_TPPO_ID='+IntToStr(FTPPOID)+
          'order by '+
          '  c.brg_tpbrg_id, e.sup_code, a.sod_brg_code, a.sod_unt_id'
          ;

  with cOpenQuery(sSQL) do
  begin
    if Eof then
    begin
      CommonDlg.ShowMessage('Tidak ada SO untuk : '+Quot(cbbMerchanGroup.Text)+#13+'antara tanggal '+QuotD(dtTglSOAwal.Date)+#13+'sampai tanggal '+QuotD(dtTglSOAkhir.Date)+#13+'yang ber tipe '+cboTipePo.Text+#13+'yang belum di proses');
      Exit;
    end;

    cClearGrid(agSOData, False);

    i := 0;
    dTmpQty := 0;
    while not Eof do
    begin

      if not ((agSOData.Cells[agSOData.ColumnByName[_Kol_s_TipeBrgPO].Index, i-1 + agSOData.FixedRows] = fieldByName('tpbrg_name').AsString)
        and (agSOData.Cells[agSOData.ColumnByName[_Kol_s_SupKode].Index, i-1 + agSOData.FixedRows] = fieldByName('sup_code').AsString)
        and (agSOData.Cells[agSOData.ColumnByName[_Kol_s_BrgKode].Index, i-1 + agSOData.FixedRows] = fieldByName('SOD_Brg_Code').AsString)
      ) then
      begin
        iEnableCN := fieldByName('BRGSUP_IS_ENABLE_CN').AsInteger;
         (* tipe po credit dan barang tidak returnable
             FTPPOID = 1 and IsEnableCN = 0
           tipe po selain credit dan barang returnable
           *)

         if ((FTPPOID = 1) and (iEnableCN = 1)) or ((FTPPOID <> 1) and (iEnableCN = 0))
         then
         begin
          Next;
          Continue;
         end;


        agSOData.AddRow;

        dTotalDisc :=
          ((fieldByName('SOD_PRICE').AsFloat * fieldByName('SOD_DISC1').AsFloat) /100) +
          ((fieldByName('SOD_PRICE').AsFloat -((fieldByName('SOD_PRICE').AsFloat * fieldByName('SOD_DISC1').AsFloat) /100)) * fieldByName('SOD_DISC2').AsFloat / 100) +
          fieldByName('SOD_DISC3').AsFloat;

        if (FieldByName('SOD_IS_BKP').AsInteger = 1) then
        begin
           agSOData.Floats[agSOData.ColumnByName[_Kol_f_PPNPersen].Index, i+agSOData.FixedRows]   := fieldByName('PJK_PPN').AsFloat;
           agSOData.Floats[agSOData.ColumnByName[_Kol_f_PPNBMPersen].Index, i+agSOData.FixedRows] := fieldByName('PJK_PPNBM').AsFloat;
           agSOData.Floats[agSOData.ColumnByName[_Kol_f_PPN].Index, i+agSOData.FixedRows]         := ((fieldByName('SOD_PRICE').AsFloat-dTotalDisc)
                                                                                                       *agSOData.Floats[agSOData.ColumnByName[_Kol_f_PPNPersen].Index, i+agSOData.FixedRows])
                                                                                                     /100;
           agSOData.Floats[agSOData.ColumnByName[_Kol_f_PPNBM].Index, i+agSOData.FixedRows]       := ((fieldByName('SOD_PRICE').AsFloat-dTotalDisc)
                                                                                                       *agSOData.Floats[agSOData.ColumnByName[_Kol_f_PPNBMPersen].Index, i+agSOData.FixedRows])
                                                                                                     /100;
        end else begin
           agSOData.Floats[agSOData.ColumnByName[_Kol_f_PPNPersen].Index, i+agSOData.FixedRows]   := 0;
           agSOData.Floats[agSOData.ColumnByName[_Kol_f_PPNBMPersen].Index, i+agSOData.FixedRows] := 0;
           agSOData.Floats[agSOData.ColumnByName[_Kol_f_PPN].Index, i+agSOData.FixedRows]         := 0;
           agSOData.Floats[agSOData.ColumnByName[_Kol_f_PPNBM].Index, i+agSOData.FixedRows]       := 0;
        end;

        agSOData.Floats[agSOData.ColumnByName[_kol_f_Tax].Index, i + agSOData.FixedRows]      := agSOData.Floats[agSOData.ColumnByName[_Kol_f_PPN].Index, i + agSOData.FixedRows]
                                                                                                 + agSOData.Floats[agSOData.ColumnByName[_Kol_f_PPNBM].Index, i + agSOData.FixedRows];
        agSOData.Ints[agSOData.ColumnByName[_Kol_i_RowType].Index, i + agSOData.FixedRows]  := _rtItem;
        agSOData.Cells[agSOData.ColumnByName[_Kol_s_TipeBrgPO].Index, i + agSOData.FixedRows] := fieldByName('tpbrg_name').AsString;
        agSOData.Cells[agSOData.ColumnByName[_Kol_s_SupKode].Index, i + agSOData.FixedRows]   := fieldByName('sup_code').AsString;
        agSOData.Cells[agSOData.ColumnByName[_Kol_s_SupNama].Index, i + agSOData.FixedRows]   := fieldByName('sup_name').AsString;
        agSOData.Cells[agSOData.ColumnByName[_Kol_i_BrgSup_ID].Index, i + agSOData.FixedRows] := fieldByName('SOD_BrgSup_ID').AsString;
        agSOData.Cells[agSOData.ColumnByName[_Kol_s_BrgKode].Index, i + agSOData.FixedRows]   := fieldByName('SOD_Brg_Code').AsString;
        agSOData.Cells[agSOData.ColumnByName[_Kol_s_BrgNama].Index, i + agSOData.FixedRows]   := fieldByName('Brg_Name').AsString;
        agSOData.Floats[agSOData.ColumnByName[_Kol_f_Harga].Index, i + agSOData.FixedRows]     := fieldByName('SOD_PRICE').AsFloat;
        agSOData.Cells[agSOData.ColumnByName[_Kol_s_Satuan].Index, i + agSOData.FixedRows]    := fieldByName('SOD_Sat_Code').AsString;
        agSOData.Floats[agSOData.ColumnByName[_Kol_f_Disc1].Index, i + agSOData.FixedRows]    := fieldByName('SOD_DISC1').AsFloat;
        agSOData.Floats[agSOData.ColumnByName[_Kol_f_Disc2].Index, i + agSOData.FixedRows]    := fieldByName('SOD_DISC2').AsFloat;
        agSOData.Floats[agSOData.ColumnByName[_Kol_f_Disc3].Index, i + agSOData.FixedRows]    := fieldByName('SOD_DISC3').AsFloat;
        agSOData.Ints[agSOData.ColumnByName[_Kol_i_isBKP].Index, i + agSOData.FixedRows]      := fieldByName('SOD_IS_BKP').AsInteger;
        agSOData.Ints[agSOData.ColumnByName[_kol_i_isSupPKP].Index, i + agSOData.FixedRows]      := fieldByName('sup_is_PKP').AsInteger;
        agSOData.Ints[agSOData.ColumnByName[_Kol_i_isStok].Index, i + agSOData.FixedRows]     := fieldByName('BRG_IS_STOCK').AsInteger;

        agSOData.Floats[agSOData.ColumnByName[_Kol_f_TotalDisc].Index, i + agSOData.FixedRows]:= dTotalDisc;
        agSOData.Cells[agSOData.ColumnByName[_Kol_s_Sort].Index, i + agSOData.FixedRows]      := fieldByName('brg_tpbrg_id').AsString+'.'+fieldByName('sup_code').AsString+'.'+fieldByName('SOD_Brg_Code').AsString;


       agSOData.Floats[agSOData.ColumnByName[_kol_f_HargaJual].Index, i + agSOData.FixedRows]      := fieldByName('BHJ_SELL_PRICE').AsFloat;;
       agSOData.Floats[agSOData.ColumnByName[_kol_f_HargaJualDisc].Index, i + agSOData.FixedRows]  := fieldByName('BHJ_DISC_PERSEN').AsFloat;;
        
        agSOData.AddCheckBox(agSOData.ColumnByName[_kol_b_Cek].Index, i + agSOData.FixedRows,False,False);
        if i > 0 then
        begin
          agSOData.Floats[agSOData.ColumnByName[_Kol_f_JmlQty].Index, i-1 + agSOData.FixedRows]   := dTmpQty;
          agSOData.Floats[agSOData.ColumnByName[_Kol_f_JmlHrg].Index, i-1 + agSOData.FixedRows]   := dTmpQty * agSOData.Floats[agSOData.ColumnByName[_Kol_f_Harga].Index, i-1 + agSOData.FixedRows];

          agSOData.Floats[agSOData.ColumnByName[_Kol_f_TotalHrg].Index, i-1 + agSOData.FixedRows] := dTmpQty *
          (agSOData.Floats[agSOData.ColumnByName[_Kol_f_Harga].Index, i-1 + agSOData.FixedRows]
            -agSOData.Floats[agSOData.ColumnByName[_Kol_f_TotalDisc].Index, i-1 + agSOData.FixedRows]
            +agSOData.Floats[agSOData.ColumnByName[_kol_f_Tax].Index, i-1 + agSOData.FixedRows]
          );
          dTmpQty := 0;
        end;
      end
      else
      begin
        i := i-1;
      end;

      agSOData.Floats[agSOData.ColumnByName[_Kol_f_Unt_Qty_+ IntToStr(fieldByName('SOD_Unt_ID').AsInteger)].Index, i + agSOData.FixedRows] := fieldByName('SOD_Qty').AsFloat;
      agSOData.Ints[agSOData.ColumnByName[_Kol_i_Unt_SODID_+ IntToStr(fieldByName('SOD_Unt_ID').AsInteger)].Index, i + agSOData.FixedRows] := fieldByName('SOD_ID').AsInteger;
      agSOData.Floats[agSOData.ColumnByName[_Kol_f_Unt_SODQty_+ IntToStr(fieldByName('SOD_Unt_ID').AsInteger)].Index, i + agSOData.FixedRows] := fieldByName('SOD_Qty').AsInteger;
      agSOData.Floats[agSOData.ColumnByName[_Kol_f_Unt_3M_+ IntToStr(fieldByName('SOD_Unt_ID').AsInteger)].Index, i + agSOData.FixedRows] := fieldByName('three_m_sales').AsInteger;
      agSOData.Floats[agSOData.ColumnByName[_Kol_f_Unt_OHand_+ IntToStr(fieldByName('SOD_Unt_ID').AsInteger)].Index, i + agSOData.FixedRows] := fieldByName('on_hand').AsInteger;

      dTmpQty := dTmpQty + fieldByName('SOD_Qty').AsFloat;

      i := i+1;
      next;

      if Eof then
      begin
        agSOData.Floats[agSOData.ColumnByName[_Kol_f_JmlQty].Index, i-1 + agSOData.FixedRows]   := dTmpQty;
        agSOData.Floats[agSOData.ColumnByName[_Kol_f_JmlHrg].Index, i-1 + agSOData.FixedRows]   := dTmpQty * agSOData.Floats[agSOData.ColumnByName[_Kol_f_Harga].Index, i-1 + agSOData.FixedRows];

        agSOData.Floats[agSOData.ColumnByName[_Kol_f_TotalHrg].Index, i-1 + agSOData.FixedRows] := dTmpQty *
        (agSOData.Floats[agSOData.ColumnByName[_Kol_f_Harga].Index, i-1 + agSOData.FixedRows]
          -agSOData.Floats[agSOData.ColumnByName[_Kol_f_TotalDisc].Index, i-1 + agSOData.FixedRows]
          +agSOData.Floats[agSOData.ColumnByName[_kol_f_Tax].Index, i-1 + agSOData.FixedRows]
        );
        dTmpQty := 0;
      end;
    end;
  end;
   }
  CalcFooter;
end;

procedure TfrmGenPO.CalcFooter;
var i:Integer;
begin

// ################################### cek lagi untuk : jika pada group ada nilainya
    {agSOData.FloatingFooter.ColumnCalc[agSOData.ColumnByName[_Kol_i_No].Index] := acCOUNT;
    for i:=iStartDynCol to iStartDynCol+iDynColCount-1 do
      begin
          agSOData.FloatingFooter.ColumnCalc[i] := acSUM;
      end;

    agSOData.FloatingFooter.ColumnCalc[agSOData.ColumnByName[_Kol_f_JmlQty].Index]  := acSUM;
    agSOData.FloatingFooter.ColumnCalc[agSOData.ColumnByName[_Kol_f_JmlHrg].Index]  := acSUM;

    agSOData.FloatingFooter.ColumnCalc[agSOData.ColumnByName[_Kol_f_JmlQty].Index]  := acSUM;
    agSOData.FloatingFooter.ColumnCalc[agSOData.ColumnByName[_Kol_f_JmlHrg].Index]  := acSUM;

    agSOData.FloatingFooter.ColumnCalc[agSOData.ColumnByName[_Kol_f_TotalHrg].Index]:= acSUM;

    agSOData.AutoNumberCol(agSOData.ColumnByName[_Kol_i_No].Index);
    }
end;

procedure TfrmGenPO.FormDestroy(Sender: TObject);
begin
  inherited;
  frmGenPO := nil;
end;

procedure TfrmGenPO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FSSTipePO.Free;
  inherited;
  Action := caFree;
end;

procedure TfrmGenPO.FormShow(Sender: TObject);
begin

  inherited;
//  if (FMasterIsHO <> 1) and (FMasterIsStore <> 0) then
  begin
    CommonDlg.ShowError('Hanya unit merchandise yang bisa membuat PSL!');
    Close;
    exit;
  end;  

  FSSTipePO := TStringList.Create;
//  FPO := TPO.Create(self);

  LoadUnit4Grid;

//  FFixedRow := agSOData.FixedRows;

  SetComboTipePo;

  FIDTrans := 0;
//  FPO.ClearProperties;

//  dtTglPo.Date    := cGetServerTime;
  dtTglValid.Date := dtTglPo.Date+14;

  dtTglSOAwal.Date :=  StartOfTheMonth(dtTglPo.Date);
  dtTglSOAkhir.Date := EndOfTheMonth(dtTglSOAwal.Date);

  edKet.Text := '';
  edGRUnitCode.Text := '';
  edGRUniNama.Text := '';
  edGRAlamat.Text := '';
  lbHint.Caption := '';
//  dtPluFrom.Date  := cGetServerTime;
//  dtPluTo.Date    := cGetServerTime;

  LoadDataToCbbMerchanGrup;

  try
    cboTipePo.ItemIndex := 0;
    cboTipePoChange(Self);
  except;
  end;

end;

procedure TfrmGenPO.LoadDataToCbbMerchanGrup;
var
  sSQL: string;
begin
 sSQL := ' select merchan_id , merchan_name '
         + ' from ref$merchandise ';
// cQueryToComboObject(cbbMerchanGroup,sSQL);
end;

procedure TfrmGenPO.btnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmGenPO.insertCalc(aRow: integer);
var i: integer;
    dSumQty, dTotalDisc, dDisc123, dFirstDisc : Double;
begin
  dSumQty := 0;
  {
    for i:=iStartDynCol to iStartDynCol+iDynColCount do
    begin

        if PosEx('_UNT_QTY_',UpperCase(agSOData.Columns[i].Name)) > 0 then
        begin
          dSumQty := dSumQty + agSOData.Floats[i, aRow];
        end

    end;

  // hitung diskon awal
  dFirstDisc := agSOData.Floats[agSOData.ColumnByName[_Kol_f_Harga].Index, aRow] * agSOData.Floats[agSOData.ColumnByName[_Kol_f_Disc1].Index, aRow] / 100;

  // hitung total diskon
  dDisc123 :=
    dFirstDisc
    + ((agSOData.Floats[agSOData.ColumnByName[_Kol_f_Harga].Index, aRow]-dFirstDisc) * agSOData.Floats[agSOData.ColumnByName[_Kol_f_Disc2].Index, aRow] / 100)
    + agSOData.Floats[agSOData.ColumnByName[_Kol_f_Disc3].Index, aRow];

  dTotalDisc := dDisc123*dSumQty;

  // masukan total diskon grid
  agSOData.Floats[agSOData.ColumnByName[_Kol_f_TotalDisc].Index, aRow] := dTotalDisc;

  // hitung & masukan Pajak grid
  if (agSOData.Ints[agSOData.ColumnByName[_Kol_i_isBKP].Index, ARow] = 1) then
  begin
     agSOData.Floats[agSOData.ColumnByName[_Kol_f_PPN].Index, ARow]         := (((agSOData.Floats[agSOData.ColumnByName[_Kol_f_Harga].Index, ARow]-dDisc123)
                                                                                  *agSOData.Floats[agSOData.ColumnByName[_Kol_f_PPNPersen].Index, ARow])
                                                                                  /100)*dSumQty;
     agSOData.Floats[agSOData.ColumnByName[_Kol_f_PPNBM].Index, ARow]       := (((agSOData.Floats[agSOData.ColumnByName[_Kol_f_Harga].Index, ARow]-dDisc123)
                                                                                  *agSOData.Floats[agSOData.ColumnByName[_Kol_f_PPNBMPersen].Index, ARow])
                                                                                  /100)*dSumQty;
  end
  else
  begin
     agSOData.Floats[agSOData.ColumnByName[_Kol_f_PPNPersen].Index, ARow]   := 0;
     agSOData.Floats[agSOData.ColumnByName[_Kol_f_PPNBMPersen].Index, ARow] := 0;
     agSOData.Floats[agSOData.ColumnByName[_Kol_f_PPN].Index, ARow]         := 0;
     agSOData.Floats[agSOData.ColumnByName[_Kol_f_PPNBM].Index, ARow]       := 0;
  end;

  // masukan total pajak ke grid
  agSOData.Floats[agSOData.ColumnByName[_kol_f_Tax].Index, aRow] :=
    agSOData.Floats[agSOData.ColumnByName[_Kol_f_PPN].Index, aRow]
    + agSOData.Floats[agSOData.ColumnByName[_Kol_f_PPNBM].Index, aRow];


  agSOData.Floats[iStartDynCol+iDynColCount, aRow]   := dSumQty;
  agSOData.Floats[iStartDynCol+iDynColCount+1, aRow] := dSumQty* agSOData.Floats[agSOData.ColumnByName[_Kol_f_Harga].Index, aRow];

  // masukkan Total harga (qty * harga bersih)
  agSOData.Floats[agSOData.ColumnByName[_Kol_f_TotalHrg].Index, aRow] :=
    (
      agSOData.Floats[agSOData.ColumnByName[_Kol_f_JmlHrg].Index, aRow]
      -agSOData.Floats[agSOData.ColumnByName[_Kol_f_TotalDisc].Index, aRow]
      +agSOData.Floats[agSOData.ColumnByName[_kol_f_Tax].Index, aRow]
    );
   }
end;

procedure TfrmGenPO.agSODataCellValidate(Sender: TObject; ACol,
  ARow: Integer; var Value: String; var Valid: Boolean);
var aFoundRow : Integer;
    sSql : string;
    dateServer : TDateTime;
    isBookMerchan : Boolean;

begin
  inherited;
  Valid := True;
  
  if cboTipePo.ItemIndex < 0 then
  begin
    CommonDlg.ShowError('Isi dahulu tipe PO');
    Valid := false;
    if cboTipePo.CanFocus then cboTipePo.SetFocus;
    exit;
  end;
  {
  if (ACol in [agSOData.ColumnByName[_Kol_s_BrgKode].Index]) and (agSOData.Ints[agSOData.ColumnByName[_Kol_i_RowType].Index, ARow] = _rtItem) then
  begin
    aFoundRow := 0;
    if iContainedIn(Value, ARow, aFoundRow) then
    begin
      Valid:= False;
      agSOData.Row := aFoundRow;
      CommonDlg.ShowMessage('Item Sudah Ada Pada Daftar, Periksa Kembali...');
      agSOData.Refresh;
      Exit;
    end
    else
    begin
      if (Length(Value) < igProd_Code_Length) and (Trim(Value) <> '') then
      begin
        Value := StrPadLeft(Value,igProd_Code_Length,'0');
      end;

      isBookMerchan := Trim(GetParameterValue('BOOKS_MERCHANDISE_ID',MasterCompany.ID))=IntToStr(cGetIDfromCombo(cbbMerchanGroup));

      with TNewBarang.Create(Self) do
      begin
        try
          if LoadByKode(Value, True, True) then
          begin


            with TTPPOBRG.Create(Self) do
            begin
              try
                if loadByAllField(FTPPOID, TipeBarangID) then
                begin

                  with TBarangSupplier.create(Self) do
                  begin
                    try

                      if LoadByID(BrgSuppDefaultID) then
                      begin
                        (* tipe po credit dan barang tidak returnable
                             FTPPOID = 1 and IsEnableCN = 0
                           tipe po selain credit dan barang returnable
                        *)
                        if ((FTPPOID = 1) and (IsEnableCN = 0)) or
                           ((FTPPOID <> 1) and (IsEnableCN = 1))
                        then
                        begin
                          with TBarangHargaJual.Create(self) do
                          begin
                            try
                              if LoadByBarangKode(Kode, MasterNewUnit.ID, KodeSatuanBeli, MasterNewUnit.ID) then
                              begin
                                clearRow(ARow);
                                //barang
                                agSOData.Ints[agSOData.ColumnByName[_Kol_i_RowType].Index, ARow]    := _rtItem;
                                agSOData.Cells[agSOData.ColumnByName[_Kol_s_TipeBrgPO].Index, ARow] := GetTipeBarangName;
                                agSOData.Cells[agSOData.ColumnByName[_Kol_s_BrgKode].Index, ARow]   := Value;
                                agSOData.Cells[agSOData.ColumnByName[_Kol_s_BrgNama].Index, ARow]   := Nama;
                                agSOData.Ints[agSOData.ColumnByName[_Kol_i_isStok].Index, ARow]     := IsStock;

                                agSOData.Floats[agSOData.ColumnByName[_Kol_f_PPNPersen].Index, ARow]   := NewPajak.PPN;
                                agSOData.Floats[agSOData.ColumnByName[_Kol_f_PPNBMPersen].Index, ARow] := NewPajak.PPNBM;

                                agSOData.Ints[agSOData.ColumnByName[_Kol_i_BrgSup_ID].Index,ARow]   := BrgSuppDefaultID;
                                agSOData.Ints[agSOData.ColumnByName[_Kol_i_BrgSup_Unit].Index,ARow] := MasterNewUnit.ID;

                                //barang suplier
                                agSOData.Cells[agSOData.ColumnByName[_Kol_s_SupKode].Index, ARow]   := NewSupplier.Kode;
                                agSOData.Cells[agSOData.ColumnByName[_Kol_s_SupNama].Index, ARow]   := NewSupplier.Nama;
                                agSOData.Floats[agSOData.ColumnByName[_Kol_f_Harga].Index, ARow]    := HargaBeli;
                                agSOData.Cells[agSOData.ColumnByName[_Kol_s_Satuan].Index, ARow]    := KodeSatuanBeli;
                                agSOData.Floats[agSOData.ColumnByName[_Kol_f_Disc1].Index, ARow]    := Disc1;
                                agSOData.Floats[agSOData.ColumnByName[_Kol_f_Disc2].Index, ARow]    := Disc2;
                                agSOData.Floats[agSOData.ColumnByName[_Kol_f_Disc3].Index, ARow]    := Disc3;
                                agSOData.Ints[agSOData.ColumnByName[_Kol_i_isBKP].Index, ARow]      := IsBKP;                                agSOData.Ints[agSOData.ColumnByName[_kol_i_isSupPKP].Index, ARow]   := NewSupplier.IsPKP;
                                agSOData.Ints[agSOData.ColumnByName[_kol_i_isSupPKP].Index, ARow]   := NewSupplier.IsPKP;
                                agSOData.Cells[agSOData.ColumnByName[_Kol_s_Sort].Index, ARow]      := GetTipeBarangName+'.'+NewSupplier.Kode+'.'+KodeBarang;

                                //barang harga jual
                                agSOData.Floats[agSOData.ColumnByName[_kol_f_HargaJual].Index, ARow]      := SellPrice;
                                agSOData.Floats[agSOData.ColumnByName[_kol_f_HargaJualDisc].Index, ARow]  := DiscPersen;

                                dateServer := cGetServerTime;
                                sSql := 'select '+
                                        '  au.unt_id, '+

                                        '  (SELECT Z(SUM(bss.bss_qty*ks.KONVSAT_SCALE)*-1) '+
                                        '  from barang_stok_sirkulasi bss, REF$KONVERSI_SATUAN ks '+
                                        '  where '+
                                        '    bss.bss_brg_code='+Quot(Kode)+' '+
                                        '    and bss.bss_date BETWEEN '+QuotD(IncDay(dateServer,-90))+' and '+QuotD(dateServer, True)+' '+
                                        '    and ks.KONVSAT_BRG_CODE = bss.BSS_BRG_CODE '+
                                        '    AND ks.KONVSAT_SAT_CODE_FROM = bss.BSS_SAT_CODE '+
                                        '    and bss.bss_type='+Quot('POS')+') three_m_sales, '+

                                        '  (SELECT Z(SUM(bss.bss_qty*ks.KONVSAT_SCALE)) '+
                                        '    from barang_stok_sirkulasi bss, REF$KONVERSI_SATUAN ks '+
                                        '    where '+
                                        '      bss.bss_brg_code='+Quot(Kode)+' '+
                                        '      and bss.bss_date <= '+QuotD(dateServer, True)+' '+
                                        '      and ks.KONVSAT_BRG_CODE = bss.BSS_BRG_CODE '+
                                        '      AND ks.KONVSAT_SAT_CODE_FROM = bss.BSS_SAT_CODE '+
                                        '      ) on_hand '+

                                        'from '+
                                        'AUT$UNIT au '+
                                        'where au.UNT_IS_ACTIVE = 1'

                                ;


                                with cOpenQuery(sSql) do
                                begin
                                  while not Eof do
                                  begin
                                    agSOData.Cells[agSOData.ColumnByName[_Kol_i_Unt_SODID_+fieldByName('UNT_ID').AsString].Index, ARow] := '';
                                    agSOData.floats[agSOData.ColumnByName[_Kol_f_Unt_SODQty_+fieldByName('UNT_ID').AsString].Index, ARow] := 0;
                                    agSOData.floats[agSOData.ColumnByName[_Kol_f_Unt_3M_+fieldByName('UNT_ID').AsString].Index, ARow] := fieldByName('three_m_sales').AsFloat;
                                    agSOData.floats[agSOData.ColumnByName[_Kol_f_Unt_OHand_+fieldByName('UNT_ID').AsString].Index, ARow] := fieldByName('on_hand').AsFloat;
                                    Next;
                                  end;
                                end;

                                insertCalc(ARow);
                                CalcFooter;

                              end
                              else
                              begin
                                CommonDlg.ShowError('Cek Harga Jual ');
                                Valid := False;
                              end;

                            finally
                              Free;
                            end;
                          end;

                        end
                        else
                        begin
                          CommonDlg.ShowError('Cek tipe PO dan Returnable!');
                          Valid := False;
                        end;
                          
                      end
                      else
                      begin
                        CommonDlg.ShowError('Cek suplier!');
                        Valid := False;
                      end;

                    finally
                      Free;
                    end;
                  end;

                end
                else
                begin
                  Valid := False;
                  CommonDlg.ShowError('Cek tipe barang dan tipe po!');
                end;

              finally
                Free;
              end;
            end;
          
          end
          else
          begin
            Valid := False;
            CommonDlg.ShowError('Cek aktifasi dan validasi barang!');
          end;
            
        finally
          Free;
        end;
      end;


    end;
  end
  else if (ACol in [agSOData.ColumnByName[_Kol_s_SupKode].Index]) and (agSOData.Ints[agSOData.ColumnByName[_Kol_i_RowType].Index, ARow] = _rtItem) then
  begin
    if Trim(agSOData.Cells[agSOData.ColumnByName[_Kol_s_BrgKode].Index, ARow]) <> '' then
      begin

        isBookMerchan := Trim(GetParameterValue('BOOKS_MERCHANDISE_ID',MasterCompany.ID))=IntToStr(cGetIDfromCombo(cbbMerchanGroup));

        with TNewSupplier.Create(Self) do
        begin
          try
            if LoadByKode(Value) then
            begin
              with TBarangSupplier.Create(Self) do
              begin
                try

                  if LoadByID(GetId(agSOData.Cells[agSOData.ColumnByName[_Kol_s_BrgKode].Index, ARow], value)) then
                  begin
                    agSOData.Ints[agSOData.ColumnByName[_Kol_i_BrgSup_ID].Index,ARow]   := ID;
                    agSOData.Ints[agSOData.ColumnByName[_Kol_i_BrgSup_Unit].Index,ARow] := MasterNewUnit.ID;

                    agSOData.Floats[agSOData.ColumnByName[_Kol_f_Harga].Index, ARow]    := HargaBeli;
                    agSOData.Cells[agSOData.ColumnByName[_Kol_s_Satuan].Index, ARow]    := KodeSatuanBeli;
                    agSOData.Floats[agSOData.ColumnByName[_Kol_f_Disc1].Index, ARow]    := Disc1;
                    agSOData.Floats[agSOData.ColumnByName[_Kol_f_Disc2].Index, ARow]    := Disc2;
                    agSOData.Floats[agSOData.ColumnByName[_Kol_f_Disc3].Index, ARow]    := Disc3;
                    agSOData.Ints[agSOData.ColumnByName[_Kol_i_isBKP].Index, ARow]      := IsBKP;


                  end
                  else
                  begin
                    Valid := False;
                    CommonDlg.ShowError('Cek barang suplier!');
                  end;
                finally
                  Free;
                end;
              end;

              if Valid then
              begin
                agSOData.Cells[agSOData.ColumnByName[_Kol_s_SupKode].Index, ARow]   := Kode;
                agSOData.Cells[agSOData.ColumnByName[_Kol_s_SupNama].Index, ARow]   := Nama;
                agSOData.Ints[agSOData.ColumnByName[_kol_i_isSupPKP].Index, ARow]   := IsPKP;
                agSOData.Cells[agSOData.ColumnByName[_Kol_s_Sort].Index, ARow]      := agSOData.Cells[agSOData.ColumnByName[_Kol_s_TipeBrgPO].Index, ARow]+'.'+Kode+'.'+agSOData.Cells[agSOData.ColumnByName[_Kol_s_BrgKode].Index, ARow];
              end;

              insertCalc(ARow);
              CalcFooter;
          
            end
            else
            begin
              Valid := False;
              CommonDlg.ShowError('Cek suplier!');
            end;
          finally
            Free;
          end;
        end;


      end
    else
      Valid := False;
  end;

}
  insertCalc(ARow);

end;

procedure TfrmGenPO.isiPOItems(itemRow, aPOItemID:integer; isPOGlobal:boolean;
    aUnitGR:integer=0);
var iKol : Integer;
    dQtyPOItem : Double;
    iMG_ID : Integer;

begin
  dQtyPOItem := 0;
  {
  FPO.UpdatePOItems(
    agSOData.Cells[agSOData.ColumnByName[_Kol_s_BrgKode].index, itemRow], // aBarangKode
    agSOData.Ints[agSOData.ColumnByName[_Kol_i_BrgSup_ID].Index, itemRow], // aBarangSupplier_ID
    agSOData.Floats[agSOData.ColumnByName[_Kol_f_Disc1].Index, itemRow], // aDisc1
    agSOData.Floats[agSOData.ColumnByName[_Kol_f_Disc2].Index, itemRow], // aDisc2
    agSOData.Floats[agSOData.ColumnByName[_Kol_f_Disc3].Index, itemRow], // aDisc3
    aPOItemID,  //+ FIdxTmp , // aID
    agSOData.Ints[agSOData.ColumnByName[_Kol_i_isBKP].Index, itemRow], // aIsBKP
    agSOData.Ints[agSOData.ColumnByName[_Kol_i_isStok].Index, itemRow], // aIsStok
    MasterNewUnit.ID,
    0, //aPPN
    0, //aPPNBM
    agSOData.Floats[agSOData.ColumnByName[_Kol_f_PPNBMPersen].index, itemRow], //aPPNBMPersen
    agSOData.Floats[agSOData.ColumnByName[_Kol_f_PPNPersen].index, itemRow], //aPPNPersen
    agSOData.Floats[agSOData.ColumnByName[_Kol_f_Harga].index, itemRow], //aHarga

    0, // aQtyOrder
    agSOData.Cells[agSOData.ColumnByName[_Kol_s_Satuan].Index, itemRow], // aSatCodeOrder
    MasterNewUnit.ID, // aSCOUnitID
    0, //aTotal
    0, //aTotalDisc
    0, //aTotalTax
    0 //aTotalTemp
  );


  // hitung nilai2 Total pada setiap detail PO (buat master)

  if isPOGlobal then
  begin
    for iKol:= 1 to iDynColCount do
      begin
        if UpperCase(LeftStr(agSOData.Columns[(iStartDynCol-1) + iKol].Name, Length(_Kol_f_Unt_Qty_))) = UpperCase(_Kol_f_Unt_Qty_) then
          if agSOData.Floats[(iStartDynCol-1) + iKol, itemRow] > 0 then
          begin
            dQtyPOItem := dQtyPOItem + isiPOStores((iStartDynCol-1) +iKol,itemRow, aPOItemID );
          end;
      end;
  end
  else
  begin
      dQtyPOItem := dQtyPOItem + isiPOStores(aUnitGR,itemRow, aPOItemID );
  end;

  FPO.POItems[aPOItemID-1 ].QtyOrder  := dQtyPOItem;
  FPO.POItems[aPOItemID-1 ].Total     := dQtyPOItem * FPO.POItems[aPOItemID-1 ].Price;
  FPO.POItems[aPOItemID-1 ].TotalDisc := dQtyPOItem * FPO.POItems[aPOItemID-1 ].GetTotalDisc;
  FPO.POItems[aPOItemID-1 ].PPN       := dQtyPOItem * ((FPO.POItems[aPOItemID-1 ].Price-FPO.POItems[aPOItemID-1 ].GetTotalDisc)*FPO.POItems[aPOItemID-1 ].PPNPersen/100);
  FPO.POItems[aPOItemID-1 ].PPNBM     := dQtyPOItem * ((FPO.POItems[aPOItemID-1 ].Price-FPO.POItems[aPOItemID-1 ].GetTotalDisc)*FPO.POItems[aPOItemID-1 ].PPNBMPersen/100);
  FPO.POItems[aPOItemID-1 ].TotalTax  := FPO.POItems[aPOItemID-1 ].PPN + FPO.POItems[aPOItemID-1 ].PPNBM;
  FPO.POItems[aPOItemID-1 ].TotalTemp := FPO.POItems[aPOItemID-1 ].Total - FPO.POItems[aPOItemID-1 ].TotalDisc + FPO.POItems[aPOItemID-1 ].TotalTax;

  with TNewBarang.Create(Self) do
  begin
    try
      LoadByKode(agSOData.Cells[agSOData.ColumnByName[_Kol_s_BrgKode].index, itemRow]);
      iMG_ID := NewMerchandizeGroup.ID;
    finally
      Free;
    end;
  end;

  FPO.NewSupplierMerGroup.LoadBySupAndMG(agSOData.Cells[agSOData.ColumnByName[_Kol_s_SupKode].index, itemRow], iMG_ID);

  FPO.Disc  := FPO.Disc + FPO.POItems[aPOItemID-1 ].TotalDisc;
  FPO.Colie := FPO.Colie + dQtyPOItem;
  FPO.PPN   := FPO.PPN + FPO.POItems[aPOItemID-1].PPN;
  FPO.PPNBM := FPO.PPNBM + FPO.POItems[aPOItemID-1].PPNBM;
  FPO.Total := FPO.Total + FPO.POItems[aPOItemID-1 ].Total;
  }
end;

function TfrmGenPO.isiPOHeader(aRow, genID: integer; isPOGlobal:boolean;
    aUntGR:integer; aAlamatGR:string; aPONumPx:integer): Integer;
var
  dtValid : TDate;
  iValidOpt : Byte;
begin
  if chkOtomatis.Checked then
    iValidOpt := 0 //otomatis
  else if chkManual.Checked then
    iValidOpt := 2 //manual
  else
    iValidOpt := 1 // 7/14
  ;

  dtValid := dtTglValid.Date;
  {
  Result := FPO.UpdateData(
    0, // aColie
    edKet.Text, //aDescription
    0, // aDisc
    '', // aNewSupplierMerGroupKode
    MasterNewUnit.ID, // aNewUnitID
    '', // aNoBukti
    genID, // aGenID
    0, // aPPN
    0, // aPPNBM
    1, // aSatatusPOID
    MasterNewUnit.ID,
    MasterNewUnit.ID, // aStatusPOUntID
    dtTglPo.Date, // aTglBukti
    iValidOpt,
    dtValid, // aValidDate
    FTPPOID, // 1, // aTypePOID
    MasterNewUnit.ID, // aTipePoUntId
    0, // aTotal
    aUntGR,
    aAlamatGR,
    aPONumPx,
    FLoginId,
    FLoginUnitId

  );
    }
end;

function TfrmGenPO.isiPOStores(aKol, aRow, aPOItemID : Integer): Double;
var iTmpSODID : Integer;
begin
   {
    if agSOData.Ints[aKol +1, aRow] > 0 then
      iTmpSODID := agSOData.Ints[aKol +1, aRow]
    else
      iTmpSODID := 0;

    if agSOData.Floats[aKol, aRow] > 0 then
    begin
      FPO.UpdatePOStore(
        aPOItemID ,
        strToInt(MidStr(agSOData.Columns[aKol].Name,Length(_Kol_f_Unt_Qty_)+1,length(agSOData.Columns[aKol].Name))),
        agSOData.Floats[aKol, aRow],
        iTmpSODID
      );
    end;

  Result := agSOData.Floats[aKol, aRow];
  }
end;

procedure TfrmGenPO.lbRefreshGroupClick(Sender: TObject);
var sTmpKode : String;
    i : Integer;
begin
  inherited;
  {sTmpKode    := agSOData.Cells[agSOData.ColumnByName[_Kol_s_BrgKode].index, agSOData.row];

  agSOData.SortByColumn(agSOData.ColumnByName[_Kol_s_Sort].Index);

  for i:= agSOData.FixedRows to agSOData.RowCount-1 do
    begin
      if agSOData.Cells[agSOData.ColumnByName[_Kol_s_BrgKode].Index,i] = sTmpKode then
      begin
        agSOData.Row := i;
        Exit;
      end;
    end;
    }
end;

procedure TfrmGenPO.agSODataKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sTemp : string;
begin
  inherited;
  inherited;
  if(Key = VK_DOWN) then
  begin
    isKeyDownDetect := true
  end
  else isKeyDownDetect := False;
  {
  if (Key = vk_f5) and (not(ssctrl in Shift)) then
    if agSOData.Col = agSOData.ColumnByName[_Kol_s_BrgKode].Index then
      agSODataEllipsClick(agSOData.ColumnByName[_Kol_s_BrgKode],agSOData.ColumnByName[_Kol_s_BrgKode].Index, agSOData.Row, sTemp)
    else if agSOData.Col = agSOData.ColumnByName[_Kol_s_SupKode].Index then
      agSODataEllipsClick(agSOData.ColumnByName[_Kol_s_SupKode],agSOData.ColumnByName[_Kol_s_SupKode].Index, agSOData.Row, sTemp);
  }
end;

procedure TfrmGenPO.agSODataKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if(Key = VK_DOWN) and (not isKeyDownDetect) then
  begin
      lbAddRowClick(Sender);
  end
  else
    isKeyDownDetect := False;
  ;
end;

procedure TfrmGenPO.agSODataRowUpdate(Sender: TObject; OldRow,
  NewRow: Integer);
begin
  inherited;
  {if (OldRow >= 0) then
    if trim(agSOData.Cells[agSOData.ColumnByName[_Kol_s_BrgNama].Index, OldRow]) = '' then
    begin
      if agSOData.RowCount >= agSOData.FixedRows + agSOData.FixedFooters + 1 then
      begin
        agSOData.Rows[agSOData.Row].Clear;
        agSOData.RemoveSelectedRows;

        if agSOData.RowCount < agSOData.FixedRows + agSOData.FixedFooters then
        begin
          agSOData.AddRow;
          agSOData.Ints[agSOData.ColumnByName[_Kol_i_RowType].Index, agSOData.Row] := _rtItem;
        end;
        CalcFooter;
      end;
    end;
    }
end;

procedure TfrmGenPO.lbAddRowClick(Sender: TObject);
begin
  inherited;
  begin
    {agSOData.AddRow;
    agSOData.SelectRows(agSOData.RowCount-2,1);
    agSOData.Col := agSOData.ColumnByName[_Kol_s_BrgKode].Index;
    agSOData.Ints[agSOData.ColumnByName[_Kol_i_RowType].Index, agSOData.Row] := _rtItem;
    }
  end;
end;

procedure TfrmGenPO.lbDelRowClick(Sender: TObject);
begin
  inherited;
  {if agSOData.RowCount >= agSOData.FixedRows + agSOData.FixedFooters + 1 then
  begin
    agSOData.Rows[agSOData.Row].Clear;
    agSOData.RemoveSelectedRows;


    if agSOData.Row >= agSOData.RowCount-1 then
      agSOData.Row := agSOData.RowCount-2;
    if agSOData.RowCount < agSOData.FixedRows + agSOData.FixedFooters + 1 then
    begin
      agSOData.AddRow;

      agSOData.Ints[agSOData.ColumnByName[_Kol_i_RowType].Index, agSOData.Row] := _rtItem;
    end;
    CalcFooter;
  end;
  }
end;

procedure TfrmGenPO.popAddItemClick(Sender: TObject);
begin
  inherited;
  lbAddRowClick(popAddItem);
end;

procedure TfrmGenPO.popRemoveItemClick(Sender: TObject);
begin
  inherited;
  lbDelRowClick(popRemoveItem);
end;

procedure TfrmGenPO.agSODataEllipsClick(Sender: TObject; ACol,
  ARow: Integer; var S: String);
var
  sSQL : string;
begin
  inherited;
  {    if ACol = agSOData.ColumnByName[_Kol_s_BrgKode].Index then
      begin
        sSQL := 'select distinct '+
                '  a.brg_code Kode_Item, '+
                '  a.brg_name Nama_Item, '+
                '  a.brg_merk Merek '+

                'from '+
                '  barang a '+

                '  left join REF$TIPE_PO_BARANG tp on (tp.POBRG_TPBRG_ID= a.brg_TPBRG_ID ) '+
                'where '+
                ' a.BRG_IS_ACTIVE = 1'+
                ' and a.BRG_IS_VALIDATE = 1'+
                ' and a.brg_merchan_id='+IntToStr(cGetIDfromCombo(cbbMerchanGroup))+' '+
                ' and tp.POBRG_TPPO_ID='+IntToStr(FTPPOID)
        ;




        with cLookUp('Daftar Barang untuk Merchandise '+cbbMerchanGroup.Text, sSQL) do
        begin
          try
            if Strings[0] = '' then
              Exit;

              s := Strings[0];
          finally
            Free;
          end
        end;
      end
      else if ACol = agSOData.ColumnByName[_Kol_s_SupKode].Index then
      begin
        if Trim(agSOData.Cells[agSOData.ColumnByName[_Kol_s_BrgKode].Index, agSOData.Row]) <> '' then
        begin
          sSQL := 'select '+
                  '  s.sup_code KODE_SUP, '+
                  '  s.sup_name NAMA_SUP, '+
                  '  s.sup_address ALAMAT, '+
                  '  s.sup_city KOTA '+
                  'from '+
                  '  barang_suplier bs '+
                  '  left join suplier s on (s.sup_code=bs.brgsup_sup_code) '+
                  'where '+
                  '  bs.brgsup_brg_code='+Quot(agSOData.Cells[agSOData.ColumnByName[_Kol_s_BrgKode].Index, agSOData.Row])+' '+
                  ' '
          ;

          with cLookUp('Daftar Suplier untuk Item '+cbbMerchanGroup.Text, sSQL) do
          begin
            try
              if Strings[0] = '' then
                Exit;

                s := Strings[0];
            finally
              Free;
            end
          end;
        end;
      end;
    }
end;

function TfrmGenPO.iContainedIn(aBrgCode: string; aCurrentRow:integer; var
    aFoundRow:integer): Boolean;
var i: Integer;
begin
  Result := False;
  {
  for i:=agSOData.FixedRows to agSOData.RowCount-1 do
  begin
    if i <> aCurrentRow then
      if Trim(agSOData.Cells[agSOData.ColumnByName[_Kol_s_BrgKode].Index, i]) = Trim(aBrgCode) then
      begin
        Result := True;
        aFoundRow := i;
        exit;
      end;
  end;
  }
end;

procedure TfrmGenPO.btnRefreshClick(Sender: TObject);
var FFormProperty: TFormProperty;
begin
  inherited;

  uFrmPODisp.iPOGENNum := iLastGenID;

  FFormProperty := TFormProperty.Create;
  try
    FFormProperty.FMasterIsStore   := FMasterIsStore;
    FFormProperty.FLoginFullname   := FLoginFullname;
    FFormProperty.FLoginRole       := FLoginRole;
    FFormProperty.FLoginUsername   := FLoginUsername;
    FFormProperty.FLoginId         := FLoginId;
    FFormProperty.FLoginUnitId     := FLoginUnitId;
    FFormProperty.FFilePathReport  := FFilePathReport;
//    FFormProperty.FHostClient      := FHostClient;
//    FFormProperty.FIpClient        := FIpClient;
//
//    FFormProperty.FSelfUnitId      := MasterNewUnit.ID;
//    FFormProperty.FSelfCompanyID   := MasterCompany.ID;
//    FFormProperty.FMasterIsHo      := FMasterIsHO;
    FFormProperty.FMasterIsStore   := FMasterIsStore;

    frmPODisp := TfrmPODisp.CreateWithUser(Application, FFormProperty);

  finally
    FreeAndNil(FFormProperty);
  end;
end;

procedure TfrmGenPO.deleteEmptyQty;
var i:Integer;
begin
  {i:= agSOData.RowCount-1-agSOData.FixedFooters;

  while i >= agSOData.FixedRows do
  begin
    if not(agSOData.Floats[agSOData.ColumnByName[_Kol_f_JmlQty].Index, i] > 0) then
    begin
      agSOData.Rows[i].Clear;
      agSOData.RemoveRows(i,1);
    end;
    i:= i-1;
  end;
  }
end;

procedure TfrmGenPO.SetComboTipePo;
var
  sSQL: string;
begin

  sSQL  := 'select a.TPPO_ID, a.TPPO_CODE, a.TPPO_NAME,'
        + ' a.TTPO_TPBRG_ID, b.TPBRG_NAME'
        + ' from REF$TIPE_PO a'
        + ' left join REF$TIPE_BARANG b on a.TTPO_TPBRG_ID = b.TPBRG_ID';
  {with cOpenQuery(sSQL) do
  begin
    try
      cboTipePo.Clear;
      while not Eof do
      begin
        cboTipePo.Items.Append(FieldByName('TPPO_NAME').AsString
                          +'     '+ sLmt + FieldByName('TPPO_ID').AsString);
        FSSTipePO.Append(FieldByName('TPBRG_NAME').AsString);

        Next;
      end;  
    finally
      Free;
    end;
  end;
  }
end;

procedure TfrmGenPO.NotCekFixedRow;
begin
//  agSOData.SetCheckBoxState(agSOData.ColumnByName[_kol_b_Cek].Index, agSOData.FixedRows - 1, False);
end;

procedure TfrmGenPO.cboTipePoChange(Sender: TObject);
var
//  sFlt: string;
  tempTPPOID : Integer;
begin
  inherited;

  tempTPPOID := FTPPOID;
  FTPPOID := StrToInt(Copy(cboTipePo.Text, Pos(sLmt, cboTipePo.Text) +system.Length(sLmt) , System.Length(cboTipePo.Text) - Pos(cboTipePo.Text, sLmt) - system.Length(sLmt)));
  {
  if ((tempTPPOID <> FTPPOID) or (Sender = frmGenPO)) then
  begin
      cClearGrid(agSOData,False);
      agSOData.AddRow;
      agSOData.SelectRows(agSOData.RowCount-2,1);
      agSOData.Ints[agSOData.ColumnByName[_Kol_i_RowType].Index, agSOData.Row] := _rtItem;
  end;
   }

end;

procedure TfrmGenPO.agSODataCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
var
  aColNo  : Integer;
  aColCek : Integer;
begin
  inherited;
  {
  aColCek := agSOData.ColumnByName[_kol_b_Cek].Index;
  aColNo  := agSOData.ColumnByName[_Kol_i_No].Index;

  if agSOData.RowCount > FFixedRow then
  begin
    if (ACol = aColCek) and
          (Trim(agSOData.Cells[aColNo, FFixedRow]) <> '') then
    begin
      if State then
      begin
      end
      else
      begin
      end;

    end;
  end;
  NotCekFixedRow;
  }
end;

procedure TfrmGenPO.agSODataClickCell(Sender: TObject; ARow,
  ACol: Integer);
var
  aColNo    : Integer;
  i         : Integer;
  aColCek   : Integer;
begin
  inherited;
  {aColCek := agSOData.ColumnByName[_kol_b_Cek].Index;
  aColNo  := agSOData.ColumnByName[_Kol_i_No].Index;

  if (ARow < agSOData.FixedRows) and (ACol = aColCek) and
      (Trim(agSOData.Cells[aColNo, FFixedRow]) <> '') then
  begin

    begin
      for i := 0 to agSOData.RowCount - 1 do
      begin
      end;
    end;

  end;
  }
end;

procedure TfrmGenPO.chkOtomatisClick(Sender: TObject);
begin
  inherited;
    if chkOtomatis.Checked then
    begin
      chk714.Checked      := false;
      chkManual.Checked   := False;
      dtTglValid.Enabled  := False;
    end
    else
    begin
      if not chkManual.Checked then
        chk714.Checked      := True;
    end;

end;

procedure TfrmGenPO.chkManualClick(Sender: TObject);
begin
  inherited;
    if chkManual.Checked then
    begin
      chk714.Checked        := false;
      chkOtomatis.Checked   := False;
      dtTglValid.Enabled    := true;
    end
    else
    begin
      if not chk714.Checked then
        chkOtomatis.Checked   := True;
    end;
end;

procedure TfrmGenPO.edGRUnitCodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var sSql : string;
begin
  inherited;
  if Key= vk_return then
  begin

  end
  else if Key in [VK_BACK, VK_DELETE] then
  begin
    FGRUnitID         := -1;
    edGRUnitCode.Text := '';
    edGRUniNama.Text  := '';
    edGRAlamat.Text   := '';
  end
  else if (Key= VK_F5) and (not(ssctrl in Shift)) then
  begin
      GetUnitQty;
      sSql := 'select UNT_ID from aut$unit where UNT_IS_HO = 1'
            + ' and UNT_IS_ACTIVE = 1';
      {with cOpenQuery(sSql) do
      begin
        try
          while not Eof do
          begin
            //cek nilai awal apakah berisi string kosong (FIncUnit)
            if FIncUnit <> '' then
              FIncUnit :=  FIncUnit + ',' + Fields[0].AsString
            else
              FIncUnit :=  Fields[0].AsString;

            Next;
          end;  
        finally
          Free;
        end;
      end;
      }
      sSql := 'select '+
              '  au.unt_id ID_UNIT, '+
              '  au.unt_code KODE_UNIT, '+
              '  au.unt_name NAMA_UNIT, '+
              '  ui.UTI_ADDRESS ALAMAT '+
              'from '+
              '  aut$unit au '+
              '  left join unit_info ui on (ui.UTI_UNT_ID=au.UNT_ID)'+
              '  where au.unt_id  in ('+ FIncUnit +')';

      ;
      {
      with cLookUp('Daftar UNIT penerima GR',sSql) do
      begin
        try
            if Strings[0] = '' then
              Exit;

            FGRUnitID         := StrToInt(Strings[0]);
            edGRUnitCode.Text := Strings[1];
            edGRUniNama.Text  := Strings[2];
            edGRAlamat.Text   := Strings[3];
        finally
            Free;
        end
      end;
      }
  end;
end;

procedure TfrmGenPO.agSODataCellChanging(Sender: TObject; OldRow, OldCol,
  NewRow, NewCol: Integer; var Allow: Boolean);
var sUnitID : string;
begin
  inherited;
  {
  sUnitID := MidStr(agSOData.Columns[NewCol].Name,Length(_Kol_f_Unt_Qty_)+1,length(agSOData.Columns[NewCol].Name));

  if (NewCol >= iStartDynCol) and (NewCol < iStartDynCol+iDynColCount) then
  begin
    lbHint.Caption := 'SO: '+agSOData.Cells[agSOData.ColumnByName[_Kol_f_Unt_SODQty_+sUnitID].index,NewRow];
    lbHint.Caption := lbHint.Caption +'  OH: '+agSOData.Cells[agSOData.ColumnByName[_Kol_f_Unt_OHand_+sUnitID].index,NewRow];
    lbHint.Caption := lbHint.Caption +'  3MS: '+agSOData.Cells[agSOData.ColumnByName[_Kol_f_Unt_3M_+sUnitID].index,NewRow];
    lbHint.Caption := lbHint.Caption +' ';
  end
  else
    lbHint.Caption := '';
   }
end;

procedure TfrmGenPO.saveAndGenerate(isPOGlobal : boolean);
var iRow, iPOItemID, iGenID, POCount, iStore, aGRUnitID, iStoreRepeat, iPONumPx :Integer;
  iIsBkp: Integer;
    strErr: string;
    isFirst: Boolean;
    isByPassQTY : Boolean;
    sBrgTipe  : string;
    sItemType, sSupCode, sAlamatGR : String;
begin
  if cboTipePo.ItemIndex < 0 then
  begin
    CommonDlg.ShowError('Tipe PO harus dipilih');
    exit;
  end;

  if (Trim(edGRUnitCode.Text) = ''){ or (Trim(edGRAlamat.Text) = '')} then
  begin
    CommonDlg.ShowError('Unit Penerima (GR), dan Alamatnya Harus Di Isi');
    exit;
  end;

  iPOItemID := 0;
  iGenID    := 0;
  POCount   := 0;
  sBrgTipe  := '';

//  FPO.POItems.Clear;
  deleteEmptyQty;
  lbRefreshGroupClick(spmn1);

  if isPOGlobal then
    iStoreRepeat := 1
  else
    iStoreRepeat := iDynColCount;

  {
   urutkan data pada grid berdasarkan :
   - tipe barang po (sudah di wakili dengan filter per tipe po sewaktu lookup barang)
   - kode suplier
   - barang kena pajak
  }
  {agSOData.SortIndexes.Clear;
  agSOData.SortIndexes.Add(agSOData.ColumnByName[_Kol_s_SupKode].Index);
  agSOData.SortIndexes.Add(agSOData.ColumnByName[_Kol_i_isBKP].Index);
  agSOData.QSortIndexed;

  isFirst := True;
  iIsBkp  := -1;
  try
    for iStore:= iStartDynCol to iStartDynCol+iStoreRepeat-1 do
    begin
      if UpperCase(LeftStr(agSOData.Columns[iStore].Name, Length(_Kol_f_Unt_Qty_))) = UpperCase(_Kol_f_Unt_Qty_) then
      begin
          aGRUnitID := FGRUnitID;
          sAlamatGR := edGRAlamat.Text;
        for iRow:= agSOData.FixedRows to agSOData.RowCount-1-agSOData.FixedFooters do
        begin

          if isPOGlobal then
          begin
            isByPassQTY := True;
            iPONumPx := MasterNewUnit.ID;
          end
          else
          begin
            isByPassQTY := agSOData.Floats[iStore, iRow] > 0;
            iPONumPx := strToInt(MidStr(agSOData.Columns[iStore].Name,Length(_Kol_f_Unt_Qty_)+1,length(agSOData.Columns[iStore].Name)));
          end;

          if isByPassQTY then
          begin

            begin
              if (agSOData.Cells[agSOData.ColumnByName[_Kol_s_TipeBrgPO].Index, iRow] = sItemType)
                and (agSOData.Cells[agSOData.ColumnByName[_Kol_s_SupKode].Index, iRow] = sSupCode)
                and (agSOData.Ints[agSOData.ColumnByName[_Kol_i_isBKP].Index, iRow] = iIsBkp)
              then
              begin
                // do nothing (tidak membuat header)
              end
              else
              begin

                  begin

                    iPOItemID := 0;
                    sItemType := agSOData.Cells[agSOData.ColumnByName[_Kol_s_TipeBrgPO].index, irow];
                    sSupCode  := agSOData.Cells[agSOData.ColumnByName[_Kol_s_SupKode].index, irow];
                    iIsBkp    := agSOData.Ints[agSOData.ColumnByName[_Kol_i_isBKP].Index, iRow];

                    if isFirst = True then
                    begin
                      POCount := POCount + 1;
                      iGenID  := isiPOHeader(iRow, iGenID, isPOGlobal, aGRUnitID, sAlamatGR, iPONumPx);
                    end;

                    if not isFirst then
                    begin
                      if not FPO.ExecuteGenerateSQL then
                      begin
                        cRollbackTrans;
                        CommonDlg.ShowMessage('Penyimpanan Gagal');
                        Exit;
                      end;
                    end;

                    if not isFirst then
                    begin
                      FPO.ClearProperties;
                      FPO.POItems.Clear;

                      POCount := POCount + 1;
                      iGenID := isiPOHeader(iRow, iGenID, isPOGlobal, aGRUnitID, sAlamatGR, iPONumPx);

                    end;

                    if isFirst then
                      isFirst := False;

                  end;


              end
            end;

            begin
              iPOItemID := iPOItemID + 1 ;
              isiPOItems(iRow, iPOItemID, isPOGlobal, iStore);
            end;

          end;

          if iRow = agSOData.RowCount-1-agSOData.FixedFooters then
          begin
            if FPO.POItems.Count > 0 then
            begin
              if not FPO.ExecuteGenerateSQL then
              begin
                cRollbackTrans;
                CommonDlg.ShowMessage('Penyimpanan Gagal');
                Exit;
              end;
              FPO.ClearProperties;
              FPO.POItems.Clear;
              sItemType :='';
              sSupCode  :='';
              isFirst   := true;
            end;
          end;

        end;
      end;
    end;

    cCommitTrans;

    iLastGenID := iGenID;
    FormShow(btnAdd);

    CommonDlg.ShowMessage('Total : '+IntToStr(POCount)+' PO'#13'Berhasil Disimpan');
  except
    on E: EIBError do
    begin
      cRollbackTrans;
      strErr := GetForeignTable(e.Message);
      if strErr <> '' then
        CommonDlg.ShowError(strErr)
      else
        CommonDlg.ShowError(e.Message);
    end;
  end;
  }
end;

procedure TfrmGenPO.POGLOBALsatuPOuntuksemuastore1Click(Sender: TObject);
begin
  inherited;
  if CommonDlg.Confirm('Anda yakin akan men-generate PO GLOBAL?') = mrYes then
    saveAndGenerate(True);
end;

procedure TfrmGenPO.POTerpisahPOsatuanuntukmasing2store1Click(
  Sender: TObject);
begin
  inherited;
  if CommonDlg.Confirm('Anda yakin akan men-generate PO Terpisah untuk masing masing store?') = mrYes then
    saveAndGenerate(False);
end;

procedure TfrmGenPO.cbbMerchanGroupChange(Sender: TObject);
begin
  inherited;
      {cClearGrid(agSOData,False);
      agSOData.AddRow;
      agSOData.SelectRows(agSOData.RowCount-2,1);
      agSOData.Ints[agSOData.ColumnByName[_Kol_i_RowType].Index, agSOData.Row] := _rtItem;
      }
end;

procedure TfrmGenPO.clearRow(aRow:integer);
begin
      {agSOData.Ints[agSOData.ColumnByName[_Kol_i_RowType].Index, ARow]        := _rtItem;
      agSOData.Cells[agSOData.ColumnByName[_Kol_s_TipeBrgPO].Index, ARow]     := '';
      agSOData.Cells[agSOData.ColumnByName[_Kol_s_BrgKode].Index, ARow]       := '';
      agSOData.Cells[agSOData.ColumnByName[_Kol_s_BrgNama].Index, ARow]       := '';
      agSOData.Ints[agSOData.ColumnByName[_Kol_i_isStok].Index, ARow]         := -1;
      agSOData.Floats[agSOData.ColumnByName[_Kol_f_PPNPersen].Index, ARow]    := -1;
      agSOData.Floats[agSOData.ColumnByName[_Kol_f_PPNBMPersen].Index, ARow]  := -1;
      agSOData.Ints[agSOData.ColumnByName[_Kol_i_BrgSup_ID].Index,ARow]       := -1;
      agSOData.Ints[agSOData.ColumnByName[_Kol_i_BrgSup_Unit].Index,ARow]     := -1;
      agSOData.Cells[agSOData.ColumnByName[_Kol_s_SupKode].Index, ARow]       := '';
      agSOData.Cells[agSOData.ColumnByName[_Kol_s_SupNama].Index, ARow]       := '';
      agSOData.Floats[agSOData.ColumnByName[_Kol_f_Harga].Index, ARow]        := -1;
      agSOData.Cells[agSOData.ColumnByName[_Kol_s_Satuan].Index, ARow]        := '';
      agSOData.Floats[agSOData.ColumnByName[_Kol_f_Disc1].Index, ARow]        := -1;
      agSOData.Floats[agSOData.ColumnByName[_Kol_f_Disc2].Index, ARow]        := -1;
      agSOData.Floats[agSOData.ColumnByName[_Kol_f_Disc3].Index, ARow]        := -1;
      agSOData.Ints[agSOData.ColumnByName[_Kol_i_isBKP].Index, ARow]          := -1;
      agSOData.Ints[agSOData.ColumnByName[_kol_i_isSupPKP].Index, ARow]       := -1;
      agSOData.Cells[agSOData.ColumnByName[_Kol_s_Sort].Index, ARow]          := '';
      }
end;

procedure TfrmGenPO.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  inherited;
  if(Key = VK_RETURN)and(ssctrl in Shift) then
    actSaveExecute(Self)
  else if(Key = VK_F5)and(ssctrl in Shift) then
    btnRefreshClick(Self)
  else if(Key = Ord('G'))and(ssctrl in Shift) then
    btnAmbilPluClick(nil);
end;

procedure TfrmGenPO.chk714Click(Sender: TObject);
begin
  inherited;
    if chk714.Checked then
    begin
      chkOtomatis.Checked := false;
      chkManual.Checked   := False;
      dtTglValid.Enabled  := False;
    end
    else
    begin
      if not chkOtomatis.Checked then
        chkManual.Checked   := true;
    end;
end;

procedure TfrmGenPO.GetUnitQty;
var
  n: Integer;
  iOut: Integer;
  j: Integer;
  aIdx: Integer;
  i: Integer;
begin
  aIdx := 0;
  {for i:=0 to agSOData.ColCount-1 do
  begin
    if UpperCase(LeftStr(agSOData.Columns[i].Name, Length(_Kol_f_Unt_Qty_))) = UpperCase(_Kol_f_Unt_Qty_) then
    begin
      aIdx  := i;
      Break;
    end;
  end;

  n         := 0;
  FIncUnit  := '';
  for i := aIdx to agSOData.ColCount - 1 do
  begin
    if UpperCase(LeftStr(agSOData.Columns[i].Name, Length(_Kol_f_Unt_Qty_))) = UpperCase(_Kol_f_Unt_Qty_) then
    begin
      for j := agSOData.FixedRows to agSOData.RowCount - 1 do
      begin
        TryStrToInt(agSOData.Cells[i, j], iOut);
          if iOut > 0 then
          begin
            if n = 0 then
              FIncUnit := IntToStr( strToInt(MidStr(agSOData.Columns[i].Name,Length(_Kol_f_Unt_Qty_)+1,length(agSOData.Columns[i].Name))))
            else
              FIncUnit := FIncUnit + ', '+ IntToStr( strToInt(MidStr(agSOData.Columns[i].Name,Length(_Kol_f_Unt_Qty_)+1,length(agSOData.Columns[i].Name))));

            Inc(n);
            Break;
          end;
      end;
    end;
  end;
  }
end;

procedure TfrmGenPO.btnAmbilPluClick(Sender: TObject);
var
  i       : Integer;
  sSQL    : string;
  aValid  : Boolean;
  aVaLue  : string;
begin
  inherited;
  sSQL  := 'select a.BRG_CODE'
        + ' from BARANG a'
        + ' inner join REF$TIPE_BARANG b on a.BRG_TPBRG_ID = b.TPBRG_ID'
        + ' and a.BRG_IS_ACTIVE = 1'
        + ' and a.BRG_IS_VALIDATE = 1'
        + ' and a.brg_merchan_id='+IntToStr(cbbMerchanGroup.Tag)
        + ' inner join REF$TIPE_PO_barang c on c.POBRG_TPBRG_ID = b.TPBRG_ID'
        + ' inner join REF$TIPE_PO d on c.POBRG_TPPO_ID = d.TPPO_ID'
        + ' and c.POBRG_TPPO_ID = '+ IntToStr(FTPPOID)
        + ' and a.DATE_CREATE BETWEEN '+ TAppUtils.QuotD(dtPluFrom.Date)
        + ' and '+ TAppUtils.QuotD(dtPluTo.Date, True)
        + ' order by a.BRG_CODE';
  {
  with cOpenQuery(sSQL) do
  begin
    try
      i := agSOData.FixedRows;
      cShowWaitWindow();
      self.Enabled  := False;
      try
        while not Eof do
        begin
          if (i > (agSOData.RowCount - agSOData.FixedFooters - 1)) then
            agSOData.AddRow;

          aVaLue  := Fields[0].AsString;

          cShowWaitWindow(aVaLue);

          //disebabkan ada kode yg kurang dari 7 digit
          if (Length(aVaLue) < igProd_Code_Length) then
          begin
             Next;
            Continue;
          end;

          agSOData.Ints[agSOData.ColumnByName[_Kol_i_RowType].Index, i ]  := _rtItem;

          agSODataCellValidate(agSOData, agSOData.ColumnByName[_Kol_s_BrgKode].Index,
                    i, aVaLue, aValid);


          if aValid then
 
          else
          begin
            Next;
            Continue;
          end;

          Inc(i);
          Next;
        end;

      finally
        cCloseWaitWindow;
        self.Enabled  := true;
      end;
    finally
      Free;
    end;
  end;
  }
end;

end.

