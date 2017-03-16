unit ufrmListAdjustmentProduct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, ufraFooter5Button, StdCtrls, ExtCtrls, ActnList,
  Grids, BaseGrid, AdvGrid, SUIButton, Mask, JvToolEdit, uConn, JclStrings,
  suithemes;

type
  TfrmListAdjustmentProduct = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    actlstAdjustmentProduct: TActionList;
    actAddAdjustmentProduct: TAction;
    actDeleteAdjustmentProduct: TAction;
    actRefreshAdjsutmentProduct: TAction;
    pnlTop: TPanel;
    lbl1: TLabel;
    lbl3: TLabel;
    dtTglOpnamFrom: TJvDateEdit;
    btnShow: TsuiButton;
    dtTglOpnamTo: TJvDateEdit;
    pnlGrid: TPanel;
    strgGrid: TAdvStringGrid;
    btnPrint: TsuiButton;
    lbl2: TLabel;
    edtTransNo1: TEdit;
    edtTransNo2: TEdit;
    lbl4: TLabel;
    btnPrintRekap: TsuiButton;
    actEditAdjustmentProduct: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
//    procedure actAddAdjustmentProductExecute(Sender: TObject);
//    procedure actDeleteAdjustmentProductExecute(Sender: TObject);
//    procedure actRefreshAdjsutmentProductExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnShowClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnPrintRekapClick(Sender: TObject);
//    procedure actEditAdjustmentProductExecute(Sender: TObject);
//    procedure fraFooter5Button1btnUpdateClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
//    procedure btnApplyClick(Sender: TObject);
    procedure btnShowEnter(Sender: TObject);
    procedure btnPrintEnter(Sender: TObject);
    procedure btnPrintRekapEnter(Sender: TObject);
    procedure btnPrintRekapExit(Sender: TObject);
    procedure btnPrintExit(Sender: TObject);
    procedure btnShowExit(Sender: TObject);
    procedure fraFooter5Button1btnCloseClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FNoBuktiID1: Integer;
    FnoBuktiId2: Integer;
//    objAdjustment: TAdjustmentStock;
//    function GetListAdjustmentProductByDate(ADate1, ADate2: TDateTime): TResultDataSet;
//    function GetListAdjustmentProductForPrint(ADate1, ADate2: TDateTime): TResultDataSet;
    function GetSqlAdjProductForPrint(aStartDate: TDatetime; aEndDate: TDatetime;
        aTransaksi1: string = ''; aTransaksi2: string = ''): string;
    function GetSqlListAdjProduct(aStartDate: TDatetime; aEndDate: TDatetime;
        aTransaksi1: string = ''; aTransaksi2: string = ''): string;
    procedure ParseDataAdjustment();
    procedure ParseHeader;
    procedure LookUpData(Sender: TObject; Key: Word);
  public
    { Public declarations }
  end;

var
  frmListAdjustmentProduct: TfrmListAdjustmentProduct;

implementation

uses uRMSUnit, udmReportNew , DB;

const
  _kolNo      : Integer = 0;
  _KolId      : Integer = 1;
  _kolNoBukti : Integer = 2;
  _kolTGLBUkti: Integer = 3;
  _kolDes     : Integer = 4;
  _RowCount   : Integer = 2;
  _ColCount   : Integer = 5;
  _fixedRow   : Integer = 1;
{$R *.dfm}

procedure TfrmListAdjustmentProduct.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmListAdjustmentProduct.FormDestroy(Sender: TObject);
begin
  inherited;
//  FreeAndNil(objAdjustment);
  frmListAdjustmentProduct := nil;
end;

