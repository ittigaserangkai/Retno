unit ufrmRekening;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, ufraFooter5Button, DB,
  ActnList, uConn, ComCtrls, System.Actions,  cxStyles,
  cxClasses, Vcl.Grids, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxCustomData, cxTL,
  cxTextEdit, cxTLdxBarBuiltInMenu, cxInplaceContainer, cxContainer, cxEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  uClientClasses,  uDMClient,
  uDBUtils, uDXUtils, DBClient, uAppUtils, cxTLData, cxDBTL, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxDBData, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ufrmMasterBrowse, dxBarBuiltInMenu, dxCore, cxDateUtils, Vcl.Menus,
  ufraFooter4Button, cxButtons, cxCalendar, cxLabel, cxPC;

type
  TfrmRekening = class(TfrmMasterBrowse)
    pnlAll: TPanel;
    cxDBTreeList: TcxDBTreeList;
    cxDBTreeListcxDBTreeListColumn1: TcxDBTreeListColumn;
    cxDBTreeListcxDBTreeListColumn2: TcxDBTreeListColumn;
    cxDBTreeListcxDBTreeListColumn3: TcxDBTreeListColumn;
    cxDBTreeListcxDBTreeListColumn4: TcxDBTreeListColumn;
    cxDBTreeListcxDBTreeListColumn5: TcxDBTreeListColumn;
    procedure actAddExecute(Sender: TObject);
    procedure actAddRekeningExecute(Sender: TObject);
    procedure actEditRekeningExecute(Sender: TObject);
    procedure actDeleteRekeningExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure cbpRekGroupChange(Sender: TObject);
    procedure cxDBTreeListExpanded(Sender: TcxCustomTreeList; ANode:
        TcxTreeListNode);
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FCDS: TClientDataset;
    FDSProvider: TDSProviderClient;
    FGrupRekeningId: string;
    function GetDSProvider: TDSProviderClient;
    procedure RefreshData; override;
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

uses uTSCommonDlg, uConstanta, uRetnoUnit, ufrmDialogRekening, uInterface;

{$R *.dfm}

procedure TfrmRekening.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogRekening);
end;

procedure TfrmRekening.actAddRekeningExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogRekening);
  RefreshData();
end;

procedure TfrmRekening.actEditRekeningExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogRekening, CDS.FieldByName('REKENING_ID').AsString);
  RefreshData();
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

procedure TfrmRekening.actEditExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogRekening, cxDBTreeList.DataController.DataSource.DataSet.FieldByName('REKENING_ID').AsString);
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
  GrupRekeningId := '';
end;

procedure TfrmRekening.cxDBTreeListExpanded(Sender: TcxCustomTreeList; ANode:
    TcxTreeListNode);
begin
  inherited;
  cxDBTreeList.ApplyBestFit;
end;

procedure TfrmRekening.FormShow(Sender: TObject);
begin
  actRefresh.Execute;
end;

function TfrmRekening.GetDSProvider: TDSProviderClient;
begin
  if not Assigned(FDSProvider) then
    FDSProvider := TDSProviderClient.Create(DMClient.RestConn, FALSE);
  Result := FDSProvider;
end;

procedure TfrmRekening.RefreshData;
begin
  CDS := TDBUtils.DSToCDS( DSProvider.Rekening_GetDSOverview() , SELF);
  cxDBTreeList.LoadFromCDS(CDS, 'REKENING_ID', 'REKENING_PARENT_ID', FALSE);
//  cxDBTreeList.SetVisibleColumns(['REKENING_ID'], FALSE);
  cxDBTreeList.ApplyBestFit;
end;

end.
