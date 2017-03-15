unit ufrmQuotationMailer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDefaultMaster, ufraFooter5Button, StdCtrls, ExtCtrls,
  cbxbase, dblup1a, Mask, JvToolEdit, Grids, BaseGrid, AdvGrid, AdvCGrid,
  uRMSUnit, UnewQuotationPromo, uConn, uQuotation, EditBtn, ComCtrls,
  JvDateTimePicker, te_controls, SUIButton, jpeg , uNewBarang, AdvObj,
  te_extctrls, JvExMask;

type
  TfrmQuotatiuonMailer = class(TfrmDefaultMaster)
    pnlTop: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    lblEndDate: TLabel;
    dtEffectiveDate: TJvDateEdit;
    dtRefDate: TJvDateEdit;
    edtRemark: TEdit;
    dtEndDate: TJvDateEdit;
    pnlData: TPanel;
    pnlBottom: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    edtProdName: TEdit;
    edtCatalog: TEdit;
    edtKode: TEdit;
    edtQuotationNo1: TEditBtn;
    dtEffectiveTime: TTeDateTimePicker;
    dtEndTime: TTeDateTimePicker;
    btnUpdate: TsuiButton;
    img1: TImage;
    strgGrid: TAdvColumnGrid;

    procedure btnAddClick(Sender: TObject);
    //procedure cbpQuotationNoKeyUp(Sender: TObject; var Key: Word;
    //  Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure frftr5btn1btnUpdateClick(Sender: TObject);
    procedure strgGridCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure edtQuotationNo1ClickBtn(Sender: TObject);
    procedure edtQuotationNo1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure frftr5btn1btnCloseClick(Sender: TObject);
    procedure dtRefDateKeyPress(Sender: TObject; var Key: Char);
    procedure dtEffectiveDateKeyPress(Sender: TObject; var Key: Char);
    procedure dtEffectiveTimeKeyPress(Sender: TObject; var Key: Char);
    procedure dtEndDateKeyPress(Sender: TObject; var Key: Char);
    procedure dtEndTimeKeyPress(Sender: TObject; var Key: Char);
    procedure edtRemarkKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnUpdateEnter(Sender: TObject);
    procedure btnUpdateExit(Sender: TObject);
    procedure strgGridGetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
  private

    procedure LoadDataQuotationMailer(aNoBukti : String; aUnitID : Integer);
//    FMerGroupId: Integer; // bernilai -1 jika tidak ada mergroup aktif
   // FQuotation: TNewQuotation;
//    FSupMGSubCode: string; //berisi string kosong jika data tidak ditemukan
//    FSupMGUntId: Integer; // unit id untuk FSupMGSubCode
//    FQuotationId: Integer; // bernilai -1 jika tidak ada quotation yg aktif
//    FQuotationUntId: Integer; // unit id untuk FQuotationId
    //Quotation : Tuquotation;

   // procedure AdjustGrid;

   // procedure ParseListSupplierByCode(ACode: string; AUnitId: integer; ARowLimit: Integer = 0);
   // procedure ParseSupplierByCode(ASupCode: string; AUnitId: Integer);
   // procedure ParseSupplierMerchandGroup(ASupCode: string; AMerGroupId, AUnitId: integer);
   // procedure ParseListMerchandGroupBySupplier(ASupplierCode: string; AUnitId: Integer);
   // procedure ParseMerchandGroupById(AMerchandGroupId, AUnitId: Integer);
   // procedure ParseProductByCode(ACode: string; AUnitId: integer);

    //procedure ParseListQuotationBySupMGSubCode(ASupMgSubCode: string; ASupMgUntId: Integer);
  // procedure ParseQuotationById(AQuotId, AUnitId: Integer);

    //procedure RefreshData(AQuotId, AUnitId: Integer);
   // procedure ParseHeaderGrid;
   procedure ParseDataGrid;
   procedure LoadDataBarangQuotation(aQuotationPromoItem : TNewQuotationPromoItem; aBaris :
        Integer);
   procedure LoadDataHargaQuotation(aQuotationPromoItem : TNewQuotationPromoItem; aBaris :
        Integer);


   // procedure DeleteQuotation(AQuotId,AUnitId: Integer);
  public
    FQuotationMailer : TNewQuotationPromo;
    procedure AturLebarKolom;
    procedure InistialisasiGrid;
    procedure UbahIsParent;
    function GetTipeHArgaByID(TipeHArgaID: Integer;TipeHArgaUntID:integer): string;
    procedure LoadProductByBrgCode;
   //
  end;

