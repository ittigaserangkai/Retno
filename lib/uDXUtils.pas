unit uDXUtils;

interface

uses
  cxGrid,cxGridDBTableView, cxTreeView,  Math, cxGridExportLink,
  cxExportPivotGridLink, cxGridDBBandedTableView, cxDBPivotGrid, cxCurrencyEdit,
  cxCustomPivotGrid, cxGridBandedTableView, cxDBExtLookupComboBox, cxCustomData,
  cxFilter, cxGridCustomTableView, cxDBTL, cxTLExportLink,cxCalendar, Dialogs,
  SysUtils, cxGridDBDataDefinitions, System.Classes, uAppUtils,
  uDBUtils, cxDropDownEdit, cxGridTableView, StrUtils, System.Contnrs,
  Vcl.Controls, Vcl.Forms, Windows, Messages, Variants, Graphics, ExtCtrls,
  ActnList, System.Actions, Vcl.StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit,  cxLookupEdit, cxDBLookupEdit, cxCheckBox, cxSpinEdit, Data.DB,
  cxPC, Vcl.ComCtrls, Vcl.Mask, Datasnap.DBClient,  System.Rtti, uModApp,
  System.TypInfo, cxButtonEdit, System.DateUtils, cxCalc, cxGridLevel;


type
  TTag = set of byte;

  TcxTextEditHelper = class helper for TcxTextEdit
  public
    function TextRest: string;

  end;

  DataControllerHelper = class helper for TcxGridDataController
  private
  public
    function GetFooterSummary(ASummaryIndex: Integer): Variant; overload;
    function GetFooterSummary(aColumn: TcxGridColumn): Variant; overload;
    function GetFooterSummaryFloat(aColumn: TcxGridColumn): Double; overload;
  end;

  DBDataControllerHelper = class helper for TcxGridDBDataController
  private
  public
    function GetFooterSummary(ASummaryIndex: Integer): Variant; overload;
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
    procedure PrepareFromCDS(ACDS: TClientDataSet); overload;
    procedure LoadFromSQL(aSQL: String; aOwner: TComponent);
    procedure SetAllUpperCaseColumn;
    procedure SetBandVisible(aFieldName: string; IsVisible: Boolean);
    procedure SetColumnsCaption(ColumnSets, ColumnCaption: Array Of String);
    procedure SetDetailKeyField(aKeyField: String);
    procedure SetMasterKeyField(aKeyField: String);
    procedure SetVisibleColumns(ColumnSets: Array Of String; IsVisible: Boolean);
  end;

  TcxExtLookupPropHelper = class helper for TcxExtLookupComboBoxProperties
  private
  public
    procedure LoadFromCDS(aCDS: TClientDataSet; IDField, DisplayField: String;
        HideFields: Array Of String; aOwnerForm: TComponent); overload;
    procedure LoadFromCDS(aCDS: TClientDataSet; IDField, DisplayField: String;
        aOwnerForm: TComponent); overload;
    procedure LoadFromSQL(aSQL, IDField, DisplayField: String; HideFields: Array Of
        String; aOwnerForm: TComponent);
    procedure LoadFromDS(aDataSet: TDataSet; IDField, DisplayField: String;
        HideFields: Array Of String; aOwnerForm: TComponent); overload;
    procedure LoadFromDS(aDataSet: TDataSet; IDField, DisplayField: String;
        aOwnerForm: TComponent); overload;
    procedure SetMultiPurposeLookup;
    procedure SetVisibleColumnsOnly(ColumnSets: Array Of String; IsVisible: Boolean
        = True);
  end;

  TcxExtLookupComboHelper = class helper for TcxExtLookupComboBox
  public
    function CDS: TClientDataSet;
    function DS: TDataset;
    function EditValueText: String;
    function EditValueRest: String;
    procedure LoadFromCDS(aCDS: TClientDataSet; IDField, DisplayField: String;
        HideFields: Array Of String; aOwnerForm: TComponent); overload;
    procedure LoadFromCDS(aCDS: TClientDataSet; IDField, DisplayField: String;
        aOwnerForm: TComponent); overload;
    procedure LoadFromDS(aDataSet: TDataSet; IDField, DisplayField: String;
        HideFields: Array Of String; aOwnerForm: TComponent); overload;
    procedure LoadFromDS(aDataSet: TDataSet; IDField, DisplayField: String;
        aOwnerForm: TComponent); overload;
    procedure SetDefaultValue(TriggerEvents: Boolean = True);
    procedure SetMultiPurposeLookup;
    procedure SetVisibleColumnsOnly(ColumnSets: Array Of String; IsVisible: Boolean
        = True); overload;
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
    procedure DoFormatHeaderCXGRID;
  public
    procedure AutoFormatCurrency(ADisplayFormat: String =',0.00;(,0.00)');
    procedure AutoFormatText;
    procedure AutoFormatDate(ADisplayFormat: String = 'yyyy/mm/dd');
    procedure AutoFormatBoolean;
    function DS: TDataset;
    function CDS: TClientDataSet;
    procedure ExportToXLS(sFileName: String = ''; DoShowInfo: Boolean = True);
    function GetFooterSummary(sFieldName : String): Variant; overload;
    function GetFooterSummary(aColumn: TcxGridDBColumn): Variant; overload;
    procedure LoadFromCDS(ACDS: TClientDataSet; DoCreateAllItem: Boolean = True;
        DoBestFit: Boolean = True; AutoFormat: Boolean = True);
    procedure LoadFromSQL(aSQL: String; aOwner: TComponent); overload;
    procedure LoadFromSQL(aSQL: String); overload;
    procedure LoadFromDS(aDataSet: TDataSet; aOwner: TComponent; DoCreateAllItems:
        Boolean = true); overload;
    procedure PrepareFromCDS(ACDS: TClientDataSet); overload;
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
    procedure SetVisibleColumns(FromCol, ToCol: Integer; IsVisible: Boolean);
        overload;
    procedure SetReadOnlyColumns(ColumnSets: Array Of String; IsReadOnly: Boolean);
        overload;
    procedure SetReadOnlyAllColumns(IsReadOnly: Boolean); overload;
    procedure SetVisibleColumnsOnly(ColumnSets: Array Of String; IsVisible: Boolean
        = True); overload;
  end;

  TcxExtLookup= class(TcxExtLookupComboBoxProperties)
  protected
  public
    class procedure OnInitPopupCustom(Sender: TObject);
    class procedure OnClosePopupCustom(Sender: TObject);

  end;

  TFormHelper = class helper for TForm
  private
    procedure OnKeyEnter(Sender: TObject; var Key: Word; Shift: TShiftState);
  public
    procedure AssignKeyDownEvent;
    function CheckControlParent(ChildCtrl, ParentCtrl: TWinControl): Boolean;
    procedure ClearByTag(Tag: TTag; ParentCtrl: TWinControl = nil);
    function ValidateEmptyCtrl(Tag: TTag = [1]; ShowWarning: Boolean = True;
        ParentCtrl: TWinControl = nil): Boolean;
    class procedure OnEditValueChanged(Sender: TObject);
    function SetFocusRec(aWinCTRL: TWinControl): Boolean;
    function EnableDisableControl(ParentCtrl: TWinControl; aState: Boolean):
        Boolean;
  end;

  TcxGridTableViewHelper = class helper for TcxGridTableView
  public
    procedure FilterData(AColumn : TcxGridColumn; AOperatorKind:
        TcxFilterOperatorKind; const AValues : TStringArray; const ADisplayValues:
        TStringArray);
    procedure ClearRows;
    procedure SetValue(ARec, ACol : Integer; AValue : Variant);
    function Double(ARec, ACol : Integer): Double;
    function Date(ARec, ACol : Integer): TDatetime;
    procedure FilterDataLookUp(AColumn : TcxGridColumn; AFilterColumnCaption :
        String; AOperatorKind: TcxFilterOperatorKind; const AValues : TStringArray;
        const ADisplayValues: TStringArray);
    function GetFooterSummary(aColumn: TcxGridColumn): Variant; overload;
    function GetLevel: TcxGridLevel;
    function Int(ARec, ACol : Integer): Integer;
    function Text(ARec, ACol : Integer): string;
    procedure LoadObjectData(AObject : TModApp; ARow : Integer);
    function RecordIndex: Integer;
    procedure SetObjectData(AObject : TModApp; ARow : Integer);
    procedure SetVisibleColumns(FromCol, ToCol: Integer; IsVisible: Boolean);
        overload;
    function Validate: Boolean;
    function Values(ARec, ACol : Integer): Variant; overload;
    function Values(ARec : Integer; AColumnCaption : String): Variant; overload;
  end;

