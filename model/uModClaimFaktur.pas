unit uModClaimFaktur;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs, uModApp,
  System.Generics.Collections, uModAP, uModRekening, uModSuplier, uModUnit,
  uModDO, uModCNRecv, uModDNRecv, uModPO;

type
  TModClaimFakturItemCN = class;
  TModClaimFakturItemDN = class;
  TModClaimFakturItemDO = class;
  TModClaimFakturOther = class;

  TModClaimFaktur = class(TModApp)
  private
    FCLM_AP: TModAP;
    FCLM_ClaimFakturItemCNs: TObjectList<TModClaimFakturItemCN>;
    FCLM_ClaimFakturItemDNs: TObjectList<TModClaimFakturItemDN>;
    FCLM_ClaimFakturItems: TObjectList<TModClaimFakturItemDO>;
    FCLM_ClaimFakturOthers: TObjectList<TModClaimFakturOther>;
    FCLM_CN_DISKON: Double;
    FCLM_CN_PPN: Double;
    FCLM_CN_PPNBM: Integer;
    FCLM_CN_SUBTOTAL: Double;
    FCLM_CN_TOTAL: Double;
    FCLM_DATE: TDatetime;
    FCLM_DISC: Double;
    FCLM_DN_DISC: Double;
    FCLM_DN_PPN: Double;
    FCLM_DN_PPNBM: Double;
    FCLM_DN_SUBTOTAL: Double;
    FCLM_DN_TOTAL: Double;
    FCLM_DO_DISC: Double;
    FCLM_DO_PPN: Double;
    FCLM_DO_PPNBM: Double;
    FCLM_DO_SUBTOTAL: Double;
    FCLM_DO_TOTAL: Double;
    FCLM_DUE_DATE: TDatetime;
    FCLM_NO: string;
    FCLM_NOMINAL: Double;
    FCLM_OTHER_TOTAL: Double;
    FCLM_PPN: Double;
    FCLM_PPNBM: Double;
    FCLM_REKENING_HUTANG: TModRekening;
    FCLM_REMARK: string;
    FCLM_RETURN_DATE: TDatetime;
    FCLM_SupplierMG: TModSuplierMerchanGroup;
    FCLM_TOTAL: Double;
    FCLM_TTF_NO: string;
    FCLM_UNIT: TModUnit;
    function GetCLM_ClaimFakturItemCNs: TObjectList<TModClaimFakturItemCN>;
    function GetCLM_ClaimFakturItemDNs: TObjectList<TModClaimFakturItemDN>;
    function GetCLM_ClaimFakturOthers: TObjectList<TModClaimFakturOther>;
  public
    property CLM_ClaimFakturItemCNs: TObjectList<TModClaimFakturItemCN> read
        GetCLM_ClaimFakturItemCNs write FCLM_ClaimFakturItemCNs;
    property CLM_ClaimFakturItemDNs: TObjectList<TModClaimFakturItemDN> read
        GetCLM_ClaimFakturItemDNs write FCLM_ClaimFakturItemDNs;
    property CLM_ClaimFakturItems: TObjectList<TModClaimFakturItemDO> read
        FCLM_ClaimFakturItems write FCLM_ClaimFakturItems;
    property CLM_ClaimFakturOthers: TObjectList<TModClaimFakturOther> read
        GetCLM_ClaimFakturOthers write FCLM_ClaimFakturOthers;
  published
    property CLM_AP: TModAP read FCLM_AP write FCLM_AP;
    property CLM_CN_DISKON: Double read FCLM_CN_DISKON write FCLM_CN_DISKON;
    property CLM_CN_PPN: Double read FCLM_CN_PPN write FCLM_CN_PPN;
    property CLM_CN_PPNBM: Integer read FCLM_CN_PPNBM write FCLM_CN_PPNBM;
    property CLM_CN_SUBTOTAL: Double read FCLM_CN_SUBTOTAL write
        FCLM_CN_SUBTOTAL;
    property CLM_CN_TOTAL: Double read FCLM_CN_TOTAL write FCLM_CN_TOTAL;
    property CLM_DATE: TDatetime read FCLM_DATE write FCLM_DATE;
    property CLM_DISC: Double read FCLM_DISC write FCLM_DISC;
    property CLM_DN_DISC: Double read FCLM_DN_DISC write FCLM_DN_DISC;
    property CLM_DN_PPN: Double read FCLM_DN_PPN write FCLM_DN_PPN;
    property CLM_DN_PPNBM: Double read FCLM_DN_PPNBM write FCLM_DN_PPNBM;
    property CLM_DN_SUBTOTAL: Double read FCLM_DN_SUBTOTAL write
        FCLM_DN_SUBTOTAL;
    property CLM_DN_TOTAL: Double read FCLM_DN_TOTAL write FCLM_DN_TOTAL;
    property CLM_DO_DISC: Double read FCLM_DO_DISC write FCLM_DO_DISC;
    property CLM_DO_PPN: Double read FCLM_DO_PPN write FCLM_DO_PPN;
    property CLM_DO_PPNBM: Double read FCLM_DO_PPNBM write FCLM_DO_PPNBM;
    property CLM_DO_SUBTOTAL: Double read FCLM_DO_SUBTOTAL write
        FCLM_DO_SUBTOTAL;
    property CLM_DO_TOTAL: Double read FCLM_DO_TOTAL write FCLM_DO_TOTAL;
    property CLM_DUE_DATE: TDatetime read FCLM_DUE_DATE write FCLM_DUE_DATE;
    property CLM_NO: string read FCLM_NO write FCLM_NO;
    property CLM_NOMINAL: Double read FCLM_NOMINAL write FCLM_NOMINAL;
    property CLM_OTHER_TOTAL: Double read FCLM_OTHER_TOTAL write
        FCLM_OTHER_TOTAL;
    property CLM_PPN: Double read FCLM_PPN write FCLM_PPN;
    property CLM_PPNBM: Double read FCLM_PPNBM write FCLM_PPNBM;
    property CLM_REKENING_HUTANG: TModRekening read FCLM_REKENING_HUTANG write
        FCLM_REKENING_HUTANG;
    property CLM_REMARK: string read FCLM_REMARK write FCLM_REMARK;
    property CLM_RETURN_DATE: TDatetime read FCLM_RETURN_DATE write
        FCLM_RETURN_DATE;
    property CLM_SupplierMG: TModSuplierMerchanGroup read FCLM_SupplierMG write
        FCLM_SupplierMG;
    property CLM_TOTAL: Double read FCLM_TOTAL write FCLM_TOTAL;
    property CLM_TTF_NO: string read FCLM_TTF_NO write FCLM_TTF_NO;
    property CLM_UNIT: TModUnit read FCLM_UNIT write FCLM_UNIT;
  end;

  TModClaimFakturItemCN = class(TModApp)
  private
    FCLMD_CN_ClaimFaktur: TModClaimFaktur;
    FCLMD_CN_CNRecv: TModCNRecv;
    FCLMD_CN_DISC: Double;
    FCLMD_CN_DO: TModDO;
    FCLMD_CN_NP: string;
    FCLMD_CN_PPN: Double;
    FCLMD_CN_PPNBM: string;
    FCLMD_CN_SUBTOTAL: Double;
    FCLMD_CN_TOTAL: Double;
  published
    property CLMD_CN_ClaimFaktur: TModClaimFaktur read FCLMD_CN_ClaimFaktur
        write FCLMD_CN_ClaimFaktur;
    property CLMD_CN_CNRecv: TModCNRecv read FCLMD_CN_CNRecv write
        FCLMD_CN_CNRecv;
    property CLMD_CN_DISC: Double read FCLMD_CN_DISC write FCLMD_CN_DISC;
    property CLMD_CN_DO: TModDO read FCLMD_CN_DO write FCLMD_CN_DO;
    property CLMD_CN_NP: string read FCLMD_CN_NP write FCLMD_CN_NP;
    property CLMD_CN_PPN: Double read FCLMD_CN_PPN write FCLMD_CN_PPN;
    property CLMD_CN_PPNBM: string read FCLMD_CN_PPNBM write FCLMD_CN_PPNBM;
    property CLMD_CN_SUBTOTAL: Double read FCLMD_CN_SUBTOTAL write
        FCLMD_CN_SUBTOTAL;
    property CLMD_CN_TOTAL: Double read FCLMD_CN_TOTAL write FCLMD_CN_TOTAL;
  end;

  TModClaimFakturItemDN = class(TModApp)
  private
    FCLMD_DN_ClaimFaktur: TModClaimFaktur;
    FCLMD_DN_DISC: Double;
    FCLMD_DN_DNRecv: TModDNRecv;
    FCLMD_DN_DO: TModDO;
    FCLMD_DN_NP: string;
    FCLMD_DN_PPN: Double;
    FCLMD_DN_PPNBM: string;
    FCLMD_DN_SUBTOTAL: Double;
    FCLMD_DN_TOTAL: Double;
  published
    property CLMD_DN_ClaimFaktur: TModClaimFaktur read FCLMD_DN_ClaimFaktur
        write FCLMD_DN_ClaimFaktur;
    property CLMD_DN_DISC: Double read FCLMD_DN_DISC write FCLMD_DN_DISC;
    property CLMD_DN_DNRecv: TModDNRecv read FCLMD_DN_DNRecv write
        FCLMD_DN_DNRecv;
    property CLMD_DN_DO: TModDO read FCLMD_DN_DO write FCLMD_DN_DO;
    property CLMD_DN_NP: string read FCLMD_DN_NP write FCLMD_DN_NP;
    property CLMD_DN_PPN: Double read FCLMD_DN_PPN write FCLMD_DN_PPN;
    property CLMD_DN_PPNBM: string read FCLMD_DN_PPNBM write FCLMD_DN_PPNBM;
    property CLMD_DN_SUBTOTAL: Double read FCLMD_DN_SUBTOTAL write
        FCLMD_DN_SUBTOTAL;
    property CLMD_DN_TOTAL: Double read FCLMD_DN_TOTAL write FCLMD_DN_TOTAL;
  end;

  TModClaimFakturItemDO = class(TModApp)
  private
    FCLMD_DO: TModDO;
    FCLMD_DO_ClaimFaktur: TModClaimFaktur;
    FCLMD_DO_DESCRIPTION: string;
    FCLMD_DO_DISC: Double;
    FCLMD_DO_INV_NO: string;
    FCLMD_DO_INV_TAX_DATE: TDatetime;
    FCLMD_DO_INV_TAX_NO: string;
    FCLMD_DO_INV_TAX_TOTAL: Double;
    FCLMD_DO_NP: string;
    FCLMD_DO_PO: TModPO;
    FCLMD_DO_PPN: Double;
    FCLMD_DO_PPNBM: Double;
    FCLMD_DO_SUBTOTAL: Double;
    FCLMD_DO_TOTAL: Double;
    function GetCLMD_DO_NP: string;
  public
  published
    property CLMD_DO: TModDO read FCLMD_DO write FCLMD_DO;
    property CLMD_DO_ClaimFaktur: TModClaimFaktur read FCLMD_DO_ClaimFaktur
        write FCLMD_DO_ClaimFaktur;
    property CLMD_DO_DESCRIPTION: string read FCLMD_DO_DESCRIPTION write
        FCLMD_DO_DESCRIPTION;
    property CLMD_DO_DISC: Double read FCLMD_DO_DISC write FCLMD_DO_DISC;
    property CLMD_DO_INV_NO: string read FCLMD_DO_INV_NO write FCLMD_DO_INV_NO;
    property CLMD_DO_INV_TAX_DATE: TDatetime read FCLMD_DO_INV_TAX_DATE write
        FCLMD_DO_INV_TAX_DATE;
    property CLMD_DO_INV_TAX_NO: string read FCLMD_DO_INV_TAX_NO write
        FCLMD_DO_INV_TAX_NO;
    property CLMD_DO_INV_TAX_TOTAL: Double read FCLMD_DO_INV_TAX_TOTAL write
        FCLMD_DO_INV_TAX_TOTAL;
    property CLMD_DO_NP: string read GetCLMD_DO_NP write FCLMD_DO_NP;
    property CLMD_DO_PO: TModPO read FCLMD_DO_PO write FCLMD_DO_PO;
    property CLMD_DO_PPN: Double read FCLMD_DO_PPN write FCLMD_DO_PPN;
    property CLMD_DO_PPNBM: Double read FCLMD_DO_PPNBM write FCLMD_DO_PPNBM;
    property CLMD_DO_SUBTOTAL: Double read FCLMD_DO_SUBTOTAL write
        FCLMD_DO_SUBTOTAL;
    property CLMD_DO_TOTAL: Double read FCLMD_DO_TOTAL write FCLMD_DO_TOTAL;
  end;

  TModClaimFakturOther = class(TModApp)
  private
    FCLMD_Description: string;
    FCLMD_Other_ClaimFaktur: TModClaimFaktur;
    FCLMD_OTHER_Nominal: Double;
    FCLMD_Other_Rekening: TModRekening;
  public
    property CLMD_Other_ClaimFaktur: TModClaimFaktur read
        FCLMD_Other_ClaimFaktur write FCLMD_Other_ClaimFaktur;
  published
    property CLMD_Description: string read FCLMD_Description write
        FCLMD_Description;
    property CLMD_OTHER_Nominal: Double read FCLMD_OTHER_Nominal write
        FCLMD_OTHER_Nominal;
    property CLMD_Other_Rekening: TModRekening read FCLMD_Other_Rekening write
        FCLMD_Other_Rekening;
  end;


implementation

{
******************************* TModClaimFaktur ********************************
}
function TModClaimFaktur.GetCLM_ClaimFakturItemCNs:
    TObjectList<TModClaimFakturItemCN>;
begin
  Result := FCLM_ClaimFakturItemCNs;
end;

function TModClaimFaktur.GetCLM_ClaimFakturItemDNs:
    TObjectList<TModClaimFakturItemDN>;
begin
  Result := FCLM_ClaimFakturItemDNs;
end;

function TModClaimFaktur.GetCLM_ClaimFakturOthers:
    TObjectList<TModClaimFakturOther>;
begin
  Result := FCLM_ClaimFakturOthers;
end;

{
**************************** TModClaimFakturItemDO *****************************
}
function TModClaimFakturItemDO.GetCLMD_DO_NP: string;
begin
  Result := FCLMD_DO_NP;
end;



end.
