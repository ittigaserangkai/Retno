unit uModMember;

interface
uses uModApp, uModTipePerusahaan, uModRefAgama, uModTipePembayaran;
type
  TModMemberActivasi = class;
  TModMemberKeluarga = Class;
  TModRefDiscMember = Class;
  TModRefGrupMember = Class;
  TModRefTipeMember = Class;
  TModMember = class(TModApp)
  private
    FMEMBER_ACTIVASI: TModMemberActivasi;
    FMEMBER_KELUARGA: TModMemberKeluarga;
    FRefDiscMember: TModRefDiscMember;
    FRefGrupMember: TModRefGrupMember;
    FMEMBER_CARD_NO: String;
    FMEMBER_AGAMA: TModRefAgama;
    FMEMBER_ADDRESS: String;
    FMEMBER_TIPE_BAYAR: TModTipePembayaran;
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
    FMEMBER_PLACE_OF_BIRTH: string;
    FMEMBER_DATE_OF_BIRTH: TDateTime;
    FIS_TRADER: Integer;
    FMEMBER_POIN: Integer;
    FMEMBER_RT: String;
    FMEMBER_POST_CODE: String;
    FMEMBER_JML_TANGGUNGAN: Integer;
    FMEMBER_RW: String;
    FMEMBER_PLAFON: Double;
    FMEMBER_LEAD_TIME: Integer;
    FMEMBER_TOP: Integer;
    FRefTipeMember: TModRefTipeMember;
  public
    class function GetTableName: String; override;
  published
    property MEMBER_ACTIVASI: TModMemberActivasi read FMEMBER_ACTIVASI write
        FMEMBER_ACTIVASI;
    property MEMBER_KELUARGA: TModMemberKeluarga read FMEMBER_KELUARGA write
        FMEMBER_KELUARGA;
    [AttributeOfForeign('REF$DISC_MEMBER_ID')]
    property RefDiscMember: TModRefDiscMember read FRefDiscMember write
        FRefDiscMember;
    [AttributeOfForeign('REF$GRUP_MEMBER_ID')]
    property RefGrupMember: TModRefGrupMember read FRefGrupMember write
        FRefGrupMember;
    [AttributeOfCode]
    property MEMBER_CARD_NO: String read FMEMBER_CARD_NO write FMEMBER_CARD_NO;
    [AttributeOfForeign('REF$AGAMA_ID')]
    property MEMBER_AGAMA: TModRefAgama read FMEMBER_AGAMA write FMEMBER_AGAMA;
    property MEMBER_ADDRESS: String read FMEMBER_ADDRESS write FMEMBER_ADDRESS;
    [AttributeOfForeign('REF$TIPE_PEMBAYARAN_ID')]
    property MEMBER_TIPE_BAYAR: TModTipePembayaran read FMEMBER_TIPE_BAYAR write
        FMEMBER_TIPE_BAYAR;
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
    property MEMBER_PLACE_OF_BIRTH: string read FMEMBER_PLACE_OF_BIRTH write
        FMEMBER_PLACE_OF_BIRTH;
    property MEMBER_DATE_OF_BIRTH: TDateTime read FMEMBER_DATE_OF_BIRTH write
        FMEMBER_DATE_OF_BIRTH;
    property IS_TRADER: Integer read FIS_TRADER write FIS_TRADER;
    property MEMBER_POIN: Integer read FMEMBER_POIN write FMEMBER_POIN;
    property MEMBER_RT: String read FMEMBER_RT write FMEMBER_RT;
    property MEMBER_POST_CODE: String read FMEMBER_POST_CODE write
        FMEMBER_POST_CODE;
    property MEMBER_JML_TANGGUNGAN: Integer read FMEMBER_JML_TANGGUNGAN write
        FMEMBER_JML_TANGGUNGAN;
    property MEMBER_RW: String read FMEMBER_RW write FMEMBER_RW;
    property MEMBER_PLAFON: Double read FMEMBER_PLAFON write FMEMBER_PLAFON;
    property MEMBER_LEAD_TIME: Integer read FMEMBER_LEAD_TIME write
        FMEMBER_LEAD_TIME;
    property MEMBER_TOP: Integer read FMEMBER_TOP write FMEMBER_TOP;
    [AttributeOfForeign('REF$TIPE_MEMBER_ID')]
    property RefTipeMember: TModRefTipeMember read FRefTipeMember write
        FRefTipeMember;
  end;


  TModMemberActivasi = class(TModApp)
  private
    FMEMBERACT_VALID_DATE_FROM: TDateTime;
    FMEMBERACT_IS_ACTIVASI: Integer;
    FMEMBERACT_FEE_ACTIVASI: Double;
    FMEMBERACT_FEE_REACTIVASI: Double;
    FMEMBERACT_IS_PRINT_CARD: Integer;
    FMEMBERACT_IS_REACTIVASI: Integer;
    FMEMBERACT_VALID_DATE_TO: TDateTime;
  public
    class function GetTableName: String; override;
  published
    property MEMBERACT_VALID_DATE_FROM: TDateTime read FMEMBERACT_VALID_DATE_FROM
        write FMEMBERACT_VALID_DATE_FROM;
    property MEMBERACT_IS_ACTIVASI: Integer read FMEMBERACT_IS_ACTIVASI write
        FMEMBERACT_IS_ACTIVASI;
    property MEMBERACT_FEE_ACTIVASI: Double read FMEMBERACT_FEE_ACTIVASI write
        FMEMBERACT_FEE_ACTIVASI;
    property MEMBERACT_FEE_REACTIVASI: Double read FMEMBERACT_FEE_REACTIVASI write
        FMEMBERACT_FEE_REACTIVASI;
    property MEMBERACT_IS_PRINT_CARD: Integer read FMEMBERACT_IS_PRINT_CARD write
        FMEMBERACT_IS_PRINT_CARD;
    property MEMBERACT_IS_REACTIVASI: Integer read FMEMBERACT_IS_REACTIVASI write
        FMEMBERACT_IS_REACTIVASI;
    property MEMBERACT_VALID_DATE_TO: TDateTime read FMEMBERACT_VALID_DATE_TO write
        FMEMBERACT_VALID_DATE_TO;
  end;

  TModMemberKeluarga = class(TModApp)
  private
    FMEMBERKLRG_STAKLRG_ID: Integer;
    FMEMBERKLRG_FULL_NAME: String;
    FMEMBERKLRG_BIRTH_DATE: TDateTime;
  public
    class function GetTableName: String; override;
  published
    property MEMBERKLRG_STAKLRG_ID: Integer read FMEMBERKLRG_STAKLRG_ID write
        FMEMBERKLRG_STAKLRG_ID;
    property MEMBERKLRG_FULL_NAME: String read FMEMBERKLRG_FULL_NAME write
        FMEMBERKLRG_FULL_NAME;
    property MEMBERKLRG_BIRTH_DATE: TDateTime read FMEMBERKLRG_BIRTH_DATE write
        FMEMBERKLRG_BIRTH_DATE;
  end;

  TModRefDiscMember = class(TModApp)
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

  TModRefGrupMember = class(TModApp)
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

  TModRefTipeMember = class(TModApp)
  private
    FIS_UNDIAN: Integer;
    FTPMEMBER_NAME: string;
    FIS_POIN: Integer;
  public
    class function GetTableName: String; override;
  published
    property IS_UNDIAN: Integer read FIS_UNDIAN write FIS_UNDIAN;
    property TPMEMBER_NAME: string read FTPMEMBER_NAME write FTPMEMBER_NAME;
    property IS_POIN: Integer read FIS_POIN write FIS_POIN;
  end;

implementation

class function TModMember.GetTableName: String;
begin
  Result := 'MEMBER';
end;

class function TModMemberActivasi.GetTableName: String;
begin
  Result := 'MEMBER_ACTIVASI';
end;

class function TModMemberKeluarga.GetTableName: String;
begin
  Result := 'MEMBER_KELUARGA';
end;

class function TModRefDiscMember.GetTableName: String;
begin
  Result := 'REF$DISC_MEMBER';
end;

class function TModRefGrupMember.GetTableName: String;
begin
  Result := 'REF$GRUP_MEMBER';
end;

class function TModRefTipeMember.GetTableName: String;
begin
  Result := 'REF$TIPE_MEMBER';
end;

initialization
  TModMember.RegisterRTTI;
  TModMemberActivasi.RegisterRTTI;
  tModMemberKeluarga.RegisterRTTI;
  tModRefDiscMember.RegisterRTTI;
  tModRefGrupMember.RegisterRTTI;
  tModRefTipeMember.RegisterRTTI;
end.
