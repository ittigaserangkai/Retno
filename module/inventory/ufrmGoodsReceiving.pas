unit ufrmGoodsReceiving;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialogBrowse, StdCtrls, ExtCtrls, ActnList, DateUtils,
  System.Actions, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  Data.DB, cxDBData, Vcl.Menus, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxCurrencyEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxButtons,
  ufraFooterDialog3Button, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, uDBUtils,
  uDXUtils, uDMClient, uRetnoUnit, Datasnap.DBClient, uAppUtils,
  System.StrUtils, uModPO, uModelHelper, ufrmMasterDialog,
  uModDO, uModSuplier, uModSO, uModUnit,uInterface;

type
  TfrmGoodsReceiving = class(TfrmMasterDialog, ICRUDAble)
    pnlTop: TPanel;
    lbl1: TLabel;
    btn1: TcxButton;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    dtDatePO: TcxDateEdit;
    dtDateSO: TcxDateEdit;
    edtSONo: TcxTextEdit;
    edtSuplierName: TcxTextEdit;
    edtDONo: TcxTextEdit;
    lbl2: TLabel;
    dtDateDO: TcxDateEdit;
    lbl4: TLabel;
    edtNP: TcxTextEdit;
    lbl9: TLabel;
    lbl10: TLabel;
    edSubTotal: TcxCurrencyEdit;
    edPPN: TcxCurrencyEdit;
    lbl13: TLabel;
    edPPNBM: TcxCurrencyEdit;
    lbl14: TLabel;
    lbl12: TLabel;
    edDiscount: TcxCurrencyEdit;
    edTotalBeli: TcxCurrencyEdit;
    lbl11: TLabel;
    lbl3: TLabel;
    lbl15: TLabel;
    edBonus: TcxCurrencyEdit;
    lbl16: TLabel;
    edTotalColie: TcxCurrencyEdit;
    edRecvBonus: TcxCurrencyEdit;
    lbl17: TLabel;
    pnl2: TPanel;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    lbl21: TLabel;
    lbl22: TLabel;
    lbl23: TLabel;
    lbl24: TLabel;
    edTotalOrder: TcxCurrencyEdit;
    edDisc1: TcxCurrencyEdit;
    edDisc2: TcxCurrencyEdit;
    edNilaiDisc: TcxCurrencyEdit;
    edTotalDisc: TcxCurrencyEdit;
    edSellPrice: TcxCurrencyEdit;
    btn2: TcxButton;
    lblStatusPO: TLabel;
    btnCetakNP: TcxButton;
    edPO: TcxTextEdit;
    cxGridGR: TcxGrid;
    cxgrdlvlGR: TcxGridLevel;
    cxGridTableGR: TcxGridTableView;
    cxgrdclmnPLU: TcxGridColumn;
    cxgrdclmnNama: TcxGridColumn;
    cxgrdclmnUOM: TcxGridColumn;
    cxgrdclmnHarga: TcxGridColumn;
    cxgrdclmnQtyOrder: TcxGridColumn;
    cxgrdclmnDisc1: TcxGridColumn;
    cxgrdclmnDisc2: TcxGridColumn;
    cxgrdclmnDisc3: TcxGridColumn;
    cxgrdclmnTotal: TcxGridColumn;
    cxgrdclmnQtyRecv: TcxGridColumn;
    cxgrdclmnTotalDisc: TcxGridColumn;
    cxgrdclmnLinePrice: TcxGridColumn;
    cxgrdclmnTax: TcxGridColumn;
    cxgrdclmnPPN: TcxGridColumn;
    cxgrdclmnPPNBM: TcxGridColumn;
    cbbProductName: TcxExtLookupComboBox;
    cxgrdclmnISBKP: TcxGridColumn;
    cxgrdclmnIsStock: TcxGridColumn;
    cxgrdclmnPPNPERSEN: TcxGridColumn;
    cxgrdclmnPPNBMPERSEN: TcxGridColumn;
    cxgrdclmnPOITEM: TcxGridColumn;
    procedure actCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure strgGridCellValidate(Sender: TObject; ACol, ARow: Integer;
      var Value: String; var Valid: Boolean);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure edtPONoChange(Sender: TObject);
    procedure edtDONoKeyPress(Sender: TObject; var Key: Char);
    procedure edtPONoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actSaveExecute(Sender: TObject);
    procedure cxGridTableGREditing(Sender: TcxCustomGridTableView; AItem:
        TcxCustomGridTableItem; var AAllow: Boolean);
    procedure edPOKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxgrdclmnQtyRecvPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGridTableGRCellClick(Sender: TcxCustomGridTableView; ACellViewInfo:
        TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState;
        var AHandled: Boolean);
    procedure cxGridTableGRFocusedRecordChanged(Sender: TcxCustomGridTableView;
        APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
        ANewItemRecordFocusingChanged: Boolean);
  private
    FCDSBARANG: TClientDataSet;
    FCDSPO: TClientDataSet;
    FCDSUOM: TClientDataSet;
    FValidDate: TDate;
    FStatusPO: string;
    FTOP: Integer;
    FCommon,FAssgros,FTrader: Real;
    FHargaDisc: Real;
    FModDO: TModDO;
    FPO: TModPO;
    function SaveData: Boolean;
    function CheckIsPOExist(ANoPO:string): Boolean;
    function CekChekBoxInGrid: Boolean;
    procedure ShowDetailPO(ANoPO:string);
    procedure FormulaDisconPerRow(Row:Integer; QTYReceive:Real);
    procedure SetHeaderGrid;
    procedure SetClearValue;
    procedure ClearForm;
    procedure AllocatedStock(Receive: Real;
                             var FCommon,FAssgros,FTrader: Real);
    function GetModDO: TModDO;
    procedure HitungSummary(ABaris : Integer; AValue : Double);
    procedure InisialisasiCBBPO;
    procedure InisialisasiUOM;
    procedure InisialisasiBarang(APONO : String);
    procedure IsiQtyReceive(AModDO: TModDO);
    procedure LoadData(AID : String);
    procedure LoadDataGRItemToProductName;
    function LoadDataPO(ANoPO : String; AIsiQtyReceivedDenganQtyOrder : Boolean =
        True): Boolean;
    function LoadPOItemToGrid(APO : TModPO; AIsiQtyReceiveDenganQtyOrder :
        Boolean): Boolean;
    procedure UpdateDOItems;
  public
    destructor Destroy; override;
    property ModDO: TModDO read GetModDO write FModDO;
    { Public declarations }
  end;

