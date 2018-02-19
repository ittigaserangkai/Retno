unit ufraBonusProduct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, StdCtrls, Mask, uConn, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.Menus, cxButtons, cxContainer, cxTextEdit, cxCurrencyEdit, cxLabel,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TSaveBonus = (sbAdd,sbEdit);

  TfraBonusProduct = class(TFrame)
    pnl1: TPanel;
    pnl2: TPanel;
    pnlAddEdit: TPanel;
    lblDelete: TcxLabel;
    lbl1: TLabel;
    edtProductCodeBNS: TEdit;
    edtProductNamebwh: TEdit;
    lbl2: TLabel;
    intedtQtyOrderFrom: TcxCurrencyEdit;
    lbl3: TLabel;
    intedtQtyOrderTo: TcxCurrencyEdit;
    lbl4: TLabel;
    dtFrom: TcxDateEdit;
    lbl5: TLabel;
    dtTo: TcxDateEdit;
    pnl4: TPanel;
    lblAdd: TcxLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    intedtQtyBnsSals: TcxCurrencyEdit;
    intedtQtyBnsCS: TcxCurrencyEdit;
    lbl10: TLabel;
    intedtTotalBonus: TcxCurrencyEdit;
    lblClose: TcxLabel;
    pnl3: TPanel;
    lbl11: TLabel;
    edtProductNameUP: TEdit;
    lblEdit: TcxLabel;
    chkIsActive: TCheckBox;
    edtUOMPurchase: TEdit;
    edtUOMCS: TEdit;
    edtUOMSales: TEdit;
    cxGridViewBonusProduct: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGrid: TcxGrid;
    btnSave: TcxButton;
    btnCancel: TcxButton;
    procedure lblAddClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure lblCloseClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure strgGridCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure lblEditClick(Sender: TObject);
    procedure strgGridRowChanging(Sender: TObject; OldRow, NewRow: Integer;
      var Allow: Boolean);
    procedure lblDeleteClick(Sender: TObject);
    procedure edtProductCodeBNSKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtProductCodeBNSChange(Sender: TObject);
    procedure intedtQtyBnsCSKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure intedtQtyBnsSalsKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    dataBonusProduct: TDataSet;
    dataUom: TDataSet;
    FProductCode: string;
    FUntID: Integer;
    modeSaveBonus: TSaveBonus;
    UOM: Variant;
    procedure ParseHeaderGrid(jmlData: Integer);
    procedure showEditBonus();
    procedure SetProductCode(const Value: string);
    procedure setUntID(const Value: Integer);
    procedure ClearBonusEdit();
    procedure checkEmptyUOM();
  public
    OP_ID: Integer;
    procedure ShowBonusProduct(AProductCode: String; AuntId: Integer);
  published
    property ProductCode: string read FProductCode write SetProductCode;
    property UntID: Integer read FUntID write setUntID;
  end;

var
  fraBonusProduct: TfraBonusProduct;

implementation

uses uTSCommonDlg,uConstanta, ufrmProduct, ufrmMaster;

{$R *.dfm}

procedure TfraBonusProduct.lblAddClick(Sender: TObject);
begin
  if UntID = 0 then
  begin
    CommonDlg.ShowError('UNIT BELUM DIPILIH');
    Exit;
  end
  else
  begin
    pnl3.Visible := false;
    pnlAddEdit.Visible := true;
    chkIsActive.Checked := True;
    chkIsActive.Visible := False;
    edtUOMPurchase.Text := frmProduct.edtUOMPurchaseCode.Text;

    ClearBonusEdit();
    modeSaveBonus := sbAdd;
  end;
end;

procedure TfraBonusProduct.btnCancelClick(Sender: TObject);
begin
  pnlAddEdit.Visible := false;
  pnl3.Visible := true;
end;

procedure TfraBonusProduct.lblCloseClick(Sender: TObject);
begin
  fraBonusProduct.Parent := nil;
  frmProduct.SetActiveFooter5Button(True);
end;

procedure TfraBonusProduct.ShowBonusProduct(AProductCode: String; AuntId: Integer);
var arrParamSat: TArr;
    intI: Integer;
    tempBool: Boolean;
