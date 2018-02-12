unit ufrmDialogShift;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ExtCtrls, uDMClient, uConstanta,
  ComCtrls, StdCtrls, System.Actions, Vcl.ActnList, ufraFooterDialog3Button,
  uModShift, uModSuplier, uInterface, uAppUtils, Datasnap.DBClient, uDXUtils,
  Data.DB;

type
  TfrmDialogShift = class(TfrmMasterDialog, ICRUDAble)
    edtNameShift: TLabeledEdit;
    dtpStart: TDateTimePicker;
    dtpEnd: TDateTimePicker;
    Label1: TLabel;
    lbl1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
  private
    FModShift: TModShift;
    function GetModShift: TModShift;
    procedure SimpanData;
    property ModShift: TModShift read GetModShift write FModShift;
  public
    procedure LoadData(ID: String);
  end;

var
  frmDialogShift: TfrmDialogShift;

implementation

uses ufrmShift, uTSCommonDlg, uRetnoUnit;

{$R *.dfm}

procedure TfrmDialogShift.FormCreate(Sender: TObject);
begin
  inherited;
  self.AssignKeyDownEvent;
end;

procedure TfrmDialogShift.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm(CONF_VALIDATE_FOR_DELETE) then exit;
  Try
    DMCLient.CrudClient.DeleteFromDB(ModShift);
    TAppUtils.Information(CONF_DELETE_SUCCESSFULLY);
    Self.ModalResult:=mrOk;
  except
    TAppUtils.Error(ER_DELETE_FAILED);
    raise;
  End;
end;

procedure TfrmDialogShift.actSaveExecute(Sender: TObject);
begin
  inherited;
  SimpanData;
end;

function TfrmDialogShift.GetModShift: TModShift;
begin
  if not Assigned(FModShift) then
    FModShift := TModShift.Create;
  Result := FModShift;
end;

procedure TfrmDialogShift.LoadData(ID: String);
begin
  FModShift := DMclient.CrudClient.Retrieve(TModShift.ClassName, ID) as TModShift;

  edtNameShift.Text := ModShift.SHIFT_NAME;
  dtpStart.DateTime :=  ModShift.SHIFT_START_TIME;
  dtpEnd.DateTime   :=  ModShift.SHIFT_END_TIME;
end;

procedure TfrmDialogShift.SimpanData;
//var
//  lModSuppGroup: TModSuplierMerchanGroup;
begin
  if not ValidateEmptyCtrl([1], True, pnlBody) then exit;

  ModShift.SHIFT_NAME       := edtNameShift.Text;
  ModShift.SHIFT_START_TIME := dtpStart.DateTime;
  ModShift.SHIFT_END_TIME   := dtpEnd.DateTime;

  try
    DMClient.CrudClient.SaveToDB(ModShift);
    TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
    self.ModalResult:=mrOk;
  except
    TAppUtils.Error(ER_INSERT_FAILED);
    raise;
  end;
end;
end.




