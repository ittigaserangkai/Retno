unit ufrmPemakaianBarcode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, Vcl.ActnList,
  System.Actions, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxCurrencyEdit,
  ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel, cxGridLevel, cxClasses, cxGridCustomView, cxGrid, cxPC;

type
  TfrmPemakaianBarcode = class(TfrmMasterBrowse)
    pnlTop: TPanel;
    lbl1: TLabel;
    dtBarcode: TcxDateEdit;
    lbl2: TLabel;
    cbbTipeSuplier: TComboBox;
    lbl3: TLabel;
    curredtHarga: TcxCurrencyEdit;
    lbl4: TLabel;
    edtDescription: TEdit;
    pnlBottom: TPanel;
    lbl5: TLabel;
    lbl6: TLabel;
    intedtTotalQty: TcxCurrencyEdit;
    curredtTotalPrice: TcxCurrencyEdit;
    lblDeleteRow: TLabel;
    lblAddRow: TLabel;
    cxcolGridViewColumn1: TcxGridDBColumn;
    cxcolGridViewColumn2: TcxGridDBColumn;
    cxcolGridViewColumn3: TcxGridDBColumn;
    cxcolGridViewColumn4: TcxGridDBColumn;
    cxcolGridViewColumn5: TcxGridDBColumn;
    cxcolGridViewColumn6: TcxGridDBColumn;
    btnSave: TcxButton;
    actDeletePemakaianBarcode: TAction;
    procedure actAddExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdMainCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actDeletePemakaianBarcodeExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure dtBarcodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbbTipeSuplierKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure curredtHargaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdMainCellValidate(Sender: TObject; ACol, ARow: Integer;
      var Value: String; var Valid: Boolean);
    procedure btnSaveClick(Sender: TObject);
    procedure lblAddRowClick(Sender: TObject);
    procedure lblDeleteRowClick(Sender: TObject);
    procedure grdMainGetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
    procedure curredtHargaEnter(Sender: TObject);
    procedure edtDescriptionKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure grdMainComboChange(Sender: TObject; ACol, ARow,
      AItemIndex: Integer; ASelection: String);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FIsProcessSuccessfull: Boolean;
    procedure ParseDataPotonganTagihanContrabonByDateAndType(ADate: TDateTime; AType: string);
//    procedure ClearComponent;
    procedure ParseDataSuplierByType(AType: string);
    procedure SetIsProcessSuccessfull(const Value: Boolean);
  public
    procedure RefreshData; override;
    property IsProcessSuccessfull: Boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmPemakaianBarcode: TfrmPemakaianBarcode;

implementation

uses  uConstanta, uTSCommonDlg, uRetnoUnit;

const
     _Kol_ID : Byte = 0;
     _Kol_SUPPLIER_CODE : Byte = 1;
     _Kol_SUPPLIER_NAME : Byte = 2;
     _Kol_QUANTITY : Byte = 3;
     _Kol_TOTAL_PRICE : Byte = 4;
     _Kol_No : Byte = 5;
     _Kol_StatPro : Byte = 6;

{$R *.dfm}

procedure TfrmPemakaianBarcode.actAddExecute(Sender: TObject);
begin
  inherited;
  dtBarcode.Date := Date;
  curredtHarga.Value := 35;

//  if MasterNewUnit.ID = 0 then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    Exit;
  end;

  if (dtBarcode.Text = '  -  -    ') or (dtBarcode.Date=0) then
  begin
    CommonDlg.ShowError('Barcode usage date is not specific');
    dtBarcode.SetFocus;
    Exit;
  end;

  if cbbTipeSuplier.ItemIndex = -1 then
  begin
    CommonDlg.ShowError('Supplier type is not selected');
    cbbTipeSuplier.SetFocus;
    Exit;
  end;

  if curredtHarga.Value = 0 then
  begin
    CommonDlg.ShowError('Barcode usage price is 0');
    curredtHarga.SetFocus;
    Exit;
  end;

  ParseDataSuplierByType(cbbTipeSuplier.Text);

