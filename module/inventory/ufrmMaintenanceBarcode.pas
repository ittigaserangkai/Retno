unit ufrmMaintenanceBarcode;

interface

uses
  Windows, SysUtils, Variants, Classes, Controls, Forms,
  ufrmMasterBrowse, StdCtrls, ExtCtrls, ActnList,
  frxClass, frxBarcode, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  cxCurrencyEdit, System.Actions, ufraFooter4Button, cxButtons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC;

type
  TBarcodeSize = (bsPriceTag, bsPluExCode, bsDesciption, bsSubGrupPlu, bsPrice);
  TSearchFor = (sfPLU, sfCatalog, sfPO, sfNone);
  TfrmMaintenanceBarcode = class(TfrmMasterBrowse)
    pnl1: TPanel;
    lbl1: TLabel;
    lblPrice: TLabel;
    lbl3: TLabel;
    edtProductCode: TEdit;
    edtProductName: TEdit;
    edtBarcodeOld: TEdit;
    BarcodeSize: TComboBox;
    Label1: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    edtSubGroupID: TEdit;
    edtCategoryID: TEdit;
    curredtPrice: TcxCurrencyEdit;
    curredtPriceScoreOut: TcxCurrencyEdit;
    Uom: TLabel;
    edtUomID: TEdit;
    edtUomNm: TEdit;
    Label2: TLabel;
    edtBarcodeNew: TEdit;
    edtSubGroupNm: TEdit;
    edtCategoryNm: TEdit;
    edtOutletID: TEdit;
    edtOutletNm: TEdit;
    Label3: TLabel;
    chkUpdate: TCheckBox;
    actDeleteRow: TAction;
    actUpdateBarcode: TAction;
    btnUpBarCode: TcxButton;
    btnSearchPO: TcxButton;
    procedure actAddExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure strgGridKeyPress(Sender: TObject; var Key: Char);
//    procedure edtProductCodeKeyPress(Sender: TObject; var Key: Char);
    procedure BarcodeSizeChange(Sender: TObject);
    procedure actDeleteRowExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure frxrprtReport1GetValue(const VarName: String;
      var Value: Variant);
    procedure actUpdateBarcodeExecute(Sender: TObject);
    procedure chkUpdateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure udsBarcodeFirst(Sender: TObject);
    procedure udsBarcodeNext(Sender: TObject);
    procedure udsBarcodePrior(Sender: TObject);
    procedure udsBarcodeCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure edtProductCodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtUomIDKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtBarcodeOldKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    noRow           : Integer;
    FRecNo          : Integer;
    FRecMax         : Integer;
    slNamaBrg       : TStringList;
    slPlu           : TStringList;
    slExtCode       : TStringList;
    slBarcode       : TStringList;
    slPrice         : TStringList;
    slPriceScoreOut : TStringList;
    slDescription   : TStringList;
    slSubGrup       : TStringList;
    slKatCode       : TStringList;
    slOutlet        : TStringList;
    slTgl           : TStringList;

    FSizeOfBarcode: TBarcodeSize;

    procedure ClearAtributData;
    procedure ClearAttribut;
    procedure ParseHeaderGrid;

    procedure SetBarcodeSize(const Aval: TBarcodeSize);

    procedure GetBrgCode(alsLookup: Boolean);
    procedure GetBrgUom(alsLookup: Boolean);
    procedure SetData;
  public
    procedure LoadDataFromPO(aPONo : string; aUnitID : Integer);
    { Public declarations }
  published
    property SizeOfBarcode: TBarcodeSize read FSizeOfBarcode write SetBarcodeSize;
  end;

var
  frmMaintenanceBarcode: TfrmMaintenanceBarcode;

implementation

uses 
  uTSCommonDlg, Math, uRetnoUnit;

{$R *.dfm}
const
{
PLU CODE
BARCODE NO
PRODUCT NAME
QTY
DESCRIPTION
PRICE
PRICE SCORE OUT
SUB GROUP
CATEGORY GROUP
}
  _kolNo        : Integer = 0;
  _kolPlu       : Integer = 1;
  _kolUom       : Integer = 2;
  _kolBarcode   : Integer = 3;
  _kolPluNm     : Integer = 4;
  _kolQty       : Integer = 5;
  _kolDesc      : Integer = 6;
  _kolPrice     : Integer = 7;
  _kolPriceSOut : Integer = 8;
  _kolSubGrp    : integer = 9;
  _kolCategory  : Integer = 10;
  _kolOutlet    : Integer = 11;

  _fixedRow     : Integer = 1;
  _rowCount     : Integer = 2;
  _colCount     : Integer = 12;
  _typeHrg      : Integer = 2;


