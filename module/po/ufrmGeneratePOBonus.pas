unit ufrmGeneratePOBonus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialogBrowse, StdCtrls, ExtCtrls, Menus,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, cxButtonEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxButtons, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid;

type
  TfrmGeneratePOBonus = class(TfrmMasterDialogBrowse)
    edtNOPO: TEdit;
    dtPO: TcxDateEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    btnShow: TcxButton;
    edtDicari: TEdit;
    btnCari: TcxButton;
    cbbOption: TComboBox;
    cbbmerchangrup: TComboBox;
    edtNamaSuplier: TEdit;
    edtKodeSuplier: TcxButtonEdit;
    pnl2: TPanel;
    pnltop: TPanel;
    chkoption: TCheckBox;
    lbl4: TLabel;
    pm1: TPopupMenu;
    HapusBaris1: TMenuItem;
    edtNoPORef: TEdit;
    lbl5: TLabel;
    HapusSemua1: TMenuItem;
    cxcolNo: TcxGridDBColumn;
    cxcolKode: TcxGridDBColumn;
    cxcolNAMABARANG: TcxGridDBColumn;
    cxcolSATUAN: TcxGridDBColumn;
    cxcolQTYORDER: TcxGridDBColumn;
    cxcolKODESUPLIER: TcxGridDBColumn;
    cxcolNAMASUPLIER: TcxGridDBColumn;
    cxcolLEADTIME: TcxGridDBColumn;
    cxcolFORBONUS: TcxGridDBColumn;
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure frftr5btn1btnCloseClick(Sender: TObject);
    procedure btnShowClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtDicariKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCariClick(Sender: TObject);
    procedure cbbmerchandiseChange(Sender: TObject);
    procedure cbbmerchangrupChange(Sender: TObject);
    procedure edtKodeSuplierExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure HapusBaris1Click(Sender: TObject);
    procedure edtNoPORefKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure HapusSemua1Click(Sender: TObject);
    procedure GridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridCellValidate(Sender: TObject; ACol, ARow: Integer;
      var Value: String; var Valid: Boolean);
    procedure edtKodeSuplierKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtKodeSuplierClickBtn(Sender: TObject);
    procedure controlbtnDeleteClick(Sender: TObject);
  private
    BarisGrid: Integer;
//    FBarang: TNewBarang;
//    FPO: TPO;
//    FPOBOnusITem: TPOBonusItem;
//    FSO: TSO;
//    FSupMerGroup: TNewSupplierMerGroup;
//    FSupplier: TNewSupplier;
    iStatusPOID: Integer;
    sNoSO: string;
    procedure SetDataBarang(aBaris, aBarang: Integer);
    procedure SetDataSubSupplier(aBaris, aSubSupplier: Integer);
    procedure SetDataSupplier(aBaris, aSupplier: Integer);
    { Private declarations }
  public

    sQTYnew: string;
    sQTYold: string;
    sUOMnew: string;
    sUOMold: string;
//    dFactorX : Real;

    function cConvertUOM(strBrgCode:String; strUOMFromCode:String; strUOMToCode : String; dblQTY : Double): Single;
    function CekDuplicateKodeBarang: Boolean;
    function CekExistUOMKosong: Boolean;
    function CekIsQTYNol: Boolean;
    function CekUOM(strKodeBrg : string ;strUOMCek : string) : Boolean;
    function CreateHeaderPO(aRow : Integer): Boolean;
    function CreateSO(aRow : Integer): Boolean;
    procedure LoadDataToGridAll;
    function SetFilterDay(aToday : TDateTime): string;
    function CreatePOBonus(aRow : Integer): Boolean;
    function IsMGReferensiSama: Boolean;
    procedure LoadDataPORef(aNoBukti : String ; aUnitID : Integer);
    procedure LoadDataToGrid;
    procedure LoadMerchandiseGoup;
    procedure LoadSuplierName;
    function NextPONO: Integer;
    function SetFilterMerchandiseGroup: string;
    function SetFilterSuplier: string;
    { Public declarations }
  end;

var
  frmGeneratePOBonus: TfrmGeneratePOBonus;

implementation

uses DateUtils, Math, uTSCommonDlg, uAppUtils;

const
//  _kolUOM = 3;
  _kolMerchanID : Integer = 18;
  _kolBrgsupID : Integer = 17;
  _kolIsSat : Integer = 16;
  _kolIsFri : Integer = 15;
  _kolIsThu : Integer = 14;
  _kolIsWed : Integer = 13;
  _kolIsTue : Integer = 12;
  _kolIsMon : Integer = 11;
  _kolIsSun : Integer = 10;
  _kolMerchandiseGroup : Integer = 9 ;
  _kolIsBonusForBonus : Integer = 8;
  _KolLeadTime : Integer = 7;
  _kolSuplierName : Integer = 6;
  _kolSuplierCode : Integer = 5;
  _kolQtyOrder : Integer = 4;
  _kolUOM : Integer = 3;
  _kolNamaBarang : Integer = 2;
  _kolKodeBArang : Integer = 1;
  _kolNo : Integer = 0;



