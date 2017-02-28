unit ufrmDialogHariLibur;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls,
  StdCtrls, Mask, uRetnoUnit, ufrmHariLibur, Vcl.ComCtrls;

type
  TFormMode = (fmAdd, fmEdit);
  TfrmDialogHariLibur = class(TfrmMasterDialog)
    edtNamaHariLibur: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    dtTglHariLibur: TDateTimePicker;
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FIsProcessSuccessfull: Boolean;
    FHariLiburId: Integer;
    FFormMode: TFormMode;
//    FNewDayOff : TNewDayOff;
    IDLokal : integer;
    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: Boolean);
    procedure SetHariLiburId(const Value: Integer);
    procedure prepareAddData;
  public
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property HariLiburId: Integer read FHariLiburId write SetHariLiburId;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDialogHariLibur: TfrmDialogHariLibur;

implementation

uses uConn,  uTSCommonDlg;//, uHariLibur;

{$R *.dfm}

{ TfrmDialogHariLibur }

procedure TfrmDialogHariLibur.prepareAddData;
begin
  dtTglHariLibur.Date := Date();
  edtNamaHariLibur.Clear;
end;

procedure TfrmDialogHariLibur.SetFormMode(const Value: TFormMode);
begin
  FFormMode := Value;
end;

procedure TfrmDialogHariLibur.SetHariLiburId(const Value: Integer);
begin
  FHariLiburId := Value;
end;

procedure TfrmDialogHariLibur.SetIsProcessSuccessfull(
  const Value: Boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogHariLibur.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin
  inherited;
  if dtTglHariLibur.Date = 0 then
  begin
    CommonDlg.ShowMessage('Tanggal Belum Diisi');
  end
  else if edtNamaHariLibur.Text = '' then
  begin
    CommonDlg.ShowMessage('Hari Belum Diisi');
  end
  else begin
    {FNewDayOff.UpdateData(IDLokal,
                        edtNamaHariLibur.Text,
                        DialogUnit,
                        dtTglHariLibur.Date);

    try
      if FNewDayOff.ExecuteGenerateSQL then
      begin
        cCommitTrans;
        CommonDlg.ShowMessage('Data Berhasil Disimpan');
        frmHariLibur.actRefreshHariLiburExecute(self);
        close;
      end
      else begin
        cRollbackTrans;
        CommonDlg.ShowError('Data gagal Disimpan');
      end;
    finally;
      cRollbackTrans;
    end;}
  end;
end;

procedure TfrmDialogHariLibur.FormShow(Sender: TObject);
begin
  inherited;
  if (FFormMode = fmEdit) then
  begin
    IDLokal := HariLiburId;
{    if FNewDayOff.LoadByID(IDLokal, DialogUnit) then
    begin
      dtTglHariLibur.Date := FNewDayOff.Tanggal;
      edtNamaHariLibur.Text := FNewDayOff.Nama;
    end
    else begin
      IDLokal := 0;
      prepareAddData();
    end;
}  end;
end;


procedure TfrmDialogHariLibur.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogHariLibur := nil;
end;

procedure TfrmDialogHariLibur.FormCreate(Sender: TObject);
begin
  inherited;
//  FNewDayOff := TNewDayOff.create(self);
end;

end.
