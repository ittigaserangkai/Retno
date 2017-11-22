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
  uDBUtils, uModBank, uAppUtils, uInterface, uModelHelper, uDMReport,
  uConstanta, uRetnoUnit;

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
    cxgrdlvlPotongTagihan: TcxGridLevel;
    cxGridTablePotongTagihan: TcxGridTableView;
    cxGridColPotagAR: TcxGridColumn;
    cxGridColPotagTgl: TcxGridColumn;
    cxGridColPotagDueDate: TcxGridColumn;
    cxGridColPotagKeterangan: TcxGridColumn;
    cxGridColPotagNominal: TcxGridColumn;
    cxGridColPotagRekening: TcxGridColumn;
    cxGridColPotagSisa: TcxGridColumn;
    cxGridColPotagBayar: TcxGridColumn;
    cxGridColPotagRekeningID: TcxGridColumn;
    cxGridColAPRekening: TcxGridColumn;
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
    procedure cxGridTableChequeDataControllerAfterInsert(
      ADataController: TcxCustomDataController);
    procedure cxGridTableChequeDataControllerBeforeInsert(
      ADataController: TcxCustomDataController);
    procedure cxGridColAPAPPropertiesEditValueChanged(Sender: TObject);
    procedure cxGridColPotagARPropertiesEditValueChanged(Sender: TObject);
    procedure cxGridTablePotongTagihanDataControllerAfterPost(
      ADataController: TcxCustomDataController);
    procedure cxGridTablePotongTagihanDataControllerAfterDelete(
      ADataController: TcxCustomDataController);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FBCO: TModBankCashOut;
    FCDSAP: TClientDataset;
    FCDSAR: TClientDataset;
    FCDSBank: TClientDataset;
    FCDSRekening: TClientDataset;
    FCDSCostCenter: tclientDataSet;
    FCDSOrganisasi: tclientDataSet;
    FCDSRekeningLain: tclientDataSet;
    FOrganization: TModOrganization;
    function GetBCO: TModBankCashOut;
    function GetCDSOrganisasi: tclientDataSet;
    function GetDCAP: TcxGridDataController;
    function GetDCAR: TcxGridDataController;
    function GetDCOther: TcxGridDataController;
    function GetDCCheque: TcxGridDataController;
    procedure HitungSummary;
    procedure InisialisasiBank;
    procedure InisialisasiAPList(AOrgID : String);
    procedure InisialisasiARList(AOrgID : String);
    procedure InisialisasiRekening;
    procedure InisialisasiCostCenter;
    procedure InisialisasiRekeningLain;
    function IsBisaHapus: Boolean;
    procedure IsiDefaultNominalCheque;
    procedure LoadDataOrganization(AKodeAtauID : String; AIsLoadByKode : Boolean);
    procedure UpdateBankCashOutAPItems;
    procedure UpdateBankCashOutOtherItems;
    procedure LoadDataBankCashOutAPItems;
    procedure LoadDataBankCashOutARItems;
    procedure LoadDataBankCashOutChequeItems;
    procedure LoadDataBankCashOutOtherItems;
    procedure SetDataAPItems(ANoAP : String; ABaris : Integer; AIsEdit : Boolean);
    procedure SetDataARItems(ANoAR: String; ABaris: Integer; AIsEdit: Boolean);
    procedure UpdateAPChequeOtems;
    procedure UpdateBankCashOutARItems;
    function ValidateData: Boolean;
    property CDSOrganisasi: tclientDataSet read GetCDSOrganisasi write
        FCDSOrganisasi;
    property DCAP: TcxGridDataController read GetDCAP;
    property DCAR: TcxGridDataController read GetDCAR;
    property DCOther: TcxGridDataController read GetDCOther;
    property DCCheque: TcxGridDataController read GetDCCheque;
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
    property CDSRekening: TClientDataset read FCDSRekening write FCDSRekening;
  end;

var
  frmDialogBankCashOut: TfrmDialogBankCashOut;

implementation

{$R *.dfm}

