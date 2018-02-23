unit ufrmDialogPOFromTrader;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxMemo, cxButtonEdit, cxTextEdit, cxCurrencyEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, Vcl.StdCtrls, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls, uDXUtils,
  uModelHelper, uInterface, Datasnap.DBClient, ufrmCXLookup, uDBUtils,
  uDMClient, uModOrganization, uModPOTrader, Vcl.Menus,
  uModBarang;

type
  TfrmDialogPOFromTrader = class(TfrmMasterDialog, ICRUDAble)
    cxgrdlvlPOTrader: TcxGridLevel;
    cxGrid: TcxGrid;
    cxGridColPODDisc: TcxGridDBColumn;
    cxGridColPODHarga: TcxGridDBColumn;
    cxGridColPODKode: TcxGridDBColumn;
    cxGridColPODNama: TcxGridDBColumn;
    cxGridColPODPPN: TcxGridDBColumn;
    cxGridColPODQty: TcxGridDBColumn;
    cxGridColPODTotal: TcxGridDBColumn;
    cxGridColPODUOM: TcxGridDBColumn;
    cxGridDBTablePOTrader: TcxGridDBTableView;
    dtTgl: TcxDateEdit;
    edLeadTime: TcxTextEdit;
    edNoBukti: TcxTextEdit;
    edOrganization: TcxButtonEdit;
    edOrganizationName: TcxButtonEdit;
    edTipeMember: TcxTextEdit;
    edTOP: TcxTextEdit;
    edTotal: TcxCurrencyEdit;
    lblDesc: TLabel;
    lblIsMember: TLabel;
    lblLeadTime: TLabel;
    lblOrganizasi: TLabel;
    lblPODate: TLabel;
    lblPONo: TLabel;
    lblTOP: TLabel;
    lblTotal: TLabel;
    memDescription: TcxMemo;
    pnl1: TPanel;
    cxGridColPODBarang: TcxGridDBColumn;
    Panel1: TPanel;
    Label1: TLabel;
    edPLU: TcxTextEdit;
    procedure actDeleteExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure edOrganizationPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edPLUKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure cxGridColPODQtyPropertiesEditValueChanged(Sender: TObject);
    procedure cxGridColPODKodePropertiesEditValueChanged(Sender: TObject);
  private
    FCDSDetail: TClientDataset;
    FCDSOrganisasi: TClientDataset;
    FCDSBarang: TClientDataset;
    FModPOTrader: TModPOTrader;
    FOrganization: TModOrganization;
    procedure Calculate;
    function GetCDSDetail: TClientDataset;
    function GetCDSOrganisasi: TClientDataset;
    function GetCDSBarang: TClientDataset;
    function GetModPOTrader: TModPOTrader;
    function GetPLUAndQty(aPLUQty: String; var aPLU, aQty: string): TModBarang;
    function IsValidate: Boolean;
    procedure LoadBarangToGrid(aPLUQty: string; aUoM: string = '');
    procedure LoadDataOrganization(AKodeAtauID : String; AIsLoadByKode : Boolean);
    procedure UpdateData;
    property CDSDetail: TClientDataset read GetCDSDetail write FCDSDetail;
    property CDSOrganisasi: TClientDataset read GetCDSOrganisasi write
        FCDSOrganisasi;
    property CDSBarang: TClientDataset read GetCDSBarang write FCDSBarang;
    property ModPOTrader: TModPOTrader read GetModPOTrader write FModPOTrader;
  public
    procedure LoadData(AID : String);
  end;

var
  frmDialogPOFromTrader: TfrmDialogPOFromTrader;

implementation

uses
  uAppUtils, uConstanta, DateUtils, uModUnit, uRetnoUnit, uModSatuan, StrUtils,
  cxGridDBDataDefinitions, uModCrazyPrice, udmReport;

{$R *.dfm}

procedure TfrmDialogPOFromTrader.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if TAppUtils.Confirm(CONF_VALIDATE_FOR_DELETE) then
  begin
    try
      DMClient.CrudClient.DeleteFromDB(ModPOTrader);
      TAppUtils.Information(CONF_DELETE_SUCCESSFULLY);
      ModalResult := mrOk;
    except
      TAppUtils.Error(ER_DELETE_FAILED);
      raise;
    end;
  end;
end;

