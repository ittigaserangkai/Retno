unit uServerPOS;

interface

uses
  System.Classes, uModApp, uDBUtils, Rtti, Data.DB, SysUtils, StrUtils, uModSO,
  uModSuplier, Datasnap.DBClient, System.Generics.Collections,
  System.DateUtils, System.JSON, System.JSON.Types, uServerClasses,
  uModBeginningBalance, uModSetupPOS;

type
  TPOS = class(TBaseServerClass)
  private
    FCRUD: TCrud;
    function GetCRUD: TCrud;
    property CRUD: TCrud read GetCRUD write FCRUD;
  public
    function GetBeginningBalance(UserID: string): TModBeginningBalance;
    function GetListPendingTransAll: TDataset;
    function GetListPendingTransByUserID(aUserID: string): TDataset;
    function GetListPendingTransByUserIDAndDate(aUserID: string; aDate: TDateTime):
        TDataset;
    function GetListPendingTransDetailByHeaderID(aHeaderID: string): TDataset;
    function GetServerDate: TDatetime;
    function GetTransactionNo(aPOSCODE, aUNITID: string): string;
  end;

implementation

function TPOS.GetBeginningBalance(UserID: string): TModBeginningBalance;
var
  S: string;
begin
  Result := TModBeginningBalance.Create;

  S := 'select a.beginning_balance_id'
      +' from beginning_balance a'
      +' inner join setuppos b on a.setuppos_id = b.setuppos_id'
      +' inner join shift c on c.shift_id = a.shift_id'
      +' where b.setuppos_is_active = 1'
      +' and CONVERT(TIME(0),GETDATE()) between CONVERT(TIME(0),c.shift_start_time)'
      +' and CONVERT(TIME(0),c.shift_end_time)'
      +' and cast(a.balance_shift_date as date) = cast(getDate() as date)'
      +' and a.BALANCE_STATUS = ''OPEN''  '
      +' and a.AUT$USER_ID = ' + QuotedStr(USERID);

  with TDButils.OpenQuery(s) do
  begin
    if not eof then
    begin
      Result.Free;
      Result := CRUD.Retrieve(
        TModBeginningBalance.ClassName,
        FieldByName('beginning_balance_id').AsString) as TModBeginningBalance;
    end;
  end;
end;

function TPOS.GetCRUD: TCrud;
begin
  if not Assigned(FCRUD) then FCRUD := TCrud.Create(Self);
  Result := FCRUD;
end;

function TPOS.GetListPendingTransAll: TDataset;
var
  S: string;
begin
  S := 'SELECT M.MEMBER_CARD_NO as "No Kartu", '
    + '  M.MEMBER_NAME as "Nama Member", '
    + '  T.TRANS_NO as "No Transaksi", '
    + '  T.TRANS_DATE as "Tanggal Trans",  '
    + '  T.TRANS_TOTAL_TRANSACTION as "Total", '
    + '  T.TRANS_IS_ACTIVE, '
    + '  T.TRANSAKSI_ID, '
    + '  T.MEMBER_ID '
    + ' FROM MEMBER M '
    + ' INNER JOIN TRANSAKSI T ON (M.MEMBER_ID = T.MEMBER_ID) '
    + ' WHERE (T.TRANS_IS_PENDING = 1) '
    + ' ORDER BY M.MEMBER_CARD_NO, T.TRANS_NO';
  Result := TDBUtils.OpenQuery(S);
end;

function TPOS.GetListPendingTransByUserID(aUserID: string): TDataset;
var
  S: string;
begin
  S := 'SELECT M.MEMBER_CARD_NO as "No Kartu", '
    + '  M.MEMBER_NAME as "Nama Member", '
    + '  T.TRANS_NO as "No Transaksi", '
    + '  T.TRANS_DATE as "Tanggal Trans",  '
    + '  T.TRANS_TOTAL_TRANSACTION as "Total", '
    + '  T.TRANS_IS_ACTIVE, '
    + '  T.TRANSAKSI_ID, '
    + '  T.MEMBER_ID '
    + ' FROM MEMBER M '
    + ' INNER JOIN TRANSAKSI T ON (M.MEMBER_ID = T.MEMBER_ID) '
    + ' WHERE (T.TRANS_IS_PENDING = 1) '
    + '  AND T.OP_CREATE = ' + QuotedStr(aUserID)
    + ' ORDER BY M.MEMBER_CARD_NO, T.TRANS_NO';

  Result := TDBUtils.OpenQuery(S);
