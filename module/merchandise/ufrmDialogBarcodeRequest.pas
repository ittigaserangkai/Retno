unit ufrmDialogBarcodeRequest;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms,
  ufrmMasterDialogBrowse, StdCtrls, ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  Vcl.Menus, cxLabel, Vcl.ComCtrls, dxCore, cxDateUtils, cxButtonEdit,
  cxButtons, cxCurrencyEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  System.Actions, Vcl.ActnList, ufraFooterDialog3Button, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, uAppUtils, uDMClient;

type
  TProcessType = (ptAdd, ptEdit, ptNone);
  TfrmDialogBarcodeRequest = class(TfrmMasterDialogBrowse)
    Panel1: TPanel;
    lbl1: TLabel;
    lbl3: TLabel;
    lbl6: TLabel;
    edtSupplierName: TEdit;
    edtBarNo: TEdit;
    Label2: TLabel;
    dtTgl: TcxDateEdit;
    edbSupplierCode: TcxButtonEdit;
    curredtUnitPrice: TcxCurrencyEdit;
    cxGridColKode: TcxGridDBColumn;
    cxGridColNama: TcxGridDBColumn;
    cxGridColUOM: TcxGridDBColumn;
    cxGridColQty: TcxGridDBColumn;
    cxGridColHarga: TcxGridDBColumn;
    cxGridColTotal: TcxGridDBColumn;
    cxGridColBarcode: TcxGridDBColumn;
    grpPurchaseOrder: TGroupBox;
    lbl7: TLabel;
    lbl8: TLabel;
    edtDatePO: TcxDateEdit;
    edPO: TcxButtonEdit;
    procedure actDeleteExecute(Sender: TObject);
    procedure btnAddRowClick(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure IntEdtQtyExit(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridRowChanging(Sender: TObject; OldRow, NewRow: Integer;
      var Allow: Boolean);
    procedure lblDeleteClick(Sender: TObject);
    procedure strgGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure edbSupplierCodeButtonClick(Sender: TObject);
    procedure edbSupplierCodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edbProductCodeButtonClick(Sender: TObject);
    procedure edbProductCodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure footerDialogMasterbtnCloseClick(Sender: TObject);
    procedure IntEdtQtyKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edbUOMButtonClick(Sender: TObject);
    procedure edbProductCodeExit(Sender: TObject);
    procedure edbSupplierCodeExit(Sender: TObject);
    procedure edbSupplierCodeKeyPress(Sender: TObject; var Key: Char);
    procedure edbProductCodeKeyPress(Sender: TObject; var Key: Char);
    procedure edtBarNoKeyPress(Sender: TObject; var Key: Char);
    procedure dtTglKeyPress(Sender: TObject; var Key: Char);
    procedure cbUOMKeyPress(Sender: TObject; var Key: Char);
    procedure IntEdtQtyKeyPress(Sender: TObject; var Key: Char);
    procedure bSearchPOClick(Sender: TObject);
    procedure edtPONoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FBarcodeList : TStringList;
    FProcessType : TProcessType;
    procedure ClearAtributPLU;
//    procedure PrintReport;
    procedure GetBarcodeRequest;
    procedure GetDetilBarcodeRequest;
    procedure RefreshDetilNo;
    function FindOnGrid(aProductCode: String; aUOM:String): Boolean;
    procedure ParseHeader;
    procedure SetProcessType(const Value: TProcessType);
  public
    RowID : Integer;
    procedure FillComboUOM(aBrgCode : String ;  aUnitID : Integer);
    function GenerateNoBarcodeRequest: string;
    function GetGeneratorName: string;
    procedure LoadDataPOToForm(aPONo : string);
    function SaveDataBarcodeRequest: Boolean;
    { Public declarations }
  published
    property Process: TProcessType read FProcessType write SetProcessType;
  end;

var
  frmDialogBarcodeRequest: TfrmDialogBarcodeRequest;
  IsSuccessfull : Boolean;


implementation

uses  
  
  uTSCommonDlg, uRetnoUnit;

{$R *.dfm}
const
{
NO
PLU
PRODUCT NAME
QTY LABEL
UNIT PRICE
TOTAL PRICE
UOM
}
  _KolNo      : Integer = 0;
  _KolKode    : Integer = 1;
  _KolNama    : Integer = 2;
  _KolQTY     : Integer = 3;
  _KolPrice   : Integer = 4;
  _KolTotal   : Integer = 5;
  _KolStatus  : Integer = 7;
  _kolUOM     : Integer = 6;
  _RowCount   : Integer = 2;
  _ColCount   : Integer = 7;

procedure TfrmDialogBarcodeRequest.actDeleteExecute(Sender: TObject);
begin
  inherited;
  {
  if not IsValidDateKarenaEOD(masternewunit.id,cGetServerTime,FMasterIsStore) then
    Exit;

  if CommonDlg.Confirm('Are you wish to delete barcode request ' + strgGrid.Cells[1, strgGrid.Row]) = mrYes then
  begin
    FBarcodeRequest := TBARCODEREQUEST.Create(nil);
    try
      if FBarcodeRequest.LoadByBAR_NO(strgGrid.Cells[1, strgGrid.Row], masternewunit.id) then
      begin
        if FBarcodeRequest.RemoveFromDB then
        begin
          cCommitTrans;
          FetchDataBarcodeRequest;
          CommonDlg.ShowConfirmSuccessfull(atDelete);
        end
        else
        begin
          cRollbackTrans;
          CommonDlg.ShowMessage('Gagal Hapus Barcode Request');
        end;
      end;

    finally
      cRollbackTrans;
      if FBarcodeRequest <> nil then FreeAndNil(FBarcodeRequest);
    end;

  end;
  }
end;

procedure TfrmDialogBarcodeRequest.btnAddRowClick(Sender: TObject);

  procedure AddNewDetil();
  begin
//    if edbProductCode.Text = '' then exit;
    {
    if strgGrid.Cells[_KolNo, strgGrid.RowCount - 1] <> '' then
      strgGrid.AddRow;

    curreditTotalPrice.Value  := curreditTotalPrice.Value + curredtTotal.Value;

    strgGrid.Cells[_KolNo, strgGrid.RowCount - 1]     := IntToStr(strgGrid.RowCount - 1) + '.';
    strgGrid.Cells[_KolKode, strgGrid.RowCount - 1]   := edbProductCode.Text;
    strgGrid.Cells[_KolNama, strgGrid.RowCount - 1]   := edtProductName.Text;
    strgGrid.Cells[_KolQTY, strgGrid.RowCount - 1]    := FloatToStr(IntEdtQty.Value);
    strgGrid.Cells[_KolPrice, strgGrid.RowCount - 1]  := CurrToStr(curredtUnitPrice.Value);
    strgGrid.Cells[_KolTotal, strgGrid.RowCount - 1]  := CurrToStr(curredtTotal.Value);
    strgGrid.Cells[_KolStatus, strgGrid.RowCount - 1] := 'NEW';
    strgGrid.Cells[_kolUOM, strgGrid.RowCount - 1]    := Trim(cbUOM.Text) ;
    strgGrid.AutoSize := True;
    }
  end;

begin
//  if edbProductCode.Text ='' then
//  begin
//    CommonDlg.ShowError('Kode Product masih kosong !');
//    edbProductCode.SetFocus;
//    Exit;
//  end;
//
//  if edbSupplierCode.Text ='' then
//  begin
//    CommonDlg.ShowError('Kode Supplier masih kosong !');
//    edbSupplierCode.SetFocus;
//    Exit;
//  end;
//
//  if cbUOM.Text ='' then
//  begin
//    CommonDlg.ShowError('UOM belum dipilih !');
//    cbUOM.SetFocus;
//    Exit;
//  end;
//
//  if IntEdtQty.Value <= 0 then
//  begin
//    CommonDlg.ShowError('Qty Harus > 0. Tolong Dicek Lagi');
//    IntEdtQty.SetFocus;
//    Exit;
//  end;
  {
  if (not FindOnGrid(edbProductCode.Text, cbUOM.Text)) then
  begin
    if strgGrid.RowCount > 1 then
      AddNewDetil
  end else
  begin
    curreditTotalPrice.Value                 := (curreditTotalPrice.Value - StrToCurr(strgGrid.Cells[5, strgGrid.Row]) + curredtTotal.Value);
    strgGrid.Cells[_KolQTY, RowID]    := IntToStr(IntEdtQty.EditValue);
    strgGrid.Cells[_KolTotal, RowID]  := CurrToStr(curredtTotal.Value);
    strgGrid.Cells[_KolStatus, RowID] := 'UPDATE';  end;
  edbProductCode.Text := '';
  edbUOM.Text         := '';
  edtProductName.Text := '';
  IntEdtQty.Value     := 0;
  curredtTotal.Value  := 0;
  cbUOM.Items.Clear;
  edbProductCode.SetFocus;
  }
end;

procedure TfrmDialogBarcodeRequest.SetProcessType(
  const Value: TProcessType);
begin
  FProcessType := Value;
end;

procedure TfrmDialogBarcodeRequest.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin
  inherited;
  {
  if  not (Process = ptEdit) and not IsValidDateKarenaEOD(dialogunit,dtTgl.Date,FMasterIsStore) then
    Exit;

  try
    Self.Enabled  := False;
    IsSuccessfull := False;

    if ((strgGrid.RowCount = 2) and (strgGrid.Cells[0, strgGrid.RowCount - 1] = '')) then
    begin
      CommonDlg.ShowMessage('Product Belum Dipilih');
      Exit;
    end;

    IsSuccessfull := SaveDataBarcodeRequest;

    if IsSuccessfull then
    begin
      if CommonDlg.Confirm('Anda Akan Mencetak Slip Barcode Request ?') = mrYes then
         DoSlipBarcodeReq(edtBarNo.Text,dialogunit,FLoginFullname,FDialogUnitName);
    end;

  finally
    Self.Enabled := True;
    if IsSuccessfull then Close;
  end;
  }
end;


procedure TfrmDialogBarcodeRequest.FormShow(Sender: TObject);
var
  iTemp: Double;
begin
  inherited;
  iTemp := TRetno.SettingApp.PRICE_BARCODE_REQ;
  if iTemp <= 0 then
  begin
     TAppUtils.Warning('Harga default per unit Barcode belum didaftarkan dalam Setting Application'+#13#10
                           + 'Menggunakan nilai default = Rp.100,-');
     iTemp := 100;
  end;

//    curredtUnitPrice.Value    := iTemp;
//    IntEdtQty.Value           := 0;
//    curredtTotal.Value        := 0;
//    dtTgl.Date                := now;
//    curreditTotalPrice.Value  := 0;
//    if Process = ptEdit then
//    begin
//      GetBarcodeRequest;
//      GetDetilBarcodeRequest;
//      edbSupplierCode.Properties.ReadOnly := True;
//      edtSupplierName.ReadOnly:= True;
//      edbProductCode.SetFocus;
//    end else
//    if Process = ptAdd then
//      edtBarNo.Text :=  GenerateNoBarcodeRequest;
end;

procedure TfrmDialogBarcodeRequest.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  action := caFree;
end;

procedure TfrmDialogBarcodeRequest.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogBarcodeRequest := nil;
end;

function TfrmDialogBarcodeRequest.FindOnGrid(aProductCode: String;
    aUOM:String): Boolean;
var
  sCellUOM: string;
  sCellKode: string;
  iRowCount: Integer;
  iInitRow: Integer;
  i: Integer;
begin
  Result := False;
  if (aProductCode <> '') and (aUOM <> '') then
  begin
    {
    iInitRow  := strgGrid.FixedRows;
    iRowCount := strgGrid.RowCount;
    for i := iInitRow to iRowCount - 1 do
    begin
      result := False;
      sCellKode := strgGrid.Cells[_KolKode,i];
      sCellUOM  := strgGrid.Cells[_kolUOM,i];
      if (scellKode = aProductCode) and
         (scelluom = auom) then
      begin
        Result := True;
        RowID  := i;
        Exit;
      end;
    end;
    }
  end;
end;

procedure TfrmDialogBarcodeRequest.IntEdtQtyExit(Sender: TObject);
begin
//  curredtTotal.Value := curredtUnitPrice.Value * IntEdtQty.Value;
end;

procedure TfrmDialogBarcodeRequest.GetBarcodeRequest;
var
  s: string;
begin
  s := 'SELECT DISTINCT a.*, b.SUP_CODE, b.SUP_NAME, a.BAR_TOTAL_PRICE'
     + ' FROM BARCODE_REQUEST a'
     + ' LEFT JOIN SUPLIER b ON a.BAR_SUP_CODE = b.SUP_CODE'
     + ' AND a.BAR_SUP_UNT_ID = b.SUP_UNT_ID'
     + ' LEFT JOIN BARCODE_REQUEST_DETIL c ON a.BAR_NO = c.BARD_BAR_NO'
     + ' AND a.BAR_UNT_ID = c.BARD_BAR_UNT_ID'
     + ' WHERE a.BAR_NO = ' + QuotedStr(edtBarNo.Text)
     + ' AND a.BAR_UNT_ID = ' + IntToStr(dialogunit)
     + ' ORDER BY a.BAR_NO, a.BAR_DATE, b.SUP_CODE, b.SUP_NAME';
  {
  with cOpenQuery(s) do
  begin
    try
      if not Eof then
      begin
        edbSupplierCode.Text      := FieldByName('SUP_CODE').AsString;
        edtSupplierName.Text      := FieldByName('SUP_NAME').AsString;
        curreditTotalPrice.Value  := FieldByName('BAR_TOTAL_PRICE').AsCurrency;
      end;

    finally
      Free;
    end;
  end;
  }
end;

procedure TfrmDialogBarcodeRequest.GetDetilBarcodeRequest;
var
  s: string;
  I: Integer;
begin
  s := 'SELECT b.*, c.BRG_NAME, c.BRG_MERK'
     + ' FROM BARCODE_REQUEST a'
     + ' LEFT JOIN BARCODE_REQUEST_DETIL b ON a.BAR_NO = b.BARD_BAR_NO'
     + ' AND a.BAR_UNT_ID = b.BARD_BAR_UNT_ID'
     + ' LEFT JOIN BARANG c ON b.BARD_BRG_CODE = c.BRG_CODE'
     + ' AND b.BARD_BRG_UNT_ID = c.BRG_UNT_ID'
     + ' WHERE a.BAR_NO = ' + QuotedStr(edtBarNo.Text)
     + ' AND b.BARD_BRG_UNT_ID = ' + IntToStr(dialogunit)
     + ' ORDER BY b.BARD_BRG_CODE';
  {
  with copenquery(s, False) do
  begin
    Try
      I := 1;
      Last;
      First;
      strgGrid.RowCount := RecordCount + I;
      while not eof do
      begin
        strgGrid.Cells[_KolNo, I]     := IntToStr(I) + '.';
        strgGrid.Cells[_KolKode, I]   := FieldByName('BARD_BRG_CODE').AsString;
        strgGrid.Cells[_KolNama, I]   := FieldByName('BRG_NAME').AsString +
                                         FieldByName('BRG_MERK').AsString;
        strgGrid.Cells[_KolQTY, I]    := FieldByName('BARD_QTY').AsString;
        strgGrid.Cells[_KolPrice, I]  := FieldByName('BARD_SAT_PRICE').AsString;
        strgGrid.Cells[_KolTotal, I]  := FieldByName('BARD_TOTAL_PRICE').AsString;
        strgGrid.Cells[_kolUOM, I]  := FieldByName('BARD_UOM').AsString;
        strgGrid.Cells[_KolStatus, I] := 'OLD';
        Inc(I);

        Next;
      end;
      strgGrid.AutoSize:= True;
    Finally
      Free;
    End
  end;
  }
end;

procedure TfrmDialogBarcodeRequest.FormKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = Ord('R')) and (ssCtrl in Shift) then
    lblDeleteClick(Self)

end;

procedure TfrmDialogBarcodeRequest.RefreshDetilNo;
var
  I: Integer;
begin
  {
  if strgGrid.Cells[1, 1] <> '' then
    for I := 1 to strgGrid.RowCount-1 do
      strgGrid.Cells[0, I] := IntToStr(I) + '.';
      }
end;

procedure TfrmDialogBarcodeRequest.strgGridRowChanging(Sender: TObject;
  OldRow, NewRow: Integer; var Allow: Boolean);
begin
  inherited;
  if Process = ptEdit then
  begin
    {
    Allow:= True;
    edbProductCode.Text := strgGrid.Cells[1, NewRow];

    FillComboUOM(edbProductCode.Text,dialogunit);
    cbUOM.ItemIndex := cbUOM.Items.IndexOf(strgGrid.Cells[6, NewRow]);

    edtProductName.Text := strgGrid.Cells[2, NewRow];
    IntEdtQty.Value     := StrToInt(strgGrid.Cells[3, NewRow]);
    curredtTotal.Value  := StrToCurr(strgGrid.Cells[5, NewRow]);
    btnAddRow.Caption   := 'Update';
    }
  end;
end;

procedure TfrmDialogBarcodeRequest.lblDeleteClick(Sender: TObject);
var
  AValue : Double;
begin
  inherited;
  {
  if (strgGrid.Cells[1, strgGrid.Row] <> '') then
  begin
    if CommonDlg.Confirm('Anda Yakin Akan Menghapus Data') = mrNo then
      Exit
    else
    begin
      AValue := strgGrid.Floats[5, strgGrid.Row];

      if strgGrid.RowCount = 2 then
      begin
        strgGrid.Cells[_KolKode, strgGrid.Row] := '';
        HapusBarisKosong(strgGrid, _KolKode);
      end
      else strgGrid.RemoveRows(strgGrid.Row, 1);

      curreditTotalPrice.Value := curreditTotalPrice.Value - AValue;
      RefreshDetilNo;
    end;
  end;
  }
end;

procedure TfrmDialogBarcodeRequest.strgGridSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  {if strgGrid.Cells[1, Arow] <> '' then
  begin
    edbProductCode.Text := strgGrid.Cells[1, Arow];
    edtProductName.Text := strgGrid.Cells[2, Arow];

    FillComboUOM(edbProductCode.Text,dialogunit);
    cbUOM.ItemIndex := cbUOM.Items.IndexOf(strgGrid.Cells[6, Arow]);
    
    IntEdtQty.Value     := StrToInt(strgGrid.Cells[3, Arow]);
    curredtTotal.Value  := StrToCurr(strgGrid.Cells[5, Arow]);
    btnAddRow.Caption   := 'Update';
  end;
  }
end;

procedure TfrmDialogBarcodeRequest.FormCreate(Sender: TObject);
begin
  inherited;
  FBarcodeList := TStringList.Create;
end;

procedure TfrmDialogBarcodeRequest.edbSupplierCodeButtonClick(
  Sender: TObject);
var
  s: string;
begin
  inherited;
  if Process = ptEdit then
    Exit;

  s := 'SELECT SUP_CODE as KODESUPLIER, SUP_NAME as NAMASUPLIER, SUP_ADDRESS as ALAMATSUPLIER'
     + ' FROM SUPLIER'
     + ' WHERE SUP_UNT_ID = ' + IntToStr(dialogunit);
  {
  with clookup('Daftar Supplier', s) do
   begin
     Try
       if Strings[0] = '' then Exit;
       ClearAtributPLU;
       ParseHeader;
       edbSupplierCode.Text := Strings[0];
       edtSupplierName.Text := Strings[1];
       curredtUnitPrice.SetFocus;

     Finally
       Free;
     End;
   end;
   }
end;

procedure TfrmDialogBarcodeRequest.edbSupplierCodeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key = VK_F5) Or (key = VK_DOWN) then
  begin
    edbSupplierCodeButtonClick(Self);
  end;