procedure TfrmDialogPOFromTrader.actPrintExecute(Sender: TObject);
begin
  inherited;
  DmReport.ExecuteReport(
    'reports\POTrader_Slip',
    DMReport.ReportClient.POTrader_SlipByID(ModPOTrader.ID),
    []
  );
end;

procedure TfrmDialogPOFromTrader.actSaveExecute(Sender: TObject);
begin
  inherited;
  if IsValidate then
  begin
    Try
      UpdateData;
      DMClient.CrudClient.SaveToDB(ModPOTrader);
      TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
      ModalResult := mrOk;
    except
      TAppUtils.Error(ER_INSERT_FAILED);
      Raise;
    End;
  end;
end;

procedure TfrmDialogPOFromTrader.Calculate;
var
  dDisc: Double;
  dDiscRp: Double;
  dNetSale: Double;
  dPPN: Double;
  dPPNRp: Double;
  dQty: Double;
  dSellPrice: Double;
  dTotal: Double;
begin
  if CDSDetail.State in [dsEdit] then CDSDetail.Post;

  dSellPrice := CDSDetail.FieldByName('POTITEM_SELLPRICE').AsFloat;
  dDisc      := CDSDetail.FieldByName('POTITEM_DISC').AsFloat;
  dPPN       := CDSDetail.FieldByName('POTITEM_PPN').AsFloat;
  dQty       := CDSDetail.FieldByName('POTITEM_QTY').AsFloat;

  dDiscRp   := dSellPrice * dDisc / 100;
  dNetSale  := dSellPrice - dDiscRp;
  dPPNRp    := dNetSale * dPPN / 100;
  dTotal    := (dNetSale + dPPNRp) * dQty;

  CDSDetail.Edit;
  CDSDetail.FieldByName('POTITEM_DISCRP').AsFloat   := dDiscRp;
  CDSDetail.FieldByName('POTITEM_NETSALE').AsFloat  := dNetSale;
  CDSDetail.FieldByName('POTITEM_PPNRP').AsFloat    := dPPNRp;
  CDSDetail.FieldByName('POTITEM_TOTAL').AsFloat    := dTotal;
  CDSDetail.Post;

  edTotal.EditValue := cxGridDBTablePOTrader.GetFooterSummary(cxGridColPODTotal);
end;

procedure TfrmDialogPOFromTrader.cxGridColPODKodePropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  Calculate;
end;

procedure TfrmDialogPOFromTrader.cxGridColPODQtyPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  Calculate;
end;

procedure TfrmDialogPOFromTrader.edOrganizationPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  with TfrmCXLookup.Execute(CDSOrganisasi,False, 'Look Up Data') do
  begin
    Try
      HideFields(['V_ORGANIZATION_ID', 'ORG_MerchandiseGroup_id','ORG_Member_ID','ORG_Karyawan_ID','DATE_CREATE','DATE_MODIFY']);
      if ShowModal = mrOK then
      begin
        edOrganization.Text := Data.FieldByName('org_code').AsString;
        LoadDataOrganization(edOrganization.Text, True);
      end;
    Finally
      free;
    End;
  end;
end;

procedure TfrmDialogPOFromTrader.edPLUKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F5) then
  begin
    with TfrmCXLookup.Execute(CDSBarang, False, 'Look Up Data') do
    begin
      Try
        if ShowModal = mrOK then
        begin
          LoadBarangToGrid(Data.FieldByName('BRG_CODE').AsString, Data.FieldByName('REF$SATUAN_ID').AsString);
        end;
      Finally
        free;
      End;
    end;
  end
  else if (Key = VK_RETURN) then
  begin
    if Length(VarToStr(edPLU.Text)) < 6 then
      edPLU.Text := TAppUtils.StrPadLeft(edPLU.Text, 6 , '0');

    LoadBarangToGrid(edPLU.Text);
  end;
end;

procedure TfrmDialogPOFromTrader.FormCreate(Sender: TObject);
begin
  inherited;
  ClearByTag([0,1]);
  dtTgl.Date := Now;
  cxGridDBTablePOTrader.PrepareFromCDS(CDSDetail);
  cxGridDBTablePOTrader.ApplyBestFit();
end;

