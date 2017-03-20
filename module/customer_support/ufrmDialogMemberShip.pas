unit ufrmDialogMemberShip;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialogBrowse, ufraFooterDialog2Button, ExtCtrls,StdCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, ufraFooterDialog3Button, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxLabel, cxDropDownEdit, cxCalendar, cxTextEdit, cxMaskEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBExtLookupComboBox, System.Actions, Vcl.ActnList,
  uDXUtils, uInterface, uDBUtils, uClientClasses, uDMClient,
  uModMember;

type
  TFormMode = (fmAdd, fmEdit);

  TfrmDialogMemberShip = class(TfrmMasterDialogBrowse, iCrudable)
    pnl1: TPanel;
    lblInput: TLabel;
    lblComboGrid: TLabel;
    lbl9: TLabel;
    lbl8: TLabel;
    lbl1: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    edtCompName: TEdit;
    edtAdrress: TEdit;
    edtNPWP: TEdit;
    edtKelurahan: TEdit;
    edtCity: TEdit;
    edtPostCode: TEdit;
    edtTelephone: TEdit;
    edtFaxNo: TEdit;
    cbpCompType: TcxExtLookupComboBox;
    cbbDocStatus: TComboBox;
    lbl3: TLabel;
    dtRegister: TcxDateEdit;
    pnl2: TPanel;
    lblAddRow: TcxLabel;
    lblDeleteRow: TcxLabel;
    lblDetilPersonal: TcxLabel;
    cxGridViewColumn1: TcxGridDBColumn;
    cxGridViewColumn2: TcxGridDBColumn;
    cxGridViewColumn4: TcxGridDBColumn;
    cxGridViewColumn5: TcxGridDBColumn;
    edtReference: TEdit;
    procedure FormCreate(Sender: TObject);
  private
    FCrud: TCrudClient;
    FModMember: TModMember;
    FModRefGrupMember: TModRefGrupMember;
    function GetCrud: TCrudClient;
    function GetModMember: TModMember;
    function GetModRefGrupMember: TModRefGrupMember;
    procedure SimpanData;
    property Crud: TCrudClient read GetCrud write FCrud;
    property ModMember: TModMember read GetModMember write FModMember;
    property ModRefGrupMember: TModRefGrupMember read GetModRefGrupMember write
        FModRefGrupMember;
  public
    procedure LoadData(AID: String);
  published
  end;

var
  frmDialogMemberShip: TfrmDialogMemberShip;

implementation

uses uTSCommonDlg, uConstanta, uAppUtils,
  Math, uRetnoUnit, ufrmMemberShip;

const
  _KolCardNo:	Integer = 0;
  _KolName: Integer = 1;
  _KolIsMain: Integer = 2;
  _KolTPMemberName: Integer = 3;
  _KolIsWNI: Integer = 4;
  _KolPlaceOfBirth: Integer = 5;
  _KolDateOfBirth: Integer = 6;
  _KolKTPNo: Integer = 7;
  _KolSex: Integer = 8;
  _KolAgama: Integer = 9;
  _KolAddress: Integer = 10;
  _KolRT: Integer = 11;
  _KolRW: Integer = 12;
  _KolKelurahan: Integer = 13;
  _KolKecamatan: Integer = 14;
  _KolKota: Integer = 15;
  _KolPostCode: Integer = 16;
  _KolTelp: Integer = 17;
  _KolIsMarried: Integer = 18;
  _KolJmlTanggungan: Integer = 19;
  _KolPendapatan: Integer = 20;
  _KolGrupMemberID: Integer = 21;
  _KolGrupMemberUnitID: Integer = 22;
  _KolIsValid: Integer = 23;
  _KolIsActive: Integer = 24;
  _KolTypeMemberID: Integer = 25;
  _KolTypeMemberUnitID: Integer = 26;
  _KolLoginID: Integer = 27;
  _KolMemberID: Integer = 28;
  _KolAgamaID: Integer = 29;

{$R *.dfm}

procedure TfrmDialogMemberShip.FormCreate(Sender: TObject);
begin
  inherited;
  dtRegister.Date                         := NOW();
end;

function TfrmDialogMemberShip.GetCrud: TCrudClient;
begin
  if not Assigned(FCrud) then
    fCrud := TCrudClient.Create(DMClient.RestConn, FALSE);
  Result := FCrud;
end;

function TfrmDialogMemberShip.GetModMember: TModMember;
begin
  Result := FModMember;
end;

function TfrmDialogMemberShip.GetModRefGrupMember: TModRefGrupMember;
begin
  Result := FModRefGrupMember;
end;

procedure TfrmDialogMemberShip.LoadData(AID: String);
begin
  if Assigned(FModRefGrupMember) then FreeAndNil(FModRefGrupMember);
  FModRefGrupMember := Crud.Retrieve(TModRefGrupMember.ClassName, AID) as TModRefGrupMember;

  dtRegister.Date                         := NOW();
  edtCompName.Text                        := ModRefGrupMember.GROMEMBER_NAME;
  edtReference.Text                       := ModRefGrupMember.GROMEMBER_IDENTITY_NO;
  edtAdrress.Text                         := ModRefGrupMember.GROMEMBER_ADDRESS;
  edtKelurahan.Text                       := ModRefGrupMember.GROMEMBER_IDENTITY_NO;
  edtCity.Text                            := ModRefGrupMember.GROMEMBER_KOTA;
  edtPostCode.Text                        := ModRefGrupMember.GROMEMBER_KODE_POS;
  edtTelephone.Text                       := ModRefGrupMember.GROMEMBER_TELP;
  edtFaxNo.Text                           := ModRefGrupMember.GROMEMBER_NO_FAX;
  cbbDocStatus.ItemIndex                  := ModRefGrupMember.GROMEMBER_IS_COMPLETE;
end;

procedure TfrmDialogMemberShip.SimpanData;
begin
  ModMember.MEMBER_ADDRESS                := edtAdrress.Text;
  try
    Crud.SaveToDB(ModMember);
    TAppUtils.Information('Simpan Berhasil.');
    Self.ModalResult := mrOK;
  except
    TAppUtils.Error('Gagal Menyimpan Data.');
    Raise
  end;
end;

end.





