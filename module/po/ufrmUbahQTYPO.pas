unit ufrmUbahQTYPO;

interface

uses
  Windows, SysUtils, Variants, Classes, Controls, Forms,
  ufrmMasterBrowse, StdCtrls, ComCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, dxCore, cxDateUtils, Vcl.Menus, System.Actions,
  Vcl.ActnList, ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC, cxButtonEdit, Vcl.ExtCtrls;

type
  TfrmUbahQTYPO = class(TfrmMasterBrowse)
    pnl1: TPanel;
    edtPONO: TcxButtonEdit;
    dtTanggal: TcxDateEdit;
    edtREF: TEdit;
    edtSONO: TEdit;
    edtDesc: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    Label1: TLabel;
    btnTesting: TButton;
    procedure actAddExecute(Sender: TObject);
    procedure edtPONOClickBtn(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure strgGridSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure edtPONOKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnTestingClick(Sender: TObject);
  private
    { Private declarations }
//    FNewPO: TPO;
  public
    procedure DoSkenarioTestingUbahQtyPO;
    function GetHeaderFlag: Integer;
    procedure LoadDataGrid;
    function SaveToDB(ssSQL:TStrings): Boolean;
    procedure UpdateDataDetil;
    { Public declarations }
  end;

var
  frmUbahQTYPO: TfrmUbahQTYPO;
  Kapasitas : Integer;
{
NO
Kode Barang
Nama Barang
UOM
QTY
ID
}
implementation

uses uTSCommonDlg, Math;

{$R *.dfm}

procedure TfrmUbahQTYPO.actAddExecute(Sender: TObject);
begin
  inherited;
  {

  if not IsValidDateKarenaEOD(masternewunit.id,cGetServerTime,FMasterIsStore) then
    Exit;

  if strgGrid.Cells[1,1] ='' then
  exit
  else
  UpdateDataDetil;
  }
end;

procedure TfrmUbahQTYPO.DoSkenarioTestingUbahQtyPO;
var
  iJml: Integer;
  i: Integer;
begin
  edtPONOClickBtn(edtPONO);

  {Randomize;
  for i := 1 to strgGrid.RowCount - 1 do
  begin
    iJml := RandomRange(10,50);
    strgGrid.Floats[4,i] := iJml;
  end;
   }
  actAddExecute(nil);
//  DoTestingDetailHargaPO(edtSONO.Text, masternewunit);
end;

procedure TfrmUbahQTYPO.edtPONOClickBtn(Sender: TObject);
var
  aSQL: string;
  iDetil: Integer;
  i: Integer;
  iSQL: string;
  sSQL: string;
begin
  inherited;

//  ClearAdvStringGrid(strgGrid);
  sSQL := 'select PO_NO as "PO NOMOR", PO_DATE as "Tanggal PO", PO_NO_REF as "REF PO", PO_DESCRIPTION as "DESKRIPSI", PO_SO_NO as "SO NOMOR" '
          + ' from PO'
          + ' where PO_UNT_ID = ' + IntToStr(masternewunit)
          + ' and PO_STAPO_ID = 1';
 {
  with cLookUp('Data PO',sSQl,200,1,True) do
  begin
    try
      if Strings[0] = '' then Exit;

      edtPONO.Text := Strings[0];
      dtTanggal.DateTime := StrToDateTime(Strings[1]);
      edtREF.Text := Strings[2];
      edtDesc.Text := Strings[3];
      edtSONO.Text := Strings[4];
    finally
      Free;
    end;
  end;
   }
  iSQL := 'select b.brgsup_brg_code, c.brg_alias , a.POD_SAT_CODE_ORDER, a.POD_QTY_ORDER, a.POD_ID '
          + ' from PO_DETIL a, barang_suplier b, barang c, po d'
          + ' where a.POD_PO_NO = ' + QuotedStr(edtPONO.Text)
          + ' and a.POD_PO_UNT_ID = ' + IntToStr(masternewunit)
          + ' and b.brgsup_id = a.POD_BRGSUP_ID '
          + ' and b.brgsup_unt_id = a.POD_BRGSUP_UNT_ID '
          + ' and c.brg_code = b.brgsup_brg_code '
          + ' and c.brg_unt_id = b.brgsup_brg_unt_id'
          + ' and a.POD_PO_NO = d.PO_NO'
          + ' and a.POD_PO_UNT_ID = d.PO_UNT_ID'
          + ' and d.PO_STAPO_ID = 1';

  {
  with cOpenQuery(iSQL) do
  begin
    i := 1;

    while not Eof do
    begin
      with strgGrid do
      begin
        Cells[0,i] := IntToStr(i);
        Cells[1,i] := fieldByName('brgsup_brg_code').AsString;
        Cells[2,i] := fieldByName('brg_alias').AsString;
        Cells[3,i] := fieldByName('POD_SAT_CODE_ORDER').AsString;
        Cells[4,i] := fieldByName('POD_QTY_ORDER').AsString;
        Cells[5,i] := fieldByName('POD_ID').AsString;
      end;
      Next;
      strgGrid.AddRow;
      Inc(i);
    end;
    HapusBarisKosong(strgGrid,1);
  end;
  }

  aSQL := 'select b.brgsup_brg_code, c.brg_alias , a.POD_SAT_CODE_ORDER, a.POD_QTY_ORDER '
          + ' from PO_DETIL a, barang_suplier b, barang c'
          + ' where a.POD_PO_NO = ' + QuotedStr(edtPONO.Text)
          + ' and a.POD_PO_UNT_ID = ' + IntToStr(masternewunit)
          + ' and b.brgsup_id = a.POD_BRGSUP_ID '
          + ' and b.brgsup_unt_id = a.POD_BRGSUP_UNT_ID '
          + ' and c.brg_code = b.brgsup_brg_code '
          + ' and c.brg_unt_id = b.brgsup_brg_unt_id';

  {
  with cOpenQuery(aSQL) do
  begin
    iDetil := 1;
    while not Eof do
    begin
      strgGridDetil.Cells[1,iDetil] := fieldByName('brgsup_brg_code').AsString;
      strgGridDetil.Cells[2,iDetil] := fieldByName('brg_alias').AsString;
      strgGridDetil.Cells[3,iDetil] := fieldByName('POD_SAT_CODE_ORDER').AsString;
      strgGridDetil.Cells[4,iDetil] := fieldByName('POD_QTY_ORDER').AsString;
      Next;
      strgGridDetil.AddRow;
      Inc(iDetil);
    end;
    HapusBarisKosong(strgGridDetil,1);
  end;
     }

end;

procedure TfrmUbahQTYPO.FormShow(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
  lblHeader.Caption := 'Ubah QTY PO';
  edtPONO.Text := '';

  sSQL  := ' select maxubahpo from AUT$USER '
           + ' where USR_UNT_ID = ' + IntToStr(masternewunit)
           + ' and usr_id = ' + IntToStr(FLoginId) ;
  {
  with cOpenQuery(sSQL) do
  begin
 
    Kapasitas := Fields[0].AsInteger;
  end;
  }
end;

procedure TfrmUbahQTYPO.LoadDataGrid;
begin
  {strgGrid.Clear;
  strgGrid.Cells[0,0] :='NO';
  strgGrid.Cells[1,0] :='KODE BARANG';
  strgGrid.Cells[2,0] :='NAMA BARANG';
  strgGrid.Cells[3,0] :='UOM';
  strgGrid.Cells[4,0] :='QTY';
  }
end;

procedure TfrmUbahQTYPO.FormCreate(Sender: TObject);
begin
  inherited;
//  FNewPO := TPO.Create(Self);
//  dtTanggal.DateTime := cGetServerTime;
end;

procedure TfrmUbahQTYPO.strgGridSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
var
  sSQL: string;
  iJumlah: Double;
  iHasil: Double;
  iChange: Double;
  iQTY: Double;
begin
  inherited;
   {
   sSQL := 'select POD_QTY_ORDER from PO_DETIL where POD_ID = ' + QuotedStr(strgGrid.Cells[5,strgGrid.Row])
          + ' and POD_unt_id = ' + IntToStr(masternewunit);

  with cOpenQuery(sSQL) do
  begin
    if strgGrid.Col = 4 then
    begin
      iQTY := StrToFloatDef(fieldByName('POD_QTY_ORDER').AsString,0);
      iChange := Kapasitas;

      iHasil := iQTY * iChange;
      if strgGrid.Cells[4,1] = '' then
      begin
        Exit;
      end;
        iJumlah := StrToFloatDef(strgGrid.Cells[4,strgGrid.Row],0);

      if (iJumlah > iHasil)  then
      begin
        CommonDlg.ShowMessage('Anda Hanya Berhak Mengubah Qty Maximal ' + FloatToStr(iChange) + ' Kali Qty Lama');
        strgGrid.Cells[4,strgGrid.Row] := FloatToStr(iQTY);
        Exit;
      end;
    end;
  end;
  }
end;

procedure TfrmUbahQTYPO.edtPONOKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F5 then
  begin
    edtPONOClickBtn(Self);
  end;
end;

procedure TfrmUbahQTYPO.UpdateDataDetil;
var
  sSQL: string;
  i: Integer;
  sKodeBarang: string;

  //hasil hitung
  dQTYNew : Double;
  {dPODPriceNew,dPODTotalTaxNew,dPODTotalNew,}dPODPPnNew,dPODPPNBMNew : Double;


  //ngambil dari tabel
  dPODPrice,dPODTotalDisc : Double;
  dPODPPn,dPODPPNBM : Double;

  //total semua untuk update PO
  dPOTotalQTY : Double;
  dSubTotalDisc,dSubTotal,dSubTotalPrice : Double;
  dPOTotal,dPOTotalPPn,dPOTotalPPNBM,dPOTotalDisc : Double;
begin
  dPOTotal       := 0;
  dPOTotalPPn    := 0;
  dPOTotalPPNBM  := 0;
  dPOTotalDisc   := 0;
  dPOTotalQTY    := 0;
  {For i:=1 to strgGrid.RowCount-1 do
  begin
    sKodeBarang := strgGrid.Cells[1,i];
    sSQL := 'Select * from PO_DETIL '
          + ' Where POD_BRG_CODE = ' +Quot(sKodeBarang)
          + ' AND POD_PO_NO = ' +Quot(edtPONO.Text)
          + ' AND POD_PO_UNT_ID = ' +IntToStr(masternewunit.id);
    With cOpenQuery(sSQL) do begin
      try
      dPODPrice     := fieldbyname('POD_PRICE').Value;
      dPODTotalDisc := fieldbyname('POD_TOTAL_DISC').Value;
      dPODPPn       := fieldbyname('POD_PPN_PERSEN').AsFloat;
      dPODPPNBM     := fieldbyname('POD_PPNBM_PERSEN').AsFloat;
      finally
        Free;
      end;
    end;
    dQTYNew         := strgGrid.Floats[4,i];
    dSubTotalDisc   := dQTYNew * dPODTotalDisc;
    dSubTotalPrice  := dQTYNew * dPODPrice;
    dSubTotal       := dSubTotalPrice - dSubTotalDisc;
    dPODPPnNew      := (dPODPPn / 100) * dSubTotal;
    dPODPPNBMNew    := (dPODPPNBM / 100) * dSubTotal;




    //total semuanya
    dPOTotalQTY     := dPOTotalQTY + dQTYNew;
    dPOTotal        := dPOTotal + dSubTotal;
    dPOTotalPPn     := dPOTotalPPn + dPODPPnNew;
    dPOTotalPPNBM   := dPOTotalPPNBM + dPODPPNBMNew;
    dPOTotalDisc    := dPOTotalDisc + dSubTotalDisc;


    sSQL := 'Update PO_DETIL set '
            + ' POD_QTY_ORDER = ' + FormatFloat('0.000',dQTYNew)
//            + ' ,POD_PRICE = ' + FloatToStr(dPriceNew)
//            + ' ,POD_TOTAL = ' + FloatToStr(dPOD_TotalNew)
//            + ' ,POD_TOTAL_DISC = ' + FloatToStr(dTotalDisk)
//            + ' ,POD_PPN = ' + FloatToStr(dPODPPnNew)
//            + ' ,POD_PPNBM = ' + FloatToStr(dPODPPNBMNew)
//            + ' ,POD_TOTAL_TAX = ' + FloatToStr(dPODTotalTaxNew)
            + ' where POD_ID = ' + Quot(strgGrid.Cells[5,i])
            + ' and POD_UNT_ID = ' + IntToStr(masternewunit.id)
            + ';';

    if not cExecSQL(sSQL,False,GetHeaderFlag) then
    begin
      cRollbackTrans;
      CommonDlg.ShowError('Data ke ' +IntToStr(i)+ 'Gagal Disimpan');
      Exit;
    end
    else if not SimpanBlob(sSQL,1) then
    begin
      cRollbackTrans;
      Exit;
    end
    else begin
      cCommitTrans;
    end;

  end;
  sSQL := 'Update PO set '
        + ' PO_TOTAL = ' +FloatToStr(dPOTotal)
        + ' ,PO_DISC = ' +FloatToStr(dPOTotalDisc)
        + ' ,PO_PPN = ' +FloatToStr(dPOTotalPPn)
        + ' ,PO_PPNBM = ' +FloatToStr(dPOTotalPPNBM)
        + ' ,PO_COLIE = ' +FormatFloat('0.000',dPOTotalQTY)
        + ' Where PO_NO = ' +Quot(edtPONO.Text)
        + ' and PO_UNT_ID = ' +IntToStr(masternewunit.id)
        + ';';

    if not cExecSQL(sSQL,False,GetHeaderFlag) then
    begin
      cRollbackTrans;
      CommonDlg.ShowError('Data Gagal Disimpan');
      Exit;
    end
    else if not SimpanBlob(sSQL,1) then
    begin
      cRollbackTrans;
      CommonDlg.ShowError('Data Gagal Disimpan');
      Exit;
    end
    else begin
      cCommitTrans;
      CommonDlg.ShowMessage('Data Berhasil Disimpan');
    end;
    }
end;

function TfrmUbahQTYPO.GetHeaderFlag: Integer;
begin
  Result := 1934;
end;

function TfrmUbahQTYPO.SaveToDB(ssSQL:TStrings): Boolean;
begin
  Result := False;
  {
  try
    try
      if kExecuteSQLs(GetHeaderFlag, ssSQL) then
        if SimpanBlob(ssSQL,GetHeaderFlag) then
          Result := True;
    except
    end;
  finally
    FreeAndNil(ssSQL);
  end;
  }
end;

procedure TfrmUbahQTYPO.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  inherited;
  if(Key = VK_RETURN) and (ssctrl in Shift) then
    actAddExecute(sender)
end;

procedure TfrmUbahQTYPO.btnTestingClick(Sender: TObject);
var
  i: Integer;
  iJmlNoTRansaksi: Integer;
begin
  inherited;
//  if frmMain.IsTesting then
  begin
    Randomize;
    iJmlNoTRansaksi := RandomRange(15,20);
    for i := 1 to iJmlNoTRansaksi do
    begin
      DoSkenarioTestingUbahQtyPO;
    end;
  end;
end;

end.



