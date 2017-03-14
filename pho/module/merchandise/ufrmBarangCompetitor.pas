unit ufrmBarangCompetitor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, ActnList,
  System.Actions, Math, uConn, ColCombo, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, cxCurrencyEdit,
  ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC;

type
  TfrmBarangCompetitor = class(TfrmMasterBrowse)
    actlstBarangCompetitor: TActionList;
    actAddBarangKompetitor: TAction;
    actEditBarangKompetitor: TAction;
    actDeleteBarangKompetitor: TAction;
    actRefreshBarangKompetitor: TAction;
    pnlTop: TPanel;
    lbl2: TLabel;
    dtStart: TcxDateEdit;
    dtEnd: TcxDateEdit;
    lbl3: TLabel;
    lbl4: TLabel;
    edtProductCode: TEdit;
    pnlButtom: TPanel;
    lbl5: TLabel;
    lbl6: TLabel;
    Label1: TLabel;
    edtProductname: TEdit;
    edtSuplierName: TEdit;
    lbl7: TLabel;
    lbl8: TLabel;
    edtDisc1: TEdit;
    lbl9: TLabel;
    lbl10: TLabel;
    edtDisc3: TEdit;
    lbl11: TLabel;
    edtDisc2: TEdit;
    curedtPurchPrice: TcxCurrencyEdit;
    curedtNettoPrice: TcxCurrencyEdit;
    lbl13: TLabel;
    lbl16: TLabel;
    edtSatBuy: TEdit;
    edtSatNetto: TEdit;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    edtmarkUp: TEdit;
    CURedtSellingPrice: TcxCurrencyEdit;
    lbl1: TLabel;
    edtcompttCode: TEdit;
    lbl20: TLabel;
    lbl15: TLabel;
    cxGridViewColumn1: TcxGridDBColumn;
    cxGridViewColumn2: TcxGridDBColumn;
    cxGridViewColumn3: TcxGridDBColumn;
    cxGridViewColumn4: TcxGridDBColumn;
    cxGridViewColumn5: TcxGridDBColumn;
    btnShow: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actDeleteBarangKompetitorExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure btnShowClick(Sender: TObject);
    procedure edt1Change(Sender: TObject);
    procedure cbpCompetitorCloseUp(Sender: TObject);
    procedure edtProductCodeChange(Sender: TObject);
    procedure edtcompttCodeChange(Sender: TObject);
    procedure cbpCompetitorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure strgGridRowChanging(Sender: TObject; OldRow, NewRow: Integer;
      var Allow: Boolean);
  private
    { Private declarations }
    Competitor: TDataSet;
    dataCompetitorBrgDtl: TDataSet;
    dataOwnGoods: TDataSet;

    procedure LoadDropDownData(ACombo: TColumnComboBox; AColsOfData: Integer);
    procedure FindDataOnGrid(AText: String);
    procedure showOwnGoods();
    procedure clearOwnGoods();
    procedure setDialogBarang();
    procedure setDialogBarang4ShowEdit();
  public
    { Public declarations }
  end;

var
  frmBarangCompetitor: TfrmBarangCompetitor;

implementation

uses uTSCommonDlg, ufrmDialogBarangCompetitor, ufrmSearchProduct, uConstanta;

{$R *.dfm}

procedure TfrmBarangCompetitor.FormShow(Sender: TObject);
begin
  inherited;
  lblHeader.Caption:='COMPETITOR PRODUCT';
  dtStart.Date := now;
  dtEnd.Date := now;
  actRefreshExecute(Self);
end;

procedure TfrmBarangCompetitor.FormDestroy(Sender: TObject);
begin
  inherited;
  frmBarangCompetitor := nil;
end;

procedure TfrmBarangCompetitor.actAddExecute(Sender: TObject);
begin
  inherited;
//  if ID <> 0 then
  begin
    setDialogBarang();
    if frmDialogBarangCompetitor.IsProcessSuccessfull then
    begin
      actRefreshExecute(Self);
      CommonDlg.ShowConfirm(atAdd);
    end;
    frmDialogBarangCompetitor.Free
  end // if frmmain
