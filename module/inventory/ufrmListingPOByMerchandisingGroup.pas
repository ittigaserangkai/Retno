unit ufrmListingPOByMerchandisingGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, ufraFooter1Button, SUIButton, ComCtrls, StdCtrls,
  ExtCtrls, cbxbase, dblup1a, ufraFooter5Button;

type
  TfrmListingPOByMerchandisingGroup = class(TfrmMaster)
    Label2: TLabel;
    Label3: TLabel;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    btnPrint: TsuiButton;
    cbpStatusPO: TColumnComboBox;
    cbpMerchGroup: TColumnComboBox;
    Label1: TLabel;
    Label4: TLabel;
    edtStatusPO: TEdit;
    edtMerchGroup: TEdit;
    footer1: TfraFooter5Button;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure cbpStatusPOChange(Sender: TObject);
    procedure cbpMerchGroupChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure footer1btnRefreshClick(Sender: TObject);
    procedure btnPrintEnter(Sender: TObject);
    procedure btnPrintExit(Sender: TObject);
  private
    { Private declarations }
    procedure FillComboStatusPO;
    procedure FillComboMerchGroup;
  public
    { Public declarations }
  end;

var
  frmListingPOByMerchandisingGroup: TfrmListingPOByMerchandisingGroup;

implementation

uses uConn,suithemes,  udmReport, DateUtils, fr_Class, uRMSUnit,
  uGTSUICommonDlg, ufrmDialogPrintPreview, uConstanta,
  uListingPOByMerchandisingGroup, udmReportNew;

var arrParam: TArr;

{$R *.dfm}

procedure TfrmListingPOByMerchandisingGroup.FormShow(Sender: TObject);
begin
  inherited;

  dtp1.Date:= Now;
  dtp2.Date:= Now;

  FillComboStatusPO;
  if MasterNewUnit.ID > 0 then
    FillComboMerchGroup;
end;

procedure TfrmListingPOByMerchandisingGroup.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  //frmMain.DestroyMenu((Sender as TForm));
  Action:= caFree;
end;

procedure TfrmListingPOByMerchandisingGroup.FormDestroy(Sender: TObject);
begin
  inherited;

  frmListingPOByMerchandisingGroup:= nil;
end;

procedure TfrmListingPOByMerchandisingGroup.btnPrintClick(Sender: TObject);
var
  sSQL: string;
{  SeparatorDate: Char;
  data: TResultDataSet;
  ParamList: TStringList;
  formatTanggalPendek: string;}
begin
  inherited;

  if Mastercompany.ID < 1 then
  begin
    CommonDlg.ShowError(ER_COMPANY_NOT_SPECIFIC);
    Exit;
  end;

  if MasterNewUnit.ID < 1 then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    Exit;
  end;
  
  if (cbpStatusPO.Cells[0,cbpStatusPO.Row] <> '')
    and (cbpStatusPO.Cells[0,cbpStatusPO.Row] <> 'Id')
    and (cbpMerchGroup.Cells[0,cbpMerchGroup.Row] <> '')
    and (cbpMerchGroup.Cells[0,cbpMerchGroup.Row] <> 'Id') then begin

  sSQL :=
    'select sup.sup_code, (rtp.TPPERSH_CODE || '' '' || sup.sup_name) as suplier_code_name, ' +
       'p.po_date, p.po_no, ' +
       'p.po_deliver_date AS due_date, s.so_no, ' +
       's.so_date, ' +//sum(do_colie_order) as colie, ' +
       'p.po_colie AS colie, ' +
       'sum(pod.pod_total_disc + pod.pod_ppn + pod.pod_ppnbm) as Subtotal, ' +
       'sum(pod.pod_ppn) as pod_ppn, sum(pod.pod_ppnbm) as pod_ppnbm, sum(pod.pod_total_disc) as purchase ' +
    'from po p ' +
      'left join so s on (p.po_so_no=s.so_no and p.po_so_unt_id=s.so_unt_id) ' +
      'left join so_detil sod on (sod.sod_so_no=s.so_no and sod.sod_so_unt_id=s.so_unt_id) ' +
      'left join po_detil pod on (pod.pod_po_no=p.po_no and pod.pod_po_unt_id=p.po_unt_id and pod.pod_sod_id=sod.sod_id and pod.pod_sod_unt_id=sod.sod_unt_id) ' +
      'left join dord d on (d.do_po_no=p.po_no and d.do_po_unt_id=p.po_unt_id and d.do_so_no=s.so_no and d.do_so_unt_id=s.so_unt_id) ' +
      'left join suplier sup on (p.po_sup_code=sup.sup_code) ' +
      'LEFT JOIN REF$TIPE_PERUSAHAAN RTP ON sup.SUP_TPPERSH_ID = RTP.TPPERSH_ID ' +
    'where p.po_stapo_id = ' + (cbpStatusPO.Cells[0,cbpStatusPO.Row]) +
      ' and p.po_unt_id= ' + IntToStr(MasterNewUnit.ID) +
      ' and p.PO_DATE >= ' + QuotD(dtp1.Date) +
      ' and p.PO_DATE <= ' + QuotD(dtp2.Date) +
      ' and so_merchangrup_id = ' + (cbpMerchGroup.Cells[0,cbpMerchGroup.Row]) +
    ' group by sup.sup_code,rtp.tppersh_code, sup.sup_name, p.po_date, p.po_no, p.po_deliver_date, s.so_no, s.so_date, p.po_colie';

    GetExCompanyHeader(dtp1.DateTime, dtp2.DateTime, MasterNewUnit.ID,
                    FLoginUsername, FLoginFullname);