procedure TfrmMaintenanceBarcode.actAddExecute(Sender: TObject);
begin
  inherited;
  ClearAttribut;
  ClearAtributData;
  ParseHeaderGrid;
end;

procedure TfrmMaintenanceBarcode.SetBarcodeSize(const  Aval: TBarcodeSize);
begin
  FSizeOfBarcode:= Aval;
end;

procedure TfrmMaintenanceBarcode.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  Action:= caFree;
end;

procedure TfrmMaintenanceBarcode.FormDestroy(Sender: TObject);
begin
  inherited;

  frmMaintenanceBarcode:= nil;
end;

procedure TfrmMaintenanceBarcode.actPrintExecute(Sender: TObject);
var
  i, j,
  Qty   : Integer;
begin
  {if (strgGrid.RowCount=2) and (strgGrid.Cells[0,1]='') then
  begin
    CommonDlg.ShowErrorEmpty('Data on grid');
    Exit;
  end;
  
  if (strgGrid.Cells[_kolQty,strgGrid.Row]='') then
  begin
    CommonDlg.ShowErrorEmpty('QUANTITY of '+strgGrid.Cells[1,strgGrid.Row]);
    Exit;
  end;

  slNamaBrg       := TStringList.Create;
  slPlu           := TStringList.Create;
  slExtCode       := TStringList.Create;
  slBarcode       := TStringList.Create;
  slPrice         := TStringList.Create;
  slPriceScoreOut := TStringList.Create;
  slDescription   := TStringList.Create;
  slSubGrup       := TStringList.Create;
  slKatCode       := TStringList.Create;
  slOutlet        := TStringList.Create;
  slTgl           := TStringList.Create;
  try
    FRecMax := 0;
    for i := strgGrid.FixedRows to strgGrid.RowCount - 1 do // row count of string grid
    begin
      if strgGrid.Cells[_kolNo, i]<>'' then
      begin
        Qty := StrToInt(strgGrid.Cells[_kolQty,i]);
        FRecMax := FRecMax + Qty;
        for j:= 1 to Qty do //quantity of product
        begin

          slNamaBrg.Add(strgGrid.Cells[_kolPluNm, i]);
          slPlu.Add(strgGrid.Cells[_kolPlu,i]);
          slExtCode.Add(strgGrid.Cells[_kolBarcode, i]);
          slBarcode.Add(strgGrid.Cells[_kolBarcode, i]);
          slPrice.Add(strgGrid.Cells[_kolPrice,i]);
          slPriceScoreOut.Add(strgGrid.Cells[_kolPriceSOut,i]);
          slDescription.Add(strgGrid.Cells[_kolDesc,i]);
          slSubGrup.Add(strgGrid.Cells[_kolSubGrp,i]);
          slKatCode.Add(strgGrid.Cells[_kolCategory,i]);
          slOutlet.Add(strgGrid.Cells[_kolOutlet,i]);
          slTgl.Add(FormatDateTime('DD-MM-YYYY',cGetServerTime));
        end;
      end
      else
        Break;
    end;

    udsBarcode.RangeEndCount := slNamaBrg.Count;
                                    //ExtractFilePath(Application.ExeName) + '/template/BarcodeSubGrupnExCode1.fr3');
    case SizeOfBarcode of
      bsPriceTag  : frxrprtReport1.LoadFromFile(FFilePathReport + '\PriceTag1.fr3');
      bsPluExCode : frxrprtReport1.LoadFromFile(FFilePathReport + '\BarcodeSubGrupnExCode1.fr3');
      bsDesciption: frxrprtReport1.LoadFromFile(FFilePathReport + '\BarcodeSubGrupnDesc1.fr3');
      bsSubGrupPlu: frxrprtReport1.LoadFromFile(FFilePathReport + '\BarcodeSubGrupnPlu1.fr3');
      bsPrice     : frxrprtReport1.LoadFromFile(FFilePathReport + '\BarcodeSubGrupnPrice1.fr3');
    end;

    frxrprtReport1.ShowReport;
  finally
    FreeAndNil(slNamaBrg);
    FreeAndNil(slPlu);
    FreeAndNil(slExtCode);
    FreeAndNil(slBarcode);
    FreeAndNil(slPrice);
    FreeAndNil(slPriceScoreOut);
    FreeAndNil(slDescription);
    FreeAndNil(slSubGrup);
    FreeAndNil(slKatCode);
    FreeAndNil(slOutlet);
  end;
  }
