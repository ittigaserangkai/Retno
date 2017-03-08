unit ufrmSearchProduct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufraFooterDialog2Button, ExtCtrls, DB,
  StdCtrls, uConn, ufrmMasterDialog, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, cxButtons, cxControls, cxContainer, cxEdit,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxDBExtLookupComboBox, ufraFooterDialog3Button;

type
  TModul = (mAdjustmentFaktur, mMarkUpSellingPrice, mHistoryPrice,
            mQuotation, mNone);
  TfrmDialogSearchProduct = class(TfrmMasterDialog)
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    edtProductCode: TEdit;
    edtProductName: TEdit;
    pnl2: TPanel;
    Label1: TLabel;
    edtBarcode: TEdit;
    Label2: TLabel;
    edtSupCode: TEdit;
    edtSupName: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    btnSearch: TcxButton;
    cxGridViewSearchProduct: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGrid: TcxGrid;
    cbpGroup: TcxExtLookupComboBox;
    cbpSubGroup: TcxExtLookupComboBox;
    cxGridViewSearchProductColumn1: TcxGridDBColumn;
    cxGridViewSearchProductColumn2: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure edtProductNameKeyPress(Sender: TObject; var Key: Char);
    procedure strgGridKeyPress(Sender: TObject; var Key: Char);
    procedure edtProductCodeKeyPress(Sender: TObject; var Key: Char);
    procedure edtProductNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure edtProductCodeChange(Sender: TObject);
    procedure edtProductCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridDblClick(Sender: TObject);
    procedure edtBarcodeKeyPress(Sender: TObject; var Key: Char);
    procedure edtSupCodeKeyPress(Sender: TObject; var Key: Char);
    procedure edtSupNameKeyPress(Sender: TObject; var Key: Char);
    procedure cbpGroupKeyPress(Sender: TObject; var Key: Char);
    procedure cbpSubGroupKeyPress(Sender: TObject; var Key: Char);
    procedure edtSupCodeChange(Sender: TObject);
    procedure cbpGroupPropertiesChange(Sender: TObject);
    procedure cbpGroupPropertiesCloseUp(Sender: TObject);
    procedure cbpSubGroupPropertiesCloseUp(Sender: TObject);
  private
    FIsProcessSuccessfull: boolean;
    FCol: Integer;
    FRow: Integer;
    FModul: TModul;
    FPONo: string;
    FListProductCode: TStringList;
    FSubCode: String;
    procedure SetIsProcessSuccessfull(const Value: boolean);
    procedure FindDataOnGrid(AText: String);
    function GetDataBarang(): TDataSet;
    function CekProductCode(ACode: string): Boolean;
    procedure SetGridDataValues(ADataset: TDataSet);
    procedure SetCol(const Value: Integer);
    procedure SetRow(const Value: Integer);
    procedure SetModul(const Value: TModul);
    procedure SetPONo(const Value: string);
    procedure SetListProductCode(const Value: TStringList);

    procedure ClearComponentExcept(AComponent: TComponent); overload;
    procedure ClearComponentExcept(AComp1, AComp2: TcxExtLookupComboBox); overload;

    function GetBarangSearch(ABarangName, AExternalCode, ASupCode, ASupName,
        AGroup, ASubGroup: string): TDataSet;
    procedure ParseComboGroup;
    procedure ParseComboSubGroup(AIdGroup:Integer);
    procedure SetSubCode(const Value: String);
    procedure DisableComponent;
  public
    { Public declarations }
    ProductCode: string;
    ProductName: string;
    ProductSatuan: string;
    MarkUp: String;
    SellPriceDisc: String;
    Conv: String;
    BhjID: String;
    LastCOGS,
    LastCOST: String;
    FSupCode: String;
  published
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
    property Col: Integer read FCol write SetCol;
    property Row: Integer read FRow write SetRow;
    property Modul: TModul read FModul write SetModul;
    property PONo: string read FPONo write SetPONo;
    property SubCode: String read FSubCode write SetSubCode;
    property ListProductCode: TStringList read FListProductCode write SetListProductCode;
  end;

var
  frmDialogSearchProduct: TfrmDialogSearchProduct;

implementation

uses uRetnoUnit, uConstanta;