//  Key := UpCase(Ord(Key));

end;

procedure TfrmDialogBarcodeRequest.edbProductCodeButtonClick(
  Sender: TObject);
var
  sSQL: String;
begin
  inherited;

  if edbSupplierCode.Text = '' then
  begin
    CommonDlg.ShowMessage('Supliernya belum dipilih');
    Exit;
  end;

  sSQL := 'select b.Brg_Code, b.Brg_Alias '
      + ' from barang_suplier a, barang  b '
      + ' where a.brgsup_brg_code = b.brg_code '
      + ' and a.brgsup_brg_unt_id = b.brg_unt_id '
      + ' and a.brgsup_sup_code = ' + QuotedStr(edbSupplierCode.Text)
      + ' and a.brgsup_brg_unt_id = ' + IntToStr(dialogunit) ;
  {
  with clookup('Daftar Product', sSQL) do
   begin
     Try
       if Strings[0] = '' then Exit;
       edbProductCode.Text := Strings[0];
       edtProductName.Text:= Strings[1];

       if FindOnGrid(edbProductCode.Text,cbUOM.Text) then
         btnAddRow.Caption:= 'Update'
       else btnAddRow.Caption:= 'Add';

       cbUOM.SetFocus;

     Finally
       Free;
     End;
   end;
   }
