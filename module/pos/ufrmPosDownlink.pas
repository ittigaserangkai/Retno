unit ufrmPosDownlink;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls ;

type
  TfrmPosDownlink = class(TForm)
    OpDlg: TOpenDialog;
    pnlHeader: TPanel;
    lblHeader: TLabel;
    pnl1: TPanel;
    chkFile: TCheckBox;
    edtFileNm: TEdit;
    btnBrowse: TButton;
    btnOk: TButton;
    btnClose: TButton;
    chkDB: TCheckBox;
    grp1: TGroupBox;
    chkBarang: TCheckBox;
    chkVoucher: TCheckBox;
    chkKupon: TCheckBox;
    chkMember: TCheckBox;
    chkKasir: TCheckBox;
    chkAll: TCheckBox;
    chkBank: TCheckBox;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBrowseClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure chkDBClick(Sender: TObject);
    procedure chkFileClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure chkAllClick(Sender: TObject);
  private
//    Cnn : TConnection;
    FDefUnitID: Integer;
    FLDateImpKsr : TDateTime;
    FLDateImpHrg : TDateTime;
    FLDateImpVou : TDateTime;
    FLDateImpBtl : TDateTime;
    FLDateImpMem : TDateTime;
    FLDateImpCrd : TDateTime;
    //FConStore : TIBDatabase;
    //FIsoLvl   : TIBTransaction;
    function UpdateTglDown (aType : string): TStrings;

    function GetDataKonversi: TStrings;
    function GetDataKasir: TStrings;
    function Getsetuppos: TStrings;
    function GetDataPlu: TStrings;
   // function caOpenQuery(aSQL : String): TIBQuery;
    { Private declarations }
  public
    function GetDataJual: TStrings;
    function GetDataKupon: TStrings;
    function GetDataKuponDetil: TStrings;
    function GetDataVoucher: TStrings;
    function GetDataVoucherDetail: TStrings;
    function GetDataMember: TStrings;
    function GetDataCard: TStrings;
    function Gettanggal(aType :string): Tdatetime;
    { Public declarations }
  end;

var
  frmPosDownlink: TfrmPosDownlink;

implementation
uses
   DB, uTSCommonDlg, ufrmMain, uAppUtils, udmMain;
{$R *.dfm}


//function TfrmPosDownlink.caOpenQuery(aSQL : String): TIBQuery;
//begin
//    Result := TIBQuery.create(Application);
//
//    if not Assigned(Result.Database) then
//    begin
//      Result.Database := FConStore;
//    end;
//
//    if not Assigned(Result.Transaction) then
//    begin
//      Result.Transaction := FIsoLvl;
//    end;
//
//    Result.SQL.Clear;
//    Result.SQL.add(Asql);
//    application.ProcessMessages;
//    try
//      Result.open;
//      application.ProcessMessages;
//    except
//      FreeAndNil(Result);
//      raise;
//    end;
//end;

procedure TfrmPosDownlink.btnOkClick(Sender: TObject);
var
  aList : TStrings;
  SS    : TStrings;

begin
  TAppUtils.cShowWaitWindow('Please wait....');
  aList := TStringList.Create;
  try
    if chkDB.Checked then
    begin
//      cShowWaitWindow('setuppos');
        if chkKasir.Checked = True then
        Begin
          SS  := Getsetuppos;
          aList.AddStrings(SS);
          SS.Free;
      //    cShowWaitWindow('beginning');
          SS  := GetDataKasir;
          aList.AddStrings(SS);
          SS.Free;

          SS := UpdateTglDown('KASIR');
          aList.AddStrings(SS);
          SS.Free;

         end;
        if chkBarang.Checked = True then
        begin
          SS  := GetDataPlu;
          aList.AddStrings(SS);
          SS.Free;

          SS := GetDataKonversi;
          aList.AddStrings(SS);
          SS.Free;

          SS  := GetDataJual;
          aList.AddStrings(SS);
          SS.Free;

          SS := UpdateTglDown('HARGA');
          aList.AddStrings(SS);
          SS.Free;
        end;
        if chkVoucher.Checked = True then
        begin
          SS  := GetDataVoucher;
          aList.AddStrings(SS);
          SS.Free;

          SS  := GetDataVoucherDetail;
          aList.AddStrings(SS);
          SS.Free;

          SS := UpdateTglDown('VOUCHER');
          aList.AddStrings(SS);
          SS.Free;
        end;
        if chkKupon.Checked = True then
        begin
          SS  := GetDataKupon;
          aList.AddStrings(SS);
          SS.Free;

          SS  := GetDataKuponDetil;
          aList.AddStrings(SS);
          SS.Free;

          SS := UpdateTglDown('BOTOL');
          aList.AddStrings(SS);
          SS.Free;
        end;
        if chkMember.Checked = True then
        begin
          SS  := GetDataMember;
          aList.AddStrings(SS);
          SS.Free;

          SS := UpdateTglDown('MEMBER');
          aList.AddStrings(SS);
          SS.Free;
        end;

        if chkBank.Checked = True then
        begin
          SS  := GetDataCard;
          aList.AddStrings(SS);
          SS.Free;

          SS := UpdateTglDown('CARD');
          aList.AddStrings(SS);
          SS.Free;
        end;
    end
    else if chkFile.Checked then
    begin

      if edtFileNm.Text = '' then
      begin
        CommonDlg.ShowError('File data tidak ditemukan');
        Exit;
      end
      else
        aList.LoadFromFile(edtFileNm.Text);

    end;
    {
    try
      aList.SaveToFile('aa.txt');
      kExecuteSQLsNoBlob(aList);
      CommonDlg.ShowMessage('Impor file Sukses ');
      cCommitTrans;
    except
      CommonDlg.ShowError('Gagal mengimpor file');
      exit;
    end;
    }
  finally
    TAppUtils.cCloseWaitWindow;
    aList.Free;
  end;
end;

procedure TfrmPosDownlink.FormShow(Sender: TObject);
begin
  FDefUnitID := StrToInt(dmMain.getGlobalVar('UNITID'));
  FLDateImpKsr  := Gettanggal('KASIR');
  FLDateImpHrg  := Gettanggal('HARGA');
  FLDateImpVou  := Gettanggal('VOUCHER');
  FLDateImpBtl  := Gettanggal('BOTOL');
  FLDateImpMem  := Gettanggal('MEMBER');
  FLDateImpCrd  := Gettanggal('CARD');

end;

function TfrmPosDownlink.GetDataJual: TStrings;
var
  BHJ_LAST_SELL_PRICE: Double;
  BHJ_MAILER_END_DATE: string;
  BHJ_MAX_QTY_DISC: string;
  BHJ_IS_MAILER: string;
  DATE_MODIFY: string;
  DATE_CREATE: string;

  BHJ_CONV_VALUE: Double;
  BHJ_QTY_SUBSIDY_PRICE: Double;
  BHJ_QTY_SUBSIDY: Double;
  BHJ_LIMIT_QTY_PRICE: Double;
  BHJ_LIMIT_QTY: Double;
  BHJ_IS_QTY_SUBSIDY: Integer;
  BHJ_IS_LIMIT_QTY: Integer;
  BHJ_MARK_UP: Double;
  BHJ_SELL_PRICE_CORET: Double;
  BHJ_SELL_PRICE_DISC: Double;
  BHJ_DISC_NOMINAL: Double;
  BHJ_DISC_PERSEN: Double;
  BHJ_SELL_PRICE: Double;
  BHJ_TPHRG_ID: Integer;
  BHJ_BRG_CODE: string;
  BHJ_SAT_CODE: string;
  BHJ_ID: Integer;
  sSQL: string;