end;

procedure TfrmMaintenanceBarcode.FormShow(Sender: TObject);
begin
  ParseHeaderGrid;
  BarcodeSize.ItemIndex:= 0;
  FSizeOfBarcode:= bsPriceTag;
  edtProductCode.SetFocus;
end;

procedure TfrmMaintenanceBarcode.strgGridKeyPress(Sender: TObject;
  var Key: Char);
begin
//  if (strgGrid.Col = 2) then
    if not (Key in ['0'..'9', Chr(VK_DELETE), Chr(VK_BACK)]) then
      Key := #0;
end;

procedure TfrmMaintenanceBarcode.BarcodeSizeChange(Sender: TObject);
begin
  inherited;
  case BarcodeSize.ItemIndex of
     0: FSizeOfBarcode:= bsPriceTag;
     1: FSizeOfBarcode:= bsPluExCode;
     2: FSizeOfBarcode:= bsDesciption;
     3: FSizeOfBarcode:= bsSubGrupPlu;
     4: FSizeOfBarcode:= bsPrice;
  end;    // case
end;

procedure TfrmMaintenanceBarcode.actDeleteRowExecute(Sender: TObject);
begin
  inherited;
//  strgGrid.RemoveSelectedRows;
end;

procedure TfrmMaintenanceBarcode.actEditExecute(Sender: TObject);
begin
  inherited;
  {if strgGrid.RowCount > strgGrid.FixedRows then
  begin
    if strgGrid.RowCount > strgGrid.FixedRows + 1 then
    begin
      strgGrid.RemoveRows(strgGrid.row , 1);
    end
    else
    begin
      strgGrid.ClearRows(strgGrid.row, 1);
    end;
    noRow := noRow - 1;

  end;
  }
end;

procedure TfrmMaintenanceBarcode.actRefreshExecute(Sender: TObject);
var
  sSQL: string;
  aPOUnitID : integer;
begin

  inherited;
  chkUpdate.Checked := False;
  aPOUnitID := MasterNewUnit;
  sSQL := 'SELECT P.PO_NO, P.PO_DATE,SMG.SUPMG_CODE, '
          + ' P.PO_VALID_DATE, P.PO_TOTAL, STA.STAPO_NAME, P.PO_DESC_PRINT '
          + ' FROM PO P, REF$STATUS_PO STA, SUPLIER_MERCHAN_GRUP SMG, REF$MERCHANDISE_GRUP MG '
          + ' WHERE STA.STAPO_ID=P.PO_STAPO_ID '
          + ' AND STA.STAPO_UNT_ID=P.PO_STAPO_UNT_ID '
          + ' AND SMG.SUPMG_SUB_CODE=P.PO_SUPMG_SUB_CODE '
          + ' AND SMG.SUPMG_MG_UNT_ID = P.PO_SUPMG_UNT_ID '
          + ' AND MG.MERCHANGRUP_ID = SMG.SUPMG_MERCHANGRUP_ID '
          + ' AND MG.MERCHANGRUP_UNT_ID = SMG.SUPMG_UNT_ID '
//          + ' and P.PO_STAPO_ID = 5' //telah receive
          + ' AND P.po_unt_id = ' + IntToStr(aPOUnitID);
  {
  with cLookUp('Daftar PO', sSQL) do
  begin
    try
      LoadDataFromPO(Strings[0], aPOUnitID);
    finally
      Free;
    end;
  end;
}
end;

procedure TfrmMaintenanceBarcode.frxrprtReport1GetValue(const VarName: String;
  var Value: Variant);
begin
  inherited;