var
  frmGoodsReceiving: TfrmGoodsReceiving;
  ParamList: TStringList;

implementation

uses uTSCommonDlg,uConstanta, ufrmSearchPO, udmReport, VarUtils, ufrmReprintNP;

{$R *.dfm}

destructor TfrmGoodsReceiving.Destroy;
begin
  inherited;
  FreeAndNil(FModDO);
end;

procedure TfrmGoodsReceiving.actCancelExecute(Sender: TObject);
begin
  inherited;
  SetClearValue;
end;

procedure TfrmGoodsReceiving.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmGoodsReceiving.FormulaDisconPerRow(Row:Integer; QTYReceive:Real);
var Total, Price,
    Disc1, Disc2, Disc3,
    TotalDiscTemp, TotalDisc: Real;
begin
  {Price:= StrToFloat(strgGrid.Cells[2,Row]);
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
   }
end;

procedure TfrmGoodsReceiving.AllocatedStock
          (Receive: Real;
           var FCommon,FAssgros,FTrader: Real);
var sisa,
    AllocCommon,
    AllocAssgros,
    AllocTrader: Real;
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

function TfrmGoodsReceiving.CekChekBoxInGrid: Boolean;
var i: Integer;
    hasil: Boolean;
begin
  hasil:= True;
  i:=1;
  {while(hasil)and(i<=strgGrid.RowCount-1)do
  begin
    strgGrid.GetCheckBoxState(7,i,hasil);
    Inc(i);
  end;
  Result:= hasil;
  }
end;

function TfrmGoodsReceiving.SaveData: Boolean;
var
    Hasil: Boolean;
    i: Integer;
    Receive,DOId: Real;
