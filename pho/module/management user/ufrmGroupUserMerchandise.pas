unit ufrmGroupUserMerchandise;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, ufraFooter5Button, Grids,
  BaseGrid, AdvGrid, ActnList, AdvObj;

type
  TfrmGroupUserMerchandise = class(TfrmMaster)
    strgGrid: TAdvStringGrid;
    fraFooter5Button1: TfraFooter5Button;
    actlst1: TActionList;
    actAdd: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actRefresh: TAction;
    procedure strgGridGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure FormShow(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
  private
    procedure ParseHeader;
    procedure SetData;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGroupUserMerchandise: TfrmGroupUserMerchandise;

implementation
uses uRMSUnit, uNewGroup, ufrmDialogGroupUserMerchandise, uGTSUICommonDlg;
{$R *.dfm}

const
  _kolNo      : Integer = 0;
  _kolGrpID   : Integer = 1;
  _kolGrpNm   : Integer = 2;
  _kolGrpDesc : Integer = 3;
  _kolMerID   : Integer = 4;
  _kolMerCode : Integer = 5;
  _kolMerNm   : Integer = 6;
  _fixedRow   : Integer = 2;
  _ColCount   : Integer = 7;
  _rowCount   : Integer = 3;

procedure TfrmGroupUserMerchandise.ParseHeader;
begin
  with strgGrid do
  begin
    Clear;
    ColCount  := _ColCount;
    RowCount  := _rowCount;
    FixedRows := _fixedRow;

    MergeCells(_kolNo,0,1,2);
    Cells[_kolNo,0] := 'No';

    MergeCells(_kolGrpID,0,3,1);
    Cells[_kolGrpID,0] := 'Group User';
    Cells[_kolGrpID, 1]   := 'ID';
    Cells[_kolGrpNm, 1]   := 'Name';
    Cells[_kolGrpDesc, 1] := 'Description';

    MergeCells(_kolMerID,0,3,1);
    Cells[_kolMerID,0]    := 'Division';
    Cells[_kolMerID, 1]   := 'ID';
    Cells[_kolMerCode, 1] := 'Code';
    Cells[_kolMerNm, 1]   := 'Name';

    AutoSize  := True;


  end;  
end;

procedure TfrmGroupUserMerchandise.strgGridGetAlignment(Sender: TObject;
  ARow, ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  inherited;
  HAlign := taLeftJustify;
  if ARow < strgGrid.FixedRows then
  begin
    HAlign := taCenter;
  end;
//  else
//  begin
//    if ACol in [] then
//    begin
//      HAlign := taRightJustify;
//    end;
//  end;
end;

procedure TfrmGroupUserMerchandise.FormShow(Sender: TObject);
begin
  inherited;
  SetData;

end;

procedure TfrmGroupUserMerchandise.SetData;
var
  j: Integer;
  i: Integer;
begin
  ParseHeader;

  with cOpenQuery(GetSQLGrpUsrMerchan(0, 0, 0)) do
  begin
    try
      i := strgGrid.FixedRows;
      j := 1;
      while not Eof do
      begin
        if i > strgGrid.FixedRows then
          strgGrid.AddRow;

        strgGrid.Cells[_kolNo, i]       := IntToStr(j);
        strgGrid.Cells[_kolGrpID, i]    := FieldByName('GUM_GRO_ID').AsString;
        strgGrid.Cells[_kolGrpNm, i]    := FieldByName('GRO_NAME').AsString;
        strgGrid.Cells[_kolGrpDesc, i]  := FieldByName('GRO_DESCRIPTION').AsString;
        strgGrid.Cells[_kolMerID, i]    := FieldByName('GUM_MERCHAN_ID').AsString;
        strgGrid.Cells[_kolMerCode, i]  := FieldByName('MERCHAN_CODE').AsString;
        strgGrid.Cells[_kolMerNm, i]    := FieldByName('MERCHAN_NAME').AsString;
        
        Inc(i);
        Inc(j);
        Next;
      end;  
    finally
      Free
    end;
  end;
end;

procedure TfrmGroupUserMerchandise.actAddExecute(Sender: TObject);
begin
  inherited;
  if not Assigned(frmDialogGroupUserMerchandise) then
    frmDialogGroupUserMerchandise := TfrmDialogGroupUserMerchandise.Create(Self);

  frmDialogGroupUserMerchandise.MerID := 0;
  frmDialogGroupUserMerchandise.GrpID := 0;
  SetFormPropertyAndShowDialog(frmDialogGroupUserMerchandise);
  if frmDialogGroupUserMerchandise.IsProcessSuccessfull then
  begin
    SetData;
  end;


  FreeAndNil(frmDialogGroupUserMerchandise);
end;

procedure TfrmGroupUserMerchandise.actEditExecute(Sender: TObject);
begin
  inherited;
  if not Assigned(frmDialogGroupUserMerchandise) then
    frmDialogGroupUserMerchandise := TfrmDialogGroupUserMerchandise.Create(Self);

  with frmDialogGroupUserMerchandise do
  begin
    MerID := strgGrid.Ints[_kolMerID, strgGrid.Row];
    GrpID := strgGrid.Ints[_kolGrpID, strgGrid.Row];
  end;

  SetFormPropertyAndShowDialog(frmDialogGroupUserMerchandise);
  if frmDialogGroupUserMerchandise.IsProcessSuccessfull then
  begin  
    SetData;
  end;
  FreeAndNil(frmDialogGroupUserMerchandise);
end;

procedure TfrmGroupUserMerchandise.actDeleteExecute(Sender: TObject);
var
  MerId: Integer;
  GrpID: Integer;
begin
  inherited;
  GrpID := strgGrid.Ints[_kolGrpID, strgGrid.Row];
  MerId := strgGrid.Ints[_kolMerID, strgGrid.Row];
  with TGroupUserMerchandise.Create(Self) do
  begin
    try
      if LoadByID(GrpID, MerId, MasterNewUnit.ID) then
        if RemoveFromDB then
        begin
          CommonDlg.ShowMessage('Data telah dihapus');
          SetData;
        end
        else
          CommonDlg.ShowError('Gagal hapus data');

    finally
      Free;
    end;
  end;

end;

procedure TfrmGroupUserMerchandise.actRefreshExecute(Sender: TObject);
begin
  inherited;
  SetData;
end;

end.