type
  TEditHelper = class helper for TEdit
  public
    function TextRest: string;
    function TextTrim: string;

  end;

type
  TComboboxHelper = class helper for TCombobox
  public
    function TextRest: string;

  end;

function CreateCXDBGrid(ALeft, ATop, AWidth, AHeight : Integer; AParent :
    TWinControl): TcxGrid;

function VarToInt(aValue: Variant): Integer;

function VarToFloat(aValue: Variant): Double;


implementation

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

function VarToFloat(aValue: Variant): Double;
begin
  if VarIsNull(aValue) then
    Result := 0
  else
    Result := aValue;
end;

function VarToInt(aValue: Variant): Integer;
begin
  if VarIsNull(aValue) then
    Result := 0
  else
    Result := aValue;
end;

function DataControllerHelper.GetFooterSummary(ASummaryIndex: Integer): Variant;
begin
  Result := Self.Summary.FooterSummaryValues[ASummaryIndex];
end;

function DataControllerHelper.GetFooterSummary(aColumn: TcxGridColumn): Variant;
var
  i: Integer;
begin
  Result := 0;

  with Self.Summary do
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

function DataControllerHelper.GetFooterSummaryFloat(aColumn: TcxGridColumn):
    Double;
var
  i: Integer;
begin
  Result := 0;

  with Self.Summary do
  begin
    for i :=0 to FooterSummaryItems.Count-1 do
    begin
