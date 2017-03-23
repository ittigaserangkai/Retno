unit uDXUtils;

interface

uses
  cxGrid,cxGridDBTableView, cxTreeView,  Math, cxGridExportLink,
  cxExportPivotGridLink, cxGridDBBandedTableView, cxDBPivotGrid, cxCurrencyEdit,
  cxCustomPivotGrid, cxGridBandedTableView, cxDBExtLookupComboBox, cxCustomData,
  cxFilter, cxGridCustomTableView, cxDBTL, cxTLExportLink,cxCalendar, Dialogs,
  SysUtils, cxGridDBDataDefinitions, System.Classes, DBClient, uAppUtils,
  uDBUtils, cxDropDownEdit, cxGridTableView, StrUtils, System.Contnrs,
  Vcl.Controls, Vcl.Forms, Windows, Messages, Variants, Graphics, ExtCtrls,
  ActnList, System.Actions, Vcl.StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit,  cxLookupEdit, cxDBLookupEdit, cxCheckBox, cxSpinEdit, Data.DB,
  cxPC;


type
  TTag = set of byte;

  DataControllerHelper = class helper for TcxGridDataController
  private
  public
    function GetFooterSummary(ASummaryIndex: Integer): Variant;
  end;

  DBDataControllerHelper = class helper for TcxGridDBDataController
  private
  public
    function GetFooterSummary(ASummaryIndex: Integer): Variant;
  end;

  TcxDBBandGridHelper = class helper for TcxGridDBBandedTableView
    function GetFooterSummary(aColumn: TcxGridDBBandedColumn): Variant;
  public
    procedure AutoFormatCurrency(ADisplayFormat: String = ',0;(,0)');
    procedure AutoFormatDate(ADisplayFormat: String = 'yyyy/mm/dd');
    function BandByField(aFieldName: String): TcxGridBand;
    procedure ExportToXLS(sFileName: String = '');
    procedure LoadFromCDS(ACDS: TClientDataSet; BestFit: Boolean = False); overload;
    procedure LoadFromCDS(ACDS: TClientDataSet; AutoFormat, DoBestFit: Boolean);
        overload;
    procedure LoadFromSQL(aSQL: String; aOwner: TComponent);
    procedure SetAllUpperCaseColumn;
    procedure SetBandVisible(aFieldName: string; IsVisible: Boolean);
    procedure SetColumnsCaption(ColumnSets, ColumnCaption: Array Of String);
    procedure SetDetailKeyField(aKeyField: String);
    procedure SetMasterKeyField(aKeyField: String);
    procedure SetVisibleColumns(ColumnSets: Array Of String; IsVisible: Boolean);
  end;

  TcxExtLookupPropHelper = class helper for TcxExtLookupComboBoxProperties
  public
    procedure LoadFromCDS(aCDS: TClientDataSet; IDField, DisplayField: String;
        HideFields: Array Of String; aOwnerForm: TComponent);
    procedure LoadFromSQL(aSQL, IDField, DisplayField: String; HideFields: Array Of
        String; aOwnerForm: TComponent);
    procedure LoadFromDS(aDataSet: TDataSet; IDField, DisplayField: String;
        HideFields: Array Of String; aOwnerForm: TComponent);
    procedure SetMultiPurposeLookup;
  end;

  TcxExtLookupComboHelper = class helper for TcxExtLookupComboBox
  public
    function CDS: TClientDataSet;
    function DS: TDataset;
    procedure LoadFromDS(aDataSet: TDataSet; IDField, DisplayField: String;
        HideFields: Array Of String; aOwnerForm: TComponent);
    procedure SetDefaultValue(TriggerEvents: Boolean = True);
    procedure SetMultiPurposeLookup;
  end;


  TcxDBTreeHelper = class helper for TcxDBTreeList
  public
    procedure ExportToXLS(sFileName: String = ''; DoShowInfo: Boolean = True);
    procedure LoadFromCDS(ACDS: TClientDataSet; AKey, AParentKey: String;
        DoCreateAllItem: Boolean = False);
    procedure SetVisibleColumns(ColumnIndexes: Array Of Integer; IsVisible:
        Boolean); overload;
    procedure SetVisibleColumns(ColumnSets: Array Of String; IsVisible: Boolean);
        overload;
  end;

  TcxDBPivotHelper = class helper for TcxDBPivotGrid
  public
    procedure ExportToXLS(ExpandAll: Boolean = True; sFileName: String = '';
        DoShowInfo: Boolean = True);
    procedure LoadFromCDS(ACDS: TClientDataSet; ExpandAll: Boolean = True;
        ReCreateAllItem: Boolean = True);
    procedure SetAllUpperCaseColumn;
    procedure SetColColumns(ColumnSets: Array Of String);
    procedure SetColumnsCaption(ColumnSets, ColumnCaption: Array Of String);
    procedure SetColumnsWidth(ColumnSets: Array Of String; Widths: Array Of
        Integer); overload;
    procedure SetDataColumns(ColumnSets: Array Of String);
    procedure SetRowColumns(ColumnSets: Array Of String); overload;
    procedure SetVisibleColumns(ColumnSets: Array Of String; IsVisible: Boolean);
  end;

  TcxDBGridHelper = class helper for TcxGridDBTableView
  private
    procedure DoFormatHeader;
  public
    procedure AutoFormatCurrency(ADisplayFormat: String = ',0;(,0)');
    procedure AutoFormatDate(ADisplayFormat: String = 'yyyy/mm/dd');
    function DS: TDataset;
    function CDS: TClientDataSet;
    procedure ExportToXLS(sFileName: String = ''; DoShowInfo: Boolean = True);
    function GetFooterSummary(sFieldName : String): Variant; overload;
    function GetFooterSummary(aColumn: TcxGridDBColumn): Variant; overload;
    procedure LoadFromCDS(ACDS: TClientDataSet; AutoFormat: Boolean = True;
        DoBestFit: Boolean = True);
    procedure LoadFromSQL(aSQL: String; aOwner: TComponent); overload;
    procedure LoadFromSQL(aSQL: String); overload;
    procedure LoadFromDS(aDataSet: TDataSet; aOwner: TComponent); overload;
    procedure SetAllUpperCaseColumn;
    procedure SetColumnsCaption(ColumnSets, ColumnCaption: Array Of String);
    procedure SetSummaryByColumns(ColumnSets: Array Of String; SummaryKind:
        TcxSummaryKind = skSum; SFormat: String = ',0;(,0)');
    procedure SetDetailKeyField(aKeyField: String);
    procedure SetMasterKeyField(aKeyField: String);
    procedure SetReadOnly(IsReadOnly: Boolean);
    procedure SetVisibleColumns(ColumnSets: Array Of String; IsVisible: Boolean);
        overload;
    procedure SetVisibleColumns(ColumnIndexes: Array Of Integer; IsVisible:
        Boolean); overload;
    procedure SetColumnsWidth(ColumnSets: Array Of String; Widths: Array Of
        Integer); overload;
    procedure SetExtLookupCombo(ExtLookup: TcxExtLookupComboBox; IDField,
        DisplayField: String; HideIDField: Boolean = True); overload;
    procedure SetExtLookupCombo(ExtLookupProp: TcxExtLookupComboBoxProperties;
        IDField, DisplayField: String; HideIDField: Boolean = True); overload;
  end;

  TcxExtLookup= class(TcxExtLookupComboBoxProperties)
  protected
  public
    class procedure OnInitPopupCustom(Sender: TObject);

  end;

  TFormHelper = class helper for TForm
  private
    procedure OnKeyEnter(Sender: TObject; var Key: Word; Shift: TShiftState);
  public
    procedure AssignKeyDownEvent;
    procedure ClearByTag(Tag: TTag);
    function ValidateEmptyCtrl(Tag: TTag = [1]; ShowWarning: Boolean = True):
        Boolean;
    class procedure OnEditValueChanged(Sender: TObject);
    function SetFocusRec(aWinCTRL: TWinControl): Boolean;
  end;


