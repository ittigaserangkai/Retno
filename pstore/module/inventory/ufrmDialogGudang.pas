unit ufrmDialogGudang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ExtCtrls, StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid;

type
  TfrmDialogGudang = class(TfrmMasterDialog)
    lbl2: TLabel;
    edtUnitID: TEdit;
    edtUnitNm: TEdit;
    Label1: TLabel;
    edtCode: TEdit;
    edtZip: TEdit;
    Label2: TLabel;
    edtAddrs: TEdit;
    Label3: TLabel;
    edtTlp: TEdit;
    Label4: TLabel;
    edtFax: TEdit;
    Label5: TLabel;
    edtCity: TEdit;
    Label6: TLabel;
    edtNm: TEdit;
    Label7: TLabel;
    edtContact: TEdit;
    Label8: TLabel;
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    Fid         : Integer;
//    FGudang     : TGudang;
    FUnitIDOld  : Integer;
    FUnitIDNew  : Integer;
    FUserID     : Integer;
    FuserUnit: Integer;
    procedure ClearData;
    procedure SetData;
    procedure LookUpData(Sender:TObject);
  public
    procedure ShowWithID(aUserUnit: Integer; aUserID: integer; aid: Integer = 0;
        aidUnit: integer = 0);
    { Public declarations }
  end;

var
  frmDialogGudang: TfrmDialogGudang;

implementation
uses uTSCommonDlg, uRetnoUnit;
{$R *.dfm}

procedure TfrmDialogGudang.ClearData;
begin
  edtUnitID.Clear;
  edtUnitNm.Clear;
  edtCode.Clear;
  edtNm.Clear;
  edtAddrs.Clear;
  edtTlp.Clear;
  edtFax.Clear;
  edtCity.Clear;
  edtZip.Clear;
  edtContact.Clear;
end;

procedure TfrmDialogGudang.footerDialogMasterbtnSaveClick(Sender: TObject);
var
  iExClass: Integer;
begin

  inherited;
  if edtUnitNm.Text = '' then
    exit;

  if FUnitIDOld = 0 then
    FUnitIDOld  := FUnitIDNew;
    
//  FGudang.UpdateData(edtAddrs.Text, edtCity.Text, UpperCase(edtCode.Text), edtContact.Text,
//                    edtFax.Text, edtNm.Text, Fid, FUnitIDOld, edtZip.Text, edtTlp.Text,
//                    FUnitIDNew, FuserUnit);
//
//  iExClass := SaveData(FGudang);
  if iExClass = 0 then
  begin
    if Fid = 0 then
    begin
      ClearData;
      edtUnitID.SetFocus;
    end
    else
      Self.Close;
  end
  else
    CommonDlg.ShowError('Gagal simpan data!!');

end;

procedure TfrmDialogGudang.SetData;
begin
  if Fid <> 0 then
  begin
    {if FGudang.LoadByID(Fid, FUnitIDOld) then
    begin
      edtUnitID.Text  := FGudang.NewUnit.Kode;
      edtUnitNm.Text  := FGudang.NewUnit.Nama;
      edtCode.Text    := FGudang.Code;
      edtNm.Text      := FGudang.GudName;
      edtAddrs.Text   := FGudang.Address;
      edtTlp.Text     := FGudang.Tlp;
      edtFax.Text     := FGudang.Fax;
      edtCity.Text    := FGudang.City;
      edtZip.Text     := FGudang.PostCode;
      edtContact.Text := FGudang.ContactPerson;
    end
    else
      CommonDlg.ShowError('Data tidak di temukan');
      }
  end;
end;

procedure TfrmDialogGudang.ShowWithID(aUserUnit: Integer; aUserID: integer;
    aid: Integer = 0; aidUnit: integer = 0);
begin

  FuserUnit   := aUserUnit;
  FUserID     := aUserID;
  FUnitIDOld  := aidUnit;
  FUnitIDNew  := FUnitIDOld;
  Fid         := aid;
//  FGudang     := TGudang.CreateWithUser(nil, FUserID);

  SetData;
  Self.ShowModal;

end;

procedure TfrmDialogGudang.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = vk_F5) and (not (ssCtrl in Shift)) then
    LookUpData(ActiveControl);
end;

procedure TfrmDialogGudang.LookUpData(Sender:TObject);
var
  sSQL  : string;
  aFid  : string;
  aCode : string;
  aNm   : string;
begin
  if Sender = edtUnitID then
  begin
     sSQL := 'select a.UNT_ID, UNT_CODE, a.UNT_NAME, a.UNT_DESCRIPTION'
        + ' from AUT$UNIT a';

//    GetDataIdNm('Unit', sSQL, aFid, aCode, aNm);

    if aFid = '' then
      FUnitIDNew  := 0
    else
      FUnitIDNew  := StrToInt(aFid);

    edtUnitID.Text  := aCode;
    edtUnitNm.Text  := aNm;

  end;
 
end;

procedure TfrmDialogGudang.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action  := caFree;
end;

procedure TfrmDialogGudang.FormDestroy(Sender: TObject);
begin
  inherited;
//  FreeAndNil(FGudang);
  frmDialogGudang := nil;
end;

end.
