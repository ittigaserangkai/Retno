unit ufrmDialogMerchandiseGroup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls, uModBarang, uInterface,
  Vcl.StdCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBExtLookupComboBox;

type
  TfrmDialogMerchandiseGroup = class(TfrmMasterDialog, ICRUDAble)
    lbKode: TLabel;
    edtCode: TEdit;
    edtName: TEdit;
    lbNama: TLabel;
    cxLookupMerchan: TcxExtLookupComboBox;
    lbDivision: TLabel;
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FModMerchandiseGroup: TModMerchandiseGroup;
    function GetModMerchandiseGroup: TModMerchandiseGroup;
    { Private declarations }
  public
    procedure LoadData(AID: String);
    procedure SaveData;
    property ModMerchandiseGroup: TModMerchandiseGroup read GetModMerchandiseGroup
        write FModMerchandiseGroup;
    { Public declarations }
  end;

var
  frmDialogMerchandiseGroup: TfrmDialogMerchandiseGroup;

implementation

uses
  uAppUtils, uConstanta, uDMClient, uDXUtils;

{$R *.dfm}

procedure TfrmDialogMerchandiseGroup.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm(CONF_VALIDATE_FOR_DELETE) then exit;
  Try
    DMCLient.CrudClient.DeleteFromDB(ModMerchandiseGroup);
    TAppUtils.Information(CONF_DELETE_SUCCESSFULLY);
    Self.Close;
  except
    TAppUtils.Error(ER_DELETE_FAILED);
    raise;
  End;
end;

procedure TfrmDialogMerchandiseGroup.actSaveExecute(Sender: TObject);
begin
  inherited;
  SaveData;
  Self.ModalResult := mrOk;
end;

procedure TfrmDialogMerchandiseGroup.FormCreate(Sender: TObject);
begin
  inherited;
  cxLookupMerchan.LoadFromDS(
    DMClient.DSProviderClient.Merchandise_GetDSLookup,
      'REF$MERCHANDISE_ID','MERCHAN_NAME' ,['REF$MERCHANDISE_ID'], Self);
  Self.AssignKeyDownEvent;
end;

function TfrmDialogMerchandiseGroup.GetModMerchandiseGroup:
    TModMerchandiseGroup;
begin
  if not Assigned(FModMerchandiseGroup) then
    FModMerchandiseGroup := TModMerchandiseGroup.Create;
  Result := FModMerchandiseGroup;
end;

procedure TfrmDialogMerchandiseGroup.LoadData(AID: String);
begin
  if Assigned(FModMerchandiseGroup) then FreeAndNil(FModMerchandiseGroup);
  FModMerchandiseGroup := DMClient.CrudClient.Retrieve(TModMerchandise.ClassName, aID) as TModMerchandiseGroup;
  edtCode.Text    := ModMerchandiseGroup.MERCHANGRUP_CODE;
  edtName.Text    := ModMerchandiseGroup.MERCHANGRUP_NAME;
end;

procedure TfrmDialogMerchandiseGroup.SaveData;
begin
  ModMerchandiseGroup.MERCHANGRUP_CODE := edtCode.Text;
  ModMerchandiseGroup.MERCHANGRUP_NAME := edtName.Text;
  Try
    ModMerchandiseGroup.ID         := DMClient.CrudClient.SaveToDBID(ModMerchandiseGroup);
    TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
  except
    TAppUtils.Error(ER_INSERT_FAILED);
    raise;
  End;

end;

end.
