unit uModTipePerusahaan;

interface

uses
  uModApp;

type
  TModTipePerusahaan = class(TModApp)
  private
    FTPPERSH_CODE: string;
    FTPPERSH_NAME: string;
    FTPPERSH_IS_DEFAULT: Integer;
  public
    class function GetTableName: string; override;
  published
    [AttributeOfCode]
    property TPPERSH_CODE: string read FTPPERSH_CODE write FTPPERSH_CODE;
    property TPPERSH_NAME: string read FTPPERSH_NAME write FTPPERSH_NAME;
    property TPPERSH_IS_DEFAULT: Integer read FTPPERSH_IS_DEFAULT write
        FTPPERSH_IS_DEFAULT;
  end;

implementation

class function TModTipePerusahaan.GetTableName: string;
begin
  Result := 'REF$TIPE_PERUSAHAAN';
end;

Initialization
  TModTipePerusahaan.RegisterRTTI;

end.
