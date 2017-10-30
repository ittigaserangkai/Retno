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
    function LookupBarang(sFilter: string): TDataset;
    function LookupMember(sFilter: string): TDataset;
  end;

  TCRUDPos = class(TCRUD)
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
      +' AND SETUPPOS_TERMINAL_CODE = ' + QuotedStr(aPOSCODE)
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

function TPOS.LookupBarang(sFilter: string): TDataset;
var
  S: string;
begin
  S := 'select a.brg_code, s.SAT_CODE, a.brg_name, b.BHJ_SELL_PRICE,'
      +' b.BHJ_DISC_NOMINAL, b.BHJ_SELL_PRICE_DISC, a.brg_is_active,'
      +' b.REF$SATUAN_ID'
      +' from barang a'
      +' inner join barang_harga_jual b on a.BARANG_ID = b.BARANG_ID'
      +' left join ref$satuan s on b.REF$SATUAN_ID = s.REF$SATUAN_ID'
      +' left join REF$TIPE_HARGA th on th.REF$TIPE_HARGA_ID = b.REF$TIPE_HARGA_ID'
//      +' and a.brg_is_active = 1
      +' where th.TPHRG_CODE = ''H004'' '
      +' and a.brg_is_validate = 1'
      +' and upper(a.brg_name) like ' + QuotedStr(sFilter)
      +' order by a.brg_name';
  Result := TDBUtils.OpenQuery(s);
end;

function TPOS.LookupMember(sFilter: string): TDataset;
var
  S: string;
begin
  S := 'select MEMBER_ID, MEMBER_CARD_NO AS KODE, MEMBER_NAME AS NAMA, MEMBER_ADDRESS AS ALAMAT'
      +' from MEMBER WHERE MEMBER_IS_ACTIVE = 1 AND MEMBER_IS_VALID = 1'
      +' and upper(MEMBER_NAME) like ' + QuotedStr(sFilter)
      +' order by MEMBER_NAME';

  Result := TDBUtils.OpenQuery(s);
end;

end.