begin
  {Tambahan Widi 14 Nov 2007}
  UntID := AuntId;
  {**** DONE****}
  
  SetLength(arrParamSat,1);
  arrParamSat[0].tipe := ptInteger;
  arrParamSat[0].data := AuntId;
//  if not Assigned(Satuan) then Satuan := TSatuan.Create;
//  dataUom := Satuan.GetListSatuan(arrParamSat);
//  LoadDropDownData(cbpUOMCS,dataUom.RecordCount);
//  LoadDropDownData(cbpUOMSales,dataUom.RecordCount);

//  if not Assigned(BonusProduct) then BonusProduct := TBonusProduct.Create;
//  dataBonusProduct := BonusProduct.GetListDataBonusProduct(AuntId,AProductCode);

  ParseHeaderGrid(dataBonusProduct.RecordCount);
  // put code here to parse data bonus product
  // ...
  {
  if dataBonusProduct.RecordCount > 0 then
  begin
    //initiate
    intI := 1;
    dataBonusProduct.First;
    with strgGrid do
    begin
      while not(dataBonusProduct.Eof) do
      begin
        AddCheckBox(0,intI,False,false);

        // write the data to strgGRID
        Cells[1,intI] := dataBonusProduct.FieldByName('BNS_ORDER_FROM').AsString;
        Cells[2,intI] := dataBonusProduct.FieldByName('BNS_ORDER_TO').AsString;
        Cells[3,intI] := DateToStr(dataBonusProduct.FieldByName('BNS_DATE_FROM').AsDateTime);
        Cells[4,intI] := DateToStr(dataBonusProduct.FieldByName('BNS_DATE_TO').AsDateTime);
        Cells[5,intI] := dataBonusProduct.FieldByName('BNS_BRG_CODE_BNS').AsString;
        Cells[6,intI] := FloatToStr(dataBonusProduct.FieldByName('BNS_QTY_SALES').AsFloat);
        Cells[7,intI] := FloatToStr(dataBonusProduct.FieldByName('BNS_QTY_CS').AsFloat);
        Cells[8,intI] := dataBonusProduct.FieldByName('BNS_SAT_CODE_BNS').AsString;
        Cells[9,intI] := FloatToStr(dataBonusProduct.FieldByName('BNS_QTY').AsFloat);
        Cells[10,intI] := dataBonusProduct.FieldByName('BNS_IS_ACTIVE').AsString;
        Cells[11,intI] := dataBonusProduct.FieldByName('BRG_NAME').AsString;
        Cells[12,intI] := dataBonusProduct.FieldByName('BNS_ID').AsString;
        //====================
        Inc(intI);
        dataBonusProduct.Next;
      end; //end while
    end; //end whith str
  end;
    strgGrid.SetFocus;
    strgGrid.AutoSize := true;
    strgGrid.FixedRows := 1;
    strgGridRowChanging(Self,1,1,tempBool); }
end;

procedure TfraBonusProduct.ParseHeaderGrid(jmlData: Integer);
begin
  {with strgGrid do
  begin
    Clear;
    RowCount := jmlData + 1;
    ColCount := 11;
    Cells[0,0] := '  ';
    Cells[1,0] := 'ORDER FROM';
    Cells[2,0] := 'ORDER TO';
    Cells[3,0] := 'DATE FROM';
    Cells[4,0] := 'DATE TO';
    Cells[5,0] := 'BONUS CODE';
    Cells[6,0] := 'QTY BNS SALES';
    Cells[7,0] := 'QTY BNS CS';
    Cells[8,0] := 'UOM';
    Cells[9,0] := 'TOTAL QTY';
    Cells[10,0] := 'STATUS';

    if jmlData <= 0 then
    begin
      RowCount:= 2;
      strgGrid.AddCheckBox(0,1,False,false);
      Cells[0,1] := ' ';
      Cells[1,1] := ' ';
      Cells[2,1] := ' ';
      Cells[3,1] := ' ';
      Cells[4,1] := ' ';
      Cells[5,1] := ' ';
      Cells[6,1] := ' ';
      Cells[7,1] := ' ';
      Cells[8,1] := ' ';
      Cells[9,1] := ' ';
      Cells[10,1] := ' ';
      Cells[11,1] := ' ';
      Cells[12,1] := '0';
    end;
  end; }
