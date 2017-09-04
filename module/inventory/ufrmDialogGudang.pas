unit ufrmDialogGudang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ExtCtrls, StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxContainer, cxTextEdit, uModGudang, uInterface, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue;

type
  TfrmDialogGudang = class(TfrmMasterDialog,ICRUDAble)
    edKode: TcxTextEdit;
    edNama: TcxTextEdit;
    edAlamat: TcxTextEdit;
    edTelepon: TcxTextEdit;
    lbFax: TLabel;
    lbKota: TLabel;
    lbKodePos: TLabel;
    lbKontak: TLabel;
    edFax: TcxTextEdit;
    edKota: TcxTextEdit;
    edKodePos: TcxTextEdit;
    edKontak: TcxTextEdit;
    lbKode: TLabel;
    lbNama: TLabel;
    lbAlamat: TLabel;
    lbTelepon: TLabel;
    cxLookUpUnit: TcxExtLookupComboBox;
    lbCabang: TLabel;
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FModGudang: TModGudang;
    function GetModGudang: TModGudang;
    property ModGudang: TModGudang read GetModGudang write FModGudang;
  public
    procedure LoadData(AID: String = '');
    procedure SimpanData;
    { Public declarations }
  end;

var
  frmDialogGudang: TfrmDialogGudang;

implementation

uses
  uDMClient, udxUtils, uModUnit, uAppUtils, uConstanta;


{$R *.dfm}

procedure TfrmDialogGudang.actDeleteExecute(Sender: TObject);
begin
  inherited;
    if TAppUtils.Confirm(CONF_VALIDATE_FOR_DELETE)<>True then exit;

  Try
    DMClient.CrudClient.DeleteFromDB(ModGudang);
    TAppUtils.Information(CONF_DELETE_SUCCESSFULLY);
    Self.ModalResult:=mrOk;

  Except
    TAppUtils.Error(ER_DELETE_FAILED);
    Raise;
  end;
end;

procedure TfrmDialogGudang.actSaveExecute(Sender: TObject);
begin
  inherited;
  SimpanData;
end;

procedure TfrmDialogGudang.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
  cxLookUpUnit.LoadFromDS(
    DMClient.DSProviderClient.Unit_GetDSLookUp(),
    'AUT$UNIT_ID',
    'UNT_NAME',
    ['AUT$UNIT_ID','UNT_CODE'],self
  );
end;

function TfrmDialogGudang.GetModGudang: TModGudang;
begin
  if not assigned(FModGudang) then
    FModGudang := TModGudang.Create;
  Result := FModGudang;
end;

procedure TfrmDialogGudang.LoadData(AID: String = '');
begin
  FreeAndNil(FModGudang);
  FModGudang := dmclient.CrudClient.Retrieve(TModGudang.ClassName,AID) as TModGudang;
  edKode.Text := ModGudang.GUD_CODE;
  edNama.Text := ModGudang.GUD_NAME;
  edAlamat.Text := ModGudang.GUD_ADDRESS;
  edTelepon.Text := ModGudang.GUD_TELP;
  edFax.Text := ModGudang.GUD_FAX;
  edKota.Text := ModGudang.GUD_CITY;
  edKodePos.Text := ModGudang.GUD_POST_CODE;
  edKontak.Text := ModGudang.GUD_CONTACT_PERSON;
  cxLookUpUnit.EditValue := ModGudang.AutUnit.ID;
end;

procedure TfrmDialogGudang.SimpanData;
begin
  if not ValidateEmptyCtrl then  exit;
  ModGudang.GUD_CODE := edKode.Text;
  ModGudang.GUD_NAME := edNama.Text;
  ModGudang.GUD_ADDRESS := edAlamat.Text;
  ModGudang.GUD_TELP := edTelepon.Text;
  ModGudang.GUD_FAX := edFax.Text;
  ModGudang.GUD_CITY := edKota.Text;
  ModGudang.GUD_POST_CODE := edKodePos.Text;
  ModGudang.GUD_CONTACT_PERSON := edKontak.Text;
  if not varisnull(cxLookUpUnit.EditValue) then
    ModGudang.AutUnit := TModUnit.CreateID(cxLookUpUnit.EditValue);

  Try
    DMClient.CrudClient.SaveToDB(ModGudang)   ;
    TAppUtils.Information('Berhasil Simpan');
    Self.ModalResult := mrOk;
  Except
     TAppUtils.Error('Gagal Simpan');
     Raise;
  End;


end;

end.