begin
  Result := TStringList.Create;

  sSQL  := 'SELECT BHJ_ID,'
          + ' BHJ_UNT_ID,'
          + ' BHJ_SAT_CODE,'
          + ' BHJ_BRG_CODE,'
          + ' BHJ_TPHRG_ID,'
          + ' BHJ_TPHRG_UNT_ID,'
          + ' BHJ_SELL_PRICE,'
          + ' BHJ_DISC_PERSEN,'
          + ' BHJ_DISC_NOMINAL,'
          + ' BHJ_SELL_PRICE_DISC,'
          + ' BHJ_SELL_PRICE_CORET,'
          + ' BHJ_MARK_UP,'
          + ' BHJ_IS_LIMIT_QTY,'
          + ' BHJ_IS_QTY_SUBSIDY,'
          + ' BHJ_LIMIT_QTY,'
          + ' BHJ_LIMIT_QTY_PRICE,'
          + ' BHJ_QTY_SUBSIDY,'
          + ' BHJ_QTY_SUBSIDY_PRICE,'
          + ' BHJ_CONV_VALUE,'
          + ' DATE_CREATE,'
          + ' DATE_MODIFY,'
          + ' BHJ_IS_MAILER,'
          + ' BHJ_MAX_QTY_DISC,'
          + ' BHJ_MAILER_END_DATE,'
          + ' BHJ_LAST_SELL_PRICE'
          + ' FROM BARANG_HARGA_JUAL'
          + ' WHERE (DATE_CREATE > '+ TAppUtils.QuotDT(FLDateImpHrg)
          + ' or DATE_MODIFY > '+ TAppUtils.QuotDT(FLDateImphrg) + ')'
          + ' and BHJ_UNT_ID = '+ IntToStr(FDefUnitID) ;

   {
   with Cnn.cOpenQuery(sSQL) do
   begin
    try
      while not Eof do
      begin
        BHJ_ID                := FieldByName('BHJ_ID').AsInteger;
        BHJ_SAT_CODE          := FieldByName('BHJ_SAT_CODE').AsString;
        BHJ_BRG_CODE          := FieldByName('BHJ_BRG_CODE').AsString;
        BHJ_TPHRG_ID          := FieldByName('BHJ_TPHRG_ID').AsInteger;
        BHJ_SELL_PRICE        := FieldByName('BHJ_SELL_PRICE').AsFloat;
        BHJ_DISC_PERSEN       := FieldByName('BHJ_DISC_PERSEN').AsFloat;
        BHJ_DISC_NOMINAL      := FieldByName('BHJ_DISC_NOMINAL').AsFloat;
        BHJ_SELL_PRICE_DISC   := FieldByName('BHJ_SELL_PRICE_DISC').AsFloat;
        BHJ_SELL_PRICE_CORET  := FieldByName('BHJ_SELL_PRICE_CORET').AsFloat;
        BHJ_MARK_UP           := FieldByName('BHJ_MARK_UP').AsFloat;
        BHJ_IS_LIMIT_QTY      := FieldByName('BHJ_IS_LIMIT_QTY').AsInteger;
        BHJ_IS_QTY_SUBSIDY    := FieldByName('BHJ_IS_QTY_SUBSIDY').AsInteger;
        BHJ_LIMIT_QTY         := FieldByName('BHJ_LIMIT_QTY').AsFloat;
        BHJ_LIMIT_QTY_PRICE   := FieldByName('BHJ_LIMIT_QTY_PRICE').AsFloat;
        BHJ_QTY_SUBSIDY       := FieldByName('BHJ_QTY_SUBSIDY').AsFloat;
        BHJ_QTY_SUBSIDY_PRICE := FieldByName('BHJ_QTY_SUBSIDY_PRICE').AsFloat;
        BHJ_CONV_VALUE        := FieldByName('BHJ_CONV_VALUE').AsFloat;
        DATE_CREATE           := FormatDateTime('MM-DD-YYYY hh:mm:ss', FieldByName('DATE_CREATE').AsDateTime);

        if FieldByName('DATE_MODIFY').IsNull then
          DATE_MODIFY := 'null'
        else

          DATE_MODIFY := Quot(FormatDateTime('MM-DD-YYYY hh:mm:ss', FieldByName('DATE_MODIFY').AsDateTime));

        if FieldByName('BHJ_IS_MAILER').IsNull then
          BHJ_IS_MAILER := 'null'
        else
          BHJ_IS_MAILER         := Quot(FieldByName('BHJ_IS_MAILER').AsString);


        if FieldByName('BHJ_MAX_QTY_DISC').IsNull then
          BHJ_MAX_QTY_DISC  := 'null'
        else
          BHJ_MAX_QTY_DISC      := Quot(FieldByName('BHJ_MAX_QTY_DISC').AsString);

        if FieldByName('BHJ_MAILER_END_DATE').IsNull then
          BHJ_MAILER_END_DATE := 'null'
        else
          BHJ_MAILER_END_DATE   := Quot(FormatDateTime('MM-DD-YYYY hh:mm:ss', FieldByName('BHJ_MAILER_END_DATE').AsDateTime));

        BHJ_LAST_SELL_PRICE   := FieldByName('BHJ_LAST_SELL_PRICE').AsFloat;

        if FieldByName('DATE_CREATE').AsDateTime > FLDateImpHrg then
        begin
          sSQL := 'insert into barang_harga_jual (BHJ_ID, BHJ_UNT_ID,'
                + ' BHJ_SAT_CODE, BHJ_BRG_CODE,'
                + ' BHJ_TPHRG_ID, BHJ_TPHRG_UNT_ID,'
                + ' BHJ_SELL_PRICE, BHJ_DISC_PERSEN, BHJ_DISC_NOMINAL,'
                + ' BHJ_SELL_PRICE_DISC, BHJ_SELL_PRICE_CORET, BHJ_MARK_UP,'
                + ' BHJ_IS_LIMIT_QTY, BHJ_IS_QTY_SUBSIDY, BHJ_LIMIT_QTY,'
                + ' BHJ_LIMIT_QTY_PRICE, BHJ_QTY_SUBSIDY,'
                + ' BHJ_QTY_SUBSIDY_PRICE, BHJ_CONV_VALUE, DATE_CREATE,'
                + ' DATE_MODIFY, BHJ_IS_MAILER, BHJ_MAX_QTY_DISC,'
                + ' BHJ_MAILER_END_DATE, BHJ_LAST_SELL_PRICE)'
                + ' values (' + IntToStr(BHJ_ID)
                + ', ' + IntToStr(FDefUnitID)
                + ', ' + Quot(BHJ_SAT_CODE)
                + ', ' + Quot(BHJ_BRG_CODE)
                + ', ' + IntToStr(BHJ_TPHRG_ID)
                + ', ' + IntToStr(FDefUnitID)
                + ', ' + FloatToStr(BHJ_SELL_PRICE)
                + ', ' + FloatToStr(BHJ_DISC_PERSEN)
                + ', ' + FloatToStr(BHJ_DISC_NOMINAL)
                + ', ' + FloatToStr(BHJ_SELL_PRICE_DISC)
                + ', ' + FloatToStr(BHJ_SELL_PRICE_CORET)
                + ', ' + FloatToStr(BHJ_MARK_UP)
                + ', ' + IntToStr(BHJ_IS_LIMIT_QTY)
                + ', ' + IntToStr(BHJ_IS_QTY_SUBSIDY)
                + ', ' + FloatToStr(BHJ_LIMIT_QTY)
                + ', ' + FloatToStr(BHJ_LIMIT_QTY_PRICE)
                + ', ' + FloatToStr(BHJ_QTY_SUBSIDY)
                + ', ' + FloatToStr(BHJ_QTY_SUBSIDY_PRICE)
                + ', ' + FloatToStr(BHJ_CONV_VALUE)
                + ', ' + Quot(DATE_CREATE)
                + ', ' + DATE_MODIFY
                + ', ' + BHJ_IS_MAILER
                + ', ' + BHJ_MAX_QTY_DISC
                + ', ' + BHJ_MAILER_END_DATE
                + ', ' + FloatToStr(BHJ_LAST_SELL_PRICE)
                + ');';

        end
        else
        begin
          sSQL  := 'update barang_harga_jual set '
                + ' BHJ_SAT_CODE = '+ Quot(BHJ_SAT_CODE)
                + ' ,BHJ_BRG_CODE = '+ Quot(BHJ_BRG_CODE)
                + ' ,BHJ_TPHRG_ID = '+ IntToStr(BHJ_TPHRG_ID)
                + ' ,BHJ_TPHRG_UNT_ID = '+IntToStr(FDefUnitID)
                + ' ,BHJ_SELL_PRICE = '+ FloatToStr(BHJ_SELL_PRICE)
                + ' ,BHJ_DISC_PERSEN = '+ FloatToStr(BHJ_DISC_PERSEN)
                + ' ,BHJ_DISC_NOMINAL = '+ FloatToStr(BHJ_DISC_NOMINAL)
                + ' ,BHJ_SELL_PRICE_DISC = '+ FloatToStr(BHJ_SELL_PRICE_DISC)
                + ' ,BHJ_SELL_PRICE_CORET = '+ FloatToStr(BHJ_SELL_PRICE_CORET)
                + ' ,BHJ_MARK_UP = '+ FloatToStr(BHJ_MARK_UP)
                + ' ,BHJ_IS_LIMIT_QTY = '+ FloatToStr(BHJ_LIMIT_QTY)
                + ' ,BHJ_IS_QTY_SUBSIDY = '+ IntToStr(BHJ_IS_QTY_SUBSIDY)
                + ' ,BHJ_LIMIT_QTY = '+ FloatToStr(BHJ_LIMIT_QTY)
                + ' ,BHJ_LIMIT_QTY_PRICE = '+ FloatToStr(BHJ_LIMIT_QTY_PRICE)
                + ' ,BHJ_QTY_SUBSIDY = '+ FloatToStr(BHJ_QTY_SUBSIDY)
                + ' ,BHJ_QTY_SUBSIDY_PRICE = '+ FloatToStr(BHJ_QTY_SUBSIDY_PRICE)
                + ' ,BHJ_CONV_VALUE = '+ FloatToStr(BHJ_CONV_VALUE)
                + ' ,DATE_CREATE = '+ Quot(DATE_CREATE)
                + ' ,DATE_MODIFY = '+ DATE_MODIFY
                + ' ,BHJ_IS_MAILER = '+ BHJ_IS_MAILER
                + ' ,BHJ_MAX_QTY_DISC = '+ BHJ_MAX_QTY_DISC
                + ' ,BHJ_MAILER_END_DATE = '+ BHJ_MAILER_END_DATE
                + ' ,BHJ_LAST_SELL_PRICE = '+ FloatToStr(BHJ_LAST_SELL_PRICE)
                + ' where BHJ_ID = '+ IntToStr(BHJ_ID)
                + ' and BHJ_UNT_ID = '+ IntToStr(FDefUnitID)
                + ';';
        end;

          Result.Append(sSQL);
        Next;
      end;
    finally
      Free;
    end;
   end;
   }
end;


function TfrmPosDownlink.GetDataKupon: TStrings;
var
  aTKB_NO : string;
  aTKB_UNT_ID : Integer;
  aTKB_DATE : TDateTime;
  aTKB_INC : Integer;
  aTKB_MEMBER_ID : Integer;
  aTKB_MEMBER_UNT_ID : Integer;
  aTKB_DESCRIPTION : string;
  aTKB_POS_TRANS_NO : string;
  aTKB_QTY : Integer;
  aTKB_SELL_PRICE_DISC : Double;
  aTKB_STATUS : string;
  aTKB_IS_PRINTED : SmallInt;
  aDATE_CREATE : TDateTime;
  aDATE_MODIFY : TDateTime;
  sSQL: string;

begin
  Result := TStringList.Create;

  sSQL  := 'SELECT *'
          + ' FROM TRANS_KUPON_BOTOL'
          + ' WHERE (DATE_CREATE > '+ TAppUtils.QuotDT(FLDateImpBtl)
          + ' or DATE_MODIFY > '+ TAppUtils.QuotDT(FLDateImpBtl) + ')'
          + ' and TKB_UNT_ID = '+ IntToStr(FDefUnitID) ;

   {
   with Cnn.cOpenQuery(sSQL) do
   begin
    try
      while not Eof do
      begin
        aTKB_NO           := FieldByName('TKB_NO').AsString;
        aTKB_UNT_ID       := FieldByName('TKB_UNT_ID').AsInteger;
        aTKB_DATE         := FieldByName('TKB_DATE').Asdatetime;
        aTKB_INC          := FieldByName('TKB_INC').AsInteger;
        aTKB_MEMBER_ID    := FieldByName('TKB_MEMBER_ID').AsInteger;
        aTKB_MEMBER_UNT_ID:= FieldByName('TKB_MEMBER_UNT_ID').AsInteger;
        aTKB_DESCRIPTION  := FieldByName('TKB_DESCRIPTION').AsString;
        aTKB_POS_TRANS_NO := FieldByName('TKB_POS_TRANS_NO').AsString;
        aTKB_QTY          := FieldByName('TKB_QTY').AsInteger;
        aTKB_SELL_PRICE_DISC := FieldByName('TKB_SELL_PRICE_DISC').AsFloat;
        aTKB_STATUS       := FieldByName('TKB_STATUS').AsString;
        aTKB_IS_PRINTED   := FieldByName('TKB_IS_PRINTED').AsInteger;
        aDATE_CREATE      := FieldByName('DATE_CREATE').AsDateTime;
        aDATE_MODIFY      := FieldByName('DATE_MODIFY').AsDateTime;

        if FieldByName('DATE_CREATE').AsDateTime > FLDateImpBtl then
        begin
          sSQL := ' insert into TRANS_KUPON_BOTOL ('
                + ' TKB_NO '
                + ' ,TKB_UNT_ID '
                + ' ,TKB_DATE '
                + ' ,TKB_INC '
                + ' ,TKB_MEMBER_ID '
                + ' ,TKB_MEMBER_UNT_ID '
                + ' ,TKB_DESCRIPTION '
                + ' ,TKB_POS_TRANS_NO '
                + ' ,TKB_QTY '
                + ' ,TKB_SELL_PRICE_DISC '
                + ' ,TKB_STATUS '
                + ' ,TKB_IS_PRINTED '
                + ' ,DATE_CREATE '
                + ' ,DATE_MODIFY )'
                + ' values ('
                + QUOT(aTKB_NO)
                + ',' + IntToStr(aTKB_UNT_ID)
                + ',' + QuotDT(aTKB_DATE)
                + ',' + IntToStr(aTKB_INC)
                + ',' + IntToStr(aTKB_MEMBER_ID)
                + ',' + IntToStr(aTKB_MEMBER_UNT_ID)
                + ',' + Quot(aTKB_DESCRIPTION)
                + ',' + Quot(aTKB_POS_TRANS_NO)
                + ',' + IntToStr(aTKB_QTY)
                + ',' + FloatToStr(aTKB_SELL_PRICE_DISC)
                + ',' + Quot(aTKB_STATUS)
                + ',' + IntToStr(aTKB_IS_PRINTED)
                + ',' + Quotdt(aDATE_CREATE)
                + ',' + Quotdt(aDATE_MODIFY)
                + ');';

        end
        else
        begin
          sSQL  := 'update TRANS_KUPON_BOTOL set '
                + ' TKB_DATE ='+ QuotDT(aTKB_DATE)
                + ' ,TKB_INC ='+IntToStr(aTKB_INC)
                + ' ,TKB_MEMBER_ID ='+ IntToStr(aTKB_MEMBER_ID)
                + ' ,TKB_MEMBER_UNT_ID =' + IntToStr(aTKB_MEMBER_UNT_ID)
                + ' ,TKB_DESCRIPTION =' + Quot(aTKB_DESCRIPTION)
                + ' ,TKB_POS_TRANS_NO =' + Quot(aTKB_POS_TRANS_NO)
                + ' ,TKB_QTY ='+ IntToStr(aTKB_QTY)
                + ' ,TKB_SELL_PRICE_DISC =' + FloatToStr(aTKB_SELL_PRICE_DISC)
                + ' ,TKB_STATUS =' + Quot(aTKB_STATUS)
                + ' ,TKB_IS_PRINTED =' + IntToStr(aTKB_IS_PRINTED)
                + ' ,DATE_CREATE ='  + Quotdt(aDATE_CREATE)
                + ' ,DATE_MODIFY ='  + Quotdt(aDATE_MODIFY)
                + ' where TKB_NO = '+ QUOT(aTKB_NO)
                + ' and TKB_UNT_ID = '+IntToStr(aTKB_UNT_ID)
                + ';';
        end;

          Result.Append(sSQL);
        Next;
      end;
    finally
      Free;
    end;
   end;
   }