end;

procedure TfraBonusProduct.btnSaveClick(Sender: TObject);
var chkint: Integer;
begin
  if edtProductCodeBNS.Text = '' then
  begin
    CommonDlg.ShowErrorEmpty(' Product Bonus Code ');
    Exit;
    edtProductCodeBNS.SetFocus;
  end
  {else if cbpUOMCS.Value <> cbpUOMSales.Value then
  begin
    CommonDlg.ShowError('UOM CS and UOM Sales is Not Match');
    Exit;
    cbpUOMCS.SetFocus;
  end}
  else
  begin
    if modeSaveBonus = sbAdd then
    begin
      //insert data
      {if not Assigned(BonusProduct) then BonusProduct := TBonusProduct.Create;

      checkEmptyUOM();
      if BonusProduct.InputDataBonusProduct(UntID,ProductCode,edtProductCodeBNS.Text,UOM,
         intedtQtyOrderFrom.Value,intedtQtyOrderTo.Value,
         dtFrom.Date,dtTo.Date,intedtQtyBnsCS.Value,intedtQtyBnsSals.Value,1,OP_ID) then

         CommonDlg.ShowConfirm(atAdd);
        }
    end //end sbAdd
    else
    begin
      if chkIsActive.Checked = True then chkint := 1 else chkint:= 0;
      //update data
      {if not Assigned(BonusProduct) then BonusProduct := TBonusProduct.Create;

      checkEmptyUOM();
      if BonusProduct.UpdateDataBonusProduct(edtProductCodeBNS.Text,UOM,
         intedtQtyOrderFrom.Value,intedtQtyOrderTo.Value,dtFrom.Date,dtTo.Date,
         intedtQtyBnsCS.Value,intedtQtyBnsSals.Value,chkint,
         StrToInt(strgGrid.Cells[12,strgGrid.Row]),OP_ID) then

         CommonDlg.ShowConfirm(atEdit);
           }
    end;//end else sbAdd
  end; // if = ''

  pnlAddEdit.Visible := false;
  ShowBonusProduct(FProductCode,UntID);

end;

procedure TfraBonusProduct.SetProductCode(const Value: string);
begin
  FProductCode := Value;
end;

procedure TfraBonusProduct.setUntID(const Value: Integer);
begin
  FUntID := Value;
end;


procedure TfraBonusProduct.strgGridCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  if (ACol = 0) then
    CanEdit := true
  else
    CanEdit := false;
end;

procedure TfraBonusProduct.lblEditClick(Sender: TObject);
begin
  if UntID = 0 then
  begin
    CommonDlg.ShowError('UNIT BELUM DIPILIH');
    Exit;
  end
  else
  begin
//    if strgGrid.Cells[12,strgGrid.Row] = '0' then Exit
//    else
    begin
      pnl3.Visible := false;
      pnlAddEdit.Visible := true;
      chkIsActive.Checked := True;
      chkIsActive.Visible := True;

      showEditBonus();
      modeSaveBonus := sbEdit;
    end;
  end;
end;

procedure TfraBonusProduct.strgGridRowChanging(Sender: TObject; OldRow,
  NewRow: Integer; var Allow: Boolean);
begin
//  edtProductNameUP.Text := strgGrid.Cells[11,NewRow];
end;

procedure TfraBonusProduct.showEditBonus();
begin
  {
  edtProductNamebwh.Text := strgGrid.Cells[11,strgGrid.Row];
  edtProductCodeBNS.Text := strgGrid.Cells[5,strgGrid.Row];
  edtUOMSales.Text := strgGrid.Cells[8,strgGrid.Row];
  edtUOMCS.Text := strgGrid.Cells[8,strgGrid.Row];

  if strgGrid.Cells[10,strgGrid.Row] = '1' then chkIsActive.Checked := True
  else chkIsActive.Checked := False;

  try
    intedtQtyOrderFrom.Value := StrToFloat(strgGrid.Cells[1,strgGrid.Row]);
  except
    intedtQtyOrderFrom.Value := 0;
  end;

  try
    intedtQtyOrderTo.Value := StrToFloat(strgGrid.Cells[2,strgGrid.Row]);
  except
    intedtQtyOrderTo.Value := 0;
  end;

  try
    dtFrom.Date := StrToDate(strgGrid.Cells[3,strgGrid.Row]);
  except
    //do nothing
  end;

  try
    dtTo.Date := StrToDate(strgGrid.Cells[4,strgGrid.Row]);
  except
    //do nothing
  end;

  try
    intedtQtyBnsSals.Value := StrToFloat(strgGrid.Cells[6,strgGrid.Row]);
  except
    intedtQtyBnsSals.Value := 0;
  end;

  try
    intedtQtyBnsCS.Value := StrToFloat(strgGrid.Cells[7,strgGrid.Row]);
  except
    intedtQtyBnsCS.Value := 0;
  end;

  try
    intedtTotalBonus.Value := StrToFloat(strgGrid.Cells[9,strgGrid.Row]);
  except
    intedtTotalBonus.Value := 0;
  end;
    }
