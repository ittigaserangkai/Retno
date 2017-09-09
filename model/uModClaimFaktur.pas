unit uModClaimFaktur;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs, uModApp,
  System.Generics.Collections, uModAP, uModRekening, uModSuplier, uModUnit,
  uModDO, uModCNRecv, uModDNRecv, uModPO, uModCostCenter;

type
  TModClaimFakturItemCN = class;
  TModClaimFakturItemDN = class;
  TModClaimFakturItemDO = class;
  TModClaimFakturItemOther = class;

  TModClaimFaktur = class(TModApp)
  private
    FCLM_AP: TModAP;
    FCNItems: TObjectList<TModClaimFakturItemCN>;
    FDNItems: TObjectList<TModClaimFakturItemDN>;
    FDOItems: TObjectList<TModClaimFakturItemDO>;
    FOtherItems: TObjectList<TModClaimFakturItemOther>;
    FCLM_CN_DISC: Double;
    FCLM_CN_PPN: Double;
    FCLM_CN_PPNBM: Double;
    FCLM_CN_SUBTOTAL: Double;
    FCLM_CN_TOTAL: Double;
    FCLM_DATE: TDatetime;
    FCLM_Description: string;
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
    function GetCNItems: TObjectList<TModClaimFakturItemCN>;
    function GetDNItems: TObjectList<TModClaimFakturItemDN>;
    function GetDOItems: TObjectList<TModClaimFakturItemDO>;
    function GetOtherItems: TObjectList<TModClaimFakturItemOther>;
  public
    destructor Destroy; override;
    procedure Calculate;
    procedure UpdateAP;
    property CLM_CN_PPNBM: Double read FCLM_CN_PPNBM write FCLM_CN_PPNBM;
    property CLM_DISC: Double read FCLM_DISC write FCLM_DISC;
    property CLM_DN_PPNBM: Double read FCLM_DN_PPNBM write FCLM_DN_PPNBM;
    property CLM_DO_PPNBM: Double read FCLM_DO_PPNBM write FCLM_DO_PPNBM;
    property CLM_NOMINAL: Double read FCLM_NOMINAL write FCLM_NOMINAL;
    property CLM_PPNBM: Double read FCLM_PPNBM write FCLM_PPNBM;
    property CNItems: TObjectList<TModClaimFakturItemCN> read GetCNItems write
        FCNItems;
    property DNItems: TObjectList<TModClaimFakturItemDN> read GetDNItems write
        FDNItems;
    property DOItems: TObjectList<TModClaimFakturItemDO> read GetDOItems write
        FDOItems;
    property OtherItems: TObjectList<TModClaimFakturItemOther> read GetOtherItems write
        FOtherItems;
  published
    property CLM_AP: TModAP read FCLM_AP write FCLM_AP;
    property CLM_CN_DISC: Double read FCLM_CN_DISC write FCLM_CN_DISC;
    property CLM_CN_PPN: Double read FCLM_CN_PPN write FCLM_CN_PPN;
    property CLM_CN_SUBTOTAL: Double read FCLM_CN_SUBTOTAL write
        FCLM_CN_SUBTOTAL;
    property CLM_CN_TOTAL: Double read FCLM_CN_TOTAL write FCLM_CN_TOTAL;
    property CLM_DATE: TDatetime read FCLM_DATE write FCLM_DATE;
    property CLM_Description: string read FCLM_Description write FCLM_Description;
    property CLM_DN_DISC: Double read FCLM_DN_DISC write FCLM_DN_DISC;
    property CLM_DN_PPN: Double read FCLM_DN_PPN write FCLM_DN_PPN;
    property CLM_DN_SUBTOTAL: Double read FCLM_DN_SUBTOTAL write
        FCLM_DN_SUBTOTAL;
    property CLM_DN_TOTAL: Double read FCLM_DN_TOTAL write FCLM_DN_TOTAL;
    property CLM_DO_DISC: Double read FCLM_DO_DISC write FCLM_DO_DISC;
    property CLM_DO_PPN: Double read FCLM_DO_PPN write FCLM_DO_PPN;
    property CLM_DO_SUBTOTAL: Double read FCLM_DO_SUBTOTAL write
        FCLM_DO_SUBTOTAL;
    property CLM_DO_TOTAL: Double read FCLM_DO_TOTAL write FCLM_DO_TOTAL;
    property CLM_DUE_DATE: TDatetime read FCLM_DUE_DATE write FCLM_DUE_DATE;
    [AttributeOfCode]
    property CLM_NO: string read FCLM_NO write FCLM_NO;
    property CLM_OTHER_TOTAL: Double read FCLM_OTHER_TOTAL write
        FCLM_OTHER_TOTAL;
    property CLM_PPN: Double read FCLM_PPN write FCLM_PPN;
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
    FCLMD_CN_PPN: Double;
    FCLMD_CN_PPNBM: Double;
    FCLMD_CN_SUBTOTAL: Double;
    FCLMD_CN_TOTAL: Double;
  public
    destructor Destroy; override;
    property CLMD_CN_PPNBM: Double read FCLMD_CN_PPNBM write FCLMD_CN_PPNBM;
  published
    [AttributeOfHeader]
    property CLMD_CN_ClaimFaktur: TModClaimFaktur read FCLMD_CN_ClaimFaktur
        write FCLMD_CN_ClaimFaktur;
    property CLMD_CN_CNRecv: TModCNRecv read FCLMD_CN_CNRecv write
        FCLMD_CN_CNRecv;
    property CLMD_CN_DISC: Double read FCLMD_CN_DISC write FCLMD_CN_DISC;
    property CLMD_CN_DO: TModDO read FCLMD_CN_DO write FCLMD_CN_DO;
    property CLMD_CN_PPN: Double read FCLMD_CN_PPN write FCLMD_CN_PPN;
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
    FCLMD_DN_PPN: Double;
    FCLMD_DN_PPNBM: Double;
    FCLMD_DN_SUBTOTAL: Double;
    FCLMD_DN_TOTAL: Double;
  public
    destructor Destroy; override;
    property CLMD_DN_PPNBM: Double read FCLMD_DN_PPNBM write FCLMD_DN_PPNBM;
  published
    [AttributeOfHeader]
    property CLMD_DN_ClaimFaktur: TModClaimFaktur read FCLMD_DN_ClaimFaktur
        write FCLMD_DN_ClaimFaktur;
    property CLMD_DN_DISC: Double read FCLMD_DN_DISC write FCLMD_DN_DISC;
    property CLMD_DN_DNRecv: TModDNRecv read FCLMD_DN_DNRecv write
        FCLMD_DN_DNRecv;
    property CLMD_DN_DO: TModDO read FCLMD_DN_DO write FCLMD_DN_DO;
    property CLMD_DN_PPN: Double read FCLMD_DN_PPN write FCLMD_DN_PPN;
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
    FCLMD_DO_PO: TModPO;
    FCLMD_DO_PPN: Double;
    FCLMD_DO_PPNBM: Double;
    FCLMD_DO_SUBTOTAL: Double;
    FCLMD_DO_TOTAL: Double;
  public
    destructor Destroy; override;
    property CLMD_DO_INV_TAX_TOTAL: Double read FCLMD_DO_INV_TAX_TOTAL write
        FCLMD_DO_INV_TAX_TOTAL;
    property CLMD_DO_PPNBM: Double read FCLMD_DO_PPNBM write FCLMD_DO_PPNBM;
  published
    property CLMD_DO: TModDO read FCLMD_DO write FCLMD_DO;
    [AttributeOfHeader]
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
    property CLMD_DO_PO: TModPO read FCLMD_DO_PO write FCLMD_DO_PO;
    property CLMD_DO_PPN: Double read FCLMD_DO_PPN write FCLMD_DO_PPN;
    property CLMD_DO_SUBTOTAL: Double read FCLMD_DO_SUBTOTAL write
        FCLMD_DO_SUBTOTAL;
    property CLMD_DO_TOTAL: Double read FCLMD_DO_TOTAL write FCLMD_DO_TOTAL;
  end;

  TModClaimFakturItemOther = class(TModApp)
  private
    FCLMD_Other_CostCenter: TModCostCenter;
    FCLMD_Other_Description: string;
    FCLMD_Other_ClaimFaktur: TModClaimFaktur;
    FCLMD_OTHER_TOTAL: Double;
    FCLMD_Other_Rekening: TModRekening;
  public
  published
    [AttributeOfHeader]
    property CLMD_Other_ClaimFaktur: TModClaimFaktur read FCLMD_Other_ClaimFaktur
        write FCLMD_Other_ClaimFaktur;
    property CLMD_Other_CostCenter: TModCostCenter read FCLMD_Other_CostCenter
        write FCLMD_Other_CostCenter;
    property CLMD_Other_Description: string read FCLMD_Other_Description write
        FCLMD_Other_Description;
    property CLMD_OTHER_TOTAL: Double read FCLMD_OTHER_TOTAL write
        FCLMD_OTHER_TOTAL;
    property CLMD_Other_Rekening: TModRekening read FCLMD_Other_Rekening write
        FCLMD_Other_Rekening;
  end;


