unit ufrmQuotation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls,
  uRetnoUnit, ComCtrls, frxClass, jpeg, dxBarBuiltInMenu, cxStyles,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData,
  cxContainer, dxCore, cxDateUtils, Vcl.Menus, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, System.Actions, cxClasses,
  ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel, cxGridLevel, cxGridCustomView, cxGrid, cxPC, cxButtonEdit,
  Data.DB, Vcl.ActnList;

type
  TfrmQuotation = class(TfrmMasterBrowse)
    pnlTop: TPanel;
    pnlBottom: TPanel;
    lbl1: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    dtEffectiveDate: TcxDateEdit;
    lbl3: TLabel;
    dtRefDate: TcxDateEdit;
    Label5: TLabel;
    edtRemark: TEdit;
    Label6: TLabel;
    edtProdName: TEdit;
    Label7: TLabel;
    edtCatalog: TEdit;
    edtSupplierName: TEdit;
    edtMGName: TEdit;
    lbl7: TLabel;
    Label10: TLabel;
    edtKode: TEdit;
    edtSupplier: TcxButtonEdit;
    edtMGCode: TcxButtonEdit;
    edtQuotationref: TcxButtonEdit;
    frxReport1: TfrxReport;
    btnSlip: TButton;
    img1: TImage;
    cxGridViewColumn1: TcxGridDBColumn;
    cxGridViewColumn2: TcxGridDBColumn;
    cxGridViewColumn3: TcxGridDBColumn;
    cxGridViewColumn4: TcxGridDBColumn;
    cxGridViewColumn5: TcxGridDBColumn;
    cxGridViewColumn6: TcxGridDBColumn;
    cxGridViewColumn7: TcxGridDBColumn;
    cxGridViewColumn8: TcxGridDBColumn;
    cxGridViewColumn9: TcxGridDBColumn;
    cxGridViewColumn10: TcxGridDBColumn;
    cxGridViewColumn11: TcxGridDBColumn;
    cxGridViewColumn12: TcxGridDBColumn;
    cxGridViewColumn13: TcxGridDBColumn;
    cxGridViewColumn14: TcxGridDBColumn;
    cxGridViewColumn15: TcxGridDBColumn;
    cxGridViewColumn16: TcxGridDBColumn;
    cxGridViewColumn17: TcxGridDBColumn;
    cxGridViewColumn18: TcxGridDBColumn;
    cxGridViewColumn19: TcxGridDBColumn;
    cxGridViewColumn20: TcxGridDBColumn;
    cxGridViewColumn21: TcxGridDBColumn;
    procedure actAddExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actDeleteQuotationExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure strgGridRowChanging(Sender: TObject; OldRow, NewRow: Integer;
      var Allow: Boolean);
    procedure strgGridGetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
    procedure strgGridClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure fraFooter5Button1btnCloseClick(Sender: TObject);
    procedure fraFooter5Button1btnRefreshClick(Sender: TObject);
    procedure edtSupplierClickBtn(Sender: TObject);
    procedure edtMGCodeClickBtn(Sender: TObject);
    procedure edtQuotationrefClickBtn(Sender: TObject);
    procedure edtSupplierKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtMGCodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSupplierKeyPress(Sender: TObject; var Key: Char);
    procedure edtMGCodeKeyPress(Sender: TObject; var Key: Char);
    procedure edtQuotationrefKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSlipClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LoadDataQuotationLocal(aNobukti : String; aUnitID : Integer);
    procedure strgGridCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
  private

//    FSuplier : TNewSupplier;
//    FSupMG : TNewSupplierMerGroup; //berisi string kosong jika data tidak ditemukan
    procedure InisialisasiGrid;
    procedure AturLebarKolom;
    procedure LoadDataMerGroup(aKodeSupplier : String; aUnitID : Integer;
        aMerGroupCode : String);


    procedure ParseProductByCode(ACode: string; AUnitId: integer);

    procedure ParseHeaderGrid;
    procedure LoadDataQuotationItemToGrid;
    procedure LoadDataBarangQuotation(aQuotationItem, aBaris: Integer; aSupCode:
        String);

    procedure LoadDataHargaQuotation(aQuotationItem, aBaris: Integer);


  public
