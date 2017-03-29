unit ufraUOMConvertion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,
  uTSCommonDlg, uConn, Math, uRetnounit, uFormProperty, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, cxButtons, cxLabel,
  cxTextEdit, cxCurrencyEdit, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid;

type
  TSaveUOMConvert = (sUOMAdd,sUOMEdit,sUOMNormal);

  TfraUOMConvertion = class(TFrame)
    pnl4: TPanel;
    pnl1: TPanel;
    lblClose: TcxLabel;
    lblAdd: TcxLabel;
    lblDelete: TcxLabel;
    lblEdit: TcxLabel;
    pnlAddEdit: TPanel;
    pnl2: TPanel;
    edtNameUOM1: TEdit;
    lbl1: TLabel;
    edtUOMstock: TEdit;
    Panel1: TPanel;
    fedtUOM: TcxCurrencyEdit;
    cbbUom: TComboBox;
    fedUOM2: TcxCurrencyEdit;
    Label1: TLabel;
    lbl2BOX: TLabel;
    edtBarcode: TEdit;
    Label2: TLabel;
    btnSave: TcxButton;
    btnCancel: TcxButton;
    cxGridViewUoMConvertion: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;

    procedure lblCloseClick(Sender: TObject);
    procedure lblAddClick(Sender: TObject);
    procedure lblEditClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure strgGridCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure lblDeleteClick(Sender: TObject);
    procedure fedtUOMEnter(Sender: TObject);
    procedure fedtUOMKeyPress(Sender: TObject; var Key: Char);
    procedure cbbUomKeyPress(Sender: TObject; var Key: Char);
    procedure fedUOM2KeyPress(Sender: TObject; var Key: Char);
    procedure edtBarcodeKeyPress(Sender: TObject; var Key: Char);
    procedure fedtUOMKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FProductCode: string;
    FUOMLama: string;
    //dataSatuan: TResultDataSet;
    IDLokal : Integer;
//    function IsUomStockSudahAdaKonversinya: Boolean;
    procedure SetProductCode(const Value: string);
    procedure ParseHeaderGrid();
//    procedure ParseDataGrid();
  public
//    FSelfIsStore: Integer;
    FTpApp      : TTipeApp;
    FSelfUnitId: Integer;
    modeSaveUOMConvert: TSaveUOMConvert;
    procedure ShowUOMConvertion(AUOMCode: String);
  published
    property ProductCode: string read FProductCode write SetProductCode;
  end;

var
  fraUOMConvertion: TfraUOMConvertion;
implementation

uses uConstanta, ufrmProduct;

{$R *.dfm}

procedure TfraUOMConvertion.lblCloseClick(Sender: TObject);
begin
  fraUOMConvertion.Parent := nil;
  frmProduct.SetActiveFooter5Button(True);
end;

//procedure TfraUOMConvertion.ParseDataGrid;
//var
//  iBaris: Integer;
//  sSQL: string;
//begin
//  ParseHeaderGrid;
//
//  sSQL := 'select a.konvsat_barcode, a.KONVSAT_SAT_CODE_FROM, a.konvsat_sat_code_to,b.sat_name, a.konvsat_scale,a.konvsat_id'
//            + ' from ref$konversi_satuan a, ref$satuan b'
//            + ' where konvsat_brg_code = ' + QuotedStr(frmProduct.cbpProductCode.Text)
//            + ' and a.KONVSAT_SAT_CODE_FROM = b.sat_code';
//  {
//  ClearAdvStringGrid(strgGrid);
//  iBaris := 1;
//  with cOpenQuery(sSQL) do
//  begin
//    try
//      while not EOF do
//      begin
//        strgGrid.AddCheckBox(0,iBaris,false,false);
//        strgGrid.Cells[1,iBaris] := FieldByName('KONVSAT_SAT_CODE_FROM').AsString;
//        strgGrid.Cells[2,iBaris] := FieldByName('sat_name').AsString;
//        strgGrid.Cells[3,iBaris] := FloatToStr(FieldByName('konvsat_scale').AsFloat);
//        strgGrid.Cells[5,iBaris] := FieldByName('konvsat_id').AsString;
//        strgGrid.Cells[4,iBaris] := FieldByName('konvsat_barcode').AsString;
//        //strgGrid.Cells[6,iBaris] := FieldByName('ID_2').AsString;
//       //strgGrid.Cells[4,iBaris] := FieldByName('SCALE_2').AsString;
//
//        Next;
//        if not EOF then
//        begin
//          Inc(iBaris);
//          strgGrid.AddRow;
//        end;
//      end;
//    finally
//      Free;
//    end;
//  end; }
//end;

procedure TfraUOMConvertion.ParseHeaderGrid;
begin
  {with strgGrid do
  begin
    Clear;
    RowCount := 2;
    ColCount := 5;
    Cells[0,0] := '   ';
    Cells[1,0] := 'UOM';
    Cells[2,0] := 'KETERANGAN';
    Cells[3,0] := 'KONVERSI';
    Cells[4,0] := 'BARCODE';

    FixedRows := 1;
    AutoSize := true;
  end;}
