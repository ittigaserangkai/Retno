unit ufrmSetupCashManagement;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, ufraFooter5Button, Mask, DB,
  ActnList, System.Actions, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
  cxTextEdit, cxMaskEdit, cxCalendar;

type
  TStatusForm = (frNew, frEdit);
  TfrmSetupCashManagement = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    pnlTop: TPanel;
    lbl1: TLabel;
    cbbBulan: TComboBox;
    lbl2: TLabel;
    medtTahun: TMaskEdit;
    edtPeriode: TEdit;
    lbl3: TLabel;
    dtLastProcess: TcxDateEdit;
    lbl4: TLabel;
    cbpConsolidation: TcxExtLookupComboBox;
    edtConsolidation: TEdit;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    edtAccPettyCashDesc: TEdit;
    edtAccCashInTransitDesc: TEdit;
    edtAccBackInTransitDesc: TEdit;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    edtAccSuplierCreditDesc: TEdit;
    edtAccKonsinyasiDesc: TEdit;
    edtAccKontrabonDesc: TEdit;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    edtAccPsTradisonalDesc: TEdit;
    edtAccInternalUseDesc: TEdit;
    edtAccsuplierBakeryDesc: TEdit;
    edtAccDistribusiDesc: TEdit;
    edtAccKepalaKasirDesc: TEdit;
    edtAccKepalaKasir: TEdit;
    edtAccPettyCash: TEdit;
    edtAccCashInTransit: TEdit;
    edtAccBackInTransit: TEdit;
    edtAccSuplierCredit: TEdit;
    edtAccKonsinyasi: TEdit;
    edtAccKontrabon: TEdit;
    edtAccPsTradisional: TEdit;
    edtAccInternalUse: TEdit;
    edtAccSuplierBakery: TEdit;
    edtAccDistribusi: TEdit;
    actlstSetupCashManagement: TActionList;
    actAddSetupCashManagement: TAction;
    actEditSetupCashManagement: TAction;
    actSaveSetupCashManagement: TAction;
    lbl5: TLabel;
    edtPPNMasukan: TEdit;
    edtAccPPNMasukan: TEdit;
    lbl17: TLabel;
    edtPPNBM: TEdit;
    edtAccPPNBM: TEdit;
    lbl18: TLabel;
    edtPPNKeluaran: TEdit;
    edtAccPPNKeluaran: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure cbbBulanKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure medtTahunKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbpConsolidationKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtAccKepalaKasirKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtAccPettyCashKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtAccCashInTransitKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtAccBackInTransitKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtAccSuplierCreditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtAccKonsinyasiKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtAccKontrabonKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtAccPsTradisionalKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtAccInternalUseKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtAccSuplierBakeryKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtAccDistribusiKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actAddSetupCashManagementExecute(Sender: TObject);
    procedure actEditSetupCashManagementExecute(Sender: TObject);
    procedure actSaveSetupCashManagementExecute(Sender: TObject);
    procedure dtLastProcessKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure edtPPNMasukanKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPPNBMKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPPNKeluaranKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FRekeningKode: string;
    FRekeningDesc: string;
    FIsProcessSuccessfull: Boolean;
    FIdConsolidation, FIdAccKepalaKasir, FIdAccPettyCash: Integer;
    FIdAccCashInTransit, FIdAccBackInTransit, FIdAccSuplierCredit: Integer;
    FIdAccKonsinyasi, FIdAccKontraBon, FIdAccPsTradisonal: Integer;
    FIdAccInternalUse, FIdAccSuplierBakery, FidAccDistribusi: Integer;
    FIdAccPPNMasukan, FIdAccPPNBM, FIdAccPPNKeluaran: Integer;
    FStatusForm: TStatusForm;
    function GetListCompany(): TDataSet;
    function GetListRekeningByCompanyId(ACompId: string): TDataSet;
    function GetNamaRekeningByRekCode(ACompId, ARekCode: string): TDataSet;
    function GetDataSetupCashManagementByGroup(AGroup: string): TDataSet;
    function LoadNamaRekeningByRekCode(ACode: string): string;
    function CekIsGroupCashManagementExist(AGroup: string): Boolean;
    function GetCompanyCodeByCompanyId(AId: string): string;
    function SaveDataSetupCashManagement: Boolean;
    function UpdateDatasetupCashManagement: Boolean;
    procedure ParseDataConsolidationTo;
    procedure ParseDataSetupCashManagement;
    procedure LoadPopupSearchRekening;
    procedure SetComponentClear;
    procedure SetComponentDisable;
    procedure SetComponentEnable;
    procedure SetRekeningDesc(const Value: string);
    procedure SetRekeningKode(const Value: string);
    procedure SetIsProcessSuccessfull(const Value: Boolean);
    procedure SetStatusForm(const Value: TStatusForm);
  public
    property RekeningKode: string read FRekeningKode write SetRekeningKode;
    property RekeningDesc: string read FRekeningDesc write SetRekeningDesc;
    property IsProcessSuccessfull: Boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
    property StatusForm: TStatusForm read FStatusForm write SetStatusForm;
  end;

const
  CONSOLODATION_TO_CM = 'CONSOLIDATION_TO_CM';
  ACC_KEPALA_KASIR_CM = 'ACC_KEPALA_KASIR_CM';
  ACC_PETTY_CASH_CM = 'ACC_PETTY_CASH_CM';
  ACC_CASH_IN_TRANSIT_CM = 'ACC_CASH_IN_TRANSIT_CM';
  ACC_BACK_IN_TRANSIT_CM = 'ACC_BACK_IN_TRANSIT_CM';
  ACC_SUPLIER_CREDIT_CM = 'ACC_SPULIER_CREDIT_CM';
  ACC_KONSINYASI_CM = 'ACC_KONSINYASI_CM';
  ACC_CONTRA_BON_CM = 'ACC_CONTRA_BON_CM';
  ACC_PS_TRADISIONAL_CM = 'ACC_PS_TRADISIONAL_CM';
  ACC_INTERNAL_USE_CM = 'ACC_INTERNAL_USE_CM';
  ACC_SUPLIER_BAKERY_CM = 'ACC_SUPLIER_BAKERY_CM';
  ACC_DISTRIBUSI_CM = 'ACC_DISTRIBUSI_CM';
  ACC_PPN_MASUKAN = 'ACC_PPN_MASUKAN';
  ACC_PPNBM = 'ACC_PPNBM';
  ACC_PPN_KELUARAN = 'ACC_PPN_KELUARAN';
  ACC_GROUP_CM = 'CASH_MANAGEMENT';    

var
  frmSetupCashManagement: TfrmSetupCashManagement;

implementation

uses uConstanta, uTSCommonDlg;

{$R *.dfm}

procedure TfrmSetupCashManagement.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmSetupCashManagement.FormDestroy(Sender: TObject);
begin
  inherited;
  frmSetupCashManagement := nil;
  frmSetupCashManagement.Free;
end;

procedure TfrmSetupCashManagement.cbbBulanKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
    medtTahun.SetFocus;
end;

procedure TfrmSetupCashManagement.medtTahunKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
  begin
    case cbbBulan.ItemIndex of
      0: edtPeriode.Text := 'JANUARY ' + medtTahun.Text;
      1: edtPeriode.Text := 'FEBRUARY ' + medtTahun.Text;
      2: edtPeriode.Text := 'MARCH ' + medtTahun.Text;
      3: edtPeriode.Text := 'APRIL ' + medtTahun.Text;
      4: edtPeriode.Text := 'MAY ' + medtTahun.Text;
      5: edtPeriode.Text := 'JUNE ' + medtTahun.Text;
      6: edtPeriode.Text := 'JULY ' + medtTahun.Text;
      7: edtPeriode.Text := 'AUGUST ' + medtTahun.Text;
      8: edtPeriode.Text := 'SEPTEMBER ' + medtTahun.Text;
      9: edtPeriode.Text := 'OCTOBER ' + medtTahun.Text;
      10: edtPeriode.Text := 'NOVEMBER ' + medtTahun.Text;
      11: edtPeriode.Text := 'DECEMBER ' + medtTahun.Text;
    end;
    dtLastProcess.SetFocus;
  end;
