unit ufrmDisplayPO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, ufraFooter5Button,
	ActnList, uRetnoUnit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, System.Actions, cxCurrencyEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxStyles, cxClasses, Vcl.Menus,
  cxButtons, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  Data.DB, cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxGridCustomView, cxGrid;

type
  TModul = (mMain, mHistoryPO);

  TfrmDisplayPO = class(TfrmMaster)
    pnlTop: TPanel;
    lbl1: TLabel;
    edtPONo: TEdit;
    fraFooter5Button1: TfraFooter5Button;
    pnl1: TPanel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    dtDatePO: TcxDateEdit;
    dtDateSO: TcxDateEdit;
    edtSONo: TEdit;
    edtSuplierCode: TEdit;
    edtSuplierName: TEdit;
    edtDONo: TEdit;
    lbl2: TLabel;
    dtDateDO: TcxDateEdit;
    lbl4: TLabel;
    edtNP: TEdit;
    lbl9: TLabel;
    lbl10: TLabel;
    jvcuredtSubTotal: TcxCurrencyEdit;
    jvcuredtPPN: TcxCurrencyEdit;
    lbl13: TLabel;
    jvcuredtPPNBM: TcxCurrencyEdit;
    lbl14: TLabel;
    lbl12: TLabel;
    jvcuredtDiscount: TcxCurrencyEdit;
    jvcuredtTotalBeli: TcxCurrencyEdit;
    lbl11: TLabel;
    lbl3: TLabel;
    lbl15: TLabel;
    edtjfBonus: TcxCurrencyEdit;
    lbl16: TLabel;
    edtjfTotalColie: TcxCurrencyEdit;
    edtjfRecvBonus: TcxCurrencyEdit;
    lbl17: TLabel;
    pnl2: TPanel;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    lbl21: TLabel;
    lbl22: TLabel;
    lbl23: TLabel;
    edtProductName: TEdit;
    lbl24: TLabel;
    edtjfTotalOrder: TcxCurrencyEdit;
    edtjfDisc1: TcxCurrencyEdit;
    edtjfDisc2: TcxCurrencyEdit;
    jvcuredtNilaiDisc: TcxCurrencyEdit;
    jvcuredtTotalDisc: TcxCurrencyEdit;
    lblStatusPO: TLabel;
    actlst1: TActionList;
    actSaveGoodReceiving: TAction;
    actClearGoodReceiving: TAction;
    chkAllUnit: TCheckBox;
    btnBrowsePoNo: TcxButton;
    btnSlipNew: TcxButton;
    btnSlip: TcxButton;
    btnChekListNp: TcxButton;
    btnCetakNP: TcxButton;
    cxGrid: TcxGrid;
    cxGridView: TcxGridDBTableView;
    cxlvMaster: TcxGridLevel;
    cxGridViewColumn1: TcxGridDBColumn;
    cxGridViewColumn2: TcxGridDBColumn;
    cxGridViewColumn3: TcxGridDBColumn;
    cxGridViewColumn4: TcxGridDBColumn;
    cxGridViewColumn5: TcxGridDBColumn;
    cxGridViewColumn6: TcxGridDBColumn;
    cxGridViewColumn7: TcxGridDBColumn;
    cxGridViewColumn8: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnBrowsePoNoClick(Sender: TObject);
    procedure btnChekListNpClick(Sender: TObject);
    procedure edtPONoChange(Sender: TObject);
    procedure edtDONoKeyPress(Sender: TObject; var Key: Char);
    procedure edtPONoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridClick(Sender: TObject);
    procedure strgGridRowChanging(Sender: TObject; OldRow, NewRow: Integer;
      var Allow: Boolean);
    procedure strgGridCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure actClearGoodReceivingExecute(Sender: TObject);
    procedure btnSlipClick(Sender: TObject);
    procedure btnSlipNewClick(Sender: TObject);
    procedure strgGridGetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
  private
    FModul: TModul;
    //FValidDate: TDate;
    //FStatusPO: string;
    //FTOP: Integer;
    //FTrader: Integer;
//		FDO: TDelivery;
    FHargaDisc: Real;
