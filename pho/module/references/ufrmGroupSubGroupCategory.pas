unit ufrmGroupSubGroupCategory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, ufraFooter5Button, StdCtrls, ExtCtrls, Grids,
  BaseGrid, AdvGrid, ActnList, uGroup, uSubGroup, uKategori;

type
  dtDelete = (dtGroup,dtSubGroup,dtCategory);

  TfrmGroupSubGroupCategory = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    pnlLeft1: TPanel;
    strgGroup: TAdvStringGrid;
    pnlBottom: TPanel;
    pnlLeft2: TPanel;
    pnlRight: TPanel;
    strgSubGroup: TAdvStringGrid;
    strgCategory: TAdvStringGrid;
    pnlFoo: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    edtGroup: TEdit;
    edtSubGroup: TEdit;
    edtCategory: TEdit;
    actlst1: TActionList;
    actAddGSGC: TAction;
    actEditGSGC: TAction;
    actDeleteGSGC: TAction;
    actRefreshGSGC: TAction;
    spl1: TSplitter;
    spl2: TSplitter;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actAddGSGCExecute(Sender: TObject);
    procedure actEditGSGCExecute(Sender: TObject);
    procedure actDeleteGSGCExecute(Sender: TObject);
    procedure actRefreshGSGCExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure strgCategoryClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure strgCategoryRowChanging(Sender: TObject; OldRow, NewRow: Integer; var
        Allow: Boolean);
    procedure strgGroupClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure strgGroupRowChanging(Sender: TObject; OldRow, NewRow: Integer; var
        Allow: Boolean);
    procedure strgSubGroupClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure strgSubGroupRowChanging(Sender: TObject; OldRow, NewRow: Integer; var
        Allow: Boolean);
  private
    IdGroup,IdSubGroup,IdKategori: Integer;
    FDlt: dtDelete;
    FGroup: TGroup;
    FKategori: TKategori;
    FSubGroup: TSubGroup;
    procedure SetGridSelect(Value: dtDelete);
    procedure ShowGroup;
    procedure ShowSubGroup;
    procedure ShowCategory;
  public
    property GridSelect : dtDelete read FDlt write SetGridSelect;
  end;

var
  frmGroupSubGroupCategory: TfrmGroupSubGroupCategory;

implementation

uses ufrmDialogGroupSubGroupCategory, uTSCommonDlg, uGroups, uConn, DB,
  ufrmMain, uConstanta, uRetnoUnit;

{$R *.dfm}
const
  _kolSubGrpCode  : Integer = 0;
  _KolSubGrpNm    : integer = 1;
  _kolSubGrpGP    : Integer = 2;
  _kolSubGrpID    : Integer = 3;
  _kolSubGrpUnt   : Integer = 4;

procedure TfrmGroupSubGroupCategory.SetGridSelect(Value: dtDelete);
begin
  FDlt:=Value;
end;

procedure TfrmGroupSubGroupCategory.ShowGroup;
var data: TDataSet;
    i: Integer;
begin
  if not assigned(Groups) then
    Groups := TGroups.Create;

  data:= Groups.GetDataGroup();
  with strgGroup do
  begin
    Clear;
    RowCount:= data.RecordCount+1;
    ColCount := 4;

    Cells[0, 0] := 'GROUP CODE';
    Cells[1, 0] := 'GROUP NAME';
    Cells[2, 0] := 'MARK UP';
    Cells[3, 0] := 'REKENING CODE';
    i:=1;
    if RowCount>1 then
    with data do
    begin
      while not Eof do
      begin
        Cells[0, i] := FieldByName('GRUP_CODE').AsString;
        Cells[1, i] := FieldByName('GRUP_NAME').AsString;
        Cells[2, i] := FormatFloat('#,##0.00',FieldByName('GRUP_DEF_MARK_UP').AsFloat);
        Cells[3, i] := FieldByName('MERCHANGRUP_REK_CODE').AsString;
        Cells[4, i] := IntToStr(FieldByName('GRUP_ID').AsInteger);
        Cells[5, i] := FloatToStr(FieldByName('GRUP_DEF_MARK_UP').AsFloat);

        i:=i+1;
        Next;
      end;
    end
    else
    begin
      RowCount:=2;
      Cells[0, 1] := ' ';
      Cells[1, 1] := ' ';
      Cells[2, 1] := ' ';
      Cells[3, 1] := ' ';
      Cells[4, 1] := '0';
      Cells[5, 1] := '0';
      Cells[6, 1] := '0';
    end;
    FixedRows:=1;
    AutoSize:=True;
  end;