end;

function TfrmSetupCashManagement.GetListCompany: TDataSet;
begin
//  if not Assigned(SetupCashManagement) then
//    SetupCashManagement := TSetupCashManagement.Create;
//
//  Result := SetupCashManagement.GetListCompany;
end;

function TfrmSetupCashManagement.GetListRekeningByCompanyId(
  ACompId: string): TDataSet;
begin
//
end;

procedure TfrmSetupCashManagement.ParseDataConsolidationTo;
var dataCompany: TDataSet;
begin
  dataCompany := GetListCompany;
  {
  with cbpConsolidation do
  begin
    ClearGridData;
    ColCount := 3;

    if not dataCompany.IsEmpty then
    begin
      RowCount := dataCompany.RecordCount + 1;
      AddRow(['Id', 'Company Code', 'Company Name']);

      while not dataCompany.Eof do
      begin
        AddRow([dataCompany.FieldByName('COMP_ID').AsString,
            dataCompany.FieldByName('COMP_CODE').AsString,
            dataCompany.FieldByName('COMP_NAME').AsString]);

        dataCompany.Next;
      end;
    end
    else
    begin
      RowCount := 2;
      AddRow(['1', ' ', ' ']);
    end;

    SizeGridToData;
    FixedRows := 1;
    Text := '';
  end;
  }
end;

procedure TfrmSetupCashManagement.cbpConsolidationKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
  begin
//    edtConsolidation.Text := cbpConsolidation.Cells[2, cbpConsolidation.Row];
    edtAccKepalaKasir.SetFocus;
  end;
end;

procedure TfrmSetupCashManagement.LoadPopupSearchRekening;
begin
  //lookup rekening/coa
  {if not Assigned(frmPopupSearchRekening) then
    frmPopupSearchRekening := TfrmPopupSearchRekening.Create(Application);

  frmPopupSearchRekening.DataRekening := GetListRekeningByCompanyId(IntToStr(MasterCompany.ID));
  frmPopupSearchRekening.ShowModal;

  RekeningKode := frmPopupSearchRekening.RekeningCode;
  RekeningDesc := frmPopupSearchRekening.RekeningDesc;

  frmPopupSearchRekening.Free;
  }
end;

procedure TfrmSetupCashManagement.SetRekeningDesc(const Value: string);
begin
  FRekeningDesc := Value;
end;

procedure TfrmSetupCashManagement.SetRekeningKode(const Value: string);
begin
  FRekeningKode := Value;
end;

procedure TfrmSetupCashManagement.edtAccKepalaKasirKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F5) then
  begin
    LoadPopupSearchRekening;
    edtAccKepalaKasir.Text := RekeningKode;
    edtAccKepalaKasirDesc.Text := RekeningDesc;
    edtAccPettyCash.SetFocus;
  end
  else if (Key = VK_RETURN) then
  begin
    if (LoadNamaRekeningByRekCode(edtAccKepalaKasir.Text) <> '') then
    begin
      edtAccKepalaKasirDesc.Text := LoadNamaRekeningByRekCode(edtAccKepalaKasir.Text);
      edtAccPettyCash.SetFocus;
    end
    else
      edtAccKepalaKasir.SetFocus;
  end;
end;

procedure TfrmSetupCashManagement.edtAccPettyCashKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F5) then
  begin
    LoadPopupSearchRekening;
    edtAccPettyCash.Text := RekeningKode;
    edtAccPettyCashDesc.Text := RekeningDesc;
    edtAccCashInTransit.SetFocus;
  end
  else if (Key = VK_RETURN) then
  begin
    if (LoadNamaRekeningByRekCode(edtAccPettyCash.Text) <> '') then
    begin
      edtAccPettyCashDesc.Text := LoadNamaRekeningByRekCode(edtAccPettyCash.Text);
      edtAccCashInTransit.SetFocus;
    end
    else
      edtAccPettyCash.SetFocus;
  end;
end;

procedure TfrmSetupCashManagement.edtAccCashInTransitKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F5) then
  begin
    LoadPopupSearchRekening;
    edtAccCashInTransit.Text := RekeningKode;
    edtAccCashInTransitDesc.Text := RekeningDesc;
    edtAccBackInTransit.SetFocus;
  end
  else if (Key = VK_RETURN) then
  begin
    if (LoadNamaRekeningByRekCode(edtAccCashInTransit.Text) <> '') then
    begin
      edtAccCashInTransitDesc.Text := LoadNamaRekeningByRekCode(edtAccCashInTransit.Text);
      edtAccBackInTransit.SetFocus;
    end
    else
      edtAccCashInTransit.SetFocus;
  end;
end;

procedure TfrmSetupCashManagement.edtAccBackInTransitKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F5) then
  begin
    LoadPopupSearchRekening;
    edtAccBackInTransit.Text := RekeningKode;
    edtAccBackInTransitDesc.Text := RekeningDesc;
    edtAccSuplierCredit.SetFocus;
  end
  else if (Key = VK_RETURN) then
  begin
    if (LoadNamaRekeningByRekCode(edtAccBackInTransit.Text) <> '') then
    begin
      edtAccBackInTransitDesc.Text := LoadNamaRekeningByRekCode(edtAccBackInTransit.Text);
      edtAccSuplierCredit.SetFocus;
    end
    else
      edtAccBackInTransit.SetFocus;
  end;
end;

procedure TfrmSetupCashManagement.edtAccSuplierCreditKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F5) then
  begin
    LoadPopupSearchRekening;
    edtAccSuplierCredit.Text := RekeningKode;
    edtAccSuplierCreditDesc.Text := RekeningDesc;
    edtAccKonsinyasi.SetFocus;
  end
  else if (Key = VK_RETURN) then
  begin
    if (LoadNamaRekeningByRekCode(edtAccSuplierCredit.Text) <> '') then
    begin
      edtAccSuplierCreditDesc.Text := LoadNamaRekeningByRekCode(edtAccSuplierCredit.Text);
      edtAccKonsinyasi.SetFocus;
    end
    else
      edtAccSuplierCredit.SetFocus;
  end;
end;

procedure TfrmSetupCashManagement.edtAccKonsinyasiKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F5) then
  begin
    LoadPopupSearchRekening;
    edtAccKonsinyasi.Text := RekeningKode;
    edtAccKonsinyasiDesc.Text := RekeningDesc;
    edtAccKontrabon.SetFocus;
  end
  else if (Key = VK_RETURN) then
  begin
    if (LoadNamaRekeningByRekCode(edtAccKonsinyasi.Text) <> '') then
    begin
      edtAccKonsinyasiDesc.Text := LoadNamaRekeningByRekCode(edtAccKonsinyasi.Text);
      edtAccKontrabon.SetFocus;
    end
    else
      edtAccKonsinyasi.SetFocus;
  end;
end;

