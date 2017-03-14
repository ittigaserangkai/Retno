unit ufrmPOFromAssgros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, ActnList, ufraFooter5Button, StdCtrls, uConn, ExtCtrls,
  Grids, BaseGrid, AdvGrid, Mask, JvToolEdit, cbxbase, dblup1a, JvBaseEdits,
  JvEdit, JclStrings, uRMSUnit, AdvObj, JvExStdCtrls,
  JvValidateEdit, JvExMask;

type
  TfrmPOFromAssgros = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    actlst1: TActionList;
    actAddPOFromAssgros: TAction;
    actEditPOFromAssgros: TAction;
    actDeletePOFromAssgros: TAction;
    actRefreshPOFromAssgros: TAction;
    pnl1: TPanel;
    pnl2: TPanel;
    strgGrid: TAdvStringGrid;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    edtTraderCode: TEdit;
    edtTraderName: TEdit;
    dtTgl: TJvDateEdit;
    cbpPOTraderNo: TColumnComboBox;
    edtStatus: TEdit;
    edtLeadTime: TEdit;
    lbl8: TLabel;
    edtTOP: TEdit;
    lbl9: TLabel;
    lbl10: TLabel;
    curredtTotalPrice: TJvValidateEdit;
    lbl11: TLabel;
    edtTraderType: TEdit;
    edtPOTraderNo: TEdit;
    Label1: TLabel;
    procedure actAddPOFromAssgrosExecute(Sender: TObject);
    procedure fraFooter5Button1btnAddClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actEditPOFromAssgrosExecute(Sender: TObject);
    procedure actDeletePOFromAssgrosExecute(Sender: TObject);
    procedure actRefreshPOFromAssgrosExecute(Sender: TObject);
    procedure dtTglKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbpPOTraderNoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fraFooter5Button1btnRefreshClick(Sender: TObject);
    procedure fraFooter5Button1btnDeleteClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fraFooter5Button1btnUpdateClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbpPOTraderNoChange(Sender: TObject);
    procedure strgGridGetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
    procedure edtPOTraderNoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPOTraderNoChange(Sender: TObject);
    procedure strgGridGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FDataMember: TStringList;
    //FDataReport: TResultDataSet;
    FAlamatTrader: string;
    NomorPO: string;

    procedure ParseHeaderGrid();
//    procedure ParseHeaderGridAssGross;
    procedure ParseDataGrid();
    procedure ParseDataComboPOTraderNo();
    procedure ParseTraderPO(APONo: string);
    procedure ShowPODetilByPONo(APONo: string);
    procedure ClearForm();
    procedure ShowDialogSearchPo;
    //procedure PrintPOFromAssgros;
    //procedure PrintKasirPOFromAssgros(AData: TResultDataSet);
    procedure TraderPrint;
  public
    { Public declarations }
  end;

var
  frmPOFromAssgros: TfrmPOFromAssgros;

const
  _KolKode        : Integer = 1;
  _KolNama        : Integer = 2;
  _KolUOM         : Integer = 3;
  _KolBarcode     : Integer = 4;
  _KolQTY         : Integer = 5;
  _KolHarga       : Integer = 6;
  _KolDiscMember  : Integer = 7;
  _KolSubTotal    : Integer = 8;

  //  _KolPPN         : Integer = 7;
//  _KolQTY : Integer = 4;
//  _KolHarga : Integer = 5;
//  _KolPPN : Integer = 6;


implementation

uses ufrmDialogPOFromAssgros, uGTSUICommonDlg, DB,
  ufrmSearchPO, udmReport,  ufrmDialogPrintKasirPreview,
  uTemplatePrintText,  uPOAssgrosNew, udmReportNew, uNewBarang;

{$R *.dfm}

procedure TfrmPOFromAssgros.fraFooter5Button1btnAddClick(Sender: TObject);
begin
  inherited;
  actAddPOFromAssgrosExecute(Self);
end;

procedure TfrmPOFromAssgros.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmPOFromAssgros.FormCreate(Sender: TObject);
begin
  inherited;
//  DecimalSeparator := ',';
//  ThousandSeparator := '.';

  lblHeader.Caption := 'PO From Trader';
  //if not assigned(PurchasingOrder) then
  //  PurchasingOrder := TPurchasingOrder.Create;

  ClearForm;
  dtTgl.Date := now;
  ParseDataComboPOTraderNo;
  ParseHeaderGrid;
end;

procedure TfrmPOFromAssgros.FormDestroy(Sender: TObject);
begin
  inherited;
  //if assigned(PurchasingOrder) then
  //  PurchasingOrder.Destroy;
  // frmPOFromAssgros := nil;
  FreeAndNil(FDataMember);
