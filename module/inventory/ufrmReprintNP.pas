unit ufrmReprintNP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, ufraFooter1Button, StdCtrls, ExtCtrls,
  ActnList, frxClass, uFormProperty, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, System.Actions, cxButtons;

type
  TfrmReprintNP = class(TfrmMaster)
    frafoo1: TfraFooter1Button;
    lbl1: TLabel;
    edt1: TEdit;
    btn1: TcxButton;
    btn2: TcxButton;
    btn3: TcxButton;
    btn4: TcxButton;
    actlst1: TActionList;
    actReprintNP: TAction;
    actCheckListReprintNP: TAction;
    actShowDetailReprintNP: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edt1KeyPress(Sender: TObject; var Key: Char);
    procedure btn1Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actReprintNPExecute(Sender: TObject);
    procedure actCheckListReprintNPExecute(Sender: TObject);
    procedure actShowDetailReprintNPExecute(Sender: TObject);
    procedure edt1Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FFormProperty: TFormProperty;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReprintNP: TfrmReprintNP;
  ParamList: TStringList;

implementation

uses uTSCommonDlg, ufrmSearchPO, ufrmGoodsReceiving, uConstanta, uAppUtils,
   udmReport, ufrmDialogPrintPreview, ufrmDisplayPO, uRetnoUnit;

{$R *.dfm}

procedure TfrmReprintNP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmReprintNP.FormCreate(Sender: TObject);
begin
  inherited;
  FFormProperty := TFormProperty.Create;
  lblHeader.Caption := 'REPRINT / CHECK LIST NP';
end;

procedure TfrmReprintNP.FormDestroy(Sender: TObject);
begin
  inherited;
  frmReprintNP := nil;
end;

procedure TfrmReprintNP.edt1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    if (Trim(edt1.Text) = '') then
    begin
      CommonDlg.ShowError(ER_PO_IS_NOT_EXIST);
      edt1.SetFocus;
    end
    else
      edt1.Text := TAppUtils.StrPadLeft(Trim(edt1.Text), 10, '0');
  end;
end;

procedure TfrmReprintNP.btn1Click(Sender: TObject);
begin
  if not Assigned(frmDialogSearchPO) then
    Application.CreateForm(TfrmDialogSearchPO, frmDialogSearchPO);
  frmDialogSearchPO.Caption := 'Search PO...';
  frmDialogSearchPO.Modul:= tmReprintNP;

  SetFormPropertyAndShowDialog(frmDialogSearchPO);
  if (frmDialogSearchPO.IsProcessSuccessfull) then
  begin
//    edt1.Text := frmDialogSearchPO.strgGrid.Cells[2,frmDialogSearchPO.strgGrid.Row];
    edt1.SetFocus;
  end;
  frmDialogSearchPO.Free;
end;

procedure TfrmReprintNP.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if(Key = Ord('C'))and(ssctrl in Shift) then
    actReprintNPExecute(self);
  if(Key = Ord('D'))and(ssctrl in Shift) then
    actCheckListReprintNPExecute(self);
  if(Key = Ord('H'))and(ssctrl in Shift) then
    actShowDetailReprintNPExecute(self);
  if(Key = VK_F2) then
    btn1Click(self);       
end;

procedure TfrmReprintNP.actReprintNPExecute(Sender: TObject);
var SeparatorDate: Char;
  s: string;
begin
  if (edt1.Text <> '') then
  begin

    SeparatorDate:= FormatSettings.DateSeparator;

    try
      FormatSettings.DateSeparator:= '/';

      s := 'select a.do_np, a.do_po_no, (a.DO_COLIE_ORDER_RECV - a.DO_CN_QTY + a.DO_DN_QTY) as DO_COLIE_ORDER_RECV, a.do_colie_bonus,'
         + ' (Select b.DO_NP FROM DORD b WHERE b.DO_NO = a.DO_NO_REF) as NPBONUS'
         + ' from dord a'
         + ' where a.do_po_no = ' + QuotedStr(edt1.Text);
//      dmReportNew.EksekusiReport('frCetakNP', s, '', True);
    finally
      FormatSettings.DateSeparator:= SeparatorDate;
//      frmDialogPrintPreview.Free;
      FreeAndNil(ParamList);
//      FreeAndNil(SearchPO);
    end;
  end
  else
  begin
    CommonDlg.ShowError('Please entry number of PO first.');
    edt1.SetFocus;
  end;
end;

procedure TfrmReprintNP.actCheckListReprintNPExecute(Sender: TObject);
var SeparatorDate: Char;
  s: string;
    //data: TResultDataSet;
    //arrParam: TArr;
