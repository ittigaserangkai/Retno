unit uModPropinsi;

interface

uses
  uModApp, System.SysUtils;

type
  TModPropinsi = class(TModApp)
  private
    FPROP_NAME: string;
  public
    destructor Destroy; override;
    class function GetTableName: String; override;
  published
    property PROP_NAME: string read FPROP_NAME write FPROP_NAME;
  end;

type
  TModKabupaten = class(TModApp)
  private
    FKAB_NAME: string;
    FPROPINSI: TModPropinsi;
  public
    destructor Destroy; override;
    class function GetTableName: String; override;
  published
    property KAB_NAME: string read FKAB_NAME write FKAB_NAME;
    property PROPINSI: TModPropinsi read FPROPINSI write FPROPINSI;
  end;

implementation

destructor TModPropinsi.Destroy;
begin
  inherited;

end;

class function TModPropinsi.GetTableName: String;
begin
  Result := 'PROPINSI';
end;

destructor TModKabupaten.Destroy;
begin
  inherited;
  FreeAndNil(FPROPINSI);
end;

class function TModKabupaten.GetTableName: String;
begin
  Result := 'PROPINSI';
end;

end.
