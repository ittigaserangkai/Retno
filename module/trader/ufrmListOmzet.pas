unit ufrmListOmzet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, SUIButton, ComCtrls, uConn, JclStrings,
  uGTSUICommonDlg, ufraFooter5Button, ActnList, DB, IBCustomDataSet,
  IBQuery, uADStanIntf, uADStanOption, uADStanParam, uADStanError,
  uADDatSManager, uADPhysIntf, uADDAptIntf, uADStanAsync, uADDAptManager,
  uADCompDataSet, FireDAC.Comp.Client;

type
  TfrmListOmzet = class(TfrmMaster)
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    dtpFrom: TDateTimePicker;
    dtpTo: TDateTimePicker;
    btnPrint: TsuiButton;
    edtMemberNoFrom: TEdit;
    edtMemberNoTo: TEdit;
    fraFooter5Button1: TfraFooter5Button;
    actlstOmzet: TActionList;
    actListPrintOmzet: TAction;
    IBQuery1: TFDQuery;
    cbbTraderType: TComboBox;
    Label4: TLabel;
    procedure btnPrintClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actListPrintOmzetExecute(Sender: TObject);
    procedure edtMemberNoFromKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtMemberNoToKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure btnPrintEnter(Sender: TObject);
    procedure btnPrintExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListOmzet: TfrmListOmzet;

implementation

uses  ufrmDialogPrintPreview,  ufrmSearchMember,
  uRMSUnit, suithemes, udmReportNew;

{$R *.dfm}
const
  COMBO_OPSI_TRADER_ALL = 'ALL';
  COMBO_OPSI_TRADER_ASSGROS = 'ASSGROS';
  COMBO_OPSI_TRADER_ASLM_TRD = 'ASSALAAM DAN TRADER';
  COMBO_OPSI_TRADER_MEMBER = 'MEMBER';

procedure TfrmListOmzet.btnPrintClick(Sender: TObject);
var
  sKriteria: string;
  strCodeTo: string;
  strCodeFrom: string;
  sSQL: String;
begin

  if cbbTraderType.ItemIndex = 1  then
    sKriteria := ' WHERE c.TPMEMBER_ID = 9 And a.TRD_IS_ASSGROS = 1'
    //sKriteria := ' WHERE a.TRD_IS_ASSGROS = 1'
  else if cbbTraderType.ItemIndex = 2 then
    sKriteria := ' WHERE c.TPMEMBER_ID = 8 And a.TRD_IS_ASSGROS = 0'
    //sKriteria := ' WHERE c.TRD_IS_ASSGROS = 0'
  else  if cbbTraderType.ItemIndex = 3 then
    sKriteria := ' WHERE (c.TRD_MEMBER_ID IS NULL OR c.TPMEMBER_ID not in (8,9))'
  else   //0, -1
    sKriteria := '';


  strCodeFrom := Quot(edtMemberNoFrom.Text) + ' as "CodeNoFrom",';
  strCodeTo := Quot(edtMemberNoTo.Text) + ' as "CodeNoTo",';
  sSQL := 'select '
      + GetCompanyHeader(FLoginFullname,MasterNewunit.Nama,cGetServerTime,cGetServerTime)
      + strCodeFrom
      + strCodeTo
      //       + IBQuery1.SQL.Text

      + ' t.trd_code, t.trd_name,'
      + ' c1.MERCHANGRUP_ID, c1.MERCHANGRUP_CODE, c1.MERCHANGRUP_NAME,'
      + ' sum(da.doas_subtotal_recipt) as "nilai_gross",'
      + ' sum(da.doas_disc_recipt + da.doas_disc_member_recipt) as "disc",'
      + ' sum(da.doas_subtotal_recipt - (da.doas_disc_recipt + da.doas_disc_member_recipt))'
      + ' as "nilai_after_disc",'
      + ' sum(da.doas_ppn_recipt + da.doas_ppnbm_recipt) as "pajak",'
      + ' sum(da.doas_total_recipt)  as "total_nilai",'
      + ' sum(da.doas_total_recipt - da.doas_last_cost) as  "gp"'
      + ' from do_assgros da'
      + ' inner join trader t on t.trd_id = da.doas_trd_id'
      + ' and t.trd_unt_id = da.doas_trd_unt_id'
      + ' inner join DO_ASSGROS_DETIL a1 on da.DOAS_NO = a1.DOASD_DOAS_NO'
      + ' and da.DOAS_UNT_ID = a1.DOASD_DOAS_UNT_ID'
      + ' inner join barang b1 on a1.DOASD_BRG_CODE = b1.BRG_CODE'
      + ' inner join REF$MERCHANDISE_GRUP c1 on b1.BRG_MERCHANGRUP_ID = c1.MERCHANGRUP_ID'

      + ' INNER JOIN MEMBER b ON b.MEMBER_ID = t.TRD_MEMBER_ID'
      + ' AND b.MEMBER_UNT_ID = t.TRD_MEMBER_UNT_ID'
      + ' inner JOIN REF$TIPE_MEMBER c ON c.TPMEMBER_ID = b.MEMBER_TPMEMBER_ID'
      + ' and da.doas_date between '
      + QuotD(dtpFrom.Date)
      + ' and '
      + QuotD(dtpTo.Date)
      + ' and t.trd_code between '
      + Quot(edtMemberNoFrom.Text)
      +' and '
      + Quot(edtMemberNoTo.Text)
      + ' group by t.trd_code, t.trd_name,'
      + ' c1.MERCHANGRUP_ID, c1.MERCHANGRUP_CODE, c1.MERCHANGRUP_NAME';

  dmReportNew.EksekusiReport('ListingOmzetKring33',sSQL,'',True);

