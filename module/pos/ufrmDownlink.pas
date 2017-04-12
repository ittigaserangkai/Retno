unit ufrmDownlink;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmDownlink = class(TForm)
    btnOk: TButton;
    chkDB: TCheckBox;
    chkFile: TCheckBox;
    edtFileNm: TEdit;
    btnBrowse: TButton;
    btnClose: TButton;
    OpDlg: TOpenDialog;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBrowseClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure chkDBClick(Sender: TObject);
    procedure chkFileClick(Sender: TObject);
  private
    FDefUnitID: Integer;
    FLDateImp : TDateTime;
    function GetDataPlu: TStrings;
    { Private declarations }
  public
    function GetDataJual: TStrings;
    { Public declarations }
  end;

var
  frmDownlink: TfrmDownlink;

implementation
uses
  uRMSUnit, DB, IBQuery, uGTSUICommonDlg;
{$R *.dfm}

procedure TfrmDownlink.btnOkClick(Sender: TObject);
var
  aList : TStrings;
  SS    : TStrings;
begin
  aList := TStringList.Create;
  try
    if chkDB.Checked then
    begin
      SS  := GetDataPlu;
      aList.AddStrings(SS);
      SS.Free;
      SS  := GetDataJual;
      aList.AddStrings(aList);
      SS.Free;

    end
    else if chkFile.Checked then
    begin
      SS.LoadFromFile(edtFileNm.Text);
    end;

    try
      kExecuteSQLs(aList);
    except
      CommonDlg.ShowError('Gagal mengimpor file');
      exit;
    end;

  finally
    aList.Free;
  end;
end;

procedure TfrmDownlink.FormShow(Sender: TObject);
var
  sSQL: string;
begin
  FDefUnitID := StrToInt(getGlobalVar('UNITID'));
  sSQL := 'select PRD_DATE from DLINK_PRD order by PRD_DATE desc rows 1';
  with cOpenQuery(sSQL) do
  begin
    try
      if not Eof then
      begin
        FLDateImp := Fields[0].AsDateTime;
      end;
    finally
      Free;
    end;
  end;      
end;

