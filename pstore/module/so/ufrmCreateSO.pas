unit ufrmCreateSO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, ufraFooter5Button, Mask, Math,
  System.Actions, cxStyles, cxClasses, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, ufraFooter4Button, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel, cxGridLevel, cxGridCustomView, cxGrid, cxButtons,
  Vcl.Menus, Vcl.ActnList, Vcl.Grids, cxDBExtLookupComboBox;

type
  TThreadSOType = (tpCreateSO,tpSearchSO,tpAddPOAssgros,tpAvgSales);
  TfrmCreateSO = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    pnlTop: TPanel;
    edtNoSO: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    dtTgl: TcxDateEdit;
    pnlContent: TPanel;
    lbl3: TLabel;
    cbbMerchanGroup: TComboBox;
    actlst1: TActionList;
    actCreateSO: TAction;
    actShowHistorySO: TAction;
    pnl1: TPanel;
    lbl4: TLabel;
    actAddOthersProdSO: TAction;
    actAddPOAssgross: TAction;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    actToExcel: TAction;
    gridTemp: TStringGrid;
    sgBarangNotForSo: TStringGrid;
    cxGrid: TcxGrid;
    cxGridView: TcxGridDBTableView;
    cxColNo: TcxGridDBColumn;
    cxColStatus: TcxGridDBColumn;
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
    cxGridViewColumn22: TcxGridDBColumn;
    cxGridViewColumn23: TcxGridDBColumn;
    cxGridViewColumn24: TcxGridDBColumn;
    cxGridViewColumn25: TcxGridDBColumn;
    cxGridViewColumn26: TcxGridDBColumn;
    cxGridViewColumn27: TcxGridDBColumn;
    cxGridViewColumn28: TcxGridDBColumn;
    cxGridViewColumn29: TcxGridDBColumn;
    cxGridViewColumn30: TcxGridDBColumn;
    cxGridViewColumn31: TcxGridDBColumn;
    cxGridViewColumn32: TcxGridDBColumn;
    cxlvMaster: TcxGridLevel;
    btnShow: TcxButton;
    bStop: TcxButton;
    btnTesting: TcxButton;
    btn1: TcxButton;
    btnToExcel: TcxButton;
    btnAddFromPOAssgross: TcxButton;
    pmPMGrid: TPopupMenu;
    pmiHapusItem: TMenuItem;
    pmiHapusSemua: TMenuItem;
    N1: TMenuItem;
    pmiCheckAll: TMenuItem;
    pmiUncheckAll: TMenuItem;
    pmiCheckAnalisis: TMenuItem;
    pmiCheckPSL: TMenuItem;
    N2: TMenuItem;
    pmiValFromBiggest: TMenuItem;
    pmiValFromAnalisis: TMenuItem;
    pmiValFromPSL: TMenuItem;
    pmiValToZero: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actCreateSOExecute(Sender: TObject);
    procedure actShowHistorySOExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure strgGrid1CanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure strgGrid1ComboChange(Sender: TObject; ACol, ARow,
      AItemIndex: Integer; ASelection: String);
    procedure cbbSoForChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actAddOthersProdSOExecute(Sender: TObject);
    procedure actAddPOAssgrossExecute(Sender: TObject);
    procedure btnAddFromPOAssgrossClick(Sender: TObject);
    procedure btnShowClick(Sender: TObject);
    procedure fraFooter5Button1btnUpdateClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure cbbMerchanGroupChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure fraFooter5Button1btnDeleteClick(Sender: TObject);
    procedure StrgGridCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure CustomItem2Click(Sender: TObject);
    procedure CustomItem1Click(Sender: TObject);
    procedure StrgGridCellValidate(Sender: TObject; ACol, ARow: Integer;
      var Value: String; var Valid: Boolean);
    procedure StrgGridGetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
    procedure pnlTopDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StrgGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fraFooter5Button1btnCloseClick(Sender: TObject);
    procedure bStopClick(Sender: TObject);
    procedure btnTestingClick(Sender: TObject);
    procedure pmiHapusItemClick(Sender: TObject);
    procedure pmiHapusSemuaClick(Sender: TObject);
    procedure pmiCheckAllClick(Sender: TObject);
    procedure pmiUncheckAllClick(Sender: TObject);
    procedure pmiCheckAnalisisClick(Sender: TObject);
    procedure pmiCheckPSLClick(Sender: TObject);
    procedure pmiValFromBiggestClick(Sender: TObject);
    procedure pmiValFromAnalisisClick(Sender: TObject);
    procedure pmiValFromPSLClick(Sender: TObject);
    procedure pmiValToZeroClick(Sender: TObject);
    procedure actToExcelExecute(Sender: TObject);
  private
    isAdaData: Boolean;
    isAfterPOAssGros: Boolean;
    DataCmbStrG: TDataSet;
    ThreadType: TThreadSOType;
//    FBarang : TNewBarang;
//    FSO : TSO;
//    FSupMerchan : TNewSupplierMerGroup;
//    FBarangSuplier : TBarangSupplier;
    FIsCancel: Boolean;
    FIsInsert: Boolean;
//    FSatuan : TKonversiSatuan;
    IsManual: Boolean;
    FIsEdit : Boolean;
    FIsSudahLoadDataStock: Boolean;
    FnewId: Integer;
    FxGen: Integer;
    procedure AddNewRow;
    procedure DoSkenarioSO;
    procedure DoTestingLoadDataPLU;
    function GetLastGrQty(aBrgCode: string; aUnitId: Integer): string;
    //function GetIBQueryCekBHJ(aUnitID : Integer): TFDQuery;
    function GetQUK(aBrgCode : String; aLeadTime : Integer;aSafetyStock : Double;
        aPKMAverage : Double; aKonversiSatuanPSL : Double; aKonversiSatuanPurch :
        Double; aMinor : Double; aMaxor : Double; var aOnHand : Double; var
        aStockUOMPurchase : Double; var aOnOrder : Double; var aAvgPKM : Double):
        Double;
    function GetSQLItem4SO(aBrgCode: string=''): string;
    function GetSQLLoadDataPLUForSO(aUnitID : Integer; aMerchandizeID : Integer;
        aTgl : TDateTime): string;
    procedure LoadDataStock2Temp;
    //function GetStockQty(aBrgCode: string; aUnitId: Integer; aIsBonus: integer):
    //    Double;
    //function IsSudahPunyaHargaToko(aQueryCekBHJ : TFDQuery; aBrgCode : String):
    //    Boolean;
    procedure ShowStockCard();
    procedure ParseHeaderGrid;
    procedure SetArowInGrid(Strings:Tstrings; aBaris: integer = -1);
  public
    intHari: Integer;
    procedure DoTestingIsiQtyOrder;
    procedure DoTestingSimpan;
    procedure DoTestQtyStockDanQtyStockPurchase;
    function SetFilterDay(aToday : TDateTime): string;
    function getValueOnHand(aBrgKode: String): Double;
    procedure LoaDataToGridTemp(aDate: TDateTime; aUnitID : Integer);
    function getValueOnOrder(aKodeBarang : String): Double;
    procedure LoadDataToCbbMerchanGrup;
    procedure LoadDataToGrid;
    procedure SettingGrid;
    procedure SettingLebarKolom;
    function getBarisKosong: Integer;
    function isAdaKomaNonValid: Boolean;
    function IsAdaPLUKosong: Boolean;
    function isAdaQtyKurang: Boolean;
    function isAdaQtyLebih: Boolean;
    function isAdaQtyNol: Boolean;
    function IsAdaUOMKosong: Boolean;
    function IsBarangForSO(aKodeBarang : String): Boolean;
    function IsBaraSudahAda(aBrgCode : String ): Boolean;
    procedure LoadDataBarangNotForSO(aUnitID : Integer);
    procedure LoadDataSO(aNoSO : String; aUnitID : Integer);
  end;

var
  frmCreateSO: TfrmCreateSO;

implementation

uses
  uTSCommonDlg, ufrmHistorySO, ufrmDialogAddProductForSO, uConstanta, uAppUtils,
  {ufrmDialogStockCard, ufraStockCard, uRegionalSettingUtils,} uRetnoUnit, uFormProperty,
  ufrmSplash;


const
  _kolQTY2 = 3;
  _kolTempKodeBarang2 = 2;
  _kolTempQTY = 1;
  _kolTempKodeBrg = 0;


  _kolIsDecimal : Integer = 31;
  _kolPKMAverage : Integer = 30;
  _kolIsSat : Integer = 29;
  _kolIsFri : Integer = 28;
  _kolIsThu : Integer = 27;
  _kolIsWed : Integer = 26;
  _kolIsTue : Integer = 25;
  _kolIsMon : Integer = 24;
  _kolIsSun : Integer = 23;
  _kolIsBKP : Integer = 22;

  _kolBrgSupID        : Integer = 21;
  _kolDisc3           : Integer = 20;
  _kolDisc2           : Integer = 19;
  _kolDisc1           : Integer = 18;
  _kolHargaBeli       : Integer = 17;
  _KolLeadTime        : Integer = 16;
  _kolSuplierName     : Integer = 15;
  _kolSuplierCode     : Integer = 14;
  _kolMaxOrder        : Integer = 13;
  _kolQtyOrder        : Integer = 12;
  _kolLastGrNo        : Integer = 11;
  _kolQtyPSL          : Integer = 10;
  _kolQtyAnalisis     : Integer = 9;
  _kolQTYUOMPurchase  : Integer = 8;
  _kolQtyUOMStock     : Integer = 7;
  _kolStockMin        : Integer = 6;
  _kolPLUPurchase     : Integer = 5;
  _kolUOM             : Integer = 4;
  _kolProdukName      : Integer = 3;
  _kolPLU             : Integer = 2;
  _kolStatus          : Integer = 1;
  _KolNo              : Integer = 0;

  _fixedRow           : Integer = 1;
  _colCount           : Integer = 30;
  _rowCount           : integer = 2;
  MaxGen              : Integer = 5;

  {
  _kolQTYOrder = 11;
  _kolSatuan = 3;
  _kolKodeBarang = 1;
  _kolIsReguler = 24;
  _kolIsOrdered = 11;
  _kolIsBKP = 28;
  _kolHarga = 15;
  _kolDisc3 = 18;
  _kolDisc2 = 17;
  _kolDisc1 = 16;
  _kolBRGSUP_ID = 22;
   }
{$R *.dfm}

procedure TfrmCreateSO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
//  frmMain.DestroyMenu((Sender as TForm));
  Action := caFree;
end;

procedure TfrmCreateSO.FormDestroy(Sender: TObject);
begin
  inherited;
  frmCreateSO := nil;
end;

procedure TfrmCreateSO.FormCreate(Sender: TObject);
begin
  inherited;
  SetIDCurrencyRegionalSetting;
  lblHeader.Caption := 'CREATE SUGGESTION ORDER';
