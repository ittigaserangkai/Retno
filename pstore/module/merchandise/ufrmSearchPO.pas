unit ufrmSearchPO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Data.DB, Vcl.ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, System.Actions, Vcl.ActnList,
  ufraFooterDialog3Button, ufrmMasterDialogBrowse, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Vcl.Menus, cxButtons;

type
  TModul = (tmDeliveryOrder, tmCNDNGoodReceiving, tmReprintNP, tmReturDamage,
  tmReturReplace, tmWastageDamage, tmWastageObral, tmAdjustmentTurunan, tmNull,
  tmTrader, tmPOTrader, tmListCNMerchSupplier, tmPODOReceiving);
  TfrmDialogSearchPO = class(TfrmMasterDialogBrowse)
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    edt3: TEdit;
    dtTgl: TcxDateEdit;
    dt1: TcxDateEdit;
    lbl5: TLabel;
    chkDate: TCheckBox;
    pnl2: TPanel;
    Label1: TLabel;
    edtCN: TEdit;
    Label2: TLabel;
    edtDN: TEdit;
    cxGridViewColumn1: TcxGridDBColumn;
    cxGridViewColumn2: TcxGridDBColumn;
    cxGridViewColumn3: TcxGridDBColumn;
    cxGridViewColumn4: TcxGridDBColumn;
    cxGridViewColumn5: TcxGridDBColumn;
    cxGridViewColumn6: TcxGridDBColumn;
    cxGridViewColumn7: TcxGridDBColumn;
    btnBrowsePoNo: TcxButton;
    procedure chkDateClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure edt2KeyPress(Sender: TObject; var Key: Char);
    procedure edt1Change(Sender: TObject);
    procedure edt2Change(Sender: TObject);
    procedure edt3Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure strgGridDblClick(Sender: TObject);
    procedure edt1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridRowChanging(Sender: TObject; OldRow, NewRow: Integer;
      var Allow: Boolean);
  private
    FIsProcessSuccessfull: boolean;
    FModul: TModul;
    FSupCode: string;
    FBarangCode: string;
    FPONo: string;
    FPurchasePrice: string;
    FTraderData: TDataSet;
    FPOAsGrossData: TDataSet;
    procedure SetIsProcessSuccessfull(const Value: boolean);
    procedure SetModul(const Value: TModul);
    procedure ParseDataGrid();
    procedure FindDataOnGrid(AText: String);
    procedure SetSupCode(const Value: string);
    procedure SetBarangCode(const Value: string);
    procedure SetPONo(const Value: string);
    procedure SetPurchasePrice(const Value: string);
  public
    { Public declarations }
  published
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
    property Modul: TModul read FModul write SetModul;
    property SupCode: string read FSupCode write SetSupCode;
    property BarangCode: string read FBarangCode write SetBarangCode;
    property PONo: string read FPONo write SetPONo;
    property PurchasePrice: string read FPurchasePrice write SetPurchasePrice;
    property TraderData: TDataSet read FTraderData write FTraderData;
    property POAsGrossData: TDataSet read FPOAsGrossData write FPOAsGrossData;
  end;

var
  frmDialogSearchPO: TfrmDialogSearchPO;

implementation

uses uTSCommonDlg, uConn;

{$R *.dfm}

procedure TfrmDialogSearchPO.SetModul(const Value: TModul);
begin
  FModul:= Value;
end;

procedure TfrmDialogSearchPO.chkDateClick(Sender: TObject);
begin
  if (chkDate.Checked) then
  begin
    dtTgl.Enabled := true;
    dt1.Enabled := true;
  end
  else
  begin
    dtTgl.Enabled := false;
    dt1.Enabled := false;
  end;
end;

procedure TfrmDialogSearchPO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogSearchPO.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogSearchPO := nil;
end;

procedure TfrmDialogSearchPO.FormCreate(Sender: TObject);
begin
  inherited;
  FModul:= tmNull;
  dtTgl.Date := now;
  dt1.Date := now;
  chkDate.Checked := false;
  dtTgl.Enabled := false;
  dt1.Enabled := false;
