unit ufrmSettingApp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMaster, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles, cxVGrid,
  cxInplaceContainer, cxLabel, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, Vcl.StdCtrls,
  Vcl.ExtCtrls, cxClasses, uModApp,uModSettingApp,uDXUtils, uDMClient,
  uDBUtils, Datasnap.DBClient, uModUnit, uModGudang, Vcl.Menus, cxButtons;

type
  TfrmSettingApp = class(TfrmMaster)
    pnlHeaderCabang: TPanel;
    cbbUnit: TcxExtLookupComboBox;
    lblCabang: TcxLabel;
    pnlButton: TPanel;
    cxVerticalGridSettingApp: TcxVerticalGrid;
    cxGridRowGudangDO: TcxEditorRow;
    cxGridRowRekeningHutang: TcxEditorRow;
    cxGridRowDEFAULT_BANK_BCO: TcxEditorRow;
    cxdtrwcxvrtclgrd1EditorRow4: TcxEditorRow;
    cxdtrwcxvrtclgrd1EditorRow5: TcxEditorRow;
    cxStyleRepository1: TcxStyleRepository;
    cxstylSettingAppHeader: TcxStyle;
    btnSimpan: TcxButton;
    btnClear: TcxButton;
    procedure btnClearClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure cbbUnitPropertiesEditValueChanged(Sender: TObject);
  private
    FCDSBANK: tclientDataSet;
    FCDSGUDANG: tclientDataSet;
    FCDSUNIT: tclientDataSet;
    FSettingApp: TModSettingApp;
    function GetSettingApp: TModSettingApp;
    procedure InisialisasiGudangDO;
    procedure InisialisasiBank;
    procedure InisialisasiUnit;
    procedure LoadSettingApp;
    { Private declarations }
  public
    { Public declarations }
  published
    property SettingApp: TModSettingApp read GetSettingApp write FSettingApp;
  end;

var
  frmSettingApp: TfrmSettingApp;

implementation

uses
  uModBank;

{$R *.dfm}

procedure TfrmSettingApp.btnClearClick(Sender: TObject);
begin
  inherited;
  cxGridRowGudangDO.Properties.Value := null;
end;

procedure TfrmSettingApp.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FSettingApp);
end;

procedure TfrmSettingApp.btnSimpanClick(Sender: TObject);
begin
  inherited;
  SettingApp.AUTUNIT    := TModUnit.CreateID(cbbUnit.EditValue);
  if not VarIsNull(cxGridRowGudangDO.Properties.Value) then
    SettingApp.GUDANG_DO  := TModGudang.CreateID(cxGridRowGudangDO.Properties.Value);

  SettingApp.REKENING_HUTANG := VarToStr(cxGridRowRekeningHutang.Properties.Value);

  if not VarIsNull(cxGridRowDEFAULT_BANK_BCO.Properties.Value) then
    SettingApp.DEFAULT_BANK_BCO  := TModBank.CreateID(cxGridRowDEFAULT_BANK_BCO.Properties.Value);


  SettingApp.ID := DMClient.CrudClient.SaveToDBID(SettingApp);

  if SettingApp.ID <>'' then
  begin
    btnClearClick(nil);
  end;
end;

procedure TfrmSettingApp.cbbUnitPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  FreeAndNil(FSettingApp);
  FSettingApp := DMClient.CrudSettingAppClient.RetrieveByCabang(TModUnit.CreateID(cbbUnit.EditValue));

  LoadSettingApp;
end;

procedure TfrmSettingApp.FormCreate(Sender: TObject);
begin
  inherited;
  InisialisasiUnit;
  InisialisasiGudangDO;
  InisialisasiBank;
end;

function TfrmSettingApp.GetSettingApp: TModSettingApp;
begin
  if FSettingApp = nil then
    FSettingApp := TModSettingApp.Create;

  Result := FSettingApp;
end;

procedure TfrmSettingApp.InisialisasiGudangDO;
begin
  FCDSGUDANG := TDBUtils.DSToCDS(DMClient.DSProviderClient.Gudang_GetDSLookUp(), Self);
  TcxExtLookupComboBoxProperties(cxGridRowGudangDO.Properties.EditProperties).LoadFromCDS(FCDSGUDANG,'gudang_id','GUD_NAME',['gudang_id','gud_code'],Self);
  TcxExtLookupComboBoxProperties(cxGridRowGudangDO.Properties.EditProperties).SetMultiPurposeLookup;
end;

procedure TfrmSettingApp.InisialisasiBank;
begin
  FCDSBANK := TDBUtils.DSToCDS(DMClient.DSProviderClient.Bank_GetDSLookup(), Self);
  TcxExtLookupComboBoxProperties(cxGridRowDEFAULT_BANK_BCO.Properties.EditProperties).LoadFromCDS(FCDSBANK,'bank_id','bank_code',['bank_id'],Self);
  TcxExtLookupComboBoxProperties(cxGridRowDEFAULT_BANK_BCO.Properties.EditProperties).SetMultiPurposeLookup;
end;

procedure TfrmSettingApp.InisialisasiUnit;
begin
  try
    FCDSUNIT := TDBUtils.DSToCDS(DMClient.DSProviderClient.Unit_GetDSLookUp(), Self);

    cbbUnit.Properties.LoadFromCDS(FCDSUNIT,'AUT$UNIT_ID','UNT_NAME',['AUT$UNIT_ID','UNT_CODE'],Self);
    cbbUnit.Properties.SetMultiPurposeLookup;
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

  cxGridRowRekeningHutang.Properties.Value := SettingApp.REKENING_HUTANG;
end;

end.
