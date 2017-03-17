unit ufrmDialogLokasi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls,
  StdCtrls, uRetnoUnit, ufrmLokasi, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxCurrencyEdit, System.Actions, Vcl.ActnList, ufraFooterDialog3Button,
  uInterface, uModBarang, Vcl.ComCtrls, dxBarBuiltInMenu, cxPC, cxClasses,
  dxAlertWindow;

type
  TfrmDialogLokasi = class(TfrmMasterDialog, ICrudable)
    edtCode: TEdit;
    lbl1: TLabel;
    Label1: TLabel;
    edtDescrp: TEdit;
    lbl2: TLabel;
    cbbType: TComboBox;
    chkIsActive: TCheckBox;
    lbl3: TLabel;
    lblCode: TLabel;
    edtName: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edRack: TEdit;
    edBay: TEdit;
    edShelve: TEdit;
    edPosition: TEdit;
    intedtCapacity: TcxCurrencyEdit;
    procedure FormCreate(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
  private
    FModLokasi: TModLokasi;
    function GetModLokasi: TModLokasi;
    procedure SaveData;
    procedure UpdateData;
    property ModLokasi: TModLokasi read GetModLokasi write FModLokasi;
//    procedure showDataEdit();
//    procedure prepareAddData;
  public
    procedure LoadData(AID: String = '');
    { Public declarations }
  published
  end;

var
  frmDialogLokasi: TfrmDialogLokasi;

implementation

uses uTSCommonDlg, uConn, uDMClient, uAppUtils, uDXUtils, uConstanta;

{$R *.dfm}

procedure TfrmDialogLokasi.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
end;

procedure TfrmDialogLokasi.actDeleteExecute(Sender: TObject);
begin
  inherited;
  Try
    DMClient.CrudClient.DeleteFromDB(ModLokasi);
    TAppUtils.Information(CONF_DELETE_SUCCESSFULLY);
    Self.ModalResult := mrOk;
  Except
    TAppUtils.Error(ER_DELETE_FAILED);
    raise;
  End;
end;

procedure TfrmDialogLokasi.actSaveExecute(Sender: TObject);
begin
  inherited;
  SaveData;
end;

function TfrmDialogLokasi.GetModLokasi: TModLokasi;
begin
  if not Assigned(FModLokasi) then
    FModLokasi := TModLokasi.Create;
  Result := FModLokasi;
end;

procedure TfrmDialogLokasi.LoadData(AID: String = '');
begin
  FreeAndNil(FModLokasi);
  FModLokasi := DMClient.CrudClient.Retrieve(
    TModLokasi.ClassName, aID) as TModLokasi;

  edtCode.Text          := ModLokasi.LOK_CODE;
  edtName.Text          := ModLokasi.LOK_NAME;
  edtDescrp.Text        := ModLokasi.LOK_DESCRIPTION;
  edBay.Text            := ModLokasi.LOK_BAY;
  edRack.Text           := ModLokasi.LOK_RACK;
  edShelve.Text         := ModLokasi.LOK_SHELVE;
  edPosition.Text       := ModLokasi.LOK_POSITION;
  cbbType.Text          := ModLokasi.LOK_TYPE;
  intedtCapacity.Value  := ModLokasi.LOK_CAPACITY;
  chkIsActive.Checked   := ModLokasi.LOK_IS_ACTIVE = 1;
end;

procedure TfrmDialogLokasi.SaveData;
begin
  if not ValidateEmptyCtrl then exit;
  Try
    UpdateData;
    DMClient.CrudClient.SaveToDB(ModLokasi);
    TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
    Self.ModalResult := mrOK;
  Except
    TAppUtils.Error(ER_INSERT_FAILED);
    raise;
  End;
end;

procedure TfrmDialogLokasi.UpdateData;
begin
  ModLokasi.LOK_CODE        := edtCode.Text;
  ModLokasi.LOK_NAME        := edtName.Text;
  ModLokasi.LOK_DESCRIPTION := edtDescrp.Text;
  ModLokasi.LOK_BAY         := edBay.Text;
  ModLokasi.LOK_RACK        := edRack.Text;
  ModLokasi.LOK_SHELVE      := edShelve.Text;
  ModLokasi.LOK_POSITION    := edPosition.Text;
  ModLokasi.LOK_TYPE        := cbbType.Text;
  ModLokasi.LOK_CAPACITY    := intedtCapacity.Value;
  ModLokasi.LOK_IS_ACTIVE   := TAppUtils.BoolToInt(chkIsActive.Checked);
end;

end.
