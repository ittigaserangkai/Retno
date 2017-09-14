unit uModOrganization;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  uModApp, uModMember,  uModSuplier;

type
  TModOrganization = class(TModApp)
  private
    FORG_Address: string;
    FORG_Code: string;
    FORG_FEE: Double;
    FORG_IsKaryawan: Integer;
    FORG_IsMember: Integer;
    FORG_IsSupplierMG: Integer;
    FORG_Member: TModMember;
    FORG_MerchandiseGroup: TModMerchandiseGroup;
    FORG_Name: string;
    FORG_NPWP: string;
    FORG_PostCode: string;
    FORG_PPN: Double;
    FORG_Telp: string;
  public
    class function GetTableName: string; override;
  published
    property ORG_Address: string read FORG_Address write FORG_Address;
    [AttributeOfCode]
    property ORG_Code: string read FORG_Code write FORG_Code;
    property ORG_FEE: Double read FORG_FEE write FORG_FEE;

    property ORG_IsKaryawan: Integer read FORG_IsKaryawan write FORG_IsKaryawan;
    property ORG_IsMember: Integer read FORG_IsMember write FORG_IsMember;
    property ORG_IsSupplierMG: Integer read FORG_IsSupplierMG write
        FORG_IsSupplierMG;
    property ORG_Member: TModMember read FORG_Member write FORG_Member;
    property ORG_MerchandiseGroup: TModMerchandiseGroup read
        FORG_MerchandiseGroup write FORG_MerchandiseGroup;
    property ORG_Name: string read FORG_Name write FORG_Name;
    property ORG_NPWP: string read FORG_NPWP write FORG_NPWP;
    property ORG_PostCode: string read FORG_PostCode write FORG_PostCode;
    property ORG_PPN: Double read FORG_PPN write FORG_PPN;
    property ORG_Telp: string read FORG_Telp write FORG_Telp;
  end;


implementation

{
******************************* TModOrganization *******************************
}
class function TModOrganization.GetTableName: string;
begin
  Result := 'V_ORGANIZATION';
end;



end.
