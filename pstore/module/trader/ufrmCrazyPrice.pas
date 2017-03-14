unit ufrmCrazyPrice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer, Vcl.ComCtrls, dxCore,
  cxDateUtils, Vcl.Menus, System.Actions, ufraFooter4Button, cxButtons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC, Vcl.ActnList;

type
  TfrmCrazyPrice = class(TfrmMasterBrowse)
    pnl1: TPanel;
    Label4: TLabel;
    dtTo: TcxDateEdit;
    dtFrom: TcxDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    cbTipeHarga: TComboBox;
    cxcolGridViewColumn1: TcxGridDBColumn;
    cxcolGridViewColumn2: TcxGridDBColumn;
    cxcolGridViewColumn3: TcxGridDBColumn;
    cxcolGridViewColumn4: TcxGridDBColumn;
    cxcolGridViewColumn5: TcxGridDBColumn;
    cxcolGridViewColumn6: TcxGridDBColumn;
    cxcolGridViewColumn7: TcxGridDBColumn;
    cxcolGridViewColumn8: TcxGridDBColumn;
    cxcolGridViewColumn9: TcxGridDBColumn;
    cxcolGridViewColumn10: TcxGridDBColumn;
    cxcolGridViewColumn11: TcxGridDBColumn;
    procedure actAddExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
  private
    { Private declarations }
    //procedure ParseHeaderGrid;
    //procedure GetListAllCrazyPrice;
    //procedure ParseDataGrid(AData: TResultDataSet);
  public
    procedure LoadTipeHarga;
    procedure SetListAllCrazyPrice(aTipeHrgID : Integer; aDate1 : TDateTime; aDate2
        : TDateTime); dynamic;
    { Public declarations }
  end;

var
  frmCrazyPrice: TfrmCrazyPrice;

Const
  _KolCheck         : Integer = 0;
  _KolKode          : Integer = 1;
  _KolAlias         : Integer = 2;
  _KolUOM           : Integer = 3;
  _KolBuyPrices     : Integer = 4;
  _KolMarkUp        : Integer = 5;
  _KolSellPrice     : Integer = 6;
  _KolValue         : Integer = 7;
  _KolDiscPersen    : Integer = 8;
  _KolDiscNominal   : Integer = 9;
  _KolSellPriceDisc : Integer = 10;
  _KolIdx           : integer = 11;

implementation

uses ufrmCrazyPriceDialog, uTSCommonDlg, uConstanta, uRetnoUnit, uAppUtils;

{$R *.dfm}

procedure TfrmCrazyPrice.actAddExecute(Sender: TObject);
begin
  inherited;
  if not assigned(frmCrazyPriceDialog) then
    frmCrazyPriceDialog := TfrmCrazyPriceDialog.Create(Application);

  frmCrazyPriceDialog.formMode      := fmAdd;
  frmCrazyPriceDialog.IdxTipeHarga  := 1; //index crazy price
  frmCrazyPriceDialog.TipeHrg       := 2; //crazy price
  SetFormPropertyAndShowDialog(frmCrazyPriceDialog);

  if frmCrazyPriceDialog.IsProcessSuccessfull then
  begin
//    SetListAllCrazyPrice(cGetIDfromCombo(cbTipeHarga, cbTipeHarga.ItemIndex), dtFrom.Date, dtTo.Date);

  end;
end;

procedure TfrmCrazyPrice.FormShow(Sender: TObject);
var
  iTipeHargaID: Integer;
begin
  inherited;
  dtFrom.Date:= Now - 5;
  dtTo.Date:= Now;
  LoadTipeHarga;
//  iTipeHargaID := cGetIDfromCombo(cbTipeHarga, cbTipeHarga.ItemIndex);
  SetListAllCrazyPrice(iTipeHargaID, dtFrom.Date, dtTo.Date);

end;

procedure TfrmCrazyPrice.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmCrazyPrice.FormDestroy(Sender: TObject);
begin
  inherited;
  frmCrazyPrice := nil;