//  actListPrintOmzetExecute(Sender);
end;

procedure TfrmListOmzet.FormShow(Sender: TObject);
begin
  inherited;
  dtpFrom.Date := Now;
  dtpTo.Date := Now;

  cbbTraderType.Clear;
  cbbTraderType.Items.Add(COMBO_OPSI_TRADER_ALL);
  cbbTraderType.Items.Add(COMBO_OPSI_TRADER_ASSGROS);
  cbbTraderType.Items.Add(COMBO_OPSI_TRADER_ASLM_TRD);
  cbbTraderType.Items.Add(COMBO_OPSI_TRADER_MEMBER);
end;

procedure TfrmListOmzet.actListPrintOmzetExecute(Sender: TObject);
var // SeparatorDate: Char;
  sSQL: String;
//  data: TResultDataSet;
//  ParamList: TStringList;
//  formatTanggalPendek: string;
//  arrParam: TArr;
begin
  inherited;
  edtMemberNoFrom.Text := Trim(edtMemberNoFrom.Text);
  edtMemberNoTo.Text := Trim(edtMemberNoTo.Text);

//  if (edtMemberNoFrom.Text <> '') or (edtMemberNoTo.Text <> '') then begin
//
//    if (edtMemberNoFrom.Text = '') then edtMemberNoFrom.Text := edtMemberNoTo.Text
//    else if (edtMemberNoTo.Text = '') then edtMemberNoTo.Text := edtMemberNoFrom.Text;
//
//    SeparatorDate:= DateSeparator;
//
//    try
//      DateSeparator:= '/';
//      formatTanggalPendek:= ShortDateFormat;
//      ShortDateFormat:= 'mm/dd/yyyy';
//
//      if not Assigned(PurchasingOrder) then
//        PurchasingOrder:= TPurchasingOrder.Create;
//
//      SetLength(arrParam,4);
//      arrParam[0].tipe:= ptDateTime;
//      arrParam[0].data:= dtpFrom.Date;
//      arrParam[1].tipe:= ptDateTime;
//      arrParam[1].data:= dtpTo.Date;
//      arrParam[2].tipe:= ptString;
//      arrParam[2].data:= edtMemberNoFrom.Text;
//      arrParam[3].tipe:= ptString;
//      arrParam[3].data:= edtMemberNoTo.Text;
//      data:= PurchasingOrder.GetDataPrintListOmzet(arrParam);
//
//      ParamList := TStringList.Create;
//      ParamList.Add(FLoginFullname); //0
//      ParamList.Add(FormatDateTime('dd/mm/yyyy', dtpFrom.Date)); //1
//      ParamList.Add(FormatDateTime('dd/mm/yyyy', dtpTo.Date)); //2
//      ParamList.Add(edtMemberNoFrom.Text); //3
//      ParamList.Add(edtMemberNoTo.Text); //4
//      ParamList.Add(MasterNewunit.Nama); //5
//
//      ShortDateFormat:= 'dd/mm/yyyy';
//
//      if not assigned(frmDialogPrintPreview) then
//        frmDialogPrintPreview:= TfrmDialogPrintPreview.Create(Application);
//
//      frmDialogPrintPreview.ListParams:= ParamList;
//      frmDialogPrintPreview.RecordSet:= data;
//      frmDialogPrintPreview.FilePath:= FFilePathReport+'frOmzetMember.fr3';
//      SetFormPropertyAndShowDialog(frmDialogPrintPreview);
//    finally
//      FreeAndNil(ParamList);
//      frmDialogPrintPreview.Free;
//      DateSeparator:= SeparatorDate;
//      ShortDateFormat:= formatTanggalPendek;
//    end;
//  end
//  else
//    CommonDlg.ShowError('Nomor Member Diisi dulu');

  sSQL := 'select '
       + GetCompanyHeader(FLoginFullname,MasterNewunit.Nama,cGetServerTime,cGetServerTime)
       + IBQuery1.SQL.Text