begin
  if (edt1.Text <> '') then begin
    if (CommonDlg.Confirm('Are you sure you want to print check list NP (PO NO. : '+ edt1.Text +')?') = mrYes) then begin
      SeparatorDate:= FormatSettings.DateSeparator;

      try
        s := 'select '
           + ' (sup_code ||'' ''|| tppersh_code || '' '' || sup_name) as sup,'
           + ' po_no, po_date, do_date, do_np,'
           + ' (merchan_id ||'' ''|| merchan_name) as divisi,'
           + ' brg_code, brg_name || '' '' || brg_merk, brg_catalog,'
           + ' brg_alias, brg_lok_code, pod_qty_order, pob_qty,'
           + ' (sat.sat_code) as stock_uom,'
           + ' DOD_QTY_ORDER_RECV ,'
           + ' dob_qty, brgsup_sat_code_buy, d.do_no, ks.konvsat_scale,ks.KONVSAT_BARCODE'
           + ' from dord d'
           + ' join po p on (d.do_po_no=p.po_no and d.do_po_unt_id=p.po_unt_id)'
           + ' left join do_detil dod on (d.do_no =dod.dod_do_no and d.do_unt_id=dod.dod_do_unt_id)'
           + ' left join suplier_merchan_grup supmg on (p.po_supmg_sub_code=supmg.supmg_sub_code)'
           + ' left join suplier sup on (supmg.supmg_code=sup.sup_code)'
           + ' left join ref$tipe_perusahaan rtp on (sup.sup_tppersh_id = rtp.tppersh_id)'
           + ' left join barang brg on (dod.dod_brg_code=brg.brg_code)'
           + ' left join barang_suplier brgsup on (brgsup.brgsup_supmg_sub_code = supmg.supmg_sub_code)'
           + ' and (brgsup.brgsup_brg_code = brg.brg_code)'
           + ' left join po_detil pod on (p.po_no = pod.pod_po_no and p.po_unt_id=pod.pod_po_unt_id)'
           + ' and dod.dod_brg_code = pod.pod_brg_code '
           + ' left join po_bonus pob on (pod.pod_id=pob.pob_pod_id and pod.pod_unt_id=pob.pob_pod_unt_id)'
           + ' left join do_bonus dob on (dod.dod_id=dob.dob_dod_id and dod.dod_unt_id=dob.dob_dod_unt_id)'
           + ' left join ref$satuan sat on (brg.brg_sat_code_stock =sat.sat_code)'
           + ' left join ref$satuan sat2 on (brgsup.brgsup_sat_code_buy =sat2.sat_code )'
           + ' left join ref$merchandise merchan on (brg.brg_merchan_id=merchan.merchan_id)'
           + ' left join ref$konversi_satuan ks on (ks.konvsat_brg_code=pod.pod_brg_code )'
           + ' and (ks.konvsat_sat_code_from=brg.brg_sat_code_stock)'
           + ' and (ks.konvsat_sat_code_to=pod.pod_sat_code_order )'
           + ' Where p.po_no = ' + QuotedStr(edt1.Text)
           + ' and DOD_QTY_ORDER_RECV > 0';
//      dmReportNew.EksekusiReport('frCheckListText', s, '', True);


      finally
        FormatSettings.DateSeparator:= SeparatorDate;
      end;
    end;
  end
  else
  begin
    CommonDlg.ShowError('Please entry number of PO first.');
    edt1.SetFocus;
  end;    
end;

procedure TfrmReprintNP.actShowDetailReprintNPExecute(Sender: TObject);
var
  st  : string;
  Key : Char;
begin
   FFormProperty.FSelfUnitId    := MasterNewUnit;
  FFormProperty.FSelfCompanyID := MasterCompany.ID;
  FFormProperty.FLoginFullname := FLoginFullname;
  FFormProperty.FLoginUsername := FLoginUsername;

  frmDisplayPO := TfrmDisplayPO.CreateWithUser(Self,FFormProperty);
  Key := #13;

  st := edt1.Text;
  frmDisplayPO.edtPONo.Text := st;
  frmDisplayPO.edtPONoKeyPress(Self, Key);
end;

procedure TfrmReprintNP.edt1Exit(Sender: TObject);
begin
  inherited;
  if Trim(edt1.Text) <> '' then
    edt1.Text := TAppUtils.StrPadLeft(Trim(edt1.Text), 10, '0');
end;

procedure TfrmReprintNP.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  inherited;
  if (Key = Ord('C')) and (ssctrl in Shift) then
  actReprintNPExecute(Self)
  else if (Key = Ord('D')) and (ssctrl in Shift) then
  actCheckListReprintNPExecute(Self)
  else if (Key = Ord('H')) and (ssctrl in Shift) then
  actShowDetailReprintNPExecute(Self)
end;

procedure TfrmReprintNP.edt1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  inherited;
  if Key = VK_F2 then
  btn1.Click;
end;

end.





