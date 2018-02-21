unit ufrmSettingApp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMaster, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles, cxVGrid,
  cxInplaceContainer, cxLabel, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, Vcl.StdCtrls,
  Vcl.ExtCtrls, cxClasses, uModApp,uModSettingApp,uDXUtils, uDMClient,
  uDBUtils, Datasnap.DBClient, uModUnit, uModGudang, Vcl.Menus, cxButtons,
  cxCurrencyEdit, uRetnoUnit, uAppUtils;

type
  TfrmSettingApp = class(TfrmMaster)
    bLoad: TcxButton;
    bPilih: TcxButton;
    btnClear: TcxButton;
    btnSimpan: TcxButton;
    cbbPilihCabang: TcxExtLookupComboBox;
    cbbUnit: TcxExtLookupComboBox;
    cxGridRowDEFAULT_BANK_BCO: TcxEditorRow;
    cxGridRowGudangDO: TcxEditorRow;
    cxGridRowPRICE_BARCODE_REQ: TcxEditorRow;
    cxGridRowRekeningHutang: TcxEditorRow;
    cxGridRowREKENING_PENDAPATAN_LABEL: TcxEditorRow;
    cxGridRowREKENING_PENDAPATAN_LAIN: TcxEditorRow;
    cxGridRowREKENING_PIUTANG_LABEL: TcxEditorRow;
    cxGridRowREKENING_PIUTANG_LAIN: TcxEditorRow;
    cxStyleRepository1: TcxStyleRepository;
    cxstylSettingAppHeader: TcxStyle;
    cxVerticalGridSettingApp: TcxVerticalGrid;
    grpPilihToko: TGroupBox;
    grpSettingParameter: TGroupBox;
    lblCabang: TcxLabel;
    lblToko: TLabel;
    pnlHeaderCabang: TPanel;
    procedure bLoadClick(Sender: TObject);
    procedure bPilihClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FCDSBANK: tclientDataSet;
    FCDSGUDANG: tclientDataSet;
    FCDSUNIT: tclientDataSet;
    FSettingApp: TModSettingApp;
    function GetSettingApp: TModSettingApp;
    procedure InisialisasiBank;
    procedure InisialisasiGudangDO;
    procedure InisialisasiUnit;
    procedure LoadSettingApp;
  published
    property SettingApp: TModSettingApp read GetSettingApp write FSettingApp;
  end;

var
  frmSettingApp: TfrmSettingApp;

implementation

uses
  uModBank;

{$R *.dfm}

procedure TfrmSettingApp.bLoadClick(Sender: TObject);
begin
  inherited;
  FreeAndNil(FSettingApp);
  FSettingApp := DMClient.CrudSettingAppClient.RetrieveByCabang(TModUnit.CreateID(cbbUnit.EditValue));

  LoadSettingApp;
end;

procedure TfrmSettingApp.bPilihClick(Sender: TObject);
begin
  inherited;
  TRetno.SetSettingApp(DMClient.CrudSettingAppClient.RetrieveByCabang(TModUnit.CreateID(cbbPilihCabang.EditValue)));
  cbbUnit.EditValue := cbbPilihCabang.EditValue;

  bLoadClick(Sender);
end;

procedure TfrmSettingApp.btnClearClick(Sender: TObject);
begin
  inherited;
  cxGridRowGudangDO.Properties.Value                  := null;
  cxGridRowRekeningHutang.Properties.Value            := null;
  cxGridRowDEFAULT_BANK_BCO.Properties.Value          := null;
  cxGridRowREKENING_PIUTANG_LAIN.Properties.Value     := null;
  cxGridRowREKENING_PENDAPATAN_LAIN.Properties.Value  := null;
  cxGridRowPRICE_BARCODE_REQ.Properties.Value         := null;
  cxGridRowREKENING_PIUTANG_LABEL.Properties.Value    := null;
  cxGridRowREKENING_PENDAPATAN_LABEL.Properties.Value := null;
end;

procedure TfrmSettingApp.btnSimpanClick(Sender: TObject);
begin
  inherited;
  SettingApp.AUTUNIT      := TModUnit.CreateID(cbbUnit.EditValue);
  if not VarIsNull(cxGridRowGudangDO.Properties.Value) then
    SettingApp.GUDANG_DO  := TModGudang.CreateID(cxGridRowGudangDO.Properties.Value);

  SettingApp.REKENING_HUTANG           := VarToStr(cxGridRowRekeningHutang.Properties.Value);
  SettingApp.REKENING_PENDAPATAN_LAIN  := VarToStr(cxGridRowREKENING_PENDAPATAN_LAIN.Properties.Value);
  SettingApp.REKENING_PIUTANG_LAIN     := VarToStr(cxGridRowREKENING_PIUTANG_LAIN.Properties.Value);
  SettingApp.PRICE_BARCODE_REQ         := VarToFloat(cxGridRowPRICE_BARCODE_REQ.Properties.Value);
  SettingApp.REKENING_PENDAPATAN_LABEL := VarToStr(cxGridRowREKENING_PENDAPATAN_LABEL.Properties.Value);
  SettingApp.REKENING_PIUTANG_LABEL    := VarToStr(cxGridRowREKENING_PIUTANG_LABEL.Properties.Value);

  if not VarIsNull(cxGridRowDEFAULT_BANK_BCO.Properties.Value) then
    SettingApp.DEFAULT_BANK_BCO  := TModBank.CreateID(cxGridRowDEFAULT_BANK_BCO.Properties.Value);


  SettingApp.ID := DMClient.CrudClient.SaveToDBID(SettingApp);

  if SettingApp.ID <>'' then
  begin
    TAppUtils.Information('Berhasil simpan Data' + #13 + 'Silahkan klik tombol untuk melihat perubahannnya');
    btnClearClick(nil);
  end else begin

  end;
end;

procedure TfrmSettingApp.FormCreate(Sender: TObject);
begin
  inherited;
  InisialisasiUnit;
  InisialisasiGudangDO;
  InisialisasiBank;
end;

procedure TfrmSettingApp.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FSettingApp);
end;

