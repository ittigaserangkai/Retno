unit ufrmRekening;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, ufraFooter5Button, DB,
  ActnList, uConn, ComCtrls, System.Actions, ColCombo, cxStyles,
  cxClasses, Vcl.Grids, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxCustomData, cxTL,
  cxTextEdit, cxTLdxBarBuiltInMenu, cxInplaceContainer, AdvCombo;

type
  TfrmRekening = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    pnlTop: TPanel;
    lbl1: TLabel;
    cbpRekGroup: TColumnComboBox;
    pnlAll: TPanel;
    actlstRekening: TActionList;
    actAddRekening: TAction;
    actEditRekening: TAction;
    actDeleteRekening: TAction;
    actRefreshRekening: TAction;
    strgGrid: TStringGrid;
    TlistRekening: TcxTreeList;
    cxTreeList1Column1: TcxTreeListColumn;
    cxTreeList1Column2: TcxTreeListColumn;
    cxTreeList1Column3: TcxTreeListColumn;
    cxTreeList1Column4: TcxTreeListColumn;
    cxTreeList1Column5: TcxTreeListColumn;
    cxTreeList1Column6: TcxTreeListColumn;
    cxTreeList1Column7: TcxTreeListColumn;
    procedure FormDestroy(Sender: TObject);
    procedure actAddRekeningExecute(Sender: TObject);
    procedure actEditRekeningExecute(Sender: TObject);
    procedure actDeleteRekeningExecute(Sender: TObject);
    procedure actRefreshRekeningExecute(Sender: TObject);
    procedure cbpRekGroupKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure cbpRekGroupChange(Sender: TObject);
  private
    FGrupRekeningId: string;
    function GetListGrupRekeningByCompanyId(AId: Integer): TDataSet;
//    function GetListRekeningByCompanyId(AId: Integer): TDataSet;
//    function GetListRekeningByGrupRekeningId(AId: string): TDataSet;
    procedure ParseComboGrupRekening;
    procedure ParseDataRekening(aParentCode : String; aNode : TTreeNode);
    procedure SetGrupRekeningId(const Value: string);
  public
    function IsRekeningExist(aKode : String): Boolean;
    property GrupRekeningId: string read FGrupRekeningId write SetGrupRekeningId;
  end;

var
  frmRekening: TfrmRekening;

implementation

uses ufrmDialogRekening,  uTSCommonDlg, uConstanta, uRetnoUnit;

{$R *.dfm}

procedure TfrmRekening.FormDestroy(Sender: TObject);
begin
  inherited;
  frmRekening := nil;
  frmRekening.Free;
end;

procedure TfrmRekening.actAddRekeningExecute(Sender: TObject);
begin
  inherited;
  if not Assigned(frmDialogRekening) then
    frmDialogRekening := TfrmDialogRekening.Create(Application);

  frmDialogRekening.Caption := 'Add Rekening';
  frmDialogRekening.StatusForm := frNew;
  SetFormPropertyAndShowDialog(frmDialogRekening);

  if (frmDialogRekening.IsProcessSuccesfull) then
  begin
    CommonDlg.ShowMessage(CONF_ADD_SUCCESSFULLY);
    actRefreshRekeningExecute(Self);
  end;

  frmDialogRekening.Free;
end;

procedure TfrmRekening.actEditRekeningExecute(Sender: TObject);
var
  TTNode: TTreeNode;
begin
  inherited;
  if not Assigned(frmDialogRekening) then
    frmDialogRekening := TfrmDialogRekening.Create(Application);

  frmDialogRekening.Caption := 'Edit Rekening';
  frmDialogRekening.StatusForm := frEdit;
//  TTNode := TlistRekening.Selected;

//  frmDialogRekening.RekCode := TlistRekening.GetNodeColumn(TTNode, 0);
  SetFormPropertyAndShowDialog(frmDialogRekening);

  if (frmDialogRekening.IsProcessSuccesfull) then
  begin
    CommonDlg.ShowMessage(CONF_EDIT_SUCCESSFULLY);
    actRefreshRekeningExecute(Self);
  end;

  frmDialogRekening.Free;
end;

procedure TfrmRekening.actDeleteRekeningExecute(Sender: TObject);
//var arrParam: TArr;
begin
  inherited;