procedure TfrmSetupCashManagement.edtAccKontrabonKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F5) then
  begin
    LoadPopupSearchRekening;
    edtAccKontrabon.Text := RekeningKode;
    edtAccKontrabonDesc.Text := RekeningDesc;
    edtAccPsTradisional.SetFocus;
  end
  else if (Key = VK_RETURN) then
  begin
    if (LoadNamaRekeningByRekCode(edtAccKontrabon.Text) <> '') then
    begin
      edtAccKontrabonDesc.Text := LoadNamaRekeningByRekCode(edtAccKontrabon.Text);
      edtAccPsTradisional.SetFocus;
    end
    else
      edtAccKontrabon.SetFocus;
  end;
end;

procedure TfrmSetupCashManagement.edtAccPsTradisionalKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F5) then
  begin
    LoadPopupSearchRekening;
    edtAccPsTradisional.Text := RekeningKode;
    edtAccPsTradisonalDesc.Text := RekeningDesc;
    edtAccInternalUse.SetFocus;
  end
  else if (Key = VK_RETURN) then
  begin
    if (LoadNamaRekeningByRekCode(edtAccPsTradisional.Text) <> '') then
    begin
      edtAccPsTradisonalDesc.Text := LoadNamaRekeningByRekCode(edtAccPsTradisional.Text);
      edtAccInternalUse.SetFocus;
    end
    else
      edtAccPsTradisional.SetFocus;
  end;
end;

procedure TfrmSetupCashManagement.edtAccInternalUseKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F5) then
  begin
    LoadPopupSearchRekening;
    edtAccInternalUse.Text := RekeningKode;
    edtAccInternalUseDesc.Text := RekeningDesc;
    edtAccSuplierBakery.SetFocus;
  end
  else if (Key = VK_RETURN) then
  begin
    if (LoadNamaRekeningByRekCode(edtAccInternalUse.Text) <> '') then
    begin
      edtAccInternalUseDesc.Text := LoadNamaRekeningByRekCode(edtAccInternalUse.Text);
      edtAccSuplierBakery.SetFocus;
    end
    else
      edtAccInternalUse.SetFocus;
  end;
end;

procedure TfrmSetupCashManagement.edtAccSuplierBakeryKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F5) then
  begin
    LoadPopupSearchRekening;
    edtAccSuplierBakery.Text := RekeningKode;
    edtAccsuplierBakeryDesc.Text := RekeningDesc;
    edtAccDistribusi.SetFocus;
  end
  else if (Key = VK_RETURN) then
  begin
    if (LoadNamaRekeningByRekCode(edtAccSuplierBakery.Text) <> '') then
    begin
      edtAccsuplierBakeryDesc.Text := LoadNamaRekeningByRekCode(edtAccSuplierBakery.Text);
      edtAccDistribusi.SetFocus;
    end
    else
      edtAccSuplierBakery.SetFocus;
  end;
end;

procedure TfrmSetupCashManagement.edtAccDistribusiKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F5) then
  begin
    LoadPopupSearchRekening;
    edtAccDistribusi.Text := RekeningKode;
    edtAccDistribusiDesc.Text := RekeningDesc;
  end
  else if (Key = VK_RETURN) then
  begin
    if (LoadNamaRekeningByRekCode(edtAccDistribusi.Text) <> '') then
    begin
      edtAccDistribusiDesc.Text := LoadNamaRekeningByRekCode(edtAccDistribusi.Text);
      edtPPNMasukan.SetFocus;
    end
    else
      edtAccDistribusi.SetFocus;
  end;
end;

function TfrmSetupCashManagement.GetNamaRekeningByRekCode(ACompId,
  ARekCode: string): TDataSet;
//var arrParam: TArr;
begin
  {if ARekCode = '' then
    SetLength(arrParam, 0)
  else
  begin
    SetLength(arrParam, 2);
    arrParam[0].tipe := ptString;
    arrParam[0].data := ACompId;
    arrParam[1].tipe := ptString;
    arrParam[1].data := ARekCode;
  end;

  if not Assigned(SetupCashManagement) then
    SetupCashManagement := TSetupCashManagement.Create;

  Result := SetupCashManagement.GetNamaRekeningByRekCode(arrParam);
  }
end;

function TfrmSetupCashManagement.LoadNamaRekeningByRekCode(
  ACode: string): string;
var dataNamaRekening: TDataSet;
    sResult: string;
begin
  dataNamaRekening := GetNamaRekeningByRekCode(IntToStr(MasterCompany.ID), ACode);

  if dataNamaRekening.IsEmpty then
  begin
    CommonDlg.ShowError(ACode + ' is ' + ER_NOT_FOUND + Chr(VK_RETURN) +
      'Press F5 To Search');
    sResult := '';
  end
  else
  begin
    sResult := dataNamaRekening.FieldByName('REK_NAME').AsString;
  end;  

  Result := sResult;
end;

function TfrmSetupCashManagement.CekIsGroupCashManagementExist(
  AGroup: string): Boolean;
var dataSetupCashManagement: TDataSet;
//    arrParam: TArr;
begin
  {if (AGroup = '') then
    SetLength(arrParam, 0)
  else
  begin
    SetLength(arrParam, 1);
    arrParam[0].tipe := ptString;
    arrParam[0].data := AGroup;
  end;

  if not Assigned(SetupCashManagement) then
    SetupCashManagement := TSetupCashManagement.Create;

  dataSetupCashManagement := SetupCashManagement.CekIsGroupCashManagementExist(arrParam);

  if dataSetupCashManagement.IsEmpty then
    Result := False
  else
    Result := True;
    }
end;

procedure TfrmSetupCashManagement.actAddSetupCashManagementExecute(
  Sender: TObject);
begin
  inherited;
  if Mastercompany.ID = 0 then
  begin
    CommonDlg.ShowError(ER_UNIT_OR_COMPANY_NOT_SPECIFIC);
    //frmMain.cbbCompCode.SetFocus;
    Exit;
  end;

//  if MasterNewUnit.ID = 0 then
  begin
    CommonDlg.ShowError(ER_UNIT_OR_COMPANY_NOT_SPECIFIC);
    //frmMain.cbbUnit.SetFocus;
    Exit;
  end;

  if CekIsGroupCashManagementExist(ACC_GROUP_CM) then
  begin
    CommonDlg.ShowError('Data already Exist, Please Do Edit');
    Exit;
  end;

  SetComponentEnable;
  ParseDataConsolidationTo;
  StatusForm := frNew;
end;

procedure TfrmSetupCashManagement.actEditSetupCashManagementExecute(
  Sender: TObject);
begin
  inherited;
  if Mastercompany.ID = 0 then
  begin
    CommonDlg.ShowError(ER_UNIT_OR_COMPANY_NOT_SPECIFIC);
    //frmMain.cbbCompCode.SetFocus;
    Exit;
  end;

//  if MasterNewUnit.ID = 0 then
  begin
    CommonDlg.ShowError(ER_UNIT_OR_COMPANY_NOT_SPECIFIC);
    //frmMain.cbbUnit.SetFocus;
    Exit;
  end;

  SetComponentEnable;
  ParseDataConsolidationTo;
  ParseDataSetupCashManagement;
  cbpConsolidation.Text := GetCompanyCodeByCompanyId(IntToStr(MasterCompany.ID));
  StatusForm := frEdit;
end;

procedure TfrmSetupCashManagement.actSaveSetupCashManagementExecute(
  Sender: TObject);
begin
  inherited;
  case StatusForm of
  frNew:
    begin
      IsProcessSuccessfull := SaveDataSetupCashManagement;
      if IsProcessSuccessfull then
      begin
        CommonDlg.ShowMessage(CONF_ADD_SUCCESSFULLY);
        SetComponentClear;
        SetComponentDisable;
      end
      else
      begin
        CommonDlg.ShowError(ER_INSERT_FAILED);
      end;
    end;  
  frEdit:
    begin
      IsProcessSuccessfull := UpdateDatasetupCashManagement;
      if IsProcessSuccessfull then
      begin
        CommonDlg.ShowMessage(CONF_EDIT_SUCCESSFULLY);
        SetComponentClear;
        SetComponentDisable;
      end
      else
      begin
        CommonDlg.ShowError(ER_UPDATE_FAILED);
      end;
    end;
  end;