function CreateCXDBGrid(ALeft, ATop, AWidth, AHeight : Integer; AParent :
    TWinControl): TcxGrid;


implementation

uses
  cxGridLevel;

function CreateCXDBGrid(ALeft, ATop, AWidth, AHeight : Integer; AParent :
    TWinControl): TcxGrid;
var
  cxGridLevel: TcxGridLevel;
  cxGridDBTableView: TcxGridDBTableView;
begin
  Result               := TcxGrid.Create(Application);
  Result.Parent        := AParent;
  Result.Left          := ALeft;
  Result.Top           := ATop;
  Result.Height        := AHeight;
  Result.Width         := AWidth;
  Result.Visible       := True;

  cxGridLevel          := Result.Levels.Add;
  cxGridDBTableView    := Result.CreateView(TcxGridDBTableView) as TcxGridDBTableView;
  cxGridLevel.GridView := cxGridDBTableView;
end;

function DataControllerHelper.GetFooterSummary(ASummaryIndex: Integer): Variant;
begin
  Result := Self.Summary.FooterSummaryValues[ASummaryIndex];
end;

function DBDataControllerHelper.GetFooterSummary(ASummaryIndex: Integer):
    Variant;
begin
  Result := Self.Summary.FooterSummaryValues[ASummaryIndex];
end;

procedure TcxDBBandGridHelper.AutoFormatCurrency(ADisplayFormat: String =
    ',0;(,0)');
var
  i: Integer;
  lDS: TDataSet;
begin
  lDS := Self.DataController.DataSource.DataSet;

  //why use DS, because sometime format CDS <> grid.column.format
  for i := 0 to lDS.FieldCount-1 do
  begin
    If not Assigned(Self.GetColumnByFieldName(lDS.Fields[i].FieldName)) then
      continue;
    with Self.GetColumnByFieldName(lDS.Fields[i].FieldName) do
    begin
      If lDS.Fields[i].DataType = ftFloat then
      begin
        PropertiesClassName := 'TcxCurrencyEditProperties';
        TcxCurrencyEditProperties( Properties).DisplayFormat := ADisplayFormat;
        TcxCurrencyEditProperties( Properties).Alignment.Horz := taRightJustify;
        DataBinding.ValueType := 'Float';
      end;
    end;
  end;
end;

procedure TcxDBBandGridHelper.AutoFormatDate(ADisplayFormat: String =
    'yyyy/mm/dd');
var
  i: Integer;
  lDS: TDataSet;
begin
  lDS := Self.DataController.DataSource.DataSet;

  //why use DS, because sometime format CDS <> grid.column.format
  for i := 0 to lDS.FieldCount-1 do
  begin
    If not Assigned(Self.GetColumnByFieldName(lDS.Fields[i].FieldName)) then
      continue;
    with Self.GetColumnByFieldName(lDS.Fields[i].FieldName) do
    begin
      If lDS.Fields[i].DataType in [ftDate, ftDateTime] then
      begin
        PropertiesClassName := 'TcxDateEditProperties';
        TcxDateEditProperties( Properties).DisplayFormat := ADisplayFormat;
        TcxDateEditProperties( Properties).EditMask := ADisplayFormat;
        DataBinding.ValueType := 'DateTime';
      end;
    end;
  end;
end;

function TcxDBBandGridHelper.BandByField(aFieldName: String): TcxGridBand;
begin
  Result := nil;
  If Assigned(Self.GetColumnByFieldName(aFieldName)) then
    Result := Self.GetColumnByFieldName(aFieldName).Position.Band;
