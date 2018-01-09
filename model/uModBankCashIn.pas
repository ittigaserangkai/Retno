unit uModBankCashIn;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms,
  Dialogs,uModApp, System.Generics.Collections, uModBank, uModOrganization,
  uModAP, uModAR, uModRekening, uModCostCenter, System.Rtti;

type
  TModBankCashInAPNewItem = class;
  TModBankCashInARItem = class;
  TModBankCashInChequeItem = class;
  TModBankCashInOIItem = class;


  TModBankCashIn = class(TModApp)
  private
    FBCI_Bank: TModBank;
    FBCI_BankCashInAPNewItems: TObjectList<TModBankCashInAPNewItem>;
    FBCI_BankCashInARItems: TObjectList<TModBankCashInARItem>;
    FBCI_BankCashInChequeItems: TobjectList<TModBankCashInChequeItem>;
    FBCI_BankCashInOIItems: TobjectList<TModBankCashInOIItem>;
    FBCI_Keterangan: string;
    FBCI_NoBukti: string;
    FBCI_Organization: TModOrganization;
    FBCI_Ref: string;
    FBCI_Tanggal: TDatetime;
    FBCI_Total: Double;
    FBCI_Total_APNEW: Integer;
    FBCI_Total_AR: Integer;
    FBCI_Total_OI: Double;
  public
    property BCI_BankCashInAPNewItems: TObjectList<TModBankCashInAPNewItem>
        read FBCI_BankCashInAPNewItems write FBCI_BankCashInAPNewItems;
    property BCI_BankCashInARItems: TObjectList<TModBankCashInARItem> read
        FBCI_BankCashInARItems write FBCI_BankCashInARItems;
    property BCI_BankCashInChequeItems: TobjectList<TModBankCashInChequeItem>
        read FBCI_BankCashInChequeItems write FBCI_BankCashInChequeItems;
    property BCI_BankCashInOIItems: TobjectList<TModBankCashInOIItem> read
        FBCI_BankCashInOIItems write FBCI_BankCashInOIItems;

  published
    property BCI_Keterangan: string read FBCI_Keterangan write FBCI_Keterangan;
    property BCI_Bank: TModBank read FBCI_Bank write FBCI_Bank;
    property BCI_NoBukti: string read FBCI_NoBukti write FBCI_NoBukti;
    property BCI_Organization: TModOrganization read FBCI_Organization write
        FBCI_Organization;
    property BCI_Ref: string read FBCI_Ref write FBCI_Ref;
    property BCI_Tanggal: TDatetime read FBCI_Tanggal write FBCI_Tanggal;
    property BCI_Total: Double read FBCI_Total write FBCI_Total;
    property BCI_Total_APNEW: Integer read FBCI_Total_APNEW write
        FBCI_Total_APNEW;
    property BCI_Total_AR: Integer read FBCI_Total_AR write FBCI_Total_AR;
    property BCI_Total_OI: Double read FBCI_Total_OI write FBCI_Total_OI;
  end;

  TModBankCashInAPNewItem = class(TModApp)
  private
    FBCIAOBEW_AP: TModAP;
    FBCIAPNEW_BankCashIn: TModBankCashIn;
    FBCIAPNEW_Keterangan: string;
    FBCIAPNEW_Nominal: Double;
    FBCIAPNEW_Rekening: TModRekening;
  published
    property BCIAOBEW_AP: TModAP read FBCIAOBEW_AP write FBCIAOBEW_AP;
    property BCIAPNEW_BankCashIn: TModBankCashIn read FBCIAPNEW_BankCashIn
        write FBCIAPNEW_BankCashIn;
    property BCIAPNEW_Keterangan: string read FBCIAPNEW_Keterangan write
        FBCIAPNEW_Keterangan;
    property BCIAPNEW_Nominal: Double read FBCIAPNEW_Nominal write
        FBCIAPNEW_Nominal;
    property BCIAPNEW_Rekening: TModRekening read FBCIAPNEW_Rekening write
        FBCIAPNEW_Rekening;
  end;

  TModBankCashInARItem = class(TModApp)
  private
    FBCIAR_AR: TModAR;
    FBCIAR_BankCashIn: TModBankCashIn;
    FBCIAR_Keterangan: string;
    FBCIAR_Nominal: Double;
    FBCIAR_Rekening: TModRekening;
  published
    property BCIAR_AR: TModAR read FBCIAR_AR write FBCIAR_AR;
    property BCIAR_BankCashIn: TModBankCashIn read FBCIAR_BankCashIn write
        FBCIAR_BankCashIn;
    property BCIAR_Keterangan: string read FBCIAR_Keterangan write
        FBCIAR_Keterangan;
    property BCIAR_Nominal: Double read FBCIAR_Nominal write FBCIAR_Nominal;
    property BCIAR_Rekening: TModRekening read FBCIAR_Rekening write
        FBCIAR_Rekening;
  end;

  TModBankCashInChequeItem = class(TModApp)
  private
    FBCICHE_BankCashIn: TModBankCashIn;
    FBCICHE_JatuhTempo: TDatetime;
    FBCICHE_Keterangan: string;
    FBCICHE_No: string;
    FBCICHE_Nominal: Double;
  public
  published
    property BCICHE_BankCashIn: TModBankCashIn read FBCICHE_BankCashIn write
        FBCICHE_BankCashIn;
    property BCICHE_JatuhTempo: TDatetime read FBCICHE_JatuhTempo write
        FBCICHE_JatuhTempo;
    property BCICHE_Keterangan: string read FBCICHE_Keterangan write
        FBCICHE_Keterangan;
    property BCICHE_No: string read FBCICHE_No write FBCICHE_No;
    property BCICHE_Nominal: Double read FBCICHE_Nominal write FBCICHE_Nominal;
  end;

  TModBankCashInOIItem = class(TModApp)
  private
    FBCIOI_BankCashIn: TModBankCashIn;
    FBCIOI_CostCenter: TModCostCenter;
    FBCIOI_Keterangan: string;
    FBCIOI_Nominal: Double;
    FBCIOI_Rekening: TModRekening;
  published
    property BCIOI_BankCashIn: TModBankCashIn read FBCIOI_BankCashIn write
        FBCIOI_BankCashIn;
    property BCIOI_CostCenter: TModCostCenter read FBCIOI_CostCenter write
        FBCIOI_CostCenter;
    property BCIOI_Keterangan: string read FBCIOI_Keterangan write
        FBCIOI_Keterangan;
    property BCIOI_Nominal: Double read FBCIOI_Nominal write FBCIOI_Nominal;
    property BCIOI_Rekening: TModRekening read FBCIOI_Rekening write
        FBCIOI_Rekening;
  end;


implementation

initialization
  TModBankCashIn.RegisterRTTI;

end.


