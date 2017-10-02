unit uModAR;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs, uModApp,
  uModRekening, uModOrganization;

type
  TModAR = class(TModApp)
  private
    FAR_ClassRef: string;
    FAR_Description: string;
    FAR_DueDate: TDatetime;
    FAR_IS_LUNAS: Integer;
    FAR_ORGANIZATION: TModOrganization;
    FAR_PAID: Double;
    FAR_REFNUM: string;
    FAR_REKENING: TModRekening;
    FAR_TOTAL: Double;
    FAR_TRANSDATE: TDatetime;
  published
    property AR_ClassRef: string read FAR_ClassRef write FAR_ClassRef;
    property AR_Description: string read FAR_Description write FAR_Description;
    property AR_DueDate: TDatetime read FAR_DueDate write FAR_DueDate;
    property AR_IS_LUNAS: Integer read FAR_IS_LUNAS write FAR_IS_LUNAS;

    [AttributeOfForeign('AR_ORGANIZATION_ID')]
    property AR_ORGANIZATION: TModOrganization read FAR_ORGANIZATION write
        FAR_ORGANIZATION;
    property AR_PAID: Double read FAR_PAID write FAR_PAID;

    [AttributeOfCode]
    property AR_REFNUM: string read FAR_REFNUM write FAR_REFNUM;
    property AR_REKENING: TModRekening read FAR_REKENING write FAR_REKENING;
    property AR_TOTAL: Double read FAR_TOTAL write FAR_TOTAL;
    property AR_TRANSDATE: TDatetime read FAR_TRANSDATE write FAR_TRANSDATE;
  end;


implementation



end.
