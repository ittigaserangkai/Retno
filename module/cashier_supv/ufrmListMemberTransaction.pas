unit ufrmListMemberTransaction;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  cxButtonEdit, System.Actions, Vcl.ActnList, ufraFooter4Button, cxButtons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC;

type
  TfrmListMemberTransaction = class(TfrmMasterBrowse)
    pnlTop: TPanel;
    edtMember: TcxButtonEdit;
    Label1: TLabel;
    edtMemberNm: TEdit;
    chkAllMember: TCheckBox;
    lbl1: TLabel;
    edtgroupmem: TcxButtonEdit;
    edtgroupmemnm: TEdit;
    chkAllGrup: TCheckBox;
    procedure actPrintExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure edtMemberClickBtn(Sender: TObject);
    procedure edtMemberChange(Sender: TObject);
    procedure cbbTraderTypeChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtgroupmemClickBtn(Sender: TObject);
  private
    procedure ClearAttributMember;
    function GetSQLListTransTrader: string;
    function GetSQLListTransPos: string;
    procedure ParseHeaderGrid;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListMemberTransaction: TfrmListMemberTransaction;

implementation
uses uRetnoUnit, udmReport, uAppUtils;

{$R *.dfm}
const
  _kolNo      : Integer = 0;
  _kolDate    : Integer = 1;
  _kolCustID  : Integer = 2;
  _kolCustNm  : Integer = 3;
  _kolCost    : Integer = 4;
  _kolMemID   : Integer = 5;
  _RowCOunt   : Integer = 2;
  _colCount   : Integer = 5;
  _FixedRow   : Integer = 1;        



procedure TfrmListMemberTransaction.actPrintExecute(Sender: TObject);
var
  LapID: Integer;
  ssQL: string;
  sS: TStrings;
  i: Integer;
begin
  inherited;
  {
  sS := TStringList.Create;
  try
    LapID := GetTickCount;
    for i := strgGrid.FixedRows to strgGrid.RowCount - 1 do
    begin
      ssQL  := 'Insert into TEMP_LAPORAN (LAPORAN_ID, USER_ID, CHAR1, CHAR2,'
            + ' CHAR3, CHAR4, NUM1) values ('
            + IntToStr(LapID)
            + ', ' + IntToStr(FLoginId)
            + ', '+ Quot(strgGrid.Cells[_kolNo, i])
            + ', '+ Quot(strgGrid.Cells[_kolDate, i])
            + ', '+ Quot(strgGrid.Cells[_kolCustID, i])
            + ', '+ Quot(strgGrid.Cells[_kolCustNm, i])
            + ', '+ strgGrid.Cells[_kolCost, i]
            + ');';

      sS.Append(ssQL);

    end;

    kExecuteSQLsNoBlob(sS);
    ssQL  := 'select '+ GetCompanyHeader(FLoginFullname,
              MasterNewUnit.Nama, dtTglFrom.Date , dtTglTo.Date)
          + ' LAPORAN_ID, USER_ID, CHAR1, CHAR2,'
          + ' CHAR3, CHAR4, NUM1 from TEMP_LAPORAN'
          + ' where LAPORAN_ID = '+ IntToStr(LapID)
          + ' and USER_ID = '+ IntToStr(FLoginId)
          + ' order by CHAR1';

    dmReportNew.EksekusiReport('frListMemberTransaction', ssQL,'',True);

  finally
    sS.Free;
    cRollbackTrans;
  end;
  }
end;

procedure TfrmListMemberTransaction.actRefreshExecute(Sender: TObject);
var
  j: Integer;
  isAda: Boolean;
  i: Integer;