//    FQuotation: TNewQuotation;
    isMailer : Integer;
    aID : Integer;
    function GetTipeHArgaByID(aTipeHArgaID: Integer; aTipeHArgaUntID:integer):
        string;
    procedure LoadDataSupplier(aKode : String; aUntID : Integer);
    procedure LoadProductByBrgCode;
    procedure UbahIsParent;
  end;

var
  frmQuotation: TfrmQuotation;

implementation

uses  ufrmDialogQuotation, uTSCommonDlg, uConstanta, uAppUtils;

const
  _KolIsParent      : Integer = 0;
  _KolPLUPurchase   : Integer = 1;
  _KolPLU           : Integer = 2;
  _KolNamaBarang    : Integer = 3;
  _KolTipeHArga     : Integer = 4;
  _KolUOM           : Integer = 5;
  _KolHargaBeli     : Integer = 6;
  _KolUOMHargaBeli  : Integer = 7;
  _KolPPNPersen     : Integer = 8;
  _KolPrice         : Integer = 9;
  _KolDisc          : Integer = 10;
  _KolDiscPersen    : Integer = 11;
  _KolSetelahDisc   : Integer = 12;
  _KolHArgaAVGIncPPN: Integer = 13;
  _KolHArgaAVGExcPPN: Integer = 14;
  _MUPersen         : Integer = 15;
  _MURupiah         : Integer = 16;
  _KonvValue        : Integer = 17;
  _KolItemID        : Integer = 18;
  _isMailer         : Integer = 19;

{$R *.dfm}

procedure TfrmQuotation.actAddExecute(Sender: TObject);
begin
  inherited;
//  if not Assigned(frmDialogQuotation) then
  Application.CreateForm(TfrmDialogQuotation, frmDialogQuotation);

  with frmDialogQuotation do
  begin
    //FUnitID         := MasterNewUnit.ID;
    //FLoginFullname  := fLoginFullname;
    //FUnitName       := Self.MasterNewUnit.ID.Nama;
//    FIDLokal        := FQuotation.ID;

    SetFormPropertyAndShowDialog(frmDialogQuotation);

    if (IsProcessSuccessfull) then
    begin
//      LoadDataQuotationLocal(edtQuotationref.Text, MasterNewUnit.ID);
      CommonDlg.ShowConfirm(atAdd);
      //edtSupplier.SetFocus;
    end;

    Free;
  end;
end;

procedure TfrmQuotation.FormActivate(Sender: TObject);
begin
  inherited;
//  cClearGrid(strgGrid,False);
end;

procedure TfrmQuotation.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption   := 'MAINTENANCE QUOTATION';
  ParseHeaderGrid;

//  FQuotation          := TNewQuotation.Create(Self);
//  FSuplier            := TNewSupplier.Create(Self);
//  FSupMG              := TNewSupplierMerGroup.Create(Self);

  edtSupplier.Text    := '';
  edtMGCode.Text := '';
  edtQuotationref.Text:= '';
end;

procedure TfrmQuotation.FormDestroy(Sender: TObject);
begin
  inherited;
  frmQuotation := nil;
  frmQuotation.Free;
end;

procedure TfrmQuotation.actDeleteQuotationExecute(Sender: TObject);
begin
  if CommonDlg.Confirm('Apakah Anda Yakin Akan Menghapus Data ?') = mrYes then
  begin
    {if FQuotation.LoadByNoBukti(edtQuotationref.Text, MasterNewUnit.ID) then
    begin
      try
        if FQuotation.IsProcessed = 1 then
        begin
          CommonDlg.ShowError('Quotation Sudah Diproses');
          Exit;
        end;

        if FQuotation.RemoveFromDb  then
        begin
          cCommitTrans;
          CommonDlg.ShowMessage('Berhasil Menghapus Data');
          cClearGrid(strgGrid,False);
          
          edtSupplier.Text := '';
          edtSupplierName.Text := '';
          edtMGCode.Text := '';
          edtMGName.Text := '';
          edtQuotationref.Text := '';
          dtRefDate.Date := cGetServerTime;
          dtEffectiveDate.Date := cGetServerTime;
          edtRemark.Text := '';
          edtSupplier.SetFocus;
          
        end else begin
          cRollbackTrans;
          CommonDlg.ShowMessage('Gagal menghapus data');
        end;
      finally
        cRollbackTrans;
      end;
    end else begin
      CommonDlg.ShowMessage('Pilih Quotation yang Ingin Dihapus');
      Exit;
    end;}
  end;
