unit ufrmSearchCompanyMember;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialogBrowse, ExtCtrls, ufraFooterDialog3Button,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid;

type
  TFormPengguna = (fmReturDamage, fmReturReplace, fmServiceLevel, null);
  TSearchFor = (sfCompany, sfMember, sfNone);
  TfrmDialogSearchCompanyMember = class(TfrmMasterDialogBrowse)
    pnl1: TPanel;
    lbl2: TLabel;
    edt2: TEdit;
    btnSearch: TcxButton;
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure edt2Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure strgGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridDblClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure strgGridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSearchClick(Sender: TObject);
  private
    FSearchFor: TSearchFor;
    FIsProcessSuccessfull: boolean;
    FMainCardNo: string;
    FCompanyMemberName: string;
    procedure FetchCompanyMember;
    procedure FetchMember(MemberName: String);
    procedure SetIsProcessSuccessfull(const Value: boolean);
    procedure FindDataOnGrid(AText: String);
    procedure SetMainCardNo(const Value: string);
    procedure SetCompanyMemberName(const Value: string);
    function GetDataCompanyMember(): TDataSet;
    procedure SetSearchFor(const Value: TSearchFor);
    { Private declarations }
  public
    { Public declarations }
    untID: Integer;
  published
    property SearchFor: TSearchFor read FSearchFor write SetSearchFor;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
    property MainCardNo: string read FMainCardNo write SetMainCardNo;
    property CompanyMemberName: string read FCompanyMemberName write SetCompanyMemberName;
  end;

var
  frmDialogSearchCompanyMember: TfrmDialogSearchCompanyMember;

implementation

uses Math;

{$R *.dfm}

procedure TfrmDialogSearchCompanyMember.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin
  FIsProcessSuccessfull := true;
  if SearchFor = sfCompany then
    CompanyMemberName := cxGridView.DataController.Values[0,cxGridView.DataController.RecNo]
  else if SearchFor = sfMember then
    MainCardNo:= cxGridView.DataController.Values[0, cxGridView.DataController.RecNo];
  Close;
end;

procedure TfrmDialogSearchCompanyMember.SetIsProcessSuccessfull(
  const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogSearchCompanyMember.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogSearchCompanyMember.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogSearchCompanyMember := nil;
end;

procedure TfrmDialogSearchCompanyMember.FindDataOnGrid(AText: String);
var
  resPoint: TPoint;
begin
  if (AText <> '') then
  begin
//    resPoint := strgGrid.Find(Point(0,0),AText,[fnIncludeFixed]);
    if (resPoint.Y <> -1) then
    begin
//      strgGrid.ScrollInView(resPoint.X, resPoint.Y);
//      strgGrid.SelectRows(resPoint.Y, 1);
    end;
  end;
end;

procedure TfrmDialogSearchCompanyMember.edt2Change(Sender: TObject);
begin
  FindDataOnGrid(edt2.Text);
end;

procedure TfrmDialogSearchCompanyMember.SetMainCardNo(const Value: string);
begin
  FMainCardNo := Value;
end;

procedure TfrmDialogSearchCompanyMember.SetCompanyMemberName(const Value: string);
begin
  FCompanyMemberName := Value;
end;

procedure TfrmDialogSearchCompanyMember.FormShow(Sender: TObject);
begin
  inherited;
  if SearchFor = sfCompany then
    FetchCompanyMember
  else if SearchFor = sfMember then
    FetchMember('');
  edt2.SetFocus;
end;

function TfrmDialogSearchCompanyMember.GetDataCompanyMember: TDataSet;
//var arrParam: TArr;
begin
//  if not Assigned(MemberShip) then
//    MemberShip := TMemberShip.Create;
//
//  SetLength(arrParam,1);
//  arrParam[0].tipe := ptInteger;
//  arrParam[0].data := untID;
//
//  Result := MemberShip.GetListCompanyMemberShip(arrParam);
end;

procedure TfrmDialogSearchCompanyMember.strgGridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  {add by didit: 19112007}
  if (Key = VK_UP) then
    if (cxGridView.DataController.RecNo = 1) then
    begin
      edt2.SetFocus;
      edt2.SelectAll;
    end;
end;

procedure TfrmDialogSearchCompanyMember.edt2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin      
  {add by didit: 19112007}
  if (Key=VK_Down) then
    cxGrid.SetFocus;

  if (Key=VK_RETURN) then
  begin
    btnSearchClick(Sender);
    cxGrid.SetFocus;
  end;

end;

procedure TfrmDialogSearchCompanyMember.strgGridDblClickCell(
  Sender: TObject; ARow, ACol: Integer);
begin
  inherited;
  footerDialogMasterbtnSaveClick(Sender);
end;

procedure TfrmDialogSearchCompanyMember.strgGridKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) and (ssctrl in Shift) then
    footerDialogMasterbtnSaveClick(Sender);