//  if FSizeOfBarcode = bsPriceTag then
//  begin
//    if CompareText(VarName, 'nama_barang') = 0 then
//      Value := slNamaBrg[udsBarcode.RecNo];
//
//    if CompareText(VarName, 'plu') = 0 then
//      Value := slPlu[udsBarcode.RecNo];
//
//    if CompareText(VarName, 'ext_code') = 0 then
//      Value := slExtCode[udsBarcode.RecNo];
//
//    if CompareText(VarName, 'barcode') = 0 then
//      Value := slBarcode[udsBarcode.RecNo];
//
//    if CompareText(VarName, 'harga') = 0 then
//      Value := slPrice[udsBarcode.RecNo];
//
//    if CompareText(VarName, 'subgrup') = 0 then
//      Value := slSubGrup[udsBarcode.RecNo];
//
//    if CompareText(VarName, 'tgl') = 0 then
//      Value := slTgl[udsBarcode.RecNo];
//
//  end
//  else if FSizeOfBarcode = bsPluExCode then
//  begin
//    if CompareText(VarName, 'nama_barang') = 0 then
//      Value := slNamaBrg[udsBarcode.RecNo];
//
//    if CompareText(VarName, 'plu') = 0 then
//      Value := slPlu[udsBarcode.RecNo];
//
//    if CompareText(VarName, 'excode') = 0 then
//      Value := slExtCode[udsBarcode.RecNo];
//
//    if CompareText(VarName, 'barcode') = 0 then
//      Value := slBarcode[udsBarcode.RecNo];
//
//    if CompareText(VarName, 'subgrup') = 0 then
//      Value := slSubGrup[udsBarcode.RecNo];
//  end
//  else if FSizeOfBarcode = bsDesciption then
//  begin
//    if CompareText(VarName, 'nama_barang') = 0 then
//      Value := slNamaBrg[udsBarcode.RecNo];
//
//    if CompareText(VarName, 'plu') = 0 then
//      Value := slPlu[udsBarcode.RecNo];
//
//    if CompareText(VarName, 'barcode') = 0 then
//      Value := slBarcode[udsBarcode.RecNo];
//
//    if CompareText(VarName, 'Desc') = 0 then
//      Value := slDescription[udsBarcode.RecNo];
//
//    if CompareText(VarName, 'subgrup') = 0 then
//      Value := slSubGrup[udsBarcode.RecNo];
//  end
//  else if FSizeOfBarcode = bsSubGrupPlu then
//  begin
//    if CompareText(VarName, 'nama_barang') = 0 then
//      Value := slNamaBrg[udsBarcode.RecNo];
//
//    if CompareText(VarName, 'plu') = 0 then
//      Value := slPlu[udsBarcode.RecNo];
//
//    if CompareText(VarName, 'barcode') = 0 then
//      Value := slBarcode[udsBarcode.RecNo];
//
//    if CompareText(VarName, 'subgrup') = 0 then
//      Value := slSubGrup[udsBarcode.RecNo];
//
//    if CompareText(VarName, 'outlet') = 0 then
//      Value := slOutlet[udsBarcode.RecNo];
//  end
//  else if FSizeOfBarcode = bsPrice then
//  begin
//    if CompareText(VarName, 'nama_barang') = 0 then
//      Value := slNamaBrg[udsBarcode.RecNo];
//
//    if CompareText(VarName, 'plu') = 0 then
//      Value := slPlu[udsBarcode.RecNo];
//
//    if CompareText(VarName, 'barcode') = 0 then
//      Value := slBarcode[udsBarcode.RecNo];
//
//    if CompareText(VarName, 'harga') = 0 then
//      Value := slPrice[udsBarcode.RecNo];
//
//    if CompareText(VarName, 'kat') = 0 then
//      Value := slKatCode[udsBarcode.RecNo];
//  end
end;

procedure TfrmMaintenanceBarcode.actUpdateBarcodeExecute(Sender: TObject);
var
  i, j      : Integer;   
  isUpBy    : Boolean;
  sBarCode  : string;