function TfrmDownlink.GetDataJual: TStrings;
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
          + ' BHJ_SAT_CODE_UNT_ID,'
          + ' BHJ_BRG_CODE,'
          + ' BHJ_BRG_CODE_UNT_ID,'
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
          + ' WHERE (DATE_CREATE > '+ QuotDT(FLDateImp) +' )'
          + ' or (DATE_MODIFY > '+ QuotDT(FLDateImp) + ')' ;

  with cOpenQuery(sSQL) do
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
          DATE_MODIFY := FormatDateTime('MM-DD-YYYY hh:mm:ss', FieldByName('DATE_MODIFY').AsDateTime);

        if FieldByName('BHJ_IS_MAILER').IsNull then
          BHJ_IS_MAILER := 'null'
        else
          BHJ_IS_MAILER         := FieldByName('BHJ_IS_MAILER').AsString;

        if FieldByName('BHJ_MAX_QTY_DISC').IsNull then
          BHJ_MAX_QTY_DISC  := 'null'
        else
          BHJ_MAX_QTY_DISC      := FieldByName('BHJ_MAX_QTY_DISC').AsString;

        if FieldByName('BHJ_MAILER_END_DATE').IsNull then
          BHJ_MAILER_END_DATE := 'null'
        else
          BHJ_MAILER_END_DATE   := FormatDateTime('MM-DD-YYYY hh:mm:ss', FieldByName('BHJ_MAILER_END_DATE').AsDateTime);

        BHJ_LAST_SELL_PRICE   := FieldByName('BHJ_LAST_SELL_PRICE').AsFloat;

        if FieldByName('DATE_CREATE').AsDateTime > FLDateImp then
        begin
          sSQL := 'insert into barang_harga_jual (BHJ_ID, BHJ_UNT_ID,'
                + ' BHJ_SAT_CODE, BHJ_SAT_CODE_UNT_ID, BHJ_BRG_CODE,'
                + ' BHJ_BRG_CODE_UNT_ID, BHJ_TPHRG_ID, BHJ_TPHRG_UNT_ID,'
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
                + ', ' + IntToStr(FDefUnitID)
                + ', ' + Quot(BHJ_BRG_CODE)
                + ', ' + IntToStr(FDefUnitID)
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
                + ', ' + Quot(DATE_MODIFY)
                + ', ' + Quot(BHJ_IS_MAILER)
                + ', ' + Quot(BHJ_MAX_QTY_DISC)
                + ', ' + Quot(BHJ_MAILER_END_DATE)
                + ', ' + FloatToStr(BHJ_LAST_SELL_PRICE)
                + ');';

        end
        else
        begin
          sSQL  := 'update barang_harga_jual set '
                + ' BHJ_SAT_CODE = '+ Quot(BHJ_SAT_CODE)
                + ' BHJ_SAT_CODE_UNT_ID = '+ IntToStr(FDefUnitID)
                + ' BHJ_BRG_CODE = '+ Quot(BHJ_BRG_CODE)
                + ' BHJ_BRG_CODE_UNT_ID = '+IntToStr(FDefUnitID)
                + ' BHJ_TPHRG_ID = '+ IntToStr(BHJ_TPHRG_ID)
                + ' BHJ_TPHRG_UNT_ID = '+IntToStr(FDefUnitID)
                + ' BHJ_SELL_PRICE = '+ FloatToStr(BHJ_SELL_PRICE)
                + ' BHJ_DISC_PERSEN = '+ FloatToStr(BHJ_DISC_PERSEN)
                + ' BHJ_DISC_NOMINAL = '+ FloatToStr(BHJ_DISC_NOMINAL)
                + ' BHJ_SELL_PRICE_DISC = '+ FloatToStr(BHJ_SELL_PRICE_DISC)
                + ' BHJ_SELL_PRICE_CORET = '+ FloatToStr(BHJ_SELL_PRICE_CORET)
                + ' BHJ_MARK_UP = '+ FloatToStr(BHJ_MARK_UP)
                + ' BHJ_IS_LIMIT_QTY = '+ FloatToStr(BHJ_LIMIT_QTY)
                + ' BHJ_IS_QTY_SUBSIDY = '+ IntToStr(BHJ_IS_QTY_SUBSIDY)
                + ' BHJ_LIMIT_QTY = '+ FloatToStr(BHJ_LIMIT_QTY)
                + ' BHJ_LIMIT_QTY_PRICE = '+ FloatToStr(BHJ_LIMIT_QTY_PRICE)
                + ' BHJ_QTY_SUBSIDY = '+ FloatToStr(BHJ_QTY_SUBSIDY)
                + ' BHJ_QTY_SUBSIDY_PRICE = '+ FloatToStr(BHJ_QTY_SUBSIDY_PRICE)
                + ' BHJ_CONV_VALUE = '+ FloatToStr(BHJ_CONV_VALUE)
                + ' DATE_CREATE = '+ Quot(DATE_CREATE)
                + ' DATE_MODIFY = '+ Quot(DATE_MODIFY)
                + ' BHJ_IS_MAILER = '+ Quot(BHJ_IS_MAILER)
                + ' BHJ_MAX_QTY_DISC = '+ Quot(BHJ_MAX_QTY_DISC)
                + ' BHJ_MAILER_END_DATE = '+ Quot(BHJ_MAILER_END_DATE)
                + ' BHJ_LAST_SELL_PRICE = '+ FloatToStr(BHJ_LAST_SELL_PRICE)
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
end;

procedure TfrmDownlink.btnBrowseClick(Sender: TObject);
begin
  if OpDlg.Execute then
  begin
    edtFileNm.Text := OpDlg.FileName;
  end;
end;

procedure TfrmDownlink.btnCloseClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmDownlink.chkDBClick(Sender: TObject);
var
  aBol : Boolean;
begin
  inherited;

  aBol  := chkDB.Checked;

  chkFile.Checked   := not aBol;
  chkDB.Checked  := aBol;

end;

procedure TfrmDownlink.chkFileClick(Sender: TObject);
var
  aBol : Boolean;
begin
  inherited;

  aBol  := chkFile.Checked;

  chkDB.Checked   := not aBol;
  chkFile.Checked  := aBol;

end;

function TfrmDownlink.GetDataPlu: TStrings;
var
    aBrgGalonUnt: string;
  aBrgGalon: string;
  S: string;
  aIsGalon: Integer;
  aValidateUserID: Integer;

  aIsBasic: Integer;
  aSafetySTStock: Double;
  aIsHo: Boolean;
  aPubsId: string;
  aAuthorId: string;
  aBrgGalonCode: string;
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

  sSQL  := 'select * from barang where (DATE_CREATE > '+ QuotDT(FLDateImp) +' )'
          + ' or (DATE_MODIFY > '+ QuotDT(FLDateImp) + ')' ;

    with cOpenQuery(sSQL) do
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

