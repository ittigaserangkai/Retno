unit ufrmUserGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, ufraFooter5Button, System.StrUtils,
  ComCtrls, ActnList, uFormProperty, System.Actions, cxStyles, cxClasses,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  Vcl.Menus, cxButtons, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxContainer, cxTreeView;

type
  TfrmUserGroup = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    actlstMerchandiseGroup: TActionList;
    actAddUserGroup: TAction;
    actEditUserGroup: TAction;
    actDeleteUserGroup: TAction;
    actRefreshUserGroup: TAction;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    tmrCheckMenu: TTimer;
    cxtvModul: TcxTreeView;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGrid: TcxGrid;
    btnAddMenu: TcxButton;
    btnModule: TcxButton;
    cxTreeView1: TcxTreeView;
    procedure actAddUserGroupExecute(Sender: TObject);
    procedure actEditUserGroupExecute(Sender: TObject);
    procedure actDeleteUserGroupExecute(Sender: TObject);
    procedure actRefreshUserGroupExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure jvtvModulClick(Sender: TObject);
    procedure btnAddMenuClick(Sender: TObject);
    procedure btnModuleClick(Sender: TObject);
    procedure btnModMenuClick(Sender: TObject);
    procedure strgGridDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tmrCheckMenuTimer(Sender: TObject);
  private
    FFormProperty: TFormProperty;
//    FUserGroup  : TUserGroup;
    FID    : Integer;

    procedure CekItems;
    procedure ParseHeader;
    procedure SetData;
  public
    arridModule: array of array of record
      data       : Integer;
      index      : Integer;
      isSelected : Boolean;
    end;
    function LoadDataMenu(aParentNode:TTreeNode;aParentID:Integer): TTreeNode;
    function SetCheckBox(aMenuID:Integer): Boolean;
    procedure SetProperty;
    procedure ShowWithID(aUnitID: Integer;aLoginID: integer);
  end;

var
  frmUserGroup: TfrmUserGroup;

implementation

uses ufrmDialogUserGroup, uTSCommonDlg, ufrmAddNewMenu, uRetnoUnit,
  ufrmModule, ufrmDialogAddNewMenu;

{$R *.dfm}
const
  _kolNo      : Integer = 0;
  _kolName    : Integer = 1;
  _kolDesc    : Integer = 2;
  _kolGrpID   : Integer = 3;
  _kolGrpUnt  : Integer = 4;

  _colCount   : Integer = 3;
  _rowCOunt   : Integer = 2;
  _fixedRow   : Integer = 1;


procedure TfrmUserGroup.actAddUserGroupExecute(Sender: TObject);
begin
  inherited;                 
//  if MasterNewUnit.ID=0 then
//  begin
//    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
//    Exit;
//  end;
  if not Assigned(frmDialogUserGroup) then
    Application.CreateForm(TfrmDialogUserGroup, frmDialogUserGroup);
  frmDialogUserGroup.Caption := 'Add User Group';
  frmDialogUserGroup.FormMode := fmAdd;
  frmDialogUserGroup.GroupId  := 0;
  frmDialogUserGroup.ShowWithID('','',cxTreeView1);

  SetFormPropertyAndShowDialog(frmDialogUserGroup);
  if (frmDialogUserGroup.IsProcessSuccessfull) then
  begin
//    actRefreshUserGroupExecute(Self);
    CommonDlg.ShowConfirm(atAdd);
  end;


end;

procedure TfrmUserGroup.actEditUserGroupExecute(Sender: TObject);
begin
  inherited;
//  if strgGrid.Cells[_kolGrpID,strgGrid.row]='' then Exit;
//  if MasterNewUnit.ID=0 then
//  begin
//    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
//    Exit;
//  end;
  if not Assigned(frmDialogUserGroup) then
    Application.CreateForm(TfrmDialogUserGroup, frmDialogUserGroup);
  frmDialogUserGroup.Caption := 'Edit User Group';
  frmDialogUserGroup.FormMode := fmEdit;
