unit uModAP;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs, uModApp,
  uModRekening, uModOrganization;

type
  TModAP = class(TModApp)
  private
    FAP_ClassRef: string;
    FAP_Description: string;
    FAP_DueDate: TDatetime;
    FAP_ORGANIZATION: TModOrganization;
    FAP_PAID: Double;
    FAP_REFNUM: string;
    FAP_REKENING: TModRekening;
    FAP_TOTAL: Double;
    FAP_TRANSDATE: TDatetime;
  published
    property AP_ClassRef: string read FAP_ClassRef write FAP_ClassRef;
    property AP_Description: string read FAP_Description write FAP_Description;
    property AP_DueDate: TDatetime read FAP_DueDate write FAP_DueDate;
    property AP_ORGANIZATION: TModOrganization read FAP_ORGANIZATION write
        FAP_ORGANIZATION;
    property AP_PAID: Double read FAP_PAID write FAP_PAID;
    property AP_REFNUM: string read FAP_REFNUM write FAP_REFNUM;
    property AP_REKENING: TModRekening read FAP_REKENING write FAP_REKENING;
    property AP_TOTAL: Double read FAP_TOTAL write FAP_TOTAL;
    property AP_TRANSDATE: TDatetime read FAP_TRANSDATE write FAP_TRANSDATE;
  end;


implementation



end.
