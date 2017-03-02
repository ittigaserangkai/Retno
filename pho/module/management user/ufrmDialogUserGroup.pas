unit ufrmDialogUserGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls, System.StrUtils,
  StdCtrls, ComCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxButtons,
  cxContainer, cxEdit, cxTreeView;

type
  TFormMode = (fmAdd, fmEdit);

  ObjectMenu = class(TComponent)
  public
    OMID   : Integer;
    OModID : Integer;
  end;

  TfrmDialogUserGroup = class(TfrmMasterDialog)
    tmrCheckMenu: TTimer;
    Panel1: TPanel;
    lbl6: TLabel;
    edtDescription: TEdit;
    edtName: TEdit;
    lbl4: TLabel;
    GroupBox1: TGroupBox;
    cxTVUserGroup: TcxTreeView;
    btnCheck: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure btnCheckClick(Sender: TObject);
    procedure tmrCheckMenuTimer(Sender: TObject);
    procedure cxTVUserGroupClick(Sender: TObject);
  private
//    FUserGroup        : TUserGroup;
//    FUsrMenuModGrp    : TUserMenuModGroup;

    FIsProcessSuccessfull: boolean;
    FFormMode: TFormMode;
    FGroupId: integer;
    FcxTreeNode: TcxTreeView;
    procedure CekItems;
    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: boolean);
    procedure SetGroupId(const Value: integer);
    procedure showDataEdit;
    procedure prepareAddData;
    function SaveData: Boolean;
//    function SetMenuTable(aGroupID: integer; aModID: integer; aUnitID: integer):
//        Boolean;
  public
    function LoadDataMenu(aParentNode:TTreeNode;aParentID:Integer): TTreeNode;
    function SetCheckBox(aMenuID:Integer): Boolean;
    procedure ShowWithID(aGrpNm, aGrpDesc: string; acxTreeNode: TcxTreeView);

    { Public declarations }
  published
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property GroupId: integer read FGroupId write SetGroupId;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDialogUserGroup: TfrmDialogUserGroup;
  ssSQL : TStrings;

implementation

uses
  DB, uTSCommonDlg, uRetnoUnit, DateUtils, Math;

{$R *.dfm}

procedure TfrmDialogUserGroup.SetFormMode(const Value: TFormMode);
begin
  FFormMode:= Value;
end;

procedure TfrmDialogUserGroup.SetIsProcessSuccessfull(const Value: boolean);
begin
  FIsProcessSuccessfull:= Value;
end;

procedure TfrmDialogUserGroup.SetGroupId(const Value: integer);
begin
  FGroupId:= Value;
end;

procedure TfrmDialogUserGroup.showDataEdit;
begin
  cShowWaitWindow('Loading Menu Structure');
  try
  //  Application.ProcessMessages;
  //  LoadDataMenu(nil,1);
    cxTVUserGroup.Items := FcxTreeNode.Items;
  //  CekItems;

    tmrCheckMenu.Enabled  := True;
  finally
    cCloseWaitWindow;
  end;
end;

procedure TfrmDialogUserGroup.prepareAddData;
begin
  cShowWaitWindow('Loading Menu Structure');
//  LoadDataMenu(nil,1);
  cxTVUserGroup.Items := FcxTreeNode.Items;
  cxTVUserGroup.FullExpand;
  edtName.Clear;
  edtDescription.Clear;
  btnCheck.Visible := False;
  cCloseWaitWindow;
end;

procedure TfrmDialogUserGroup.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action:= caFree;
end;

procedure TfrmDialogUserGroup.FormDestroy(Sender: TObject);
begin
  inherited;  
//  FreeAndNil(FUserGroup);
//  FreeAndNil(FUsrMenuModGrp);

  frmDialogUserGroup:= nil;
end;

procedure TfrmDialogUserGroup.FormShow(Sender: TObject);
begin
  inherited;
//  FUserGroup        := TUserGroup.Create(self);
//  FUsrMenuModGrp    := TUserMenuModGroup.Create(nil);


  if (FFormMode = fmEdit) then
    showDataEdit
  else
    prepareAddData();

  edtName.SetFocus;

end;

procedure TfrmDialogUserGroup.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin
  inherited;
  FIsProcessSuccessfull := SaveData;
  Close;
end;


procedure TfrmDialogUserGroup.ShowWithID(aGrpNm, aGrpDesc: string; acxTreeNode:
    TcxTreeView);
begin
  edtName.Text        := aGrpNm;
  edtDescription.Text := aGrpDesc;
  FcxTreeNode         := acxTreeNode;
end;