function TfrmDialogPOFromTrader.GetCDSDetail: TClientDataset;
begin
  if not Assigned(FCDSDetail) then
  begin
    FCDSDetail := TDBUtils.CreateObjectDataSet(TModPOTraderItem, Self, False);
    FCDSDetail.AddField('BRG_KODE', ftString);
    FCDSDetail.AddField('BRG_NAMA', ftString);
    FCDSDetail.AddField('BRG_UOM', ftString);
    FCDSDetail.CreateDataSet;
  end;

  Result := FCDSDetail;
end;

function TfrmDialogPOFromTrader.GetCDSOrganisasi: TClientDataset;
begin
  if FCDSOrganisasi = nil then
    FCDSOrganisasi := TDBUtils.DSToCDS(DMClient.DSProviderClient.Organization_Lookup(2), Self);

  Result := FCDSOrganisasi;
end;

function TfrmDialogPOFromTrader.GetCDSBarang: TClientDataset;
begin
  if FCDSBarang = nil then
    FCDSBarang := TDBUtils.DSToCDS(DMClient.DSProviderClient.Barang_HargaJualOverview('',''), Self);

  Result := FCDSBarang;
end;

function TfrmDialogPOFromTrader.GetModPOTrader: TModPOTrader;
begin
  if not Assigned(FModPOTrader) then
    FModPOTrader := TModPOTrader.Create;

  Result := FModPOTrader;
end;

function TfrmDialogPOFromTrader.GetPLUAndQty(aPLUQty: String; var aPLU, aQty:
    string): TModBarang;
begin
  aPLU := aPLUQty;
  aQty := '1';

  if Pos('*', aPLUQty) > 0 then //via PLU
  begin
    aPLU  := TAppUtils.SplitRightStr(aPLUQty, '*');
    aQty  := TAppUtils.SplitLeftStr(aPLUQty, '*');
  end;

  if not DMClient.CRUDPOTraderClient.HasBarcode(aPLU) then //barcode
  begin
    aPLU    := LeftStr(aPLUQty, 6);
    aQty    := StringReplace(aPLUQty, aPLU, '', []);
    Result  := DMClient.CRUDBarangClient.RetrievePOS(aPLU);

    //PLU has decimal
    if (aQty <> '') and (Result.BRG_IS_DECIMAL = 1) then
    begin
      if Copy(aQty,3,3) <> '' then
        aQty := LeftStr(aQty, 2) + '.' + Copy(aQty,3,3);
    end;
  end
  else
    Result := DMClient.CRUDBarangClient.RetrievePOS(aPLU);
end;

function TfrmDialogPOFromTrader.IsValidate: Boolean;
begin
  Result := False;

  if edNoBukti.EditValue = '' then
  begin
    TAppUtils.Warning('PO Number belum diisi');
    exit;
  end else
  if edOrganization.EditValue = '' then
  begin
    TAppUtils.Warning('Organisasi belum diisi');
    exit;
  end else
    Result := True;
end;

procedure TfrmDialogPOFromTrader.LoadBarangToGrid(aPLUQty: string; aUoM: string
    = '');
var
  lModBarang: TModBarang;
  lBHJ: TModBarangHargaJual;
  sPLU: string;
  dQty: Double;
  lCrazyPrice: TModCrazyPrice;
  lQty: Double;
  sQty: string;