//		FPO: TPO;
//		FPOBOnus: TPOBonusItems;
    procedure SetClearValue;
    procedure ClearForm;
    procedure SetModul(const Value: TModul);
  public
    procedure InsertNumber;
    procedure JumlahkanNilaiPO;
    procedure LoadDataPOBonus(aBarisGrid : Integer);
		procedure LoadDAtaToForm(aPONo : string);
    { Public declarations }
  published
    property Modul: TModul read FModul write SetModul;
  end;

var
  frmDisplayPO: TfrmDisplayPO;
  ParamList: TStringList;

implementation

uses uDMClient, uTSCommonDlg, uConstanta, ufrmSearchPO, uConn,
  VarUtils, ufrmReprintNP, //ufrmDeliveryOrder,
  uAppUtils, uFormProperty;

const
	_kolPPNBM : Integer =13;
	_kolPPN : Integer = 12;
	_kolTotalDisc : Integer = 11;

	_kolDisc3 : Integer = 10;
	_kolDisc2 : Integer = 9;
	_kolDisc1 : Integer = 8;
  _kolIsBonusForBonus : Integer = 7;
	_kolQTYRecv : Integer = 6;
  _kolQTYOrder : Integer = 5;
  _kolPrice : Integer = 4;
  _kolUOM : Integer = 3;
  _kolNamaBArang : Integer = 2;
	_kolKodeBarang : Integer = 1;
	_kolNo : Integer = 0;

{$R *.dfm}

procedure TfrmDisplayPO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
//  frmMain.DestroyMenu((Sender as TForm));
  Action := caFree;
end;

procedure TfrmDisplayPO.ClearForm;
begin
  edtSONo.Clear;
  edtSuplierCode.Clear;
  edtSuplierName.Clear;
  edtDONo.Clear;
  edtNP.Clear;
  edtProductName.Clear;
  dtDatePO.Clear;
  dtDateSO.Clear;
  dtDateDO.Clear;
  edtjfBonus.Value:=0;
  edtjfTotalColie.Value:=0;
  edtjfTotalOrder.Value:=0;
  edtjfRecvBonus.Value:=0;
  edtjfDisc1.Value:=0;
  edtjfDisc2.Value:=0;
  jvcuredtSubTotal.Value:=0;
  jvcuredtPPN.Value:=0;
  jvcuredtPPNBM.Value:=0;
  jvcuredtDiscount.Value:=0;
  jvcuredtTotalBeli.Value:=0;
  jvcuredtNilaiDisc.Value:=0;
  jvcuredtTotalDisc.Value:=0;
  FHargaDisc:=0;
  lblStatusPO.Caption:='';
  //SetHeaderGrid;
  //strgGrid.Enabled:= False;
  fraFooter5Button1.btnAdd.Enabled:= False;
end;

procedure TfrmDisplayPO.FormCreate(Sender: TObject);
begin
  inherited;
//	FPO := TPO.Create(Self);
//  FDO := TDelivery.Create(Self);
//  FPOBOnus := TPOBonusItems.Create(nil);
  dtDatePO.Date := now;
  dtDateSO.Date := now;
  dtDateDO.Date := now;
  lblHeader.Caption := 'DISPLAY PO';

  lbl24.Visible := true;
  ClearForm;
  SetIDCurrencyRegionalSetting;
end;

procedure TfrmDisplayPO.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDisplayPO := nil;
//  FreeAndNil(fpobonus);
end;

procedure TfrmDisplayPO.SetClearValue;
var i: integer;
begin
  {for i:=1 to strgGrid.RowCount-1 do
  begin
    strgGrid.Cells[4,i] := '0';
    strgGrid.Colors[4,i] := clWindow;
    strgGrid.Cells[13,i]:= '0';
    strgGrid.Cells[14,i]:= '0';
    strgGrid.Cells[15,i]:= '0';
    strgGrid.Cells[16,i]:= '0';
    edtjfTotalColie.Value:= 0;
    jvcuredtSubTotal.Value:= 0;
    jvcuredtPPN.Value:= 0;
    jvcuredtPPNBM.Value:= 0;
    jvcuredtDiscount.Value:= 0;
  end;}
end;

procedure TfrmDisplayPO.btnBrowsePoNoClick(Sender: TObject);
var
  sSQL: string;
