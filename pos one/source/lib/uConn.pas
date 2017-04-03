unit uConn;

interface

uses
  SysUtils, Controls, Messages, Classes, Dialogs, Forms, INIFiles, Windows,
  {$IFDEF USE_CNDEBUG} {$WARNINGS OFF} CnDebug, {$WARNINGS ON} {$ENDIF}
  uGTEncDec, uGTINIFile, IBStoredProc, IBQuery, uConstanta, DB;

type
  TParamType = (ptInteger, ptString, ptBoolean, ptDateTime, ptCurrency, ptVariant, ptDouble);
  TParam = record
    tipe: TParamType;
    data: Variant;
  end;

  TArr = array of TParam;
  TArrData = array of TArr;
  TResultDataSet = TDataSet;
  TArrVar = array of Variant;

  TIBConnection = class(TObject)
  private
    FUserIB,
    FPasswordIB,
    FDBHost,
    FDBPath: String;
    FIniFile: TIniFile;
    FINIFilename: String;
    FQuery: TIBQuery;
    FStoreProc: TIBStoredProc;
    FqrInsert: TIBQuery;
    FqrUpdate: TIBQuery;
    FqrDelete: TIBQuery;
    FqrMultiPurpose: TIBQuery;
    FRoleIB: string;
    FspInsert: TIBStoredProc;
    FspUpdate: TIBStoredProc;
    FspDelete: TIBStoredProc;
    FspMultiPurpose: TIBStoredProc;

    {$IFDEF USE_CNDEBUG}
    FLogParams: TStringList;
    {$ENDIF}

    procedure SetDBHost(const Value: string);
    procedure SetDBPath(const Value: string);
    procedure SetPasswordIB(const Value: string);
    procedure SetUserIB(const Value: string);
    procedure SetQuery(const Value: TIBQuery);
    procedure SetStoreProc(const Value: TIBStoredProc);
    procedure SetqrDelete(const Value: TIBQuery);
    procedure SetqrInsert(const Value: TIBQuery);
    procedure SetqrUpdate(const Value: TIBQuery);
    procedure SetRoleIB(const Value: string);
    procedure SetqrMultiPurpose(const Value: TIBQuery);
    procedure SetspDelete(const Value: TIBStoredProc);
    procedure SetspInsert(const Value: TIBStoredProc);
    procedure SetspMultiPurpose(const Value: TIBStoredProc);
    procedure SetspUpdate(const Value: TIBStoredProc);
    function GetDebugMode: boolean;
    procedure SetDebugMode(const Value: boolean);
  public
    constructor Create(AINIFilename: string);
    destructor Destroy; override;
    procedure LoadConfig();
    procedure SaveConfig();
    procedure Connect();
    procedure Disconnect();
    procedure StartTrans();
    procedure RefreshTrans();
    procedure Commit();
    procedure Rollback();
    function ExecuteInsertQuery(ASql: String; AParam: TArr; AIsAutoCommit: Boolean=True): boolean;
    function ExecuteUpdateQuery(ASql: String; AParam: TArr; AIsAutoCommit: Boolean=True): boolean;
    function ExecuteDeleteQuery(ASql: String; AParam: TArr; AIsAutoCommit: Boolean=True): boolean;
    function GetAllDataAsArray(ASql: String; AParam: TArr): TResultDataSet;
    function GetDataAsOne(ASql: String; AParam: TArr): Variant;
    function ExecuteSPInsert(AName: String; AParam: TArr; AIsAutoCommit: Boolean=True): boolean;
    function ExecuteSPUpdate(AName: String; AParam: TArr; AIsAutoCommit: Boolean=True): boolean;
    function ExecuteSPDelete(AName: String; AParam: TArr; AIsAutoCommit: Boolean=True): boolean;
    function ExecuteSPMultiPurpose(AName: String; AParam: TArr; AIsAutoCommit: Boolean=True): boolean;
    function ExecuteSPAsOne(AName: string; AParam: TArr; ACountIndexResult: integer): TArrVar;
  published
    property UserIB: string read FUserIB write SetUserIB;
    property PasswordIB: string read FPasswordIB write SetPasswordIB;
    property RoleIB: string read FRoleIB write SetRoleIB;
    property DBHost: string read FDBHost write SetDBHost;
    property DBPath: string read FDBPath write SetDBPath;
    property Query: TIBQuery read FQuery write SetQuery;
    property StoreProc: TIBStoredProc read FStoreProc write SetStoreProc;
    property qrInsert: TIBQuery read FqrInsert write SetqrInsert;
    property qrUpdate: TIBQuery read FqrUpdate write SetqrUpdate;
    property qrDelete: TIBQuery read FqrDelete write SetqrDelete;
    property qrMultiPurpose: TIBQuery read FqrMultiPurpose write SetqrMultiPurpose;
    property spInsert: TIBStoredProc read FspInsert write SetspInsert;
    property spUpdate: TIBStoredProc read FspUpdate write SetspUpdate;
    property spDelete: TIBStoredProc read FspDelete write SetspDelete;
    property spMultiPurpose: TIBStoredProc read FspMultiPurpose write SetspMultiPurpose;
    property DebugMode: boolean read GetDebugMode write SetDebugMode;
  end;

