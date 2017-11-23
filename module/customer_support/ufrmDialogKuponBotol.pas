unit ufrmDialogKuponBotol;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  ufrmMasterDialog, System.Actions, Vcl.ActnList, ufraFooterDialog3Button,
  Vcl.ExtCtrls, uInterface, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  cxGroupBox, cxCurrencyEdit, cxTextEdit, cxButtonEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxSpinEdit, uModTransKuponBotol, cxDBExtLookupComboBox, Datasnap.DBClient,
  uModTransaksi;

type
  TfrmDialogKuponBotol = class(TfrmMasterDialog, ICRUDAble)
    cxLabel1: TcxLabel;
    dtpTanggal: TcxDateEdit;
    cxLabel2: TcxLabel;
    edtKodeMember: TcxButtonEdit;
    cxLabel3: TcxLabel;
    edTransactionNo: TcxTextEdit;
    cxLabel4: TcxLabel;
    edtMemberName: TcxTextEdit;
    cxLabel7: TcxLabel;
    edtKeterangan: TcxTextEdit;
    cxLabel8: TcxLabel;
    curredtTotalPrice: TcxCurrencyEdit;
    cxGroupBox5: TcxGroupBox;
    Label29: TLabel;
    btnDeletePrice: TcxButton;
    btnAddPrice: TcxButton;
    cxGrid: TcxGrid;
    cxGridView: TcxGridDBTableView;
    cxGridViewDetail: TcxGridTableView;
    colPLU: TcxGridColumn;
    colProductName: TcxGridColumn;
    colUoM: TcxGridColumn;
    colQty: TcxGridColumn;
    colSellPrice: TcxGridColumn;
    colDisc: TcxGridColumn;
    colSellPriceDisc: TcxGridColumn;
    colTotal: TcxGridColumn;
    cxlvMaster: TcxGridLevel;
    procedure FormCreate(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure btnAddPriceClick(Sender: TObject);
    procedure btnDeletePriceClick(Sender: TObject);
    procedure edtKodeMemberPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure colQtyPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure colPLUPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure colUoMPropertiesInitPopup(Sender: TObject);
  private
    FCDSBarang: TClientDataSet;
    FCDSUoM: TClientDataSet;
    FModKuponBotol: TModTransKuponBotol;
    procedure CalculateTotal;
    function GetModKuponBotol: TModTransKuponBotol;
    procedure InitLookUp;
    function IsValidate: Boolean;
    procedure SavingData;
    property ModKuponBotol: TModTransKuponBotol read GetModKuponBotol write
        FModKuponBotol;
  public
    procedure LoadData(AID: string);
  end;

var
  frmDialogKuponBotol: TfrmDialogKuponBotol;

implementation

uses
  uDXUtils, uDMClient, uModelHelper, uAppUtils, uConstanta, uDBUtils,
  ufrmCXLookup, uModMember, uModBarang, uModSatuan, uRetnoUnit;

{$R *.dfm}

procedure TfrmDialogKuponBotol.FormCreate(Sender: TObject);
begin
  inherited;
  InitLookUp;
  ModKuponBotol.TKB_DATE       := Now;
  ModKuponBotol.TKB_IS_JURNAL  := 0;
  ModKuponBotol.TKB_IS_PRINTED := 0;
  ModKuponBotol.TKB_STATUS     := 'OPEN';
  ModKuponBotol.TKB_NO         := DMClient.CrudKuponBotolClient.GenerateNo(TModTransKuponBotol.ClassName);
  dtpTanggal.EditValue         := ModKuponBotol.TKB_DATE;
  edTransactionNo.EditValue    := ModKuponBotol.TKB_NO;
end;

procedure TfrmDialogKuponBotol.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if TAppUtils.Confirm(CONF_VALIDATE_FOR_DELETE) then
  begin
    try
      DMClient.CrudClient.DeleteFromDB(ModKuponBotol);
      TAppUtils.Information(CONF_DELETE_SUCCESSFULLY);
      ModalResult := mrOk;
    except
      TAppUtils.Error(ER_DELETE_FAILED);
      raise;
    end;
  end;
end;

procedure TfrmDialogKuponBotol.actSaveExecute(Sender: TObject);
begin
  inherited;
  if IsValidate then
    SavingData;
end;

procedure TfrmDialogKuponBotol.btnAddPriceClick(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  i := cxGridViewDetail.DataController.AppendRecord;
  cxGridViewDetail.DataController.Values[i, colQty.Index] := 1;
end;

procedure TfrmDialogKuponBotol.btnDeletePriceClick(Sender: TObject);
begin
  inherited;
  cxGridViewDetail.DataController.DeleteFocused;
  curredtTotalPrice.EditValue := cxGridViewDetail.GetFooterSummary(colTotal);
end;

procedure TfrmDialogKuponBotol.CalculateTotal;
var
  i: Integer;
  lDC: TcxGridDataController;
begin
  lDC := cxGridViewDetail.DataController;
  lDC.Post;
  for i := 0 to lDC.RecordCount-1 do
  begin
    lDC.Values[i, colTotal.Index] := lDC.Values[i, colQty.Index] * lDC.Values[i, colSellPriceDisc.Index];
  end;
  curredtTotalPrice.EditValue := cxGridViewDetail.GetFooterSummary(colTotal);
end;

procedure TfrmDialogKuponBotol.colPLUPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  i: Integer;
  lDC: TcxGridDataController;
begin
  inherited;
  lDC := cxGridViewDetail.DataController;
  i   := lDC.FocusedRecordIndex;

  lDC.Values[i, colProductName.Index]   := FCDSBarang.FieldByName('NAMA_BARANG').AsString;
  lDC.Values[i, colUoM.Index]           := FCDSBarang.FieldByName('REF$SATUAN_ID').AsString;
  lDC.Values[i, colSellPrice.Index]     := FCDSBarang.FieldByName('HARGA_JUAL').AsString;
  lDC.Values[i, colDisc.Index]          := FCDSBarang.FieldByName('DISCOUNT').AsString;
  lDC.Values[i, colSellPriceDisc.Index] := FCDSBarang.FieldByName('NETT').AsString;
  CalculateTotal;
end;

procedure TfrmDialogKuponBotol.colQtyPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  CalculateTotal;
end;

procedure TfrmDialogKuponBotol.colUoMPropertiesInitPopup(Sender: TObject);
begin
  inherited;
  Abort;
end;

procedure TfrmDialogKuponBotol.edtKodeMemberPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  lCDS: TClientDataSet;
begin
  inherited;
  lCDS := TDBUtils.DSToCDS(DMClient.DSProviderClient.Member_GetDSLookUp(),Self);
  if Assigned(lCDS) then
  begin
    with TfrmCXLookup.Execute(lCDS, False, 'Look Up Member') do
    begin
      Try
        if ShowModal = mrOK then
        begin
          edtKodeMember.EditValue := Data.FieldByName('NOMOR_KARTU').AsString;
          edtMemberName.EditValue := Data.FieldByName('NAMA').AsString;
          ModKuponBotol.MEMBER := TModMember.CreateID(Data.FieldByName('MEMBER_ID').AsString);
        end;
      Finally
        Free;
      End;
    end;
  end;
end;

function TfrmDialogKuponBotol.GetModKuponBotol: TModTransKuponBotol;
begin
  if not Assigned(FModKuponBotol) then
    FModKuponBotol := TModTransKuponBotol.Create();

  Result := FModKuponBotol;
end;

procedure TfrmDialogKuponBotol.InitLookUp;
begin
  FCDSBarang := TDBUtils.DSToCDS(DMClient.DSProviderClient.BarangGalon_GetDSLookup(), Self);
  TcxExtLookupComboBoxProperties(cxGridViewDetail.Columns[colPLU.Index].Properties).LoadFromCDS(
    FCDSBarang,'BARANG_ID','PLU',['BARANG_ID'],Self);

  FCDSUoM := TDBUtils.DSToCDS(DMClient.DSProviderClient.Satuan_GetDSLookup(), Self);
  TcxExtLookupComboBoxProperties(cxGridViewDetail.Columns[colUoM.Index].Properties).LoadFromCDS(
    FCDSUoM,'ref$satuan_id','sat_code',['ref$satuan_id'],Self);
end;

function TfrmDialogKuponBotol.IsValidate: Boolean;
var
  i: Integer;
begin
  Result := False;

  if edtKodeMember.Text = '' then
  begin
    TAppUtils.Warning('Member belum diisi');
    Exit;
  end else
  if cxGridViewDetail.DataController.RecordCount <= 0 then
  begin
    TAppUtils.Warning('Detil belum diisi');
    Exit;
  end else
  begin
    for i := 0 to cxGridViewDetail.DataController.RecordCount-1 do
    begin
      if cxGridViewDetail.DataController.Values[i, colQty.Index] <= 0 then
      begin
        TAppUtils.Warning('Detil ada yg qty 0');
        Exit;
      end;
    end;
  end;

  Result := True;
end;

procedure TfrmDialogKuponBotol.LoadData(AID: string);
var
  lDC: TcxGridDataController;
  i: Integer;
  iRec: Integer;
  lItem: TModTransKuponBotolDetil;
begin
  ClearByTag([0]);
  if Assigned(FModKuponBotol) then FreeAndNil(FModKuponBotol);

  FModKuponBotol := DMClient.CrudClient.RetrieveByCode(TModTransKuponBotol.ClassName, AID) as TModTransKuponBotol;
  ModKuponBotol.MEMBER.Reload();

  dtpTanggal.EditValue      := ModKuponBotol.TKB_DATE;
  edTransactionNo.EditValue := ModKuponBotol.TKB_NO;
  edtKodeMember.EditValue   := ModKuponBotol.MEMBER.MEMBER_CARD_NO;
  edtMemberName.EditValue   := ModKuponBotol.MEMBER.MEMBER_NAME;
  edtKeterangan.EditValue   := ModKuponBotol.TKB_DESCRIPTION;

  cxGridViewDetail.ClearRows;
  lDC := cxGridViewDetail.DataController;
  for i := 0 to FModKuponBotol.KuponBotolDetils.Count-1 do
  begin
    lItem := FModKuponBotol.KuponBotolDetils[i];
    lItem.BARANG.Reload();
    iRec := lDC.AppendRecord;
    lDC.Values[iRec, colPLU.Index]           := lItem.BARANG.ID;
    lDC.Values[iRec, colProductName.Index]   := lItem.BARANG.BRG_NAME;
    lDC.Values[iRec, colUoM.Index]           := lItem.SATUAN.ID;
    lDC.Values[iRec, colQty.Index]           := lItem.TKBD_QTY;
    lDC.Values[iRec, colSellPrice.Index]     := lItem.TKBD_SELL_PRICE;
    lDC.Values[iRec, colDisc.Index]          := lItem.TKBD_DISC;
    lDC.Values[iRec, colSellPriceDisc.Index] := lItem.TKBD_SELL_PRICE_DISC;
    lDC.Values[iRec, colTotal.Index]         := lItem.TKBD_TOTAL_SELL_PRICE_DISC;
  end;
  curredtTotalPrice.EditValue := cxGridViewDetail.GetFooterSummary(colTotal);
  cxGridViewDetail.ApplyBestFit();
end;

procedure TfrmDialogKuponBotol.SavingData;
var
  i: Integer;
  lDC: TcxGridDataController;
  lItem: TModTransKuponBotolDetil;
begin
  ModKuponBotol.TKB_DATE              := dtpTanggal.EditValue;
  ModKuponBotol.TKB_NO                := edTransactionNo.EditValue;
  ModKuponBotol.MEMBER.MEMBER_CARD_NO := edtKodeMember.EditValue;
  ModKuponBotol.MEMBER.MEMBER_NAME    := edtMemberName.EditValue;
  ModKuponBotol.TKB_DESCRIPTION       := VarToStr(edtKeterangan.EditValue);
  ModKuponBotol.TKB_QTY               := cxGridViewDetail.GetFooterSummary(colQty);
  ModKuponBotol.TKB_SELL_PRICE_DISC   := cxGridViewDetail.GetFooterSummary(colTotal);
  ModKuponBotol.AUTUNIT               := TRetno.UnitStore;

  ModKuponBotol.KuponBotolDetils.Clear;
  lDC := cxGridViewDetail.DataController;
  for i := 0 to lDC.RecordCount-1 do
  begin
    lItem := TModTransKuponBotolDetil.Create;
    ModKuponBotol.KuponBotolDetils.Add(lItem);

    lItem.BARANG                      := TModBarang.CreateID(lDC.Values[i, colPLU.Index]);
    lItem.SATUAN                      := TModSatuan.CreateID(lDC.Values[i, colUoM.Index]);
    lItem.TKBD_DISC                   := lDC.Values[i, colDisc.Index];
    lItem.TKBD_QTY                    := lDC.Values[i, colQty.Index];
    lItem.TKBD_SELL_PRICE             := lDC.Values[i, colSellPrice.Index];
    lItem.TKBD_SELL_PRICE_DISC        := lDC.Values[i, colSellPriceDisc.Index];
    lItem.TKBD_TOTAL_SELL_PRICE_DISC  := lDC.Values[i, colTotal.Index];
  end;

  Try
    DMClient.CrudClient.SaveToDB(ModKuponBotol);
    TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
    ModalResult := mrOk;
  except
    TAppUtils.Error(ER_INSERT_FAILED);
    Raise;
  End;
end;

end.
