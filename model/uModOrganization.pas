unit uModOrganization;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  uModApp, uModMember,  uModSuplier;

type
  TModOrganization = class(TModApp)
  private
    FBP_Code: string;
    FBP_IsKaryawan: Integer;
    FBP_IsMember: Integer;
    FBP_IsSupplierMG: Integer;
    FBP_Member: TModMember;
    FBP_MerchandiseGroup: TModMerchandiseGroup;
    FBP_Name: string;
  public
    class function GetTableName: String; override;
  published
    property BP_Code: string read FBP_Code write FBP_Code;
    property BP_IsKaryawan: Integer read FBP_IsKaryawan write FBP_IsKaryawan;
    property BP_IsMember: Integer read FBP_IsMember write FBP_IsMember;
    property BP_IsSupplierMG: Integer read FBP_IsSupplierMG write FBP_IsSupplierMG;
    property BP_Member: TModMember read FBP_Member write FBP_Member;
    property BP_MerchandiseGroup: TModMerchandiseGroup read
        FBP_MerchandiseGroup write FBP_MerchandiseGroup;
    property BP_Name: string read FBP_Name write FBP_Name;
  end;


implementation

class function TModOrganization.GetTableName: String;
begin
  Result := 'VW_Organization';
end;



end.
