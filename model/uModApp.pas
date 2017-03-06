unit uModApp;

interface

uses
  SysUtils;

type

  TAttributeClass = class of TCustomAttribute;

  AttributeOfCustom = class(TCustomAttribute)
  private
    FCustomField: String;
  public
    constructor Create(aCustomField: string = '');
    property CustomField: String read FCustomField write FCustomField;
  end;
  AttributeOfCode = class(AttributeOfCustom)
  end;
  AttributeOfForeign = class(AttributeOfCustom)
  end;
  AttributeOfHeader = class(AttributeOfForeign)
  end;


{$TYPEINFO ON}
  TModApp = class;
{$TYPEINFO OFF}

  TModApp = class(TObject)
  private
    FDate_Create: TDatetime;
    FDate_Modify: TDatetime;
    FID: string;

    FObjectState: Integer;

  protected
  public
    constructor Create; reintroduce;
    constructor CreateID(AID : String);
    class function GetPrimaryField: String; dynamic;
    class function GetTableName: String; dynamic;
    class procedure RegisterRTTI;

    property ObjectState: Integer read FObjectState write FObjectState;   // 1 Baru, 3 Edit, 5 Hapus
  published
    property Date_Create: TDatetime read FDate_Create write FDate_Create;
    property Date_Modify: TDatetime read FDate_Modify write FDate_Modify;
    property ID: string read FID write FID;
  end;


//  TModAppItem = class(TModApp)
//  public
//    class function GetHeaderField: string; dynamic; abstract;
//    procedure SetHeaderProperty(AHeaderProperty : TModApp); dynamic; abstract;
//  end;


  TModAppClass = class of TModApp;
//  TModAppClassItem = class of TModAppItem;

implementation

uses
  StrUtils;

constructor AttributeOfCustom.Create(aCustomField: string = '');
begin
  Self.CustomField := aCustomField;
end;


constructor TModApp.Create;
begin
  inherited;
//  MappingDBField;
  ObjectState := 1;
  Date_Create := Now();
  Date_Modify := Now();
end;


constructor TModApp.CreateID(AID: String);
begin
  Self    := inherited Create;
  Self.ID := AID;
end;

class function TModApp.GetPrimaryField: String;
begin
  Result := Self.GetTableName + '_ID';
end;

class function TModApp.GetTableName: String;
begin
  Result := AnsiRightStr( Self.ClassName , Length(Self.ClassName)-4);
end;

class procedure TModApp.RegisterRTTI;
begin
  //dummy method agar rtti diregister secara full
  //akan error "delphi cannot instantiate type" pada datasnapserver kalau ini tidak dilakukan
  //jalankan di inizialitation .section
end;

end.
