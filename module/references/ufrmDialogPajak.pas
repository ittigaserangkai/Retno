unit ufrmDialogPajak;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls, StdCtrls,
  uModRefPajak,  uDMClient, uDBUtils, uAppUtils, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalc, uClientClasses, ufraFooterDialog3Button,
  System.Actions, Vcl.ActnList, uInterface, uDXUtils;

type
  TfrmDialogPajak = class(TfrmMasterDialog,ICRUDAble)
    lbl1: TLabel;
    Lbl2: TLabel;
    lbl3: TLabel;
    Label1: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    edtNamaPajak: TEdit;
    edtCodePajak: TEdit;
    edtPPN: TcxCalcEdit;
    edtPPNBM: TcxCalcEdit;
    procedure FormCreate(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
  private
    FModRefPajak: TModRefPajak;
    function GetModRefPajak: TModRefPajak;
    procedure SimpanData;
    property ModRefPajak: TModRefPajak read GetModRefPajak write FModRefPajak;
  public
    procedure LoadData(ID: String);
    { Public declarations }
  published
  end;

var
  frmDialogPajak: TfrmDialogPajak;
implementation

uses uConn, uTSCommonDlg,  ufrmPajak, uConstanta;

{$R *.dfm}

procedure TfrmDialogPajak.FormCreate(Sender: TObject);
begin
  inherited;
    self.AssignKeyDownEvent;
end;

procedure TfrmDialogPajak.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm(CONF_VALIDATE_FOR_DELETE) then exit;
  Try
    DMCLient.CrudClient.DeleteFromDB(ModRefPajak);
    TAppUtils.Information(CONF_DELETE_SUCCESSFULLY);
    Self.ModalResult:=mrOk;
  except
    TAppUtils.Error(ER_DELETE_FAILED);
    raise;
  End;
end;

procedure TfrmDialogPajak.actSaveExecute(Sender: TObject);
begin
  inherited;
  SimpanData;
end;

function TfrmDialogPajak.GetModRefPajak: TModRefPajak;
begin
  if not Assigned(FModRefPajak) then
    FModRefPajak := TModRefPajak.Create;
  Result := FModRefPajak;
end;

procedure TfrmDialogPajak.LoadData(ID: String);
begin
  if Assigned(fModRefPajak) then FreeAndNil(fModRefPajak);
  fModRefPajak := DMclient.CrudClient.Retrieve(TModRefPajak.ClassName, ID) as TModRefPajak;

  edtCodePajak.Text := ModRefPajak.PJK_CODE;
  edtNamaPajak.Text := ModRefPajak.PJK_NAME;
  edtPPN.Value := ModRefPajak.PJK_PPN;
  edtPPNBM.Value := ModRefPajak.PJK_PPNBM;
end;

procedure TfrmDialogPajak.SimpanData;
begin
  if not ValidateEmptyCtrl then exit;
  
  ModRefPajak.PJK_NAME  := edtNamaPajak.Text;
  ModRefPajak.PJK_CODE  := edtCodePajak.Text;
  ModRefPajak.PJK_PPN   := edtPPN.Value;
  ModRefPajak.PJK_PPNBM := edtPPNBM.Value;

  try
    DMClient.CrudClient.SaveToDB(ModRefPajak);
    TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
    self.ModalResult:=mrOk;
  except
    TAppUtils.Error(ER_INSERT_FAILED);
    raise;
  end;
end;

end.