var
  frmQuotatiuonMailer: TfrmQuotatiuonMailer;

implementation
uses suithemes,  uGTSUICommonDlg,
  ufrmMasterDialog, udmReportNew, ufrmDialogQuotationMailerNeo;

const
  _KolIsParent       : Integer = 0;
  _KolPLUPurchase    : Integer = 1;
  _KolPLU            : Integer = 2;
  _KolNamaBarang     : Integer = 3;
  _KolTipeHArga      : Integer = 4;
  _KolUOM            : Integer = 5;
  _KolHargaBeli      : Integer = 6;
  _KolUOMHargaBeli   : Integer = 7;
  _KolPPNPersen      : Integer = 8;
  _KolPrice          : Integer = 9;
  _KolDisc           : Integer = 10;
  _KolDiscPersen     : Integer = 11;
  _KolSetelahDisc    : Integer = 12;
  _KolHArgaAVGIncPPN : Integer = 13;
  _KolHArgaAVGExcPPN : Integer = 14;
  _MUPersen          : Integer = 15;
  _MURupiah          : Integer = 16;
  _KonvValue         : Integer = 17;
  _KolItemID         : Integer = 18;
  _KolKodeSupplier   : Integer = 19;

{$R *.dfm}

procedure TfrmQuotatiuonMailer.InistialisasiGrid;
begin
  with strgGrid do
  begin
    MergeCells(0,0,1,2);
    MergeCells(_KolIsParent,0,1,2);
    MergeCells(_KolPLUPurchase,0,1,2);
    MergeCells(_KolPLU,0,1,2);
    MergeCells(_KolNamaBarang,0,1,2);
    MergeCells(_KolTipeHArga,0,1,2);
    MergeCells(_KolUOM,0,1,2);
    MergeCells(_KolPPNPersen,0,1,2);
    MergeCells(_KolHargaBeli,0,2,1);
    MergeCells(_KolPrice,0,4,1);
    MergeCells(_KolHArgaAVGIncPPN,0,2,1);
    MergeCells(_MUPersen,0,2,1);
    MergeCells(_KonvValue,0,1,2);
    MergeCells(_KolItemID,0,1,2);
    MergeCells(_KolKodeSupplier,0,1,2);

    Cells[_KolHargaBeli,1]        := 'Harga';
    Cells[_KolUOMHargaBeli,1]     := 'UOM';
    Cells[_KolPrice,1]            := 'Harga [A]';
    Cells[_KolDisc,1]             := 'Diskon [B]';
    Cells[_KolDiscPersen,1]       := 'Diskon % [C]';
    Cells[_KolSetelahDisc,1]      := '[A - B]';
    Cells[_KolHArgaAVGIncPPN,1]   := 'Inc PPN';
    Cells[_KolHArgaAVGExcPPN,1]   := 'Exc PPN';
    Cells[_MUPersen,1]            := '%';
    Cells[_MURupiah,1]            := 'Rp';
    Cells[_KolKodeSupplier,1]     := 'Kode Sup';

    AturLebarKolom;
  end;
end;

procedure TfrmQuotatiuonMailer.AturLebarKolom;
begin
  with strgGrid do
  begin
    AutoSizeColumns(True, 5);
    AutoSizeCol(_KolNamaBarang);
    AutoSizeCol(_KolIsParent);
    AutoSizeCol(_KolPLUPurchase);
    AutoSizeCol(_KolPLU);
    AutoSizeCol(_KolTipeHArga);
    AutoSizeCol(_KolUOM);
    AutoSizeCol(_KolHArgaAVGExcPPN);
    AutoSizeCol(_MUPersen);
    AutoSizeCol(_MURupiah);
    AutoSizeCol(_KonvValue);
    AutoSizeCol(_KolPPNPersen);
    AutoSizeCol(_KolItemID);

    Columns[_KolItemID].Width := 0;
//    Columns[_KolKodeSupplier].Width := 0;
  end;
end;