end;

procedure TfrmDialogBarcodeRequest.edbProductCodeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if(key = VK_F5) Or (key = VK_DOWN) then edbProductCodeButtonClick(Self);
end;

function TfrmDialogBarcodeRequest.GetGeneratorName: string;
begin
  Result := 'GEN_BARCODE_REQ';
end;

function TfrmDialogBarcodeRequest.SaveDataBarcodeRequest: Boolean;
var
  i: Integer;
  sBarNo: string;
//  FBarcodeRequest: TBARCODEREQUEST;
begin
  Result := False;
  {
  FBarcodeRequest := TBARCODEREQUEST.Create(Self);
  try
    sBarNo := '';
    if FBarcodeRequest.LoadByBAR_NO(edtBarNo.Text, dialogunit)
      then sBarNo := FBarcodeRequest.BAR_NO;

    if sBarNo = '' then
    begin
      sBarNo := GenerateNoBarcodeRequest;
      if sBarNo <> edtBarNo.Text then
      begin
        edtBarNo.Text := sBarNo;
      end;
      sBarNo := '';
    end;

    FBarcodeRequest.UpdateData(dtTgl.Date,
                               edtBarNo.Text,
                               edbSupplierCode.Text,
                               dialogunit,
                               curreditTotalPrice.Value,
                               dialogunit);

    FBarcodeRequest.BARCODEREQUESTDETILS.Clear;
    for i := strgGrid.FixedRows to strgGrid.RowCount - 1 do
    begin
      FBarcodeRequest.UpdateBARCODEREQUESTDETILS(edtBarNo.Text,
                                                 dialogunit,
                                                 strgGrid.Cells[_KolKode, i],
                                                 dialogunit,
                                                 0,
                                                 strgGrid.Ints[_KolQTY, i],
                                                 strgGrid.Floats[_KolPrice, i],
                                                 strgGrid.Floats[_KolTotal, i],
                                                 dialogunit,
                                                 strgGrid.Cells[_kolUOM,i],
                                                 dialogunit
                                                 );
    end;

    if not FBarcodeRequest.SaveToDB(sBarNo) then
    begin
      cRollbackTrans;
      Exit;
    end;

    cCommitTrans;
    Result := True;

  finally
    cRollbackTrans;
    FreeAndNil(FBarcodeRequest);
  end;
  }
