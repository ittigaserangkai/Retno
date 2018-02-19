unit uModBarcodeUsage;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  uModApp, uModOrganization, uModUnit, uModAR, System.Generics.Collections,
  uModBarcodeRequest, uModSuplier, uModRekening;

type
  TModBarcodeUsageItem = class;
  TModBarcodeUsage = class(TModApp)
  private
    FBarcodeUsageItems: TOBjectList<TModBarcodeUsageItem>;
    FBU_AR: TModAR;
    FBU_KETERANGAN: string;
    FBU_NO: string;
    FBU_SUPMG_ID: TModOrganization;
    FBU_TANGGAL: tdatetime;
    FBU_TOTAL: Double;
    FBU_UNIT: TModUnit;
    function GetBarcodeUsageItems: TOBjectList<TModBarcodeUsageItem>;
    function GetBU_TOTAL: Double;
  public
    property BarcodeUsageItems: TOBjectList<TModBarcodeUsageItem> read
        GetBarcodeUsageItems write FBarcodeUsageItems;
  published
    property BU_AR: TModAR read FBU_AR write FBU_AR;
    [AttributeOfSize('120')]
    property BU_KETERANGAN: string read FBU_KETERANGAN write FBU_KETERANGAN;

    [AttributeOfCode]
    property BU_NO: string read FBU_NO write FBU_NO;
    property BU_SUPMG_ID: TModOrganization read FBU_SUPMG_ID write FBU_SUPMG_ID;
    property BU_TANGGAL: tdatetime read FBU_TANGGAL write FBU_TANGGAL;
    property BU_TOTAL: Double read GetBU_TOTAL write FBU_TOTAL;
    property BU_UNIT: TModUnit read FBU_UNIT write FBU_UNIT;
  end;

  TModBarcodeUsageItem = class(TModApp)
  private
    FBUI_BarcodeRequest: TModBarcodeRequest;
    FBUI_BarcodeUsage: TModBarcodeUsage;
    FBUI_KETERANGAN: string;
    FBUI_NOMINAL: Double;
    FBUI_REKENING: TModRekening;
  published
    property BUI_BarcodeRequest: TModBarcodeRequest read FBUI_BarcodeRequest
        write FBUI_BarcodeRequest;

    [AttributeOfHeader]
    property BUI_BarcodeUsage: TModBarcodeUsage read FBUI_BarcodeUsage write
        FBUI_BarcodeUsage;
    property BUI_KETERANGAN: string read FBUI_KETERANGAN write FBUI_KETERANGAN;
    property BUI_NOMINAL: Double read FBUI_NOMINAL write FBUI_NOMINAL;
    property BUI_REKENING: TModRekening read FBUI_REKENING write FBUI_REKENING;
  end;


implementation

function TModBarcodeUsage.GetBarcodeUsageItems:
    TOBjectList<TModBarcodeUsageItem>;
begin
  if FBarcodeUsageItems = nil then
  begin
    FBarcodeUsageItems := TObjectList<TModBarcodeUsageItem>.Create;
  end;

  Result := FBarcodeUsageItems;
end;

function TModBarcodeUsage.GetBU_TOTAL: Double;
var
  I: Integer;
begin
  FBU_TOTAL := 0;

  for I := 0 to BarcodeUsageItems.Count - 1 do
  begin
    FBU_TOTAL := FBU_TOTAL + BarcodeUsageItems[i].FBUI_NOMINAL;
  end;

  Result := FBU_TOTAL;
end;

Initialization

TModBarcodeUsage.RegisterRTTI;
TModBarcodeUsageItem.RegisterRTTI;

end.