end;
          
procedure TfrmPOFromAssgros.actAddPOFromAssgrosExecute(Sender: TObject);
begin
  if not Assigned(frmDialogPOFromAssgros) then
    Application.CreateForm(TfrmDialogPOFromAssgros, frmDialogPOFromAssgros);

  frmDialogPOFromAssgros.Modul:= mPOFromAssgros;
  frmDialogPOFromAssgros.frmSuiMasterDialog.Caption := 'Add PO From Trader';
  frmDialogPOFromAssgros.FormMode := fmAdd;
  SetFormPropertyAndShowDialog(frmDialogPOFromAssgros);
  
  if (frmDialogPOFromAssgros.IsProcessSuccessfull) then
  begin
    NomorPO := frmDialogPOFromAssgros.NomorPO;
    edtPOTraderNo.Text := NomorPO;
    
    actRefreshPOFromAssgrosExecute(Self);
    CommonDlg.ShowConfirmSuccessfull(atAdd); 
    if (CommonDlg.Confirm('Apakah Anda Akan Mencetak Laporan') = mrYES) then
    begin
      fraFooter5Button1btnUpdateClick(Self);
    end;
    edtPOTraderNo.setFocus;
  end;

  frmDialogPOFromAssgros.Free;
end;

procedure TfrmPOFromAssgros.actEditPOFromAssgrosExecute(Sender: TObject);
begin
  if not Assigned(frmDialogPOFromAssgros) then
    Application.CreateForm(TfrmDialogPOFromAssgros, frmDialogPOFromAssgros);
    
  frmDialogPOFromAssgros.frmSuiMasterDialog.Caption := 'Edit PO From Trader';
  frmDialogPOFromAssgros.edtPONo.Text := edtPOTraderNo.Text;

  frmDialogPOFromAssgros.FormMode := fmEdit;
  SetFormPropertyAndShowDialog(frmDialogPOFromAssgros);
  
  if (frmDialogPOFromAssgros.IsProcessSuccessfull) then
  begin
    actRefreshPOFromAssgrosExecute(Self);
    CommonDlg.ShowConfirmSuccessfull(atEdit);
    if (CommonDlg.Confirm('Cetak Laporan') = mrYES) then
    begin
      fraFooter5Button1btnUpdateClick(Self);
    end;
  end;

  frmDialogPOFromAssgros.Free;
end;

procedure TfrmPOFromAssgros.actDeletePOFromAssgrosExecute(Sender: TObject);
begin
  if (edtPOTraderNo.Text = '') then exit;
  if (edtStatus.Text <> 'OPEN') and (edtStatus.text <> 'PARTIAL') then
  begin
    CommonDlg.Confirm('PO is active. Cannot deleted.');
    exit;
  end;

  if (CommonDlg.Confirm('Are you sure you wish to delete PO From Trader (PO No.: '+edtPOTraderNo.Text+')?') = mrYes) then
  begin
    try
      if (TPO_ASSGROS.DeletePOAssgrosByPONo(edtPOTraderNo.Text, MasterNewUnit.ID)) then
      begin
        ccommittrans;
        actRefreshPOFromAssgrosExecute(Self);
        CommonDlg.ShowConfirmSuccessfull(atDelete);
        edtPOTraderNo.setFocus;
      end else begin
        crollbacktrans;
      end;




    except
      CommonDlg.ShowError('Deleted failed.');
    end;
  end;
end;

procedure TfrmPOFromAssgros.actRefreshPOFromAssgrosExecute(
  Sender: TObject);
begin
  ClearForm;
  //ParseDataComboPOTraderNo;
  if (edtPOTraderNo.Text = '') then Exit;
  ParseTraderPO(edtPOTraderNo.Text);
  ShowPODetilByPONo(edtPOTraderNo.Text);
  edtPOTraderNo.setFocus;
//  strgGrid.ColWidths[_KolPPN] := 0;
end;

procedure TfrmPOFromAssgros.ParseDataGrid;
begin
  ParseHeaderGrid;
  cclearStringGrid(strgGrid, True);
  strgGrid.AutoSizeColumns(True, 5);

end;

procedure TfrmPOFromAssgros.ParseHeaderGrid;
begin
  with strgGrid do
  begin
    Clear;
    ColCount := 9;
    RowCount := 2;

    Cells[0,0] := 'NO';
    Cells[_KolKode,0]       := 'PLU';
    Cells[_KolNama,0]       := 'PRODUCT NAME';
    Cells[_KolUOM,0]        := 'UOM';
    Cells[_KolBarcode,0]    := 'BARCODE';
    Cells[_KolQTY,0]        := 'QTY';
    Cells[_KolHarga,0]      := 'PRICE';
    Cells[_KolDiscMember,0] := 'DISC. MEMBER';
    Cells[_KolSubTotal,0]   := 'SUB TOTAL';

    FixedRows := 1;
    AutoSize  := True;
  end;

