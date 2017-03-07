unit ufrmDisplayPO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, SUIButton, Grids, BaseGrid,
  AdvGrid, ufraFooter5Button, JclStrings, Mask, JvToolEdit, JvEdit,
   JvFloatEdit, ActnList;

type
  TModul = (mMain, mHistoryPO);
  
  TfrmDisplayPO = class(TfrmMaster)
    pnlTop: TPanel;
    lbl1: TLabel;
    edtPONo: TEdit;
    btn1: TsuiButton;
    fraFooter5Button1: TfraFooter5Button;
    strgGrid: TAdvStringGrid;
    pnl1: TPanel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    dtDatePO: TJvDateEdit;
    dtDateSO: TJvDateEdit;
    edtSONo: TEdit;
    edtSuplierCode: TEdit;
    edtSuplierName: TEdit;
    edtDONo: TEdit;
    lbl2: TLabel;
    dtDateDO: TJvDateEdit;
    lbl4: TLabel;
    edtNP: TEdit;
    lbl9: TLabel;
    lbl10: TLabel;
    jvcuredtSubTotal: TJvValidateEdit;
    jvcuredtPPN: TJvValidateEdit;
    lbl13: TLabel;
    jvcuredtPPNBM: TJvValidateEdit;
    lbl14: TLabel;
    lbl12: TLabel;
    jvcuredtDiscount: TJvValidateEdit;
    jvcuredtTotalBeli: TJvValidateEdit;
    lbl11: TLabel;
    lbl3: TLabel;
    lbl15: TLabel;
    edtjfBonus: TJvValidateEdit;
    lbl16: TLabel;
    edtjfTotalColie: TJvValidateEdit;
    edtjfRecvBonus: TJvValidateEdit;
    lbl17: TLabel;
    pnl2: TPanel;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    lbl21: TLabel;
    lbl22: TLabel;
    lbl23: TLabel;
    edtProductName: TEdit;
    lbl24: TLabel;
    edtjfTotalOrder: TJvValidateEdit;
    edtjfDisc1: TJvValidateEdit;
    edtjfDisc2: TJvValidateEdit;
    jvcuredtNilaiDisc: TJvValidateEdit;
    jvcuredtTotalDisc: TJvValidateEdit;
    jvcuredtSellPrice: TJvValidateEdit;
    btn2: TsuiButton;
    lblStatusPO: TLabel;
    btnCetakNP: TsuiButton;
    actlst1: TActionList;
    actSaveGoodReceiving: TAction;
    actClearGoodReceiving: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure edtPONoChange(Sender: TObject);
    procedure edtDONoKeyPress(Sender: TObject; var Key: Char);
    procedure strgGridGetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
    procedure edtPONoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridGetCellColor(Sender: TObject; ARow, ACol: Integer;
      AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure strgGridClick(Sender: TObject);
    procedure strgGridRowChanging(Sender: TObject; OldRow, NewRow: Integer;
      var Allow: Boolean);
    procedure strgGridCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure actSaveGoodReceivingExecute(Sender: TObject);
    procedure actClearGoodReceivingExecute(Sender: TObject);
    procedure strgGridGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure btn1Enter(Sender: TObject);
    procedure btn2Enter(Sender: TObject);
    procedure btnCetakNPEnter(Sender: TObject);
    procedure btnCetakNPExit(Sender: TObject);
    procedure btn2Exit(Sender: TObject);
    procedure btn1Exit(Sender: TObject);
  private
    FModul: TModul;
    FValidDate: TDate;
    FStatusPO: string;
    FTOP: Integer;
    FCommon,FAssgros,FTrader: Integer;
    FHargaDisc: Real;
    function SaveData: Boolean;
    function CheckIsPOExist(ANoPO:string): Boolean;
    function SumColStringGrid(StrGrid:TAdvStringGrid;Col,RowStart,RowEnd:Integer):Real;
    function CekChekBoxInGrid: Boolean;
    procedure ShowDetailPO(ANoPO:string);
    procedure FormulaDisconPerRow(Row:Integer; QTYReceive:Integer);
    procedure SetHeaderGrid;
    procedure SetClearValue;
    procedure ClearForm;
    procedure AllocatedStock(Receive: Integer;
                             var FCommon,FAssgros,FTrader: Integer);
    procedure SetModul(const Value: TModul);
  public
    { Public declarations }
  published
    property Modul: TModul read FModul write SetModul;
  end;

var
  frmDisplayPO: TfrmDisplayPO;
  ParamList: TStringList;

implementation

uses uGTSUICommonDlg,suithemes, uConstanta, ufrmSearchPO, uConn, uDeliveryOrder, DB,
  ufrmMain, udmReport, VarUtils, ufrmReprintNP, ufrmDeliveryOrder,
  uRegionalSettingUtils;

{$R *.dfm}

procedure TfrmDisplayPO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmMain.DestroyMenu((Sender as TForm));
  Action := caFree;
end;

procedure TfrmDisplayPO.FormulaDisconPerRow(Row:Integer; QTYReceive:Integer);
var Total, Price,
    Disc1, Disc2, Disc3,
    TotalDiscTemp, TotalDisc: Real;
begin
  Price:= StrToFloat(strgGrid.Cells[2,Row]);
  Disc1:= StrToFloat(strgGrid.Cells[9,Row]);
  Disc2:= StrToFloat(strgGrid.Cells[10,Row]);
  Disc3:= StrToFloat(strgGrid.Cells[11,Row]);

  //TotalDisc = Total Harga setelah discount
  Total := Price * QTYReceive;
  TotalDiscTemp := ((100-Disc1)/100) * Total;
  TotalDisc := (((100-Disc2)/100) * TotalDiscTemp) - (Disc3* QTYReceive);

  strgGrid.Cells[18,Row]:= FormatFloat('##0.00',TotalDisc);

  //Nilai dicountnya
  strgGrid.Cells[31,Row]:= FormatFloat('##0.00',TOTAL - TotalDisc);

  //strgGrid.Cells[18,Row]:= FormatFloat('##0.00',Total-StrToFloat(strgGrid.Cells[15,Row]));

end;

procedure TfrmDisplayPO.AllocatedStock
          (Receive: Integer;
           var FCommon,FAssgros,FTrader: Integer);
var sisa,
    AllocCommon,
    AllocAssgros,
    AllocTrader: Integer;
begin
  AllocAssgros:= 0;
  AllocTrader:= 0;
  sisa:= Receive - FCommon;
  if sisa <= 0 then
    AllocCommon:= Receive
  else
  begin
    AllocCommon:= FCommon;
    Receive:= sisa;
    sisa:= Receive - FTrader;
    if sisa <= 0 then
      AllocTrader:= Receive
    else
    begin
      AllocTrader:= FTrader;
      AllocAssgros:= sisa;
    end;
  end;

  FCommon:= AllocCommon;
  FAssgros:= AllocAssgros;
  FTrader:= AllocTrader;
end;

function TfrmDisplayPO.CekChekBoxInGrid: Boolean;
var i: Integer;
    hasil: Boolean;
begin
  hasil:= True;
  i:=1;
  while(hasil)and(i<=strgGrid.RowCount-1)do
  begin
    strgGrid.GetCheckBoxState(7,i,hasil);
    Inc(i);
  end;
  Result:= hasil;
end;

function TfrmDisplayPO.SaveData: Boolean;
var arrParam: TArr;
    Hasil: Boolean;
    i: Integer;
    Receive,DOId: Integer;
begin
  try
  Screen.Cursor:= crHourGlass;
  Hasil:= False;
  if not assigned(DeliveryOrder) then
    DeliveryOrder := TDeliveryOrder.Create;

  if lblStatusPO.Font.Color=clRed then
  begin
    //Set Status PO to Expired
    SetLength(arrParam,3);
    arrParam[0].tipe:= ptString;
    arrParam[0].data:= PO_DESCRIPTION_EXPIRED;
    arrParam[1].tipe:= ptInteger;
    arrParam[1].data:= frmMain.LoginId;
    arrParam[2].tipe:= ptString;
    arrParam[2].data:= edtPONo.Text;
    Hasil:= DeliveryOrder.SetPOExpired(arrParam);
  end
  else
  if lblStatusPO.Font.Color=clBlack then
  begin
    //Set Status PO to Received
    SetLength(arrParam,4);
    arrParam[0].tipe:= ptDateTime;
    arrParam[0].data:= dtDateDO.Date;
    arrParam[1].tipe:= ptString;
    arrParam[1].data:= PO_DESCRIPTION_RECEIVED;
    arrParam[2].tipe:= ptInteger;
    arrParam[2].data:= frmMain.LoginId;
    arrParam[3].tipe:= ptString;
    arrParam[3].data:= edtPONo.Text;
    Hasil:= DeliveryOrder.SetPOOrdered(arrParam);
    if not Hasil then
    begin
      Result:= Hasil;
      Exit;
    end;

    //Insert Data to DO
    SetLength(arrParam,25);
    arrParam[0].tipe := ptString;
    arrParam[0].data := edtNP.Text;
    arrParam[1].tipe := ptString;
    arrParam[1].data := edtPONo.Text;
    arrParam[2].tipe := ptDateTime;
    arrParam[2].data := dtDateDO.Date;
    arrParam[3].tipe := ptCurrency;
    arrParam[3].data := 0; //hitung sama triger - jvcuredtSubTotal.Value;
    arrParam[4].tipe := ptCurrency;
    arrParam[4].data := 0; //hitung sama triger
    arrParam[5].tipe := ptCurrency;
    arrParam[5].data := 0; //hitung sama triger
    arrParam[6].tipe := ptCurrency;
    arrParam[6].data := 0; //hitung sama triger
    arrParam[7].tipe := ptInteger;
    arrParam[7].data := 0;
    arrParam[8].tipe := ptDateTime;
    arrParam[8].data := Now + FTOP;
    arrParam[9].tipe := ptInteger;
    arrParam[9].data := 0;
    arrParam[10].tipe:= ptString;
    arrParam[10].data:= DO_DESCRIPTION_RECEIVED;
    arrParam[11].tipe:= ptInteger;
    arrParam[11].data:= 0;
    arrParam[12].tipe:= ptInteger;
    arrParam[12].data:= 0;
    arrParam[13].tipe:= ptInteger;
    arrParam[13].data:= 0;
    arrParam[14].tipe:= ptInteger;
    arrParam[14].data:= edtjfTotalOrder.Value;
    arrParam[15].tipe:= ptInteger;
    arrParam[15].data:= edtjfBonus.Value;
    arrParam[16].tipe:= ptInteger;
    arrParam[16].data:= edtjfTotalColie.Value;
    arrParam[17].tipe:= ptInteger;
    arrParam[17].data:= edtjfRecvBonus.Value;
    arrParam[18].tipe:= ptInteger;
    arrParam[18].data:= 1;
    arrParam[19].tipe:= ptInteger;
    arrParam[19].data:= 0;
    arrParam[20].tipe:= ptInteger;
    arrParam[20].data:= 0;
    arrParam[21].tipe:= ptString;
    arrParam[21].data:= edtDONo.Text;
    arrParam[22].tipe:= ptInteger;
    arrParam[22].data:= frmMain.LoginId;
    arrParam[23].tipe:= ptInteger;
    arrParam[23].data:= edtjfBonus.Value;
    arrParam[24].tipe:= ptInteger;
    arrParam[24].data:= edtjfRecvBonus.Value;
    Hasil:= DeliveryOrder.InputDO(arrParam);
    if not Hasil then
    begin
      Result:= Hasil;
      Exit;
    end;

    //Insert Data to DO Detil
    for i:=1 to strgGrid.RowCount-1 do
    begin
      DOId:= DeliveryOrder.GetDODID;
      SetLength(arrParam,21);
      arrParam[0].tipe := ptString;
      arrParam[0].data := edtDONo.Text;
      arrParam[1].tipe := ptInteger;
      arrParam[1].data := StrToInt(strgGrid.Cells[19,i]);
      arrParam[2].tipe := ptInteger;
      arrParam[2].data := StrToInt(strgGrid.Cells[3,i]);
      arrParam[3].tipe := ptInteger;
      arrParam[3].data := StrToInt(strgGrid.Cells[4,i]);
      Receive:= StrToInt(strgGrid.Cells[4,i]);
      FCommon:= StrToInt(strgGrid.Cells[20,i]);
      FAssgros:= StrToInt(strgGrid.Cells[21,i]);
      FTrader:= StrToInt(strgGrid.Cells[22,i]);
      AllocatedStock(Receive,FCommon,FAssgros,FTrader);
      arrParam[4].tipe := ptInteger;
      arrParam[4].data := StrToInt(strgGrid.Cells[20,i]);
      arrParam[5].tipe := ptInteger;
      arrParam[5].data := StrToInt(strgGrid.Cells[21,i]);
      arrParam[6].tipe := ptInteger;
      arrParam[6].data := StrToInt(strgGrid.Cells[22,i]);
      arrParam[7].tipe := ptInteger;
      arrParam[7].data := FCommon;
      arrParam[8].tipe := ptInteger;
      arrParam[8].data := FTrader;
      arrParam[9].tipe := ptInteger;
      arrParam[9].data := FAssgros;
      arrParam[10].tipe := ptString;
      arrParam[10].data := strgGrid.Cells[5,i];
      arrParam[11].tipe := ptCurrency;
      arrParam[11].data := StrToFloat(strgGrid.Cells[2,i]); //harga
      arrParam[12].tipe := ptCurrency;
      arrParam[12].data := StrToFloat(strgGrid.Cells[9,i]);  //disc1
      arrParam[13].tipe := ptCurrency;
      arrParam[13].data := StrToFloat(strgGrid.Cells[10,i]); //disc2
      arrParam[14].tipe := ptCurrency;
      arrParam[14].data := StrToFloat(strgGrid.Cells[11,i]); //disc3
      arrParam[15].tipe := ptCurrency;
      arrParam[15].data := StrToFloat(strgGrid.Cells[29,i]); //PPN PERSEN >> PPN = BY TRIGGER
      arrParam[16].tipe := ptCurrency;
      arrParam[16].data := StrToFloat(strgGrid.Cells[30,i]); //PPNBM PERSEN >> PPNBM = BY TRIGGER
      arrParam[17].tipe:= ptInteger;
      arrParam[17].data:= frmMain.LoginId;
      arrParam[18].tipe := ptInteger;
      arrParam[18].data := StrToInt(strgGrid.Cells[4,i]);
      arrParam[19].tipe := ptInteger;
      arrParam[19].data := StrToInt(strgGrid.Cells[3,i]) - StrToInt(strgGrid.Cells[4,i]);
      arrParam[20].tipe := ptInteger;
      arrParam[20].data := DOId;
      Hasil:= DeliveryOrder.InputDOStokDetil(arrParam);
      if not Hasil then
      begin
        Result:= Hasil;
        ADConn.Rollback;
        Exit;
      end;

      // Update Barang Transaksi Set Cogs (HPP) And Last Cost
      SetLength(arrParam, 5);
      arrParam[0].tipe := ptCurrency;
      arrParam[0].data := StrToFloat(strgGrid.Cells[28,i]);
      arrParam[1].tipe := ptCurrency;
      arrParam[1].data := StrToFloat(strgGrid.Cells[2,i]);
      arrParam[2].tipe := ptInteger;
      arrParam[2].data := frmMain.LoginId;
      arrParam[3].tipe := ptString;
      arrParam[3].data := strgGrid.Cells[1,i];
      arrParam[4].tipe := ptInteger;
      arrParam[4].data := DeliveryOrder.GetUnitId;

      Hasil := DeliveryOrder.UpdateBarangTransaksiSetCogsAndLastCostByBrgCode(arrParam);

      { Update Barang Transaksi Set Cogs (HPP) Untuk barang bonus}
      if StrToInt(strgGrid.Cells[24,i])>0 then
      begin
        SetLength(arrParam, 4);
        arrParam[0].tipe := ptInteger;
        arrParam[0].data := StrToInt(strgGrid.Cells[24,i]); //QTY Bonus Sales
        arrParam[1].tipe := ptInteger;
        arrParam[1].data := frmMain.LoginId;
        arrParam[2].tipe := ptString;
        arrParam[2].data := strgGrid.Cells[25,i]; //Code Barang Bonus
        arrParam[3].tipe := ptInteger;
        arrParam[3].data := DeliveryOrder.GetUnitId;
        Hasil := DeliveryOrder.UpdateCOGSForBonus(arrParam);
      end;

      if(StrToInt(strgGrid.Cells[6,i])>0)then
      begin
        //Insert data to"DO_Bonus"
        SetLength(arrParam,6);
        arrParam[0].tipe := ptInteger;
        arrParam[0].data := DOId;
        arrParam[1].tipe := ptString;
        arrParam[1].data := strgGrid.Cells[25,i]; //Code Barang Bonus
        arrParam[2].tipe := ptInteger;
        if strgGrid.Cells[23,i]='' then
          strgGrid.Cells[23,i]:='0';
        arrParam[2].data := StrToInt(strgGrid.Cells[23,i]); //QTY Bonus CS
        arrParam[3].tipe := ptInteger;
        if strgGrid.Cells[24,i]='' then
          strgGrid.Cells[24,i]:='0';
        arrParam[3].data := StrToInt(strgGrid.Cells[24,i]); //QTY Bonus Sales
        arrParam[4].tipe := ptInteger;
        arrParam[4].data := frmMain.LoginId;
        arrParam[5].tipe := ptInteger;
        arrParam[5].data := frmMain.LoginId;
        Hasil:= DeliveryOrder.InsertBonusDO(arrParam);
        if not Hasil then
        begin
          Result:= Hasil;
          Exit;
        end;
      end;

      if not Hasil then
      begin
        Result := Hasil;
        Exit;
      end;
    end;
  end;
  Result:= Hasil;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

function TfrmDisplayPO.SumColStringGrid(StrGrid:TAdvStringGrid;Col,RowStart,RowEnd:Integer):Real;
var i: Integer;
    hasil: Real;
begin
  hasil:= 0;
  for i:= RowStart to RowEnd do
    hasil:= hasil+StrToFloat(StrGrid.Cells[Col,i]);
  Result:= hasil;
end;

procedure TfrmDisplayPO.ClearForm;
begin
  edtSONo.Clear;
  edtSuplierCode.Clear;
  edtSuplierName.Clear;
  edtDONo.Clear;
  edtNP.Clear;
  edtProductName.Clear;
  dtDatePO.Clear;
  dtDateSO.Clear;
  dtDateDO.Clear;
  edtjfBonus.Value:=0;
  edtjfTotalColie.Value:=0;
  edtjfTotalOrder.Value:=0;
  edtjfRecvBonus.Value:=0;
  edtjfDisc1.Value:=0;
  edtjfDisc2.Value:=0;
  jvcuredtSubTotal.Value:=0;
  jvcuredtPPN.Value:=0;
  jvcuredtPPNBM.Value:=0;
  jvcuredtDiscount.Value:=0;
  jvcuredtTotalBeli.Value:=0;
  jvcuredtNilaiDisc.Value:=0;
  jvcuredtTotalDisc.Value:=0;
  FHargaDisc:=0;
  jvcuredtSellPrice.Value;
  lblStatusPO.Caption:='';
  SetHeaderGrid;
  //strgGrid.Enabled:= False;
  fraFooter5Button1.btnAdd.Enabled:= False;
end;

procedure TfrmDisplayPO.FormCreate(Sender: TObject);
begin
  inherited;
  dtDatePO.Date := now;
  dtDateSO.Date := now;
  dtDateDO.Date := now;
  lblHeader.Caption := 'DISPLAY PO';

  lbl24.Visible := true;
  ClearForm;
  SetIDCurrencyRegionalSetting;
end;

procedure TfrmDisplayPO.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDisplayPO := nil;
end;

procedure TfrmDisplayPO.ShowDetailPO(ANoPO: string);
var data: TResultDataSet;
    i: Integer;
begin
  SetHeaderGrid;
  if not Assigned(DeliveryOrder) then
    DeliveryOrder:= TDeliveryOrder.Create;
  if lblStatusPO.Caption='Status PO : RECEIVED' then
    data:= DeliveryOrder.GetListDataDODetil(ANoPO)
  else
    data:= DeliveryOrder.GetListDataPODetil(ANoPO);
  strgGrid.RowCount:= data.RecordCount+1;
  i:=1;
  with data do
  if not IsEmpty then
  begin
    while not Eof do
    begin
      strgGrid.Cells[0,i]:= IntToStr(i);
      strgGrid.Alignments[0,i] := taCenter;
      strgGrid.Cells[1,i]:= fieldbyname('BRG_CODE').AsString;
      strgGrid.Cells[2,i]:= FloatToStr(fieldbyname('PRICE').AsFloat);
      strgGrid.Alignments[2,i] := taRightJustify;
      strgGrid.Cells[3,i]:= FloatToStr(fieldbyname('QTY_ORDER').AsFloat);
      strgGrid.Alignments[3,i] := taRightJustify;
      //Cell 6 buat hitung qty bonus
      strgGrid.Cells[6,i]:= FloatToStr(fieldbyname('QTY_CS').AsFloat+
                            fieldbyname('QTY_SALES').AsFloat); //QTY Bonus PO
      if lblStatusPO.Caption='Status PO : RECEIVED' then
      begin
        strgGrid.Cells[4,i]:= fieldbyname('DOD_QTY_ORDER_RECV').AsString; //QTY Receive DO
        strgGrid.AddCheckBox(7,i,True,True);
        strgGrid.SetCheckBoxState(7,i,True);
      end
      else
      begin
        strgGrid.Cells[4,i]:= '0'; //QTY Receive
        strgGrid.AddCheckBox(7,i,False,False);
        if strgGrid.Cells[6,i] = '0' then
          strgGrid.SetCheckBoxState(7,i,True)
        else
          strgGrid.SetCheckBoxState(7,i,False);
      end;
      strgGrid.Cells[5,i]:= fieldbyname('SAT_CODE_ORDER').AsString;
      strgGrid.Alignments[4,i] := taRightJustify;
      strgGrid.Alignments[5,i] := taCenter;
      strgGrid.Alignments[7,i]:= taCenter;
      strgGrid.Cells[8,i]:= fieldbyname('BRG_NAME').AsString;
      strgGrid.Cells[9,i]:= FloatToStr(fieldbyname('DISC1').AsFloat);
      strgGrid.Cells[10,i]:= FloatToStr(fieldbyname('DISC2').AsFloat);
      strgGrid.Cells[11,i]:= FloatToStr(fieldbyname('DISC3').AsFloat);
      if lblStatusPO.Caption='Status PO : RECEIVED' then
      begin
        strgGrid.Cells[12,i]:= FloatToStr(fieldbyname('TOTAL_DISC').AsFloat);
        strgGrid.Cells[13,i]:= FloatToStr(fieldbyname('PPN').AsFloat);
        strgGrid.Cells[14,i]:= FloatToStr(fieldbyname('PPNBM').AsFloat);
        strgGrid.Cells[15,i]:= FloatToStr(fieldbyname('SUB_TOTAL').AsFloat);
        strgGrid.Cells[16,i]:= FloatToStr(fieldbyname('PPN').AsFloat);//FloatToStr(StrToFloat(strgGrid.Cells[13,i])*StrToFloat(strgGrid.Cells[4,i])); //(POD_PPN * QTY Receive)}
        strgGrid.Cells[17,i]:= FloatToStr(fieldbyname('PPNBM').AsFloat);//FloatToStr(StrToFloat(strgGrid.Cells[14,i])*StrToFloat(strgGrid.Cells[4,i])); //(POD_PPNBM * QTY Receive)
      end
      else
      begin
        strgGrid.Cells[12,i]:= '0'; //FloatToStr(fieldbyname('TOTAL_DISC').AsFloat);
        strgGrid.Cells[13,i]:= '0'; //FloatToStr(fieldbyname('PPN').AsFloat);
        strgGrid.Cells[14,i]:= '0'; //FloatToStr(fieldbyname('PPNBM').AsFloat);
        strgGrid.Cells[15,i]:= '0'; //FloatToStr(fieldbyname('SUB_TOTAL').AsFloat);
        strgGrid.Cells[16,i]:= '0'; //FloatToStr(StrToFloat(strgGrid.Cells[13,i])*StrToFloat(strgGrid.Cells[4,i])); //(POD_PPN * QTY Receive)}
        strgGrid.Cells[17,i]:= '0'; //FloatToStr(StrToFloat(strgGrid.Cells[14,i])*StrToFloat(strgGrid.Cells[4,i])); //(POD_PPNBM * QTY Receive)
      end;
      FormulaDisconPerRow(i,StrToInt(strgGrid.Cells[4,i]));
      strgGrid.Cells[19,i]:= IntToStr(fieldbyname('BRGSUP_ID').AsInteger);
      strgGrid.Cells[20,i]:= IntToStr(fieldbyname('COMMON').AsInteger);
      strgGrid.Cells[21,i]:= FloatToStr(fieldbyname('ASSGROS').AsFloat);
      strgGrid.Cells[22,i]:= FloatToStr(fieldbyname('TRADER').AsFloat);
      strgGrid.Cells[23,i]:= FloatToStr(fieldbyname('QTY_CS').AsFloat); //QTY Bonus CS
      strgGrid.Cells[24,i]:= FloatToStr(fieldbyname('QTY_SALES').AsFloat); //QTY Bonus Sales
      strgGrid.Cells[25,i]:= fieldbyname('BNS_BRG_CODE').AsString; //Code Barang Bonus
      strgGrid.Cells[26,i]:= FloatToStr(fieldByname('HPP_OLD').AsFloat); // Nilai HPP Lama (Added By Luqman)
      strgGrid.Cells[27,i]:= FloatToStr(fieldbyname('BRGT_STOCK').AsFloat); // Stok Barang Lama (Added By Luqman)
      strgGrid.Cells[28,i]:= '0'; // HPP dihitung saat on validate qty receive
      strgGrid.Cells[29,i]:= FloatToStr(fieldByname('PPN_PERSEN').AsFloat); // PPN PERSEN
      strgGrid.Cells[30,i]:= FloatToStr(fieldbyname('PPNBM_PERSEN').AsFloat); // PPNBM PERSEN
      Inc(i);
      Next;
    end;
    edtjfTotalColie.Value:= SumColStringGrid(strgGrid,4,1,strgGrid.RowCount-1);
    edtjfBonus.Value:= SumColStringGrid(strgGrid,6,1,strgGrid.RowCount-1);
    jvcuredtSubTotal.Value:= SumColStringGrid(strgGrid,15,1,strgGrid.RowCount-1);
    jvcuredtPPN.Value:= SumColStringGrid(strgGrid,16,1,strgGrid.RowCount-1);
    jvcuredtPPNBM.Value:= SumColStringGrid(strgGrid,17,1,strgGrid.RowCount-1);
    jvcuredtDiscount.Value:= SumColStringGrid(strgGrid,31,1,strgGrid.RowCount-1);
    edtjfTotalOrder.Value:= SumColStringGrid(strgGrid,3,1,strgGrid.RowCount-1);
    FHargaDisc:= SumColStringGrid(strgGrid,18,1,strgGrid.RowCount-1);
  end
  else
  begin
    strgGrid.RowCount:=2;
    strgGrid.ClearRows(1,1);
    edtjfTotalColie.Value:= 0;
    edtjfBonus.Value:= 0;
    jvcuredtSubTotal.Value:= 0;
    jvcuredtPPN.Value:= 0;
    jvcuredtPPNBM.Value:= 0;
    jvcuredtDiscount.Value:= 0;
    edtjfTotalOrder.Value:= 0;
    FHargaDisc:= 0;
  end;

  jvcuredtTotalBeli.Value:= FHargaDisc +
                            jvcuredtPPN.Value +
                            jvcuredtPPNBM.Value;
                            //jvcuredtSubTotal.Value +

  if lblStatusPO.Caption='Status PO : RECEIVED' then
    edtjfRecvBonus.Value:= edtjfBonus.Value
  else
    edtjfRecvBonus.Value:= 0;
  strgGrid.FixedRows := 1;
  strgGrid.AutoSize := true;
end;

function TfrmDisplayPO.CheckIsPOExist(ANoPO: string): boolean;
var data: TResultDataSet;
begin
  if not Assigned(DeliveryOrder) then
    DeliveryOrder:= TDeliveryOrder.Create;
  data:= DeliveryOrder.GetListDataPOByNo(ANoPO);
  with data do
  if not IsEmpty then
  begin
    dtDatePO.Date:= fieldbyname('PO_DATE').AsDateTime;
    edtSONo.Text:= fieldbyname('SO_NO').AsString;
    dtDateSO.Date:= fieldbyname('SO_DATE').AsDateTime;
    edtSuplierCode.Text:= fieldbyname('SUPMG_CODE').AsString;
    edtSuplierName.Text:= fieldbyname('SUP_NAME').AsString;
    FStatusPO := UpperCase(fieldbyname('STAPO_NAME').AsString);
    lblStatusPO.Caption:= 'Status PO : ' + FStatusPO;
    FValidDate:= fieldbyname('PO_VALID_DATE').AsDateTime;
    FTOP:= fieldbyname('SUPMG_TOP').AsInteger;
    if Modul = mHistoryPO then
      edtDONo.Text:= ANoPO;
    dtDateDO.Date:= Now;
    ShowDetailPO(ANoPO);
    result := true;
  end
  else
    result := false;
  edtPONo.SetFocus;
  edtPONo.SelectAll;
end;

procedure TfrmDisplayPO.SetHeaderGrid;
begin
  with strgGrid do
  begin
    Clear;
    ColCount := 8;
    //ColCount := 35;
    RowCount := 2;
    Cells[0,0] := 'NO.';
    Cells[1,0] := 'CODE';
    Cells[2,0] := 'PRICE (Rp.)';
    Cells[3,0] := 'QTY ORDER';
    Cells[4,0] := 'QTY RECEIVE';
    Cells[5,0] := 'UOM';
    Cells[6,0] := 'BONUS';       //QTY Bonus PO
    Cells[7,0] := 'BONUS RECEIVE';              //checkbox
    //added by putut utk debugging. Harus di hide nantinya
    Cells[8,0]:= '8.BRG_NAME';
    Cells[9,0]:= '9DISC1';
    Cells[10,0]:= '10DISC2';
    Cells[11,0]:= '11DISC3';
    Cells[12,0]:= '12TOTAL_DISC_PO';
    Cells[13,0]:= '13PPN PO';
    Cells[14,0]:= '14PPNBM PO';
    Cells[15,0]:= '15SUB_TOTAL';
    Cells[16,0]:= '16POD_PPN * QTY Receive';
    Cells[17,0]:= '17POD_PPNBM * QTY Receive';
    Cells[18,0]:= '18TotalDiscPerBrg';
    Cells[19,0]:= '19BRGSUP_ID';
    Cells[20,0]:= '20COMMON';
    Cells[21,0]:= '21ASSGROS';
    Cells[22,0]:= '22TRADER';
    Cells[23,0]:= '23QTY_CS'; //QTY Bonus CS
    Cells[24,0]:= '24QTY_SALES'; //QTY Bonus Sales
    Cells[25,0]:= '25BNS_BRG_CODE'; //Code Barang Bonus
    Cells[26,0]:= '26HPP_OLD'; // N0la0 HPP Lama (Added By Luqman)
    Cells[27,0]:= '27BRGT_STOCK'; // Stok Barang Lama (Added By Luqman)
    Cells[28,0]:= '28HPP'; // HPP BARU (Added By Luqman)
    Cells[29,0]:= '29PPN PERSEN'; // N0la0 HPP Lama (Added By Luqman)
    Cells[30,0]:= '30PPNBM PERSEN'; // Stok Barang Lama (Added By Luqman)
    Cells[31,0]:= '31DISCOUNT TOTAL'; // Nilai discon total

    FixedRows := 1;
    AutoSize := true;
  end;
end;

procedure TfrmDisplayPO.SetClearValue;
var i: integer;
begin
  for i:=1 to strgGrid.RowCount-1 do
  begin
    strgGrid.Cells[4,i] := '0';
    strgGrid.Colors[4,i] := clWindow;
    strgGrid.Cells[13,i]:= '0';
    strgGrid.Cells[14,i]:= '0';
    strgGrid.Cells[15,i]:= '0';
    strgGrid.Cells[16,i]:= '0';
    edtjfTotalColie.Value:= 0;
    jvcuredtSubTotal.Value:= 0;
    jvcuredtPPN.Value:= 0;
    jvcuredtPPNBM.Value:= 0;
    jvcuredtDiscount.Value:= 0;
  end;
end;

procedure TfrmDisplayPO.btn1Click(Sender: TObject);
begin
  if not Assigned(frmDialogSearchPO) then
    Application.CreateForm(TfrmDialogSearchPO, frmDialogSearchPO);
  frmDialogSearchPO.frmSuiMasterDialog.Caption := 'Search PO...';
  frmDialogSearchPO.Modul:= tmDeliveryOrder;
  frmDialogSearchPO.ShowModal;
  if (frmDialogSearchPO.IsProcessSuccessfull) then
  begin
    edtPONo.Text := frmDialogSearchPO.strgGrid.Cells[2,frmDialogSearchPO.strgGrid.Row];
    edtPONo.SetFocus;
  end;
    
  frmDialogSearchPO.Free;
end;

procedure TfrmDisplayPO.btn2Click(Sender: TObject);
var SeparatorDate: Char;
    i, colieRcv: Integer;
    bonus: Real;
begin
  if CommonDlg.Confirm('Are you sure you wish to print NP?')= mrNo
  then Exit;
  SeparatorDate:= DateSeparator;

  try
    DateSeparator:= '/';
    bonus:= 0;
    colieRcv:= 0;

    if strgGrid.RowCount > 1 then
      for i:= 1 to (strgGrid.RowCount-1) do begin
        bonus:= bonus + StrToFloat(strgGrid.Cells[6,i]);
        colieRcv:= colieRcv + StrToInt(strgGrid.Cells[4,i]);
      end;

    if not Assigned(ParamList) then
      ParamList := TStringList.Create;
    ParamList.Add(edtNP.Text); //0
    ParamList.Add(edtPONo.Text); //1
    ParamList.Add(IntToStr(colieRcv)); //2
    ParamList.Add(FloatToStr(bonus)); //3
    ParamList.Add(frmMain.LoginUsername); //4
    ParamList.Add(frmMain.cbbUnit.Text); //5

    with dmReport do begin
      Params := ParamList;
      pMainReport.LoadFromFile(ExtractFilePath(Application.ExeName) + '/template/frCetakNP.fr3');
      pMainReport.PrepareReport(True);
      pMainReport.Print; //ShowReport(True);
    end;

  finally
    DateSeparator:= SeparatorDate;
    if Assigned(ParamList) then
      FreeAndNil(ParamList);
  end;
end;

procedure TfrmDisplayPO.edtPONoChange(Sender: TObject);
begin
  inherited;
  lbl24.Visible := True;
  btn2.Visible := False;
  btnCetakNP.Visible:= False;
  ClearForm;
end;

procedure TfrmDisplayPO.edtDONoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key=#13 then
  begin
    strgGrid.Col:= 4;
    if strgGrid.Enabled then
      strgGrid.SetFocus;
  end
  else
  if(not(Key in['0'..'9',Chr(VK_BACK)]))then
    Key:=#0;
end;

procedure TfrmDisplayPO.strgGridGetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
begin
  inherited;
  case ACol of
//    4: AEditor:= edNumeric;
    7: AEditor:= edCheckBox;
  end;
end;

procedure TfrmDisplayPO.edtPONoKeyPress(Sender: TObject;
  var Key: Char);
var data: TResultDataSet;
begin
  inherited;
  if Key=#13 then
  begin
    edtPONo.Text := StrPadLeft(edtPONo.Text, 10, '0');

    edtDONo.ReadOnly:= True;

    if not CheckIsPOExist(edtPONo.Text) then
      CommonDlg.ShowError(ER_PO_IS_NOT_EXIST)
    else
    begin
//      if now > FValidDate then
      if FStatusPO = 'EXPIRED' then
        lblStatusPO.Caption:= 'Status PO : ' + 'EXPIRED';
      if lblStatusPO.Caption='Status PO : ORDERED' then
        lblStatusPO.Font.Color:= clBlack
      else if lblStatusPO.Caption='Status PO : EXPIRED' then
        lblStatusPO.Font.Color:= clRed
      else
        lblStatusPO.Font.Color:= clBlue;

      if lblStatusPO.Font.Color=clRed then
      begin
        fraFooter5Button1.btnAdd.Enabled:= True;
      end
      else if lblStatusPO.Font.Color=clBlack then
      begin
        strgGrid.Enabled:= True;
        fraFooter5Button1.btnAdd.Enabled:= True;
        if not Assigned(DeliveryOrder) then
          DeliveryOrder:= TDeliveryOrder.Create;
//        data:= DeliveryOrder.GetNP;
//        edtNP.Text:= StrPadLeft(data.Fields[0].AsVariant,10,'0');
      end
      else
      begin
        if lblStatusPO.Caption='Status PO : RECEIVED' then
        begin
          if not Assigned(DeliveryOrder) then
            DeliveryOrder:= TDeliveryOrder.Create;
          data:= DeliveryOrder.GetNPFromDO(edtPONo.Text);
          edtNP.Text:= StrPadLeft(data.Fieldbyname('DO_NP').AsVariant,10,'0');
          edtDONo.Text:= data.Fieldbyname('DO_NO').AsString;
          edtDONo.ReadOnly:= True;
          lbl24.Visible:= False;
        end;
      end;

      if  Modul = mMain then   
      begin
        edtPONo.SelectAll;
        edtPONo.SetFocus;
      end else
        edtDONo.SetFocus;
    end;
  end
  else
  if(not(Key in['0'..'9',Chr(VK_BACK)]))then
    Key:=#0;
end;

procedure TfrmDisplayPO.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if(Key = VK_F2) then
    btn1.Click;
  if(Key = VK_F5)and(ssctrl in Shift) then
    GetAndRunButton('btnRefresh');
  if((Key = Ord('D'))and(ssctrl in Shift))and
    btn2.Visible
  then
    btn2Click(self);
  if((Key = Ord('P'))and(ssctrl in Shift))and
    btnCetakNP.Visible
  then
    btnCetakNP.Click;
  if((Key = Ord('S'))and(ssctrl in Shift))and
     fraFooter5Button1.btnAdd.Enabled
  then
    GetAndRunButton('btnAdd');
end;

procedure TfrmDisplayPO.strgGridGetCellColor(Sender: TObject; ARow,
  ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
begin
  inherited;
  if(ACol = 4)and(ARow > 0)and
    (strgGrid.Cells[ACol,ARow]<>'')and
    (StrToFloat(strgGrid.Cells[ACol,ARow]) <>
    StrToFloat(strgGrid.Cells[3,ARow]))
  then
    AFont.Color:= clRed
  else
    AFont.Color:= clBlack;
end;

procedure TfrmDisplayPO.strgGridClick(Sender: TObject);
begin
  inherited;
  if(strgGrid.Cells[0,strgGrid.Row]<>'')then
  begin
    edtProductName.Text:= strgGrid.Cells[8,strgGrid.Row];
    edtjfDisc1.Value:= StrToFloat(strgGrid.Cells[9,strgGrid.Row]);
    edtjfDisc2.Value:= StrToFloat(strgGrid.Cells[10,strgGrid.Row]);
    jvcuredtNilaiDisc.Value:= StrToFloat(strgGrid.Cells[11,strgGrid.Row]);
    jvcuredtTotalDisc.Value:= StrToFloat(strgGrid.Cells[31,strgGrid.Row]);
  end;
end;

procedure TfrmDisplayPO.strgGridRowChanging(Sender: TObject; OldRow,
  NewRow: Integer; var Allow: Boolean);
begin
  inherited;
  strgGridClick(Self);
end;

procedure TfrmDisplayPO.strgGridCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  inherited;
  if (ACol = 7) then
  begin
    if State then
      edtjfRecvBonus.Value:= edtjfRecvBonus.Value + StrToFloat(strgGrid.Cells[6,ARow])
    else
      edtjfRecvBonus.Value:= edtjfRecvBonus.Value - StrToFloat(strgGrid.Cells[6,ARow]);
  end;
end;

procedure TfrmDisplayPO.FormActivate(Sender: TObject);
begin
  inherited;
  frmDisplayPO.Caption := 'DISPLAY PO';
  frmMain.CreateMenu((Sender as TForm));
end;

procedure TfrmDisplayPO.actSaveGoodReceivingExecute(Sender: TObject);
begin
  if not CekChekBoxInGrid then
  begin
    CommonDlg.ShowError(ER_DO_BONUS);
    Exit;
  end;
  if SaveData then
  begin
    if lblStatusPO.Font.Color=clBlack then
    begin
      CommonDlg.ShowConfirmGlobal(SAVE_DO_SUCCESSFULLY);
      btnCetakNP.Click;
//      frmMain.actReprintNPExecute(Self);
      frmReprintNP.edt1.Text:= edtPONo.Text;
      btn2.Visible := True;
      btnCetakNP.Visible := True;
      fraFooter5Button1.btnAdd.Enabled := False;
    end
    else
      CommonDlg.ShowConfirmGlobal(SAVE_DO_EXPIRED)
  end
  else
    CommonDlg.ShowConfirmGlobal(ER_SAVE_DO);
  SetHeaderGrid;
  lbl24.Visible := False;
end;

procedure TfrmDisplayPO.actClearGoodReceivingExecute(Sender: TObject);
begin
  SetClearValue;
end;

procedure TfrmDisplayPO.strgGridGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  inherited;
  if ARow=0 then
    HAlign:= taCenter;
end;

procedure TfrmDisplayPO.SetModul(const Value: TModul);
begin
  FModul := Value;
end;

procedure TfrmDisplayPO.btn1Enter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmDisplayPO.btn2Enter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmDisplayPO.btnCetakNPEnter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmDisplayPO.btnCetakNPExit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

procedure TfrmDisplayPO.btn2Exit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

procedure TfrmDisplayPO.btn1Exit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

end.