end;

function TfrmSetupCashManagement.SaveDataSetupCashManagement: Boolean;
var bResult: Boolean;
//    arrParam: TArr;
begin
  {if not Assigned(SetupCashManagement) then
    SetupCashManagement := TSetupCashManagement.Create;

  try
    SetLength(arrParam, 5);
    arrParam[0].tipe := ptString;
    arrParam[0].data := CONSOLODATION_TO_CM;
    arrParam[1].tipe := ptString;
    arrParam[1].data := MasterCompany.ID;
    arrParam[2].tipe := ptString;
    arrParam[2].data := ACC_GROUP_CM;
    arrParam[3].tipe := ptString;
    arrParam[3].data := edtConsolidation.Text;
    arrParam[4].tipe := ptInteger;
    arrParam[4].data := FLoginId;
    SetupCashManagement.InsertDataSetupCashManagement(arrParam);
    SetLength(arrParam, 5);
    arrParam[0].tipe := ptString;
    arrParam[0].data := ACC_KEPALA_KASIR_CM;
    arrParam[1].tipe := ptString;
    arrParam[1].data := edtAccKepalaKasir.Text;
    arrParam[2].tipe := ptString;
    arrParam[2].data := ACC_GROUP_CM;
    arrParam[3].tipe := ptString;
    arrParam[3].data := edtAccKepalaKasirDesc.Text;
    arrParam[4].tipe := ptInteger;
    arrParam[4].data := FLoginId;
    SetupCashManagement.InsertDataSetupCashManagement(arrParam);
    SetLength(arrParam, 5);
    arrParam[0].tipe := ptString;
    arrParam[0].data := ACC_PETTY_CASH_CM;
    arrParam[1].tipe := ptString;
    arrParam[1].data := edtAccPettyCash.Text;
    arrParam[2].tipe := ptString;
    arrParam[2].data := ACC_GROUP_CM;
    arrParam[3].tipe := ptString;
    arrParam[3].data := edtAccPettyCashDesc.Text;
    arrParam[4].tipe := ptInteger;
    arrParam[4].data := FLoginId;
    SetupCashManagement.InsertDataSetupCashManagement(arrParam);
    SetLength(arrParam, 5);
    arrParam[0].tipe := ptString;
    arrParam[0].data := ACC_CASH_IN_TRANSIT_CM;
    arrParam[1].tipe := ptString;
    arrParam[1].data := edtAccCashInTransit.Text;
    arrParam[2].tipe := ptString;
    arrParam[2].data := ACC_GROUP_CM;
    arrParam[3].tipe := ptString;
    arrParam[3].data := edtAccCashInTransitDesc.Text;
    arrParam[4].tipe := ptInteger;
    arrParam[4].data := FLoginId;
    SetupCashManagement.InsertDataSetupCashManagement(arrParam);
    SetLength(arrParam, 5);
    arrParam[0].tipe := ptString;
    arrParam[0].data := ACC_BACK_IN_TRANSIT_CM;
    arrParam[1].tipe := ptString;
    arrParam[1].data := edtAccBackInTransit.Text;
    arrParam[2].tipe := ptString;
    arrParam[2].data := ACC_GROUP_CM;
    arrParam[3].tipe := ptString;
    arrParam[3].data := edtAccBackInTransitDesc.Text;
    arrParam[4].tipe := ptInteger;
    arrParam[4].data := FLoginId;
    SetupCashManagement.InsertDataSetupCashManagement(arrParam);
    SetLength(arrParam, 5);
    arrParam[0].tipe := ptString;
    arrParam[0].data := ACC_SUPLIER_CREDIT_CM;
    arrParam[1].tipe := ptString;
    arrParam[1].data := edtAccSuplierCredit.Text;
    arrParam[2].tipe := ptString;
    arrParam[2].data := ACC_GROUP_CM;
    arrParam[3].tipe := ptString;
    arrParam[3].data := edtAccSuplierCreditDesc.Text;
    arrParam[4].tipe := ptInteger;
    arrParam[4].data := FLoginId;
    SetupCashManagement.InsertDataSetupCashManagement(arrParam);
    SetLength(arrParam, 5);
    arrParam[0].tipe := ptString;
    arrParam[0].data := ACC_KONSINYASI_CM;
    arrParam[1].tipe := ptString;
    arrParam[1].data := edtAccKonsinyasi.Text;
    arrParam[2].tipe := ptString;
    arrParam[2].data := ACC_GROUP_CM;
    arrParam[3].tipe := ptString;
    arrParam[3].data := edtAccKonsinyasiDesc.Text;
    arrParam[4].tipe := ptInteger;
    arrParam[4].data := FLoginId;
    SetupCashManagement.InsertDataSetupCashManagement(arrParam);
    SetLength(arrParam, 5);
    arrParam[0].tipe := ptString;
    arrParam[0].data := ACC_CONTRA_BON_CM;
    arrParam[1].tipe := ptString;
    arrParam[1].data := edtAccKontrabon.Text;
    arrParam[2].tipe := ptString;
    arrParam[2].data := ACC_GROUP_CM;
    arrParam[3].tipe := ptString;
    arrParam[3].data := edtAccKontrabonDesc.Text;
    arrParam[4].tipe := ptInteger;
    arrParam[4].data := FLoginId;
    SetupCashManagement.InsertDataSetupCashManagement(arrParam);
    SetLength(arrParam, 5);
    arrParam[0].tipe := ptString;
    arrParam[0].data := ACC_PS_TRADISIONAL_CM;
    arrParam[1].tipe := ptString;
    arrParam[1].data := edtAccPsTradisional.Text;
    arrParam[2].tipe := ptString;
    arrParam[2].data := ACC_GROUP_CM;
    arrParam[3].tipe := ptString;
    arrParam[3].data := edtAccPsTradisonalDesc.Text;
    arrParam[4].tipe := ptInteger;
    arrParam[4].data := FLoginId;
    SetupCashManagement.InsertDataSetupCashManagement(arrParam);
    SetLength(arrParam, 5);
    arrParam[0].tipe := ptString;
    arrParam[0].data := ACC_INTERNAL_USE_CM;
    arrParam[1].tipe := ptString;
    arrParam[1].data := edtAccInternalUse.Text;
    arrParam[2].tipe := ptString;
    arrParam[2].data := ACC_GROUP_CM;
    arrParam[3].tipe := ptString;
    arrParam[3].data := edtAccInternalUseDesc.Text;
    arrParam[4].tipe := ptInteger;
    arrParam[4].data := FLoginId;
    SetupCashManagement.InsertDataSetupCashManagement(arrParam);
    SetLength(arrParam, 5);
    arrParam[0].tipe := ptString;
    arrParam[0].data := ACC_SUPLIER_BAKERY_CM;
    arrParam[1].tipe := ptString;
    arrParam[1].data := edtAccSuplierBakery.Text;
    arrParam[2].tipe := ptString;
    arrParam[2].data := ACC_GROUP_CM;
    arrParam[3].tipe := ptString;
    arrParam[3].data := edtAccsuplierBakeryDesc.Text;
    arrParam[4].tipe := ptInteger;
    arrParam[4].data := FLoginId;
    SetupCashManagement.InsertDataSetupCashManagement(arrParam);
    SetLength(arrParam, 5);
    arrParam[0].tipe := ptString;
    arrParam[0].data := ACC_DISTRIBUSI_CM;
    arrParam[1].tipe := ptString;
    arrParam[1].data := edtAccDistribusi.Text;
    arrParam[2].tipe := ptString;
    arrParam[2].data := ACC_GROUP_CM;
    arrParam[3].tipe := ptString;
    arrParam[3].data := edtAccDistribusiDesc.Text;
    arrParam[4].tipe := ptInteger;
    arrParam[4].data := FLoginId;
    SetupCashManagement.InsertDataSetupCashManagement(arrParam);
    SetLength(arrParam, 5);
    arrParam[0].tipe := ptString;
    arrParam[0].data := ACC_PPN_MASUKAN;
    arrParam[1].tipe := ptString;
    arrParam[1].data := edtPPNMasukan.Text;
    arrParam[2].tipe := ptString;
    arrParam[2].data := ACC_GROUP_CM;
    arrParam[3].tipe := ptString;
    arrParam[3].data := edtAccPPNMasukan.Text;
    arrParam[4].tipe := ptInteger;
    arrParam[4].data := FLoginId;
    SetupCashManagement.InsertDataSetupCashManagement(arrParam);
    SetLength(arrParam, 5);
    arrParam[0].tipe := ptString;
    arrParam[0].data := ACC_PPNBM;
    arrParam[1].tipe := ptString;
    arrParam[1].data := edtPPNBM.Text;
    arrParam[2].tipe := ptString;
    arrParam[2].data := ACC_GROUP_CM;
    arrParam[3].tipe := ptString;
    arrParam[3].data := edtAccPPNBM.Text;
    arrParam[4].tipe := ptInteger;
    arrParam[4].data := FLoginId;
    SetupCashManagement.InsertDataSetupCashManagement(arrParam);
    SetLength(arrParam, 5);
    arrParam[0].tipe := ptString;
    arrParam[0].data := ACC_PPN_KELUARAN;
    arrParam[1].tipe := ptString;
    arrParam[1].data := edtPPNKeluaran.Text;
    arrParam[2].tipe := ptString;
    arrParam[2].data := ACC_GROUP_CM;
    arrParam[3].tipe := ptString;
    arrParam[3].data := edtAccPPNKeluaran.Text;
    arrParam[4].tipe := ptInteger;
    arrParam[4].data := FLoginId;
    SetupCashManagement.InsertDataSetupCashManagement(arrParam);

    bResult := True;
    SetupCashManagement.Commit;
  except
    bResult := False;
    SetupCashManagement.Rollback;
  end;

  Result := bResult;
  }