end;

procedure TfraUOMConvertion.SetProductCode(const Value: string);
begin
  FProductCode := Value;
end;

procedure TfraUOMConvertion.ShowUOMConvertion(AUOMCode: String);
var
  sSQL: string;
begin
  modeSaveUOMConvert := sUOMNormal;
  
  pnlAddEdit.Visible := false;
  ParseHeaderGrid;

  edtUOMStock.Text := AUOMCode;
  edtNameUOM1.Text := frmProduct.edtUOMStockName.Text;

  sSQL := 'select SAT_CODE from REF$SATUAN  '
          + ' order by SAT_CODE';
  cbbUom.Items.Clear;
  {with cOpenQuery(sSQL) do
    begin                    
      while not EOF do
      begin
       cbbUom.Items.Add(FieldByName('SAT_CODE').AsString);
        Next;
      end;
  end;
  cbbUom.ItemIndex:= 0;

  ParseDataGrid;
  strgGrid.SetFocus;
   }
  if FTpApp = TSTORE then
  begin
    lblAdd.Enabled    := False;
    lblEdit.Enabled   := False;
    lblDelete.Enabled := False;
  end else begin
    lblAdd.Enabled    := True;
    lblEdit.Enabled   := True;
    lblDelete.Enabled := True;
  end;    
end;

procedure TfraUOMConvertion.lblAddClick(Sender: TObject);
begin
  lbl2BOX.Caption := edtUOMstock.Text;
  fedUOM2.Value := 0;
  fedtUOM.Value := 0;
  edtBarcode.Text := '';
  
  FUOMLama := '';
  if FSelfUnitId = 0 then
  begin
    CommonDlg.ShowError('UNIT BELUM DIPILIH');
    Exit;
  end
  else
  begin
    IDLokal := 0;
    pnlAddEdit.Visible := true;
    fedtUOM.Value:= 0;
    modeSaveUOMConvert := sUOMAdd;
    fedtUOM.SetFocus;  
  end;

end;

procedure TfraUOMConvertion.lblEditClick(Sender: TObject);
var i: Integer;
    x : Real;
    sSQL : string;
begin
  {
  if FSelfUnitId = 0 then
  begin
    CommonDlg.ShowError('UNIT BELUM DIPILIH');
    Exit;
  end
  else begin
    with TKonversiSatuan.Create(Self) do
    begin
      try
        lbl2BOX.Caption := edtUOMstock.Text;
        pnlAddEdit.Visible := true;
        if not TryStrToInt(strgGrid.Cells[5,strgGrid.Row], IDLokal) then
          Exit;

        if LoadByID(IDLokal) then
        begin
          edtBarcode.Text := Barcode;
          FUOMLama := strgGrid.Cells[1,strgGrid.Row];
          sSQL := 'select SAT_CODE from REF$SATUAN  '
                  + ' order by SAT_CODE';

          cbbUom.Items.Clear;
          with cOpenQuery(sSQL) do
          begin
            while not Eof do
            begin
              cbbUom.Items.Add(fieldbyname('SAT_CODE').AsString);
              Next;
            end;
          end;

          for i:=0 to cbbUom.Items.Count-1 do
          begin
            cbbUom.ItemIndex:= i;       
            if cbbUom.Text = strgGrid.Cells[1,strgGrid.Row] then
              Break;
          end;

          x:= StrToFloat(strgGrid.Cells[3,strgGrid.Row]);

          if (x < 1)then
          begin
            fedUOM2.Value := 1;
            fedtUOM.Value := 1 / x;
            fedtUOM.Value := fedtUOM.Value - 0.5;
            fedtUOM.Value := Ceil(fedtUOM.Value);
          end
          else
          begin
            x := StrToFloat( Format('%.0f',[x]));
            fedtUOM.Value := 1;
            fedUOM2.Value :=x ;
          end;
          fedtUOM.SetFocus;
          edtUOMstock.Text := KodeSatuanTo;
          pnlAddEdit.Visible := true;

        end
        else
        begin
          IDLOkal := 0;
          CommonDlg.ShowMessage('Data Belum Ketemu');
        end;
      finally
        Free;
      end;
    end;
  end; }
end;

procedure TfraUOMConvertion.btnCancelClick(Sender: TObject);
begin
  pnlAddEdit.Visible := false;
end;

procedure TfraUOMConvertion.btnSaveClick(Sender: TObject);
var
  dKonversi: Double;
