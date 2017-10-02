unit uModCustomerInvoice;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  uModAP, uModApp, uModOrganization, System.Generics.Collections,
  uModAR, uModDOTrader;

type
  TModCustomerInvoiceAPMinus = class;
  TModCustomerInvoiceARNew = class;
  TModCustomerInvoiceDOTrader = class;
  TModCustomerInvoicePotongAP = class;

  TModCustomerInvoice = class(TModApp)
  private
    FCI_Description: string;
    FCI_NOBUKTI: string;
    FCI_ORGANIZATION: TModOrganization;
    FCI_TRANSDATE: TDatetime;
    FCustomerInvoiceAPMinusItems: TObjectList<TModCustomerInvoiceAPMinus>;
    FCustomerInvoiceARNewItems: TObjectList<TModCustomerInvoiceARNew>;
    FCustomerInvoiceDOTraderItems: TObjectList<TModCustomerInvoiceDOTrader>;
    FCustomerInvoicePotongAPItems: TObjectList<TModCustomerInvoicePotongAP>;
    function GetCustomerInvoiceAPMinusItems:
        TObjectList<TModCustomerInvoiceAPMinus>;
    function GeTModCustomerInvoiceARNews:
        TObjectList<TModCustomerInvoiceARNew>;
    function GetCustomerInvoiceDOTraderItems:
        TObjectList<TModCustomerInvoiceDOTrader>;
    function GetCustomerInvoicePotongAPItems:
        TObjectList<TModCustomerInvoicePotongAP>;
  public
    property CustomerInvoiceAPMinusItems:
        TObjectList<TModCustomerInvoiceAPMinus> read
        GetCustomerInvoiceAPMinusItems write FCustomerInvoiceAPMinusItems;
    property CustomerInvoiceARNewItems: TObjectList<TModCustomerInvoiceARNew>
        read GeTModCustomerInvoiceARNews write FCustomerInvoiceARNewItems;
    property CustomerInvoiceDOTraderItems:
        TObjectList<TModCustomerInvoiceDOTrader> read
        GetCustomerInvoiceDOTraderItems write FCustomerInvoiceDOTraderItems;
    property CustomerInvoicePotongAPItems:
        TObjectList<TModCustomerInvoicePotongAP> read
        GetCustomerInvoicePotongAPItems write FCustomerInvoicePotongAPItems;
  published
    property CI_Description: string read FCI_Description write FCI_Description;
    property CI_NOBUKTI: string read FCI_NOBUKTI write FCI_NOBUKTI;
    property CI_ORGANIZATION: TModOrganization read FCI_ORGANIZATION write
        FCI_ORGANIZATION;
    property CI_TRANSDATE: TDatetime read FCI_TRANSDATE write FCI_TRANSDATE;
  end;

  TModCustomerInvoiceAPMinus = class(TModApp)
  private
    FTS_AP: TModAP;
    FTS_CustomerInvoice: TModCustomerInvoice;
    FTS_DUEDATE: TDatetime;
    FTS_NOBUKTI: string;
    FTS_NOMINAL: Double;
    FTS_TRANSDATE: TDatetime;
  published
    property TS_AP: TModAP read FTS_AP write FTS_AP;
    property TS_CustomerInvoice: TModCustomerInvoice read FTS_CustomerInvoice
        write FTS_CustomerInvoice;
    property TS_DUEDATE: TDatetime read FTS_DUEDATE write FTS_DUEDATE;
    property TS_NOBUKTI: string read FTS_NOBUKTI write FTS_NOBUKTI;
    property TS_NOMINAL: Double read FTS_NOMINAL write FTS_NOMINAL;
    property TS_TRANSDATE: TDatetime read FTS_TRANSDATE write FTS_TRANSDATE;
  end;

  TModCustomerInvoiceARNew = class(TModApp)
  private
    FCIPARNEW_AR: TModAR;
    FCIPARNEW_CustomerInvoice: TModCustomerInvoice;
    FCIPARNEW_DUEDATE: TDatetime;
    FCIPARNEW_NOBUKTI: string;
    FCIPARNEW_NOMINAL: Double;
    FCIPARNEW_TRANSDATE: TDatetime;
  published
    property CIPARNEW_AR: TModAR read FCIPARNEW_AR write FCIPARNEW_AR;
    property CIPARNEW_CustomerInvoice: TModCustomerInvoice read
        FCIPARNEW_CustomerInvoice write FCIPARNEW_CustomerInvoice;
    property CIPARNEW_DUEDATE: TDatetime read FCIPARNEW_DUEDATE write
        FCIPARNEW_DUEDATE;
    property CIPARNEW_NOBUKTI: string read FCIPARNEW_NOBUKTI write
        FCIPARNEW_NOBUKTI;
    property CIPARNEW_NOMINAL: Double read FCIPARNEW_NOMINAL write
        FCIPARNEW_NOMINAL;
    property CIPARNEW_TRANSDATE: TDatetime read FCIPARNEW_TRANSDATE write
        FCIPARNEW_TRANSDATE;
  end;

  TModCustomerInvoiceDOTrader = class(TModApp)
  private
    FCIDOT_AR: TModAR;
    FCIDOT_DISC: Double;
    FCIDOT_DISC_MEMBER: Double;
    FCIDOT_DOTRADER: TModDOTrader;
    FCIDOT_PPN: Double;
    FCIDOT_PPNBM: Double;
    FCIDOT_SUBTOTAL: Double;
    FCIDOT_TOTAL: Double;
    FModCustomerInvoice: TModCustomerInvoice;
  published
    property CIDOT_AR: TModAR read FCIDOT_AR write FCIDOT_AR;
    property CIDOT_DISC: Double read FCIDOT_DISC write FCIDOT_DISC;
    property CIDOT_DISC_MEMBER: Double read FCIDOT_DISC_MEMBER write
        FCIDOT_DISC_MEMBER;
    property CIDOT_DOTRADER: TModDOTrader read FCIDOT_DOTRADER write
        FCIDOT_DOTRADER;
    property CIDOT_PPN: Double read FCIDOT_PPN write FCIDOT_PPN;
    property CIDOT_PPNBM: Double read FCIDOT_PPNBM write FCIDOT_PPNBM;
    property CIDOT_SUBTOTAL: Double read FCIDOT_SUBTOTAL write FCIDOT_SUBTOTAL;
    property CIDOT_TOTAL: Double read FCIDOT_TOTAL write FCIDOT_TOTAL;
    property ModCustomerInvoice: TModCustomerInvoice read FModCustomerInvoice
        write FModCustomerInvoice;
  end;

  TModCustomerInvoicePotongAP = class(TModApp)
  private
    FCIPOTAP_AP: TModAP;
    FCIPOTAP_CustomerInvoice: TModCustomerInvoice;
    FCIPOTAP_NOBUKTI: string;
    FCIPOTAP_NOMINAL: Double;
    FCIPOTAP_TRANSDATE: TDatetime;
  published
    property CIPOTAP_AP: TModAP read FCIPOTAP_AP write FCIPOTAP_AP;
    property CIPOTAP_CustomerInvoice: TModCustomerInvoice read
        FCIPOTAP_CustomerInvoice write FCIPOTAP_CustomerInvoice;
    property CIPOTAP_NOBUKTI: string read FCIPOTAP_NOBUKTI write
        FCIPOTAP_NOBUKTI;
    property CIPOTAP_NOMINAL: Double read FCIPOTAP_NOMINAL write
        FCIPOTAP_NOMINAL;
    property CIPOTAP_TRANSDATE: TDatetime read FCIPOTAP_TRANSDATE write
        FCIPOTAP_TRANSDATE;
  end;


implementation

{
***************************** TModCustomerInvoice ******************************
}
function TModCustomerInvoice.GetCustomerInvoiceAPMinusItems:
    TObjectList<TModCustomerInvoiceAPMinus>;
begin
  Result := FCustomerInvoiceAPMinusItems;
end;

function TModCustomerInvoice.GeTModCustomerInvoiceARNews:
    TObjectList<TModCustomerInvoiceARNew>;
begin
  Result := FCustomerInvoiceARNewItems;
end;

function TModCustomerInvoice.GetCustomerInvoiceDOTraderItems:
    TObjectList<TModCustomerInvoiceDOTrader>;
begin
  Result := FCustomerInvoiceDOTraderItems;
end;

function TModCustomerInvoice.GetCustomerInvoicePotongAPItems:
    TObjectList<TModCustomerInvoicePotongAP>;
begin
  Result := FCustomerInvoicePotongAPItems;
end;



end.