//    frVariables.Variable['loginname']    := FLoginFullname;   
//    frVariables.Variable['Floginname']     := FLoginUsername;
//    frVariables.Variable['Floginfullname'] := FLoginFullname;
    frVariables.Variable['Funitname']      := MasterNewUnit.Nama;

//    frVariables.Variable['FPODateFrom']  := FormatDateTime('dd/mm/yyyy', dtp1.Date);
//    frVariables.Variable['FPODateTo']    := FormatDateTime('dd/mm/yyyy', dtp2.Date);

    frVariables.Variable['FStatusPO']   := edtStatusPO.Text;
    frVariables.Variable['FMerchanGroup'] := edtMerchGroup.Text;

    dmReportNew.EksekusiReport('frListingPurchaseOrderByMerchandisingGroup',sSQL);

{
    SeparatorDate:= DateSeparator;

    try
      DateSeparator:= '/';
      formatTanggalPendek:= ShortDateFormat;
      ShortDateFormat:= 'mm/dd/yyyy';

      if not Assigned(ListingPOByMerchandisingGroup) then
        ListingPOByMerchandisingGroup:= TListingPOByMerchandisingGroup.Create;

      SetLength(arrParam,4);
      arrParam[0].tipe:= ptDateTime;
      arrParam[0].data:= StrToDateTime(DateToStr(dtp1.Date) + ' 00:00:00');
      arrParam[1].tipe:= ptDateTime;
      arrParam[1].data:= IncDay(StrToDateTime(DateToStr(dtp2.Date) + ' 00:00:00'),1);
      arrParam[2].tipe:= ptInteger;
      arrParam[2].data:= StrToInt(cbpStatusPO.Cells[0,cbpStatusPO.Row]);
      arrParam[3].tipe:= ptInteger;
      arrParam[3].data:= StrToInt(cbpMerchGroup.Cells[0,cbpMerchGroup.Row]);
      data:= ListingPOByMerchandisingGroup.GetListDataPOByMerchandisingGroup(arrParam);

      ParamList := TStringList.Create;
      with ParamList do
      begin
        Add(FormatDateTime('dd/mm/yyyy', dtp1.Date)); //0
        Add(FormatDateTime('dd/mm/yyyy', dtp2.Date)); //1
        Add(edtStatusPO.Text); //2
        Add(edtMerchGroup.Text); //3
        Add(FLoginFullname); //4
        Add(MasterNewUnit.Nama); //5
      end;
      ShortDateFormat:= 'dd/mm/yyyy';

      if not assigned(frmDialogPrintPreview) then
        frmDialogPrintPreview:= TfrmDialogPrintPreview.Create(Application);

      with frmDialogPrintPreview do
      begin
        ListParams:= ParamList;
        RecordSet:= data;
        FilePath:= FFilePathReport+'frListingPurchaseOrderByMerchandisingGroup.fr3';
        SetFormPropertyAndShowDialog(frmDialogPrintPreview);
      end;
    finally
      FreeAndNil(ParamList);
      FreeAndNil(ListingPOByMerchandisingGroup);
      frmDialogPrintPreview.Free;
      DateSeparator:= SeparatorDate;
      ShortDateFormat:= formatTanggalPendek;
    end;
}
  end
  else
    CommonDlg.ShowError('Status and Merch. Group cannot be empty.');