//      If FooterSummaryItems.Items[i].ItemLink.ClassName <> aColumn.ClassName then
//        continue;

      If FooterSummaryItems.Items[i].ItemLink = aColumn then
        if not VarIsNull(FooterSummaryValues[i]) then
          Result := FooterSummaryValues[i];
    end;
  end;
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

procedure TcxDBBandGridHelper.PrepareFromCDS(ACDS: TClientDataSet);
begin
  If not Assigned(Self.DataController.DataSource) then
  begin
    Self.DataController.DataSource := TDataSource.Create(Self);
  end;
  Self.DataController.DataSource.DataSet := ACDS;
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
  if aCDS = nil then
    Exit;

  for i := 0 to aCDS.FieldDefs.Count-1 do
    aCDS.FieldDefs[i].Required := False;

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
  aView.FindPanel.DisplayMode := fpdmManual;
  aView.FindPanel.ClearFindFilterTextOnClose := True;
//  aView.FindPanel.FocusViewOnApplyFilter := True;


  If Self.GetOwner is TcxExtLookupComboBox then
  begin
    if aView.VisibleColumnCount = 1 then
    begin
      If aView.VisibleColumns[0].Width < TcxExtLookupComboBox(Self.GetOwner).Width then
        aView.VisibleColumns[0].Width := TcxExtLookupComboBox(Self.GetOwner).Width
    end;
  end;
end;

procedure TcxExtLookupPropHelper.LoadFromCDS(aCDS: TClientDataSet; IDField,
    DisplayField: String; aOwnerForm: TComponent);
begin
  Self.LoadFromCDS(aCDS, IDField, DisplayField,[IDField], aOwnerForm);
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

procedure TcxExtLookupPropHelper.LoadFromDS(aDataSet: TDataSet; IDField,
    DisplayField: String; aOwnerForm: TComponent);
var
  lCDS: TClientDataSet;
begin
  //method ini hanya digunakan sekali saja,
  //membuat cds sesuai owner form agar di free on destroy
  lCDS := TDBUtils.DSToCDS(aDataSet, aOwnerForm);
  Self.LoadFromCDS(lCDS, IDField, DisplayField, [IDField], aOwnerForm);
end;

procedure TcxExtLookupPropHelper.SetMultiPurposeLookup;
begin
  //new feature dx 15 : findpanel
  if Self.View = nil then
    Exit;

  if TcxGridDBTableView(Self.View).DS = nil then
    Exit;

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
      := 'Ketik di sini (per kolom) atau CTRL+F untuk mencari di semua kolom';
    TcxGridDBTableView(Self.View).FilterRow.Visible       := True;
    TcxGridDBTableView(Self.View).FilterRow.ApplyChanges  := fracImmediately;
  end;
  If not Assigned(Self.OnInitPopup) then
    Self.OnInitPopup := TcxExtLookup.OnInitPopupCustom;

  If not Assigned(Self.OnClosePopup) then
    Self.OnCloseUp := TcxExtLookup.OnClosePopupCustom;
end;

procedure TcxExtLookupPropHelper.SetVisibleColumnsOnly(ColumnSets: Array Of
    String; IsVisible: Boolean = True);
begin
  if not Assigned(Self.View) then exit;
  TcxGridDBTableView(Self.View).SetVisibleColumnsOnly(ColumnSets, IsVisible);
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

procedure TcxDBGridHelper.AutoFormatCurrency(ADisplayFormat: String
    =',0.00;(,0.00)');
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
      If lDS.Fields[i].DataType in [ftFloat, ftFMTBcd, ftBCD] then
      begin
        PropertiesClassName := 'TcxCurrencyEditProperties';
        TcxCurrencyEditProperties( Properties).DisplayFormat := ADisplayFormat;
        TcxCurrencyEditProperties( Properties).Alignment.Horz := taRightJustify;
        DataBinding.ValueType := 'Float';
      end;
    end;
  end;
end;

procedure TcxDBGridHelper.AutoFormatText;
var
  i: Integer;
  lCol: TcxGridDBColumn;
  lDS: TDataSet;
begin
  lDS := Self.DataController.DataSource.DataSet;
  for i := 0 to lDS.FieldCount-1 do
  begin
    lCol := Self.GetColumnByFieldName(lDS.Fields[i].FieldName);
    If not Assigned(lCol) then  continue;
    If lDS.Fields[i].DataType in [ftString] then
    begin
      lCol.DataBinding.ValueType := 'String';
      if lCol.PropertiesClass = nil then
        lCol.PropertiesClassName := 'TcxTextEditProperties';
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
      If lDS.Fields[i].DataType in [ftDate, ftDateTime, ftTimeStamp] then
      begin
        PropertiesClassName := 'TcxDateEditProperties';
        TcxDateEditProperties( Properties).DisplayFormat := ADisplayFormat;
        TcxDateEditProperties( Properties).EditMask := ADisplayFormat;
        DataBinding.ValueType := 'DateTime';
      end;
    end;
  end;
end;

