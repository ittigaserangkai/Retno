unit ufrmDialogSupplierType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls, 
  StdCtrls, uRetnoUnit, System.Actions, Vcl.ActnList, ufraFooterDialog3Button,
  uInterface, uModSuplier, uAppUtils, uDXUtils;

type
  TFormMode = (fmAdd, fmEdit);

  TfrmDialogSupplierType = class(TfrmMasterDialog,ICRUDAble)
    edtName: TEdit;
    lbl1: TLabel;
    edtCode: TEdit;
    lbl2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
  private
    FModTipeSuplier: TModTipeSuplier;
    function GetModTipeSuplier: TModTipeSuplier;
    procedure SimpanData;
    property ModTipeSuplier: TModTipeSuplier read GetModTipeSuplier write
        FModTipeSuplier;
  public
    procedure LoadData(ID: String);
  published
  end;

var
  frmDialogSupplierType: TfrmDialogSupplierType;

implementation
 uses uTSCommonDlg,  ufrmSupplierType, uDMClient, uConstanta;
{$R *.dfm}

procedure TfrmDialogSupplierType.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
end;

procedure TfrmDialogSupplierType.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm(CONF_VALIDATE_FOR_DELETE) then exit;
  Try
    DMCLient.CrudClient.DeleteFromDB(ModTipeSuplier);
    TAppUtils.Information(CONF_DELETE_SUCCESSFULLY);
    Self.ModalResult:=mrOk;
  except
    TAppUtils.Error(ER_DELETE_FAILED);
    raise;
  End;
end;

procedure TfrmDialogSupplierType.actSaveExecute(Sender: TObject);
begin
  inherited;
  SimpanData;
end;

function TfrmDialogSupplierType.GetModTipeSuplier: TModTipeSuplier;
begin
  if not Assigned(FModTipeSuplier) then
    FModTipeSuplier := TModTipeSuplier.Create;
  Result := FModTipeSuplier;
end;

procedure TfrmDialogSupplierType.LoadData(ID: String);
begin
  if Assigned(FModTipeSuplier) then FreeAndNil(FModTipeSuplier);
  FModTipeSuplier := DMclient.CrudClient.Retrieve(TModTipeSuplier.ClassName, ID) as TModTipeSuplier;

  edtCode.Text := ModTipeSuplier.TPSUP_CODE;
  edtName.Text := ModTipeSuplier.TPSUP_NAME;
end;

procedure TfrmDialogSupplierType.SimpanData;
begin
  if not ValidateEmptyCtrl then exit;

  ModTipeSuplier.TPSUP_CODE  := edtCode.Text;
  ModTipeSuplier.TPSUP_NAME  := edtName.Text;

  try
    DMClient.CrudClient.SaveToDB(ModTipeSuplier);
    TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
    self.ModalResult:=mrOk;
  except
    TAppUtils.Error(ER_INSERT_FAILED);
    raise;
  end;
end;

end.
