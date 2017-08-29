unit ufrmDialogBankCashOut;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxMemo, cxLabel, cxDropDownEdit, cxCalendar,
  cxCurrencyEdit, cxButtonEdit, cxListView, cxTextEdit, cxMaskEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, dxBarBuiltInMenu,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB,
  cxDBData, cxSpinEdit, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxPC, uDMClient, uClientClasses, ufrmCXLookup,
  uModOrganization, uModBankCashOut, Datasnap.DBClient, uDXUtils,
  uDBUtils, uModBank, uAppUtils, uInterface, uModelHelper, uDMReport;

type
  TfrmDialogBankCashOut = class(TfrmMasterDialog, ICRUDAble)
    pnlBCOHeader: TPanel;
    cbbBank: TcxExtLookupComboBox;
    lvSumary: TcxListView;
    lvCheque: TcxListView;
    edOrganizationName: TcxButtonEdit;
    edNoBukti: TcxButtonEdit;
    edSummaryAll: TcxCurrencyEdit;
    edOrganization: TcxButtonEdit;
    dtTanggal: TcxDateEdit;
    memDesc: TcxMemo;
    cxgrdlvlAPList: TcxGridLevel;
    cxgrdDetail: TcxGrid;
    cxGridTableAPList: TcxGridTableView;
    cxgrdlvlOther: TcxGridLevel;
    cxGridTableOther: TcxGridTableView;
    cxgrdlvlCheque: TcxGridLevel;
    cxGridTableCheque: TcxGridTableView;
    cxGridColAPAP: TcxGridColumn;
    cxGridColAPTanggal: TcxGridColumn;
    cxGridColAPJatuhTempo: TcxGridColumn;
    cxGridColAPRekening: TcxGridColumn;
    cxGridColAPNominal: TcxGridColumn;
    cxGridColAPSisa: TcxGridColumn;
    cxGridColAPBayar: TcxGridColumn;
    cxGridColAPKeterangan: TcxGridColumn;
    cxGridColOtherKode: TcxGridColumn;
    cxGridColOtherNama: TcxGridColumn;
    cxGridColOtherBayar: TcxGridColumn;
    cxGridColOtherKeterangan: TcxGridColumn;
    cxGridColChequeNo: TcxGridColumn;
    cxGridColChequeJatuhTempo: TcxGridColumn;
    cxGridColChequeBayar: TcxGridColumn;
    cxGridColAPRekeningID: TcxGridColumn;
    cxGridColOtherCostCenter: TcxGridColumn;
    cxGridColChequeKeterangan: TcxGridColumn;
    lblNoBukti: TLabel;
    lblTanggal: TLabel;
    lblOrganizasi: TLabel;
    lblBank: TLabel;
    lblKeteranan: TLabel;
    lblTotal: TLabel;
    procedure actDeleteExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure beBusinessPartnerPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edOrganizationPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGridColAPAPPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGridTableAPListDataControllerAfterDelete(
      ADataController: TcxCustomDataController);
    procedure cxGridTableAPListDataControllerAfterPost(
      ADataController: TcxCustomDataController);
    procedure cxGridColOtherKodePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGridTableOtherDataControllerAfterDelete(
      ADataController: TcxCustomDataController);
    procedure cxGridTableOtherDataControllerAfterPost(
      ADataController: TcxCustomDataController);
    procedure cxGridTableChequeDataControllerAfterDelete(
      ADataController: TcxCustomDataController);
    procedure cxGridTableChequeDataControllerAfterPost(
      ADataController: TcxCustomDataController);
  private
    FBCO: TModBankCashOut;
    FCDSAP: TClientDataset;
    FCDSBank: TClientDataset;
    FCDSCostCenter: tclientDataSet;
    FCDSRekeningLain: tclientDataSet;
    FOrganization: TModOrganization;
    function GetBCO: TModBankCashOut;
    procedure HitungSummary;
    procedure InisialisasiBank;
    procedure InisialisasiAPList(AOrgID : String);
    procedure InisialisasiCostCenter;
    procedure InisialisasiRekeningLain;
    function IsBisaHapus: Boolean;
    procedure LoadDataOrganization(AKodeAtauID : String; AIsLoadByKode : Boolean);
    procedure UpdateBankCashOutAPItems;
    procedure UpdateBankCashOutOtherItems;
    procedure LoadDataBankCashOutAPItems;
    procedure LoadDataBankCashOutChequeItems;
    procedure LoadDataBankCashOutOtherItems;
    procedure SetDataAPItems(ANoAP : String; ABaris : Integer; AIsEdit : Boolean);
    procedure UpdateAPChequeOtems;
    { Private declarations }
  protected
    procedure LoadData(AID : String);
    property BCO: TModBankCashOut read GetBCO write FBCO;
  public
    procedure CetakSlip(APeriodeAwal, APeriodeAkhir: TDatetime; ANoBukti : String);
        override;
    { Public declarations }
  published
    property CDSBank: TClientDataset read FCDSBank write FCDSBank;
  end;