end;


function TfrmPosDownlink.GetDataKuponDetil: TStrings;
var
  aTKBD_ID :	INTEGER ;
  aTKBD_UNT_ID : INTEGER;
  aTKBD_TKB_NO : string;
  aTKBD_TKB_UNT_ID :INTEGER;
  aTKBD_BRG_CODE :	string;
  aTKBD_SAT_CODE :	string;
  aTKBD_QTY : Integer;
  aTKBD_SELL_PRICE : Double;
  aTKBD_DISC : Double;
  aTKBD_SELL_PRICE_DISC : Double;
  aTKBD_TOTAL_SELL_PRICE_DISC : Double;
  aDATE_CREATE : TDateTime;
  aDATE_MODIFY : TDateTime;

  sSQL: string;

begin
  Result := TStringList.Create;

  sSQL  := 'SELECT *'
          + ' FROM TRANS_KUPON_BOTOL_DETIL'
          + ' WHERE (DATE_CREATE > '+ TAppUtils.QuotDT(FLDateImpBtl)
          + ' or DATE_MODIFY > '+ TAppUtils.QuotDT(FLDateImpBtl) + ')'
          + ' and TKBD_UNT_ID = '+ IntToStr(FDefUnitID) ;

   {
   with Cnn.cOpenQuery(sSQL) do
   begin
    try
      while not Eof do
      begin
        aTKBD_ID := FieldByName('TKBD_ID').AsInteger;
        aTKBD_UNT_ID := FieldByName('TKBD_UNT_ID').AsInteger;
        aTKBD_TKB_NO := FieldByName('TKBD_TKB_NO').AsString;
        aTKBD_TKB_UNT_ID := FieldByName('TKBD_TKB_UNT_ID').AsInteger;
        aTKBD_BRG_CODE  := FieldByName('TKBD_BRG_CODE').AsString;
        aTKBD_SAT_CODE := FieldByName('TKBD_SAT_CODE').AsString;
        aTKBD_QTY := FieldByName('TKBD_QTY').AsInteger;
        aTKBD_SELL_PRICE := FieldByName('TKBD_SELL_PRICE').AsFloat;
        aTKBD_DISC := FieldByName('TKBD_DISC').AsFloat;
        aTKBD_SELL_PRICE_DISC := FieldByName('TKBD_SELL_PRICE_DISC').AsFloat;
        aTKBD_TOTAL_SELL_PRICE_DISC:= FieldByName('TKBD_TOTAL_SELL_PRICE_DISC').AsFloat;
        aDATE_CREATE      := FieldByName('DATE_CREATE').AsDateTime;
        aDATE_MODIFY      := FieldByName('DATE_MODIFY').AsDateTime;

        if FieldByName('DATE_CREATE').AsDateTime > FLDateImpBtl then
        begin
          sSQL := ' insert into TRANS_KUPON_BOTOL_DETIL('
                + ' TKBD_ID'
                + ' ,TKBD_UNT_ID'
                + ' ,TKBD_TKB_NO'
                + ' ,TKBD_TKB_UNT_ID'
                + ' ,TKBD_BRG_CODE'
                + ' ,TKBD_SAT_CODE'
                + ' ,TKBD_QTY'
                + ' ,TKBD_SELL_PRICE'
                + ' ,TKBD_DISC'
                + ' ,TKBD_SELL_PRICE_DISC'
                + ' ,TKBD_TOTAL_SELL_PRICE_DISC'
                + ' ,DATE_CREATE'
                + ' ,DATE_MODIFY )'
                + ' values ('
                + IntToStr(aTKBd_id)
                + ',' + IntToStr(aTKBD_UNT_ID)
                + ',' + Quot(aTKBD_TKB_NO)
                + ',' + IntToStr(aTKBD_TKB_UNT_ID)
                + ',' + quot(aTKBD_BRG_CODE)
                + ',' + quot(aTKBD_SAT_CODE)
                + ',' + IntToStr(aTKBD_QTY)
                + ',' + FloatToStr(aTKBD_SELL_PRICE)
                + ',' + FloatToStr(aTKBD_DISC)
                + ',' + FloatToStr(aTKBD_SELL_PRICE_DISC)
                + ',' + FloatToStr(aTKBD_TOTAL_SELL_PRICE_DISC)
                + ',' + Quotdt(aDATE_CREATE)
                + ',' + Quotdt(aDATE_MODIFY)
                + ');';

        end
        else
        begin
          sSQL  := 'update TRANS_KUPON_BOTOL_DETIL set '
                + ' TKBD_TKB_NO = ' + Quot(aTKBD_TKB_NO)
                + ' ,TKBD_TKB_UNT_ID =' + IntToStr(aTKBD_TKB_UNT_ID)
                + ' ,TKBD_BRG_CODE =' + quot(aTKBD_BRG_CODE)
                + ' ,TKBD_SAT_CODE =' + quot(aTKBD_SAT_CODE)
                + ' ,TKBD_QTY =' + IntToStr(aTKBD_QTY)
                + ' ,TKBD_SELL_PRICE =' + FloatToStr(aTKBD_SELL_PRICE)
                + ' ,TKBD_DISC =' + FloatToStr(aTKBD_DISC)
                + ' ,TKBD_SELL_PRICE_DISC =' + FloatToStr(aTKBD_SELL_PRICE_DISC)
                + ' ,TKBD_TOTAL_SELL_PRICE_DISC ='+ FloatToStr(aTKBD_TOTAL_SELL_PRICE_DISC)
                + ' ,DATE_CREATE =' + Quotdt(aDATE_CREATE)
                + ' ,DATE_MODIFY =' + Quotdt(aDATE_MODIFY)
                + ' where TKBD_ID = '+ IntToStr(aTKBD_ID)
                + ' and TKBD_UNT_ID = '+IntToStr(aTKBD_UNT_ID)
                + ';';
        end;

          Result.Append(sSQL);
        Next;
      end;
    finally
      Free;
    end;
   end;
   }
end;


function TfrmPosDownlink.GetDataVoucher: TStrings;
var
  VCR_ID      : Integer;
  VCR_UNT_ID  : Integer ;
  VCR_AGRV_NO :	string;
  VCR_AGRV_UNT_ID : Integer;
  VCR_ISSUED_DATE : TDateTime;
  VCR_NOMINAL     : double;
  VCR_QTY         :Integer;
  VCR_START_DATE  : TDateTime;
  VCR_EXPIRE_DATE : TDateTime;
  DATE_CREATE     : TDateTime;
  DATE_MODIFY     : TDateTime;
  sSQL: string;

begin
  Result := TStringList.Create;

  sSQL  := 'SELECT *'
          + ' FROM VOUCHER'
          + ' WHERE (DATE_CREATE > '+ TAppUtils.QuotDT(FLDateImpVou)
          + ' or DATE_MODIFY > '+ TAppUtils.QuotDT(FLDateImpVou) + ')'
          + ' and VCR_UNT_ID = '+ IntToStr(FDefUnitID) ;

   {
   with Cnn.cOpenQuery(sSQL) do
   begin
    try
      while not Eof do
      begin
        VCR_ID      := FieldByName('VCR_ID').AsInteger;
        VCR_UNT_ID  := FieldByName('VCR_UNT_ID').AsInteger;
        VCR_AGRV_NO := FieldByName('VCR_AGRV_NO').AsString;
        VCR_AGRV_UNT_ID := FieldByName('VCR_AGRV_UNT_ID').AsInteger;
        VCR_ISSUED_DATE := FieldByName('VCR_ISSUED_DATE').AsDateTime;
        VCR_NOMINAL     := FieldByName('VCR_NOMINAL').AsFloat;
        VCR_QTY         :=FieldByName('VCR_QTY').AsInteger;
        VCR_START_DATE  := FieldByName('VCR_START_DATE').AsDateTime;
        VCR_EXPIRE_DATE := FieldByName('VCR_EXPIRE_DATE').AsDateTime;
        DATE_CREATE     := FieldByName('DATE_CREATE').AsDateTimE;
        DATE_MODIFY     := FieldByName('DATE_MODIFY').AsDateTime;


        if FieldByName('DATE_CREATE').AsDateTime > FLDateImpVou then
        begin
          sSQL := ' insert into VOUCHER ('
                + ' VCR_ID'
                + ' ,VCR_UNT_ID'
                + ' ,VCR_AGRV_NO'
                + ' ,VCR_AGRV_UNT_ID'
                + ' ,VCR_ISSUED_DATE'
                + ' ,VCR_NOMINAL'
                + ' ,VCR_QTY'
                + ' ,VCR_START_DATE'
                + ' ,VCR_EXPIRE_DATE'
                + ' ,DATE_CREATE'
                + ' ,DATE_MODIFY)'
                + ' values ('
                + IntToStr(VCR_ID)
                + ',' + IntToStr(VCR_UNT_ID)
                + ',' + Quot(VCR_AGRV_NO)
                + ',' + IntToStr(VCR_AGRV_UNT_ID)
                + ',' + QUOTDT(VCR_ISSUED_DATE)
                + ',' + FloatToStr(VCR_NOMINAL)
                + ',' + IntToStr(VCR_QTY)
                + ',' + Quotdt(VCR_START_DATE)
                + ',' + Quotdt(VCR_EXPIRE_DATE)
                + ',' + Quotdt(DATE_CREATE)
                + ',' + Quotdt(DATE_MODIFY)
                + ');';

        end
        else
        begin
          sSQL  := 'update VOUCHER set '
                + ' VCR_AGRV_NO =' + Quot(VCR_AGRV_NO)
                + ' ,VCR_AGRV_UNT_ID =' + IntToStr(VCR_AGRV_UNT_ID)
                + ' ,VCR_ISSUED_DATE =' + QUOTDT(VCR_ISSUED_DATE)
                + ' ,VCR_NOMINAL =' + FloatToStr(VCR_NOMINAL)
                + ' ,VCR_QTY =' + IntToStr(VCR_QTY)
                + ' ,VCR_START_DATE =' + Quotdt(VCR_START_DATE)
                + ' ,VCR_EXPIRE_DATE =' + Quotdt(VCR_EXPIRE_DATE)
                + ' ,DATE_CREATE =' + Quotdt(DATE_CREATE)
                + ' ,DATE_MODIFY =' + Quotdt(DATE_MODIFY)
                + ' where VCR_ID = '+ IntToStr(VCR_ID)
                + ' and VCR_UNT_ID = '+IntToStr(VCR_UNT_ID)
                + ';';
        end;

          Result.Append(sSQL);
        Next;
      end;
    finally
      Free;
    end;
   end;
   }