begin
//	ClearByTag(Self,[0]);
//  ClearAdvStringGrid(strgGrid);
  lblStatusPO.Caption := '';


  sSQL  := 'select a.po_no as"NO PO", a.PO_date as "TGL PO",'
        + ' d.merchan_name AS "MERCHANDISE",f.stapo_name AS "STATUS",'
        + ' e.sup_code AS "KODE SUPLIER", e.sup_name AS "NAMA SUPLIER"'
        + ' from po a'
        + ' inner join suplier_merchan_grup b on b.supmg_sub_code = a.po_supmg_sub_code'
        + ' inner join ref$merchandise_grup c on c.merchangrup_id = b.supmg_merchangrup_id'
        + ' inner join ref$merchandise d on d.merchan_id = c.merchangrup_merchan_id'
        + ' inner join suplier e on e.sup_code = b.supmg_code'
        + ' inner join ref$Status_po f on f.stapo_id = a.po_stapo_id' ;
 {
  if FTipeApp = TSTORE then
    sSQL  := sSQL + ' and a.po_no like '+ Quot(IntToStr(MasterNewUnit.ID) + '%');

  with cLookUp('Daftar PO Yang Sudah Order',sSQL,200,2,True) do
  begin
    try
      edtPONo.Text := Strings[0];
      edtPONo.SetFocus;
    finally
      Free;
    end;
  end; }
end;

procedure TfrmDisplayPO.btnChekListNpClick(Sender: TObject);
var SeparatorDate: Char;
    i, colieRcv: Integer;
    bonus: Real;
begin
  if CommonDlg.Confirm('Are you sure you wish to print NP?')= mrNo
  then Exit;
  SeparatorDate:= FormatSettings.DateSeparator;

  try
    FormatSettings.DateSeparator:= '/';
    bonus:= 0;
    colieRcv:= 0;

    {if strgGrid.RowCount > 1 then
      for i:= 1 to (strgGrid.RowCount-1) do begin
        bonus:= bonus + StrToFloat(strgGrid.Cells[6,i]);
        colieRcv:= colieRcv + StrToInt(strgGrid.Cells[4,i]);
      end;

    if not Assigned(ParamList) then
      ParamList := TStringList.Create;
    ParamList.Add(edtNP.Text); //0
    ParamList.Add(edtPONo.Text); //1
    ParamList.Add(IntToStr(colieRcv)); //2
    ParamList.Add(FloatToStr(bonus)); //3
    ParamList.Add(FLoginUsername); //4

    with dmReport do begin
      Params := ParamList;
      pMainReport.LoadFromFile(ExtractFilePath(Application.ExeName) + '/template/frCetakNP.fr3');
      pMainReport.PrepareReport(True);
      pMainReport.Print; //ShowReport(True);
    end; }

  finally
    FormatSettings.DateSeparator:= SeparatorDate;
    if Assigned(ParamList) then
      FreeAndNil(ParamList);
  end;
end;

procedure TfrmDisplayPO.edtPONoChange(Sender: TObject);
begin
  inherited;
  lbl24.Visible := True;
  btnChekListNp.Visible := False;
  btnCetakNP.Visible:= False;
 // ClearForm;
end;

procedure TfrmDisplayPO.edtDONoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key=#13 then
  begin
//    strgGrid.Col:= 4;
//    if strgGrid.Enabled then
//      strgGrid.SetFocus;
  end
  else
  if(not(Key in['0'..'9',Chr(VK_BACK)]))then
    Key:=#0;
end;

procedure TfrmDisplayPO.edtPONoKeyPress(Sender: TObject;
  var Key: Char);
//var data: TResultDataSet;
begin
  inherited;
  if Key=#13 then
  begin
  	LoadDAtaToForm(edtPONo.Text);
//    HapusBarisKosong(strgGrid,_kolKodeBarang);
    InsertNumber ;
  end else if(not(Key in['0'..'9',Chr(VK_BACK)]))then
    Key:=#0;
end;