begin
  inherited;
  if Trim(edtProductCode.Text)='' then Exit;

  isUpBy  := True;
  {
  if chkUpdate.Checked then
  begin
    isUpBy := UpdateByBrgCodeUom(edtBarcodeNew.Text, edtProductCode.Text,
        edtUomID.Text, masternewunit.id);

    if isUpBy then
    begin
      sBarCode  := edtBarcodeNew.Text;
      CommonDlg.ShowMessage('Update Sukses');
    end
    else
    begin
      CommonDlg.ShowMessage('Update Gagal!');
    end;
  end
  else
  begin
    sBarCode  := edtBarcodeOld.Text;
  end;

  if isUpBy then
  begin
    if strgGrid.FloatingFooter.Visible then
    j := _fixedRow + 1
    else
    j := _fixedRow;

    i := strgGrid.rowCount;

   if noRow<0 then noRow := 0;
   if (noRow >= i -j) then
    strgGrid.AddRow;

    strgGrid.Cells[_kolNo, noRow + _fixedRow]        := IntToStr(noRow + 1);
    strgGrid.Cells[_kolPlu, noRow + _fixedRow]       := edtProductCode.Text;
    strgGrid.Cells[_kolUom, noRow + _fixedRow]       := edtUomID.Text;
    strgGrid.Cells[_kolBarcode, noRow + _fixedRow]   := sBarCode;
    strgGrid.Cells[_kolPluNm, noRow + _fixedRow]     := edtProductName.Text;
    strgGrid.Cells[_kolPrice, noRow + _fixedRow]     := CurrToStr(curredtPrice.Value);
    strgGrid.Cells[_kolPriceSOut, noRow + _fixedRow] := CurrToStr(curredtPriceScoreOut.Value);
    strgGrid.Cells[_kolSubGrp, noRow + _fixedRow]    := edtSubGroupID.Text;
    strgGrid.Cells[_kolCategory, noRow + _fixedRow]  := edtCategoryID.Text;
    strgGrid.Cells[_kolOutlet, noRow + _fixedRow]    := edtOutletID.Text;

    Inc(noRow);
    strgGrid.AutoSize := True;
  end;
  ClearAttribut;
  ClearAtributData;

  }

end;


procedure TfrmMaintenanceBarcode.ParseHeaderGrid;
begin
 {
  with strgGrid do
  begin
    Clear;
    Cells[_kolNo,0]         := 'NO';
    Cells[_kolPlu,0]        := 'PLU CODE';
    Cells[_kolUom,0]        := 'UOM';
    Cells[_kolBarcode,0]    := 'BARCODE';
    Cells[_kolPluNm,0]      := 'PRODUCT NAME';
    Cells[_kolQty,0]        := 'QTY';
    Cells[_kolDesc,0]       := 'DESCRIPTION';
    Cells[_kolPrice,0]      := 'PRICE';
    Cells[_kolPriceSOut,0]  := 'PRICE SCORE OUT';
    Cells[_kolSubGrp,0]     := 'SUB GROUP';
    Cells[_kolCategory,0]   := 'CATEGORY GROUP';
    Cells[_kolOutlet,0]     := 'OUTLET ID';

    RowCount  := _rowCount;
    ColCount  := _colCount;
    FixedRows := _fixedRow;
    AutoSize  := True;

  end;
  noRow := 0 ;
  }
end;

procedure TfrmMaintenanceBarcode.GetBrgCode(alsLookup: Boolean);
var
  sSQL : string;
begin
  sSQL  := 'select a.BHJ_BRG_CODE as Kode, c.BRG_ALIAS as Nama,'
      + ' a.BHJ_SAT_CODE "UOM JUAL", c.BRG_SAT_CODE_STOCK as "UOM STOCK",'
      + ' a.BHJ_SELL_PRICE as "HARGA",'
      + ' a.BHJ_DISC_PERSEN AS "DISCOUNT %", a.BHJ_DISC_NOMINAL AS "DISCOUNT",'
      + ' a.BHJ_SELL_PRICE_DISC'
      + ' from BARANG_HARGA_JUAL a , REF$TIPE_HARGA b, barang c'
      + ' where a.BHJ_TPHRG_ID=b.TPHRG_ID'
      + ' and a.BHJ_TPHRG_UNT_ID=b.TPHRG_UNT_ID'
      + ' AND (c.BRG_CODE = a.BHJ_BRG_CODE AND c.BRG_UNT_ID = a.BHJ_BRG_CODE_UNT_ID)'
      + ' and a.BHJ_TPHRG_ID = '+ IntToStr(_typeHrg)
      + ' and a.BHJ_BRG_CODE_UNT_ID = '+ IntToStr(masternewunit);

  {
  if not alsLookup then
  begin
    sSQL  := sSQL + ' AND a.BHJ_BRG_CODE = '+ Quot(edtProductCode.Text);
    with cOpenQuery(sSQL)do
    begin
      try
        if not Eof then
        begin
          edtProductName.Text := Fields[1].AsString;
        end;

      finally
        Free;
      end;
    end;
  end
  else
    GetDataIdNm('Get Data', sSQL, edtProductCode, edtProductName);
   }