begin
  try
  Screen.Cursor:= crHourGlass;
  Hasil:= False;
  {
  if not assigned(DeliveryOrder) then
    DeliveryOrder := TDeliveryOrder.Create;

  if lblStatusPO.Font.Color=clRed then
  begin
    //Set Status PO to Expired
    SetLength(arrParam,3);
    arrParam[0].tipe:= ptString;
    arrParam[0].data:= PO_DESCRIPTION_EXPIRED;
    arrParam[1].tipe:= ptInteger;
    arrParam[1].data:= FLoginId;
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
    arrParam[2].data:= FLoginId;
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
    arrParam[14].tipe:= ptCurrency;
    arrParam[14].data:= edtjfTotalOrder.Value;
    arrParam[15].tipe:= ptCurrency;
    arrParam[15].data:= edtjfBonus.Value;
    arrParam[16].tipe:= ptCurrency;
    arrParam[16].data:= edtjfTotalColie.Value;
    arrParam[17].tipe:= ptCurrency;
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
    arrParam[22].data:= FLoginId;
    arrParam[23].tipe:= ptCurrency;
    arrParam[23].data:= edtjfBonus.Value;
    arrParam[24].tipe:= ptCurrency;
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
      arrParam[2].tipe := ptCurrency;
      arrParam[2].data := StrToFloat(strgGrid.Cells[3,i]);
      arrParam[3].tipe := ptCurrency;
      arrParam[3].data := StrToFloat(strgGrid.Cells[4,i]);
      Receive:= StrToFloat(strgGrid.Cells[4,i]);
      FCommon:= StrToFloat(strgGrid.Cells[20,i]);
      FAssgros:= StrToFloat(strgGrid.Cells[21,i]);
      FTrader:= StrToFloat(strgGrid.Cells[22,i]);
      AllocatedStock(Receive,FCommon,FAssgros,FTrader);
      arrParam[4].tipe := ptCurrency;
      arrParam[4].data := StrToFloat(strgGrid.Cells[20,i]);
      arrParam[5].tipe := ptCurrency;
      arrParam[5].data := StrToFloat(strgGrid.Cells[21,i]);
      arrParam[6].tipe := ptCurrency;
      arrParam[6].data := StrToFloat(strgGrid.Cells[22,i]);
      arrParam[7].tipe := ptCurrency;
      arrParam[7].data := FCommon;
      arrParam[8].tipe := ptCurrency;
      arrParam[8].data := FTrader;
      arrParam[9].tipe := ptCurrency;
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
      arrParam[17].data:= FLoginId;
      arrParam[18].tipe := ptCurrency;
      arrParam[18].data := StrToFloat(strgGrid.Cells[4,i]);
      arrParam[19].tipe := ptCurrency;
      arrParam[19].data := StrToFloat(strgGrid.Cells[3,i]) - StrToFloat(strgGrid.Cells[4,i]);
      arrParam[20].tipe := ptInteger;
      arrParam[20].data := DOId;
      Hasil:= DeliveryOrder.InputDOStokDetil(arrParam);
      if not Hasil then
      begin
        Result:= Hasil;
        ADConn.Rollback;
        Exit;
      end;

      // Update Barang Transaksi Set Cogs (HPP) And Last Cost and stok in order
      SetLength(arrParam, 6);
      arrParam[0].tipe := ptCurrency;
      arrParam[0].data := StrToFloat(strgGrid.Cells[28,i]);
      arrParam[1].tipe := ptCurrency;
      arrParam[1].data := StrToFloat(strgGrid.Cells[2,i]);
      arrParam[2].tipe := ptVariant;
      arrParam[2].data := StrToFloat(strgGrid.Cells[33,i]) - StrToFloat(strgGrid.Cells[3,i]);
      arrParam[3].tipe := ptInteger;
      arrParam[3].data := FLoginId;
      arrParam[4].tipe := ptString;
      arrParam[4].data := strgGrid.Cells[1,i];
      arrParam[5].tipe := ptInteger;
      arrParam[5].data := DeliveryOrder.GetUnitId;

      Hasil := DeliveryOrder.UpdateBarangTransaksiSetCogsAndLastCostByBrgCode(arrParam);
      }
      // Update Barang Transaksi Set Cogs (HPP) Untuk barang bonus}
      {if StrToInt(strgGrid.Cells[24,i])>0 then
      begin
        SetLength(arrParam, 4);
        arrParam[0].tipe := ptCurrency;
        arrParam[0].data := StrToFloat(strgGrid.Cells[24,i]) * StrToFloat(strgGrid.Cells[32,i]); //QTY Bonus Sales
        arrParam[1].tipe := ptInteger;
        arrParam[1].data := FLoginId;
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
        arrParam[2].tipe := ptCurrency;
        if strgGrid.Cells[23,i]='' then
          strgGrid.Cells[23,i]:='0';
        arrParam[2].data := StrToFloat(strgGrid.Cells[23,i]); //QTY Bonus CS
        arrParam[3].tipe := ptCurrency;
        if strgGrid.Cells[24,i]='' then
          strgGrid.Cells[24,i]:='0';
        arrParam[3].data := StrToFloat(strgGrid.Cells[24,i]); //QTY Bonus Sales
        arrParam[4].tipe := ptInteger;
        arrParam[4].data := FLoginId;
        arrParam[5].tipe := ptInteger;
        arrParam[5].data := FLoginId;
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
  end;    }
  Result:= Hasil;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGoodsReceiving.ClearForm;
begin
//  edtSONo.Clear;
//  edtSuplierCode.Clear;
//  edtSuplierName.Clear;
//  edtDONo.Clear;
//  edtNP.Clear;
//  edtProductName.Clear;
//  dtDatePO.Clear;
//  dtDateSO.Clear;
//  dtDateDO.Clear;
//  edtjfBonus.Value:=0;
//  edtjfTotalColie.Value:=0;
//  edtjfTotalOrder.Value:=0;
//  edtjfRecvBonus.Value:=0;
//  edtjfDisc1.Value:=0;
//  edtjfDisc2.Value:=0;
//  jvcuredtSubTotal.Value:=0;
//  jvcuredtPPN.Value:=0;
//  jvcuredtPPNBM.Value:=0;
//  jvcuredtDiscount.Value:=0;
//  jvcuredtTotalBeli.Value:=0;
//  jvcuredtNilaiDisc.Value:=0;
//  jvcuredtTotalDisc.Value:=0;
//  FHargaDisc:=0;
//  jvcuredtSellPrice.Value;
//  lblStatusPO.Caption:='';
//  SetHeaderGrid;
//  actSave.Enabled:= False;
//  actDelete.Enabled:= False;
end;

procedure TfrmGoodsReceiving.FormCreate(Sender: TObject);
begin
  inherited;
  InisialisasiUOM;
  InisialisasiCBBPO;

  dtDatePO.Date := now;
  dtDateSO.Date := now;
  dtDateDO.Date := now;


end;

procedure TfrmGoodsReceiving.ShowDetailPO(ANoPO: string);
var data: TDataSet;
    i: Integer;
