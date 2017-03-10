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
  uInterface, ufrmMasterDialog;

type
  TfrmMasterBrowse = class(TfrmMaster)
    fraFooter4Button1: TfraFooter4Button;
    lblFilterData: TcxLabel;
    dtAwalFilter: TcxDateEdit;
    dtAkhirFilter: TcxDateEdit;
    cxGridView: TcxGridDBTableView;
    cxlvMaster: TcxGridLevel;
    cxGrid: TcxGrid;
    btnSearch: TcxButton;
    actlstBrowse: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actClose: TAction;
    actPrint: TAction;
    actRefresh: TAction;
    lblsdFilter: TcxLabel;
    procedure actCloseExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FAutoRefreshData: Boolean;
    { Private declarations }
  protected
    function ShowDialogForm(DlgFormClass: TMasterDlgClass; AID: String = ''):
        Integer;
  public
    procedure RefreshData; dynamic; abstract;
    { Public declarations }
  published
    property AutoRefreshData: Boolean read FAutoRefreshData write FAutoRefreshData;
  end;

var
  frmMasterBrowse: TfrmMasterBrowse;

implementation

uses
  System.DateUtils, ufrmDialogBank;

{$R *.dfm}

procedure TfrmMasterBrowse.actCloseExecute(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TfrmMasterBrowse.actRefreshExecute(Sender: TObject);
begin
  inherited;
  RefreshData;
end;

procedure TfrmMasterBrowse.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmMasterBrowse.FormCreate(Sender: TObject);
begin
  inherited;
  dtAwalFilter.Date   := StartOfTheMonth(Now);
  dtAkhirFilter.Date  := Now;
  AutoRefreshData     := True;
end;

procedure TfrmMasterBrowse.FormShow(Sender: TObject);
begin
  inherited;
  actRefresh.Execute;
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
  Finally
    frm.Free;
  End;
end;

end.