implementation

uses
  uModOrganization;

destructor TModClaimFaktur.Destroy;
begin
  if Assigned(FDOItems) then FreeAndNil(FDOItems);
  if Assigned(FCNItems) then FreeAndNil(FCNItems);
  if Assigned(FDNItems) then FreeAndNil(FDNItems);
  if Assigned(FOtherItems) then FreeAndNil(FOtherItems);
  if Assigned(FCLM_REKENING_HUTANG) then FreeAndNil(FCLM_REKENING_HUTANG);
  if Assigned(FCLM_SupplierMG) then FreeAndNil(FCLM_SupplierMG);
  inherited;
end;

procedure TModClaimFaktur.Calculate;
var
  lItemDO: TModClaimFakturItemDO;
  lItemCN: TModClaimFakturItemCN;
  lItemDN: TModClaimFakturItemDN;
  lItemOther: TModClaimFakturItemOther;
begin
  CLM_DO_SUBTOTAL   := 0;
  CLM_DO_DISC       := 0;
  CLM_DO_PPN        := 0;
  CLM_DO_TOTAL      := 0;
  CLM_CN_SUBTOTAL   := 0;
  CLM_CN_DISC       := 0;
  CLM_CN_PPN        := 0;
  CLM_CN_TOTAL      := 0;
  CLM_DN_SUBTOTAL   := 0;
  CLM_DN_DISC       := 0;
  CLM_DN_PPN        := 0;
  CLM_DN_TOTAL      := 0;
  CLM_OTHER_TOTAL   := 0;

  for lItemDO in Self.DOItems do
  begin
    CLM_DO_SUBTOTAL := CLM_DO_SUBTOTAL + lItemDO.CLMD_DO_SUBTOTAL;
    CLM_DO_DISC     := CLM_DO_DISC + lItemDO.CLMD_DO_DISC;
    CLM_DO_PPN      := CLM_DO_SUBTOTAL + lItemDO.CLMD_DO_PPN;
    CLM_DO_TOTAL    := CLM_DO_TOTAL + lItemDO.CLMD_DO_TOTAL;
  end;

  for lItemCN in Self.CNItems do
  begin
    CLM_CN_SUBTOTAL := CLM_CN_SUBTOTAL + lItemCN.CLMD_CN_SUBTOTAL;
    CLM_CN_DISC     := CLM_CN_DISC + lItemCN.CLMD_CN_DISC;
    CLM_CN_PPN      := CLM_CN_SUBTOTAL + lItemCN.CLMD_CN_PPN;
    CLM_CN_TOTAL    := CLM_CN_TOTAL + lItemCN.CLMD_CN_TOTAL;
  end;

  for lItemDN in Self.DNItems do
  begin
    CLM_DN_SUBTOTAL := CLM_DN_SUBTOTAL + lItemDN.CLMD_DN_SUBTOTAL;
    CLM_DN_DISC     := CLM_DN_DISC + lItemDN.CLMD_DN_DISC;
    CLM_DN_PPN      := CLM_DN_SUBTOTAL + lItemDN.CLMD_DN_PPN;
    CLM_DN_TOTAL    := CLM_DN_TOTAL + lItemDN.CLMD_DN_TOTAL;
  end;

  for lItemOther in Self.OtherItems do
  begin
    CLM_OTHER_TOTAL := CLM_OTHER_TOTAL + lItemOther.CLMD_OTHER_TOTAL;
  end;

  CLM_TOTAL := CLM_DO_TOTAL - CLM_CN_TOTAL + CLM_DN_TOTAL + CLM_OTHER_TOTAL;
  CLM_PPN   := CLM_DO_PPN - CLM_CN_PPN + CLM_DN_PPN;
