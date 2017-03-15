unit ufrmDialogAddNewMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls,
  Mask, StdCtrls, uMenuManagement, DB,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxControls,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxButtons,
  cxContainer, cxTextEdit, cxMaskEdit, cxButtonEdit, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button;

type
  TfrmDialogAddNewMenu = class(TfrmMasterDialog)
    Panel1: TPanel;
    pnl1: TPanel;
    pnl2: TPanel;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Suplier: TLabel;
    Label2: TLabel;
    cboLabel: TComboBox;
    Label6: TLabel;
    edtModName: TEdit;
    edtActionName: TEdit;
    Label7: TLabel;
    edtModCaption: TEdit;
    GroupBox2: TGroupBox;
    lbl2: TLabel;
    lbl3: TLabel;
    Label1: TLabel;
    edtParentName: TEdit;
    edtMenuCaption: TEdit;
    edtMenuName: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    GroupBox4: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    lblMenuNo: TLabel;
    lblStatus: TLabel;
    btnRefresh: TcxButton;
    btnUpdate: TcxButton;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGrid: TcxGrid;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    cxGridDBTableView1Column3: TcxGridDBColumn;
    cxGridDBTableView1Column4: TcxGridDBColumn;
    cxGridDBTableView1Column5: TcxGridDBColumn;
    cxGridDBTableView1Column6: TcxGridDBColumn;
    cxGridDBTableView1Column7: TcxGridDBColumn;
    btnSaveModule: TcxButton;
    btnSaveGroupModule: TcxButton;
    btnSaveMenu: TcxButton;
    cxSaveGroupMenu: TcxButton;
    edtModuleID: TcxButtonEdit;
    edtGroup_ID: TcxButtonEdit;
    edtModule_ID: TcxButtonEdit;
    edtParentID: TcxButtonEdit;
    edtMenuID: TcxButtonEdit;
    edtGroupID: TcxButtonEdit;
    edtMenuNo: TcxButtonEdit;
    edtGroupID2: TcxButtonEdit;
    edtMenuID2: TcxButtonEdit;
    procedure edtModIDKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtModIDClickBtn(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnShowClick(Sender: TObject);
    procedure btnSaveModuleClick(Sender: TObject);
    procedure btnSaveMenuClick(Sender: TObject);
    procedure btnSaveGroupModuleClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRefreshClick(Sender: TObject);
    procedure cxSaveGroupMenuClick(Sender: TObject);
    procedure edtModuleIDPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edtGroup_IDPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edtModule_IDPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edtParentIDPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edtMenuIDPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edtGroupIDPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edtMenuNoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edtGroupID2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edtMenuID2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
    FModID    : Integer;
    FMenuID   : Integer;
    procedure SetData;
  public
    procedure ShowWithID(aUnitID: integer; aModID: integer = 0; aMenuID: integer =
        0);
    { Public declarations }
    
  end;

var
  frmDialogAddNewMenu: TfrmDialogAddNewMenu;

implementation

uses uRetnoUnit,DateUtils, uTSCommonDlg;

{$R *.dfm}
const
  _HeaderFlag : Integer = 100001;

procedure TfrmDialogAddNewMenu.edtModIDKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if not Key = VK_F5 then Exit;
  edtModIDClickBtn(Sender);
end;

procedure TfrmDialogAddNewMenu.edtModIDClickBtn(Sender: TObject);
//var
//  sSQL2: String;
//  sSQL: String;
begin
  inherited;
//    sSQL := 'select a.mod_id as "Module ID",'
//         + ' a.mod_name as "Module Name",'
//         + ' a.mod_caption as "Menu Caption",'
//         + ' a.mod_action as "Action Name"'
//         + ' from aut$module a';
//         + IntToStr(DialogUnit);
//    with cLookUp('Daftar Module Aktif',sSQL,200,1) do
//    Begin
//      Try
//        if Strings[0] = '' then
//          Exit;
//        edtModID.Text   := Strings[0];
//        edtModName.Text := Strings[1];
//      Finally
//        Free;
//      End;
//    End;

//    sSQL2 := 'select b.gro_id, b.gro_name as role_name,'
//           + ' b.gro_description as Description'
//           + ' from aut$user_group a'
//           + ' inner join aut$group b'
//           + ' on a.ug_gro_id=b.gro_id'
//           + ' where a.ug_usr_id ='
//           + Quot(edtUserID.Text)
//           + ' and a.ug_gro_unt_id = 3';
//    with cOpenQuery(sSQL2) do
//    begin
//      try
//        edtGroupID.Text := Fields[0].AsString;
//        edtGroupName.Text := Fields[1].AsString;
//        edtketerangan.Text := Fields[2].AsString;
//      finally
//        Free;
//      end;
//    end;

end;

procedure TfrmDialogAddNewMenu.edtParentIDPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  sSQL: String;
begin
  inherited;
//  sSQL := 'select distinct b.menus_parent_menu_id,'
//       + ' a.menus_name,a.menus_caption'
//       + ' from aut$menu_structure a,aut$menu_structure b'
//       + ' where a.menus_id=b.menus_parent_menu_id';

  sSQL := 'select distinct a.MENUS_ID,'
       + ' a.menus_name,a.menus_caption'
       + ' from aut$menu_structure a'
       + ' WHERE MENUS_UNT_ID='+ IntToStr(DialogUnit);

//       ,aut$menu_structure b'
//       + ' where a.menus_id=b.menus_parent_menu_id';

//    with cLookUp('Daftar Menu Parent',sSQL,200,1) do
//    Begin
//      Try
//        if Strings[0] = '' then
//          Exit;
//        edtParentID.Text   := Strings[0];
//        edtParentName.Text := Strings[1];
//      Finally
//        Free;
//      End;
//    End;
end;

procedure TfrmDialogAddNewMenu.FormShow(Sender: TObject);
begin
  inherited;
  btnShowClick(Sender);
end;

procedure TfrmDialogAddNewMenu.btnShowClick(Sender: TObject);
var
  sSQL: String;
begin
  inherited;
  ssQL := 'select ms.menus_no as "No",  ms.MENUS_ID as "Menu ID",'
        + ' ms.menus_parent_menu_id as "Parent ID",'
        + ' ms.menus_name as "Menu Name", ms.menus_caption as "Caption",'
        + ' ms.menus_mod_id as "Mod ID"'
        + ' from aut$menu m'
        + ' left join aut$menu_structure ms on menus_id=menu_id'
        + ' where menu_gro_unt_id=' + IntToStr(DialogUnit)
        + ' order by ms.menus_no, m.menu_id';

//  cClearGrid(clgrdMenu,False);
//  cQueryToGrid(sSQL,clgrdMenu,True);
//  clgrdMenu.AutoSize  := False;
//  clgrdMenu.AutoSizeColumns(False,12);
end;

procedure TfrmDialogAddNewMenu.cxSaveGroupMenuClick(Sender: TObject);
var
  sSQL : string;
begin
  IF FModID = 0 then
  begin
    sSQL := 'INSERT INTO AUT$MENU (MENU_ID, MENU_UNT_ID, MENU_GRO_ID,'
          + ' MENU_GRO_UNT_ID) VALUES ('+ TRIm(edtMenuID2.TEXT)
          + ', '+ IntToStr(DialogUnit)
          + ', '+ Trim(edtGroupID2.Text)
          + ', '+ IntToStr(DialogUnit) + ')';
  end
  else
  begin
    sSQL  := 'UPDATE AUT$MENU SET MENU_ID = '+  TRIm(edtMenuID2.TEXT)
          + ', MENU_UNT_ID = '+ IntToStr(DialogUnit)
          + ', MENU_GRO_ID = '+ Trim(edtGroupID2.Text)
          + ', MENU_GRO_UNT_ID = '+ IntToStr(DialogUnit)
          + ' WHERE MENU_ID = '+  IntToStr(FMenuID)
          + ' AND MENU_UNT_ID = '+ IntToStr(DialogUnit)
//          + ' AND MENU_GRO_ID = '+ IntToStr(FGroupID)
          + ' AND MENU_GRO_UNT_ID = '+ IntToStr(DialogUnit)
  end;




//  if (cExecSQL(sSQL,False,_HeaderFlag)) and (SimpanBlob(sSQL, _HeaderFlag)) then
//  Begin
//    cCommitTrans;
//    CommonDlg.ShowMessage('Berhasil simpan');
//  End
//  else
//  Begin
//    cRollbackTrans;
//    CommonDlg.ShowMessage('Gagal simpan');
//  End;

end;

procedure TfrmDialogAddNewMenu.edtModuleIDPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  sSQL: String;
begin
  inherited;

  sSQL := 'select max(MOD_ID) from AUT$MODULE';
//  with cOpenQuery(sSQL) do
//  Begin
//    Try
//      edtModuleID.Text := IntToStr(Fields[0].AsInteger+1);
//    Finally
//      Free;
//    End;
//  End;

end;

procedure TfrmDialogAddNewMenu.btnSaveModuleClick(Sender: TObject);
var
  sLabel    : String;
  sSQL      : string;

begin
  inherited;
  if cboLabel.ItemIndex = 0 then sLabel := 'Add';
  if cboLabel.ItemIndex = 1 then sLabel := 'Edit';
  if cboLabel.ItemIndex = 2 then sLabel := 'Delete';
  if cboLabel.ItemIndex = 3 then sLabel := 'Refresh';
  if cboLabel.ItemIndex = 4 then sLabel := 'View';
  if cboLabel.ItemIndex = 5 then sLabel := 'Posted';

  Begin
    if FModID <> 0 then
    begin
      sSQL := 'UPDATE AUT$MODULE SET MOD_ID = '+ Trim(edtModuleID.Text)
            + ' , MOD_UNT_ID = '+ IntToStr(DialogUnit)
            + ' , MOD_NAME = '+ QuotedStr(Trim(edtModName.Text))
            + ' , MOD_CAPTION = '+ QuotedStr(Trim(edtModCaption.Text))
            + ' , MOD_LABEL = '+ QuotedStr(sLabel)
            + ' , MOD_ACTION = '+ QuotedStr(Trim(edtActionName.Text))
            + ' WHERE MOD_ID = '+ IntToStr(FModID)
            + ' AND MOD_UNT_ID = '+ IntToStr(DialogUnit);
    end
    else
    begin
      sSQL := 'insert into AUT$MODULE ('
            + ' MOD_ID,'
            + ' MOD_UNT_ID,'
            + ' MOD_NAME,'
            + ' MOD_CAPTION,'
            + ' MOD_LABEL,'
            + ' MOD_ACTION,'
            + ' MOD_ICON_PATH) values ('
            +  Trim(edtModuleID.Text) +','
            + inttostr(DialogUnit) + ','
            + QuotedStr(Trim(edtModName.Text)) +','
            + QuotedStr(Trim(edtModCaption.Text)) +','
            + QuotedStr(sLabel) +','
            + QuotedStr(Trim(edtActionName.Text)) +','
            + 'Null)' ;
    end;


//    if (cExecSQL(sSQL,False,_HeaderFlag)) and (SimpanBlob(sSQL, _HeaderFlag))  then
//    Begin
//      cCommitTrans;
//      CommonDlg.ShowMessage('Berhasil simpan module');
//    end
//    else
//    Begin
//      cRollbackTrans;
//      CommonDlg.ShowMessage('Gagal simpan data');
//    End;



  End;

end;

procedure TfrmDialogAddNewMenu.edtMenuIDPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  sSQL: String;
begin
  sSQL := 'select max(MENUS_ID) from AUT$MENU_STRUCTURE';
//  with cOpenQuery(sSQL) do
//  Begin
//    Try
//      edtMenuID.Text := IntToStr(Fields[0].AsInteger+1);
//    Finally
//      Free;
//    End;
//  End;

end;

procedure TfrmDialogAddNewMenu.btnSaveMenuClick(Sender: TObject);
var
  sSQL  : String;
  sPrnt : Integer;
begin
  inherited;

  sPrnt := 1;
  if (Trim(edtParentID.Text) = '') or ( Trim(edtParentID.Text)='0') then
    sPrnt := 0;

  if FModID = 0 then
  begin
    sSQL := 'insert into AUT$MENU_STRUCTURE ('
        + ' MENUS_ID,'
        + ' MENUS_UNT_ID,'
        + ' MENUS_NAME,'
        + ' MENUS_CAPTION,'
        + ' MENUS_MOD_ID,'
        + ' MENUS_MOD_UNT_ID,'
        + ' MENUS_PARENT_MENU_ID,'
        + ' MENUS_PARENT_UNT_ID,'
        + ' MENUS_NO)'
        + ' values ('
        +  Trim(edtMenuID.Text) + ','
        + IntToStr(DialogUnit) + ','
        + QuotedStr(edtMenuName.Text) + ','
        + QuotedStr(edtMenuCaption.Text) + ','
        + Trim(edtModuleID.Text) + ','
        + IntToStr(DialogUnit) + ',';

    if sPrnt = 0 then
    begin
      sSQL  := sSQL +' null, null, ';
    end
    else
    begin
      sSQL := sSQL + QuotedStr(edtParentID.Text) + ','
                   + IntToStr(DialogUnit) + ',';
    end;

    sSQL  := sSQL + QuotedStr(edtMenuNo.Text) + ')' ;

  end
  else
  begin
    sSQL := 'UPDATE AUT$MENU_STRUCTURE SET MENUS_ID = '+ Trim(edtMenuID.Text)
          + ' , MENUS_UNT_ID = '+ IntToStr(DialogUnit)
          + ' , MENUS_NAME = '+ QuotedStr(edtMenuName.Text)
          + ' , MENUS_CAPTION = '+ QuotedStr(edtMenuCaption.Text)
          + ' , MENUS_MOD_ID = '+ Trim(edtModuleID.Text)
          + ' , MENUS_MOD_UNT_ID = '+ IntToStr(DialogUnit);


      if sPrnt = 0 then
      begin
        sSQL  := sSQL + ' , MENUS_PARENT_MENU_ID = null'
                + ', MENUS_PARENT_UNT_ID = null, MENUS_NO = '
                + QuotedStr(edtMenuNo.Text);
      end
      else
      begin
        sSQL := sSQL + ' , MENUS_PARENT_MENU_ID = '+ QuotedStr(edtParentID.Text)
              + ', MENUS_PARENT_UNT_ID = ' + IntToStr(DialogUnit)
              + ', MENUS_NO = '+ QuotedStr(edtMenuNo.Text);
      end;

      sSQL  := sSQL + ' WHERE MENUS_ID = '+ IntToStr(FMenuID)
                + ' AND MENUS_UNT_ID = '+ IntToStr(DialogUnit);


  end; 



//  if (cExecSQL(sSQL,False,_HeaderFlag)) and (SimpanBlob(sSQL, _HeaderFlag)) then
//  Begin
//    cCommitTrans;
//    CommonDlg.ShowMessage('Berhasil simpan struktur menu');
//  End
//  else
//  Begin
//    cRollbackTrans;
//    CommonDlg.ShowMessage('Gagal simpan data');
//  End;


end;

procedure TfrmDialogAddNewMenu.edtGroupIDPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
//var
//  sSQL: String;
begin
//  inherited;
//  sSQL := 'select GRO_ID,GRO_NAME,GRO_DESCRIPTION from AUT$GROUP'
//       + ' where GRO_UNT_ID='
//       + IntToStr(DialogUnit);
//  with cLookUp('Selecting Group ID',sSQL,200,1) do
//  Begin
//    Try
//      edtGroupID.Text := Strings[0];
//    Finally
//      Free;
//    End;
//  End;

end;

procedure TfrmDialogAddNewMenu.edtGroup_IDPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  sSQL: String;
begin
  inherited;
  sSQL := 'select GRO_ID,'
       + ' GRO_NAME,GRO_DESCRIPTION'
       + ' from AUT$GROUP'
       + ' where GRO_UNT_ID='
       + IntToStr(DialogUnit);

//    with cLookUp('Daftar Group',sSQL,200,1) do
//    Begin
//      Try
//        if Strings[0] = '' then
//          Exit;
//        edtGroup_ID.Text   := Strings[0];
//      Finally
//        Free;
//      End;
//    End;

end;

procedure TfrmDialogAddNewMenu.btnSaveGroupModuleClick(Sender: TObject);
var
//  intNextID: Integer;
  sSQL: String;
begin
  inherited;
  IF FModID = 0 then
  begin
    sSQL := 'insert into AUT$GROUP_MODULE ('
        + ' GMOD_GRO_ID,'
        + ' GMOD_GRO_UNT_ID,'
        + ' GMOD_MOD_ID,'
        + ' GMOD_MOD_UNT_ID)'
        + ' values ('
        +  Trim(edtGroup_ID.Text) +','
        + IntToStr(DialogUnit) + ','
        + Trim(edtModule_ID.Text) +','
        + IntToStr(DialogUnit) +')' ;
  end
  else
  begin
    sSQL  := 'UPDATE GROUP_MODULE SET GMOD_GRO_ID = '+ Trim(edtGroup_ID.Text)
          + ' , GMOD_GRO_UNT_ID = '+ IntToStr(DialogUnit)
          + ' , GMOD_MOD_ID = '+ Trim(edtModule_ID.Text)
          + ' , GMOD_MOD_UNT_ID = '+ IntToStr(DialogUnit)
//          + ' WHERE GMOD_GRO_ID = '+ IntToStr(FGroupID)
          + ' AND GMOD_GRO_UNT_ID = '+  IntToStr(DialogUnit)
          + ' AND GMOD_MOD_ID = '+ IntToStr(FModID)
          + ' AND GMOD_MOD_UNT_ID = '+ IntToStr(DialogUnit);
  end;

//  if (cExecSQL(sSQL,False,_HeaderFlag)) and (SimpanBlob(sSQL, _HeaderFlag)) then
//  Begin
//    cCommitTrans;
//    CommonDlg.ShowMessage('Berhasil simpan group - module');
//  End
//  else
//  Begin
//    cRollbackTrans;
//    CommonDlg.ShowMessage('Gagal simpan data');
//  End;

end;

procedure TfrmDialogAddNewMenu.edtModule_IDPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  sSQL: String;
begin
  inherited;
  sSQL := 'select MOD_ID,'
       + ' MOD_NAME,MOD_CAPTION,MOD_LABEL,MOD_ACTION'
       + ' from AUT$MODULE'
       + ' where MOD_UNT_ID='
       + IntToStr(DialogUnit);

//    with cLookUp('Daftar Module',sSQL,200,1) do
//    Begin
//      Try
//        if Strings[0] = '' then
//          Exit;
//        edtModule_ID.Text   := Strings[0];
//      Finally
//        Free;
//      End;
//    End;

end;

procedure TfrmDialogAddNewMenu.edtGroupID2PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  sSQL: String;
begin
  inherited;
  sSQL := 'select GRO_ID,'
       + ' GRO_NAME,GRO_DESCRIPTION'
       + ' from AUT$GROUP'
       + ' where GRO_UNT_ID='
       + IntToStr(DialogUnit);

//    with cLookUp('Daftar Group',sSQL,200,1) do
//    Begin
//      Try
//        if Strings[0] = '' then
//          Exit;
//        edtGroupID2.Text   := Strings[0];
//      Finally
//        Free;
//      End;
//    End;

end;

procedure TfrmDialogAddNewMenu.edtMenuID2PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  sSQL: String;
begin
  inherited;
  sSQL := 'select MENUS_ID, MENUS_NAME, MENUS_CAPTION'
       + ' from AUT$MENU_STRUCTURE'
       + ' where MENUS_UNT_ID='
       + IntToStr(DialogUnit);

//    with cLookUp('Daftar Menu',sSQL,200,1) do
//    Begin
//      Try
//        if Strings[0] = '' then
//          Exit;
//        edtMenuID2.Text   := Strings[0];
//      Finally
//        Free;
//      End;
//    End;
end;

procedure TfrmDialogAddNewMenu.edtMenuNoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  sSQL: String;
begin
  inherited;
  sSQL := 'select max(a.menus_no)'
       + ' from aut$menu_structure a'
       + ' where a.menus_parent_menu_id='
       + QuotedStr(edtParentID.Text);

//  with cOpenQuery(sSQL) do
//  Begin
//    Try
//      edtMenuNo.Text := IntToStr(Fields[0].AsInteger+1);
//    Finally
//      Free;
//    End;
//  End;
end;

procedure TfrmDialogAddNewMenu.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  Action := caFree;
  frmDialogAddNewMenu := nil;
end;

procedure TfrmDialogAddNewMenu.btnRefreshClick(Sender: TObject);
var
  sSQL: String;
begin
  inherited;
  ssQL := 'select ms.menus_no as "No", ms.menus_parent_menu_id as "Parent ID",'
        + ' ms.menus_name as "Menu Name", ms.menus_caption as "Caption",'
        + ' ms.menus_mod_id as "Mod ID"'
        + ' from aut$menu m'
        + ' left join aut$menu_structure ms on menus_id=menu_id'
        + ' where menu_gro_unt_id='+ IntToStr(DialogUnit)
        + ' order by ms.menus_no, m.menu_id';

//  cClearGrid(clgrdMenu,False);
//  cQueryToGrid(sSQL,clgrdMenu,True);
//  clgrdMenu.AutoSizeColumns(False,12);

end;

procedure TfrmDialogAddNewMenu.ShowWithID(aUnitID: integer; aModID: integer =
    0; aMenuID: integer = 0);
begin
//  FGroupID  := aGroupID;
  DialogUnit   := aUnitID;
  FModID    := aModID;
  FMenuID   := aMenuID;

  if aModID = 0 then
    lblStatus.Caption := 'EDIT MENU'
  else
    lblStatus.Caption := 'INSERT MENU';

  SetData;
  Self.ShowModal;
end;

procedure TfrmDialogAddNewMenu.SetData;
var
  sSQL : string;
begin
  sSQL := 'SELECT MOD_NAME, MOD_CAPTION, MOD_LABEL, MOD_ACTION'
      + ' FROM AUT$MODULE'
      + ' WHERE MOD_ID = '+ IntToStr(FModID)
      + ' AND MOD_UNT_ID = '+ IntToStr(DialogUnit);
//  with cOpenQuery(sSQL) do
//  begin
//    try
//      if not Eof then
//      begin
//        edtModuleID.Text    := IntToStr(FModID);
//        edtModName.Text     := Fields[0].AsString;
//        edtModCaption.Text  := Fields[1].AsString;
//        edtActionName.Text  := Fields[2].AsString;
//        cboLabel.Text       := Fields[3].AsString;
//      end;
//    finally
//      Free;
//    end;
//  end;

  sSQL := 'SELECT MENUS_NAME, MENUS_CAPTION, MENUS_PARENT_MENU_ID, MENUS_NO'
      + ' FROM AUT$MENU_STRUCTURE'
      + ' WHERE MENUS_ID = '+ IntToStr(FMenuID)
      + ' AND MENUS_UNT_ID = '+ IntToStr(DialogUnit);
//  with cOpenQuery(sSQL) do
//  begin
//    try
//      if not Eof then
//      begin
//        edtMenuID.Text      := IntToStr(FMenuID);
//        edtMenuName.Text    := Fields[0].AsString;
//        edtMenuCaption.Text := Fields[1].AsString;
//        edtParentID.Text    := Fields[2].AsString;
//        edtMenuNo.Text      := Fields[3].AsString;
//
//        if (Trim(edtParentID.Text) <> '') and (Trim(edtParentID.Text) <> '0') then
//        begin
//          sSQL := 'SELECT MENUS_NAME '
//                  + ' FROM AUT$MENU_STRUCTURE'
//                  + ' WHERE MENUS_ID = '+ Fields[2].AsString
//                  + ' AND MENUS_UNT_ID = '+ IntToStr(DialogUnit);
//          with cOpenQuery(sSQL) do
//          begin
//            try
//              if not Eof then
//                edtParentName.Text  := Fields[0].AsString;
//
//            finally
//              Free;
//            end;
//          end;
//        end;
//
//      end;
//    finally
//      Free;
//    end;
//  end;


end;

end.
