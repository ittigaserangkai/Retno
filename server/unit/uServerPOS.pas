unit uServerPOS;

interface

uses
  System.Classes, uModApp, uDBUtils, Rtti, Data.DB, SysUtils, StrUtils, uModSO,
  uModSuplier, Datasnap.DBClient, System.Generics.Collections,
  System.DateUtils, System.JSON, System.JSON.Types, uServerClasses,
  uModBeginningBalance, uModSetupPOS, uModTransaksi;

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
    function GetPendingTransByMember(aMemberID: string; aDate: TDateTime): TDataset;
    function GetListPendingTransDetailByHeaderID(aHeaderID: string): TDataset;
    function GetServerDate: TDatetime;
    function GetTransactionNo(aPOSCODE, aUNITID: string): string;
    function HasBarcode(aBarCode: string): Boolean;
    function LookupBarang(sFilter: string): TDataset;
    function LookupMember(sFilter: string): TDataset;
  end;

  TCRUDPos = class(TCRUD)
  private
    function GenerateSQLCounter(AObject: TModTransaksi): string;
  protected
    function AfterSaveToDB(AObject: TModApp): Boolean; override;
  public
  end;

implementation

uses
  uServerModelHelper;

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
    + ' FROM TRANSAKSI T '
    + ' INNER JOIN MEMBER M ON (M.MEMBER_ID = T.MEMBER_ID) '
    + ' WHERE (T.TRANS_IS_PENDING = 1) '
    + ' AND cast(T.TRANS_DATE as date) = ' + TDBUtils.QuotD(Now());
//    + ' ORDER BY M.MEMBER_CARD_NO, T.TRANS_NO';
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

function TPOS.GetPendingTransByMember(aMemberID: string; aDate: TDateTime):
    TDataset;
var
  S: string;
begin
  S := 'SELECT A.TRANSAKSI_ID, A.TRANS_NO, A.TRANS_DATE,'
      +' A.TRANS_TOTAL_TRANSACTION, B.MEMBER_CARD_NO, B.MEMBER_NAME'
      +' FROM TRANSAKSI A'
      +' INNER JOIN MEMBER B ON A.MEMBER_ID = B.MEMBER_ID'
      +' WHERE A.TRANS_IS_PENDING = 1'
      +' AND A.MEMBER_ID = ' + QuotedStr(aMemberID)
      +' AND cast(A.TRANS_DATE as date) = ' + TDBUtils.QuotD(aDate);
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

function TPOS.HasBarcode(aBarCode: string): Boolean;
var
  s: string;
begin
  s := 'select * from BARANG_HARGA_JUAL A'
      +' inner join REF$KONVERSI_SATUAN B ON A.BARANG_ID = B.BARANG_ID'
      +' AND A.REF$SATUAN_ID = B.REF$SATUAN_ID'
      +' WHERE B.KONVSAT_BARCODE = ' + QuotedStr(aBarCode);
  with TDBUtils.OpenQuery(s) do
  begin
    try
      if not eof then
        Result := True
      else
        Result := False;
    finally
      free;
    end;
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
      +' and a.brg_is_active = 1'
      +' and a.brg_pos_lookup = 1'
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

function TCRUDPos.AfterSaveToDB(AObject: TModApp): Boolean;
var
  s: string;
begin
  Result := False;
  if AObject is TModTransaksi then
  begin
    if AObject.ObjectState = 1 then
    begin
      s := GenerateSQLCounter(TModTransaksi(AObject));
      TDBUtils.ExecuteSQL(S, False);
    end;
  end;
  Result := True;
end;

function TCRUDPos.GenerateSQLCounter(AObject: TModTransaksi): string;
var
  lSetupPOS: TModSetupPOS;
begin
  AObject.BALANCE.Reload(False);
  Result := 'update setuppos '
    + ' set setuppos_counter_no = setuppos_counter_no + 1'
    + ' where setuppos_id = ' + QuotedStr(AObject.BALANCE.SETUPPOS.ID)
    + ' and AUT$UNIT_ID = ' + QuotedStr(AObject.AUTUNIT.ID) + ';';
end;

end.