end;

function TfrmPosDownlink.GetDataVoucherDetail: TStrings;
var
  VCRD_ID      : Integer;
  VCRD_UNT_ID  : Integer ;
  VCRD_VCR_ID      : Integer;
  VCRD_VCR_UNT_ID  : Integer ;
  VCRD_NO :	string;
  VCRD_NOMINAL : Double;
  VCRD_STATUS : string;
  VCRD_POS_TRANS_NO :  string;
  DATE_CREATE     : TDateTime;
  DATE_MODIFY     : TDateTime;
  sSQL: string;

begin
  Result := TStringList.Create;

  sSQL  := 'SELECT *'
          + ' FROM VOUCHER_DETIL'
          + ' WHERE (DATE_CREATE > '+ TAppUtils.QuotDT(FLDateImpVou)
          + ' or DATE_MODIFY > '+ TAppUtils.QuotDT(FLDateImpVou) + ')'
          + ' and VCRD_UNT_ID = '+ IntToStr(FDefUnitID) ;

   {
   with Cnn.cOpenQuery(sSQL) do
   begin
    try
      while not Eof do
      begin

        VCRD_ID      := FieldByName('VCRD_ID').AsInteger;
        VCRD_UNT_ID  := FieldByName('VCRD_UNT_ID').AsInteger;
        VCRD_VCR_ID      := FieldByName('VCRD_VCR_ID').AsInteger;
        VCRD_VCR_UNT_ID  := FieldByName('VCRD_VCR_UNT_ID').AsInteger;
        VCRD_NO          := FieldByName('VCRD_NO').AsString;

        VCRD_NOMINAL     := FieldByName('VCRD_NOMINAL').AsFloat;
        VCRD_STATUS      :=FieldByName('VCRD_STATUS').AsString;
        VCRD_POS_TRANS_NO:=FieldByName('VCRD_POS_TRANS_NO').AsString;
        DATE_CREATE     := FieldByName('DATE_CREATE').AsDateTimE;
        DATE_MODIFY     := FieldByName('DATE_MODIFY').AsDateTime;


        if FieldByName('DATE_CREATE').AsDateTime > FLDateImpVou then
        begin
          sSQL := ' insert into VOUCHER_detil ('
                + ' VCRD_ID'
                + ' ,VCRD_UNT_ID'
                + ' ,VCRD_VCR_ID'
                + ' ,VCRD_VCR_UNT_ID'
                + ' ,VCRD_NO'
                + ' ,VCRD_NOMINAL'
                + ' ,VCRD_STATUS'
                + ' ,VCRD_POS_TRANS_NO'
                + ' ,DATE_CREATE'
                + ' ,DATE_MODIFY)'
                + ' values ('
                + IntToStr(VCRD_ID)
                + ',' + IntToStr(VCRD_UNT_ID)
                + ',' + IntToStr(VCRD_VCR_ID)
                + ',' + IntToStr(VCRD_VCR_UNT_ID)
                + ',' + Quot(VCRD_NO)
                + ',' + FloatToStr(VCRD_NOMINAL)
                + ',' + QUOT(VCRD_STATUS)
                + ',' + Quot(VCRD_POS_TRANS_NO)
                + ',' + Quotdt(DATE_CREATE)
                + ',' + Quotdt(DATE_MODIFY)
                + ');';

        end
        else
        begin
          sSQL  := 'update VOUCHER_DETIL set '
                + ' VCRD_NO =' + Quot(VCRD_NO)
                + ' ,VCRD_NOMINAL =' + FloatToStr(VCRD_NOMINAL)
                + ' ,VCRD_STATUS =' + QUOT(VCRD_STATUS)
                + ' ,VCRD_POS_TRANS_NO =' + Quot(VCRD_POS_TRANS_NO)
                + ' ,DATE_CREATE =' + Quotdt(DATE_CREATE)
                + ' ,DATE_MODIFY =' + Quotdt(DATE_MODIFY)
                + ' where VCRD_ID = '+ IntToStr(VCRD_ID)
                + ' and VCRD_UNT_ID = '+IntToStr(VCRD_UNT_ID)
                + ';';
        end;

          Result.Append(sSQL);
        Next;
      end;
    finally
      Free;
    end;
   end;
   }
end;




function TfrmPosDownlink.GetDataMember: TStrings;
var

  aMEMBER_ID:	INTEGER ;
  aMEMBER_UNT_ID:	INTEGER ;
  aMEMBER_CARD_NO:	string;
  aMEMBER_NAME:	string;
  aMEMBER_IS_WNI:	Integer;
  aMEMBER_PLACE_OF_BIRTH:	string;
  aMEMBER_DATE_OF_BIRTH:	TDateTime;
  aMEMBER_KTP_NO:	string;
  aMEMBER_SEX:	integer;
  aMEMBER_AGAMA_ID:	integer;
  aMEMBER_ADDRESS:	string;
  aMEMBER_KELURAHAN:	string;
  aMEMBER_KECAMATAN:	string;
  aMEMBER_KOTA:	string;
  aMEMBER_RT:	string;
  aMEMBER_RW:	string;
  aMEMBER_POST_CODE:string;
  aMEMBER_JML_TANGGUNGAN:	integer;
  aMEMBER_PENDAPATAN:	Double;
  aMEMBER_TELP:	string;
  aMEMBER_IS_MARRIED:	integer;
  aMEMBER_IS_MAIN:	Integer;
  aMEMBER_REGISTERED_DATE : TDateTime;
  aMEMBER_GROMEMBER_ID:	Integer;
  aMEMBER_GROMEMBER_UNT_ID:	INTEGER;
  aMEMBER_IS_VALID:	SMALLINT;
  aMEMBER_IS_ACTIVE:	SMALLINT;
  aMEMBER_TPMEMBER_ID:	SMALLINT;
  aDATE_CREATE:	TDateTime;
  aDATE_MODIFY:	TDateTime;

  sSQL: string;