end;

procedure TfrmDialogBarcodeRequest.footerDialogMasterbtnCloseClick(
  Sender: TObject);
begin
  IsSuccessfull := False;
  Close;
  inherited;
end;

function TfrmDialogBarcodeRequest.GenerateNoBarcodeRequest: string;
var
  iCounter: Integer;
  //s: string;
begin
  // TODO -cMM: TfrmDialogBarcodeRequest.GenerateNoBarcodeRequest default body inserted
//  iCounter := GetCounterNoBukti('BARCODE_REQUEST', 'BAR_NO', 'BAR_DATE', dtTgl.Date, 'BAR_UNT_ID', dialogunit, 'BR');
//  Result := 'BR/' + FormatDateTime('YY', dtTgl.Date) + '/' + StrPadLeft(IntToStr(iCounter), _DigitNoBukti, '0');
end;

procedure TfrmDialogBarcodeRequest.IntEdtQtyKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = vk_return then
  begin
//    curredtTotal.Value := IntEdtQty.Value * curredtUnitPrice.Value;
//    btnAddRow.SetFocus;
  end;
end;

procedure TfrmDialogBarcodeRequest.edbUOMButtonClick(Sender: TObject);
//var
//  sSQL: String;
begin
  inherited;
//  sSQL := 'select a.konvsat_sat_code_from as "Kode Satuan"'
//         + ' from ref$konversi_satuan a'
//         + ' where a.konvsat_scf_unt_id = ' + IntToStr(dialogunit)
//         + ' and a.konvsat_brg_code = ' + QuotedStr(edbProductCode.Text);
  {

  with clookup('Daftar UOM', sSQL) do
   begin
     Try
       if Strings[0] = '' then Exit;
       edbUOM.Text := Strings[0];

       edbUOM.SetFocus;

     Finally
       Free;
     End;
   end;
   }