function TfrmSettingApp.GetSettingApp: TModSettingApp;
begin
  if FSettingApp = nil then
    FSettingApp := TModSettingApp.Create;

  Result := FSettingApp;
end;

procedure TfrmSettingApp.InisialisasiBank;
begin
  FCDSBANK := TDBUtils.DSToCDS(DMClient.DSProviderClient.Bank_GetDSLookup(), Self);
  TcxExtLookupComboBoxProperties(cxGridRowDEFAULT_BANK_BCO.Properties.EditProperties).LoadFromCDS(FCDSBANK,'bank_id','bank_code',['bank_id'],Self);
  TcxExtLookupComboBoxProperties(cxGridRowDEFAULT_BANK_BCO.Properties.EditProperties).SetMultiPurposeLookup;
end;

procedure TfrmSettingApp.InisialisasiGudangDO;
begin
  FCDSGUDANG := TDBUtils.DSToCDS(DMClient.DSProviderClient.Gudang_GetDSLookUp(), Self);
  TcxExtLookupComboBoxProperties(cxGridRowGudangDO.Properties.EditProperties).LoadFromCDS(FCDSGUDANG,'gudang_id','GUD_NAME',['gudang_id','gud_code'],Self);
  TcxExtLookupComboBoxProperties(cxGridRowGudangDO.Properties.EditProperties).SetMultiPurposeLookup;
end;

procedure TfrmSettingApp.InisialisasiUnit;
begin
  try
    FCDSUNIT := TDBUtils.DSToCDS(DMClient.DSProviderClient.Unit_GetDSLookUp(), Self);

    cbbUnit.Properties.LoadFromCDS(FCDSUNIT,'AUT$UNIT_ID','UNT_NAME',['AUT$UNIT_ID','UNT_CODE'],Self);
    cbbUnit.Properties.SetMultiPurposeLookup;

    cbbPilihCabang.Properties.LoadFromCDS(FCDSUNIT,'AUT$UNIT_ID','UNT_NAME',['AUT$UNIT_ID','UNT_CODE'],Self);
    cbbPilihCabang.Properties.SetMultiPurposeLookup;

    if TRetno.UnitStore = nil then
      Exit;

    if TRetno.UnitStore.ID = '' then
      Exit;

    if TRetno.UnitStore.UNT_IS_HO <> 1 then
    begin
      FCDSUNIT.Filtered := False;
      FCDSUNIT.Filter   := ' [AUT$UNIT_ID] =  ' + QuotedStr(TRetno.UnitStore.ID);
      FCDSUNIT.Filtered := True;
    end else
      FCDSUNIT.Filtered := False;

    cbbUnit.EditValue         := TRetno.UnitStore.ID;
    cbbPilihCabang.EditValue  := TRetno.UnitStore.ID;
  except
    raise
  end;
end;

procedure TfrmSettingApp.LoadSettingApp;
begin
  cxGridRowGudangDO.Properties.Value := null;
  if SettingApp.GUDANG_DO <> nil then
    cxGridRowGudangDO.Properties.Value := FSettingApp.GUDANG_DO.ID;

  if SettingApp.DEFAULT_BANK_BCO <> nil then
    cxGridRowDEFAULT_BANK_BCO.Properties.Value := FSettingApp.DEFAULT_BANK_BCO.ID;

  cxGridRowRekeningHutang.Properties.Value            := SettingApp.REKENING_HUTANG;
  cxGridRowREKENING_PIUTANG_LAIN.Properties.Value     := SettingApp.REKENING_PIUTANG_LAIN;
  cxGridRowREKENING_PENDAPATAN_LAIN.Properties.Value  := SettingApp.REKENING_PENDAPATAN_LAIN;
  cxGridRowPRICE_BARCODE_REQ.Properties.Value         := SettingApp.PRICE_BARCODE_REQ;
  cxGridRowREKENING_PIUTANG_LABEL.Properties.Value    := SettingApp.REKENING_PIUTANG_LABEL;
  cxGridRowREKENING_PENDAPATAN_LABEL.Properties.Value := SettingApp.REKENING_PENDAPATAN_LABEL;
end;

end.
