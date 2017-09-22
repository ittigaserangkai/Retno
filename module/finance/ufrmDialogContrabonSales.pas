unit ufrmDialogContrabonSales;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls, Vcl.StdCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxClasses, cxGridLevel, cxGrid, cxCurrencyEdit, uDMClient,
  dxBarBuiltInMenu, cxPC, Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar,
  Vcl.Menus, cxButtons, Datasnap.DBClient, uDBUtils,
  uDXUtils,uModOrganization, cxCheckBox,uModContrabonSales,
  System.Generics.Collections, uAppUtils, uModApp, uConstanta,uInterface,
  cxButtonEdit, ufrmCXLookup;

type
  TfrmDialogContrabonSales = class(TfrmMasterDialog, ICRUDAble)
    pnlHeader: TPanel;
    lblSupMG: TLabel;
    lblAlamat: TLabel;
    lblPostCode: TLabel;
    lblTelp: TLabel;
    lblNPWP: TLabel;
    edAddress: TcxTextEdit;
    edPostCode: TcxTextEdit;
    edTelp: TcxTextEdit;
    edNPWP: TcxTextEdit;
    cxgrdlvlContrabon: TcxGridLevel;
    cxGridContrabon: TcxGrid;
    cxGridTableContrabonSales: TcxGridTableView;
    cxGridColContDate: TcxGridColumn;
    cxGridColContAmountGross: TcxGridColumn;
    cxGridColContAmountAdj: TcxGridColumn;
    cxGridColContFee: TcxGridColumn;
    cxGridColContPPN: TcxGridColumn;
    cxGridColContAmountNet: TcxGridColumn;
    pnlLoadSales: TPanel;
    pnlHeaderLoad: TPanel;
    lblP1: TLabel;
    lblP2: TLabel;
    dtP1: TcxDateEdit;
    dtP2: TcxDateEdit;
    btnLoadSales: TcxButton;
    cxGridColContPPNAmount: TcxGridColumn;
    lblPPN: TLabel;
    lblFee: TLabel;
    edPPN: TcxCurrencyEdit;
    edFee: TcxCurrencyEdit;
    cxGridColContIsClaimed: TcxGridColumn;
    cxGridColContID: TcxGridColumn;
    cxGridColContAmountSales: TcxGridColumn;
    edOrganization: TcxButtonEdit;
    edOrganizationName: TcxButtonEdit;
    procedure actDeleteExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure btnLoadSalesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxGridContrabonEnter(Sender: TObject);
    procedure cxGridTableContrabonSalesDataControllerAfterPost(
      ADataController: TcxCustomDataController);
    procedure cxGridTableContrabonSalesDataControllerAfterInsert(
      ADataController: TcxCustomDataController);
    procedure edOrganizationPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edOrganizationPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
  private
    FCDSOrganisasi: tclientDataSet;
    FCS: TModContrabonSales;
    FOrganization: TModOrganization;
    function GetCDSOrganisasi: tclientDataSet;
//    function GetCS: TModContrabonSales;
    procedure HitungNilaiContrabon(AFocusedRecordIndex: Integer);
    procedure IsiDataAwalContrabonSales(AFocusedRecordIndex: Integer;
        AIsUpdateTanggal : Boolean = True);
    procedure LoadDataOrganization(AKodeAtauID : String; AIsLoadByKode : Boolean);
    procedure UpdatePropertyOrganisasidiGrid;
    property CDSOrganisasi: tclientDataSet read GetCDSOrganisasi write
        FCDSOrganisasi;
//    property CS: TModContrabonSales read GetCS write FCS;
    { Private declarations }
  public
    procedure LoadData(AID : String);
    { Public declarations }
  end;

var
  frmDialogContrabonSales: TfrmDialogContrabonSales;

implementation

{$R *.dfm}

procedure TfrmDialogContrabonSales.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm('Anda Yakin Akan Menghapus Data ?') then
    Exit;

  if FCS = nil then
    Exit;

  if FCS.CONT_IS_CLAIM = 1 then
  begin
    TAppUtils.Warning('Sudah Diclaim,Tidak Bisa Dihapus');
    Exit;
  end;


  try
    if DMClient.CrudContrabonSalesClient.DeleteFromDB(FCS) then
    begin
      TAppUtils.Information('Berhasil Hapus Data');
      Self.ModalResult := mrOk;
    end;
  except
    raise
  end;
end;

procedure TfrmDialogContrabonSales.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FCDSOrganisasi);
end;

procedure TfrmDialogContrabonSales.actSaveExecute(Sender: TObject);
var
  I: Integer;
  lListContranbonSales: TObjectList<TModApp>;