//procedure TfrmListAdjustmentProduct.actAddAdjustmentProductExecute(
//  Sender: TObject);
//begin
//  inherited;
//  if not Assigned(frmDialogAdjustmentProduct) then
//    frmDialogAdjustmentProduct := TfrmDialogAdjustmentProduct.Create(Application);
//
//  frmDialogAdjustmentProduct.frmSuiMasterDialog.Caption := 'Add Adjusment Product';
//  SetFormPropertyAndShowDialog(frmDialogAdjustmentProduct);
//
//  if frmDialogAdjustmentProduct.IsProcessSuccesfull then
//  begin
//    CommonDlg.ShowMessage(CONF_ADD_SUCCESSFULLY);
//  end;
//
//  frmDialogAdjustmentProduct.Free;
//end;

//procedure TfrmListAdjustmentProduct.actDeleteAdjustmentProductExecute(
//  Sender: TObject);
//var arrParam: TArr;
//begin
//  inherited;
//
//
//  if strgGrid.Cells[3, strgGrid.Row] = 'POSTED' then
//  begin
//    CommonDlg.ShowError('Adjustment Product No ' + strgGrid.Cells[1, strgGrid.Row] + ' Has Already Posted');
//    Exit;
//  end;
//
//  if (CommonDlg.Confirm('Are you sure you wish to Data Adjustment Product (No: '+ strgGrid.Cells[1, strgGrid.Row] +')?') = mrNo) then
//    Exit;
//
//  SetLength(arrParam, 2);
//  arrParam[0].tipe := ptString;
//  arrParam[0].data := strgGrid.Cells[4, strgGrid.Row];
//  arrParam[1].tipe := ptInteger;
//  arrParam[1].data := MasterNewUnit.ID;
//
//  if objAdjustment.DeleteDataAdjustmentProduct(arrParam) then
//  begin
//    CommonDlg.ShowMessage(CONF_DELETE_SUCCESSFULLY);
//    actRefreshAdjsutmentProductExecute(Self);
//  end;
//end;

//procedure TfrmListAdjustmentProduct.actRefreshAdjsutmentProductExecute(
//  Sender: TObject);
//begin
//  inherited;
//  btnShowClick(Self);
//end;

//function TfrmListAdjustmentProduct.GetListAdjustmentProductByDate(ADate1,
//  ADate2: TDateTime): TResultDataSet;
//var arrParam: TArr;
//begin
//  if (edtTransNo1.Text = '') and (edtTransNo2.Text = '') then
//  begin
//    SetLength(arrParam, 3);
//    arrParam[0].tipe := ptDateTime;
//    arrParam[0].data := ADate1;
//    arrParam[1].tipe := ptDateTime;
//    arrParam[1].data := ADate2;
//    arrParam[2].tipe := ptInteger;
//    arrParam[2].data := MasterNewUnit.ID;
//
//    Result := objAdjustment.GetListAdjustmentProductByDateAndUntId(arrParam);
//  end
//  else
//  begin
//    SetLength(arrParam, 5);
//    arrParam[0].tipe := ptDateTime;
//    arrParam[0].data := ADate1;
//    arrParam[1].tipe := ptDateTime;
//    arrParam[1].data := ADate2;
//    arrParam[2].tipe := ptString;
//    arrParam[2].data := edtTransNo1.Text;
//    arrParam[3].tipe := ptString;
//    arrParam[3].data := edtTransNo2.Text;
//    arrParam[4].tipe := ptInteger;
//    arrParam[4].data := MasterNewUnit.ID;
//
//    Result := objAdjustment.GetListAdjustmentProductByDateAdjNoAndUntId(arrParam);
//  end;  
//end;

procedure TfrmListAdjustmentProduct.FormCreate(Sender: TObject);
begin
  inherited;
//  if not Assigned(objAdjustment) then
//    objAdjustment := TAdjustmentStock.Create;
end;

procedure TfrmListAdjustmentProduct.ParseDataAdjustment;
var
//  data: TResultDataSet;
  i: Integer;