{$R *.dfm}

procedure TfrmGeneratePOBonus.actDeleteExecute(Sender: TObject);
begin
  inherited;
  edtNOPO.Text := TAppUtils.StrPadLeft(IntToStr(NextPONO),10,'0');

  actSave.Enabled := True;
  actDelete.Enabled := False;
  edtNOPO.SetFocus;
end;

procedure TfrmGeneratePOBonus.actSaveExecute(Sender: TObject);
var
  IsHeaderSudahDiCreate: Boolean;
  hasil: Boolean;
  state: Boolean;
  row: Integer;
begin
  inherited;
  hasil := True;

  if not IsMGReferensiSama then
  begin
    CommonDlg.ShowError('Supplier PO Bonus Dengan Referensi PO Tidak Sama');
    cbbmerchangrup.SetFocus;
    Exit;
  end;

  if CekIsQTYNol then
  begin
    CommonDlg.ShowMessage('QTY Order Masih Kosong');
    Exit;
  end;

  if CekDuplicateKodeBarang then
  begin
    CommonDlg.ShowMessage('Tidak Boleh Ada Data Barang Yang Sama');
    Exit;
  end;

  if CekExistUOMKosong then
  Begin
    CommonDlg.ShowMessage('Ada UOM yang masih kosong');
    Exit;
  End;
  {
  if Trim(Grid.Cells[_kolKodeBarang, grid.FixedRows]) = '' then
  begin
    CommonDlg.ShowMessage('Tidak Ada Data Yang Disimpan');
    Exit;
  end;

  if not IsValidDateKarenaEOD(Trim(edtNOPO.Text),masternewunit.id,dtPO.Date,TTPO,FMasterIsStore) then
    Exit;

  try
    FPO.POBonusItems.Clear;
    IsHeaderSudahDiCreate := False;
    for row := 1 to Grid.RowCount - 1 do
    begin
      Grid.GetCheckBoxState(_kolNo,row,state);
      if state then
      begin
        if not IsHeaderSudahDiCreate then
        begin
          if not CreateSO(row) then
          begin
            cRollbackTrans;
            CommonDlg.ShowMessage('Gagal Create SO');
            Exit;
          end;

          if not CreateHeaderPO(row) then
          begin
            cRollbackTrans;
            CommonDlg.ShowMessage('Gagal Create PO');
            Exit;
          end;

          IsHeaderSudahDiCreate := True;
        end;

        if not CreatePOBonus(row) then
        begin
          cRollbackTrans;
          CommonDlg.ShowMessage('Gagal Create PO Bonus');
          Exit;
        end;
      end;
    end;

    if IsNoBuktiExist('SO','SO_NO','SO_UNT_ID',FSO.NewUnit.ID, FSO.NoBukti) then
    begin
      CommonDlg.ShowError('No Bukti SO Sudah Pernah Dipakai' +
                          #13 + 'Langsung Digenerate Ulang, Silahkan Disimpan Ulang');
      Exit;
    end else if IsNoBuktiExist('PO','PO_NO','PO_UNT_ID',FPO.NewUnit.ID, FPO.NoBukti) then
    begin
      CommonDlg.ShowError('No Bukti PO Sudah Pernah Dipakai' +
                          #13 + 'Langsung Digenerate Ulang, Silahkan Disimpan Ulang');

      edtNOPO.Text := StrPadLeft(IntToStr(NextPONO),10,'0');
      Exit;
    end;

    if not FSO.ExecuteGenerateSQL(True) then
    begin
      cRollbackTrans;
      CommonDlg.ShowMessage('Gagal Menyimpan SO');
    end else if not FPO.ExecuteGenerateSQL then
    begin
      cRollbackTrans;
      CommonDlg.ShowMessage('Gagal Menyimpan PO');
    end;

    for row := 0 to FPO.POBonusItems.Count - 1 do
    begin
      if not FPO.POBonusItems[row].ExecuteGenerateSQL then
      begin
        cRollbackTrans;
        Exit;
      end ;
    end;

    if hasil then
    begin
      cCommitTrans;
      CommonDlg.ShowMessage('Berhasil Simpan Data');
      DoSlipPOBonusSingle(edtNOPO.Text,masternewunit.id,FLoginFullname,MasterNewunit.Nama);
      control.btnUpdate.Enabled := False;
      control.btnAdd.Enabled := True;
      ClearByTag(Self,[0]);
      cClearGrid(Grid,False);
      control.btnAdd.SetFocus;
    end else begin
      cRollbackTrans;
      CommonDlg.ShowError('Gagal Simpan Data');
    end;
  finally
    cRollbackTrans;
  end;
  }
end;

procedure TfrmGeneratePOBonus.frftr5btn1btnCloseClick(Sender: TObject);
begin
  inherited;

//  FreeAndNil(FPOBOnusITem);
  Close;

end;

procedure TfrmGeneratePOBonus.LoadDataToGridAll;
var
  sSQL: string;
begin
  sSQL := ' select a.brg_code, a.brg_alias, a.brg_sat_code_stock, c.sup_code, '
          + ' c.sup_Name, d.supmg_lead_time, b.brgsup_id, d.supmg_merchangrup_id, d.supmg_sub_code, d.supmg_is_sun, '
          + ' d.supmg_is_mon, d.supmg_is_tue, d.supmg_is_wed, d.supmg_is_thu, d.supmg_is_fri, d.supmg_is_sat, e.merchangrup_merchan_id '
          + ' from barang a, barang_suplier b, suplier c, suplier_merchan_grup d, ref$merchandise_grup e '
//          + ' where e.merchangrup_id = ' + IntToStr(cGetIDfromCombo(cbbmerchangrup))
          + ' and d.supmg_merchangrup_id = e.merchangrup_id '
          + ' and c.sup_code = d.supmg_code '
          + ' and b.brgsup_supmg_sub_code = d.supmg_sub_code '
          + ' and a.brg_code = b.brgsup_brg_code '
          + SetFilterSuplier
          + ' order by a.brg_code';
  {
  with cOpenQuery(ssql) do
  begin
    if not FieldByName('brg_code').IsNull then
    begin
      BarisGrid := 1;
      while not Eof do
      begin
        cShowWaitWindow('Load Data' + IntToStr(BarisGrid) );
        Application.ProcessMessages;
        Grid.AddCheckBox(_kolNo,BarisGrid,True,True);
        Grid.SetCheckBoxState(_kolNo,BarisGrid,True);
        Grid.Cells[_kolQTYOrder, BarisGrid] := '0';
        Grid.Cells[_kolKodeBarang, BarisGrid] := fieldByName('brg_code').AsString;
        Grid.Cells[_kolNamaBarang, BarisGrid] := fieldByName('brg_alias').AsString;
        //Grid.Cells[_kolUOM, BarisGrid] := fieldByName('brg_sat_code_stock').AsString;
        Grid.Cells[_kolSuplierCode, BarisGrid] := FieldByName('sup_code').AsString;
        Grid.Cells[_kolSuplierName, BarisGrid] := fieldByname('sup_Name').AsString;
        Grid.Cells[_kolLeadtime, BarisGrid] := FieldByname('supmg_lead_time').AsString;
        Grid.Cells[_kolMerchandiseGroup, BarisGrid] := FieldByname('supmg_sub_code').AsString;
        Grid.Cells[_kolIsSun, BarisGrid] := FieldByname('supmg_Is_Sun').AsString;
        Grid.Cells[_kolIsMon, BarisGrid] := FieldByname('supmg_Is_Mon').AsString;
        Grid.Cells[_kolIsTue, BarisGrid] := FieldByname('supmg_Is_Tue').AsString;
        Grid.Cells[_kolIsWed, BarisGrid] := FieldByname('supmg_Is_Wed').AsString;
        Grid.Cells[_kolIsThu, BarisGrid] := FieldByname('supmg_Is_Thu').AsString;
        Grid.Cells[_kolIsFri, BarisGrid] := FieldByname('supmg_Is_Fri').AsString;
        Grid.Cells[_kolIsSat, BarisGrid] := FieldByname('supmg_Is_Sat').AsString;
        Grid.Cells[_kolMerchanID, BarisGrid] := FieldByName('merchangrup_merchan_id').AsString;
        Grid.AddCheckBox(_kolIsBonusForBonus,BarisGrid,True,True);
        Grid.SetCheckBoxState(_kolIsBonusForBonus,BarisGrid,True);
        Inc(BarisGrid, 1);
        Next;
        if not Eof then
          Grid.AddRow;
      end;
    end else
      CommonDlg.ShowMessage('Tidak Ada Data Yang DiTampilkan');
  end;
  cCloseWaitWindow;
  }
end;

function TfrmGeneratePOBonus.SetFilterDay(aToday : TDateTime): string;
var
  iToday: Integer;
begin
  Result := '';
  iToday := DayOfWeek(aToday);

  if iToday = 1 then
    Result := ' and d.SUPMG_IS_SUN = 1 '
  else if iToday = 2 then
    Result := ' and d.SUPMG_IS_MON = 1 '
  else if iToday = 3 then
    Result := ' and d.SUPMG_IS_TUE = 1 '
  else if iToday = 4 then
    Result := ' and d.SUPMG_IS_WED = 1 '
  else if iToday = 5 then
    Result := ' and d.SUPMG_IS_THU = 1 '
  else if iToday = 6 then
    Result := ' and d.SUPMG_IS_FRI = 1 '
  else if iToday = 7 then
    Result := ' and d.SUPMG_IS_SAT = 1 ';
end;

procedure TfrmGeneratePOBonus.btnShowClick(Sender: TObject);
begin
  inherited;

  
  if chkoption.Checked then
  begin
//    cClearGrid(Grid,False);
    LoadDataToGridAll
  end
  else
    LoadDataToGrid;

//    HapusBarisKosong(Grid,1);
end;

function TfrmGeneratePOBonus.CreateHeaderPO(aRow : Integer): Boolean;
var
  aTipePOUnit_ID: Integer;
  aTipePOID: Integer;
  aTglValid: TdateTime;
  aTglPengiriman: TdateTime;
  aTglBukti: TdateTime;
  aSupplierMerchandizeGroupUnit_ID: Integer;
  aStatusPOUnit_ID: Integer;
  aStatusPOID: Integer;
  aSOUnit_ID: Integer;
  aSOKode: string;
  aServiceLevel: Double;
  aNoBukti: string;
  aNewUnit_ID: Integer;
  aNewSupplierMerGroupKode: string;
  aKeteranganCetak: string;
  aDescription: string;
begin
  aDescription := 'sky';
  aKeteranganCetak := '';
  {
  aNewSupplierMerGroupKode := Grid.Cells[_kolMerchandiseGroup,arow];
  aNewUnit_ID := masternewunit.id;
  aNoBukti := edtNOPO.Text;
  aServiceLevel := 0 ;

  aSOKode := sNoSO;
  aSOUnit_ID := masternewunit.id;
  aStatusPOID:= iStatusPOID;
  aStatusPOUnit_ID := masternewunit.id;
  aSupplierMerchandizeGroupUnit_ID := masternewunit.id;
  aTglBukti := dtPO.Date;
  aTglPengiriman := cGetServerTime ;
  aTglValid := dtPO.Date + StrToInt(Grid.Cells[_kolLeadTime,aRow]) ;
  aTipePOID := 1;
  aTipePOUnit_ID := masternewunit.id;

  FPO.UpdateData(
    1,
    aDescription,
    0,
    aKeteranganCetak,
    aNewSupplierMerGroupKode,
    aNewUnit_ID,
    aNoBukti,
    0, 0,
    aServiceLevel,
    aSOKode,
    aSOUnit_ID,
    aStatusPOID,
    aTglBukti,
    aTglPengiriman,
    aTglValid,
    aTipePOID,
    0,
    1,
    edtNoPORef.Text,
    masternewunit.id
    );
  Result := True;
  }
end;

function TfrmGeneratePOBonus.CreateSO(aRow : Integer): Boolean;
var
  aTglBukti: TDateTime;
  aNewUnit_ID: Integer;
  aMErchandizeID: Integer;
  aMerchandizeUnit_ID: Integer;
begin
  {aMerchandizeUnit_ID     := masternewunit.id  ;
  aMErchandizeID          := StrToInt(Grid.Cells[_kolMerchanID,aRow]);
  aNewUnit_ID             := masternewunit.id;
  sNoSO                   := TSO.GetNextSONumber(masternewunit.id);
  aTglBukti               := dtPO.Date;
  
  FSO.UpdateData(
    aMerchandizeUnit_ID,
    aMErchandizeID,
    aNewUnit_ID,
    sNoSO,
    aTglBukti,
    FLoginId,
    FLoginUnitId
  );

  Result := True;
  }
end;

procedure TfrmGeneratePOBonus.FormShow(Sender: TObject);
begin
  inherited;
  edtKodeSuplier.Text := '';
  LoadMerchandiseGoup;
//  dtPO.Date := cGetServerTime;
  actDelete.Enabled := False;
end;


function TfrmGeneratePOBonus.CreatePOBonus(aRow : Integer): Boolean;
var
  state: Boolean;
  aBarangUnitID, aID, aIsBonusForBonus, aPOUnitID : Integer;
  aKodeBarang, aKodeUOM, aNoBukti : String;
  aUnitID, aUOMUnitID : Integer;
  aQTY : Double;

begin
  {
  aBarangUnitID := masternewunit.id;
  aID := 0;

  Grid.GetCheckBoxState(_kolIsBonusForBonus,aRow,state);
  if state then
    aIsBonusForBonus := 1
  else
    aIsBonusForBonus := 0;

  aPOUnitID := masternewunit.id;
  aKodeBarang := Grid.Cells[_kolKodeBarang,aRow];
  aKodeUOM := Grid.Cells[_kolUOM,aRow];
  aNoBukti := edtNOPO.Text;
  aUOMUnitID := masternewunit.id;
  aQTY := StrToFloat(Grid.Cells[_kolQtyOrder,aRow]);
  aUnitID := masternewunit.id;

  //FPO.POBonusItems.Clear;

  FPO.UpdatePOBonusItem(
  aBarangUnitID,
  aID,
  aIsBonusForBonus,
  aKodeBarang,
  aKodeUOM,
  aUnitID,
  aQTY,
  aUOMUnitID,
  aNoBukti,
  aPOUnitID,
  FLoginId);
  Result := True;
  }
end;

procedure TfrmGeneratePOBonus.FormCreate(Sender: TObject);
begin
  inherited;
  {FSO := TSO.Create(Self);
  FPO := TPO.Create(Self);
  FPOBOnusITem := TPOBonusItem.Create(nil);
  FBarang := TNewBarang.Create(Self);
  FSupplier := TNewSupplier.Create(Self);
  FSupMerGroup := TNewSupplierMerGroup.Create(Self);
  BarisGrid := 1;
  }
end;

procedure TfrmGeneratePOBonus.edtDicariKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  

  IF Key = #13 then
  begin
    btnCariClick(nil);
  end;
end;

procedure TfrmGeneratePOBonus.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i: Integer;
  _isChecked: Boolean;
begin
  inherited;
  {if (Key = 88) then
  begin
    for i:= 1 to Grid.RowCount do
    begin
      Grid.GetCheckBoxState(_kolNo,i,_isChecked);
      if _isChecked then
        Grid.SetCheckBoxState(_kolNo,i,False)
      else
        Grid.SetCheckBoxState(_kolNo,i,True);
    end;
  end;
  }
end;

procedure TfrmGeneratePOBonus.btnCariClick(Sender: TObject);
var
  sSQL: string;
  setFilterNamaBarang: string;
  setFilterKodeBArang: string;
//  i: Integer;
begin
  inherited;
  UpperCase(edtDicari.Text);
   {
  Grid.Row := 1;

  if cbbOption.ItemIndex = 0 then
  begin
    setFilterKodeBarang := ' and a.brg_code like ' + Quot('%' + edtDicari.Text + '%');
    setFilterNamaBarang := '';
  end else
  begin
    setFilterKodeBarang := '';
    setFilterNamaBarang := ' and a.brg_alias like '+ Quot('%' + UpperCase(edtDicari.Text) + '%');
  end;


  sSQL := ' select a.brg_code, a.brg_alias, a.brg_sat_code_stock, c.sup_code, '
          + ' c.sup_Name, d.supmg_lead_time, b.brgsup_id, d.supmg_merchangrup_id, '
          + ' d.supmg_sub_code, d.supmg_is_sun, '
          + ' d.supmg_is_mon, d.supmg_is_tue, d.supmg_is_wed, d.supmg_is_thu, '
          + ' d.supmg_is_fri, d.supmg_is_sat, e.merchangrup_merchan_id, d.supmg_code '
          + ' from barang a, barang_suplier b, suplier c, suplier_merchan_grup d, '
          + ' ref$merchandise_grup e '
          + ' where e.merchangrup_id =  ' + IntToStr(cGetIDfromCombo(cbbmerchangrup))
          + ' and d.supmg_merchangrup_id = e.merchangrup_id '
          + ' and c.sup_code = d.supmg_code '
          + ' and b.brgsup_supmg_sub_code = d.supmg_sub_code '
          + ' and a.brg_code = b.brgsup_brg_code '
          + 'and d.supmg_code = ' + Quot(edtKodeSuplier.Text)
          + setFilterKodeBArang
          + setFilterNamaBarang ;

  with cOpenQuery(ssql) do
  begin
    if not FieldByName('brg_code').IsNull then
    begin
      BarisGrid := 1;
      cClearGrid(Grid,False);
      while not Eof do
      begin
        cShowWaitWindow('Load Data' + IntToStr(BarisGrid) );
        Application.ProcessMessages;

        Grid.AddCheckBox(_kolNo,BarisGrid,True,True);
        Grid.SetCheckBoxState(_kolNo,BarisGrid,True);
        Grid.Cells[_kolQTYOrder, BarisGrid] := '0';
        Grid.Cells[_kolKodeBarang, BarisGrid] := fieldByName('brg_code').AsString;
        Grid.Cells[_kolNamaBarang, BarisGrid] := fieldByName('brg_alias').AsString;
        Grid.Cells[_kolUOM, BarisGrid] := fieldByName('brg_sat_code_stock').AsString;
        Grid.Cells[_kolSuplierCode, BarisGrid] := FieldByName('sup_code').AsString;
        Grid.Cells[_kolSuplierName, BarisGrid] := fieldByname('sup_Name').AsString;
        Grid.Cells[_kolLeadtime, BarisGrid] := FieldByname('supmg_lead_time').AsString;
        Grid.Cells[_kolBrgsupId, BarisGrid] := FieldByname('brgsup_id').AsString;
        Grid.Cells[_kolMerchandiseGroup, BarisGrid] := FieldByname('supmg_sub_code').AsString;

        Grid.Cells[_kolIsSun, BarisGrid] := FieldByname('supmg_Is_Sun').AsString;
        Grid.Cells[_kolIsMon, BarisGrid] := FieldByname('supmg_Is_Mon').AsString;
        Grid.Cells[_kolIsTue, BarisGrid] := FieldByname('supmg_Is_Tue').AsString;
        Grid.Cells[_kolIsWed, BarisGrid] := FieldByname('supmg_Is_Wed').AsString;
        Grid.Cells[_kolIsThu, BarisGrid] := FieldByname('supmg_Is_Thu').AsString;
        Grid.Cells[_kolIsFri, BarisGrid] := FieldByname('supmg_Is_Fri').AsString;
        Grid.Cells[_kolIsSat, BarisGrid] := FieldByname('supmg_Is_Sat').AsString;
        Grid.Cells[_kolMerchanID, BarisGrid] := FieldByName('merchangrup_merchan_id').AsString;
        Grid.AddCheckBox(_kolIsBonusForBonus,BarisGrid,True,True);
        Grid.SetCheckBoxState(_kolIsBonusForBonus,BarisGrid,True);
        Inc(BarisGrid, 1);
        Next;
        if not Eof then
          Grid.AddRow;
      end;
    end else
      CommonDlg.ShowMessage('Tidak Ada Data Yang DiTampilkan');
  end;
  cCloseWaitWindow;
  }
end;

procedure TfrmGeneratePOBonus.LoadMerchandiseGoup;
var
  sSQL: string;
begin
  if trim(edtKodeSuplier.Text) <> '' then
  begin
  sSQL := 'select brg_merchangrup_id,c.merchangrup_name from barang a'
          + ' inner join barang_suplier b on a.brg_code=b.brgsup_brg_code '
          + ' inner join ref$merchandise_grup c on a.brg_merchangrup_id=c.merchangrup_id'
          + ' where  b.brgsup_supmg_sub_code = ' + QuotedStr(edtKodeSuplier.Text) ;

//  cQueryToComboObject(cbbmerchangrup,sSQL);
  end;
end;

function TfrmGeneratePOBonus.NextPONO: Integer;
var
  sSQL: string;
begin
// sSQL := 'select max(PO_NO) as maksPO from PO '
//       + ' where PO_UNT_ID = '+IntToStr(masternewunit);
  {
  with cOpenQuery(sSQL) do
  begin
    try
      Result := fieldByName('maksPO').AsInteger+1;
    except
      Result := 1;
    end;

  end;
  }

end;

function TfrmGeneratePOBonus.SetFilterMerchandiseGroup: string;
begin
//  Result := ' and e.merchangrup_id = ' + IntToStr(cGetIDfromCombo(cbbmerchangrup))
//            + ' ';
end;

procedure TfrmGeneratePOBonus.cbbmerchandiseChange(Sender: TObject);
begin
  inherited;
  LoadMerchandiseGoup;
end;

function TfrmGeneratePOBonus.SetFilterSuplier: string;
begin
  Result := ' and d.supmg_code = ' + QuotedStr(edtKodeSuplier.Text);
end;

procedure TfrmGeneratePOBonus.cbbmerchangrupChange(Sender: TObject);
begin
  inherited;
//  cClearGrid(Grid,False);
  BarisGrid := 1;
end;

function TfrmGeneratePOBonus.cConvertUOM(strBrgCode:String; strUOMFromCode :
    String; strUOMToCode : String; dblQTY : Double): Single;
var
  sSQL: String;
begin
  sSQL := 'select a.konvsat_scale'
       + ' from ref$konversi_satuan a'
       + ' where a.konvsat_sat_code_from = ' + QuotedStr(strUOMFromCode)
       + ' and a.konvsat_sat_code_to = ' + QuotedStr(strUOMToCode)
       + ' and a.konvsat_brg_code = ' + QuotedStr(strBrgCode) ;
  {
  With cOpenQuery(sSQL) do
  Begin
    Try;
      Result := Fields[0].AsFloat ;
    Finally;
      Free;
    End;
  End;
  }
end;

function TfrmGeneratePOBonus.CekDuplicateKodeBarang: Boolean;
var
  j: Integer;
  diCari: string;
  i: Integer;
begin
  Result := False;
  {
  for i := Grid.FixedRows to Grid.RowCount - 2 do
  begin
    diCari := Grid.Columns[_kolKodeBArang].Rows[i];
    for j := i + 1 to Grid.RowCount - 1 do
    begin
      if (Trim(diCari) = Trim(Grid.Cells[_kolKodeBarang, j])) and (Trim(Grid.Cells[_kolUOM, i]) = Trim(Grid.Cells[_kolUOM, j])) then
      begin
        Result := True;
        Exit;
      end;
    end;
  end;
  }
end;

function TfrmGeneratePOBonus.CekExistUOMKosong: Boolean;
var
  state: Boolean;
  i: Integer;
begin
  Result := False;
  {
  for i := 1 to Grid.RowCount - 1 do
  begin
    Grid.GetCheckBoxState(_kolNo,i,state);
    if (Grid.Cells[_kolUOM,i] = '') and (state) then
    begin
      Result := True;
      Exit;
    end;
  end;
  }
end;

function TfrmGeneratePOBonus.CekIsQTYNol: Boolean;
var
  state: Boolean;
  i: Integer;
begin
  Result := False;
  {
  for i := 1 to Grid.RowCount - 1 do
  begin
    Grid.GetCheckBoxState(_kolNo,i,state);
    if (Grid.Columns[_kolQtyOrder].Floats[i] <= 0) and (state) then
    begin
      Result := True;
      Exit;
    end;
  end;
  }
end;

function TfrmGeneratePOBonus.CekUOM(strKodeBrg : string ; strUOMCek : string) : Boolean;
var
  strUOMCode: string;
  sSQL: String;
begin
  Result := False;
    sSQL := 'select a.konvsat_sat_code_from'
         + ' from ref$konversi_satuan a'
         + ' where a.konvsat_brg_code = ' + QuotedStr(strKodeBrg)
         + ' and a.konvsat_sat_code_from=' + QuotedStr(UpperCase(strUOMCek));
  {
  with cOpenQuery(sSQL) do
  Begin
    Try
      strUOMCode := Fields[0].AsString;
    Finally
      Free;
    End;
  End;
  }
  if not (strUOMCode = '') then
    Result := True;
end;

procedure TfrmGeneratePOBonus.LoadDataToGrid;
var
  sSQL: string;
begin
  sSQL := ' select a.brg_code, a.brg_alias,c.sup_code, c.sup_Name ,e.MERCHANGRUP_CODE,d.supmg_sub_code'
          + ' from barang a, barang_suplier b, suplier c, suplier_merchan_grup d, ref$merchandise_grup e '
//          + ' where e.merchangrup_id = ' + IntToStr(cGetIDfromCombo(cbbmerchangrup))
          + ' and a.brg_merchangrup_id=e.merchangrup_id  '

          + ' and c.sup_code = d.supmg_code '
          + ' and b.brgsup_supmg_sub_code = d.supmg_sub_code '
          + ' and a.brg_code = b.brgsup_brg_code '
          + SetFilterSuplier;
  {
  with cLookUp('Data',sSQL) do
  begin
    if Trim(Strings[0]) <> '' then
    begin
      Grid.AddRow;

      BarisGrid       := GetBarisKosong(Grid, _kolKodeBArang) ;

      FBarang.LoadByKode(Strings[0]);
      FSupplier.LoadByKode(Strings[2]);
      FSupMerGroup.LoadBySuplierKode(Strings[2]);

      Grid.AddCheckBox(0,BarisGrid,True,True);
      Grid.SetCheckBoxState(0,BarisGrid,True);

      Grid.Cells[_kolQTYOrder, BarisGrid] := '0';
      Grid.Cells[_kolMerchanID, BarisGrid] := IntToStr(FBarang.NewMerchadize.ID);
      Grid.Cells[_kolMerchandiseGroup,BarisGrid] := Strings[5];
      SetDataBarang(BarisGrid, FBarang);
      SetDataSupplier(BarisGrid, FSupplier);
      SetDataSubSupplier(BarisGrid, FSupMerGroup);

      Grid.AddCheckBox(_kolIsBonusForBonus,BarisGrid,True,True);
      Grid.SetCheckBoxState(_kolIsBonusForBonus,BarisGrid,True);

      Inc(BarisGrid, 1);
      Application.ProcessMessages;
    end;
  end;
  }
end;

procedure TfrmGeneratePOBonus.edtKodeSuplierExit(Sender: TObject);
begin
  inherited;
  LoadSuplierName;
  LoadMerchandiseGoup;
end;

procedure TfrmGeneratePOBonus.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmGeneratePOBonus.HapusBaris1Click(Sender: TObject);
begin
  inherited;
//  HapusBarisTertentu(Grid);
end;

procedure TfrmGeneratePOBonus.edtNoPORefKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  sSQL: string;
begin
  inherited;
  {
  if Key = VK_F5 then
  begin
    sSQL := ' select a.po_no as "NOMOR PO", a.PO_DATE as "TGL PO",  a.PO_SO_NO as "NOMOR SO" ,b.STAPO_NAME as "STATUS", a.po_stapo_id as "ID STATUS PO" '
            + ' from po a, ref$status_po b '
            + ' where b.stapo_id = a.PO_STAPO_ID '
            + ' and b.stapo_id = 1'
            + ' and a.is_po_bonus = 0'
            + ' and a.po_unt_id = ' + IntToStr(masternewunit.id);

    with cLookUp('Daftar No Referensi PO', sSQL,200,1,True) do
    begin
      try
        if Strings[0] = '' then
          Exit;

        LoadDataPORef(Strings[0], masternewunit.id);
      finally
        Free;
      end;
    end;

  end;
  }
end;

function TfrmGeneratePOBonus.IsMGReferensiSama: Boolean;
begin
  Result := False;
  {
  with TPO.Create(Self) do
  begin
    try
      if LoadByNoBukti(edtNoPORef.Text, masternewunit.id) then
      begin
        Result := NewSupplierMerGroup.NewSupplier.Kode  = edtKodeSuplier.Text;
      end;

    finally
      Free;
    end;
  end;
  }
end;

procedure TfrmGeneratePOBonus.LoadDataPORef(aNoBukti : String ; aUnitID : Integer);
begin
  {with TPO.Create(Self) do
  begin
    try
      if LoadByNoBukti(aNoBukti,aUnitID) then
      begin
        edtNoPORef.Text := aNoBukti;
        iStatusPOID := StatusPO.ID;
        edtKodeSuplier.Text := NewSupplierMerGroup.NewSupplier.Kode;
        edtNamaSuplier.Text := NewSupplierMerGroup.NewSupplier.Nama;
      end else begin
        edtNoPORef.Text := '';
        iStatusPOID := 0;
        edtKodeSuplier.Text := '';
        edtNamaSuplier.Text := '';
      end;

      cClearGrid(Grid, False);
      LoadMerchandiseGoup;
    finally
      Free;
    end;

  end;
  }
end;

procedure TfrmGeneratePOBonus.HapusSemua1Click(Sender: TObject);
begin
  inherited;
//  cClearGrid(Grid, False);
end;

procedure TfrmGeneratePOBonus.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sSQL: String;
begin
  inherited;
  {
  if (Key = VK_F5) and (Grid.Col=_kolUOM) then
  Begin
    sSQL := 'select a.konvsat_sat_code_from as "Kode Satuan"'
         + ' from ref$konversi_satuan a'
         + ' where a.konvsat_brg_code = ' + Quot(Grid.Cells[_kolKodeBArang,Grid.Row]);


    with cLookUp('Pilih Satuan',sSQL,200,1)  do
    Begin
      Try
        sUOMnew := Strings[0];
      Finally
        Free;
      End;
    End;
      if sUOMnew <>'' then
      Begin
        Grid.Cells[_kolUOM,Grid.Row] := sUOMnew;
        Grid.SetCheckBoxState(0,Grid.Row,True);
      End Else
      Begin
        Grid.SetCheckBoxState(0,Grid.Row,False);
      End;

  End Else
  Begin
    Key := Ord(UpCase(Chr(Key)));
  End;
  }
end;

procedure TfrmGeneratePOBonus.GridCellValidate(Sender: TObject; ACol,
  ARow: Integer; var Value: String; var Valid: Boolean);
begin
  inherited;
  {if ACol = _kolUOM then
  begin
    Valid := CekUOM(Grid.Cells[_kolKodeBArang,Grid.Row], Grid.Cells[_kolUOM,Grid.Row]);
    if Valid then
    Begin
      Value := UpperCase(Value);
      Grid.SetCheckBoxState(0,Grid.Row,True);
    End Else
    Begin
      Grid.SetCheckBoxState(0,Grid.Row,False);
    End;
  end;
  }
end;

procedure TfrmGeneratePOBonus.LoadSuplierName;
var
  sSQL: String;
begin
    sSQL :='select sup_name '
          + 'from suplier '
          + ' where sup_code = ' + QuotedStr(edtKodeSuplier.Text);
   {
    with cOpenQuery(sSQL) do
    begin
      try
        edtNamasuplier.Text := FieldByName('sup_name').AsString;
      finally
        Free;
      end;
    end;
    }
end;

procedure TfrmGeneratePOBonus.edtKodeSuplierKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key=#13 then
  Begin
    Perform(WM_NEXTDLGCTL,0,0);
    Key := #0;
  End Else
  Begin
    Key := UpCase(Key);
  End;
end;

procedure TfrmGeneratePOBonus.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  inherited;
  {
  if(Key = Ord('C')) and (ssctrl in Shift) then
    GetAndRunButton('btnAdd')
  else if(Key = VK_RETURN) and (ssctrl in Shift) then
    GetAndRunButton('btnUpdate')
  else if(Key = VK_Escape) then
    btnCloseClick(sender)
    }
end;

procedure TfrmGeneratePOBonus.edtKodeSuplierClickBtn(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
  sSQL := ' select sup_code, sup_name '
          + ' from suplier ' ;

  {
  with cLookUp('Daftar Suplier',sSQL) do
  begin
    try
      if Strings[0] <> '' then
      begin
        cClearGrid(Grid,False);
        edtKodeSuplier.Text := Strings[0];
        edtNamaSuplier.Text := Strings[1];
      end;  
    finally
      Free;
    end;
  end;
  }
end;

procedure TfrmGeneratePOBonus.controlbtnDeleteClick(Sender: TObject);
begin
  inherited;
//  DoSlipPOBonus(edtNOPO.Text,masternewunit.id,FLoginFullname,MasterNewunit.Nama);
end;

procedure TfrmGeneratePOBonus.SetDataBarang(aBaris, aBarang: Integer);
begin
//  Grid.Cells[_kolKodeBarang, aBaris] := aBarang.Kode;
//  Grid.Cells[_kolNamaBarang, aBaris] := aBarang.Alias;
end;

procedure TfrmGeneratePOBonus.SetDataSubSupplier(aBaris, aSubSupplier: Integer);
begin
  {Grid.Cells[_kolLeadtime, aBaris]          := IntToStr(aSubSupplier.LeadTime);

  Grid.Cells[_kolIsSun, aBaris]             := IntToStr(aSubSupplier.IsSun);
  Grid.Cells[_kolIsMon, aBaris]             := IntToStr(aSubSupplier.IsMon);
  Grid.Cells[_kolIsTue, aBaris]             := IntToStr(aSubSupplier.IsTue);
  Grid.Cells[_kolIsWed, aBaris]             := IntToStr(aSubSupplier.IsWed);
  Grid.Cells[_kolIsThu, aBaris]             := IntToStr(aSubSupplier.IsThu);
  Grid.Cells[_kolIsFri, aBaris]             := IntToStr(aSubSupplier.IsFri);
  Grid.Cells[_kolIsSat, aBaris]             := IntToStr(aSubSupplier.IsSat);
  }
end;

procedure TfrmGeneratePOBonus.SetDataSupplier(aBaris, aSupplier: Integer);
begin
//  Grid.Cells[_kolSuplierCode, aBaris] := aSupplier.Kode;
//  Grid.Cells[_kolSuplierName, aBaris] := aSupplier.Nama;
end;

end.