;//  else CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
end;

procedure TfrmBarangCompetitor.actDeleteBarangKompetitorExecute(
  Sender: TObject);
begin
  {
  if not Assigned(BarangCompetitor) then BarangCompetitor := TBarangCompetitor.Create;

  if strgGrid.Cells[0,strgGrid.Row]='0' then Exit;
  if MasterNewUnit.ID <> 0 then
  begin
    if (CommonDlg.Confirm('Are you sure want to delete product competitor ("'+ strgGrid.Cells[1,strgGrid.row] +'")?') = mrYes) then
    begin
      if BarangCompetitor.DeleteBarangCompetitorDetil(StrToInt(strgGrid.Cells[7,strgGrid.Row])) then
      begin
        actRefreshBarangKompetitorExecute(Self);
        CommonDlg.ShowConfirm(atDelete);
      end; //end barangco
    end; //end commondlg
  end //end MasterNewUnit.ID
  else CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
  }
end;

procedure TfrmBarangCompetitor.actEditExecute(Sender: TObject);
begin
  inherited;
//  if strgGrid.Cells[0,strgGrid.Row]='0' then Exit;
//  if MasterNewUnit.ID <> 0 then
  begin
    setDialogBarang4ShowEdit();
    if frmDialogBarangCompetitor.IsProcessSuccessfull then
    begin
      actRefreshExecute(Self);
      CommonDlg.ShowConfirm(atEdit);
    end;
    frmDialogBarangCompetitor.Free
  end // if frmmain
;//  else CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
end;

procedure TfrmBarangCompetitor.actRefreshExecute(Sender: TObject);
var tempBool: Boolean;
begin
  inherited;
  {
  if not Assigned(DaftarCompetitor) then
    DaftarCompetitor := TDaftarCompetitor.Create;
  Competitor := DaftarCompetitor.GetDataCompetitor(MasterNewUnit.ID);
  LoadDropDownData(cbpCompetitor,Competitor.RecordCount);
  cbpCompetitor.Value := cbpCompetitor.Cells[1,1];
  edtcompttCode.Text := cbpCompetitor.Cells[2,cbpCompetitor.Row];
  }
  btnShowClick(Self);

  tempBool:= True;
  strgGridRowChanging(Self,1,1,tempBool);
end;

procedure TfrmBarangCompetitor.btnShowClick(Sender: TObject);
var
  i: integer;
  tempBool: Boolean;
begin
  {dataCompetitorBrgDtl := BarangCompetitor.GetBarangCompetitor
                          (MasterNewUnit.ID,
                           StrToInt(cbpCompetitor.Cells[0,cbpCompetitor.Row]),
                           dtStart.Date,
                           dtEnd.Date,edtProductCode.Text);
  with strgGrid do
  begin
    Clear;
    RowCount := dataCompetitorBrgDtl.RecordCount + 1;
    ColCount := 5;

    strgGrid.Cells[0,0] := 'No.';
    strgGrid.Cells[1,0] := 'Code';
    strgGrid.Cells[2,0] := 'Convertion';
    strgGrid.Cells[3,0] := 'Selling Price';
    strgGrid.Cells[4,0] := 'UOM';

    if dataCompetitorBrgDtl.RecordCount > 0 then
    begin
      for i:=1 to dataCompetitorBrgDtl.RecordCount do
      begin
        Cells[0,i] := inttostr(i);
        Cells[1,i] := dataCompetitorBrgDtl.FieldByName('CODE').AsString;
        Cells[2,i] := dataCompetitorBrgDtl.FieldByName('CONVERS').AsString;
        Cells[3,i] := dataCompetitorBrgDtl.FieldByName('HARGA_JUAL').AsString;
        Alignments[3,i] := taRightJustify;
        Cells[4,i] := dataCompetitorBrgDtl.FieldByName('SATUAN').AsString;
        Cells[5,i] := dataCompetitorBrgDtl.FieldByName('NAME').AsString;
        Cells[6,i] := dataCompetitorBrgDtl.FieldByName('HARGA_JUAL').AsString;
        Cells[7,i] := dataCompetitorBrgDtl.FieldByName('KBD_ID').AsString;
        dataCompetitorBrgDtl.Next;
      end;//for
    end
    else
    begin
      RowCount := 2;
      Cells[0,1] := '0';
      strgGrid.Cells[5,1] := '----';
    end;
    FixedRows := 1;
    AutoSize := true;
  end;

  tempBool:= True;
  strgGridRowChanging(Self,1,1,tempBool);
  }