end;

procedure TcxDBBandGridHelper.ExportToXLS(sFileName: String = '');
var
  DoSave: Boolean;
  lSaveDlg: TSaveDialog;
begin
  DoSave := True;
  If sFileName = '' then
  begin
    lSaveDlg := TSaveDialog.Create(nil);
    Try
      if lSaveDlg.Execute then
        sFileName := lSaveDlg.FileName
      else
        DoSave := False;
    Finally
      lSaveDlg.Free;
    End;
  end;

  If DoSave then
  begin
    Try
      ExportGridToExcel(sFileName, TcxGrid(Self.Control));
      TAppUtils.Information('Data berhasil diexport ke: ' + sFileName);
    except
      TAppUtils.Warning('Gagal menyimpan data ke excel');
    end;
  end;
end;

function TcxDBBandGridHelper.GetFooterSummary(aColumn: TcxGridDBBandedColumn):
    Variant;
var
  i: Integer;
begin
  Result := 0;

  with Self.DataController.Summary do
  begin
    for i :=0 to FooterSummaryItems.Count-1 do
    begin
//      If FooterSummaryItems.Items[i].ItemLink.ClassName <> aColumn.ClassName then
//        continue;

      If FooterSummaryItems.Items[i].ItemLink = aColumn then
        Result := FooterSummaryValues[i];
    end;
  end;
end;

procedure TcxDBBandGridHelper.LoadFromCDS(ACDS: TClientDataSet; BestFit:
    Boolean = False);
begin
  If not Assigned(Self.DataController.DataSource) then
  begin
    Self.DataController.DataSource := TDataSource.Create(Self);
  end;
  Self.DataController.DataSource.DataSet := ACDS;
  Self.DataController.CreateAllItems(True);

  AutoFormatCurrency;
  SetAllUpperCaseColumn;

  Self.OptionsBehavior.BestFitMaxRecordCount := 100;
  if BestFit then Self.ApplyBestFit;
end;

procedure TcxDBBandGridHelper.LoadFromCDS(ACDS: TClientDataSet; AutoFormat,
    DoBestFit: Boolean);
begin
  If not Assigned(Self.DataController.DataSource) then
  begin
    Self.DataController.DataSource := TDataSource.Create(Self);
  end;
  Self.DataController.DataSource.DataSet := ACDS;
  Self.DataController.CreateAllItems(True);

  if AutoFormat then
  begin
    AutoFormatDate;
    AutoFormatCurrency;
    SetAllUpperCaseColumn;
  end;
  If DoBestFit then
  begin
    Self.OptionsBehavior.BestFitMaxRecordCount := 100;
    Self.ApplyBestFit;
  end;
end;

procedure TcxDBBandGridHelper.LoadFromSQL(aSQL: String; aOwner: TComponent);
var
  lCDS: TClientDataSet;
begin
  //method ini hanya digunakan sekali saja,
  //membuat cds sesuai owner form agar di free on destroy
  //ex digunakan utk extended lookup data master..

  If Assigned(Self.DataController.DataSource) then
    Raise Exception.Create('DataSource already created');

  lCDS := TDBUtils.OpenDataset(aSQL, aOwner);
  Self.LoadFromCDS(lCDS);
end;

procedure TcxDBBandGridHelper.SetAllUpperCaseColumn;
var
  i: Integer;
begin
  for i := 0 to Self.ColumnCount-1 do
  begin
    Self.Columns[i].Caption := UpperCase(Self.Columns[i].Caption);
  end;
end;

procedure TcxDBBandGridHelper.SetBandVisible(aFieldName: string; IsVisible:
    Boolean);
begin
  If Self.BandByField(aFieldName) <> nil then
    Self.BandByField(aFieldName).Visible := IsVisible;
end;

procedure TcxDBBandGridHelper.SetColumnsCaption(ColumnSets, ColumnCaption:
    Array Of String);
var
  i: Integer;
begin
  for i := Low(ColumnSets) to High(ColumnSets) do
  begin
    If Assigned(Self.GetColumnByFieldName(ColumnSets[i])) then
      Self.GetColumnByFieldName(ColumnSets[i]).Caption := ColumnCaption[i];
  end;
end;

procedure TcxDBBandGridHelper.SetDetailKeyField(aKeyField: String);
begin
  Self.DataController.MasterKeyFieldNames   := aKeyField ;
end;

procedure TcxDBBandGridHelper.SetMasterKeyField(aKeyField: String);
begin
  Self.DataController.DetailKeyFieldNames   := aKeyField ;
end;

procedure TcxDBBandGridHelper.SetVisibleColumns(ColumnSets: Array Of String;
    IsVisible: Boolean);
var
  i: Integer;
begin
  for i := Low(ColumnSets) to High(ColumnSets) do
  begin
    If Assigned(Self.GetColumnByFieldName(ColumnSets[i])) then
      Self.GetColumnByFieldName(ColumnSets[i]).Visible := IsVisible;
  end;
end;

procedure TcxExtLookupPropHelper.LoadFromCDS(aCDS: TClientDataSet; IDField,
    DisplayField: String; HideFields: Array Of String; aOwnerForm: TComponent);
var
  aRepo: TcxGridViewRepository;
  aView: TcxGridDBTableView;
  i: Integer;
