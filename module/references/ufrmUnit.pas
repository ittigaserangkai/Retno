unit ufrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, System.Actions,
  cxClasses, ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel, cxGridCustomView, cxGrid,
  cxPC, Vcl.ActnList, uDMClient, uDBUtils, Datasnap.DBClient;

type
  TfrmUnit = class(TfrmMasterBrowse)
    procedure actAddExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actAddUnitExecute(Sender: TObject);
    procedure actEditUnitExecute(Sender: TObject);
    procedure actDeleteUnitExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fraFooter5Button1btnDeleteClick(Sender: TObject);
    procedure actRefreshUnitExecute(Sender: TObject);
  private
    FCDS: TClientDataSet;
    FCompID     : Integer;
    FLoginUnit  : integer;
//    FUnit       : TUnit;
    FUnitID: Integer;
    procedure ParseHeader;
    procedure SetData;
    { Private declarations }

  protected
    procedure RefreshData; override;
  public
    procedure ShowWithCompanyID(aCompID: Integer; aUnitID: integer; aLoginID:
        integer; aLoginUntID: integer);
    { Public declarations }
    
  end;

var
  frmUnit: TfrmUnit;
  strType: string;

implementation

uses uTSCommonDlg, ufrmDialogUnit ,  uAppUtils, uDXUtils;

{$R *.dfm}
const
  _kolNo      : Integer = 0;
  _kolCode    : Integer = 1;
  _kolNm      : Integer = 2;
  _kolDesc    : Integer = 3;
  _kolAddress : Integer = 4;
  _kolNpwp    : Integer = 5;
  _kolType    : Integer = 6;
  _kolActive   : Integer = 7;
  _kolUnitID  : Integer = 8;
  _RowCount   : Integer = 2;
  _fixedRow   : Integer = 1;
  _fixedCol   : Integer = 1;
  _ColCount   : Integer = 8;


procedure TfrmUnit.actAddExecute(Sender: TObject);
begin
  inherited;

  if not Assigned(frmDialogUnit) then
  frmDialogUnit := TfrmDialogUnit.Create(Application);

  frmDialogUnit.ShowWithCompanyID(FCompID, 0, FLoginUnit, FLoginID );

  if frmDialogUnit.IsProcessSuccessfull then
    actRefreshUnitExecute(Self);

  FreeAndNil(frmDialogUnit);
end;

procedure TfrmUnit.FormDestroy(Sender: TObject);
begin
//  FreeAndNil(FUnit);
  frmUnit := nil;
  inherited;
end;

procedure TfrmUnit.FormShow(Sender: TObject);
begin
  inherited;
//  FUnit       := TUnit.Create(nil);
//  lblHeader.Caption := 'STORE UNIT';
//
//  FCompID     := MasterCompany.ID;
//  FUnitID     := MasterNewUnit.ID;
//  FLoginID    := FLoginID
//  FLoginUnit  := FLoginUnitId;
//
//  SetData;

end;

procedure TfrmUnit.actAddUnitExecute(Sender: TObject);
begin
  inherited;
//  if frmMain.CompanyId=0 then
//  begin
//    CommonDlg.ShowError(ER_COMPANY_NOT_SPECIFIC);
//    frmMain.cbbCompCode.SetFocus;
//    Exit;
//  end;

//  if not Assigned(frmDialogUnit) then
//    Application.CreateForm(TfrmDialogUnit, frmDialogUnit);
//  frmDialogUnit.frmSuiMasterDialog.Caption := 'Add Store Unit';
//  frmDialogUnit.FormMode := fmAdd;
//  frmDialogUnit.ShowModal;
//  if (frmDialogUnit.IsProcessSuccessfull) then
//  begin
//    actRefreshUnitExecute(Self);
//    CommonDlg.ShowConfirm(atAdd);
//  end;
//
//  frmDialogUnit.Free;


end;

procedure TfrmUnit.actEditUnitExecute(Sender: TObject);
begin
  inherited;
//  if frmMain.CompanyId=0 then
//  begin
//    CommonDlg.ShowError('Conpany not specific');
//    frmMain.cbbCompCode.SetFocus;
//    Exit;
//  end;

//  if not Assigned(frmDialogUnit) then
//    Application.CreateForm(TfrmDialogUnit, frmDialogUnit);
//  frmDialogUnit.frmSuiMasterDialog.Caption := 'Edit Store Unit';
//  frmDialogUnit.FormMode := fmEdit;
//  frmDialogUnit.UnitId := StrToInt(strgGrid.Cells[6,strgGrid.row]); // put your pajak id that won be edit
//  frmDialogUnit.ShowModal;
//  if (frmDialogUnit.IsProcessSuccessfull) then
//  begin
//    actRefreshUnitExecute(Self);
//    CommonDlg.ShowConfirm(atEdit);
//  end;

//  frmDialogUnit.Free;



end;

procedure TfrmUnit.actDeleteUnitExecute(Sender: TObject);
begin
  inherited;
  CommonDlg.ShowError('ANDA BUKAN ADMIN');