end;

procedure TfrmBarangCompetitor.edt1Change(Sender: TObject);
begin

end;

//================ R ======================

procedure TfrmBarangCompetitor.LoadDropDownData(ACombo: TColumnComboBox;
  AColsOfData: Integer);
begin
  {Flush the old data}
//  ACombo.ClearGridData;

  {Make sure the allocated storage is big enough}
//  ACombo.RowCount := AColsOfData+1;
//  ACombo.ColCount := 3;

  {Load the data}
//  ACombo.AddRow(['0',' NAME ',' CODE ']);
//  Competitor := DaftarCompetitor.GetDataCompetitor(MasterNewUnit.ID);
  if Competitor <> nil then
  begin
    while not Competitor.Eof do
    begin
      try
//        ACombo.AddRow([Competitor.FieldByName('KOMPT_ID').AsString,
//                       Competitor.FieldByName('KOMPT_NAME').AsString,
//                       Competitor.FieldByName('KOMPT_CODE').AsString]);
      except
      end;
      Competitor.Next;
    end;// end while
  end;// if comptt

  {Now shring the grid so its just big enough for the data}
//  cbpCompetitor.FixedRows := 1;
//  ACombo.SizeGridToData;
  //trik to activate acombo
//  ACombo.Value := ACombo.Cells[0,0];
//  ACombo.LookupActive := False;
end;

procedure TfrmBarangCompetitor.FindDataOnGrid(AText: String);
var
  resPoint: TPoint;
begin
  if (AText <> '') then
  begin
    {
    resPoint := strgGrid.Find(Point(0,0),AText,[fnIncludeFixed]);
    if (resPoint.Y <> -1) then
    begin
      strgGrid.ScrollInView(resPoint.X, resPoint.Y);
      strgGrid.SelectRows(resPoint.Y, 1);
    end;
    }
  end;
end;


procedure TfrmBarangCompetitor.cbpCompetitorCloseUp(Sender: TObject);
begin
  inherited;
//  edtcompttCode.Text := cbpCompetitor.Cells[2,cbpCompetitor.Row];
end;

procedure TfrmBarangCompetitor.edtProductCodeChange(Sender: TObject);
var tempBool: Boolean;
begin
  inherited;
  FindDataOnGrid(edtProductCode.Text);
//  strgGridRowChanging(Self,0,strgGrid.Row,tempBool);
end;

procedure TfrmBarangCompetitor.edtcompttCodeChange(Sender: TObject);
var dataSearchCodeKomptt: TDataSet;
begin
  inherited;
//  dataSearchCodeKomptt := DaftarCompetitor.SearchCompetitorByCode(edtcompttCode.Text);

//  if dataSearchCodeKomptt.RecordCount > 0 then
//    cbpCompetitor.Value := dataSearchCodeKomptt.FieldByName('KOMPT_NAME').AsString;
end;

procedure TfrmBarangCompetitor.showOwnGoods();
begin
  edtSuplierName.Text := dataOwnGoods.FieldByName('SUP_NAME').AsString;
  edtDisc1.Text := dataOwnGoods.FieldByName('BRGSUP_DISC1').AsString;
  edtDisc2.Text := dataOwnGoods.FieldByName('BRGSUP_DISC2').AsString;
  edtDisc3.Text := dataOwnGoods.FieldByName('BRGSUP_DISC3').AsString;

  curedtPurchPrice.Value := dataOwnGoods.FieldByName('BRGSUP_BUY_PRICE').AsCurrency;
  edtSatBuy.Text := dataOwnGoods.FieldByName('BRGSUP_SAT_CODE_BUY').AsString;

  curedtNettoPrice.Value := dataOwnGoods.FieldByName('BRGSUP_BUY_PRICE_DISC').AsCurrency;
  edtSatNetto.Text := dataOwnGoods.FieldByName('BRGSUP_SAT_CODE_BUY').AsString;

  edtmarkUp.Text := dataOwnGoods.FieldByName('BHJ_MARK_UP').AsString;
  CURedtSellingPrice.Value := dataOwnGoods.FieldByName('BHJ_SELL_PRICE_DISC').AsCurrency;