procedure TfrmDialogBankCashOut.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if not IsBisaHapus then  Exit;
  if DMClient.CrudBankCashOutClient.DeleteFromDB(BCO) then
  begin
    Self.ModalResult := mrOk;
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
  if not ValidateData then exit;

  BCO.BCO_NoBukti     := edNoBukti.Text;
  BCO.BCO_Bank        := TModBank.CreateID(cbbBank.EditValueRest);
  BCO.BCO_Keterangan  := memDesc.Text;
  BCO.BCO_Organization:= TModOrganization.CreateID(FOrganization.ID);
  BCO.BCO_TotalOther  := cxGridTableOther.DataController.GetFooterSummaryFloat(cxGridColOtherBayar);
  BCO.BCO_Tanggal     := dtTanggal.Date;
  BCO.BCO_Total       := edSummaryAll.Value;
  BCO.BCO_TotalHutang := cxGridTableAPList.DataController.GetFooterSummaryFloat(cxGridColAPBayar);

  UpdateBankCashOutAPItems;
  UpdateBankCashOutARItems;
  UpdateBankCashOutOtherItems;
  UpdateAPChequeOtems;

  try
    sID := DMClient.CrudBankCashOutClient.SaveToDBID(BCO);
    if sID <> '' then
    begin
      FreeAndNil(FBCO);
      FBCO := DMClient.CrudBankCashOutClient.Retrieve(TModBankCashOut.ClassName,sID) as TModBankCashOut;
      edNoBukti.Text := FBCO.BCO_NoBukti;
      Self.ModalResult := mrOk;
    end;

    TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
  except
    TAppUtils.Error(ER_INSERT_FAILED);
    raise;
  end;


end;

procedure TfrmDialogBankCashOut.FormCreate(Sender: TObject);
begin
  inherited;
  dtTanggal.Date := Now;

  InisialisasiBank;
  InisialisasiRekening;
  InisialisasiRekeningLain;
  InisialisasiCostCenter;

  if TRetno.SettingApp.DEFAULT_BANK_BCO <> nil then
    cbbBank.EditValue := TRetno.SettingApp.DEFAULT_BANK_BCO.ID;
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

procedure TfrmDialogBankCashOut.CetakSlip(APeriodeAwal, APeriodeAkhir:
    TDatetime; ANoBukti : String);
begin
  with DMReport do
  begin
    AddReportVariable('UserCetak', 'USER');
    ExecuteReport('reports/BCO_Slip' ,ReportClient.BankCashOut_GetDS_Slip(APeriodeAwal, APeriodeAkhir, ANoBukti), ['BCO','BCO_DETAIL','BCO_CHEQUE']);
  end;
end;

procedure TfrmDialogBankCashOut.cxGridColAPAPPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if FCDSAP = nil then
    Exit;

  SetDataAPItems(FCDSAP.FieldByName('AP_REfnum').AsString,cxGridTableAPList.RecordIndex, False);
  cxGridTableAPList.DataController.Post;

end;

procedure TfrmDialogBankCashOut.cxGridColAPAPPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  if VarIsNull(DisplayValue) then
    Exit;

  if VarToStr(DisplayValue) = '' then
    Exit;

  
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

procedure TfrmDialogBankCashOut.cxGridColPotagARPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  SetDataARItems(FCDSAR.FieldByName('AR_REfnum').AsString,cxGridTablePotongTagihan.RecordIndex, False);
  cxGridTablePotongTagihan.DataController.Post;
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

procedure TfrmDialogBankCashOut.cxGridTableChequeDataControllerAfterInsert(
  ADataController: TcxCustomDataController);
begin
  inherited;
  IsiDefaultNominalCheque;
end;

procedure TfrmDialogBankCashOut.cxGridTableChequeDataControllerAfterPost(
  ADataController: TcxCustomDataController);
begin
  inherited;
  HitungSummary;
end;

procedure TfrmDialogBankCashOut.cxGridTableChequeDataControllerBeforeInsert(
  ADataController: TcxCustomDataController);
begin
  inherited;
//  IsiDefaultNominalCheque;    block fma
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

procedure TfrmDialogBankCashOut.cxGridTablePotongTagihanDataControllerAfterDelete(
  ADataController: TcxCustomDataController);
begin
  inherited;
  HitungSummary;
end;