end;

function TPOS.GetListPendingTransByUserIDAndDate(aUserID: string; aDate:
    TDateTime): TDataset;
var
  S: string;
begin
  S := 'SELECT M.MEMBER_CARD_NO as "No Kartu", '
    + '  M.MEMBER_NAME as "Nama Member", '
    + '  T.TRANS_NO as "No Transaksi", '
    + '  T.TRANS_DATE as "Tanggal Trans",  '
    + '  T.TRANS_TOTAL_TRANSACTION as "Total", '
    + '  T.TRANS_IS_ACTIVE, '
    + '  T.TRANSAKSI_ID, '
    + '  T.MEMBER_ID '
    + ' FROM MEMBER M '
    + ' INNER JOIN TRANSAKSI T ON (M.MEMBER_ID = T.MEMBER_ID) '
    + ' WHERE (T.TRANS_IS_PENDING = 1) '
    + '  AND T.OP_CREATE = ' + QuotedStr(aUserID)
    + '  AND cast(T.TRANS_DATE as date) = ' + TDBUtils.QuotD(aDate)
    + ' ORDER BY M.MEMBER_CARD_NO, T.TRANS_NO';
  Result := TDBUtils.OpenQuery(S);
end;

function TPOS.GetListPendingTransDetailByHeaderID(aHeaderID: string): TDataset;
var
  S: string;
begin
  S := 'SELECT TD.TRANSAKSI_DETIL_ID, '
    + '  TD.TRANSD_BRG_CODE, '
    + '  TD.TRANSD_TRANS_NO, '
    + '  TD.BARANG_HARGA_JUAL_ID, '
    + '  TD.TRANSD_QTY, '
    + '  S.SAT_CODE, '
    + '  TD.TRANSD_SELL_PRICE, '
    + '  BHJ.BHJ_SELL_PRICE, '
    + '  BHJ.REF$TIPE_HARGA_ID, '
    + '  TD.TRANSD_DISC_MAN, '
    + '  TD.OTO_CODE '
    + ' FROM TRANSAKSI_DETIL TD'
    + ' INNER JOIN BARANG_HARGA_JUAL BHJ ON (TD.BARANG_HARGA_JUAL_ID = BHJ.BARANG_HARGA_JUAL_ID) '
    + ' INNER JOIN REF$SATUAN S ON S.REF$SATUAN_ID = BHJ.REF$SATUAN_ID '
    + ' WHERE TD.TRANSAKSI_ID = ' + QuotedStr(aHeaderID)
    + ' ORDER BY TD.TRANSAKSI_DETIL_ID';
  Result := TDBUtils.OpenQuery(S);
end;

function TPOS.GetServerDate: TDatetime;
begin
  Result := Now();
end;

function TPOS.GetTransactionNo(aPOSCODE, aUNITID: string): string;
var
  CounterNo: Integer;
  S: string;
  TransactionNo: string;
begin
  Result := '';
  S := 'select SETUPPOS_NO_TRANSAKSI, SETUPPOS_COUNTER_NO from SETUPPOS'
      +' WHERE AUT$UNIT_ID = ' + QuotedStr(aUNITID)
      +' AND SETUPPOS_ID = ' + QuotedStr(aUNITID)
      +' AND cast(SETUPPOS_DATE as Date) =  ' + TDBUtils.QuotD(Now());
  with TDBUtils.OpenQuery(S) do
  begin
    Try
      if not eof then
      begin
        TransactionNo := FieldByName('SETUPPOS_NO_TRANSAKSI').AsString;
        CounterNo     := FieldByName('SETUPPOS_COUNTER_NO').AsInteger;
        Result        := Copy(TransactionNo,1,8) + FormatFloat('0000',CounterNo+1);
      end;
    Finally
      Free;
    End;
  end;
end;

end.
