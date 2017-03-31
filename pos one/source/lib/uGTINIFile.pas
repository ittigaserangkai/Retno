{*------------------------------------------------------------------------------
  File uGTINIFile berisi rutin-rutin yg digunakan untuk keperluan membaca dan
  menulis di file *.ini. Biasa untuk keperluan menyimpan konfigurasi suatu
  aplikasi.
  Copyright @ Gamatechno 2006

  @author Didit Ahendra
  @version 0.1.0 Initiate rutin
  @date 29-04-2006 Start create rutin
  @bug -
 -----------------------------------------------------------------------------*}
unit uGTINIFile;

interface

uses
  SysUtils, Forms, INIFiles;

procedure _INIWriteString(AFilename, ASection, AIdentifier, AValue: String);
procedure _INIWriteInteger(AFilename, ASection, AIdentifier: String; AValue: Integer);
procedure _INIWriteBoolean(AFilename, ASection, AIdentifier: String; AValue: Boolean);

function _INIReadString(AFilename, ASection, AIdentifier: String): String;
function _INIReadInteger(AFilename, ASection, AIdentifier: String): Integer;
function _INIReadBoolean(AFilename, ASection, AIdentifier: String): Boolean;

procedure _DeleteIdent(AFilename, ASection, AIdenfifier: String);
function _IsSectionExists(AFilename, ASection: String): Boolean;
function _IsIdentExists(AFilename, ASection, AIdentifier: String): Boolean;

implementation

procedure _INIWriteString(AFilename, ASection, AIdentifier, AValue: String);
var
  INIFile: TIniFile;
begin
  INIFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + AFilename);

  with INIFile do
  begin
    try
      WriteString(ASection, AIdentifier, AValue);
    finally
      Free;
    end;
  end;
end;

procedure _INIWriteInteger(AFilename, ASection, AIdentifier: String; AValue: Integer);
var
  INIFile: TIniFile;
begin
  INIFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + AFilename);

  with INIFile do
  begin
    try
      WriteInteger(ASection, AIdentifier, AValue);
    finally
      Free;
    end;
  end;
end;

procedure _INIWriteBoolean(AFilename, ASection, AIdentifier: String; AValue: Boolean);
var
  INIFile: TIniFile;
begin
  INIFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + AFilename);

  with INIFile do
  begin
    try
      WriteBool(ASection, AIdentifier, AValue);
    finally
      Free;
    end;
  end;
end;

function _INIReadString(AFilename, ASection, AIdentifier: String): String;
var
  INIFile: TIniFile;
begin
  INIFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + AFilename);

  with INIFile do
  begin
    try
      Result := ReadString(ASection, AIdentifier, '');
    finally
      Free;
    end;
  end;
end;

function _INIReadInteger(AFilename, ASection, AIdentifier: String): Integer;
var
  INIFile: TIniFile;
begin
  INIFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + AFilename);

  with INIFile do
  begin
    try
      Result := ReadInteger(ASection, AIdentifier, 999);
    finally
      Free;
    end;
  end;
end;

function _INIReadBoolean(AFilename, ASection, AIdentifier: String): Boolean;
var
  INIFile: TIniFile;
begin
  INIFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + AFilename);

  with INIFile do
  begin
    try
      Result := ReadBool(ASection, AIdentifier, False);
    finally
      Free;
    end;
  end;
end;

procedure _DeleteIdent(AFilename, ASection, AIdenfifier: String);
var
  INIFile: TIniFile;
begin
  INIFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + AFilename);

  with INIFile do
  begin
    try
      DeleteKey(ASection, AIdenfifier);
    finally
      Free;
    end;
  end;
end;

function _IsSectionExists(AFilename, ASection: String): Boolean;
var
  INIFile: TIniFile;
begin
  INIFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + AFilename);

  with INIFile do
  begin
    try
      Result := SectionExists(ASection);
    finally
      Free;
    end;
  end;
end;

function _IsIdentExists(AFilename, ASection, AIdentifier: String): Boolean;
var
  INIFile: TIniFile;
begin
  INIFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + AFilename);

  with INIFile do
  begin
    try
      Result := ValueExists(ASection, AIdentifier);
    finally
      Free;
    end;
  end;
end;

end.