end;

procedure TfrmDialogBarcodeRequest.edbProductCodeExit(Sender: TObject);
//var
//  sSQL: String;
begin
  inherited;
//  sSQL := 'select b.Brg_Code, b.Brg_Alias '
//      + ' from barang_suplier a, barang  b '
//      + ' where a.brgsup_brg_code = b.brg_code '
//      + ' and a.brgsup_brg_unt_id = b.brg_unt_id '
//      + ' and a.brgsup_sup_code = ' + QuotedStr(edbSupplierCode.Text)
//      + ' and a.brgsup_brg_unt_id = ' + IntToStr(dialogunit)
//      + ' and b.brg_code = ' + QuotedStr(edbProductCode.Text) ;
  {
  with cOpenQuery(sSQL) do
  Begin
    Try
      if Fields[0].AsString = '' then
      Begin
        edbProductCode.Text := '';
        edtProductName.Text := 'Kode Barang Salah !';
        Exit;
      End Else
      Begin
        edbProductCode.Text := Fields[0].Text;
        edtProductName.Text := Fields[1].AsString;
        FillComboUOM(edbProductCode.Text,dialogunit);

        if cbUOM.Items.Count > 0 then
          cbUOM.ItemIndex := 0;
      End;
    Finally
      Free;
    End;
  End;
  }