end;

procedure TfrmSetupCashManagement.SetIsProcessSuccessfull(
  const Value: Boolean);
begin
  FIsProcessSuccessfull := Value;
end;

function TfrmSetupCashManagement.UpdateDatasetupCashManagement: Boolean;
//var arrParam: TArr;
begin
{
//  bResult := False;

  if not Assigned(SetupCashManagement) then
    SetupCashManagement := TSetupCashManagement.Create;

  try
    SetLength(arrParam, 6);
    arrParam[0].tipe := ptString;
    arrParam[0].data := CONSOLODATION_TO_CM;
    arrParam[1].tipe := ptString;
    arrParam[1].data := MasterCompany.ID;
    arrParam[2].tipe := ptString;
    arrParam[2].data := ACC_GROUP_CM;
    arrParam[3].tipe := ptString;
    arrParam[3].data := edtConsolidation.Text;
    arrParam[4].tipe := ptInteger;
    arrParam[4].data := FLoginId;
    arrParam[5].tipe := ptInteger;
    arrParam[5].data := FIdConsolidation;
    SetupCashManagement.UpdateDataSetupCashManagement(arrParam);
    SetLength(arrParam, 6);
    arrParam[0].tipe := ptString;
    arrParam[0].data := ACC_KEPALA_KASIR_CM;
    arrParam[1].tipe := ptString;
    arrParam[1].data := edtAccKepalaKasir.Text;
    arrParam[2].tipe := ptString;
    arrParam[2].data := ACC_GROUP_CM;
    arrParam[3].tipe := ptString;
    arrParam[3].data := edtAccKepalaKasirDesc.Text;
    arrParam[4].tipe := ptInteger;
    arrParam[4].data := FLoginId;
    arrParam[5].tipe := ptInteger;
    arrParam[5].data := FIdAccKepalaKasir;
    SetupCashManagement.UpdateDataSetupCashManagement(arrParam);
    SetLength(arrParam, 6);
    arrParam[0].tipe := ptString;
    arrParam[0].data := ACC_PETTY_CASH_CM;
    arrParam[1].tipe := ptString;
    arrParam[1].data := edtAccPettyCash.Text;
    arrParam[2].tipe := ptString;
    arrParam[2].data := ACC_GROUP_CM;
    arrParam[3].tipe := ptString;
    arrParam[3].data := edtAccPettyCashDesc.Text;
    arrParam[4].tipe := ptInteger;
    arrParam[4].data := FLoginId;
    arrParam[5].tipe := ptInteger;
    arrParam[5].data := FIdAccPettyCash;
    SetupCashManagement.UpdateDataSetupCashManagement(arrParam);
    SetLength(arrParam, 6);
    arrParam[0].tipe := ptString;
    arrParam[0].data := ACC_CASH_IN_TRANSIT_CM;
    arrParam[1].tipe := ptString;
    arrParam[1].data := edtAccCashInTransit.Text;
    arrParam[2].tipe := ptString;
    arrParam[2].data := ACC_GROUP_CM;
    arrParam[3].tipe := ptString;
    arrParam[3].data := edtAccCashInTransitDesc.Text;
    arrParam[4].tipe := ptInteger;
    arrParam[4].data := FLoginId;
    arrParam[5].tipe := ptInteger;
    arrParam[5].data := FIdAccCashInTransit;
    SetupCashManagement.UpdateDataSetupCashManagement(arrParam);
    SetLength(arrParam, 6);
    arrParam[0].tipe := ptString;
    arrParam[0].data := ACC_BACK_IN_TRANSIT_CM;
    arrParam[1].tipe := ptString;
    arrParam[1].data := edtAccBackInTransit.Text;
    arrParam[2].tipe := ptString;
    arrParam[2].data := ACC_GROUP_CM;
    arrParam[3].tipe := ptString;
    arrParam[3].data := edtAccBackInTransitDesc.Text;
    arrParam[4].tipe := ptInteger;
    arrParam[4].data := FLoginId;
    arrParam[5].tipe := ptInteger;
    arrParam[5].data := FIdAccBackInTransit;
    SetupCashManagement.UpdateDataSetupCashManagement(arrParam);
    SetLength(arrParam, 6);
    arrParam[0].tipe := ptString;
    arrParam[0].data := ACC_SUPLIER_CREDIT_CM;
    arrParam[1].tipe := ptString;
    arrParam[1].data := edtAccSuplierCredit.Text;
    arrParam[2].tipe := ptString;
    arrParam[2].data := ACC_GROUP_CM;
    arrParam[3].tipe := ptString;
    arrParam[3].data := edtAccSuplierCreditDesc.Text;
    arrParam[4].tipe := ptInteger;
    arrParam[4].data := FLoginId;
    arrParam[5].tipe := ptInteger;
    arrParam[5].data := FIdAccSuplierCredit;
    SetupCashManagement.UpdateDataSetupCashManagement(arrParam);
    SetLength(arrParam, 6);
    arrParam[0].tipe := ptString;
    arrParam[0].data := ACC_KONSINYASI_CM;
    arrParam[1].tipe := ptString;
    arrParam[1].data := edtAccKonsinyasi.Text;
    arrParam[2].tipe := ptString;
    arrParam[2].data := ACC_GROUP_CM;
    arrParam[3].tipe := ptString;
    arrParam[3].data := edtAccKonsinyasiDesc.Text;
    arrParam[4].tipe := ptInteger;
    arrParam[4].data := FLoginId;
    arrParam[5].tipe := ptInteger;
    arrParam[5].data := FIdAccKonsinyasi;
    SetupCashManagement.UpdateDataSetupCashManagement(arrParam);
    SetLength(arrParam, 6);
    arrParam[0].tipe := ptString;
    arrParam[0].data := ACC_CONTRA_BON_CM;
    arrParam[1].tipe := ptString;
    arrParam[1].data := edtAccKontrabon.Text;
    arrParam[2].tipe := ptString;
    arrParam[2].data := ACC_GROUP_CM;
    arrParam[3].tipe := ptString;
    arrParam[3].data := edtAccKontrabonDesc.Text;
    arrParam[4].tipe := ptInteger;
    arrParam[4].data := FLoginId;
    arrParam[5].tipe := ptInteger;
    arrParam[5].data := FIdAccKontraBon;
    SetupCashManagement.UpdateDataSetupCashManagement(arrParam);
    SetLength(arrParam, 6);
    arrParam[0].tipe := ptString;
    arrParam[0].data := ACC_PS_TRADISIONAL_CM;
    arrParam[1].tipe := ptString;
    arrParam[1].data := edtAccPsTradisional.Text;
    arrParam[2].tipe := ptString;
    arrParam[2].data := ACC_GROUP_CM;
    arrParam[3].tipe := ptString;
    arrParam[3].data := edtAccPsTradisonalDesc.Text;
    arrParam[4].tipe := ptInteger;
    arrParam[4].data := FLoginId;
    arrParam[5].tipe := ptInteger;
    arrParam[5].data := FIdAccPsTradisonal;
    SetupCashManagement.UpdateDataSetupCashManagement(arrParam);
    SetLength(arrParam, 6);
    arrParam[0].tipe := ptString;
    arrParam[0].data := ACC_INTERNAL_USE_CM;
    arrParam[1].tipe := ptString;
    arrParam[1].data := edtAccInternalUse.Text;
    arrParam[2].tipe := ptString;
    arrParam[2].data := ACC_GROUP_CM;
    arrParam[3].tipe := ptString;
    arrParam[3].data := edtAccInternalUseDesc.Text;
    arrParam[4].tipe := ptInteger;
    arrParam[4].data := FLoginId;
    arrParam[5].tipe := ptInteger;
    arrParam[5].data := FIdAccInternalUse;
    SetupCashManagement.UpdateDataSetupCashManagement(arrParam);
    SetLength(arrParam, 6);
    arrParam[0].tipe := ptString;
    arrParam[0].data := ACC_SUPLIER_BAKERY_CM;
    arrParam[1].tipe := ptString;
    arrParam[1].data := edtAccSuplierBakery.Text;
    arrParam[2].tipe := ptString;
    arrParam[2].data := ACC_GROUP_CM;
    arrParam[3].tipe := ptString;
    arrParam[3].data := edtAccsuplierBakeryDesc.Text;
    arrParam[4].tipe := ptInteger;
    arrParam[4].data := FLoginId;
    arrParam[5].tipe := ptInteger;
    arrParam[5].data := FIdAccSuplierBakery;
    SetupCashManagement.UpdateDataSetupCashManagement(arrParam);
    SetLength(arrParam, 6);
    arrParam[0].tipe := ptString;
    arrParam[0].data := ACC_DISTRIBUSI_CM;
    arrParam[1].tipe := ptString;
    arrParam[1].data := edtAccDistribusi.Text;
    arrParam[2].tipe := ptString;
    arrParam[2].data := ACC_GROUP_CM;
    arrParam[3].tipe := ptString;
    arrParam[3].data := edtAccDistribusiDesc.Text;
    arrParam[4].tipe := ptInteger;
    arrParam[4].data := FLoginId;
    arrParam[5].tipe := ptInteger;
    arrParam[5].data := FidAccDistribusi;
    SetupCashManagement.UpdateDataSetupCashManagement(arrParam);
    SetLength(arrParam, 6);
    arrParam[0].tipe := ptString;
    arrParam[0].data := ACC_PPN_MASUKAN;
    arrParam[1].tipe := ptString;
    arrParam[1].data := edtPPNMasukan.Text;
    arrParam[2].tipe := ptString;
    arrParam[2].data := ACC_GROUP_CM;
    arrParam[3].tipe := ptString;
    arrParam[3].data := edtAccPPNMasukan.Text;
    arrParam[4].tipe := ptInteger;
    arrParam[4].data := FLoginId;
    arrParam[5].tipe := ptInteger;
    arrParam[5].data := FIdAccPPNMasukan;
    SetupCashManagement.UpdateDataSetupCashManagement(arrParam);
    SetLength(arrParam, 6);
    arrParam[0].tipe := ptString;
    arrParam[0].data := ACC_PPNBM;
    arrParam[1].tipe := ptString;
    arrParam[1].data := edtPPNBM.Text;
    arrParam[2].tipe := ptString;
    arrParam[2].data := ACC_GROUP_CM;
    arrParam[3].tipe := ptString;
    arrParam[3].data := edtAccPPNBM.Text;
    arrParam[4].tipe := ptInteger;
    arrParam[4].data := FLoginId;
    arrParam[5].tipe := ptInteger;
    arrParam[5].data := FIdAccPPNBM;
    SetupCashManagement.UpdateDataSetupCashManagement(arrParam);
    SetLength(arrParam, 6);
    arrParam[0].tipe := ptString;
    arrParam[0].data := ACC_PPN_KELUARAN;
    arrParam[1].tipe := ptString;
    arrParam[1].data := edtPPNKeluaran.Text;
    arrParam[2].tipe := ptString;
    arrParam[2].data := ACC_GROUP_CM;
    arrParam[3].tipe := ptString;
    arrParam[3].data := edtAccPPNKeluaran.Text;
    arrParam[4].tipe := ptInteger;
    arrParam[4].data := FLoginId;
    arrParam[5].tipe := ptInteger;
    arrParam[5].data := FIdAccPPNKeluaran;
    SetupCashManagement.UpdateDataSetupCashManagement(arrParam);

//    bResult := True;
    SetupCashManagement.Commit;
    Result := True;
  except
//    bResult := False;
    SetupCashManagement.Rollback;
    Result := False;
  end;
   }
