unit ufrmListPODOReceive;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, SUIButton, ComCtrls, uConn, JclStrings,
  ufraFooter5Button, ActnList, frxClass, DB, IBCustomDataSet, IBQuery,
  Grids, BaseGrid, AdvGrid, AdvCGrid, uADStanIntf, uADStanOption, uADStanParam,
  uADStanError, uADDatSManager, uADPhysIntf, uADDAptIntf, uADStanAsync,
  uADDAptManager, uADCompDataSet, FireDAC.Comp.Client, AdvObj;

type
  TfrmPODOReceive = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    actlstPODOReceive: TActionList;
    actListPrintPODOReceive: TAction;
    frxReport1: TfrxReport;
    IBQuery1: TFDQuery;
    Panel1: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    dtpFrom: TDateTimePicker;
    dtpTo: TDateTimePicker;
    btnPrint: TsuiButton;
    edtDOFrom: TEdit;
    edtDOTo: TEdit;
    btnShow: TsuiButton;
    Grid1: TAdvColumnGrid;
    edtPOTo: TEdit;
    Label4: TLabel;
    edtPOFrom: TEdit;
    Label6: TLabel;
    procedure btnPrintClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
//    procedure actListPrintPODOReceiveExecute(Sender: TObject);
    procedure edtDOToKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDOFromKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnShowClick(Sender: TObject);
    procedure edtPOFromKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPOToKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPrintEnter(Sender: TObject);
    procedure btnPrintExit(Sender: TObject);
    procedure btnShowExit(Sender: TObject);
    procedure btnShowEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPODOReceive: TfrmPODOReceive;

implementation

uses ufrmDialogPrintPreview,  uGTSUICommonDlg,
  ufrmSearchPO, suithemes, uRMSUnit, udmReportNew;

const
  _kolNO                  :Integer = 0;
  _KolNoDO                :Integer = 1;
  _KolTglDO               :Integer = 2;
  _KolTotalDO             :Integer = 3;
  _KolDescDO              :Integer = 4;
  _KOLStatusDO            :Integer = 5;
  _KolTglReceipt          :Integer = 6;
  _KolTotalReceipt        :Integer = 7;
  _KolTraderKode          :Integer = 8;
  _KolTraderNama          :Integer = 9;
  _KOLTraderAlamat        :Integer = 10;
  _KOLDueDate             :Integer = 11;

{$R *.dfm}

procedure TfrmPODOReceive.btnPrintClick(Sender: TObject);
var
  sSQL: String;
begin
//  actListPrintPODOReceiveExecute(Sender);
  sSQL := 'select '+Quot(edtPOFrom.Text)+ ' as POFrom,'+Quot(edtPOTo.Text)+' as POTo, '
       + GetCompanyHeader(FLoginFullname, MasterNewunit.Nama, dtpFrom.Date, dtpTo.Date)
       + IBQuery1.SQL.Text
       + ' where da.doas_status = ' + Quot('POS')
       + ' and da.doas_poas_no between ' + Quot(edtPOFrom.Text)
       + ' and ' + Quot(edtPOTo.Text)
       + ' and da.doas_date between '+ QuotD(dtpFrom.Date)
       + ' and ' + QuotD(dtpTo.Date)
       + ' order by t.trd_code' ;

  dmReportNew.EksekusiReport('ListPODOReceiveAssGross',sSQL, '', True)
end;

procedure TfrmPODOReceive.FormDestroy(Sender: TObject);
begin
  inherited;
  frmPODOReceive := nil;
end;

procedure TfrmPODOReceive.FormShow(Sender: TObject);
begin
  inherited;
  dtpFrom.Date := Now;
  dtpTo.Date := Now;
  cClearGrid(Grid1,False);
end;