//       + ' where da.doas_date between '
//       + QuotD(dtpFrom.Date)
//       + ' and '
//       + QuotD(dtpTo.Date)
//       + ' and t.trd_code between '
//       + Quot(edtMemberNoFrom.Text)
//       +' and '
//       + Quot(edtMemberNoTo.Text)
       + ' group by t.trd_code, t.trd_name';
  dmReportNew.EksekusiReport('ListingOmzetKring33',sSQL,'',True);
end;

procedure TfrmListOmzet.edtMemberNoFromKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  sSQL: String;
begin
  inherited;
  if key = vk_f5 then
  Begin
    sSQL := 'select a.trd_code, a.trd_name, a.trd_description, a.trd_address,'
         + ' a.trd_contact_person'
         + ' from trader a';

    with cLookUp('Pilih Nomor Trader',sSQL,200,1) do
    Begin
      Try
        edtMemberNoFrom.Text := Strings[0];
      Finally
        Free;
      End;
    End;
  End;
//  begin
//    if not Assigned(frmDialogSearchMember) then
//       frmDialogSearchMember:= TfrmDialogSearchMember.Create(application);
//
//    frmDialogSearchMember.edtKodeMember.Text:= edtMemberNoFrom.Text;
//
//    if frmDialogSearchMember.IsProcessSuccessfull then
//       edtMemberNoFrom.Text:= frmDialogSearchMember.MemberCode;
//
//    frmDialogSearchMember.Free;
//  end;
end;

procedure TfrmListOmzet.edtMemberNoToKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sSQL: String;
begin
  inherited;
  if key = vk_f5 then
  Begin
    sSQL := 'select a.trd_code, a.trd_name, a.trd_description, a.trd_address,'
         + ' a.trd_contact_person'
         + ' from trader a';

    with cLookUp('Pilih Nomor Anggota',sSQL,200,1) do
    Begin
      Try
        edtMemberNoTo.Text := Strings[0];
      Finally
        Free;
      End;
    End;
  End;

  //  if key = vk_f5 then
//  begin

  //    if not Assigned(frmDialogSearchMember) then
//       frmDialogSearchMember:= TfrmDialogSearchMember.Create(application);
//
//    frmDialogSearchMember.edtKodeMember.Text:= edtMemberNoTo.Text;
//
//    if frmDialogSearchMember.IsProcessSuccessfull then
//       edtMemberNoTo.Text:= frmDialogSearchMember.MemberCode;
//
//    frmDialogSearchMember.Free;
//  end;
end;

procedure TfrmListOmzet.FormDestroy(Sender: TObject);
begin
  inherited;
  frmListOmzet := nil;
end;

procedure TfrmListOmzet.btnPrintEnter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmListOmzet.btnPrintExit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

end.