procedure TcxDBGridHelper.AutoFormatBoolean;
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
      If lDS.Fields[i].DataType in [ftBoolean] then
      begin
        PropertiesClassName := 'TcxCheckBoxProperties';
        DataBinding.ValueType := 'Boolean';
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

procedure TcxDBGridHelper.DoFormatHeaderCXGRID;
var
  I: Integer;
begin
  for I := 0 to Self.ColumnCount - 1 do
  begin
    Self.Columns[i].Caption := StringReplace(Self.Columns[i].Caption,'_',' ', [rfReplaceAll]);
    Self.Columns[i].HeaderAlignmentHorz := taCenter;
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

procedure TcxDBGridHelper.LoadFromCDS(ACDS: TClientDataSet; DoCreateAllItem:
    Boolean = True; DoBestFit: Boolean = True; AutoFormat: Boolean = True);
begin
  if not Assigned(ACDS) then exit;
  If not Assigned(Self.DataController.DataSource) then
  begin
    Self.DataController.DataSource := TDataSource.Create(Self);
  end;
  Self.DataController.DataSource.DataSet := ACDS;
  If DoCreateAllItem then
    Self.DataController.CreateAllItems(True);

  if AutoFormat then
  begin
    AutoFormatText;
    AutoFormatBoolean;
    AutoFormatDate;
    AutoFormatCurrency;
    SetAllUpperCaseColumn;
    DoFormatHeaderCXGRID;
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

procedure TcxDBGridHelper.LoadFromDS(aDataSet: TDataSet; aOwner: TComponent;
    DoCreateAllItems: Boolean = true);
var
  lCDS: TClientDataSet;
begin
  lCDS := TDBUtils.DSToCDS(aDataSet, aOwner);

  if Assigned(Self.DataController.DataSource) then
    if Self.DataController.DataSource.DataSet <> nil then
      Self.DataController.DataSource.DataSet.Free;

  Self.LoadFromCDS(lCDS, DoCreateAllItems);
end;

procedure TcxDBGridHelper.PrepareFromCDS(ACDS: TClientDataSet);
begin
  If not Assigned(Self.DataController.DataSource) then
  begin
    Self.DataController.DataSource := TDataSource.Create(Self);
  end;
  Self.DataController.DataSource.DataSet := ACDS;
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
  if not Assigned(ExtLookupProp) then exit;
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

procedure TcxDBGridHelper.SetVisibleColumns(FromCol, ToCol: Integer; IsVisible:
    Boolean);
var
  i: Integer;
begin
  for i := FromCol to ToCol do
  begin
    Self.Columns[i].Visible := IsVisible;
  end;
end;

procedure TcxDBGridHelper.SetReadOnlyColumns(ColumnSets: Array Of String;
    IsReadOnly: Boolean);
var
  i: Integer;
begin
  for i := Low(ColumnSets) to High(ColumnSets) do
  begin
    If Assigned(Self.GetColumnByFieldName(ColumnSets[i])) then
    begin
      if Self.GetColumnByFieldName(ColumnSets[i]).PropertiesClassName = 'TcxTextEditProperties' then
        TcxTextEditProperties(Self.GetColumnByFieldName(ColumnSets[i]).Properties).ReadOnly := IsReadOnly
      else if Self.GetColumnByFieldName(ColumnSets[i]).PropertiesClassName = 'TcxCurrencyEditProperties' then
        TcxCurrencyEditProperties(Self.GetColumnByFieldName(ColumnSets[i]).Properties).ReadOnly := IsReadOnly
      else if Self.GetColumnByFieldName(ColumnSets[i]).PropertiesClassName = 'TcxDateEditProperties' then
        TcxDateEditProperties(Self.GetColumnByFieldName(ColumnSets[i]).Properties).ReadOnly := IsReadOnly
      else if Self.GetColumnByFieldName(ColumnSets[i]).PropertiesClassName = 'TcxCheckBoxProperties' then
        TcxCheckBoxProperties(Self.GetColumnByFieldName(ColumnSets[i]).Properties).ReadOnly := IsReadOnly;
    end;
  end;
end;

procedure TcxDBGridHelper.SetReadOnlyAllColumns(IsReadOnly: Boolean);
var
  i: Integer;
begin
  SetReadOnly(not IsReadOnly);
  for i := 0 to Self.ColumnCount-1 do
  begin
    If Assigned(Self.Columns[i]) then
    begin
      if Self.Columns[i].PropertiesClassName = 'TcxTextEditProperties' then
        TcxTextEditProperties(Self.Columns[i].Properties).ReadOnly := IsReadOnly
      else if Self.Columns[i].PropertiesClassName = 'TcxCurrencyEditProperties' then
        TcxCurrencyEditProperties(Self.Columns[i].Properties).ReadOnly := IsReadOnly
      else if Self.Columns[i].PropertiesClassName = 'TcxDateEditProperties' then
        TcxDateEditProperties(Self.Columns[i].Properties).ReadOnly := IsReadOnly
      else if Self.Columns[i].PropertiesClassName = 'TcxCheckBoxProperties' then
        TcxCheckBoxProperties(Self.Columns[i].Properties).ReadOnly := IsReadOnly;
    end;
  end;
