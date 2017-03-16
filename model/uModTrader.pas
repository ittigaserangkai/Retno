unit uModTrader;

interface
uses uModApp, uModTipePerusahaan;
type
  TModRefDiscTrader = class;
  TModRefTipeTrader = Class;
  TModRefTraderPlafon = Class;
  TModTrader = class(TModApp)
  private
    FMEMBER_KELUARGA: TModMemberKeluarga;
    FRefDiscMember: TModRefTipeTrader;
    FRefGrupMember: TModRefTraderPlafon;
    FMEMBER_CARD_NO: String;
    FMEMBER_AGAMA_ID: Integer;
    FMEMBER_ADDRESS: String;
    FMEMBER_ADDRESS1: String;
    FMEMBER_TPMEMBER_ID: Integer;
    FMEMBER_IS_ACTIVE: Integer;
    FMEMBER_IS_VALID: Integer;
    FMEMBER_GROMEMBER_UNT_ID: Integer;
    FMEMBER_GROMEMBER_ID: Integer;
    FMEMBER_REGISTERED_DATE: TDateTime;
    FMEMBER_IS_MAIN: Integer;
    FMEMBER_IS_MARRIED: Integer;
    FMEMBER_TELP: String;
    FMEMBER_PENDAPATAN: Double;
    FMEMBER_KOTA: String;
    FMEMBER_KECAMATAN: String;
    FMEMBER_KELURAHAN: String;
    FMEMBER_NAME: String;
    FMEMBER_KTP_NO: string;
    FMEMBER_SEX: Integer;
    FMEMBER_IS_WNI: integer;
    FMEMBER_PLACE_OF_BIRTH: Integer;
    FMEMBER_DATE_OF_BIRTH: TDateTime;
    FMEMBER_RT: String;
    FMEMBER_POST_CODE: String;
    FMEMBER_JML_TANGGUNGAN: String;
    FMEMBER_RW: String;
  public
    class function GetTableName: String; override;
  published
    property MEMBER_KELUARGA: TModMemberKeluarga read FMEMBER_KELUARGA write
        FMEMBER_KELUARGA;
    [AttributeOfForeign('REF$DISC_MEMBER_ID')]
    property RefDiscMember: TModRefTipeTrader read FRefDiscMember write
        FRefDiscMember;
    [AttributeOfForeign('REF$GRUP_MEMBER_ID')]
    property RefGrupMember: TModRefTraderPlafon read FRefGrupMember write
        FRefGrupMember;
    property MEMBER_CARD_NO: String read FMEMBER_CARD_NO write FMEMBER_CARD_NO;
    property MEMBER_AGAMA_ID: Integer read FMEMBER_AGAMA_ID write FMEMBER_AGAMA_ID;
    property MEMBER_ADDRESS: String read FMEMBER_ADDRESS write FMEMBER_ADDRESS;
    property MEMBER_ADDRESS1: String read FMEMBER_ADDRESS1 write FMEMBER_ADDRESS1;
    property MEMBER_TPMEMBER_ID: Integer read FMEMBER_TPMEMBER_ID write
        FMEMBER_TPMEMBER_ID;
    property MEMBER_IS_ACTIVE: Integer read FMEMBER_IS_ACTIVE write
        FMEMBER_IS_ACTIVE;
    property MEMBER_IS_VALID: Integer read FMEMBER_IS_VALID write FMEMBER_IS_VALID;
    property MEMBER_GROMEMBER_UNT_ID: Integer read FMEMBER_GROMEMBER_UNT_ID write
        FMEMBER_GROMEMBER_UNT_ID;
    property MEMBER_GROMEMBER_ID: Integer read FMEMBER_GROMEMBER_ID write
        FMEMBER_GROMEMBER_ID;
    property MEMBER_REGISTERED_DATE: TDateTime read FMEMBER_REGISTERED_DATE write
        FMEMBER_REGISTERED_DATE;
    property MEMBER_IS_MAIN: Integer read FMEMBER_IS_MAIN write FMEMBER_IS_MAIN;
    property MEMBER_IS_MARRIED: Integer read FMEMBER_IS_MARRIED write
        FMEMBER_IS_MARRIED;
    property MEMBER_TELP: String read FMEMBER_TELP write FMEMBER_TELP;
    property MEMBER_PENDAPATAN: Double read FMEMBER_PENDAPATAN write
        FMEMBER_PENDAPATAN;
    property MEMBER_KOTA: String read FMEMBER_KOTA write FMEMBER_KOTA;
    property MEMBER_KECAMATAN: String read FMEMBER_KECAMATAN write
        FMEMBER_KECAMATAN;
    property MEMBER_KELURAHAN: String read FMEMBER_KELURAHAN write
        FMEMBER_KELURAHAN;
    property MEMBER_NAME: String read FMEMBER_NAME write FMEMBER_NAME;
    property MEMBER_KTP_NO: string read FMEMBER_KTP_NO write FMEMBER_KTP_NO;
    property MEMBER_SEX: Integer read FMEMBER_SEX write FMEMBER_SEX;
    property MEMBER_IS_WNI: integer read FMEMBER_IS_WNI write FMEMBER_IS_WNI;
    property MEMBER_PLACE_OF_BIRTH: Integer read FMEMBER_PLACE_OF_BIRTH write
        FMEMBER_PLACE_OF_BIRTH;
    property MEMBER_DATE_OF_BIRTH: TDateTime read FMEMBER_DATE_OF_BIRTH write
        FMEMBER_DATE_OF_BIRTH;
    property MEMBER_RT: String read FMEMBER_RT write FMEMBER_RT;
    property MEMBER_POST_CODE: String read FMEMBER_POST_CODE write
        FMEMBER_POST_CODE;
    property MEMBER_JML_TANGGUNGAN: String read FMEMBER_JML_TANGGUNGAN write
        FMEMBER_JML_TANGGUNGAN;
    property MEMBER_RW: String read FMEMBER_RW write FMEMBER_RW;
  end;


  TModRefTipeTrader = class(TModApp)
  private
    FDISCMEMBER_BEGIN_VALUE: Double;
    FDISCMEMBER_END_VALUE: Double;
    FDISCMEMBER_DISCOUNT: Double;
  public
    class function GetTableName: String; override;
  published
    property DISCMEMBER_BEGIN_VALUE: Double read FDISCMEMBER_BEGIN_VALUE write
        FDISCMEMBER_BEGIN_VALUE;
    property DISCMEMBER_END_VALUE: Double read FDISCMEMBER_END_VALUE write
        FDISCMEMBER_END_VALUE;
    property DISCMEMBER_DISCOUNT: Double read FDISCMEMBER_DISCOUNT write
        FDISCMEMBER_DISCOUNT;
  end;

  TModRefTraderPlafon = class(TModApp)
  private
    FGROMEMBER_NAME: String;
    FGROMEMBER_DOC_ID: Integer;
    FGROMEMBER_IDENTITY_NO: String;
    FGROMEMBER_ADDRESS: String;
    FGROMEMBER_KELURAHAN: String;
    FGROMEMBER_KOTA: String;
    FGROMEMBER_KODE_POS: String;
    FGROMEMBER_TELP: String;
    FGROMEMBER_NPWP: String;
    FGROMEMBER_NO_FAX: String;
    FGROMEMBER_IS_COMPLETE: Integer;
    FRefTipePerusahaan: TModTipePerusahaan;
  public
    class function GetTableName: String; override;
  published
    property GROMEMBER_NAME: String read FGROMEMBER_NAME write FGROMEMBER_NAME;
    property GROMEMBER_DOC_ID: Integer read FGROMEMBER_DOC_ID write
        FGROMEMBER_DOC_ID;
    property GROMEMBER_IDENTITY_NO: String read FGROMEMBER_IDENTITY_NO write
        FGROMEMBER_IDENTITY_NO;
    property GROMEMBER_ADDRESS: String read FGROMEMBER_ADDRESS write
        FGROMEMBER_ADDRESS;
    property GROMEMBER_KELURAHAN: String read FGROMEMBER_KELURAHAN write
        FGROMEMBER_KELURAHAN;
    property GROMEMBER_KOTA: String read FGROMEMBER_KOTA write FGROMEMBER_KOTA;
    property GROMEMBER_KODE_POS: String read FGROMEMBER_KODE_POS write
        FGROMEMBER_KODE_POS;
    property GROMEMBER_TELP: String read FGROMEMBER_TELP write FGROMEMBER_TELP;
    property GROMEMBER_NPWP: String read FGROMEMBER_NPWP write FGROMEMBER_NPWP;
    property GROMEMBER_NO_FAX: String read FGROMEMBER_NO_FAX write
        FGROMEMBER_NO_FAX;
    property GROMEMBER_IS_COMPLETE: Integer read FGROMEMBER_IS_COMPLETE write
        FGROMEMBER_IS_COMPLETE;
    [AttributeOfForeign('REF$TIPE_PERUSAHAAN_ID')]
    property RefTipePerusahaan: TModTipePerusahaan read FRefTipePerusahaan write
        FRefTipePerusahaan;
  end;