var
  frmDialogBankCashOut: TfrmDialogBankCashOut;

implementation

{$R *.dfm}

procedure TfrmDialogBankCashOut.actDeleteExecute(Sender: TObject);
begin
  inherited;

  if not IsBisaHapus then
    Exit;

  if DMClient.CrudBankCashOutClient.DeleteFromDB(BCO) then
  begin
    LoadData('');
  end;
end;

procedure TfrmDialogBankCashOut.actPrintExecute(Sender: TObject);
begin
  inherited;
  CetakSlip(BCO.BCO_Tanggal, BCO.BCO_Tanggal, BCO.BCO_NoBukti);
end;

procedure TfrmDialogBankCashOut.actSaveExecute(Sender: TObject);
var
  sID: string;
begin
  inherited;
  if not ValidateEmptyCtrl([1]) then
    Exit;

  if FOrganization = nil then
  begin
    TAppUtils.Error('Organisasi Belum Dipilih');
    Exit;
  end;

  if edSummaryAll.Value <= 0 then
  begin
    TAppUtils.Error('Total Pembayaran Harus > 0');
    Exit;
  end;

  BCO.BCO_NoBukti     := edNoBukti.Text;
  BCO.BCO_Bank        := TModBank.CreateID(cbbBank.EditValueRest);
  BCO.BCO_Keterangan  := memDesc.Text;
  BCO.BCO_Organization:= TModOrganization.CreateID(FOrganization.ID);
  BCO.BCO_TotalOther  := cxGridTableOther.DataController.GetFooterSummaryFloat(cxGridColOtherBayar);
  BCO.BCO_Tanggal     := dtTanggal.Date;
  BCO.BCO_Total       := edSummaryAll.Value;
  BCO.BCO_TotalHutang := cxGridTableAPList.DataController.GetFooterSummaryFloat(cxGridColAPBayar);

  UpdateBankCashOutAPItems;
  UpdateBankCashOutOtherItems;
  UpdateAPChequeOtems;

  sID := DMClient.CrudBankCashOutClient.SaveToDBID(BCO);
  if sID <> '' then
  begin
    FreeAndNil(FBCO);
    FBCO := DMClient.CrudBankCashOutClient.Retrieve(TModBankCashOut.ClassName,sID) as TModBankCashOut;
    edNoBukti.Text := FBCO.BCO_NoBukti;
  end;


end;

procedure TfrmDialogBankCashOut.FormCreate(Sender: TObject);
begin
  inherited;
  dtTanggal.Date := Now;

  InisialisasiBank;
  InisialisasiRekeningLain;
  InisialisasiCostCenter;
end;

procedure TfrmDialogBankCashOut.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FOrganization);
  FreeAndNil(FBCO);
  FreeAndNil(FCDSAP);
  FreeAndNil(FCDSBank);
  FreeAndNil(FCDSCostCenter);
  FreeAndNil(FCDSRekeningLain);
end;

procedure TfrmDialogBankCashOut.beBusinessPartnerPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  with TfrmCXLookup.Execute('Look Up PO','TDSProvider.Organization_GetDSLookup') do
  begin
    Try
      HideFields(['V_ORGANIZATION_ID']);
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

procedure TfrmDialogBankCashOut.CetakSlip(APeriodeAwal, APeriodeAkhir:
    TDatetime; ANoBukti : String);
begin
  with DMReport do
  begin
    AddReportVariable('UserCetak', 'USER');
    ExecuteReport('reports/BCO_Slip' ,ReportClient.BankCashOut_GetDS_Slip(APeriodeAwal, APeriodeAkhir, ANoBukti));
  end;
end;

procedure TfrmDialogBankCashOut.cxGridColAPAPPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  if VarIsNull(DisplayValue) then
    Exit;

  if VarToStr(DisplayValue) = '' then
    Exit;

  if FCDSAP = nil then
    Exit;

  SetDataAPItems(VarToStr(DisplayValue),cxGridTableAPList.RecordIndex, False);
end;