{$R *.dfm}

procedure TfrmDialogSearchProduct.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogSearchProduct.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogSearchProduct := nil;
end;

procedure TfrmDialogSearchProduct.FormShow(Sender: TObject);
var data : TDataSet;
//    i, countData : integer;
begin
  data := GetDataBarang;
  SetGridDataValues(data);
  DisableComponent;
  FindDataOnGrid(edtProductCode.Text);
  ParseComboGroup;
  edtProductCode.SetFocus;
end;

procedure TfrmDialogSearchProduct.SetIsProcessSuccessfull(
  const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogSearchProduct.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin
  //initiate
  ProductCode := '';
  ProductName := '';
  IsProcessSuccessfull := False;
  {
  if (strgGrid.Cells[0,strgGrid.Row] = '') then Exit
  else
  begin
    ProductCode   := strgGrid.Cells[0,strgGrid.Row];
    ProductName   := strgGrid.Cells[1,strgGrid.Row];

    if Modul = mMarkUpSellingPrice then
    begin
      ProductSatuan := strgGrid.Cells[2,strgGrid.Row];
      MarkUp        := strgGrid.Cells[3,strgGrid.Row];
      SellPriceDisc := strgGrid.Cells[4,strgGrid.Row];
      Conv          := strgGrid.Cells[5,strgGrid.Row];
      LastCOST      := strgGrid.Cells[6,strgGrid.Row];
      BhjID         := strgGrid.Cells[7,strgGrid.Row];
      //UntId         := StrToInt(strgGrid.Cells[8,strgGrid.Row]);
      LastCOGS      := strgGrid.Cells[9,strgGrid.Row];
    end
    else if Modul = mNone then
    begin
      ProductSatuan := strgGrid.Cells[6, strgGrid.Row];
    end;  
    IsProcessSuccessfull := True;
  end;
  }
  Close;
end;

procedure TfrmDialogSearchProduct.FindDataOnGrid(AText: String);
var
  resPoint: TPoint;
begin
  if (AText <> '') then
  begin
//    resPoint := strgGrid.Find(Point(0,0),AText,[fnIncludeFixed]);
//    if (resPoint.Y <> -1) then
//    begin
//      strgGrid.ScrollInView(resPoint.X, resPoint.Y);
//      strgGrid.SelectRows(resPoint.Y, 1);
//    end;
  end;
end;

function TfrmDialogSearchProduct.GetDataBarang: TDataSet;
begin
//  if not Assigned(SearchProduct) then
//    SearchProduct := TSearchProduct.Create;

  case Modul of
  mAdjustmentFaktur:

  begin
//    if not Assigned(MarkUpSellingPrice) then MarkUpSellingPrice:= TMarkUpSellingPrice.Create;
//    Result:= MarkUpSellingPrice.GetListBarangLimit20;
  end;

  else
  end;
end;

procedure TfrmDialogSearchProduct.SetCol(const Value: Integer);
begin
  FCol := Value;
end;

procedure TfrmDialogSearchProduct.SetRow(const Value: Integer);
begin
  FRow := Value;
end;

procedure TfrmDialogSearchProduct.btnSearchClick(Sender: TObject);
var data: TDataSet;
//    i: Integer;
begin
  inherited;

  case Modul of
    mAdjustmentFaktur:
    begin
//      if not Assigned(SearchProduct) then SearchProduct := TSearchProduct.Create;
      SetGridDataValues(data);
    end;
    mMarkUpSellingPrice:
    begin
//      if not Assigned(MarkUpSellingPrice) then MarkUpSellingPrice.Create;
      if Trim(edtProductName.Text) = '' then
        Exit;
//      data:= MarkUpSellingPrice.GetListBarangByName(UpperCase(edtProductName.Text)+'%');
      SetGridDataValues(data);
    end;

  else
  begin
    data := GetBarangSearch(edtProductName.Text, edtBarcode.Text,
        FSupCode, edtSupName.Text, cbpGroup.Text, cbpSubGroup.Text);

    if Trim(edtProductCode.Text) = '' then
      SetGridDataValues(data);
  end;
  end;

  FindDataOnGrid(edtProductName.Text);
end;

procedure TfrmDialogSearchProduct.edtProductNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  ClearComponentExcept(edtProductName);
  if Key = #13 then btnSearch.Click;
end;

procedure TfrmDialogSearchProduct.strgGridKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then footerDialogMaster.btnSave.Click;

end;

procedure TfrmDialogSearchProduct.edtProductCodeKeyPress(Sender: TObject;
  var Key: Char);
var data: TDataSet;
//    i: Integer;
    tmpBrgCode: string;
begin
  inherited;
  ClearComponentExcept(edtProductCode);
  if Key = #13 then
  begin
    if Length(edtProductCode.Text)<igProd_Code_Length then
      tmpBrgCode:= UpperCase(edtProductCode.Text)+'%'
    else
      tmpBrgCode:= UpperCase(edtProductCode.Text);

    case Modul of
      mAdjustmentFaktur:
      begin
//        if not Assigned(SearchProduct) then SearchProduct := TSearchProduct.Create;
      end;

      mMarkUpSellingPrice:
      begin
//        if not Assigned(MarkUpSellingPrice) then MarkUpSellingPrice:= TMarkUpSellingPrice.Create;
//        data:= MarkUpSellingPrice.GetListBarangByCode(tmpBrgCode);
      end;

    else
      if Trim(edtProductCode.Text) <> '' then
      else
        data := nil;

    end;
    SetGridDataValues(data);
    FindDataOnGrid(edtProductCode.Text);
  end;
end;

procedure TfrmDialogSearchProduct.SetModul(const Value: TModul);
begin
  FModul := Value;
end;

procedure TfrmDialogSearchProduct.SetPONo(const Value: string);
begin
  FPONo := Value;
end;

procedure TfrmDialogSearchProduct.edtProductNameKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DOWN) then
    cxGrid.SetFocus;