{procedure TfrmPODOReceive.actListPrintPODOReceiveExecute(Sender: TObject);
var SeparatorDate: Char;
  data: TResultDataSet;
  ParamList: TStringList;
  formatTanggalPendek: string;
  arrParam: TArr;
begin
  inherited;
  edtPOFrom.Text := Trim(edtPOFrom.Text);
  edtPOTo.Text := Trim(edtPOTo.Text);

  if (edtPOFrom.Text = '') and (edtPOTo.Text <> '') then edtPOFrom.Text := edtPOTo.Text
  else if (edtPOTo.Text = '') and (edtPOFrom.Text <> '') then edtPOTo.Text := edtPOFrom.Text;

  if (edtPOFrom.Text <> '') and (edtPOTo.Text <> '') then begin


    edtPOFrom.Text := StrPadLeft(edtPOFrom.Text, 10, '0');
    edtPOTo.Text := StrPadLeft(edtPOTo.Text, 10, '0');

    SeparatorDate:= DateSeparator;

    try
      DateSeparator:= '/';
      formatTanggalPendek:= ShortDateFormat;
      ShortDateFormat:= 'mm/dd/yyyy';

      if not Assigned(PurchasingOrder) then
        PurchasingOrder:= TPurchasingOrder.Create;

      SetLength(arrParam,4);
      arrParam[0].tipe:= ptString;
      arrParam[0].data:= edtPOFrom.Text;
      arrParam[1].tipe:= ptString;
      arrParam[1].data:= edtPOTo.Text;
      arrParam[2].tipe:= ptDateTime;
      arrParam[2].data:= dtpFrom.Date;
      arrParam[3].tipe:= ptDateTime;
      arrParam[3].data:= dtpTo.Date;
      data:= PurchasingOrder.GetDataPODOReceive(arrParam);

      ParamList := TStringList.Create;
      ParamList.Add(FLoginFullname); //0
      ParamList.Add(edtPOFrom.Text); //1
      ParamList.Add(edtPOTo.Text); //2
      ParamList.Add(FormatDateTime('dd/mm/yyyy', dtpFrom.Date)); //3
      ParamList.Add(FormatDateTime('dd/mm/yyyy', dtpTo.Date)); //4
      ParamList.Add(MasterNewunit.Nama); //5

      ShortDateFormat:= 'dd/mm/yyyy';

      if not assigned(frmDialogPrintPreview) then
        frmDialogPrintPreview:= TfrmDialogPrintPreview.Create(Application);

      frmDialogPrintPreview.ListParams:= ParamList;
      frmDialogPrintPreview.RecordSet:= data;
      frmDialogPrintPreview.FilePath:= FFilePathReport+'frListPODOReceive.fr3';
      SetFormPropertyAndShowDialog(frmDialogPrintPreview);
    finally
      FreeAndNil(ParamList);
      frmDialogPrintPreview.Free;
      DateSeparator:= SeparatorDate;
      ShortDateFormat:= formatTanggalPendek;
    end;
  end
  else
    CommonDlg.ShowError('No PO Diisi dulu');

end;
}
procedure TfrmPODOReceive.edtDOToKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sSQL: String;
begin
  inherited;
  if Key = vk_f5 then
  begin
    sSQL := 'select distinct po.po_no, smg.supmg_code, s.sup_name, po.po_date,'
         + ' rsp.stapo_name, mer.merchan_name'
         + ' from po'
         + ' left join ref$status_po rsp on rsp.stapo_id = po.po_stapo_id'
         + ' left join suplier_merchan_grup smg'
         + ' on po.po_supmg_sub_code=smg.supmg_sub_code'
         + ' left join ref$merchandise_grup mg'
         + ' on smg.supmg_merchangrup_id=mg.merchangrup_id'
         + ' left join ref$merchandise mer'
         + ' on mg.merchangrup_merchan_id=mer.merchan_id'
         + ' left join suplier s on smg.supmg_code=s.sup_code'
         + ' where po.po_stapo_id not in(5,6)' ;

    with cLookUp('Pilih Nomor PO',sSQL,200,1) do
    Begin
      Try
        edtDOTo.Text := Strings[0];
      Finally
        Free;
      End;
    End;

//       if not Assigned(frmDialogSearchPO) then
//          frmDialogSearchPO:= TfrmDialogSearchPO.Create(Application);
//
//       frmDialogSearchPO.chkDate.Checked   := True;
//       frmDialogSearchPO.chkDate.Enabled   := False;
//       frmDialogSearchPO.dtTgl.Enabled     := False;
//       frmDialogSearchPO.dt1.Enabled       := False;
//       frmDialogSearchPO.Modul             := tmPODOReceiving;
//       frmDialogSearchPO.dtTgl.Date        := dtpFrom.Date;
//       frmDialogSearchPO.dt1.Date          := dtpTo.Date;
//
//       if frmDialogSearchPO.IsProcessSuccessfull then
//          edtPOTo.Text:= frmDialogSearchPO.PONo;
//
//       frmDialogSearchPO.Free;
  end;
end;