begin
  ParseHeader;
  with cOpenQuery(GetSqlListAdjProduct(dtTglOpnamFrom.Date, dtTglOpnamTo.Date,
              edtTransNo1.Text, edtTransNo2.Text)) do
  begin
    try
      i := strgGrid.FixedRows;
      while not Eof do
      begin
        if i > strgGrid.FixedRows then
          strgGrid.AddRow;

        strgGrid.Cells[_kolNo, i]       := IntToStr(i);
        strgGrid.Cells[_KolId, i]       := fieldbyname('ID').AsString;
        strgGrid.Cells[_kolNoBukti, i]  := fieldbyname('NoBukti').AsString;
        strgGrid.Cells[_kolTGLBUkti, i] := fieldbyname('TGLBUkti').AsString;
        strgGrid.Cells[_kolDes, i]      := fieldbyname('Keterangan').AsString;

        Inc(i);
        Next;
      end;
    finally
      Free;
    end;
  end;  


//  data := GetListAdjustmentProductByDate(dtTglOpnamFrom.Date, dtTglOpnamTo.Date);
//
//  with strgGrid do
//  begin
//    if not data.IsEmpty then
//    begin
//      RowCount := data.RecordCount + 1;
//      i := 1;
//
//      while not (data.Eof)  do
//      begin
//        Cells[0, i] := DateToStr(data.fieldbyname('ADJPROD_DATE').AsDateTime);
//        Cells[1, i] := data.fieldbyname('ADJPROD_NO').AsString;
//        Cells[2, i] := data.fieldbyname('ADJPROD_REMARK').AsString;
//        Cells[3, i] := data.fieldbyname('ADJPROD_STATUS').AsString;
//        Cells[4, i] := data.fieldbyname('ADJPROD_ID').AsString;
//
//        Inc(i);
//        data.Next;
//      end;
//    end
//    else
//    begin
//      RowCount := 2;
//      Cells[0, 1] := '';
//      Cells[1, 1] := '';
//      Cells[2, 1] := '';
//      Cells[3, 1] := '';
//      Cells[4, 1] := '';
//    end;
//
//    FixedRows := 1;
    AutoSize := True;
//  end;
end;

procedure TfrmListAdjustmentProduct.btnShowClick(Sender: TObject);
begin
  inherited;
  ParseDataAdjustment;
end;

//function TfrmListAdjustmentProduct.GetListAdjustmentProductForPrint(ADate1,
//  ADate2: TDateTime): TResultDataSet;
//var arrParam: TArr;
//begin
//  if (edtTransNo1.Text = '') and (edtTransNo2.Text = '') then
//  begin
//    SetLength(arrParam, 3);
//    arrParam[0].tipe := ptDateTime;
//    arrParam[0].data := ADate1;
//    arrParam[1].tipe := ptDateTime;
//    arrParam[1].data := ADate2;
//    arrParam[2].tipe := ptInteger;
//    arrParam[2].data := MasterNewUnit.ID;
//
//    Result := objAdjustment.GetDataAdjustmentProductForPrint(arrParam);
//  end
//  else
//  begin
//    SetLength(arrParam, 5);
//    arrParam[0].tipe := ptDateTime;
//    arrParam[0].data := ADate1;
//    arrParam[1].tipe := ptDateTime;
//    arrParam[1].data := ADate2;
//    arrParam[2].tipe := ptString;
//    arrParam[2].data := edtTransNo1.Text;
//    arrParam[3].tipe := ptString;
//    arrParam[3].data := edtTransNo2.Text;
//    arrParam[4].tipe := ptInteger;
//    arrParam[4].data := MasterNewUnit.ID;
//
//    Result := objAdjustment.GetDataAdjustmentProductForPrintByAdjNo(arrParam);
//  end;
//end;

procedure TfrmListAdjustmentProduct.btnPrintClick(Sender: TObject);
var
  sSQL: string;