//  if (CommonDlg.Confirm('Are you sure you wish to delete Unit Store (Name: '+strgGrid.Cells[1,strgGrid.row]+')?') = mrYes) then
//  begin
//    if not assigned(Unt) then
//      Unt := TUnit.Create;
//
//    if Unt.DeleteDataUnit(StrToInt(strgGrid.Cells[6,strgGrid.row])) then
//    begin
//      actRefreshUnitExecute(Self);
//      CommonDlg.ShowConfirm(atDelete);
//    end;
//  end;
end;

procedure TfrmUnit.actEditExecute(Sender: TObject);
begin
  inherited;
  if not Assigned(frmDialogUnit) then
    frmDialogUnit := TfrmDialogUnit.Create(Application);

//  frmDialogUnit.ShowWithCompanyID(FCompID, strgGrid.Ints[_kolUnitID, strgGrid.Row],
//                            FLoginUnit, FLoginID );

  if frmDialogUnit.IsProcessSuccessfull then
    actRefreshUnitExecute(Self);

  FreeAndNil(frmDialogUnit);
end;

procedure TfrmUnit.actRefreshExecute(Sender: TObject);
begin
  inherited;
 ParseHeader;
 SetData;
end;

procedure TfrmUnit.FormActivate(Sender: TObject);
begin
  inherited;
  // no unit id must be specified, so hide the combo
//  frmMain.lbl1.Visible := False;
//  frmMain.cbbUnit.Visible := False;
//  frmMain.CreateMenu((sender as TForm));
end;

procedure TfrmUnit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  frmMain.lbl1.Visible    := True;
//  frmMain.cbbUnit.Visible := True;
//  frmMain.DestroyMenu((sender as TForm));
  Action  := caFree;
  inherited;
end;

procedure TfrmUnit.SetData;
var
  i: Integer;
begin
  {with FUnit.GetRec(FCompID) do
  begin
    try
      i := 0;
      while not Eof do
      begin
        AddRowNo(strgGrid, _kolNo, i, _RowCount, True);

        strgGrid.Cells[_kolNo, i + _fixedRow]       := IntToStr(i + 1);
        strgGrid.Cells[_kolCode, i + _fixedRow]     := FieldByName('unt_code').AsString;
        strgGrid.Cells[_kolNm, i + _fixedRow]       := FieldByName('unt_name').AsString;
        strgGrid.Cells[_kolDesc, i + _fixedRow]     := FieldByName('unt_description').AsString;
        strgGrid.Cells[_kolAddress, i + _fixedRow]  := FieldByName('uti_address').AsString;
        strgGrid.Cells[_kolNpwp, i + _fixedRow]     := FieldByName('uti_npwp').AsString;
        strgGrid.Cells[_kolType, i + _fixedRow]     := FieldByName('tppersh_name').AsString;
        strgGrid.Cells[_kolUnitID, i + _fixedRow]   := FieldByName('unt_id').AsString;
        strgGrid.AddCheckBox(_kolActive, i + _fixedRow, False, False);

        if FieldByName('UNT_IS_ACTIVE').AsInteger = 1 then
          strgGrid.SetCheckBoxState(_kolActive, i + _fixedRow, True);

        Inc(i);
        Next;
      end;  
    finally
      Free;
    end;
  end;
  strgGrid.AutoSizeCol(_kolNo);
  }
end;

procedure TfrmUnit.ShowWithCompanyID(aCompID: Integer; aUnitID: integer;
    aLoginID: integer; aLoginUntID: integer);
begin
  FCompID     := aCompID;
  FUnitID     := aUnitID;
  FLoginID    := aLoginID;
  FLoginUnit  := aLoginUntID;

  SetData;


end;

procedure TfrmUnit.fraFooter5Button1btnDeleteClick(Sender: TObject);
begin
  inherited;
  CommonDlg.ShowError('ANDA BUKAN ADMIN');
end;

procedure TfrmUnit.ParseHeader;
begin
  {with strgGrid do
  begin
    RowCount  := _RowCount;
    FixedRows := _fixedRow;
    ColCount  := _ColCount;
    FixedCols := _fixedCol;

    Cells[_kolNo, 0]      := 'NO';
    Cells[_kolCode, 0]    := 'CODE';
    Cells[_kolNm, 0]      := 'NAME';
    Cells[_kolDesc, 0]    := 'DESCRIPTION';
    Cells[_kolAddress, 0] := 'ADDRESS';
    Cells[_kolNpwp, 0]    := 'NPWP';
    Cells[_kolType, 0]    := 'TYPE';
    Cells[_kolActive, 0]  := 'AKTIF';
  end;
  }
end;

procedure TfrmUnit.actRefreshUnitExecute(Sender: TObject);
begin
  inherited;
 ParseHeader;
 SetData;
end;

procedure TfrmUnit.RefreshData;
begin
  inherited;
  if Assigned(FCDS) then FreeAndNil(FCDS);

  FCDS := TDBUtils.DSToCDS(DMClient.DSProviderClient.Unit_GetDSOverview(),Self );
  cxGridView.LoadFromCDS(FCDS);
  cxGridView.SetVisibleColumns(['AUT$UNIT_ID'],False);
end;

end.