end;

procedure TfrmGroupSubGroupCategory.ShowSubGroup;
var dataSubGroup: TDataSet;
    i: Integer;
begin
  if not assigned(Groups) then
    Groups := TGroups.Create;

  dataSubGroup:= Groups.GetDataSubGroup(IdGroup);
  with strgSubGroup do
  begin
    Clear;
    RowCount := dataSubGroup.RecordCount+1;
    ColCount := 3;
    Cells[_kolSubGrpCode, 0]  := 'SUBGROUP CODE';
    Cells[_KolSubGrpNm, 0]    := 'SUBGROUP NAME';
    Cells[_kolSubGrpGP, 0]    := 'GROSS PROFIT';

    i:=1;
    if RowCount>1 then
    with dataSubGroup do
    while not Eof do
    begin
      Cells[_kolSubGrpCode, i]  := FieldByName('SUBGRUP_CODE').AsString;
      Cells[_KolSubGrpNm, i]    := FieldByName('SUBGRUP_NAME').AsString;
      Cells[_kolSubGrpGP, i]    := FormatFloat('#,##0.00',FieldByName('SUBGRUP_GP').AsFloat);
      Cells[_kolSubGrpID, i]    := IntToStr(FieldByName('SUBGRUP_ID').AsInteger);
      
      i:=i+1;
      Next;
    end
    else
    begin
      RowCount:= 2;
      Cells[_kolSubGrpCode, 1]  := ' ';
      Cells[_KolSubGrpNm, 1]    := ' ';
      Cells[_kolSubGrpGP, 1]    := '0';
      Cells[_kolSubGrpID, 1]    := '0';
      Cells[_kolSubGrpUnt, 1]   := '0';
    end;
    FixedRows:=1;
    AutoSize:=True;
  end;
end;

procedure TfrmGroupSubGroupCategory.ShowCategory;
var dataKategori: TDataSet;
    i: Integer;
begin
  if not assigned(Groups) then
    Groups := TGroups.Create;

  dataKategori:= Groups.GetDataKategori(IdSubGroup);
  with strgCategory do
  begin
    Clear;
    RowCount:= dataKategori.RecordCount+1;
    ColCount:=2;
    Cells[0, 0] := 'CATEGORY CODE';
    Cells[1, 0] := 'CATEGORY NAME';
    i:=1;
    if RowCount>1 then
    with dataKategori do
    while not Eof do
    begin
      Cells[0, i] := FieldByName('KAT_CODE').AsString;
      Cells[1, i] := FieldByName('KAT_NAME').AsString;
      Cells[2, i] := IntToStr(FieldByName('KAT_ID').AsInteger);
      i:=i+1;
      Next;
    end
    else
    begin
      RowCount:=2;
      Cells[0, 1] := ' ';
      Cells[1, 1] := ' ';
      Cells[2, 1] := '0';
    end;
    FixedRows:=1;
    AutoSize:=True;
  end;
end;

procedure TfrmGroupSubGroupCategory.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmMain.DestroyMenu((sender as TForm));
  Action := caFree;
end;

procedure TfrmGroupSubGroupCategory.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'MERCHANDISE GROUP / SUB GROUP / CATEGORY';
  pnlLeft1.Width := 270;
  pnlLeft2.Width := 250;

  FGroup := TGroup.Create(Self);
  FSubGroup := TSubGroup.Create(Self);
  FKategori := TKategori.Create(Self);
end;

procedure TfrmGroupSubGroupCategory.FormDestroy(Sender: TObject);
begin
  inherited;
  frmGroupSubGroupCategory := nil;
end;

procedure TfrmGroupSubGroupCategory.actAddGSGCExecute(Sender: TObject);
var
  iRowSub : Integer;
  iRowGrp : Integer;
  isAllow : Boolean;
  i       : Integer;
  sCatCode: string;
  sSubCode: string;
  sGrpCode: string;