//  Result := bResult;
end;

procedure TfrmSetupCashManagement.SetStatusForm(const Value: TStatusForm);
begin
  FStatusForm := Value;
end;

function TfrmSetupCashManagement.GetDataSetupCashManagementByGroup(
  AGroup: string): TDataSet;
//var arrParam: TArr;
begin
  {if AGroup = '' then
    SetLength(arrParam, 0)
  else
  begin
    SetLength(arrParam, 1);
    arrParam[0].tipe := ptString;
    arrParam[0].data := AGroup;
  end;

  if not Assigned(SetupCashManagement) then
    SetupCashManagement := TSetupCashManagement.Create;

  Result := SetupCashManagement.GetDataSetupCashManagementByGroup(arrParam);
  }
end;

procedure TfrmSetupCashManagement.ParseDataSetupCashManagement;
var dataCashManagement: TDataSet;
begin
  dataCashManagement := GetDataSetupCashManagementByGroup(ACC_GROUP_CM);

  if not dataCashManagement.IsEmpty then
  begin
    while not dataCashManagement.Eof do
    begin
      if dataCashManagement.FieldByName('PARCT_NAME').AsString = CONSOLODATION_TO_CM then
      begin
        FIdConsolidation := dataCashManagement.FieldByName('PARCT_ID').AsInteger;
        edtConsolidation.Text := dataCashManagement.FieldByName('PARCT_DESCRIPTION').AsString;
      end
      else if dataCashManagement.FieldByName('PARCT_NAME').AsString = ACC_KEPALA_KASIR_CM then
      begin
        FIdAccKepalaKasir := dataCashManagement.FieldByName('PARCT_ID').AsInteger;
        edtAccKepalaKasir.Text := dataCashManagement.FieldByName('PARCT_DEFAULT').AsString;
        edtAccKepalaKasirDesc.Text := dataCashManagement.FieldByName('PARCT_DESCRIPTION').AsString;
      end
      else if dataCashManagement.FieldByName('PARCT_NAME').AsString = ACC_PETTY_CASH_CM then
      begin
        FIdAccPettyCash := dataCashManagement.FieldByName('PARCT_ID').AsInteger;
        edtAccPettyCash.Text := dataCashManagement.FieldByName('PARCT_DEFAULT').AsString;
        edtAccPettyCashDesc.Text := dataCashManagement.FieldByName('PARCT_DESCRIPTION').AsString;
      end
      else if dataCashManagement.FieldByName('PARCT_NAME').AsString = ACC_CASH_IN_TRANSIT_CM then
      begin
        FIdAccCashInTransit := dataCashManagement.FieldByName('PARCT_ID').AsInteger;
        edtAccCashInTransit.Text := dataCashManagement.FieldByName('PARCT_DEFAULT').AsString;
        edtAccCashInTransitDesc.Text := dataCashManagement.FieldByName('PARCT_DESCRIPTION').AsString;
      end
      else if dataCashManagement.FieldByName('PARCT_NAME').AsString = ACC_BACK_IN_TRANSIT_CM then
      begin
        FIdAccBackInTransit := dataCashManagement.FieldByName('PARCT_ID').AsInteger;
        edtAccBackInTransit.Text := dataCashManagement.FieldByName('PARCT_DEFAULT').AsString;
        edtAccBackInTransitDesc.Text := dataCashManagement.FieldByName('PARCT_DESCRIPTION').AsString;
      end
      else if dataCashManagement.FieldByName('PARCT_NAME').AsString = ACC_SUPLIER_CREDIT_CM then
      begin
        FIdAccSuplierCredit := dataCashManagement.FieldByName('PARCT_ID').AsInteger;
        edtAccSuplierCredit.Text := dataCashManagement.FieldByName('PARCT_DEFAULT').AsString;
        edtAccSuplierCreditDesc.Text := dataCashManagement.FieldByName('PARCT_DESCRIPTION').AsString;
      end
      else if dataCashManagement.FieldByName('PARCT_NAME').AsString = ACC_KONSINYASI_CM then
      begin
        FIdAccKonsinyasi := dataCashManagement.FieldByName('PARCT_ID').AsInteger;
        edtAccKonsinyasi.Text := dataCashManagement.FieldByName('PARCT_DEFAULT').AsString;
        edtAccKonsinyasiDesc.Text := dataCashManagement.FieldByName('PARCT_DESCRIPTION').AsString;
      end
      else if dataCashManagement.FieldByName('PARCT_NAME').AsString = ACC_CONTRA_BON_CM then
      begin
        FIdAccKontraBon := dataCashManagement.FieldByName('PARCT_ID').AsInteger;
        edtAccKontrabon.Text := dataCashManagement.FieldByName('PARCT_DEFAULT').AsString;
        edtAccKontrabonDesc.Text := dataCashManagement.FieldByName('PARCT_DESCRIPTION').AsString;
      end
      else if dataCashManagement.FieldByName('PARCT_NAME').AsString = ACC_PS_TRADISIONAL_CM then
      begin
        FIdAccPsTradisonal := dataCashManagement.FieldByName('PARCT_ID').AsInteger;
        edtAccPsTradisional.Text := dataCashManagement.FieldByName('PARCT_DEFAULT').AsString;
        edtAccPsTradisonalDesc.Text := dataCashManagement.FieldByName('PARCT_DESCRIPTION').AsString;
      end
      else if dataCashManagement.FieldByName('PARCT_NAME').AsString = ACC_INTERNAL_USE_CM then
      begin
        FIdAccInternalUse := dataCashManagement.FieldByName('PARCT_ID').AsInteger;
        edtAccInternalUse.Text := dataCashManagement.FieldByName('PARCT_DEFAULT').AsString;
        edtAccInternalUseDesc.Text := dataCashManagement.FieldByName('PARCT_DESCRIPTION').AsString;
      end
      else if dataCashManagement.FieldByName('PARCT_NAME').AsString = ACC_SUPLIER_BAKERY_CM then
      begin
        FIdAccSuplierBakery := dataCashManagement.FieldByName('PARCT_ID').AsInteger;
        edtAccSuplierBakery.Text := dataCashManagement.FieldByName('PARCT_DEFAULT').AsString;
        edtAccsuplierBakeryDesc.Text := dataCashManagement.FieldByName('PARCT_DESCRIPTION').AsString;
      end
      else if dataCashManagement.FieldByName('PARCT_NAME').AsString = ACC_DISTRIBUSI_CM then
      begin
        FidAccDistribusi := dataCashManagement.FieldByName('PARCT_ID').AsInteger;
        edtAccDistribusi.Text := dataCashManagement.FieldByName('PARCT_DEFAULT').AsString;
        edtAccDistribusiDesc.Text := dataCashManagement.FieldByName('PARCT_DESCRIPTION').AsString;
      end
      else if dataCashManagement.FieldByName('PARCT_NAME').AsString = ACC_PPN_MASUKAN then
      begin
        FIdAccPPNMasukan := dataCashManagement.FieldByName('PARCT_ID').AsInteger;
        edtPPNMasukan.Text := dataCashManagement.FieldByName('PARCT_DEFAULT').AsString;
        edtAccPPNMasukan.Text := dataCashManagement.FieldByName('PARCT_DESCRIPTION').AsString;
      end
      else if dataCashManagement.FieldByName('PARCT_NAME').AsString = ACC_PPNBM then
      begin
        FIdAccPPNBM := dataCashManagement.FieldByName('PARCT_ID').AsInteger;
        edtPPNBM.Text := dataCashManagement.FieldByName('PARCT_DEFAULT').AsString;
        edtAccPPNBM.Text := dataCashManagement.FieldByName('PARCT_DESCRIPTION').AsString;
      end
      else if dataCashManagement.FieldByName('PARCT_NAME').AsString = ACC_PPN_KELUARAN then
      begin
        FIdAccPPNKeluaran := dataCashManagement.FieldByName('PARCT_ID').AsInteger;
        edtPPNKeluaran.Text := dataCashManagement.FieldByName('PARCT_DEFAULT').AsString;
        edtAccPPNKeluaran.Text := dataCashManagement.FieldByName('PARCT_DESCRIPTION').AsString;
      end;

      dataCashManagement.Next;
    end;
  end;
