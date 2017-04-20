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
    FData: TClientDataset;
    FMultiSelect: Boolean;
    function CopyDataset(Source: TDataset): TClientDataSet;
    procedure HideDateParams;
    procedure RefreshDataSet;
    procedure SetMultiSelect(const Value: Boolean);
    procedure SetResultData;
    property CDS: TClientDataset read FCDS write FCDS;
    { Private declarations }
  public
    constructor Create(ARestConn: TDSRestConnection; aMultiSelect: Boolean =
        False); reintroduce;
    class function Execute(aCaption, aCommand: String; aStartDate: TDateTime = 0;
        aEndDate: TDateTime = 0; aMultiSelect: Boolean = False): TfrmCXLookup;
        overload;
    class function Execute(ADataSet: TClientDataSet; aMultiSelect: Boolean = False;
        aCaption: String = 'Lookup Data'): TfrmCXLookup; overload;
    procedure HideFields(FieldNames: Array Of String);
    procedure ShowFieldsOnly(FieldNames: Array Of String);
    property CommandName: String read FCommandName write FCommandName;
    property Data: TClientDataset read FData write FData;
    { Public declarations }
  published
    property MultiSelect: Boolean read FMultiSelect write SetMultiSelect;
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
  if not Assigned(FCDS) then
    Self.ModalResult := mrNone
  else begin
    SetResultData;
    if not Self.Data.Eof then
      Self.ModalResult := mrOk;
  end;
end;

constructor TfrmCXLookup.Create(ARestConn: TDSRestConnection; aMultiSelect:
    Boolean = False);
begin
  inherited Create(Application);
  FLookupClient := TLookupClient.Create(ARestConn, False);
  Self.MultiSelect := aMultiSelect;
end;

function TfrmCXLookup.CopyDataset(Source: TDataset): TClientDataSet;
var
  i: Integer;
  lFieldName: string;
  lRecNo: Integer;
begin
  Result := TClientDataSet.Create(Self);
  Result.FieldDefs.Assign(Source.FieldDefs);
  Result.AddField(check_flag,ftBoolean);

  for i := 0 to Result.FieldDefs.Count-1 do
  begin
    Result.FieldDefs[i].Required := False;
    If Result.FieldDefs[i].DataType = ftAutoInc then
      Result.FieldDefs[i].DataType := ftInteger;
  end;


  Result.CreateDataSet;
  for i := 0 to Result.Fields.Count-1 do
  begin
    Result.Fields[i].ReadOnly := False;
  end;

  lRecNo := Source.RecNo;
  Source.DisableControls;
  Try
    Source.First;
    While not Source.Eof do
    begin
      Result.Append;
      for i:=0 to Source.FieldCount-1 do
      begin
        lFieldName := Source.Fields[i].FieldName;
        Result.FieldByName(lFieldName).Value := Source.FieldByName(lFieldName).Value;
      end;
      Result.Post;

      Source.Next;
    end;
    Result.First;
  Finally
    Source.RecNo := lRecNo;
    Source.EnableControls;
  end;
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
    TDateTime = 0; aEndDate: TDateTime = 0; aMultiSelect: Boolean = False):
    TfrmCXLookup;
begin
  Result                    := TfrmCXLookup.Create(DMClient.RestConn);
  Result.MultiSelect        := aMultiSelect;
  Result.lblHeader.Caption  := aCaption;
  Result.CommandName        := aCommand;
  Result.StartDate.Date     := aStartDate;
  Result.EndDate.Date       := aEndDate;
  if (aStartDate = 0) and (aEndDate = 0) then Result.HideDateParams;
  Result.RefreshDataSet;
end;

class function TfrmCXLookup.Execute(ADataSet: TClientDataSet; aMultiSelect:
    Boolean = False; aCaption: String = 'Lookup Data'): TfrmCXLookup;
begin
  Result                    := TfrmCXLookup.Create(DMClient.RestConn);
  Result.MultiSelect        := aMultiSelect;
  Result.lblHeader.Caption  := aCaption;
  Result.HideDateParams;
  Result.CDS := aDataSet;

  Result.btnRefresh.Visible := False;
  Result.cxGridView.LoadFromCDS(Result.CDS);
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

procedure TfrmCXLookup.ShowFieldsOnly(FieldNames: Array Of String);
begin
  Self.cxGridView.SetVisibleColumnsOnly(FieldNames, True);
end;

procedure TfrmCXLookup.RefreshDataSet;
var
  ADataSet: TDataSet;
  i: Integer;
begin
  ADataSet := FLookupClient.GetLookupData(CommandName, StartDate.Date, EndDate.Date);
  if Assigned(FCDS) then
    FreeAndNil(FCDS);
  if Assigned(ADataset) then
  begin
    if not MultiSelect then
      CDS := TDBUtils.DSToCDS(ADataSet, Self, True)
    else
      CDS := Self.CopyDataset(ADataSet)
  end;

  if CDS <> nil then
  begin
    cxGridView.LoadFromCDS(CDS);

    for i:=0 to cxGridView.ColumnCount-1 do
    begin
      if cxGridView.Columns[i].DataBinding.FieldName = check_flag then
        continue;
      cxGridView.Columns[i].Options.Editing := False;
      If Assigned(cxGridView.Columns[i].Properties) then
        cxGridView.Columns[i].Properties.ReadOnly := True;
    end;
  end;


end;

procedure TfrmCXLookup.SetMultiSelect(const Value: Boolean);
begin
  FMultiSelect := Value;
  If not FMultiSelect then
  begin
//    CDS.AfterPost := nil;
    Self.cxGrid.PopupMenu := nil;
    Self.cxGridView.SetVisibleColumns([check_flag], False);
  end;
//  else begin
//    CDS.AfterPost := CDSAfterPost;
//  end;

  Self.cxGridView.OptionsSelection.MultiSelect := FMultiSelect;
end;

procedure TfrmCXLookup.SetResultData;
begin
  if not Assigned(FCDS) then exit;
  if not Assigned(FData) then
    FData := TClientDataSet.Create(Self);

  FData.CloneCursor(Self.CDS, True);
  if MultiSelect then
  begin
    FData.Filtered := True;
    FData.Filter := check_flag + ' = True ';
    FData.First;
  end;
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