begin
  inherited;
  dQty := 1;
  lModBarang := GetPLUAndQty(aPLUQty, sPLU, sQty);
  if sQty <> '' then TryStrToFloat(sQty, dQty);

  edPLU.Enabled := False;
  try
    lCrazyPrice := DMClient.CrudCrazyPriceClient.RetrieveByBarcode(sPLU,'');
    if lCrazyPrice.ID <> '' then
    begin
      lCrazyPrice.CRAZY_BARANG.Reload();

      if CDSDetail.Locate('POTITEM_BARANG;POTITEM_SATUAN',VarArrayOf([lCrazyPrice.CRAZY_BARANG.ID, lCrazyPrice.CRAZY_SATUAN.ID]) ,[loCaseInsensitive]) then
      begin
        CDSDetail.Edit;
        lQty := CDSDetail.FieldByName('POTITEM_QTY').Value;
      end
      else
      begin
        CDSDetail.Append;
        lQty := 0
      end;

      CDSDetail.FieldByName('POTITEM_BARANG').Value     := lCrazyPrice.CRAZY_BARANG.ID;
      CDSDetail.FieldByName('BRG_KODE').Value           := lCrazyPrice.CRAZY_BARANG.BRG_CODE;
      CDSDetail.FieldByName('BRG_NAMA').Value           := lCrazyPrice.CRAZY_BARANG.BRG_NAME;
      CDSDetail.FieldByName('BRG_UOM').Value            := lCrazyPrice.CRAZY_SATUAN.SAT_CODE;
      CDSDetail.FieldByName('POTITEM_SATUAN').Value     := lCrazyPrice.CRAZY_SATUAN.ID;
      CDSDetail.FieldByName('POTITEM_QTY').Value        := lQty + dQty;
      CDSDetail.FieldByName('POTITEM_SELLPRICE').Value  := lCrazyPrice.CRAZY_SELLPRICE_DISC;
      CDSDetail.FieldByName('POTITEM_COGS').Value       := lCrazyPrice.CRAZY_COGS;
      CDSDetail.FieldByName('POTITEM_DISC').Value       := lCrazyPrice.CRAZY_DISC_PERSEN;
      CDSDetail.FieldByName('POTITEM_PPN').Value        := lCrazyPrice.CRAZY_PPN;

      CDSDetail.Post;
      edPLU.Clear;
    end
    else
    begin
      lBHJ := DMClient.CrudBarangHargaJualClient.RetrieveByBarcode(sPLU, aUoM);
      if lBHJ.ID <> '' then
      begin
        lBHJ.Barang.Reload();
        lBHJ.Satuan.Reload();

        if CDSDetail.Locate('POTITEM_BARANG;POTITEM_SATUAN',VarArrayOf([lBHJ.Barang.ID,lBHJ.Satuan.ID]),[loCaseInsensitive]) then
        begin
          CDSDetail.Edit;
          lQty := CDSDetail.FieldByName('POTITEM_QTY').Value;
        end
        else
        begin
          CDSDetail.Append;
          lQty := 0
        end;

        CDSDetail.FieldByName('POTITEM_BARANG').Value     := lBHJ.Barang.ID;
        CDSDetail.FieldByName('BRG_KODE').Value           := lBHJ.Barang.BRG_CODE;
        CDSDetail.FieldByName('BRG_NAMA').Value           := lBHJ.Barang.BRG_NAME;
        CDSDetail.FieldByName('BRG_UOM').Value            := lBHJ.Satuan.SAT_CODE;
        CDSDetail.FieldByName('POTITEM_SATUAN').Value     := lBHJ.Satuan.ID;
        CDSDetail.FieldByName('POTITEM_QTY').Value        := lQty + dQty;
        CDSDetail.FieldByName('POTITEM_SELLPRICE').Value  := lBHJ.BHJ_SELL_PRICE;
        CDSDetail.FieldByName('POTITEM_COGS').Value       := lBHJ.BHJ_PURCHASE_PRICE;
        CDSDetail.FieldByName('POTITEM_DISC').Value       := lBHJ.BHJ_DISC_PERSEN;
        CDSDetail.FieldByName('POTITEM_PPN').Value        := lBHJ.BHJ_PPN;

        CDSDetail.Post;
        edPLU.Clear;
      end
    end;
  finally
    FreeAndNil(lModBarang);
    Calculate;
    cxGridDBTablePOTrader.ApplyBestFit();
    edPLU.Enabled := True;
    edPLU.SetFocus;
  end;
end;

procedure TfrmDialogPOFromTrader.LoadData(AID : String);
var
  i: Integer;
  lItem: TModPOTraderItem;
begin
  ClearByTag([0,1]);
  dtTgl.Date := Now;

  if AID = '' then Exit;

  if Assigned(FModPOTrader) then FreeAndNil(FModPOTrader);
  FModPOTrader := DMClient.CrudClient.Retrieve(TModPOTrader.ClassName, AID) as TModPOTrader;

  edNoBukti.EditValue       := ModPOTrader.POT_NO;
  dtTgl.EditValue           := ModPOTrader.POT_DATE;
  LoadDataOrganization(ModPOTrader.POT_Organization.ID, False);
  edLeadTime.EditValue      := ModPOTrader.POT_LEAD_TIME;
  edTOP.EditValue           := ModPOTrader.POT_TOP;
  edTotal.EditValue         := ModPOTrader.POT_TOTAL;
  memDescription.EditValue  := ModPOTrader.POT_DESCRIPTION;

  for i := 0 to ModPOTrader.POTraderItems.Count-1 do
  begin
    lItem := ModPOTrader.POTraderItems[i];
    lItem.POTITEM_BARANG.Reload();
    lItem.POTITEM_SATUAN.Reload();

    CDSDetail.Append;
    lItem.UpdateToDataset(CDSDetail);
    CDSDetail.FieldByName('BRG_KODE').Value := lItem.POTITEM_BARANG.BRG_CODE;
    CDSDetail.FieldByName('BRG_NAMA').Value := lItem.POTITEM_BARANG.BRG_NAME;
    CDSDetail.FieldByName('BRG_UOM').Value  := lItem.POTITEM_SATUAN.SAT_CODE;
    CDSDetail.Post;
  end;
