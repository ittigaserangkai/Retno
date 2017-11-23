unit uModReceipt;

interface
uses
  uModApp, uModRekening, uModOrganization, uModBank, uModTipePembayaran,
  uModAR, uModAP, uModCostCenter;

type
  TModReceipt = class(TModApp)
  private
    FREC_NOBUKTI: string;
    FREC_TGLBUKTI: TDateTime;
    FREC_NOMINAL: Double;
    FREC_DESCRIPTION: string;
    FREC_BANK: TModBank;
    FREC_NOREF: string;
    FREC_ORGANIZATION: TModOrganization;
    FREC_TIPEPEMBAYARAN: TModTipePembayaran;
    FREKENING: TModRekening;
  public
    class function GetTableName: String; override;
  published
    [AttributeOfCode]
    property REC_NOBUKTI: string read FREC_NOBUKTI write FREC_NOBUKTI;
    property REC_TGLBUKTI: TDateTime read FREC_TGLBUKTI write FREC_TGLBUKTI;
    property REC_NOMINAL: Double read FREC_NOMINAL write FREC_NOMINAL;
    property REC_DESCRIPTION: string read FREC_DESCRIPTION write FREC_DESCRIPTION;
    property REC_BANK: TModBank read FREC_BANK write FREC_BANK;
    property REC_NOREF: string read FREC_NOREF write FREC_NOREF;
    property REC_ORGANIZATION: TModOrganization read FREC_ORGANIZATION write
        FREC_ORGANIZATION;
    property REC_TIPEPEMBAYARAN: TModTipePembayaran read FREC_TIPEPEMBAYARAN write
        FREC_TIPEPEMBAYARAN;
    property REKENING: TModRekening read FREKENING write FREKENING;
  end;

  TModReceiptARItem = class(TModApp)
  private
    FRECARITEM_AR: TModAR;
    FRECARITEM_DESCRIPTION: string;
    FRECARITEM_NOMINAL: Double;
  public
    class function GetTableName: String; override;
  published
    property RECARITEM_AR: TModAR read FRECARITEM_AR write FRECARITEM_AR;
    property RECARITEM_DESCRIPTION: string read FRECARITEM_DESCRIPTION write
        FRECARITEM_DESCRIPTION;
    property RECARITEM_NOMINAL: Double read FRECARITEM_NOMINAL write
        FRECARITEM_NOMINAL;
  end;

type
  TModReceiptAPItem = class(TModApp)
  private
    FRECAPITEM_REKENING: TModRekening;
    FRECAPITEM_AP: TModAP;
    FRECAPITEM_DESCRIPTION: string;
    FRECAPITEM_NOMINAL: Double;
    FRECARITEM_DUEDATE: TDateTime;
  public
    class function GetTableName: String; override;
  published
    property RECAPITEM_REKENING: TModRekening read FRECAPITEM_REKENING write
        FRECAPITEM_REKENING;
    property RECAPITEM_AP: TModAP read FRECAPITEM_AP write FRECAPITEM_AP;
    property RECAPITEM_DESCRIPTION: string read FRECAPITEM_DESCRIPTION write
        FRECAPITEM_DESCRIPTION;
    property RECAPITEM_NOMINAL: Double read FRECAPITEM_NOMINAL write
        FRECAPITEM_NOMINAL;
    property RECARITEM_DUEDATE: TDateTime read FRECARITEM_DUEDATE write
        FRECARITEM_DUEDATE;
  end;

type
  TModReceiptOI = class(TModApp)
  private
    FRECOIITEM_ALLOCATION: TModCostCenter;
    FRECOIITEM_REKENING: TModRekening;
    FRECOIITEM_DESCRIPTION: string;
    FRECOIITEM_NOMINAL: Double;
  public
    class function GetTableName: String; override;
  published
    property RECOIITEM_ALLOCATION: TModCostCenter read FRECOIITEM_ALLOCATION write
        FRECOIITEM_ALLOCATION;
    property RECOIITEM_REKENING: TModRekening read FRECOIITEM_REKENING write
        FRECOIITEM_REKENING;
    property RECOIITEM_DESCRIPTION: string read FRECOIITEM_DESCRIPTION write
        FRECOIITEM_DESCRIPTION;
    property RECOIITEM_NOMINAL: Double read FRECOIITEM_NOMINAL write
        FRECOIITEM_NOMINAL;
  end;

type
  TModReceiptChequeItem = class(TModApp)
  private
    FRECCHEQUEIITEM_CHECKNUM: string;
    FRECCHEQUEIITEM_BANK: string;
    FRECCHEQUEIITEM_DESCRIPTION: string;
    FRECCHEQUEIITEM_DUEDATE: TDateTime;
    FRECCHEQUEIITEM_NOMINAL: Double;
  public
    class function GetTableName: String; override;
  published
    property RECCHEQUEIITEM_CHECKNUM: string read FRECCHEQUEIITEM_CHECKNUM write
        FRECCHEQUEIITEM_CHECKNUM;
    property RECCHEQUEIITEM_BANK: string read FRECCHEQUEIITEM_BANK write
        FRECCHEQUEIITEM_BANK;
    property RECCHEQUEIITEM_DESCRIPTION: string read FRECCHEQUEIITEM_DESCRIPTION
        write FRECCHEQUEIITEM_DESCRIPTION;
    property RECCHEQUEIITEM_DUEDATE: TDateTime read FRECCHEQUEIITEM_DUEDATE write
        FRECCHEQUEIITEM_DUEDATE;
    property RECCHEQUEIITEM_NOMINAL: Double read FRECCHEQUEIITEM_NOMINAL write
        FRECCHEQUEIITEM_NOMINAL;
  end;

implementation

class function TModReceipt.GetTableName: String;
begin
  Result := 'RECEIPT';
end;

class function TModReceiptARItem.GetTableName: String;
begin
  Result := 'RECEIPT_ARITEM';
end;

class function TModReceiptAPItem.GetTableName: String;
begin
  Result := 'RECEIPT_ARITEM';
end;

class function TModReceiptOI.GetTableName: String;
begin
  Result := 'RECEIPT_ARITEM';
end;

class function TModReceiptChequeItem.GetTableName: String;
begin
  Result := 'RECEIPT_ARITEM';
end;

initialization
  TModReceipt.RegisterRTTI;



end.