end;

procedure TfrmMaintenanceBarcode.GetBrgUom(alsLookup: Boolean);
var
  sSQL : string;
begin
 sSQL := 'SELECT c.KONVSAT_SAT_CODE_FROM AS "UOM JUAL",'
      + ' a.SAT_NAME AS "UOM NAME",'
      + ' c.KONVSAT_SAT_CODE_TO AS "UOM STOCK", c.KONVSAT_SCALE AS "KONVERSI"'
      + ' FROM REF$KONVERSI_SATUAN c, REF$SATUAN a'
      + ' where c.KONVSAT_SAT_CODE_FROM = a.SAT_CODE'
      + ' and c.KONVSAT_SCF_UNT_ID = a.SAT_UNT_ID'
      + ' and c.KONVSAT_BRG_CODE = '+ QuotedStr(edtProductCode.Text)
      + ' and c.KONVSAT_BRG_UNT_ID = '+ IntToStr(masternewunit);
 {

 if not alsLookup then
 begin
  edtUomID.Text := UpperCase(edtUomID.Text);
  sSQL  := sSQL + ' AND c.KONVSAT_SAT_CODE_FROM ='+ QuotedStr(edtUomID.Text);
  with cOpenQuery(sSQL) do
  begin
    try
      if not Eof then
      begin
        edtUomNm.Text := Fields[1].AsString;
      end;  
    finally
      Free
    end;
  end;  
 end
 else
  GetDataIdNm('Get Data', sSQL, edtUomID, edtUomNm);
  }
end;

procedure TfrmMaintenanceBarcode.SetData;
var
  sSQL  : string;
begin
  sSQL  := 'select distinct a.BHJ_BRG_CODE as Kode,'
//   c.BRG_ALIAS as Nama,'
//      + ' a.BHJ_SAT_CODE "UOM JUAL", c.BRG_SAT_CODE_STOCK as "UOM STOCK",'
//      + ' a.BHJ_SELL_PRICE as "HARGA",'
      + ' a.BHJ_SELL_PRICE_DISC, BHJ_SELL_PRICE_CORET,'
      + ' e.SUBGRUP_CODE, e.SUBGRUP_NAME, d.KAT_CODE, d.KAT_NAME,'
      + ' f.OUTLET_CODE, f.OUTLET_NAME, g.KONVSAT_BARCODE,'
      + ' a.BHJ_DISC_PERSEN AS "DISCOUNT %",'
      + ' a.BHJ_DISC_NOMINAL AS "DISCOUNT"'

      + ' from BARANG_HARGA_JUAL a , barang c, REF$KATEGORI d, REF$SUB_GRUP e,'
      + ' REF$OUTLET f, REF$konversi_satuan g'
      + ' where (c.BRG_CODE = a.BHJ_BRG_CODE AND c.BRG_UNT_ID = a.BHJ_BRG_CODE_UNT_ID)'
      + ' and c.BRG_KAT_ID = d.KAT_ID'
      + ' AND c.BRG_UNT_ID = d.KAT_UNT_ID'
      + ' and d.KAT_SUBGRUP_ID = e.SUBGRUP_ID'
      + ' AND d.KAT_SUBGRUP_UNT_ID = e.SUBGRUP_UNT_ID'
      + ' and f.OUTLET_ID = c.BRG_OUTLET_ID'
      + ' and f.OUTLET_UNT_ID = c.BRG_OUTLET_UNT_ID'
      + ' and g.KONVSAT_SAT_CODE_FROM = a.BHJ_SAT_CODE'
      + ' and g.KONVSAT_SCF_UNT_ID = a.BHJ_SAT_CODE_UNT_ID'
      + ' and g.KONVSAT_BRG_CODE = a.BHJ_BRG_CODE'
      + ' and g.KONVSAT_BRG_UNT_ID = a.BHJ_BRG_CODE_UNT_ID'
      + ' and a.BHJ_SAT_CODE = '+ QuotedStr(edtUomID.Text)
      + ' and a.BHJ_BRG_CODE_UNT_ID = '+ IntToStr(masternewunit)
      + ' and a.BHJ_BRG_CODE = '+ QuotedStr(edtProductCode.Text)
      + ' and a.BHJ_TPHRG_ID = 2 ' //set harga toko
      + ' order by a.DATE_CREATE desc';
  {
  with cOpenQuery(sSQL) do
  begin
    try
      if not Eof then
      begin
        curredtPrice.Value          := Fields[1].AsCurrency;
        curredtPriceScoreOut.Value  := Fields[2].AsCurrency;
        edtSubGroupID.Text          := Fields[3].AsString;
        edtSubGroupNm.Text          := Fields[4].AsString;
        edtCategoryID.Text          := Fields[5].AsString;
        edtCategoryNm.Text          := Fields[6].AsString;
        edtOutletID.Text            := Fields[7].AsString;
        edtOutletNm.Text            := Fields[8].AsString;
        edtBarcodeOld.Text          := Fields[9].AsString;
      end
      else
        CommonDlg.ShowError('Barang Penjualan '+ Trim(edtProductName.Text) +' tidak ada');

    finally
      Free;
    end;
  end;
  }
