unit ufrmDialogDetailSO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, ufraFooterDialog2Button, ExtCtrls, uConn,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxLabel, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, ufraFooterDialog3Button, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ufrmMasterDialogBrowse;

type
  TintHari = record
                hrSenin : Byte;
                hrSelasa: Byte;
                hrRabu  : Byte;
                hrKamis : Byte;
                hrJumat : Byte;
                hrSabtu : Byte;
                hrAhad  : Byte;
             end;
  TfrmDialogDetailSO = class(TfrmMasterDialogBrowse)
    Panel1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    edtSO_NO: TEdit;
    dtSO: TcxDateEdit;
    pnl2: TPanel;
    lbl3: TLabel;
    edtProductName: TEdit;
    lbl4: TLabel;
    edtCodeUOM: TEdit;
    edtNameUOM: TEdit;
    lbl5: TLabel;
    cbb1: TComboBox;
    edtMerGrup: TEdit;
    lbl6: TLabel;
    lblDeleteRow: TcxLabel;
    Label1: TLabel;
    edtAddPLU: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure strgGridRowChanging(Sender: TObject; OldRow, NewRow: Integer;
      var Allow: Boolean);
    procedure cbb1CloseUp(Sender: TObject);
    procedure strgGridCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure lblDeleteRowClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridCellValidate(Sender: TObject; ACol, ARow: Integer;
      var Value: String; var Valid: Boolean);
    procedure edtAddPLUKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridGetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
  private
    dataDetilSO: TDataSet;
    FNoSO: string;
    FSODate: TDate;
    FIsBelumPO: Boolean;
    //FTmpBarangCode: string;

    procedure SetNoSO(const Value: string);
    procedure SetSODate(const Value: TDate);
    procedure ParseHeaderGrid();
    procedure getAndShowData(SO_NO: string);
  public
    sMerchName : string;
    property NoSO: string read FNoSO write SetNoSO;
    property SODate: TDate read FSODate write SetSODate;
    property IsBelumPO: Boolean read FIsBelumPO write FIsBelumPO;
  end;

var
  frmDialogDetailSO: TfrmDialogDetailSO;

implementation

uses ufrmSearchSO, uTSCommonDlg,  uRetnoUnit, uConstanta;

const
  STR_STATUS_NO_CHANGE = 'NO_CHANGE';
  STR_STATUS_UPDATED = 'UPDATED';
  STR_STATUS_INSERTED = 'INSERTED';
  STR_STATUS_DELETED = 'DELETED';

{$R *.dfm}

  _kolNo        : integer = 0;
  _kolPlu       : integer = 1;
  _kolBkpBtkp   : integer = 2;  
  _kolNamaBarang: integer = 3;
  _kolQTY       : integer = 4;
  _kolSupCode   : integer = 5;
  _kolPrice     : integer = 6;
  _kolDisc1     : integer = 7;
  _kolDisc2     : integer = 8;
  _kolDisc3     : integer = 9;
  _kolPriceTot  : integer = 10;


procedure TfrmDialogDetailSO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogDetailSO.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogDetailSO := nil;
end;

procedure TfrmDialogDetailSO.ParseHeaderGrid;
begin
  {with strgGrid do
  begin
    Clear;
    RowCount := 2;
    ColCount := 11;
    Cells[_kolNo,0] := 'NO.';
    Cells[_kolPlu,0] := 'PRODUCT CODE';
    Cells[_kolBkpBtkp,0] := 'BKP/BTKP';
//    Cells[3,0] := 'QTY COMMON';
//    Cells[4,0] := 'QTY TRADER';
//    Cells[5,0] := 'QTY ASSGROS';  
    Cells[_kolNamaBarang,0] := 'NAMA BARANG';
    Cells[_kolQTY,0] := 'QTY';
    Cells[_kolSupCode,0] := 'SUPPLIER CODE';
    Cells[_kolPrice,0] := 'PRICE';
    Cells[_kolDisc1,0] := 'DISC 1';
    Cells[_kolDisc2,0] := 'DISC 2';
    Cells[_kolDisc3,0] := 'DISC 3';
    Cells[_kolPriceTot,0] := 'TOTAL PRICE';

    AutoSize := true;
  end; }
end;

procedure TfrmDialogDetailSO.getAndShowData(SO_NO: string);
var i: Integer;
    tempBool: Boolean;