begin
  Result := TStringList.Create;

  sSQL  := 'SELECT *'
          + ' FROM member'
          + ' WHERE (DATE_CREATE > '+ TAppUtils.QuotDT(FLDateImpMem)
          + ' or DATE_MODIFY > '+ TAppUtils.QuotDT(FLDateImpMem) + ')'
          + ' and MEMBER_UNT_ID = '+ IntToStr(FDefUnitID) ;

   {
   with Cnn.cOpenQuery(sSQL) do
   begin
    try
      while not Eof do
      begin

        aMEMBER_ID:= FieldByName('MEMBER_ID').AsInteger ;
        aMEMBER_UNT_ID:= FieldByName('MEMBER_UNT_ID').AsInteger ;
        aMEMBER_CARD_NO:= FieldByName('MEMBER_CARD_NO').asstring;
        aMEMBER_NAME:= FieldByName('MEMBER_NAME').asstring;
        aMEMBER_IS_WNI:= FieldByName('MEMBER_IS_WNI').asInteger;
        aMEMBER_PLACE_OF_BIRTH:= FieldByName('MEMBER_PLACE_OF_BIRTH').asstring;
        aMEMBER_DATE_OF_BIRTH:= FieldByName('MEMBER_DATE_OF_BIRTH').asDateTime;
        aMEMBER_KTP_NO:= FieldByName('MEMBER_KTP_NO').asstring;
        aMEMBER_SEX:= FieldByName('MEMBER_SEX').asinteger;
        aMEMBER_AGAMA_ID:= FieldByName('MEMBER_AGAMA_ID').asinteger;
        aMEMBER_ADDRESS:= FieldByName('MEMBER_ADDRESS').asstring;
        aMEMBER_KELURAHAN:= FieldByName('MEMBER_KELURAHAN').asstring;
        aMEMBER_KECAMATAN:= FieldByName('MEMBER_KECAMATAN').asstring;
        aMEMBER_KOTA:= FieldByName('MEMBER_KOTA').asstring;
        aMEMBER_RT:= FieldByName('MEMBER_RT').asstring;
        aMEMBER_RW:= FieldByName('MEMBER_RW').asstring;
        aMEMBER_POST_CODE:= FieldByName('MEMBER_POST_CODE').asstring;
        aMEMBER_JML_TANGGUNGAN:= FieldByName('MEMBER_JML_TANGGUNGAN').asinteger;
        aMEMBER_PENDAPATAN:= FieldByName('MEMBER_PENDAPATAN').AsFloat;
        aMEMBER_TELP:= FieldByName('MEMBER_TELP').asstring;
        aMEMBER_IS_MARRIED:= FieldByName('MEMBER_IS_MARRIED').asinteger;
        aMEMBER_IS_MAIN:= FieldByName('MEMBER_IS_MAIN').asInteger;
        aMEMBER_REGISTERED_DATE := FieldByName('MEMBER_REGISTERED_DATE').asDateTime;
        aMEMBER_GROMEMBER_ID:= FieldByName('MEMBER_GROMEMBER_ID').asInteger;
        aMEMBER_GROMEMBER_UNT_ID:= FieldByName('MEMBER_GROMEMBER_UNT_ID').asINTEGER;
        aMEMBER_IS_VALID:= FieldByName('MEMBER_IS_VALID').AsInteger;
        aMEMBER_IS_ACTIVE:= FieldByName('MEMBER_IS_ACTIVE').AsInteger;
        aMEMBER_TPMEMBER_ID:= FieldByName('MEMBER_TPMEMBER_ID').AsInteger;
        aDATE_CREATE:= FieldByName('DATE_CREATE').asDateTime;
        aDATE_MODIFY:= FieldByName('DATE_MODIFY').asDateTime;

        if FieldByName('DATE_CREATE').AsDateTime > FLDateImpMem then
        begin
          sSQL := ' insert into MEMBER('
                + ' MEMBER_ID'
                + ' ,MEMBER_UNT_ID'
                + ' ,MEMBER_CARD_NO'
                + ' ,MEMBER_NAME'
                + ' ,MEMBER_IS_WNI'
                + ' ,MEMBER_PLACE_OF_BIRTH'
                + ' ,MEMBER_DATE_OF_BIRTH'
                + ' ,MEMBER_KTP_NO'
                + ' ,MEMBER_SEX'
                + ' ,MEMBER_AGAMA_ID'
                + ' ,MEMBER_ADDRESS'
                + ' ,MEMBER_KELURAHAN'
                + ' ,MEMBER_KECAMATAN'
                + ' ,MEMBER_KOTA'
                + ' ,MEMBER_RT'
                + ' ,MEMBER_RW'
                + ' ,MEMBER_POST_CODE'
                + ' ,MEMBER_JML_TANGGUNGAN'
                + ' ,MEMBER_PENDAPATAN'
                + ' ,MEMBER_TELP'
                + ' ,MEMBER_IS_MARRIED'
                + ' ,MEMBER_IS_MAIN'
                + ' ,MEMBER_REGISTERED_DATE'
                + ' ,MEMBER_GROMEMBER_ID'
                + ' ,MEMBER_GROMEMBER_UNT_ID'
                + ' ,MEMBER_IS_VALID'
                + ' ,MEMBER_IS_ACTIVE'
                + ' ,MEMBER_TPMEMBER_ID'
                + ' ,DATE_CREATE'
                + ' ,DATE_MODIFY)'
                + ' values ('
                +  IntToStr(aMEMBER_ID)
                +  ' ,'  + IntToStr(aMEMBER_UNT_ID)
                +  ' ,'  + quot(aMEMBER_CARD_NO)
                +  ' ,'  + quot(aMEMBER_NAME)
                +  ' ,'  + IntToStr(aMEMBER_IS_WNI)
                +  ' ,'  + quot(aMEMBER_PLACE_OF_BIRTH)
                +  ' ,'  + quotd(aMEMBER_DATE_OF_BIRTH)
                +  ' ,'  + quot(aMEMBER_KTP_NO)
                +  ' ,'  + IntToStr(aMEMBER_SEX)
                +  ' ,'  + IntToStr(aMEMBER_AGAMA_ID)
                +  ' ,'  + quot(aMEMBER_ADDRESS)
                +  ' ,'  + quot(aMEMBER_KELURAHAN)
                +  ' ,'  + quot(aMEMBER_KECAMATAN)
                +  ' ,'  + quot(aMEMBER_KOTA)
                +  ' ,'  + quot(aMEMBER_RT)
                +  ' ,'  + quot(aMEMBER_RW)
                +  ' ,'  + Quot(aMEMBER_POST_CODE)
                +  ' ,'  + IntToStr(aMEMBER_JML_TANGGUNGAN)
                +  ' ,'  + FloatToStr(aMEMBER_PENDAPATAN)
                +  ' ,'  + quot(aMEMBER_TELP)
                +  ' ,'  + IntToStr(aMEMBER_IS_MARRIED)
                +  ' ,'  + IntToStr(aMEMBER_IS_MAIN)
                +  ' ,'  + QuotD(aMEMBER_REGISTERED_DATE)
                +  ' ,'  + IntToStr(aMEMBER_GROMEMBER_ID)
                +  ' ,'  + IntToStr(aMEMBER_GROMEMBER_UNT_ID)
                +  ' ,'  + IntToStr(aMEMBER_IS_VALID)
                +  ' ,'  + IntToStr(aMEMBER_IS_ACTIVE)
                +  ' ,'  + IntToStr(aMEMBER_TPMEMBER_ID)
                +  ' ,'  + quotdt(aDATE_CREATE)
                +  ' ,'  + quotdt(aDATE_MODIFY)
                + ');';

        end
        else
        begin
          sSQL  := 'update MEMBER set '
                + ' MEMBER_CARD_NO ='+ quot(aMEMBER_CARD_NO)
                + ' ,MEMBER_NAME ='  + quot(aMEMBER_NAME)
                + ' ,MEMBER_IS_WNI =' + IntToStr(aMEMBER_IS_WNI)
                + ' ,MEMBER_PLACE_OF_BIRTH =' + quot(aMEMBER_PLACE_OF_BIRTH)
                + ' ,MEMBER_DATE_OF_BIRTH =' + quotd(aMEMBER_DATE_OF_BIRTH)
                + ' ,MEMBER_KTP_NO ='+ quot(aMEMBER_KTP_NO)
                + ' ,MEMBER_SEX ='+ IntToStr(aMEMBER_SEX)
                + ' ,MEMBER_AGAMA_ID ='+ IntToStr(aMEMBER_AGAMA_ID)
                + ' ,MEMBER_ADDRESS =' + quot(aMEMBER_ADDRESS)
                + ' ,MEMBER_KELURAHAN =' + quot(aMEMBER_KELURAHAN)
                + ' ,MEMBER_KECAMATAN =' + quot(aMEMBER_KECAMATAN)
                + ' ,MEMBER_KOTA =' + quot(aMEMBER_KOTA)
                + ' ,MEMBER_RT =' + quot(aMEMBER_RT)
                + ' ,MEMBER_RW =' + quot(aMEMBER_RW)
                + ' ,MEMBER_POST_CODE =' + Quot(aMEMBER_POST_CODE)
                + ' ,MEMBER_JML_TANGGUNGAN ='  + IntToStr(aMEMBER_JML_TANGGUNGAN)
                + ' ,MEMBER_PENDAPATAN =' + FloatToStr(aMEMBER_PENDAPATAN)
                + ' ,MEMBER_TELP ='  + quot(aMEMBER_TELP)
                + ' ,MEMBER_IS_MARRIED ='+ IntToStr(aMEMBER_IS_MARRIED)
                + ' ,MEMBER_IS_MAIN =' + IntToStr(aMEMBER_IS_MAIN)
                + ' ,MEMBER_REGISTERED_DATE ='+ QuotD(aMEMBER_REGISTERED_DATE)
                + ' ,MEMBER_GROMEMBER_ID ='  + IntToStr(aMEMBER_GROMEMBER_ID)
                + ' ,MEMBER_GROMEMBER_UNT_ID =' + IntToStr(aMEMBER_GROMEMBER_UNT_ID)
                + ' ,MEMBER_IS_VALID ='+ IntToStr(aMEMBER_IS_VALID)
                + ' ,MEMBER_IS_ACTIVE ='+ IntToStr(aMEMBER_IS_ACTIVE)
                + ' ,MEMBER_TPMEMBER_ID ='+ IntToStr(aMEMBER_TPMEMBER_ID)
                + ' ,DATE_CREATE =' + Quotdt(aDATE_CREATE)
                + ' ,DATE_MODIFY =' + Quotdt(aDATE_MODIFY)
                + ' where MEMBER_ID = '+ IntToStr(aMEMBER_ID)
                + ' and MEMBER_UNT_ID = '+IntToStr(aMEMBER_UNT_ID)
                + ';';
        end;

          Result.Append(sSQL);
        Next;
      end;
    finally
      Free;
    end;
   end;
   }
end;


function TfrmPosDownlink.GetDataCard: TStrings;
var

  CARD_ID:	INTEGER ;
  CARD_UNT_ID:	INTEGER ;
  CARD_CODE:	string;
  CARD_NAME:	string;
  CARD_IS_CREDIT:	string;
  CARD_IS_CASHBACK:	Integer;
  CARD_LIMIT:	Double;
  CARD_DISCOUNT:double;
  CARD_CHARGE:	double;
  CARD_IS_ACTIVE:	integer;
  DATE_CREATE:	TDateTime;
  DATE_MODIFY:	TDateTime;
  CARD_REK_CODE:	string;
  CARD_REK_COMP_ID:	SMALLINT;
  CARD_REK_CASH_BACK:	string;
  CARD_REK_CASH_BACK_COMP_ID:	SMALLINT;
  CARD_IS_KRING:	INTEGER;
  CARD_IDENT:	string;

  sSQL: string;