end;

procedure TcxDBGridHelper.SetVisibleColumnsOnly(ColumnSets: Array Of String;
    IsVisible: Boolean = True);
var
  i: Integer;
begin
  for i := 0 to Self.ColumnCount-1 do
    Self.Columns[i].Visible := not IsVisible;

  for i := Low(ColumnSets) to High(ColumnSets) do
  begin
    If Assigned(Self.GetColumnByFieldName(ColumnSets[i])) then
      Self.GetColumnByFieldName(ColumnSets[i]).Visible := IsVisible;
  end;
end;

class procedure TcxExtLookup.OnInitPopupCustom(Sender: TObject);
begin
  If Sender is TcxExtLookupComboBox then
  begin
    TcxExtLookupComboBox(Sender).Properties.View.DataController.Filter.Clear;
    TcxExtLookupComboBox(Sender).Properties.ListFieldItem.Focused := True;
  end;
end;

class procedure TcxExtLookup.OnClosePopupCustom(Sender: TObject);
begin
  If Sender is TcxExtLookupComboBox then
  begin
    TcxExtLookupComboBox(Sender).SetFocus;
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

    if C.Tag = 999 then  // untuk pengecualian
      Continue;

    if C is TEdit then
      If not Assigned(TEdit(C).OnKeyDown) then
        TEdit(C).OnKeyDown := OnKeyEnter;
    if C is TCheckBox then
      if not Assigned(TCheckBox(C).OnKeyDown) then
        TCheckBox(C).OnKeyDown := OnKeyEnter;
    if C is TComboBox then
      if not Assigned(TComboBox(C).OnKeyDown) then
        TComboBox(C).OnKeyDown := OnKeyEnter;
    if C is TMaskEdit then
      if not Assigned(TMaskEdit(C).OnKeyDown) then
        TMaskEdit(C).OnKeyDown := OnKeyEnter;
    if C is TcxSpinEdit then
      if not Assigned(TcxSpinEdit(C).OnKeyDown) then
        TcxSpinEdit(C).OnKeyDown := OnKeyEnter;
    if C is TcxExtLookupComboBox then
      if not Assigned(TcxExtLookupComboBox(C).OnKeyDown) then
        TcxExtLookupComboBox(C).OnKeyDown := OnKeyEnter;
    if C is TLabeledEdit then
      if not Assigned(TLabeledEdit(C).OnKeyDown) then
        TLabeledEdit(C).OnKeyDown := OnKeyEnter;
    if C is TDateTimePicker then
      if not Assigned(TDateTimePicker(C).OnKeyDown) then
        TDateTimePicker(C).OnKeyDown := OnKeyEnter;


    //------ devexpress ---------//
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
    end
    else If C.InheritsFrom(TcxCustomEdit) then  //for all devexpress
      If not Assigned(TcxCustomEdit(C).OnKeyDown) then
        TcxCustomEdit(C).OnKeyDown := OnKeyEnter;
  end;
end;

procedure TFormHelper.ClearByTag(Tag: TTag; ParentCtrl: TWinControl = nil);
var
  C: TComponent;
  i: Integer;
begin
  for i := 0 to Self.ComponentCount-1 do
  begin
    C := Self.Components[i];
    if not (C.Tag in Tag) then continue;

    if not C.InheritsFrom(TWinControl) then continue;
    if ParentCtrl <> nil then
      if not CheckControlParent(TWinControl(C), ParentCtrl) then
        continue;
    if C is TEdit then TEdit(C).Clear;
    if C is TDateTimePicker then TDateTimePicker(C).Date := Now;
    if C is TcxDateEdit then TcxDateEdit(C).Date := Now
    else if C is TcxCurrencyEdit then TcxCurrencyEdit(C).Value := 0
    else if C is TcxSpinEdit then TcxSpinEdit(C).Value := 0
    else If C.InheritsFrom(TcxCustomEdit) then //standard devexpress parent
      TcxCustomEdit(C).Clear;

  end;
end;

function TFormHelper.CheckControlParent(ChildCtrl, ParentCtrl: TWinControl):
    Boolean;
begin
  Result := ChildCtrl.Parent = ParentCtrl;
  if Result then exit;

  If ChildCtrl.Parent <> nil then
    Result := CheckControlParent(ChildCtrl.Parent, ParentCtrl);
end;

function TFormHelper.ValidateEmptyCtrl(Tag: TTag = [1]; ShowWarning: Boolean =
    True; ParentCtrl: TWinControl = nil): Boolean;
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
    if ParentCtrl <> nil then
      if not CheckControlParent(TWinControl(C), ParentCtrl) then
        continue;

    if C is TcxExtLookupComboBox then
      IsEmpty := VarIsNull(TcxExtLookupComboBox(C).EditValue)
    else if C is TComboBox then IsEmpty := TComboBox(C).ItemIndex = -1
    else if C is TEdit then IsEmpty := TRIM(TEdit(C).Text) = ''
    else if C is TcxComboBox then IsEmpty := TcxComboBox(C).ItemIndex = -1
    else if C is TcxTextEdit then IsEmpty := TRIM(TcxTextEdit(C).Text) = ''
    else if C is TcxButtonEdit then IsEmpty := TRIM(TcxButtonEdit(C).Text) = ''
    else if C is TLabeledEdit then IsEmpty := TRIM(TLabeledEdit(C).Text) = '';