end;

procedure TfrmBarangCompetitor.clearOwnGoods();
begin
  edtSuplierName.Text := '';
  edtDisc1.Text := '';
  edtDisc2.Text := '';
  edtDisc3.Text := '';

  curedtPurchPrice.Value := 0;
  edtSatBuy.Text := '';

  curedtNettoPrice.Value := 0;
  edtSatNetto.Text := '';

  edtmarkUp.Text := '';
  CURedtSellingPrice.Value := 0;
end;

procedure TfrmBarangCompetitor.setDialogBarang();
var searchUOM: TDataSet;
    arrParamUOM: TArr;
begin
  if not Assigned(frmDialogBarangCompetitor) then
    Application.CreateForm(TfrmDialogBarangCompetitor, frmDialogBarangCompetitor);
  {
  if not Assigned(DaftarCompetitor) then DaftarCompetitor := TDaftarCompetitor.Create;
  Competitor := DaftarCompetitor.GetDataCompetitor(MasterNewUnit.ID);
  LoadDropDownData(frmDialogBarangCompetitor.cbpCompetitor,Competitor.RecordCount);
  frmDialogBarangCompetitor.edtcompttCode.Text := edtcompttCode.Text;
  frmDialogBarangCompetitor.edtcompttCodeChange(Self);


  SetLength(arrParamUOM,1);
  arrParamUOM[0].tipe := ptInteger;
  arrParamUOM[0].data := MasterNewUnit.ID;
  if not Assigned(Satuan) then Satuan := TSatuan.Create;

  frmDialogBarangCompetitor.cbbUOM.Clear;
  searchUOM := Satuan.GetListSatuan(arrParamUOM);
  if searchUOM.RecordCount > 0 then
  begin
    searchUOM.First;
    while not(searchUOM.Eof) do
    begin
      frmDialogBarangCompetitor.cbbUOM.AddItem(searchUOM.FieldByName('SAT_CODE').AsString,frmDialogBarangCompetitor.cbbUOM);
      searchUOM.Next;
    end;
  end; // if recordcount

  frmDialogBarangCompetitor.frmSuiMasterDialog.Caption := 'Add Competitor Product (Survey)';
  frmDialogBarangCompetitor.FormMode := fmAdd;
  frmDialogBarangCompetitor.cbpCompetitorCloseUp(Self);
  frmDialogBarangCompetitor.dtSurvey.Date := Now;
  frmDialogBarangCompetitor.DialogUnit := MasterNewUnit.ID;
  frmDialogBarangCompetitor.FLoginId := FLoginId;
  frmDialogBarangCompetitor.countSave := 0; //reset count

  SetFormPropertyAndShowDialog(frmDialogBarangCompetitor);
  }
end;

procedure TfrmBarangCompetitor.setDialogBarang4ShowEdit();
var searchUOM: TDataSet;
    arrParamUOM: TArr;
