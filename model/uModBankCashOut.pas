unit uModBankCashOut;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs, uModApp,
  System.Generics.Collections, uModBank, uModOrganization, uModAP, uModCostCenter, uModRekening;

type
  TModBankCashOutAPItem = class;
  TModBankCashOutOtherItem = class;
  TModBankCashOutChequeItem = class;


  TModBankCashOut = class(TModApp)
  private
    FBCO_Bank: TModBank;
    FBCO_BankCashOutAPItems: TObjectList<TModBankCashOutAPItem>;
    FBCO_BankCashOutChequeItems: TObjectList<TModBankCashOutChequeItem>;
    FBCO_BankCashOutOtherItems: TObjectList<TModBankCashOutOtherItem>;
    FBCO_Keterangan: string;
    FBCO_NoBukti: string;
    FBCO_Organization: TModOrganization;
    FBCO_TotalOther: Double;
    FBCO_Tanggal: TDatetime;
    FBCO_Total: Double;
    FBCO_TotalHutang: Double;
    function GetBCO_BankCashOutAPItems: TObjectList<TModBankCashOutAPItem>;
    function GetBCO_BankCashOutChequeItems: TObjectList<TModBankCashOutChequeItem>;
    function GetBCO_BankCashOutOtherItems: TObjectList<TModBankCashOutOtherItem>;
  public
    property BCO_BankCashOutAPItems: TObjectList<TModBankCashOutAPItem> read
        GetBCO_BankCashOutAPItems write FBCO_BankCashOutAPItems;
    property BCO_BankCashOutChequeItems: TObjectList<TModBankCashOutChequeItem>
        read GetBCO_BankCashOutChequeItems write FBCO_BankCashOutChequeItems;
    property BCO_BankCashOutOtherItems: TObjectList<TModBankCashOutOtherItem> read
        GetBCO_BankCashOutOtherItems write FBCO_BankCashOutOtherItems;
  published
    [AttributeOfCode]
    property BCO_NoBukti: string read FBCO_NoBukti write FBCO_NoBukti;
    property BCO_Bank: TModBank read FBCO_Bank write FBCO_Bank;
    property BCO_Keterangan: string read FBCO_Keterangan write FBCO_Keterangan;

    property BCO_Organization: TModOrganization read FBCO_Organization write
        FBCO_Organization;
    property BCO_TotalOther: Double read FBCO_TotalOther write FBCO_TotalOther;
    property BCO_Tanggal: TDatetime read FBCO_Tanggal write FBCO_Tanggal;
    property BCO_Total: Double read FBCO_Total write FBCO_Total;
    property BCO_TotalHutang: Double read FBCO_TotalHutang write
        FBCO_TotalHutang;
  end;

  TModBankCashOutAPItem = class(TModApp)
  private
    FBCOAP_AP: TModAP;
    FBCOAP_BankCashOut: TModBankCashOut;
    FBCOAP_Keterangan: string;
    FBCOAP_Nominal: Double;
    FBCOAP_Rekening: TModRekening;
  published
    property BCOAP_AP: TModAP read FBCOAP_AP write FBCOAP_AP;

    [AttributeOfHeader('BCOAP_BankCashOut_ID')]
    property BCOAP_BankCashOut: TModBankCashOut read FBCOAP_BankCashOut write
        FBCOAP_BankCashOut;
    property BCOAP_Keterangan: string read FBCOAP_Keterangan write
        FBCOAP_Keterangan;
    property BCOAP_Nominal: Double read FBCOAP_Nominal write FBCOAP_Nominal;
    property BCOAP_Rekening: TModRekening read FBCOAP_Rekening write
        FBCOAP_Rekening;
  end;

  TModBankCashOutChequeItem = class(TModApp)
  private
    FBCOCHE_BankCashOut: TModBankCashOut;
    FBCOCHE_JatuhTempo: TDatetime;
    FBCOCHE_Keterangan: string;
    FBCOCHE_No: string;
    FBCOCHE_Nominal: Double;
  published
    [AttributeOfHeader('BCOCHE_BankCashOut_id')]
    property BCOCHE_BankCashOut: TModBankCashOut read FBCOCHE_BankCashOut write
        FBCOCHE_BankCashOut;
    property BCOCHE_JatuhTempo: TDatetime read FBCOCHE_JatuhTempo write
        FBCOCHE_JatuhTempo;
    property BCOCHE_Keterangan: string read FBCOCHE_Keterangan write
        FBCOCHE_Keterangan;
    property BCOCHE_No: string read FBCOCHE_No write FBCOCHE_No;
    property BCOCHE_Nominal: Double read FBCOCHE_Nominal write FBCOCHE_Nominal;
  end;

  TModBankCashOutOtherItem = class(TModApp)
  private
    FBCOOTH_BankCashOut: TModBankCashOut;
    FBCOOTH_CostCenter: TModCostCenter;
    FBCOOTH_Keterangan: string;
    FBCOOTH_Nominal: Double;
    FBCOOTH_Rekening: TModRekening;
  published
    [AttributeOfHeader('BCOOTH_BankCashOut_ID')]
    property BCOOTH_BankCashOut: TModBankCashOut read FBCOOTH_BankCashOut write
        FBCOOTH_BankCashOut;
    property BCOOTH_CostCenter: TModCostCenter read FBCOOTH_CostCenter write
        FBCOOTH_CostCenter;
    property BCOOTH_Keterangan: string read FBCOOTH_Keterangan write
        FBCOOTH_Keterangan;
    property BCOOTH_Nominal: Double read FBCOOTH_Nominal write FBCOOTH_Nominal;
    property BCOOTH_Rekening: TModRekening read FBCOOTH_Rekening write
        FBCOOTH_Rekening;
  end;