begin
  Result := TStringList.Create;

  sSQL  := 'SELECT *'
          + ' FROM Ref$Credit_Card'
          + ' WHERE (DATE_CREATE > '+ TAppUtils.QuotDT(FLDateImpCrd)
          + ' or DATE_MODIFY > '+ TAppUtils.QuotDT(FLDateImpCrd) + ')'
          + ' and CARD_UNT_ID = '+ IntToStr(FDefUnitID) ;

  {
   with Cnn.cOpenQuery(sSQL) do
   begin
    try
      while not Eof do
      begin
        CARD_ID:= FieldByName('CARD_ID').AsInteger ;
        CARD_UNT_ID:= FieldByName('CARD_UNT_ID').AsInteger ;
        CARD_CODE:= FieldByName('CARD_CODE').asstring;
        CARD_NAME:= FieldByName('CARD_NAME').asstring;
        CARD_IS_CREDIT:= FieldByName('CARD_IS_CREDIT').asstring;
        CARD_IS_CASHBACK:= FieldByName('CARD_IS_CASHBACK').asInteger;
        CARD_LIMIT:= FieldByName('CARD_LIMIT').asfloat;
        CARD_DISCOUNT:= FieldByName('CARD_DISCOUNT').asfloat;
        CARD_CHARGE:= FieldByName('CARD_CHARGE').asfloat;
        CARD_IS_ACTIVE:= FieldByName('CARD_IS_ACTIVE').asinteger;
        DATE_CREATE:= FieldByName('DATE_CREATE').asDateTime;
        DATE_MODIFY:= FieldByName('DATE_MODIFY').asDateTime;
        CARD_REK_CODE:= FieldByName('CARD_REK_CODE').asstring;
        CARD_REK_COMP_ID:= FieldByName('CARD_REK_COMP_ID').asINTeger;
        CARD_REK_CASH_BACK:= FieldByName('CARD_REK_CASH_BACK').asstring;
        CARD_REK_CASH_BACK_COMP_ID:= FieldByName('CARD_REK_CASH_BACK_COMP_ID').asinteger;
        CARD_IS_KRING:= FieldByName('CARD_IS_KRING').asINTEGER;
        CARD_IDENT:= FieldByName('CARD_IDENT').asstring;

        if FieldByName('DATE_CREATE').AsDateTime > FLDateImpCrd  then
        begin
          sSQL := ' insert into Ref$Credit_Card('
                + ' CARD_ID'
                + ' ,CARD_UNT_ID'
                + ' ,CARD_CODE'
                + ' ,CARD_NAME'
                + ' ,CARD_IS_CREDIT'
                + ' ,CARD_IS_CASHBACK'
                + ' ,CARD_LIMIT'
                + ' ,CARD_DISCOUNT'
                + ' ,CARD_CHARGE'
                + ' ,CARD_IS_ACTIVE'
                + ' ,DATE_CREATE'
                + ' ,DATE_MODIFY'
                + ' ,CARD_REK_CODE'
                + ' ,CARD_REK_COMP_ID'
                + ' ,CARD_REK_CASH_BACK'
                + ' ,CARD_REK_CASH_BACK_COMP_ID'
                + ' ,CARD_IS_KRING'
                + ' ,CARD_IDENT)'
                + ' values ('
                + IntToStr(CARD_ID)
                + ',' + IntToStr(CARD_UNT_ID)
                + ',' + quot(CARD_CODE)
                + ',' + quot(CARD_NAME)
                + ',' + quot(CARD_IS_CREDIT)
                + ',' + IntToStr(CARD_IS_CASHBACK)
                + ',' + FloatToStr(CARD_LIMIT)
                + ',' + FloatToStr(CARD_DISCOUNT)
                + ',' + FloatToStr(CARD_CHARGE)
                + ',' + IntToStr(CARD_IS_ACTIVE)
                + ',' + quotdt(DATE_CREATE)
                + ',' + quotdt(DATE_MODIFY)
                + ',' + QUOT(CARD_REK_CODE)
                + ',' + IntToStr(CARD_REK_COMP_ID)
                + ',' + quot(CARD_REK_CASH_BACK)
                + ',' + IntToStr(CARD_REK_CASH_BACK_COMP_ID)
                + ',' + IntToStr(CARD_IS_KRING)
                + ',' + quot(CARD_IDENT)
                + ');';

        end
        else
        begin
          sSQL  := 'update Ref$Credit_Card set '
                + ' CARD_CODE =' + quot(CARD_CODE)
                + ' ,CARD_NAME =' + quot(CARD_NAME)
                + ' ,CARD_IS_CREDIT =' + quot(CARD_IS_CREDIT)
                + ' ,CARD_IS_CASHBACK =' + IntToStr(CARD_IS_CASHBACK)
                + ' ,CARD_LIMIT =' + FloatToStr(CARD_LIMIT)
                + ' ,CARD_DISCOUNT =' + FloatToStr(CARD_DISCOUNT)
                + ' ,CARD_CHARGE =' + FloatToStr(CARD_CHARGE)
                + ' ,CARD_IS_ACTIVE =' + IntToStr(CARD_IS_ACTIVE)
                + ' ,DATE_CREATE =' + quotdt(DATE_CREATE)
                + ' ,DATE_MODIFY =' + quotdt(DATE_MODIFY)
                + ' ,CARD_REK_CODE =' + QUOT(CARD_REK_CODE)
                + ' ,CARD_REK_COMP_ID =' + IntToStr(CARD_REK_COMP_ID)
                + ' ,CARD_REK_CASH_BACK =' + quot(CARD_REK_CASH_BACK)
                + ' ,CARD_REK_CASH_BACK_COMP_ID =' + IntToStr(CARD_REK_CASH_BACK_COMP_ID)
                + ' ,CARD_IS_KRING ='+ IntToStr(CARD_IS_KRING)
                + ' ,CARD_IDENT='  + quot(CARD_IDENT)
                + ' where CARD_ID = '+ IntToStr(CARD_ID)
                + ' and CARD_UNT_ID = '+IntToStr(CARD_UNT_ID)
                + ';';
        end;

          Result.Append(sSQL);
        Next;
      end;
    finally
      Free;
    end;
   end;
   }
end;



function TfrmPosDownlink.GetDataKonversi: TStrings;
var
  KONVSAT_BARCODE: string;
  KONVSAT_SCALE: Double;
  DATE_MODIFY: string;
  DATE_CREATE: string;
  KONVSAT_SAT_CODE_TO: string;
  KONVSAT_SAT_CODE_FROM: string;
  KONVSAT_BRG_CODE: string;
  KONVSAT_ID: Integer;
  sSQL: string;
begin
  Result := TStringList.Create;

  sSQL  := ' select * from REF$KONVERSI_SATUAN'
          + ' WHERE (DATE_CREATE > '+ TAppUtils.QuotDT(FLDateImpHrg)
          + ' or DATE_MODIFY > '+ TAppUtils.QuotDT(FLDateImpHrg) + ')';
  {
  with cnn.cOpenQuery(sSQL) do
  begin
    try
      while not Eof do
      begin
        KONVSAT_ID            := FieldByName('KONVSAT_ID').AsInteger;
        KONVSAT_BRG_CODE      := FieldByName('KONVSAT_BRG_CODE').AsString;
        KONVSAT_SAT_CODE_FROM := FieldByName('KONVSAT_SAT_CODE_FROM').AsString;
        KONVSAT_SAT_CODE_TO   := FieldByName('KONVSAT_SAT_CODE_TO').AsString;
        DATE_CREATE           := FormatDateTime('MM-DD-YYYY hh:mm:ss', FieldByName('DATE_CREATE').AsDateTime);
        DATE_MODIFY           := FormatDateTime('MM-DD-YYYY hh:mm:ss', FieldByName('DATE_MODIFY').AsDateTime);
        KONVSAT_SCALE         := FieldByName('KONVSAT_SCALE').AsFloat;
        KONVSAT_BARCODE       := FieldByName('KONVSAT_BARCODE').AsString;

        if FieldByName('DATE_CREATE').AsDateTime > FLDateImpHrg then
        begin
          sSQL  := 'insert into REF$KONVERSI_SATUAN ('
                + ' KONVSAT_ID, KONVSAT_BRG_CODE,'
                + ' KONVSAT_SAT_CODE_FROM,'
                + ' KONVSAT_SAT_CODE_TO,'
                + ' DATE_CREATE, DATE_MODIFY,'
                + ' KONVSAT_SCALE, KONVSAT_BARCODE) values ('
                + IntToStr(KONVSAT_ID)
                + ', '+ Quot(KONVSAT_BRG_CODE)
                + ', '+ Quot(KONVSAT_SAT_CODE_FROM)
                + ', '+ Quot(KONVSAT_SAT_CODE_TO)
                + ', '+ Quot(DATE_CREATE)
                + ', '+ Quot(DATE_MODIFY)
                + ', '+ FloatToStr(KONVSAT_SCALE)
                + ', '+ Quot(KONVSAT_BARCODE)
                + ');';
        end
        else
        begin
          sSQL := 'Update REF$KONVERSI_SATUAN = set'
              + ' KONVSAT_BRG_CODE = ' + Quot(KONVSAT_BRG_CODE)
              + ' ,KONVSAT_SAT_CODE_FROM = '+ Quot(KONVSAT_SAT_CODE_FROM)
              + ' ,KONVSAT_SCF_UNT_ID = '+ IntToStr(FDefUnitID)
              + ' ,KONVSAT_SAT_CODE_TO = '+ Quot(KONVSAT_SAT_CODE_TO)
              + ' ,DATE_CREATE = '+ Quot(DATE_CREATE)
              + ' ,DATE_MODIFY = '+ Quot(DATE_MODIFY)
              + ' ,KONVSAT_SCALE = '+ FloatToStr(KONVSAT_SCALE)
              + ' ,KONVSAT_BARCODE = '+ Quot(KONVSAT_BARCODE)
              + ' where KONVSAT_ID = '+ IntToStr(KONVSAT_ID)
              + ';';

        end;

        Result.Append(sSQL);

        Next;
      end;
    finally
      Free;
    end;
  end;
  }
end;

function TfrmPosDownlink.GetDataKasir: TStrings;
var
  balance_id  : Integer;
  balance_unt_id : Integer;
  balance_usr_id : Integer;
  balance_usr_unt_id : Integer;
  balance_setuppos_id : Integer;
  balance_setuppos_unt_id : Integer;
  balance_modal : Double;
  balance_shift_id : Integer;
  balance_shift_unt_id : Integer;
  balance_shift_date : string;
  balance_description : string;
  balance_status : string;
  sSQL: string;
begin
  Result := TStringList.Create;


  sSQL  := ' select * from BEGINNING_BALANCE'
          + ' WHERE (DATE_CREATE > '+ TAppUtils.QuotDT(FLDateImpKsr)
          + ' or DATE_MODIFY > '+ TAppUtils.QuotDT(FLDateImpKsr) + ')'
          + ' and BALANCE_UNT_ID = '+ IntToStr(FDefUnitID);
  {
  with cnn.cOpenQuery(sSQL) do
  begin
    try
      while not Eof do
      begin
        balance_id            := FieldByName('BALANCE_ID').AsInteger;
        balance_unt_id        := FieldByName('BALANCE_UNT_ID').AsInteger;
        balance_usr_id        := FieldByName('BALANCE_USR_ID').AsInteger;
        balance_usr_unt_id    := FieldByName('BALANCE_USR_UNT_ID').AsInteger;
        balance_setuppos_id   := FieldByName('BALANCE_SETUPPOS_ID').AsInteger;
        balance_setuppos_unt_id := FieldByName('BALANCE_SETUPPOS_UNT_ID').AsInteger;
        balance_modal         := FieldByName('BALANCE_MODAL').AsFloat;
        balance_shift_id      := FieldByName('BALANCE_SHIFT_ID').AsInteger;
        balance_shift_unt_id  := FieldByName('BALANCE_SHIFT_UNT_ID').AsInteger;
        balance_shift_date    := FormatDateTime('MM-DD-YYYY hh:mm:ss', FieldByName('BALANCE_SHIFT_DATE').AsDateTime);
        balance_description   := FieldByName('balance_description').AsString;
        balance_status        := FieldByName('balance_status').AsString;

//        KONVSAT_ID            := FieldByName('KONVSAT_ID').AsInteger;
//        KONVSAT_BRG_CODE      := FieldByName('KONVSAT_BRG_CODE').AsString;
//        KONVSAT_SAT_CODE_FROM := FieldByName('KONVSAT_SAT_CODE_FROM').AsString;
//        KONVSAT_SAT_CODE_TO   := FieldByName('KONVSAT_SAT_CODE_TO').AsString;
//        DATE_CREATE           := FormatDateTime('MM-DD-YYYY hh:mm:ss', FieldByName('DATE_CREATE').AsDateTime);
//        DATE_MODIFY           := FormatDateTime('MM-DD-YYYY hh:mm:ss', FieldByName('DATE_MODIFY').AsDateTime);
//        KONVSAT_SCALE         := FieldByName('KONVSAT_SCALE').AsFloat;
//        KONVSAT_BARCODE       := FieldByName('KONVSAT_BARCODE').AsString;

        if FieldByName('DATE_CREATE').AsDateTime > FLDateImpKsr then
        begin
          sSQL  := 'insert into BEGINNING_BALANCE ('
                   + ' balance_id,'
                   + '  balance_unt_id,'
                   + '  balance_usr_id,'
                   + '  balance_usr_unt_id,'
                   + '  balance_setuppos_id,'
                   + '  balance_setuppos_unt_id,'
                   + '  balance_modal,'
                   + '  balance_shift_id,'
                   + '  balance_shift_unt_id,'
                   + '  balance_shift_date,'
                   + '  balance_description,'
                   + '  balance_status ) VALUES ('
                + IntToStr(balance_id)
                + ', '+ IntToStr(balance_unt_id)
                + ', '+ IntToStr(balance_usr_id)
                + ', '+ IntToStr(balance_usr_unt_id)
                + ', '+ IntToStr(balance_setuppos_id)
                + ', '+ IntToStr(balance_setuppos_unt_id)
                + ', '+ FloatToStr(balance_modal)
                + ', '+ IntToStr(balance_shift_id)
                + ', '+ IntToStr(balance_shift_unt_id)
                + ', '+ Quot(balance_shift_date)
                + ', '+ Quot(balance_description)
                + ', '+ Quot(balance_status)
                + ');';
        end
        else
        begin
          sSQL := 'Update BEGINNING_BALANCE = set'
              + ' BALANCE_ID = ' + IntToStr(balance_id)
              + ' ,BALANCE_UNT_ID = '+ IntToStr(balance_unt_id)
              + ' ,BALANCE_USR_ID = '+ IntToStr(balance_usr_id)
              + ' ,BALANCE_USR_UNT_ID = '+ IntToStr(balance_usr_unt_id)
              + ' ,BALANCE_SETUPPOS_ID = '+ IntToStr(balance_setuppos_id)
              + ' ,BALANCE_SETUPPOS_UNT_ID = '+ IntToStr(balance_setuppos_unt_id)
              + ' ,BALANCE_MODAL = '+ FloatToStr(balance_modal)
              + ' ,BALANCE_SHIFT_ID = '+ IntToStr(balance_shift_id)
              + ' ,BALANCE_SHIFT_UNT_ID = '+IntToStr(balance_shift_unt_id)
              + ' ,BALANCE_SHIFT_DATE = '+ Quot(balance_shift_date)
              + ' ,BALANCE_DESCRIPTION = '+ Quot(balance_description)
              + ' ,BALANCE_STATUS = '+ Quot(balance_status)
              + ' where balance_id = '+ IntToStr(balance_id)
              + ' balance_UNT_id = '+ IntToStr(FDefUnitID)
              + ';';

        end;

        Result.Append(sSQL);

        Next;
      end;
    finally
      Free;
    end;
  end;
   }