procedure TfrmQuotatiuonMailer.btnAddClick(Sender: TObject);
begin
  inherited;
  if MasterNewUnit.ID = 0 then
  begin
    CommonDlg.ShowError('Company Belum Dipilih');
    Exit;
  end;

  FreeAndNil(frmDialogQuotationMailerNeo);

  //Application.CreateForm(TfrmDialogQuotationMailer, frmDialogQuotationMailer);

  frmDialogQuotationMailerNeo := TfrmDialogQuotationMailerNeo.Create(Self);
 with frmDialogQuotationMailerNeo do
  begin
    try
      FIDLokal       := 0;
      SetFormPropertyAndShowDialog(frmDialogQuotationMailerNeo);
      if IsProcessSuccessfull then
        LoadDataQuotationMailer(edtQuotationNo.Text, MasterNewUnit.ID);
    finally
      Free;
    end;
  end;
  
end;

{procedure TfrmQuotatiuonMailer.RefreshData(AQuotId, AUnitId: Integer);
begin
  //FMerGroupId := AMerGroupId;
  //ParseSupplierByCode(ASupCode, AUnitId);
  //ParseMerchandGroupById(AMerGroupId, AUnitId);
  //ParseSupplierMerchandGroup(ASupCode, AMerGroupId, AUnitId);
  ParseQuotationById(AQuotId, AUnitId);
end;
 }
{procedure TfrmQuotatiuonMailer.ParseQuotationById(AQuotId, AUnitId: Integer);
var
  //wCursor: IWaitCursor;
  dataQuot: TResultDataSet;
begin
 // wCursor := TWaitCursor.Create;
  dataQuot := TQuotation.GetListQuotationById(AQuotId, AUnitId);
  if not (dataQuot.IsEmpty) then
  begin
    FQuotationId := dataQuot.FieldByName('QUOT_ID').AsInteger;
    FQuotationUntId := dataQuot.FieldByName('QUOT_UNT_ID').AsInteger;
    cbpQuotationNo.Text := dataQuot.FieldByName('QUOT_REF_NO').AsString;
    dtRefDate.Date := dataQuot.FieldByName('QUOT_DATE').AsDateTime;
    dtEffectiveDate.Date := dataQuot.FieldByName('QUOT_DATE_EFFECTIVE').AsDateTime;
    edtEndDate.Date := dataQuot.fieldByName('QUOT_END_DATE').AsDateTime;
    edtRemark.Text := dataQuot.FieldByName('QUOT_REMARK').AsString;
  end
  else
  begin
    FQuotationId := -1;
    FQuotationUntId := -1;
    cbpQuotationNo.Text := '';
    dtRefDate.Text := '';
    dtEffectiveDate.Text := '';
    edtEndDate.Text :='';
    edtRemark.Text := '';
  end;
}
function TfrmQuotatiuonMailer.GetTipeHArgaByID(TipeHArgaID: Integer;
    TipeHArgaUntID:integer): string;
var sSQL: string;
begin
  Result := '';
  sSQL := 'select tpHrg_name '
          + ' from ref$Tipe_Harga '
          + ' where tpHrg_ID = ' + IntToStr(TipeHargaID)
          + ' and tpHrg_unt_ID = ' + IntToStr(TipeHArgaUntID);
  with cOpenQuery(sSQL) do
  begin
    try
      Result := FieldByName('tpHrg_name').AsString;
    finally
      Free;
    end;
  end;
end;


procedure TfrmQuotatiuonMailer.LoadDataHargaQuotation(aQuotationPromoItem :
    TNewQuotationPromoItem; aBaris : Integer);
begin
  with strgGrid do
  begin
    Floats[_KolPrice , aBaris]      := aQuotationPromoItem.Price;
    Floats[_KolDiscPersen , aBaris] := aQuotationPromoItem.DiscPersen;
    Floats[_KolDisc, aBaris]        := aQuotationPromoItem.DISC;
    Floats[_KolSetelahDisc, aBaris] := (100 - aQuotationPromoItem.DiscPersen) / 100 * aQuotationPromoItem.Price;

    if Floats[_KolHArgaAVGIncPPN,aBaris] > 0 then
      Floats[_MUPersen,aBaris]      := (Floats[_KolSetelahDisc,aBaris] - Floats[_KolHArgaAVGIncPPN,aBaris]) / Floats[_KolHArgaAVGIncPPN,aBaris] * 100
    else
      Floats[_MUPersen,aBaris]      := 0;

    Floats[_MURupiah, aBaris]       := Floats[_KolSetelahDisc,aBaris] - Floats[_KolHArgaAVGIncPPN,aBaris];

  end;