//  frmDialogUserGroup.GroupId  := strgGrid.Ints[_kolGrpID,strgGrid.Row];
//  frmDialogUserGroup.ShowWithID(strgGrid.Cells[_kolName ,strgGrid.Row],
//              strgGrid.Cells[_kolDesc ,strgGrid.Row], jvtvModul);
  SetFormPropertyAndShowDialog(frmDialogUserGroup);

  if (frmDialogUserGroup.IsProcessSuccessfull) then
  begin
//    actRefreshUserGroupExecute(Self);
    CommonDlg.ShowConfirm(atEdit);
  end;

  frmDialogUserGroup.Free;
end;

procedure TfrmUserGroup.actDeleteUserGroupExecute(Sender: TObject);
//var arrParam : TArr;
begin
  inherited;
//  if strgGrid.Cells[_kolName, strgGrid.row]=''
//    then Exit;

//  if (CommonDlg.Confirm('Are you sure you wish to delete User Group (Name: '
//                    + strgGrid.Cells[_kolName ,strgGrid.row]+')?') = mrYes) then
//  begin
//    if FUserGroup.LoadByID(strgGrid.Ints[_kolGrpID ,strgGrid.row],MasterNewUnit.ID) then
//    begin
//      if FUserGroup.RemoveFromDB then
//      begin
//        cCommitTrans;
//        CommonDlg.ShowMessage('Sukses menghapus group.');
//      end;
//    end
//    else
//    begin
//      CommonDlg.ShowMessage('Cek Group ID.');
//    end;
//
//  end;
end;

procedure TfrmUserGroup.actRefreshUserGroupExecute(Sender: TObject);
var
    i : Integer;
    m : Integer;
begin
  {cShowWaitWindow('Loading Menu Structure');
  ParseHeader;
  i := 0;
  m := strgGrid.RowCount;
  with cOpenQuery(GetSQLUserGroup(MasterNewUnit.ID)) do
  begin
    try
      while not Eof do
      begin
        AddRowNo(strgGrid, _kolNo, i, m, True);
        strgGrid.Cells[_kolName, i + _fixedRow]   := FieldByName('GRO_NAME').AsString;
        strgGrid.Cells[_kolDesc, i + _fixedRow]   := FieldByName('GRO_DESCRIPTION').AsString;
        strgGrid.Cells[_kolGrpID, i + _fixedRow]  := IntToStr(FieldByName('GRO_ID').AsInteger);
        strgGrid.Cells[_kolGrpUnt, i + _fixedRow] := IntToStr(FieldByName('GRO_UNT_ID').AsInteger);
        Inc(i);
        Next;
      end;
    finally
      Free;
      strgGrid.AutoSize := true;
      //memberi nilai awal
      strgGrid.Row := strgGrid.FixedRows;
      strgGrid.SelectRows(strgGrid.Row, 1);
    end;
  end;
  LoadDataMenu(nil,1);
  JvTreeView1.FullCollapse;
  cCloseWaitWindow;
 }
end;

procedure TfrmUserGroup.FormActivate(Sender: TObject);
begin
  inherited;
//  frmMain.CreateMenu((sender as TForm));
end;

procedure TfrmUserGroup.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action  := caFree;
end;

procedure TfrmUserGroup.FormDestroy(Sender: TObject);
begin
//  FreeAndNil(FUserGroup);
  frmUserGroup := nil;

  inherited;

end;

procedure TfrmUserGroup.jvtvModulClick(Sender: TObject);
var P:TPoint;
    isChecked: Boolean;
begin
  inherited;
  GetCursorPos(P);
  P := cxtvModul.ScreenToClient(P);
  if (htOnStateIcon in cxtvModul.GetHitTestInfoAt(P.X,P.Y)) then
  begin
//    isChecked:= cxtvModul.GetChecked(cxtvModul.Selected);
//    cxtvModul.SetChecked(cxtvModul.Selected,(not isChecked));
  end;
end;

procedure TfrmUserGroup.btnAddMenuClick(Sender: TObject);
begin
  inherited;
  if not Assigned(frmAddNewMenu) then
//    frmAddNewMenu := TfrmAddNewMenu.Create(Application);

