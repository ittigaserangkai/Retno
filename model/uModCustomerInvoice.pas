unit uModCustomerInvoice;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  uModAP, uModApp, uModOrganization, System.Generics.Collections,
  uModAR, uModDOTrader, uModRekening;

type
  TModCustomerInvoiceAPMinus = class;
  TModCustomerInvoiceARNew = class;
  TModCustomerInvoiceDOTrader = class;
  TModCustomerInvoicePotongAP = class;

  TModCustomerInvoice = class(TModApp)
  private
    FCI_REKENING: TModRekening;
    FCI_Description: string;
    FCI_NOBUKTI: string;
    FCI_NOINVOICE: string;
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
    property CI_REKENING: TModRekening read FCI_REKENING write FCI_REKENING;
    property CI_Description: string read FCI_Description write FCI_Description;

    [AttributeOfCode]
    property CI_NOBUKTI: string read FCI_NOBUKTI write FCI_NOBUKTI;
    property CI_NOINVOICE: string read FCI_NOINVOICE write FCI_NOINVOICE;
    property CI_ORGANIZATION: TModOrganization read FCI_ORGANIZATION write
        FCI_ORGANIZATION;
    property CI_TRANSDATE: TDatetime read FCI_TRANSDATE write FCI_TRANSDATE;
  end;

  TModCustomerInvoiceAPMinus = class(TModApp)
  private
    FCIPAMINUS_AP: TModAP;
    FCIPAMINUS_CustomerInvoice: TModCustomerInvoice;
    FCIPAMINUS_DUEDATE: TDatetime;
    FCIPAMINUS_NOBUKTI: string;
    FCIPAMINUS_NOMINAL: Double;
    FCIPAMINUS_TRANSDATE: TDatetime;
  published
    property CIPAMINUS_AP: TModAP read FCIPAMINUS_AP write FCIPAMINUS_AP;

    [AttributeOfHeader('CIPAMINUS_CustomerInvoice_ID')]
    property CIPAMINUS_CustomerInvoice: TModCustomerInvoice read FCIPAMINUS_CustomerInvoice
        write FCIPAMINUS_CustomerInvoice;
    property CIPAMINUS_DUEDATE: TDatetime read FCIPAMINUS_DUEDATE write FCIPAMINUS_DUEDATE;
    property CIPAMINUS_NOBUKTI: string read FCIPAMINUS_NOBUKTI write FCIPAMINUS_NOBUKTI;
    property CIPAMINUS_NOMINAL: Double read FCIPAMINUS_NOMINAL write FCIPAMINUS_NOMINAL;
    property CIPAMINUS_TRANSDATE: TDatetime read FCIPAMINUS_TRANSDATE write FCIPAMINUS_TRANSDATE;
  end;

  TModCustomerInvoiceARNew = class(TModApp)
  private
    FCIPARNEW_CustomerInvoice: TModCustomerInvoice;
    FCIPARNEW_DESCRIPTION: string;
    FCIPARNEW_NOMINAL: Double;
    FCIPARNEW_REKENING: TModRekening;
  published
    [AttributeOfHeader('CIPARNEW_CustomerInvoice_ID')]
    property CIPARNEW_CustomerInvoice: TModCustomerInvoice read
        FCIPARNEW_CustomerInvoice write FCIPARNEW_CustomerInvoice;
    property CIPARNEW_DESCRIPTION: string read FCIPARNEW_DESCRIPTION write
        FCIPARNEW_DESCRIPTION;
    property CIPARNEW_NOMINAL: Double read FCIPARNEW_NOMINAL write
        FCIPARNEW_NOMINAL;
    property CIPARNEW_REKENING: TModRekening read FCIPARNEW_REKENING write
        FCIPARNEW_REKENING;
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
    FCIDOT_CustomerInvoice: TModCustomerInvoice;
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

    [AttributeOfHeader('CIDOT_CustomerInvoice_ID')]
    property CIDOT_CustomerInvoice: TModCustomerInvoice read FCIDOT_CustomerInvoice
        write FCIDOT_CustomerInvoice;
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

    [AttributeOfHeader('CIPOTAP_CustomerInvoice_ID')]
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
  if FCustomerInvoiceAPMinusItems = nil then
    FCustomerInvoiceAPMinusItems := TObjectList<TModCustomerInvoiceAPMinus>.Create();

  Result := FCustomerInvoiceAPMinusItems;
end;

function TModCustomerInvoice.GeTModCustomerInvoiceARNews:
    TObjectList<TModCustomerInvoiceARNew>;
begin
  if FCustomerInvoiceARNewItems  = nil then
    FCustomerInvoiceARNewItems := TObjectList<TModCustomerInvoiceARNew>.Create();

  Result := FCustomerInvoiceARNewItems;
end;

function TModCustomerInvoice.GetCustomerInvoiceDOTraderItems:
    TObjectList<TModCustomerInvoiceDOTrader>;
begin
  if FCustomerInvoiceDOTraderItems = nil then
    FCustomerInvoiceDOTraderItems := TObjectList<TModCustomerInvoiceDOTrader>.Create();

  Result := FCustomerInvoiceDOTraderItems;
end;

function TModCustomerInvoice.GetCustomerInvoicePotongAPItems:
    TObjectList<TModCustomerInvoicePotongAP>;
begin
  if FCustomerInvoicePotongAPItems = nil then
    FCustomerInvoicePotongAPItems := TObjectList<TModCustomerInvoicePotongAP>.Create();

  Result := FCustomerInvoicePotongAPItems;

end;



end.