begin
  //init
  i:= 1;
  {if not Assigned(DetilSO) then DetilSO := TDetilSO.Create;

  dataDetilSO := DetilSO.GetListDetilSO(SO_NO, DialogUnit, typeOrder);
  if dataDetilSO.RecordCount > 0 then
  begin
    with strgGrid do
    begin
      RowCount := dataDetilSO.RecordCount + 1;
      dataDetilSO.First;
      while not(dataDetilSO.Eof) do
      begin
        Cells[_kolNo,i] := IntToStr(i);
        Cells[_kolPlu,i] := dataDetilSO.FieldByName('SOD_BRG_CODE').AsString;

        if dataDetilSO.FieldByName('SOD_IS_BKP').AsInteger = 1 then
          Cells[_kolBkpBtkp,i] := 'BKP'
        else
          Cells[_kolBkpBtkp,i] := 'BTKP';

        Cells[_kolQTY,i] := dataDetilSO.FieldByName('SOD_QTY').AsString;
        Cells[_kolSupCode,i] := dataDetilSO.FieldByName('BRGSUP_SUP_CODE').AsString;
        Cells[_kolPrice,i] := CurrToStr(dataDetilSO.FieldByName('SOD_PRICE').AsCurrency);
        Cells[_kolDisc1,i] := CurrToStr(dataDetilSO.FieldByName('SOD_DISC1').AsCurrency);
        Cells[_kolDisc2,i] := CurrToStr(dataDetilSO.FieldByName('SOD_DISC2').AsCurrency);
        Cells[_kolDisc3,i] := CurrToStr(dataDetilSO.FieldByName('SOD_DISC3').AsCurrency);

        Cells[_kolPriceTot,i] := CurrToStr(dataDetilSO.FieldByName('SOD_QTY').AsFloat*
                              (dataDetilSO.FieldByName('SOD_PRICE').AsCurrency-
                              (dataDetilSO.FieldByName('SOD_PRICE').AsCurrency*
                              ((dataDetilSO.FieldByName('SOD_DISC1').AsCurrency/100)+
                              ((1-(dataDetilSO.FieldByName('SOD_DISC1').AsCurrency/100))*
                              dataDetilSO.FieldByName('SOD_DISC2').AsCurrency/100))+
                              dataDetilSO.FieldByName('SOD_DISC3').AsCurrency)));
        Cells[_kolNamaBarang,i] := dataDetilSO.FieldByName('BRG_ALIAS').AsString;
        dataDetilSO.Next;
        Inc(i);
      end; //end while
    end;// end with
  end
  else
  begin
    with strgGrid do
    begin
      RowCount := 2;
      Cells[0,1] := '';
      Cells[1,1] := '';
    end;// end with
  end;

  strgGrid.AutoSize := True;
  strgGrid.FixedRows := 1;
  strgGridRowChanging(Self,0,1,tempBool); }
end;

procedure TfrmDialogDetailSO.FormShow(Sender: TObject);
begin
  inherited;
  edtSO_NO.Text:= NoSO;
  dtSO.Date:= SODate;

  ParseHeaderGrid;
//  getAndShowData(edtSO_NO.Text,toSUP);
  if FIsBelumPO then
  begin
    footerDialogMaster.btnSave.Visible := True;
    footerDialogMaster.lbl4.Visible := True;
  end
  else
  begin
    footerDialogMaster.btnSave.Visible := False;
    footerDialogMaster.lbl4.Visible := False;
    lblDeleteRow.Visible := False;
    Label1.Visible := false;
    edtAddPLU.Visible := False; 
  end;
end;

procedure TfrmDialogDetailSO.strgGridRowChanging(Sender: TObject; OldRow,
  NewRow: Integer; var Allow: Boolean);
begin
  inherited;
  {edtProductName.Text := strgGrid.Cells[12,NewRow] +
        ' | ' + strgGrid.Cells[16,NewRow];
  edtCodeUOM.Text := strgGrid.Cells[13,NewRow];
  edtNameUOM.Text := strgGrid.Cells[14,NewRow];
  edtMerGrup.Text := strgGrid.Cells[15,NewRow];
  }
end;

procedure TfrmDialogDetailSO.cbb1CloseUp(Sender: TObject);
begin
  inherited;
//  if cbb1.ItemIndex = 1 then getAndShowData(edtSO_NO.Text,toBKP)
//  else getAndShowData(edtSO_NO.Text, toSUP);
end;

procedure TfrmDialogDetailSO.SetNoSO(const Value: string);
begin
  FNoSO := Value;
end;

procedure TfrmDialogDetailSO.SetSODate(const Value: TDate);
begin
  FSODate := Value;
end;

procedure TfrmDialogDetailSO.strgGridCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  inherited;
  if FIsBelumPO then
  begin
      CanEdit := True

  end
  else
    CanEdit := false;
end;

