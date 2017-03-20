unit ufrmPopupPersonalMember;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels, DB,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel;

type
  TfrmPopupPersonalMember = class(TForm)
    pnl1: TPanel;
    pnl3: TPanel;
    lbl4: TLabel;
    edtMemberName: TEdit;
    edtCardNo: TEdit;
    pnl2: TPanel;
    lblClose: TcxLabel;
    dtLahir: TcxDateEdit;
    lbl1: TLabel;
    edtKewarganegaraan: TEdit;
    lbl2: TLabel;
    edtTempatLhr: TEdit;
    lbl5: TLabel;
    lbl3: TLabel;
    lbl6: TLabel;
    edtNoIdentts: TEdit;
    edtGender: TEdit;
    lbl7: TLabel;
    lbl8: TLabel;
    edtAgama: TEdit;
    edtAlamat: TEdit;
    lbl9: TLabel;
    edtRt: TEdit;
    lbl10: TLabel;
    edtKecamatan: TEdit;
    edtKelurahan: TEdit;
    lbl11: TLabel;
    edtRw: TEdit;
    lbl12: TLabel;
    edtKota: TEdit;
    lbl13: TLabel;
    edtPostCode: TEdit;
    lbl14: TLabel;
    edtTelp: TEdit;
    edtStatus: TEdit;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    edtJmlTanggungan: TEdit;
    edtPendptn: TEdit;
    lblEditPersonal: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lblCloseClick(Sender: TObject);
    procedure lblEditPersonalClick(Sender: TObject);
  private
    dataMember: TDataSet;

    procedure ParseDataGrid();
  public
    FSelfUnitID: Integer;
    { Public declarations }
    MemberID: Integer;
  end;

var
  frmPopupPersonalMember: TfrmPopupPersonalMember;

implementation

uses ufrmDialogPersonalMember, ufrmMemberShip;

{$R *.dfm}

procedure TfrmPopupPersonalMember.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmPopupPersonalMember.FormDestroy(Sender: TObject);
begin
  frmPopupPersonalMember := nil;
end;

procedure TfrmPopupPersonalMember.ParseDataGrid;
//var arrParam: TArr;
begin
  {if not Assigned(MemberShip) then MemberShip := TMemberShip.Create;

  SetLength(arrParam,1);
  arrParam[0].tipe := ptInteger;
  arrParam[0].data := MemberID;
  dataMember := MemberShip.GetListDetilPersonal(arrParam);
  }
  if dataMember.RecordCount > 0 then
  begin
    edtMemberName.Text := dataMember.FieldByName('MEMBER_NAME').AsString;
    edtCardNo.Text := dataMember.FieldByName('MEMBER_CARD_NO').AsString;

    if dataMember.FieldByName('MEMBER_IS_WNI').AsInteger = 1 then
      edtKewarganegaraan.Text := 'WNI'
    else edtKewarganegaraan.Text := 'WNA';

    edtTempatLhr.Text := dataMember.FieldByName('MEMBER_PLACE_OF_BIRTH').AsString;
    dtLahir.Date := dataMember.FieldByName('MEMBER_DATE_OF_BIRTH').AsDateTime;
    edtNoIdentts.Text := dataMember.FieldByName('MEMBER_KTP_NO').AsString;

    if dataMember.FieldByName('MEMBER_SEX').AsInteger = 1 then
      edtGender.Text := 'MEN'
    else edtGender.Text := 'WOMEN';
    
    edtAgama.Text := dataMember.FieldByName('AGAMA_NAME').AsString;
    edtAlamat.Text := dataMember.FieldByName('MEMBER_ADDRESS').AsString;
    edtRt.Text := dataMember.FieldByName('MEMBER_RT').AsString;
    edtRw.Text := dataMember.FieldByName('MEMBER_RW').AsString;
    edtKelurahan.Text := dataMember.FieldByName('MEMBER_KELURAHAN').AsString;
    edtKecamatan.Text := dataMember.FieldByName('MEMBER_KECAMATAN').AsString;
    edtKota.Text := dataMember.FieldByName('MEMBER_KOTA').AsString;
    edtPostCode.Text := dataMember.FieldByName('MEMBER_POST_CODE').AsString;
    edtTelp.Text := dataMember.FieldByName('MEMBER_TELP').AsString;

    if dataMember.FieldByName('MEMBER_IS_MARRIED').AsInteger = 1 then
      edtStatus.Text := 'MARRIED'
    else edtStatus.Text := 'SINGLE';

    edtJmlTanggungan.Text := dataMember.FieldByName('MEMBER_JML_TANGGUNGAN').AsString;
    edtPendptn.Text := dataMember.FieldByName('MEMBER_PENDAPATAN').AsString;
  end;// end if recordcount

end;


procedure TfrmPopupPersonalMember.FormShow(Sender: TObject);
begin
  ParseDataGrid;
end;

procedure TfrmPopupPersonalMember.lblCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPopupPersonalMember.lblEditPersonalClick(Sender: TObject);
begin
  if not Assigned(frmDialogPersonalMember) then
      frmDialogPersonalMember := TfrmDialogPersonalMember.Create(Self);

  frmDialogPersonalMember.MemberID := MemberID;
  frmDialogPersonalMember.DialogUnit := FSelfUnitID;

  frmDialogPersonalMember.edtMemberName.Text := edtMemberName.Text;
  frmDialogPersonalMember.edtCardNo.Text     := edtCardNo.Text;
  frmDialogPersonalMember.Modul              := mPopUpPersonalMember;


  frmDialogPersonalMember.DialogUnit := FSelfUnitID;
  frmDialogPersonalMember.ShowModal;
  if frmDialogPersonalMember.IsProcessSuccessfull then
  begin
    ParseDataGrid();
//    frmMemberShip.actRefreshMemberShipExecute(Self);
  end;
end;

end.