//    else if C is TcxSpinEdit then IsEmpty := TcxSpinEdit(C).Value = 0
//    else if C is TcxCurrencyEdit then IsEmpty := TcxCurrencyEdit(C).Value = 0;

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

      //for debugging
//      sMsg := sMsg + #13 + EmptyCtrl.ClassName + '.' + EmptyCtrl.Name;

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

function TFormHelper.EnableDisableControl(ParentCtrl: TWinControl; aState:
    Boolean): Boolean;
var
  C: TComponent;
  i: Integer;
//  iTabOrd: Integer;
//  sMsg: string;
//  EmptyCtrl: TWinControl;
//  IsEmpty: Boolean;
begin
  Result := False;
//  IsEmpty   := False;
//  iTabOrd   := MaxInt;
//  EmptyCtrl := nil;
  for i := 0 to Self.ComponentCount-1 do
  begin
    C := Self.Components[i];
    if not C.InheritsFrom(TWinControl) then continue;
    if ParentCtrl <> nil then
      if not CheckControlParent(TWinControl(C), ParentCtrl) then
        continue;
    TWinControl(C).Enabled := aState;
//    if C is TcxExtLookupComboBox then
//      IsEmpty := VarIsNull(TcxExtLookupComboBox(C).EditValue)
//    else if C is TComboBox then IsEmpty := TComboBox(C).ItemIndex = -1
//    else if C is TEdit then IsEmpty := TRIM(TEdit(C).Text) = ''
//    else if C is TcxComboBox then IsEmpty := TcxComboBox(C).ItemIndex = -1
//    else if C is TcxTextEdit then IsEmpty := TRIM(TcxTextEdit(C).Text) = '';
////    else if C is TcxSpinEdit then IsEmpty := TcxSpinEdit(C).Value = 0
////    else if C is TcxCurrencyEdit then IsEmpty := TcxCurrencyEdit(C).Value = 0;
//
//    if (IsEmpty) and (TWinControl(C).TabOrder < iTabOrd) then
//    begin
//      EmptyCtrl := TWinControl(C);
//      iTabOrd   := EmptyCtrl.TabOrder;
//    end;
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

function TcxExtLookupComboHelper.EditValueText: String;
begin
  if VarIsNull(EditValue) then
    Result := ''
  else
    Result := EditValue;
end;

procedure TcxExtLookupComboHelper.LoadFromCDS(aCDS: TClientDataSet; IDField,
    DisplayField: String; HideFields: Array Of String; aOwnerForm: TComponent);
begin
  Self.Properties.LoadFromCDS(aCDS, IDField, DisplayField, HideFields, aOwnerForm);
end;

procedure TcxExtLookupComboHelper.LoadFromCDS(aCDS: TClientDataSet; IDField,
    DisplayField: String; aOwnerForm: TComponent);
begin
  Self.Properties.LoadFromCDS(aCDS, IDField, DisplayField, [IDField], aOwnerForm);
end;

procedure TcxExtLookupComboHelper.LoadFromDS(aDataSet: TDataSet; IDField,
    DisplayField: String; HideFields: Array Of String; aOwnerForm: TComponent);
begin
  Self.Properties.LoadFromDS(aDataSet, IDField, DisplayField,
    HideFields, aOwnerForm);
end;

procedure TcxExtLookupComboHelper.LoadFromDS(aDataSet: TDataSet; IDField,
    DisplayField: String; aOwnerForm: TComponent);
begin
  Self.Properties.LoadFromDS(aDataSet, IDField, DisplayField,
    [IDField], aOwnerForm);
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

procedure TcxGridTableViewHelper.ClearRows;
var
  I: Integer;
begin
  BeginUpdate;
  try
    for I := DataController.RecordCount - 1 downto 0 do
    begin
      DataController.FocusedRecordIndex := i;
      DataController.DeleteFocused;
    end;
  finally
    EndUpdate;
  end;
end;

procedure TcxGridTableViewHelper.SetValue(ARec, ACol : Integer; AValue :
    Variant);
begin
  Self.DataController.Values[ARec, ACol] := AValue;
end;

function TcxGridTableViewHelper.Double(ARec, ACol : Integer): Double;
begin
  Result := 0;

  if not VarIsNull(Values(ARec,ACol)) then
    Result := Values(ARec,ACol);
end;

function TcxGridTableViewHelper.Date(ARec, ACol : Integer): TDatetime;
begin
  Result := VarToDateTime(Self.DataController.Values[ARec, ACol]);
end;

procedure TcxGridTableViewHelper.FilterData(AColumn : TcxGridColumn;
    AOperatorKind: TcxFilterOperatorKind; const AValues : TStringArray; const
    ADisplayValues: TStringArray);