begin
  SetHeaderGrid;
  {if not Assigned(DeliveryOrder) then
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
        strgGrid.Cells[16,i]:= FloatToStr(fieldbyname('PPN').AsFloat);//FloatToStr(StrToFloat(strgGrid.Cells[13,i])*StrToFloat(strgGrid.Cells[4,i])); //(POD_PPN * QTY Receive)
        strgGrid.Cells[17,i]:= FloatToStr(fieldbyname('PPNBM').AsFloat);//FloatToStr(StrToFloat(strgGrid.Cells[14,i])*StrToFloat(strgGrid.Cells[4,i])); //(POD_PPNBM * QTY Receive)
      end
      else
      begin
        strgGrid.Cells[12,i]:= '0'; //FloatToStr(fieldbyname('TOTAL_DISC').AsFloat);
        strgGrid.Cells[13,i]:= '0'; //FloatToStr(fieldbyname('PPN').AsFloat);
        strgGrid.Cells[14,i]:= '0'; //FloatToStr(fieldbyname('PPNBM').AsFloat);
        strgGrid.Cells[15,i]:= '0'; //FloatToStr(fieldbyname('SUB_TOTAL').AsFloat);
        strgGrid.Cells[16,i]:= '0'; //FloatToStr(StrToFloat(strgGrid.Cells[13,i])*StrToFloat(strgGrid.Cells[4,i])); //(POD_PPN * QTY Receive)
        strgGrid.Cells[17,i]:= '0'; //FloatToStr(StrToFloat(strgGrid.Cells[14,i])*StrToFloat(strgGrid.Cells[4,i])); //(POD_PPNBM * QTY Receive)
      end;
      FormulaDisconPerRow(i,StrToFloat(strgGrid.Cells[4,i]));
      strgGrid.Cells[19,i]:= IntToStr(fieldbyname('BRGSUP_ID').AsInteger);
      strgGrid.Cells[20,i]:= FloatToStr(fieldbyname('COMMON').AsFloat);
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
      if lblStatusPO.Caption='Status PO : RECEIVED' then
      begin
        strgGrid.Cells[32,i] := '1';
        strgGrid.Cells[33,i] := '0';
        strgGrid.Cells[34,i] := '';
      end
      else
      begin
        strgGrid.Cells[32,i] := FloatToStr(fieldbyname('KONVSAT_SCALE').AsFloat);
        strgGrid.Cells[33,i] := FloatToStr(fieldbyname('BRGT_STOCK_IN_ORDER').AsFloat);
        strgGrid.Cells[34,i] := fieldbyname('KONVSAT_SAT_CODE_FROM').AsString;
      end;
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

  if lblStatusPO.Caption='Status PO : RECEIVED' then
    edtjfRecvBonus.Value:= edtjfBonus.Value
  else
    edtjfRecvBonus.Value:= 0;
  strgGrid.FixedRows := 1;
  strgGrid.AutoSize := true;
  }
end;

function TfrmGoodsReceiving.CheckIsPOExist(ANoPO: string): boolean;
var data: TDataSet;
begin
  {if not Assigned(DeliveryOrder) then
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
    edtDONo.Text:= ANoPO;
    dtDateDO.Date:= Now;

    ShowDetailPO(ANoPO);
    result := true;
  end
  else
    result := false;
    }
end;

procedure TfrmGoodsReceiving.strgGridCellValidate(Sender: TObject; ACol,
  ARow: Integer; var Value: String; var Valid: Boolean);
begin
  {
  if (ACol = 4) then
  begin
    if(strgGrid.Cells[3,ARow])='' then Exit;
    if Value='' then Value:='0';
    if (StrToFloat(Value) > StrToFloat(strgGrid.Cells[3,ARow])) then
      Value:= '0';
    if Value<>'0' then
      edtjfTotalColie.Value:= SumColStringGrid(strgGrid,ACol,1,strgGrid.RowCount-1);

    strgGrid.Cells[12,ARow]:= FloatToStr(StrToFloat(strgGrid.Cells[2,ARow])*StrToFloat(Value)); //TOTAL_DISC
    strgGrid.Cells[13,ARow]:= FloatToStr(StrToFloat(strgGrid.Cells[2,ARow])*StrToFloat(Value)); //PPN
    strgGrid.Cells[14,ARow]:= FloatToStr(StrToFloat(strgGrid.Cells[2,ARow])*StrToFloat(Value)); //PPNBM
    FormulaDisconPerRow(ARow,StrToIntSafe(Value));
    strgGrid.Cells[15,ARow]:= FloatToStr(StrToFloat(strgGrid.Cells[2,ARow])*StrToFloat(Value)); //SUBTOTAL SETELAH DISC
    strgGrid.Cells[16,ARow]:= FloatToStr(StrToFloat(strgGrid.Cells[29,ARow])/100*StrToFloat(strgGrid.Cells[18,ARow])); //PPN persen * qty recv * price
    strgGrid.Cells[17,ARow]:= FloatToStr(StrToFloat(strgGrid.Cells[30,ARow])/100*StrToFloat(strgGrid.Cells[18,ARow])); //PPNBM persen * qty recv * price
    // Perhitungan HPP, Diskon belum diperhitungkan (Added By Luqman)
    if (StrToFloat(strgGrid.Cells[27,ARow]) + StrToFloat(Value)) <> 0 then
    begin
      strgGrid.Cells[28,ARow]:= FloatToStr((StrToFloat(strgGrid.Cells[26,ARow]) * StrToFloat(strgGrid.Cells[27,ARow]) +
                                (StrToFloat(strgGrid.Cells[2, ARow]) / StrToInt(strgGrid.Cells[32,ARow])) * (StrToFloat(Value) * StrToInt(strgGrid.Cells[32,ARow])))
                                / (StrToFloat(strgGrid.Cells[27,ARow]) + StrToFloat(Value) * StrToInt(strgGrid.Cells[32, ARow])));
    end
    else
      strgGrid.Cells[28,ARow]:= '0';
    // End Of Perhitungan HPP
    FormulaDisconPerRow(ARow,StrToFloat(Value));
    jvcuredtSubTotal.Value:= SumColStringGrid(strgGrid,15,1,strgGrid.RowCount-1);     //harga setelah discount
    jvcuredtPPN.Value:= SumColStringGrid(strgGrid,16,1,strgGrid.RowCount-1);
    jvcuredtPPNBM.Value:= SumColStringGrid(strgGrid,17,1,strgGrid.RowCount-1);
    jvcuredtDiscount.Value:= SumColStringGrid(strgGrid,31,1,strgGrid.RowCount-1);
    FHargaDisc:= SumColStringGrid(strgGrid,18,1,strgGrid.RowCount-1);
    jvcuredtTotalBeli.Value:= FHargaDisc +
                              jvcuredtPPN.Value +
                              jvcuredtPPNBM.Value;
                              //jvcuredtSubTotal.Value +
    if(StrToFloat(Value)>0)then
      strgGrid.Col:= 7;
  end;
  strgGrid.SetFocus;
  }
