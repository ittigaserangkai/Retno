unit ufrmDialogDoBonus;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls, uInterface, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxControls, cxContainer,
  cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils, cxCurrencyEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, Vcl.StdCtrls, cxButtons, System.DateUtils,
  uModDOBonus, uModPO, uModDO, uDXUtils, uDBUtils, System.StrUtils, uAppUtils,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDBExtLookupComboBox, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxClasses, cxGridCustomView, cxGrid, uModelHelper, cxLookupEdit, Datasnap.DBClient,
  cxDBLookupEdit, cxButtonEdit;

type
  TfrmDialogDoBonus = class(TfrmMasterDialog, ICRUDAble)
    pnlTop: TPanel;
    lbl1: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl2: TLabel;
    lbl4: TLabel;
    btn1: TcxButton;
    dtDatePO: TcxDateEdit;
    dtDateSO: TcxDateEdit;
    edtSONo: TcxTextEdit;
    edtSuplierName: TcxTextEdit;
    edtDONo: TcxTextEdit;
    dtDateDO: TcxDateEdit;
    edPO: TcxTextEdit;
    cxGridGR: TcxGrid;
    cxGridTableGR: TcxGridTableView;
    cxGridColPLU: TcxGridColumn;
    cxGridColNama: TcxGridColumn;
    cxgrdclmnHarga: TcxGridColumn;
    cxgrdclmnQtyOrder: TcxGridColumn;
    cxgrdclmnQtyRecv: TcxGridColumn;
    cxgrdclmnUOM: TcxGridColumn;
    cxgrdclmnDisc1: TcxGridColumn;
    cxgrdclmnDisc2: TcxGridColumn;
    cxgrdclmnDisc3: TcxGridColumn;
    cxgrdclmnTotalDisc: TcxGridColumn;
    cxgrdclmnPPN: TcxGridColumn;
    cxgrdclmnPPNBM: TcxGridColumn;
    cxgrdclmnPPNPERSEN: TcxGridColumn;
    cxgrdclmnPPNBMPERSEN: TcxGridColumn;
    cxgrdclmnTax: TcxGridColumn;
    cxgrdclmnLinePrice: TcxGridColumn;
    cxgrdclmnTotal: TcxGridColumn;
    cxgrdclmnISBKP: TcxGridColumn;
    cxgrdclmnIsStock: TcxGridColumn;
    cxgrdclmnPOITEM: TcxGridColumn;
    cxgrdlvlGR: TcxGridLevel;
    lblTipe: TLabel;
    cbbTipeBonus: TcxExtLookupComboBox;
    cxGridColPLU_ID: TcxGridColumn;
    lblGudang: TLabel;
    cbbGudang: TcxExtLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure edPOKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxgrdclmnPLUPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
  private
    FCDSTipeBonus: TClientDataset;
    FPO: TModPO;
    procedure LoaddataBarang(ASKU : String; ARecordIndex : Integer);
    function LoadDataPO(ANoPO : String; AIsiQtyReceivedDenganQtyOrder : Boolean =
        True): Boolean;
    { Private declarations }
  public
    procedure LoadData(AID : String);
    { Public declarations }
  end;

var
  frmDialogDoBonus: TfrmDialogDoBonus;

implementation

{$R *.dfm}

uses uDMClient, uModBarang;

procedure TfrmDialogDoBonus.FormCreate(Sender: TObject);
begin
  inherited;
  FCDSTipeBonus := TDBUtils.DSToCDS(DMClient.DSProviderClient.TipeBonus_GetDSLookup(), Self, False);

  cbbTipeBonus.LoadFromCDS(FCDSTipeBonus,'REF$TIPE_BONUS_ID','TPBNS_NAME',['REF$TIPE_BONUS_ID'],Self);
  cbbTipeBonus.SetMultiPurposeLookup;

end;

procedure TfrmDialogDoBonus.cxgrdclmnPLUPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  LoaddataBarang(DisplayValue, cxGridTableGR.RecordIndex);
end;

procedure TfrmDialogDoBonus.edPOKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
var
  iNomor: Integer;
begin
  if Key = 13 then
  begin
    iNomor    := StrToIntDef(edPO.Text,0);
    edPO.Text := RightStr('00000000000' + IntToStr(iNomor), 11);

    if LoadDataPO(edPO.Text) then
      SelectNext(Screen.ActiveControl, True, True);
  end;

  inherited;
end;

procedure TfrmDialogDoBonus.LoadData(AID : String);
begin
  // TODO -cMM: TfrmMasterDialog1.LoadData default body inserted
end;

procedure TfrmDialogDoBonus.LoaddataBarang(ASKU : String; ARecordIndex :
    Integer);
var
  lBarang: TModBarang;
begin
  lBarang := TCRUDObj.RetrieveCode<TModBarang>(ASKU);
  cxGridTableGR.SetValue(ARecordIndex, cxGridColPLU.Index, lBarang.BRG_CODE);
  cxGridTableGR.SetValue(ARecordIndex, cxGridColNama.Index, lBarang.BRG_NAME);
  cxGridTableGR.SetValue(ARecordIndex, cxGridColPLU_ID.Index, lBarang.ID);
end;

function TfrmDialogDoBonus.LoadDataPO(ANoPO : String;
    AIsiQtyReceivedDenganQtyOrder : Boolean = True): Boolean;
begin
  Result := False;

  ClearByTag([0,1]);
  cxGridTableGR.ClearRows;
  FPO := TModPO(DMClient.CrudClient.RetrieveByCode(TModPO.ClassName, ANoPO));
  if FPO = nil then
    Exit;

  if FPO.ID = '' then
    Exit;

  FPO.LoadStatusPO;
  if FPO.PO_STATUS_PO.STAPO_NAME = 'CLOSED' then
  begin
    TAppUtils.Warning('PO Sudah CLOSED');
    Exit;
  end;

  if FPO.PO_STATUS_PO.STAPO_NAME = 'CANCELED' then
  begin
    TAppUtils.Warning('PO Sudah CANCELED');
    Exit;
  end;

  edPO.Text := FPO.PO_NO;
  FPO.LoadSO;
  edtSONo.Text := FPO.PO_SO.SO_NO;
  dtDateSO.Date := FPO.PO_SO.SO_DATE;

  FPO.LoadPO_SUPPLIER_MERCHAN_GRUP;
  edtSuplierName.Text := FPO.PO_SUPPLIER_MERCHAN_GRUP.SUPMG_NAME;

  dtDatePO.Date := FPO.PO_DATE;
//  edTotalOrder.Value := FPO.PO_COLIE;
//  edTotalColie.Value := FPO.PO_COLIE;
//  edBonus.Value := 0;
//  edRecvBonus.Value := 0;
//
//  edTotalBeli.Value   := FPO.PO_TOTAL;
//  edPPNBM.Value       := FPO.PO_PPNBM;
//  edPPN.Value         := FPO.PO_PPN;
//  edDiscount.Value    := FPO.PO_DISC;
//  edSubTotal.Value    := FPO.PO_SUBTOTAL;

  Result := True;
end;

end.