procedure TfrmDialogDetailSO.footerDialogMasterbtnSaveClick(
  Sender: TObject);
{var
  i: Integer;
  isSukses : Boolean;
  arrParam: TArr;
}
begin
  inherited;
  {isSukses := false;
  if not Assigned(DetilSO) then
    DetilSO := TDetilSO.Create;

  if not Assigned(DataSO) then
    DataSO := TDataSO.Create;

  try
    for i:= 1 to strgGrid.RowCount-1 do
    begin
      if Trim(strgGrid.Cells[1, i]) = '' then Continue;

      if strgGrid.Cells[21, i] = STR_STATUS_UPDATED then
        DetilSO.UpdateDetilSO(
            StrToFloat(strgGrid.Cells[3, i]),    // Qty Common
            StrToFloat(strgGrid.Cells[23, i]),   // Qty
            StrToInt(strgGrid.Cells[20, i])) // ID SO Detil

      else if strgGrid.Cells[21, i] = STR_STATUS_INSERTED then
      begin
        if strgGrid.cells[23,i] = '0' then
          Continue;
        arrParam:= nil;
        SetLength(arrParam,17);
        //SetLength(arrParam,16);
        arrParam[0].tipe:= ptString;
        arrParam[0].data:= edtSO_NO.Text;   // Nomor SO
        arrParam[1].tipe:= ptInteger;
        arrParam[1].data:= StrToInt(strgGrid.cells[27,i]);   // Brg_sup id
        arrParam[2].tipe:= ptCurrency;
        arrParam[2].data:= StrToFloat(strgGrid.cells[23,i]);   // Qty Common
        arrParam[3].tipe:= ptCurrency;
        arrParam[3].data:= StrToFloat(strgGrid.cells[3,i]);   // Qty Trader
        arrParam[4].tipe:= ptCurrency;
        arrParam[4].data:= StrToFloat(strgGrid.cells[4,i]);   // Qty Assgros
        arrParam[5].tipe:= ptCurrency;
        arrParam[5].data:= StrToFloat(strgGrid.cells[5,i]);   // Qty total
        arrParam[6].tipe:= ptString;
        arrParam[6].data:= strgGrid.cells[13,i];   // sat_ceode
        arrParam[7].tipe:= ptCurrency;
        arrParam[7].data:= StrToCurr(strgGrid.cells[7,i]);   // price
        arrParam[8].tipe:= ptCurrency;
        arrParam[8].data:= StrToFloat(strgGrid.cells[8,i]);   // disc1
        arrParam[9].tipe:= ptCurrency;
        arrParam[9].data:= StrToFloat(strgGrid.cells[9,i]);   // disc2
        arrParam[10].tipe:= ptCurrency;
        arrParam[10].data:= StrToFloat(strgGrid.cells[10,i]);   // disc3
        arrParam[11].tipe:= ptInteger;
        arrParam[11].data:= 0;                                 // is ordered

        arrParam[12].tipe:= ptInteger;
        if strgGrid.Cells[2, strgGrid.Row] = 'BKP' then
          arrParam[12].data:= 1                                // is bkp
        else arrParam[12].data := 0;

        arrParam[13].tipe := ptInteger;
        arrParam[13].data := StrToInt(strgGrid.cells[25,i]);  // is regular

        arrParam[14].tipe:= ptInteger;
        arrParam[14].data:= FLoginId;
        arrParam[15].tipe:= ptInteger;
        arrParam[15].data:= FLoginId;
        arrParam[16].tipe:= ptInteger;

        arrParam[16].data:= StrToInt(strgGrid.cells[26,i]); //merchan grup id
        DataSO.InputDataSODetil(arrParam);
      end
      else if strgGrid.Cells[21, i] = STR_STATUS_DELETED then
        DataSO.DeleteSODetilByID(
            StrToInt(strgGrid.Cells[20, i])) // ID SO Detil
    end;
    isSukses := True;
  except
    ADConn.Rollback;
  end;

  if isSukses then
  begin
    ADConn.Commit;
    CommonDlg.ShowMessage(1,'Information','SO edited successfully', mtInfo);
    Close;
  end
  }
end;

procedure TfrmDialogDetailSO.lblDeleteRowClick(Sender: TObject);
begin
  inherited;
  {strgGrid.RowColor[strgGrid.Row] := clRed;
  if strgGrid.Cells[22, strgGrid.Row] = STR_STATUS_INSERTED then
    strgGrid.Cells[21, strgGrid.Row] := STR_STATUS_NO_CHANGE
  else
    strgGrid.Cells[21, strgGrid.Row] := STR_STATUS_DELETED;
    }
end;

procedure TfrmDialogDetailSO.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if ssCtrl in Shift then
    if Key = Ord('D') then
      lblDeleteRowClick(Sender);
end;

procedure TfrmDialogDetailSO.strgGridCellValidate(Sender: TObject; ACol,
  ARow: Integer; var Value: String; var Valid: Boolean);
begin
  inherited;
  if Value = '' then
  begin
    Valid := False;
    Exit;
  end;

  if ACol = 3 then
  begin