begin

  iRowGrp := strgGroup.Row;
  iRowSub := strgSubGroup.Row;

  if not Assigned(frmDialogGroupSubGroupCategory) then
    Application.CreateForm(TfrmDialogGroupSubGroupCategory, frmDialogGroupSubGroupCategory);
  frmDialogGroupSubGroupCategory.frmSuiMasterDialog.Caption := 'Add Group/SubGroup/Category';
  frmDialogGroupSubGroupCategory.FormMode := fmAdd;
  frmDialogGroupSubGroupCategory.idGrup:=IdGroup;
  frmDialogGroupSubGroupCategory.IdSubGrup:=IdSubGroup;
  case FDlt of
    dtGroup: frmDialogGroupSubGroupCategory.pcContent.ActivePageIndex:=0;
    dtSubGroup: frmDialogGroupSubGroupCategory.pcContent.ActivePageIndex:=1;
    dtCategory: frmDialogGroupSubGroupCategory.pcContent.ActivePageIndex:=2;
    else frmDialogGroupSubGroupCategory.pcContent.ActivePageIndex:=0;
  end;

  SetFormPropertyAndShowDialog(frmDialogGroupSubGroupCategory);
  if (frmDialogGroupSubGroupCategory.IsProcessSuccessfull) then
  begin
    sGrpCode  := Trim(frmDialogGroupSubGroupCategory.edtGroupCode.Text);
    sSubCode  := Trim(frmDialogGroupSubGroupCategory.edtSubGrupCode.Text);
    sCatCode  := Trim(frmDialogGroupSubGroupCategory.edtCategoryCode.Text);

    actRefreshGSGCExecute(Self);
    CommonDlg.ShowConfirm(atAdd);
    FDlt := dtGroup;

    if Trim(sGrpCode) <> '' then
    begin
      for i := 0 to strgGroup.RowCount - 1 do
      begin
        if Trim(strgGroup.Cells[0, i]) = sGrpCode then
        begin
          strgGroupRowChanging(strgGroup, 0, i, isAllow );
          strgGroup.SelectRows(i, 1);
          strgGroup.ScrollInView(0, i);
          Break;
        end;
      end;
    end
    else
      strgGroup.SelectRows(iRowGrp, 1);

      

    if Trim(sSubCode) <> '' then
    begin
      for i := 0 to strgSubGroup.RowCount - 1 do
      begin
        if Trim(strgSubGroup.Cells[0, i]) = sSubCode then
        begin
          strgSubGroupRowChanging(strgSubGroup, 0, i, isAllow);
          strgSubGroup.SelectRows(i, 1);
          strgSubGroup.ScrollInView(0, i);
          Break;
        end;
      end;
    end
    else
    begin
      strgGroupRowChanging(Self, 0, iRowGrp, isAllow);
      strgSubGroup.SelectRows(iRowSub, 1);
      strgSubGroupRowChanging(Self, 0, iRowSub, isAllow);
    end;

//    if Trim(sCatCode) <> '' then
//    begin
      for i := 0 to strgCategory.RowCount - 1 do
      begin
        if Trim(strgCategory.Cells[0, i]) = sCatCode then
        begin
          strgCategoryRowChanging(strgCategory, 0, i, isAllow);
          strgCategory.SelectRows(i, 1);
          strgCategory.ScrollInView(0, i);
          Break;
        end;
      end;
//    end
//    else
//    begin
//      strgSubGroupRowChanging(Self, 0, iRowSub, isAllow);
//      strgCategory.SelectRows(iRowKat, 1);
//    end;
  end;

  frmDialogGroupSubGroupCategory.Free;
  frmDialogGroupSubGroupCategory := nil;
end;

procedure TfrmGroupSubGroupCategory.actEditGSGCExecute(Sender: TObject);
var
  isAllow: Boolean;
  iRowKat: Integer;
  iRowSub: Integer;
  iRowGrp: Integer;