procedure TfrmDialogBankCashOut.cxGridColOtherKodePropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  iBaris: Integer;
begin
  inherited;

  if VarIsNull(DisplayValue) then
    Exit;

  if VarToStr(DisplayValue) = '' then
    Exit;

  if FCDSRekeningLain = nil then
    Exit;

  try
    FCDSRekeningLain.Filter   := ' Rek_Code = ' + QuotedStr(DisplayValue);
    FCDSRekeningLain.Filtered := True;

    iBaris := cxGridTableOther.RecordIndex;
    cxGridTableOther.SetValue(iBaris, cxGridColOtherNama.Index, FCDSRekeningLain.FieldByName('Rekening_id').AsString);
  finally
    FCDSRekeningLain.Filtered := False;
  end;
end;

procedure TfrmDialogBankCashOut.cxGridTableAPListDataControllerAfterDelete(
  ADataController: TcxCustomDataController);
begin
  inherited;
  HitungSummary;
end;

procedure TfrmDialogBankCashOut.cxGridTableAPListDataControllerAfterPost(
  ADataController: TcxCustomDataController);
begin
  inherited;
  HitungSummary;
end;

procedure TfrmDialogBankCashOut.cxGridTableChequeDataControllerAfterDelete(
  ADataController: TcxCustomDataController);
begin
  inherited;
  HitungSummary;
end;

procedure TfrmDialogBankCashOut.cxGridTableChequeDataControllerAfterPost(
  ADataController: TcxCustomDataController);
begin
  inherited;
  HitungSummary;
end;

procedure TfrmDialogBankCashOut.cxGridTableOtherDataControllerAfterDelete(
  ADataController: TcxCustomDataController);
begin
  inherited;
  HitungSummary;
end;

procedure TfrmDialogBankCashOut.cxGridTableOtherDataControllerAfterPost(
  ADataController: TcxCustomDataController);
begin
  inherited;
  HitungSummary;
end;

procedure TfrmDialogBankCashOut.edOrganizationPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  FreeAndNil(FOrganization);
  LoadDataOrganization(VarToStr(DisplayValue), True);
end;

function TfrmDialogBankCashOut.GetBCO: TModBankCashOut;
begin
  if FBCO = nil then
    FBCO := TModBankCashOut.Create;

  Result := FBCO;
end;

procedure TfrmDialogBankCashOut.HitungSummary;
var
  dTotal: Double;
begin
  dTotal := cxGridTableAPList.DataController.GetFooterSummaryFloat(cxGridColAPBayar);
  edSummaryAll.Value := dTotal;

  lvSumary.Items[0].SubItems[0] := FormatFloat(',0.00;(,0.00)',dTotal);

  dTotal := cxGridTableOther.DataController.GetFooterSummaryFloat(cxGridColOtherBayar);
  edSummaryAll.Value := edSummaryAll.Value + dTotal;

  lvSumary.Items[1].SubItems[0] := FormatFloat(',0.00;(,0.00)',dTotal);

  dTotal := cxGridTableCheque.DataController.GetFooterSummaryFloat(cxGridColChequeBayar);
  lvCheque.Items[0].SubItems[0] := FormatFloat(',0.00;(,0.00)',dTotal);

end;

procedure TfrmDialogBankCashOut.InisialisasiBank;
begin
  FreeAndNil(FCDSBank);


  FCDSBank := TDBUtils.DSToCDS( DMClient.DSProviderClient.Bank_GetDSLookup, Self );

  cbbBank.Properties.LoadFromCDS(CDSBank,'Bank_ID','Bank_Name',['Bank_ID'],Self);
  cbbBank.Properties.SetMultiPurposeLookup;
end;

procedure TfrmDialogBankCashOut.InisialisasiAPList(AOrgID : String);
begin
  FCDSAP := TDBUtils.DSToCDS(DMClient.DSProviderClient.AP_GetDSLookUpPerOrganization(AOrgID), Self, False);
  TcxExtLookupComboBoxProperties(cxGridTableAPList.Columns[cxGridColAPAP.Index].Properties).LoadFromCDS(FCDSAP,'AP_id','AP_REfnum',['ap_id','ap_rekening_id','ap_organization_id'],Self);
  TcxExtLookupComboBoxProperties(cxGridTableAPList.Columns[cxGridColAPAP.Index].Properties).SetMultiPurposeLookup;
end;

