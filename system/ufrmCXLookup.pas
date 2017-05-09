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
  cxLabel, Vcl.ExtCtrls, dxBarBuiltInMenu, cxPC, cxCheckBox;

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
    pmSelect: TPopupMenu;
    CheckSelected1: TMenuItem;
    UnCheckSelected1: TMenuItem;
    N1: TMenuItem;
    CheckAll1: TMenuItem;
    UncheckAll1: TMenuItem;
    lbBenchmark: TLabel;
    procedure btnRefreshClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure CheckAll1Click(Sender: TObject);
    procedure CheckSelected1Click(Sender: TObject);
    procedure cxGridViewCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo:
        TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState;
        var AHandled: Boolean);
    procedure cxGridViewKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure UncheckAll1Click(Sender: TObject);
    procedure UnCheckSelected1Click(Sender: TObject);
  private
    FLookupClient : TLookupClient;
    FCDS: TClientDataset;
    FCommandName: String;
    FData: TClientDataset;
    FMultiSelect: Boolean;
    FStartExecute: TDatetime;
    function CopyDataset(Source: TDataset): TClientDataSet;
    procedure HideDateParams;
    procedure InitView;
    procedure RefreshDataSet;
    procedure SetCheckSelected(IsChecked: Boolean = True; IsSelectAll: Boolean =
        False);
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
    procedure Reset;
    procedure ShowFieldsOnly(FieldNames: Array Of String);
    property CommandName: String read FCommandName write FCommandName;
    property Data: TClientDataset read FData write FData;
    property StartExecute: TDatetime read FStartExecute write FStartExecute;
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
  uDBUtils, uDXUtils, System.DateUtils, uAppUtils;

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
    if MultiSelect then
    begin
      if Self.Data.RecordCount = 0 then
      begin
        TAppUtils.Warning('Tidak ada data yang dipilih');
        exit;
      end
    end;
    if not Self.Data.Eof then
      Self.ModalResult := mrOk;
  end;
end;

constructor TfrmCXLookup.Create(ARestConn: TDSRestConnection; aMultiSelect:
    Boolean = False);
begin
  inherited Create(nil);
  StartExecute := Now();
  FLookupClient := TLookupClient.Create(ARestConn, False);
  Self.MultiSelect := aMultiSelect;
end;

procedure TfrmCXLookup.CheckAll1Click(Sender: TObject);
begin
  SetCheckSelected(True, True);
end;

procedure TfrmCXLookup.CheckSelected1Click(Sender: TObject);
begin
  SetCheckSelected(True);
end;

function TfrmCXLookup.CopyDataset(Source: TDataset): TClientDataSet;
var
  i: Integer;
  lFieldName: string;
  lRecNo: Integer;
begin
  Result := nil;
  if Source = nil then exit;

  Result := TClientDataSet.Create(Self);
  Result.FieldDefs.Assign(Source.FieldDefs);
  Result.FieldDefs.Add(check_flag, ftBoolean);
//  Result.AddField(check_flag,ftBoolean);

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
  Result.DisableControls;
  Try
    Source.First;
    While not Source.Eof do
    begin
      Result.Append;
      Result.FieldByName(check_flag).AsBoolean := False;
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
    Result.EnableControls;
  end;
end;

procedure TfrmCXLookup.cxGridViewCellDblClick(Sender: TcxCustomGridTableView;
    ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift:
    TShiftState; var AHandled: Boolean);
begin
  If not Self.MultiSelect then
  begin
    btnOK.Click;
  end else
  begin
    CDS.Edit;
    CDS.FieldByName(check_flag).AsBoolean := not CDS.FieldByName(check_flag).AsBoolean;
    CDS.Post;
  end;
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
  Result                    := TfrmCXLookup.Create(DMClient.RestConn, aMultiSelect);
//  Result.MultiSelect        := aMultiSelect;
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
  Result                    := TfrmCXLookup.Create(DMClient.RestConn, aMultiSelect);
  Result.lblHeader.Caption  := aCaption;
  Result.HideDateParams;

  If aMultiSelect then
    Result.CDS := Result.CopyDataset(aDataSet)
  else
    Result.CDS := aDataSet;

  Result.btnRefresh.Visible := False;
  Result.initView;

end;

