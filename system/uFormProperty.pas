unit uFormProperty;

interface

type
  TTipeApp = (THO, TSTORE); //hanya terdapat dua tipe aplikasi store atau ho

  TFormProperty = class(TObject)
  public
    FLoginFullname  : string;
    FLoginRole      : string;
    FLoginUsername  : string;
    FLoginId        : Integer;
    FLoginUnitId    : Integer;
    FMasterIsStore  : Integer;
    FMasterIsHo     : Integer;
    FFilePathReport : String;
    FSelfUnitId     : Integer;
    FSelfCompanyID  : Integer;
    FHostClient     : string;
    FIpClient       : string;
    FLoginIsStore   : Integer;
    FTipeApp        : TTipeApp;

    function GetUnitName: string;
    function GetUnitCode: string;
  end;

implementation

function TFormProperty.GetUnitName: string;
begin
  Result := '';
//  with TUnit.Create(nil) do
//  begin
//    try
//      if LoadByID(FSelfUnitId) then
//        Result := Nama;
//    finally
//      Free;
//    end;
//
//  end;
end;

function TFormProperty.GetUnitCode: string;
begin
  Result := '';
//  with TUnit.Create(nil) do
//  begin
//    try
//      if LoadByID(FSelfUnitId) then
//        Result := Kode;
//    finally
//      Free;
//    end;
//
//  end;
end;

end.