//  grdMain.CellProperties[_Kol_SUPPLIER_CODE ,1].BrushColor:= clInfoBk;
//  grdMain.CellProperties[_Kol_SUPPLIER_NAME ,1].BrushColor:= clInfoBk;
//  grdMain.CellProperties[_Kol_TOTAL_PRICE ,1].BrushColor:= clInfoBk;
  edtDescription.SetFocus;
  btnSave.Enabled := True;
  fraFooter4Button1.btnAdd.Enabled := False;
  lblAddRow.Visible := True;
  lblDeleteRow.Visible := True;
end;

procedure TfrmPemakaianBarcode.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmPemakaianBarcode.grdMainCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  inherited;
  if ARow>0 then
  begin
    if ACol in [_Kol_ID, _Kol_SUPPLIER_CODE, _Kol_SUPPLIER_NAME, _Kol_TOTAL_PRICE] then
      CanEdit := True
    else
      CanEdit := False;
  end;
end;

procedure TfrmPemakaianBarcode.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  {if (Key = Ord('T')) and (ssctrl in Shift) then
  begin
    with grdMain do
    begin
        AddRow;
        //StatusProcess = 2
        cells[_Kol_StatPro, grdMain.RowCount-1] := '2';
        CellProperties[_Kol_SUPPLIER_CODE, grdMain.RowCount-1].BrushColor:= clInfoBk;
        CellProperties[_Kol_SUPPLIER_NAME, grdMain.RowCount-1].BrushColor:= clInfoBk;
        CellProperties[_Kol_TOTAL_PRICE, grdMain.RowCount-1].BrushColor:= clInfoBk;
        Col := 1;
        Row := RowCount-1;
    end;
  end
  else if (Key = Ord('R')) and (ssctrl in Shift) then
  begin
    if grdMain.RowCount > 2 then
      grdMain.RemoveSelectedRows
    else
      grdMain.ClearRows(1, grdMain.RowCount);
  end
  else }
  if (Key = VK_RETURN) and (ssctrl in Shift) then
  begin
    btnSaveClick(btnSave);
  end;
end;

procedure TfrmPemakaianBarcode.ParseDataSuplierByType(AType: string);
begin
  {if cbbKodeSuplier.Tag<>cbbTipeSuplier.ItemIndex then
  begin
      dataSuplier := GetListSuplierByType(MasterNewUnit.ID, AType);
      dataSuplier.Last;
      with cbbKodeSuplier do
      begin
        cbbKodeSuplier.Tag := cbbTipeSuplier.ItemIndex;
        Items.Clear;
        cbbNamaSupplier.Items.Clear;
        if not dataSuplier.IsEmpty then
        begin
          dataSuplier.First;
          while not dataSuplier.Eof do
          begin
            Items.Add(dataSuplier.FieldByName('SUP_CODE').AsString);
            cbbNamaSupplier.Items.Add(dataSuplier.FieldByName('SUP_Name').AsString);
            dataSuplier.Next;
          end;
        end;
      end;
      dataSuplier.Close;
  end;
  }
end;

procedure TfrmPemakaianBarcode.actDeletePemakaianBarcodeExecute(
  Sender: TObject);
var
    bResult, bTemp: Boolean;
    isError: Boolean;
    i: Integer;
begin
  inherited;
  isError := FAlse;
  bResult := False;
  {
  if (CommonDlg.Confirm('Are you sure you wish to execute delete process ?') = mrYes) then
  begin
    try
      i := 1;
      while i < grdMain.RowCount do
      begin
        grdMain.GetCheckBoxState(_Kol_ID, i, bTemp);

        if bTemp then
        begin
            FNewPotTagContrabon.LoadByNO(grdMain.Cells[_kol_No, i], MasterNewUnit.ID);
            if not FNewPotTagContrabon.RemoveFromDB then
            begin
              IF MessageDlg('Gagal menyimpan dibaris ke-'+IntToStr(i) +
                     ', Supplier : '+(grdMain.Cells[_Kol_SUPPLIER_Name, i])+ #13#10 +
                     'Lanjutkan menghapus data lainnya ?', Dialogs.mtError, Dialogs.mbOKCancel, 0)=mrNO
              then
              begin
                   isError := True;
                   cRollbackTrans;
              end;
            end;
        end;

        Inc(i);
      end;
      if  not isError then
          bResult := True;
    except
      bResult := False;
      cRollbackTrans;
    end;

    if bResult then
    begin
      cCommitTrans;
      CommonDlg.ShowMessage(CONF_DELETE_SUCCESSFULLY);
      ParseDataPotonganTagihanContrabonByDateAndType(dtBarcode.Date, cbbTipeSuplier.Text);
    end
    else
    begin
      cRollbackTrans;
      CommonDlg.ShowError(ER_DELETE_FAILED);
    end;
  end;
  }