end;

procedure TfrmDialogBarcodeRequest.FillComboUOM(aBrgCode : String ;  aUnitID :
    Integer);
//var
//  sSQL: String;
begin
//  sSQL := 'select a.konvsat_sat_code_from as "Kode Satuan"'
//         + ' from ref$konversi_satuan a'
//         + ' where a.konvsat_scf_unt_id = ' + IntToStr(dialogunit)
//         + ' and a.konvsat_brg_code = ' + QuotedStr(edbProductCode.Text);
  {
  with cOpenQuery(sSQL) do
   begin
     Try

       if Fields[0].AsString = '' then
       Begin
         Exit;
       End;
       cbUOM.Clear;
       while not Eof do
       Begin
         cbUOM.Items.Add(Fields[0].AsString);
         Next;
       end;

     Finally
       Free;
     End;
   end;
    }
end;

procedure TfrmDialogBarcodeRequest.edbSupplierCodeExit(Sender: TObject);
var
  sSQL: String;
begin
  inherited;

  sSQL := 'SELECT SUP_NAME'
     + ' FROM SUPLIER'
     + ' WHERE SUP_UNT_ID = ' + IntToStr(dialogunit)
     + ' and sup_code=' + QuotedStr(edbSupplierCode.Text);
 {
  with cOpenQuery(sSQL) do
   begin
     Try
       if Fields[0].AsString = '' then
       Begin
       edbSupplierCode.Text := '';
       edtSupplierName.Text := 'Kode Supplier Salah !';
       Exit;
       End Else
       Begin
       edtSupplierName.Text := Fields[0].AsString;
       edbProductCode.SetFocus;
       End;
     Finally
       Free;
     End;
   end;
   }