end;

procedure TfrmDialogSearchProduct.SetListProductCode(
  const Value: TStringList);
begin
  FListProductCode := Value;
end;

procedure TfrmDialogSearchProduct.FormCreate(Sender: TObject);
begin
  inherited;
  ListProductCode := TStringList.Create;
end;

function TfrmDialogSearchProduct.CekProductCode(ACode: string): Boolean;
var bResult: Boolean;
    i: Integer;
begin
  bResult := False;

  i := 0;

  while (i < ListProductCode.Count - 1) and (not bResult) do
  begin
    if ACode = ListProductCode.Strings[i] then
      bResult := True
    else
      Inc(i);
  end;

  Result := bResult;
end;

procedure TfrmDialogSearchProduct.edtProductCodeChange(Sender: TObject);
begin
  inherited;
  FindDataOnGrid(edtProductCode.Text);
end;

procedure TfrmDialogSearchProduct.edtProductCodeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_DOWN) then
    cxGrid.SetFocus;
end;

procedure TfrmDialogSearchProduct.strgGridDblClick(Sender: TObject);
begin
  inherited;
  footerDialogMaster.btnSave.Click;
end;

procedure TfrmDialogSearchProduct.SetGridDataValues(ADataset: TDataSet);
var
  AData: TDataSet;
  i,
  RecCount: Integer;