//  if Mastercompany.ID = 0 then
//  begin
//    CommonDlg.ShowError(ER_COMPANY_NOT_SPECIFIC);
//    //frmMain.cbbCompCode.SetFocus;
//    Exit;
//  end;
//
//  if strgGrid.Cells[0, strgGrid.Row] = '' then
//  begin
//    CommonDlg.ShowError('Rekening Code Is Not Spesific');
//    strgGrid.SetFocus;
//    Exit;
//  end;
//
//  if (CommonDlg.Confirm('Are you sure you wish to delete Rekening Code ' + strgGrid.Cells[0, strgGrid.Row] + ' ?') = mrYes) then
//  begin
//    if not Assigned(Rekening) then
//      Rekening := TRekening.Create;
//
//    SetLength(arrParam, 2);
//    arrParam[0].tipe := ptString;
//    arrParam[0].data := strgGrid.Cells[0, strgGrid.Row];
//    arrParam[1].tipe := ptInteger;
//    arrParam[1].data := Mastercompany.ID;
//
//    if (Rekening.DeleteDataRekening(arrParam)) then
//    begin
//      CommonDlg.ShowMessage(CONF_DELETE_SUCCESSFULLY);
//      actRefreshRekeningExecute(Self);
//    end
//    else
//      CommonDlg.ShowError(ER_DELETE_FAILED);  
//  end;  
end;

procedure TfrmRekening.actRefreshRekeningExecute(Sender: TObject);
begin
  inherited;
  try
    Self.Enabled := False;

    if Mastercompany.ID = 0 then
    begin
      CommonDlg.ShowError(ER_COMPANY_NOT_SPECIFIC);
      //frmMain.cbbCompCode.SetFocus;
      Exit;
    end;

    TlistRekening.Clear;
    ParseDataRekening('', nil);

  finally
    Self.Enabled := True;
  end;

end;

function TfrmRekening.GetListGrupRekeningByCompanyId(
  AId: Integer): TDataSet;
var arrParam: TArr;
begin
  if AId = 0 then
    SetLength(arrParam, 0)
  else
  begin
    SetLength(arrParam, 1);
    arrParam[0].tipe := ptInteger;
    arrParam[0].data := AId;
  end;

//  if not Assigned(Rekening) then
//    Rekening := TRekening.Create;
//
//  Result := Rekening.GetListGrupRekeningByCompanyId(arrParam);
end;

//function TfrmRekening.GetListRekeningByCompanyId(
//  AId: Integer): TDataSet;
//var arrParam: TArr;
//begin
//  if AId = 0 then
//    SetLength(arrParam, 0)
//  else
//  begin
//    SetLength(arrParam, 1);
//    arrParam[0].tipe := ptInteger;
//    arrParam[0].data := AId;
//  end;
//
//  if not Assigned(Rekening) then
//    Rekening := TRekening.Create;
//
//  Result := Rekening.GetListRekeningByCompanyId(arrParam);
//end;

//function TfrmRekening.GetListRekeningByGrupRekeningId(
//  AId: string): TDataSet;
//var arrParam: TArr;
//begin
//  if AId = '' then
//    SetLength(arrParam, 0)
//  else
//  begin
//    SetLength(arrParam, 2);
//    arrParam[0].tipe := ptString;
//    arrParam[0].data := AId;
//    arrParam[1].tipe := ptInteger;
//    arrParam[1].data := Mastercompany.ID;
//  end;
//
//  if not Assigned(Rekening) then
//    Rekening := TRekening.Create;
//
//  Result := Rekening.GetListRekeningByGrupRekeningId(arrParam);
//end;

procedure TfrmRekening.ParseComboGrupRekening;
var dataGrupRekening: TDataSet;
begin
  dataGrupRekening := GetListGrupRekeningByCompanyId(Mastercompany.ID);

  with cbpRekGroup do
  begin
    if not dataGrupRekening.IsEmpty then
    begin
//      RowCount := dataGrupRekening.RecordCount + 1;
//      AddRow(['Id', 'NAME', 'DESCRIPTION']);
//
//      while not dataGrupRekening.Eof do
//      begin
//        AddRow([dataGrupRekening.FieldByName('GROREK_ID').AsString,
//          dataGrupRekening.FieldByName('GROREK_NAME').AsString,
//          dataGrupRekening.FieldByName('GROREK_DESCRIPTION').AsString]);
//
//        dataGrupRekening.Next;
//      end;
    end
    else
    begin
//      RowCount := 2;
//      AddRow(['Id', 'NAME', 'DESCRIPTION']);
//      AddRow([' ', ' ', ' ']);
    end;

//    FixedRows := 1;
//    SizeGridToData;
    Text := '';
  end;
end;

procedure TfrmRekening.ParseDataRekening(aParentCode : String; aNode :
    TTreeNode);
var // dataRekening: TDataSet;
  TTNode: TTreeNode;
  sParentCode: string;
//  i: Integer;
  sKriteria: string;
  s: string;
  sLeaf: string;
  sJnsRek: string;