end;

procedure TfrmPemakaianBarcode.actEditExecute(Sender: TObject);
begin
  inherited;
//  if MasterNewUnit.ID = 0 then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    Exit;
  end;

  if dtBarcode.Text = '  -  -    ' then
  begin
    CommonDlg.ShowError('Barcode usage date is empty');
    dtBarcode.SetFocus;
    Exit;
  end;

  if cbbTipeSuplier.ItemIndex = -1 then
  begin
    CommonDlg.ShowError('Supplier type is empty');
    cbbTipeSuplier.SetFocus;
    Exit;
  end;

  ParseDataSuplierByType(cbbTipeSuplier.Text);
  ParseDataPotonganTagihanContrabonByDateAndType(dtBarcode.Date, cbbTipeSuplier.Text);
  btnSave.Enabled := True;
  lblAddRow.Visible := False;
  lblDeleteRow.Visible := False;
end;

procedure TfrmPemakaianBarcode.actRefreshExecute(Sender: TObject);
begin
  inherited;
  btnSave.Enabled := False;
  fraFooter4Button1.btnAdd.Enabled := True;
end;

procedure TfrmPemakaianBarcode.dtBarcodeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
    cbbTipeSuplier.SetFocus;
end;

procedure TfrmPemakaianBarcode.cbbTipeSuplierKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
    curredtHarga.SetFocus;
end;

procedure TfrmPemakaianBarcode.curredtHargaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
    edtDescription.SetFocus;
end;

procedure TfrmPemakaianBarcode.grdMainCellValidate(Sender: TObject; ACol,
  ARow: Integer; var Value: String; var Valid: Boolean);
begin
  inherited;
  {if ACol = _Kol_SUPPLIER_CODE then
    begin
      grdMain.Col := _Kol_TOTAL_PRICE;
      grdMain.SetFocus;
//      grdMain.Cells[2, ARow] := GetSuplierNameByCode(Value);
      grdMain.Cells[_Kol_QUANTITY, ARow] := '0';
      grdMain.Cells[_Kol_TOTAL_PRICE, ARow] := '0';
    end else
  if ACol = _Kol_TOTAL_PRICE  then
    begin
      grdMain.SetFocus;
      grdMain.Cells[_Kol_QUANTITY, ARow] := IntToStr(Round(StrToCurr(Value) / curredtHarga.Value));
    end;

  grdMain.AutoSize := True;
  intedtTotalQty.Value := Round(grdMain.ColumnSum(_Kol_QUANTITY, 1, grdMain.RowCount));
  curredtTotalPrice.Value := grdMain.ColumnSum(_Kol_TOTAL_PRICE, 1, grdMain.RowCount);
  grdMain.Alignments[_Kol_QUANTITY, ARow] := taRightJustify;
  grdMain.Alignments[_Kol_TOTAL_PRICE, ARow] := taRightJustify;
  }
end;

procedure TfrmPemakaianBarcode.SetIsProcessSuccessfull(
  const Value: Boolean);
begin
  FIsProcessSuccessfull := Value;
end;

//procedure TfrmPemakaianBarcode.ClearComponent;
//begin
//  dtBarcode.Text := '  -  -    ';
//  cbbTipeSuplier.ItemIndex := -1;
//  curredtHarga.Value := 0;
//  edtDescription.Clear;
////  grdMain.ClearRows(1, grdMain.RowCount - 1);
////  grdMain.RowCount := 2;
//  intedtTotalQty.Value := 0;
//  curredtTotalPrice.Value := 0;
//end;

procedure TfrmPemakaianBarcode.ParseDataPotonganTagihanContrabonByDateAndType(
  ADate: TDateTime; AType: string);
