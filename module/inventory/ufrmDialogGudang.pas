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
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox;

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
  uDMClient, udxUtils, uModUnit, uAppUtils;


{$R *.dfm}

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
