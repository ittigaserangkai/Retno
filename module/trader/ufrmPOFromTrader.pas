unit ufrmPOFromTrader;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, ActnList, StdCtrls, ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC,
  cxCurrencyEdit, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
  System.Actions;

type
  TfrmPOFromTrader = class(TfrmMasterBrowse)
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    edtTraderCode: TEdit;
    edtTraderName: TEdit;
    dtTgl: TcxDateEdit;
    cbpPOTraderNo: TcxExtLookupComboBox;
    edtStatus: TEdit;
    edtLeadTime: TEdit;
    lbl8: TLabel;
    edtTOP: TEdit;
    lbl9: TLabel;
    lbl10: TLabel;
    curredtTotalPrice: TcxCurrencyEdit;
    lbl11: TLabel;
    edtTraderType: TEdit;
    edtPOTraderNo: TEdit;
    Label1: TLabel;
    procedure actAddExecute(Sender: TObject);
    procedure fraFooter5Button1btnAddClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure dtTglKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbpPOTraderNoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fraFooter5Button1btnRefreshClick(Sender: TObject);
    procedure fraFooter5Button1btnDeleteClick(Sender: TObject);
    procedure fraFooter5Button1btnUpdateClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbpPOTraderNoChange(Sender: TObject);
    procedure strgGridGetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
    procedure edtPOTraderNoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPOTraderNoChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FDataMember: TStringList;
    //FDataReport: TResultDataSet;
    FAlamatTrader: string;
    NomorPO: string;

    procedure ParseHeaderGrid();
    procedure ParseDataGrid();
    procedure ParseDataComboPOTraderNo();
    procedure ParseTraderPO(APONo: string);
    procedure ShowPODetilByPONo(APONo: string);
    procedure ClearForm();
    procedure ShowDialogSearchPo;
    procedure TraderPrint;
  public
    { Public declarations }
  end;

var
  frmPOFromTrader: TfrmPOFromTrader;

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

uses ufrmDialogPOFromTrader, uTSCommonDlg,
  ufrmSearchPO, ufrmDialogPrintKasirPreview;

{$R *.dfm}

procedure TfrmPOFromTrader.actAddExecute(Sender: TObject);
begin
  inherited;
  if not Assigned(frmDialogPOFromTrader) then
    Application.CreateForm(TfrmDialogPOFromTrader, frmDialogPOFromTrader);

  frmDialogPOFromTrader.Modul:= mPOFromTrader;
  frmDialogPOFromTrader.Caption := 'Add PO From Trader';
  frmDialogPOFromTrader.FormMode := fmAdd;
  SetFormPropertyAndShowDialog(frmDialogPOFromTrader);

  if (frmDialogPOFromTrader.IsProcessSuccessfull) then
  begin
    NomorPO := frmDialogPOFromTrader.NomorPO;
    edtPOTraderNo.Text := NomorPO;

    actRefreshExecute(Self);
    CommonDlg.ShowConfirmSuccessfull(atAdd);
    if (CommonDlg.Confirm('Apakah Anda Akan Mencetak Laporan') = mrYES) then
    begin
      fraFooter5Button1btnUpdateClick(Self);
    end;
    edtPOTraderNo.setFocus;
  end;

  frmDialogPOFromTrader.Free;
end;

procedure TfrmPOFromTrader.fraFooter5Button1btnAddClick(Sender: TObject);
begin
  inherited;
  actAddExecute(Self);
end;

procedure TfrmPOFromTrader.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmPOFromTrader.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'PO From Trader';
  ClearForm;
  dtTgl.Date := now;
  ParseDataComboPOTraderNo;
  ParseHeaderGrid;
end;

procedure TfrmPOFromTrader.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FDataMember);
end;
          
procedure TfrmPOFromTrader.actEditExecute(Sender: TObject);
begin
  inherited;
  if not Assigned(frmDialogPOFromTrader) then
    Application.CreateForm(TfrmDialogPOFromTrader, frmDialogPOFromTrader);

  frmDialogPOFromTrader.Caption := 'Edit PO From Trader';
  frmDialogPOFromTrader.edtPONo.Text := edtPOTraderNo.Text;

  frmDialogPOFromTrader.FormMode := fmEdit;
  SetFormPropertyAndShowDialog(frmDialogPOFromTrader);

  if (frmDialogPOFromTrader.IsProcessSuccessfull) then
  begin
    actRefreshExecute(Self);
    CommonDlg.ShowConfirmSuccessfull(atEdit);
    if (CommonDlg.Confirm('Cetak Laporan') = mrYES) then
    begin
      fraFooter5Button1btnUpdateClick(Self);
    end;
  end;

  frmDialogPOFromTrader.Free;
end;

