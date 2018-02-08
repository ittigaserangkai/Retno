unit ufrmDialogCashIn;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxPCdxBarPopupMenu, cxStyles, Menus, cxContainer,
  cxEdit, cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData, ImgList,
  dxBar, cxDBEditRepository, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, DBClient, cxCheckBox,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, StdCtrls, cxLabel,
  cxButtons, cxGridLevel, cxPC, ComCtrls, cxMemo, cxCurrencyEdit, cxButtonEdit,
  cxListView, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
  cxSpinEdit, dxCore, cxDateUtils, dxBarBuiltInMenu, cxNavigator, uDMClient,
  uModBankCashIn, uModOrganization, uInterface;

type
  TfrmDialogCashIn = class(TfrmMasterDialog, ICRUDAble)
    pnlDetail2: TPanel;
    cbBank: TcxExtLookupComboBox;
    lvSumary: TcxListView;
    lvCheque: TcxListView;
    edRefNum: TcxButtonEdit;
    edReceiveNum: TcxButtonEdit;
    ceNominal: TcxCurrencyEdit;
    ceSummaryDetail: TcxCurrencyEdit;
    beBusinessPartner: TcxButtonEdit;
    deReceiveDate: TcxDateEdit;
    lblRef: TcxLabel;
    lbl12: TcxLabel;
    lblTglBukti: TcxLabel;
    lbl15: TcxLabel;
    lblOrg: TcxLabel;
    lblNoBukti: TcxLabel;
    lbl7: TcxLabel;
    memDesc: TcxMemo;
    cxgrdlvlDetail: TcxGridLevel;
    cxgrdDetail: TcxGrid;
    cxGridTableAR: TcxGridTableView;
    cxgrdlvlNewAP: TcxGridLevel;
    cxGridTableNewAP: TcxGridTableView;
    cxgrdlvlOI: TcxGridLevel;
    cxGridTableOI: TcxGridTableView;
    cxgrdlvlCheque: TcxGridLevel;
    cxGridDBTableCheque: TcxGridDBTableView;
    cxGridColGridTableARColumn1: TcxGridColumn;
    cxGridColGridTableARColumn2: TcxGridColumn;
    cxGridColGridTableARColumn3: TcxGridColumn;
    cxGridColGridTableARColumn4: TcxGridColumn;
    cxGridColGridTableARColumn5: TcxGridColumn;
    cxGridColGridTableARColumn6: TcxGridColumn;
    cxGridColGridTableARColumn7: TcxGridColumn;
    cxGridColGridTableARColumn8: TcxGridColumn;
    cxGridColGridTableNewAPColumn1: TcxGridColumn;
    cxGridColGridTableNewAPColumn2: TcxGridColumn;
    cxGridColGridTableNewAPColumn3: TcxGridColumn;
    cxGridColGridTableNewAPColumn4: TcxGridColumn;
    cxGridColGridTableNewAPColumn5: TcxGridColumn;
    cxGridColGridTableOIColumn1: TcxGridColumn;
    cxGridColGridTableOIColumn2: TcxGridColumn;
    cxGridColGridTableOIColumn3: TcxGridColumn;
    cxGridColGridTableOIColumn4: TcxGridColumn;
    cxGridColGridDBTableChequeColumn1: TcxGridDBColumn;
    cxGridColGridDBTableChequeColumn2: TcxGridDBColumn;
    cxGridColGridDBTableChequeColumn3: TcxGridDBColumn;
    cxGridColGridDBTableChequeColumn4: TcxGridDBColumn;
    edNamaOrganization: TcxButtonEdit;
    cxGridColGridTableNewAPColumn6: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure beBusinessPartnerExit(Sender: TObject);
    procedure beBusinessPartnerPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure beBusinessPartnerPropertiesEditValueChanged(Sender: TObject);
  private
    FModCashIn: TModBankCashIn;
    FModOrganization: TModOrganization;
    function GetModCashIn: TModBankCashIn;
    procedure initLookUp;
    procedure LookUpOrganization;
    procedure SetOrganization(Aorg: TModOrganization);
    procedure UpdateData;
    function ValidateData: boolean;
    property ModCashIn: TModBankCashIn read GetModCashIn write FModCashIn;
    property ModOrganization: TModOrganization read FModOrganization write
        FModOrganization;
    { Private declarations }
  public
    procedure LoadData(aID: String);
    { Public declarations }
  end;

var
  frmDialogCashIn: TfrmDialogCashIn;

implementation

uses
  uModBank, uAppUtils, uDXUtils, ufrmLookupOrganization, uModelHelper;

{$R *.dfm}

procedure TfrmDialogCashIn.beBusinessPartnerPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  LookUpOrganization;
end;

procedure TfrmDialogCashIn.beBusinessPartnerPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
 