// myList: TStringList;
begin
  inherited;

    sSQL := 'select ' + GetCompanyHeader(FLoginFullname,MasterNewUnit.Nama,cGetServerTime,cGetServerTime)
          + ' ID, NoBukti, TGLBUkti, Keterangan, b.*, c.brg_code, c.brg_name, c.brg_alias'
          + ' from TSTOCKADJUSTMENT a, TSTOCKADJUSTMENTITEM b, barang c'
          + ' where a.id = b.header_id'
          + ' and a.unt_id = b.headerunit_Id'
          + ' and b.brg_code = c.brg_code'
          + ' and TGLBUkti >= '+  QuotDTNol(dtTglOpnamFrom.Date)
          + ' and TGLBUkti <= '+ QuotD(dtTglOpnamTo.Date, True)
          + ' and a.unt_id = ' + IntToStr(MasterNewUnit.ID);     

  if (Trim(edtTransNo1.Text) <> '') and (Trim(edtTransNo2.Text) <> '') then
  begin
    sSQL := sSQL
        + ' and ID >= '+ IntToStr(FNoBuktiID1)
        + ' and ID <= '+ IntToStr(FNoBuktiID2);
  end;

//  sSQL := GetSqlAdjProductForPrint(dtTglOpnamFrom.Date, dtTglOpnamTo.Date,
//          edtTransNo1.Text, edtTransNo2.Text);

  dmReportNew.EksekusiReport('frListingAdjustmentProduct', sSQL, '', True);

//  myList := TStringList.Create;
//
//  myList.Add(DateToStr(dtTglOpnamFrom.Date));
//  myList.Add(DateToStr(dtTglOpnamTo.Date));
//  myList.Add(FLoginUsername);
//  myList.Add(MasterNewUnit.Nama);
//
//  if not Assigned(frmDialogPrintPreview) then
//    frmDialogPrintPreview:= TfrmDialogPrintPreview.Create(Application);
//
//  with frmDialogPrintPreview do
//  begin
//    ListParams:= myList;
//    FilePath  := FFilePathReport + 'frListingAdjustmentProduct.fr3';
//    RecordSet := GetListAdjustmentProductForPrint(dtTglOpnamFrom.Date, dtTglOpnamTo.Date);
//    SetFormPropertyAndShowDialog(frmDialogPrintPreview);
//  end;
//  FreeAndNil(myList);
//  FreeAndNil(frmDialogPrintPreview);
end;

procedure TfrmListAdjustmentProduct.btnPrintRekapClick(Sender: TObject);
var
//    myList: TStringList;
    sSQL: string;
//    arrParam: TArr;
begin
  inherited;

  sSQL := 'SELECT ' + GetCompanyHeader(FLoginUsername, MasterNewUnit.Nama, dtTglOpnamFrom.Date, dtTglOpnamTo.Date)
      + ' MG.MERCHANGRUP_REK_CODE, MG.MERCHANGRUP_NAME,'
      + ' SUM(DIF(IEQUAL(SIGN(APD.APD_TOTAL),1), APD.APD_TOTAL, 0)) AS ADJ_POSITIF,'
      + ' SUM(DIF(IEQUAL(SIGN(APD.APD_TOTAL),-1), APD.APD_TOTAL, 0)) AS ADJ_NEGATIF'
      + ' FROM ADJUSTMENT_PRODUCT AP'
      + ' LEFT JOIN ADJUSTMENT_PRODUCT_DETIL APD ON APD.APD_ADJPROD_ID = AP.ADJPROD_ID'
      + ' AND APD.APD_ADJPROD_UNT_ID = AP.ADJPROD_UNT_ID'
      + ' LEFT JOIN BARANG BRG ON BRG.BRG_CODE = APD.APD_BRG_CODE'
      + ' LEFT JOIN REF$MERCHANDISE_GRUP MG ON MG.MERCHANGRUP_ID = BRG.BRG_MERCHANGRUP_ID'
      + ' LEFT JOIN REF$SATUAN SAT ON SAT.SAT_CODE = APD.APD_SAT_CODE'
      + ' WHERE AP.ADJPROD_DATE >= '+ QuotDTNol(dtTglOpnamFrom.Date)
      + ' AND AP.ADJPROD_DATE <= '+ QuotDTNol(dtTglOpnamTo.Date)
      + ' AND AP.ADJPROD_UNT_ID = '+ IntToStr(MasterNewUnit.ID)
      + ' GROUP BY MG.MERCHANGRUP_REK_CODE, MG.MERCHANGRUP_NAME';

  dmReportNew.EksekusiReport('frListingAdjustmentProductByMerchangroup', sSQL, '',True);

