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
  uDBUtils, uModBank, uAppUtils, uInterface, uModelHelper;

type
  TfrmDialogBankCashOut = class(TfrmMasterDialog, ICRUDAble)
    pnlDetail2: TPanel;
    cbbBank: TcxExtLookupComboBox;
    lvSumary: TcxListView;
    lvCheque: TcxListView;
    edOrganizationName: TcxButtonEdit;
    edNoBukti: TcxButtonEdit;
    edSummaryAll: TcxCurrencyEdit;
    edOrganization: TcxButtonEdit;
    dtTanggal: TcxDateEdit;
    memDesc: TcxMemo;
    lbl24: TcxLabel;
    lbl13: TcxLabel;
    lbl1: TcxLabel;
    lbl17: TcxLabel;
    lbl7: TcxLabel;
    lbl15: TcxLabel;
    lbl12: TcxLabel;
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
  private
    FBCO: TModBankCashOut;
    FCDSAP: TClientDataset;
    FCDSBank: TClientDataset;
    FOrganization: TModOrganization;
    function GetBCO: TModBankCashOut;
    procedure HitungSummary;
    procedure InisialisasiBank;
    procedure InisialisasiAPList(AOrgID : String);
    procedure LoadDataOrganization(AKode : String);
    procedure UpdateBankCashOutAPItems;
    { Private declarations }
  protected
    procedure LoadData(AID : String);
    property BCO: TModBankCashOut read GetBCO write FBCO;
  public
    { Public declarations }
  published
    property CDSBank: TClientDataset read FCDSBank write FCDSBank;
  end;

var
  frmDialogBankCashOut: TfrmDialogBankCashOut;

implementation

{$R *.dfm}

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

  BCO.BCO_NoBukti     := edNoBukti.Text;
  BCO.BCO_Bank        := TModBank.CreateID(cbbBank.EditValueRest);
  BCO.BCO_Keterangan  := memDesc.Text;
  BCO.BCO_Organization:= TModOrganization.CreateID(FOrganization.ID);
  BCO.BCO_TotalOther  := cxGridTableOther.DataController.GetFooterSummaryFloat(cxGridColOtherBayar);
  BCO.BCO_Tanggal     := dtTanggal.Date;
  BCO.BCO_Total       := edSummaryAll.Value;
  BCO.BCO_TotalHutang := cxGridTableAPList.DataController.GetFooterSummaryFloat(cxGridColAPBayar);

  UpdateBankCashOutAPItems;

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
end;

procedure TfrmDialogBankCashOut.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FOrganization);
//  FreeAndNil(FBCO);
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
        LoadDataOrganization(edOrganization.Text);
      end;
    Finally
      free;
    End;
  end;
end;

procedure TfrmDialogBankCashOut.cxGridColAPAPPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  dSisa: Double;
  iBaris: Integer;
begin
  inherited;
  if VarIsNull(DisplayValue) then
    Exit;

  if VarToStr(DisplayValue) = '' then
    Exit;

  if FCDSAP = nil then
    Exit;

  try
    FCDSAP.Filter   := ' AP_REfnum = ' + QuotedStr(DisplayValue);
    FCDSAP.Filtered := True;

    iBaris := cxGridTableAPList.DataController.FocusedRecordIndex;
    cxGridTableAPList.SetValue(iBaris, cxGridColAPTanggal.Index, FCDSAP.FieldByName('ap_transdate').AsDateTime);
    cxGridTableAPList.SetValue(iBaris, cxGridColAPJatuhTempo.Index, FCDSAP.FieldByName('ap_duedate').AsDateTime);
    cxGridTableAPList.SetValue(iBaris, cxGridColAPRekening.Index, FCDSAP.FieldByName('rek_code').AsString);
    cxGridTableAPList.SetValue(iBaris, cxGridColAPRekeningID.Index, FCDSAP.FieldByName('AP_REKENING_ID').AsString);

    cxGridTableAPList.SetValue(iBaris, cxGridColAPNominal.Index, FCDSAP.FieldByName('ap_total').AsFloat);

    dSisa := FCDSAP.FieldByName('ap_total').AsFloat - FCDSAP.FieldByName('ap_paid').AsFloat;
    cxGridTableAPList.SetValue(iBaris, cxGridColAPSisa.Index, dSisa);
    cxGridTableAPList.SetValue(iBaris, cxGridColAPBayar.Index, dSisa);
  finally
    FCDSAP.Filtered := False;
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

procedure TfrmDialogBankCashOut.edOrganizationPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  FreeAndNil(FOrganization);
  LoadDataOrganization(VarToStr(DisplayValue));
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

procedure TfrmDialogBankCashOut.LoadData(AID : String);
var
  I: Integer;
begin
//  ClearByTag([0,1]);
  if AID = '' then
    Exit;

  FreeAndNil(FBCO);
  FBCO := TModBankCashOut(DMClient.CrudBankCashOutClient.Retrieve(TModBankCashOut.ClassName, AID));
  edNoBukti.Text := BCO.BCO_NoBukti;
  dtTanggal.Date := BCO.BCO_Tanggal;

  BCO.BCO_Organization.Reload();

  edOrganization.Text := BCO.BCO_Organization.ORG_Code;
  LoadDataOrganization(BCO.BCO_Organization.ORG_Code);
  cbbBank.EditValue := BCO.BCO_Bank.ID;
  memDesc.Text := BCO.BCO_Keterangan;

  cxGridTableAPList.ClearRows;
  for I := 0 to BCO.BCO_BankCashOutAPItems.Count - 1 do
  begin
    cxGridTableAPList.DataController.AppendRecord;
    cxGridTableAPList.SetObjectData(BCO.BCO_BankCashOutAPItems[i], i);
  end;
end;


procedure TfrmDialogBankCashOut.LoadDataOrganization(AKode : String);
begin
  edOrganizationName.Text := '';

  FOrganization := DMClient.CrudClient.RetrieveByCode(TModOrganization.ClassName,  AKode) as TModOrganization;
  if FOrganization <> nil then
    edOrganizationName.Text := FOrganization.ORG_Name;

  InisialisasiAPList(FOrganization.ID);
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

end.