var
  IBConn: TIBConnection;
  ConnectionFailed: boolean;

procedure SetDebugMode(ABool: boolean);
function ParamsToStr(AParams: TParams): string;

implementation

uses udmMain, IBDatabase, IB, uGTSUICommonDlg, Variants;

procedure SetDebugMode(ABool: boolean);
begin
  SetDebugMode(ABool);
end;

function ParamsToStr(AParams: TParams): string;
var
  i: Integer;
  lStrings: TStringList;
begin
  lStrings := TStringList.Create;

  try
    for i := 0 to AParams.Count - 1 do
      lStrings.Add('Params[' + IntToStr(i) + '][' + AParams[i].Name + ']: ' + AParams[i].AsString);

    Result := lStrings.Text;
  finally
    lStrings.Free;
  end;


end;

{ TIBConnection }

procedure TIBConnection.Commit;
begin
  with dmMain.transGoro do
  begin
    Commit;
  end; // with
end;

procedure TIBConnection.Connect;
begin
  with dmMain.transGoro do
  begin
    Params.Clear;
    Params.Append('read_committed');
    Params.Append('rec_version');
    Params.Append('nowait');
  end;    // with

  with dmMain.connGoro do
  begin
    Params.Clear;
    Params.Add('user_name='+FUserIB);
    Params.Add('password='+FPasswordIB);
    Params.Add('sql_role_name='+FRoleIB);
    DatabaseName := FDBHost + ':' + FDBPath;

    try
      Connected := true;
      // start transaction

      ConnectionFailed := false;
    except
      on E: EIBInterBaseError do
      begin
        CommonDlg.ShowError('Connection failed!.' + #13 + 'Please check your configuration again.' + #13 +
          E.Message);
        ConnectionFailed := true;
        exit;
      end; // end exception
    end; // end try
  end; // end with
end;

constructor TIBConnection.Create(AINIFilename: string);
begin
  inherited Create;
  FINIFilename := AINIFilename;
  // read configuration from INI file
  LoadConfig();
  // initialization query and sp
  {
  ShowMessage(dmMain.connGoro.DatabaseName);
  dmMain.connGoro.Connected := False;
  dmMain.connGoro.DatabaseName := FDBHost + ':' + FDBPath;
  dmMain.connGoro.Connected := True;
  }
  FQuery := dmMain.qrMultiPurpose;
  FStoreProc := dmMain.spMultiPurpose;
  FqrInsert := dmMain.qrInsert;
  FqrUpdate := dmMain.qrUpdate;
  FqrDelete := dmMain.qrDelete;
  FqrMultiPurpose := dmMain.qrMultiPurpose;
  FspInsert := dmMain.spInsert;
  FspUpdate := dmMain.spUpdate;
  FspDelete := dmMain.spDelete;
  FspMultiPurpose := dmMain.spMultiPurpose;


  //FspMultiPurpose

  {$IFDEF USE_CNDEBUG}
  FLogParams := TStringList.Create;
  {$ENDIF}