end;

procedure TfrmDialogBarcodeRequest.edbSupplierCodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  Begin
    Perform(WM_NEXTDLGCTL,0,0);
    Key := #0;
  End;
  Key := UpCase(Key);
end;

procedure TfrmDialogBarcodeRequest.edbProductCodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  Begin
    Perform(WM_NEXTDLGCTL,0,0);
    Key := #0;
  End;
  Key := UpCase(Key);
end;

procedure TfrmDialogBarcodeRequest.edtBarNoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  Begin
    Perform(WM_NEXTDLGCTL,0,0);
    Key := #0;
  End;
end;

procedure TfrmDialogBarcodeRequest.dtTglKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  Begin
    Perform(WM_NEXTDLGCTL,0,0);
    Key := #0;
  End;
end;

procedure TfrmDialogBarcodeRequest.cbUOMKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  Begin
    Perform(WM_NEXTDLGCTL,0,0);
    Key := #0;
  End;
end;

procedure TfrmDialogBarcodeRequest.IntEdtQtyKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  Begin
    Perform(WM_NEXTDLGCTL,0,0);
    Key := #0;
  End;
end;

procedure TfrmDialogBarcodeRequest.ClearAtributPLU;
begin
//  edbProductCode.Clear;
//  edtProductName.Clear;
//  cbUOM.Clear;
//  IntEdtQty.Clear;
//  curredtTotal.Clear;
end;

procedure TfrmDialogBarcodeRequest.ParseHeader;
begin
  {with strgGrid do
  begin
    Clear;
    RowCount  := _RowCount;
    ColCount  := _ColCount;

    Cells[_KolNo, 0]    := 'NO';
    Cells[_KolKode, 0]  := 'PLU';
    Cells[_KolNama, 0]  := 'PRODUCT NAME';
    Cells[_KolQTY, 0]   := 'QTY LABEL';
    Cells[_KolPrice, 0] := 'UNIT PRICE';
    Cells[_KolTotal, 0] := 'TOTAL PRICE';
    Cells[_kolUOM, 0]   := 'UOM';
  end;
  }
end;

procedure TfrmDialogBarcodeRequest.bSearchPOClick(Sender: TObject);
var
  sSQL: string;
begin
  if edbSupplierCode.Text = ''  then
  begin
     CommonDlg.ShowMessage('Kode suplier belum di isi ');
     Exit;
  end;