procedure TfrmPOFromTrader.actPrintExecute(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmPOFromTrader.actRefreshExecute(Sender: TObject);
begin
  inherited;
  ClearForm;
  //ParseDataComboPOTraderNo;
  if (edtPOTraderNo.Text = '') then Exit;
  ParseTraderPO(edtPOTraderNo.Text);
  ShowPODetilByPONo(edtPOTraderNo.Text);
  edtPOTraderNo.setFocus;
//  strgGrid.ColWidths[_KolPPN] := 0;
end;

procedure TfrmPOFromTrader.ParseDataGrid;
begin
  ParseHeaderGrid;
//  cclearStringGrid(strgGrid, True);
//  strgGrid.AutoSizeColumns(True, 5);

end;

procedure TfrmPOFromTrader.ParseHeaderGrid;
begin
  {with strgGrid do
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
   }
end;

procedure TfrmPOFromTrader.ParseDataComboPOTraderNo;
var
//  aParams: TArr;
  data: TDataSet;
begin
  {with cbpPOTraderNo do
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
  }
end;

procedure TfrmPOFromTrader.dtTglKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    ParseDataComboPOTraderNo;
    edtPOTraderNo.SetFocus;
  end;
end;

procedure TfrmPOFromTrader.ClearForm;
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

procedure TfrmPOFromTrader.cbpPOTraderNoKeyUp(Sender: TObject;
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

//  if (Key = VK_DOWN) then
//    cbpPOTraderNo.Text := cbpPOTraderNo.Cells[1, cbpPOTraderNo.Row];

end;

procedure TfrmPOFromTrader.ParseTraderPO(APONo: string);
//var
//  data: TResultDataSet;
//  aParams: TArr;
begin
  {SetLength(aParams,1);
  aParams[0].tipe := ptString;
  aParams[0].data := APONo;
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
  }
end;

procedure TfrmPOFromTrader.ShowPODetilByPONo(APONo: string);
var
  i               : integer;
  cSellPriceDisc  : Currency;
begin
  ParseDataGrid;

  try

  finally

  end;

end;

procedure TfrmPOFromTrader.fraFooter5Button1btnRefreshClick(
  Sender: TObject);
begin
  actRefreshExecute(Self);
end;

procedure TfrmPOFromTrader.fraFooter5Button1btnDeleteClick(
  Sender: TObject);
begin
  if edtPOTraderNo.Text = '' then Exit;
  actEditExecute(Self);
end;

procedure TfrmPOFromTrader.fraFooter5Button1btnUpdateClick(
  Sender: TObject);
begin
//  inherited;
  if edtPOTraderNo.Text<>'' then
    TraderPrint;
end;

procedure TfrmPOFromTrader.FormShow(Sender: TObject);
begin
  inherited;
  NomorPO := '';
  FDataMember:= TStringList.Create;
end;

procedure TfrmPOFromTrader.cbpPOTraderNoChange(Sender: TObject);
begin
  inherited;
  //NomorPO := cbpPOTraderNo.Text;
end;

procedure TfrmPOFromTrader.strgGridGetFloatFormat(Sender: TObject; ACol,
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

end;

procedure TfrmPOFromTrader.edtPOTraderNoKeyUp(Sender: TObject;
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

procedure TfrmPOFromTrader.edtPOTraderNoChange(Sender: TObject);
begin
  inherited;
  NomorPO := edtPOTraderNo.Text;
end;

procedure TfrmPOFromTrader.ShowDialogSearchPo;
begin
      if not Assigned(frmDialogSearchPO) then
        frmDialogSearchPO := TfrmDialogSearchPO.Create(Self);
      frmDialogSearchPO.Modul := tmPOTrader;

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

        end;
//        strgGrid.AutoSizeColumns(True, 5);
      end;
  
      frmDialogSearchPO.Free;
end;

procedure TfrmPOFromTrader.TraderPrint;
var
  sSQL  : string;
begin
  sSQL  := 'SELECT '
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
        + ' and (PA.POAS_NO = '+ QuotedStr(edtPOTraderNo.Text) +')'
//        + ' AND (PA.POAS_UNT_ID = '+ IntToStr(masternewunit.id) +')'
        + ' ORDER BY t.TRD_CODE, PA.POAS_NO';

//  dmReportNew.EksekusiReport('frcetakPoAsgross', sSQL,'',True);
end;

procedure TfrmPOFromTrader.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  inherited;
  if(Key = Ord('C')) and (ssctrl in Shift) then
    actAddExecute(Self)
  else if(Key = Ord('E')) and (ssctrl in Shift) then
    actEditExecute(Self)
  else if(Key = VK_Escape) and (ssctrl in Shift) then
    Close
  else if(Key = Ord('P')) and (ssctrl in Shift) then
    actPrintExecute(Self)
  else if (Key = VK_F5) and (ssctrl in Shift) then  //Edit SO
    actRefreshExecute(Self)
end;

end.