end;

procedure TfrmPOFromAssgros.ParseDataComboPOTraderNo;
var
  aParams: TArr;
  data: TResultDataSet;
begin
  with cbpPOTraderNo do
  begin
    ClearGridData;
    ColCount := 3;
    RowCount := 2;

    AddRow(['Id', 'PO TRADER NO.','STATUS']);
    AddRow(['', '','']);

    FixedRows := 1;
    SizeGridToData;
    Text := '';
    ShowSpeedButton := false;
  end;

  SetLength(aParams,1);
  aParams[0].tipe := ptDateTime;
  aParams[0].data := dtTgl.Date;
  data := TPO_ASSGROS.GetPOAssgrosByDate(aParams);

  if (data.RecordCount > 0) then
  begin
    with cbpPOTraderNo do
    begin
      ClearGridData;
      ColCount := 3;
      RowCount := data.RecordCount+1;
      AddRow(['Id', 'PO TRADER NO.','STATUS']);

      while not data.Eof do
      begin
        AddRow([data.FieldByName('POAS_NO').AsString, data.FieldByName('POAS_NO').AsString,
           data.FieldByName('POAS_STATUS').AsString]);
        data.Next;
      end;

      FixedRows := 1;
      SizeGridToData;  
      ShowSpeedButton := false;
      Text := NomorPO;
      SelectAll;
    end;
  end;
end;

procedure TfrmPOFromAssgros.dtTglKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    ParseDataComboPOTraderNo;
    edtPOTraderNo.SetFocus;
  end;
end;

procedure TfrmPOFromAssgros.ClearForm;
begin
  edtTraderCode.Text := '';
  edtTraderName.Text := '';
  edtTraderType.Text := '';
  edtStatus.Text := '';
  edtLeadTime.Text := '';
  edtTOP.Text := '';
  curredtTotalPrice.Value := 0;
  ParseHeaderGrid;
end;

procedure TfrmPOFromAssgros.cbpPOTraderNoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    if (cbpPOTraderNo.Text = '') then Exit;
    ParseTraderPO(cbpPOTraderNo.Text);
    ShowPODetilByPONo(cbpPOTraderNo.Text);
  end;

  if (Key = VK_ESCAPE) then
    dtTgl.SetFocus;

  if (Key = VK_DOWN) then
    cbpPOTraderNo.Text := cbpPOTraderNo.Cells[1, cbpPOTraderNo.Row];

end;

procedure TfrmPOFromAssgros.ParseTraderPO(APONo: string);
var
  data: TResultDataSet;
  aParams: TArr;
begin
  SetLength(aParams,1);
  aParams[0].tipe := ptString;
  aParams[0].data := APONo;
  data := TPO_ASSGROS.GetTraderPOAssgros(aParams);
  if (data.RecordCount > 0) then
  begin
    with data do
    begin
      edtTraderCode.Text := FieldByName('TRD_CODE').AsString;
      edtTraderName.Text := FieldByName('TRD_NAME').AsString;
      if (FieldByName('TRD_IS_ASSGROS').AsInteger = 1) then
        edtTraderType.Text := 'ASSGROS'
      else
        edtTraderType.Text := 'TRADER';
      edtStatus.Text := FieldByName('POAS_STATUS').AsString;
      edtLeadTime.Text := inttostr(FieldByName('POAS_LEAD_TIME').AsInteger);
      edtTOP.Text := inttostr(FieldByName('POAS_TOP').AsInteger);
      curredtTotalPrice.Value := FieldByName('POAS_TOTAL').AsCurrency;

      FAlamatTrader := data.FieldByName('TRD_ADDRESS').AsString;

      FDataMember.Clear;
      FDataMember.Add(FLoginFullname);
      FDataMember.Add(data.FieldByName('TRD_NAME').AsString);
      FDataMember.Add(data.FieldByName('TRD_CONTACT_PERSON').AsString);
      FDataMember.Add(data.FieldByName('TRD_CODE').AsString);
      FDataMember.Add(data.FieldByName('TRD_ADDRESS').AsString);
      FDataMember.Add(data.FieldByName('TRD_TELP').AsString);
      FDataMember.Add(data.FieldByName('TRD_FAX').AsString);
    end;
  end;
end;

procedure TfrmPOFromAssgros.ShowPODetilByPONo(APONo: string);
var
  FPOAssgros      : TPO_ASSGROS;
  i               : integer;
  cSellPriceDisc  : Currency;