begin
 {
  with strgGrid do
  begin
    Clear;

    Cells[0,0] := 'PRODUCT CODE';
    Cells[1,0] := 'PRODUCT NAME';

    if Modul = mMarkUpSellingPrice then
    begin
      ColCount:= 7;
      Cells[2,0]:= 'UOM TYPE';
      Cells[3,0]:= 'MARK UP';
      Cells[4,0]:= 'SELLING PRICE';
      Cells[5,0]:= 'CONV VALUE';
      Cells[6,0]:= 'LAST COST';
    end
    else if Modul in [mQuotation, mNone] then
    begin
      ColCount := 6;
      Cells[2,0]:= 'EXTERNAL CODE';
      Cells[3,0]:= 'SUPPLIER NAME';
      Cells[4,0]:= 'CATEGORY';
      Cells[5,0]:= 'SUB CATEGORY';
    end;

    if ADataset = nil then
    begin
      RowCount := 2;
      Exit;
    end;

    AData:= ADataset;
    RecCount:= AData.RecordCount;
    RowCount:= RecCount + 1;

    if RecCount>0 then
    begin
      i:= 1;
      AData.First;
      while (not Adata.Eof) do
      begin
        if Modul in [mAdjustmentFaktur, mHistoryPrice]  then
        begin
          if not (CekProductCode(Adata.FieldByName('BRG_CODE').AsString)) then
          begin
            Cells[0, i] := Adata.FieldByName('BRG_CODE').AsString;
            Cells[1, i] := Adata.FieldByName('BRG_NAME').AsString;
            Cells[2, i] := Adata.FieldByName('BRG_SAT_CODE_STOCK').AsString;
          end;
        end else
        if Modul = mMarkUpSellingPrice then
        begin
          Cells[0, i]:= Adata.FieldByName('BRG_CODE').AsString;
          Cells[1, i]:= Adata.FieldByName('BRG_ALIAS').AsString;
          Cells[2, i]:= Adata.FieldByName('SAT_CODE').AsString;
          Cells[3, i]:= Adata.FieldByName('BHJ_MARK_UP').AsString;
          Cells[4, i]:= Adata.FieldByName('BHJ_SELL_PRICE_DISC').AsString;
          Cells[5, i]:= Adata.FieldByName('BHJ_CONV_VALUE').AsString;
          Cells[6, i]:= Adata.FieldByName('BRGT_LAST_COST').AsString;
          Cells[7, i]:= Adata.FieldByName('BHJ_ID').AsString;
          Cells[8, i]:= Adata.FieldByName('BHJ_UNT_ID').AsString;
          Cells[9, i]:= Adata.FieldByName('BRGT_COGS').AsString;
        end else
        begin
          Cells[0, i] := Adata.FieldByName('BRG_CODE').AsString;
          Cells[1, i] := Adata.FieldByName('BRG_NAME').AsString;
          Cells[2, i] := Adata.FieldByName('BRG_CATALOG').AsString;
          Cells[3, i] := Adata.FieldByName('SUP_NAME').AsString;
          Cells[4, i] := Adata.FieldByName('GRUP_NAME').AsString;
          Cells[5, i] := Adata.FieldByName('SUBGRUP_NAME').AsString;
          Cells[6, i] := AData.fieldbyname('BRG_SAT_CODE_STOCK').AsString;
        end;
        Inc(i);
        Adata.Next;
      end;

      if (i < RowCount) and (i <> 1) then
        RemoveRows(i, RowCount - i);
    end
    else
    begin
      RowCount := 2;
      Cells[0, 1] := ' ';
      Cells[1, 1] := ' ';
    end;

    FixedRows := 1;
    AutoSize := true;
    SetFocus;
  end;
  }
end;

procedure TfrmDialogSearchProduct.ClearComponentExcept(
  AComponent: TComponent);
var
  i: Integer;
begin
  for i:=0 to ComponentCount-1 do
  begin
    if Components[i] <> AComponent then
      if (Components[i] is TEdit) then
        TEdit(Components[i]).Text := ''
      else if (Components[i] is TcxExtLookupComboBox) then
        TcxExtLookupComboBox(Components[i]).Text := '';
  end;
end;

procedure TfrmDialogSearchProduct.ClearComponentExcept(AComp1, AComp2:
    TcxExtLookupComboBox);
var
  i: Integer;
begin
  for i:=0 to ComponentCount-1 do
  begin
    if (Components[i] is TEdit) then
      TEdit(Components[i]).Text := '';
  end;
end;

function TfrmDialogSearchProduct.GetBarangSearch(ABarangName, AExternalCode,
    ASupCode, ASupName, AGroup, ASubGroup: string): TDataSet;
var
  aData: TDataSet;
  aKey: Char;
begin
  aData := TDataSet.Create(nil);
  aData := nil;

  Result := aData;
end;

procedure TfrmDialogSearchProduct.edtBarcodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  ClearComponentExcept(edtBarcode);
  if Key = #13 then btnSearch.Click;
end;

procedure TfrmDialogSearchProduct.edtSupCodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  ClearComponentExcept(edtSupCode);
  if Key = #13 then btnSearch.Click;
end;

procedure TfrmDialogSearchProduct.edtSupNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  ClearComponentExcept(edtSupName);
  if Key = #13 then btnSearch.Click;