end;

function TfrmPosDownlink.GetSetupPos: TStrings;
var
  SETUPPOS_ID	: INTEGER;
  SETUPPOS_UNT_ID	:INTEGER ;
  SETUPPOS_TERMINAL_CODE : string;
  SETUPPOS_COUNTER_NO	: INTEGER;
  SETUPPOS_NO_TRANSAKSI	: string;
  SETUPPOS_DATE	: string;
  SETUPPOS_IS_ACTIVE	: Integer;
  SETUPPOS_IS_RESET	:integer;
  SETUPPOS_IP  : string;

  sSQL: string;
begin
  Result := TStringList.Create;

  sSQL := 'select *'
          + ' from setuppos'
          + ' where DATE_CREATE > '+ TAppUtils.QuotDT(FLDateImpKsr)
          + ' and setuppos_unt_id = ' + IntToStr(FDefUnitID);
  {
  with cnn.cOpenQuery(sSQL) do
  begin
    try
      while not Eof do
      begin
        SETUPPOS_ID	           := FieldByName('SETUPPOS_ID').AsInteger;
        SETUPPOS_UNT_ID	       := FieldByName('SETUPPOS_UNT_ID').AsInteger;
        SETUPPOS_TERMINAL_CODE :=FieldByName ('SETUPPOS_TERMINAL_CODE').AsString;
        SETUPPOS_COUNTER_NO	   :=fieldbyname ('SETUPPOS_COUNTER_NO').AsInteger;
        SETUPPOS_NO_TRANSAKSI	 :=fieldbyname ('SETUPPOS_NO_TRANSAKSI').AsString;
        SETUPPOS_DATE	         := FormatDateTime('MM-DD-YYYY hh:mm:ss', fieldbyname ('SETUPPOS_DATE').AsDateTime);
        SETUPPOS_IS_ACTIVE	   :=fieldbyname ('SETUPPOS_IS_ACTIVE').Asinteger;
        SETUPPOS_IS_RESET	     :=fieldbyname ('SETUPPOS_IS_RESET').Asinteger;
        SETUPPOS_IP            :=fieldbyname ('SETUPPOS_IP').AsString;


        if FieldByName('DATE_CREATE').AsDateTime > FLDateImpKsr then
        begin
          sSQL  := 'insert into SETUPPOS ('
                    + 'SETUPPOS_ID, '
                    + 'SETUPPOS_UNT_ID,'
                    + 'SETUPPOS_TERMINAL_CODE,'
                    + 'SETUPPOS_COUNTER_NO,'
                    + 'SETUPPOS_NO_TRANSAKSI,'
                    + 'SETUPPOS_DATE,'
                    + 'SETUPPOS_IS_ACTIVE,'
                    + 'SETUPPOS_IS_RESET,'
                    + 'SETUPPOS_IP) VALUES('
                + IntToStr(SETUPPOS_ID)
                + ', '+ IntToStr(SETUPPOS_UNT_ID)
                + ', '+ QUOT(SETUPPOS_TERMINAL_CODE)
                + ', '+ IntToStr(SETUPPOS_COUNTER_NO)
                + ', '+ Quot(SETUPPOS_NO_TRANSAKSI)
                + ', '+ Quot(SETUPPOS_DATE)
                + ', '+ IntToStr(SETUPPOS_IS_ACTIVE)
                + ', '+ IntToStr(SETUPPOS_IS_RESET)
                + ', '+ Quot(SETUPPOS_IP)
                + ');';
        end
        else
        begin
          sSQL := 'Update SETUPPOS set'
                + ' SETUPPOS_ID	=' + IntToStr(SETUPPOS_ID)
                + ',SETUPPOS_UNT_ID	=' + IntToStr(SETUPPOS_UNT_ID)
                + ', SETUPPOS_TERMINAL_CODE =' + QUOT(SETUPPOS_TERMINAL_CODE)
                + ', SETUPPOS_COUNTER_NO	=' + IntToStr(SETUPPOS_COUNTER_NO)
                + ', SETUPPOS_NO_TRANSAKSI =' + Quot(SETUPPOS_NO_TRANSAKSI)
                + ', SETUPPOS_DATE	=' + Quot(SETUPPOS_DATE)
                + ', SETUPPOS_IS_ACTIVE ='+ IntToStr(SETUPPOS_IS_ACTIVE)
                + ', SETUPPOS_IS_RESET	='+ IntToStr(SETUPPOS_IS_RESET)
                + ', SETUPPOS_IP ='+ Quot(SETUPPOS_IP)
                + ';';

        end;

        Result.Append(sSQL);

        Next;
      end;
    finally
      Free;
    end;
  end;

   }
end;

function TfrmPosDownlink.GetDataPlu: TStrings;
var
    aBrgGalonUnt: string;
  aBrgGalon: string;
  S: string;
  aIsGalon: Integer;
  aValidateUserID: Integer;

  aHargaVerage: Double;
  aWidth: string;
  aUOMWeight: string;
  aUOMVolume: string;
  aUOMDiameter: string;
  aSalesOutlet_ID: Integer;
  aTipeBarangID: Integer;
  aNewMerchandizeGroup_ID: Integer;
  aNewMerchadize_ID: Integer;
  aNewLocation_Kode: string;
  aNewBarangPajak_ID: Integer;
  aNama: string;
  aMerk: string;
  aLength: string;
  aUOM: string;
  aKodePurchase: string;
  aKode: string;
  aKategori_ID: Integer;
  aIsValidate: Integer;
  aIsStock: Integer;
  aIsPajakInclude: Integer;
  aIsDiscGMC: Integer;
  aIsDeposit: Integer;
  aIsDecimal: Integer;
  aIsCS: Integer;
  aIsBuild: Integer;
  aIsActive: Integer;
  aHeight: string;

  aExpireTime: Integer;
  aDefaultMarkUP: Double;
  aCatalog: string;
  aAlias: string;
  sSQL: string;