begin
  aRepo := nil;
  for i := 0 to aOwnerForm.ComponentCount - 1 do
  begin
    If aOwnerForm.Components[i] is TcxGridViewRepository then
    begin
      aRepo := aOwnerForm.Components[i] as TcxGridViewRepository;
      break;
    end;
  end;
  If not Assigned(aRepo) then
  begin
    aRepo := TcxGridViewRepository.Create( aOwnerForm );
    aRepo.Name  := 'ViewRepository_' + IntToStr(Integer(aRepo));

  end;
  aView       := aRepo.CreateItem(TcxGridDBTableView) as TcxGridDBTableView;
  aView.Name  := 'GridView_' + IntToStr(Integer(aView));

  aView.OptionsView.GroupByBox        := False;
  aView.DataController.Filter.Active  := True;
  aView.FilterBox.Visible             := fvNever;

  aView.LoadFromCDS(aCDS, True, False);
  aView.SetVisibleColumns(HideFields,False);
  aView.SetExtLookupCombo(Self, IDField, DisplayField, False);

  If Self.GetOwner is TcxExtLookupComboBox then
  begin
    if aView.VisibleColumnCount = 1 then
    begin
      If aView.VisibleColumns[0].Width < TcxExtLookupComboBox(Self.GetOwner).Width then
        aView.VisibleColumns[0].Width := TcxExtLookupComboBox(Self.GetOwner).Width
    end;
  end;
end;

procedure TcxExtLookupPropHelper.LoadFromSQL(aSQL, IDField, DisplayField: String;
    HideFields: Array Of String; aOwnerForm: TComponent);
var
  lCDS: TClientDataSet;
begin
  //method ini hanya digunakan sekali saja,
  //membuat cds sesuai owner form agar di free on destroy
  lCDS := TDBUtils.OpenDataset(aSQL, aOwnerForm);
  Self.LoadFromCDS(lCDS, IDField, DisplayField, HideFields, aOwnerForm);
end;

procedure TcxExtLookupPropHelper.LoadFromDS(aDataSet: TDataSet; IDField,
    DisplayField: String; HideFields: Array Of String; aOwnerForm: TComponent);
var
  lCDS: TClientDataSet;
begin
  //method ini hanya digunakan sekali saja,
  //membuat cds sesuai owner form agar di free on destroy
  lCDS := TDBUtils.DSToCDS(aDataSet, aOwnerForm);
  Self.LoadFromCDS(lCDS, IDField, DisplayField, HideFields, aOwnerForm);
end;

procedure TcxExtLookupPropHelper.SetMultiPurposeLookup;
begin
  AutoSearchOnPopup  := True;
  FocusPopup         := True;
  DropDownAutoSize   := True;
  DropDownListStyle  := lsEditList;

  If Self.View is TcxGridDBTableView then
  begin
    Self.View.OptionsData.Editing           := False;
    Self.View.OptionsData.Inserting         := False;
    Self.View.OptionsData.Deleting          := False;
    Self.View.OptionsData.Appending         := False;
    Self.PostPopupValueOnTab := True;
    Self.View.DataController.Filter.Options := [fcoCaseInsensitive];

    TcxGridDBTableView(Self.View).FilterRow.InfoText
      := 'Click Here & Press F2 To Define Filter (use "%" for parsial word)';
    TcxGridDBTableView(Self.View).FilterRow.Visible       := True;
    TcxGridDBTableView(Self.View).FilterRow.ApplyChanges  := fracImmediately;
  end;
  If not Assigned(Self.OnInitPopup) then
    Self.OnInitPopup := TcxExtLookup.OnInitPopupCustom;
end;

procedure TcxDBTreeHelper.ExportToXLS(sFileName: String = ''; DoShowInfo:
    Boolean = True);
var
  DoSave: Boolean;
  lSaveDlg: TSaveDialog;
begin
  DoSave := True;
  If sFileName = '' then
  begin
    lSaveDlg := TSaveDialog.Create(nil);
    Try
      if lSaveDlg.Execute then
        sFileName := lSaveDlg.FileName
      else
        DoSave := False;
    Finally
      lSaveDlg.Free;
    End;
  end;

  If DoSave then
  begin
    Try
      cxExportTLToExcel(sFileName,  Self);
      If DoShowInfo then TAppUtils.Information('Data berhasil diexport ke: ' + sFileName);
    except
      If DoShowInfo then TAppUtils.Warning('Gagal menyimpan data ke excel');
    end;
  end;
end;

procedure TcxDBTreeHelper.LoadFromCDS(ACDS: TClientDataSet; AKey, AParentKey:
    String; DoCreateAllItem: Boolean = False);
begin
  If not Assigned(Self.DataController.DataSource) then
    Self.DataController.DataSource := TDataSource.Create(nil);

  Self.DataController.DataSource.DataSet := ACDS;
  Self.DataController.KeyField           := AKey;
  Self.DataController.ParentField        := AParentKey;
  If DoCreateAllItem then Self.CreateAllItems;
end;

procedure TcxDBTreeHelper.SetVisibleColumns(ColumnIndexes: Array Of Integer;
    IsVisible: Boolean);
var
  i: Integer;
begin
  for i := Low(ColumnIndexes) to High(ColumnIndexes) do
  begin
    Self.Columns[ColumnIndexes[i]].Visible := IsVisible;
  end;
end;

procedure TcxDBTreeHelper.SetVisibleColumns(ColumnSets: Array Of String;
    IsVisible: Boolean);
var
  i: Integer;
begin
  for i := Low(ColumnSets) to High(ColumnSets) do
  begin
    If Assigned(Self.GetColumnByFieldName(ColumnSets[i])) then
      Self.GetColumnByFieldName(ColumnSets[i]).Visible := IsVisible;
  end;
end;

procedure TcxDBPivotHelper.ExportToXLS(ExpandAll: Boolean = True; sFileName:
    String = ''; DoShowInfo: Boolean = True);
var
  DoSave: Boolean;
  lSaveDlg: TSaveDialog;