end;

procedure TfrmDialogPOFromTrader.LoadDataOrganization(AKodeAtauID : String;
    AIsLoadByKode : Boolean);
begin
  edOrganizationName.Text := '';
  edTipeMember.Text := '';

  if AIsLoadByKode then
    FOrganization := DMClient.CrudClient.RetrieveByCode(TModOrganization.ClassName, AKodeAtauID) as TModOrganization
  else begin
    FOrganization := DMClient.CrudClient.Retrieve(TModOrganization.ClassName, AKodeAtauID) as TModOrganization;
    if FOrganization <> nil then
      edOrganization.Text := FOrganization.ORG_Code;
  end;

  if FOrganization <> nil then
  begin
    edOrganizationName.Text := FOrganization.ORG_Name;
    FOrganization.ORG_Member.Reload();
    FOrganization.ORG_Member.RefTipeMember.Reload();
    edTipeMember.EditValue := FOrganization.ORG_Member.RefTipeMember.TPMEMBER_NAME;
  end;
end;

procedure TfrmDialogPOFromTrader.UpdateData;
var
  lItem: TModPOTraderItem;
begin
  if ModPOTrader.ID = '' then
  begin
    ModPOTrader.POT_NO      := DMClient.CrudClient.GenerateNo(TModPOTrader.ClassName);
    ModPOTrader.POT_STATUS  := 'CREATED';
  end;
  ModPOTrader.POT_DATE          := dtTgl.EditValue;
  ModPOTrader.POT_DESCRIPTION   := VarToStr(memDescription.EditValue);
  ModPOTrader.POT_DISC_MEMBER   := 0;
  ModPOTrader.POT_LEAD_TIME     := 0; //edLeadTime.EditValue;
  ModPOTrader.POT_Organization  := FOrganization;
  ModPOTrader.POT_PPNBM         := 0;
  ModPOTrader.POT_TOP           := 0;//edTOP.EditValue;
  ModPOTrader.POT_UNIT          := TModUnit.CreateID(TRetno.UnitStore.ID);
  ModPOTrader.POT_VALID_DATE    := IncDay(ModPOTrader.POT_DATE,7);
  ModPOTrader.POT_TOTAL         := cxGridDBTablePOTrader.GetFooterSummary(cxGridColPODTotal);

  ModPOTrader.POTraderItems.Clear;
  CDSDetail.First;
  while not CDSDetail.Eof do
  begin
    lItem := TModPOTraderItem.Create;
    lItem.SetFromDataset(CDSDetail);
    lItem.POTITEM_BARANG.Reload();
    lItem.POTITEM_COGS := lItem.POTITEM_BARANG.BRG_HARGA_AVERAGE;
    ModPOTrader.POTraderItems.Add(lItem);

    ModPOTrader.POT_DISC     := ModPOTrader.POT_DISC + CDSDetail.FieldByName('POTITEM_DISCRP').AsFloat;
    ModPOTrader.POT_PPN      := ModPOTrader.POT_PPN + CDSDetail.FieldByName('POTITEM_PPN').AsFloat;
    ModPOTrader.POT_SUBTOTAL := ModPOTrader.POT_SUBTOTAL + CDSDetail.FieldByName('POTITEM_TOTAL').AsFloat;
//    ModPOTrader.POT_TOTAL    := ModPOTrader.POT_TOTAL(ModPOTrader.POT_SUBTOTAL - ModPOTrader.POT_DISC + ModPOTrader.POT_PPN);
    CDSDetail.Next;
  end;
end;

end.