function TfrmDialogUserGroup.LoadDataMenu(aParentNode:TTreeNode;
    aParentID:Integer): TTreeNode;
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
    cxTVUserGroup.Items.Clear;
    lTreeNode  := cxTVUserGroup.Items.AddChildFirst(nil,'Menu');
    Result     := lTreeNode;
  end;

  if aParentID = 1 then
  sSQL := 'Select AMS.MENUS_ID,AMS.MENUS_NAME,AMS.MENUS_CAPTION,AMS.MENUS_PARENT_MENU_ID,AMS.MENUS_NO,MENUS_MOD_ID '
        + ' FROM AUT$MENU_STRUCTURE AMS '
        + ' Where AMS.MENUS_PARENT_MENU_ID is null'
        + ' And AMS.MENUS_UNT_ID=' + IntToStr(DialogUnit)
  else
  sSQL := 'Select AMS.MENUS_ID,AMS.MENUS_NAME,AMS.MENUS_CAPTION,AMS.MENUS_PARENT_MENU_ID,AMS.MENUS_NO,MENUS_MOD_ID '
        + ' FROM AUT$MENU_STRUCTURE AMS '
        + ' Where AMS.MENUS_PARENT_MENU_ID = '+IntToStr(aParentID)
        + ' and AMS.MENUS_PARENT_UNT_ID = ' + IntToStr(DialogUnit);
//        + ' And AMS.MENUS_UNT_ID = ' + IntToStr(DialogUnit);

{  with cOpenQuery(sSQL) do
  begin
    try

      while not eof do
      begin
        sChild       := FieldByName('MENUS_CAPTION').AsString
                        + '*'+
                        IntToStr(FieldByName('MENUS_ID').AsInteger);

        lTreeNodeOld := lTreeNode;

        lTreeNode    := JvTreeView1.Items.AddChild(lTreeNode, sChild);

        LoadDataMenu(lTreeNode,FieldByName('MENUS_ID').AsInteger);

        lTreeNode    := lTreeNodeOld;
        Next;
      end;
    finally
      free;
    end;

  end;
}

end;

function TfrmDialogUserGroup.SetCheckBox(aMenuID:Integer): Boolean;
var
  sSQL: String;
begin
  inherited;
  Result := False;
  sSQl := 'SELECT * '
        + ' FROM AUT$MENU AM '
        + ' LEFT OUTER JOIN AUT$MENU_STRUCTURE AMS ON (AM.MENU_ID = AMS.MENUS_ID) '
        + ' AND (AM.MENU_UNT_ID = AMS.MENUS_UNT_ID) '
        + ' WHERE AM.MENU_GRO_ID = '+IntToStr(GroupId)
        + ' AND AM.MENU_GRO_UNT_ID = '+IntToStr(DialogUnit)
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

procedure TfrmDialogUserGroup.btnCheckClick(Sender: TObject);
begin
  inherited;
  cShowWaitWindow('Please wait.');
  CekItems;
  cCloseWaitWindow;
end;

procedure TfrmDialogUserGroup.CekItems;
var
  iMenuLen: Integer;
  sItems: string;
  iMenuPOS: Integer;
  i: Integer;
begin
  
  cxTVUserGroup.FullExpand;
  for i := 0 to cxTVUserGroup.Items.Count-1 do
  begin
    if cxTVUserGroup.Items.Item[i].Text <> 'Menu' then
    begin
      sItems   := cxTVUserGroup.Items.Item[i].Text;
      iMenuPOS := POS('*',sItems);
      iMenuLen := Length(sItems)-iMenuPOS;
      if SetCheckBox(StrToInt(RightStr(sItems,iMenuLen))) then
      begin
//        cxTVUserGroup.SetChecked(cxTVUserGroup.Items.Item[i],True);
        If cxTVUserGroup.Items.Item[i].Parent.Text <> 'Menu' then
//        cxTVUserGroup.SetChecked(cxTVUserGroup.Items.Item[i].Parent,True);
      end;
    end;
  end;
end;

function TfrmDialogUserGroup.SaveData: Boolean;
var
  iMenuLen: Integer;
  iMenuPOS: Integer;
  sMenuID: String;
  sSQLUpdate: string;
  sSQLDelete: string;
  iMenuID: Integer;
  sSQLInsert: string;
  i: Integer;
begin
    cShowWaitWindow('Simpan Data');
    Application.ProcessMessages;
    ssSQL := TStringList.Create;
  
    if FFormMode = fmEdit then
    begin
      sSQLUpdate := 'Update AUT$GROUP '
                  + ' Set GRO_NAME = ' + QuotedStr(edtName.Text)
                  + ' ,GRO_DESCRIPTION = ' + QuotedStr(edtDescription.Text)
                  + ' WHERE GRO_UNT_ID = '+IntToStr(DialogUnit)
                  + ' AND GRO_ID = ' + IntToStr(GroupId) + ';';
      ssSQL.Add(sSQLUpdate);   
      sSQLDelete := 'DELETE FROM AUT$MENU WHERE MENU_GRO_UNT_ID = '+ IntToStr(DialogUnit)
                  + ' and MENU_GRO_ID = '+ IntToStr(GroupId);
      ssSQL.Add(sSQLDelete);  
    end
    else
    begin