begin
  DoSave := True;
  If sFileName = '' then
  begin
    lSaveDlg := TSaveDialog.Create(nil);
    Try
      if lSaveDlg.Execute then
        sFileName := lSaveDlg.FileName
      else
        DoSave := False;
    Finally
      lSaveDlg.Free;
    End;
  end;

  If DoSave then
  begin
    Try
      cxExportPivotGridToExcel(sFileName, Self, ExpandAll);
      If DoShowInfo then TAppUtils.Information('Data berhasil diexport ke: ' + sFileName);
    except
      If DoShowInfo then TAppUtils.Warning('Gagal menyimpan data ke excel');
    end;
  end;
end;

procedure TcxDBPivotHelper.LoadFromCDS(ACDS: TClientDataSet; ExpandAll: Boolean
    = True; ReCreateAllItem: Boolean = True);
var
  i: Integer;
begin
  if not Assigned(Self.DataSource) then
    Self.DataSource := TDataSource.Create(Self);
  Self.DataSource.DataSet := ACDS;

  If ReCreateAllItem then
  begin
    Self.DeleteAllFields;
    Self.CreateAllFields;
  end;

  for i:=0 to Self.FieldCount-1 do
  begin
    if MatchStr(Self.Fields[i].DataBinding.ValueType ,['Float','Currency']) then
    begin
      Self.Fields[i].PropertiesClass := TcxCurrencyEditProperties;
      TcxCurrencyEditProperties(Self.fields[i].Properties).DisplayFormat := ',0;(,0)';
      TcxCurrencyEditProperties(Self.fields[i].Properties).ReadOnly := True;
    end;
    If ExpandAll then Self.Fields[i].ExpandAll;
  end;
  SetAllUpperCaseColumn;
end;

procedure TcxDBPivotHelper.SetAllUpperCaseColumn;
var
  i: Integer;
begin
  for i := 0 to Self.FieldCount-1 do
  begin
    Self.Fields[i].Caption := UpperCase(Self.Fields[i].Caption);
  end;
end;

procedure TcxDBPivotHelper.SetColColumns(ColumnSets: Array Of String);
var
  i: Integer;
begin
  for i := Low(ColumnSets) to High(ColumnSets) do
  begin
    If Assigned(Self.GetFieldByName(ColumnSets[i])) then
      Self.GetFieldByName(ColumnSets[i]).Area := faColumn;
  end;
end;

procedure TcxDBPivotHelper.SetColumnsCaption(ColumnSets, ColumnCaption: Array
    Of String);
var
  i: Integer;
begin
  for i := Low(ColumnSets) to High(ColumnSets) do
  begin
    If Assigned(Self.GetFieldByName(ColumnSets[i])) then
      Self.GetFieldByName(ColumnSets[i]).Caption := ColumnCaption[i];
  end;
end;

procedure TcxDBPivotHelper.SetColumnsWidth(ColumnSets: Array Of String; Widths:
    Array Of Integer);
var
  i: Integer;
begin
  for i := Low(ColumnSets) to High(ColumnSets) do
  begin
    If Assigned(Self.GetFieldByName(ColumnSets[i])) then
      Self.GetFieldByName(ColumnSets[i]).Width := Widths[i];
  end;
end;

procedure TcxDBPivotHelper.SetDataColumns(ColumnSets: Array Of String);
var
  i: Integer;
begin
  for i := Low(ColumnSets) to High(ColumnSets) do
  begin
    If Assigned(Self.GetFieldByName(ColumnSets[i])) then
      Self.GetFieldByName(ColumnSets[i]).Area := faData;
  end;
end;

procedure TcxDBPivotHelper.SetRowColumns(ColumnSets: Array Of String);
var
  i: Integer;
begin
  for i := Low(ColumnSets) to High(ColumnSets) do
  begin
    If Assigned(Self.GetFieldByName(ColumnSets[i])) then
      Self.GetFieldByName(ColumnSets[i]).Area := faRow;
  end;
end;

procedure TcxDBPivotHelper.SetVisibleColumns(ColumnSets: Array Of String;
    IsVisible: Boolean);
var
  i: Integer;
begin
  for i := Low(ColumnSets) to High(ColumnSets) do
  begin
    If Assigned(Self.GetFieldByName(ColumnSets[i])) then
      Self.GetFieldByName(ColumnSets[i]).Hidden := not IsVisible;
  end;
end;

procedure TcxDBGridHelper.AutoFormatCurrency(ADisplayFormat: String =
    ',0;(,0)');
var
  i: Integer;
  lDS: TDataSet;
begin
  lDS := Self.DataController.DataSource.DataSet;

  //why use DS, because sometime format CDS <> grid.column.format
  for i := 0 to lDS.FieldCount-1 do
  begin
    If not Assigned(Self.GetColumnByFieldName(lDS.Fields[i].FieldName)) then
      continue;
    with Self.GetColumnByFieldName(lDS.Fields[i].FieldName) do
    begin
      If lDS.Fields[i].DataType = ftFloat then
      begin
        PropertiesClassName := 'TcxCurrencyEditProperties';
        TcxCurrencyEditProperties( Properties).DisplayFormat := ADisplayFormat;
        TcxCurrencyEditProperties( Properties).Alignment.Horz := taRightJustify;
        DataBinding.ValueType := 'Float';
      end;
    end;
  end;
end;

procedure TcxDBGridHelper.AutoFormatDate(ADisplayFormat: String =
    'yyyy/mm/dd');
var
  i: Integer;
  lDS: TDataSet;
begin
  lDS := Self.DataController.DataSource.DataSet;

  //why use DS, because sometime format CDS <> grid.column.format
  for i := 0 to lDS.FieldCount-1 do
  begin
    If not Assigned(Self.GetColumnByFieldName(lDS.Fields[i].FieldName)) then
      continue;
    with Self.GetColumnByFieldName(lDS.Fields[i].FieldName) do
    begin
      If lDS.Fields[i].DataType in [ftDate, ftDateTime] then
      begin
        PropertiesClassName := 'TcxDateEditProperties';
        TcxDateEditProperties( Properties).DisplayFormat := ADisplayFormat;
        TcxDateEditProperties( Properties).EditMask := ADisplayFormat;
        DataBinding.ValueType := 'DateTime';
      end;
    end;
  end;