//  lblStatusPO.Caption := '';
//  lblStatusPO.Tag     := 0;
  sSQL := ' select a.po_no as"NO PO", a.PO_date as "TGL PO", d.merchan_name AS "MERCHANDISE",f.stapo_name AS "STATUS",'
          + ' e.sup_code AS "KODE SUPLIER", e.sup_name AS "NAMA SUPLIER" '
          + ' from PO a, suplier_merchan_grup b, ref$merchandise_grup c, '
          + ' ref$merchandise d, suplier e, ref$Status_po f '
          + ' where a.IS_PO_BONUS = 0 and b.supmg_sub_code = a.po_supmg_sub_code '
          + ' and b.supmg_unt_id = a.po_supmg_unt_id '
          + ' and c.merchangrup_id = b.supmg_merchangrup_id '
          + ' and c.merchangrup_unt_id = b.supmg_unt_id '
          + ' and d.merchan_id = c.merchangrup_merchan_id '
          + ' and d.merchan_unt_id = c.merchangrup_merchan_unt_id '
          + ' and e.sup_code = b.supmg_code '
          + ' and e.sup_unt_id = b.supmg_unt_id '
          + ' and f.stapo_id = a.po_stapo_id '
          + ' and f.stapo_unt_id = a.po_stapo_unt_id '
          + ' and a.po_stapo_id in (5)';
  if (edbSupplierCode.Text<>'') then
    sSQL := sSQL + ' and e.sup_code = ' + QuotedStr(edbSupplierCode.Text);
  {
  with cLookUp('Daftar PO Yang Sudah Diterima',sSQL,200,1,True) do
  begin
    try
      edtPONo.Text := Strings[0];
      ClearAtributPLU;
      edtSupplierName.Text := Strings[5];
      curredtUnitPrice.SetFocus;
      LoadDataPOToForm(edtPONo.Text);
    finally
      Free;
    end;
  end;
  }
end;

procedure TfrmDialogBarcodeRequest.edtPONoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key=#13 then
  begin
//  	LoadDataPOToForm(edtPONo.Text);
  end else if(not(Key in['0'..'9',Chr(VK_BACK)]))then
    Key:=#0;
end;

procedure TfrmDialogBarcodeRequest.LoadDataPOToForm(aPONo : string);
var
//  FPO: TPO;
  i: Integer;
  dQty : Double;
begin
	{
  FPO := TPO.Create(Self);
  FPO.LoadByNoBukti(aPONo, dialogunit);

  edtPONo.Text := FPO.NoBukti;
  lblStatusPO.Caption := FPO.StatusPO.Nama;
  lblStatusPO.Tag     := FPO.StatusPO.ID;

  edtDatePO.Date := FPO.TglBukti;
  with strgGrid do
  begin
    // ini yg PO Biasa
    if FPO.POItems.Count > 0 then
    begin
      for i := 0 to FPO.POItems.Count - 1 do
      begin
        if strgGrid.Cells[_KolNo, strgGrid.RowCount - 1] <> '' then
          strgGrid.AddRow;
        Cells[_KolNo, strgGrid.RowCount - 1]     := IntToStr(i + 1);
        Cells[_KolKode, strgGrid.RowCount - 1]   := FPO.POItems[i].Barang.Kode;
        Cells[_KolNama, strgGrid.RowCount - 1]   := FPO.POItems[i].Barang.Alias;
        if FPO.StatusPO.ID = 5 then
        begin
          dQty := FPO.POItems[i].GetQtyReceive
        end else
          dQty := FPO.POItems[i].QtyOrder;

        Cells[_KolQTY, strgGrid.RowCount - 1]    := FloatToStr(dQty);
        Cells[_KolPrice, strgGrid.RowCount - 1]  := CurrToStr(curredtUnitPrice.Value);
        Cells[_KolTotal, strgGrid.RowCount - 1]  := CurrToStr(dQty * curredtUnitPrice.Value);
        Cells[_KolStatus, strgGrid.RowCount - 1] := 'NEW';
        Cells[_kolUOM, strgGrid.RowCount - 1]    := FPO.POItems[i].SatCodeOrder.UOM;
        curreditTotalPrice.Value := curreditTotalPrice.Value + dQty * curredtUnitPrice.Value;
      end;
    end;
    AutoSize := True;
  end;
  }
end;

procedure TfrmDialogBarcodeRequest.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if(Key = VK_F2) then
    bSearchPOClick(Sender)
end;

initialization
  IsSuccessfull := False;
  
end.






