unit uModElectric;

interface

uses
  uModApp, uModOrganization, uModUnit, uModRekening;

type
  TModElectricRate = class;
  TModElectricCustomer = class(TModApp)
  private
    FELCUST_DATE_BEGIN: TDatetime;
    FELCUST_IS_ACTIVE: Integer;
    FELCUST_KAVLING_CODE: string;
    FELCUST_LAST_INVOICE: TDatetime;
    FELCUST_LAST_PROCESS: TDatetime;
    FMODELECTRICRATE: TModElectricRate;
    FMODORGANIZATION: TModOrganization;
    FMODUNIT: TModUnit;
  published
    property ELCUST_DATE_BEGIN: TDatetime read FELCUST_DATE_BEGIN write
        FELCUST_DATE_BEGIN;
    property ELCUST_IS_ACTIVE: Integer read FELCUST_IS_ACTIVE write
        FELCUST_IS_ACTIVE;
    property ELCUST_KAVLING_CODE: string read FELCUST_KAVLING_CODE write
        FELCUST_KAVLING_CODE;
    property ELCUST_LAST_INVOICE: TDatetime read FELCUST_LAST_INVOICE write
        FELCUST_LAST_INVOICE;
    property ELCUST_LAST_PROCESS: TDatetime read FELCUST_LAST_PROCESS write
        FELCUST_LAST_PROCESS;
    property MODELECTRICRATE: TModElectricRate read FMODELECTRICRATE write
        FMODELECTRICRATE;
    property MODORGANIZATION: TModOrganization read FMODORGANIZATION write
        FMODORGANIZATION;
    property MODUNIT: TModUnit read FMODUNIT write FMODUNIT;
  end;

  TModElectricRate = class(TModApp)
  private
    FELRT_COST_ABODEMEN: Double;
    FELRT_COST_USE: Double;
    FELRT_FACTOR: Integer;
    FELRT_GROUP: string;
    FELRT_PJU: Double;
    FELRT_POWER: Double;
    FELRT_TTLB: Double;
    FMODUNIT: TModUnit;
    FREKENING_ID_CREDIT: TModRekening;
    FREKENING_ID_DEBET: TModRekening;
  published
    property ELRT_COST_ABODEMEN: Double read FELRT_COST_ABODEMEN write
        FELRT_COST_ABODEMEN;
    property ELRT_COST_USE: Double read FELRT_COST_USE write FELRT_COST_USE;
    property ELRT_FACTOR: Integer read FELRT_FACTOR write FELRT_FACTOR;
    property ELRT_GROUP: string read FELRT_GROUP write FELRT_GROUP;
    property ELRT_PJU: Double read FELRT_PJU write FELRT_PJU;
    property ELRT_POWER: Double read FELRT_POWER write FELRT_POWER;
    property ELRT_TTLB: Double read FELRT_TTLB write FELRT_TTLB;
    property MODUNIT: TModUnit read FMODUNIT write FMODUNIT;
    property REKENING_ID_CREDIT: TModRekening read FREKENING_ID_CREDIT write
        FREKENING_ID_CREDIT;
    property REKENING_ID_DEBET: TModRekening read FREKENING_ID_DEBET write
        FREKENING_ID_DEBET;
  end;

implementation

initialization
  TModElectricCustomer.RegisterRTTI;
  TModElectricRate.RegisterRTTI;

end.