end;

function TcxDBGridHelper.DS: TDataset;
begin
  Result := Self.DataController.DataSource.DataSet;
end;

function TcxDBGridHelper.CDS: TClientDataSet;
begin
  Result := TClientDataSet(Self.DS);
end;

procedure TcxDBGridHelper.DoFormatHeader;
var
  I: Integer;
begin
  for I := 0 to Self.ColumnCount - 1 do
  begin
    Self.Columns[i].Caption := StringReplace(Self.Columns[i].Caption,'_',' ', [rfReplaceAll]);
    Self.Columns[i].HeaderGlyphAlignmentHorz := taCenter;
  end;
end;

procedure TcxDBGridHelper.ExportToXLS(sFileName: String = ''; DoShowInfo:
    Boolean = True);
var
  DoSave: Boolean;
  lSaveDlg: TSaveDialog;
begin
  DoSave := True;
  If sFileName = '' then
  begin
    lSaveDlg := TSaveDialog.Create(nil);
    Try
      if lSaveDlg.Execute then
        sFileName := lSaveDlg.FileName
      else
        DoSave := False;
    Finally
      lSaveDlg.Free;
    End;
  end;

  If DoSave then
  begin
    Try
      ExportGridToExcel(sFileName, TcxGrid(Self.Control));
      If DoSHowInfo then TAppUtils.Information('Data berhasil diexport ke: ' + sFileName);
    except
      If DoSHowInfo then TAppUtils.Warning('Gagal menyimpan data ke excel');
    end;
  end;
end;

function TcxDBGridHelper.GetFooterSummary(aColumn: TcxGridDBColumn): Variant;
var
  i: Integer;
begin
  Result := 0;

  with Self.DataController.Summary do
  begin
    for i :=0 to FooterSummaryItems.Count-1 do
    begin
//      If FooterSummaryItems.Items[i].ItemLink.ClassName <> aColumn.ClassName then
//        continue;
      If FooterSummaryItems.Items[i].ItemLink = aColumn then
        Result := FooterSummaryValues[i];
    end;
  end;
end;

function TcxDBGridHelper.GetFooterSummary(sFieldName : String): Variant;
//var
//  i: Integer;
begin
  Result := Self.GetFooterSummary(Self.GetColumnByFieldName(sFieldName));
end;

procedure TcxDBGridHelper.LoadFromCDS(ACDS: TClientDataSet; AutoFormat: Boolean
    = True; DoBestFit: Boolean = True);
begin
  if not Assigned(ACDS) then exit;
  If not Assigned(Self.DataController.DataSource) then
  begin
    Self.DataController.DataSource := TDataSource.Create(Self);
  end;
  Self.DataController.DataSource.DataSet := ACDS;
  Self.DataController.CreateAllItems(True);

  DoFormatHeader;

  if AutoFormat then
  begin
    AutoFormatDate;
    AutoFormatCurrency;
    SetAllUpperCaseColumn;
  end;
  If DoBestFit then
  begin
    Self.OptionsBehavior.BestFitMaxRecordCount := 100;
    Self.ApplyBestFit;
  end;


end;

procedure TcxDBGridHelper.LoadFromSQL(aSQL: String; aOwner: TComponent);
var
  lCDS: TClientDataSet;
begin
  //method ini hanya digunakan sekali saja,
  //membuat cds sesuai owner form agar di free on destroy
  //ex digunakan utk extended lookup data master..

  If Assigned(Self.DataController.DataSource) then
    Raise Exception.Create('DataSource already created');

  lCDS := TDBUtils.OpenDataset(aSQL, aOwner);
  Self.LoadFromCDS(lCDS);
end;

procedure TcxDBGridHelper.LoadFromSQL(aSQL: String);
begin
  Self.LoadFromSQL(aSQL, Self);
end;

procedure TcxDBGridHelper.LoadFromDS(aDataSet: TDataSet; aOwner: TComponent);
var
  lCDS: TClientDataSet;
begin
  lCDS := TDBUtils.DSToCDS(aDataSet, aOwner);

  if Assigned(Self.DataController.DataSource) then
    if Self.DataController.DataSource.DataSet <> nil then
      Self.DataController.DataSource.DataSet.Free;

  Self.LoadFromCDS(lCDS);
end;

procedure TcxDBGridHelper.SetAllUpperCaseColumn;
var
  i: Integer;
begin
  for i := 0 to Self.ColumnCount-1 do
  begin
    Self.Columns[i].Caption := UpperCase(Self.Columns[i].Caption);
  end;
end;

procedure TcxDBGridHelper.SetColumnsCaption(ColumnSets, ColumnCaption: Array Of
    String);
var
  i: Integer;
begin
  for i := Low(ColumnSets) to High(ColumnSets) do
  begin
    If Assigned(Self.GetColumnByFieldName(ColumnSets[i])) then
      Self.GetColumnByFieldName(ColumnSets[i]).Caption := ColumnCaption[i];
  end;
end;

procedure TcxDBGridHelper.SetSummaryByColumns(ColumnSets: Array Of String;
    SummaryKind: TcxSummaryKind = skSum; SFormat: String = ',0;(,0)');
var
  i: Integer;
begin
  If not Self.OptionsView.Footer then Self.OptionsView.Footer := True;
  for i := Low(ColumnSets) to High(ColumnSets) do
  begin
    If Assigned(Self.GetColumnByFieldName(ColumnSets[i])) then
    begin
      GetColumnByFieldName(ColumnSets[i]).Summary.FooterKind    := SummaryKind;
      GetColumnByFieldName(ColumnSets[i]).Summary.FooterFormat  := SFormat;
    end;
  end;