//  frmAddNewMenu.FLoginId := FLoginId;
//  frmAddNewMenu.MasterNewUnit.LoadByID(MasterNewUnit.ID);
//  frmAddNewMenu.Show;

    SetProperty;                  
    frmAddNewMenu := TfrmAddNewMenu.CreateWithUser(Application,FFormProperty);


end;

procedure TfrmUserGroup.ParseHeader;
begin
//  with strgGrid do
//  begin
//    Clear;
//    Cells[_kolNo, 0]    := 'NO';
//    Cells[_kolName, 0]  := 'NAME';
//    Cells[_kolDesc, 0]  := 'DESCRIPTION';
//
//    RowCount  := _rowCOunt;
//    FixedRows := _fixedRow;
//    ColCount  := _colCount;
//  end;
end;

procedure TfrmUserGroup.ShowWithID(aUnitID: Integer;aLoginID: integer);
begin
  //FUnitID   := aUnitID;
  FID  := aLoginID;

  SetData;
  Self.Show;
end;

procedure TfrmUserGroup.btnModuleClick(Sender: TObject);
begin
  inherited;
  if not Assigned(frmModule) then
//    Application.CreateForm(TfrmModule, frmModule);
//
//  frmModule.lblHeader.Caption := 'Menu Module';
//  frmModule.ShowWithID(MasterNewUnit.ID, FID);
    SetProperty;
    frmModule := TfrmModule.CreateWithUser(Application,FFormProperty);
end;

procedure TfrmUserGroup.btnModMenuClick(Sender: TObject);
begin
  inherited;
  if not assigned(frmDialogAddNewMenu) then
    application.CreateForm(TfrmDialogAddNewMenu,frmDialogAddNewMenu);

//  frmDialogAddNewMenu.ShowWithID(MasterNewUnit.ID);
end;

procedure TfrmUserGroup.CekItems;
var
  iMenuLen: Integer;
  sItems: string;
  iMenuPOS: Integer;
  i: Integer;
begin        
  cxtvModul.FullExpand;
  for i := 0 to cxtvModul.Items.Count-1 do
  begin
    if cxtvModul.Items.Item[i].Text <> 'Menu' then
    begin
      sItems   := cxtvModul.Items.Item[i].Text;
      iMenuPOS := POS('*',sItems);
      iMenuLen := Length(sItems)-iMenuPOS;
      if SetCheckBox(StrToInt(RightStr(sItems,iMenuLen))) then
      begin
//        cxtvModul.SetChecked(cxtvModul.Items.Item[i],True);
//        If cxtvModul.Items.Item[i].Parent.Text <> 'Menu' then
//        cxtvModul.SetChecked(cxtvModul.Items.Item[i].Parent,True);
      end;
    end;
  end;
end;

function TfrmUserGroup.LoadDataMenu(aParentNode:TTreeNode; aParentID:Integer):
    TTreeNode;
var
  lTreeNodeOld  : TTreeNode;
  sChild        : string;
  sSQL          : string;
  lTreeNode     : TTreeNode;
begin
  lTreeNode := aParentNode;
  Result    := lTreeNode;

  if aParentNode = nil then
  begin
    cxTreeView1.Items.Clear;
    lTreeNode := cxTreeView1.Items.AddChildFirst(nil,'Menu');
    Result    := lTreeNode;
  end;

  if aParentID = 1 then
  sSQL := 'Select AMS.MENUS_ID,AMS.MENUS_NAME,AMS.MENUS_CAPTION,AMS.MENUS_PARENT_MENU_ID,AMS.MENUS_NO,MENUS_MOD_ID '
        + ' FROM AUT$MENU_STRUCTURE AMS '
        + ' Where AMS.MENUS_PARENT_MENU_ID is null'
//        + ' And AMS.MENUS_UNT_ID=' + IntToStr(MasterNewUnit.ID)
  else
  sSQL := 'Select AMS.MENUS_ID,AMS.MENUS_NAME,AMS.MENUS_CAPTION,AMS.MENUS_PARENT_MENU_ID,AMS.MENUS_NO,MENUS_MOD_ID '
        + ' FROM AUT$MENU_STRUCTURE AMS '
        + ' Where AMS.MENUS_PARENT_MENU_ID = '+IntToStr(aParentID)