end;

procedure TfrmListingPOByMerchandisingGroup.FillComboStatusPO;
var dataStatusPO: TResultDataSet;
begin
  if not Assigned(ListingPOByMerchandisingGroup) then
    ListingPOByMerchandisingGroup:= TListingPOByMerchandisingGroup.Create;

  SetLength(arrParam,0);
  arrParam  := nil;
  dataStatusPO:= ListingPOByMerchandisingGroup.GetAllDataStatusPO(arrParam);

  // isi list combo box status PO
  with cbpStatusPO do begin
    ClearGridData;
    ColCount := 3;

    if not dataStatusPO.IsEmpty then begin
      dataStatusPO.First;
      RowCount := dataStatusPO.RecordCount + 1;
      AddRow(['Id', 'Status PO Code', 'Status PO Name']);

      while not dataStatusPO.Eof do begin
        AddRow([dataStatusPO.FieldByName('STAPO_ID').AsString,
          dataStatusPO.FieldByName('STAPO_CODE').AsString,
          dataStatusPO.FieldByName('STAPO_NAME').AsString]);
        dataStatusPO.Next;
      end;
    end
    else begin
      RowCount := 2;
      AddRow(['Id', 'Status PO Code', 'Status PO Name']);
      AddRow(['', ' ', ' ']);
    end;

    FixedRows := 1;
    SizeGridToData;
    Text := '';
  end;
end;

procedure TfrmListingPOByMerchandisingGroup.FillComboMerchGroup;
var dataMerchGroup: TResultDataSet;
begin
  if not Assigned(ListingPOByMerchandisingGroup) then
    ListingPOByMerchandisingGroup:= TListingPOByMerchandisingGroup.Create;

  SetLength(arrParam,0);
  arrParam := nil;
  dataMerchGroup:= ListingPOByMerchandisingGroup.GetAllDataMerchandise(arrParam);

  // isi list combo box MerchGroup
  with cbpMerchGroup do begin
    ClearGridData;
    ColCount := 3;

    if not dataMerchGroup.IsEmpty then begin
      dataMerchGroup.First;
      RowCount := dataMerchGroup.RecordCount + 1;
      AddRow(['Id', 'Merchandise Code', 'Merchandise Name']);

      while not dataMerchGroup.Eof do begin
        AddRow([dataMerchGroup.FieldByName('MERCHAN_ID').AsString,
          dataMerchGroup.FieldByName('MERCHAN_CODE').AsString,
          dataMerchGroup.FieldByName('MERCHAN_NAME').AsString]);
        dataMerchGroup.Next;
      end;
    end
    else begin
      RowCount := 2;
      AddRow(['Id', 'Merchandise Code', 'Merchandise Name']);
      AddRow(['', ' ', ' ']);
    end;

    FixedRows := 1;
    SizeGridToData;
    Text := '';
  end;
end;

procedure TfrmListingPOByMerchandisingGroup.cbpStatusPOChange(
  Sender: TObject);
begin
  inherited;

  edtStatusPO.Text:= cbpStatusPO.Cells[2,cbpStatusPO.Row];
end;

procedure TfrmListingPOByMerchandisingGroup.cbpMerchGroupChange(
  Sender: TObject);
begin
  inherited;

  edtMerchGroup.Text:= cbpMerchGroup.Cells[2,cbpMerchGroup.Row];
end;

procedure TfrmListingPOByMerchandisingGroup.FormActivate(Sender: TObject);
begin
  inherited;
  frmListingPOByMerchandisingGroup.Caption := 'LISTING PURCHASE ORDER BY MERCHANDISING GROUP';
  //frmMain.CreateMenu((Sender as TForm));
end;

procedure TfrmListingPOByMerchandisingGroup.footer1btnRefreshClick(
  Sender: TObject);
begin
  inherited;
  FormShow(Self);
end;

procedure TfrmListingPOByMerchandisingGroup.btnPrintEnter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmListingPOByMerchandisingGroup.btnPrintExit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

end.