//      GroupId    := cGetNextID('GEN_AUT$GROUP_ID');
      sSQLInsert := 'INSERT INTO AUT$GROUP '
                  + ' Values(' +IntToStr(GroupId)
                  + ',' + IntToStr(DialogUnit)
                  + ',' + QuotedStr(edtName.Text)
                  + ',' + QuotedStr(edtDescription.Text) + ');';
      ssSQL.Add(sSQLInsert);
    end;
         
  
    for i := 0 to cxTVUserGroup.Items.Count-1 do
    begin
//      if (cxTVUserGroup.GetChecked(cxTVUserGroup.Items.Item[i])) and
//      (cxTVUserGroup.Items.Item[i].Text <> 'Menu') then
      begin
        sMenuID  := cxTVUserGroup.Items.Item[i].Text;
        iMenuPOS := POS('*',sMenuID);
        iMenuLen := Length(sMenuID)-iMenuPOS;
        iMenuID  := StrToInt((RightStr(sMenuID,iMenuLen)));
//        sSQL := 'SELECT MS.MENUS_ID,MS.MENUS_UNT_ID,MS.MENUS_MOD_ID,MS.MENUS_MOD_UNT_ID '
//              + ' FROM AUT$MODULE M '
//              + ' INNER JOIN AUT$MENU_STRUCTURE MS ON (M.MOD_ID = MS.MENUS_MOD_ID) '
//              + ' AND (M.MOD_UNT_ID = MS.MENUS_MOD_UNT_ID) '
//              + ' WHERE MS.MENUS_UNT_ID ='+IntToStr(UnitID)
////              + ' AND MS.MENUS_CAPTION =' + QuotedStr(cxTVUserGroup.Items.Item[i].Text);
//              + ' AND MS.MENUS_ID =' + IntToStr(iMenuID);


//        with cOpenQuery(sSQL) do
//        begin
//          try
//            If not Eof then
//            begin
//              iModulID   := fieldbyname('MENUS_MOD_ID').AsInteger;
//              iMenuID    := fieldbyname('MENUS_ID').AsInteger;
//              iModulID   := StrToInt(mmModulID.Lines[i-1]);
//              iMenuID    := StrToInt(mmMenuID.Lines[i-1]);
//              iModulID   := ObjectMenu(cxTVUserGroup.Items.Item[i]).OModID;
//              iMenuID    := ObjectMenu(cxTVUserGroup.Items.Item[i]).OMID;

//              sSQLInsert := 'INSERT INTO AUT$GROUP_MODULE '
//                          + ' VALUES('+IntToStr(GroupId)
//                          + ',' + IntToStr(UnitID)
//                          + ',' + IntToStr(iModulID)
//                          + ',' + IntToStr(UnitID) + ')';
//              ssSQL.Add(sSQLInsert);

              sSQLInsert := 'INSERT INTO AUT$MENU '
                          + ' VALUES('+IntToStr(iMenuID)
                          + ',' + IntToStr(DialogUnit)
                          + ',' + IntToStr(GroupId)
                          + ',' + IntToStr(DialogUnit) + ')';
              ssSQL.Add(sSQLInsert); 
//            end;
//          finally
//            Free;
//          end;
//        end;
      end;
    end;

    cCloseWaitWindow;
//    ssSQL.SaveToFile('D:\Test.txt');
    {
    try
    if kExecuteSQLs(FUserGroup.GetHeaderFlag, ssSQL) then
      begin
        if SimpanBlob(ssSQL,1) then
        Begin
          cCommitTrans;
          Result := True;
        end
        else
        Begin
          cRollbackTrans;
          CommonDlg.ShowError('Gagal Simpan Data');
          Result := False;
        end;
      end
      else
      Begin
        cRollbackTrans;
        CommonDlg.ShowError('Gagal Simpan Data');
        Result := False;
      end;
    finally 
    cRollbackTrans;
    ssSQL.Free;
    end;
    }
    
end;

procedure TfrmDialogUserGroup.cxTVUserGroupClick(Sender: TObject);
var
  sParent: string;
  sTOPParent: string;
  iNode: TTreeNode;
  isChecked: Boolean;
begin
  inherited;
  sTOPParent := 'Menu';
  iNode := cxTVUserGroup.Selected;
//  isChecked := cxTVUserGroup.GetChecked(iNode);
  if isChecked then
  begin
    if iNode.Parent.Text <> 'Menu' then
    repeat
//    cxTVUserGroup.SetChecked(iNode.Parent,True);
    iNode := iNode.Parent;
    sParent := iNode.Text;
    until
    sParent = sTOPParent;
  end;
end;

procedure TfrmDialogUserGroup.tmrCheckMenuTimer(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  cShowWaitWindow('Show Selected Menu');
  tmrCheckMenu.Enabled  := False;
  try
    for i := 0 to FcxTreeNode.Items.Count -1 do
    begin
//      if FjvTreeNode.GetChecked(FcxTreeNode.Items[i]) then
      begin
//        cxTVUserGroup.SetChecked(cxTVUserGroup.Items[i], True);
      end;
    end;
  finally
    cCloseWaitWindow;
  end;
  cxTVUserGroup.FullExpand;
end;

end.