end;

procedure TfrmQuotatiuonMailer.LoadDataBarangQuotation(aQuotationPromoItem :
    TNewQuotationPromoItem; aBaris : Integer);
var
  FLokalBarang: TNewBarang;
begin

  with strgGrid do
  begin
    FLokalBarang := aQuotationPromoItem.Barang;
    try
      Cells[_KolPLUPurchase, aBaris]      := aQuotationPromoItem.Barang.KodePurchase;
      Cells[_KolPLU, aBaris]              := FLokalBarang.Kode;
      Cells[_KolNamaBarang, aBaris]       := FLokalBarang.Alias;
      Cells[_KolUOM, aBaris]              := aQuotationPromoItem.KodeSatuan;
      Cells[_kolTipeHArga, aBaris]        := GetTipeHArgaByID(aQuotationPromoItem.TipeHargaID,MasterNewUnit.ID);
      Floats[_KolHargaBeli,aBaris]        := FLokalBarang.GetHargaBeli(GetLastSupCode(FLokalBarang.Kode));
      Cells[_KolUOMHargaBeli,aBaris]      := FLokalBarang.GetSatuanHargaBeli(GetLastSupCode(FLokalBarang.Kode));
      Floats[_KolPPNPersen, aBaris]       := FLokalBarang.NewPajak.PPN;
      Floats[_KolHArgaAVGExcPPN, aBaris]  := FLokalBarang.GetHargaAVG(aQuotationPromoItem.KodeSatuan);
      Floats[_KolHArgaAVGIncPPN, aBaris]  := FLokalBarang.GetHargaAVG(aQuotationPromoItem.KodeSatuan) * (100 + FLokalBarang.NewPajak.PPN) / 100;
      Floats[_KonvValue, aBaris]          := aQuotationPromoItem.GetKonversiValue;
      Cells[_KolKodeSupplier,aBaris]      := GetLastSupCode(FLokalBarang.Kode);
    finally
      FLokalBarang.Free;
    end;
  end;
end;

procedure TfrmQuotatiuonMailer.ParseDataGrid;
var
  iBaris: Integer;
  i : Integer;
begin
  cClearGrid(strgGrid,False);

    for i := 0 to FQuotationMailer.QuotationPromoItems.Count - 1 do
    begin
      iBaris := i + 2;
      with strgGrid do
      begin
        strgGrid.AddCheckBox(_KolIsParent, iBaris,True,True);
        strgGrid.SetCheckBoxState(_KolIsPArent, iBaris, False);

        LoadDataBarangQuotation(FQuotationMailer.QuotationPromoItems[i], iBaris);
        LoadDataHargaQuotation(FQuotationMailer.QuotationPromoItems[i], iBaris);

        Ints[_KolItemID, iBaris]        := FQuotationMailer.QuotationPromoItems[i].ID;

        if i + 1 < FQuotationMailer.QuotationPromoItems.Count then
          strgGrid.AddRow;
      end;
    end;

    AturLebarKolom;
    SetWarnaBarisSG(strgGrid);
end;


procedure TfrmQuotatiuonMailer.UbahIsParent;
var
  j: Integer;
  sPLU: string;
  sPLUPurchase, sPLUPurchase2 : string;
  i, itmp: Integer;