procedure TfrmDisplayPO.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  inherited;
  if(Key = VK_F2) then
    btnBrowsePoNo.Click;
  if(Key = VK_DELETE) and (ssctrl in Shift) then  //dulunya ctrl F5
    GetAndRunButton('btnRefresh');
  if((Key = Ord('D'))and(ssctrl in Shift))and
    btnChekListNp.Visible
  then
    btnChekListNpClick(self);
  if((Key = Ord('P'))and(ssctrl in Shift))and
    btnCetakNP.Visible
  then
    btnCetakNP.Click;
  if((Key = 13) and (ssctrl in Shift))and
     fraFooter5Button1.btnAdd.Enabled
  then
    GetAndRunButton('btnAdd');
end;

procedure TfrmDisplayPO.strgGridClick(Sender: TObject);
begin
  inherited;
  {if(strgGrid.Cells[0,strgGrid.Row]<>'')then
  begin
    edtProductName.Text:= strgGrid.Cells[_kolNamaBArang,strgGrid.Row];
    edtjfDisc1.Value:= StrToFloat(strgGrid.Cells[_kolDisc1,strgGrid.Row]);
    edtjfDisc2.Value:= StrToFloat(strgGrid.Cells[_kolDisc2,strgGrid.Row]);
    jvcuredtNilaiDisc.Value:= StrToFloat(strgGrid.Cells[_kolDisc3,strgGrid.Row]);
    jvcuredtTotalDisc.Value:= StrToFloat(strgGrid.Cells[_kolDisc1,strgGrid.Row]) +
    			StrToFloat(strgGrid.Cells[_kolDisc2,strgGrid.Row]) + jvcuredtNilaiDisc.Value;
  end;
  }
end;

procedure TfrmDisplayPO.strgGridRowChanging(Sender: TObject; OldRow,
  NewRow: Integer; var Allow: Boolean);
begin
  inherited;
  strgGridClick(Self);
end;

procedure TfrmDisplayPO.strgGridCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  inherited;
  if (ACol = 7) then
  begin
//    if State then
//      edtjfRecvBonus.Value:= edtjfRecvBonus.Value + StrToFloat(strgGrid.Cells[6,ARow])
//    else
//      edtjfRecvBonus.Value:= edtjfRecvBonus.Value - StrToFloat(strgGrid.Cells[6,ARow]);
  end;
end;

procedure TfrmDisplayPO.FormActivate(Sender: TObject);
begin
  inherited;
  frmDisplayPO.Caption := 'DISPLAY PO';
end;

procedure TfrmDisplayPO.actClearGoodReceivingExecute(Sender: TObject);
begin
  SetClearValue;
end;

procedure TfrmDisplayPO.InsertNumber;
//var
//  i: Integer;
begin
//  for i := strgGrid.FixedRows to strgGrid.RowCount - 1 do
//  begin
//    strgGrid.Cells[_kolNo,i] := IntToStr(i);
//  end;
end;

procedure TfrmDisplayPO.JumlahkanNilaiPO;
begin
  {with FPO do
  begin
    jvcuredtSubTotal.Value    := Total;
    jvcuredtPPN.Value         := PPN;
    jvcuredtPPNBM.Value       := PPNBM;
    jvcuredtDiscount.Value    := Disc;
    jvcuredtTotalBeli.Value   := Total + PPN + PPNBM - Disc;
  end;   }
end;

procedure TfrmDisplayPO.LoadDataPOBonus(aBarisGrid : Integer);
//var
//  sSQL: string;
//  i: Integer;
begin

//  sSQL := ' select po_no '
//          + ' from po '
////          + ' where po_no_ref = ' + QuotedStr(FPO.NoBukti)
//          + ' and po_no <> po_no_ref ';
  {
  with cOpenQuery(sSQL) do
  begin
    try
      while not Eof do
      begin
        if not FieldByName('po_no').IsNull then
          FPO.LoadByNoBukti(fieldByName('po_no').AsString,MasterNewUnit.ID);
        Next;
      end;  
    finally
      Free;
    end;
  end;
   }

end;

procedure TfrmDisplayPO.LoadDAtaToForm(aPONo : string);
var
  j: Integer;
  iBaris: Integer;
	i: Integer;