end;

procedure TfrmCrazyPrice.LoadTipeHarga;
var
  s: string;
begin
  // TODO -cMM: TfrmCrazyPrice.LoadTipeHarga default body inserted
  s := 'Select TPHRG_ID, TPHRG_NAME From REF$TIPE_HARGA Where TPHRG_CODE <> ' + QuotedStr('H002')
//     + ' AND TPHRG_UNT_ID = ' + IntToStr(masternewunit.id)
     + ' Order By TPHRG_NAME';
//  cQueryToComboObject(cbTipeHarga, s);
  cbTipeHarga.ItemIndex := -1;
  cbTipeHarga.ItemIndex := 1;
end;

procedure TfrmCrazyPrice.SetListAllCrazyPrice(aTipeHrgID : Integer; aDate1 :
    TDateTime; aDate2 : TDateTime);
var
  i: Integer;
  s: string;
begin
  // TODO -cMM: TfrmCrazyPrice.SetListAllCrazyPrice default body inserted

  s := 'SELECT * FROM BARANG_HARGA_JUAL a'
     + ' INNER JOIN REF$TIPE_HARGA b ON a.BHJ_TPHRG_ID = b.TPHRG_ID '
     + ' INNER JOIN BARANG c ON a.BHJ_BRG_CODE = c.BRG_CODE '
     + ' INNER JOIN BARANG_TRANSAKSI d ON c.BRG_CODE = d.BRGT_BRG_CODE '
     + ' WHERE b.TPHRG_ID = ' + IntToStr(aTipeHrgID)
     + ' AND a.DATE_MODIFY BETWEEN ' + TAppUtils.QuotD(aDate1)
     + ' AND ' + TAppUtils.QuotD(aDate2, True);

  {
  ClearAdvStringGrid(strgGrid);

  with cOpenQuery(s) do
  begin
    try
      i := 0;
      while not eof do
      begin
        Inc(i);

        strgGrid.AddCheckBox(_KolCheck, i, False, False);

        strgGrid.Cells[_KolKode,i]          := FieldByName('BRG_CODE').AsString;
        strgGrid.Cells[_KolAlias,i]         := FieldByName('BRG_ALIAS').AsString;
        strgGrid.Cells[_KolUOM,i]           := FieldByName('BHJ_SAT_CODE').AsString;
        strgGrid.Cells[_KolBuyPrices,i]     := FieldByName('BRGT_LAST_COST').AsString;
        strgGrid.Cells[_KolMarkUp,i]        := FieldByName('BHJ_MARK_UP').AsString;
        strgGrid.Cells[_KolSellPrice,i]     := FieldByName('BHJ_SELL_PRICE').AsString;
        strgGrid.Cells[_KolValue,i]         := FieldByName('BHJ_CONV_VALUE').AsString;
        strgGrid.Cells[_KolDiscPersen,i]    := FieldByName('BHJ_DISC_PERSEN').AsString;
        strgGrid.Cells[_KolDiscNominal,i]   := FieldByName('BHJ_DISC_NOMINAL').AsString;
        strgGrid.Cells[_KolSellPriceDisc,i] := FieldByName('BHJ_SELL_PRICE_DISC').AsString;
        strgGrid.Cells[_KolIdx,i]           := FieldByName('BHJ_ID').AsString;


        Next;

        if not eof then strgGrid.AddRow;
      end;

    finally
      Free;
    end;

  end;
  strgGrid.AutoSizeColumns(True, 5);
  
  strgGrid.ColWidths[_KolValue]         := 0;
  strgGrid.ColWidths[_KolDiscPersen]    := 0;
  strgGrid.ColWidths[_KolDiscNominal]   := 0;
  strgGrid.ColWidths[_KolBuyPrices]     := 0;
  strgGrid.ColWidths[_KolBHJMarkUp]     := 0;
  }
end;

procedure TfrmCrazyPrice.actEditExecute(Sender: TObject);
var
//  FBarangHargaJual: TBarangHargaJual;
  iNo: Integer;
  bChecked: Boolean;
  i: Integer;