//  ModOrganization := Tcrud
end;

procedure TfrmDialogCashIn.FormCreate(Sender: TObject);
begin
  inherited;
  initLookUp;
end;

procedure TfrmDialogCashIn.actSaveExecute(Sender: TObject);
begin
  inherited;
  if not ValidateData then  exit;

  UpdateData;

  if DMClient.CrudBankCashInClient.SaveToDB(ModCashIn) Then
    TAppUtils.Information('Berhasil Simpan');

end;

procedure TfrmDialogCashIn.beBusinessPartnerExit(Sender: TObject);
begin
  inherited;
   freeandnil (FModOrganization);
//  ModOrganization := DMClient.CrudClient.RetrieveByCode(TModOrganization.ClassName, beBusinessPartner.Text) as TModOrganization;
  ModOrganization := TCRUDObj.RetrieveCode<TModOrganization>(beBusinessPartner.Text);
  //format :
  //model = TCrudObj.Retrieve<Classobject>(ID);
  if ModOrganization.ID = '' then
    TAppUtils.Warning('Kode Org ' + beBusinessPartner.Text + ' tidak ditemukan');

  SetOrganization(ModOrganization);
end;

function TfrmDialogCashIn.GetModCashIn: TModBankCashIn;
begin
  if not assigned (fModCashIn) then
    fModCashIn := TModBankCashIn.create;
  Result := FModCashIn;
end;

procedure TfrmDialogCashIn.initLookUp;
var
  LCDSBank: TDataset;
begin
   LCDSBank := DMClient.DSProviderClient.Bank_GetDSLookup();
   cbBank.Properties.LoadFromDS(LCDSBank, 'BANK_ID', 'BANK_NAME',['BANK_ID'], self);
end;

procedure TfrmDialogCashIn.LoadData(aID: String);
begin
  FModCashIN := TCrudObj.Retrieve<TModBankCashIn>(aID);
  edReceiveNum.Text := ModCashIn.BCI_NoBukti;
  memDesc.Text := ModCashIn.BCI_Keterangan;
  //TModBank.CreateID(vartostr(cbBank.EditValue)) := ModCashIn.BCI_Bank ;  (Masih Eror)
  edReceiveNum.Text := ModCashIn.BCI_NoBukti;
  ModOrganization := ModCashIn.BCI_Organization;
  edRefNum.Text := ModCashIn.BCI_Ref;
  deReceiveDate.Date := ModCashIn.BCI_Tanggal;
  ceNominal.Value := ModCashIn.BCI_Total;
  //lanjutkan
end;

procedure TfrmDialogCashIn.LookUpOrganization;
begin
  freeandnil (fModOrganization);
  ModOrganization := TfrmLookupOrganization.Lookup(1);
  SetOrganization(ModOrganization);
end;

procedure TfrmDialogCashIn.SetOrganization(Aorg: TModOrganization);
begin
if Aorg = nil then
    exit;
  beBusinessPartner.Text := Aorg.ORG_Code;
  edNamaOrganization.Text := Aorg.ORG_Name;
end;

procedure TfrmDialogCashIn.UpdateData;
begin
  if ModCashIn.ID = '' then
    edReceiveNum.Text := DMClient.CrudBankCashInClient.GenerateNoBukti();

  ModCashIn.BCI_Keterangan := memDesc.Text;
  ModCashIn.BCI_Bank := TModBank.CreateID(vartostr(cbBank.EditValue));
  ModCashIn.BCI_NoBukti := edReceiveNum.Text;
  ModCashIn.BCI_Organization := ModOrganization;
  ModCashIn.BCI_Ref := edRefNum.Text;
  ModCashIn.BCI_Tanggal := deReceiveDate.Date;
  ModCashIn.BCI_Total := ceNominal.Value;
//ModCashIn.BCI_Total_APNEW :=
//ModCashIn.BCI_Total_AR := lvSumary.Items[0] ;



  // TODO -cMM: TfrmDialogCashIn.UpdateData default body inserted
end;

function TfrmDialogCashIn.ValidateData: boolean;
begin
  Result := False;
  if deReceiveDate.Text ='' then
  begin TAppUtils.Warning('Tanggal Tidak Boleh Kosong');
  exit;
  end;

  if beBusinessPartner.Text ='' then
  begin TAppUtils.Warning('Kode Tidak Boleh Kosong');
  exit;
  end;

  if cbBank.Text ='' then
  begin TAppUtils.Warning('Bank Tidak Boleh Kosong');
  exit;
  end;

  if ceNominal.Value <= 0 then
  begin TAppUtils.Warning('Nominal Tidak Boleh Nol');
  exit;
  end;

Result := True;
  // TODO -cMM: TfrmDialogCashIn.ValidateData default body inserted
end;

end.