end;

{
******************************* TModClaimFaktur ********************************
}
function TModClaimFaktur.GetCNItems: TObjectList<TModClaimFakturItemCN>;
begin
  if not Assigned(FCNItems) then
    FCNItems := TObjectList<TModClaimFakturItemCN>.Create();
  Result := FCNItems;
end;

function TModClaimFaktur.GetDNItems: TObjectList<TModClaimFakturItemDN>;
begin
  if not Assigned(FDNItems) then
    FDNItems := TObjectList<TModClaimFakturItemDN>.Create();
  Result := FDNItems;
end;

function TModClaimFaktur.GetDOItems: TObjectList<TModClaimFakturItemDO>;
begin
  if not Assigned(FDOItems) then
    FDOItems := TObjectList<TModClaimFakturItemDO>.Create();
  Result := FDOItems;
end;

function TModClaimFaktur.GetOtherItems: TObjectList<TModClaimFakturItemOther>;
begin
  if not Assigned(FOtherItems) then
    FOtherItems := TObjectList<TModClaimFakturItemOther>.Create();
  Result := FOtherItems;
end;

procedure TModClaimFaktur.UpdateAP;
begin
  if not Assigned(FCLM_SupplierMG) then
    Raise Exception.Create(Self.ClassName + ' : ' + ' Supplier MG belum diset');

  if not Assigned(FCLM_REKENING_HUTANG) then
    Raise Exception.Create(Self.ClassName + ' : ' + ' Rekening belum diset');

  if not Assigned(FCLM_AP) then
    FCLM_AP := TModAP.Create;

  CLM_AP.AP_ClassRef  := Self.ClassName;
  CLM_AP.AP_DueDate   := CLM_DUE_DATE;
  CLM_AP.AP_TOTAL     := CLM_TOTAL;

  if Assigned(CLM_AP.AP_ORGANIZATION) then
    CLM_AP.AP_ORGANIZATION.Free;

  CLM_AP.AP_ORGANIZATION  := TModOrganization.CreateID(CLM_SupplierMG.ID);
  CLM_AP.AP_REFNUM        := CLM_NO;
  CLM_AP.AP_REKENING      := TModRekening.CreateID(CLM_REKENING_HUTANG.ID);
  CLM_AP.AP_TRANSDATE     := CLM_DATE;

  if CLM_AP.ID = '' then
  begin
    CLM_AP.AP_IS_LUNAS  := 0;
    CLM_AP.AP_PAID      := 0;
  end else
    CLM_AP.ObjectState  := 3;

end;

destructor TModClaimFakturItemDO.Destroy;
begin
  if Assigned(FCLMD_DO) then FreeAndNil(FCLMD_DO);
  if Assigned(FCLMD_DO_PO) then FreeAndNil(FCLMD_DO_PO);
  inherited;
end;

destructor TModClaimFakturItemCN.Destroy;
begin
  if Assigned(FCLMD_CN_DO) then FreeAndNil(FCLMD_CN_DO);
  if Assigned(FCLMD_CN_CNRecv) then FreeAndNil(FCLMD_CN_CNRecv);
  inherited;
end;

destructor TModClaimFakturItemDN.Destroy;
begin
  if Assigned(FCLMD_DN_DO) then FreeAndNil(FCLMD_DN_DO);
  if Assigned(FCLMD_DN_DNRecv) then FreeAndNil(FCLMD_DN_DNRecv);
  inherited;
end;

initialization
  TModClaimFaktur.RegisterRTTI;
  TModClaimFakturItemDO.RegisterRTTI;
  TModClaimFakturItemCN.RegisterRTTI;
  TModClaimFakturItemDN.RegisterRTTI;
  TModClaimFakturItemOther.RegisterRTTI;


end.