//  myList := TStringList.Create;
//
//  myList.Add(DateToStr(dtTglOpnamFrom.Date));
//  myList.Add(DateToStr(dtTglOpnamTo.Date));
//  myList.Add(FLoginUsername);
//  myList.Add(MasterNewUnit.Nama);
//
//  SetLength(arrParam, 3);
//  arrParam[0].tipe := ptDateTime;
//  arrParam[0].data := dtTglOpnamFrom.Date;
//  arrParam[1].tipe := ptDateTime;
//  arrParam[1].data := dtTglOpnamTo.Date;
//  arrParam[2].tipe := ptInteger;
//  arrParam[2].data := MasterNewUnit.ID;
//
//    if not Assigned(frmDialogPrintPreview) then
//    frmDialogPrintPreview:= TfrmDialogPrintPreview.Create(Application);
//
//  with frmDialogPrintPreview do
//  begin
//    ListParams:= myList;
//    FilePath  := FFilePathReport + 'frListingAdjustmentProductByMerchangroup.fr3';
//    RecordSet := objAdjustment.GetDataAdjustmentProductByMerchangroup(arrParam);
//    SetFormPropertyAndShowDialog(frmDialogPrintPreview);
//  end;
//  FreeAndNil(myList);
//  FreeAndNil(frmDialogPrintPreview);

end;

//procedure TfrmListAdjustmentProduct.actEditAdjustmentProductExecute(
//  Sender: TObject);
//begin
//  inherited;
//  if strgGrid.Cells[3, strgGrid.Row] = 'POSTED' then
//  begin
//    CommonDlg.ShowError('Adjustment Product No ' + strgGrid.Cells[1, strgGrid.Row] + ' Has Already Posted');
//    Exit;
//  end;
//
//  if not Assigned(frmDialogAdjustmentProduct) then
//    frmDialogAdjustmentProduct := TfrmDialogAdjustmentProduct.Create(Application);
//
//  frmDialogAdjustmentProduct.StatusForm := frEdit;
//  frmDialogAdjustmentProduct.dtTglOpnam.Date := StrToDate(strgGrid.Cells[0, strgGrid.Row]);
//  frmDialogAdjustmentProduct.edt1.Text := strgGrid.Cells[1, strgGrid.Row];
//  frmDialogAdjustmentProduct.edtRemark.Text := strgGrid.Cells[2, strgGrid.Row];
//  frmDialogAdjustmentProduct.adjProductId := StrToInt(strgGrid.Cells[4, strgGrid.Row]);
//
//  SetFormPropertyAndShowDialog(frmDialogAdjustmentProduct);
//
//  if frmDialogAdjustmentProduct.IsProcessSuccesfull then
//  begin
//    CommonDlg.ShowMessage(CONF_EDIT_SUCCESSFULLY);
//    actRefreshAdjsutmentProductExecute(Self);
//  end;  
//
//  frmDialogAdjustmentProduct.Free;
//end;

//procedure TfrmListAdjustmentProduct.fraFooter5Button1btnUpdateClick(
//  Sender: TObject);
//begin
//  inherited;
//  actEditAdjustmentProductExecute(Self);
//end;

procedure TfrmListAdjustmentProduct.FormShow(Sender: TObject);
begin
  inherited;
  dtTglOpnamFrom.Date := Now;
  dtTglOpnamTo.Date := Now;
end;