end;

procedure TfrmQuotation.actEditExecute(Sender: TObject);
begin
  inherited;
  if (Trim(edtSupplier.Text) = '') and (Trim(edtSupplierName.Text) = '') then
  begin
    CommonDlg.ShowError('Data Supplier Salah');
    edtSupplier.SetFocus;
    Exit;
  end;

//  if FQuotation.IsProcessed = 1 then
  begin
    CommonDlg.ShowError('Quotation Sudah Diproses');
    Exit;
  end;

  Application.CreateForm(TfrmDialogQuotation, frmDialogQuotation);

  with frmDialogQuotation do
  begin
    FormMode        := fmEdit;
//    FIDLokal        := FQuotation.ID;

    Caption := 'Edit Quotation';
    SetFormPropertyAndShowDialog(frmDialogQuotation);

    if (IsProcessSuccessfull) then
    begin
//      LoadDataQuotationLocal(edtQuotationref.Text, MasterNewUnit.ID);
      CommonDlg.ShowConfirm(atEdit);
      //edtSupplier.SetFocus;
    end;
    Free;
  end;
end;

procedure TfrmQuotation.AturLebarKolom;
begin
  {with strgGrid do
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
    Columns[_isMailer].Width := 0;
  end;
  }
end;

procedure TfrmQuotation.FormShow(Sender: TObject);
begin
  inherited;
  InisialisasiGrid;

end;

procedure TfrmQuotation.ParseHeaderGrid;
begin
end;

procedure TfrmQuotation.LoadDataQuotationItemToGrid;
var
  iBaris: Integer;
  i: Integer;
begin
    {cClearGrid(strgGrid,False);

    for i := 0 to FQuotation.QuotationItems.Count - 1 do
    begin
      iBaris := i + 2;
      with strgGrid do
      begin
        strgGrid.AddCheckBox(_KolIsParent, iBaris,True,True);
        strgGrid.SetCheckBoxState(_KolIsPArent, iBaris, False);

        LoadDataBarangQuotation(FQuotation.QuotationItems[i], iBaris, edtSupplier.Text);
        LoadDataHargaQuotation(FQuotation.QuotationItems[i], iBaris);

        Ints[_isMailer, iBaris]         := FQuotation.IsMailer;
        Ints[_KolItemID, iBaris]        := FQuotation.QuotationItems[i].ID;

        if i + 1 < FQuotation.QuotationItems.Count then
          strgGrid.AddRow;
      end;
    end;

    AturLebarKolom;
    SetWarnaBarisSG(strgGrid);
    }
end;

procedure TfrmQuotation.LoadDataBarangQuotation(aQuotationItem, aBaris:
    Integer; aSupCode: String);
//var
//  FBarang: TNewBarang;
begin
 {
  with strgGrid do
  begin
    FBarang := aQuotationItem.GetBarang;
    try
      Cells[_KolPLUPurchase, aBaris]      := aQuotationItem.KodeBarangParent;
      Cells[_KolPLU, aBaris]              := FBarang.Kode;
      Cells[_KolNamaBarang, aBaris]       := FBarang.Alias;
      Cells[_KolUOM, aBaris]              := aQuotationItem.KodeSatuan;
      Cells[_kolTipeHArga, aBaris]        := GetTipeHArgaByID(aQuotationItem.TipeHargaID,MasterNewUnit.ID);
      Floats[_KolHargaBeli,aBaris]        := FBarang.GetHargaBeli(aSupCode);
      Cells[_KolUOMHargaBeli,aBaris]      := FBarang.GetSatuanHargaBeli(aSupCode);
      Floats[_KolPPNPersen, aBaris]       := FBarang.NewPajak.PPN;
      Floats[_KolHArgaAVGExcPPN, aBaris]  := FBarang.GetHargaAVG(aQuotationItem.KodeSatuan);
      Floats[_KolHArgaAVGIncPPN, aBaris]  := FBarang.GetHargaAVG(aQuotationItem.KodeSatuan) * (100 + FBarang.NewPajak.PPN) / 100;
      Floats[_KonvValue, aBaris]          := aQuotationItem.GetKonversiValue;
    finally
      FBarang.Free;
    end;
  end;
  }
