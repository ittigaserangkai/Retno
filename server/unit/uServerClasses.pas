unit uServerClasses;

interface

uses
  System.Classes, uModApp, uModAppHelper,uDBUtils, Rtti, Data.DB, SysUtils,
  StrUtils;

type
  {$METHODINFO ON}
  TTestMethod = class(TComponent)
  public
    function Hallo: String;
  end;

  TCrud = class(TComponent)
  private
    function StringToClass(ModClassName: string): TModAppClass;
    function ValidateCode(AOBject: TModApp): Boolean;
  public
    function SaveToDB(AObject: TModApp): Boolean;
    function DeleteFromDB(AObject: TModApp): Boolean;
    function OpenQuery(S: string): TDataSet;
    function Retrieve(ModAppClass: TModAppClass; AID: String): TModApp; overload;
    function Retrieve(ModClassName, AID: string): TModApp; overload;
    function TestGenerateSQL(AObject: TModApp): TStrings;
  end;

  TDSProvider = class(TComponent)
  private
  public
    function Bank_GetDSOverview: TDataSet;
    function Rekening_GetDSLookup: TDataSet;
    function RefPajak_GetDSOverview: TDataSet;
    function RefTipeBarang_GetDSOverview: TDataSet;
    function GroupRekening_GetDSLookup: TDataSet;
    function Rekening_GetDSOverview: TDataSet;
    function Member_GetDSOverview: TDataSet;
    function MemberActivasi_GetDSOverview: TDataSet;
    function RefDiscMember_GetDSOverview: TDataSet;
    function MemberKeluarga_GetDSOverview: TDataSet;
    function RefGrupMember_GetDSOverview: TDataSet;
    function Satuan_GetDSOverview: TDataSet;
    function Satuan_GetDSLookup: TDataSet;
    function TipePembayaran_GetDSOverview: TDataSet;
    function TipePerusahaan_GetDSOverview: TDataSet;


  end;

  {$METHODINFO OFF}

implementation

function TTestMethod.Hallo: String;
begin
  Result := 'Hello Word';
end;

function TCrud.SaveToDB(AObject: TModApp): Boolean;
var
  lSS: TStrings;
begin
  Result := False;
  if not ValidateCode(AObject) then exit;
  lSS := TDBUtils.GenerateSQL(AObject);
  Try
    Try
      TDBUtils.ExecuteSQL(lSS, False);
      TDBUtils.Commit;
      Result := True;
    except
      TDBUtils.RollBack;
      raise;
    End;
  Finally
    lSS.Free;
  End;
end;

function TCrud.DeleteFromDB(AObject: TModApp): Boolean;
var
  lSS: TStrings;
begin
  Result := False;
  lSS := TDBUtils.GenerateSQLDelete(AObject);
  Try
    Try
      TDBUtils.ExecuteSQL(lSS, False);
      TDBUtils.Commit;
      Result := True;
    except
      TDBUtils.RollBack;
      raise;
    End;
  Finally
    lSS.Free;
  End;
end;

function TCrud.OpenQuery(S: string): TDataSet;
begin
  Result := TDBUtils.OpenQuery(S);
end;

function TCrud.Retrieve(ModAppClass: TModAppClass; AID: String): TModApp;
begin
  Result := ModAppClass.Create;
  TDBUtils.LoadFromDB(Result, AID);
end;

function TCrud.Retrieve(ModClassName, AID: string): TModApp;
var
  lClass: TModAppClass;
begin
  lClass := Self.StringToClass(ModClassName);
  If not Assigned(lClass) then
    Raise Exception.Create('Class ' + ModClassName + ' not found');
  Result := Self.Retrieve(lClass, AID);
end;

function TCrud.StringToClass(ModClassName: string): TModAppClass;
var
  ctx: TRttiContext;
  typ: TRttiType;
  list: TArray<TRttiType>;
begin
  Result := nil;
  ctx := TRttiContext.Create;
  list := ctx.GetTypes;
  for typ in list do
    begin
      if typ.IsInstance and (EndsText(ModClassName, typ.Name)) then
        begin
          Result := TModAppClass(typ.AsInstance.MetaClassType);
          break;
        end;
    end;
  ctx.Free;
end;

function TCrud.TestGenerateSQL(AObject: TModApp): TStrings;
begin
  Result := TDBUtils.GenerateSQL(AObject);
end;

function TCrud.ValidateCode(AOBject: TModApp): Boolean;
var
  S: string;
  sFilter: string;
begin
  Result  := True;
  if AObject.PropFromAttr(AttributeOfCode, False) = nil then
    exit;
  sFilter := AOBject.GetCodeField + ' = ' + QuotedStr(AObject.GetCodeValue);
  if AOBject.ID <> '' then
    sFilter := sFilter + ' And ' + AOBject.GetPrimaryField + ' <> ' + QuotedStr(AOBject.ID);
  S := Format(SQL_Select,['*', AOBject.GetTableName, sFilter]);
  with TDBUtils.OpenQuery(S) do
  begin
    Try
      Result := EOF;
    Finally
      Free;
    End;
  end;
  if not Result then
    raise Exception.Create(AOBject.GetTableName + '.' + AOBject.GetCodeField
      + ' : ' + AOBject.GetCodeValue + ' sudah ada di Database'
    );
end;

function TDSProvider.Bank_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'SELECT Bank_ID, BANK_CODE, BANK_NAME, BANK_BRANCH, BANK_ADDRESS,'
      +' BANK_REK_CODE, BANK_DESCRIPTION,'
      +' BANK_REK_COMP_ID, OP_CREATE, DATE_CREATE, DATE_MODIFY'
      +' FROM BANK';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Rekening_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'select REKENING_ID, REK_CODE, REK_NAME, REK_DESCRIPTION, REF$GRUP_REKENING_ID from REKENING';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.RefPajak_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'SELECT * from REF$PAJAK';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.RefTipeBarang_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'SELECT * from REF$TIPE_BARANG';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.GroupRekening_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'select REF$GRUP_REKENING_ID, GROREK_NAME, GROREK_DESCRIPTION from REF$GRUP_REKENING';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Rekening_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select REKENING_ID, (REK_CODE + '' - ''+ REK_NAME) as REKENING, REK_CODE, REK_NAME, REK_DESCRIPTION, REK_PARENT_CODE, REF$GRUP_REKENING_ID from REKENING';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Member_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select * from MEMBER';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.MemberActivasi_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select * from MEMBER_ACTIVASI';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.RefDiscMember_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select * from REF$DISC_MEMBER';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.MemberKeluarga_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select * from MEMBER_KELUARGA';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.RefGrupMember_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select * from REF$GRUP_MEMBER';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Satuan_GetDSLookup: TDataSet;
var
  S: string;
begin
  S := 'select sat_code, sat_name,sat_group, ref$satuan_id' +
       ' from ref$satuan' +
       ' ORDER by sat_code';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.Satuan_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select sat_code, sat_name,sat_group, ref$satuan_id' +
       ' from ref$satuan' +
       ' ORDER by sat_code';

  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.TipePembayaran_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'select REF$TIPE_PEMBAYARAN_ID, TPBYR_CODE, TPBYR_NAME from REF$TIPE_PEMBAYARAN';
  Result := TDBUtils.OpenQuery(S);
end;

function TDSProvider.TipePerusahaan_GetDSOverview: TDataSet;
var
  S: string;
begin
  S := 'SELECT * FROM REF$TIPE_PERUSAHAAN';
  Result := TDBUtils.OpenQuery(S);
end;

end.