end;

procedure TfrmGoodsReceiving.SetHeaderGrid;
begin
  {with strgGrid do
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
    //added utk debugging. Harus di hide nantinya
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
  }
end;

procedure TfrmGoodsReceiving.SetClearValue;
var i: integer;
begin
  {for i:=1 to strgGrid.RowCount-1 do
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
  }
end;

procedure TfrmGoodsReceiving.btn1Click(Sender: TObject);
begin
  if not Assigned(frmDialogSearchPO) then
    Application.CreateForm(TfrmDialogSearchPO, frmDialogSearchPO);
  frmDialogSearchPO.Caption := 'Search PO...';
  frmDialogSearchPO.Modul:= tmDeliveryOrder;
  frmDialogSearchPO.ShowModal;
  if (frmDialogSearchPO.IsProcessSuccessfull) then
  begin
//    edtPONo.Text := frmDialogSearchPO.strgGrid.Cells[2,frmDialogSearchPO.strgGrid.Row];
//    edtPONo.SetFocus;
  end;
    
  frmDialogSearchPO.Free;
end;

procedure TfrmGoodsReceiving.btn2Click(Sender: TObject);
var SeparatorDate: Char;
    i: Integer;
    colieRcv, bonus: Real;
begin
  if CommonDlg.Confirm('Are you sure you wish to print NP?')= mrNo
  then Exit;
  SeparatorDate:= FormatSettings.DateSeparator;
  {
  try
    FormatSettings.DateSeparator:= '/';
    bonus:= 0;
    colieRcv:= 0;

    if strgGrid.RowCount > 1 then
      for i:= 1 to (strgGrid.RowCount-1) do begin
        bonus:= bonus + StrToFloat(strgGrid.Cells[6,i]);
        colieRcv:= colieRcv + StrToFloat(strgGrid.Cells[4,i]);
      end;

    if not Assigned(ParamList) then
      ParamList := TStringList.Create;
    ParamList.Add(edtNP.Text); //0
    ParamList.Add(edtPONo.Text); //1
    ParamList.Add(FloatToStr(colieRcv)); //2
    ParamList.Add(FloatToStr(bonus)); //3
    ParamList.Add(FLoginUsername); //4
    ParamList.Add(MasterNewUnit.Nama); //5

    with dmReport do begin
      Params := ParamList;
      pMainReport.LoadFromFile(ExtractFilePath(Application.ExeName) + '/template/frCetakNP.fr3');
      pMainReport.PrepareReport(True);
      pMainReport.Print; //ShowReport(True);
    end;

  finally
    FormatSettings.DateSeparator:= SeparatorDate;
    if Assigned(ParamList) then
      FreeAndNil(ParamList);
  end;
  }
end;

procedure TfrmGoodsReceiving.edtPONoChange(Sender: TObject);
begin
  inherited;
  lbl24.Visible := True;
  btn2.Visible := False;
  btnCetakNP.Visible:= False;
  ClearForm;
end;

procedure TfrmGoodsReceiving.edtDONoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  {if Key=#13 then
  begin
    strgGrid.Col:= 4;
    if strgGrid.Enabled then
      strgGrid.SetFocus;
  end
  else
  if(not(Key in['0'..'9',Chr(VK_BACK)]))then
    Key:=#0;
    }
end;

procedure TfrmGoodsReceiving.edtPONoKeyPress(Sender: TObject;
  var Key: Char);
var data: TDataSet;
    NewNPNumber: Integer;
begin
  inherited;
  {if Key=#13 then
  begin
    edtPONo.Text := StrPadLeft(edtPONo.Text, 10, '0');

    edtDONo.ReadOnly:= False;

    if not CheckIsPOExist(edtPONo.Text) then
      CommonDlg.ShowError(ER_PO_IS_NOT_EXIST)
    else
    begin
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
        edtNP.Text:= StrPadLeft(data.Fields[0].AsVariant,10,'0');
          SetLength(arrParam, 2);
          arrParam[0].tipe := ptDateTime;
          arrParam[0].data := dtDateDO.Date;
          arrParam[1].tipe := ptInteger;
          arrParam[1].data := MasterNewUnit.ID; 

          NewNPNumber := DeliveryOrder.GetNewNPNumber(arrParam);
          edtNP.Text := 'M' + FormatDateTime('yymmdd', dtDateDO.Date) + StrPadLeft(IntToStr(NewNPNumber + 1),3,'0');
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

      edtDONo.SetFocus;
    end;
  end
  else
  if(not(Key in['0'..'9',Chr(VK_BACK)]))then
    Key:=#0;
    }
end;

procedure TfrmGoodsReceiving.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  {
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
    }
end;

procedure TfrmGoodsReceiving.actSaveExecute(Sender: TObject);
var
  sID: string;