end;

procedure TcxDBGridHelper.SetDetailKeyField(aKeyField: String);
begin
  Self.DataController.MasterKeyFieldNames   := aKeyField ;
end;

procedure TcxDBGridHelper.SetMasterKeyField(aKeyField: String);
begin
  Self.DataController.DetailKeyFieldNames   := aKeyField ;
end;

procedure TcxDBGridHelper.SetReadOnly(IsReadOnly: Boolean);
begin
  Self.OptionsData.Editing    := not IsReadOnly;
  Self.OptionsData.Inserting  := not IsReadOnly;
  Self.OptionsData.Appending  := not IsReadOnly;
  Self.OptionsData.Deleting   := not IsReadOnly;
end;

procedure TcxDBGridHelper.SetVisibleColumns(ColumnSets: Array Of String;
    IsVisible: Boolean);
var
  i: Integer;
begin
  for i := Low(ColumnSets) to High(ColumnSets) do
  begin
    If Assigned(Self.GetColumnByFieldName(ColumnSets[i])) then
      Self.GetColumnByFieldName(ColumnSets[i]).Visible := IsVisible;
  end;
end;

procedure TcxDBGridHelper.SetVisibleColumns(ColumnIndexes: Array Of Integer;
    IsVisible: Boolean);
var
  i: Integer;
begin
  for i := Low(ColumnIndexes) to High(ColumnIndexes) do
  begin
    Self.Columns[ColumnIndexes[i]].Visible := IsVisible;
  end;
end;

procedure TcxDBGridHelper.SetColumnsWidth(ColumnSets: Array Of String; Widths:
    Array Of Integer);
var
  i: Integer;
begin
  for i := Low(ColumnSets) to High(ColumnSets) do
  begin
    If Assigned(Self.GetColumnByFieldName(ColumnSets[i])) then
      Self.GetColumnByFieldName(ColumnSets[i]).Width := Widths[i];
  end;
end;

procedure TcxDBGridHelper.SetExtLookupCombo(ExtLookup: TcxExtLookupComboBox;
    IDField, DisplayField: String; HideIDField: Boolean = True);
begin
  SetExtLookupCombo( ExtLookup.Properties , IDField, DisplayField, HideIDField);
end;

procedure TcxDBGridHelper.SetExtLookupCombo(ExtLookupProp:
    TcxExtLookupComboBoxProperties; IDField, DisplayField: String; HideIDField:
    Boolean = True);
begin
  with ExtLookupProp do
  begin
    View              := Self;
    KeyFieldNames     := IDField;
    If HideIDField then Self.SetVisibleColumns([IDField],False);
    ListFieldItem     := Self.GetColumnByFieldName(DisplayField);
    DropDownAutoSize  := True;
  end;
  ExtLookupProp.PopupAutoSize := True;
  Self.OptionsBehavior.BestFitMaxRecordCount := 0;
  Self.ApplyBestFit;
end;

class procedure TcxExtLookup.OnInitPopupCustom(Sender: TObject);
begin
  If Sender is TcxExtLookupComboBox then
  begin
    TcxExtLookupComboBox(Sender).Properties.View.DataController.Filter.Clear;
    TcxExtLookupComboBox(Sender).Properties.ListFieldItem.Focused := True;
  end;
end;

procedure TFormHelper.AssignKeyDownEvent;
var
  C: TComponent;
  i: Integer;
begin
  for i := 0 to Self.ComponentCount-1 do
  begin
    C := Self.Components[i];
    if C is TEdit then
      If not Assigned(TEdit(C).OnKeyDown) then
        TEdit(C).OnKeyDown := OnKeyEnter;
    if C is TcxTextEdit then
      If not Assigned(TcxTextEdit(C).OnKeyDown) then
        TcxTextEdit(C).OnKeyDown := OnKeyEnter;
    if C is TcxExtLookupComboBox then
    begin
      //bug: lookup standar, ketika user memilih dengan keyboard panah, lalu enter tidak ngefek
      //bug: lookup generic / multipurpose harus enter 2x
      //fix by this code :
      //1st postpopupvalue must be active
      TcxExtLookupComboBox(C).Properties.PostPopupValueOnTab := True;
      //2nd utk generic lookup tambahkan editvaluechanged post tab agar fokus pindah dari view ke lookup
      if TcxExtLookupComboBox(C).Properties.FocusPopup then
        if not Assigned(TcxExtLookupComboBox(C).Properties.OnEditValueChanged) then
          TcxExtLookupComboBox(C).Properties.OnEditValueChanged := OnEditValueChanged;
      //3rd onEnter send tab key
      if not Assigned(TcxExtLookupComboBox(C).OnKeyDown) then
        TcxExtLookupComboBox(C).OnKeyDown:= OnKeyEnter;
    end;
    if C is TcxComboBox then
      if not Assigned(TcxComboBox(C).OnKeyDown) then
        TcxComboBox(C).OnKeyDown := OnKeyEnter;
    if C is TcxCheckBox then
      if not Assigned(TcxCheckBox(C).OnKeyDown) then
        TcxCheckBox(C).OnKeyDown := OnKeyEnter;
    if C is TcxSpinEdit then
      if not Assigned(TcxSpinEdit(C).OnKeyDown) then
        TcxSpinEdit(C).OnKeyDown := OnKeyEnter;
  end;
end;

procedure TFormHelper.ClearByTag(Tag: TTag);
var
  C: TComponent;
  i: Integer;