end;

destructor TIBConnection.Destroy;
begin
  FIniFile.Free;

  {$IFDEF USE_CNDEBUG}
  FLogParams.Free;
  {$ENDIF}

  inherited Destroy;
end;

procedure TIBConnection.Disconnect;
begin
  with dmMain.connGoro do
  begin
    try
      Connected := false;
    except
      on E: EIBInterBaseError do
      begin
        CommonDlg.ShowError('Connection cannot stop!.' + #13 +
          E.ClassName + ': ' + E.Message);
        exit;
      end; // end exception
    end; // end try
  end; // end with
end;

function TIBConnection.ExecuteDeleteQuery(ASql: String;
  AParam: TArr; AIsAutoCommit: Boolean=True): boolean;
var
  i: Byte;
begin
  {$IFDEF USE_CNDEBUG}
  FLogParams.Clear;
  {$ENDIF}

  try
    with FqrDelete do
    begin
      Close;
      SQL.Clear;
      SQL.Text := ASql;
      if (Length(AParam) > 0) then
        for i:=0 to length(AParam)-1 do
        begin
          case AParam[i].tipe of
            ptInteger: Params[i].AsInteger := AParam[i].data;
            ptDouble: Params[i].AsFloat := AParam[i].data;
            ptString: Params[i].AsString := AParam[i].data;
            ptBoolean: Params[i].AsBoolean := AParam[i].data;
            ptDateTime: Params[i].AsDateTime := AParam[i].data;
            ptCurrency: Params[i].AsCurrency := AParam[i].data;
          else Params[i].Value := AParam[i].data;
          end;
          {$IFDEF USE_CNDEBUG}
          FLogParams.Add('Params[' + IntToStr(i) + '][' + Params[i].Name + ']: ' + Params[i].AsString);
          {$ENDIF USE_CNDEBUG}
        end;
      {$IFDEF USE_CNDEBUG}
      CnDebugger.TraceMsgWithTypeTag(ASql + #13#10#13#10 + FLogParams.Text, cmtCustom, 'SQL');
      {$ENDIF}
      Prepare;
      ExecSQL;
    end;

    if (AIsAutoCommit) then
      Commit;
    Result := true;
  except
    on E: EIBInterBaseError do
    begin
      Rollback;
      if (DebugMode) then
      begin
        CommonDlg.ShowError('Error execute delete!. ' + #13 + E.ClassName + ': ' +
          E.Message);
        CommonDlg.ShowError('SQL: ' + #13 + FqrDelete.SQL.Text);
        Result := false;
      end else
      if E.IBErrorCode = ERR_CODE_VIOLATION then
      begin
        CommonDlg.ShowError(ER_VIOLATION_FOREIGN_KEY);
        Result := false;
      end
      else
      begin
        CommonDlg.ShowError(ER_DELETE_FAILED);
        Result := false;
      end;
    end;
  end; // end try
end;

function TIBConnection.ExecuteInsertQuery(ASql: String;
  AParam: TArr; AIsAutoCommit: Boolean=True): boolean;
var
  i: Byte;
begin
  {$IFDEF USE_CNDEBUG}
  FLogParams.Clear;
  {$ENDIF}

  try
    with FqrInsert do
    begin
      Close;
      SQL.Clear;
      SQL.Text := ASql;
      if (Length(AParam) > 0) then
        for i:=0 to length(AParam)-1 do
        begin
          case AParam[i].tipe of
            ptInteger: Params[i].AsInteger := AParam[i].data;
            ptDouble: Params[i].AsFloat := AParam[i].data;
            ptString: Params[i].AsString := AParam[i].data;
            ptBoolean: Params[i].AsBoolean := AParam[i].data;
            ptDateTime: Params[i].AsDateTime := AParam[i].data;
            ptCurrency: Params[i].AsCurrency := AParam[i].data;
            ptVariant: Params[i].Value := AParam[i].data;
          else Params[i].Value := AParam[i].data;
          end;

          {$IFDEF USE_CNDEBUG}
          FLogParams.Add('Params[' + IntToStr(i) + '][' + Params[i].Name + ']: ' + Params[i].AsString);
          {$ENDIF USE_CNDEBUG}
        end;

      {$IFDEF USE_CNDEBUG}
      CnDebugger.TraceMsgWithTypeTag(ASql + #13#10#13#10 + FLogParams.Text, cmtCustom, 'SQL');
      {$ENDIF}

      Prepare;
      ExecSQL;
    end;

    if (AIsAutoCommit) then
      Commit;
    Result := true;
  except
    on E: EIBInterBaseError do
    begin
      Rollback;
      if (DebugMode) then
      begin
        CommonDlg.ShowError('Error execute insert!. ' + #13 + E.ClassName + ': ' +
          E.Message);
        CommonDlg.ShowError('SQL: ' + #13 + FqrInsert.SQL.Text);
        Result := false;
      end
      else
      begin
        CommonDlg.ShowError(ER_INSERT_FAILED);
        Result := false;
      end;
    end;
  end; // end try
end;

function TIBConnection.ExecuteSPAsOne(AName: string; AParam: TArr; ACountIndexResult: integer): TArrVar;
var
  i, j: Byte;
  arRes: TArrVar;
begin
  SetLength(arRes,0);
  Result := arRes;

  try
    //ShowMessage(AName);
    FspMultiPurpose.StoredProcName := AName;
    //ShowMessage(FspMultiPurpose.StoredProcName);
    with FspMultiPurpose do
    begin
      Close;
      StoredProcName := AName;
      Prepare;
      if (Length(AParam) > 0) then
      begin
        j := 0;
        for i:=ACountIndexResult to length(AParam) do
        begin
          case AParam[j].tipe of
            ptInteger: Params[i].AsInteger := AParam[j].data;
            ptDouble: Params[i].AsFloat := AParam[j].data;
            ptString: Params[i].AsString := AParam[j].data;
            ptBoolean: Params[i].AsBoolean := AParam[j].data;
            ptDateTime: Params[i].AsDateTime := AParam[j].data;
            ptCurrency: Params[i].AsCurrency := AParam[j].data;
          else Params[i].Value := AParam[j].data;
          end;
          j := j + 1;
        end;
      end; // end if
      Prepare;
      ExecProc;

      SetLength(arRes,ACountIndexResult);
      for i:=0 to ACountIndexResult-1 do
        arRes[i] := Params[i].Value;
      Result := arRes;
    end;
  except
    on E: EIBInterBaseError do
    begin
      Rollback;
      if (DebugMode) then
      begin
        CommonDlg.ShowError('Error execute store procedure: ' + FspDelete.StoredProcName + '. ' + #13 +
          E.ClassName + ': ' +
          E.Message);
        Result := arRes;
      end
      else
      begin
        CommonDlg.ShowError(ER_DELETE_FAILED);
        Result := arRes;
      end;
    end;
  end; // end try
end;

function TIBConnection.ExecuteSPDelete(AName: String;
  AParam: TArr; AIsAutoCommit: Boolean=True): boolean;
var
  i: Byte;
begin
  try
    with FspDelete do
    begin
      Close;
      StoredProcName := AName;
      if (Length(AParam) > 0) then
        for i:=0 to length(AParam)-1 do
        begin
          case AParam[i].tipe of
            ptInteger: Params[i].AsInteger := AParam[i].data;
            ptDouble: Params[i].AsFloat := AParam[i].data;
            ptString: Params[i].AsString := AParam[i].data;
            ptBoolean: Params[i].AsBoolean := AParam[i].data;
            ptDateTime: Params[i].AsDateTime := AParam[i].data;
            ptCurrency: Params[i].AsCurrency := AParam[i].data;
          else Params[i].Value := AParam[i].data;
          end;
        end;
      Prepare;
      ExecProc;
    end;

    if (AIsAutoCommit) then
      Commit;
    Result := true;
  except
    on E: EIBInterBaseError do
    begin
      Rollback;
      if (DebugMode) then
      begin
        CommonDlg.ShowError('Error execute store procedure: ' + FspDelete.StoredProcName + '. ' + #13 +
          E.ClassName + ': ' +
          E.Message);
        Result := false;
      end
      else
      begin    
        CommonDlg.ShowError(ER_DELETE_FAILED);
        Result := false;
      end;
    end;
  end; // end try
end;

function TIBConnection.ExecuteSPInsert(AName: String;
  AParam: TArr; AIsAutoCommit: Boolean=True): boolean;
var
  i: Byte;
begin
  try
    with FspInsert do
    begin
      Close;
      StoredProcName := AName;
      if (Length(AParam) > 0) then
        for i:=0 to length(AParam)-1 do
        begin
          case AParam[i].tipe of
            ptInteger: Params[i].AsInteger := AParam[i].data;
            ptDouble: Params[i].AsFloat := AParam[i].data;
            ptString: Params[i].AsString := AParam[i].data;
            ptBoolean: Params[i].AsBoolean := AParam[i].data;
            ptDateTime: Params[i].AsDateTime := AParam[i].data;
            ptCurrency: Params[i].AsCurrency := AParam[i].data;
          else Params[i].Value := AParam[i].data;
          end;
        end;
      Prepare;
      ExecProc;
    end;

    if (AIsAutoCommit) then
      Commit;
    Result := true;
  except
    on E: EIBInterBaseError do
    begin
      Rollback;
      if (DebugMode) then
      begin
        CommonDlg.ShowError('Error execute store procedure: ' + FspInsert.StoredProcName + '. ' + #13 +
          E.ClassName + ': ' +
          E.Message);
        Result := false;
      end
      else
      begin    
        CommonDlg.ShowError(ER_INSERT_FAILED);
        Result := false;
      end;
    end;
  end; // end try
end;

function TIBConnection.ExecuteSPMultiPurpose(AName: String;
  AParam: TArr; AIsAutoCommit: Boolean=True): boolean;
var
  i: Byte;
begin
  try
    with FspMultiPurpose do
    begin
      Close;
      StoredProcName := AName;
      Prepare;
      if (Length(AParam) > 0) then
        for i:=0 to length(AParam)-1 do
        begin
          case AParam[i].tipe of
            ptInteger: Params[i].AsInteger := AParam[i].data;
            ptDouble: Params[i].AsFloat := AParam[i].data;
            ptString: Params[i].AsString := AParam[i].data;
            ptBoolean: Params[i].AsBoolean := AParam[i].data;
            ptDateTime: Params[i].AsDateTime := AParam[i].data;
            ptCurrency: Params[i].AsCurrency := AParam[i].data;
          else Params[i].Value := AParam[i].data;
          end;
        end;
      Prepare;
      {$IFDEF USE_CNDEBUG}
      CnDebugger.TraceMsgWithTypeTag(AName + #13#10#13#10 + ParamsToStr(Params), cmtCustom, 'PROC');
      {$ENDIF}
      ExecProc;
    end;

    if (AIsAutoCommit) then
      Commit;
    Result := true;
  except
    on E: EIBInterBaseError do
    begin
      Rollback;
      if (DebugMode) then
      begin
        CommonDlg.ShowError('Error execute store procedure: ' + FspMultiPurpose.StoredProcName + '. ' + #13 +
          E.ClassName + ': ' +
          E.Message);
        Result := false;
      end
      else
      begin
        CommonDlg.ShowError(ER_SP_FAILED);
        Result := false;
      end;
    end;
  end; // end try
end;

function TIBConnection.ExecuteSPUpdate(AName: String;
  AParam: TArr; AIsAutoCommit: Boolean=True): boolean;
var
  i: Byte;
begin
  try
    with FspUpdate do
    begin
      Close;
      StoredProcName := AName;
      if (Length(AParam) > 0) then
        for i:=0 to length(AParam)-1 do
        begin
          case AParam[i].tipe of
            ptInteger: Params[i].AsInteger := AParam[i].data;
            ptDouble: Params[i].AsFloat := AParam[i].data;
            ptString: Params[i].AsString := AParam[i].data;
            ptBoolean: Params[i].AsBoolean := AParam[i].data;
            ptDateTime: Params[i].AsDateTime := AParam[i].data;
            ptCurrency: Params[i].AsCurrency := AParam[i].data;
          else Params[i].Value := AParam[i].data;
          end;
        end;
      Prepare;
      ExecProc;
    end;

    if (AIsAutoCommit) then
      Commit;
    Result := true;
  except
    on E: EIBInterBaseError do
    begin
      Rollback;
      if (DebugMode) then
      begin
        CommonDlg.ShowError('Error execute store procedure: ' + FspUpdate.StoredProcName + '. ' + #13 +
          E.ClassName + ': ' +
          E.Message);
        Result := false;
      end
      else
      begin
        CommonDlg.ShowError(ER_UPDATE_FAILED);
        Result := false;
      end;
    end;
  end; // end try
end;

function TIBConnection.ExecuteUpdateQuery(ASql: String;
  AParam: TArr; AIsAutoCommit: Boolean=True): boolean;
var
  i: Byte;
begin
  {$IFDEF USE_CNDEBUG}
  FLogParams.Clear;
  {$ENDIF}

  try
    with FqrUpdate do
    begin
      Close;
      SQL.Clear;
      SQL.Text := ASql;
      if (Length(AParam) > 0) then
        for i:=0 to length(AParam)-1 do
        begin
          case AParam[i].tipe of
            ptInteger: Params[i].AsInteger := AParam[i].data;
            ptDouble: Params[i].AsFloat := AParam[i].data;
            ptString: Params[i].AsString := AParam[i].data;
            ptBoolean: Params[i].AsBoolean := AParam[i].data;
            ptDateTime: Params[i].AsDateTime := AParam[i].data;
            ptCurrency: Params[i].AsCurrency := AParam[i].data;
            ptVariant: Params[i].Value := AParam[i].data;
          else Params[i].Value := AParam[i].data;
          end;
          {$IFDEF USE_CNDEBUG}
          FLogParams.Add('Params[' + IntToStr(i) + '][' + Params[i].Name + ']: ' + Params[i].AsString);
          {$ENDIF USE_CNDEBUG}
        end;
      {$IFDEF USE_CNDEBUG}
      CnDebugger.TraceMsgWithTypeTag(ASql + #13#10#13#10 + FLogParams.Text, cmtCustom, 'SQL');
      {$ENDIF}
      Prepare;
      ExecSQL;
    end;

    if (AIsAutoCommit) then
      Commit;
    Result := true;
  except
    on E: EIBInterBaseError do
    begin
      Rollback;
      if (DebugMode) then
      begin
        CommonDlg.ShowError('Error execute update!. ' + #13 + E.ClassName + ': ' +
          E.Message);    
        CommonDlg.ShowError('SQL: ' + #13 + FqrUpdate.SQL.Text);
        Result := false;
      end
      else
      begin           
        CommonDlg.ShowError(ER_UPDATE_FAILED);
        Result := false;
      end;
    end;
  end; // end try
end;

function TIBConnection.GetAllDataAsArray(ASql: String;
  AParam: TArr): TResultDataSet;
var
  i: Byte;
  Data: TResultDataSet;
  {$IFDEF USE_CNDEBUG}
  executionTime: Cardinal;
  {$ENDIF}
begin
  {$IFDEF USE_CNDEBUG}
  FLogParams.Clear;
  {$ENDIF}

  Result := nil;

  try
    RefreshTrans;
    with FqrMultiPurpose do
    begin
      Close;
      SQL.Clear;
      SQL.Text := ASql;

      if (Length(AParam) > 0) then
        for i:=0 to length(AParam)-1 do
        begin
          case AParam[i].tipe of
            ptInteger: Params[i].AsInteger := AParam[i].data;
            ptDouble: Params[i].AsFloat := AParam[i].data;
            ptString: Params[i].AsString := AParam[i].data;
            ptBoolean: Params[i].AsBoolean := AParam[i].data;
            ptDateTime: Params[i].AsDateTime := AParam[i].data;
            ptCurrency: Params[i].AsCurrency := AParam[i].data;
          else Params[i].Value := AParam[i].data;
          end;

          {$IFDEF USE_CNDEBUG}
          FLogParams.Add('Params[' + IntToStr(i) + '][' + Params[i].Name + ']: ' + Params[i].AsString);
          {$ENDIF USE_CNDEBUG}
        end;

      {$IFDEF USE_CNDEBUG}
      executionTime := GetTickCount;
      try
      {$ENDIF}

      Prepare;
      Open;

      {$IFDEF USE_CNDEBUG}
      finally
        executionTime := GetTickCount - executionTime;
        FLogParams.Add('');
        FLogParams.Add(Format('Executed in: %d ms.', [executionTime]));
        CnDebugger.TraceMsgWithTypeTag(ASql + #13#10#13#10 + FLogParams.Text, cmtCustom, 'SQL');
      end;
      {$ENDIF}
    end;

    FqrMultiPurpose.FetchAll;
    Data := FqrMultiPurpose;

    Result := Data;
  except
    on E: EIBInterBaseError do
    begin
      if (DebugMode) then
      begin
        CommonDlg.ShowError('Error execute query!. ' + #13 + E.ClassName + ': ' +
          E.Message);
        CommonDlg.ShowError('SQL: ' + #13 + FqrMultiPurpose.SQL.Text);
      end
      else
        CommonDlg.ShowError(ER_QUERY_FAILED+' : '+E.Message);
    end;
  end; // end try
end;

function TIBConnection.GetDataAsOne(ASql: String; AParam: TArr): Variant;
var
  i: Byte;
  Data: Variant;
begin
  {$IFDEF USE_CNDEBUG}
  FLogParams.Clear;
  {$ENDIF}

  Data := '';

  try
    RefreshTrans;
    with FqrMultiPurpose do
    begin
      Close;
      SQL.Clear;
      SQL.Text := ASql;
      if (Length(AParam) > 0) then
        for i:=0 to length(AParam)-1 do
        begin
          case AParam[i].tipe of
            ptInteger: Params[i].AsInteger := AParam[i].data;
            ptDouble: Params[i].AsFloat := AParam[i].data;
            ptString: Params[i].AsString := AParam[i].data;
            ptBoolean: Params[i].AsBoolean := AParam[i].data;
            ptDateTime: Params[i].AsDateTime := AParam[i].data;
            ptCurrency: Params[i].AsCurrency := AParam[i].data;
          else Params[i].Value := AParam[i].data;
          end;

          {$IFDEF USE_CNDEBUG}
          FLogParams.Add('Params[' + IntToStr(i) + '][' + Params[i].Name + ']: ' + Params[i].AsString);
          {$ENDIF USE_CNDEBUG}

        end;

      {$IFDEF USE_CNDEBUG}
      CnDebugger.TraceMsgWithTypeTag(ASql + #13#10#13#10 + FLogParams.Text, cmtCustom, 'SQL');
      {$ENDIF}

      Prepare;
      Open;
      Data := Fields[0].AsVariant;
    end;

    Result := Data;
  except
    on E: EIBInterBaseError do
    begin
      if (DebugMode) then
      begin
        CommonDlg.ShowError('Error execute query!. ' + #13 + E.ClassName + ': ' +
          E.Message);
        CommonDlg.ShowError('SQL: ' + #13 + FqrMultiPurpose.SQL.Text);
      end
      else
        CommonDlg.ShowError(ER_QUERY_FAILED+E.Message);
    end;
  end; // end try
end;

function TIBConnection.GetDebugMode: boolean;
begin
  if (_INIReadInteger(CONFIG_FILE,DEBUG,'Mode') = 1) then
    Result := True
  else
    Result := False;
end;

procedure TIBConnection.LoadConfig;
begin
  FDBHost := _INIReadString(FINIFilename,DB_POS,'DatabaseHost');
  FDBPath := _INIReadString(FINIFilename,DB_POS,'DatabasePath');
  FUserIB := _Decrypt(_MakeOriginal(_INIReadString(FINIFilename,DB_POS,'UserIB')),START_KEY,MULTI_KEY,ADD_KEY);
  FPasswordIB := _Decrypt(_MakeOriginal(_INIReadString(FINIFilename,DB_POS,'PasswordIB')),START_KEY,MULTI_KEY,ADD_KEY);
  FRoleIB := _Decrypt(_MakeOriginal(_INIReadString(FINIFilename,DB_POS,'RoleIB')),START_KEY,MULTI_KEY,ADD_KEY);
end;

procedure TIBConnection.RefreshTrans;
begin
  with dmMain.transGoro do
  begin
    if (Active) then Commit;
    StartTransaction;
  end; // end with
end;

procedure TIBConnection.Rollback;
begin
  with dmMain.transGoro do
  begin
    Rollback;
  end; // end with
end;

procedure TIBConnection.SaveConfig;
begin
  _INIWriteString(FINIFilename,DB_HO,'DatabaseHost',FDBHost);
  _INIWriteString(FINIFilename,DB_HO,'DatabasePath',FDBPath);
  _INIWriteString(FINIFilename,DB_HO,'UserIB',_MakeReadable(_Encrypt(FUserIB,START_KEY,MULTI_KEY,ADD_KEY)));
  _INIWriteString(FINIFilename,DB_HO,'PasswordIB',_MakeReadable(_Encrypt(FPasswordIB,START_KEY,MULTI_KEY,ADD_KEY)));
  _INIWriteString(FINIFilename,DB_HO,'RoleIB',_MakeReadable(_Encrypt(FRoleIB,START_KEY,MULTI_KEY,ADD_KEY)));
end;

procedure TIBConnection.SetDBHost(const Value: string);
begin
  FDBHost := Value;
end;

procedure TIBConnection.SetDBPath(const Value: string);
begin
  FDBPath := Value;
end;

procedure TIBConnection.SetDebugMode(const Value: boolean);
begin
  if (Value) then
    _INIWriteInteger(CONFIG_FILE,DEBUG,'Mode',1)
  else
    _INIWriteInteger(CONFIG_FILE,DEBUG,'Mode',0);
end;

procedure TIBConnection.SetPasswordIB(const Value: string);
begin
  FPasswordIB := Value;
end;

procedure TIBConnection.SetqrDelete(const Value: TIBQuery);
begin
  FqrDelete := Value;
end;

procedure TIBConnection.SetqrInsert(const Value: TIBQuery);
begin
  FqrInsert := Value;
end;

procedure TIBConnection.SetqrMultiPurpose(const Value: TIBQuery);
begin
  FqrMultiPurpose := Value;
end;

procedure TIBConnection.SetqrUpdate(const Value: TIBQuery);
begin
  FqrUpdate := Value;
end;

procedure TIBConnection.SetQuery(const Value: TIBQuery);
begin
  FQuery := Value;
end;

procedure TIBConnection.SetRoleIB(const Value: string);
begin
  FRoleIB := Value;
end;

procedure TIBConnection.SetspDelete(const Value: TIBStoredProc);
begin
  FspDelete := Value;
end;

procedure TIBConnection.SetspInsert(const Value: TIBStoredProc);
begin
  FspInsert := Value;
end;

procedure TIBConnection.SetspMultiPurpose(const Value: TIBStoredProc);
begin
  FspMultiPurpose := Value;
end;

procedure TIBConnection.SetspUpdate(const Value: TIBStoredProc);
begin
  FspUpdate := Value;
end;

procedure TIBConnection.SetStoreProc(const Value: TIBStoredProc);
begin
  FStoreProc := Value;
end;

procedure TIBConnection.SetUserIB(const Value: string);
begin
  FUserIB := Value;
end;

procedure TIBConnection.StartTrans;
begin
  with dmMain.transGoro do
  begin
    StartTransaction;
  end; // end with
end;

initialization
  ConnectionFailed := true;

end.