//  FSO := TSO.Create(Self);
//  FBarang := TNewBarang.Create(Self);
//  FSupMerchan := TNewSupplierMerGroup.Create(Self);
//  FBarangSuplier := TBarangSupplier.Create(Self);
//  FSatuan := TKonversiSatuan.Create(Self);
  SettingGrid;

end;

procedure TfrmCreateSO.actCreateSOExecute(Sender: TObject);
var
  ssQL: string;
  //fValQtyOrder: Double;
  aUOMUnit_ID: Integer;
  aSOUnit_ID: Integer;
  aQty: Double;
  aNewUOM: string;
  aNewUnit_ID: Integer;
  aNewBarangKode: string;
  aIsReguler: Integer;
  aIsOrdered: Integer;
  aIsBKP: Integer;
  aID: Integer;
  aHarga: Double;
  aDisc3: Double;
  aDisc2: Double;
  aDisc1: Double;
  aBarangUnit_ID: Integer;
  aBarangSupplierUnit_ID: Integer;
  aBarangSupplier_ID: Integer;
  aMerchandizeID: Integer;
  aNoBukti: string;
  aTglBukti: TDateTime;
  aMerchandizeUnit_ID: Integer;
  state : Boolean;
  i: Integer;
begin

  if dtTgl.Date = 0 then
  begin
    CommonDlg.ShowMessage('Tanggal SO Dibuat Masih Kosong');
    dtTgl.SetFocus;
    Exit;
  end;

  if Trim(edtNoSO.Text) = '' then
  begin
    CommonDlg.ShowMessage('Nomor SO Dibuat Masih Kosong');
    edtNoSO.SetFocus;
    Exit;
  end;

  if not IsManual then
  begin
//    if FSO.IsMerchandizeIniSudahAdaSO(dtTgl.Date, cGetIDfromCombo(cbbMerchanGroup), MasterNewUnit.ID, edtNoSO.Text) then
    begin
      CommonDlg.ShowMessage('SO Untuk Merchandize ' + cbbMerchanGroup.Text + ' Sudah Dibuat');
      cbbMerchanGroup.SetFocus;
      Exit;
    end;
  end;

//  IF (Trim(StrgGrid.Cells[_kolPLU,1]) = '')  then
  begin
    CommonDlg.ShowMessage('Tidak Ada Data Yang Diproses');
    Exit;
  end;

  if IsAdaPLUKosong then
    Exit;

  if IsAdaUOMKosong then
    Exit;

  if isAdaQtyNol then
    Exit;

  if isAdaQtyKurang then
    Exit;

  if isAdaQtyLebih then
    Exit;

  //if isAdaKomaNonValid then
  //  Exit;

