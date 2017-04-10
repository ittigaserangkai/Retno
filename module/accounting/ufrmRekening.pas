unit ufrmRekening;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, ufraFooter5Button, DB,
  ActnList, uConn, ComCtrls, System.Actions,  cxStyles,
  cxClasses, Vcl.Grids, cxGraphics, ufrmDialogRekening,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxCustomData, cxTL,
  cxTextEdit, cxTLdxBarBuiltInMenu, cxInplaceContainer, cxContainer, cxEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  uClientClasses,  uDMClient,
  uDBUtils, uDXUtils, DBClient, uAppUtils, cxTLData, cxDBTL, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxDBData, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid;

type
  TfrmRekening = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    pnlAll: TPanel;
    actlstRekening: TActionList;
    actAddRekening: TAction;
    actEditRekening: TAction;
    actDeleteRekening: TAction;
    actRefreshRekening: TAction;
    strgGrid: TStringGrid;
    cxDBTreeList: TcxDBTreeList;
    cxDBTreeListcxDBTreeListColumn1: TcxDBTreeListColumn;
    cxDBTreeListcxDBTreeListColumn2: TcxDBTreeListColumn;
    cxDBTreeListcxDBTreeListColumn3: TcxDBTreeListColumn;
    cxDBTreeListcxDBTreeListColumn4: TcxDBTreeListColumn;
    cxDBTreeListcxDBTreeListColumn5: TcxDBTreeListColumn;
    procedure FormDestroy(Sender: TObject);
    procedure actAddRekeningExecute(Sender: TObject);
    procedure actEditRekeningExecute(Sender: TObject);
    procedure actDeleteRekeningExecute(Sender: TObject);
    procedure actRefreshRekeningExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbpRekGroupChange(Sender: TObject);
    procedure cxDBTreeListExpanded(Sender: TcxCustomTreeList; ANode:
        TcxTreeListNode);
    procedure btnCloseClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FCDS: TClientDataset;
    FDSProvider: TDSProviderClient;
    FGrupRekeningId: string;
    function GetDSProvider: TDSProviderClient;
    procedure LoadData;
    procedure SetGrupRekeningId(const Value: string);
    property CDS: TClientDataset read FCDS write FCDS;
    property DSProvider: TDSProviderClient read GetDSProvider write FDSProvider;
//    property ModRekening: TModTipeBarang read GetModRekening write FModRekening;
  public
    function IsRekeningExist(aKode : String): Boolean;
    property GrupRekeningId: string read FGrupRekeningId write SetGrupRekeningId;
  end;

var
  frmRekening: TfrmRekening;

implementation

uses uTSCommonDlg, uConstanta, uRetnoUnit;

{$R *.dfm}

procedure TfrmRekening.FormDestroy(Sender: TObject);
begin
  inherited;
//  frmRekening := nil;
//  frmRekening.Free;
end;

procedure TfrmRekening.actAddRekeningExecute(Sender: TObject);
begin
  inherited;
//  if not Assigned(frmDialogRekening) then
  frmDialogRekening := TfrmDialogRekening.Create(Application);
  try
  //  frmDialogRekening.Caption := 'Add Rekening';
    frmDialogRekening.StatusForm := frNew;
    SetFormPropertyAndShowDialog(frmDialogRekening);

    if (frmDialogRekening.IsProcessSuccesfull) then
    begin
      CommonDlg.ShowMessage(CONF_ADD_SUCCESSFULLY);
      actRefreshRekeningExecute(Self);
    end;
  finally
    frmDialogRekening.Free;
  end;

  LoadData();
end;

procedure TfrmRekening.actEditRekeningExecute(Sender: TObject);
//var
//  TTNode: TTreeNode;
begin
  inherited;
  if not Assigned(frmDialogRekening) then
    frmDialogRekening := TfrmDialogRekening.Create(Application);

//  frmDialogRekening.Caption := 'Edit Rekening';
//  frmDialogRekening.StatusForm := frEdit;
//  frmDialogRekening.FormMode := fmEdited;
  frmDialogRekening.LoadData(CDS.FieldByName('REKENING_ID').AsString);
//  TTNode := TlistRekening.Selected;

//  frmDialogRekening.RekCode := TlistRekening.GetNodeColumn(TTNode, 0);
//  SetFormPropertyAndShowDialog(frmDialogRekening);

//  if (frmDialogRekening.IsProcessSuccesfull) then
//  begin
//    CommonDlg.ShowMessage(CONF_EDIT_SUCCESSFULLY);
//    actRefreshRekeningExecute(Self);
//  end;

//  frmDialogRekening.Free;
  if frmDialogRekening.ShowModal = mrOK then
    LoadData();
end;