//  cPPn, cPPnBM: Currency;
begin

  ParseDataGrid;
  FPOAssgros := TPO_ASSGROS.Create(nil);

  try
    if FPOAssgros.LoadByNo(APONo, masternewunit.id) then
    begin

      for i := 0 to FPOAssgros.PO_ASSGROS_DETILS.Count - 1 do
      begin
        cSellPriceDisc := FPOAssgros.PO_ASSGROS_DETILS[i].POASD_SELL_PRICE_DISC
                          - (FPOAssgros.PO_ASSGROS_DETILS[i].POASD_DISC_MEMBER
                              / FPOAssgros.PO_ASSGROS_DETILS[i].POASD_QTY);
                              
//        cPPn := cSellPriceDisc * FPOAssgros.PO_ASSGROS_DETILS[i].POASD_PPN / 100;
//        cPPnBM := cSellPriceDisc * FPOAssgros.PO_ASSGROS_DETILS[i].POASD_PPNBM / 100;

        strgGrid.Cells[0, i+1] := inttostr(i+1);
        strgGrid.Cells[_KolKode, i+1]       := FPOAssgros.PO_ASSGROS_DETILS[i].POASD_BRG_CODE;
        strgGrid.Cells[_KolNama,i+1]        := FPOAssgros.PO_ASSGROS_DETILS[i].POASD_BARANG.Alias;
        strgGrid.Cells[_KolUOM,i+1]         := FPOAssgros.PO_ASSGROS_DETILS[i].POASD_SAT_CODE;
        strgGrid.Cells[_KolBarcode,i+1]     := FPOAssgros.PO_ASSGROS_DETILS[i].Poasd_Barcode;
        strgGrid.Cells[_KolQTY,i+1]         := FloatToStr(FPOAssgros.PO_ASSGROS_DETILS[i].POASD_QTY);
        strgGrid.Cells[_KolHarga,i+1]       := CurrToStr(cSellPriceDisc);
        strgGrid.Cells[_KolDiscMember,i+1]  := FloatToStr(FPOAssgros.PO_ASSGROS_DETILS[i].POASD_DISC_MEMBER);
        strgGrid.Cells[_KolSubTotal,i+1]    := FloatToStr(FPOAssgros.PO_ASSGROS_DETILS[i].POASD_SELL_PRICE_DISC
                                                  * FPOAssgros.PO_ASSGROS_DETILS[i].POASD_QTY
                                                  - FPOAssgros.PO_ASSGROS_DETILS[i].POASD_DISC_MEMBER);

        if i <> FPOAssgros.PO_ASSGROS_DETILS.Count - 1 then
          strgGrid.AddRow;
      end;
      strgGrid.AutoSizeColumns(True, 5);
      fraFooter5Button1.btnUpdate.Enabled := true;
    end
    else
      fraFooter5Button1.btnUpdate.Enabled := False;

  finally
    if FPOAssgros <> nil then FreeAndNil(FPOAssgros);
    strgGrid.AutoSize := True;
  end;

end;

procedure TfrmPOFromAssgros.fraFooter5Button1btnRefreshClick(
  Sender: TObject);
begin
  actRefreshPOFromAssgrosExecute(Self);
end;

procedure TfrmPOFromAssgros.fraFooter5Button1btnDeleteClick(
  Sender: TObject);
begin
  //actDeletePOFromAssgrosExecute(Self);
  if edtPOTraderNo.Text = '' then Exit;
  actEditPOFromAssgrosExecute(Self);
end;

procedure TfrmPOFromAssgros.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
//var
//  dSellPriceAfterDisc: Double;
//  i: Integer;
begin
  inherited;