end;

procedure TfrmDialogSearchCompanyMember.SetSearchFor(
  const Value: TSearchFor);
begin
  FSearchFor := Value;
end;

procedure TfrmDialogSearchCompanyMember.FetchMember(MemberName: String);
var dataCompanyMember: TDataSet;
    i: Integer;
//    arrParam: TArr;
begin
  inherited;
  {SetLength(arrParam, 1);
  arrParam[0].tipe:= ptString;
  if MemberName =  '' then
    arrParam[0].data:= 'A%'
  else
    arrParam[0].data:= '%'+MemberName+'%';
  dataCompanyMember:= MemberShip.GetListMemberByName(arrParam);

  with strgGrid do
  begin
    Clear;
    ColCount:= 3;
    Cells[0, 0] := 'MEMBER NO';
    Cells[1, 0] := 'MEMBER NAME';
    Cells[2, 0] := 'MEMBER ADDRESS';

    if RowCount > 1 then
    begin
      i:= 1;
      RowCount:= dataCompanyMember.RecordCount + i;
      dataCompanyMember.First;
      while not dataCompanyMember.Eof do
      begin
        Cells[0, i]:= dataCompanyMember.FieldByName('MEMBER_CARD_NO').AsString;
        Cells[1, i]:= dataCompanyMember.FieldByName('MEMBER_NAME').AsString;
        Cells[2, i]:= dataCompanyMember.FieldByName('MEMBER_ADDRESS').AsString;
        Cells[3, i]:= dataCompanyMember.FieldByName('MEMBER_ID').AsString;
        dataCompanyMember.Next;
        Inc(i);
      end;
    end else
      RowCount:= 2;
    AutoSize:= True;
  end;
  strgGrid.FixedRows := 1;
  }
end;

procedure TfrmDialogSearchCompanyMember.FetchCompanyMember;
var dataCompanyMember: TDataSet;
    i, countData: Integer;
begin
  dataCompanyMember := GetDataCompanyMember;
  countData := dataCompanyMember.RecordCount;
  {
  with strgGrid do
  begin
    Clear;
    RowCount := countData + 1;
    ColCount := 1;
    Cells[0, 0] := 'COMPANY MEMBER NAME';

    if RowCount > 1 then
    begin
      i := 1;
      while not (dataCompanyMember.Eof) do
      begin
        Cells[0, i] := dataCompanyMember.FieldByName('GROMEMBER_NAME').AsString;
        Inc(i);
        dataCompanyMember.Next;
      end;
    end
    else
    begin
      RowCount := 2;
      Cells[0, 1] := '';
    end;
    AutoSize := True;
  end;
  strgGrid.FixedRows := 1;   }
end;

procedure TfrmDialogSearchCompanyMember.btnSearchClick(Sender: TObject);
begin
  inherited;
  if SearchFor = sfCompany then
    FetchCompanyMember
  else if SearchFor = sfMember then
    FetchMember(edt2.Text);
end;

end.
