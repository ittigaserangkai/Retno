unit ufrmDialogTipePengirimanPO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls, StdCtrls,
  System.Actions, Vcl.ActnList, ufraFooterDialog3Button, uInterface,
  uModTipeKirimPO;

type
  TfrmDialogTipePengirimanPO = class(TfrmMasterDialog, ICrudAble)
    lbl1: TLabel;
    lbl2: TLabel;
    edtKodeTipePengirimanPO: TEdit;
    edtTipePengirimanPO: TEdit;
    procedure actDeleteExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
  private
    FModTipeKirimPO: TModTipeKirimPO;
    function GetModTipeKirimPO: TModTipeKirimPO;
    procedure LoadData(aID: string = '');
    procedure SaveData;
    property ModTipeKirimPO: TModTipeKirimPO read GetModTipeKirimPO write
        FModTipeKirimPO;
  public
  end;

var
  frmDialogTipePengirimanPO: TfrmDialogTipePengirimanPO;

implementation

uses uTSCommonDlg,uRetnoUnit, ufrmTipePengirimanPO, uDMClient, uAppUtils,
  uConstanta, uDXUtils;

{$R *.dfm}

procedure TfrmDialogTipePengirimanPO.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if TAppUtils.Confirm(CONF_VALIDATE_FOR_DELETE)<>True then exit;

  Try
    DMClient.CrudClient.DeleteFromDB(ModTipeKirimPO);
    TAppUtils.Information(CONF_DELETE_SUCCESSFULLY);
    Self.ModalResult:=mrOk;

  Except
    TAppUtils.Error(ER_DELETE_FAILED);
    Raise;
  end;
end;

procedure TfrmDialogTipePengirimanPO.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
end;

procedure TfrmDialogTipePengirimanPO.actSaveExecute(Sender: TObject);
begin
  inherited;
  SaveData;
end;

function TfrmDialogTipePengirimanPO.GetModTipeKirimPO: TModTipeKirimPO;
begin
  if not assigned(FModTipeKirimPO) then
    FModTipeKirimPO:=TModTipeKirimPO.Create;

  Result := FModTipeKirimPO;
end;

procedure TfrmDialogTipePengirimanPO.LoadData(aID: string = '');
begin
  FreeAndNil(FModTipeKirimPO);
  FModTipeKirimPO:= Dmclient.CrudClient.Retrieve(TModTipeKirimPO.ClassName,aID) as TModTipeKirimPO;
  edtKodeTipePengirimanPO.Text:=ModTipeKirimPO.TPKRMPO_CODE;
  edtTipePengirimanPO.Text:=ModTipeKirimPO.TPKRMPO_NAME;

end;

procedure TfrmDialogTipePengirimanPO.SaveData;
begin
  if not ValidateEmptyCtrl then exit;

 ModTipeKirimPO.TPKRMPO_CODE:=edtKodeTipePengirimanPO.Text;
 ModTipeKirimPO.TPKRMPO_NAME:=edtTipePengirimanPO.Text;
 Try
  DMClient.CrudClient.SaveToDB(ModTipeKirimPO);
  TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
  Self.ModalResult:=mrOk;

 Except
  TAppUtils.Error(ER_INSERT_FAILED);
  Raise;
 End;
end;

end.
