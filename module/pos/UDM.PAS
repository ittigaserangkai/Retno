unit uDM;

interface

uses
  {Windows,} Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, WinTypes, WinProcs, Grids, DBGrids, IBCustomDataSet,
  jvProgressDlg, IBQuery, IBDatabase, uGTSUICommonDlg;

type
  TDBType = (dbtPOS, dbtStore);
  
type
  TDM = class(TForm)
    dbPOS: TIBDatabase;
    qrView: TIBQuery;
    qryTransaction: TIBQuery;
    qryTransactionInsProdAlias: TIBQuery;
    qryTransactionInsert: TIBQuery;
    qryTransactionView: TIBQuery;
    IBQuery: TIBQuery;
    dbStore: TIBDatabase;
    transPOS: TIBTransaction;
    transStore: TIBTransaction;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure cCommitTrans(ADBType: TDBType = dbtPOS);

procedure cRollbackTrans(ADBType: TDBType = dbtPOS);

function cOpenQuery(ASQL: String; ADBType: TDBType = dbtPOS): TIBQuery;

function cExecSQL(ASQL: String; ADBType: TDBType = dbtPOS; ALangsungCommit:
    Boolean = False): boolean; overload;

function cExecSQLSelfCommit(ASQL: String; ADBType: TDBType = dbtPOS): boolean;

function cExecSQL(ASQLs : TStrings; ADBType: TDBType = dbtPOS;
    ALangsungCommint: Boolean = False; ACaption : String = 'Execute SQL'):
    Boolean; overload;

procedure StepProgress(AJVProgress : TJvProgressDlg; ACaption : String);

function GetDataByDataField(AField: TField): string;

var
  DM: TDM;
	IsStoreConnected : Boolean;
	IsPOSConnected : Boolean;

implementation
uses
	ufrmMain, Windows;

{$R *.DFM}

procedure cCommitTrans(ADBType: TDBType = dbtPOS);
begin
  if ADBType = dbtPOS then
  begin
    if DM.transPOS = nil then exit;

    if DM.transPOS.InTransaction then
    begin
      DM.transPOS.Commit;
    end;
  end
  else if ADBType = dbtStore then
  begin
    if DM.transStore = nil then exit;

    if DM.transStore.InTransaction then
    begin
      DM.transStore.Commit;
    end;
  end;
end;

procedure cRollbackTrans(ADBType: TDBType = dbtPOS);
begin
  if ADBType = dbtPOS then
  begin
    if DM.transPOS = nil then exit;

    if DM.transPOS.InTransaction then
    begin
      DM.transPOS.Rollback;
    end;
  end
  else if ADBType = dbtStore then
  begin
    if DM.transStore = nil then exit;

    if DM.transStore.InTransaction then
    begin
      DM.transStore.Rollback;
    end;
  end;
end;

function cOpenQuery(ASQL: String; ADBType: TDBType = dbtPOS): TIBQuery;
var
  saveCursor: TCursor;
begin
  Result := TIBQuery.Create(Application);
  if ADBType = dbtPOS then
  begin
    Result.Database := DM.dbPOS;
    Result.Transaction := DM.transPOS;
  end
  else if ADBType = dbtStore then
  begin
    Result.Database := DM.dbStore;
    Result.Transaction := DM.transStore;
  end;

  Result.SQL.Clear;
  Result.SQL.Add(ASQL);
  Application.ProcessMessages;
  try
    saveCursor := Screen.Cursor;
    Screen.Cursor := crHourGlass;
    try
      Result.Open;
    finally
    	Screen.Cursor := saveCursor;
    end;  // try/finally
    Application.ProcessMessages;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

function cExecSQLSelfCommit(ASQL: String; ADBType: TDBType = dbtPOS): boolean;
var
  saveCursor: TCursor;
  lIBTransaction: TIBTransaction;
  Query1 : TIBQuery;
begin
  Result := False;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if UpperCase(Copy(Trim(ASQL),1,6)) = 'SELECT' then
    begin
      Exit;
    end;
  
    lIBTransaction := TIBTransaction.Create(Application);
    with lIBTransaction do
    begin
      if ADBType = dbtPOS then
        AddDatabase(DM.dbPOS)
      else if ADBType = dbtStore then
        AddDatabase(DM.dbStore);
        
      Params.Clear;
      Params.Append('read_committed');
      Params.Append('rec_version');
      Params.Append('nowait');
    end;    // with
  
    Query1 := TIBQuery.Create(Application);
    Application.ProcessMessages;

    if ADBType = dbtPOS then
    begin
      Query1.Database := DM.dbPOS;
    end
    else if ADBType = dbtStore then
    begin
      Query1.Database := DM.dbStore;
    end;
    Query1.Transaction := lIBTransaction;

    Query1.Params.Clear;
    Query1.ParamCheck := true;
    Query1.SQL.Clear;
    query1.SQL.Text := ASQL;
    try
      Application.ProcessMessages;
      if not lIBTransaction.InTransaction then
      begin
        lIBTransaction.StartTransaction;
      end;
  
      Query1.ExecSQL;
      lIBTransaction.Commit;
  
      Result := True;
    except
      lIBTransaction.Rollback;
      //raise;
    end;
  finally
  	Screen.Cursor := saveCursor;
  end;  // try/finally
  FreeAndNil(Query1);
  FreeAndNil(lIBTransaction);
end;

//-----------cExecSQL Try------------------------------------------------//
function cExecSQL(ASQL: String; ADBType: TDBType = dbtPOS; ALangsungCommit:
    Boolean = False): boolean;