//    if strgGrid.Cells[21, ARow] = STR_STATUS_NO_CHANGE then
//      strgGrid.Cells[21, ARow] := STR_STATUS_UPDATED;
//
//    //Update QTY
//    strgGrid.Cells[23, ARow] := FloatToStr(
//        StrToFloat(strgGrid.Cells[3,ARow]) +
//        StrToFloat(strgGrid.Cells[4,ARow]) +
//        StrToFloat(strgGrid.Cells[5,ARow]));
  end;
end;

procedure TfrmDialogDetailSO.edtAddPLUKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  _code: string;
  myRow,j: integer;
  data: TDataSet;
begin
  inherited;
  if Key = VK_RETURN then
  begin
    {
    _code := StrPadLeft(Trim(edtAddPLU.Text), igProd_Code_Length, '0');

    if not assigned(DataSO) then
      DataSO := TDataSO.Create;
    DataSO.isHari:=False;
    DataSO.IDMerchangrup:=StrToInt(frmDialogDetailSO.strgGrid.Cells[28,1]);
    DataSO.CodeSupplier:='All';
    DataSO.isForecasting:= false;
    DataSO.BarangCode := _code;
    data := DataSO.DataSOSupBarangCode;

    if data.IsEmpty then
    begin
      edtAddPLU.SelectAll;
      Exit;
    end;

    edtAddPLU.Clear;

    _code := data.fieldbyname('BRG_CODE').AsString;
    //bCodeExist := False;
    for j:=1 to strgGrid.RowCount-1 do
    begin
      if Trim(strgGrid.Cells[1,j]) = _code then
      begin
        exit;
      end;
    end;

    myRow := strgGrid.RowCount;
    strgGrid.AddRow;
    strgGrid.RowColor[myRow] := clYellow;

    with strgGrid do
    begin
      cells[0,myRow] := inttostr(myRow);
      cells[1,myRow] := _code;

      if data.fieldbyname('BRGSUP_IS_BKP').AsInteger = 0 then
        cells[2,myRow] := 'BKP'
      else
        cells[2,myRow] := 'BTKP';
      cells[3,myRow] := '0'; // Qty Common
      cells[4,myRow] := '0'; // Qty Trader
      cells[5,myRow] := '0'; // Qty Assgros
      cells[6,myRow] := data.fieldbyname('SUP_CODE').AsString;
      cells[7,myRow] := FloatToStr(data.fieldbyname('BRGSUP_BUY_PRICE').AsFloat);
      cells[8,myRow] := FloatToStr(data.fieldbyname('BRGSUP_DISC1').AsInteger);
      cells[9,myRow] := FloatToStr(data.fieldbyname('BRGSUP_DISC2').AsFloat);
      cells[10,myRow]:= FloatToStr(data.fieldbyname('BRGSUP_DISC3').AsFloat);
      cells[11,myRow]:= '0'; // Total --> toDo next
      cells[12,myRow]:= data.fieldbyname('BRG_ALIAS').AsString;
      cells[13,myRow]:= data.fieldbyname('BRG_SAT_CODE_STOCK').AsString;
      cells[14,myrow]:= ''; // Sat_name --> toDo next
      cells[15,myrow]:= ''; // Merchan_name --> toDo next

      Cells[20,myrow] := '0';   // ID SO Detil
      Cells[21,myrow] := STR_STATUS_INSERTED;                      // Status Perubahan
      Cells[22,myrow] := STR_STATUS_INSERTED;                      // Status: Added Row
      Cells[23,myrow] := '0';
      Cells[24,myrow] := '0';
      Cells[25,myrow] := '1';
      Cells[26,myrow] := data.FieldByName('MERCHANGRUP_ID').AsString;
      Cells[27,myrow] := data.FieldByName('BRGSUP_ID').AsString;
      Cells[28,myrow] := data.FieldByName('BRG_MERCHAN_ID').AsString;

      if not Assigned(DetilSO) then
        DetilSO := TDetilSO.Create;
      data := DetilSO.GetBarangMerk(Cells[1, myrow], DialogUnit);
      cells[16,myrow]:= data.fieldbyname('BRG_MERK').AsString;

    end;
    }
  end;
end;

procedure TfrmDialogDetailSO.strgGridGetFloatFormat(Sender: TObject; ACol,
  ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  inherited;   
  FloatFormat := '%.3n';
  if (ACol in [_kolQTY]) and (ARow > 0) then
    IsFloat := True
  else
  if (ACol in [_kolPrice, _kolDisc1, _kolDisc2, _kolDisc3, _kolPriceTot]) and (ARow > 0) then
  begin
    FloatFormat := '%.2n';
    IsFloat := True;
  end
  else
    IsFloat := False;


//  if ACol in [_kolNo.._kolBkpBtkp, _kolSupCode] then
//    IsFloat := False;
//
//  if IsFloat then
//    FloatFormat := '%.2n'; 

end;

end.


