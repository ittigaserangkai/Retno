unit ufrmDialogFamilyMember;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialogBrowse, ufraFooterDialog2Button, ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, Vcl.StdCtrls, cxLabel, ufraFooterDialog3Button,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid;
type
  TFormMode = (fmAdd, fmEdit);

  TfrmDialogFamilyMember = class(TfrmMasterDialogBrowse)
    pnl2: TPanel;
    lbl18: TcxLabel;
    lbl19: TcxLabel;
    pnl3: TPanel;
    lbl4: TLabel;
    lbl5: TLabel;
    edtMemberName: TEdit;
    edtCardNo: TEdit;
    cxGridViewColumn1: TcxGridDBColumn;
    cxGridViewColumn2: TcxGridDBColumn;
    cxGridViewColumn3: TcxGridDBColumn;
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure strgGridCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure lbl18Click(Sender: TObject);
    procedure strgGridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lbl19Click(Sender: TObject);
  private
    { Private declarations }

    function SaveMember(): Boolean;
  public
    { Public declarations }
    FormMode: TFormMode;
    MemberID: Integer;
    IsProcessSuccessfull: Boolean;
  end;

var
  frmDialogFamilyMember: TfrmDialogFamilyMember;

implementation

uses uTSCommonDlg, uConstanta, ufrmSearchStatusKlrg;

{$R *.dfm}

procedure TfrmDialogFamilyMember.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogFamilyMember := nil;
  frmDialogFamilyMember.Free;
end;

function TfrmDialogFamilyMember.SaveMember(): Boolean;
var intI: Integer;
//    arrParam: TArr;
    tempStaKlrg: string;
begin
  //init
  Result := False;
  {
  if strgGrid.Cells[0,1] = '' then
  begin
    CommonDlg.ShowErrorEmpty('STATUS DALAM KELUARGA');
    strgGrid.SetFocus;
    Exit;
  end;  

  if not Assigned(MemberShip) then MemberShip := TMemberShip.Create;

  MemberShip.DeleteDataKeluargaMemberShip(MemberID);

  if strgGrid.RowCount = 1 then
  begin
    Result := True;
  end
  else
  for intI := 1 to strgGrid.RowCount-1 do //dimulia dari row k2 [setelah header]
  begin
    SetLength(arrParam,5);
    arrParam[0].tipe := ptString;
    arrParam[0].data := MemberID;
    //get id statusklrga
    tempStaKlrg := strgGrid.Cells[0,intI];
    SetLength(tempStaKlrg,1);
    arrParam[1].tipe := ptString;
    arrParam[1].data := tempStaKlrg;
    arrParam[2].tipe := ptString;
    arrParam[2].data := strgGrid.Cells[1,intI];
    arrParam[3].tipe := ptDateTime;
    arrParam[3].data := StrToDate(strgGrid.Cells[2,intI]);
    arrParam[4].tipe := ptString;
    arrParam[4].data := FLoginId;

    Result := MemberShip.InputDataKeluargaMembership(arrParam);
  end; // for detil }
end;

procedure TfrmDialogFamilyMember.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin
  IsProcessSuccessfull := SaveMember;
  if IsProcessSuccessfull then Close;
end;

procedure TfrmDialogFamilyMember.FormKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = Ord('T')) and (ssctrl in Shift) then
    lbl18Click(Self)
  else if (Key = Ord('R')) and (ssctrl in Shift) then
    lbl19Click(self);
end;

procedure TfrmDialogFamilyMember.strgGridCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  inherited;
  if (ACol = 1) or (ACol = 2) then CanEdit := True
  else CanEdit := False;
end;

procedure TfrmDialogFamilyMember.lbl18Click(Sender: TObject);
begin
  inherited;
  {if (strgGrid.Cells[0,strgGrid.RowCount-1] = '')
    or (strgGrid.Cells[1,strgGrid.RowCount-1] = '') then
    begin
      CommonDlg.ShowErrorEmpty('STATUS/NAME');
      strgGrid.SetFocus;
      Exit;
    end
    else strgGrid.AddRow; }
end;

procedure TfrmDialogFamilyMember.strgGridKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F5 then
  begin
    if not Assigned(frmDialogSearchStatusKlrg) then
      frmDialogSearchStatusKlrg := TfrmDialogSearchStatusKlrg.Create(Self);

      frmDialogSearchStatusKlrg.DialogUnit := DialogUnit;
      frmDialogSearchStatusKlrg.ShowModal;

      if frmDialogSearchStatusKlrg.IsProcessSuccessfull then
      begin
//        strgGrid.Cells[0,strgGrid.Row] := IntToStr(frmDialogSearchStatusKlrg.StatusKlrgID) +
//        '=' + frmDialogSearchStatusKlrg.StatusKlrgName;
      end;
      frmDialogSearchStatusKlrg.Free;
  end;  
end;

procedure TfrmDialogFamilyMember.lbl19Click(Sender: TObject);
begin
  inherited;
//  strgGrid.RemoveSelectedRows;
end;

end.