begin
  if MasterNewUnit.ID=0 then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    frmMain.cbbUnit.SetFocus;
    Exit;
  end;
  if not Assigned(frmDialogGroupSubGroupCategory) then
    Application.CreateForm(TfrmDialogGroupSubGroupCategory, frmDialogGroupSubGroupCategory);
  case FDlt of
    dtGroup   : begin
                  if strgGroup.Cells[0, 1]= ' ' then Exit;
                  frmDialogGroupSubGroupCategory.pcContent.ActivePageIndex:=0;
                end;
    dtSubGroup: begin
                  if strgSubGroup.Cells[0, 1]= ' ' then Exit;
                  frmDialogGroupSubGroupCategory.pcContent.ActivePageIndex:=1;
                end;
    dtCategory: begin
                  if strgCategory.Cells[0, 1]= ' ' then Exit;
                  frmDialogGroupSubGroupCategory.pcContent.ActivePageIndex:=2;
                end;
    else frmDialogGroupSubGroupCategory.pcContent.ActivePageIndex:=0;
  end;

  iRowGrp := strgGroup.Row;
  iRowSub := strgSubGroup.Row;
  iRowKat := strgCategory.Row;

  frmDialogGroupSubGroupCategory.frmSuiMasterDialog.Caption := 'Edit Group/SubGroup/Category';
  frmDialogGroupSubGroupCategory.FormMode := fmEdit;
  frmDialogGroupSubGroupCategory.idGrup:=IdGroup;
  frmDialogGroupSubGroupCategory.IdSubGrup:=IdSubGroup;
  frmDialogGroupSubGroupCategory.IdKategori:=IdKategori;
//  frmDialogGroupSubGroupCategory.ShowModal;
  SetFormPropertyAndShowDialog(frmDialogGroupSubGroupCategory);
  if (frmDialogGroupSubGroupCategory.IsProcessSuccessfull) then
  begin
    actRefreshGSGCExecute(Self);
    CommonDlg.ShowConfirm(atEdit);
    strgGroup.SelectRows(iRowGrp, 1);
    strgGroupRowChanging(Self, 0, iRowGrp, isAllow);
    strgSubGroup.SelectRows(iRowSub, 1);
    strgSubGroupRowChanging(Self, 0, iRowSub, isAllow);
    strgCategory.SelectRows(iRowKat, 1);
  end;

  frmDialogGroupSubGroupCategory.Free;
end;

procedure TfrmGroupSubGroupCategory.actDeleteGSGCExecute(Sender: TObject);
begin
  if MasterNewUnit.ID = 0 then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    frmMain.cbbUnit.SetFocus;
    Exit;
  end;
  
  try
    if FDlt = dtGroup then
    begin
      if strgGroup.Cells[0, 1]= ' ' then Exit;
      if (CommonDlg.Confirm('Are you sure you wish to delete Group (Name: ' + edtGroup.Text + ')?') = mrYes) then
      begin
        if FGroup.LoadByID(IdGroup) then
        begin
          if FGroup.RemoveFromDB then
          begin
            cCommitTrans;
            strgGroup.RemoveRows(strgGroup.Row,1);
            CommonDlg.ShowConfirm(atDelete);
            actRefreshGSGCExecute(self);
            Exit;
          end else
          begin
            cRollbackTrans;
            CommonDlg.ShowError('Fail To Delete');
            Exit;
          end;
        end;
      end;
    end
    else if FDlt = dtSubGroup then
    begin
      if strgSubGroup.Cells[0, 1]= ' ' then Exit;
      if (CommonDlg.Confirm('Are you sure you wish to delete SubGroup (Name: ' + edtSubGroup.Text + ')?') = mrYes) then
      begin
        if FSubGroup.LoadByID(IdSubGroup) then
        begin
          if FSubGroup.RemoveFromDB then
          begin
            cCommitTrans;
            strgSubGroup.RemoveRows(strgGroup.Row,1);
            CommonDlg.ShowConfirm(atDelete);
            actRefreshGSGCExecute(self);
          end else begin
            cRollbackTrans;
            CommonDlg.ShowError('Fail To Delete');
            Exit;
          end;
        end;
      end;
    end
    else if FDlt = dtCategory then
    begin
      if strgCategory.Cells[0, 1]= ' ' then Exit;
      if (CommonDlg.Confirm('Are you sure you wish to delete Category (Name: '+edtCategory.Text+')?') = mrYes) then
      begin
        if FKategori.LoadByID(IdKategori) then
        begin
          if FKategori.RemoveFromDB then
          begin
            cCommitTrans;
            strgCategory.RemoveRows(strgGroup.Row,1);
            CommonDlg.ShowConfirm(atDelete);
            actRefreshGSGCExecute(self);
          end else begin
            cRollbackTrans;
            CommonDlg.ShowError('Fail To Delete');
            Exit;
          end;
        end;
      end;
    end;
  finally
    cRollbackTrans;
  end;
end;

