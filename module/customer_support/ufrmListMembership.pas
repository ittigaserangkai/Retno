unit ufrmListMembership;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, ComCtrls, ufraFooter5Button,
  ActnList, System.Actions;

type
  TfrmListMembership = class(TfrmMaster)
    Label2: TLabel;
    Label3: TLabel;
    dtpFrom: TDateTimePicker;
    dtpTo: TDateTimePicker;
    Label1: TLabel;
    cbbPilih: TComboBox;
    fraFooter5Button1: TfraFooter5Button;
    actlstMembership: TActionList;
    actListPrintMembership: TAction;
    procedure FormShow(Sender: TObject);
    procedure actListPrintMembershipExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListMembership: TfrmListMembership;

implementation

uses uConstanta,  ufrmDialogPrintPreview, DateUtils, uRetnoUnit, uDMReport,
     uAppUtils;

{$R *.dfm}

procedure TfrmListMembership.FormShow(Sender: TObject);
begin
  inherited;
  dtpFrom.Date := Now;
  dtpTo.Date := Now;
end;

procedure TfrmListMembership.actListPrintMembershipExecute(
  Sender: TObject);
var
  sSQL: String;
//  SeparatorDate: Char;
//  data: TResultDataSet;
//  ParamList: TStringList;
//  formatTanggalPendek: string;
//  arrParam: TArr;
begin
  inherited;
//  if cbbPilih.ItemIndex < 0 then Exit;
//
//  SeparatorDate:= DateSeparator;
//  try
//    DateSeparator:= '/';
//    formatTanggalPendek:= ShortDateFormat;
//    ShortDateFormat:= 'mm/dd/yyyy';
//
//
//
//    if not Assigned(MemberShip) then
//      MemberShip:= TMemberShip.Create;
//    SetLength(arrParam,2);
//    arrParam[0].tipe:= ptDateTime;
//    arrParam[0].data:= Trunc(dtpFrom.Date);
//    arrParam[1].tipe:= ptDateTime;
//    arrParam[1].data:= DateOf(IncDay(dtpTo.Date));
//
//    ParamList := TStringList.Create;
//    ParamList.Add(FormatDateTime('dd/mm/yyyy', dtpFrom.Date));  //0ab
//    ParamList.Add(FormatDateTime('dd/mm/yyyy', dtpTo.Date));    //1ab
//    ParamList.Add(FLoginFullname);                       //2ab
//
//    if cbbPilih.ItemIndex = 0 then // List Membership
//    begin
//      data := MemberShip.GetListReportMembership(arrParam);
//    end
//    else
//    begin
//      data := MemberShip.GetListMembershipBiayaKartu(arrParam, cbbPilih.ItemIndex);
//
//      if cbbPilih.ItemIndex = 1 then // Rekap Kartu Baru
//      begin
//        ParamList.Add(JENIS_BAYAR_KARTU_BARU);                                  //3b
//      end
//      else if cbbPilih.ItemIndex = 2 then // Rekap Perpanjangan Kartu
//      begin
//        ParamList.Add(JENIS_BAYAR_PERPANJANGAN_KARTU);                          //3b
//      end;
//    end;
//    ParamList.Add(MasterNewunit.Nama);                                          //3a ato 4b
//
//    if not assigned(frmDialogPrintPreview) then
//      frmDialogPrintPreview:= TfrmDialogPrintPreview.Create(Application);
//
//    frmDialogPrintPreview.ListParams:= ParamList;
//    frmDialogPrintPreview.RecordSet:= data;
//    if cbbPilih.ItemIndex = 0 then
//      frmDialogPrintPreview.FilePath:= FFilePathReport+'frListMembership.fr3'
//    else
//      frmDialogPrintPreview.FilePath:= FFilePathReport+'frListRekapKartuMembership.fr3';
//    SetFormPropertyAndShowDialog(frmDialogPrintPreview);
//  finally
//    FreeAndNil(ParamList);
//    frmDialogPrintPreview.Free;
//    DateSeparator:= SeparatorDate;
//    ShortDateFormat:= formatTanggalPendek;
//  end;

  if cbbPilih.ItemIndex = 0 then
  Begin
  sSQL := 'select '
       + ' m.* from member m'
       + ' inner join ref$tipe_member tp on tp.tpmember_id=m.member_tpmember_id '
       + ' where m.member_registered_date between '
       + TAppUtils.QuotD(dtpFrom.Date) + ' and ' + TAppUtils.QuotD(dtpTo.Date)
       + ' and m.MEMBER_UNT_ID = ' + IntToStr(MasterNewUnit)
       + ' order by m.member_registered_date' ;
//  dmReportNew.EksekusiReport('ListMembership', sSQL, '', True);
  End
  Else if cbbPilih.ItemIndex = 1 then             // -- Aktifasi
  Begin
  sSQL := 'select '
       + ' ma.memberact_id, ma.date_create, m.member_id, m.member_card_no,'
       + ' m.member_name,ma.memberact_valid_date_to, ma.memberact_fee_activasi '
       + ' as "Biaya Kartu", ma.memberact_is_reactivasi '
       + ' from member_activasi ma '
       + ' inner join member m '
       + ' on (m.member_id=ma.memberact_member_id '
       + ' and m.member_unt_id=ma.memberact_member_unt_id) '
       + ' where (cast(ma.date_create as Date) between ' + TAppUtils.QuotD(dtpFrom.Date)
       + ' and ' + TAppUtils.QuotD(dtpTo.Date) + ')'
       //+ ' and ma.memberact_fee_activasi <> 0 '
       + ' and ma.memberact_is_activasi = 1 '
       + ' and ma.MEMBERACT_UNT_ID = ' + IntToStr(MasterNewUnit)
       + ' order by ma.date_create' ;
//  dmReportNew.EksekusiReport('ListBiayaAktifasiMember', sSQL, '', True);
  End
  Else if cbbPilih.ItemIndex = 2 then        // -- Reaktifasi
  Begin
  sSQL := 'select '
       + ' ma.memberact_id, ma.date_create, m.member_id, m.member_card_no,'
       + ' m.member_name,ma.memberact_valid_date_to, ma.memberact_fee_reactivasi '
       + ' as "Biaya Kartu", ma.memberact_is_reactivasi '
       + ' from member_activasi ma '
       + ' inner join member m '
       + ' on (m.member_id=ma.memberact_member_id '
       + ' and m.member_unt_id=ma.memberact_member_unt_id) '
       + ' where (cast(ma.date_create as Date) between ' + TAppUtils.QuotD(dtpFrom.Date)
       + ' and ' + TAppUtils.QuotD(dtpTo.Date) + ')'
       //+ ' and ma.memberact_fee_reactivasi <> 0 '
       + ' and ma.memberact_is_reactivasi = 1 '
       + ' and ma.MEMBERACT_UNT_ID = ' + IntToStr(MasterNewUnit)
       + ' order by ma.date_create' ;
//  dmReportNew.EksekusiReport('ListBiayaReaktifasiMember', sSQL, '', True);
  End;

end;

procedure TfrmListMembership.FormDestroy(Sender: TObject);
begin
  inherited;
  frmListMembership := nil; 
end;

procedure TfrmListMembership.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  inherited;
  if (Key = Ord('P')) and (ssctrl in Shift) then
    actListPrintMembershipExecute(Self);
  if (Key = VK_Escape) and (ssctrl in Shift) then
    Close;
end;

end.


