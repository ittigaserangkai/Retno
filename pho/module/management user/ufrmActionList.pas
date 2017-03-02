unit ufrmActionList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, ufraFooter5Button, Grids,
  BaseGrid, AdvGrid, uActionListCust, SUIButton, ActnList, AdvObj;

type
  TfrmActionList = class(TfrmMaster)
    pnlBodyUp: TPanel;
    opCari: TRadioGroup;
    edtPencarian: TEdit;
    chkFilter: TCheckBox;
    strgGrid: TAdvStringGrid;
    fraFooter5Button1: TfraFooter5Button;
    pnlBotton: TPanel;
    btnAuto: TsuiButton;
    procedure strgGridGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure fraFooter5Button1btnRefreshClick(Sender: TObject);
    procedure fraFooter5Button1btnUpdateClick(Sender: TObject);
    procedure fraFooter5Button1btnAddClick(Sender: TObject);
    procedure fraFooter5Button1btnDeleteClick(Sender: TObject);
    procedure btnAutoClick(Sender: TObject);
  private
    FactLstItm  : TActLstCustItm;
    FActList    : TActionListCust;
    
    { Private declarations }
    procedure SetHeader;
  public
    FActLst     : TActionList;

    procedure SetData;
    procedure ShowWithID(aUnitId: integer; aLoginID: integer; aActLst: TActionList);
    { Public declarations }

  end;

var
  frmActionList: TfrmActionList;

implementation

{$R *.dfm}
uses
  ufrmDialogActionList, uRMSUnit, uGTSUICommonDlg;
const
  _kolNo    : Integer = 0;
  _kolID    : Integer = 1;
  _kolNm    : Integer = 2;
  _kolDesc  : Integer = 3;
  _fixedRow : Integer = 1;
  _RowCount : Integer = 2;
  _ColCount : Integer = 4;

procedure TfrmActionList.SetData;
var
  m: Integer;
  i: Integer;
begin
  SetHeader;
  i := 0;
  m := strgGrid.RowCount;
  with cOpenQuery(GetSQLActionList(MasterNewUnit.ID)) do
  begin
    try
      while not Eof do
      begin
        AddRowNo(strgGrid, _kolNo, i, m, True);
        strgGrid.Cells[_kolID, i + _fixedRow]   := FieldByName('ACT_ID').AsString;
        strgGrid.Cells[_kolNm, i + _fixedRow]   := FieldByName('ACT_NAME').AsString;
        strgGrid.Cells[_kolDesc, i + _fixedRow] := FieldByName('ACT_DESC').AsString;

        Inc(i);
        Next;
      end;
    finally
      Free;
      strgGrid.AutoSize := True;
    end;
  end;

end;

procedure TfrmActionList.SetHeader;
begin
  with strgGrid do
  begin
    RowCount  := _RowCount;
    ColCount  := _ColCount;
    FixedRows := _fixedRow;

    Cells[_kolNo, 0] := 'NO';
    Cells[_kolID, 0] := 'ID';
    Cells[_kolNm, 0] := 'Name';
    Cells[_kolDesc, 0] := 'Description';

    AutoSize  := True;
  end;  
end;

procedure TfrmActionList.ShowWithID(aUnitId: integer; aLoginID: integer;
    aActLst: TActionList);
begin
  MasterNewUnit.LoadByID(aUnitId);
  FLoginID  := aLoginID;
  FActLst   := aActLst;
  SetData;

  Self.Show;
end;


procedure TfrmActionList.strgGridGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  HAlign := taLeftJustify;
  if ARow < strgGrid.FixedRows then
  begin
    HAlign := taCenter;
  end
  else
  begin
//    if ACol in [] then
//    begin
//      HAlign := taRightJustify;
//    end;
  end;
end;

procedure TfrmActionList.FormCreate(Sender: TObject);
begin
  inherited;
  FActList    := TActionListCust.Create(nil);
  FactLstItm  := TActLstCustItm.Create(nil);
end;

procedure TfrmActionList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action  := caFree;
end;

procedure TfrmActionList.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FActList);
  FreeAndNil(FactLstItm);
  frmActionList := nil;
  inherited;
end;

procedure TfrmActionList.fraFooter5Button1btnRefreshClick(Sender: TObject);
begin
  inherited;
  SetData;
end;

procedure TfrmActionList.fraFooter5Button1btnUpdateClick(Sender: TObject);
begin
  inherited;
  if not Assigned(frmDialogActionList) then
    Application.CreateForm(TfrmDialogActionList, frmDialogActionList);

  frmDialogActionList.frmSuiMasterDialog.Caption := 'Edit Action List';
  frmDialogActionList.ShowWithID(MasterNewUnit.ID, FLoginID, strgGrid.Ints[_kolID, strgGrid.Row]);
  SetData;


end;

procedure TfrmActionList.fraFooter5Button1btnAddClick(Sender: TObject);
begin
  inherited;
  if not Assigned(frmDialogActionList) then
    Application.CreateForm(TfrmDialogActionList, frmDialogActionList);

  frmDialogActionList.frmSuiMasterDialog.Caption := 'Add Action List';
  frmDialogActionList.ShowWithID(MasterNewUnit.ID, FLoginID);
  SetData;
end;

procedure TfrmActionList.fraFooter5Button1btnDeleteClick(Sender: TObject);
begin
  inherited;
  if (CommonDlg.Confirm('Are you sure you wish to delete Action List (Name: '
                  + strgGrid.Cells[_kolNm , strgGrid.row]+')?') = mrYes) then
  begin
    if FActList.LoadByID(strgGrid.Ints[_kolID , strgGrid.row], MasterNewUnit.ID) then
    begin
      if FActList.RemoveFromDB then
      begin
        cCommitTrans;
        CommonDlg.ShowMessage('Sukses menghapus data');
        SetData;
      end
      else
      begin
        cRollbackTrans;
        CommonDlg.ShowError('Gagal menghapus data');
      end;
    end
    else
    begin
      CommonDlg.ShowError('Data tidak ditemukan');
    end;    
  end;
end;

procedure TfrmActionList.btnAutoClick(Sender: TObject);
var
  i         : Integer;
  s         : string;  
  isDelFrst : Boolean;
begin
  inherited;

  if (CommonDlg.Confirm('Hapus action list yang lama?') = mrYes) then
  begin
    isDelFrst := True;
  end
  else
  begin
    isDelFrst := False;
  end;


  FactLstItm.ActionListCustItem.Clear;
  for i := 0 to FActLst.ActionCount - 1 do
  begin
    s := FActLst.Actions[i].Name;

    FactLstItm.ActionListCustItem.Add.ActLstCust.UpdateData('-', 0, s, MasterNewUnit.ID);
//    sSQL := 'insert into ACTION_LIST (ACT_ID, ACT_UNT, ACT_NAME, ACT_DESC)'
//        + ' VALUES('+ IntToStr(i + 1) + ', '
//        + Quot(s) + ', '
//        + Quot('-')
//        + ' )';
//    if cExecSQL(sSQL) and SimpanBlob(sSQL, 12121) then
//       Sks := True
//    else
//      Break;

  end;

  if FactLstItm.SaveToDBOption(isDelFrst) then
  begin
    cCommitTrans;
    CommonDlg.ShowMessage('Sukses menyimpan data');
  end
  else
  begin
    cRollbackTrans;
    CommonDlg.ShowError('Gagal menyimpan data');
  end;
end;

end.