begin
  if ((fedtUOM.Value = 0) or (fedUOM2.Value = 0)) then
  begin
    CommonDlg.ShowError('Value UOM Salah');
    if (fedtUOM.Value = 0) then
    begin
      fedtUOM.SetFocus;
      Exit;
    end
    else
    begin
      fedUOM2.SetFocus;
      Exit;
    end;
  end else begin
    if (cbbUom.Text = lbl2BOX.Caption) and (fedtUOM.Value <> fedUOM2.Value) then
    begin
      CommonDlg.ShowError('UOM Value Salah [Seharusnya 1]');
      fedUOM2.SetFocus;
      Exit;
    end;
  end;

  if Trim(edtBarcode.Text) = '' then
  begin
    CommonDlg.ShowError('Barcode Belum Diisi');
    edtBarcode.SetFocus;
    Exit;
  end;
  {
   with TKonversiSatuan.Create(nil) do
   begin
     try
        dKonversi := fedUOM2.Value / fedtUOM.Value;
        UpdateData(
                                IDLokal,
                                frmProduct.cbpProductCode.Text,
                                cbbUom.Text,
                                edtUOMstock.Text,
                                dKonversi,
                                edtBarcode.Text
                    );

          cCommitTrans;
          CommonDlg.ShowMessage('Data Berhasil Disimpan');
          ParseDataGrid;
          fedtUOM.SelectAll;

          pnlAddEdit.Visible := false;
          exit;
        end
        else
        begin
          cRollbackTrans;
          CommonDlg.ShowError('Data Gagal disimpan');
        end;
     finally;
      cRollbackTrans;
      Free;
     end;
   end; }
end;

procedure TfraUOMConvertion.strgGridCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  if (ACol = 0) then
    CanEdit := true
  else
    CanEdit := false;
end;

procedure TfraUOMConvertion.lblDeleteClick(Sender: TObject);
var
    chkStatue, isBerhasilHapus: Boolean;
    intI, IDLokal: Integer; //arrParam: TArr; ,delStatue
begin
  IsBerhasilHapus := False;
  if (CommonDlg.Confirm('Anda Yakin Akan Menghapus Konversi Satuan ?') = mrNo) then
    Exit;

  FUOMLama := '';
  {
  with TKonversiSatuan.Create(Self) do
  begin
    try
      for intI:=1 to strgGrid.RowCount-1 do
      begin
        strgGrid.GetCheckBoxState(0,intI,chkStatue);

        if chkStatue then
        begin
          IDLokal := StrToInt(strgGrid.Cells[5,intI]);
          if LoadByID(IDLokal) then
          begin
            if IsUOMSudahAdaTransaksi(frmProduct.cbpProductCode.Text,strgGrid.Cells[1, intI]) then
            begin
              CommonDlg.ShowError('Konversi UOM Tidak Bisa Dihapus ' + #13 + 'Karena Sudah Ada Transaksi Menggunakan UOM ' + strgGrid.Cells[1, intI]);
              cRollbackTrans;
              Exit;
            end else if IsUOMSudahAdaHargaJual(frmProduct.cbpProductCode.Text,strgGrid.Cells[1, intI], FSelfUnitId) then
            begin
              CommonDlg.ShowError('Konversi UOM Tidak Bisa Dihapus ' + #13 + 'Karena Sudah Mempunyai Harga Jual Untuk UOM ' + strgGrid.Cells[1, intI]);
              cRollbackTrans;
              Exit;
            end;


            isBerhasilHapus := RemoveFromDB;
            if not IsUomStockSudahAdaKonversinya then
            begin
              CommonDlg.ShowError('UOM Stok Belum Masuk Dalam Konversi UOM');
              //cbbUom.SetFocus;
              Exit;
            end;

            if not isBerhasilHapus then
            begin
              cRollbackTrans;
              Exit
            end;
          end;
        end;
      end;

      if IsBerhasilHapus then
      begin
        cCommitTrans;
        CommonDlg.ShowMessage('Berhasil Menghapus Data');
        //Exit;
      end;

      ParseDataGrid();
    finally
      cRollbackTrans;
      Free;
    end;
  end; }
end;

procedure TfraUOMConvertion.fedtUOMEnter(Sender: TObject);
begin
  fedtUOM.SelectAll;
end;

procedure TfraUOMConvertion.fedtUOMKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then
    Key := #0

end;

//function TfraUOMConvertion.IsUomStockSudahAdaKonversinya: Boolean;
//begin
//  Result := False;
  {with TNewBarang.Create(Self) do
  begin
    try
      if LoadByKode(frmProduct.cbpProductCode.Text) then
      begin
        Result := IsUOMStockSudahAdaDiUOMConvertion
      end else begin
       CommonDlg.ShowMessage('Barang Tidak Ditemukan');
       Exit;
      end;
    finally
      Free
    end;
  end;  }
//end;

procedure TfraUOMConvertion.cbbUomKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    fedUOM2.SetFocus;
  end;
end;

procedure TfraUOMConvertion.fedUOM2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    edtBarcode.SetFocus;
  end;
end;

procedure TfraUOMConvertion.edtBarcodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    btnSave.SetFocus;
  end;
end;

procedure TfraUOMConvertion.fedtUOMKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    cbbUom.SetFocus;
  end;
end;

end.