procedure TfrmDialogBankCashOut.InisialisasiCostCenter;
begin
  FreeAndNil(FCDSCostCenter);


  FCDSCostCenter := TDBUtils.DSToCDS( DMClient.DSProviderClient.CostCenter_GetDSLookup(), Self );

  TcxExtLookupComboBoxProperties(cxGridTableOther.Columns[cxGridColOtherCostCenter.Index].Properties).LoadFromCDS(FCDSCostCenter,'COST_CENTER_ID','COCTER_NAME',['COST_CENTER_ID'],Self);
  TcxExtLookupComboBoxProperties(cxGridTableOther.Columns[cxGridColOtherCostCenter.Index].Properties).SetMultiPurposeLookup;

end;

procedure TfrmDialogBankCashOut.InisialisasiRekeningLain;
begin
  FCDSRekeningLain := TDBUtils.DSToCDS(DMClient.DSProviderClient.RekeningBCOLain_GetDSLookup(), Self, False);

  TcxExtLookupComboBoxProperties(cxGridTableOther.Columns[cxGridColOtherKode.Index].Properties).LoadFromCDS(FCDSRekeningLain,'rekening_id','rek_code',['rekening_id'],Self);
  TcxExtLookupComboBoxProperties(cxGridTableOther.Columns[cxGridColOtherKode.Index].Properties).SetMultiPurposeLookup;

  TcxExtLookupComboBoxProperties(cxGridTableOther.Columns[cxGridColOtherNama.Index].Properties).LoadFromCDS(FCDSRekeningLain,'rekening_id','rek_name',['rekening_id'],Self);
  TcxExtLookupComboBoxProperties(cxGridTableOther.Columns[cxGridColOtherNama.Index].Properties).SetMultiPurposeLookup;
end;

function TfrmDialogBankCashOut.IsBisaHapus: Boolean;
begin
  Result := False;

  if not TAppUtils.ConfirmHapus then
    Exit;
  Result := True;
end;

procedure TfrmDialogBankCashOut.LoadData(AID : String);
begin
  ClearByTag([0,1]);

  cxGridTableCheque.ClearRows;
  cxGridTableAPList.ClearRows;
  cxGridTableOther.ClearRows;
  HitungSummary;

  if AID = '' then
    Exit;

  FreeAndNil(FBCO);
  FBCO := TModBankCashOut(DMClient.CrudBankCashOutClient.Retrieve(TModBankCashOut.ClassName, AID));
  edNoBukti.Text := BCO.BCO_NoBukti;
  dtTanggal.Date := BCO.BCO_Tanggal;

  edOrganization.Text := BCO.BCO_Organization.ORG_Code;
  LoadDataOrganization(BCO.BCO_Organization.ID, False);
  cbbBank.EditValue := BCO.BCO_Bank.ID;
  memDesc.Text := BCO.BCO_Keterangan;

  LoadDataBankCashOutAPItems;
  LoadDataBankCashOutOtherItems;
  LoadDataBankCashOutChequeItems;
  HitungSummary;
end;

procedure TfrmDialogBankCashOut.SetDataAPItems(ANoAP : String; ABaris :
    Integer; AIsEdit : Boolean);
var
  dSisa: Double;
begin
  try
    FCDSAP.Filter := ' AP_REfnum = ' + QuotedStr(ANoAP);
    FCDSAP.Filter := FCDSAP.Filter + ' or AP_ID = ' + QuotedStr(ANoAP);
    FCDSAP.Filtered := True;

//    ABaris := cxGridTableAPList.DataController.FocusedRecordIndex;
    cxGridTableAPList.SetValue(ABaris, cxGridColAPTanggal.Index, FCDSAP.FieldByName('ap_transdate').AsDateTime);
    cxGridTableAPList.SetValue(ABaris, cxGridColAPJatuhTempo.Index, FCDSAP.FieldByName('ap_duedate').AsDateTime);
    cxGridTableAPList.SetValue(ABaris, cxGridColAPRekening.Index, FCDSAP.FieldByName('rek_code').AsString);
    cxGridTableAPList.SetValue(ABaris, cxGridColAPRekeningID.Index, FCDSAP.FieldByName('AP_REKENING_ID').AsString);
    cxGridTableAPList.SetValue(ABaris, cxGridColAPNominal.Index, FCDSAP.FieldByName('ap_total').AsFloat);

    dSisa := FCDSAP.FieldByName('ap_total').AsFloat - FCDSAP.FieldByName('ap_paid').AsFloat;
    if AIsEdit then
    begin
      dSisa := dSisa + cxGridTableAPList.Double(ABaris, cxGridColAPBayar.Index);
    end else begin
      cxGridTableAPList.SetValue(ABaris, cxGridColAPBayar.Index, dSisa);
    end;

    cxGridTableAPList.SetValue(ABaris, cxGridColAPSisa.Index, dSisa);
  finally
    FCDSAP.Filtered := False;
  end;
