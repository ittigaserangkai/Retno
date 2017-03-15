unit ufrmPrintHistoryPOBySupplier;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, cbxbase, dblup1a, SUIButton, ComCtrls,
  ufraFooter1Button, ExtCtrls, SUIComboBox, ufrmSearchSupplier;

type
//  TMyThread = class(TThread)
//  private
//    { Private declarations }
//  protected
//    procedure Execute; override;
//    procedure FillComboSupplier;
//  end;

  TfrmPrintHistoryPOBySupplier = class(TfrmMaster)
    fraFooter1Button1: TfraFooter1Button;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    btnPrint: TsuiButton;
    edtSupplier: TEdit;
    edtSupplierCode: TEdit;
    lbl1: TLabel;
    cbbStatusPO: TsuiComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure edtSupplierCodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPrintEnter(Sender: TObject);
    procedure btnPrintExit(Sender: TObject);
  private
    { Private declarations }
    procedure FetchPOStatus;
    procedure FetchSupplierName;
  public
    { Public declarations }
  end;

var
  frmPrintHistoryPOBySupplier: TfrmPrintHistoryPOBySupplier;

implementation

uses uConn,suithemes,  udmReport, uPrintHistoryPOBySupplier, DateUtils, ufrmSplash,
  ufrmDialogPrintPreview, uConstanta, uHistoryPO, uRMSUnit, fr_Class, uGTSUICommonDlg,
  udmReportNew;

var arrParam: TArr;

{$R *.dfm}


procedure TfrmPrintHistoryPOBySupplier.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action:= caFree;
end;

procedure TfrmPrintHistoryPOBySupplier.FormDestroy(Sender: TObject);
begin
  inherited;

  frmPrintHistoryPOBySupplier:= nil;
end;

procedure TfrmPrintHistoryPOBySupplier.FormCreate(Sender: TObject);
begin
  inherited;

  lblHeader.Caption:= 'PRINT HISTORY PO BY SUPPLIER';
  frmPrintHistoryPOBySupplier.Caption:= 'Print History PO By Supplier';
end;

procedure TfrmPrintHistoryPOBySupplier.FormActivate(Sender: TObject);
begin
  inherited;
  frmPrintHistoryPOBySupplier.Caption:= 'PRINT HISTORY PO BY SUPPLIER';
end;

procedure TfrmPrintHistoryPOBySupplier.FormDeactivate(Sender: TObject);
begin
  inherited;

  frmPrintHistoryPOBySupplier.Caption:= '';
end;

procedure TfrmPrintHistoryPOBySupplier.FormShow(Sender: TObject);
begin
  inherited;

  dtp1.Date:= Now;
  dtp2.Date:= Now;
  FetchPOStatus;

end;

procedure TfrmPrintHistoryPOBySupplier.btnPrintClick(Sender: TObject);
var
  sSQL: string;

begin
  inherited;

  if (edtSupplierCode.Text = '') then
    Exit;
  if cbbStatusPO.Text = '' then
  begin
    CommonDlg.ShowErrorEmpty('Status PO');
    cbbStatusPO.SetFocus;
    Exit;
  end;

  sSQL :=
    'select ' +
        'p.po_date, p.po_no, sum(pod.pod_total_disc + pod.pod_total_tax) as Purchase, ' +
        'sum(dod.dod_total_disc + dod.dod_total_tax) as Received, d.do_date, sp.stapo_name ' +
    'from po p ' +
    'inner join SUPLIER_MERCHAN_GRUP smg on smg.SUPMG_SUB_CODE=p.PO_SUPMG_SUB_CODE ' +
    'left join ref$status_po sp on p.po_stapo_id=sp.stapo_id  ' +
    'left join po_detil pod on (pod.pod_po_no=p.po_no and pod.pod_po_unt_id=p.po_unt_id) ' +
    'left join  do_detil dod on (dod.dod_pod_id=pod.pod_id and dod.dod_pod_unt_id=pod.pod_unt_id) ' +
    'left join  dord d on (dod.dod_do_no=d.do_no and dod.dod_do_unt_id=d.do_unt_id) ' +
    'where p.po_unt_id= ' + IntToStr(MasterNewUnit.ID) +
    ' and p.po_date >= ' + QuotD(dtp1.Date) +
    ' and p.po_date <= ' + QuotD(dtp2.Date) +
    ' and smg.SUPMG_CODE = ' + QuotedStr(edtSupplierCode.Text) +
    ' and upper(sp.stapo_name) like upper(' + QuotedStr(cbbStatusPO.Text) + ')' +
    ' group by p.po_date,p.po_no, d.do_date, sp.stapo_name';

    frVariables.Variable['loginname']    := fLoginFullname;   //FLoginUsername
    frVariables.Variable['unitname']     := MasterNewUnit.Nama;

    frVariables.Variable['FPODateFrom']  := FormatDateTime('dd/mm/yyyy', dtp1.Date);
    frVariables.Variable['FPODateTo']    := FormatDateTime('dd/mm/yyyy', dtp2.Date);

    frVariables.Variable['StatusPO']   := cbbStatusPO.Text;
    frVariables.Variable['SupCode']    := edtSupplierCode.Text;

    dmReportNew.EksekusiReport('frHistoryPOBySupplier',sSQL);


end;

procedure TfrmPrintHistoryPOBySupplier.FetchPOStatus;
var
  AData:TResultDataSet;
begin
  SetLength(arrParam, 0);
  arrParam  := nil;
  AData:=HistoryPO.GetListStatusPOByUnitId(arrParam);
  cbbStatusPO.Clear;
  while not AData.Eof do
  begin
    cbbStatusPO.Items.Add(AData.FieldByName('STAPO_NAME').AsString);
    AData.Next;
  end;
end;

procedure TfrmPrintHistoryPOBySupplier.FetchSupplierName;
var
  AName: TResultDataSet;
begin
  SetLength(arrParam, 1);
  arrParam[0].tipe:= ptString;
  arrParam[0].data:= edtSupplierCode.Text;

  if not Assigned(HistoryPO) then HistoryPO:= THistoryPO.Create;
  AName:= HistoryPO.GetSuplierNameByCode(arrParam);
  edtSupplier.Clear;
  if not AName.IsEmpty then edtSupplier.Text:= AName.FieldByName('SUP_NAME').AsString;
end;

procedure TfrmPrintHistoryPOBySupplier.edtSupplierCodeKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F5 then
  begin
    if not Assigned(frmDialogSearchSupplier) then frmDialogSearchSupplier:= TfrmDialogSearchSupplier.Create(Application);
    frmDialogSearchSupplier.edtSupCode.Text:= edtSupplierCode.Text;
    frmDialogSearchSupplier.searchFor:= sfHistoryPO;
    frmDialogSearchSupplier.ShowModal;
    begin
      edtSupplierCode.Text:= frmDialogSearchSupplier.SupplierCode;
      edtSupplier.Text:= frmDialogSearchSupplier.SupplierName;
    end;
    frmDialogSearchSupplier.Free;
  end else
  if Key = VK_RETURN then
    FetchSupplierName;
end;

procedure TfrmPrintHistoryPOBySupplier.btnPrintEnter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmPrintHistoryPOBySupplier.btnPrintExit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

end.