//procedure TfrmListAdjustmentProduct.btnApplyClick(Sender: TObject);
//begin
//  inherited;
//  if strgGrid.Cells[3, strgGrid.Row] = 'POSTED' then
//  begin
//    CommonDlg.ShowError('Adjustment Product No ' + strgGrid.Cells[1, strgGrid.Row] + ' Has Already Posted');
//    Exit;
//  end;
//
//  if not Assigned(frmDialogAdjustmentProduct) then
//    frmDialogAdjustmentProduct := TfrmDialogAdjustmentProduct.Create(Application);
//
//  frmDialogAdjustmentProduct.StatusForm := frApply;
//  frmDialogAdjustmentProduct.dtTglOpnam.Date := StrToDate(strgGrid.Cells[0, strgGrid.Row]);
//  frmDialogAdjustmentProduct.edt1.Text := strgGrid.Cells[1, strgGrid.Row];
//  frmDialogAdjustmentProduct.edtRemark.Text := strgGrid.Cells[2, strgGrid.Row];
//  frmDialogAdjustmentProduct.adjProductId := StrToInt(strgGrid.Cells[4, strgGrid.Row]);
//
//  SetFormPropertyAndShowDialog(frmDialogAdjustmentProduct);
//
//  if frmDialogAdjustmentProduct.IsProcessSuccesfull then
//  begin
//    CommonDlg.ShowMessage('Apply Success');
//    actRefreshAdjsutmentProductExecute(Self);
//  end;
//
//  frmDialogAdjustmentProduct.Free;
//end;

procedure TfrmListAdjustmentProduct.btnShowEnter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmListAdjustmentProduct.btnPrintEnter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmListAdjustmentProduct.btnPrintRekapEnter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmListAdjustmentProduct.btnPrintRekapExit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

procedure TfrmListAdjustmentProduct.btnPrintExit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

procedure TfrmListAdjustmentProduct.btnShowExit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

function TfrmListAdjustmentProduct.GetSqlAdjProductForPrint(aStartDate:
    TDatetime; aEndDate: TDatetime; aTransaksi1: string = ''; aTransaksi2:
    string = ''): string;
var
  sSQL: string;
begin
  sSQL := 'SELECT '+ GetCompanyHeader(FLoginUsername, MasterNewUnit.Nama, aStartDate, aEndDate)
      + ' AP.ADJPROD_NO, AP.ADJPROD_REMARK, BRG.BRG_CODE,'
      + ' BRG.BRG_ALIAS, APD.APD_NO_PO, APD.APD_SAT_CODE,'
      + ' SAT.SAT_NAME, APD.APD_QTY, APD.APD_TOTAL, AP.ADJPROD_STATUS,'
      + ' AP.ADJPROD_DATE_POSTED, AP.ADJPROD_DATE, BRG.BRG_MERCHANGRUP_ID'
      + ' FROM ADJUSTMENT_PRODUCT AP'
      + ' LEFT JOIN ADJUSTMENT_PRODUCT_DETIL APD ON APD.APD_ADJPROD_ID = AP.ADJPROD_ID'
      + ' AND APD.APD_ADJPROD_UNT_ID = AP.ADJPROD_UNT_ID'
      + ' LEFT JOIN BARANG BRG ON BRG.BRG_CODE = APD.APD_BRG_CODE'
      + ' LEFT JOIN REF$SATUAN SAT ON SAT.SAT_CODE = APD.APD_SAT_CODE'
      + ' WHERE AP.ADJPROD_DATE >= '+ QuotDTNol(aStartDate)
      + ' AND AP.ADJPROD_DATE <= '+ QuotD(aEndDate, True)
      + ' AND AP.ADJPROD_UNT_ID = '+ IntToStr(MasterNewUnit.ID);

  if (aTransaksi1 <> '') and (aTransaksi2 <> '') then
  begin
    sSQL := sSQL
          + ' AND AP.ADJPROD_NO >= '+ Quot(aTransaksi1)
          + ' AND AP.ADJPROD_NO <= '+ Quot(aTransaksi2);
  end;

  Result := sSQL;