procedure TfrmPODOReceive.edtDOFromKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sSQL: String;
begin
  inherited;
  if Key = vk_f5 then
  begin
    sSQL := 'select distinct po.po_no, smg.supmg_code, s.sup_name, po.po_date,'
         + ' rsp.stapo_name, mer.merchan_name'
         + ' from po'
         + ' left join ref$status_po rsp on rsp.stapo_id = po.po_stapo_id'
         + ' left join suplier_merchan_grup smg'
         + ' on po.po_supmg_sub_code=smg.supmg_sub_code'
         + ' left join ref$merchandise_grup mg'
         + ' on smg.supmg_merchangrup_id=mg.merchangrup_id'
         + ' left join ref$merchandise mer'
         + ' on mg.merchangrup_merchan_id=mer.merchan_id'
         + ' left join suplier s on smg.supmg_code=s.sup_code'
         + ' where po.po_stapo_id not in(5,6)' ;

    with cLookUp('Pilih Nomor DO',sSQL,200,1) do
    Begin
      Try
        edtDOFrom.Text := Strings[0];
      Finally
        Free;
      End;
    End;

//       if not Assigned(frmDialogSearchPO) then
//          frmDialogSearchPO:= TfrmDialogSearchPO.Create(Application);
//
//       frmDialogSearchPO.chkDate.Checked   := True;
//       frmDialogSearchPO.chkDate.Enabled   := False;
//       frmDialogSearchPO.dtTgl.Enabled     := False;
//       frmDialogSearchPO.dt1.Enabled       := False;
//       frmDialogSearchPO.Modul             := tmPODOReceiving;
//       frmDialogSearchPO.dtTgl.Date        := dtpFrom.Date;
//       frmDialogSearchPO.dt1.Date          := dtpTo.Date;
//
//       if frmDialogSearchPO.IsProcessSuccessfull then
//          edtPOFrom.Text:= frmDialogSearchPO.PONo;
//
//       frmDialogSearchPO.Free;
  end;
end;

procedure TfrmPODOReceive.btnShowClick(Sender: TObject);
var
  sSQL: String;
begin
  inherited;
  sSQL := 'select '
       + IBQuery1.SQL.Text
       + ' where '
       + ' da.doas_status = ' + Quot('POS')
       + ' and da.doas_poas_no between ' + Quot(edtPOFrom.Text)
       + ' and ' + Quot(edtPOTo.Text)
       + ' and da.doas_date between '+ QuotD(dtpFrom.Date)
       + ' and ' + QuotD(dtpTo.Date)
       + ' order by t.trd_code' ;

  cQueryToGrid(sSQL, Grid1);
  grid1.AutoSizeColumns(False,8);

end;

procedure TfrmPODOReceive.edtPOFromKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sSQL: String;
begin
  inherited;
  if Key = vk_f5 then
  begin
    sSQL := 'Select PA.POAS_NO,PA.POAS_DATE,T.TRD_NAME '
          + ' From PO_ASSGROS PA '
          + ' Left Join TRADER T on PA.POAS_TRD_ID = T.TRD_ID '
          + ' AND PA.POAS_TRD_UNT_ID = T.TRD_UNT_ID '
          + ' Where PA.POAS_UNT_ID = '+IntToStr(masternewunit.id)
          + ' And PA.POAS_STATUS = '+Quot('CLOSE');

    with cLookUp('Pilih Nomor PO',sSQL,200,1) do
    Begin
      Try
        edtPOFrom.Text := Strings[0];
      Finally
        Free;
      End;
    End;

end;
end;

procedure TfrmPODOReceive.edtPOToKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sSQL: String;
begin
  inherited;
  if Key = vk_f5 then
  begin
    sSQL := 'Select PA.POAS_NO,PA.POAS_DATE,T.TRD_NAME '
          + ' From PO_ASSGROS PA '
          + ' Left Join TRADER T on PA.POAS_TRD_ID = T.TRD_ID '
          + ' AND PA.POAS_TRD_UNT_ID = T.TRD_UNT_ID '
          + ' Where PA.POAS_UNT_ID = '+IntToStr(masternewunit.id)
          + ' And PA.POAS_STATUS = '+Quot('CLOSE');


    with cLookUp('Pilih Nomor PO',sSQL,200,1) do
    Begin
      Try
        edtPOTo.Text := Strings[0];
      Finally
        Free;
      End;
    End;

end;
end;

procedure TfrmPODOReceive.btnPrintEnter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmPODOReceive.btnPrintExit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

procedure TfrmPODOReceive.btnShowExit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

procedure TfrmPODOReceive.btnShowEnter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

end.