end;

procedure TfrmSetupCashManagement.dtLastProcessKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
    cbpConsolidation.SetFocus;
end;

procedure TfrmSetupCashManagement.SetComponentDisable;
begin
  cbbBulan.Enabled := False;
  medtTahun.Enabled := False;
  edtPeriode.Enabled := False;
  dtLastProcess.Enabled := False;
  cbpConsolidation.Enabled := False;
  edtConsolidation.Enabled := False;
  edtAccKepalaKasir.Enabled := False;
  edtAccKepalaKasirDesc.Enabled := False;
  edtAccPettyCash.Enabled := False;
  edtAccPettyCashDesc.Enabled := False;
  edtAccCashInTransit.Enabled := False;
  edtAccCashInTransitDesc.Enabled := False;
  edtAccBackInTransit.Enabled := False;
  edtAccBackInTransitDesc.Enabled := False;
  edtAccSuplierCredit.Enabled := False;
  edtAccSuplierCreditDesc.Enabled := False;
  edtAccKonsinyasi.Enabled := False;
  edtAccKonsinyasiDesc.Enabled := False;
  edtAccKontrabon.Enabled := False;
  edtAccKontrabonDesc.Enabled := False;
  edtAccPsTradisional.Enabled := False;
  edtAccPsTradisonalDesc.Enabled := False;
  edtAccInternalUse.Enabled := False;
  edtAccInternalUseDesc.Enabled := False;
  edtAccSuplierBakery.Enabled := False;
  edtAccsuplierBakeryDesc.Enabled := False;
  edtAccDistribusi.Enabled := False;
  edtAccDistribusiDesc.Enabled := False;
  edtPPNMasukan.Enabled := False;
  edtAccPPNMasukan.Enabled := False;
  edtPPNBM.Enabled := False;
  edtAccPPNBM.Enabled := False;
  edtPPNKeluaran.Enabled := False;
  edtAccPPNKeluaran.Enabled := False;