procedure TfrmGroupSubGroupCategory.actRefreshGSGCExecute(Sender: TObject);
begin
  if FDlt=dtGroup then
  begin
    ShowGroup;
    edtGroup.Text:= strgGroup.Cells[1,1];
    TryStrToInt(strgGroup.Cells[4,1], IdGroup);

    ShowSubGroup;
    edtSubGroup.Text:= strgSubGroup.Cells[1, 1];
    TryStrToInt(strgSubGroup.Cells[_kolSubGrpID, 1], IdSubGroup);

    ShowCategory;
    edtCategory.Text:= strgCategory.Cells[1, 1];
    TryStrToInt(strgCategory.Cells[2, 1], IdKategori);
    strgGroup.SelectRows(1,1);
    FDlt:=dtGroup;
  end
  else if FDlt=dtSubGroup then
  begin
    ShowSubGroup;
    edtSubGroup.Text:= strgSubGroup.Cells[1, 1];
    TryStrToInt(strgSubGroup.Cells[_kolSubGrpID, 1], IdSubGroup);

    ShowCategory;
    edtCategory.Text:= strgCategory.Cells[1, 1];
    TryStrToInt(strgCategory.Cells[2, 1], IdKategori);
    strgSubGroup.SelectRows(1,1);
    FDlt:=dtSubGroup;
  end
  else if FDlt=dtCategory then
  begin
    ShowCategory;
    edtCategory.Text:= strgCategory.Cells[1, 1];
    TryStrToInt(strgCategory.Cells[2, 1], IdKategori);
    strgCategory.SelectRows(1,1);
    FDlt:=dtCategory;
  end;
end;

procedure TfrmGroupSubGroupCategory.FormShow(Sender: TObject);
begin
  inherited;
  FDlt:=dtGroup;
  actRefreshGSGCExecute(Self);
end;

procedure TfrmGroupSubGroupCategory.FormActivate(Sender: TObject);
begin
  inherited;
  frmMain.CreateMenu((sender as TForm));
end;

procedure TfrmGroupSubGroupCategory.strgCategoryClickCell(Sender: TObject;
    ARow, ACol: Integer);
var
  isAllow: Boolean;
begin
  inherited;
  strgCategoryRowChanging(nil, ARow, ARow, isAllow);
end;

procedure TfrmGroupSubGroupCategory.strgCategoryRowChanging(Sender: TObject;
    OldRow, NewRow: Integer; var Allow: Boolean);
begin
  inherited;
  edtCategory.Text:= strgCategory.Cells[1, NewRow];
  TryStrToInt(strgCategory.Cells[2, NewRow], IdKategori);
  FDlt:=dtCategory;
end;

procedure TfrmGroupSubGroupCategory.strgGroupClickCell(Sender: TObject; ARow,
    ACol: Integer);
var
  isAllow: Boolean;
begin
  inherited;
  strgGroupRowChanging(nil, ARow, ARow, isAllow);
end;

procedure TfrmGroupSubGroupCategory.strgGroupRowChanging(Sender: TObject;
    OldRow, NewRow: Integer; var Allow: Boolean);
begin
  inherited;
  edtGroup.Text:= strgGroup.Cells[1, NewRow];
  TryStrToInt(strgGroup.Cells[4, NewRow], IdGroup);
  FDlt:=dtGroup;
  ShowSubGroup;
  edtSubGroup.Text:= strgSubGroup.Cells[1, 1];
  TryStrToInt(strgSubGroup.Cells[_kolSubGrpID, 1], IdSubGroup);
  ShowCategory;
  edtCategory.Text:= strgCategory.Cells[1, 1];
  TryStrToInt(strgCategory.Cells[2, 1], IdKategori);
end;

procedure TfrmGroupSubGroupCategory.strgSubGroupClickCell(Sender: TObject;
    ARow, ACol: Integer);
var
  isAllow: Boolean;
begin
  inherited;
  strgSubGroupRowChanging(nil, ARow, ARow, isAllow);
end;

procedure TfrmGroupSubGroupCategory.strgSubGroupRowChanging(Sender: TObject;
    OldRow, NewRow: Integer; var Allow: Boolean);
begin
  inherited;
  edtSubGroup.Text:= strgSubGroup.Cells[1, NewRow];
  TryStrToInt(strgSubGroup.Cells[_kolSubGrpID, NewRow], IdSubGroup);
  FDlt:=dtSubGroup;
  ShowCategory;
  edtCategory.Text:= strgCategory.Cells[1, 1];
  TryStrToInt(strgCategory.Cells[2, 1], IdKategori);
end;

end.