end;

procedure TfrmDialogSearchProduct.cbpGroupKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  ClearComponentExcept(cbpGroup);
  if Key = #13 then btnSearch.Click;
end;

procedure TfrmDialogSearchProduct.cbpGroupPropertiesChange(Sender: TObject);
var
  IdGroup: Integer;
begin
  inherited;

end;

procedure TfrmDialogSearchProduct.cbpGroupPropertiesCloseUp(Sender: TObject);
begin
  inherited;
  ClearComponentExcept(cbpGroup);

end;

procedure TfrmDialogSearchProduct.cbpSubGroupKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  ClearComponentExcept(cbpGroup, cbpSubGroup);
  if Key = #13 then btnSearch.Click;
end;

procedure TfrmDialogSearchProduct.cbpSubGroupPropertiesCloseUp(Sender: TObject);
begin
  inherited;
  ClearComponentExcept(cbpGroup, cbpSubGroup);
  if cbpGroup.Text = '' then
    cbpSubGroup.Properties.View.ClearItems;

end;

procedure TfrmDialogSearchProduct.ParseComboGroup;
var
  dataGroup: TDataSet;
//  objGroup: TGroups;
begin
{  FreeAndNil(objGroup);
  objGroup:= TGroups.Create;

  dataGroup:= objGroup.GetDataGroup();

  with cbpGroup do begin
    Clear;
//    Columns.Count := 3;

    if not dataGroup.IsEmpty then begin
      dataGroup.First;
//      ComboItems.Count := dataGroup.RecordCount + 1;
//      ComboItems.Add(['Id', 'Category Code', 'Category Name']);
      //AddRow(['0','-','ALL']);
      while not dataGroup.Eof do begin
        AddItem([dataGroup.FieldByName('GRUP_ID').AsString,
          dataGroup.FieldByName('GRUP_CODE').AsString,
          dataGroup.FieldByName('GRUP_NAME').AsString]);
        dataGroup.Next;
      end;
    end
    else begin
      RowCount := 2;
      AddRow(['Id', 'Category Code', 'Category Name']);
      AddRow(['', ' ', ' ']);
    end;

    FixedRows := 1;
    SizeGridToData;
    Text := '';
  end;   }
end;

procedure TfrmDialogSearchProduct.ParseComboSubGroup(AIdGroup: Integer);
var
//  objGroup: TGroups;
  dataSubGroup: TDataSet;
begin
 { FreeAndNil(objGroup);
  objGroup:= TGroups.Create;

  dataSubGroup:= objGroup.GetDataSubGroup(AIdGroup);

  with cbpSubGroup do begin
    ClearGridData;
    ColCount := 3;

    if not dataSubGroup.IsEmpty then begin
      dataSubGroup.First;
      RowCount := dataSubGroup.RecordCount + 1;
      AddRow(['Id', 'SubCategory Code', 'SubCategory Name']);
      while not dataSubGroup.Eof do begin
        AddRow([dataSubGroup.FieldByName('SUBGRUP_ID').AsString,
          dataSubGroup.FieldByName('SUBGRUP_CODE').AsString,
          dataSubGroup.FieldByName('SUBGRUP_NAME').AsString]);
        dataSubGroup.Next;
      end;
    end
    else begin
      RowCount := 2;
      AddRow(['Id', 'SubCategory Code', 'SubCategory Name']);
      AddRow(['', ' ', ' ']);
    end;

    FixedRows := 1;
    SizeGridToData;
    Text := '';
  end; }
end;

procedure TfrmDialogSearchProduct.SetSubCode(const Value: String);
begin
  FSupCode := Value;
end;

procedure TfrmDialogSearchProduct.edtSupCodeChange(Sender: TObject);
begin
  inherited;
  SetSubCode(EdtSupCode.Text);
end;

procedure TfrmDialogSearchProduct.DisableComponent;
begin
  if FModul = mMarkUpSellingPrice then
  begin
    edtBarcode.Enabled := False;
    edtSupCode.Enabled := false;
    edtSupName.Enabled := False;
    cbpGroup.Enabled := false;
    cbpSubGroup.Enabled := false;
  end;  
end;

end.
