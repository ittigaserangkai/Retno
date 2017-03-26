unit uMenuManagement;

interface
{$M+}

uses SysUtils, Controls, Classes, Menus, ActnList, DB;

type
  TMenuManagement = Class(TObject)
  private
    FUserId  : Integer;
    FUserUnt : Integer;
    arrMenuId: array of Integer;
    procedure setUserId(value: Integer);
    procedure setUserUnt(value: Integer);
    function getGroupId: Integer;
    function getGroupName: String;
    function getAllMenu: TDataSet;
    function getUserMenu: TDataSet;
    function CreateMenu(IdMenu: Integer): TMenuItem;
    function getMenuAction(IdMenu: Integer): String;
  public
    FSelfUnitID: Integer;
    {public declaration}
    constructor Create; overload;
    destructor Destroy; override;
    procedure setMenuUser;
    procedure dropMenuUser;
    property GroupId   : Integer read getGroupId;
    property GroupName : String read getGroupName;
  published
    property UserId    : Integer read FUserID write setUserId;
    property UserUnt   : Integer read FUserUnt write setUserUnt;
  end;

var
  MenuManagement: TMenuManagement;

implementation

uses uConn, ufrmMain;
{TMenuManagement}

constructor TMenuManagement.Create;
begin
  inherited;
  UserId := 0;
  UserUnt:= 0;
end;

destructor TMenuManagement.Destroy;
begin
  inherited;
  MenuManagement.Free;
end;

procedure TMenuManagement.setUserId(value: Integer);
begin
  FUserId:= value;
end;

procedure TMenuManagement.setUserUnt(value: Integer);
begin
  FUserUnt:= value;
end;

function TMenuManagement.getGroupId: Integer;
//var arrParam: TArr;
//    data    : TDataSet;
begin
  Result := 0;
//  SetLength(arrParam,2);
//  arrParam[0].tipe:= ptInteger;
//  arrParam[0].data:= UserId;
//  arrParam[1].tipe:= ptInteger;
//  arrParam[1].data:= UserUnt;
//  data:= ADConn.GetAllDataAsArray(SQL_GET_LIST_USER_GROUP_BY_USER_ID, arrParam);
//  Result:= data.fieldbyname('GRO_ID').AsInteger;
end;

function TMenuManagement.getGroupName: String;
var arrParam: TArr;
    data    : TDataSet;
begin
  SetLength(arrParam,2);
  arrParam[0].tipe:= ptInteger;
  arrParam[0].data:= UserId;
  arrParam[1].tipe:= ptInteger;
  arrParam[1].data:= UserUnt;
//  data:= ADConn.GetAllDataAsArray(SQL_GET_LIST_USER_GROUP_BY_USER_ID, arrParam);
  Result:= data.fieldbyname('GRO_NAME').AsString;
end;

function TMenuManagement.getUserMenu: TDataSet;
var arrParam: TArr;
  sLabel: string;
  sSQL: String;
begin
  sLabel := 'View';
  sSQL := 'SELECT MS.* '
        + ' FROM AUT$MENU_STRUCTURE MS '
        + ' LEFT OUTER JOIN AUT$MENU M ON (MS.MENUS_ID = M.MENU_ID) '
        + ' LEFT JOIN AUT$MODULE MOD ON (MS.MENUS_MOD_ID = MOD.MOD_ID) '
        + ' AND (MS.MENUS_MOD_UNT_ID = MOD.MOD_UNT_ID) '
        + ' WHERE (MOD.MOD_LABEL = '+QuotedStr(sLabel)
        + ' ) AND (M.MENU_GRO_ID = :PID) AND '
        + ' (M.MENU_GRO_UNT_ID = :PUNT)'
        + ' ORDER BY MS.MENUS_NO, M.MENU_ID ';
  SetLength(arrParam,2);
  arrParam[0].tipe:= ptInteger;
  arrParam[0].data:= GroupId;
  arrParam[1].tipe:= ptInteger;
  arrParam[1].data:= UserUnt;
//  Result:= ADConn.GetAllDataAsArray(sSQL, arrParam);
//  Result:= IBConn.GetAllDataAsArray(SQL_GET_LIST_MENU_BY_USER_GROUP, arrParam);
end;

procedure TMenuManagement.dropMenuUser;
var data : TDataSet;
    sName: String;
    MenuWindow: TMenuItem;
