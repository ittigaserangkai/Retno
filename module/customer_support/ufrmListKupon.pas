unit ufrmListKupon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, ufraFooter5Button, ComCtrls,
  SUIButton;

type
  TfrmListKupon = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    btnPrint: TsuiButton;
    Label2: TLabel;
    edtMember: TEdit;
    Label1: TLabel;
    dtpFrom: TDateTimePicker;
    dtpTo: TDateTimePicker;
    Label3: TLabel;
    edtMemberID: TEdit;
    procedure btnPrintClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure edtMemberIDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListKupon: TfrmListKupon;

implementation

uses uRMSUnit,  udmReportNew;

{$R *.dfm}

procedure TfrmListKupon.btnPrintClick(Sender: TObject);
begin
  inherited;
  DoSlipListingKupon(dtpFrom.Date,dtpTo.Date,StrToInt(edtMemberID.Text),masternewunit.id,FLoginFullname,MasterNewUnit.Nama);
end;

procedure TfrmListKupon.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  inherited;
  if (Key = Ord('P')) and (ssCtrl in Shift) then
  btnPrintClick(Self)
  else if (Key = VK_Escape) then
  Close;
end;

procedure TfrmListKupon.FormShow(Sender: TObject);
begin
  inherited;
  dtpFrom.Date := Now;
  dtpTo.Date   := Now;
end;

procedure TfrmListKupon.edtMemberIDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sSQL: String;
begin
  inherited;
  if (key = VK_F5) then
  begin
    sSQL := 'Select MEMBER_ID as "ID",MEMBER_NAME as "Nama" from MEMBER '
          + ' Where MEMBER_UNT_ID='+IntToStr(masternewunit.id);
    with cLookUp('MEMBER',sSQL) do
    begin
      try
        edtMemberID.Text  := Strings[0];
        edtMember.Text    := Strings[1];
      finally
        Free;
      end;
    end;
  end;
end;

procedure TfrmListKupon.FormDestroy(Sender: TObject);
begin
  inherited;
  frmListKupon := nil;
end;

procedure TfrmListKupon.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.