type
  TModBankCashOutARItem = class(TModApp)
  private
    FBCOAR_AR: TModAP;
    FBCOAR_BankCashOut: TModBankCashOut;
    FBCOAR_Keterangan: string;
    FBCOAR_Nominal: Double;
    FBCOAR_Rekening: TModRekening;
  published
    property BCOAR_AR: TModAP read FBCOAR_AR write FBCOAR_AR;

    [AttributeOfHeader('BCOAP_BankCashOut_ID')]
    property BCOAR_BankCashOut: TModBankCashOut read FBCOAR_BankCashOut write
        FBCOAR_BankCashOut;
    property BCOAR_Keterangan: string read FBCOAR_Keterangan write
        FBCOAR_Keterangan;
    property BCOAR_Nominal: Double read FBCOAR_Nominal write FBCOAR_Nominal;
    property BCOAR_Rekening: TModRekening read FBCOAR_Rekening write
        FBCOAR_Rekening;
  end;


implementation

function TModBankCashOut.GetBCO_BankCashOutAPItems:
    TObjectList<TModBankCashOutAPItem>;
begin
  if FBCO_BankCashOutAPItems = nil then
    FBCO_BankCashOutAPItems := TObjectList<TModBankCashOutAPItem>.Create();

  Result := FBCO_BankCashOutAPItems;
end;

function TModBankCashOut.GetBCO_BankCashOutChequeItems:
    TObjectList<TModBankCashOutChequeItem>;
begin
  if FBCO_BankCashOutChequeItems = nil then
    FBCO_BankCashOutChequeItems := TObjectList<TModBankCashOutChequeItem>.Create();

  Result := FBCO_BankCashOutChequeItems;
end;

function TModBankCashOut.GetBCO_BankCashOutOtherItems:
    TObjectList<TModBankCashOutOtherItem>;
begin
  if FBCO_BankCashOutOtherItems = nil then
    FBCO_BankCashOutOtherItems := TObjectList<TModBankCashOutOtherItem>.Create;

  Result := FBCO_BankCashOutOtherItems;
end;



end.