var
  i: Integer;
  lItemList: TcxFilterCriteriaItemList;
begin
  if High(AValues) <> High(ADisplayValues) then
    raise Exception.Create('Count Of Value is different from Count Of Display Value');

  Self.DataController.Filter.BeginUpdate;
  try
    Self.DataController.Filter.Root.Clear;
    lItemList := Self.DataController.Filter.Root.AddItemList(fboOr);

    for I := Low(AValues) to High(AValues) do
    begin
      lItemList.AddItem(AColumn, AOperatorKind, AValues[i], ADisplayValues[i]);
    end;
  finally
    Self.DataController.Filter.EndUpdate;
    Self.DataController.Filter.Active := true;
    Self.FilterRow.Visible            := False;
  end;
end;

procedure TcxGridTableViewHelper.FilterDataLookUp(AColumn : TcxGridColumn;
    AFilterColumnCaption : String; AOperatorKind: TcxFilterOperatorKind; const
    AValues : TStringArray; const ADisplayValues: TStringArray);
var
//  i: Integer;
  lColumn: TcxGridColumn;
  lCXGrid: TcxGridDBTableView;
begin
  if High(AValues) <> High(ADisplayValues) then
    raise Exception.Create('Count Of Value is different from Count Of Display Value');

  lCXGrid := TcxExtLookupComboBoxProperties(AColumn.Properties).View as TcxGridDBTableView;
  lColumn := lCXGrid.GetColumnByFieldName(AFilterColumnCaption);

  lCXGrid.FilterData(lColumn,AOperatorKind, AValues, ADisplayValues);

end;

function TcxGridTableViewHelper.GetFooterSummary(aColumn: TcxGridColumn):
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

function TcxGridTableViewHelper.GetLevel: TcxGridLevel;
var
  I: Integer;
begin
  Result := nil;
  
  for I := 0 to Self.Owner.ComponentCount - 1 do
  begin
    if Self.Owner.Components[i] is TcxGridLevel then
      Result :=  Self.Owner.Components[i] as TcxGridLevel;
    
  end;

end;

function TcxGridTableViewHelper.Int(ARec, ACol : Integer): Integer;
begin
  if Self.DataController.Values[ARec, ACol] = null  then
    Result := 0
  else
    Result := Self.DataController.Values[ARec, ACol];
end;

function TcxGridTableViewHelper.Text(ARec, ACol : Integer): string;
begin
  if Self.DataController.Values[ARec, ACol] = null  then
    Result := ''
  else
    Result := Self.DataController.Values[ARec, ACol];
end;

procedure TcxGridTableViewHelper.LoadObjectData(AObject : TModApp; ARow :
    Integer);
var
  ctx : TRttiContext;
  rt : TRttiType;
  prop : TRttiProperty;
  meth : TRttiMethod;
  I: Integer;
  lAppObject: TModApp;
begin
  ctx := TRttiContext.Create();
  try
    rt := ctx.GetType(AObject.ClassType);
    for prop in rt.GetProperties() do
    begin
      for I := 0 to Self.ColumnCount - 1 do
      begin
        if UpperCase(prop.Name) = UpperCase(Self.Columns[i].AlternateCaption) then
        begin
          if prop.Visibility <> mvPublished then
            Continue;

          case prop.PropertyType.TypeKind of
            tkInteger : prop.SetValue(AObject,Self.Int(ARow,i));
            tkFloat   : If LowerCase(Prop.PropertyType.Name) = LowerCase('TDateTime') then
                          prop.SetValue(AObject,Self.Date(ARow,i))
                        ELSE
                          prop.SetValue(AObject,Self.Double(ARow,i));
            tkUString : prop.SetValue(AObject,Self.Text(ARow,i));
            tkClass   : begin
                        meth := prop.PropertyType.GetMethod('ToArray');
                        if Assigned(meth) then
                        begin
                          Continue;
                        end else begin
                          meth          := prop.PropertyType.GetMethod('Create');
                          lAppObject    := TModApp(meth.Invoke(prop.PropertyType.AsInstance.MetaclassType, []).AsObject);
                          lAppObject.ID := Self.Text(ARow,i);

                          prop.SetValue(AOBject, lAppObject);
                        end;
                      end;
          end;
        end;
      end;
    end;
  finally
    ctx.Free();
  end;

end;

function TcxGridTableViewHelper.RecordIndex: Integer;
begin
  Result := Self.DataController.FocusedRecordIndex;
end;

procedure TcxGridTableViewHelper.SetObjectData(AObject : TModApp; ARow :
    Integer);
var
  ctx : TRttiContext;
  rt : TRttiType;
  prop : TRttiProperty;
  j: Integer;