//  j: Integer;
begin
  {if cbpRekGroup.Text = '' then
    dataRekening := GetListRekeningByCompanyId(Mastercompany.ID)
  else
    dataRekening := GetListRekeningByGrupRekeningId(GrupRekeningId);}

  sKriteria := '';
  if aParentCode = '' Then
    sKriteria := ' And (REK_PARENT_CODE IS NULL Or REK_PARENT_CODE = ' + QuotedStr('') + ')'
  else
    sKriteria := ' And REK_PARENT_CODE = ' + QuotedStr(aParentCode);

  if (cbpRekGroup.Text <> '') And (GrupRekeningId <> '') then
    sKriteria := sKriteria + ' AND REK_GROREK_ID = ' + GrupRekeningId;

  s := 'SELECT REK_CODE, REK_NAME, REK_LEVEL,'
     + ' REK_DESCRIPTION, REK_PARENT_CODE, REK_IS_DEBET,'
     + ' REK_IS_LEAF FROM REKENING'
     + ' WHERE REK_COMP_ID = ' + IntToStr(Mastercompany.ID)
     + sKriteria
     + ' ORDER BY REK_CODE ';

{  with cOpenQuery(s) do
  begin
    try
      if not eof then
      begin

        while not Eof do
        begin
          if FieldByName('REK_IS_DEBET').AsInteger = 0 then
            sJnsRek := 'CREDIT'
          else
            sJnsRek := 'DEBET';

          if FieldByName('REK_IS_LEAF').AsInteger = 0 then
            sLeaf := 'HEADER'
          else
            sLeaf := 'DETAIL';

          if aNode = nil then
            TTNode := TlistRekening.Items.Add(nil, FieldByName('REK_CODE').AsString)
          else
            TTNode := TlistRekening.Items.AddChild(aNode, FieldByName('REK_CODE').AsString);

          TlistRekening.SetNodeColumn(TTNode, 1, FieldByName('REK_NAME').AsString);
          TlistRekening.SetNodeColumn(TTNode, 2, FieldByName('REK_LEVEL').AsString);
          TlistRekening.SetNodeColumn(TTNode, 3, FieldByName('REK_DESCRIPTION').AsString);
          TlistRekening.SetNodeColumn(TTNode, 4, FieldByName('REK_PARENT_CODE').AsString);
          TlistRekening.SetNodeColumn(TTNode, 5, sJnsRek);
          TlistRekening.SetNodeColumn(TTNode, 6, sLeaf);

          sParentCode := FieldByName('REK_CODE').AsString;
          if sParentCode = FieldByName('REK_PARENT_CODE').AsString then
          begin
//            TTNode := nil;
            TTNode.Free;
          end
          else
          begin
            if IsRekeningExist(sParentCode) then
              ParseDataRekening(sParentCode, TTNode);
          end;

          Next;
          
        end;
      end;
    finally
      Free;
    end;
  end;
  }
end;

procedure TfrmRekening.SetGrupRekeningId(const Value: string);
begin
  FGrupRekeningId := Value;
end;

procedure TfrmRekening.cbpRekGroupKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
  begin
    ParseDataRekening('', nil);
  end;  
end;

procedure TfrmRekening.FormShow(Sender: TObject);
begin
  inherited;
  ParseComboGrupRekening;
  //isi kolom string grid
  {ACCOUNT CODE
ACCOUNT NAME
ACCOUNT LEVEL
ACCOUNT DESCRIPTION
PARENT CODE
NORMAL BALANCE
H / D
}

  //actRefreshRekeningExecute(Self);
end;

function TfrmRekening.IsRekeningExist(aKode : String): Boolean;
var
  s: string;
begin
  // TODO -cMM: TfrmRekening.IsRekeningExist default body inserted
  Result := False;

  s := 'SELECT REK_CODE, REK_NAME, REK_LEVEL,'
     + ' REK_DESCRIPTION, REK_PARENT_CODE, REK_IS_DEBET,'
     + ' REK_IS_LEAF FROM REKENING'
     + ' WHERE REK_COMP_ID = ' + IntToStr(Mastercompany.ID)
     + ' And REK_PARENT_CODE = ' + QuotedStr(aKode)
     + ' ORDER BY REK_CODE ';
//  with cOpenQuery(s) do
//  begin
//    try
//      if not eof then Result := True;
//    finally
//      Free;
//    end;
//
//  end;


end;

procedure TfrmRekening.cbpRekGroupChange(Sender: TObject);
begin
  inherited;
//  if cbpRekGroup.Text <> '' then
//    GrupRekeningId := cbpRekGroup.Cells[0, cbpRekGroup.Row]
//  else
    GrupRekeningId := '';
end;

end.