end;

procedure TfrmQuotation.LoadDataHargaQuotation(aQuotationItem, aBaris: Integer);
begin
  {with strgGrid do
  begin
    Floats[_KolPrice , aBaris]      := aQuotationItem.Price;
    Floats[_KolDiscPersen , aBaris] := aQuotationItem.DiscPersen;
    Floats[_KolDisc, aBaris]        := aQuotationItem.DISC;
    Floats[_KolSetelahDisc, aBaris] := (100 - aQuotationItem.DiscPersen) / 100 * aQuotationItem.Price;

    if Floats[_KolHArgaAVGIncPPN,aBaris] > 0 then
      Floats[_MUPersen,aBaris]      := (Floats[_KolSetelahDisc,aBaris] - Floats[_KolHArgaAVGIncPPN,aBaris]) / Floats[_KolHArgaAVGIncPPN,aBaris] * 100
    else
      Floats[_MUPersen,aBaris]      := 0;

    Floats[_MURupiah, aBaris]       := Floats[_KolSetelahDisc,aBaris] - Floats[_KolHArgaAVGIncPPN,aBaris];
    
  end;}
end;


procedure TfrmQuotation.ParseProductByCode(ACode: string;
  AUnitId: integer);
var
  dataBarang: TDataSet;
  lCode: string;
begin
  lCode := ACode;

  if Length(lCode)<igProd_Code_Length then
    lCode := TAppUtils.StrPadLeft(ACode,igProd_Code_Length,'0');

//  dataBarang := TQuotation.GetProductByCode(lCode, AUnitId);

  if dataBarang = nil then
  begin
    edtProdName.Text := '';
    edtCatalog.Text := '';
    edtKode.Text := '';
    edtKode.SelectAll;

    if ACode <> '' then
    begin
      edtKode.Text := lCode;
      CommonDlg.ShowError('Product Not Found');
    end;
  end
  else
  begin
    edtKode.Text := dataBarang.FieldByName('BRG_CODE').AsString;
    edtProdName.Text := dataBarang.FieldByName('BRG_ALIAS').AsString;
    edtCatalog.Text := dataBarang.FieldByName('BRG_CATALOG').AsString;
  end;
end;

procedure TfrmQuotation.strgGridRowChanging(Sender: TObject; OldRow,
  NewRow: Integer; var Allow: Boolean);
begin
  inherited;
//  if strgGrid.Cells[0,NewRow] <> '' then
//    ParseProductByCode(strgGrid.Cells[1,NewRow], MasterNewUnit.ID);
end;