procedure TfrmRekening.actDeleteRekeningExecute(Sender: TObject);
//var arrParam: TArr;
begin
  inherited;
//  if Mastercompany.ID = 0 then
//  begin
//    CommonDlg.ShowError(ER_COMPANY_NOT_SPECIFIC);
//    //frmMain.cbbCompCode.SetFocus;
//    Exit;
//  end;
//
//  if strgGrid.Cells[0, strgGrid.Row] = '' then
//  begin
//    CommonDlg.ShowError('Rekening Code Is Not Spesific');
//    strgGrid.SetFocus;
//    Exit;
//  end;
//
//  if (CommonDlg.Confirm('Are you sure you wish to delete Rekening Code ' + strgGrid.Cells[0, strgGrid.Row] + ' ?') = mrYes) then
//  begin
//    if not Assigned(Rekening) then
//      Rekening := TRekening.Create;
//
//    SetLength(arrParam, 2);
//    arrParam[0].tipe := ptString;
//    arrParam[0].data := strgGrid.Cells[0, strgGrid.Row];
//    arrParam[1].tipe := ptInteger;
//    arrParam[1].data := Mastercompany.ID;
//
//    if (Rekening.DeleteDataRekening(arrParam)) then
//    begin
//      CommonDlg.ShowMessage(CONF_DELETE_SUCCESSFULLY);
//      actRefreshRekeningExecute(Self);
//    end
//    else
//      CommonDlg.ShowError(ER_DELETE_FAILED);  
//  end;  
end;

procedure TfrmRekening.actRefreshRekeningExecute(Sender: TObject);
begin
  inherited;

  LoadData();
//  try
//    Self.Enabled := False;
//
//    if Mastercompany.ID = 0 then
//    begin
//      CommonDlg.ShowError(ER_COMPANY_NOT_SPECIFIC);
//      //frmMain.cbbCompCode.SetFocus;
//      Exit;
//    end;
//
////    TlistRekening.Clear;
////    ParseDataRekening('', nil);
//
//  finally
//    Self.Enabled := True;
//  end;

end;

procedure TfrmRekening.btnCloseClick(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TfrmRekening.SetGrupRekeningId(const Value: string);
begin
  FGrupRekeningId := Value;
end;

procedure TfrmRekening.FormShow(Sender: TObject);
begin
  inherited;
  //isi kolom string grid
  {ACCOUNT CODE
ACCOUNT NAME
ACCOUNT LEVEL
ACCOUNT DESCRIPTION
PARENT CODE
NORMAL BALANCE
H / D
}

  //actRefreshRekeningExecute(Self);
end;

function TfrmRekening.IsRekeningExist(aKode : String): Boolean;
var
  s: string;
begin
  // TODO -cMM: TfrmRekening.IsRekeningExist default body inserted
  Result := False;

  s := 'SELECT REK_CODE, REK_NAME, REK_LEVEL,'
     + ' REK_DESCRIPTION, REK_PARENT_CODE, REK_IS_DEBET,'
     + ' REK_IS_LEAF FROM REKENING'
     + ' WHERE REK_COMP_ID = ' + IntToStr(Mastercompany.ID)
     + ' And REK_PARENT_CODE = ' + QuotedStr(aKode)
     + ' ORDER BY REK_CODE ';
//  with cOpenQuery(s) do
//  begin
//    try
//      if not eof then Result := True;
//    finally
//      Free;
//    end;
//
//  end;


end;

procedure TfrmRekening.cbpRekGroupChange(Sender: TObject);
begin
  inherited;
//  if cbpRekGroup.Text <> '' then
//    GrupRekeningId := cbpRekGroup.Cells[0, cbpRekGroup.Row]
//  else
    GrupRekeningId := '';
end;

procedure TfrmRekening.cxDBTreeListExpanded(Sender: TcxCustomTreeList; ANode:
    TcxTreeListNode);
begin
  inherited;
  cxDBTreeList.ApplyBestFit;
end;

procedure TfrmRekening.FormKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
//  if(Key = VK_DELETE)and(ssctrl in Shift) then
//    exit;
//  inherited;
end;

function TfrmRekening.GetDSProvider: TDSProviderClient;
begin
  if not Assigned(FDSProvider) then
    FDSProvider := TDSProviderClient.Create(DMClient.RestConn, FALSE);
  Result := FDSProvider;
end;

procedure TfrmRekening.LoadData;
begin
  CDS := TDBUtils.DSToCDS( DSProvider.Rekening_GetDSOverview() , SELF);
  cxDBTreeList.LoadFromCDS(CDS, 'REKENING_ID', 'REKENING_PARENT_ID', FALSE);
//  cxDBTreeList.SetVisibleColumns(['REKENING_ID'], FALSE);
  cxDBTreeList.ApplyBestFit;
end;

end.
