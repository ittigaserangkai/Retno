unit ufrmSearchRekening;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufraFooterDialog2Button, ExtCtrls, DB,
  StdCtrls, uConn, ufrmMasterDialog,
   cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus,
  cxButtons, cxControls, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid;

type
  TsearchRekMode = (mDebet,mCredit,mDisburstment,mReceipt,mJournalEntry,
                    mDailyBalance,mARPayments,mAPPayment);

  TfrmDialogSearchRekening = class(TfrmMasterDialog)
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    edtRekeningCode: TEdit;
    edtRekeningName: TEdit;
    pnl2: TPanel;
    btnSearch: TcxButton;
    cxGridViewSearchRekening: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGrid: TcxGrid;
    cxColRekeningCode: TcxGridDBColumn;
    cxColRekeningName: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtRekeningCodeChange(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure edtRekeningNameChange(Sender: TObject);
    procedure edtRekeningCodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtRekeningCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtRekeningNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridDblClick(Sender: TObject);
  private
    FIsProcessSuccessfull: boolean;
    FCol: Integer;
    FRow: Integer;
    FKodeJurnalId: string;
    procedure SetIsProcessSuccessfull(const Value: boolean);
    procedure FindDataOnGrid(AText: String);
    function GetDataRekeningByCompanyID(aCompanyID: Integer; aRekType: Smallint): TDataSet;
    function GetDataAllRekeningByKdJurId: TDataSet;
    function GetDataRekeningKasDanBank(ACode: string): TDataSet;
    function LoadData(): TDataSet;
    procedure SetCol(const Value: Integer);
    procedure SetRow(const Value: Integer);
    procedure SetKodeJurnalId(const Value: string);
  public
    { Public declarations }
    RekeningCode: string;
    RekeningName: string;
    searcMode: TsearchRekMode;
  published
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
    property Col: Integer read FCol write SetCol;
    property Row: Integer read FRow write SetRow;
    property KodeJurnalId: string read FKodeJurnalId write SetKodeJurnalId;
   end;

var
  frmDialogSearchRekening: TfrmDialogSearchRekening;

implementation

//uses uSearchRekening,suithemes, uBarangCompetitor;

{$R *.dfm}

procedure TfrmDialogSearchRekening.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogSearchRekening.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogSearchRekening := nil;
end;

procedure TfrmDialogSearchRekening.FormShow(Sender: TObject);
var data : TDataSet;
    i, countData : integer;
    isDebet: SmallInt;
begin
  // what kind of rek will be shown and from what company code?
  if searcMode = mDebet then isDebet := 1
  else isDebet := 0;

  if searcMode in [mDebet,mCredit] then
    data := GetDataRekeningByCompanyID(DialogCompany, isDebet)
  else if searcMode in [mJournalEntry] then
    data := GetDataAllRekeningByKdJurId
  else if searcMode in [mDailyBalance] then
    data := GetDataRekeningKasDanBank('1110')
  else
    data := LoadData;

  countData := data.RecordCount;
  {
  with strgGrid do
  begin
    Clear;
    RowCount := countData + 1;
    ColCount := 2;

    Cells[0,0] := 'REKENING CODE';
    Cells[1,0] := 'REKENING NAME';

    if RowCount > 1 then
    begin
      i := 1;
      while not data.Eof do
      begin
        Cells[0, i] := data.FieldByName('REK_CODE').AsString;
        Cells[1, i] := data.FieldByName('REK_NAME').AsString;
        Inc(i);
        data.Next;
      end;
    end
    else
    begin
      RowCount := 2;
      Cells[0, 1] := ' ';
      Cells[1, 1] := ' ';
    end;
    AutoSize := true;
    FixedRows := 1;
  end;
  }
  edtRekeningCode.SetFocus;
end;

procedure TfrmDialogSearchRekening.edtRekeningCodeChange(Sender: TObject);
begin
  FindDataOnGrid(edtRekeningCode.Text);
end;

procedure TfrmDialogSearchRekening.SetIsProcessSuccessfull(
  const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogSearchRekening.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin
  //initiate
  RekeningCode := '';
  RekeningName := '';
  IsProcessSuccessfull := False;
  {
  if(strgGrid.Cells[0,strgGrid.Row])='' then Exit
  else
  begin
    RekeningCode := strgGrid.Cells[0,strgGrid.Row];
    RekeningName := strgGrid.Cells[1,strgGrid.Row];
    IsProcessSuccessfull := True;
  end;
  }
  Close;
end;

procedure TfrmDialogSearchRekening.FindDataOnGrid(AText: String);
var
  resPoint: TPoint;
begin
  if (AText <> '') then
  begin
    {
    resPoint := strgGrid.Find(Point(0,0),AText,[fnIncludeFixed]);
    if (resPoint.Y <> -1) then
    begin
      strgGrid.ScrollInView(resPoint.X, resPoint.Y);
      strgGrid.SelectRows(resPoint.Y, 1);
    end;
    }
  end;
end;

procedure TfrmDialogSearchRekening.edtRekeningNameChange(Sender: TObject);
begin
  FindDataOnGrid(edtRekeningName.Text);
end;

function TfrmDialogSearchRekening.GetDataRekeningByCompanyID(aCompanyID: Integer; aRekType: SmallInt): TDataSet;
var arrParam : TArr;
begin
//  if not Assigned(SearchRekening) then
//    SearchRekening := TSearchRekening.Create;

  SetLength(arrParam,2);
  arrParam[0].tipe := ptInteger;
  arrParam[0].data := aRekType;
  arrParam[1].tipe := ptInteger;
  arrParam[1].data := aCompanyID;

//  Result := SearchRekening.GetListRekening(arrParam);
end;

procedure TfrmDialogSearchRekening.SetCol(const Value: Integer);
begin
  FCol := Value;
end;

procedure TfrmDialogSearchRekening.SetRow(const Value: Integer);
begin
  FRow := Value;
end;

procedure TfrmDialogSearchRekening.edtRekeningCodeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key=VK_RETURN then footerDialogMasterbtnSaveClick(Self);
end;

procedure TfrmDialogSearchRekening.edtRekeningCodeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  {add by didit: 19112007}
  if (Key = VK_DOWN) then
    cxGrid.SetFocus;
end;

procedure TfrmDialogSearchRekening.strgGridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  {add by didit: 19112007}
  if (Key = VK_UP) then
    if (cxGridViewSearchRekening.DataController.RecNo = 1) then
    begin
      edtRekeningCode.SetFocus;
      edtRekeningCode.SelectAll;
    end;
end;

procedure TfrmDialogSearchRekening.edtRekeningNameKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  {add by didit: 19112007}
  if (Key = VK_DOWN) then
    cxGrid.SetFocus;
end;

procedure TfrmDialogSearchRekening.SetKodeJurnalId(const Value: string);
begin
  FKodeJurnalId := Value;
end;

function TfrmDialogSearchRekening.LoadData: TDataSet;
var arrParam: TArr;
begin
  Result := TDataSet.Create(Self);
  if searcMode in [mDisburstment, mReceipt, mJournalEntry, mARPayments, mAPPayment] then
  begin
    SetLength(arrParam, 2);
    arrParam[0].tipe := ptString;
    arrParam[0].data := KodeJurnalId;
    arrParam[1].tipe := ptInteger;
    arrParam[1].data := DialogCompany;

//    Result := SearchRekening.GetListRekeningByKodeJurnalId(arrParam);
  end;
end;

function TfrmDialogSearchRekening.GetDataAllRekeningByKdJurId: TDataSet;
var arrParam: TArr;
begin
  SetLength(arrParam, 2);
  arrParam[0].tipe := ptString;
  arrParam[0].data := KodeJurnalId;
  arrParam[1].tipe := ptInteger;
  arrParam[1].data := DialogCompany;

//  if not Assigned(SearchRekening) then
//    SearchRekening := TSearchRekening.Create;
//
//  Result := SearchRekening.GetListAllRekeningByKodeJurnalId(arrParam);
end;

procedure TfrmDialogSearchRekening.strgGridKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    footerDialogMaster.btnSave.Click;
end;

procedure TfrmDialogSearchRekening.strgGridDblClick(Sender: TObject);
begin
  inherited;
  footerDialogMaster.btnSave.Click;
end;

function TfrmDialogSearchRekening.GetDataRekeningKasDanBank(
  ACode: string): TDataSet;
var arrParam: TArr;
begin
  SetLength(arrParam, 2);
  arrParam[0].tipe := ptString;
  arrParam[0].data := ACode + '%';
  arrParam[1].tipe := ptInteger;
  arrParam[1].data := DialogCompany;

//  Result := SearchRekening.GetListRekeningKasDanBank(arrParam);
end;

end.