var
  saveCursor: TCursor;
  Query1 : TIBQuery;
begin
  Result := False;
  saveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if UpperCase(Copy(ASQL,1,6)) = 'SELECT' then
    begin
      Exit;
    end;
  
    Query1 := TIBQuery.Create(Application);
    Application.ProcessMessages;

    if ADBType = dbtPOS then
    begin
      Query1.Database := DM.dbPOS;
      Query1.Transaction := DM.transPOS;
    end
    else if ADBType = dbtStore then
    begin
      Query1.Database := DM.dbStore;
      Query1.Transaction := DM.transStore;
    end;

    Query1.Params.Clear;
    Query1.ParamCheck := true;
    Query1.SQL.Clear;
    query1.SQL.Text := ASQL;
    try
      Application.ProcessMessages;
      if not Query1.Transaction.InTransaction then
      begin
        Query1.Transaction.StartTransaction;
      end;
  
      Query1.ExecSQL;
  
      if ALangsungCommit then
      begin
        cCommitTrans;
      end;
      Result := True;
    except
      cRollbackTrans;
      raise;
    end;
    FreeAndNil(Query1);
  finally
  	Screen.Cursor := saveCursor;
  end;  // try/finally
end;

function cExecSQL(ASQLs : TStrings; ADBType: TDBType = dbtPOS;
    ALangsungCommint: Boolean = False; ACaption : String = 'Execute SQL'):
    Boolean;
var
  LjvProgressDlg: TJvProgressDlg;
  i: Integer;
begin
  Result := False;

  LjvProgressDlg := TJvProgressDlg.Create(nil);
  try
    with LjvProgressDlg do
    begin
      Value := 0;
      Text := aCaption;
      Text := aCAption;
      Value := 0;
      Maximum := ASQLs.Count;
      Show;
      StartProgression;
    end;

    for i := 0 to ASQLs.count - 1 do
    begin
       if not cExecSQL(ASQLs[i], ADBType, ALangsungCommint) then
       begin
           LjvProgressDlg.Close;
           cRollbackTrans;
           Exit;
       end;
       Application.ProcessMessages;
       StepProgress(LjvProgressDlg, aCaption);
    end;
  finally
    LjvProgressDlg.Close;
    LjvProgressDlg.Free;  
  end;

  Result := True;
end;

procedure StepProgress(AJVProgress : TJvProgressDlg; ACaption : String);
begin
  AJVProgress.Value := AJVProgress.Value + 1;
  AJVProgress.Text := ACaption + ' (' + InTtOStr(AJVProgress.Value) + '/'
    + IntToStr(AJVProgress.Maximum) + ' )';
  Application.ProcessMessages;
end;

function GetDataByDataField(AField: TField): string;
begin
  Result := '';
  case TFieldType(Ord(aField.DataType)) of
    ftBlob:
    begin
      if aField.AsString = '' then
        Result := 'null'
      else
        Result := aField.AsString;
    end;

    ftString:
    begin
      if aField.AsString ='' then
        Result :='null'  //Put a default string
      else
        Result := aField.AsString;
    end;
       ftInteger, ftWord, ftSmallint:
    begin
      if aField.AsInteger > 0 then
        Result := IntToStr(aField.AsInteger)
      else
        Result := '0';
    end;
    ftFloat, ftCurrency, ftBCD:
    begin
      if aField.AsFloat > 0 then
        Result := FloatToStr(aField.AsFloat)
      else
        Result := '0';
    end;

    ftBoolean:
    begin
      if aField.Value then
        Result:= 'True'
      else
        Result:= 'False';
    end;

    ftDate:
    begin
      if (not aField.IsNull) or (Length(aField.AsString) > 0) then
        Result := FormatDateTime('MM/DD/YYYY',aField.AsDateTime)
      else
        Result:= FormatDateTime('MM/DD/YYYY',Now); //put a valid default date
    end;

    ftDateTime:
    begin
      if (not aField.IsNull) or (Length(Trim(aField.AsString)) > 0) then
        Result := FormatDateTime('MM/DD/YYYY hh:nn:ss', aField.AsDateTime)
      else
        Result := FormatDateTime('MM/DD/YYYY hh:nn:ss', Now); //Put a valid default date and time
    end;

    ftTime:
    begin
      if (not aField.IsNull) or (Length(Trim(aField.AsString)) > 0) then
         Result := FormatDateTime('hh:nn:ss', aField.AsDateTime)
      else
         Result := FormatDateTime('hh:nn:ss', Now); //Put a valid default time
    end;
  end;
end;

procedure TDM.FormCreate(Sender: TObject);
begin
  {
  with dbPOS do
  begin
    DatabaseName := frmMain.FIBServerPOS;
  	Params.Clear;
		Params.Add('USER_NAME=' + frmMain.FIBUserPOS);
		Params.Add('PASSWORD=' + frmMain.FIBPasswordPOS);
  end;

  try
    dbPOS.Open;
  except
  end;
  }
	with dbStore do
  begin
    DatabaseName := frmMain.FIBServerStore;
    Params.Clear;
		Params.Add('USER_NAME=' + frmMain.FIBUserStore);
		Params.Add('PASSWORD=' + frmMain.FIBPasswordStore);
  end;

  try
    dbStore.Open;
  except
  end;

  IsStoreConnected := dbStore.Connected;
  IsPOSConnected := dbPOS.Connected;

  //CommonDlg.ShowMessage(BoolToStr(IsStoreConnected,True) + ' : ' + BoolToStr(IsPOSConnected,True));
end;

end.