begin
//  itmp := 0;
  for i := 1 to strgGrid.RowCount - 1 do
  begin
    sPLU := strgGrid.Cells[_kolPLU, i];
    sPLUPurchase := strgGrid.Cells[_kolPLUPurchase, i];
    if sPLU <> sPLUPurchase then
    begin
      for j := 1 to strgGrid.RowCount - 1 do
      begin
        sPLUPurchase2 := strgGrid.Cells[_kolPLUPurchase, j];
        if sPLU = sPLUPurchase then
          strgGrid.SetCheckBoxState(_KolIsPArent, j, True)
        else
          strgGrid.SetCheckBoxState(_KolIsParent,j,False);
      end;
    end
    else begin
      itmp := 0;
      for j := 1 to strgGrid.RowCount - 1 do
      begin
        if sPLUPurchase = strgGrid.Cells[_kolPLUPurchase, j] then
          Inc(itmp,1);
      end;

      if itmp > 1 then
      begin
        for j := 1 to strgGrid.RowCount - 1 do
        begin
          if sPLUPurchase = strgGrid.Cells[_kolPLUPurchase, j] then
            strgGrid.SetCheckBoxState(_KolIsPArent, j, True)
          else
            strgGrid.SetCheckBoxState(_KolIsParent,j,False);
        end;
      end;
    end;
  end;
end;


procedure TfrmQuotatiuonMailer.FormCreate(Sender: TObject);
begin
  inherited;
  FQuotationMailer := TNewQuotationPromo.Create(self);
  
end;

