//
// Created by the DataSnap proxy generator.
// 3/8/2017 8:38:00 AM
//

unit uClientClasses;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, uModApp, Data.DBXJSONReflect;

type

  IDSRestCachedTModApp = interface;
  IDSRestCachedTStrings = interface;

  TServerMethodsClient = class(TDSAdminRestClient)
  private
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
  end;

  TTestMethodClient = class(TDSAdminRestClient)
  private
    FHalloCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Hallo(const ARequestFilter: string = ''): string;
  end;

  TCrudClient = class(TDSAdminRestClient)
  private
    FSaveToDBCommand: TDSRestCommand;
    FDeleteFromDBCommand: TDSRestCommand;
    FOpenQueryCommand: TDSRestCommand;
    FOpenQueryCommand_Cache: TDSRestCommand;
    FRetrieveCommand: TDSRestCommand;
    FRetrieveCommand_Cache: TDSRestCommand;
    FTestGenerateSQLCommand: TDSRestCommand;
    FTestGenerateSQLCommand_Cache: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function SaveToDB(AObject: TModApp; const ARequestFilter: string = ''): Boolean;
    function DeleteFromDB(AObject: TModApp; const ARequestFilter: string = ''): Boolean;
    function OpenQuery(S: string; const ARequestFilter: string = ''): TDataSet;
    function OpenQuery_Cache(S: string; const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Retrieve(ModClassName: string; AID: string; const ARequestFilter: string = ''): TModApp;
    function Retrieve_Cache(ModClassName: string; AID: string; const ARequestFilter: string = ''): IDSRestCachedTModApp;
    function TestGenerateSQL(AObject: TModApp; const ARequestFilter: string = ''): TStrings;
    function TestGenerateSQL_Cache(AObject: TModApp; const ARequestFilter: string = ''): IDSRestCachedTStrings;
  end;

  TDSProviderClient = class(TDSAdminRestClient)
  private
    FBank_GetDSOverviewCommand: TDSRestCommand;
    FBank_GetDSOverviewCommand_Cache: TDSRestCommand;
    FRekening_GetDSLookupCommand: TDSRestCommand;
    FRekening_GetDSLookupCommand_Cache: TDSRestCommand;
    FRefPajak_GetDSOverviewCommand: TDSRestCommand;
    FRefPajak_GetDSOverviewCommand_Cache: TDSRestCommand;
    FRefTipeBarang_GetDSOverviewCommand: TDSRestCommand;
    FRefTipeBarang_GetDSOverviewCommand_Cache: TDSRestCommand;
    FGroupRekening_GetDSLookupCommand: TDSRestCommand;
    FGroupRekening_GetDSLookupCommand_Cache: TDSRestCommand;
    FRekening_GetDSOverviewCommand: TDSRestCommand;
    FRekening_GetDSOverviewCommand_Cache: TDSRestCommand;
    FSatuan_GetDSOverviewCommand: TDSRestCommand;
    FSatuan_GetDSOverviewCommand_Cache: TDSRestCommand;
    FSatuan_GetDSLookupCommand: TDSRestCommand;
    FSatuan_GetDSLookupCommand_Cache: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Bank_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function Bank_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Rekening_GetDSLookup(const ARequestFilter: string = ''): TDataSet;
    function Rekening_GetDSLookup_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RefPajak_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function RefPajak_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function RefTipeBarang_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function RefTipeBarang_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function GroupRekening_GetDSLookup(const ARequestFilter: string = ''): TDataSet;
    function GroupRekening_GetDSLookup_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Rekening_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function Rekening_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Satuan_GetDSOverview(const ARequestFilter: string = ''): TDataSet;
    function Satuan_GetDSOverview_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
    function Satuan_GetDSLookup(const ARequestFilter: string = ''): TDataSet;
    function Satuan_GetDSLookup_Cache(const ARequestFilter: string = ''): IDSRestCachedDataSet;
  end;

  IDSRestCachedTModApp = interface(IDSRestCachedObject<TModApp>)
  end;

  TDSRestCachedTModApp = class(TDSRestCachedObject<TModApp>, IDSRestCachedTModApp, IDSRestCachedCommand)
  end;
  IDSRestCachedTStrings = interface(IDSRestCachedObject<TStrings>)
  end;

  TDSRestCachedTStrings = class(TDSRestCachedObject<TStrings>, IDSRestCachedTStrings, IDSRestCachedCommand)
  end;

const
  TServerMethods_EchoString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerMethods_ReverseString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TTestMethod_Hallo: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TCrud_SaveToDB: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TCrud_DeleteFromDB: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TCrud_OpenQuery: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'S'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TCrud_OpenQuery_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'S'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrud_Retrieve: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TModApp')
  );

  TCrud_Retrieve_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ModClassName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TCrud_TestGenerateSQL: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TStrings')
  );

  TCrud_TestGenerateSQL_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AObject'; Direction: 1; DBXType: 37; TypeName: 'TModApp'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_Bank_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_Bank_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_Rekening_GetDSLookup: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_Rekening_GetDSLookup_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_RefPajak_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_RefPajak_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_RefTipeBarang_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_RefTipeBarang_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_GroupRekening_GetDSLookup: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_GroupRekening_GetDSLookup_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_Rekening_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_Rekening_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_Satuan_GetDSOverview: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_Satuan_GetDSOverview_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TDSProvider_Satuan_GetDSLookup: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 23; TypeName: 'TDataSet')
  );

  TDSProvider_Satuan_GetDSLookup_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