begin
  inherited;
  {if not assigned(frmCrazyPriceDialog) then
    frmCrazyPriceDialog := TfrmCrazyPriceDialog.Create(Application);

  frmCrazyPriceDialog.formMode := fmEdit;
  frmCrazyPriceDialog.TipeHrg  := 2; //crazy price

  frmCrazyPriceDialog.LoadTipeHarga;
  frmCrazyPriceDialog.cbTipeHarga.ItemIndex := cbTipeHarga.ItemIndex;
  frmCrazyPriceDialog.ParseHeaderGrid;
  iNo := 0;
  for i := 1 to strgGrid.RowCount - 1 do
  begin
    strgGrid.GetCheckBoxState(0, i, bChecked);
    if bChecked then
    begin
      try
        FBarangHargaJual := TBarangHargaJual.Create(nil);
        Inc(iNo);
        frmCrazyPriceDialog.strgGrid.Cells[_KolBrgKode, iNo]:= strgGrid.Cells[_KolKode, i];
        frmCrazyPriceDialog.strgGrid.Cells[_KolBrgNama, iNo]:= strgGrid.Cells[_KolAlias, i];
        frmCrazyPriceDialog.strgGrid.Cells[_KolSatKode, iNo]:= strgGrid.Cells[_KolUOM, i];
        frmCrazyPriceDialog.strgGrid.Cells[_KolConValue, iNo]:= strgGrid.Cells[_KolValue, i];
        frmCrazyPriceDialog.strgGrid.Cells[_KolBuyPrice, iNo]:= strgGrid.Cells[_KolBuyPrices, i];
        frmCrazyPriceDialog.strgGrid.Cells[_KolBHJMarkUp, iNo]:= strgGrid.Cells[_KolMarkUp, i];
        frmCrazyPriceDialog.strgGrid.Cells[_KolBHJSellPrice, iNo]:= strgGrid.Cells[_KolSellPrice, i];
        frmCrazyPriceDialog.strgGrid.Cells[_KolBHJDiscPersen, iNo]:= strgGrid.Cells[_KolDiscPersen, i];
        frmCrazyPriceDialog.strgGrid.Cells[_KolBHJDiscNominal, iNo]:= strgGrid.Cells[_KolDiscNominal, i];
        frmCrazyPriceDialog.strgGrid.Cells[_KolBHJSellPriceDisc, iNo]:= strgGrid.Cells[_KolSellPriceDisc, i];
        frmCrazyPriceDialog.strgGrid.Cells[_KolStorePrice, iNo]:= FloatToStr(FBarangHargaJual.GetStorePrice(strgGrid.Cells[_KolKode, i], masternewunit.id,
                                                                             cGetIDfromCombo(cbTipeHarga, cbTipeHarga.ItemIndex), masternewunit.id));

        frmCrazyPriceDialog.strgGrid.AddRow;
        // Ngisi textbox and combo
      finally
        if FBarangHargaJual <> nil then FreeAndNil(FBarangHargaJual);
      end;
    end;

  end;
  HapusBarisKosong(frmCrazyPriceDialog.strgGrid, 0);

  SetFormPropertyAndShowDialog(frmCrazyPriceDialog);

  if frmCrazyPriceDialog.IsProcessSuccessfull then
    SetListAllCrazyPrice(cGetIDfromCombo(cbTipeHarga, cbTipeHarga.ItemIndex), dtFrom.Date, dtTo.Date);
    }
end;

procedure TfrmCrazyPrice.actRefreshExecute(Sender: TObject);
var
  iTipeHargaID: Integer;
begin
  inherited;
  //GetListCrazyPriceBetweenDate;
//  iTipeHargaID := cGetIDfromCombo(cbTipeHarga, cbTipeHarga.ItemIndex);
  SetListAllCrazyPrice(iTipeHargaID, dtFrom.Date, dtTo.Date);
end;

end.


