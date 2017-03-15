unit ufrmAddNewMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, ComCtrls,
  DB, ActnList, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxGridCustomView, cxGrid,
  ufraFooter5Button, System.Actions, cxClasses;

type
  TfrmAddNewMenu = class(TfrmMaster)
    actAddNewMenu: TActionList;
    actAddMenu: TAction;
    actEditMenu: TAction;
    actDeleteMenu: TAction;
    pnlBodyUp: TPanel;
    edtPencarian: TEdit;
    Label1: TLabel;
    fraFooter5Button1: TfraFooter5Button;
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
    procedure btnAddClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure edtPencarianKeyPress(Sender: TObject; var Key: Char);
    procedure edtPencarianChange(Sender: TObject);

  private
    { Private declarations }
//    FMenuStr  : TMenuStructure;
  public
    procedure FindDataOnGrid(aText:String);
    { Public declarations }
  end;

var
  frmAddNewMenu: TfrmAddNewMenu;
  resPoint: TPoint;

implementation

uses ufrmDialogAddNewMenu, uRetnoUnit,  uTSCommonDlg, ufrmDialogMenu;

{$R *.dfm}
const
      _kolNo      : Integer = 0;
      _kolNoIdx   : integer = 1;
      _kolMenuID  : integer = 2;
      _kolPrtID   : Integer = 3;
      _kolMenuNm  : Integer = 4;
      _kolCaption : Integer = 5;
      _kolModID   : Integer = 6;
      _HeaderFlag : Integer = 100002;


procedure TfrmAddNewMenu.btnAddClick(Sender: TObject);
begin
//  if not assigned(frmDialogAddNewMenu) then
//    application.CreateForm(TfrmDialogAddNewMenu,frmDialogAddNewMenu);
//
  //frmDialogAddNewMenu.ShowWithID(MasterNewUnit.ID);

  if not assigned(frmDialogMenu)  then
  frmDialogMenu := TfrmDialogMenu.Create(Self);

  frmDialogMenu.MenuID := 0;
  SetFormPropertyAndShowDialog(frmDialogMenu);

end;

procedure TfrmAddNewMenu.FormShow(Sender: TObject);
var
  sSQL: String;
begin
//  FMenuStr  := TMenuStructure.Create(nil);
//  MasterNewUnit.LoadByID(MasterNewUnit.ID);
//  inherited;
//  sSQL := qryMenu.SQL.Text

//  sSQL := 'select ms.menus_no as "No", ms.menus_parent_menu_id as "Parent ID",'
//        + ' ms.menus_name as "Menu Name", ms.menus_caption as "Caption",'
//        + ' ms.menus_mod_id as "Mod ID"'
//        + ' from aut$menu m'
//        + ' left join aut$menu_structure ms on menus_id=menu_id'
//        + ' where menu_gro_unt_id=3'
//        + ' order by ms.menus_no, m.menu_id';
    sSQL := 'select ms.menus_no as "Menu No",  ms.MENUS_ID as "Menu ID",'
        + ' ms.menus_parent_menu_id as "Parent ID",'
        + ' ms.menus_name as "Menu Name", ms.menus_caption as "Menu Caption",'
        + ' ms.menus_mod_id as "Mod ID"'
//        + ' from aut$menu m'
//        + ' left join
        + ' from aut$menu_structure ms '
//        + ' where MENUS_UNT_ID='+ IntToStr(MasterNewUnit.ID)
        + ' order by ms.menus_parent_menu_id ,ms.MENUS_ID, ms.menus_no';

//  cClearGrid(clgrdMenu,False);
//  cQueryToGrid(sSQL,clgrdMenu,True);
//  clgrdMenu.AutoSize  := True;


end;

procedure TfrmAddNewMenu.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmAddNewMenu.btnRefreshClick(Sender: TObject);
begin
  inherited;
  FormShow(Sender);
end;

procedure TfrmAddNewMenu.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action  := caFree;
end;

procedure TfrmAddNewMenu.FormDestroy(Sender: TObject);
begin
//  FreeAndNil(FMenuStr);
  frmAddNewMenu := nil;
  inherited;
end;

procedure TfrmAddNewMenu.btnUpdateClick(Sender: TObject);
begin
  inherited;

//  if not assigned(frmDialogAddNewMenu)  then
//    frmDialogAddNewMenu := TfrmDialogAddNewMenu.Create(Self);
//
//  frmDialogAddNewMenu.ShowWithID(MasterNewUnit.ID,clgrdMenu.Ints[_kolModID, clgrdMenu.Row],
//                   clgrdMenu.Ints[_kolMenuID, clgrdMenu.Row]);

  if not assigned(frmDialogMenu)  then
  frmDialogMenu := TfrmDialogMenu.Create(Self);

//  frmDialogMenu.MenuID := clgrdMenu.Ints[_kolMenuID, clgrdMenu.Row];
  SetFormPropertyAndShowDialog(frmDialogMenu);
end;

procedure TfrmAddNewMenu.btnDeleteClick(Sender: TObject);  
begin
  inherited;

//  if FMenuStr.LoadByID(clgrdMenu.Ints[_kolMenuID, clgrdMenu.Row], MasterNewUnit.ID) then
//  begin
//    if (CommonDlg.Confirm('Apakah Anda Ingin Menghapus Data?') = mrYES) then
//    begin
//      try
//        if FMenuStr.RemoveFromDB then
//        begin
//          cCommitTrans;
//          CommonDlg.ShowMessage('Data telah dihapus.');
//        end
//        else
//        begin
//          CommonDlg.ShowError('Gagal menghapus data.');
//        end;
//
//      finally
//        cRollbackTrans;
//      end;
//    end;
//  end;


end;

procedure TfrmAddNewMenu.edtPencarianKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = Chr(VK_RETURN) then
  begin
    if edtPencarian.Text <> '' then
    begin
//      resPoint := clgrdMenu.FindNext;
//      if (resPoint.Y <> -1) then
//      begin
//        clgrdMenu.ScrollInView(resPoint.X, resPoint.Y);
//        clgrdMenu.SelectRows(resPoint.Y, 1);
//      end;
    end;
  end;

end;

procedure TfrmAddNewMenu.edtPencarianChange(Sender: TObject);
begin
  inherited;
  FindDataOnGrid(edtPencarian.Text);
end;

procedure TfrmAddNewMenu.FindDataOnGrid(aText:String);
begin
  if (aText <> '') then
  begin
//    resPoint := clgrdMenu.Find(Point(0,0),aText,[fnIncludeFixed]);
    if (resPoint.Y <> -1) then
    begin
//      clgrdMenu.ScrollInView(resPoint.X, resPoint.Y);
//      clgrdMenu.SelectRows(resPoint.Y, 1);
    end;
  end;
end;

end.
