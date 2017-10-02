unit uModPOTrader;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms,
  Dialogs, uModApp, uModOrganization;

type
  TModPOTrader = class(TModApp)
  private
    FPOAS_STATUS: string;
    FPOT_DELIVER_DATE: TDatetime;
    FPOT_DISC: Double;
    FPOT_DISC_MEMBER: Double;
    FPOT_LEAD_TIME: Double;
    FPOT_NO: string;
    FPOT_Organization: TModOrganization;
    FPOT_PPN: Double;
    FPOT_PPNBM: Double;
    FPOT_SUBTOTAL: Double;
    FPOT_TOP: Integer;
    FPOT_TOTAL: Double;
    FPOT_VALID_DATE: TDatetime;
    FPO_DESCRIPTION: string;
    FPOT_DATE: TDatetime;
  published
    property POAS_STATUS: string read FPOAS_STATUS write FPOAS_STATUS;
    property POT_DATE: TDatetime read FPOT_DATE write FPOT_DATE;
    property POT_DELIVER_DATE: TDatetime read FPOT_DELIVER_DATE write
        FPOT_DELIVER_DATE;
    property POT_DISC: Double read FPOT_DISC write FPOT_DISC;
    property POT_DISC_MEMBER: Double read FPOT_DISC_MEMBER write
        FPOT_DISC_MEMBER;
    property POT_LEAD_TIME: Double read FPOT_LEAD_TIME write FPOT_LEAD_TIME;
    property POT_NO: string read FPOT_NO write FPOT_NO;
    property POT_Organization: TModOrganization read FPOT_Organization write
        FPOT_Organization;
    property POT_PPN: Double read FPOT_PPN write FPOT_PPN;
    property POT_PPNBM: Double read FPOT_PPNBM write FPOT_PPNBM;
    property POT_SUBTOTAL: Double read FPOT_SUBTOTAL write FPOT_SUBTOTAL;
    property POT_TOP: Integer read FPOT_TOP write FPOT_TOP;
    property POT_TOTAL: Double read FPOT_TOTAL write FPOT_TOTAL;
    property POT_VALID_DATE: TDatetime read FPOT_VALID_DATE write
        FPOT_VALID_DATE;
    property PO_DESCRIPTION: string read FPO_DESCRIPTION write FPO_DESCRIPTION;
  end;


implementation



end.
