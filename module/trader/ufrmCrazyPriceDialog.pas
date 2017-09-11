unit ufrmCrazyPriceDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialogBrowse, ExtCtrls, Mask, StdCtrls,
  math, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxTextEdit, cxCurrencyEdit, System.Actions, Vcl.ActnList,
  ufraFooterDialog3Button, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.Menus, cxButtons;

type
  TFormMode = (fmAdd, fmEdit);

  TfrmCrazyPriceDialog = class(TfrmMasterDialogBrowse)
    pnl2: TPanel;
    lbl3: TLabel;
    lbl7: TLabel;
    lbl9: TLabel;
    lbl11: TLabel;
    edtCode: TEdit;
    edtName: TEdit;
    edtDisc: TcxCurrencyEdit;
    edtCrazyPrice: TcxCurrencyEdit;
    lbl10: TLabel;
    edtConValue: TcxCurrencyEdit;
    cbbUOM: TComboBox;
    curredtStorePrice: TcxCurrencyEdit;
    lbl1: TLabel;
    curredtPriceDisc: TcxCurrencyEdit;
    edtDiscPersen: TcxCurrencyEdit;
    lbl2: TLabel;
    lbl4: TLabel;
    curredtDiscNominal: TcxCurrencyEdit;
    Label1: TLabel;
    cbTipeHarga: TComboBox;
    btnAdd: TcxButton;
    btnRemove: TcxButton;
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAddClick(Sender: TObject);
    procedure strgGridGetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
    procedure strgGridCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure cbbUOMChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbbUOMKeyPress(Sender: TObject; var Key: Char);
    procedure edtDiscPersenKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnRemoveClick(Sender: TObject);
    procedure edtCrazyPriceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridCellValidate(Sender: TObject; ACol, ARow: Integer;
      var Value: String; var Valid: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDiscPersenExit(Sender: TObject);
    procedure edtCrazyPriceExit(Sender: TObject);
    procedure curredtDiscNominalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure curredtDiscNominalExit(Sender: TObject);
    procedure strgGridDblClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FSellPrice  : Currency;
    FisEditRec  : Boolean;
    Fidx        : Integer;
    FIdxTipeHarga: Integer;
    FTipeHrg: Integer;
    procedure GetUOMByBrgCode;
//    function FindOnGrid(strBrgCode: String): Boolean;
    procedure CalcDiscAndNominalDisc;
    procedure setHarga;
  public
    { Public declarations }
    IsProcessSuccessfull: Boolean;
    formMode: TFormMode;
    CrazID: Integer;
    procedure ClearTextValue;
    procedure LoadTipeHarga;
    procedure ParseHeaderGrid;
    procedure SaveDataCrazyPrice_New;
    property IdxTipeHarga: Integer read FIdxTipeHarga write FIdxTipeHarga;
    property TipeHrg: Integer read FTipeHrg write FTipeHrg;
  end;

var
  frmCrazyPriceDialog: TfrmCrazyPriceDialog;

const
  _KolBrgKode           : Integer = 0;
  _KolBrgNama           : Integer = 1;
  _KolSatKode           : Integer = 2;
  _KolConValue          : Integer = 3;
  _KolBuyPrice          : Integer = 4;
  _KolBHJMarkUp         : Integer = 5;
  _KolBHJSellPrice      : Integer = 6;
  _KolBHJDiscPersen     : Integer = 7;
  _KolBHJDiscNominal    : Integer = 8;
  _KolBHJSellPriceDisc  : Integer = 9;
  _KolStorePrice        : Integer = 10;


implementation

uses uTSCommonDlg, ufrmSearchProduct, uRetnoUnit;

{$R *.dfm}


procedure TfrmCrazyPriceDialog.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin
  inherited;

//  if not IsValidDateKarenaEOD(dialogunit,cGetServerTime,FMasterIsStore) then
    Exit;
  {
  if strgGrid.RowCount > 1 then
  begin
    SaveDataCrazyPrice_New;
  end
  Else
  Begin
    CommonDlg.ShowMessage('Daftar product masih kosong !');
    Exit;
  End;
   }
  Close;
end;

procedure TfrmCrazyPriceDialog.FormDestroy(Sender: TObject);
begin
  inherited;
  frmCrazyPriceDialog := nil;
end;

procedure TfrmCrazyPriceDialog.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmCrazyPriceDialog.edtCodeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  s: string;
  Code: String;
begin
  inherited;
    if (Key = VK_F5) OR (Key = VK_DOWN) then
    begin
      s := 'Select BRG_CODE as KODE, BRG_NAME as NAMA, BRG_MERK as MERK, BRG_ALIAS as ALIAS, BRG_CATALOG as KATALOG, BRG_HARGA_AVERAGE as HARGAAVERAGE'
         + ' From BARANG ';
//         + ' AND BRG_IS_ACTIVE = 1';
      {with clookup('Daftar PLU', s) do
      begin
        Try
          if Strings[0] = '' then Exit;
          if not Assigned(SellingPrice) then
            SellingPrice := TSellingPrice.Create;

          Code          := Strings[0];
          edtCode.Text  := Code;
          edtName.Text  := Strings[1];
          GetUOMByBrgCode();
          curredtStorePrice.Value := SellingPrice.GetStorePrice(Code, DialogUnit);

          if cbbUOM.Items.Count > 0 then
          begin
            cbbUOM.ItemIndex := 0;
            cbbUOMChange(Self);
          end;

        Finally
          Free;
        End;
      end;  }
    end else
    if Key = VK_RETURN then
    begin
      if Length(edtCode.Text) < igProd_Code_Length then
        Exit
      else if Length(edtCode.Text) = igProd_Code_Length then
      begin
        {if not assigned(SellingPrice) then
          SellingPrice := TSellingPrice.Create;

        edtName.Text            := SellingPrice.GetProductName(edtCode.Text, DialogUnit);
        GetUOMByBrgCode();
        curredtStorePrice.Value := SellingPrice.GetStorePrice(edtCode.Text, DialogUnit);
        }
        if cbbUOM.Items.Count > 0 then
        begin
          cbbUOM.ItemIndex := 0;
          cbbUOMChange(Self);
        end;
        edtCrazyPrice.SetFocus;
        edtCrazyPrice.SelectAll;
      end;
    end;
end;

procedure TfrmCrazyPriceDialog.btnAddClick(Sender: TObject);
var
  aRow  : Integer;
begin
  inherited;
    if edtCode.Text = '' then
      Exit;
    if edtCrazyPrice.Value = 0 then
      Exit;
    {
    aRow  := strgGrid.RowCount - strgGrid.FixedRows;//initialisasi
    if FisEditRec and (Fidx <> 0) then
    begin
      aRow  := Fidx;
    end
    else
    begin
      if strgGrid.RowCount > strgGrid.FixedRows then
      begin
        if strgGrid.Cells[_KolBrgKode, strgGrid.Row] <> '' then
        begin
          strgGrid.AddRow;
        end;

        aRow  := strgGrid.RowCount - strgGrid.FixedRows;

      end;
    end;

    strgGrid.Cells[_KolBrgKode, aRow]           := edtCode.Text;
    strgGrid.Cells[_KolBrgNama, aRow]           := edtName.Text;
    strgGrid.Cells[_KolSatKode, aRow]           := cbbUOM.Text;
    strgGrid.Cells[_KolConValue, aRow]          := FloatToStr(edtConValue.Value);
    strgGrid.Cells[_KolBuyPrice, aRow]          := CurrToStr(curredtPriceDisc.Value);
    strgGrid.Cells[_KolBHJMarkUp, aRow]         := FloatToStr(edtDisc.Value);
    strgGrid.Cells[_KolBHJSellPrice, aRow]      := CurrToStr(FSellPrice);
    strgGrid.Cells[_KolBHJDiscPersen, aRow]     := FloatToStr(edtDiscPersen.Value);
    strgGrid.Cells[_KolBHJDiscNominal, aRow]    := CurrToStr(curredtDiscNominal.Value);
    strgGrid.Cells[_KolBHJSellPriceDisc, aRow]  := CurrToStr(edtCrazyPrice.Value);
    strgGrid.Cells[_KolStorePrice, aRow]        := CurrToStr(curredtStorePrice.Value);
    }

    CbbUom.Clear;
    edtCode.Clear;
    edtName.Clear;
    curredtStorePrice.Value   := 0;
    ClearTextValue;
    edtCode.SetFocus;
end;

procedure TfrmCrazyPriceDialog.strgGridGetFloatFormat(Sender: TObject;
  ACol, ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  inherited;
  if ACol in [_KolBrgKode.._KolSatKode] then
    IsFloat := False;

  if IsFloat then
    FloatFormat := '%.2n';

end;

procedure TfrmCrazyPriceDialog.strgGridCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  inherited;
  if ACol in [_KolBHJDiscPersen, _KolBHJSellPriceDisc] then CanEdit := True else CanEdit := False;
end;

procedure TfrmCrazyPriceDialog.GetUOMByBrgCode;
var
  s: string;
begin
  s := 'SELECT DISTINCT BHJ_SAT_CODE'
     + ' FROM BARANG_HARGA_JUAL'
     + ' WHERE BHJ_BRG_CODE = ' + QuotedStr(edtCode.Text);
//  cQueryToCombo(cbbUOM, s);
end;

procedure TfrmCrazyPriceDialog.cbbUOMChange(Sender: TObject);
begin
  inherited;

  ClearTextValue;

  setHarga;

end;

procedure TfrmCrazyPriceDialog.FormShow(Sender: TObject);
begin
  inherited;
  Fidx  := 0;
  if formMode = fmAdd then
  begin
    LoadTipeHarga;
    ParseHeaderGrid;
  end;
//  strgGrid.ColWidths[_KolBHJMarkUp] := 0;
  edtCode.SetFocus;

end;

procedure TfrmCrazyPriceDialog.cbbUOMKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Ord(Key) in [97..122] then
    Key:= UpCase(Key)
end;

procedure TfrmCrazyPriceDialog.ParseHeaderGrid;
begin
  {with strgGrid do
  begin
    ColCount:= 11;
    RowCount:= 2;
    Cells[_KolBrgKode, 0]           := 'PRODUCT CODE';
    Cells[_KolBrgNama, 0]           := 'PRODUCT NAME';
    Cells[_KolSatKode, 0]           := 'UOM';
    Cells[_KolConValue, 0]          := 'CONV. VALUE';
    Cells[_KolBuyPrice, 0]          := 'BUY PRICE';
    Cells[_KolBHJMarkUp, 0]         := 'MARK UP %';
    Cells[_KolBHJSellPrice, 0]      := 'SELL PRICE';
    Cells[_KolBHJDiscPersen, 0]     := 'DISC %';
    Cells[_KolBHJDiscNominal, 0]    := 'DISC NOMINAL';
    Cells[_KolBHJSellPriceDisc, 0]  := 'CRAZY PRICE';
    Cells[_KolStorePrice, 0]        := 'STORE PRICE';

    FixedRows   := 1;
    ColWidths[_KolBuyPrice]   := 0;
    ColWidths[_KolStorePrice] := 0;
  end;
  }
end;

procedure TfrmCrazyPriceDialog.CalcDiscAndNominalDisc;
var
  curCP,
  curSP,
  curNominalDisc: Currency;
  NominalMarkup,
  ExtDisc,
  ExtMarkup: Real;
begin
  ExtDisc       := edtDiscPersen.Value;
  curSP         := curredtStorePrice.Value;
  curCP         := edtCrazyPrice.Value;
  NominalMarkup := curCP - curredtPriceDisc.Value;

  if curredtPriceDisc.Value <> 0 then
    ExtMarkUp := StrToFloat(FormatFloat('0.00', (NominalMarkup/ curredtPriceDisc.Value)*100))
  else
    ExtMarkup := 0;

  edtDisc.Value   := ExtMarkUp;
  curNominalDisc  := (ExtDisc * curSP)/100;
  FSellPrice      := curCP + curNominalDisc;

  curredtDiscNominal.Value:= curNominalDisc;
end;

procedure TfrmCrazyPriceDialog.edtDiscPersenKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    edtDiscPersenExit(Self);
    curredtDiscNominal.SetFocus;
  end;

end;

procedure TfrmCrazyPriceDialog.LoadTipeHarga;
var
  s: string;
begin
  s := 'Select REF$TIPE_HARGA_ID, TPHRG_NAME From REF$TIPE_HARGA Where TPHRG_CODE <> ' + QuotedStr('H004')
     + ' AND TPHRG_UNT_ID = ' + IntToStr(DialogUnit)
     + ' Order By TPHRG_NAME';
//  cQueryToComboObject(cbTipeHarga, s);

  cbTipeHarga.ItemIndex := IdxTipeHarga;
end;

procedure TfrmCrazyPriceDialog.SaveDataCrazyPrice_New;
var
  FTipeHrgID: Integer;
  strSat: string;
  strCode: string;
  i: Integer;
  FBarangHargaJualID: Integer;
//  FBarangHargaJual: TBarangHargaJual;
begin
  // TODO -cMM: TfrmCrazyPriceDialog.SaveDataCrazyPrice_New default body inserted
  {try
    Self.Enabled := False;
    IsProcessSuccessfull := False;

    FBarangHargaJual := TBarangHargaJual.Create(nil);
    FTipeHrgID := cGetIDfromCombo(cbTipeHarga, cbTipeHarga.ItemIndex);

    for i := 1 to strgGrid.RowCount - 1 do
    begin
      strCode := strgGrid.Cells[_KolBrgKode, i];
      strSat  := strgGrid.Cells[_KolSatKode, i];

      FBarangHargaJual.ClearProperties;
      if FBarangHargaJual.LoadByBarangKodeTipeHarga(strCode, strSat, FTipeHrgID) then
      begin
        FBarangHargaJualID := FBarangHargaJual.ID;
      end
      else
      begin
        FBarangHargaJualID := 0;
        if DialogUnit <> 1 then
        begin
          CommonDlg.ShowMessage('Tipe Harga ' + cbTipeHarga.Text + ' Untuk PLU ' + strCode + ' belum diset di HO' + #13 +
                                'Proses simpan tidak bisa dilanjutkan');
          Exit;
        end;

      end;

      FBarangHargaJual.UpdateData(0,
                                  StrToFloat(strgGrid.Cells[_KolBHJDiscNominal, i]),
                                  StrToFloat(strgGrid.Cells[_KolBHJDiscPersen, i]),
                                  FBarangHargaJualID,
                                  0,
                                  0,
                                  StrToFloat(strgGrid.Cells[_KolConValue, i]),
                                  0,
                                  0,
                                  StrToFloat(strgGrid.Cells[_KolBHJMarkUp, i]),
                                  strCode,
                                  DialogUnit,
                                  strSat,
                                  0,
                                  0,
                                  '',
                                  StrToFloat(strgGrid.Cells[_KolBHJSellPrice, i]),
                                  0,
                                  StrToFloat(strgGrid.Cells[_KolBHJSellPriceDisc, i]),
                                  FTipeHrgID,
                                  0,
                                  0);

      if not FBarangHargaJual.ExecuteGenerateSQL then
      begin
        cRollbackTrans;
        CommonDlg.ShowMessage('Gagal Simpan Crazy Price');
        Exit;
      end;

    end;
    cCommitTrans;
    IsProcessSuccessfull := True;
    CommonDlg.ShowMessage('Sukses Simpan Crazy Price');

  finally
    Self.Enabled := True;
    cRollbackTrans;
    if FBarangHargaJual <> nil then FreeAndNil(FBarangHargaJual);
  end;
  }
end;

procedure TfrmCrazyPriceDialog.btnRemoveClick(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  {if strgGrid.Row > 0 then
  begin
    if strgGrid.Row > 1 then
      strgGrid.RemoveSelectedRows
    else
    begin
      for i := 0 to strgGrid.ColCount - 1 do
        strgGrid.Cells[i, 1] := '';
    end;

  end;
  }
end;

procedure TfrmCrazyPriceDialog.ClearTextValue;
begin
  // TODO -cMM: TfrmCrazyPriceDialog.ClearTextValue default body inserted
  edtDisc.Value             := 0;
  edtConValue.Value         := 0;
  curredtPriceDisc.Value    := 0;
  edtCrazyPrice.Value       := 0;
  edtDiscPersen.Value       := 0;
  curredtDiscNominal.Value  := 0;
end;

procedure TfrmCrazyPriceDialog.edtCrazyPriceKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    edtCrazyPriceExit(Self);
    edtDiscPersen.SetFocus;
  end;
end;

procedure TfrmCrazyPriceDialog.strgGridCellValidate(Sender: TObject; ACol,
  ARow: Integer; var Value: String; var Valid: Boolean);
var
  dDiscNominal: Double;
  dMarkUp: Double;
begin
  inherited;
  if (ACol = _KolBHJSellPriceDisc) Or (Acol = _KolBHJDiscPersen) then
  begin
    {if strgGrid.Cells[_KolBuyPrice, ARow] = '0' then
      strgGrid.Cells[_KolBHJMarkUp, ARow] := '0'
    else
    begin
      dMarkUp := (StrToFloat(strgGrid.Cells[_KolBuyPrice, ARow]) - StrToFloat(strgGrid.Cells[_KolBHJSellPriceDisc, ARow])) / StrToFloat(strgGrid.Cells[_KolBuyPrice, ARow]) * 100;
      dMarkUp := StrToFloat(FormatFloat('0.00', dMarkUp));
      strgGrid.Cells[_KolBHJMarkUp, ARow] := FloatToStr(dMarkUp);
    end;

    if strgGrid.Cells[_KolBHJDiscPersen, ARow] = '0' then
      strgGrid.Cells[_KolBHJDiscPersen, ARow] := '0'
    else
    begin
      dDiscNominal := (StrToFloat(strgGrid.Cells[_KolBHJDiscPersen, ARow]) / 100) * StrToFloat(strgGrid.Cells[_KolStorePrice, ARow]);
      FSellPrice := StrToFloat(strgGrid.Cells[_KolBHJSellPriceDisc, ARow]) + dDiscNominal;
      strgGrid.Cells[_KolBHJDiscNominal, ARow] := FloatToStr(dDiscNominal);
      strgGrid.Cells[_KolBHJSellPrice, ARow] := FloatToStr(FSellPrice);
    end;
    }
  end;

end;

procedure TfrmCrazyPriceDialog.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
//var
//  K: String;
begin
  inherited;
  if (ssctrl in Shift) and (Key = Ord('R')) then
  Begin
    btnRemoveClick(Sender);
  End
  else if (ssctrl in Shift) and (Key=Ord('T')) then
    btnAddClick(Sender)
  else if (key=VK_ESCAPE) then
    Close
  else if (key=VK_RETURN) and (ssctrl in Shift) then
    footerDialogMasterbtnSaveClick(Sender);
end;

procedure TfrmCrazyPriceDialog.edtDiscPersenExit(Sender: TObject);
begin
  inherited;
  CalcDiscAndNominalDisc
end;

procedure TfrmCrazyPriceDialog.edtCrazyPriceExit(Sender: TObject);
begin
  inherited;
  CalcDiscAndNominalDisc;
end;

procedure TfrmCrazyPriceDialog.curredtDiscNominalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    btnAdd.SetFocus;
  end;

end;

procedure TfrmCrazyPriceDialog.curredtDiscNominalExit(Sender: TObject);
begin
  inherited;
  if curredtStorePrice.Value <> 0 then
    edtDiscPersen.Value := StrToFloat(FormatFloat('0.00', (curredtDiscNominal.Value / curredtStorePrice.Value) * 100))
  else
    edtDiscPersen.Value := 0;

  FSellPrice := edtCrazyPrice.Value + curredtDiscNominal.Value;
end;

procedure TfrmCrazyPriceDialog.setHarga;
var
  iTipeHrgID        : Integer;
  dHargaAvg         : Double;
  dConValue         : Double;
//  FBarangHargaJual  : TBarangHargaJual;

begin
  {try
    FBarangHargaJual := TBarangHargaJual.create(nil);
    if cbbUOM.Text <> '' then
    begin
      FBarangHargaJual.SetHargaAverage(edtCode.Text, DialogUnit, UpperCase(cbbUOM.Text), dConValue, dHargaAvg);
      edtConValue.Value      := dConValue;
      curredtPriceDisc.Value := dHargaAvg;
      //semua tipe harga toko
      if TipeHrg = 0 then
        iTipeHrgID  := cGetIDfromCombo(cbTipeHarga, cbTipeHarga.ItemIndex)
      else
        iTipeHrgID  := TipeHrg;

      FBarangHargaJual.LoadByBarangKodeTipeHarga(edtCode.Text,
                    UpperCase(cbbUOM.Text),
                    iTipeHrgID);
      curredtStorePrice.Value := FBarangHargaJual.SellPrice;

      if curredtStorePrice.Value = 0 then
        CommonDlg.ShowMessage('Tidak Ada Penjualan Toko dengan Uom '+ cbbUOM.Text );
    end;

  finally
    if FBarangHargaJual <> nil then FreeAndNil(FBarangHargaJual);
  end;
  }
end;

procedure TfrmCrazyPriceDialog.strgGridDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  inherited;
  ClearTextValue;
  FisEditRec := True;
  {edtCode.Text              := strgGrid.Cells[_KolBrgKode, aRow];
  edtName.Text              := strgGrid.Cells[_KolBrgNama, aRow];

  GetUOMByBrgCode();

  cbbUOM.Text               := strgGrid.Cells[_KolSatKode, aRow];
  edtConValue.Value         := StrToFloat(strgGrid.Cells[_KolConValue, aRow]);

  edtCrazyPrice.Value       := StrToCurr(strgGrid.Cells[_KolBHJSellPriceDisc, aRow]);
  edtDiscPersen.Value       := StrToFloat(strgGrid.Cells[_KolBHJDiscPersen, aRow]);
  curredtDiscNominal.Value  := StrToCurr(strgGrid.Cells[_KolBHJDiscNominal, aRow]);
  edtDisc.Value             := StrToFloat(strgGrid.Cells[_KolBHJMarkUp, aRow]);
  setHarga;

  curredtStorePrice.Value   := StrToCurr(strgGrid.Cells[_KolStorePrice, aRow]);
  }
  Fidx := ARow;

end;

procedure TfrmCrazyPriceDialog.FormCreate(Sender: TObject);
begin
  inherited;
  FIdxTipeHarga := 0;
  FTipeHrg      := 0;
end;

end.