end;

procedure TfrmMaintenanceBarcode.chkUpdateClick(Sender: TObject);
begin
  inherited;
  if chkUpdate.Checked then
    btnUpBarCode.Caption  := 'Update'
  else
   btnUpBarCode.Caption  := 'Load';
end;

procedure TfrmMaintenanceBarcode.ClearAtributData;
begin
  edtBarcodeOld.Clear;
  edtBarcodeNew.Clear;
  edtUomID.Clear;
  edtUomNm.Clear;
  chkUpdate.Checked := False;
  edtSubGroupID.Clear;
  edtSubGroupNm.Clear;
  edtCategoryID.Clear;
  edtCategoryNm.Clear;
  edtOutletID.Clear;
  edtOutletNm.Clear;
  curredtPrice.Clear;
  curredtPrice.Value := 0;
  curredtPriceScoreOut.Clear;
  curredtPriceScoreOut.Value := 0;
  BarcodeSize.ItemIndex:= 0;  
end;

procedure TfrmMaintenanceBarcode.ClearAttribut;
begin
  edtProductCode.Clear;
  edtProductName.Clear;

end;

procedure TfrmMaintenanceBarcode.FormCreate(Sender: TObject);
begin
  inherited;
  chkUpdateClick(self);
  actEditExecute(self);
  edtProductCode.MaxLength := igProd_Code_Length;
  edtProductCode.CharCase  := ecUpperCase;
end;

procedure TfrmMaintenanceBarcode.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  inherited;
  if (Key = Ord( 'P')) and (ssctrl in Shift) then
    actPrintExecute(Self)
  else if (Key = Ord('R')) and (ssctrl in Shift) then
    actEditExecute(Self)
  else if (Key = Ord('D')) and (ssctrl in Shift) then
    actAddExecute(Self);

end;

procedure TfrmMaintenanceBarcode.udsBarcodeFirst(Sender: TObject);
begin
  inherited;
  FRecNo  := 0;
end;

procedure TfrmMaintenanceBarcode.udsBarcodeNext(Sender: TObject);
begin
  inherited;
  Inc(FRecNo);  
end;

procedure TfrmMaintenanceBarcode.udsBarcodePrior(Sender: TObject);
begin
  inherited;
  Dec(FRecNo);
end;

procedure TfrmMaintenanceBarcode.udsBarcodeCheckEOF(Sender: TObject;
  var Eof: Boolean);
begin
  inherited;
  Eof   :=   FRecNo   >   FRecMax - 1;
end;

procedure TfrmMaintenanceBarcode.edtProductCodeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = vk_F5) or (key = vk_return) then
  begin
    ClearAtributData;

    if Key = VK_F5 then
    begin
      GetBrgCode(True);
    end
    else if Key = VK_RETURN then
    begin
      GetBrgCode(False);
    end;

  end;
end;

procedure TfrmMaintenanceBarcode.edtUomIDKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F5 then
  begin
    GetBrgUom(True);
  end
  else if Key = VK_RETURN then
  begin
    GetBrgUom(False);
  end;

  if (Trim(edtUomID.Text) <> '') then
    edtBarcodeOldKeyUp(Self, Key, Shift);
end;

procedure TfrmMaintenanceBarcode.edtBarcodeOldKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) or (Key = VK_F5)  then
  begin
    SetData;
  end;
end;