end;


procedure TfraBonusProduct.ClearBonusEdit();
begin
  dtFrom.Date := Now;
  dtTo.Date := Now;
  edtProductNamebwh.Text := '';
  intedtQtyOrderFrom.Value := 0;
  intedtQtyOrderTo.Value := 0;
  edtProductCodeBNS.Text := '';
  intedtQtyBnsSals.Value := 0;
  intedtQtyBnsCS.Value := 0;
  intedtTotalBonus.Value := 0;
  chkIsActive.Checked := False;
end;

procedure TfraBonusProduct.lblDeleteClick(Sender: TObject);
var chkStatue,delStatue: Boolean;
    intI: Integer;
begin
  delStatue := False;
  {if not Assigned(BonusProduct) then BonusProduct := TBonusProduct.Create;

  for intI:=1 to strgGrid.RowCount-1 do
  begin
    strgGrid.SelectRows(intI,1);
    strgGrid.GetCheckBoxState(0,strgGrid.Row,chkStatue);

    if chkStatue then
      if BonusProduct.DeleteDataBonusProduct(StrToInt(strgGrid.Cells[12,strgGrid.Row]))
      then delStatue := True;
  end;

  if delStatue then CommonDlg.ShowConfirm(atDelete);
  }
  ShowBonusProduct(ProductCode,UntID);
  
end;

procedure TfraBonusProduct.edtProductCodeBNSKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key  = VK_F5) then
  begin
//    if not assigned(frmDialogSearchProduct) then
//      frmDialogSearchProduct := TfrmDialogSearchProduct.Create(Application);

//    frmDialogSearchProduct.DialogUnit    := frmProduct.MasterNewUnit.ID;
//    frmDialogSearchProduct.DialogCompany := frmProduct.MasterCompany.ID;

//    frmDialogSearchProduct.Modul:= mNone;

//    frmDialogSearchProduct.ShowModal;

//    if frmDialogSearchProduct.IsProcessSuccessfull = True then
//    begin
//      edtProductCodeBNS.Text := frmDialogSearchProduct.ProductCode;
//      edtProductNamebwh.Text := frmDialogSearchProduct.ProductName;
//      edtUOMCS.Text   := frmDialogSearchProduct.ProductSatuan;
//      edtUOMSales.Text:= frmDialogSearchProduct.ProductSatuan;
//    end;
//
//    frmDialogSearchProduct.Free;

  end;

end;

procedure TfraBonusProduct.edtProductCodeBNSChange(Sender: TObject);
begin
  inherited;
  {if not Assigned(BarangCompetitor) then
    BarangCompetitor := TBarangCompetitor.Create;

    edtProductNamebwh.Text := BarangCompetitor.SearchProductName(edtProductCodeBNS.Text);}
end;

procedure TfraBonusProduct.intedtQtyBnsCSKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  intedtTotalBonus.Value := intedtQtyBnsCS.Value + intedtQtyBnsSals.Value;
end;

procedure TfraBonusProduct.intedtQtyBnsSalsKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  intedtTotalBonus.Value := intedtQtyBnsCS.Value + intedtQtyBnsSals.Value;
end;

procedure TfraBonusProduct.checkEmptyUOM();
begin
  if edtUOMCS.Text = '' then UOM := null
  else UOM := edtUOMCS.Text;
end;  

end.