//  if Key = VK_F5 then
//  begin
(*TODO: extracted code
    if not Assigned(frmDialogSearchPO) then
      frmDialogSearchPO := TfrmDialogSearchPO.Create(Self);
    frmDialogSearchPO.Modul := tmPOAssGross;

    if frmDialogSearchPO.IsProcessSuccessfull = true then
    begin
      ParseDataGrid;

      with frmDialogSearchPO do
      begin
        POAsGrossData.First;
        Self.dtTgl.Date := POAsGrossData.FieldByName('POAS_DATE').AsDateTime;
        Self.cbpPOTraderNo.Text := POAsGrossData.FieldByName('POAS_NO').AsString;
        Self.edtPOTraderNo.Text := POAsGrossData.FieldByName('POAS_NO').AsString;
        Self.edtTraderCode.Text := POAsGrossData.FieldByName('TRD_CODE').AsString;
        Self.edtTraderName.Text := POAsGrossData.FieldByName('TRD_NAME').AsString;
        if (POAsGrossData.FieldByName('TRD_IS_ASSGROS').AsInteger = 1) then
          Self.edtTraderType.Text := 'ASSGROS'
        else
          Self.edtTraderType.Text := 'TRADER';

        //Self.edtTraderType.Text := POAsGrossData.FieldByName('TRD_IS_ASSGROS').AsString;
        Self.edtStatus.Text := POAsGrossData.FieldByName('POAS_STATUS').AsString;
        Self.edtLeadTime.Text := POAsGrossData.FieldByName('POAS_LEAD_TIME').AsString;
        Self.edtTOP.Text := POAsGrossData.FieldByName('POAS_TOP').AsString;
        Self.curredtTotalPrice.Value := POAsGrossData.FieldByName('POAS_TOTAL').AsCurrency;
        ParseTraderPO(edtPOTraderNo.Text);
        ShowPODetilByPONo(edtPOTraderNo.Text);
//        i := 1;
//        while not POAsGrossData.Eof do
//        begin
//          dSellPriceAfterDisc := POAsGrossData.FieldByName('POASD_SELL_PRICE_DISC').AsFloat - POAsGrossData.FieldByName('POASD_DISC_MEMBER').AsFloat;
//
//          Self.strgGrid.Cells[0, i]               := IntToStr(i);
//          Self.strgGrid.Cells[_KolKode, i]        := POAsGrossData.FieldByName('POASD_BRG_CODE').AsString;
//          Self.strgGrid.Cells[_KolNama, i]        := POAsGrossData.FieldByName('BRG_NAME').AsString;
//          Self.strgGrid.Cells[_KolUOM, i]         := POAsGrossData.FieldByName('POASD_SAT_CODE').AsString;
//          Self.strgGrid.Cells[_KolBarcode, i]     := POAsGrossData.FieldByName('POASD_SAT_CODE').AsString;
//          Self.strgGrid.Cells[_KolQTY, i]         := FloatToStr(POAsGrossData.FieldByName('POASD_QTY').AsFloat);
//          Self.strgGrid.Cells[_KolHarga, i]       := FloatToStr(dSellPriceAfterDisc);
//          Self.strgGrid.Cells[_KolPPN, i]         := CurrToStr(dSellPriceAfterDisc * ((POAsGrossData.FieldByName('POASD_PPN').AsCurrency + POAsGrossData.FieldByName('POASD_PPNBM').AsCurrency)/100));
//          Self.strgGrid.Cells[_KolSubTotal, i]  := CurrToStr(POAsGrossData.FieldByName('POASD_TOTAL_PRICE').AsCurrency);
//          POAsGrossData.Next;
//
//          if not POAsGrossData.Eof then Self.strgGrid.AddRow;
//          inc(i);
//        end;    // while
{
        Self.edtContactPerson.Text := TraderData.FieldByName('TRD_CONTACT_PERSON').AsString;
        Self.edtDesc.Text := TraderData.FieldByName('TRD_DESCRIPTION').AsString;
        Self.edtTelp.Text := TraderData.FieldByName('TRD_TELP').AsString;
        Self.edtFax.Text := TraderData.FieldByName('TRD_FAX').AsString;
        Self.edtNPWP.Text := TraderData.FieldByName('TRD_NPWP').AsString;
}
      end;
      strgGrid.AutoSizeColumns(True, 5);
    end;

    frmDialogSearchPO.Free;
*)

//  end;

end;

//procedure TfrmPOFromAssgros.ParseHeaderGridAssGross;
//begin
//  with strgGrid do
//  begin
//    Clear;
//    ColCount := 9;
//    RowCount := 2;
//
//    Cells[0,0]              := 'NO.';
//    Cells[_KolKode,0]       := 'PRODUCT CODE';
//    Cells[_KolNama,0]       := 'PRODUCT NAME';
//    Cells[_KolUOM,0]        := 'UOM';
//    Cells[_KolBarcode,0]    := 'BARCODE';
//    Cells[_KolQTY,0]        := 'QTY';
//    Cells[_KolHarga,0]      := 'PRICE';
//    Cells[_KolPPN,0]        := 'PPN';
//    Cells[_KolSubTotal,0] := 'TOTAL PRICE';
//
//    FixedRows := 1;
//    AutoSizeColumns(True, 5);
//  end;
//end;

{procedure TfrmPOFromAssgros.PrintPOFromAssgros;
begin
  PrintKasirPOFromAssgros(FDataReport);
//  with dmReport do
//  begin
//    Params:= FDataMember;
//    frxDBDataset.DataSet:= FDataReport;
//    pMainReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'/template/frPOAssgros.fr3');
//    pMainReport.ShowReport(True);
//  end
end;
}
procedure TfrmPOFromAssgros.fraFooter5Button1btnUpdateClick(
  Sender: TObject);