//          aAuthorId := FieldByName('BRG_IS_BUILD').AsString;
//          aPubsId := FieldByName('BRG_IS_BUILD').AsString;
//          aIsHo := False;
//          aSafetySTStock := FieldByName('BRG_IS_BUILD').AsFloat;
//          aIsBasic := FieldByName('BRG_IS_BUILD').AsInteger;

          if FieldByName('DATE_CREATE').AsDateTime > FLDateImp then //new plu
          begin
            S := 'Insert into Barang' +
                 ' ( BRG_ALIAS , ' +
                 ' BRG_PJK_UNT_ID , BRG_CATALOG , ' +
                 ' BRG_DEFAULT_MARK_UP, BRG_EXPIRE_TIME, ' +
                 ' BRG_HEIGHT , BRG_IS_ACTIVE, ' +
                 ' BRG_IS_BUILD, BRG_IS_CS, ' +
                 ' BRG_IS_DECIMAL,  BRG_IS_DEPOSIT, ' +
                 ' BRG_IS_DISC_GMC, BRG_IS_GALON, ' +
                 ' BRG_IS_PJK_INCLUDE, BRG_IS_STOCK, ' +
                 ' BRG_IS_VALIDATE, BRG_KAT_ID, ' +
                 ' BRG_KAT_UNT_ID, BRG_CODE, ' +
                 ' BRG_CODE_PURCHASE, BRG_CODE_PURCH_UNT_ID, ' +
                 ' BRG_SAT_CODE_STOCK, BRG_SAT_UNT_ID, ' +
                 ' BRG_LENGTH, BRG_LOK_UNT_ID, ' +
                 ' BRG_MERCHAN_UNT_ID, BRG_MERK, ' +
                 ' BRG_NAME, BRG_PJK_ID, ' +
                 ' BRG_LOK_CODE, BRG_MERCHAN_ID, ' +
                 ' BRG_MERCHANGRUP_ID, BRG_UNT_ID, ' +
                 ' BRG_OUTLET_ID, BRG_OUTLET_UNT_ID, ' +
                 ' BRG_TPBRG_ID, BRG_TPBRG_UNT_ID, ' +
                 ' BRG_UOM_DIAMETER, BRG_UOM_VOLUME, ' +
                 ' BRG_UOM_WEIGHT, BRG_VALIDATE_USR_ID, ' +
                 ' BRG_VALIDATE_USR_UNT_ID, BRG_WIDTH, ' +
                 ' BRG_GALON_CODE, BRG_GALON_UNT_ID,' +
                 ' BRG_HARGA_AVERAGE, BRG_MG_UNT_ID' +
      //           ' ,SAFETY_STOCK '+
                 ') values ('
                 + Quot(aAlias) + ', '
                 + InttoStr(FDefUnitID) + ', '
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
                 + InttoStr(FDefUnitID) + ', '
                 + Quot(aKode) + ','
                 + Quot(aKodePurchase) + ','
                 + InttoStr(FDefUnitID) + ', '
                 + Quot(aUOM) + ', '   //
                 + InttoStr(FDefUnitID) + ', ' //
                 + Quot(aLength) + ','
                 + InttoStr(FDefUnitID) + ', '
                 + InttoStr(FDefUnitID) + ', '
                 + Quot(aMerk) + ','
                 + Quot(aNama) + ','
                 + InttoStr(aNewBarangPajak_ID) + ', '
                 + Quot(aNewLocation_Kode) + ', '   //
                 + InttoStr(aNewMerchadize_ID) + ', '
                 + InttoStr(aNewMerchandizeGroup_ID) + ', '
                 + InttoStr(FDefUnitID) + ', '
                 + InttoStr(aSalesOutlet_ID) + ', '
                 + InttoStr(FDefUnitID) + ', '
                 + IntToStr(aTipeBarangID) + ', '
                 + InttoStr(FDefUnitID) + ', '
                 + Quot(aUOMDiameter) + ', '
                 + Quot(aUOMVolume) + ', '
                 + Quot(aUOMWeight) + ', '
                 + IntToStr(aValidateUserID) + ', '
                 + InttoStr(FDefUnitID) + ', '
                 + Quot(aWidth) + ', '
                 + aBrgGalon + ', '
                 + aBrgGalonUnt + ', '
                 + FloatToStr(aHargaVerage) + ','
                 + IntToStr(FDefUnitID)
      //           + ', ' + FloatToStr(SafetyStock)
                  + ');'


          end
          else //update plu
          begin
            S := 'update table Barang set'
                + ' BRG_ALIAS = ' +  Quot(aAlias)
                + ' BRG_PJK_UNT_ID = '+ InttoStr(FDefUnitID)
                + ' BRG_CATALOG = ' + Quot(aCatalog)
                + ' BRG_DEFAULT_MARK_UP = ' + FormatFloat('0.00', aDefaultMarkUP)
                + ' BRG_EXPIRE_TIME = ' + IntToStr(aExpireTime)
                + ' BRG_HEIGHT = '+ Quot(aHeight)
                + ' BRG_IS_ACTIVE = ' +  IntToStr(aIsActive)
                + ' BRG_IS_BUILD = '+ IntToStr(aIsBuild)
                + ' BRG_IS_CS = ' + IntToStr(aIsCS)
                + ' BRG_IS_DECIMAL = '+ IntToStr(aIsDecimal)
                + ' BRG_IS_DEPOSIT = ' + IntToStr(aIsDeposit)
                + ' BRG_IS_DISC_GMC = '+ IntToStr(aIsDiscGMC)
                + ' BRG_IS_GALON = ' + IntToStr(aIsGalon)
                + ' BRG_IS_PJK_INCLUDE = '+ IntToStr(aIsPajakInclude)
                + ' BRG_IS_STOCK = ' + IntToStr(aIsStock)
                + ' BRG_IS_VALIDATE = ' + IntToStr(aIsValidate)
                + ' BRG_KAT_ID = ' + InttoStr(aKategori_ID)
                + ' BRG_KAT_UNT_ID = ' + InttoStr(FDefUnitID)

                + ' BRG_CODE_PURCHASE = ' + Quot(aKodePurchase)
                + ' BRG_CODE_PURCH_UNT_ID = ' + InttoStr(FDefUnitID)
                + ' BRG_SAT_CODE_STOCK = ' + Quot(aUOM)
                + ' BRG_SAT_UNT_ID = ' + InttoStr(FDefUnitID)
                + ' BRG_LENGTH = '+ Quot(aLength)
                + ' BRG_LOK_UNT_ID = ' + InttoStr(FDefUnitID)
                + ' BRG_MERCHAN_UNT_ID = '+ InttoStr(FDefUnitID)
                + ' BRG_MERK = ' + Quot(aMerk)
                + ' BRG_NAME = ' + Quot(aNama)
                + ' BRG_PJK_ID = ' + InttoStr(aNewBarangPajak_ID)
                + ' BRG_LOK_CODE = ' + Quot(aNewLocation_Kode)
                + ' BRG_MERCHAN_ID = ' + InttoStr(aNewMerchadize_ID)
                + ' BRG_MERCHANGRUP_ID = ' + InttoStr(aNewMerchandizeGroup_ID)

                + ' BRG_OUTLET_ID = ' + InttoStr(aSalesOutlet_ID)
                + ' BRG_OUTLET_UNT_ID = ' + InttoStr(FDefUnitID)
                + ' BRG_TPBRG_ID = ' + IntToStr(aTipeBarangID)
                + ' BRG_TPBRG_UNT_ID = ' + InttoStr(FDefUnitID)
                + ' BRG_UOM_DIAMETER = ' + Quot(aUOMDiameter)
                + ' BRG_UOM_VOLUME = ' + Quot(aUOMVolume)
                + ' BRG_UOM_WEIGHT = ' + Quot(aUOMWeight)
                + ' BRG_VALIDATE_USR_ID = ' + IntToStr(aValidateUserID)
                + ' BRG_VALIDATE_USR_UNT_ID = '+ InttoStr(FDefUnitID)
                + ' BRG_WIDTH = ' + Quot(aWidth)
                + ' BRG_GALON_CODE = ' + aBrgGalon
                + ' BRG_GALON_UNT_ID = ' + aBrgGalonUnt
                + ' BRG_HARGA_AVERAGE = '+ FloatToStr(aHargaVerage)
                + ' BRG_MG_UNT_ID = '+ IntToStr(FDefUnitID)
                + ' where BRG_CODE = ' + Quot(aKode)
                + ' and BRG_UNT_ID = ' + InttoStr(FDefUnitID)
                + ';';

          end;    

          Result.Append(sSQL);
          Next;
        end;

    end;
end;

end.