procedure TfrmQuotatiuonMailer.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 { {if (length(cbpQuotationNo.Text)=1) then
  begin
    ParseListQuotationBySupMGSubCode(FSupMGSubCode, FSupMGUntId);
  end;
  }
 { if Key = Ord(VK_DOWN) then
  begin
  ;
  end;

 
  if (Key = VK_RETURN) then
  begin
    if (edtQuotationNo.Row = 0) or
      (edtQuotationNo.Cells[0, edtQuotationNo.Row] = '')  then
    begin
      CommonDlg.ShowError('Choose Quotation first');
      Exit;
    end;

   aID := StrToInt(edtQuotationNo.Cells[0, cQuotationNo.Row]);
   if FQuotationMailer.LoadByID(aID, MasterNewUnit.ID) then
   begin
     dtRefDate.Date := FQuotationMailer.QuotDate;
     edtRemark.Text := FQuotationMailer.Remark;
     dtEffectiveDate.Date := FQuotationMailer.EffectifDate;
     dtEndDate.Date := FQuotationMailer.EndDate;
     cClearGrid(strgGrid,False);
     ParseDataGrid(aID,MasterNewUnit.ID);
     UbahIsParent;
   end
   else
   begin
     CommonDlg.ShowMessage('Tidak Ada Quotation/Ref No');
     cClearGrid(strgGrid,False);
     ClearByTag(Self,[1]);
     Exit;
   end;
  end;   }
end;

procedure TfrmQuotatiuonMailer.LoadProductByBrgCode;
var
  sSQL: string;
begin
  sSQL := 'select brg_code, brg_catalog, brg_alias '
          + ' from barang '
          + ' where brg_code = ' + Quot(strgGrid.Cells[_KolPLU,strgGrid.Row]);
  with cOpenQuery(sSQL) do
  begin
    try
    begin
      edtKode.Text := FieldByName('brg_code').AsString;
      edtCatalog.Text := FieldByName('brg_catalog').AsString;
      edtProdName.Text := FieldByName('brg_alias').AsString;
    end;
    finally
      Free;
    end;
  end;
end;

{procedure TfrmQuotatiuonMailer.DeleteQuotation(AQuotId, AUnitId: Integer);
var
  intI, IDLokal: Integer;
  arrParam: TArr;
  IsBerhasilHapus: Boolean;
  chkStatue: Boolean;
begin
  if (CommonDlg.Confirm('Are you sure you wish to remove Quotation : ' +
    edtQuotationNo.Text + ' ?') = mrYes) then
  begin
  
  {  SetLength(arrParam, 2);
    arrParam[0].tipe := ptInteger;
    arrParam[0].data := AQuotId;
    arrParam[1].tipe := ptInteger;
    arrParam[1].data := AUnitId;


    if TQuotation.DeleteDataQuotationDetilpromo(arrParam) then
    begin
      CommonDlg.ShowMessage('Berhasil menghapus data');
      
      //RefreshData('', '', -1, -1, -1);
    end;
    cClearGrid(strgGrid,False);
  //FQuotationMailer.QuotationPromoItems[i].LoadByIdAndUnitID(FQuotationMailer.ID,MasterNewUnit.ID)
//  end;
//end;    }


procedure TfrmQuotatiuonMailer.strgGridGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
var    i: Integer;

begin
  inherited;
     if ARow = 0 then
  begin
    for i := 0 to strgGrid.ColCount - 1 do
    begin
      HAlign := taCenter;
    end;
  end;
end;

procedure TfrmQuotatiuonMailer.FormActivate(Sender: TObject);
begin
  inherited;
  //frmMain.CreateMenu((sender as TForm));
end;

procedure TfrmQuotatiuonMailer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  //frmMain.DestroyMenu((sender as TForm));
  Action := caFree;
  frmQuotatiuonMailer:=nil;
end;

procedure TfrmQuotatiuonMailer.FormDestroy(Sender: TObject);
begin
  inherited;
  frmQuotatiuonMailer := nil;
end;

procedure TfrmQuotatiuonMailer.btnDeleteClick(Sender: TObject);
//var
//  data: TStringList;
//  chkStatue: Boolean;
//  IDLokal: Integer;
//  IsBerhasilHapus: Boolean;
//  intI: Integer;
//  arrParam: TArr;
begin
  inherited;
  if (CommonDlg.Confirm('Anda Yakin Akan Menghapus Quotation Mailer : ' + edtQuotationNo1.Text + ' ?') = mrYes) then
  begin
    if FQuotationMailer.ID > 0 then
    begin
      if FQuotationMailer.IsProcessed = 0 then
      begin
        try
          cShowWaitWindow('Sedang Menghapus Data');
          if FQuotationMailer.RemoveFromDB then
          begin
            cCommitTrans;
            CommonDlg.ShowMessage('Data Berhasil Dihapus');

            cClearGrid(strgGrid,False);
            edtQuotationNo1.Text := '';
            edtRemark.Text := '';
            edtProdName.Text := '';
            edtCatalog.Text := '';
            edtKode.Text := '';
            dtRefDate.Date := cGetServerTime;
            dtEndDate.Date := cGetServerTime;
            dtEffectiveDate.Date := cGetServerTime;
          end;
        finally
          cRollbackTrans;
          cCloseWaitWindow;
        end;
      end else begin
        CommonDlg.ShowError('Quotation Mailer Ini Sudah Dieksekusi');
        Exit;
      end;
    end
    else begin
      CommonDlg.ShowMessage('Gagal Menghapus Data');
    end;
  end;
end;



procedure TfrmQuotatiuonMailer.frftr5btn1btnUpdateClick(Sender: TObject);

begin
  inherited;
  if MasterNewUnit.ID = 0 then
  begin
    CommonDlg.ShowError('Company Belum Dipilih');
    Exit;
  end;

  Application.CreateForm(TfrmDialogQuotationMailerNeo, frmDialogQuotationMailerNeo);
  with frmDialogQuotationMailerNeo do
  begin
    try
      if  FQuotationMailer.IsProcessed = 1 then
      begin
        CommonDlg.ShowError('Quotation Ini Sudah Dieksekusi, Tidak Bisa Diedit');
        Exit;
      end;

      FIDLokal       := FQuotationMailer.ID;
      //FUnitID        := FQuotationMailer.UnitID;
      //FLoginFullname := FLoginFullname;
      //FUnitName      := MasterNewUnit.Nama;

      SetFormPropertyAndShowDialog(frmDialogQuotationMailerNeo);
      if IsProcessSuccessfull then
        LoadDataQuotationMailer(edtQuotationNo.Text,MasterNewUnit.ID);
    finally
      Free;
    end;
  end;
end;

procedure TfrmQuotatiuonMailer.strgGridCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  inherited;
    CanEdit := False;
//  if (ACol in [7, 8, 9, 10, 11])  then
//    CanEdit := True;
end;

procedure TfrmQuotatiuonMailer.edtQuotationNo1ClickBtn(Sender: TObject);
var
  sSQL: string;
begin
  inherited;

  sSQL := 'SELECT QUOT_REF_NO as " Quotation Ref", QUOT_DATE as "Quotation Date",'
          + ' QUOT_DATE_EFFECTIVE as " Effective Date", QUOT_END_DATE as " End Date",'
          + ' QUOT_REMARK  as "Remark", QUOT_ID as "ID",QUOT_IS_PROCESSED as "Is Processed"'
          + ' FROM QUOTATION_PROMO '
          + ' WHERE QUOT_UNT_ID = ' + IntToStr(MasterNewUnit.ID) ;

    with cLookUp('Quotation/ref No',sSQL, 200,1,False) do
    begin
      try
        if Strings[0] = '' then
          Exit;

        cShowWaitWindow('Sedang Load Data ........');
        edtQuotationNo1.Text := Strings[0];

        //LoadDataQuotationMailer(aNoBukti, aUnitID);

      finally
        cCloseWaitWindow;
        Free;
      end;
    end;


end;

procedure TfrmQuotatiuonMailer.edtQuotationNo1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F5) then
  begin
    edtQuotationNo1ClickBtn(Self);
  end
  else if (Key = VK_RETURN) then
  begin
    LoadDataQuotationMailer(edtQuotationNo1.Text, MasterNewUnit.ID);
    Perform(WM_NEXTDLGCTL,0,0);
  end;

end;

procedure TfrmQuotatiuonMailer.FormShow(Sender: TObject);
begin
  inherited;
  edtQuotationNo1.Text := '';
  InistialisasiGrid;
end;

procedure TfrmQuotatiuonMailer.btnUpdateClick(Sender: TObject);
begin
  inherited;
  frmDialogQuotationMailerNeo := TfrmDialogQuotationMailerNeo.Create(Self);
  DoPrintSlipQuotationMailer(edtQuotationNo1.Text,MasterNewUnit.ID, FLoginFullname, MasterNewUnit.Nama);
end;

procedure TfrmQuotatiuonMailer.frftr5btn1btnCloseClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmQuotatiuonMailer.dtRefDateKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key=#13 then Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmQuotatiuonMailer.dtEffectiveDateKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmQuotatiuonMailer.dtEffectiveTimeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmQuotatiuonMailer.dtEndDateKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmQuotatiuonMailer.dtEndTimeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmQuotatiuonMailer.edtRemarkKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmQuotatiuonMailer.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
//  if(Key = Ord('C'))and(ssctrl in Shift) then
//    btnAddClick(Sender)
//  else if(Key = Ord('E'))and(ssctrl in Shift) then
//    btnUpdateClick(Sender)
//  else if(Key = VK_DELETE)and(ssctrl in Shift) then
//    btnDeleteClick(Sender)
//  else if(Key = VK_F5)and(ssctrl in Shift) then
//    btnRefreshClick(Sender)
  if (Key = VK_ESCAPE) then
    Close;
end;

procedure TfrmQuotatiuonMailer.btnRefreshClick(Sender: TObject);
begin
//  inherited;
  LoadDataQuotationMailer(edtQuotationNo1.Text, MasterNewUnit.ID);
end;

procedure TfrmQuotatiuonMailer.btnUpdateEnter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmQuotatiuonMailer.btnUpdateExit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

procedure TfrmQuotatiuonMailer.LoadDataQuotationMailer(aNoBukti : String;
    aUnitID : Integer);
begin
  if FQuotationMailer.LoadByNoBukti(aNoBukti,aUnitID) then
  begin
    edtQuotationNo1.Text  := FQuotationMailer.RefNo;
    dtEffectiveDate.Date  := FQuotationMailer.EffectifDate;
    dtEndDate.Date        := FQuotationMailer.EndDate;
    edtRemark.Text        := FQuotationMailer.Remark;
    dtRefDate.Date        := FQuotationMailer.QuotDate;
    dtEffectivetime.Time  := FQuotationMailer.EffectifDate;
    dtEndTime.Time        := FQuotationMailer.EndDate;

    cClearGrid(strgGrid,False);
    ParseDataGrid;
    UbahIsParent;
    AturLebarKolom;
  end
  else begin
    CommonDlg.ShowMessage('Tidak Ada Quotation/Ref No');
    cClearGrid(strgGrid,False);
    ClearByTag(Self,[1]);
    Exit;
  end;
end;

procedure TfrmQuotatiuonMailer.strgGridGetFloatFormat(Sender: TObject;
  ACol, ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  inherited;
  FloatFormat := '%.2n';
  if (ARow > 1) and  (ACol in [_KolPrice,_KolSetelahDisc, _KolHArgaAVGIncPPN, _KolHArgaAVGExcPPN, _MUPersen, _MURupiah]) then
    IsFloat := True
  else
    IsFloat := False;
end;

end.