begin
  inherited;
  if not ValidateEmptyCtrl([1]) then
    Exit;

  if FPO = nil then
  begin
    TAppUtils.Error('PO Belum Dipilih');
    edPO.SetFocus;
    Exit;
  end;

  if FPO.ID = '' then
  begin
    TAppUtils.Error('PO Belum Dipilih');
    Exit;
  end;

  ModDO.DO_CN := 0;
  ModDO.DO_COLIE_BONUS := 0;
  ModDO.DO_COLIE_BONUS_RECV := 0;
  ModDO.DO_COLIE_ORDER := edTotalOrder.Value;
  ModDO.DO_COLIE_ORDER_RECV := edTotalColie.Value;
  ModDO.DO_DATE := dtDateDO.Date;
  ModDO.DO_DESCRIPTION := '';
  ModDO.DO_DISC := edDiscount.Value;
  ModDO.DO_DN := 0;
  ModDO.DO_DO := nil;
  ModDO.DO_IS_BONUS := 0;
  ModDO.DO_IS_JURNAL := 0;
  ModDO.DO_IS_PAID := 0;
  ModDO.DO_NO := edtDONo.Text;
  ModDO.DO_NP := edtNP.Text;
  ModDO.DO_PAYMENT := 0;
  ModDO.DO_PPN := edPPN.Value;
  ModDO.DO_PPNBM := edPPNBM.Value;
  ModDO.DO_TOTAL := edTotalBeli.Value;
  ModDO.PO       := TModPO.CreateID(FPO.ID);
  ModDO.SUPLIER_MERCHAN_GRUP := TModSuplierMerchanGroup.CreateID(FPO.PO_SUPPLIER_MERCHAN_GRUP.ID);
  ModDO.SO := TModSO.CreateID(FPO.PO_SO.ID);
  ModDO.MERCHANDISE := TModMerchandise.CreateID(FPO.PO_SO.Merchandise.ID);
  ModDO.DO_UNIT := TModUnit.CreateID(FPO.PO_UNIT.ID);

  UpdateDOItems;

  try
    sID := DMClient.CrudDOClient.SaveToDBID(FModDO);
    begin
      TAppUtils.InformationBerhasilSimpan;
      LoadData(sID)
    end;
  except
    raise
  end;



end;

procedure TfrmGoodsReceiving.cxgrdclmnQtyRecvPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  HitungSummary(cxGridTableGR.DataController.FocusedRecordIndex, DisplayValue);
end;