//  if not IsValidDateKarenaEOD(Trim(edtNoSO.Text),MasterNewUnit.ID,dtTgl.Date,TTSO,FMasterIsStore) then
//    Exit;

  try
    Self.Enabled := False;
    {
    aMerchandizeUnit_ID := MasterNewUnit.ID  ;
    aMErchandizeID := cGetIDfromCombo(cbbMerchanGroup);
    aNewUnit_ID := MasterNewUnit.ID;
    aNoBukti := edtNoSO.Text ;
    aTglBukti := dtTgl.Date;
    FSO.UpdateData(
      aMerchandizeUnit_ID,
      aMErchandizeID,
      aNewUnit_ID,
      aNoBukti,
      aTglBukti,
      FLoginId,
      FLoginUnitId
    );

    FSO.SOItems.Clear;
    try
      for i := 1 to strgGrid.RowCount-1 do
      begin
        strgGrid.GetCheckBoxState(_kolStatus,i,state);
        if state then
        begin
          if strgGrid.cells[_kolQTYOrder,i] = '' then
            strgGrid.cells[_kolQTYOrder,i] := '0';

          if strgGrid.cells[_kolQTYOrder,i] <> '0' then
          begin
            //Input to SO Detil
            aBarangSupplier_ID := StrToInt(strgGrid.Cells[_kolBrgSupID,i]);
            aBarangSupplierUnit_ID := MasterNewUnit.ID;
            aBarangUnit_ID := MasterNewUnit.ID;
            aDisc1 := (strgGrid.Floats[_kolDisc1,i]);
            aDisc2 :=  (strgGrid.Floats[_kolDisc2,i]);
            aDisc3 :=  (strgGrid.Floats[_kolDisc3,i]);
            aHarga := strgGrid.Floats[_kolHargaBeli,i];
            aID := 0 ;
            aIsBKP := StrToInt(strgGrid.Cells[_kolIsBKP,i]);
            aIsOrdered := 0;
            aIsReguler := 1;
            aNewBarangKode := strgGrid.Cells[_kolPLU,i];
            aNewUnit_ID := MasterNewUnit.ID;
            aNewUOM:= strgGrid.Cells[_kolUOM, i];
            aQty :=   (strgGrid.Floats[_kolQTYOrder,i]);
            aSOUnit_ID := MasterNewUnit.ID;
            aUOMUnit_ID := MasterNewUnit.ID;

            cShowWaitWindow(StrgGrid.Cells[_kolPLU, i], Self);

            FSO.UpdateSOItems(
            aBarangSupplier_ID,
            aBarangSupplierUnit_ID,
            aBarangUnit_ID,
            aDisc1,
            aDisc2,
            aDisc3,
            aHarga,
            aID,
            aIsBKP,
            aIsOrdered,
            aIsReguler,
            aNewBarangKode,
            aNewUnit_ID,
            aNewUOM,
            aNoBukti,
            aQty,
            aSOUnit_ID,
            aUOMUnit_ID,
            FLoginId
            );
          end ;


          //if (not IsManual) and frmMain.IsTesting then
          // DoTestQtyStockDanQtyStockPurchase;
        end;
      end;
    finally
      cCloseWaitWindow;
    end;


    try
      //FIsInsert := True;
      FxGen := FxGen  + 1;
      try
        FSO.ExecuteGenerateSQL(FIsInsert);
        cCommitTrans;

        //set generator dengan old value + 1
        ssQL  := 'SET GENERATOR GEN_SO TO '+ IntToStr(FnewId);
        cExecSQL(ssQL, True, FSO.GetHeaderFlag);

        ClearByTag(Self,[0]);
        ClearAdvStringGrid(strgGrid);
        CommonDlg.ShowMessage('Data SO Berhasil dibuat');
        fraFooter5Button1.btnAdd.Enabled := False;
        fraFooter5Button1.btnDelete.Enabled := True;
      except
        on E: EIBError do
        begin
          cRollbackTrans;

          if e.IBErrorCode = 335544665 then
          begin

            if FxGen > MaxGen then
            begin
              CommonDlg.ShowError('Data SO Gagal dibuat ' + #13 +' Cek Generator !!');
              exit;
            end;

            FnewId := cGetID('GEN_SO') + 1;
            edtNoSO.Text:=StrPadLeft(IntToStr(FnewId),10,'0');
            actCreateSOExecute(Sender);

          end;
        end;

      end;

    finally
      cRollbackTrans;
    end;  }
  finally
    Self.Enabled := True;
  end;

end;

procedure TfrmCreateSO.actShowHistorySOExecute(Sender: TObject);
var
  aFormProperty : TFormProperty;
begin
  aFormProperty := TFormProperty.Create;

//  if not assigned(frmHistorySO) then
//    frmHistorySO := TfrmHistorySO.Create(Application);

  aFormProperty.FMasterIsStore   := Self.FMasterIsStore;
  aFormProperty.FLoginFullname   := Self.FLoginFullname;
  aFormProperty.FLoginRole       := Self.FLoginRole;
  aFormProperty.FLoginUsername   := Self.FLoginUsername;
  aFormProperty.FLoginId         := Self.FLoginId;
  aFormProperty.FLoginUnitId     := Self.FLoginUnitId;
  aFormProperty.FLoginIsStore    := Self.FLoginIsStore;

  aFormProperty.FFilePathReport  := Self.FFilePathReport;
  aFormProperty.FHostClient      := Self.FHostClient;
  aFormProperty.FIpClient        := Self.FIpClient;
  aFormProperty.FSelfCompanyID   := Self.MasterCompany.ID;
//  aFormProperty.FSelfUnitId      := Self.MasterNewUnit.ID;

  frmHistorySO:= TfrmHistorySO.CreateWithUser(Application, aFormProperty);
//  frmHistorySO.Show;
end;

procedure TfrmCreateSO.FormShow(Sender: TObject);
begin
  inherited;
//  if IsModeTesting then
//  begin
//    btnTesting.Visible := True
//  end else
//    btnTesting.Visible := False;

  fraFooter5Button1.btnAdd.Enabled := False;
  fraFooter5Button1.btnDelete.Enabled := True;
//  dtTgl.Date := cGetServerTime;
  edtNoSO.Clear;
  fraFooter5Button1.btnDelete.SetFocus;
  LoadDataToCbbMerchanGrup;

  FIsSudahLoadDataStock := False;

  //set prosedur untuk alighment dan format grid ya, ketentuannya dibwh ini.
  {  if ACol in [_kolQtyPSL, _kolQtyAnalisis, _KolLeadTime, _kolMaxOrder,
        _kolStockMin, _kolHargaBeli, _kolPKMAverage, _kolDisc3, _kolDisc2,
        _kolDisc1, _kolQtyOrder, _kolQTYUOMPurchase, _kolQtyUOMStock,
        _kolLastGrNo] then
    HAlign := taRightJustify
  else
    HAlign := taLeftJustify;
}
end;

procedure TfrmCreateSO.strgGrid1CanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
//var state: Boolean;
begin
  inherited;
  if(ACol in[0,8,12])then
  begin
    CanEdit:= True;
  end
  else
    CanEdit:=False;

end;

procedure TfrmCreateSO.strgGrid1ComboChange(Sender: TObject; ACol, ARow,
  AItemIndex: Integer; ASelection: String);
begin
  inherited;
  {
  with strgGrid do
  begin
    DataCmbStrG.RecNo:= AItemIndex + 1;
    cells[13,ARow] := DataCmbStrG.fieldbyname('SUP_NAME').AsString;
    cells[14,ARow] := IntToStr(DataCmbStrG.fieldbyname('SUPMG_LEAD_TIME').AsInteger);
    cells[15,ARow] := FloatToStr(DataCmbStrG.fieldbyname('BRGSUP_BUY_PRICE').AsFloat);
    strgGrid.Alignments[15,ARow]:= taRightJustify;
    cells[16,ARow] := FloatToStr(DataCmbStrG.fieldbyname('BRGSUP_DISC1').AsFloat);
    strgGrid.Alignments[16,ARow]:= taRightJustify;
    cells[17,ARow] := FloatToStr(DataCmbStrG.fieldbyname('BRGSUP_DISC2').AsFloat);
    strgGrid.Alignments[17,ARow]:= taRightJustify;
    cells[18,ARow] := FloatToStr(DataCmbStrG.fieldbyname('BRGSUP_DISC3').AsFloat);
    strgGrid.Alignments[18,ARow]:= taRightJustify;
    cells[22,ARow] := IntToStr(DataCmbStrG.fieldbyname('BRGSUP_ID').AsInteger);
  end;
  }
end;

procedure TfrmCreateSO.ShowStockCard;
begin
{  if not assigned(frmDialogStockCard) then
    frmDialogStockCard := TfrmDialogStockCard.Create(Application);
  frmDialogStockCard.ShowModal;

  frmDialogStockCard.Free;

  try
    if assigned(fraStockCard) then
      fraStockCard.Parent := nil;
  except
  end;

  if not assigned(fraStockCard) then
    fraStockCard := TfraStockCard.Create(Application);
  fraStockCard.FormMode := fmSO;

  fraFooter5Button1.btnClose.Cancel:= False;
  fraStockCard.Parent := pnlBody;
  fraStockCard.Align := alBottom;
  fraStockCard.ProductCode := strgGrid.cells[21,strgGrid.Row];
  fraStockCard.ShowStockCard(strgGrid.cells[21,strgGrid.Row]);
  //CloseLoading;
}  
end;

procedure TfrmCreateSO.cbbSoForChange(Sender: TObject);
begin
  inherited;
  ThreadType:= tpAvgSales;
  if not assigned(frmSplash) then
    frmSplash := TfrmSplash.Create(Application);
  frmSplash.Show;
//  frmMain.Enabled:= False;
  TThreadSO.Create(False);
end;

procedure TfrmCreateSO.FormActivate(Sender: TObject);
begin
  inherited;
  frmCreateSO.Caption := 'CREATE SUGGESTION ORDER';
//  frmMain.CreateMenu((Sender as TForm));
end;

function TfrmCreateSO.getBarisKosong: Integer;
var
  i: Integer;
begin
  Result := 0;
  {for i := 0 to strgGrid.RowCount - 1  do
  begin
    if strgGrid.Cells[2, i] = '' then
    begin
      Result := i;
      Exit;
    end;
  end;

  if (Result = 0) then
  begin
    strgGrid.AddRow;
    Result := strgGrid.RowCount - 1;
  end; }
end;


procedure TfrmCreateSO.actAddOthersProdSOExecute(Sender: TObject);
var
  aSS: TStrings;

  sSQL: string;
begin
 inherited;

 LoadDataStock2Temp;

    sSQL := GetSQLItem4SO;
    {
    with cLookUp('Daftar Barang',sSQL, 50, 1, False ) do
    begin
      try
        if Strings[0] <> '' then
          IsManual := True;

        if Strings[0] = '' then
        begin
          Exit;
        end
        else
        begin

          aSS := TStringList.Create;
          try
            aSS.Append(Strings[0]);
            aSS.Append(Strings[1]);
            aSS.Append(Strings[2]);
            aSS.Append(Strings[3]);
            aSS.Append(Strings[4]);
            aSS.Append(Strings[5]);
            SetArowInGrid(aSS);
          finally
            aSS.Free;
          end;

        end;
      finally
        Free;
      end;


    end;
    }
end;

procedure TfrmCreateSO.actAddPOAssgrossExecute(Sender: TObject);
begin
  inherited;
  if isAfterPOAssGros then
    Exit;
  if cbbMerchanGroup.ItemIndex=0 then
  begin
    CommonDlg.ShowMessage(1,'Information','Please select merchandise group first.', mtInformation);
    cbbMerchanGroup.SetFocus;
    Exit;
  end;
  ThreadType:= tpAddPOAssgros;
  if not assigned(frmSplash) then
    frmSplash := TfrmSplash.Create(Application);
  frmSplash.Show;
//  frmMain.Enabled:= False;
  TThreadSO.Create(False);
end;

procedure TfrmCreateSO.AddNewRow;
begin
  if getBarisKosong = 0 then
  begin
//    LoadDataStock2Temp;
//    StrgGrid.AddRow;
//    StrgGrid.AddCheckBox(_kolStatus,StrgGrid.RowCount-1,True,True);
//    StrgGrid.Row := getBarisKosong;
  end;
end;

procedure TfrmCreateSO.btnAddFromPOAssgrossClick(Sender: TObject);
begin
  inherited;
  actAddPOAssgrossExecute(Self);
end;

procedure TfrmCreateSO.btnShowClick(Sender: TObject);
var
  ITickCountAkhir: Integer;
  ITickCountAwal: Integer;
begin
  inherited;
  FIsCancel := False;
  if cbbMerchanGroup.Text = '' then
  begin
    CommonDlg.ShowMessage('Merchandise Kosong');
    cbbMerchanGroup.SetFocus;
    Exit;
  end;



//  frmMain.DisableEnableAllMainMenu(False);
  btnShow.Enabled:=False;
  ITickCountAwal := GetTickCount;
  try
    cShowWaitWindow('Load Data SO', Self);
    IsManual := False;
//    LoadDataBarangNotForSO(MasterNewUnit.ID);
//    LoaDataToGridTemp(dtTgl.Date,MasterNewUnit.ID);

    LoadDataToGrid;
  finally
    cCloseWaitWindow;
    btnShow.Enabled:=True;
    ITickCountAkhir := GetTickCount;
    Edit1.Text := FloatToStr((ITickCountAkhir - ITickCountAwal) / 1000);
  end;
end;

procedure TfrmCreateSO.fraFooter5Button1btnUpdateClick(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
  sSQL := 'select so_no as NoBukti,so_date as Tanggal, b.merchan_name as Merchandize'
          + ' from so a,REF$MERCHANDISE b'
          + ' where a.so_merchangrup_id = b.merchan_id'
          + ' and a.SO_UNT_ID = ' + IntToStr(MasterNewUnit);
  {with cLookUp('Daftar SO', sSQL,200,1,True) do
  begin
    try
      if Strings[0] = '' then
        Exit;

      LoadDataSO(Strings[0], MasterNewUnit.ID);

    finally
      Free;
    end;
  end;
   }
end;

procedure TfrmCreateSO.FormDeactivate(Sender: TObject);
begin
  inherited;
//
end;

procedure TfrmCreateSO.ParseHeaderGrid;
begin
  {with strgGrid do
  begin
    Clear;
    Cells[_KolNo, 0]              := 'NO';
    Cells[_kolStatus, 0]          := '[V]';
    Cells[_kolPLU, 0]             := 'PLU';
    Cells[_kolProdukName, 0]      := 'NAMA';
    Cells[_kolUOM, 0]             := 'UOM';
    Cells[_kolPLUPurchase, 0]     := 'PLU BELI';
    Cells[_kolStockMin, 0]        := 'MINOR';
    Cells[_kolQtyUOMStock, 0]     := 'QTY UOM STOCK';
    Cells[_kolQTYUOMPurchase, 0]  := 'QTY UOM PURC';
    Cells[_kolQtyPSL, 0]          := 'QTY PSL';
    Cells[_kolQtyAnalisis, 0]     := 'QTY Analisis';
    Cells[_kolLastGrNo, 0]        := 'LAST GR QTY';
    Cells[_kolQtyOrder, 0]        := 'ORDER';
    Cells[_kolMaxOrder, 0]        := 'MAXOR';
    Cells[_kolSuplierCode, 0]     := 'SUP.CODE';
    Cells[_kolSuplierName, 0]     := 'SUP.NAME';
    Cells[_KolLeadTime, 0]        := 'LT';
    Cells[_kolHargaBeli, 0]       := 'PRICE';
    Cells[_kolDisc1, 0]           := 'DISC1(%)';
    Cells[_kolDisc2, 0]           := 'DISC2(%)';
    Cells[_kolDisc3, 0]           := 'DISC3(Rp)';
    Cells[_kolBrgSupID, 0]        := 'BRGSUP_ID';
    Cells[_kolIsBKP, 0]           := 'IS BKP';
    Cells[_kolIsSun, 0]           := 'IS SUN';
    Cells[_kolIsMon, 0]           := 'IS MON';
    Cells[_kolIsTue, 0]           := 'IS_TUE';
    Cells[_kolIsWed, 0]           := 'IS_WED';
    Cells[_kolIsThu, 0]           := 'IS_THU';
    Cells[_kolIsFri, 0]           := 'IS_FRI';
    Cells[_kolIsSat, 0]           := 'IS_SAT';
    Cells[_kolPKMAverage, 0]      := 'PKM AVERAGE';
    Cells[_kolIsDecimal, 0]       := 'ISDEC';

    RowCount  := _rowCount;
    FixedRows := _fixedRow;
    ColCount  := _colCount;
    AutoSize  := True;

  end;  }
end;

procedure TfrmCreateSO.cbbMerchanGroupChange(Sender: TObject);
begin
  inherited;
 // ParseHeaderGrid;
//   ClearAdvStringGrid(strgGrid)
end;

function TfrmCreateSO.SetFilterDay(aToday : TDateTime): string;
var
  iToday: Integer;
begin
  Result := '';
  iToday := DayOfWeek(aToday);

  if iToday = 1 then
    Result := ' and a.SUPMG_IS_SUN = 1 '
  else if iToday = 2 then
    Result := ' and a.SUPMG_IS_MON = 1 '
  else if iToday = 3 then
    Result := ' and a.SUPMG_IS_TUE = 1 '
  else if iToday = 4 then
    Result := ' and a.SUPMG_IS_WED = 1 '
  else if iToday = 5 then
    Result := ' and a.SUPMG_IS_THU = 1 '
  else if iToday = 6 then
    Result := ' and a.SUPMG_IS_FRI = 1 '
  else if iToday = 7 then
    Result := ' and a.SUPMG_IS_SAT = 1 ';
end;

function TfrmCreateSO.getValueOnHand(aBrgKode: String): Double;
var
  i: Integer;
begin
  Result := 0;
  for i := 1 to gridTemp.RowCount - 1 do
  begin
    if Trim(gridTemp.Cells[_koltempKodeBrg,i]) = aBrgKode then
    begin
//      Result := gridTemp.Floats[_kolTempQTY,i];
    end;
  end;
end;

procedure TfrmCreateSO.LoaDataToGridTemp(aDate: TDateTime; aUnitID : Integer);
var
  i: Integer;
  sSQL: string;
begin
  {
  cClearGrid(gridTemp, False);
  sSQL := 'select a.KODE_BARANG,SUM(a.QTY) as Qty' // ini sdh UOM Stock
          + ' from SP_MUTASI_BARANG(' + QuotD(StartOfTheYear(aDate)) + ',' + QuotD(aDate) + ',' + IntToStr(aUnitID) + ') a'
          + ' , barang b where a.KODE_BARANG=B.BRG_CODE  and a.IS_BONUS_FOR_BONUS = 0  AND BRG_MERCHAN_ID = ' + IntToStr(cGetIDfromCombo(cbbMerchanGroup))
          + ' group by KODE_BARANG';

  with cOpenQuery(sSQL) do
  begin
    try
     // cShowWaitWindow('Load Data Stock Dan PO On Order', Self);
      i := 0;
      while not Eof do
      begin
        if FIsCancel then
          Exit;

        Inc(i);
        if (i mod 10 = 0) then
        begin
         // cShowWaitWindow(FieldByName('KODE_BARANG').AsString, Self);
          Application.ProcessMessages;
        end;

        gridtemp.Cells[_kolTempKodeBrg,i] := FieldByName('KODE_BARANG').AsString;
        gridTemp.Cells[_kolTempQTY, i]    := FieldByName('QTY').AsString;

        gridTemp.AddRow;
        Next;
      end;
    finally
      Free;
    //  cCloseWaitWindow;
    end;
  end;

  sSQL := 'select BRG_CODE, SUM(QTY) as Qty from ' // ini dalam UOM Beli
          + ' SP_HITUNG_ORDER_PO(' + QuotD(aDate) + ',' + IntToStr(aUnitID)+ ')'
          + ' group by BRG_CODE' ;
  with cOpenQuery(sSQL) do
  begin
    try
      while not Eof do
      begin
        if FIsCancel then
          Exit;

        Inc(i);
        if (i mod 10 = 0) then
          cShowWaitWindow(FieldByName('BRG_CODE').AsString, Self);

        if (i mod 100 = 0) then
          Application.ProcessMessages;

        gridtemp.Cells[_kolTempKodeBarang2,i] := FieldByName('BRG_CODE').AsString;
        gridTemp.Cells[_kolQTY2, i] := FieldByName('QTY').AsString;

        gridTemp.AddRow;

        Next;
      end;
    finally
     // cCloseWaitWindow;
      Free;
    end;
  end;
  }
end;

function TfrmCreateSO.getValueOnOrder(aKodeBarang : String): Double;
var
  i : Integer;
begin
  Result := 0;
  for i := 1 to gridTemp.RowCount - 1 do
  begin
    if Trim(gridTemp.Cells[_kolTempKodeBarang2,i]) = aKodeBarang then
    begin
//      Result := gridTemp.Floats[_kolQTY2,i];
      Exit;
    end;
  end;
end;

procedure TfrmCreateSO.LoadDataToCbbMerchanGrup;
var
  sSQL: string;
begin
 sSQL := ' select merchan_id , merchan_name '
         + ' from ref$merchandise ';
// cQueryToComboObject(cbbMerchanGroup,sSQL);
end;

procedure TfrmCreateSO.LoadDataToGrid;
var
  dMaximalOrder: Double;
  iCounter: Integer;
//  QJumlahBHJ: TFDQuery;
  //dMaximalOrder     : Double;
  i                 : integer;
  sSQL              : string;
  dAvgPKM           : Double;
  //dPKMStandar       : Double;
  //iLeadTime,
  //iJadwalOrder,
  //iSafetyStock      : Integer;
  //dMinimalOrder     : Double;
  //dPKMToko          : Double;
  //iLevelOtorisasi   : Integer;
  //dPKMExist         : Double;
  //iN1,iUPBPlus,
  //iN2               : Integer;
  dOnOrder          : Double;
  dStockUOMPurchase,
  dQUK, dOnHand     : Double;
  dQAnalisis, dQPSL : Double;


begin
  {
  sSQL := GetSQLLoadDataPLUForSO(MasterNewUnit.ID, cGetIDfromCombo(cbbMerchanGroup), dtTgl.Date);

  with cOpenQuery(sSQL) do
  begin
    try
      iCounter := 0;
      i := 0;

      while not Eof do
      begin
        if FIsCancel then
          Exit;

        /// tampilkan tiap 100 aj
        Inc(iCounter);
        if (iCounter mod 100 = 0) then
        begin
          cShowWaitWindow('Analisa Kode Barang ' + fieldbyName('brg_code').AsString, Self);
          Application.ProcessMessages;
        end;

        if IsBaraSudahAda(FieldByName('brg_code').AsString) then
        begin
          Next;
          Continue;
        end;
        if not IsBarangForSO(fieldbyName('brg_code').AsString) then
        begin
          Next;
          Continue;
        end;


        dQUK := GetQUK(fieldbyName('brg_code').AsString,
                       fieldbyName('SUPMG_LEAD_TIME').AsInteger,
                       fieldbyName('safety_stock').AsFloat,
                       fieldbyName('BRG_PKM_AVERAGE').AsFloat,
                       fieldbyName('ScalePsl').AsFloat,
                       fieldbyName('ScaleBuy').AsFloat,
                       fieldbyName('BRGSUP_MIN_ORDER').AsFloat,
                       fieldbyName('BRGSUP_MAX_ORDER').AsFloat,
                       dOnHand,
                       dStockUOMPurchase,
                       dOnOrder,
                       dAvgPKM);

        dMaximalOrder     := FieldByName('BRGSUP_MAX_ORDER').AsFloat;
        dQPSL             := FieldByName('QtyBeli').AsFloat;// - dStockUOMPurchase - dOnOrder;
        if dQPSL > dMaximalOrder then
          dQPSL := dMaximalOrder;
        if (dQPSL - Floor(dQPSL)) >= 0.75 then
          dQPSL := Ceil(dQPSL)
        else
          dQPSL := Floor(dQPSL);
        if dQPSL < 0 then dQPSL := 0;

        dQAnalisis        := dQUK;
        if (dQPSL - dStockUOMPurchase - dOnOrder) > dQAnalisis then
          dQUK := dQPSL - dStockUOMPurchase - dOnOrder;

        if (dQUK > 0) or (dQPSL > 0) or (dQAnalisis > 0) or (not FieldByName('PSS_QTY').IsNull) then
        begin
          Inc(i);
          with strgGrid do
          begin
            Cells[_KolNo, i]           := IntToStr(i);

            AddCheckBox(_kolStatus,i,True,True);
            SetCheckBoxState(_kolStatus,i,True);

            Cells[_kolPLU, i]           := fieldbyName('brg_code').AsString;
            Cells[_kolProdukName,i]     := FieldByName('brg_alias').AsString;
            Cells[_kolUOM, i]           := FieldByName('BRGSUP_SAT_CODE_BUY').AsString;
            Cells[_kolPLUPurchase, i]   := FieldByName('BRG_CODE_PURCHASE').AsString;
            Floats[_kolStockMin, i]     := FieldByName('BRGSUP_MIN_ORDER').AsFloat;
            Floats[_kolMaxOrder, i]     := dMaximalOrder;
            Floats[_kolQtyUOMStock, i]  := dOnhand + dOnOrder;

            Cells[_kolLastGrNo,i]       := GetLastGrQty(Cells[_kolPLU, i], MasterNewUnit.ID);

            Floats[_kolQTYUOMPurchase,i]:= dStockUOMPurchase;
            Floats[_kolQtyOrder, i]     := dQUK;
            Floats[_kolQtyAnalisis, i]   := (dQAnalisis);
            Floats[_kolQtyPSL, i]        := (dQPSL);
            Cells[_kolSuplierCode,i]    := FieldByName('sup_code').AsString;
            Cells[_kolSuplierName, i]   := FieldByName('sup_name').AsString;
            Ints[_KolLeadTime, i]       := FieldByName('SUPMG_LEAD_TIME').AsInteger;
            Floats[_kolHargaBeli, i]    := FieldByName('BRGSUP_BUY_PRICE').AsFloat;
            Floats[_kolDisc1, i]        := FieldByName('brgsup_disc1').AsFloat;
            Floats[_kolDisc2,i]         := FieldByName('brgsup_disc2').AsFloat;
            Floats[_kolDisc3,i]         := FieldByName('brgsup_disc3').AsFloat;
            Cells[_kolIsBKP,i]          := FieldByName('BRGSUP_IS_BKP').AsString;
            Cells[_kolBrgSupID, i]      := fieldByName('brgsup_id').AsString;
            Cells[_kolIsSun, i]         := FieldByName('SUPMG_IS_SUN').AsString;
            Cells[_kolIsMon, i]         := FieldByName('SUPMG_IS_MON').AsString;
            Cells[_kolIsTue, i]         := FieldByName('SUPMG_IS_TUE').AsString;
            Cells[_kolIsWed, i]         := FieldByName('SUPMG_IS_WED').AsString;
            Cells[_kolIsThu, i]         := FieldByName('SUPMG_IS_THU').AsString;
            Cells[_kolIsFri, i]         := FieldByName('SUPMG_IS_FRI').AsString;
            Cells[_kolIsSat, i]         := FieldByName('SUPMG_IS_SAT').AsString;
            Floats[_kolPKMAverage, i]   := dAvgPKM;
            Cells[_kolIsDecimal, i]     := FieldByName('BRG_IS_DECIMAL').AsString;

            if not EOF then
              AddRow;
          end;
        end;
        Next;
     end;
    finally
      Free;
      cCloseWaitWindow;
      SettingLebarKolom;
      FreeAndNil(QJumlahBHJ);
    end;
    HapusBarisKosong(StrgGrid,_kolPLU);
  end;
   }
end;

procedure TfrmCreateSO.SettingGrid;
begin
//  with StrgGrid do
  begin
    //Columns[_kolQtyOrder].ReadOnly := False;
    //Columns[_kolStatus].ReadOnly := False;
  end;
  ParseHeaderGrid;
  SettingLebarKolom;
end;

procedure TfrmCreateSO.SettingLebarKolom;
begin
  {
  with StrgGrid do
  begin
    AutoSizeColumns(True, 5);
    Columns[_kolIsBKP].Width    := 0;
    Columns[_kolBrgSupID].Width := 0;
    Columns[_kolIsSun].Width    := 0;
    Columns[_kolIsMon].Width    := 0;
    Columns[_kolIsTue].Width    := 0;
    Columns[_kolIsWed].Width    := 0;
    Columns[_kolIsThu].Width    := 0;
    Columns[_kolIsFri].Width    := 0;
    Columns[_kolIsSat].Width    := 0;
  end; }
end;

procedure TfrmCreateSO.Button1Click(Sender: TObject);
begin
  inherited;
  gridTemp.Visible := not gridTemp.Visible;
  sgBarangNotForSo.Visible := gridTemp.Visible;
end;

function TfrmCreateSO.IsBarangForSO(aKodeBarang : String): Boolean;
var
  i: Integer;
begin
  Result := True;
  for i := 1 to sgBarangNotForSo.RowCount - 1 do
  begin
    if aKodeBarang = sgBarangNotForSo.Cells[1,i] then
    begin
      Result := False;
      Exit;
    end;
  end;


end;

procedure TfrmCreateSO.LoadDataBarangNotForSO(aUnitID : Integer);
var
  sSQL: string;
begin
  try
    sSQL := 'select b.BRGSUP_BRG_CODE'
            + ' from SO_BARANG_BLACKLIST a, BARANG_SUPLIER b'
            + ' where a.SOBB_BRGSUP_ID = b.BRGSUP_ID'
            + ' and a.SOBB_UNT_ID = ' + IntToStr(aUnitID)
            + ' order by brgsup_brg_code';

//    cQueryToGrid(sSQL, sgBarangNotForSo);
//    sgBarangNotForSo.AutoSizeColumns(True, 5);
  finally
  end;

end;

procedure TfrmCreateSO.Button2Click(Sender: TObject);
var
  i: Integer;
  iPKMAverage: Integer;
  SS: TStrings;
  sSQL: String;
begin
  inherited;
  sSQL := 'select * from barang';
  SS := TStringList.Create;
  {with cOpenQuery(sSQL) do
  begin
    try
      while not eof do
      begin
        i := 1;
        if (i mod 100=0) then
          Application.ProcessMessages;
        /// tampilkan tiap 100 aj
        cShowWaitWindow(Fields[0].AsString, Self);
        Randomize;
        iPKMAverage := RandomRange(1 ,50);
        sSQL := 'update barang set brg_pkm_average = ' + IntToStr(iPKMAverage) + ' where brg_code = ' + Quot(Fields[0].AsString);
        cExecSQLSelfCommit(sSQL);
        //inc(i);
        Next;
      end;



    finally
      cCloseWaitWindow;
      Free;
      SS.Free;
      cRollbackTrans;
    end;
  end; }
end;

procedure TfrmCreateSO.fraFooter5Button1btnDeleteClick(Sender: TObject);
begin
  inherited;
  FxGen     := 0;
//  FnewId          := cGetID('GEN_SO') + 1;
  edtNoSO.Text  := TAppUtils.StrPadLeft(IntToStr(FnewId),10,'0');
  fraFooter5Button1.btnAdd.Enabled    := True;
  fraFooter5Button1.btnDelete.Enabled := False;
  FIsInsert := True;

end;

procedure TfrmCreateSO.LoadDataSO(aNoSO : String; aUnitID : Integer);
var
  IdSatuan: Integer;
  iBaris: Integer;
  i: Integer;
begin
  {with TSO.Create(Self) do
  begin
    try
      cShowWaitWindow('Load Data SO', Self);
      cClearGrid(StrgGrid,False);
      if LoadByCode(aNoSO, aUnitID) then
      begin
        FIsEdit := True;
        fraFooter5Button1.btnAdd.Enabled    := not IsSudahPO;
        fraFooter5Button1.btnDelete.Enabled := not IsSudahPO;

        FIsInsert := False;
        cSetItemAtComboObject(cbbMerchanGroup,Merchandize.ID);

        edtNoSO.Text := NoBukti;
        dtTgl.Date := TglBukti;

        iBaris := 0;
        for i := 0 to SOItems.Count - 1 do
        begin


          if (i mod 100=0) then
          begin
            cShowWaitWindow('Produk : ' + IntToStr(i + 1) + ' dari ' + IntToStr(SOItems.Count), Self);
            Application.ProcessMessages;
          end;
          /// tampilkan tiap 100 aj

          Inc(iBaris);
          StrgGrid.Ints[_kolIsSat,iBaris]           := SOItems[i].BarangSupplier.NewSupplierMerGroup.IsSat;

          StrgGrid.Ints[_kolIsFri,iBaris]           := SOItems[i].BarangSupplier.NewSupplierMerGroup.IsFri;
          StrgGrid.Ints[_kolIsThu,iBaris]           := SOItems[i].BarangSupplier.NewSupplierMerGroup.IsThu;
          StrgGrid.Ints[_kolIsWed,iBaris]           := SOItems[i].BarangSupplier.NewSupplierMerGroup.IsWed;
          StrgGrid.Ints[_kolIsTue,iBaris]           := SOItems[i].BarangSupplier.NewSupplierMerGroup.IsTue;
          StrgGrid.Ints[_kolIsMon,iBaris]           := SOItems[i].BarangSupplier.NewSupplierMerGroup.IsMon;
          StrgGrid.Ints[_kolIsSun,iBaris]           := SOItems[i].BarangSupplier.NewSupplierMerGroup.IsSun;

          StrgGrid.Ints[_kolBrgSupID,iBaris]        := SOItems[i].BarangSupplier.ID;
          StrgGrid.Ints[_kolIsBKP,iBaris]           := SOItems[i].BarangSupplier.IsBKP;

          StrgGrid.Floats[_kolDisc3,iBaris]         := SOItems[i].Disc3;
          StrgGrid.Floats[_kolDisc2,iBaris]         := SOItems[i].Disc2;
          StrgGrid.Floats[_kolDisc1,iBaris]         := SOItems[i].Disc1;
          StrgGrid.Floats[_kolHargaBeli,iBaris]     := SOItems[i].Harga;

          StrgGrid.Ints[_KolLeadTime,iBaris]        := SOItems[i].BarangSupplier.NewSupplierMerGroup.LeadTime;
          StrgGrid.Cells[_kolSuplierName,iBaris]    := SOItems[i].BarangSupplier.NewSupplier.Nama;
          StrgGrid.Cells[_kolSuplierCode,iBaris]    := SOItems[i].BarangSupplier.NewSupplier.Kode;

          StrgGrid.Floats[_kolQtyOrder,iBaris]      := SOItems[i].Qty;
          StrgGrid.Cells[_kolPLUPurchase,iBaris]    := SOItems[i].NewBarang.KodePurchase;
          StrgGrid.Floats[_kolQTYUOMPurchase,iBaris]:= SOItems[i].Qty;

          StrgGrid.Cells[_kolUOM,iBaris]            := SOItems[i].NewUOM.UOM;
          StrgGrid.Cells[_kolProdukName,iBaris]     := SOItems[i].NewBarang.Nama;
          StrgGrid.Cells[_kolPLU,iBaris]            := SOItems[i].NewBarang.Kode;
          StrgGrid.Ints[_kolIsDecimal,iBaris]       := SOItems[i].NewBarang.IsDecimal;

          StrgGrid.Cells[_kolLastGrNo,iBaris]       := GetLastGrQty(StrgGrid.Cells[_kolPLU, iBaris], MasterNewUnit.ID);

          with TKonversiSatuan.Create(nil) do
          begin
            try
              IdSatuan := GetId(SOItems[i].NewBarang.Kode, SOItems[i].BarangSupplier.KodeSatuanBeli, SOItems[i].NewBarang.KodeSatuanStock.UOM);
              if  LoadByID(IdSatuan) then
              begin
                if SkalaKonversi <> 0 then
                begin
                  StrgGrid.Floats[_kolPKMAverage, iBaris] :=  SOItems[i].NewBarang.GetPKMAVG / SkalaKonversi;
                end;
              end;
            finally
              Free;
            end;
          end;


          StrgGrid.Floats[_kolMaxOrder,iBaris] := SOItems[i].BarangSupplier.MaxOrder;
          StrgGrid.Floats[_kolStockMin,iBaris] := SOItems[i].BarangSupplier.MinOrder;


          StrgGrid.AddCheckBox(_kolStatus, iBaris,True,True);
          StrgGrid.SetCheckBoxState(_kolStatus,iBaris,True);

          SOItems[i].FreeAndNilObjectProperti;

          if i < SOItems.Count - 1 then
            StrgGrid.AddRow;

          StrgGrid.Row := StrgGrid.RowCount - 1;
        end;
      end else begin
        edtNoSO.Text := '';
      end;
    finally
      Free;
      cCloseWaitWindow;
      IsiNomorGrid(StrgGrid, 0);
    end;
  end;}
end;

procedure TfrmCreateSO.StrgGridCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  inherited;
  if ACol in [_kolQtyOrder, _kolStatus, _kolPLU] then
    CanEdit := True
  else
    CanEdit := False;
end;

procedure TfrmCreateSO.CustomItem2Click(Sender: TObject);
begin
  inherited;
//  cClearGrid(StrgGrid, False);
end;

procedure TfrmCreateSO.CustomItem1Click(Sender: TObject);
begin
  inherited;
//  StrgGrid.Rows[StrgGrid.Row].Clear;
//  if StrgGrid.RowCount > 2 then
//  begin
//    StrgGrid.RemoveSelectedRows;
//    cGetServerTime
//  end;
end;

function TfrmCreateSO.isAdaKomaNonValid: Boolean;
var
  iValIsDecimal: Integer;
//  boolValidInteger : boolean;
//  iValQtyOrder: Integer;
  iCheckQtyOrder: Integer;
  i: Integer;
begin
  Result := False;
  {
  for i := 1 to StrgGrid.RowCount -1 do
  begin
    iValIsDecimal := StrToInt(StrgGrid.Cells[_kolIsDecimal,i]);
    if ((iValIsDecimal = 0) and (not TryStrToInt(StrgGrid.Cells[_kolQtyOrder,i],iCheckQtyOrder) = True)) then
    begin
      Result := True;
      CommonDlg.ShowError('Qty Order baris ke ' +  IntToStr(i) + ' tidak boleh desimal !');
      Exit;
    end;

  end; }
end;

function TfrmCreateSO.isAdaQtyKurang: Boolean;
var
//  fValQtyMin: Double;
//  fValQtyOrder: Double;
  i: Integer;
begin
  Result := False;
  {
  for i := 1 to StrgGrid.RowCount -1 do
  begin
    if (TryStrToFloat(StrgGrid.Cells[_kolQtyOrder,i],fValQtyOrder) = False) and (i<>0) then
    begin
      Result := True;
      CommonDlg.ShowError('Qty Order Baris ke : ' + IntToStr(i) + ' tidak valid !');
      Exit;
    end;

    if (not (TryStrToFloat(StrgGrid.Cells[_kolStockMin,i],fValQtyMin))) and (i<>0)  then
    begin
      Result := True;
      CommonDlg.ShowError('Qty Min Baris ke : ' + IntToStr(i) + ' tidak valid !');
      Exit;
    end;


    TryStrToFloat(StrgGrid.Cells[_kolStockMin,i],fValQtyMin);
    if (fValQtyOrder < fValQtyMin) and (i <>0) then
    begin
      Result := True;
      CommonDlg.ShowError('Qty Order baris ke ' +  IntToStr(i) + ' tidak boleh < Qty Min !');
      Exit;
    end;

  end; }
end;

function TfrmCreateSO.isAdaQtyLebih: Boolean;
var
  fValQtyMax: Double;
  fValQtyOrder: Double;
  i: Integer;
begin
  Result := False;
  {for i := 1 to StrgGrid.RowCount -1 do
  begin
    fValQtyOrder := StrgGrid.Floats[_kolQtyOrder,i];
    fValQtyMax   := StrgGrid.Floats[_kolMaxOrder,i];
    if (fValQtyOrder > fValQtyMax) and (i<>0) then
    begin
      Result := True;
      CommonDlg.ShowError('Qty Order baris ke ' +  IntToStr(i) + ' tidak boleh > Qty Max !');
      Exit;
    end;
  end;
   }
end;

function TfrmCreateSO.isAdaQtyNol: Boolean;
var
  IsChecked: Boolean;
  i: Integer;
begin
  {Result := False;
  for i := 1 to StrgGrid.RowCount -1 do
  begin
    StrgGrid.GetCheckBoxState(_kolStatus,i,IsChecked);          //dulunya sgBarangNotForSo
    if not IsChecked then
      Continue;

    if ((StrgGrid.Cells[_kolQtyOrder,i]) = '') then
    begin
      Result := True;
      CommonDlg.ShowError('Qty Order Baris ke : ' + IntToStr(i) + ' belum diisi !');
      Exit;
    end

    else if ((StrgGrid.Floats[_kolQtyOrder,i]) = 0) then
    begin
      Result := True;
      CommonDlg.ShowError('Qty Order Baris ke : ' + IntToStr(i) + ' masih nol !');
      Exit;
    end;

  end;}
end;

function TfrmCreateSO.IsAdaUOMKosong: Boolean;
var
  i: Integer;
begin
  Result := False;
  {for i := 1 to StrgGrid.RowCount - 1 do
  begin
    if (StrgGrid.Cells[_kolUOM,i] = '') and (i <> 0) then
    begin
      Result := True;
      CommonDlg.ShowError('UOM Baris ke : ' + IntToStr(i) + ' belum diisi !');
      Exit;
    end;
  end;}
end;

procedure TfrmCreateSO.StrgGridCellValidate(Sender: TObject; ACol,
  ARow: Integer; var Value: String; var Valid: Boolean);
var
  aSS: TStrings;
  dNilai: Double;
  iNilai: Integer;
begin
  inherited;
  {
  if ACol in [_kolQtyOrder] then
  begin
    if StrgGrid.Cells[_kolIsDecimal,ARow] = '0' then
    begin
      Valid := TryStrToInt(Value, iNilai);

      if Valid then
      Begin
        if (iNilai > StrgGrid.Floats[_kolMaxOrder,ARow]) or (iNilai < StrgGrid.Floats[_kolStockMin,ARow]) then
          Valid := False;
      end;
    end
    else
    begin
      Valid := TryStrToFloat(Value, dNilai);
      if Valid then
      Begin
        if (dNilai > StrgGrid.Floats[_kolMaxOrder,ARow]) or (dNilai < StrgGrid.Floats[_kolStockMin,ARow]) then
          Valid := False;
      end;

    end;
  end
  else if ACol in [_kolPLU] then
  begin
    if Value='' then Exit;

    if Length(Value)< igProd_Code_Length then
    begin
      Value := StrPadLeft(Value,igProd_Code_Length,'0');
    end;
    with cOpenQuery(GetSQLItem4SO(Value)) do
    begin
      try
        if not Eof then
        begin
          aSS := TStringList.Create;
          try
            aSS.Append(Fields[0].AsString);
            aSS.Append(Fields[1].AsString);
            aSS.Append(Fields[2].AsString);
            aSS.Append(Fields[3].AsString);
            aSS.Append(Fields[4].AsString);
            aSS.Append(Fields[5].AsString);
            SetArowInGrid(aSS, ARow);
          finally
            aSS.Free;
          end;
        end
        else
          Valid := False;

      finally
        Free;
      end;
    end;  

    
  end; }
end;

procedure TfrmCreateSO.StrgGridGetFloatFormat(Sender: TObject; ACol,
  ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  inherited;
  FloatFormat := '%.0n';
  if (ACol in [_kolMaxOrder,_kolStockMin,_kolQtyOrder, _kolQTYUOMPurchase, _kolQtyUOMStock]) and (ARow > 0) then
    IsFloat := True
  else
  if (ACol in [_kolHargaBeli, _kolPKMAverage, _kolDisc3, _kolDisc2, _kolDisc1]) and (ARow > 0) then
  begin
    FloatFormat := '%.2n';
    IsFloat := True;
  end
  else
    IsFloat := False;
end;

procedure TfrmCreateSO.pnlTopDblClick(Sender: TObject);
begin
  inherited;
  Button2.Visible := not Button2.Visible;
end;

procedure TfrmCreateSO.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  isChecked: Boolean;
  i: Integer;
begin
//  inherited;
  {
  if (Key = VK_F5) then
    ShowStockCard()
  else if (Key = 88) then
  begin
    for i := 1 to strgGrid.RowCount do
    begin
      strgGrid.GetCheckBoxState(_kolStatus,i,isChecked);
      if isChecked then
        strgGrid.SetCheckBoxState(_kolStatus,i,False)
      else
        strgGrid.SetCheckBoxState(_kolStatus,i,True);
    end;
  end
  else if (Key = Ord('R')) and (ssctrl in Shift) then //Delete Row
  begin
    if StrgGrid.RowCount>2 then
    begin
      StrgGrid.ClearRows(StrgGrid.Row, 1);
      StrgGrid.RemoveSelectedRows;
      isiNomorGrid(StrgGrid, 0);
    end;
  end
  else if(Key = Ord('T')) and (ssctrl in Shift) then
  begin
    AddNewRow;
    StrgGrid.Col := _kolPLU;
    StrgGrid.Row := StrgGrid.RowCount-1;
  end
  else if(Key = Ord('F')) and (ssctrl in Shift) then
    grdSearch.Execute
  else if(Key = Ord('A')) and (ssctrl in Shift) then
    btn1.Click
  else if(Key = VK_RETURN) and (ssctrl in Shift) then
    actCreateSOExecute(sender)
  else if(Key = Ord('D')) and (ssctrl in Shift) then   //History PO
    actShowHistorySOExecute(sender)
  else if (Key = Ord('E')) and (ssctrl in Shift) then  //Edit SO
    fraFooter5Button1btnUpdateClick(sender)
  else if (Key = Ord('C')) and (ssctrl in Shift) then  //New
    fraFooter5Button1btnDeleteClick(sender);

   }
end;

function TfrmCreateSO.GetLastGrQty(aBrgCode: string; aUnitId: Integer): string;
var
  sSQL  : string;
begin
//  Result := '';
  sSQL := 'select dod.DOD_QTY_ORDER_RECV, dod.DOD_DO_NO, dod.DATE_CREATE'
          + ' from do_detil dod'
          + ' where dod.DOD_BRG_CODE = '+ QuotedStr(aBrgCode)
          + ' and DOD_UNT_ID= '+ inttoStr(aUnitId)
          + ' order by dod.DATE_MODIFY, dod.DATE_CREATE desc';
   {
  with cOpenQuery(ssQL) do
  begin
    try
      if not eof then
        Result  := FloatToStr(Fields[0].AsFloat)
      else
        Result := '';
    finally
      Free;
    end;
  end;
   }
end;

function TfrmCreateSO.IsAdaPLUKosong: Boolean;
var
  i: Integer;
begin
  Result := False;
  {for i := 1 to StrgGrid.RowCount - 1 do
  begin
    if (StrgGrid.Cells[_kolPLU,i] = '') then
    begin
      Result := True;
      if (CommonDlg.Confirm('PLU Baris ke : ' + IntToStr(i) + ' belum diisi !' + #13 + 'Apakah akan dihapus ?') = mrYes) then
      Begin
        StrgGrid.SelectRows(i,1);
        strgGrid.Rows[i].Clear;
        strgGrid.RemoveSelectedRows;
      End;
      Exit;
    end;
  end; }
end;

procedure TfrmCreateSO.StrgGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  {if FIsInsert or FIsEdit then
  begin
    if Key = vk_return then
    begin
      if StrgGrid.Col = _kolPLU then
      begin
        StrgGrid.Col := _kolQtyOrder;
        StrgGrid.SelectedCells[_kolQtyOrder, StrgGrid.row ] := True;
        StrgGrid.EditMode := True;
      end;

    end
    else if key = vk_f5 then
    begin
      if StrgGrid.Col = _kolPLU then
        actAddOthersProdSOExecute(Self);
    end
    else if (key = vk_down) and (ssCtrl in Shift) then
    begin
      if (StrgGrid.Cells[_kolPLU, StrgGrid.RowCount - 1] <> '') then
        StrgGrid.AddRow;
    end
    else if (key = vk_UP) and (ssCtrl in Shift) then
    begin
      if StrgGrid.RowCount > StrgGrid.FixedRows then
      begin
        if StrgGrid.RowCount > StrgGrid.FixedRows + 1 then
        begin
          StrgGrid.RemoveRows(StrgGrid.row , 1);
        end
        else
        begin
          StrgGrid.Rows[StrgGrid.row].Clear;
        end;
      end;
    end;
  end;}

end;

procedure TfrmCreateSO.fraFooter5Button1btnCloseClick(Sender: TObject);
begin
  inherited;
  FIsCancel := True;
  fraFooter5Button1.btnCloseClick(Sender);

end;

procedure TfrmCreateSO.bStopClick(Sender: TObject);
begin
  inherited;
  FIsCancel := True;
end;

function TfrmCreateSO.GetQUK(aBrgCode : String; aLeadTime : Integer;
    aSafetyStock : Double; aPKMAverage : Double; aKonversiSatuanPSL : Double;
    aKonversiSatuanPurch : Double; aMinor : Double; aMaxor : Double; var
    aOnHand : Double; var aStockUOMPurchase : Double; var aOnOrder : Double;
    var aAvgPKM : Double): Double;
var
  dPKMStandar: Double;
  iJadwalOrder: Integer;
  dPKMToko: Double;
  iLevelOtorisasi: Integer;
  dPKMExist: Double;
  iN1: Integer;
  iUPBPlus: Integer;
  iN2: Integer;
begin
  {with TNewSupplierMerGroup.Create(self) do
  begin
    try
      aAvgPKM           := 0;

      if (aKonversiSatuanPSL <> 0) and (aKonversiSatuanPurch <> 0) then
        aAvgPKM           := aPKMAverage * aKonversiSatuanPSL / aKonversiSatuanPurch;

      iLevelOtorisasi   := 1;
      iN1               := 0;
      iN2               := 0;
      iUPBPlus          := 0;
      iJadwalOrder      := GetJadwalOrder(DayOfWeek(dtTgl.Date));
    finally
      Free;
    end;
  end;
   }
  if aLeadTime > iJadwalOrder then
    dPKMStandar     := (aLeadTime + aSafetyStock) * aAvgPKM + aMinor
  else
    dPKMStandar     := (iJadwalOrder + aSafetyStock) * aAvgPKM + aMinor;
  
  dPKMToko          := dPKMStandar * iLevelOtorisasi;

  dPKMExist         := dPKMToko + iN1 + iUPBPlus + iN2;
  aOnHand           := getValueOnHand(aBrgCode);
  aOnOrder          := getValueOnOrder(aBrgCode);

  Result            := dPKMExist - aOnHand - aOnOrder;


  aStockUOMPurchase := 0;

  if (aKonversiSatuanPSL <> 0) and (aKonversiSatuanPurch <> 0) then
    aStockUOMPurchase := (aOnHand + aOnOrder) * aKonversiSatuanPSL / aKonversiSatuanPurch;

  if Result > aMaxor then
    Result := aMaxor;
  
  if (Result - Floor(Result)) >= 0.75 then
    Result := Ceil(Result)
  else
    Result := Floor(Result);

  if Result < aMinor then
    Result := 0;
end;

function TfrmCreateSO.GetSQLLoadDataPLUForSO(aUnitID : Integer; aMerchandizeID
    : Integer; aTgl : TDateTime): string;
begin
  Result :=
      'select b.BRG_CODE, b.SAT_CODE, c.BRGSUP_SAT_CODE_BUY, d.BRG_SAT_CODE_STOCK,'
    + ' a.PSS_QTY, e.KONVSAT_SCALE as ScalePsl, e1.KONVSAT_SCALE as ScaleBuy,'
    + ' a.PSS_QTY * e.KONVSAT_SCALE / e1.KONVSAT_SCALE as QtyBeli,'
    + ' d.brg_code, d.brg_alias, d.BRG_SAT_CODE_STOCK,'
    + ' d.BRG_CODE_PURCHASE, d.safety_stock, d.safety_stock,'
    + ' d.BRG_PKM_AVERAGE, d.BRG_IS_DECIMAL,'
    + ' d.BRG_PKM_AVERAGE, d.BRG_IS_DECIMAL,'
    + ' c.BRGSUP_SAT_CODE_BUY, c.BRGSUP_MIN_ORDER,'
    + ' c.BRGSUP_MAX_ORDER, c.BRGSUP_BUY_PRICE,'
    + ' c.brgsup_disc1, c.brgsup_disc2, c.brgsup_disc3,'
    + ' c.brgsup_id, c.BRGSUP_IS_BKP, c.BRGSUP_IS_PRIMARY,'
    + ' j.sup_name, j.sup_code,'
    + ' k.SUPMG_LEAD_TIME, k.SUPMG_LEAD_TIME, k.SUPMG_IS_SUN,'
    + ' k.SUPMG_IS_MON, k.SUPMG_IS_TUE, k.SUPMG_IS_WED,'
    + ' k.SUPMG_IS_THU, k.SUPMG_IS_FRI, k.SUPMG_IS_SAT'
    + ' from TPSSTORE a'
    + ' inner join TPURCHASESUGESTIONITEM b on a.PS_ID = b.PS_ID'
    + ' and a.PSI_ID = b.PSI_ID'
    + ' and a.UNT_ID = b.UNT_ID'
    + ' and a.PSS_UNT_ID = '+ IntToStr(aUnitID)
    + ' inner join tPurchaseSugestion m on (m.ps_id = b.ps_id'
    + ' and m.unt_id = b.unt_id'
    + ' and EXTRACTDATE(m.ps_tgljatuhtempo) = '+ TAppUtils.QuotD(aTgl)
    + ' )'
    + ' inner join barang d on b.BRG_CODE = d.BRG_CODE'
    + ' inner join ref$konversi_satuan e  on d.BRG_CODE = e.KONVSAT_BRG_CODE'
    + ' and e.KONVSAT_SAT_CODE_FROM = b.SAT_CODE'
    + ' and d.BRG_SAT_CODE_STOCK = e.KONVSAT_SAT_CODE_TO'
    + ' left join barang_suplier c on b.BRG_CODE = c.BRGSUP_BRG_CODE'
    + ' left join ref$konversi_satuan e1 on d.BRG_CODE = e1.KONVSAT_BRG_CODE'
    + ' and e1.KONVSAT_SAT_CODE_FROM = c.BRGSUP_SAT_CODE_BUY'
    + ' and d.BRG_SAT_CODE_STOCK = e1.KONVSAT_SAT_CODE_TO'
    + ' left join suplier j on (j.sup_code = c.BRGSUP_SUP_CODE)'
    + ' left join suplier_merchan_grup k on (k.supmg_sub_code = c.brgsup_supmg_sub_code)'
    + ' where d.brg_merchan_id = '+ IntToStr(aMerchandizeID)
    + ' and d.BRG_IS_STOCK = 1'
    + ' and d.BRG_IS_ACTIVE = 1'
    + ' and d.BRG_TPBRG_ID <> '+  Trim(getGlobalVar('TIPE_BARANG_JB'))
    + ' order by d.brg_code asc, c.BRGSUP_IS_PRIMARY desc'


end;

function TfrmCreateSO.IsBaraSudahAda(aBrgCode : String ): Boolean;
var
  i: Integer;
begin
  Result := False;
  {for i := 1 to StrgGrid.RowCount - 1 do
  begin
    if (StrgGrid.Cells[_kolPLU, i] = aBrgCode) Then
    begin
      Result := True;
      Exit;
    end;
  end; }
end;

procedure TfrmCreateSO.btnTestingClick(Sender: TObject);
var
  i: Integer;
  iJmlItem: Integer;
begin
  inherited;
  Randomize;
  iJmlItem := RandomRange(1,20);
  for i := 1 to iJmlItem do
    DoSkenarioSO;
end;

procedure TfrmCreateSO.DoSkenarioSO;
begin
//  frmMain.IsTesting := True;
  try
    DoTestingLoadDataPLU;
    DoTestingIsiQtyOrder;
    DoTestQtyStockDanQtyStockPurchase;
    DoTestingSimpan;


  finally
//    frmMain.IsTesting := False;
  end;
end;

procedure TfrmCreateSO.DoTestingIsiQtyOrder;
var
  i: Integer;
begin
  Randomize;
//  for i := 1 to StrgGrid.RowCount - 1 do
  begin
//    if Trim(StrgGrid.Cells[_kolPLU,i]) <> '' then
//      StrgGrid.Ints[_kolQtyOrder,i] := RandomRange(Floor(StrgGrid.Floats[_kolStockMin,i]), Floor(StrgGrid.Floats[_kolMaxOrder,i]))
  end;
end;

procedure TfrmCreateSO.DoTestingLoadDataPLU;
var
  iJmlItem: Integer;
  i: Integer;
begin
  Randomize;
  iJmlItem := RandomRange(1,15);
  for i := 1 to iJmlItem do
    actAddOthersProdSOExecute(nil);
end;

procedure TfrmCreateSO.DoTestingSimpan;
begin
  fraFooter5Button1btnDeleteClick(nil);
  actCreateSOExecute(nil);
end;

procedure TfrmCreateSO.DoTestQtyStockDanQtyStockPurchase;
var
  sStatus: string;
  dTotal: Double;
  dQtyPOOrder: Double;
  dQtyStock: Double;
  i: Integer;
begin
  {for i := StrgGrid.RowCount - 1 downto 1 do
  begin
    if Trim(StrgGrid.Cells[_kolPLU,i]) = '' then
      Continue;

    dQtyStock   := DoTestingGetQtyStock(StrgGrid.Cells[_KolPLU,i],StartOfTheYear(dtTgl.Date), dtTgl.Date, MasterNewUnit.ID);
    dQtyPOOrder := DoTestingGetQtyPOOrder(StrgGrid.Cells[_KolPLU,i], MasterNewUnit.ID, dtTgl.Date);
    dTotal      := dQtyPOOrder + dQtyStock;

    sStatus := 'NOK';
    if StrgGrid.Columns[_kolQtyUOMStock].Floats[i] = dTotal then
      sStatus := 'OK';
    DoTestingSaveLog(edtNoSO.Text + ' ' + StrgGrid.Columns[_kolPLU].Rows[i], 'QTY STOCK', StrgGrid.Columns[_kolQtyUOMStock].Rows[i], FloatToStr(dTotal), sStatus, 'SO');

    dTotal      := dTotal / GetQtyConv(StrgGrid.Cells[_KolUOM,i],StrgGrid.Cells[_KolPLU,i]);
    sStatus := 'NOK';
    if StrgGrid.Columns[_kolQtyUOMStock].Floats[i] = dTotal then
      sStatus := 'OK';
    DoTestingSaveLog(edtNoSO.Text + ' ' + StrgGrid.Columns[_kolPLU].Rows[i], 'QTY STOCK ON PURCHASE', StrgGrid.Columns[_kolQTYUOMPurchase].Rows[i], FloatToStr(dTotal), sStatus, 'SO');


  end; }
end;

function TfrmCreateSO.GetSQLItem4SO(aBrgCode: string=''): string;
var
  sSQL: string;
begin

  sSQL := 'select '+
          '  br.brg_code as "Kode Barang", '+
          '  br.brg_alias as "Alias Barang", '+
          '  sp.sup_code as "Kode Suplier", '+
          '  sp.sup_name as "Nama Suplier", '+
          '  smg.supmg_sub_code as " Kode Suplier MerchanGroup", '+
          '  bs.brgsup_id as "Id Barang Suplier", '+
          '  br.BRG_PKM_AVERAGE '+
          'from '+
          '  barang br '+
  
          '  left join barang_suplier bs on bs.brgsup_brg_code=br.brg_code '+
          '  left join suplier sp on sp.sup_code=bs.BRGSUP_SUP_CODE '+
          '  left join suplier_merchan_grup smg on smg.supmg_sub_code=bs.brgsup_supmg_sub_code '+
          'where '+
          '  br.BRG_IS_ACTIVE = 1 '+
//          '  and br.BRG_MERCHAN_ID = ' + IntToStr(cGetIDfromCombo(cbbMerchanGroup)) + ' '+
          '  and BR.BRG_TPBRG_ID <> '+  Trim(getGlobalVar('TIPE_BARANG_JB'));
  if aBrgCode <> '' then
    sSQL := sSQL + ' and br.BRG_CODE = '+ QuotedStr(aBrgCode);

  result := sSQL;

end;

procedure TfrmCreateSO.LoadDataStock2Temp;
begin
  FIsCancel := False;
  try
    cShowWaitWindow('Load Data',Self);
    if not FIsSudahLoadDataStock then
    begin
      LoaDataToGridTemp(dtTgl.Date, MasterNewUnit);
      FIsSudahLoadDataStock := True;
    end;
  finally
    cCloseWaitWindow;
  end;
end;

procedure TfrmCreateSO.pmiHapusItemClick(Sender: TObject);
begin
  inherited;
//  StrgGrid.Rows[StrgGrid.Row].Clear;
//  if StrgGrid.RowCount > 2 then
//  begin
//    StrgGrid.RemoveSelectedRows;
//    cGetServerTime
//  end;

end;

procedure TfrmCreateSO.pmiHapusSemuaClick(Sender: TObject);
begin
  inherited;
//  cClearGrid(StrgGrid, False);

end;

procedure TfrmCreateSO.pmiCheckAllClick(Sender: TObject);
var i :Integer;
begin
  inherited;
//  for i:= StrgGrid.FixedRows+StrgGrid.FixedFooters to StrgGrid.RowCount - StrgGrid.FixedRows - StrgGrid.FixedFooters do
//  begin
//    StrgGrid.SetCheckBoxState(_kolStatus,i,True);
//  end;
end;

procedure TfrmCreateSO.pmiUncheckAllClick(Sender: TObject);
var i :Integer;
begin
  inherited;
//  for i:= StrgGrid.FixedRows+StrgGrid.FixedFooters to StrgGrid.RowCount - StrgGrid.FixedRows - StrgGrid.FixedFooters do
//  begin
//    StrgGrid.SetCheckBoxState(_kolStatus,i,False);
//  end;
end;

procedure TfrmCreateSO.pmiCheckAnalisisClick(Sender: TObject);
var i :Integer;
begin
  inherited;
//  for i:= StrgGrid.FixedRows+StrgGrid.FixedFooters to StrgGrid.RowCount - StrgGrid.FixedRows - StrgGrid.FixedFooters do
//  begin
//    if StrgGrid.Floats[_kolQtyAnalisis,i] > 0 then
//      StrgGrid.SetCheckBoxState(_kolStatus,i,True)
//    else
//      StrgGrid.SetCheckBoxState(_kolStatus,i,False);
//  end;
end;

procedure TfrmCreateSO.pmiCheckPSLClick(Sender: TObject);
var i :Integer;
begin
  inherited;
//  for i:= StrgGrid.FixedRows+StrgGrid.FixedFooters to StrgGrid.RowCount - StrgGrid.FixedRows - StrgGrid.FixedFooters do
//  begin
//    if StrgGrid.Floats[_kolQtyPSL,i] > 0 then
//      StrgGrid.SetCheckBoxState(_kolStatus,i,True)
//    else
//      StrgGrid.SetCheckBoxState(_kolStatus,i,False);
//  end;
end;

procedure TfrmCreateSO.pmiValFromBiggestClick(Sender: TObject);
var i :Integer;
begin
  inherited;
//  for i:= StrgGrid.FixedRows+StrgGrid.FixedFooters to StrgGrid.RowCount - StrgGrid.FixedRows - StrgGrid.FixedFooters do
//  begin
//    if StrgGrid.Floats[_kolQtyPSL,i] > StrgGrid.Floats[_kolQtyAnalisis,i] then
//      StrgGrid.Floats[_kolQtyOrder,i] := StrgGrid.Floats[_kolQtyPSL,i]
//    else
//      StrgGrid.Floats[_kolQtyOrder,i] := StrgGrid.Floats[_kolQtyAnalisis,i];
//  end;
end;

procedure TfrmCreateSO.pmiValFromAnalisisClick(Sender: TObject);
var i :Integer;
begin
  inherited;
//  for i:= StrgGrid.FixedRows+StrgGrid.FixedFooters to StrgGrid.RowCount - StrgGrid.FixedRows - StrgGrid.FixedFooters do
//  begin
//    if StrgGrid.Floats[_kolQtyAnalisis,i] > 0 then
//      if StrgGrid.Floats[_kolQtyAnalisis,i] > StrgGrid.Floats[_kolStockMin,i] then
//        StrgGrid.Floats[_kolQtyOrder,i] := StrgGrid.Floats[_kolQtyAnalisis,i]
//  end;
end;

procedure TfrmCreateSO.pmiValFromPSLClick(Sender: TObject);
var i :Integer;
begin
  inherited;
//  for i:= StrgGrid.FixedRows+StrgGrid.FixedFooters to StrgGrid.RowCount - StrgGrid.FixedRows - StrgGrid.FixedFooters do
//  begin
//    if StrgGrid.Floats[_kolQtyPSL,i] > 0 then
//      if StrgGrid.Floats[_kolQtyPSL,i] > StrgGrid.Floats[_kolStockMin,i] then
//        StrgGrid.Floats[_kolQtyOrder,i] := StrgGrid.Floats[_kolQtyPSL,i]
//  end;
end;

procedure TfrmCreateSO.pmiValToZeroClick(Sender: TObject);
var i :Integer;
begin
  inherited;
//  for i:= StrgGrid.FixedRows+StrgGrid.FixedFooters to StrgGrid.RowCount - StrgGrid.FixedRows - StrgGrid.FixedFooters do
//  begin
//        StrgGrid.Floats[_kolQtyOrder,i] := 0;
//  end;
end;

procedure TfrmCreateSO.SetArowInGrid(Strings:Tstrings; aBaris: integer = -1);
var
  aBarangSatuanBeli : string;
  IdSatuan          : Integer;
  Kode              : string;
  dStockUOMPurchase : Double;
  iOnHand           : Double;
  i, iBaris         : Integer;
begin
  LoadDataStock2Temp;
  {
  for i := 1 to StrgGrid.RowCount do
  begin
    if (StrgGrid.Cells[_kolPLU, i] = Strings[0]) and
       (StrgGrid.Cells[_kolSuplierCode, i] = Strings[2]) and
       (StrgGrid.Cells[_kolProdukName,i] = Strings[1]) then
    begin
        CommonDlg.ShowError('Data ' + Strings[1] + ' Sudah Ada');
       // StrgGrid.RemoveRows(iBaris,StrgGrid.Row);
        Exit;
    end;
  end;

  if aBaris < 0 then
    iBaris  := getBarisKosong
  else
    iBaris  := aBaris;
    
  if iBaris = 0 then
  begin
     strgGrid.AddRow;
     iBaris := strgGrid.RowCount - 1;
  end;
  
  iOnHand := getValueOnHand(Trim(Strings[0])) + getValueOnOrder(Trim(Strings[0]));

  StrgGrid.AddCheckBox(_kolStatus,iBaris,True,True);
  StrgGrid.SetCheckBoxState(_kolStatus,iBaris,True);
  StrgGrid.Cells[_kolPLU, iBaris]           := Strings[0];
  StrgGrid.Cells[_kolProdukName,iBaris]     := Strings[1];
  StrgGrid.Floats[_kolQtyUOMStock, iBaris]  := iOnHand;

  StrgGrid.Cells[_kolSuplierCode,iBaris]    := Strings[2];
  StrgGrid.Cells[_kolSuplierName, iBaris]   := Strings[3];
  StrgGrid.Floats[_kolQtyOrder, iBaris]     := 0;
  
  //------------------Load Data Barang--------------------------
  
  Kode := Strings[0];
  if FBarang.LoadByKode(Kode) then
  begin
    StrgGrid.Cells[_kolPLUPurchase, iBaris] := FBarang.KodePurchase;
    StrgGrid.Ints[_kolIsDecimal,iBaris]     := FBarang.IsDecimal;
  end;
  
  //------------------ Load Data Suplier Merchan grup ---------------
  if FSupMerchan.LoadByKode(Strings[4]) then
  begin
    StrgGrid.Cells[_KolLeadTime, iBaris]  := IntToStr(FSupMerchan.LeadTime);
    StrgGrid.Cells[_kolIsSun, iBaris]     := IntToStr(FSupMerchan.IsSun);
    StrgGrid.Cells[_kolIsMon, iBaris]     := IntToStr(FSupMerchan.IsMon);
    StrgGrid.Cells[_kolIsTue, iBaris]     := IntToStr(FSupMerchan.IsTue);
    StrgGrid.Cells[_kolIsWed, iBaris]     := IntToStr(FSupMerchan.IsWed);
    StrgGrid.Cells[_kolIsThu, iBaris]     := IntToStr(FSupMerchan.IsThu);
    StrgGrid.Cells[_kolIsFri, iBaris]     := IntToStr(FSupMerchan.IsFri);
    StrgGrid.Cells[_kolIsSat, iBaris]     := IntToStr(FSupMerchan.IsSat);
  end;
  
  //------------------------Laod Data Barang Suplier -----------------------
  if FBarangSuplier.LoadByID(StrToInt(Strings[5])) then
  begin
    aBarangSatuanBeli                             := FBarangSuplier.KodeSatuanBeli;
    StrgGrid.Cells[_kolUOM, iBaris]               := aBarangSatuanBeli;
  
    StrgGrid.Floats[_kolQTYUOMPurchase, iBaris]   := iOnHand / GetQtyConv(aBarangSatuanBeli, Strings[0]);
    strgGrid.Floats[_kolHargaBeli, iBaris]        := FBarangSuplier.HargaBeli;
    StrgGrid.Cells[_kolBrgSupID, iBaris]          := IntToStr(FBarangSuplier.ID);
    StrgGrid.Floats[_kolDisc1,iBaris]             := FBarangSuplier.Disc1;
    StrgGrid.Floats[_kolDisc2,iBaris]             := FBarangSuplier.Disc2;
    StrgGrid.Floats[_kolDisc3,iBaris]             := FBarangSuplier.Disc3;
    StrgGrid.Cells[_kolIsBKP,iBaris]              := IntToStr(FBarangSuplier.IsBKP);
  end;
  
  //------------------------Load Data Satuan-----------------------------
  IdSatuan := FSatuan.GetId(Kode, aBarangSatuanBeli, FBarang.KodeSatuanStock.UOM);
  
  dStockUOMPurchase := 0;
  if FSatuan.LoadByID(IdSatuan) then
  begin
    if FSatuan.SkalaKonversi <> 0 then
    begin
      dStockUOMPurchase := iOnHand / FSatuan.SkalaKonversi;
      StrgGrid.Floats[_kolPKMAverage, iBaris] :=  FBarang.GetPKMAVG / FSatuan.SkalaKonversi;
  
    end;
  end;
  
  StrgGrid.Floats[_kolMaxOrder,iBaris] := FBarangSuplier.MaxOrder;
  StrgGrid.Floats[_kolStockMin,iBaris] := FBarangSuplier.MinOrder;
  
  StrgGrid.Floats[_kolQTYUOMPurchase,iBaris] := dStockUOMPurchase;
  StrgGrid.Cells[_kolLastGrNo,iBaris] := GetLastGrQty(Strings[0], MasterNewUnit.ID);

  IsiNomorGrid(StrgGrid, 0);
  StrgGrid.SetFocus;
  StrgGrid.Col := _kolQtyOrder;
  StrgGrid.Row := iBaris;
   }
end;

procedure TfrmCreateSO.actToExcelExecute(Sender: TObject);
begin
  inherited;
//  SaveDataGrid2Excel(StrgGrid);
end;

end.