begin
//  inherited;
  if edtPOTraderNo.Text<>'' then
//    PrintPOFromAssgros;
  TraderPrint;
end;

procedure TfrmPOFromAssgros.FormShow(Sender: TObject);
begin
  inherited;
  NomorPO := '';
  FDataMember:= TStringList.Create;
  fraFooter5Button1.btnUpdate.Enabled := false;
end;

procedure TfrmPOFromAssgros.cbpPOTraderNoChange(Sender: TObject);
begin
  inherited;
  //NomorPO := cbpPOTraderNo.Text;
end;

procedure TfrmPOFromAssgros.strgGridGetFloatFormat(Sender: TObject; ACol,
  ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  inherited;     
  FloatFormat := '%.3n';
  if (ACol in [_KolQTY]) and (ARow > 0) then
    IsFloat := True
  else
  if (ACol in [_KolHarga, _KolDiscMember, _KolSubTotal]) and (ARow > 0) then
  begin
    FloatFormat := '%.2n';
    IsFloat := True;
  end
  else
    IsFloat := False;
//  FloatFormat := '%.2n';
//  if (ACol in [_KolHarga, _KolDiscMember, _KolSubTotal]) then
//    IsFloat := True
//  else
//    IsFloat := False;
end;

{procedure TfrmPOFromAssgros.PrintKasirPOFromAssgros(AData: TResultDataSet);
var
  _count_data, i: Integer;
  _barang: string;
  _grand_total, _total_qty, _total, _qty: Real;
begin
  if not Assigned(frmDialogPrintKasirPreview) then
    frmDialogPrintKasirPreview := TfrmDialogPrintKasirPreview.Create(Self);

  frmDialogPrintKasirPreview.Width := 420;

  with frmDialogPrintKasirPreview.mmoPrint.Lines do
  begin
    Add(PO_AS_TEXT_HEADER_PRINT);
    Add(PO_AS_TEXT_PURCASE_ORDER + FormatDateTime('dd/MM/yyyy', Now));
    Add(PO_AS_TEXT_KRING_33 + FormatDateTime('hh:mm:ss', Now));
    Add('');
    Add(PO_AS_TEXT_NO_PO + edtPOTraderNo.Text);
    Add(PO_AS_TEXT_TRADER + edtTraderCode.Text + ' ' + edtTraderName.Text);
    Add(PO_AS_TEXT_ALAMAT_TRADER + Copy(FAlamatTrader,1,PO_AS_INT_JANGKAUAN_ALAMAT_TRADER));
    Add(PO_AS_TEXT_SPACE_USER + FLoginFullname);
    Add(GENERAL_TEXT_SINGLE_LINE + PO_AS_TEXT_SHORT_SINGLE_LINE);
    Add(PO_AS_TEXT_COLUMN_HEADER);
    Add(GENERAL_TEXT_DOUBLE_LINE + PO_AS_TEXT_SHORT_DOUBLE_LINE);

//    _qty := 0.0;
//    _total := 0.0;
    _total_qty := 0.0;
    _grand_total := 0.0;

    if not AData.IsEmpty then
    begin
      _count_data := AData.RecordCount - 1;
      AData.First;
      for i := 0 to _count_data do
      begin
        _barang := Copy(AData.FieldByName('BRG_CODE').AsString +  ' ' +
                        AData.FieldByName('BRG_NAME').AsString +  ' ' +
                        AData.FieldByName('BRG_MERK').AsString,
                        1, PO_AS_INT_JANGKAUAN_NAMA_BARANG);

        _qty := AData.FieldByName('POASD_QTY').AsFloat;
        _total_qty := _total_qty + _qty;

        _total := AData.FieldByName('POASD_TOTAL_PRICE').AsFloat;
        _grand_total := _grand_total + _total;

        Add(StrPadRight(_barang, PO_AS_INT_JANGKAUAN_NAMA_BARANG, ' ') +
            StrPadLeft(FormatFloat('#,##0.0', _qty),
                       PO_AS_INT_JANGKAUAN_QTY, ' ') +
            StrPadLeft(FormatFloat('#,##0.00', _total),
                       PO_AS_INT_JANGKAUAN_TOTAL, ' '));
        AData.Next;
      end;
    end;

    Add(GENERAL_TEXT_SINGLE_LINE + PO_AS_TEXT_SHORT_SINGLE_LINE);
    Add(PO_AS_TEXT_TOTAL_COLIE +
        StrPadLeft(FormatFloat('#,##0.0', _total_qty), PO_AS_INT_JANGKAUAN_COLIE, ' ') +
        PO_AS_TEXT_GRAND_TOTAL +
        StrPadLeft(FormatFloat('#,##0.00', _grand_total), PO_AS_INT_JANGKAUAN_GRAND_TOTAL, ' '));
    Add(GENERAL_TEXT_DOUBLE_LINE + PO_AS_TEXT_SHORT_DOUBLE_LINE);
  end;


  frmDialogPrintKasirPreview.Free;
end;
}

procedure TfrmPOFromAssgros.edtPOTraderNoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
  begin
    if (edtPOTraderNo.Text = '') then Exit;
    ParseTraderPO(edtPOTraderNo.Text);
    ShowPODetilByPONo(edtPOTraderNo.Text);
  end
  else if (Key = VK_F5 ) then
  begin
    ShowDialogSearchPo;
  end;   

  if (Key = VK_ESCAPE) then
    dtTgl.SetFocus;
    
end;

procedure TfrmPOFromAssgros.edtPOTraderNoChange(Sender: TObject);
begin
  inherited;
  NomorPO := edtPOTraderNo.Text;
end;

procedure TfrmPOFromAssgros.ShowDialogSearchPo;
begin
      if not Assigned(frmDialogSearchPO) then
        frmDialogSearchPO := TfrmDialogSearchPO.Create(Self);
      frmDialogSearchPO.Modul := tmPOAssGross;

      SetFormPropertyAndShowDialog(frmDialogSearchPO);
  
      if frmDialogSearchPO.IsProcessSuccessfull = true then
      begin
        ParseDataGrid;
  
        with frmDialogSearchPO do
        begin
          POAsGrossData.First;
          Self.dtTgl.Date := POAsGrossData.FieldByName('POAS_DATE').AsDateTime;
          Self.cbpPOTraderNo.Text := POAsGrossData.FieldByName('POAS_NO').AsString;
          Self.edtPOTraderNo.Text := POAsGrossData.FieldByName('POAS_NO').AsString;
          Self.edtTraderCode.Text := POAsGrossData.FieldByName('TRD_CODE').AsString;
          Self.edtTraderName.Text := POAsGrossData.FieldByName('TRD_NAME').AsString;
          if (POAsGrossData.FieldByName('TRD_IS_ASSGROS').AsInteger = 1) then
            Self.edtTraderType.Text := 'ASSGROS'
          else
            Self.edtTraderType.Text := 'TRADER';
  
          //Self.edtTraderType.Text := POAsGrossData.FieldByName('TRD_IS_ASSGROS').AsString;
          Self.edtStatus.Text := POAsGrossData.FieldByName('POAS_STATUS').AsString;
          Self.edtLeadTime.Text := POAsGrossData.FieldByName('POAS_LEAD_TIME').AsString;
          Self.edtTOP.Text := POAsGrossData.FieldByName('POAS_TOP').AsString;
          Self.curredtTotalPrice.Value := POAsGrossData.FieldByName('POAS_TOTAL').AsCurrency;
          ParseTraderPO(edtPOTraderNo.Text);
          ShowPODetilByPONo(edtPOTraderNo.Text);
  //        i := 1;
  //        while not POAsGrossData.Eof do
  //        begin
  //          dSellPriceAfterDisc := POAsGrossData.FieldByName('POASD_SELL_PRICE_DISC').AsFloat - POAsGrossData.FieldByName('POASD_DISC_MEMBER').AsFloat;
  //
  //          Self.strgGrid.Cells[0, i]               := IntToStr(i);
  //          Self.strgGrid.Cells[_KolKode, i]        := POAsGrossData.FieldByName('POASD_BRG_CODE').AsString;
  //          Self.strgGrid.Cells[_KolNama, i]        := POAsGrossData.FieldByName('BRG_NAME').AsString;
  //          Self.strgGrid.Cells[_KolUOM, i]         := POAsGrossData.FieldByName('POASD_SAT_CODE').AsString;
  //          Self.strgGrid.Cells[_KolBarcode, i]     := POAsGrossData.FieldByName('POASD_SAT_CODE').AsString;
  //          Self.strgGrid.Cells[_KolQTY, i]         := FloatToStr(POAsGrossData.FieldByName('POASD_QTY').AsFloat);
  //          Self.strgGrid.Cells[_KolHarga, i]       := FloatToStr(dSellPriceAfterDisc);
  //          Self.strgGrid.Cells[_KolPPN, i]         := CurrToStr(dSellPriceAfterDisc * ((POAsGrossData.FieldByName('POASD_PPN').AsCurrency + POAsGrossData.FieldByName('POASD_PPNBM').AsCurrency)/100));
  //          Self.strgGrid.Cells[_KolSubTotal, i]  := CurrToStr(POAsGrossData.FieldByName('POASD_TOTAL_PRICE').AsCurrency);
  //          POAsGrossData.Next;
  //
  //          if not POAsGrossData.Eof then Self.strgGrid.AddRow;
  //          inc(i);
  //        end;    // while
  {
          Self.edtContactPerson.Text := TraderData.FieldByName('TRD_CONTACT_PERSON').AsString;
          Self.edtDesc.Text := TraderData.FieldByName('TRD_DESCRIPTION').AsString;
          Self.edtTelp.Text := TraderData.FieldByName('TRD_TELP').AsString;
          Self.edtFax.Text := TraderData.FieldByName('TRD_FAX').AsString;
          Self.edtNPWP.Text := TraderData.FieldByName('TRD_NPWP').AsString;
  }
        end;
        strgGrid.AutoSizeColumns(True, 5);
      end;
  
      frmDialogSearchPO.Free;
end;

procedure TfrmPOFromAssgros.strgGridGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  inherited;
  HAlign := taLeftJustify;

  if ARow = 0 then
    HAlign := taCenter
  else
  begin
    if ACol in [_KolHarga, _KolDiscMember, _KolQTY, _KolSubTotal] then
      HAlign := taRightJustify;
  end;

end;

procedure TfrmPOFromAssgros.TraderPrint;
var
  sSQL  : string;
begin
  sSQL  := 'SELECT '+ GetCompanyHeader(FLoginFullname,MasterNewunit.Nama,
                                        cGetServerTime, cGetServerTime)
        + ' t.TRD_CODE, t.TRD_NAME, t.TRD_ADDRESS, PA.POAS_NO, POAS_DELIVER_DATE,'
        + ' PA.POAS_DISC,'
        + ' PA.POAS_PPN, PA.POAS_PPNBM, PA.POAS_DISC_MEMBER, PA.POAS_TOTAL,'
        + ' PA.POAS_DELIVER_DATE, PA.POAS_VALID_DATE, PA.POAS_DESCRIPTION,'
        + ' PA.POAS_STATUS, PA.POAS_TRD_ID, PA.POAS_TRD_UNT_ID,'
        + ' PA.POAS_LEAD_TIME, PA.POAS_TOP, PA.POAS_SUBTOTAL, PA.POAS_DATE,'
        + ' PAD.POASD_BRG_CODE, b.BRG_ALIAS, b.BRG_MERK,'
        + ' PAD.POASD_SAT_CODE, PAD.POASD_COGS,'
        + ' PAD.POASD_LAST_COST, PAD.POASD_SELL_PRICE, PAD.POASD_DISC,'
        + ' PAD.POASD_SELL_PRICE_DISC, PAD.POASD_QTY, PAD.POASD_PPN, '
        + ' PAD.POASD_PPNBM, PAD.POASD_TOTAL_PRICE, PAD.POASD_DISC_MEMBER,'
        + ' PAD.POASD_SO_NO, PAD.POASD_SO_UNT_ID, PAD.POASD_IS_ORDERED'
        + ' FROM PO_ASSGROS PA, PO_ASSGROS_DETIL PAD, BARANG b, TRADER T'
        + ' WHERE (PAD.POASD_POAS_NO = PA.POAS_NO)'
        + ' AND (PAD.POASD_POAS_UNT_ID = PA.POAS_UNT_ID)'
        + ' and (b.BRG_CODE = pad.POASD_BRG_CODE)'
        + ' and (T.TRD_ID = pa.POAS_TRD_ID )'
        + ' and (t.TRD_UNT_ID = pa.POAS_TRD_UNT_ID)'
        + ' and (PA.POAS_NO = '+ Quot(edtPOTraderNo.Text) +')'
        + ' AND (PA.POAS_UNT_ID = '+ IntToStr(masternewunit.id) +')'
        + ' ORDER BY t.TRD_CODE, PA.POAS_NO';

  dmReportNew.EksekusiReport('frcetakPoAsgross', sSQL,'',True);
end;

procedure TfrmPOFromAssgros.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  inherited;
  if(Key = Ord('C')) and (ssctrl in Shift) then
    actAddPOFromAssgrosExecute(Self)
  else if(Key = Ord('E')) and (ssctrl in Shift) then
    actEditPOFromAssgrosExecute(Self)
  else if(Key = VK_Escape) and (ssctrl in Shift) then
    Close
  else if(Key = Ord('P')) and (ssctrl in Shift) then
    fraFooter5Button1btnUpdateClick(Self)
  else if (Key = VK_F5) and (ssctrl in Shift) then  //Edit SO
    actRefreshPOFromAssgrosExecute(Self)
//  else if (Key = Ord('C')) and (ssctrl in Shift) then  //New
//    fraFooter5Button1btnUpdateClick(sender);
end;

end.



