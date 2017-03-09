unit uModMember;

interface
uses uModApp;
type
  TModMemberActivasi = class;
  TModMember = class(TModApp)
  private
    FMemberActivasi: TModMemberActivasi;
    FMemberKeluarga: TModMemberActivasi;
    FRefDiscMember: TModMemberActivasi;
    FRefGrupMember: TModMemberActivasi;
    FMEMBER_CARD_NO: String;
    FMEMBER_AGAMA_ID: Integer;
    FMEMBER_ADDRESS: String;
    FMEMBER_ADDRESS1: String;
    FMEMBER_ID: Integer;
    FMEMBER_TPMEMBER_ID: Integer;
    FMEMBER_IS_ACTIVE: Integer;
    FMEMBER_IS_VALID: Integer;
    FMEMBER_GROMEMBER_UNT_ID: Integer;
    FMEMBER_GROMEMBER_ID: Integer;
    FMEMBER_REGISTERED_DATE: String;
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
    FMEMBER_DATE_OF_BIRTH: string;
    FMEMBER_RT: String;
    FMEMBER_POST_CODE: String;
    FMEMBER_JML_TANGGUNGAN: String;
    FMEMBER_RW: String;
  public
    class function GetTableName: String; override;
  published
    [AttributeOfForeign('MEMBER_ACTIVASI_ID')]
    property MemberActivasi: TModMemberActivasi read FMemberActivasi write
        FMemberActivasi;
    [AttributeOfForeign('MEMBER_KELUARGA_ID')]
    property MemberKeluarga: TModMemberActivasi read FMemberKeluarga write
        FMemberKeluarga;
    [AttributeOfForeign('REF$DISC_MEMBER_ID')]
    property RefDiscMember: TModMemberActivasi read FRefDiscMember write
        FRefDiscMember;
    [AttributeOfForeign('REF$GRUP_MEMBER_ID')]
    property RefGrupMember: TModMemberActivasi read FRefGrupMember write
        FRefGrupMember;
    property MEMBER_CARD_NO: String read FMEMBER_CARD_NO write FMEMBER_CARD_NO;
    property MEMBER_AGAMA_ID: Integer read FMEMBER_AGAMA_ID write FMEMBER_AGAMA_ID;
    property MEMBER_ADDRESS: String read FMEMBER_ADDRESS write FMEMBER_ADDRESS;
    property MEMBER_ADDRESS1: String read FMEMBER_ADDRESS1 write FMEMBER_ADDRESS1;
    property MEMBER_ID: Integer read FMEMBER_ID write FMEMBER_ID;
    property MEMBER_TPMEMBER_ID: Integer read FMEMBER_TPMEMBER_ID write
        FMEMBER_TPMEMBER_ID;
    property MEMBER_IS_ACTIVE: Integer read FMEMBER_IS_ACTIVE write
        FMEMBER_IS_ACTIVE;
    property MEMBER_IS_VALID: Integer read FMEMBER_IS_VALID write FMEMBER_IS_VALID;
    property MEMBER_GROMEMBER_UNT_ID: Integer read FMEMBER_GROMEMBER_UNT_ID write
        FMEMBER_GROMEMBER_UNT_ID;
    property MEMBER_GROMEMBER_ID: Integer read FMEMBER_GROMEMBER_ID write
        FMEMBER_GROMEMBER_ID;
    property MEMBER_REGISTERED_DATE: String read FMEMBER_REGISTERED_DATE write
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
    property MEMBER_DATE_OF_BIRTH: string read FMEMBER_DATE_OF_BIRTH write
        FMEMBER_DATE_OF_BIRTH;
    property MEMBER_RT: String read FMEMBER_RT write FMEMBER_RT;
    property MEMBER_POST_CODE: String read FMEMBER_POST_CODE write
        FMEMBER_POST_CODE;
    property MEMBER_JML_TANGGUNGAN: String read FMEMBER_JML_TANGGUNGAN write
        FMEMBER_JML_TANGGUNGAN;
    property MEMBER_RW: String read FMEMBER_RW write FMEMBER_RW;
  end;


  TModMemberActivasi = class(TModApp)
  private
    FGROREK_NAME: String;
    FMEMBER_IS_ACTIVASI: Integer;
    FGROREK_ID: Integer;
  public
    class function GetTableName: String; override;
  published
    property GROREK_NAME: String read FGROREK_NAME write FGROREK_NAME;
    property MEMBER_IS_ACTIVASI: Integer read FMEMBER_IS_ACTIVASI write
        FMEMBER_IS_ACTIVASI;
    property GROREK_ID: Integer read FGROREK_ID write FGROREK_ID;
  end;

type
  TModMemberKeluarga = class(TModApp)
  private
    FGROREK_NAME: String;
    FGROREK_DESCRIPTION: String;
    FGROREK_ID: Integer;
  public
    class function GetTableName: String; override;
  published
    property GROREK_NAME: String read FGROREK_NAME write FGROREK_NAME;
    property GROREK_DESCRIPTION: String read FGROREK_DESCRIPTION write
        FGROREK_DESCRIPTION;
    property GROREK_ID: Integer read FGROREK_ID write FGROREK_ID;
  end;

type
  TModRefDiscMember = class(TModApp)
  private
    FGROREK_NAME: String;
    FGROREK_DESCRIPTION: String;
    FGROREK_ID: Integer;
  public
    class function GetTableName: String; override;
  published
    property GROREK_NAME: String read FGROREK_NAME write FGROREK_NAME;
    property GROREK_DESCRIPTION: String read FGROREK_DESCRIPTION write
        FGROREK_DESCRIPTION;
    property GROREK_ID: Integer read FGROREK_ID write FGROREK_ID;
  end;

type
  TModRefGrupMember = class(TModApp)
  private
    FGROREK_NAME: String;
    FGROREK_DESCRIPTION: String;
    FGROREK_ID: Integer;
  public
    class function GetTableName: String; override;
  published
    property GROREK_NAME: String read FGROREK_NAME write FGROREK_NAME;
    property GROREK_DESCRIPTION: String read FGROREK_DESCRIPTION write
        FGROREK_DESCRIPTION;
    property GROREK_ID: Integer read FGROREK_ID write FGROREK_ID;
  end;

implementation

class function TModMember.GetTableName: String;
begin
  Result := 'MEMBER';
end;

class function TModMemberActivasi.GetTableName: String;
begin
  Result := 'REF$GRUP_REKENING';
end;

class function TModMemberKeluarga.GetTableName: String;
begin
  Result := 'REF$GRUP_REKENING';
end;

class function TModRefDiscMember.GetTableName: String;
begin
  Result := 'REF$GRUP_REKENING';
end;

class function TModRefGrupMember.GetTableName: String;
begin
  Result := 'REF$GRUP_REKENING';
end;

initialization
  TModMember.RegisterRTTI;
  TModMemberActivasi.RegisterRTTI;
end.