begin
  for i := 0 to Self.ComponentCount-1 do
  begin
    C := Self.Components[i];
    if not (C.Tag in Tag) then continue;
    if C is TEdit then TEdit(C).Clear;
    if C is TcxTextEdit then TcxTextEdit(C).Clear;
    if C is TcxExtLookupComboBox then TcxExtLookupComboBox(C).Clear;
    if C is TcxComboBox then TcxComboBox(C).Clear;
    if C is TcxCheckBox then TcxCheckBox(C).Clear;
    if C is TcxSpinEdit then TcxSpinEdit(C).Clear;
  end;
end;

function TFormHelper.ValidateEmptyCtrl(Tag: TTag = [1]; ShowWarning: Boolean =
    True): Boolean;
var
  C: TComponent;
  i: Integer;
  iTabOrd: Integer;
  sMsg: string;
  EmptyCtrl: TWinControl;
  IsEmpty: Boolean;
begin
  IsEmpty   := False;
  iTabOrd   := MaxInt;
  EmptyCtrl := nil;
  for i := 0 to Self.ComponentCount-1 do
  begin
    C := Self.Components[i];
    if not (C.Tag in Tag) then continue;
    if not C.InheritsFrom(TWinControl) then continue;
    if C is TcxExtLookupComboBox then
      IsEmpty := VarIsNull(TcxExtLookupComboBox(C).EditValue)
    else if C is TcxComboBox then IsEmpty := TcxComboBox(C).ItemIndex = -1
    else if C is TComboBox then IsEmpty := TComboBox(C).ItemIndex = -1
    else if C is TcxTextEdit then IsEmpty := TcxTextEdit(C).Text = ''
    else if C is TEdit then IsEmpty := TEdit(C).Text = ''
    else if C is TcxSpinEdit then IsEmpty := TcxSpinEdit(C).Value = 0
    else if C is TcxCurrencyEdit then IsEmpty := TcxCurrencyEdit(C).Value = 0;
    if (IsEmpty) and (TWinControl(C).TabOrder < iTabOrd) then
    begin
      EmptyCtrl := TWinControl(C);
      iTabOrd   := EmptyCtrl.TabOrder;
    end;
  end;
  Result := EmptyCtrl = nil;
  if (not Result) {and (ShowWarning)} then
  begin
    SetFocusRec(EmptyCtrl);
    Application.ProcessMessages;
    If ShowWarning then
    begin
      if EmptyCtrl.HelpKeyword <> '' then
        sMsg := EmptyCtrl.HelpKeyword + ' tidak boleh kosong'
      else
        sMsg := 'Input Tidak Boleh Kosong';
      TAppUtils.Warning(sMsg);
    end;

  end;
end;


procedure TFormHelper.OnKeyEnter(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  if (Key = VK_RETURN) and (not (ssCtrl in Shift))  then
  begin
    if Sender is TcxExtLookupComboBox then
      Key := VK_TAB
    else
      SelectNext(Screen.ActiveControl, True, True);

  end else if Key = VK_F5 then
  begin
//    if Sender is TcxExtLookupComboBox then
//      TcxExtLookupComboBox(Sender).Properties.OnPopup(Sender); ;
  end;
end;

class procedure TFormHelper.OnEditValueChanged(Sender: TObject);
var
  sDebug: string;
begin
  if Sender is TcxExtLookupComboBox then
  begin
    //agar generic lookup cukup enter 1x utk pindah ke komponent
    Keybd_event(VK_TAB, 0, 0, 0);
    sDebug := TcxExtLookupComboBox(Sender).Name;
  end;
end;

function TFormHelper.SetFocusRec(aWinCTRL: TWinControl): Boolean;
begin
  Result := False;
  If aWinCTRL.Enabled and aWinCTRL.Visible then
  begin
    //kapan2 diterusin
//    if (aWinCTRL is TcxTabSheet) and (not aWinCTRL.Visible) then
//    begin
//      If (TcxPageControl(aWinCTRL.Parent).Enabled)
//      and (TcxPageControl(aWinCTRL.Parent).Visible) then
//        TcxPageControl(aWinCTRL.Parent).ActivePage := TcxTabSheet(aWinCTRL);
//      Result := True;
//    end else

    If aWinCTRL.Parent <> nil then
      Result := SetFocusRec(aWinCTRL.Parent)
    else
      Result := True;

    If Result then
      aWinCTRL.SetFocus;
  end;
end;

function TcxExtLookupComboHelper.CDS: TClientDataSet;
begin
  Result := TClientDataSet(Self.DS);
end;

function TcxExtLookupComboHelper.DS: TDataset;
begin
  if Assigned(TcxGridDBTableView(Self.Properties.View).DataController.DataSource ) then
    Result := TcxGridDBTableView(Self.Properties.View).DataController.DataSource.DataSet
  else
    Result := nil;
end;

procedure TcxExtLookupComboHelper.LoadFromDS(aDataSet: TDataSet; IDField,
    DisplayField: String; HideFields: Array Of String; aOwnerForm: TComponent);
begin
  Self.Properties.LoadFromDS(aDataSet, IDField, DisplayField,
    HideFields, aOwnerForm);
end;

procedure TcxExtLookupComboHelper.SetDefaultValue(TriggerEvents: Boolean =
    True);
var
  OnEditValChanged: TNotifyEvent;
begin
  OnEditValChanged := nil;
  if not TriggerEvents then
  begin
    if Assigned(Self.Properties.OnEditValueChanged) then
      OnEditValChanged := Self.Properties.OnEditValueChanged;
    Self.Properties.OnEditValueChanged := nil;
  end;
  Try
    Self.Clear;
    if Self.DS <> nil then
    begin
      Self.EditValue := Self.DS.FieldByName(Self.Properties.KeyFieldNames).Value;
    end;
  Finally
    if not TriggerEvents then
      Self.Properties.OnEditValueChanged := OnEditValChanged;
  End;
end;

procedure TcxExtLookupComboHelper.SetMultiPurposeLookup;
begin
  Self.Properties.SetMultiPurposeLookup;
end;

end.
