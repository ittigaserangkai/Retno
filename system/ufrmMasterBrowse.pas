unit ufrmMasterBrowse;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMaster, cxStyles,
  cxClasses, Vcl.StdCtrls, Vcl.ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxLabel, ufraFooter4Button, Vcl.Menus, cxButtons, System.Actions, Vcl.ActnList,
  uInterface, ufrmMasterDialog, dxBarBuiltInMenu, cxPC, uDMClient, uClientClasses,
  cxGridDBDataDefinitions;

type
  TfrmMasterBrowse = class(TfrmMaster)
    fraFooter4Button1: TfraFooter4Button;
    lblFilterData: TcxLabel;
    dtAwalFilter: TcxDateEdit;
    dtAkhirFilter: TcxDateEdit;
    btnSearch: TcxButton;
    actlstBrowse: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actClose: TAction;
    actPrint: TAction;
    actRefresh: TAction;
    lblsdFilter: TcxLabel;
    pgcBrowse: TcxPageControl;
    tsBrowse: TcxTabSheet;
    cxGrid: TcxGrid;
    cxGridView: TcxGridDBTableView;
    cxlvMaster: TcxGridLevel;
    actExport: TAction;
    procedure actCloseExecute(Sender: TObject);
    procedure actExportExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxGridViewDataControllerDetailExpanded(
      ADataController: TcxCustomDataController; ARecordIndex: Integer);
  private
    FAutoRefreshData: Boolean;
    { Private declarations }
  protected
    function ShowDialogForm(DlgFormClass: TMasterDlgClass; AID: String = ''):
        Integer;
    procedure RefreshData; dynamic; abstract;
  public
//    constructor CreateWithUser(aOwner: TComponent; afrmMaster : TfrmMasterBrowse);
//        overload;
    procedure GetAndRunButton(AButtonName: string);

    { Public declarations }
  published
    property AutoRefreshData: Boolean read FAutoRefreshData write FAutoRefreshData;
  end;

  TMasterBrowseClass = class of TfrmMasterBrowse;
var
  frmMasterBrowse: TfrmMasterBrowse;

implementation

uses
  System.DateUtils, uDXUtils;

{$R *.dfm}

procedure TfrmMasterBrowse.actCloseExecute(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TfrmMasterBrowse.actExportExecute(Sender: TObject);
begin
  inherited;
  cxGridView.ExportToXLS();
end;

procedure TfrmMasterBrowse.actRefreshExecute(Sender: TObject);
begin
  inherited;
  RefreshData;
end;

procedure TfrmMasterBrowse.cxGridViewDataControllerDetailExpanded(
  ADataController: TcxCustomDataController; ARecordIndex: Integer);
var
  ARecord: TcxCustomGridRecord;
  ADetailView: TcxCustomGridView;
begin
  inherited;

  ADataController.FocusedRecordIndex := ARecordIndex;
  ADetailView := nil;

  ARecord := TcxGridTableView(TcxGridDBDataController(ADataController).GridView).Controller.FocusedRecord;
  if ARecord is TcxGridMasterDataRow then
  with TcxGridMasterDataRow(ARecord) do
  begin
    ADetailView := ActiveDetailGridView;
    TcxGridDBTableView(ADetailView).ApplyBestFit();
  end;
end;
procedure TfrmMasterBrowse.FormCreate(Sender: TObject);
begin
  inherited;
  dtAwalFilter.Date   := StartOfTheMonth(Now);
  dtAkhirFilter.Date  := Now;
  AutoRefreshData     := True;

  Self.AssignKeyDownEvent;
end;

procedure TfrmMasterBrowse.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if(Key = Ord('C'))and(ssctrl in Shift) then
    GetAndRunButton('btnAdd')
  else if(Key = Ord('E'))and(ssctrl in Shift) then
    GetAndRunButton('btnUpdate')
  else if(Key = VK_DELETE)and(ssctrl in Shift) then
    GetAndRunButton('btnDelete')
  else if(Key = VK_F5)and(ssctrl in Shift) then
    GetAndRunButton('btnRefresh');
  //else if ( Key = VK_ESCAPE) then
  //  Close;
end;

procedure TfrmMasterBrowse.FormShow(Sender: TObject);
begin
  inherited;
  actRefresh.Execute;
  Self.cxGrid.SetFocus;
end;

procedure TfrmMasterBrowse.GetAndRunButton(AButtonName: string);
var
  i,j: word;
  btnFoo: TcxButton;
begin
  for i:=0 to ComponentCount-1 do
    if (Components[i] is TfraFooter4Button) then
    begin
      for j:=0 to components[i].ComponentCount-1 do
        if (components[i].Components[j].Name = AButtonName) then
        begin
          btnFoo := components[i].Components[j] as TcxButton;
          btnFoo.Click;
          exit;
        end;
    end;
end;

function TfrmMasterBrowse.ShowDialogForm(DlgFormClass: TMasterDlgClass; AID:
    String = ''): Integer;
var
  frm: TfrmMasterDialog;
  MyInterface: ICRUDAble;
begin
  frm := DlgFormClass.Create(Application);
  Try
    if Supports(frm, ICRUDAble, MyInterface) then
      if Assigned(MyInterface) and (AID<>'') then MyInterface.LoadData(AID);

    Result := frm.ShowModal;
    if (AutoRefreshData) and (Result = mrOk) then
      RefreshData;

    Self.SetFocusRec(cxGrid);
  Finally
    FreeAndNil(frm);
  End;
end;

end.