type
  TModRefDiscTrader = class(TModApp)
  private
    FDISCMEMBER_BEGIN_VALUE: Double;
    FDISCMEMBER_END_VALUE: Double;
    FDISCMEMBER_DISCOUNT: Double;
  public
    class function GetTableName: String; override;
  published
    property DISCMEMBER_BEGIN_VALUE: Double read FDISCMEMBER_BEGIN_VALUE write
        FDISCMEMBER_BEGIN_VALUE;
    property DISCMEMBER_END_VALUE: Double read FDISCMEMBER_END_VALUE write
        FDISCMEMBER_END_VALUE;
    property DISCMEMBER_DISCOUNT: Double read FDISCMEMBER_DISCOUNT write
        FDISCMEMBER_DISCOUNT;
  end;

implementation

class function TModTrader.GetTableName: String;
begin
  Result := 'MEMBER';
end;

class function TModRefTipeTrader.GetTableName: String;
begin
  Result := 'REF$DISC_MEMBER';
end;

class function TModRefTraderPlafon.GetTableName: String;
begin
  Result := 'REF$GRUP_MEMBER';
end;

class function TModRefDiscTrader.GetTableName: String;
begin
  Result := 'REF$DISC_MEMBER';
end;

initialization
  TModTrader.RegisterRTTI;
  TModRefDiscTrader.RegisterRTTI;
  TModRefTipeTrader.RegisterRTTI;
  TModRefTraderPlafon.RegisterRTTI;
end.