begin
  //i := 0;
  {
	FPO.LoadByNoBukti(aPONo, 0);

  edtPONo.Text := FPO.NoBukti;
  lblStatusPO.Caption := FPO.StatusPO.Nama;

  if FPO.StatusPO.ID = 5 then
  begin
  	FDO.LoadByNoPO(edtPONo.Text, FPO.NewUnitID);
  	edtDONo.Text := FDO.NoBukti;
    edtNP.Text := FDO.NP;
  end
  else
  begin
  	edtDONo.Text := '';
    edtNP.Text := '';
  end;

  edtSuplierCode.Text := FPO.NewSupplierMerGroup.NewSupplier.Kode;
  edtSuplierName.Text := FPO.NewSupplierMerGroup.NewSupplier.Nama;
  dtDatePO.Date := FPO.TglBukti;
  dtDateDO.Date := cGetServerTime;

  with strgGrid do
  begin
    // ini yg PO Biasa
    iBaris := 0;
    if FPO.POItems.Count > 0 then
    begin

      RowCount := FPO.POItems.Count + 1;

      for i := 0 to FPO.POItems.Count - 1 do
      begin
        iBaris := i + 1;
        Cells[_kolNo,i + 1] := IntToStr(i + 1);
        Cells[_kolKodeBarang,i + 1] := FPO.POItems[i].Barang.Kode;
        Cells[_kolQTYOrder,i + 1] := FloatToStr(FPO.POItems[i].QtyOrder);
        Floats[_kolPrice, i + 1] := FPO.POItems[i].Price;
        if FPO.StatusPO.ID = 5 then
        begin
          for j:= 0 to FDO.DeliveryItems.Count - 1 do
          begin
            if Cells[_kolKodeBarang,i + 1] = FDO.DeliveryItems[j].BarangKode then
            begin
              Cells[_kolQTYRecv,i + 1] := FloatToStr(FDO.DeliveryItems[j].QtyOrderRecv);
              Break;
            end;
            //item tidak di temukan..karena ada break kalo di temukan kluar loop
            if j = FDO.DeliveryItems.Count - 1 then
            begin
              Cells[_kolQTYRecv,i + 1] := '0';
            end;
          end;
        end
        else
          Cells[_kolQTYRecv,i + 1] := '0';

        Cells[_kolUOM,i + 1] := FPO.POItems[i].SatCodeOrder.UOM;

        Cells[_kolNamaBarang,i + 1] := FPO.POItems[i].Barang.Alias;

        if FPO.POItems[i].Disc1 > 0 then
          Cells[_kolDisc1,i + 1] := FloatToStr(FPO.POItems[i].Disc1)
        else
          Cells[_kolDisc1,i + 1] := '0';

        if FPO.POItems[i].Disc2 > 0 then
          Cells[_kolDisc2,i + 1] := FloatToStr(FPO.POItems[i].Disc2)
        else
          Cells[_kolDisc2,i + 1] := '0';

        Cells[_kolDisc3,i + 1] := FloatToStr(FPO.POItems[i].Disc3);

        Cells[_kolTotalDisc, i + 1] := FloatToStr(FPO.POItems[i].TotalDisc);

        Cells[_kolPPN, i + 1] := FloatToStr(FPO.POItems[i].PPN);
        Cells[_kolPPNBM, i + 1] := FloatToStr(FPO.POItems[i].PPNBM);

      end;
    end;



  end;
     }
//    JumlahkanNilaiPO;

//    LoadDataPOBonus(iBaris + 1);

end;

procedure TfrmDisplayPO.SetModul(const Value: TModul);
begin
  FModul := Value;
end;

procedure TfrmDisplayPO.btnSlipClick(Sender: TObject);
begin
  inherited;
//  DoSlipPO(edtPONo.Text, MasterNewUnit.ID);
end;

procedure TfrmDisplayPO.btnSlipNewClick(Sender: TObject);
var
  ssQL: string;
begin
  inherited;

end;

procedure TfrmDisplayPO.strgGridGetFloatFormat(Sender: TObject; ACol,
  ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  inherited;
  FloatFormat := '%.2n';
//  if (ACol in [_kolPPNBM,_kolPPN,_kolTotalDisc, _kolDisc3, _kolDisc2, _kolDisc1, _kolQTYRecv, _kolQTYOrder, _kolPrice])
//      and (ARow >= strgGrid.FixedRows) then
//  begin
//    IsFloat := True;
//  end else begin
//    IsFloat := False;
//  end;
end;

end.
