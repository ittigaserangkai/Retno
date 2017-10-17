unit uModTransKuponBotol;

interface

uses
  uModApp, uModUnit, uModMember, uModSatuan, System.Generics.Collections,
  uModBarang;

type
  TModTransKuponBotolDetil = class;
  TModTransKuponBotol = class(TModApp)
  private
    FAUTUNIT: TModUnit;
    FKuponBotolDetils: TobjectList<TModTransKuponBotolDetil>;
    FMEMBER: TModMember;
    FTKB_DATE: TDateTime;
    FTKB_DESCRIPTION: string;
    FTKB_INC: Integer;
    FTKB_IS_JURNAL: Integer;
    FTKB_IS_PRINTED: Integer;
    FTKB_NO: string;
    FTKB_POS_TRANS_NO: string;
    FTKB_QTY: Double;
    FTKB_SELL_PRICE_DISC: Double;
    FTKB_STATUS: string;
    function GetKuponBotolDetils: TobjectList<TModTransKuponBotolDetil>;
  public
    class function GetTableName: String; override;
    property KuponBotolDetils: TobjectList<TModTransKuponBotolDetil> read
        GetKuponBotolDetils write FKuponBotolDetils;
  published
    [AttributeOfForeign('AUT$UNIT_ID')]
    property AUTUNIT: TModUnit read FAUTUNIT write FAUTUNIT;
    [AttributeOfForeign('MEMBER_ID')]
    property MEMBER: TModMember read FMEMBER write FMEMBER;
    property TKB_DATE: TDateTime read FTKB_DATE write FTKB_DATE;
    property TKB_DESCRIPTION: string read FTKB_DESCRIPTION write FTKB_DESCRIPTION;
    property TKB_INC: Integer read FTKB_INC write FTKB_INC;
    property TKB_IS_JURNAL: Integer read FTKB_IS_JURNAL write FTKB_IS_JURNAL;
    property TKB_IS_PRINTED: Integer read FTKB_IS_PRINTED write FTKB_IS_PRINTED;
    [AttributeOfCode]
    property TKB_NO: string read FTKB_NO write FTKB_NO;
    property TKB_POS_TRANS_NO: string read FTKB_POS_TRANS_NO write
        FTKB_POS_TRANS_NO;
    property TKB_QTY: Double read FTKB_QTY write FTKB_QTY;
    property TKB_SELL_PRICE_DISC: Double read FTKB_SELL_PRICE_DISC write
        FTKB_SELL_PRICE_DISC;
    property TKB_STATUS: string read FTKB_STATUS write FTKB_STATUS;
  end;

  TModTransKuponBotolDetil = class(TModApp)
  private
    FBARANG: TModBarang;
    FSATUAN: TModSatuan;
    FTKBD_DISC: Double;
    FTKBD_QTY: Double;
    FTKBD_SELL_PRICE: Double;
    FTKBD_SELL_PRICE_DISC: Double;
    FTKBD_TOTAL_SELL_PRICE_DISC: Double;
    FTransKuponBotol: TModTransKuponBotol;
  public
    class function GetTableName: String; override;
  published
    [AttributeOfForeign('BARANG_ID')]
    property BARANG: TModBarang read FBARANG write FBARANG;
    [AttributeOfForeign('REF$SATUAN_ID')]
    property SATUAN: TModSatuan read FSATUAN write FSATUAN;
    property TKBD_DISC: Double read FTKBD_DISC write FTKBD_DISC;
    property TKBD_QTY: Double read FTKBD_QTY write FTKBD_QTY;
    property TKBD_SELL_PRICE: Double read FTKBD_SELL_PRICE write FTKBD_SELL_PRICE;
    property TKBD_SELL_PRICE_DISC: Double read FTKBD_SELL_PRICE_DISC write
        FTKBD_SELL_PRICE_DISC;
    property TKBD_TOTAL_SELL_PRICE_DISC: Double read FTKBD_TOTAL_SELL_PRICE_DISC
        write FTKBD_TOTAL_SELL_PRICE_DISC;
    [AttributeOfHeader('TRANS_KUPON_BOTOL_ID')]
    property TransKuponBotol: TModTransKuponBotol read FTransKuponBotol write
        FTransKuponBotol;
  end;

implementation

function TModTransKuponBotol.GetKuponBotolDetils:
    TobjectList<TModTransKuponBotolDetil>;
begin
  if FKuponBotolDetils = nil then
    FKuponBotolDetils := TObjectList<TModTransKuponBotolDetil>.Create();

  Result := FKuponBotolDetils;
end;

class function TModTransKuponBotol.GetTableName: String;
begin
  Result := 'TRANS_KUPON_BOTOL';
end;

class function TModTransKuponBotolDetil.GetTableName: String;
begin
  Result := 'TRANS_KUPON_BOTOL_DETIL';
end;

initialization
  TModTransKuponBotol.RegisterRTTI;
  TModTransKuponBotolDetil.RegisterRTTI;

end.
