unit uModOrganization;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  uModApp, uModMember,  uModSuplier;

type
  TModOrganization = class(TModApp)
  private
    FORG_Code: string;
    FORG_IsKaryawan: Integer;
    FORG_IsMember: Integer;
    FORG_IsSupplierMG: Integer;
    FORG_Member: TModMember;
    FORG_MerchandiseGroup: TModMerchandiseGroup;
    FORG_Name: string;
  public
    class function GetTableName: string; override;
  published
    property ORG_Code: string read FORG_Code write FORG_Code;
    property ORG_IsKaryawan: Integer read FORG_IsKaryawan write FORG_IsKaryawan;
    property ORG_IsMember: Integer read FORG_IsMember write FORG_IsMember;
    property ORG_IsSupplierMG: Integer read FORG_IsSupplierMG write
        FORG_IsSupplierMG;
    property ORG_Member: TModMember read FORG_Member write FORG_Member;
    property ORG_MerchandiseGroup: TModMerchandiseGroup read
        FORG_MerchandiseGroup write FORG_MerchandiseGroup;
    property ORG_Name: string read FORG_Name write FORG_Name;
  end;


implementation

{
******************************* TModOrganization *******************************
}
class function TModOrganization.GetTableName: string;
begin
  Result := 'VW_Organization';
end;



end.