procedure TfrmQuotation.strgGridGetFloatFormat(Sender: TObject; ACol,
  ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  inherited;
  FloatFormat := '%.2n';
  if (ARow > 1) and  (ACol in [_KolHargaBeli, _KolPPNPersen, _KolPrice, _KolDisc, _KolDiscPersen, _KolSetelahDisc, _KolHArgaAVGIncPPN, _KolHArgaAVGExcPPN, _MUPersen, _MURupiah]) then
    IsFloat := True
  else
    IsFloat := False;
end;

function TfrmQuotation.GetTipeHArgaByID(aTipeHArgaID: Integer;
    aTipeHArgaUntID:integer): string;
var sSQL: string;
begin
  Result := '';
  sSQL := 'select tpHrg_name '
          + ' from ref$Tipe_Harga '
          + ' where tpHrg_ID = ' + IntToStr(aTipeHargaID);
  {
  with cOpenQuery(sSQL) do
  begin
    try
      Result := FieldByName('tpHrg_name').AsString;
    finally
      Free;
    end;
  end;
  }
end;

procedure TfrmQuotation.LoadProductByBrgCode;
var
  sSQL: string;
begin
  sSQL := 'select brg_code, brg_catalog, brg_alias '
          + ' from barang '
{          + ' where brg_code = ' + Quot(strgGrid.Cells[_KolPLU,strgGrid.Row]);
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
  }
end;

procedure TfrmQuotation.strgGridClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  inherited;
  LoadProductByBrgCode;
end;

procedure TfrmQuotation.fraFooter5Button1btnCloseClick(Sender: TObject);
begin
  inherited;
//  FQuotation.Free;
//  fraFooter5Button1.btnCloseClick(Sender);
end;

procedure TfrmQuotation.UbahIsParent;
var
  j: Integer;
  sPLU: string;
  sPLUPurchase, sPLUPurchase2 : string;
  i, itmp: Integer;
begin

  {
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
    end else begin
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
  end; }
end;

procedure TfrmQuotation.fraFooter5Button1btnRefreshClick(Sender: TObject);
begin
  //inherited;
//  LoadDataQuotationLocal(edtQuotationref.Text, MasterNewUnit.ID);
end;

procedure TfrmQuotation.edtSupplierClickBtn(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
  sSQL := ' Select sup_code as " Kode", sup_name as " Nama" '
          + ' from Suplier ';
  {
  with cLookUp('Suplier',sSQL) do
  begin
    try
     if Strings[0] = '' then
       Exit;

     edtSupplier.Text := Strings[0];


    finally
        Free;
    end;
  end;
   }
  edtMGCode.Text := '';
  edtMGName.Text := '';
  edtQuotationref.Text := '';
//  dtRefDate.Date := cGetServerTime;
  edtRemark.Text := '';
//  cClearGrid(strgGrid,False);
end;

procedure TfrmQuotation.edtMGCodeClickBtn(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
  sSQL := ' select c.merchangrup_code, c.merchangrup_name, b.supmg_merchangrup_id as "Id"'
        + ' from suplier a, suplier_merchan_grup b, ref$merchandise_grup c'
        + ' where b.supmg_code = ' + QuotedStr(edtSupplier.Text)
        + ' and c.merchangrup_id = b.supmg_merchangrup_id'
        + ' and a.sup_code = b.supmg_code ';

//    with cLookUp('Daftar Merchandise',sSQL) do
    begin
      try
//        if Strings[0] = '' then
          Exit;

//        edtMGCode.Text := Strings[0];
      finally
        Free;
      end;
    end;
end;

procedure TfrmQuotation.edtQuotationrefClickBtn(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
  sSQL := 'select d.quot_ref_no as "Ref No", d.quot_date as "Tanggal", d.quot_remark as "Remark", d.quot_id as "Id"'
          + ' from suplier a, suplier_merchan_grup b, ref$merchandise_grup c, quotation d '
          + ' where b.supmg_code =  ' + QuotedStr(edtSupplier.Text)
          + ' and c.merchangrup_code = ' + QuotedStr(edtMGCode.Text)
          + ' and c.merchangrup_id = b.supmg_merchangrup_id '
          + ' and a.sup_code = b.supmg_code'
          + ' and d.quot_supmg_sub_code = b.supmg_sub_code ';
    {
    with cLookUp('Quotation Ref',sSQL) do
    begin
      try
        if Strings[0] = '' then
          Exit;

        edtQuotationref.Text := Strings[0];  
        //LoadDataQuotationLocal(edtQuotationref.Text, MasterNewUnit.ID);

      finally
        Free;
      end;
    end;
    }
end;

procedure TfrmQuotation.edtSupplierKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
  begin
//    LoadDataSupplier(edtSupplier.Text, MasterNewUnit.ID);
    if edtSupplierName.Text <> '' then
      edtMGCode.SetFocus;
  end else if (Key = VK_F5) then
  begin
    edtSupplierClickBtn(Self)
  end;
end;

procedure TfrmQuotation.edtMGCodeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F5) then
  begin
    edtMGCodeClickBtn(Self)
  end
  else if (Key = VK_RETURN) then
  begin
//    LoadDataMerGroup(edtSupplier.Text, MasterNewUnit.ID, edtMGCode.Text);
    if edtMGName.Text <> '' then
      edtQuotationref.SetFocus;
  end;  
end;

procedure TfrmQuotation.edtSupplierKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := UpCase(Key);
end;

procedure TfrmQuotation.edtMGCodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := UpCase(Key);
end;

procedure TfrmQuotation.edtQuotationrefKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
 

      if (Key = VK_F5) then
      begin
        edtQuotationrefClickBtn(Self)
      end
      else if (Key = VK_RETURN) then
      begin
//        LoadDataQuotationLocal(edtQuotationref.Text, MasterNewUnit.ID);
      end;
end;

procedure TfrmQuotation.btnSlipClick(Sender: TObject);
begin
  inherited;
//  DoSlipQuotationHJ(edtQuotationref.Text, MasterNewUnit.ID, fLoginFullname, MasterNewUnit.Nama);
end;

procedure TfrmQuotation.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  inherited;
  if(Key = Ord('C'))and(ssctrl in Shift) then
    actAddExecute(Sender)
  else if(Key = Ord('E'))and(ssctrl in Shift) then
    actEditExecute(Sender)
  else if(Key = VK_DELETE)and(ssctrl in Shift) then
    actDeleteQuotationExecute(Sender)
  else if(Key = VK_F5)and(ssctrl in Shift) then
    fraFooter5Button1btnRefreshClick(Sender)
  else if (Key = VK_ESCAPE) then
    Close;
end;

procedure TfrmQuotation.InisialisasiGrid;
begin
  {with strgGrid do
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
    MergeCells(_isMailer,0,1,2);

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

    AturLebarKolom;
  end;
  }
end;


procedure TfrmQuotation.LoadDataMerGroup(aKodeSupplier : String; aUnitID :
    Integer; aMerGroupCode : String);
begin
  {with FSupMG do
  begin
    if LoadBySuplierKode(aKodeSupplier, aMerGroupCode) then
    begin
      edtMGCode.Text      := NewMerchadizeGroup.Kode;
      edtMGName.Text      := NewMerchadizeGroup.Nama;
    end else begin
      edtMGCode.Text := '';
      edtMGName.Text  := '';
    end;

    edtQuotationref.Text := '';
    LoadDataQuotationLocal(edtQuotationref.Text, MasterNewUnit.ID);
  end;

  edtQuotationref.Text := '';
  LoadDataQuotationLocal(edtQuotationref.Text, MasterNewUnit.ID);
  }
end;

procedure TfrmQuotation.LoadDataQuotationLocal(aNobukti : string; aUnitID : Integer);
begin
  {if FQuotation.LoadByNoBukti(aNobukti, aUnitID) then
  begin
    with TNewSupplierMerGroup.Create(Self) do
    begin
      if LoadByKode(FQuotation.SupmgSubCode) then
      begin
        if (NewMerchadizeGroup.Kode <> edtMGCode.Text) or
           (NewSupplier.Kode <> edtSupplier.Text) then
        begin
          cClearGrid(strgGrid,False);
          ClearByTag(Self,[1]);
        end else begin
          edtQuotationref.Text := aNobukti;
          dtRefDate.Date       := FQuotation.QuotDate;
          edtRemark.Text       := FQuotation.Remark;
          dtEffectiveDate.Date := FQuotation.EffectifDate;


          LoadDataQuotationItemToGrid;
          UbahIsParent;

          edtKode.Text     := '';
          edtProdName.Text := '';
          edtCatalog.Text  := '';
        end;
      end else begin
        cClearGrid(strgGrid,False);
        ClearByTag(Self,[1]);
      end;
    end;

  end
  else begin
    cClearGrid(strgGrid,False);
    ClearByTag(Self,[1]);
    Exit;
  end;
  }
end;

procedure TfrmQuotation.LoadDataSupplier(aKode : String; aUntID : Integer);
begin
 { with FSuplier do
  begin
    if LoadByKode(aKode) then
    begin
      edtSupplier.Text      := Kode;
      edtSupplierName.Text  := Nama;
    end else begin
      edtSupplier.Text      := '';
      edtSupplierName.Text  := '';
    end;

    LoadDataMerGroup('',MasterNewUnit.ID,'');
  end;
  }
end;

procedure TfrmQuotation.strgGridCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  inherited;
  CanEdit := False;
end;

end.