;//        + ' and AMS.MENUS_PARENT_UNT_ID = ' + IntToStr(MasterNewUnit.ID);

//  with cOpenQuery(sSQL) do
//  begin
//    try
//      while not eof do
//      begin
////        JvTreeView1.FullCollapse;
//        sChild       := FieldByName('MENUS_CAPTION').AsString
//                        + '*'+
//                        IntToStr(FieldByName('MENUS_ID').AsInteger);
//        lTreeNodeOld := lTreeNode;
//        lTreeNode    := JvTreeView1.Items.AddChild(lTreeNode, sChild);
//
//        LoadDataMenu(lTreeNode,FieldByName('MENUS_ID').AsInteger);
//
//        lTreeNode    := lTreeNodeOld;
//        Next;
//      end;
//    finally
//      free;
//    end;
//  end;

end;

function TfrmUserGroup.SetCheckBox(aMenuID:Integer): Boolean;
var
  sSQL: String;
begin
  inherited;
  Result := False;
  sSQl := 'SELECT * '
        + ' FROM AUT$MENU AM '
        + ' LEFT OUTER JOIN AUT$MENU_STRUCTURE AMS ON (AM.MENU_ID = AMS.MENUS_ID) '
        + ' AND (AM.MENU_UNT_ID = AMS.MENUS_UNT_ID) '
//        + ' WHERE AM.MENU_GRO_ID = '+IntToStr(strgGrid.Ints[_kolGrpID,strgGrid.Row])
//        + ' AND AM.MENU_GRO_UNT_ID = '+IntToStr(MasterNewUnit.ID)
        + ' AND AMS.MENUS_ID = ' + IntToStr(aMenuID);

//  with cOpenQuery(sSQL) do
//  begin
//    try
//      If not Fieldbyname('MENU_ID').IsNull then
//      begin
//        Result := True;
//      end;
//    finally
//      Free;
//    end;
//  end;
end;

procedure TfrmUserGroup.SetData;
begin
//  FUserGroup  := TUserGroup.Create(nil);

  ParseHeader;

  lblHeader.Caption:='DATA GROUP USER';
  actRefreshUserGroupExecute(Self);
  tmrCheckMenu.Enabled := True;
  try // menunggu event timer
    cShowWaitWindow('Loading...');
  finally
    cCloseWaitWindow;
  end;

end;

procedure TfrmUserGroup.strgGridDblClick(Sender: TObject);
begin
  inherited;
  cShowWaitWindow('Loading Menu Structure');
  cxTVModul.Items := cxTreeView1.Items;
  cxTVModul.FullExpand;
  cCloseWaitWindow;
  cShowWaitWindow('Setting User Menu List');
  CekItems;
  cCloseWaitWindow;
end;

procedure TfrmUserGroup.FormShow(Sender: TObject);
begin
  inherited;
  //FUnitID   := FLoginUnitId;
  FID       := FLoginID;

  SetData;
end;  

procedure TfrmUserGroup.SetProperty;
begin
  if Assigned(FFormProperty) then
  begin
    FFormProperty.FMasterIsStore    := FMasterIsStore;
    FFormProperty.FLoginFullname    := FLoginFullname;
    FFormProperty.FLoginRole        := FLoginRole;
    FFormProperty.FLoginUsername    := FLoginUsername;
    FFormProperty.FLoginId          := FLoginId;
    FFormProperty.FLoginUnitId      := FLoginUnitId;
    FFormProperty.FFilePathReport   := FFilePathReport;
    FFormProperty.FSelfCompanyID    := MasterCompany.ID;   
//    FFormProperty.FSelfUnitId       := MasterNewUnit.ID;
    FFormProperty.FLoginIsStore    := FLoginIsStore;
  end;
end;

procedure TfrmUserGroup.FormCreate(Sender: TObject);
begin
  inherited;
  FFormProperty := TFormProperty.Create;
end;

procedure TfrmUserGroup.tmrCheckMenuTimer(Sender: TObject);
begin
  inherited;
  tmrCheckMenu.Enabled := False;
  strgGridDblClick(nil); 
end;

end.
