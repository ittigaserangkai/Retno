  unit ufrmDialogSupplierGroup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls, uInterface, uModSuplier,
  uDMClient, uDXUtils, uAppUtils, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxMaskEdit, cxSpinEdit,
  cxTextEdit, cxLabel, uConstanta;

type
  TfrmDialogSupplierGroup = class(TfrmMasterDialog,ICRUDAble)
    lbGroupNo: TcxLabel;
    lbNama: TcxLabel;
    lbDeskripsi: TcxLabel;
    edtNama: TcxTextEdit;
    edtDeskripsi: TcxTextEdit;
    edtGroupNo: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure edtGroupNoKeyPress(Sender: TObject; var Key: Char);
  private
    FModSupplierGroup: TModSuplierGroup;
    function GetModSupplierGroup: TModSuplierGroup;
    procedure SimpanData;
    property ModSupplierGroup: TModSuplierGroup read GetModSupplierGroup write
        FModSupplierGroup;
    { Private declarations }
  public
    procedure LoadData(ID: String);
    { Public declarations }
  end;

var
  frmDialogSupplierGroup: TfrmDialogSupplierGroup;

implementation

{$R *.dfm}

procedure TfrmDialogSupplierGroup.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
end;

procedure TfrmDialogSupplierGroup.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm(CONF_VALIDATE_FOR_DELETE) then exit;
  Try
    DMCLient.CrudClient.DeleteFromDB(ModSupplierGroup);
    TAppUtils.Information(CONF_DELETE_SUCCESSFULLY);
    Self.ModalResult:=mrOk;
  except
    TAppUtils.Error(ER_DELETE_FAILED);
    raise;
  End;
end;

procedure TfrmDialogSupplierGroup.actSaveExecute(Sender: TObject);
begin
  inherited;
  SimpanData;
end;

procedure TfrmDialogSupplierGroup.edtGroupNoKeyPress(Sender: TObject; var Key:
    Char);
begin
  inherited;
//  if not CharInSet(key,[#8,'0'..'9']) then key := #0;
end;

function TfrmDialogSupplierGroup.GetModSupplierGroup: TModSuplierGroup;
begin
  if not Assigned(FModSupplierGroup) then
    FModSupplierGroup := TModSuplierGroup.Create;
  Result := FModSupplierGroup;
end;

procedure TfrmDialogSupplierGroup.LoadData(ID: String);
begin
  if Assigned(FModSupplierGroup) then FreeAndNil(FModSupplierGroup);
  FModSupplierGroup := DMclient.CrudClient.Retrieve(TModSuplierGroup.ClassName, ID) as TModSuplierGroup;

  edtGroupNo.Text    := ModSupplierGroup.GROUP_CODE;
  edtNama.Text       := ModSupplierGroup.GROUP_NAME;
  edtDeskripsi.Text  := ModSupplierGroup.GROUP_DESCRIPTION;
end;

procedure TfrmDialogSupplierGroup.SimpanData;
begin
  if not ValidateEmptyCtrl then exit;

  ModSupplierGroup.GROUP_CODE        := edtGroupNo.Text;
  ModSupplierGroup.GROUP_NAME        := edtNama.Text;
  ModSupplierGroup.GROUP_DESCRIPTION := edtDeskripsi.Text;

  try
    DMClient.CrudClient.SaveToDB(ModSupplierGroup);
    TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
    self.ModalResult:=mrOk;
  except
    TAppUtils.Error(ER_INSERT_FAILED);
    raise;
  end;
end;

end.