begin
  if not Assigned(frmDialogBarangCompetitor) then
    Application.CreateForm(TfrmDialogBarangCompetitor, frmDialogBarangCompetitor);
  {
  if not Assigned(DaftarCompetitor) then DaftarCompetitor := TDaftarCompetitor.Create;
  Competitor := DaftarCompetitor.GetDataCompetitor(MasterNewUnit.ID);
  LoadDropDownData(frmDialogBarangCompetitor.cbpCompetitor,Competitor.RecordCount);

  SetLength(arrParamUOM,1);
  arrParamUOM[0].tipe := ptInteger;
  arrParamUOM[0].data := MasterNewUnit.ID;
  if not Assigned(Satuan) then Satuan := TSatuan.Create;

  frmDialogBarangCompetitor.cbbUOM.Clear;
  searchUOM := Satuan.GetListSatuan(arrParamUOM);
  if searchUOM.RecordCount > 0 then
  begin
    searchUOM.First;
    while not(searchUOM.Eof) do
    begin
      frmDialogBarangCompetitor.cbbUOM.AddItem(searchUOM.FieldByName('SAT_CODE').AsString,frmDialogBarangCompetitor.cbbUOM);
      searchUOM.Next;
    end;
  end; // if recordcount

  frmDialogBarangCompetitor.frmSuiMasterDialog.Caption := 'Edit Competitor Product (Survey)';
  frmDialogBarangCompetitor.FormMode := fmEdit;
  frmDialogBarangCompetitor.DialogUnit := MasterNewUnit.ID;
  frmDialogBarangCompetitor.FLoginId := FLoginId;
  frmDialogBarangCompetitor.KBD_ID := StrToInt(strgGrid.Cells[7,strgGrid.Row]);
  frmDialogBarangCompetitor.edtcompttCode.Text := edtcompttCode.Text;
  frmDialogBarangCompetitor.edtcompttCodeChange(Self);

  if not Assigned(BarangCompetitor) then
  BarangCompetitor := TBarangCompetitor.Create;
  frmDialogBarangCompetitor.dtSurvey.Date := BarangCompetitor.SearchTGLKompttBRGByID(StrToInt(cbpCompetitor.Cells[0,cbpCompetitor.Row]));

  frmDialogBarangCompetitor.edtProductCode.Text := strgGrid.Cells[1,strgGrid.Row];
  frmDialogBarangCompetitor.edtProductCodeChange(Self);
  frmDialogBarangCompetitor.curedtSellPrice.Value := StrToCurr(strgGrid.Cells[6,strgGrid.Row]);
  frmDialogBarangCompetitor.fedtConvert.Value := StrToFloat(strgGrid.Cells[2,strgGrid.Row]);
  frmDialogBarangCompetitor.fedtConvertChange(Self);
  frmDialogBarangCompetitor.cbbUOM.Text := strgGrid.Cells[4,strgGrid.Row];

  SetFormPropertyAndShowDialog(frmDialogBarangCompetitor);
  }
end;

procedure TfrmBarangCompetitor.cbpCompetitorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
   if(Key=VK_DELETE)and(ssctrl in Shift)then
    Key:= VK_NONAME;
   if(Key=Vk_ESCAPE) then actCloseExecute(Self);
end;

procedure TfrmBarangCompetitor.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if(Key = VK_F5) then
  begin
    if not assigned(frmDialogSearchProduct) then
      frmDialogSearchProduct := TfrmDialogSearchProduct.Create(Application);

    frmDialogSearchProduct.Modul := mNone;
    SetFormPropertyAndShowDialog(frmDialogSearchProduct);

    if frmDialogSearchProduct.IsProcessSuccessfull = True then
      edtProductCode.Text := frmDialogSearchProduct.ProductCode;

    frmDialogSearchProduct.Free;

  end;

  if(Key = 13) then btnShowClick(Self);

end;

procedure TfrmBarangCompetitor.FormCreate(Sender: TObject);
begin
  inherited;
  KeyPreview := True;
end;

procedure TfrmBarangCompetitor.strgGridRowChanging(Sender: TObject; OldRow,
  NewRow: Integer; var Allow: Boolean);
begin
  inherited;
  {edtProductname.Text := strgGrid.Cells[5,NewRow];

  if  strgGrid.Cells[0,NewRow] <> '0' then
  begin
    dataOwnGoods := BarangCompetitor.SearchOwnGoods(strgGrid.Cells[1,NewRow]);

    if dataOwnGoods.RecordCount > 0 then
    begin
      showOwnGoods();
    end
    else clearOwnGoods();
  end
  else clearOwnGoods();
  }
end;

end.