procedure TfrmDialogBankCashOut.cxGridTablePotongTagihanDataControllerAfterPost(
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

procedure TfrmDialogBankCashOut.FormKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
  inherited;
  if Key in [VK_F1, VK_F2, VK_F3, VK_F4] then
    cxgrdDetail.SetFocus;

  case Key of
    VK_F1 : cxgrdDetail.FocusedView := cxGridTableAPList;
    VK_F2 : cxgrdDetail.FocusedView := cxGridTablePotongTagihan;
    VK_F3 : cxgrdDetail.FocusedView := cxGridTableOther;
    VK_F4 : cxgrdDetail.FocusedView := cxGridTableCheque;
  end;
//  if ssAlt in Shift then
//  begin
//    case Key of
//      Ord('G') : LookupDO;
//      Ord('C') : LookupCN;
//      Ord('D') : LookupDN;
//      Ord('K') : LookupCS;
//    end;
//  end;
end;

function TfrmDialogBankCashOut.GetBCO: TModBankCashOut;
begin
  if FBCO = nil then
    FBCO := TModBankCashOut.Create;

  Result := FBCO;
end;

function TfrmDialogBankCashOut.GetCDSOrganisasi: tclientDataSet;
begin
  if FCDSOrganisasi = nil then
    FCDSOrganisasi := TDBUtils.DSToCDS(DMClient.DSProviderClient.Organization_GetDSLookup(), Self);

  Result := FCDSOrganisasi;
end;

function TfrmDialogBankCashOut.GetDCAP: TcxGridDataController;
begin
  Result := cxGridTableAPList.DataController;
end;

function TfrmDialogBankCashOut.GetDCAR: TcxGridDataController;
begin
  Result := cxGridTablePotongTagihan.DataController;
end;

function TfrmDialogBankCashOut.GetDCOther: TcxGridDataController;
begin
  Result := cxGridTableOther.DataController;
end;

function TfrmDialogBankCashOut.GetDCCheque: TcxGridDataController;
begin
  Result := cxGridTableCheque.DataController;
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

  dTotal := -1 * cxGridTablePotongTagihan.DataController.GetFooterSummaryFloat(cxGridColPotagBayar);
  edSummaryAll.Value := edSummaryAll.Value + dTotal;
  lvSumary.Items[2].SubItems[0] := FormatFloat(',0.00;(,0.00)',dTotal);

  dTotal := cxGridTableCheque.DataController.GetFooterSummaryFloat(cxGridColChequeBayar);
  lvCheque.Items[0].SubItems[0] := FormatFloat(',0.00;(,0.00)',dTotal);
end;

procedure TfrmDialogBankCashOut.InisialisasiBank;
begin
  FreeAndNil(FCDSBank);


  FCDSBank := TDBUtils.DSToCDS( DMClient.DSProviderClient.Bank_GetDSLookup, Self );

  cbbBank.Properties.LoadFromCDS(CDSBank,'Bank_ID','Bank_Code',['Bank_ID'],Self);
  cbbBank.Properties.SetMultiPurposeLookup;
end;

procedure TfrmDialogBankCashOut.InisialisasiAPList(AOrgID : String);
begin
  FCDSAP := TDBUtils.DSToCDS(DMClient.DSProviderClient.AP_GetDSLookUpPerOrganization(AOrgID), Self, False);
  TcxExtLookupComboBoxProperties(cxGridTableAPList.Columns[cxGridColAPAP.Index].Properties).LoadFromCDS(FCDSAP,'AP_id','AP_REfnum',['ap_id','ap_rekening_id','ap_organization_id'],Self);
  TcxExtLookupComboBoxProperties(cxGridTableAPList.Columns[cxGridColAPAP.Index].Properties).SetMultiPurposeLookup;
end;

procedure TfrmDialogBankCashOut.InisialisasiARList(AOrgID : String);
begin
  FCDSAR := TDBUtils.DSToCDS(DMClient.DSProviderClient.AR_GetDSLookUpPerOrganization(AOrgID), Self, False);
  TcxExtLookupComboBoxProperties(cxGridColPotagAR.Properties).LoadFromCDS(FCDSAR,'AR_id','AR_REfnum',['aR_id','aR_rekening_id','aR_organization_id'],Self);
  TcxExtLookupComboBoxProperties(cxGridColPotagAR.Properties).SetMultiPurposeLookup;
end;

procedure TfrmDialogBankCashOut.InisialisasiRekening;
begin
  FreeAndNil(FCDSRekening);

  FCDSRekening := TDBUtils.DSToCDS( DMClient.DSProviderClient.Rekening_GetDSLookup, Self );

  TcxExtLookup(cxGridColAPRekening.Properties).LoadFromCDS(
    FCDSRekening, 'REKENING_ID','REK_NAME', Self
  );
  TcxExtLookup(cxGridColAPRekeningID.Properties).LoadFromCDS(
    FCDSRekening, 'REKENING_ID','REK_CODE', Self
  );
  TcxExtLookup(cxGridColPotagRekening.Properties).LoadFromCDS(
    FCDSRekening, 'REKENING_ID','REK_NAME', Self
  );
  TcxExtLookup(cxGridColPotagRekeningID.Properties).LoadFromCDS(
    FCDSRekening, 'REKENING_ID','REK_CODE', Self
  );
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

procedure TfrmDialogBankCashOut.IsiDefaultNominalCheque;
var
  dTotalAP: Double;
  dTotalCheque: Double;
begin
  dTotalCheque := cxGridTableCheque.DataController.GetFooterSummaryFloat(cxGridColChequeBayar);
  dTotalAP     := edSummaryAll.Value;

  cxGridTableCheque.SetValue(cxGridTableCheque.RecordIndex, cxGridColChequeBayar.Index,dTotalAP - dTotalCheque);
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
  LoadDataBankCashOutARItems;
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
    cxGridTableAPList.SetValue(ABaris, cxGridColAPRekening.Index, FCDSAP.FieldByName('AP_REKENING_ID').AsString);
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

procedure TfrmDialogBankCashOut.LoadDataBankCashOutARItems;
var
  I: Integer;
begin
  cxGridTablePotongTagihan.ClearRows;
  for I := 0 to BCO.BCO_BankCashOutARItems.Count - 1 do
  begin
    cxGridTablePotongTagihan.DataController.AppendRecord;
    cxGridTablePotongTagihan.SetObjectData(BCO.BCO_BankCashOutARItems[i], i);
    SetDataARItems(BCO.BCO_BankCashOutARItems[i].BCOAR_AR.ID,i, True);
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
  InisialisasiARList(FOrganization.ID);
end;

procedure TfrmDialogBankCashOut.SetDataARItems(ANoAR: String; ABaris: Integer;
    AIsEdit: Boolean);
var
  dSisa: Double;
begin
  if FCDSAR = nil then exit;
  try
    FCDSAR.Filter := ' AR_REfnum = ' + QuotedStr(ANoAR);
    FCDSAR.Filter := FCDSAR.Filter + ' or AR_ID = ' + QuotedStr(ANoAR);
    FCDSAR.Filtered := True;

//    ABaris := cxGridTableAPList.DataController.FocusedRecordIndex;
    cxGridTablePotongTagihan.SetValue(ABaris, cxGridColPotagTgl.Index, FCDSAR.FieldByName('ar_transdate').AsDateTime);
    cxGridTablePotongTagihan.SetValue(ABaris, cxGridColPotagDueDate.Index, FCDSAR.FieldByName('ar_duedate').AsDateTime);
    cxGridTablePotongTagihan.SetValue(ABaris, cxGridColPotagRekening.Index, FCDSAR.FieldByName('Ar_REKENING_ID').AsString);
    cxGridTablePotongTagihan.SetValue(ABaris, cxGridColPotagRekeningID.Index, FCDSAR.FieldByName('Ar_REKENING_ID').AsString);
    cxGridTablePotongTagihan.SetValue(ABaris, cxGridColPotagNominal.Index, FCDSAR.FieldByName('ar_total').AsFloat);

    dSisa := FCDSAR.FieldByName('ar_total').AsFloat - FCDSAR.FieldByName('ar_paid').AsFloat;
    if AIsEdit then
    begin
      dSisa := dSisa + cxGridTablePotongTagihan.Double(ABaris, cxGridColPotagBayar.Index);
    end else begin
      cxGridTablePotongTagihan.SetValue(ABaris, cxGridColPotagBayar.Index, dSisa);
    end;

    cxGridTablePotongTagihan.SetValue(ABaris, cxGridColPotagSisa.Index, dSisa);
  finally
    FCDSAR.Filtered := False;
  end;
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

procedure TfrmDialogBankCashOut.UpdateBankCashOutARItems;
var
  I: Integer;
  lModBankCashOutARItem: TModBankCashOutARItem;
begin
  BCO.BCO_BankCashOutARItems.Clear;
  for I := 0 to cxGridTablePotongTagihan.DataController.RecordCount - 1 do
  begin
    lModBankCashOutARItem := TModBankCashOutARItem.Create;
    cxGridTablePotongTagihan.LoadObjectData(lModBankCashOutARItem, i);
    BCO.BCO_BankCashOutARItems.Add(lModBankCashOutARItem);
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

function TfrmDialogBankCashOut.ValidateData: Boolean;
var
  i: Integer;
  j: Integer;
begin
  Result := False;

  if not ValidateEmptyCtrl([1]) then
    Exit;

  if FOrganization = nil then
  begin
    TAppUtils.Error('Organisasi Belum Dipilih');
    Exit;
  end;

//  if (cxGridTablePotongTagihan.DataController.GetFooterSummaryFloat(cxGridColPotagBayar) = 0)
//    and (edSummaryAll.Value <= 0) then
//  begin
//    TAppUtils.Error('Total Pembayaran Harus > 0');
//    Exit;
//  end;

  if (cxGridTablePotongTagihan.DataController.GetFooterSummaryFloat(cxGridColPotagBayar) > 0)  then
  begin
    if (edSummaryAll.Value < 0) then
    begin
      TAppUtils.Error('Total Pembayaran tidak boleh < 0');
      Exit;
    end;
  end else if (edSummaryAll.Value <= 0) then
  begin
    TAppUtils.Error('Total Pembayaran tidak boleh <= 0');
    Exit;
  end;

  for i := 0 to DCAP.RecordCount-1 do
  begin
    if (DCAP.Values[i, cxGridColAPSisa.Index]- DCAP.Values[i, cxGridColAPBayar.Index]) < -1 then
    begin
      TAppUtils.Error('Nominal bayar AP melebihi sisa nya, baris : ' + inttostr(i+1));
      exit;
    end;
    if (DCAP.Values[i, cxGridColAPBayar.Index] <= 0) then
    begin
      TAppUtils.Error('Nominal bayar AP tidak boleh <= 0, baris : ' + inttostr(i+1));
      exit;
    end;
    for j := 0 to DCAP.RecordCount-1 do
    begin
      if (i=j) then continue;
      if DCAP.Values[i, cxGridColAPAP.Index] = DCAP.Values[j, cxGridColAPAP.Index] then
      begin
        TAppUtils.Error('Klaim AP sama antara baris ' + inttostr(i+1) + ' dengan ' + inttostr(j+1));
        exit;
      end;
    end;
  end;

  for i := 0 to DCAR.RecordCount-1 do
  begin
    if (DCAR.Values[i, cxGridColPotagSisa.Index]- DCAR.Values[i, cxGridColPotagBayar.Index]) < -1 then
    begin
      TAppUtils.Error('Nominal bayar Tagihan melebihi sisa nya, baris : ' + inttostr(i+1));
      exit;
    end;
    if (DCAR.Values[i, cxGridColPotagBayar.Index] <= 0) then
    begin
      TAppUtils.Error('Nominal bayar Tagihan tidak boleh <= 0, baris : ' + inttostr(i+1));
      exit;
    end;
    for j := 0 to DCAR.RecordCount-1 do
    begin
      if (i=j) then continue;
      if DCAR.Values[i, cxGridColPotagAR.Index] = DCAR.Values[j, cxGridColPotagAR.Index] then
      begin
        TAppUtils.Error('Potong tagihan sama antara baris ' + inttostr(i+1) + ' dengan ' + inttostr(j+1));
        exit;
      end;
    end;
  end;

  for i := 0 to DCOther.RecordCount-1 do
  begin
    if VarToFLoat(DCOther.Values[i, cxGridColOtherBayar.Index]) = 0 then
    begin
      TAppUtils.Error('Nominal bayar lain-lain tidak boleh = 0, baris : ' + inttostr(i+1));
      exit;
    end;
  end;

  for i := 0 to DCCheque.RecordCount-1 do
  begin
    if VarToFLoat(DCCheque.Values[i, cxGridColChequeBayar.Index]) <= 0 then
    begin
      TAppUtils.Error('Nominal cheque tidak boleh <= 0, baris : ' + inttostr(i+1));
      exit;
    end;
  end;

  if not Result then Result := True;
end;

end.