var dataPemakaianBarcode: TDataSet;
//    i: Integer;
begin
  {dataPemakaianBarcode := GetListPemakaianBarcodeByDateAndSuplierType(MasterNewUnit.ID, AType, ADate);
  dataPemakaianBarcode.Last;                       // GetListPotonganTagihanContrabonByDateAndType
  with grdMain do
  begin
    if not dataPemakaianBarcode.IsEmpty then
    begin
      grdMain.RowCount := dataPemakaianBarcode.RecordCount + 1;
      i := 1;
      dataPemakaianBarcode.First;
      while not dataPemakaianBarcode.Eof do
      begin
        AddCheckBox(_Kol_ID, i, False, False);
        Cells[_Kol_SUPPLIER_CODE, i] := dataPemakaianBarcode.FieldByName('POTTGHN_SUP_CODE').AsString;
        Cells[_Kol_SUPPLIER_NAME, i] := dataPemakaianBarcode.FieldByName('SUP_NAME').AsString;
        Cells[_Kol_QUANTITY, i] := dataPemakaianBarcode.FieldByName('POTTGHN_QTY').AsString;
        Cells[_Kol_TOTAL_PRICE, i] := dataPemakaianBarcode.FieldByName('POTTGHN_TOTAL_BILLING').AsString;
        Cells[_Kol_No, i] := dataPemakaianBarcode.FieldByName('POTTGHN_NO').AsString;
        Cells[_Kol_StatPro, i] := dataPemakaianBarcode.FieldByName('POTTGHN_STAPRO_ID').AsString;
        edtDescription.Text := dataPemakaianBarcode.FieldByName('POTTGHN_DESCRIPTION').AsString;
        intedtTotalQty.Value := Round(ColumnSum(_Kol_QUANTITY, 1, RowCount));
        curredtTotalPrice.Value := ColumnSum(_Kol_TOTAL_PRICE, 1, RowCount);
        curredtHarga.Value := dataPemakaianBarcode.FieldByName('POTTGHN_SAT_PRICE').AsCurrency;
        Alignments[_Kol_QUANTITY, i] := taRightJustify;
        Alignments[_Kol_TOTAL_PRICE, i] := taRightJustify;
        grdMain.CellProperties[_Kol_SUPPLIER_CODE, i].BrushColor:= clInfoBk;
        grdMain.CellProperties[_Kol_SUPPLIER_NAME, i].BrushColor:= clInfoBk;
        grdMain.CellProperties[_Kol_TOTAL_PRICE, i].BrushColor:= clInfoBk;

        Inc(i);
        dataPemakaianBarcode.Next;
      end;
    end
    else
    begin
      RowCount := 2;
      Cells[_Kol_ID, 1] := '';
      Cells[_Kol_SUPPLIER_CODE, 1] := '';
      Cells[_Kol_SUPPLIER_NAME, 1] := '';
      Cells[_Kol_QUANTITY, 1] := '0';
      Cells[_Kol_TOTAL_PRICE, 1] := '0';
      Cells[_Kol_No, 1] := '';
      Cells[_Kol_StatPro, 1] := '';
      Alignments[_Kol_QUANTITY, 1] := taRightJustify;
      Alignments[_Kol_TOTAL_PRICE, 1] := taRightJustify;
      grdMain.CellProperties[_Kol_SUPPLIER_CODE ,1].BrushColor:= clInfoBk;
      grdMain.CellProperties[_Kol_SUPPLIER_NAME ,1].BrushColor:= clInfoBk;
      grdMain.CellProperties[_Kol_TOTAL_PRICE ,1].BrushColor:= clInfoBk;
    end;

    AutoSize := True;
    FixedRows := 1;
  end;
  }
end;

procedure TfrmPemakaianBarcode.btnSaveClick(Sender: TObject);
begin
  inherited;
//  case StatusForm of
//    frNew:
//      begin
//        IsProcessSuccessfull := SaveDataPotonganTagihanContrabon;
//
//        if IsProcessSuccessfull then
//        begin
////          cCommitTrans;
//          CommonDlg.ShowMessage(CONF_ADD_SUCCESSFULLY);
//          ClearComponent;
//        end
//        else
//        begin
////          cRollbackTrans;
//          CommonDlg.ShowError(ER_INSERT_FAILED);
//        end;
//      end;
//    frEdit:
//      begin
//        IsProcessSuccessfull := UpdateDataPotonganTagihanContrabon;
//
//        if IsProcessSuccessfull then
//        begin
////          cCommitTrans;
//          //aneh nih, abis nambah dr edit kok accessviolation. pk try jg ga iso
//          CommonDlg.ShowMessage(CONF_EDIT_SUCCESSFULLY);
//          //ShowMessage(CONF_EDIT_SUCCESSFULLY);
//
//          ClearComponent;
//        end
//        else
//        begin
////          cRollbackTrans;
//          CommonDlg.ShowError(ER_UPDATE_FAILED);
//        end;
//      end;
//  end;
//
//  lblDeleteRow.Visible := False;
//  lblAddRow.Visible := False;
//
//  btnSave.Enabled := False;
//  fraFooter4Button1.btnAdd.Enabled := True;
end;