end;

procedure TfrmDialogSearchPO.SetIsProcessSuccessfull(const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogSearchPO.footerDialogMasterbtnSaveClick(
  Sender: TObject);
var
  arrParam: TArr;
begin
  inherited;
  {if strgGrid.Row = 0 then
    strgGrid.Row := 1;
  if (strgGrid.Cells[2,strgGrid.Row] <> '') then
  begin
    FIsProcessSuccessfull := true;
    if Modul in [tmAdjustmentTurunan] then
    begin
      PONo := strgGrid.Cells[2, strgGrid.Row];
      PurchasePrice := strgGrid.Cells[8, strgGrid.row];
    end
    else
    if FModul in [tmPoTrader] then
    begin
      PONo:= strgGrid.Cells[0,strgGrid.Row];
      if not Assigned(SearchPO) then;
        SearchPO := TSearchPO.Create;
      SetLength(arrParam,1);
      arrParam[0].tipe:= ptString;
      arrParam[0].data:= PONo;
      POAsGrossData := SearchPO.GetListDataPOTraderDetailByNoPO(arrParam);
    end
    else
    if FModul in [tmTrader] then
    begin
      // Add code here
      if not Assigned(SearchPO) then;
        SearchPO := TSearchPO.Create;
      SetLength(arrParam,1);
      arrParam[0].tipe:= ptString;
      arrParam[0].data:= strgGrid.Cells[2,strgGrid.Row];
      TraderData := SearchPO.GetListDataTraderByPOTrader(arrParam);
    end
    else
    if Modul = tmPODOReceiving then
       FPONo:= strgGrid.Cells[0,strgGrid.Row]
    else if FModul in [tmListCNMerchSupplier] then
      FPONo := strgGrid.Cells[2,strgGrid.Row];
    Close;
  end
  else
  begin
    CommonDlg.ShowError('Please choice PO on the list first.');
    FIsProcessSuccessfull := false;
  end; }
end;

procedure TfrmDialogSearchPO.btnSearchClick(Sender: TObject);
begin
  ParseDataGrid();
end;

procedure TfrmDialogSearchPO.edt2KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    btnSearchClick(self);
  end;
end;

procedure TfrmDialogSearchPO.FindDataOnGrid(AText: String);
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

procedure TfrmDialogSearchPO.edt1Change(Sender: TObject);
begin
  if FModul in [tmListCNMerchSupplier] then
    edt2.Text := '';
  FindDataOnGrid(edt1.Text);
end;

procedure TfrmDialogSearchPO.edt2Change(Sender: TObject);
begin
  if FModul in [tmListCNMerchSupplier] then
    edt1.Text := '';
  FindDataOnGrid(edt2.Text);
end;

procedure TfrmDialogSearchPO.edt3Change(Sender: TObject);
begin
  FindDataOnGrid(edt3.Text);
end;

procedure TfrmDialogSearchPO.ParseDataGrid;
var i: integer;
    arrParam: TArr;
    data: TDataSet;
    tmpPONo: string;
begin
  {strgGrid.HideColumn(1);
  if not Assigned(SearchPO) then
    SearchPO:= TSearchPO.Create;

  if FModul in [tmDeliveryOrder] then
  begin
    if chkDate.Checked then
    begin
      SetLength(arrParam,2);
      arrParam[0].tipe:= ptDateTime;
      arrParam[0].data:= dtTgl.Date;
      arrParam[1].tipe:= ptDateTime;
      arrParam[1].data:= dt1.Date;
      data:= SearchPO.GetListDataPOByDate(arrParam);
    end
    else
      data:= SearchPO.GetListDataPO;
    i:=1;
    if not data.IsEmpty then
    begin
      strgGrid.RowCount:= data.RecordCount+1;
      with data do
      while not Eof do
      begin
        with strgGrid do
        begin
          Cells[0,i] := fieldbyname('MERCHAN_NAME').AsString;
          Cells[1,i] := '';//fieldbyname('MERCHANGRUP_NAME').AsString;
          Cells[2,i] := fieldbyname('PO_NO').AsString;
          Cells[3,i] := fieldbyname('STAPO_NAME').AsString;
          Cells[4,i] := fieldbyname('SUPMG_CODE').AsString;
          Cells[5,i] := fieldbyname('SUP_NAME').AsString;
          Cells[6,i] := FormatDateTime('dd-MM-yyyy',fieldbyname('PO_DATE').AsDateTime);
        end;
        Inc(i);
        Next;
      end;
    end
    else
    begin
      strgGrid.RowCount:=2;
      strgGrid.ClearRows(1,1);
    end;
  end
  else if FModul in [tmCNDNGoodReceiving,tmReprintNP] then
  begin
    if chkDate.Checked then
    begin
      SetLength(arrParam,3);
      arrParam[0].tipe:= ptDateTime;
      arrParam[0].data:= dtTgl.Date;
      arrParam[1].tipe:= ptDateTime;
      arrParam[1].data:= dt1.Date;
      arrParam[2].tipe := ptString;
      arrParam[2].data := '5';
      data:= SearchPO.GetListDataPOByDateWhereStatusPO(arrParam);
    end
    else
    begin
      SetLength(arrParam, 1);
      arrParam[0].tipe := ptString;
      arrParam[0].data := '5';
      data:= SearchPO.GetListDataPOWhereStatusPO(arrParam);
    end;
    strgGrid.RowCount:= data.RecordCount + 1;
    i:=1;

    if data.RecordCount > 0 then
    begin
      pnl2.Visible := True;
      strgGrid.ColCount := 8;
      strgGrid.Cells[6,0] := 'Tanggal';
      strgGrid.Cells[7,0] := 'Is CN';
      strgGrid.Cells[8,0] := 'Is DN';
      with data do
      while not Eof do
      begin
        with strgGrid do
        begin
          Cells[0,i] := fieldbyname('MERCHAN_NAME').AsString;
          Cells[1,i] := '';//('MERCHANGRUP_NAME').AsString;
          Cells[2,i] := fieldbyname('PO_NO').AsString;
          Cells[3,i] := fieldbyname('STAPO_NAME').AsString;
          Cells[4,i] := fieldbyname('SUPMG_CODE').AsString;
          Cells[5,i] := fieldbyname('SUP_NAME').AsString;
          Cells[6,i] := FormatDateTime('dd-MM-yyyy',fieldbyname('PO_DATE').AsDateTime);

          if fieldbyname('DO_CN_QTY').AsInteger > 0 then
            Cells[7,i] := 'CN';
          if fieldbyname('DO_DN_QTY').AsInteger > 0 then
            Cells[8,i] := 'DN';
          Cells[20,i] := fieldbyname('DO_CN_QTY').AsString;
          Cells[21,i] := fieldbyname('DO_DN_QTY').AsString;
        end;
        Inc(i);
        Next;
      end;
    end else
    begin
      strgGrid.ClearRows(1, strgGrid.RowCount);
      strgGrid.RowCount := 2;
      strgGrid.FixedRows := 1;
    end;
  end else if (FModul in [tmReturDamage, tmReturReplace]) then
  begin
    if chkDate.Checked then
    begin
      SetLength(arrParam,6);
      arrParam[0].tipe:= ptDateTime;
      arrParam[0].data:= dtTgl.Date;
      arrParam[1].tipe:= ptDateTime;
      arrParam[1].data:= dt1.Date;
      arrParam[2].tipe := ptString;
      arrParam[2].data := SupCode;
      arrParam[3].tipe := ptString;
      arrParam[3].data := BarangCode;
      arrParam[4].tipe := ptInteger;
      if FModul = tmReturDamage then
        arrParam[4].data := 3
      else if FModul = tmReturReplace then
        arrParam[4].data := 4;
      arrParam[5].tipe := ptInteger;
      arrParam[5].data := DialogUnit;
      data:= SearchPO.GetListDataPOByDateWhereDOIsPaid(arrParam);
    end
    else
    begin
      SetLength(arrParam, 4);
      arrParam[0].tipe := ptString;
      arrParam[0].data := SupCode;
      arrParam[1].tipe := ptString;
      arrParam[1].data := BarangCode;
      arrParam[2].tipe := ptInteger;
      if FModul = tmReturDamage then
        arrParam[2].data := 3
      else if FModul = tmReturReplace then
        arrParam[2].data := 4;
      arrParam[3].tipe := ptInteger;
      arrParam[3].data := DialogUnit;
      data:= SearchPO.GetListDataPOWhereDOIsPaid(arrParam);
    end;
    strgGrid.RowCount:= data.RecordCount + 1;
    i:=1;

    if data.RecordCount > 0 then
    begin
      with data do
      while not Eof do
      begin
        with strgGrid do
        begin
          Cells[0,i] := fieldbyname('MERCHAN_NAME').AsString;
          Cells[1,i] := '';//fieldbyname('MERCHANGRUP_NAME').AsString;
          Cells[2,i] := fieldbyname('PO_NO').AsString;
          Cells[3,i] := fieldbyname('STAPO_NAME').AsString;
          Cells[4,i] := fieldbyname('SUPMG_CODE').AsString;
          Cells[5,i] := fieldbyname('SUP_NAME').AsString;
          Cells[6,i] := FormatDateTime('dd-MM-yyyy',fieldbyname('PO_DATE').AsDateTime);
          Cells[7,i] := fieldByName('IGRD_ID').AsString;
          Cells[8,i] := CurrToStr(fieldByName('POD_PRICE').AsCurrency);
          Cells[9,i] := FloatToStr(fieldbyname('POD_PPN_PERSEN').AsFloat);
          Cells[10,i] := FloatToStr(fieldbyname('POD_PPNBM_PERSEN').AsFloat);
          Cells[11,i] := fieldbyname('BRG_NAME').AsString;
          Cells[12,i] := fieldbyname('BRG_SAT_CODE_STOCK').AsString;

//          CommonDlg.ShowMessage(Cells[6, i]);
        end;
        Inc(i);
        Next;
      end;
    end else
    begin
      strgGrid.ClearRows(1, strgGrid.RowCount);
      strgGrid.RowCount := 2;
      strgGrid.FixedRows := 1;
    end;
  end
  else if (FModul in [tmWastageDamage, tmWastageObral]) then
  begin
    if chkDate.Checked then
    begin
      SetLength(arrParam,3);
      arrParam[0].tipe:= ptDateTime;
      arrParam[0].data:= dtTgl.Date;
      arrParam[1].tipe:= ptDateTime;
      arrParam[1].data:= dt1.Date;
      arrParam[2].tipe := ptString;
      arrParam[2].data := BarangCode;
      data:= SearchPO.GetListDataPOByDateWhereDOIsPaidNoSuplier(arrParam);
    end
    else
    begin
      SetLength(arrParam, 1);
      arrParam[0].tipe := ptString;
      arrParam[0].data := BarangCode;
      data:= SearchPO.GetListDataPOWhereDOIsPaidNoSuplier(arrParam);
    end;
    strgGrid.RowCount:= 2;
    i:=1;

    if data.RecordCount > 0 then
    begin
      with data do
      begin
        tmpPONo:= '';
        while not Eof do
        begin
          if fieldbyname('PO_NO').AsString<>tmpPONo then
          with strgGrid do
          begin
            if i>1 then
              strgGrid.RowCount:= strgGrid.RowCount+1;
            tmpPONo:= fieldbyname('PO_NO').AsString;
            Cells[0,i] := fieldbyname('MERCHAN_NAME').AsString;
            Cells[1,i] := '';//fieldbyname('MERCHANGRUP_NAME').AsString;
            Cells[2,i] := fieldbyname('PO_NO').AsString;
            Cells[3,i] := fieldbyname('STAPO_NAME').AsString;
            Cells[4,i] := fieldbyname('SUPMG_CODE').AsString;
            Cells[5,i] := fieldbyname('SUP_NAME').AsString;
            Cells[6,i] := FormatDateTime('dd-MM-yyyy',fieldbyname('PO_DATE').AsDateTime);
            Cells[7,i] := fieldByName('IGRD_ID').AsString;
            Cells[8,i] := CurrToStr(fieldByName('POD_PRICE').AsCurrency);
            Cells[9,i] := FloatToStr(fieldbyname('POD_PPN_PERSEN').AsFloat);
            Cells[10,i] := FloatToStr(fieldbyname('POD_PPNBM_PERSEN').AsFloat);
            Cells[11,i] := fieldbyname('BRG_NAME').AsString;
            Cells[12,i] := fieldbyname('BRG_SAT_CODE_STOCK').AsString;
          end;
          Inc(i);
          Next;
        end;
      end;
    end
    else
    begin
      strgGrid.ClearRows(1, strgGrid.RowCount);
      strgGrid.RowCount := 2;
      strgGrid.FixedRows := 1;
    end;
  end else if (Modul in [tmAdjustmentTurunan]) then
  begin
    if chkDate.Checked then
    begin
      SetLength(arrParam, 4);
      arrParam[0].tipe := ptDateTime;
      arrParam[0].data := dtTgl.Date;
      arrParam[1].tipe := ptDateTime;
      arrParam[1].data := dtTgl.Date;
      arrParam[2].tipe := ptString;
      arrParam[2].data := BarangCode;
      arrParam[3].tipe := ptInteger;
      arrParam[3].data := DialogUnit;

      data := SearchPO.GetListPOByProductCodeAndDate(arrParam);
    end
    else
    begin
      SetLength(arrParam, 2);
      arrParam[0].tipe := ptString;
      arrParam[0].data := BarangCode;
      arrParam[1].tipe := ptInteger;
      arrParam[1].data := DialogUnit;

      data := SearchPO.GetListPOByProductCode(arrParam);
    end;

    strgGrid.RowCount:= 2;
    i:=1;

    if data.RecordCount > 0 then
    begin
      with data do
      begin
        tmpPONo:= '';
        while not Eof do
        begin
          if fieldbyname('PO_NO').AsString<>tmpPONo then
          with strgGrid do
          begin
            if i>1 then
              strgGrid.RowCount:= strgGrid.RowCount+1;
            tmpPONo:= fieldbyname('PO_NO').AsString;
            Cells[0,i] := fieldbyname('MERCHAN_NAME').AsString;
            Cells[1,i] := '';//fieldbyname('MERCHANGRUP_NAME').AsString;
            Cells[2,i] := fieldbyname('PO_NO').AsString;
            Cells[3,i] := fieldbyname('STAPO_NAME').AsString;
            Cells[4,i] := fieldbyname('SUP_CODE').AsString;
            Cells[5,i] := fieldbyname('SUP_NAME').AsString;
            Cells[6,i] := FormatDateTime('dd-MM-yyyy',fieldbyname('PO_DATE').AsDateTime);
            Cells[7,i] := CurrToStr(fieldbyname('POD_TOTAL_DISC').AsCurrency);
          end;
          Inc(i);
          Next;
        end;
      end;
    end
    else
    begin
      strgGrid.ClearRows(1, strgGrid.RowCount);
      strgGrid.RowCount := 2;
      strgGrid.FixedRows := 1;
    end;
  end
  else if Modul in [tmTrader, tmPoTrader, tmPODOReceiving] then
  begin
    if chkDate.Checked then
    begin
      if FModul in [tmPODOReceiving, tmPoTrader] then
         SetLength(arrParam, 4)
      else
          SetLength(arrParam, 3);

      arrParam[0].tipe := ptString;
      if length(edt1.text)<16 then
         arrParam[0].data := edt1.Text+'%'
      else
          arrParam[0].data := edt1.Text;
      arrParam[1].tipe := ptDateTime;
      arrParam[1].data := dtTgl.Date;
      arrParam[2].tipe := ptDateTime;
      arrParam[2].data := dt1.Date;

      if FModul = tmPODOReceiving then
      begin
        arrParam[3].tipe:= ptString;
        arrParam[3].data:= 'invoicing';
        data:= SearchPO.GetListDataPoTraderByPONoDateStatus(arrParam);
      end else
      begin
        arrParam[3].tipe:= ptString;
        arrParam[3].data:= 'OPEN';
        data := SearchPO.GetListDataPoTraderByNOPOStatus(arrParam);
      end;
    end
    else
    begin
      SetLength(arrParam, 1);
      arrParam[0].tipe := ptString;
      arrParam[0].data := edt1.Text;

      data := SearchPO.GetListDataPOTraderByNoPO(arrParam);
    end;

    with strgGrid do
    begin
      Clear;
      ColCount:= 4;
      RowCount:= 2;
      Cells[0,0] := 'PO NO';
      Cells[1,0] := 'POAS STATUS';
      Cells[2,0] := 'MEMBER CODE';
      Cells[3,0] := 'MEMBER NAME';
      Cells[4,0] := 'POAS DATE';
    end;
    strgGrid.ColCount:= 4;
    strgGrid.Cells[0,0]:= 'PO NO';
    strgGrid.Cells[1,0]:= 'PO STATUS';
    strgGrid.Cells[2,0]:= 'TRADER CODE';
    strgGrid.Cells[3,0]:= 'TRADER NAME';
    strgGrid.Cells[4,0]:= 'PO DATE';

    i:=1;
//tidak menggunakan merchan grup
    if data.RecordCount > 0 then
    begin
      with data do
      begin
        tmpPONo:= '';
        while not Eof do
        begin
          if fieldbyname('POAS_NO').AsString<>tmpPONo then
          with strgGrid do
          begin
            if i>1 then
              strgGrid.RowCount:= strgGrid.RowCount+1;
            tmpPONo:= fieldbyname('POAS_NO').AsString;
            Cells[0,i] := fieldbyname('POAS_NO').AsString;
            Cells[1,i] := fieldbyname('POAS_STATUS').AsString;
            Cells[2,i] := fieldbyname('TRD_CODE').AsString;
            Cells[3,i] := fieldbyname('TRD_NAME').AsString;
            Cells[4,i] := FormatDateTime('dd-MM-yyyy',fieldbyname('POAS_DATE').AsDateTime);
          end;
          Inc(i);
          Next;
        end;
        StrgGrid.AutoSize:= True;
      end;
    end
    else
    begin
      strgGrid.ClearRows(1, strgGrid.RowCount);
      strgGrid.RowCount := 2;
      strgGrid.FixedRows := 1;
    end;
  end else
  if FModul in [tmListCNMerchSupplier] then
  begin
    data := nil;
    if Trim(edt2.Text) <> '' then
      if chkDate.Checked then
      begin
        SetLength(arrParam, 3);
        arrParam[0].tipe := ptString;
        arrParam[0].data := edt2.Text;
        arrParam[1].tipe := ptDateTime;
        arrParam[1].data := dtTgl.Date;
        arrParam[2].tipe := ptDateTime;
        arrParam[2].data := dt1.Date;

        data := SearchPO.GetNoPOCNByDate(arrParam);
      end
      else
      begin
        SetLength(arrParam, 1);
        arrParam[0].tipe := ptString;
        arrParam[0].data := edt2.Text;

        data := SearchPO.GetNoPOCN(arrParam);
      end
    else if Trim(edt1.Text) <> '' then
      if chkDate.Checked then
      begin
        SetLength(arrParam, 3);
        arrParam[0].tipe := ptString;
        arrParam[0].data := edt1.Text;
        arrParam[1].tipe := ptDateTime;
        arrParam[1].data := dtTgl.Date;
        arrParam[2].tipe := ptDateTime;
        arrParam[2].data := dt1.Date;

        data := SearchPO.GetNoPOCNByDatePONo(arrParam);
      end
      else
      begin
        SetLength(arrParam, 1);
        arrParam[0].tipe := ptString;
        arrParam[0].data := edt1.Text;

        data := SearchPO.GetNoPOCNByPONo(arrParam);
      end;

    if data = nil then Exit;
    strgGrid.RowCount:= 2;
    i:=1;

    if data.RecordCount > 0 then
    begin
      strgGrid.RowCount:= data.RecordCount + 1;
      with data do
      begin
        tmpPONo:= '';
        while not Eof do
        begin
          if fieldbyname('PO_NO').AsString<>tmpPONo then
          with strgGrid do
          begin
            if i>1 then
              strgGrid.RowCount:= strgGrid.RowCount+1;
            tmpPONo:= fieldbyname('PO_NO').AsString;
            Cells[0,i] := fieldbyname('MERCHAN_NAME').AsString;
            Cells[1,i] := '';//('MERCHANGRUP_NAME').AsString;
            Cells[2,i] := fieldbyname('PO_NO').AsString;
            Cells[3,i] := fieldbyname('STAPO_NAME').AsString;
            Cells[4,i] := fieldbyname('SUP_CODE').AsString;
            Cells[5,i] := fieldbyname('SUP_NAME').AsString;
            Cells[6,i] := FormatDateTime('dd-MM-yyyy',fieldbyname('PO_DATE').AsDateTime);
          end;
          Inc(i);
          Next;
        end;
      end;
    end
    else
    begin
      strgGrid.ClearRows(1, strgGrid.RowCount);
      strgGrid.RowCount := 2;
      strgGrid.FixedRows := 1;
    end;
  end;
  strgGrid.FixedRows := 1;
  strgGrid.AutoSize := true;
  strgGrid.SetFocus; }
end;

procedure TfrmDialogSearchPO.FormShow(Sender: TObject);
var
  _bAllow: Boolean;
begin
  pnl2.Visible := False;
  ParseDataGrid();
  edt1.SetFocus;

  if FModul in [tmListCNMerchSupplier] then
  begin
    if Trim(edt2.Text) <> '' then
    begin
      edt2.SetFocus;
      edt2.SelectAll;
      btnSearchClick(Sender);
    end;
  end;
  _bAllow := True;
  strgGridRowChanging(Sender, 0, 1, _bAllow);
end;

procedure TfrmDialogSearchPO.SetSupCode(const Value: string);
begin
  FSupCode := Value;
end;

procedure TfrmDialogSearchPO.SetBarangCode(const Value: string);
begin
  FBarangCode := Value;
end;

procedure TfrmDialogSearchPO.strgGridDblClick(Sender: TObject);
begin
  inherited;
  footerDialogMasterbtnSaveClick(Self);
end;

procedure TfrmDialogSearchPO.edt1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=VK_DOWN) then
    cxGrid.SetFocus;
end;

procedure TfrmDialogSearchPO.strgGridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_UP) then
    if (cxGridView.DataController.RecNo = 1) then
    begin
      edt1.SetFocus;
      edt1.SelectAll;
    end;
end;

procedure TfrmDialogSearchPO.SetPONo(const Value: string);
begin
  FPONo := Value;
end;

procedure TfrmDialogSearchPO.SetPurchasePrice(const Value: string);
begin
  FPurchasePrice := Value;
end;

procedure TfrmDialogSearchPO.edt1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    btnSearchClick(Self);
end;

procedure TfrmDialogSearchPO.strgGridKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    footerDialogMasterbtnSaveClick(Self);
end;

procedure TfrmDialogSearchPO.strgGridRowChanging(Sender: TObject; OldRow,
  NewRow: Integer; var Allow: Boolean);
begin
  inherited;
  if pnl2.Visible then
  begin
//    edtCN.Text := strgGrid.Cells[20, NewRow];
//    edtDN.Text := strgGrid.Cells[21, NewRow];
  end;
end;

end.