procedure TfrmMaintenanceBarcode.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if(Key = Ord('P')) and (ssctrl in Shift) then   //Print
    actPrintExecute(Self)
  else if (Key = Ord('D')) and (ssctrl in Shift) then  //Clear
    actAddExecute(sender)
  else if (Key = Ord('R')) and (ssctrl in Shift) then  //Remove
    actEditExecute(sender)
  else if (Key = VK_Escape) and (ssctrl in Shift) then  //Remove
    Close;

end;

procedure TfrmMaintenanceBarcode.LoadDataFromPO(aPONo : string; aUnitID :
    Integer);
var
  iBaris: Integer;
//  FDO: TDelivery;
//  FPO: TPO;
  i: Integer;
begin
  {FPO := TPO.Create(Self);
  FDO := TDelivery.Create(Self);

  FPO.LoadByNoBukti(aPONo, aUnitID);
  if FPO.StatusPO.ID = 5 then
  begin
    //ini jika sudah ada GR
    // Untuk item regular PO
    iBaris := 0;
    FDO.LoadByNoPO(aPONo,aUnitID);
    if FDO.DeliveryItems.Count > 0 then
    begin
      strgGrid.RowCount := FDO.DeliveryItems.Count + 1;
      for i := 0 to FDO.DeliveryItems.Count - 1 do
      begin
        iBaris := i + 1;
        edtProductCode.Text := FDO.DeliveryItems[i].Barang.Kode;
        edtProductName.Text := FDO.DeliveryItems[i].Barang.Alias;
        edtUomID.Text := FDO.DeliveryItems[i].SatKodeOrder.UOM;
        edtUomNm.Text := FDO.DeliveryItems[i].SatKodeOrder.Nama;
        strgGrid.Ints[_kolQty, iBaris] := Ceil(FDO.DeliveryItems[i].QtyOrderRecv);
        strgGrid.Cells[_kolDesc, iBaris] := aPONo;
        if (Trim(edtUomID.Text) <> '') then
        begin
          SetData;
          actUpdateBarcodeExecute(btnSearch);
        end;
      end;
    end;
    // Untuk item PO bonus
    if FDO.GRBonusItems.Count > 0 then
    begin
      strgGrid.RowCount := FDO.DeliveryItems.Count + FDO.GRBonusItems.Count + 1;
      for i := (iBaris) to (FDO.GRBonusItems.Count - 1 + iBaris) do
      begin
        iBaris := i + 1;
        edtProductCode.Text := FDO.GRBonusItems[i].NewBarang.Kode;
        edtProductName.Text := FDO.GRBonusItems[i].NewBarang.Alias;
        edtUomID.Text := FDO.GRBonusItems[i].NewUOM.UOM;
        edtUomNm.Text := FDO.GRBonusItems[i].NewUOM.Nama;
        strgGrid.Ints[_kolQty, iBaris] := Ceil(FDO.GRBonusItems[i].Qty);
        strgGrid.Cells[_kolDesc, iBaris] := aPONo;
        if (Trim(edtUomID.Text) <> '') then
        begin
          SetData;
          actUpdateBarcodeExecute(btnSearch);
        end;
      end;
    end;

  end
  else
  begin
    // ini yg PO Biasa
    //tidak bisa langsung disebab perubahan format po
    FPO.POItems.LoadByNoBukti(FPO.NoBukti, MasterNewUnit.ID);
    if FPO.POItems.Count > 0 then
    begin
      strgGrid.RowCount := FPO.POItems.Count + 1;
      for i := 0 to FPO.POItems.Count - 1 do
      begin
        iBaris := i + 1;
        edtProductCode.Text := FPO.POItems[i].Barang.Kode;
        edtProductName.Text := FPO.POItems[i].Barang.Alias;
        edtUomID.Text := FPO.POItems[i].SatCodeOrder.UOM;
        edtUomID.Text := FPO.POItems[i].SatCodeOrder.Nama;
        strgGrid.Ints[_kolQty, iBaris] := Ceil(FPO.POItems[i].QtyOrder);
        strgGrid.Cells[_kolDesc, iBaris] := aPONo;
        if (Trim(edtUomID.Text) <> '') then
        begin
          SetData;
          actUpdateBarcodeExecute(btnSearch);
        end;
      end;
    end;
  end;
  FDO.Free;
  FPO.Free;
  }
end;

end.