begin
  //transaksi agross
  ParseHeaderGrid;
  {
  with cOpenQuery(GetSQLListTransPos) do
  begin
    try
      i := strgGrid.FixedRows;
      while not Eof do
      begin
        if i > strgGrid.FixedRows then
          strgGrid.AddRow;

        strgGrid.Cells[_kolNo, i]     := IntToStr(i);
        strgGrid.Cells[_kolDate, i]   := FormatDateTime('DD-MM-YYYY', FieldByName('TRANS_DATE').AsDateTime);
        strgGrid.Cells[_kolCustID, i] := FieldByName('MEMBER_CARD_NO').AsString;
        strgGrid.Cells[_kolCustNm, i] := FieldByName('MEMBER_NAME').AsString;
        strgGrid.Cells[_kolCost, i]   := FormatFloat('##0.00', FieldByName('TRANS_TOTAL_BAYAR').AsFloat);
        strgGrid.Cells[_kolMemID, i]  := FieldByName('MEMBER_ID').AsString;
        Inc(i);
        Next;
      end;
    finally
       strgGrid.AutoSize := True;
      Free;

    end;
  end;

  with cOpenQuery(GetSQLListTransTrader) do
  begin
    try
      while not Eof do
      begin
        isAda := False;
        for i := strgGrid.FixedRows to strgGrid.RowCount - 1 do
        begin
          if (strgGrid.Cells[_kolDate, i ]=
             FormatDateTime('DD-MM-YYYY', FieldByName('POAS_DATE').AsDateTime)) and
             (strgGrid.ints[_kolMemID, i] = FieldByName('MEMBER_ID').AsInteger) then
          begin
             strgGrid.Floats[_kolCost, i] := strgGrid.Floats[_kolCost, i]
                                          + FieldByName('POAS_TOTAL').AsFloat;

             isAda := True;
             Break;
          end;
        end;

        if not isAda then
        begin
          strgGrid.AddRow;
          strgGrid.Cells[_kolNo, i]     := IntToStr(strgGrid.Ints[_kolNo, strgGrid.RowCount - 2] + 1 );
          strgGrid.Cells[_kolDate, i]   := FormatDateTime('DD-MM-YYYY', FieldByName('POAS_DATE').AsDateTime);
          strgGrid.Cells[_kolCustID, i] := FieldByName('MEMBER_CARD_NO').AsString;
          strgGrid.Cells[_kolCustNm, i] := FieldByName('MEMBER_NAME').AsString;
          strgGrid.Cells[_kolCost, i]   := FormatFloat('##0.00', FieldByName('POAS_TOTAL').AsFloat);
          strgGrid.Cells[_kolMemID, i]  := FieldByName('MEMBER_ID').AsString;


        end;


        Next;
      end;
    finally
      strgGrid.AutoSize := True;
      free;
      strgGrid.SortByColumn(_kolDate);
      j := 1;
      for i:= strgGrid.FixedRows to strgGrid.RowCount - 1 do
      begin

        strgGrid.Cells[_kolNo, i] := IntToStr(j);
        Inc(j);

      end;
    end;
  end;
  }
end;

procedure TfrmListMemberTransaction.ParseHeaderGrid;
begin
  {
  with strgGrid do
  begin
    Clear;
    RowCount  := _RowCOunt;
    ColCount  := _colCount;
    FixedRows := _FixedRow;
    Cells[_kolNo, 0]    :=  'No';
    Cells[_kolDate, 0]  :=  'Date';
    Cells[_kolCustID, 0]:=  'Member ID';
    Cells[_kolCustNm, 0]:=  'Member Name';
    Cells[_kolCost, 0]  :=  'Cost';

    AutoSize  := True;

  end;
  }
end;

procedure TfrmListMemberTransaction.edtMemberClickBtn(Sender: TObject);
var
  sSQL: string;
  sfilter:string;

begin

  inherited;
  if chkAllGrup.Checked = True then
      sfilter:=''
  else
      sfilter:=' and GROMEMBER_ID = '+edtgroupmem.Text;

  sSQL  := 'select MEMBER_ID as ID, MEMBER_CARD_NO as "Card No",'
        + ' MEMBER_NAME as "Member Name"'
        + ' from MEMBER,ref$grup_member'
        + ' where MEMBER_GROMEMBER_ID=GROMEMBER_ID'
        + sfilter
        + ' and MEMBER_UNT_ID = '+ IntToStr(MasterNewUnit);
 {
  with cLookUp('Data Anggota', sSQL) do
  begin
    try
      if Strings[0] <> '' then
      begin
        edtMember.Text    := Strings[1];
        edtMemberNm.Text  := Strings[2];
      end;

    finally
      Free;
    end;
  end;  

  }

end;

procedure TfrmListMemberTransaction.edtMemberChange(Sender: TObject);
begin
  inherited;
  ParseHeaderGrid;
end;

procedure TfrmListMemberTransaction.ClearAttributMember;
begin
  edtMember.Clear;
  edtMemberNm.Clear;
end;

procedure TfrmListMemberTransaction.cbbTraderTypeChange(Sender: TObject);
begin
  inherited;
  ClearAttributMember;
  ParseHeaderGrid;

end;

procedure TfrmListMemberTransaction.FormShow(Sender: TObject);
begin
  inherited;
//  dtAwalFilter.Date  := cGetServerTime;
//  dtAkhirFilter.Date    := cGetServerTime;
  ClearAttributMember;
end;