implementation

function TServerMethodsClient.EchoString(Value: string; const ARequestFilter: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FConnection.CreateCommand;
    FEchoStringCommand.RequestType := 'GET';
    FEchoStringCommand.Text := 'TServerMethods.EchoString';
    FEchoStringCommand.Prepare(TServerMethods_EchoString);
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.Execute(ARequestFilter);
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethodsClient.ReverseString(Value: string; const ARequestFilter: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FConnection.CreateCommand;
    FReverseStringCommand.RequestType := 'GET';
    FReverseStringCommand.Text := 'TServerMethods.ReverseString';
    FReverseStringCommand.Prepare(TServerMethods_ReverseString);
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.Execute(ARequestFilter);
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

constructor TServerMethodsClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerMethodsClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerMethodsClient.Destroy;
begin
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  inherited;
end;

function TTestMethodClient.Hallo(const ARequestFilter: string): string;
begin
  if FHalloCommand = nil then
  begin
    FHalloCommand := FConnection.CreateCommand;
    FHalloCommand.RequestType := 'GET';
    FHalloCommand.Text := 'TTestMethod.Hallo';
    FHalloCommand.Prepare(TTestMethod_Hallo);
  end;
  FHalloCommand.Execute(ARequestFilter);
  Result := FHalloCommand.Parameters[0].Value.GetWideString;
end;

constructor TTestMethodClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TTestMethodClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TTestMethodClient.Destroy;
begin
  FHalloCommand.DisposeOf;
  inherited;
end;

function TCrudClient.SaveToDB(AObject: TModApp; const ARequestFilter: string): Boolean;
begin
  if FSaveToDBCommand = nil then
  begin
    FSaveToDBCommand := FConnection.CreateCommand;
    FSaveToDBCommand.RequestType := 'POST';
    FSaveToDBCommand.Text := 'TCrud."SaveToDB"';
    FSaveToDBCommand.Prepare(TCrud_SaveToDB);
  end;
  if not Assigned(AObject) then
    FSaveToDBCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSaveToDBCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSaveToDBCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSaveToDBCommand.Execute(ARequestFilter);
  Result := FSaveToDBCommand.Parameters[1].Value.GetBoolean;
end;

function TCrudClient.DeleteFromDB(AObject: TModApp; const ARequestFilter: string): Boolean;
begin
  if FDeleteFromDBCommand = nil then
  begin
    FDeleteFromDBCommand := FConnection.CreateCommand;
    FDeleteFromDBCommand.RequestType := 'POST';
    FDeleteFromDBCommand.Text := 'TCrud."DeleteFromDB"';
    FDeleteFromDBCommand.Prepare(TCrud_DeleteFromDB);
  end;
  if not Assigned(AObject) then
    FDeleteFromDBCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDeleteFromDBCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDeleteFromDBCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDeleteFromDBCommand.Execute(ARequestFilter);
  Result := FDeleteFromDBCommand.Parameters[1].Value.GetBoolean;
end;

function TCrudClient.OpenQuery(S: string; const ARequestFilter: string): TDataSet;
begin
  if FOpenQueryCommand = nil then
  begin
    FOpenQueryCommand := FConnection.CreateCommand;
    FOpenQueryCommand.RequestType := 'GET';
    FOpenQueryCommand.Text := 'TCrud.OpenQuery';
    FOpenQueryCommand.Prepare(TCrud_OpenQuery);
  end;
  FOpenQueryCommand.Parameters[0].Value.SetWideString(S);
  FOpenQueryCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FOpenQueryCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FOpenQueryCommand.FreeOnExecute(Result);
end;

function TCrudClient.OpenQuery_Cache(S: string; const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FOpenQueryCommand_Cache = nil then
  begin
    FOpenQueryCommand_Cache := FConnection.CreateCommand;
    FOpenQueryCommand_Cache.RequestType := 'GET';
    FOpenQueryCommand_Cache.Text := 'TCrud.OpenQuery';
    FOpenQueryCommand_Cache.Prepare(TCrud_OpenQuery_Cache);
  end;
  FOpenQueryCommand_Cache.Parameters[0].Value.SetWideString(S);
  FOpenQueryCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FOpenQueryCommand_Cache.Parameters[1].Value.GetString);
end;

function TCrudClient.Retrieve(ModClassName: string; AID: string; const ARequestFilter: string): TModApp;
begin
  if FRetrieveCommand = nil then
  begin
    FRetrieveCommand := FConnection.CreateCommand;
    FRetrieveCommand.RequestType := 'GET';
    FRetrieveCommand.Text := 'TCrud.Retrieve';
    FRetrieveCommand.Prepare(TCrud_Retrieve);
  end;
  FRetrieveCommand.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveCommand.Parameters[1].Value.SetWideString(AID);
  FRetrieveCommand.Execute(ARequestFilter);
  if not FRetrieveCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRetrieveCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TModApp(FUnMarshal.UnMarshal(FRetrieveCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRetrieveCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TCrudClient.Retrieve_Cache(ModClassName: string; AID: string; const ARequestFilter: string): IDSRestCachedTModApp;
begin
  if FRetrieveCommand_Cache = nil then
  begin
    FRetrieveCommand_Cache := FConnection.CreateCommand;
    FRetrieveCommand_Cache.RequestType := 'GET';
    FRetrieveCommand_Cache.Text := 'TCrud.Retrieve';
    FRetrieveCommand_Cache.Prepare(TCrud_Retrieve_Cache);
  end;
  FRetrieveCommand_Cache.Parameters[0].Value.SetWideString(ModClassName);
  FRetrieveCommand_Cache.Parameters[1].Value.SetWideString(AID);
  FRetrieveCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTModApp.Create(FRetrieveCommand_Cache.Parameters[2].Value.GetString);
end;

function TCrudClient.TestGenerateSQL(AObject: TModApp; const ARequestFilter: string): TStrings;
begin
  if FTestGenerateSQLCommand = nil then
  begin
    FTestGenerateSQLCommand := FConnection.CreateCommand;
    FTestGenerateSQLCommand.RequestType := 'POST';
    FTestGenerateSQLCommand.Text := 'TCrud."TestGenerateSQL"';
    FTestGenerateSQLCommand.Prepare(TCrud_TestGenerateSQL);
  end;
  if not Assigned(AObject) then
    FTestGenerateSQLCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FTestGenerateSQLCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FTestGenerateSQLCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FTestGenerateSQLCommand.Execute(ARequestFilter);
  if not FTestGenerateSQLCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FTestGenerateSQLCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TStrings(FUnMarshal.UnMarshal(FTestGenerateSQLCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FTestGenerateSQLCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TCrudClient.TestGenerateSQL_Cache(AObject: TModApp; const ARequestFilter: string): IDSRestCachedTStrings;
begin
  if FTestGenerateSQLCommand_Cache = nil then
  begin
    FTestGenerateSQLCommand_Cache := FConnection.CreateCommand;
    FTestGenerateSQLCommand_Cache.RequestType := 'POST';
    FTestGenerateSQLCommand_Cache.Text := 'TCrud."TestGenerateSQL"';
    FTestGenerateSQLCommand_Cache.Prepare(TCrud_TestGenerateSQL_Cache);
  end;
  if not Assigned(AObject) then
    FTestGenerateSQLCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FTestGenerateSQLCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FTestGenerateSQLCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AObject), True);
      if FInstanceOwner then
        AObject.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FTestGenerateSQLCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTStrings.Create(FTestGenerateSQLCommand_Cache.Parameters[1].Value.GetString);
end;

constructor TCrudClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TCrudClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TCrudClient.Destroy;
begin
  FSaveToDBCommand.DisposeOf;
  FDeleteFromDBCommand.DisposeOf;
  FOpenQueryCommand.DisposeOf;
  FOpenQueryCommand_Cache.DisposeOf;
  FRetrieveCommand.DisposeOf;
  FRetrieveCommand_Cache.DisposeOf;
  FTestGenerateSQLCommand.DisposeOf;
  FTestGenerateSQLCommand_Cache.DisposeOf;
  inherited;
end;

function TDSProviderClient.Bank_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FBank_GetDSOverviewCommand = nil then
  begin
    FBank_GetDSOverviewCommand := FConnection.CreateCommand;
    FBank_GetDSOverviewCommand.RequestType := 'GET';
    FBank_GetDSOverviewCommand.Text := 'TDSProvider.Bank_GetDSOverview';
    FBank_GetDSOverviewCommand.Prepare(TDSProvider_Bank_GetDSOverview);
  end;
  FBank_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FBank_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FBank_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.Bank_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FBank_GetDSOverviewCommand_Cache = nil then
  begin
    FBank_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FBank_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FBank_GetDSOverviewCommand_Cache.Text := 'TDSProvider.Bank_GetDSOverview';
    FBank_GetDSOverviewCommand_Cache.Prepare(TDSProvider_Bank_GetDSOverview_Cache);
  end;
  FBank_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FBank_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.Rekening_GetDSLookup(const ARequestFilter: string): TDataSet;
begin
  if FRekening_GetDSLookupCommand = nil then
  begin
    FRekening_GetDSLookupCommand := FConnection.CreateCommand;
    FRekening_GetDSLookupCommand.RequestType := 'GET';
    FRekening_GetDSLookupCommand.Text := 'TDSProvider.Rekening_GetDSLookup';
    FRekening_GetDSLookupCommand.Prepare(TDSProvider_Rekening_GetDSLookup);
  end;
  FRekening_GetDSLookupCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRekening_GetDSLookupCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRekening_GetDSLookupCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.Rekening_GetDSLookup_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRekening_GetDSLookupCommand_Cache = nil then
  begin
    FRekening_GetDSLookupCommand_Cache := FConnection.CreateCommand;
    FRekening_GetDSLookupCommand_Cache.RequestType := 'GET';
    FRekening_GetDSLookupCommand_Cache.Text := 'TDSProvider.Rekening_GetDSLookup';
    FRekening_GetDSLookupCommand_Cache.Prepare(TDSProvider_Rekening_GetDSLookup_Cache);
  end;
  FRekening_GetDSLookupCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRekening_GetDSLookupCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.RefPajak_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FRefPajak_GetDSOverviewCommand = nil then
  begin
    FRefPajak_GetDSOverviewCommand := FConnection.CreateCommand;
    FRefPajak_GetDSOverviewCommand.RequestType := 'GET';
    FRefPajak_GetDSOverviewCommand.Text := 'TDSProvider.RefPajak_GetDSOverview';
    FRefPajak_GetDSOverviewCommand.Prepare(TDSProvider_RefPajak_GetDSOverview);
  end;
  FRefPajak_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRefPajak_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRefPajak_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.RefPajak_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRefPajak_GetDSOverviewCommand_Cache = nil then
  begin
    FRefPajak_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FRefPajak_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FRefPajak_GetDSOverviewCommand_Cache.Text := 'TDSProvider.RefPajak_GetDSOverview';
    FRefPajak_GetDSOverviewCommand_Cache.Prepare(TDSProvider_RefPajak_GetDSOverview_Cache);
  end;
  FRefPajak_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRefPajak_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.RefTipeBarang_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FRefTipeBarang_GetDSOverviewCommand = nil then
  begin
    FRefTipeBarang_GetDSOverviewCommand := FConnection.CreateCommand;
    FRefTipeBarang_GetDSOverviewCommand.RequestType := 'GET';
    FRefTipeBarang_GetDSOverviewCommand.Text := 'TDSProvider.RefTipeBarang_GetDSOverview';
    FRefTipeBarang_GetDSOverviewCommand.Prepare(TDSProvider_RefTipeBarang_GetDSOverview);
  end;
  FRefTipeBarang_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRefTipeBarang_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRefTipeBarang_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.RefTipeBarang_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRefTipeBarang_GetDSOverviewCommand_Cache = nil then
  begin
    FRefTipeBarang_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FRefTipeBarang_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FRefTipeBarang_GetDSOverviewCommand_Cache.Text := 'TDSProvider.RefTipeBarang_GetDSOverview';
    FRefTipeBarang_GetDSOverviewCommand_Cache.Prepare(TDSProvider_RefTipeBarang_GetDSOverview_Cache);
  end;
  FRefTipeBarang_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRefTipeBarang_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.GroupRekening_GetDSLookup(const ARequestFilter: string): TDataSet;
begin
  if FGroupRekening_GetDSLookupCommand = nil then
  begin
    FGroupRekening_GetDSLookupCommand := FConnection.CreateCommand;
    FGroupRekening_GetDSLookupCommand.RequestType := 'GET';
    FGroupRekening_GetDSLookupCommand.Text := 'TDSProvider.GroupRekening_GetDSLookup';
    FGroupRekening_GetDSLookupCommand.Prepare(TDSProvider_GroupRekening_GetDSLookup);
  end;
  FGroupRekening_GetDSLookupCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FGroupRekening_GetDSLookupCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FGroupRekening_GetDSLookupCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.GroupRekening_GetDSLookup_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FGroupRekening_GetDSLookupCommand_Cache = nil then
  begin
    FGroupRekening_GetDSLookupCommand_Cache := FConnection.CreateCommand;
    FGroupRekening_GetDSLookupCommand_Cache.RequestType := 'GET';
    FGroupRekening_GetDSLookupCommand_Cache.Text := 'TDSProvider.GroupRekening_GetDSLookup';
    FGroupRekening_GetDSLookupCommand_Cache.Prepare(TDSProvider_GroupRekening_GetDSLookup_Cache);
  end;
  FGroupRekening_GetDSLookupCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FGroupRekening_GetDSLookupCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.Rekening_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FRekening_GetDSOverviewCommand = nil then
  begin
    FRekening_GetDSOverviewCommand := FConnection.CreateCommand;
    FRekening_GetDSOverviewCommand.RequestType := 'GET';
    FRekening_GetDSOverviewCommand.Text := 'TDSProvider.Rekening_GetDSOverview';
    FRekening_GetDSOverviewCommand.Prepare(TDSProvider_Rekening_GetDSOverview);
  end;
  FRekening_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FRekening_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FRekening_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.Rekening_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FRekening_GetDSOverviewCommand_Cache = nil then
  begin
    FRekening_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FRekening_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FRekening_GetDSOverviewCommand_Cache.Text := 'TDSProvider.Rekening_GetDSOverview';
    FRekening_GetDSOverviewCommand_Cache.Prepare(TDSProvider_Rekening_GetDSOverview_Cache);
  end;
  FRekening_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FRekening_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.Satuan_GetDSOverview(const ARequestFilter: string): TDataSet;
begin
  if FSatuan_GetDSOverviewCommand = nil then
  begin
    FSatuan_GetDSOverviewCommand := FConnection.CreateCommand;
    FSatuan_GetDSOverviewCommand.RequestType := 'GET';
    FSatuan_GetDSOverviewCommand.Text := 'TDSProvider.Satuan_GetDSOverview';
    FSatuan_GetDSOverviewCommand.Prepare(TDSProvider_Satuan_GetDSOverview);
  end;
  FSatuan_GetDSOverviewCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FSatuan_GetDSOverviewCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FSatuan_GetDSOverviewCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.Satuan_GetDSOverview_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FSatuan_GetDSOverviewCommand_Cache = nil then
  begin
    FSatuan_GetDSOverviewCommand_Cache := FConnection.CreateCommand;
    FSatuan_GetDSOverviewCommand_Cache.RequestType := 'GET';
    FSatuan_GetDSOverviewCommand_Cache.Text := 'TDSProvider.Satuan_GetDSOverview';
    FSatuan_GetDSOverviewCommand_Cache.Prepare(TDSProvider_Satuan_GetDSOverview_Cache);
  end;
  FSatuan_GetDSOverviewCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FSatuan_GetDSOverviewCommand_Cache.Parameters[0].Value.GetString);
end;

function TDSProviderClient.Satuan_GetDSLookup(const ARequestFilter: string): TDataSet;
begin
  if FSatuan_GetDSLookupCommand = nil then
  begin
    FSatuan_GetDSLookupCommand := FConnection.CreateCommand;
    FSatuan_GetDSLookupCommand.RequestType := 'GET';
    FSatuan_GetDSLookupCommand.Text := 'TDSProvider.Satuan_GetDSLookup';
    FSatuan_GetDSLookupCommand.Prepare(TDSProvider_Satuan_GetDSLookup);
  end;
  FSatuan_GetDSLookupCommand.Execute(ARequestFilter);
  Result := TCustomSQLDataSet.Create(nil, FSatuan_GetDSLookupCommand.Parameters[0].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FSatuan_GetDSLookupCommand.FreeOnExecute(Result);
end;

function TDSProviderClient.Satuan_GetDSLookup_Cache(const ARequestFilter: string): IDSRestCachedDataSet;
begin
  if FSatuan_GetDSLookupCommand_Cache = nil then
  begin
    FSatuan_GetDSLookupCommand_Cache := FConnection.CreateCommand;
    FSatuan_GetDSLookupCommand_Cache.RequestType := 'GET';
    FSatuan_GetDSLookupCommand_Cache.Text := 'TDSProvider.Satuan_GetDSLookup';
    FSatuan_GetDSLookupCommand_Cache.Prepare(TDSProvider_Satuan_GetDSLookup_Cache);
  end;
  FSatuan_GetDSLookupCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedDataSet.Create(FSatuan_GetDSLookupCommand_Cache.Parameters[0].Value.GetString);
end;

constructor TDSProviderClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TDSProviderClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TDSProviderClient.Destroy;
begin
  FBank_GetDSOverviewCommand.DisposeOf;
  FBank_GetDSOverviewCommand_Cache.DisposeOf;
  FRekening_GetDSLookupCommand.DisposeOf;
  FRekening_GetDSLookupCommand_Cache.DisposeOf;
  FRefPajak_GetDSOverviewCommand.DisposeOf;
  FRefPajak_GetDSOverviewCommand_Cache.DisposeOf;
  FRefTipeBarang_GetDSOverviewCommand.DisposeOf;
  FRefTipeBarang_GetDSOverviewCommand_Cache.DisposeOf;
  FGroupRekening_GetDSLookupCommand.DisposeOf;
  FGroupRekening_GetDSLookupCommand_Cache.DisposeOf;
  FRekening_GetDSOverviewCommand.DisposeOf;
  FRekening_GetDSOverviewCommand_Cache.DisposeOf;
  FSatuan_GetDSOverviewCommand.DisposeOf;
  FSatuan_GetDSOverviewCommand_Cache.DisposeOf;
  FSatuan_GetDSLookupCommand.DisposeOf;
  FSatuan_GetDSLookupCommand_Cache.DisposeOf;
  inherited;
end;

end.