begin
  data:= getAllMenu;
  with data do
  begin
    while not Eof do
    begin
      try
        sName:= fieldbyname('MENUS_NAME').AsString;
        MenuWindow:= TMenuItem(frmMain.mmMainMenu.FindComponent(sName));
        if MenuWindow<> nil then
          MenuWindow.Free;
        Next;
      except
      end;
    end;
  end;
  frmMain.mmMainMenu := frmMain.mmMainMenu;
end;

procedure TMenuManagement.setMenuUser;
var data : TDataSet;
    i    : Integer;
begin
  data:= getUserMenu;
  SetLength(arrMenuId,data.RecordCount);
  for i:=0 to data.RecordCount-1 do
  begin
    arrMenuId[i]:= data.fieldbyname('MENUS_ID').AsInteger;
    data.Next;
  end;
  for i:=0 to Length(arrMenuId)-1 do
    CreateMenu(arrMenuId[i]);
  frmMain.mmMainMenu := frmMain.mmMainMenu;
end;

function TMenuManagement.getMenuAction(IdMenu: Integer): String;
var arrParam: TArr;
    data    : TDataSet;
begin
  SetLength(arrParam,2);
  arrParam[0].tipe:= ptInteger;
  arrParam[0].data:= IdMenu;
  arrParam[1].tipe:= ptInteger;
  arrParam[1].data:= FSelfUnitID;

//  data:= ADConn.GetAllDataAsArray(SQL_GET_LIST_ACTION_FROM_MODULE, arrParam);
  Result:= data.fieldbyname('MOD_ACTION').AsString;
end;

function TMenuManagement.CreateMenu(IdMenu: Integer): TMenuItem;
var menuParent1,
    menuParent2 : TMenuItem;
    sName, sAction,
    sCaption    : String;
    iIdParent,
    iIdModule,i : Integer;
    arrParam    : TArr;
    data        : TDataSet;
begin
  SetLength(arrParam,2);
  arrParam[0].tipe:= ptInteger;
  arrParam[0].data:= IdMenu;
  arrParam[1].tipe:= ptInteger;
  arrParam[1].data:= FSelfUnitID;

//  data:= ADConn.GetAllDataAsArray(SQL_GET_LIST_MENU_BY_MENU_ID, arrParam);
  with data do
  begin
    sName:= fieldbyname('MENUS_NAME').AsString;
    sCaption:= fieldbyname('MENUS_CAPTION').AsString;
    iIdParent:= fieldbyname('MENUS_PARENT_MENU_ID').AsInteger;
    iIdModule:= fieldbyname('MENUS_MOD_ID').AsInteger;
    if(fieldbyname('MENUS_PARENT_MENU_ID').AsInteger)>0 then
    begin
      menuParent1:= CreateMenu(iIdParent);
      menuParent2:= TMenuItem(frmMain.mmMainMenu.FindComponent(sName));
      if menuParent2=nil then
      begin
        menuParent2:= TMenuItem.Create(frmMain.mmMainMenu);
        menuParent2.Name:= sName;
        sAction:= getMenuAction(iIdModule);
        for i:=0 to frmMain.actlstMain.ActionCount-1 do
         if frmMain.actlstMain.Actions[i].Name=sAction then
         begin
           menuParent2.Action:= frmMain.actlstMain.Actions[i];
           Break;
         end;
        menuParent2.Caption:= sCaption;
        menuParent1.Add(menuParent2);
      end;
      Result:= menuParent2;
    end
    else
    begin
      menuParent1:= TMenuItem(frmMain.mmMainMenu.FindComponent(sName));
      if menuParent1=nil then
      begin
        menuParent1:= TMenuItem.Create(frmMain.mmMainMenu);
        menuParent1.Name:= sName;
        menuParent1.Caption:= sCaption;
        frmMain.mmMainMenu.Items.Insert(frmMain.mmMainMenu.Items.Count-3,menuParent1);
      end;
      Result:= menuParent1;
    end;
  end;
end;

function TMenuManagement.getAllMenu: TDataSet;
var arrParam: TArr;
begin
  SetLength(arrParam,1);
  arrParam[0].tipe:= ptInteger;
  arrParam[0].data:= UserUnt;
//  Result:= ADConn.GetAllDataAsArray(SQL_GET_LIST_MENU, arrParam);
end;

end.