procedure TfrmListMemberTransaction.btnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmListMemberTransaction.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action  := caFree;
end;

procedure TfrmListMemberTransaction.FormDestroy(Sender: TObject);
begin
  inherited;
  frmListMemberTransaction  := nil;
end;

function TfrmListMemberTransaction.GetSQLListTransTrader: string;
var
  sSQL: string;
begin
  sSQL  := 'select'
       + ' EXTRACTDATE(a.POAS_DATE) as POAS_DATE, c.MEMBER_CARD_NO,  c.MEMBER_NAME,'
       + ' a.POAS_STATUS, a.POAS_TOTAL, c.MEMBER_ID'
       + ' from PO_ASSGROS a'
       + ' inner join TRADER b on a.POAS_TRD_ID = b.TRD_ID'
       + ' and a.POAS_TRD_UNT_ID =b.TRD_UNT_ID'
       + ' inner join MEMBER c on b.TRD_MEMBER_ID = c.MEMBER_ID'
       + ' and b.TRD_MEMBER_UNT_ID = c.MEMBER_UNT_ID'
       + ' inner join ref$grup_member d on d.gromember_id=c.member_gromember_id'
       + ' and d.gromember_unt_id=c.member_unt_id'
       + ' WHERE a.POAS_UNT_ID = '+ IntToStr(MasterNewUnit);

  if not chkAllGrup.Checked then
    sSQL  := sSQL + ' and d.GROMEMBER_ID = '+edtgroupmem.Text;


  if not chkAllMember.Checked then
    sSQL  := sSQL + ' and c.MEMBER_CARD_NO = '+ QuotedStr(edtMember.Text);

  sSQL  := sSQL
       + ' and EXTRACTDATE(a.POAS_DATE) between ' + TAppUtils.QuotD(dtAwalFilter.Date)
       + ' and ' + TAppUtils.QuotD(dtAkhirFilter.Date, True)
       + ' order by POAS_DATE, c.MEMBER_ID';

  Result  := sSQL;
end;

procedure TfrmListMemberTransaction.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//  inherited;
  if (Key = VK_ESCAPE) then
    Close
  else if (Key = Ord('P')) and (ssctrl in Shift) then
    actPrintExecute(self);
end;

function TfrmListMemberTransaction.GetSQLListTransPos: string;
var
  sSQL: string;
begin
  sSQL  := 'select'
        + ' EXTRACTDATE(a.TRANS_DATE) as TRANS_DATE, c.MEMBER_CARD_NO,  c.MEMBER_NAME,'
        + ' a.TRANS_TOTAL_BAYAR, c.MEMBER_ID'
        + ' from TRANSAKSI a'
        + ' inner join MEMBER c on  c.MEMBER_ID = a.TRANS_MEMBER_ID'
        + ' and c.MEMBER_UNT_ID = a.TRANS_MEMBER_UNT_ID'
        + ' inner join ref$grup_member d on d.gromember_id=c.member_gromember_id'
       + '  and d.gromember_unt_id=c.member_unt_id'
        + ' WHERE  a.TRANS_IS_PENDING = 0'
        + ' and c.MEMBER_UNT_ID = '+ IntToStr(MasterNewUnit);

  if not chkAllGrup.Checked then
    sSQL  := sSQL + ' and d.GROMEMBER_ID = '+edtgroupmem.Text;

  if not chkAllMember.Checked then
    sSQL := sSQL + ' and c.MEMBER_CARD_NO = '+ QuotedStr(edtMember.Text);


  sSQL  := sSQL
        + ' and a.TRANS_DATE between ' + TAppUtils.QuotD(dtAwalFilter.Date)
        + ' and ' + TAppUtils.QuotD(dtAkhirFilter.Date, True)
        + ' order by a.TRANS_DATE, c.MEMBER_ID';

  Result  := sSQL;
end;

procedure TfrmListMemberTransaction.edtgroupmemClickBtn(Sender: TObject);
var
sSQL: string;
begin
  inherited;
  sSQL  := 'select GROMEMBER_ID as ID,'
        + ' GROMEMBER_NAME as "Member Group Name"'
        + ' from REF$GRUP_MEMBER'
        + ' where GROMEMBER_UNT_ID = '+ IntToStr(MasterNewUnit);
  {
  with cLookUp('Data Grup Member', sSQL) do
  begin
    try
      if Strings[0] <> '' then
      begin
        edtgroupmem.Text    := Strings[0];
        edtgroupmemnm.Text  := Strings[1];
      end;

    finally
      Free;
    end;
  end;
  }


end;
end.