procedure TfrmGoodsReceiving.cxGridTableGRCellClick(Sender:
    TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
    AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  LoadDataGRItemToProductName;
end;

procedure TfrmGoodsReceiving.cxGridTableGREditing(Sender:
    TcxCustomGridTableView; AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
  inherited;
  AAllow := AItem.Index in [cxgrdclmnQtyRecv.Index];
end;

procedure TfrmGoodsReceiving.cxGridTableGRFocusedRecordChanged(Sender:
    TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord:
    TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  LoadDataGRItemToProductName;
end;

procedure TfrmGoodsReceiving.edPOKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
var
  iNomor: Integer;
begin
  if Key = 13 then
  begin
    iNomor    := StrToIntDef(edPO.Text,0);
    edPO.Text := RightStr('00000000000' + IntToStr(iNomor), 11);

    if LoadDataPO(edPO.Text) then
      SelectNext(Screen.ActiveControl, True, True);
  end;

  inherited;
end;

function TfrmGoodsReceiving.GetModDO: TModDO;
begin
  if FModDO = nil then
    FModDO := TModDO.Create;

  Result := FModDO;
end;

procedure TfrmGoodsReceiving.HitungSummary(ABaris : Integer; AValue : Double);
var
  dLinePrice: Double;
  dQtyAwal: Double;
  I: Integer;
begin
  dQtyAwal           := cxGridTableGR.Double(ABaris, cxgrdclmnQtyRecv.Index);
  edTotalColie.Value := edTotalColie.Value - dQtyAwal;
  edTotalColie.Value := edTotalColie.Value + AValue;
  cxGridTableGR.SetValue(ABaris, cxgrdclmnTotal.Index, AValue * cxGridTableGR.Double(ABaris, cxgrdclmnLinePrice.Index));

  edSubTotal.Value := edSubTotal.Value - (dQtyAwal * cxGridTableGR.Double(ABaris, cxgrdclmnHarga.Index));
  edSubTotal.Value := edSubTotal.Value + (AValue * cxGridTableGR.Double(ABaris, cxgrdclmnHarga.Index));

  edDiscount.Value := edDiscount.Value - (dQtyAwal * cxGridTableGR.Double(ABaris, cxgrdclmnTotalDisc.Index));
  edDiscount.Value := edDiscount.Value + (AValue * cxGridTableGR.Double(ABaris, cxgrdclmnTotalDisc.Index));

  edPPN.Value      := edPPN.Value - (dQtyAwal * cxGridTableGR.Double(ABaris, cxgrdclmnPPN.Index));
  edPPN.Value      := edPPN.Value + (AValue * cxGridTableGR.Double(ABaris, cxgrdclmnPPN.Index));

  edPPNBM.Value    := edPPNBM.Value - (dQtyAwal * cxGridTableGR.Double(ABaris, cxgrdclmnPPNBM.Index));
  edPPNBM.Value    := edPPNBM.Value + (AValue * cxGridTableGR.Double(ABaris, cxgrdclmnPPNBM.Index));

  edTotalBeli.Value:= edSubTotal.Value - edDiscount.Value + edPPN.Value + edPPNBM.Value;
end;

procedure TfrmGoodsReceiving.InisialisasiCBBPO;
begin
//  FCDSPO := TDBUtils.DSToCDS(DMClient.DSProviderClient.PO_GetDSOLookUpForGR(''), Self);
//  cbbPO.Properties.LoadFromCDS(FCDSPO,'PO_ID','PO_NO',['PO_ID'],Self);
//  cbbPO.Properties.SetMultiPurposeLookup;
end;

procedure TfrmGoodsReceiving.InisialisasiUOM;
begin
  FCDSUOM := TDBUtils.DSToCDS(DMClient.DSProviderClient.Satuan_GetDSLookup(), Self);
  TcxExtLookupComboBoxProperties(cxGridTableGR.Columns[cxgrdclmnUOM.Index].Properties).LoadFromCDS(FCDSUOM,'ref$satuan_id','SAT_CODE',['ref$satuan_id'],Self);
  TcxExtLookupComboBoxProperties(cxGridTableGR.Columns[cxgrdclmnUOM.Index].Properties).SetMultiPurposeLookup;
end;

procedure TfrmGoodsReceiving.InisialisasiBarang(APONO : String);
begin
  FCDSBARANG := TDBUtils.DSToCDS(DMClient.DSProviderClient.Barang_ByPOLookUp(APONO), Self);
  TcxExtLookupComboBoxProperties(cxGridTableGR.Columns[cxgrdclmnPLU.Index].Properties).LoadFromCDS(FCDSBARANG,'BARANG_ID','BRG_CODE',['BARANG_ID'],Self);
  TcxExtLookupComboBoxProperties(cxGridTableGR.Columns[cxgrdclmnPLU.Index].Properties).SetMultiPurposeLookup;

  TcxExtLookupComboBoxProperties(cxGridTableGR.Columns[cxgrdclmnNama.Index].Properties).LoadFromCDS(FCDSBARANG,'BARANG_ID','BRG_NAME',['BARANG_ID'],Self);
  TcxExtLookupComboBoxProperties(cxGridTableGR.Columns[cxgrdclmnNama.Index].Properties).SetMultiPurposeLookup;

  cbbProductName.LoadFromCDS(FCDSBARANG,'BARANG_ID','BRG_NAME',['BARANG_ID'],Self);
end;

procedure TfrmGoodsReceiving.IsiQtyReceive(AModDO: TModDO);
var
  I: Integer;
begin
  for I := 0 to AModDO.DOItems.Count - 1 do
  begin
    if AModDO.DOItems[i].POITEM.ID = cxGridTableGR.Text(i, cxgrdclmnPOITEM.Index) then
    begin
      cxGridTableGR.SetValue(i,cxgrdclmnQtyRecv.Index,  AModDO.DOItems[i].DOD_QTY_ORDER_RECV);
      HitungSummary(i,AModDO.DOItems[i].DOD_QTY_ORDER_RECV);
    end;
  end;
end;

procedure TfrmGoodsReceiving.LoadData(AID : String);
begin
  ClearByTag([0,1]);
  FreeAndNil(FModDO);
  cxGridTableGR.ClearRows;

  FModDO := TModDO(DMClient.CrudDOClient.Retrieve(TModDO.ClassName, AID));
  if FModDO = nil then
    Exit;

  if FModDO.ID = '' then
    Exit;

  FModDO.LoadPO;
  edPO.Text := FModDO.PO.PO_NO;
  LoadDataPO(FModDO.PO.PO_NO, False);
  edtDONo.Text := FModDO.DO_NO;
  dtDateDO.Date:= FModDO.DO_DATE;
  edTotalColie.Value := FModDO.DO_COLIE_ORDER_RECV;
  edRecvBonus.Value := FModDO.DO_COLIE_BONUS_RECV;

  edTotalBeli.Value   := FModDO.DO_TOTAL;
  edPPNBM.Value       := FModDO.DO_PPNBM;
  edPPN.Value         := FModDO.DO_PPN;
  edDiscount.Value    := FModDO.DO_DISC;
  edSubTotal.Value    := FModDO.DO_SUBTOTAL;

  IsiQtyReceive(FModDO);


end;

procedure TfrmGoodsReceiving.LoadDataGRItemToProductName;
begin
  cbbProductName.EditValue   := cxGridTableGR.Values(cxGridTableGR.DataController.FocusedRecordIndex, cxgrdclmnNama.Index);
  edDisc1.Value              := cxGridTableGR.Double(cxGridTableGR.DataController.FocusedRecordIndex, cxgrdclmnDisc1.Index);
  edDisc2.Value              := cxGridTableGR.Double(cxGridTableGR.DataController.FocusedRecordIndex, cxgrdclmnDisc2.Index);
  edNilaiDisc.Value          := cxGridTableGR.Double(cxGridTableGR.DataController.FocusedRecordIndex, cxgrdclmnDisc3.Index);
  edTotalDisc.Value          := cxGridTableGR.Double(cxGridTableGR.DataController.FocusedRecordIndex, cxgrdclmnTotalDisc.Index);
  edSellPrice.Value          := cxGridTableGR.Double(cxGridTableGR.DataController.FocusedRecordIndex, cxgrdclmnLinePrice.Index);
end;

function TfrmGoodsReceiving.LoadDataPO(ANoPO : String;
    AIsiQtyReceivedDenganQtyOrder : Boolean = True): Boolean;
begin
  Result := False;

  ClearByTag([0,1]);
  cxGridTableGR.ClearRows;
  FPO := TModPO(DMClient.CrudClient.RetrieveByCode(TModPO.ClassName, ANoPO));
  if FPO = nil then
    Exit;

  if FPO.ID = '' then
    Exit;

  edPO.Text := FPO.PO_NO;
  FPO.LoadSO;
  edtSONo.Text := FPO.PO_SO.SO_NO;
  dtDateSO.Date := FPO.PO_SO.SO_DATE;

  FPO.LoadPO_SUPPLIER_MERCHAN_GRUP;
  edtSuplierName.Text := FPO.PO_SUPPLIER_MERCHAN_GRUP.SUPMG_NAME;

  dtDatePO.Date := FPO.PO_DATE;
  edTotalOrder.Value := FPO.PO_COLIE;
  edTotalColie.Value := FPO.PO_COLIE;
  edBonus.Value := 0;
  edRecvBonus.Value := 0;

  edTotalBeli.Value   := FPO.PO_TOTAL;
  edPPNBM.Value       := FPO.PO_PPNBM;
  edPPN.Value         := FPO.PO_PPN;
  edDiscount.Value    := FPO.PO_DISC;
  edSubTotal.Value    := FPO.PO_SUBTOTAL;

  InisialisasiBarang(FPO.PO_NO);
  if not LoadPOItemToGrid(FPO, AIsiQtyReceivedDenganQtyOrder) then
    Exit;

  Result := True;
end;

function TfrmGoodsReceiving.LoadPOItemToGrid(APO : TModPO;
    AIsiQtyReceiveDenganQtyOrder : Boolean): Boolean;
var
  I: Integer;
begin
  Result := False;

  for I := 0 to APO.POItems.Count - 1 do
  begin
    cxGridTableGR.DataController.AppendRecord;
//    cxGridTableGR.DataController.FocusedRecordIndex := i;

    cxGridTableGR.SetValue(i, cxgrdclmnPLU.Index,APO.POItems[i].POD_BARANG.ID);
    cxGridTableGR.SetValue(i, cxgrdclmnNama.Index,APO.POItems[i].POD_BARANG.ID);
    cxGridTableGR.SetValue(i,cxgrdclmnUOM.Index, APO.POItems[i].POD_UOM.ID);

    cxGridTableGR.SetValue(i,cxgrdclmnHarga.Index, APO.POItems[i].POD_PRICE);
    cxGridTableGR.SetValue(i,cxgrdclmnQtyOrder.Index, APO.POItems[i].POD_QTY_ORDER);

    cxGridTableGR.SetValue(i,cxgrdclmnDisc1.Index, APO.POItems[i].POD_DISC1);
    cxGridTableGR.SetValue(i,cxgrdclmnDisc2.Index, APO.POItems[i].POD_DISC2);
    cxGridTableGR.SetValue(i,cxgrdclmnDisc3.Index, APO.POItems[i].POD_DISC3);
    cxGridTableGR.SetValue(i,cxgrdclmnTotalDisc.Index, APO.POItems[i].POD_TOTAL_DISC);

    cxGridTableGR.SetValue(i,cxgrdclmnPPNPERSEN.Index, APO.POItems[i].POD_PPN_PERSEN);
    cxGridTableGR.SetValue(i,cxgrdclmnPPNBMPERSEN.Index, APO.POItems[i].POD_PPNBM_PERSEN);

    cxGridTableGR.SetValue(i,cxgrdclmnPPN.Index, APO.POItems[i].POD_PPN);
    cxGridTableGR.SetValue(i,cxgrdclmnPPNBM.Index, APO.POItems[i].POD_PPNBM);
    cxGridTableGR.SetValue(i,cxgrdclmnTax.Index, APO.POItems[i].POD_TOTAL_TAX);

    cxGridTableGR.SetValue(i,cxgrdclmnLinePrice.Index, APO.POItems[i].POD_TOTAL_TEMP);

    if AIsiQtyReceiveDenganQtyOrder then
    begin
      cxGridTableGR.SetValue(i,cxgrdclmnQtyRecv.Index, APO.POItems[i].POD_QTY_ORDER);
      cxGridTableGR.SetValue(i,cxgrdclmnTotal.Index, APO.POItems[i].POD_TOTAL);
    end;

    cxGridTableGR.SetValue(i,cxgrdclmnISBKP.Index, APO.POItems[i].POD_IS_BKP);
    cxGridTableGR.SetValue(i,cxgrdclmnIsStock.Index, APO.POItems[i].POD_IS_STOCK);
    cxGridTableGR.SetValue(i,cxgrdclmnPOITEM.Index, APO.POItems[i].ID);
  end;

//  cxGridTableGR.ApplyBestFit(cxgrdclmnPLU);
  cxGridTableGR.ApplyBestFit(cxgrdclmnNama);
  Result := True;
end;

procedure TfrmGoodsReceiving.UpdateDOItems;
var
  I: Integer;
  lModDoItem: TModDOItem;
begin
  ModDO.DOItems.Clear;

  for I := 0 to cxGridTableGR.DataController.RecordCount - 1 do
  begin
    lModDoItem := TModDOItem.Create;
    cxGridTableGR.LoadObjectData(lModDoItem,i);

    lModDoItem.DOD_QTY_ORDER_RECV_CN := 0;
    lModDoItem.DOD_QTY_ORDER_RECV_DN := 0;

    ModDO.DOItems.Add(lModDoItem);
  end;

end;

end.