begin
  inherited;
  if not ValidateEmptyCtrl([1]) then
    Exit;

  if FOrganization = nil then
  begin
    TAppUtils.Warning('Organisasi Belum Dipilih');
    edOrganization.SetFocus;
    Exit;
  end;

  lListContranbonSales := TObjectList<TModApp>.Create();
  try
    for I := 0 to cxGridTableContrabonSales.DataController.RecordCount - 1 do
    begin
      HitungNilaiContrabon(i);

      if cxGridTableContrabonSales.Double(i, cxGridColContAmountGross.Index) <= 0 then
      begin
        TAppUtils.Warning('Nominal Baris ' + IntToStr(i+1) + ' 0');
        Exit;
      end;


      FCS := TModContrabonSales.CreateID(cxGridTableContrabonSales.Text(i, cxGridColContID.Index));
      if FCS.ID <> '' then
        FCS.ObjectState := 3;

      FCS.CONT_ORGANIZATION := TModOrganization.CreateID(FOrganization.ID);
      cxGridTableContrabonSales.LoadObjectData(FCS, i);

      if DMClient.CrudContrabonSalesClient.IsTanggalSudahDiinput(FCS) then
      begin
        if not TAppUtils.Confirm('Penjualan Tanggal ' + DateToStr(FCS.CONT_DATE_SALES) + ' Sudah Diinput.'
                             + #13 + 'Apakah Data akan tetap diinput ? ') then
        begin
          Exit;
        end;
      end;

      lListContranbonSales.Add(FCS);
    end;

    if DMClient.CrudClient.SaveBatch(lListContranbonSales) then
    begin
      FreeAndNil(lListContranbonSales);

      TAppUtils.Information(CONF_ADD_SUCCESSFULLY, False);
      ClearByTag([0,1]);
      cxGridTableContrabonSales.ClearRows;
      edOrganization.SetFocus;
    end;
  except
    TAppUtils.Error(ER_INSERT_FAILED);
    raise;
  end;
end;

procedure TfrmDialogContrabonSales.btnLoadSalesClick(Sender: TObject);
begin
  inherited;
  TAppUtils.Information('Fitur Ini Belum Diimplementasikan', True);
end;

procedure TfrmDialogContrabonSales.cxGridContrabonEnter(Sender: TObject);
begin
  inherited;
  if cxGridTableContrabonSales.DataController.RecordCount = 0 then
  begin
    cxGridTableContrabonSales.DataController.AppendRecord;
    cxGridTableContrabonSales.DataController.FocusedRecordIndex := 0;
    IsiDataAwalContrabonSales(cxGridTableContrabonSales.DataController.FocusedRecordIndex);
  end;

end;

procedure TfrmDialogContrabonSales.cxGridTableContrabonSalesDataControllerAfterInsert(
  ADataController: TcxCustomDataController);
begin
  inherited;
  IsiDataAwalContrabonSales(ADataController.FocusedRecordIndex);
end;

procedure TfrmDialogContrabonSales.cxGridTableContrabonSalesDataControllerAfterPost(
  ADataController: TcxCustomDataController);
begin
  inherited;
  HitungNilaiContrabon(ADataController.FocusedRecordIndex);
end;

procedure TfrmDialogContrabonSales.edOrganizationPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  with TfrmCXLookup.Execute(CDSOrganisasi,False, 'Look Up PO') do
  begin
    Try
      HideFields(['V_ORGANIZATION_ID', 'ORG_MerchandiseGroup_id','ORG_Member_ID','ORG_Karyawan_ID','DATE_CREATE','DATE_MODIFY']);
      if ShowModal = mrOK then
      begin
        edOrganization.Text := Data.FieldByName('org_code').AsString;
        LoadDataOrganization(Data.FieldByName('V_ORGANIZATION_ID').AsString, False);
        UpdatePropertyOrganisasidiGrid;
      end;
    Finally
      free;
    End;
  end;
end;

procedure TfrmDialogContrabonSales.edOrganizationPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  FreeAndNil(FOrganization);
  LoadDataOrganization(VarToStr(DisplayValue), True);
  UpdatePropertyOrganisasidiGrid;
end;

procedure TfrmDialogContrabonSales.FormCreate(Sender: TObject);
begin
  inherited;
  ClearByTag([0,1]);
  dtP1.Date := Now;
  dtP2.Date := Now;

  cxGridTableContrabonSales.ClearRows;

end;

function TfrmDialogContrabonSales.GetCDSOrganisasi: tclientDataSet;
begin
  if FCDSOrganisasi = nil then
    FCDSOrganisasi := TDBUtils.DSToCDS(DMClient.DSProviderClient.Organization_GetDSLookup(), Self);

  Result := FCDSOrganisasi;
end;

//function TfrmDialogContrabonSales.GetCS: TModContrabonSales;
//begin
//  if FCS = nil then
//    FCS := TModContrabonSales.Create;
//
//  Result := FCS;
//end;

procedure TfrmDialogContrabonSales.HitungNilaiContrabon(AFocusedRecordIndex:
    Integer);
var
  dDisc: Double;
  dFee: Double;
  dGrosSales: Double;
  dNet: Double;
  dPPN: Double;
  dTotalSales: Double;
begin
  dGrosSales  := cxGridTableContrabonSales.Double(AFocusedRecordIndex, cxGridColContAmountGross.Index);
  dDisc       := cxGridTableContrabonSales.Double(AFocusedRecordIndex, cxGridColContAmountAdj.Index);
  dFee        := cxGridTableContrabonSales.Double(AFocusedRecordIndex, cxGridColContFee.Index);
  dTotalSales := dGrosSales - dDisc;

  if cxGridTableContrabonSales.Text(AFocusedRecordIndex, cxGridColContPPN.Index) = 'Y' then
    dPPN      := dTotalSales - dTotalSales / 1.1
  else
    dPPN      := 0;

  dNet        := dTotalSales * (100 - dFee) / 100;

  cxGridTableContrabonSales.SetValue(AFocusedRecordIndex, cxGridColContAmountSales.Index, dTotalSales);
  cxGridTableContrabonSales.SetValue(AFocusedRecordIndex, cxGridColContPPNAmount.Index, dPPN);
  cxGridTableContrabonSales.SetValue(AFocusedRecordIndex, cxGridColContAmountNet.Index, dNet);
end;


procedure TfrmDialogContrabonSales.IsiDataAwalContrabonSales(
    AFocusedRecordIndex: Integer; AIsUpdateTanggal : Boolean = True);
var
  dTanggal: TDatetime;
begin
  if FOrganization = nil then
    Exit;

  if AIsUpdateTanggal then
  begin
    dTanggal := Now;
    if AFocusedRecordIndex <> 0 then
    begin
      if not VarIsNullDate(cxGridTableContrabonSales.Values(AFocusedRecordIndex-1, cxGridColContDate.Index)) then
        dTanggal := cxGridTableContrabonSales.Date(AFocusedRecordIndex-1, cxGridColContDate.Index) + 1;
    end;

    cxGridTableContrabonSales.SetValue(AFocusedRecordIndex, cxGridColContDate.Index, dTanggal);
  end;

  cxGridTableContrabonSales.SetValue(AFocusedRecordIndex, cxGridColContFee.Index, FOrganization.ORG_FEE);

  if FOrganization.ORG_PPN <> 0 then
    cxGridTableContrabonSales.SetValue(AFocusedRecordIndex, cxGridColContPPN.Index, 'Y')
  else
    cxGridTableContrabonSales.SetValue(AFocusedRecordIndex, cxGridColContPPN.Index, 'N')
end;

procedure TfrmDialogContrabonSales.LoadData(AID : String);
begin
  ClearByTag([0,1]);
  cxGridTableContrabonSales.ClearRows;

  if AID = '' then
    Exit;

  FreeAndNil(FCS);
  FCS := TModContrabonSales(DMClient.CrudContrabonSalesClient.Retrieve(TModContrabonSales.ClassName, AID));
  if FCS = nil then
    Exit;

  LoadDataOrganization(FCS.CONT_ORGANIZATION.ID, False);

  cxGridTableContrabonSales.DataController.AppendRecord;
  IsiDataAwalContrabonSales(0);
  cxGridTableContrabonSales.SetObjectData(FCS, 0);
  HitungNilaiContrabon(0);
end;

procedure TfrmDialogContrabonSales.LoadDataOrganization(AKodeAtauID : String;
    AIsLoadByKode : Boolean);
begin
  edOrganizationName.Text := '';
  FreeAndNil(FOrganization);

  if AIsLoadByKode then
    FOrganization := DMClient.CrudClient.RetrieveByCode(TModOrganization.ClassName,  AKodeAtauID) as TModOrganization
  else begin
    FOrganization := DMClient.CrudClient.Retrieve(TModOrganization.ClassName,  AKodeAtauID) as TModOrganization;
    if FOrganization <> nil then
    edOrganization.Text := FOrganization.ORG_Code;
  end;

  if FOrganization <> nil then
  begin
    edOrganizationName.Text := FOrganization.ORG_Name;
    edAddress.Text          := FOrganization.org_address;
    edPostCode.Text         := FOrganization.ORG_PostCode;
    edNPWP.Text             := FOrganization.ORG_NPWP;
    edTelp.Text             := FOrganization.ORG_Telp;
    edFee.Value             := FOrganization.ORG_FEE;
    edPPN.Value             := FOrganization.ORG_PPN;
  end;


end;

procedure TfrmDialogContrabonSales.UpdatePropertyOrganisasidiGrid;
var
  I: Integer;
begin
  for I := 0 to cxGridTableContrabonSales.DataController.RecordCount - 1 do
  begin
    IsiDataAwalContrabonSales(i, False);
    HitungNilaiContrabon(i);
  end;
end;

end.