procedure TfrmCXLookup.FormKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  If Key = VK_ESCAPE then Self.Close;
  if Key = VK_RETURN then btnOK.Click;
end;

procedure TfrmCXLookup.FormShow(Sender: TObject);
var
  ms: Integer;
begin
  ms := MilliSecondsBetween(StartExecute, Now());
  lbBenchmark.Caption := 'Debug Benchmark = ' + IntToStr(ms) + ' ms';
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

procedure TfrmCXLookup.InitView;
var
  i: Integer;
  lCheckCol: TcxGridDBColumn;
begin
  if FCDS = nil then exit;
  cxGridView.LoadFromCDS(CDS, True, False);

  for i:=0 to cxGridView.ColumnCount-1 do
  begin
    cxGridView.Columns[i].Options.Editing := False;
    If Assigned(cxGridView.Columns[i].Properties) then
      cxGridView.Columns[i].Properties.ReadOnly := True;
  end;
//  exit;

  lCheckCol := cxGridView.GetColumnByFieldName(check_flag);

  if Assigned(lCheckCol) then
  begin
    lCheckCol.Options.Editing := True;
    lCheckCol.DataBinding.ValueType := 'Boolean';
    lCheckCol.PropertiesClass := TcxCheckBoxProperties;

    lCheckCol.Properties.ReadOnly := False;
    lCheckCol.Index := 0;
    lCheckCol.Caption := ' [X] ';
    TcxCheckBoxProperties(lCheckCol).ImmediatePost := True;
  end;
  cxGridView.OptionsBehavior.BestFitMaxRecordCount := 200;
  cxGridView.ApplyBestFit;
end;

procedure TfrmCXLookup.ShowFieldsOnly(FieldNames: Array Of String);
begin
  Self.cxGridView.SetVisibleColumnsOnly(FieldNames, True);
  Self.cxGridView.SetVisibleColumns([check_flag], True);
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

  if CDS <> nil then initView;
end;

procedure TfrmCXLookup.Reset;
begin
  if Self.MultiSelect then
  begin
    CDS.DisableControls;
    Try
      while not CDS.Eof do
      begin
        CDS.FieldByName(check_flag).AsBoolean := False;
        CDS.Next;
      end;
    Finally
      CDS.EnableControls;
    End;
  end;
end;

procedure TfrmCXLookup.SetCheckSelected(IsChecked: Boolean = True; IsSelectAll:
    Boolean = False);
var
  i: Integer;
  lAfterPostNotify: TDataSetNotifyEvent;
  lRecNo: Integer;
begin
  lAfterPostNotify  := CDS.AfterPost;
  CDS.AfterPost     := nil;
  cxGridView.DataController.BeginUpdate;
  Try
    If not Assigned(cxGridView.GetColumnByFieldName(check_flag)) then exit;
//    If IsSelectAll then DCMain.SelectAll;

    If not IsSelectAll then
    begin
//      cShowProgressDlg('Checking Process',cxGridView.Controller.SelectedRecordCount);
      for i := 0 to cxGridView.Controller.SelectedRecordCount-1 do
      begin
        cxGridView.Controller.SelectedRecords[i].Focused := True;
        With cxGridView.DataController.DataSource.DataSet do
        begin
          Edit;
          FieldByName(check_flag).AsBoolean := IsChecked;
          Post;
        end;
//        cStepProgressDlg;
      end;
    end else //optimize performance for select all
    begin
//      cShowProgressDlg('Checking Process',CDS.RecordCount);
      lRecNo := CDS.RecNo;
      CDS.DisableControls;
      CDS.First;
      while not CDS.eof do
      begin
        CDS.Edit;
        CDS.FieldByName(check_flag).AsBoolean := IsChecked;
        CDS.Post;
        CDS.Next;
//        cStepProgressDlg;
      end;
      CDS.RecNo := lRecNo;
      CDS.EnableControls;
    end;
//    If MultiSelect then CountSelected;
  Finally
//    cStopProgressDlg;
    CDS.AfterPost := lAfterPostNotify;
    cxGridView.DataController.EndUpdate;
  End;
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

procedure TfrmCXLookup.UncheckAll1Click(Sender: TObject);
begin
  SetCheckSelected(False, True);
end;

procedure TfrmCXLookup.UnCheckSelected1Click(Sender: TObject);
begin
  SetCheckSelected(False);
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
