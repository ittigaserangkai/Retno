unit uModContrabonSales;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs, uModApp,
  uModRekening, uModOrganization, uModUnit;

type
  TModContrabonSales = class(TModApp)
  private
    FCONT_IS_CONTRABON: Integer;
    FCONT_NET_SALES: Double;
    FCONT_DATE_SALES: TDatetime;
    FCONT_IS_CLAIM: Integer;
    FCONT_ORGANIZATION: TModOrganization;
    FCONT_DISC_AMOUNT: Double;
    FCONT_IS_VALIDATED: Integer;
    FCONT_TOTAL_SALES: Double;
    FCONT_FEE: Double;
    FCONT_GROSS_SALES: double;
    FCONT_TAX_AMOUNT: Double;
  public
    class function GetTableName: String; override;
  published
    property CONT_IS_CONTRABON: Integer read FCONT_IS_CONTRABON write
        FCONT_IS_CONTRABON;
    property CONT_NET_SALES: Double read FCONT_NET_SALES write FCONT_NET_SALES;
    property CONT_DATE_SALES: TDatetime read FCONT_DATE_SALES write
        FCONT_DATE_SALES;
    property CONT_IS_CLAIM: Integer read FCONT_IS_CLAIM write FCONT_IS_CLAIM;

    [AttributeOfForeign('CONT_ORGANIZATION_ID')]
    property CONT_ORGANIZATION: TModOrganization read FCONT_ORGANIZATION write
        FCONT_ORGANIZATION;
    property CONT_DISC_AMOUNT: Double read FCONT_DISC_AMOUNT write
        FCONT_DISC_AMOUNT;
    property CONT_IS_VALIDATED: Integer read FCONT_IS_VALIDATED write
        FCONT_IS_VALIDATED;
    property CONT_TOTAL_SALES: Double read FCONT_TOTAL_SALES write
        FCONT_TOTAL_SALES;
    property CONT_FEE: Double read FCONT_FEE write FCONT_FEE;
    property CONT_GROSS_SALES: double read FCONT_GROSS_SALES write
        FCONT_GROSS_SALES;
    property CONT_TAX_AMOUNT: Double read FCONT_TAX_AMOUNT write FCONT_TAX_AMOUNT;


  end;


implementation

class function TModContrabonSales.GetTableName: String;
begin
  Result := 'CONTRABON_SALES';
end;



end.