end;

function TfrmListAdjustmentProduct.GetSqlListAdjProduct(aStartDate: TDatetime;
    aEndDate: TDatetime; aTransaksi1: string = ''; aTransaksi2: string = ''):
    string;
var
  sSQL : string;
begin
  sSQL := ' select ID, NoBukti, TGLBUkti, Keterangan'
        + ' from TSTOCKADJUSTMENT'
        + ' where TGLBUkti >= '+  QuotDTNol(aStartDate)
        + ' and TGLBUkti <= '+ QuotD(aEndDate, True)
        + ' and UNT_ID = ' + IntToStr(masternewunit.id);

  if (Trim(aTransaksi1) <> '') and (Trim(aTransaksi2) <> '') then
  begin
    sSQL := sSQL
        + ' and ID >= '+ IntToStr(FNoBuktiID1)
        + ' and ID <= '+ IntToStr(FNoBuktiID2);
  end;

//  sSQL := 'SELECT AP.ADJPROD_ID, AP.ADJPROD_NO, AP.ADJPROD_DATE,'
//        + ' AP.ADJPROD_ALLOCATION, AP.ADJPROD_REMARK, AP.ADJPROD_TOTAL,'
//        + ' AP.ADJPROD_STATUS FROM ADJUSTMENT_PRODUCT AP'
//        + ' WHERE AP.ADJPROD_DATE >= '+  QuotDTNol(aStartDate)
//        + ' AND AP.ADJPROD_DATE <= '+ QuotD(aEndDate, True)
//        + ' AND AP.ADJPROD_UNT_ID = ' + IntToStr(MasterNewUnit.ID);
//
//  if (aTransaksi1 <> '') and (aTransaksi2 <> '') then
//  begin
//    sSQL := sSQL
//          + ' AND AP.ADJPROD_NO >= '+ Quot(aTransaksi1)
//          + ' AND AP.ADJPROD_NO <= '+ Quot(aTransaksi2);
//  end;

  Result := sSQL;
end;

procedure TfrmListAdjustmentProduct.ParseHeader;
begin
  with strgGrid do
  begin
    Clear;
    ColCount  := _ColCount;
    RowCount  := _RowCount;
    FixedRows := _fixedRow;
    Cells[_kolNo, 0]        := 'NO';
    Cells[_KolId, 0]        := 'ID';
    Cells[_kolNoBukti, 0]   := 'NO BUKTI';
    Cells[_kolTGLBUkti, 0]  := 'TANGAL BUKTI';
    Cells[_kolDes, 0]       := 'KETERANGAN';

  end;
end;

procedure TfrmListAdjustmentProduct.fraFooter5Button1btnCloseClick(
  Sender: TObject);
begin
  inherited;
  fraFooter5Button1.btnCloseClick(Sender);

end;

procedure TfrmListAdjustmentProduct.LookUpData(Sender: TObject; Key: Word);
var
  sSQL : string;
begin
  if (Sender = edtTransNo1) or (Sender = edtTransNo2)  then
  begin
    sSQL := ' select ID, NoBukti, TGLBUkti, Keterangan'
          + ' from TSTOCKADJUSTMENT'
          + ' where UNT_ID = ' + IntToStr(masternewunit.id);

    if Key = vk_F5 then
    begin

      with cLookUp('Data Stock Adjustment',sSQL,200,1,True ) do
      begin
        if Strings[0] = '' then
            Exit;

        if Sender = edtTransNo1 then
        begin
          FNoBuktiID1 := StrToInt(Strings[0]);
          edtTransNo1.Text  := Strings[1];
        end
        else
        begin
          FNoBuktiID2 := StrToInt(Strings[0]);
          edtTransNo2.Text  := Strings[1];
        end;

      end;
    end;
//    else if key = VK_RETURN then
//    begin
//
//    end;


  end;


end;

procedure TfrmListAdjustmentProduct.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  LookUpData(ActiveControl, Key);
end;

end.