begin
  Result := TStringList.Create;

  sSQL  := 'select * from barang where (DATE_CREATE > '+ TAppUtils.QuotDT(FLDateImpHrg)
          + ' or DATE_MODIFY > '+ TAppUtils.QuotDT(FLDateImpHrg) + ')';
   {
    with cnn.cOpenQuery(sSQL) do
    begin
        while not Eof do
        begin
          aAlias          := FieldByName('BRG_ALIAS').AsString;
          aCatalog        := FieldByName('BRG_CATALOG').AsString;
          aDefaultMarkUP  := FieldByName('BRG_DEFAULT_MARK_UP').AsFloat;
          aExpireTime     := FieldByName('BRG_DEFAULT_MARK_UP').AsInteger;
          aHeight         := FieldByName('BRG_HEIGHT').AsString;
          aIsActive       :=  FieldByName('BRG_IS_ACTIVE').AsInteger;
          aIsBuild        := FieldByName('BRG_IS_BUILD').AsInteger;
          aIsCS           := FieldByName('BRG_IS_CS').AsInteger;
          aIsDecimal      :=FieldByName('BRG_IS_DECIMAL').AsInteger;
          aIsDeposit      :=FieldByName('BRG_IS_DEPOSIT').AsInteger;
          aIsDiscGMC      :=FieldByName('BRG_IS_DISC_GMC').AsInteger;
          aIsGalon        := FieldByName('BRG_IS_GALON').AsInteger;
          aIsPajakInclude :=FieldByName('BRG_IS_PJK_INCLUDE').AsInteger;
          aIsStock        := FieldByName('BRG_IS_STOCK').AsInteger;
          aIsValidate     :=FieldByName('BRG_IS_VALIDATE').AsInteger;
          aKategori_ID    := FieldByName('BRG_KAT_ID').AsInteger;
          aKode           := FieldByName('BRG_CODE').AsString;
          aKodePurchase   := FieldByName('BRG_CODE_PURCHASE').AsString;
          aUOM                := FieldByName('BRG_SAT_CODE_STOCK').AsString;
          aLength             := FieldByName('BRG_LENGTH').AsString;
          aMerk               := FieldByName('BRG_MERK').AsString;
          aNama               := FieldByName('BRG_NAME').Asstring;
          aNewBarangPajak_ID  := FieldByName('BRG_PJK_ID').AsInteger;
          aNewLocation_Kode   := FieldByName('BRG_LOK_CODE').AsString;
          aNewMerchadize_ID   := FieldByName('BRG_MERCHAN_ID').AsInteger;
          aNewMerchandizeGroup_ID := FieldByName('BRG_MERCHANGRUP_ID').AsInteger;
          aSalesOutlet_ID     := FieldByName('BRG_OUTLET_ID').AsInteger;
          aTipeBarangID       := FieldByName('BRG_TPBRG_ID').AsInteger;
          aUOMDiameter        := FieldByName('BRG_UOM_DIAMETER').AsString;
          aUOMVolume          := FieldByName('BRG_UOM_VOLUME').AsString;
          aUOMWeight          := FieldByName('BRG_UOM_WEIGHT').AsString;
          aValidateUserID     := FieldByName('BRG_VALIDATE_USR_ID').AsInteger;
          aWidth              := FieldByName('BRG_WIDTH').AsString;
          aHargaVerage        := FieldByName('BRG_HARGA_AVERAGE').AsFloat;

          if FieldByName('BRG_GALON_CODE').IsNull then
          begin
            aBrgGalon     := 'null';
            aBrgGalonUnt  := 'null';
          end
          else
          begin
            aBrgGalon     := FieldByName('BRG_GALON_CODE').AsString;
            aBrgGalonUnt  := IntToStr(FDefUnitID);
          end;

          if FieldByName('DATE_CREATE').AsDateTime > FLDateImpHrg then //new plu
          begin
            S := 'Insert into Barang' +
                 ' ( BRG_ALIAS , ' +
                 ' BRG_CATALOG , ' +
                 ' BRG_DEFAULT_MARK_UP, BRG_EXPIRE_TIME, ' +
                 ' BRG_HEIGHT , BRG_IS_ACTIVE, ' +
                 ' BRG_IS_BUILD, BRG_IS_CS, ' +
                 ' BRG_IS_DECIMAL,  BRG_IS_DEPOSIT, ' +
                 ' BRG_IS_DISC_GMC, BRG_IS_GALON, ' +
                 ' BRG_IS_PJK_INCLUDE, BRG_IS_STOCK, ' +
                 ' BRG_IS_VALIDATE, BRG_KAT_ID, ' +
                 ' BRG_CODE, ' +
                 ' BRG_CODE_PURCHASE, ' +
                 ' BRG_SAT_CODE_STOCK, ' +
                 ' BRG_LENGTH,' +
                 ' BRG_MERK, ' +
                 ' BRG_NAME, BRG_PJK_ID, ' +
                 ' BRG_LOK_CODE, BRG_MERCHAN_ID, ' +
                 ' BRG_MERCHANGRUP_ID, ' +
                 ' BRG_OUTLET_ID, ' +
                 ' BRG_TPBRG_ID, ' +
                 ' BRG_UOM_DIAMETER, BRG_UOM_VOLUME, ' +
                 ' BRG_UOM_WEIGHT, BRG_VALIDATE_USR_ID, ' +
                 ' BRG_VALIDATE_USR_UNT_ID, BRG_WIDTH, ' +
                 ' BRG_GALON_CODE, ' +
                 ' BRG_HARGA_AVERAGE' +
      //           ' ,SAFETY_STOCK '+
                 ') values ('
                 + Quot(aAlias) + ', '
                 + Quot(aCatalog ) + ','
                 + FormatFloat('0.00', aDefaultMarkUP) + ', '
                 + IntToStr(aExpireTime) + ', '
                 + Quot(aHeight ) + ','
                 + IntToStr(aIsActive) + ', '
                 + IntToStr(aIsBuild) + ', '
                 + IntToStr(aIsCS) + ', '
                 + IntToStr(aIsDecimal) + ', '
                 + IntToStr(aIsDeposit) + ', '
                 + IntToStr(aIsDiscGMC) + ', '
                 + IntToStr(aIsGalon) + ', '
                 + IntToStr(aIsPajakInclude) + ', '
                 + IntToStr(aIsStock) + ', '
                 + IntToStr(aIsValidate) + ', '
                 + InttoStr(aKategori_ID) + ', '
                 + Quot(aKode) + ','
                 + Quot(aKodePurchase) + ','
                 + Quot(aUOM) + ', '   //
                 + Quot(aLength) + ','
                 + Quot(aMerk) + ','
                 + Quot(aNama) + ','
                 + InttoStr(aNewBarangPajak_ID) + ', '
                 + Quot(aNewLocation_Kode) + ', '   //
                 + InttoStr(aNewMerchadize_ID) + ', '
                 + InttoStr(aNewMerchandizeGroup_ID) + ', '
                 + InttoStr(aSalesOutlet_ID) + ', '
                 + IntToStr(aTipeBarangID) + ', '
                 + Quot(aUOMDiameter) + ', '
                 + Quot(aUOMVolume) + ', '
                 + Quot(aUOMWeight) + ', '
                 + IntToStr(aValidateUserID) + ', '
                 + InttoStr(FDefUnitID) + ', '
                 + Quot(aWidth) + ', '
                 + aBrgGalon + ', '
                 + FloatToStr(aHargaVerage)
      //           + ', ' + FloatToStr(SafetyStock)
                  + ');'


          end
          else //update plu
          begin
            S := 'update Barang set'
                + ' BRG_ALIAS = ' +  Quot(aAlias)
                + ' ,BRG_CATALOG = ' + Quot(aCatalog)
                + ' ,BRG_DEFAULT_MARK_UP = ' + FormatFloat('0.00', aDefaultMarkUP)
                + ' ,BRG_EXPIRE_TIME = ' + IntToStr(aExpireTime)
                + ' ,BRG_HEIGHT = '+ Quot(aHeight)
                + ' ,BRG_IS_ACTIVE = ' +  IntToStr(aIsActive)
                + ' ,BRG_IS_BUILD = '+ IntToStr(aIsBuild)
                + ' ,BRG_IS_CS = ' + IntToStr(aIsCS)
                + ' ,BRG_IS_DECIMAL = '+ IntToStr(aIsDecimal)
                + ' ,BRG_IS_DEPOSIT = ' + IntToStr(aIsDeposit)
                + ' ,BRG_IS_DISC_GMC = '+ IntToStr(aIsDiscGMC)
                + ' ,BRG_IS_GALON = ' + IntToStr(aIsGalon)
                + ' ,BRG_IS_PJK_INCLUDE = '+ IntToStr(aIsPajakInclude)
                + ' ,BRG_IS_STOCK = ' + IntToStr(aIsStock)
                + ' ,BRG_IS_VALIDATE = ' + IntToStr(aIsValidate)
                + ' ,BRG_KAT_ID = ' + InttoStr(aKategori_ID)

                + ' ,BRG_CODE_PURCHASE = ' + Quot(aKodePurchase)
                + ' ,BRG_SAT_CODE_STOCK = ' + Quot(aUOM)
                + ' ,BRG_LENGTH = '+ Quot(aLength)
                + ' ,BRG_MERK = ' + Quot(aMerk)
                + ' ,BRG_NAME = ' + Quot(aNama)
                + ' ,BRG_PJK_ID = ' + InttoStr(aNewBarangPajak_ID)
                + ' ,BRG_LOK_CODE = ' + Quot(aNewLocation_Kode)
                + ' ,BRG_MERCHAN_ID = ' + InttoStr(aNewMerchadize_ID)
                + ' ,BRG_MERCHANGRUP_ID = ' + InttoStr(aNewMerchandizeGroup_ID)

                + ' ,BRG_OUTLET_ID = ' + InttoStr(aSalesOutlet_ID)
                + ' ,BRG_TPBRG_ID = ' + IntToStr(aTipeBarangID)
                + ' ,BRG_UOM_DIAMETER = ' + Quot(aUOMDiameter)
                + ' ,BRG_UOM_VOLUME = ' + Quot(aUOMVolume)
                + ' ,BRG_UOM_WEIGHT = ' + Quot(aUOMWeight)
                + ' ,BRG_VALIDATE_USR_ID = ' + IntToStr(aValidateUserID)
                + ' ,BRG_VALIDATE_USR_UNT_ID = '+ InttoStr(FDefUnitID)
                + ' ,BRG_WIDTH = ' + Quot(aWidth)
                + ' ,BRG_GALON_CODE = ' + aBrgGalon
                + ' ,BRG_GALON_UNT_ID = ' + aBrgGalonUnt
                + ' ,BRG_HARGA_AVERAGE = '+ FloatToStr(aHargaVerage)
                + ' where BRG_CODE = ' + Quot(aKode)
                + ';';

          end;

          Result.Append(s);
          Next;
        end;

    end;
    }
end;


procedure TfrmPosDownlink.btnBrowseClick(Sender: TObject);
begin
  if OpDlg.Execute then
  begin
    chkFile.Checked:=True;
    edtFileNm.Text := OpDlg.FileName;
  end;
end;

procedure TfrmPosDownlink.btnCloseClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmPosDownlink.chkDBClick(Sender: TObject);
var
  aBol : Boolean;
begin
  inherited;

  aBol  := chkDB.Checked;

  chkFile.Checked   := not aBol;
  chkDB.Checked  := aBol;

end;

procedure TfrmPosDownlink.chkFileClick(Sender: TObject);
var
  aBol : Boolean;
begin
  inherited;

  aBol  := chkFile.Checked;

  chkDB.Checked   := not aBol;
 // btnOk.Enabled   := not aBol;
  grp1.Enabled    := not aBol;
  chkFile.Checked  := aBol;



end;
procedure TfrmPosDownlink.FormCreate(Sender: TObject);
begin
//  Cnn := TConnection.create(frmMain.FIBServerStore,frmMain.FIBUserStore,frmMain.FIBPasswordStore);
//  try
//     cnn.Connected := True;
//  except
//    on E: EIBInterBaseError do
//    begin
//      CommonDlg.ShowError('Connection failed!.' + #13
//        + 'Please check your configuration again.' + #13
//        +  E.Message);
//    end;
//  end;


end;

procedure TfrmPosDownlink.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action  := caFree;
end;

procedure TfrmPosDownlink.FormDestroy(Sender: TObject);
begin
  frmPosDownlink := nil;
end;

procedure TfrmPosDownlink.chkAllClick(Sender: TObject);
var
  aBol : Boolean;
begin
  aBol := chkAll.Checked;
  chkBarang.Checked := aBol;
  chkKasir.Checked := aBol;
  chkKupon.Checked := aBol;
  chkVoucher.Checked := aBol;
  chkMember.Checked := aBol;
  chkBank.Checked := aBol;
end;

function TfrmPosDownlink.Gettanggal(aType :string): Tdatetime;
var
  sSQL: string;
begin
  {
  Result := cGetServerTime;
  sSQL :=  ' select PRD_DATE from DLINK_PRD WHERE '
         + ' type_down = ' + Quot(aType)
         + ' order by PRD_DATE desc rows 1';
  with cOpenQuery(sSQL) do
  begin
    try
      if not Eof then
      begin
        Result := Fields[0].AsDateTime;
      end;
    finally
      Free;
    end;
  end;
  }
end;


function TfrmPosDownlink.UpdateTglDown (aType : string): TStrings;
var
  sSQL: string;
begin
  Result := TStringList.Create;


  sSQL  := 'insert into DLINK_PRD (PRD_DATE, PRD_UNIT, PRD_POSCODE,TYPE_DOWN) values('
//            + TAppUtils.Quot(FormatDateTime('MM-DD-YYYY hh:mm:ss', cGetServerTime))
            + ', ' + IntToStr(FDefUnitID)
            + ', ' + TAppUtils.Quot(frmMain.FPOSCode)
            + ', ' + TAppUtils.Quot(aType)
            + ')';
        Result.Append(sSQL);
end;

end.

