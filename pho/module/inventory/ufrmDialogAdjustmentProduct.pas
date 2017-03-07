unit ufrmDialogAdjustmentProduct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls, SUIForm,
  StdCtrls, Mask, JvToolEdit, JvLabel, Grids, BaseGrid, AdvGrid, uConn, JclStrings,
  uAdjustmentStock, JvEdit, JvExMask, JvExStdCtrls, JvValidateEdit,
  JvExControls, AdvObj;

type
  TStatusForm = (frAdd, frApply, frEdit);
  TfrmDialogAdjustmentProduct = class(TfrmMasterDialog)
    pnlMiddle: TPanel;
    pnl2: TPanel;
    strgGrid: TAdvStringGrid;
    pnl1: TPanel;
    lblTambah: TJvLabel;
    lblHapus: TJvLabel;
    pnlTop: TPanel;
    lbl1: TLabel;
    lbl3: TLabel;
    lbl2: TLabel;
    lbl4: TLabel;
    dtTglOpnam: TJvDateEdit;
    edtRemark: TEdit;
    cbbPilihan: TComboBox;
    edt1: TEdit;
    lbl5: TLabel;
    curredtTotAdjustment: TJvValidateEdit;
    lbl6: TLabel;
    edtProductName: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure strgGridCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure strgGridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridCellValidate(Sender: TObject; ACol, ARow: Integer;
      var Value: String; var Valid: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure lblTambahClick(Sender: TObject);
    procedure lblHapusClick(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure strgGridRowChanging(Sender: TObject; OldRow, NewRow: Integer;
      var Allow: Boolean);
    procedure FormShow(Sender: TObject);
  private
    objAdjustmentStock: TAdjustmentStock;
    FStatusForm: TStatusForm;
    FIsProcessSuccesfull: Boolean;
    function GetDetilProductByCode(ACode: string): TResultDataSet;
    function SaveDataAdjustmentProduct: Boolean;
    function UpdateDataAdjustmentProduct: Boolean;
    function InsertDataAdjustmentIntoBSS: Boolean;
    function CountTotalAdjustment(AGrid: TAdvStringGrid): Currency;
    procedure ParseDataAdjustmentDetil();
    procedure SetStatusForm(const Value: TStatusForm);
    procedure SetIsProcessSuccesfull(const Value: Boolean);
  public
    adjProductId: Integer;
    property StatusForm: TStatusForm read FStatusForm write SetStatusForm;
    property IsProcessSuccesfull: Boolean read FIsProcessSuccesfull write SetIsProcessSuccesfull;
  end;

var
  frmDialogAdjustmentProduct: TfrmDialogAdjustmentProduct;

implementation

uses ufrmSearchProduct, uGTSUICommonDlg, 
  uConstanta;

{$R *.dfm}

procedure TfrmDialogAdjustmentProduct.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogAdjustmentProduct.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(objAdjustmentStock);
  frmDialogAdjustmentProduct := nil;
end;

procedure TfrmDialogAdjustmentProduct.strgGridCanEditCell(Sender: TObject;
  ARow, ACol: Integer; var CanEdit: Boolean);
begin
  inherited;
  if (ACol in [0, 4]) and (StatusForm in [frAdd, frEdit]) then
    CanEdit := True
  else
    CanEdit := False;
end;

procedure TfrmDialogAdjustmentProduct.strgGridKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F5) then
  begin
    if not Assigned(frmDialogSearchProduct) then
      frmDialogSearchProduct := TfrmDialogSearchProduct.Create(Application);

    frmDialogSearchProduct.DialogUnit := Self.DialogUnit;
    frmDialogSearchProduct.DialogCompany := Self.DialogCompany;

    frmDialogSearchProduct.ShowModal;


    if frmDialogSearchProduct.IsProcessSuccessfull then
    begin
      strgGrid.Cells[0, strgGrid.Row] := frmDialogSearchProduct.ProductCode;
    end;

    frmDialogSearchProduct.Free;
  end;
end;

procedure TfrmDialogAdjustmentProduct.strgGridCellValidate(Sender: TObject;
  ACol, ARow: Integer; var Value: String; var Valid: Boolean);
var data: TResultDataSet;
begin
  inherited;
  case ACol of
    0:
      begin
        data := GetDetilProductByCode(Value);

        if not data.IsEmpty then
        begin
          if data.fieldbyname('PO_NO').AsString <> '' then
            strgGrid.Cells[1, ARow] := data.fieldbyname('PO_NO').AsString
          else
            strgGrid.Cells[1, ARow] := '9999999999';
          strgGrid.Cells[2, ARow] := data.fieldbyname('BRGT_STOCK').AsString;
          strgGrid.Cells[3, ARow] := CurrToStr(data.fieldbyname('POD_PRICE').AsCurrency);
          strgGrid.Cells[5, ARow] := data.fieldbyname('BRG_SAT_CODE_STOCK').AsString;
          strgGrid.Cells[6, ARow] := CurrToStr(data.fieldbyname('BRGT_COGS').AsCurrency);
          strgGrid.Cells[7, ARow] := CurrToStr(data.fieldbyname('BRGT_LAST_COST').AsCurrency);
          strgGrid.Cells[8, ARow] := data.fieldbyname('BRG_ALIAS').AsString;
        end;

        strgGrid.Col := 4;
      end;
  end;

  strgGrid.SetFocus;
  strgGrid.AutoSize := True;
  curredtTotAdjustment.Value := CountTotalAdjustment(strgGrid);
  edtProductName.Text := strgGrid.Cells[8, ARow];
end;

function TfrmDialogAdjustmentProduct.GetDetilProductByCode(
  ACode: string): TResultDataSet;
var arrParam: TArr;
begin
  if ACode = '' then
    SetLength(arrParam, 0)
  else
  begin
    SetLength(arrParam, 2);
    arrParam[0].tipe := ptString;
    arrParam[0].data := ACode;
    arrParam[1].tipe := ptInteger;
    arrParam[1].data := DialogUnit;
  end;

  Result := objAdjustmentStock.GetDetilProductByProductCode(arrParam);
end;

procedure TfrmDialogAdjustmentProduct.FormCreate(Sender: TObject);
begin
  inherited;
  if not Assigned(objAdjustmentStock) then
    objAdjustmentStock := TAdjustmentStock.Create;
end;

procedure TfrmDialogAdjustmentProduct.lblTambahClick(Sender: TObject);
begin
  inherited;
  if StatusForm in [frAdd, frEdit] then
    strgGrid.AddRow;
end;

procedure TfrmDialogAdjustmentProduct.lblHapusClick(Sender: TObject);
begin
  inherited;
  if StatusForm in [frAdd, frEdit] then
  begin
    if strgGrid.RowCount > 2 then
      strgGrid.RemoveSelectedRows
    else
    begin
      strgGrid.RowCount := 2;
      strgGrid.ClearRows(1, strgGrid.RowCount - 1);
    end;

    curredtTotAdjustment.Value := CountTotalAdjustment(strgGrid);
  end;
end;

function TfrmDialogAdjustmentProduct.SaveDataAdjustmentProduct: Boolean;
var arrParam: TArr;
    i: Integer;
    bResult, bResult2: Boolean;
begin
  adjProductId := objAdjustmentStock.GetGenAdjustmentProductId;
//  bResult := False;
  bResult2 := False;

  SetLength(arrParam, 8);
  arrParam[0].tipe := ptInteger;
  arrParam[0].data := adjProductId;
  arrParam[1].tipe := ptString;
  arrParam[1].data := StrPadLeft(IntToStr(adjProductId), 10, '0');
  arrParam[2].tipe := ptDateTime;
  arrParam[2].data := dtTglOpnam.Date;
  arrParam[3].tipe := ptString;
  arrParam[3].data := cbbPilihan.Text;
  arrParam[4].tipe := ptString;
  arrParam[4].data := edtRemark.Text;
  arrParam[5].tipe := ptCurrency;
  arrParam[5].data := curredtTotAdjustment.Value;
  arrParam[6].tipe := ptString;
  arrParam[6].data := 'OPEN';
  arrParam[7].tipe := ptInteger;
  arrParam[7].data := FLoginId;

  bResult := objAdjustmentStock.InsertDataAdjustmentProduct(arrParam);

  for i := 1 to strgGrid.RowCount - 1 do
  begin
    if strgGrid.Cells[0, i] <> '' then
    begin
      SetLength(arrParam, 10);
      arrParam[0].tipe := ptInteger;
      arrParam[0].data := adjProductId;
      arrParam[1].tipe := ptString;
      arrParam[1].data := strgGrid.Cells[0, i];
      arrParam[2].tipe := ptString;
      arrParam[2].data := strgGrid.Cells[5, i];
      arrParam[3].tipe := ptString;
      arrParam[3].data := strgGrid.Cells[1, i];
      arrParam[4].tipe := ptCurrency;
      arrParam[4].data := StrToCurr(strgGrid.Cells[3, i]);
      arrParam[5].tipe := ptCurrency;
      arrParam[5].data := StrToCurr(strgGrid.Cells[6, i]);
      arrParam[6].tipe := ptCurrency;
      arrParam[6].data := StrToCurr(strgGrid.Cells[7, i]);
      arrParam[7].tipe := ptCurrency;
      arrParam[7].data := StrToFloat(strgGrid.Cells[4, i]);
      arrParam[8].tipe := ptCurrency;
      arrParam[8].data := StrToCurr(strgGrid.Cells[3, i]) * StrToInt(strgGrid.Cells[4, i]);
      arrParam[9].tipe := ptInteger;
      arrParam[9].data := FLoginId;

      bResult2 := objAdjustmentStock.InsertDataAdjustmentProductDetil(arrParam);
    end;
  end;

  if bResult and bResult2 then
  begin
    ADConn.Commit;
    Result := True;
  end
  else
  begin
    ADConn.Rollback;
    Result := False;
  end;
end;

function TfrmDialogAdjustmentProduct.CountTotalAdjustment(
  AGrid: TAdvStringGrid): Currency;
var i: Integer;
    tTemp: Currency;
begin
  tTemp := 0;
//  i := 1;

  for i := 1 to AGrid.RowCount - 1 do
  begin
    if (AGrid.Cells[3, i] <> '') and (AGrid.Cells[4, i] <> '')  then
      tTemp := tTemp + (StrToCurr(AGrid.Cells[3, i]) * StrToCurr(AGrid.Cells[4, i]));
  end;

  Result := tTemp;
end;

procedure TfrmDialogAdjustmentProduct.SetStatusForm(
  const Value: TStatusForm);
begin
  FStatusForm := Value;
end;

procedure TfrmDialogAdjustmentProduct.SetIsProcessSuccesfull(
  const Value: Boolean);
begin
  FIsProcessSuccesfull := Value;
end;

procedure TfrmDialogAdjustmentProduct.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin
  inherited;
  IsProcessSuccesfull := False;

  case StatusForm of
    frAdd:
    begin
      IsProcessSuccesfull := SaveDataAdjustmentProduct;

      if IsProcessSuccesfull then
        Close
      else
        CommonDlg.ShowError(ER_INSERT_FAILED);
    end;
    frApply:
    begin
      IsProcessSuccesfull := InsertDataAdjustmentIntoBSS;

      if IsProcessSuccesfull then
        Close
      else
        CommonDlg.ShowError('Apply Failed');
    end;
    frEdit:
    begin
      IsProcessSuccesfull := UpdateDataAdjustmentProduct;

      if IsProcessSuccesfull then
        Close
      else
        CommonDlg.ShowError(ER_UPDATE_FAILED);
    end;
  end;
end;

procedure TfrmDialogAdjustmentProduct.strgGridRowChanging(Sender: TObject;
  OldRow, NewRow: Integer; var Allow: Boolean);
begin
  inherited;
  edtProductName.Text := strgGrid.Cells[8, NewRow];
end;

procedure TfrmDialogAdjustmentProduct.ParseDataAdjustmentDetil;
var arrParam: TArr;
    data: TResultDataSet;
    i: Integer;
begin
  SetLength(arrParam, 2);
  arrParam[0].tipe := ptInteger;
  arrParam[0].data := adjProductId;
  arrParam[1].tipe := ptInteger;
  arrParam[1].data := DialogUnit;

  data := objAdjustmentStock.GetListDataAdjustmentProductDetilByAdjustmentId(arrParam);

  with strgGrid do
  begin
    if not data.IsEmpty then
    begin
      RowCount := data.RecordCount + 1;
      i := 1;

      while not data.Eof do
      begin
        Cells[0, i] := data.fieldbyname('BRG_CODE').AsString;
        Cells[1, i] := data.fieldbyname('APD_NO_PO').AsString;
        Cells[2, i] := data.fieldbyname('BRGT_STOCK').AsString;
        Cells[3, i] := CurrToStr(data.fieldbyname('APD_PURCHASE_PRICE').AsCurrency);
        Cells[4, i] := FloatToStr(data.fieldbyname('APD_QTY').AsFloat);
        Cells[5, i] := data.fieldbyname('APD_SAT_CODE').AsString;
        Cells[6, i] := CurrToStr(data.fieldbyname('APD_COGS').AsCurrency);
        Cells[7, i] := CurrToStr(data.fieldbyname('APD_LAST_COST').AsCurrency);
        Cells[8, i] := data.fieldbyname('BRG_ALIAS').AsString;

        Inc(i);
        data.Next;
      end;
    end
    else
    begin
      RowCount := 2;
      Cells[0, 1] := '';
      Cells[1, 1] := '';
      Cells[2, 1] := '';
      Cells[3, 1] := '';
      Cells[4, 1] := '';
      Cells[5, 1] := '';
      Cells[6, 1] := '';
      Cells[7, 1] := '';
      Cells[8, 1] := '';
    end;

    FixedRows := 1;
    AutoSize := True;
  end;

  edtProductName.Text := strgGrid.Cells[8, 1];
end;

procedure TfrmDialogAdjustmentProduct.FormShow(Sender: TObject);
begin
  inherited;
  case StatusForm of
    frEdit:
    begin
      ParseDataAdjustmentDetil;
    end;
    frApply:
    begin
      ParseDataAdjustmentDetil;
    end;
  end;
end;

function TfrmDialogAdjustmentProduct.UpdateDataAdjustmentProduct: Boolean;
var arrParam: TArr;
    i: Integer;
    bResult, bResult2, bResult3: Boolean;
begin
//  bResult := False;
  bResult2 := False;
//  bResult3 := False;

  SetLength(arrParam, 9);
  arrParam[0].tipe := ptString;
  arrParam[0].data := edt1.Text;
  arrParam[1].tipe := ptDateTime;
  arrParam[1].data := dtTglOpnam.Date;
  arrParam[2].tipe := ptString;
  arrParam[2].data := cbbPilihan.Text;
  arrParam[3].tipe := ptString;
  arrParam[3].data := edtRemark.Text;
  arrParam[4].tipe := ptCurrency;
  arrParam[4].data := curredtTotAdjustment.Value;
  arrParam[5].tipe := ptString;
  arrParam[5].data := 'OPEN';
  arrParam[6].tipe := ptInteger;
  arrParam[6].data := FLoginId;
  arrParam[7].tipe := ptInteger;
  arrParam[7].data := adjProductId;
  arrParam[8].tipe := ptInteger;
  arrParam[8].data := DialogUnit;

  bResult := objAdjustmentStock.UpdateDataAdjustmentProduct(arrParam);

  SetLength(arrParam, 2);
  arrParam[0].tipe := ptInteger;
  arrParam[0].data := adjProductId;
  arrParam[1].tipe := ptInteger;
  arrParam[1].data := DialogUnit;

  bResult3 := objAdjustmentStock.DeleteDataAdjustmentProductDetil(arrParam);

  for i := 1 to strgGrid.RowCount - 1 do
  begin
    if strgGrid.Cells[0, i] <> '' then
    begin
      SetLength(arrParam, 10);
      arrParam[0].tipe := ptInteger;
      arrParam[0].data := adjProductId;
      arrParam[1].tipe := ptString;
      arrParam[1].data := strgGrid.Cells[0, i];
      arrParam[2].tipe := ptString;
      arrParam[2].data := strgGrid.Cells[5, i];
      arrParam[3].tipe := ptString;
      arrParam[3].data := strgGrid.Cells[1, i];
      arrParam[4].tipe := ptCurrency;
      arrParam[4].data := StrToCurr(strgGrid.Cells[3, i]);
      arrParam[5].tipe := ptCurrency;
      arrParam[5].data := StrToCurr(strgGrid.Cells[6, i]);
      arrParam[6].tipe := ptCurrency;
      arrParam[6].data := StrToCurr(strgGrid.Cells[7, i]);
      arrParam[7].tipe := ptCurrency;
      arrParam[7].data := StrToFloat(strgGrid.Cells[4, i]);
      arrParam[8].tipe := ptCurrency;
      arrParam[8].data := StrToCurr(strgGrid.Cells[3, i]) * StrToInt(strgGrid.Cells[4, i]);
      arrParam[9].tipe := ptInteger;
      arrParam[9].data := FLoginId;

      bResult2 := objAdjustmentStock.InsertDataAdjustmentProductDetil(arrParam);
    end;
  end;

  if bResult and bResult2 and bResult3 then
  begin
    ADConn.Commit;
    Result := True;
  end
  else
  begin
    ADConn.Rollback;
    Result := False;
  end;
end;

function TfrmDialogAdjustmentProduct.InsertDataAdjustmentIntoBSS: Boolean;
var arrParam: TArr;
    i: Integer;
    bResult, bResult2: Boolean;
begin
  bResult := False;
  bResult2 := False;

  for i := 1 to strgGrid.RowCount - 1 do
  begin
    SetLength(arrParam, 12);
    arrParam[0].tipe := ptInteger;
    arrParam[0].data := DialogUnit;
    arrParam[1].tipe := ptString;
    arrParam[1].data := strgGrid.Cells[0, i];
    arrParam[2].tipe := ptInteger;
    arrParam[2].data := DialogUnit;
    arrParam[3].tipe := ptDateTime;
    arrParam[3].data := Now;
    arrParam[4].tipe := ptCurrency;
    arrParam[4].data := StrToFloat(strgGrid.Cells[4, i]);
    arrParam[5].tipe := ptCurrency;
    arrParam[5].data := StrToFloat(strgGrid.Cells[4, i]);
    arrParam[6].tipe := ptString;
    arrParam[6].data := edt1.Text;
    arrParam[7].tipe := ptString;
    arrParam[7].data := 'ADJUSTMENT PRODUCT';
    arrParam[8].tipe := ptString;
    arrParam[8].data := edtRemark.Text;
    arrParam[9].tipe := ptInteger;
    arrParam[9].data := FLoginId;
    arrParam[10].tipe := ptString;
    arrParam[10].data := strgGrid.Cells[5, i];
    arrParam[11].tipe := ptInteger;
    arrParam[11].data := DialogUnit;

    bResult := objAdjustmentStock.InsertDataToBSS(arrParam);

    SetLength(arrParam, 5);
    arrParam[0].tipe := ptString;
    arrParam[0].data := 'POSTED';
    arrParam[1].tipe := ptDateTime;
    arrParam[1].data := Now;
    arrParam[2].tipe := ptInteger;
    arrParam[2].data := FLoginId;
    arrParam[3].tipe := ptInteger;
    arrParam[3].data := adjProductId;
    arrParam[4].tipe := ptInteger;
    arrParam[4].data := DialogUnit;

    bResult2 := objAdjustmentStock.UpdateDataAdjustmentProductSetStatusPosted(arrParam);
  end;

  if bResult and bResult2 then
  begin
    ADConn.Commit;
    Result := True;
  end
  else
  begin
    ADConn.Rollback;
    Result := False;
  end;  
end;

end.