procedure TfrmPemakaianBarcode.lblAddRowClick(Sender: TObject);
begin
  inherited;
  {with grdMain do
  begin
      AddRow;
      Alignments[_Kol_QUANTITY, RowCount-1] := taRightJustify;
      Alignments[_Kol_TOTAL_PRICE, RowCount-1] := taRightJustify;
      CellProperties[_Kol_SUPPLIER_CODE ,RowCount-1].BrushColor:= clInfoBk;
      CellProperties[_Kol_SUPPLIER_NAME ,RowCount-1].BrushColor:= clInfoBk;
      CellProperties[_Kol_TOTAL_PRICE ,RowCount-1].BrushColor:= clInfoBk;
  end;
  }
end;

procedure TfrmPemakaianBarcode.lblDeleteRowClick(Sender: TObject);
begin
  inherited;
  {if (grdMain.RowCount > 2) then
    grdMain.RemoveSelectedRows
  else
    grdMain.ClearRows(1, grdMain.RowCount);
    }
end;

procedure TfrmPemakaianBarcode.grdMainGetFloatFormat(Sender: TObject;
  ACol, ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  inherited;    
  FloatFormat := '%.3n';
  if (ACol in [_Kol_QUANTITY]) and (ARow > 0) then
    IsFloat := True
  else
  if (ACol in [_Kol_TOTAL_PRICE]) and (ARow > 0) then
  begin
    FloatFormat := '%.2n';
    IsFloat := True;
  end
  else
    IsFloat := False;
end;

procedure TfrmPemakaianBarcode.curredtHargaEnter(Sender: TObject);
begin
  inherited;
  curredtHarga.SelectAll;
end;

procedure TfrmPemakaianBarcode.edtDescriptionKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    cxGrid.SetFocus;
  end;
end;

procedure TfrmPemakaianBarcode.FormShow(Sender: TObject);
//var
//  dataSet: TDataSet;
begin
  inherited;
//  cbbTipeSuplier.Clear;
////  dataSet := GetListTipeBarangContrabon(MasterNewUnit.ID);
//  dataSet.First;
//  while not dataSet.Eof do
//  begin
//      cbbTipeSuplier.Items.Append(dataSet.Fields[0].AsString);
//      dataSet.Next;
//  end;
//  cbbKodeSuplier.Tag := -1;
end;

procedure TfrmPemakaianBarcode.grdMainComboChange(Sender: TObject; ACol,
  ARow, AItemIndex: Integer; ASelection: String);
begin
  inherited;
  if ACol = _Kol_SUPPLIER_CODE then //kasih nama sup
  begin
//       grdMain.Cells[_Kol_SUPPLIER_NAME, ARow] := cbbNamaSupplier.Items[AItemIndex];
  end;
  if ACol = _Kol_SUPPLIER_NAME then //kasih kode
  begin
//       grdMain.Cells[_Kol_SUPPLIER_CODE, ARow] := cbbKodeSuplier.Items[AItemIndex];
  end;
end;

procedure TfrmPemakaianBarcode.FormCreate(Sender: TObject);
begin
  inherited;
//  FNewPotTagContrabon := TNewPotTagihanContrabon.CreateWithUser(Self, FLoginId, FLoginUnitId);

end;

procedure TfrmPemakaianBarcode.FormDestroy(Sender: TObject);
begin
  inherited;
  frmPemakaianBarcode := nil;
end;

procedure TfrmPemakaianBarcode.RefreshData;
begin
  inherited;
  // TODO -cMM: TfrmPemakaianBarcode.RefreshData default body inserted
end;

end.

