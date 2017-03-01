unit ufrmDialogPajak;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls, StdCtrls, uModRefPajak,
  uDMClient, uDBUtils, uAppUtils, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalc, uClientClasses;

type
  TFormMode = (fmAdd, fmEdit);

  TfrmDialogPajak = class(TfrmMasterDialog)
    lbl1: TLabel;
    Lbl2: TLabel;
    lbl3: TLabel;
    Label1: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    edtNamaPajak: TEdit;
    edtCodePajak: TEdit;
    edtPPN: TcxCalcEdit;
    edtPPNBM: TcxCalcEdit;
    procedure FormDestroy(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure edtPPNKeyPress(Sender: TObject; var Key: Char);
    procedure edtPPNChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    FCrud: TCrudClient;
    FIsProcessSuccessfull: boolean;
    FPajakId: integer;
    FFormMode: TFormMode;
    FModRefPajak: TModRefPajak;
    function GetCrud: TCrudClient;
    function GetModRefPajak: TModRefPajak;
//    FPajak : TNewPajak;
    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: boolean);
    procedure SetPajakId(const Value: integer);
    procedure prepareAddData;
    procedure SimpanData;
    property Crud: TCrudClient read GetCrud write FCrud;
    property ModRefPajak: TModRefPajak read GetModRefPajak write FModRefPajak;
  public
    { Public declarations }
  published
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property PajakId: integer read FPajakId write SetPajakId;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDialogPajak: TfrmDialogPajak;
  IDLama : Integer;
implementation

uses uConn, uTSCommonDlg,  ufrmPajak;

{$R *.dfm}

procedure TfrmDialogPajak.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogPajak := nil;
end;

procedure TfrmDialogPajak.SetFormMode(const Value: TFormMode);
begin
  FFormMode := Value;
end;

procedure TfrmDialogPajak.SetIsProcessSuccessfull(const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogPajak.SetPajakId(const Value: integer);
begin
  FPajakId := Value;
end;

procedure TfrmDialogPajak.footerDialogMasterbtnSaveClick(Sender: TObject);
var
  IDLokal: Integer;
begin
{  if (FormMode = fmAdd) then
  begin
    FIsProcessSuccessfull := SavePajak;
    if FIsProcessSuccessfull then
      Close;
  end
  else
  begin
    FIsProcessSuccessfull := UpdatePajak;
    if FIsProcessSuccessfull then
      Close;
  end; // end if  }
  if (FormMode = fmAdd) then
  begin
    IDLokal := 0;
  end else
  begin
//    IDLokal := StrToInt(frmPajak.strgGrid.Cells[6,frmPajak.strgGrid.Row]);
  end;

  if edtCodePajak.Text = '' then
  begin
    CommonDlg.ShowError('Data Kode Kosong');
    edtCodePajak.SetFocus;
    Exit;
  end;

  if edtNamaPajak.Text = '' then
  begin
    CommonDlg.ShowError('Data Nama Kosong');
    edtNamaPajak.SetFocus;
    Exit;
  end;

  if edtPPN.Text = '' then
  begin
    CommonDlg.ShowError('PPN Masih Kosong');
    edtPPN.SetFocus;
    Exit;
  end;

  if edtPPNBM.Text = '' then
  begin
    CommonDlg.ShowError('PPNBM Masih Kosong');
    edtPPNBM.SetFocus;
    Exit;
  end;
  {aID : Integer; aIsDefault : Integer; aKode
        : string; aNama : string; aNewUnit_ID : Integer; aPPN : Double; aPPNBM
        : Double);}

{  FPajak.UpdateData(IDLokal,
                    1,
                    edtCodePajak.Text,
                    edtNamaPajak.Text,
                    StrToFloat(edtPPN.Text),
                    StrToFloat(edtPPNBM.Text));
}
  try
//      if FPajak.ExecuteGenerateSQL then
      begin
//        cCommitTrans;
        CommonDlg.ShowMessage('Data Berhasil DiSimpan');
        frmPajak.actRefreshPajakExecute(Self);
        Close;
      end
{      else begin
        cRollbackTrans;
        CommonDlg.ShowError('Gagal Menyimpan Data');
        Exit;
      end;
}  finally;
//    cRollbackTrans;
  end;
end;

procedure TfrmDialogPajak.edtPPNKeyPress(Sender: TObject; var Key: Char);
var i:integer;
begin
  inherited;
  if key=',' then
  begin
    for i:=1 to Length((Sender as TEdit).Text) do
      if (Sender as TEdit).Text[i]=',' then
        Key:=#0;
  end
  else if not(Key in ['0'..'9',Chr(vk_back)]) then
    Key:=#0;
end;

procedure TfrmDialogPajak.btnSaveClick(Sender: TObject);
begin
  inherited;
  SimpanData;
end;

procedure TfrmDialogPajak.edtPPNChange(Sender: TObject);
begin
  inherited;
  if(Sender as TEdit).Text='' then
    (Sender as TEdit).Text:='0';
end;

procedure TfrmDialogPajak.prepareAddData;
begin
  edtPPN.Text:='0';
  edtPPNBM.Text:='0';
end;

procedure TfrmDialogPajak.FormShow(Sender: TObject);
begin
  inherited;
  if (FFormMode = fmEdit) then
  begin
    //showDataEdit(PajakId)
//    IDLama := StrToInt(frmPajak.strgGrid.Cells[6,frmPajak.strgGrid.Row]);
//    if FPajak.LoadByID(IDLama) then
//    begin
//      edtCodePajak.Text := FPajak.Kode;
//      edtNamaPajak.Text := FPajak.Nama;
//      edtPPN.Text := FloatToStr(FPajak.PPN);
//      edtPPNBM.Text := FloatToStr(FPajak.PPNBM);
//    end;
  end
  else
    prepareAddData();
end;

procedure TfrmDialogPajak.FormCreate(Sender: TObject);
begin
  inherited;
//  FPajak := TNewPajak.Create(Self);
end;

function TfrmDialogPajak.GetCrud: TCrudClient;
begin
  if not Assigned(FCrud) then
    FCrud := TCrudClient.Create(DMClient.RestConn);
  Result := FCrud;
end;

function TfrmDialogPajak.GetModRefPajak: TModRefPajak;
begin
  if not Assigned(FModRefPajak) then
    FModRefPajak := TModRefPajak.Create;
  Result := FModRefPajak;
end;

procedure TfrmDialogPajak.SimpanData;
begin
  ModRefPajak.PJK_NAME := edtNamaPajak.Text;
  ModRefPajak.PJK_CODE := edtCodePajak.Text;
  ModRefPajak.PJK_PPN  := edtPPN.Value;
  ModRefPajak.PJK_PPNBM := edtPPNBM.Value;
  Crud.SaveToDB(ModRefPajak)
end;

end.
