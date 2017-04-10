unit ufrmCXLookup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Datasnap.DSProxyRest, uDMClient,
  uClientClasses, Datasnap.DSClientRest, Data.DB, Data.SqlExpr,
  Datasnap.Provider, Datasnap.DBClient, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, cxControls, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Vcl.StdCtrls, cxButtons, cxContainer, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxLabel, Vcl.ExtCtrls, dxBarBuiltInMenu, cxPC;

type
  TLookupClient = class(TDSAdminRestClient)
  private
    FLookupCommand : TDSRestCommand;
  public
    function GetLookupData(aCommandName: String; aStartDate: TDateTime = 0;
        aEndDate: TDateTime = 0): TDataSet;
  end;

  TfrmCXLookup = class(TForm)
    pnlHeader: TPanel;
    lblHeader: TLabel;
    lblFilterData: TcxLabel;
    StartDate: TcxDateEdit;
    EndDate: TcxDateEdit;
    btnRefresh: TcxButton;
    lblsdFilter: TcxLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    lbEscape: TLabel;
    btnClose: TcxButton;
    btnOK: TcxButton;
    Label1: TLabel;
    cxGrid: TcxGrid;
    cxGridView: TcxGridDBTableView;
    cxlvMaster: TcxGridLevel;
    procedure btnRefreshClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure cxGridViewDblClick(Sender: TObject);
    procedure cxGridViewKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FLookupClient : TLookupClient;
    FCDS: TClientDataset;
    FCommandName: String;
    FMultiSelect: Boolean;
    procedure HideDateParams;
    procedure RefreshDataSet;
    { Private declarations }
  public
    constructor Create(ARestConn: TDSRestConnection; aMultiSelect: Boolean =
        False); reintroduce;
    class function Execute(aCaption, aCommand: String; aStartDate: TDateTime = 0;
        aEndDate: TDateTime = 0): TfrmCXLookup;
    procedure HideFields(FieldNames: Array Of String);
    property CDS: TClientDataset read FCDS write FCDS;
    property CommandName: String read FCommandName write FCommandName;
    { Public declarations }
  published
    property MultiSelect: Boolean read FMultiSelect write FMultiSelect;
  end;

var
  frmCXLookup: TfrmCXLookup;

const
  check_flag : String = 'check_flag';


implementation

uses
  uDBUtils, uDXUtils, System.DateUtils;

{$R *.dfm}



procedure TfrmCXLookup.btnRefreshClick(Sender: TObject);
begin
  RefreshDataSet;
end;

procedure TfrmCXLookup.btnCloseClick(Sender: TObject);
begin
  Self.ModalResult := mrCancel;
end;

procedure TfrmCXLookup.btnOKClick(Sender: TObject);
begin
  if not CDS.Eof then
    Self.ModalResult := mrOk;
end;

constructor TfrmCXLookup.Create(ARestConn: TDSRestConnection; aMultiSelect:
    Boolean = False);
begin
  inherited Create(Application);
  FLookupClient := TLookupClient.Create(ARestConn, False);
  Self.MultiSelect := aMultiSelect;
end;

procedure TfrmCXLookup.cxGridViewDblClick(Sender: TObject);
begin
  btnOK.Click;
end;

procedure TfrmCXLookup.cxGridViewKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  if Key = VK_RETURN then btnOK.Click;
end;

class function TfrmCXLookup.Execute(aCaption, aCommand: String; aStartDate:
    TDateTime = 0; aEndDate: TDateTime = 0): TfrmCXLookup;
begin
  Result                    := TfrmCXLookup.Create(DMClient.RestConn);
  Result.lblHeader.Caption  := aCaption;
  Result.CommandName        := aCommand;
  Result.StartDate.Date     := aStartDate;
  Result.EndDate.Date       := aEndDate;
  if (aStartDate = 0) and (aEndDate = 0) then Result.HideDateParams;
  Result.RefreshDataSet;
end;

procedure TfrmCXLookup.FormKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  If Key = VK_ESCAPE then Self.Close;
end;

procedure TfrmCXLookup.HideDateParams;
begin
  lblFilterData.Visible := False;
  StartDate.Visible     := False;
  lblsdFilter.Visible   := False;
  EndDate.Visible       := False;
end;

procedure TfrmCXLookup.HideFields(FieldNames: Array Of String);
begin
  Self.cxGridView.SetVisibleColumns(FieldNames, False);
end;

procedure TfrmCXLookup.RefreshDataSet;
var
  ADataSet: TDataSet;
begin
  ADataSet := FLookupClient.GetLookupData(CommandName, StartDate.Date, EndDate.Date);
  if Assigned(FCDS) then
    FreeAndNil(FCDS);
  if Assigned(ADataset) then
    CDS:= TDBUtils.DSToCDS(ADataSet, Self, True);

  if CDS <> nil then
    cxGridView.LoadFromCDS(CDS);
end;

function TLookupClient.GetLookupData(aCommandName: String; aStartDate:
    TDateTime = 0; aEndDate: TDateTime = 0): TDataSet;
var
  ResultParamIdx: Integer;
begin
  ResultParamIdx := 0;
  if FLookupCommand = nil then
  begin
    FLookupCommand := Fconnection.CreateCommand;
    FLookupCommand.RequestType := 'GET';
    FLookupCommand.Text := aCommandName;
    FLookupCommand.Prepare();
  end;
  if (aStartDate <> 0) or (aEndDate <> 0) then
  begin
    FLookupCommand.Parameters[0].Value.AsDateTime := aStartDate;
    FLookupCommand.Parameters[1].Value.AsDateTime := aEndDate;
    ResultParamIdx := 2;
  end;
  FLookupCommand.Execute;
  Result := TCustomSQLDataSet.Create(nil,
    FLookupCommand.Parameters[ResultParamIdx].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FLookupCommand.FreeOnExecute(Result);
end;

end.