end;

procedure TfrmSetupCashManagement.SetComponentEnable;
begin
  cbbBulan.Enabled := True;
  medtTahun.Enabled := True;
  edtPeriode.Enabled := True;
  dtLastProcess.Enabled := True;
  cbpConsolidation.Enabled := True;
  edtConsolidation.Enabled := True;
  edtAccKepalaKasir.Enabled := True;
  edtAccKepalaKasirDesc.Enabled := True;
  edtAccPettyCash.Enabled := True;
  edtAccPettyCashDesc.Enabled := True;
  edtAccCashInTransit.Enabled := True;
  edtAccCashInTransitDesc.Enabled := True;
  edtAccBackInTransit.Enabled := True;
  edtAccBackInTransitDesc.Enabled := True;
  edtAccSuplierCredit.Enabled := True;
  edtAccSuplierCreditDesc.Enabled := True;
  edtAccKonsinyasi.Enabled := True;
  edtAccKonsinyasiDesc.Enabled := True;
  edtAccKontrabon.Enabled := True;
  edtAccKontrabonDesc.Enabled := True;
  edtAccPsTradisional.Enabled := True;
  edtAccPsTradisonalDesc.Enabled := True;
  edtAccInternalUse.Enabled := True;
  edtAccInternalUseDesc.Enabled := True;
  edtAccSuplierBakery.Enabled := True;
  edtAccsuplierBakeryDesc.Enabled := True;
  edtAccDistribusi.Enabled := True;
  edtAccDistribusiDesc.Enabled := True;
  edtPPNMasukan.Enabled := True;
  edtAccPPNMasukan.Enabled := True;
  edtPPNBM.Enabled := True;
  edtAccPPNBM.Enabled := True;
  edtPPNKeluaran.Enabled := True;
  edtAccPPNKeluaran.Enabled := True;
end;

procedure TfrmSetupCashManagement.SetComponentClear;
begin
  cbbBulan.ItemIndex := -1;
  medtTahun.Clear;
  edtPeriode.Clear;
  dtLastProcess.Clear;
  cbpConsolidation.Clear;
  edtConsolidation.Clear;
  edtAccKepalaKasir.Clear;
  edtAccKepalaKasirDesc.Clear;
  edtAccPettyCash.Clear;
  edtAccPettyCashDesc.Clear;
  edtAccCashInTransit.Clear;
  edtAccCashInTransitDesc.Clear;
  edtAccBackInTransit.Clear;
  edtAccBackInTransitDesc.Clear;
  edtAccSuplierCredit.Clear;
  edtAccSuplierCreditDesc.Clear;
  edtAccKonsinyasi.Clear;
  edtAccKonsinyasiDesc.Clear;
  edtAccKontrabon.Clear;
  edtAccKontrabonDesc.Clear;
  edtAccPsTradisional.Clear;
  edtAccPsTradisonalDesc.Clear;
  edtAccInternalUse.Clear;
  edtAccInternalUseDesc.Clear;
  edtAccSuplierBakery.Clear;
  edtAccsuplierBakeryDesc.Clear;
  edtAccDistribusi.Clear;
  edtAccDistribusiDesc.Clear;
  edtPPNMasukan.Clear;
  edtAccPPNMasukan.Clear;
  edtPPNBM.Clear;
  edtAccPPNBM.Clear;
  edtPPNKeluaran.Clear;
  edtAccPPNKeluaran.Clear;
end;

procedure TfrmSetupCashManagement.FormShow(Sender: TObject);
begin
  inherited;
  SetComponentClear;
  SetComponentDisable;
end;

function TfrmSetupCashManagement.GetCompanyCodeByCompanyId(
  AId: string): string;
var
//  arrParam: TArr;
    dataCompanyCode: TDataSet;
begin
  {if AId = '' then
    SetLength(arrParam, 0)
  else
  begin
    SetLength(arrParam, 1);
    arrParam[0].tipe := ptString;
    arrParam[0].data := AId;
  end;

  if not Assigned(SetupCashManagement) then
    SetupCashManagement := TSetupCashManagement.Create;

  dataCompanyCode := SetupCashManagement.GetCompanyCodeByCompId(arrParam);

  if not dataCompanyCode.IsEmpty then
    Result := dataCompanyCode.FieldByName('COMP_CODE').AsString
  else
    Result := '';
    }
end;

procedure TfrmSetupCashManagement.edtPPNMasukanKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F5) then
  begin
    LoadPopupSearchRekening;
    edtPPNMasukan.Text := RekeningKode;
    edtAccPPNMasukan.Text := RekeningDesc;
  end
  else if (Key = VK_RETURN) then
  begin
    if (LoadNamaRekeningByRekCode(edtPPNMasukan.Text) <> '') then
    begin
      edtAccPPNMasukan.Text := LoadNamaRekeningByRekCode(edtPPNMasukan.Text);
      edtPPNBM.SetFocus;
    end
    else
      edtPPNMasukan.SetFocus;
  end;
end;

procedure TfrmSetupCashManagement.edtPPNBMKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F5) then
  begin
    LoadPopupSearchRekening;
    edtPPNBM.Text := RekeningKode;
    edtAccPPNBM.Text := RekeningDesc;
  end
  else if (Key = VK_RETURN) then
  begin
    if (LoadNamaRekeningByRekCode(edtPPNBM.Text) <> '') then
    begin
      edtAccPPNBM.Text := LoadNamaRekeningByRekCode(edtPPNBM.Text);
      edtPPNKeluaran.SetFocus;
    end
    else
      edtPPNBM.SetFocus;
  end;
end;

procedure TfrmSetupCashManagement.edtPPNKeluaranKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F5) then
  begin
    LoadPopupSearchRekening;
    edtPPNKeluaran.Text := RekeningKode;
    edtAccPPNKeluaran.Text := RekeningDesc;
  end
  else if (Key = VK_RETURN) then
  begin
    if (LoadNamaRekeningByRekCode(edtPPNKeluaran.Text) <> '') then
    begin
      edtAccPPNKeluaran.Text := LoadNamaRekeningByRekCode(edtPPNKeluaran.Text);
    end
    else
      edtPPNKeluaran.SetFocus;
  end;
end;

end.