end;

procedure TfrmDialogBankCashOut.LoadDataBankCashOutAPItems;
var
  I: Integer;
begin
  cxGridTableAPList.ClearRows;
  for I := 0 to BCO.BCO_BankCashOutAPItems.Count - 1 do
  begin
    cxGridTableAPList.DataController.AppendRecord;
    cxGridTableAPList.SetObjectData(BCO.BCO_BankCashOutAPItems[i], i);

    SetDataAPItems(BCO.BCO_BankCashOutAPItems[i].BCOAP_AP.ID,i, True);

  end;
end;

procedure TfrmDialogBankCashOut.LoadDataBankCashOutChequeItems;
var
  I: Integer;
begin
   cxGridTableCheque.ClearRows;
   for I := 0 to BCO.BCO_BankCashOutChequeItems.Count - 1 do
   begin
     cxGridTableCheque.DataController.AppendRecord;
     cxGridTableCheque.SetObjectData(BCO.BCO_BankCashOutChequeItems[i],i);

   end;
end;

procedure TfrmDialogBankCashOut.LoadDataBankCashOutOtherItems;
var
  I: Integer;
begin
  cxGridTableOther.ClearRows;
  for I := 0 to BCO.BCO_BankCashOutOtherItems.Count - 1 do
  begin
    cxGridTableOther.DataController.AppendRecord;
    cxGridTableOther.SetObjectData(BCO.BCO_BankCashOutOtherItems[i], i);
    cxGridTableOther.SetValue(i, cxGridColOtherNama.Index,BCO.BCO_BankCashOutOtherItems[i].BCOOTH_Rekening.ID);
  end;
end;


procedure TfrmDialogBankCashOut.LoadDataOrganization(AKodeAtauID : String;
    AIsLoadByKode : Boolean);
begin
  edOrganizationName.Text := '';

  if AIsLoadByKode then
    FOrganization := DMClient.CrudClient.RetrieveByCode(TModOrganization.ClassName,  AKodeAtauID) as TModOrganization
  else begin
    FOrganization := DMClient.CrudClient.Retrieve(TModOrganization.ClassName,  AKodeAtauID) as TModOrganization;
    if FOrganization <> nil then
    edOrganization.Text := FOrganization.ORG_Code;
  end;

  if FOrganization <> nil then
    edOrganizationName.Text := FOrganization.ORG_Name;

  InisialisasiAPList(FOrganization.ID);
end;

procedure TfrmDialogBankCashOut.UpdateAPChequeOtems;
var
  I: Integer;
  lModBankCashOutChequeItem: TModBankCashOutChequeItem;
begin
  BCO.BCO_BankCashOutChequeItems.Clear;
  for I := 0 to cxGridTableCheque.DataController.RecordCount - 1 do
  begin
    lModBankCashOutChequeItem := TModBankCashOutChequeItem.Create;
    cxGridTableCheque.LoadObjectData(lModBankCashOutChequeItem, i);

    BCO.BCO_BankCashOutChequeItems.Add(lModBankCashOutChequeItem);
  end;

end;

procedure TfrmDialogBankCashOut.UpdateBankCashOutAPItems;
var
  I: Integer;
  lModBankCashOutAPItem: TModBankCashOutAPItem;
begin
  BCO.BCO_BankCashOutAPItems.Clear;
  for I := 0 to cxGridTableAPList.DataController.RecordCount - 1 do
  begin
    lModBankCashOutAPItem := TModBankCashOutAPItem.Create;
    cxGridTableAPList.LoadObjectData(lModBankCashOutAPItem, i);
    BCO.BCO_BankCashOutAPItems.Add(lModBankCashOutAPItem);
  end;
end;

procedure TfrmDialogBankCashOut.UpdateBankCashOutOtherItems;
var
  I: Integer;
  lModBankCashOutOtherItem: TModBankCashOutOtherItem;
begin
  BCO.BCO_BankCashOutOtherItems.Clear;
  for I := 0 to cxGridTableOther.DataController.RecordCount - 1 do
  begin
    lModBankCashOutOtherItem := TModBankCashOutOtherItem.Create;
    cxGridTableOther.LoadObjectData(lModBankCashOutOtherItem, i);
    BCO.BCO_BankCashOutOtherItems.Add(lModBankCashOutOtherItem);
  end;
end;

end.