begin
  ctx := TRttiContext.Create();
  try
    rt := ctx.GetType(AObject.ClassType);
      for prop in rt.GetProperties() do
      begin
        for j := 0 to Self.ColumnCount - 1 do
        begin

          if UpperCase(prop.Name) <> UpperCase(Self.Columns[j].AlternateCaption) then
            Continue;

          case prop.PropertyType.TypeKind of
            tkClass   : begin
                          Self.SetValue(ARow,j,TModApp(prop.GetValue(AObject).AsObject).ID);
                        end;
            tkInteger : Self.SetValue(ARow,j,prop.GetValue(AObject).AsInteger);

            tkFloat   : //if CompareText('TDateTime',prop.PropertyType.Name)=0 then
  //                          Self.SetValue(i,j,QuotedStr(FormatDateTime('MM/dd/yyyy hh:mm:ss',prop.GetValue(AObject).AsExtended)))
  //                        else
                          Self.SetValue(ARow,j,prop.GetValue(AObject).AsExtended);

            tkUString : Self.SetValue(ARow,j,prop.GetValue(AObject).AsString);
          end;
        end;
      end;
  finally
    ctx.Free;
  end;
end;

procedure TcxGridTableViewHelper.SetVisibleColumns(FromCol, ToCol: Integer;
    IsVisible: Boolean);
var
  i: Integer;
begin
  for i := FromCol to ToCol do
  begin
    Self.Columns[i].Visible := IsVisible;
  end;
end;

function TcxGridTableViewHelper.Validate: Boolean;
var
  IsEmpty: Boolean;
  j: Integer;
  k: Integer;
  sMsg: string;
begin
  Result  := False;

  if Self.DataController.RecordCount = 0 then
  begin
    TAppUtils.Warning('Data Pada ' + Self.GetLevel.Caption + ' Masih Kosong' );
    Exit;
  end;

  IsEmpty := False;
  
  for j := 0 to Self.ColumnCount - 1 do
  begin
    if not (Self.Columns[j].Tag = 1) then continue;

    for k := 0 to Self.DataController.RecordCount - 1 do
    begin
      if Self.Columns[j].PropertiesClass = TcxTextEditProperties then
      begin
        IsEmpty := Self.Text(k,j) = '';
        if IsEmpty then
          Break;
      end else if Self.Columns[j].PropertiesClass = TcxButtonEditProperties then
      begin
        IsEmpty := Self.Text(k,j) = '';
        if IsEmpty then
          Break;
      end else if Self.Columns[j].PropertiesClass = TcxExtLookupComboBoxProperties then
      begin
        IsEmpty := Self.Values(k,j) = null;
        if IsEmpty then
          Break;
      end else if Self.Columns[j].PropertiesClass = TcxCurrencyEditProperties then
      begin
        IsEmpty := Self.Double(k,j) = 0;
        if IsEmpty then
          Break;
      end else if Self.Columns[j].PropertiesClass = TcxCalcEditProperties then
      begin
        IsEmpty := Self.Int(k,j) = 0;
        if IsEmpty then
          Break;
      end else if Self.Columns[j].PropertiesClass = TcxDateEditProperties then
      begin
        IsEmpty := YearOf(Self.Date(k,j)) = 1899;
        if IsEmpty then
          Break;
      end else if Self.Columns[j].PropertiesClass = TcxCurrencyEditProperties then
      begin
        IsEmpty := Self.Double(k,j) = 0;
        if IsEmpty then
          Break;
      end;        
    end;

    if IsEmpty then
    begin
      sMsg := 'Data ' + Self.Columns[j].Caption + ' Baris ' + IntToStr(k+1) + ' Masih Salah';
      TAppUtils.Warning(sMsg);
      Exit;
    end;    
  end;

  Result := True;
end;

function TcxGridTableViewHelper.Values(ARec, ACol : Integer): Variant;
begin
  Result := Null;

  Result := Self.DataController.Values[ARec,ACol];
end;

function TcxGridTableViewHelper.Values(ARec : Integer; AColumnCaption :
    String): Variant;
var
  iCol: Integer;
  I: Integer;
begin
  Result := Null;

  iCol := -1;
  for I := 0 to Self.ColumnCount - 1 do
  begin
    if Self.Columns[i].Caption = AColumnCaption then
    begin
      iCol := i;
    end;
  end;

  if iCol <> -1 then
    Result := Self.DataController.Values[ARec,iCol];
end;

function TcxExtLookupComboHelper.EditValueRest: String;
begin
  if VarIsNull(EditValue) then
    Result := ''
  else
    Result := EditValue;

  if Result = '' then
    Result := 'null';
end;

procedure TcxExtLookupComboHelper.SetVisibleColumnsOnly(ColumnSets: Array Of
    String; IsVisible: Boolean = True);
begin
  Self.Properties.SetVisibleColumnsOnly(ColumnSets, IsVisible);
end;

function TcxTextEditHelper.TextRest: string;
begin
  Result := Trim(Self.Text);
  if Result = '' then
    Result := 'null';
end;

function TEditHelper.TextRest: string;
begin
  Result := Trim(Self.Text);

  if Result = '' then
    Result := 'null';
end;

function TEditHelper.TextTrim: string;
begin
  Result := Trim(Self.Text);
end;

function TComboboxHelper.TextRest: string;
begin
  Result := Trim(Self.Text);

  if Result = '' then
    Result := 'null';
end;

end.

