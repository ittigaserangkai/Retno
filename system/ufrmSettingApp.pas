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
    cxdtrwcxvrtclgrd1EditorRow2: TcxEditorRow;
    cxdtrwcxvrtclgrd1EditorRow3: TcxEditorRow;
    cxdtrwcxvrtclgrd1EditorRow4: TcxEditorRow;
    cxdtrwcxvrtclgrd1EditorRow5: TcxEditorRow;
    cxStyleRepository1: TcxStyleRepository;
    cxstylSettingAppHeader: TcxStyle;
    btnSimpan: TcxButton;
    btnClear: TcxButton;
    procedure btnClearClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbbUnitPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure btnSimpanClick(Sender: TObject);
  private
    FCDSGUDANG: tclientDataSet;
    FCDSUNIT: tclientDataSet;
    FSettingApp: TModSettingApp;
    function GetSettingApp: TModSettingApp;
    procedure InisialisasiGudangDO;
    procedure InisialisasiUnit;
    { Private declarations }
  public
    { Public declarations }
  published
    property SettingApp: TModSettingApp read GetSettingApp write FSettingApp;
  end;

var
  frmSettingApp: TfrmSettingApp;

implementation

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
  SettingApp.GUDANG_DO  := TModGudang.CreateID(cxGridRowGudangDO.Properties.Value);

  if DMClient.CrudClient.SaveToDB(SettingApp) then
  begin
    btnClearClick(nil);
  end;
end;

procedure TfrmSettingApp.cbbUnitPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  FreeAndNil(FSettingApp);
  FSettingApp := DMClient.CrudSettingAppClient.RetrieveByCabang(TModUnit.CreateID(cbbUnit.EditValue));

  cxGridRowGudangDO.Properties.Value := null;

  if FSettingApp.GUDANG_DO <> nil then
    cxGridRowGudangDO.Properties.Value := FSettingApp.GUDANG_DO.ID;
end;

procedure TfrmSettingApp.FormCreate(Sender: TObject);
begin
  inherited;
  InisialisasiUnit;
  InisialisasiGudangDO;
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

end.
