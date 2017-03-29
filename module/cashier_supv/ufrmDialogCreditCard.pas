unit ufrmDialogCreditCard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ExtCtrls, StdCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxTextEdit, cxCurrencyEdit, System.Actions, Vcl.ActnList,
  ufraFooterDialog3Button;

type
  TfrmDialogCreditCard = class(TfrmMasterDialog)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl6: TLabel;
    edtCardCode: TEdit;
    edtCardName: TEdit;
    cboisCredit: TComboBox;
    chkIsActive: TCheckBox;
    edtLimit: TcxCurrencyEdit;
    fedtDisc: TcxCurrencyEdit;
    lbl7: TLabel;
    chkIsCachBack: TCheckBox;
    fedtCharge: TcxCurrencyEdit;
    Label1: TLabel;
    Label2: TLabel;
    chkIsKring: TCheckBox;
    procedure actDeleteExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure edtLimitEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure footerDialogMasterbtnCloseClick(Sender: TObject);
    procedure fedtChargeExit(Sender: TObject);
    procedure fedtDiscExit(Sender: TObject);
  private
  { Private declarations }
//    FCC     : TCreditCard;
    FCc_id  : Integer;
    procedure ClearAtributFrmCc;
    procedure GetAtributFrmCc;
  public
    { Public declarations }
    CARD_ID: Integer;
    constructor a(a : TComponent);
    procedure  ShowWithCCId(aCc_id: integer);


  published

  end;

var
  frmDialogCreditCard: TfrmDialogCreditCard;

implementation

uses uTSCommonDlg,  uRetnoUnit, ufrmCreditCard;

{$R *.dfm}

procedure TfrmDialogCreditCard.FormCreate(Sender: TObject);
begin
  inherited;

  FCc_id := 0;
//  FCC := TCreditCard.CreateWithUser(nil, FLoginId);

end;

constructor TfrmDialogCreditCard.a(a : TComponent);
begin


end;

procedure TfrmDialogCreditCard.actDeleteExecute(Sender: TObject);
begin
  inherited;
  /// tanya ke user dl mas, apakah yakin akan hapus DB
  {if MessageDlg('Apakah yakin akan menghapus Credit Carde ' +
          AdvStrGrid.Cells[_kolCardNm , iy] + ' ?',
          mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
    if FCC.LoadByID(AdvStrGrid.Ints[_kolCardID, iy], masternewunit.id) then
    begin
      try
        if FCC.RemoveFromDB then
        begin
          cCommitTrans;
          CommonDlg.ShowMessage('Sukses Hapus Credit Card');
          ParseDataGrid();
        end
        else
        begin
          cRollbackTrans;
          CommonDlg.ShowError('Gagal Hapus Credit Card');
        end;
      finally
        cRollbackTrans;
      end;
    end
    else
    begin
       CommonDlg.ShowConfirmGlobal ('Data yang dihapus tidak ada!');
    end;
  end;
   }
end;

procedure TfrmDialogCreditCard.ShowWithCCId( aCc_id : Integer);
begin
  FCc_id := aCc_id ;

end;

procedure TfrmDialogCreditCard.GetAtributFrmCc;
begin
  {
  if FCC.LoadByID(FCc_id, dialogunit) then
  begin
    edtCardCode.Text := FCC.CARD_CODE;
    edtCardName.Text := FCC.CARD_Name;

    if FCC.CARD_Is_Credit = 1 then
      cboisCredit.ItemIndex := 0
    else
      cboisCredit.ItemIndex := 1;

    edtLimit.Value := FCC.CARD_Limit;
    fedtCharge.Value := FCC.CARD_Charge;
    fedtDisc.Value := FCC.CARD_Discount;

    if FCC.CARD_Is_Active = 1 then
      chkIsActive.Checked := True
    else
      chkIsActive.Checked:= False;

    if FCC.CARD_Is_CashBack = 1 then
      chkIsCachBack.Checked := True
    else
      chkIsCachBack.Checked := False;

    chkIsKring.Checked := FCC.CARD_IS_KRING = 1;  

  end;
   }
end;

procedure TfrmDialogCreditCard.ClearAtributFrmCc;
begin
  edtCardCode.Clear;                /// luruskan := mas
  edtCardName.Clear;

  cboisCredit.ItemIndex := 0;      /// kasih default 0 aj mas
  edtLimit.Value        := 0;
  fedtCharge.Value      := 0;
  fedtDisc.Value        := 0;
  chkIsActive.Checked   := False;
  chkIsCachBack.Checked := False;

end;

procedure TfrmDialogCreditCard.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
//  FCC.Free;

end;

procedure TfrmDialogCreditCard.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogCreditCard := nil;
end;


procedure TfrmDialogCreditCard.footerDialogMasterbtnSaveClick( Sender: TObject);
var
  iISKring: Integer;
  sFcc_code,
  sFcc_Nm         : string;
  iFcc_isCredit,
  iFcc_isCashBack,
  iFcc_isActive   : Integer;
  dFcc_Limit,
  dFcc_Charge,
  dFcc_Discount   : Double;


begin
  inherited;
  /// cek nama double walopun Nama di table tidak diset unique
  {
  try
    with FCC do
    begin

      sFcc_code := edtCardCode.Text;  /// nama variablenya ga standar mas
      sFcc_Nm   := edtCardName.Text;  /// nama variablenya ga standar mas

      if cboisCredit.ItemIndex = 0 then
        iFcc_isCredit := 1
      else
        iFcc_isCredit := 0;


      dFcc_Limit    := edtLimit.Value; /// nama variablenya ga standar mas
      dFcc_Charge   := fedtCharge.Value; /// nama variablenya ga standar mas
      dFcc_Discount := fedtDisc.Value; /// nama variablenya ga standar mas

      if chkIsActive.Checked then
        iFcc_isActive := 1    /// nama variablenya ga standar mas
      else
        iFcc_isActive := 0;   /// nama variablenya ga standar mas

      if chkIsCachBack.Checked then
        iFcc_isCashBack := 1   /// nama variablenya ga standar mas
      else
        iFcc_isCashBack := 0;  /// nama variablenya ga standar mas

      iISKring := 0;
      if chkIsKring.Checked then
        iISKring := 1;  

      UpdateData(sFcc_code, sFcc_Nm, dFcc_Charge, dFcc_Discount, FCc_id, iFcc_isActive,
                  iFcc_isCashBack, iFcc_isCredit, dFcc_Limit, dialogunit, iISKring);
                  
      if not SaveToDB then
      begin
        cRollbackTrans;
        CommonDlg.ShowError('Gagal Simpan Data Credit Card.'); 
      end
      else
      begin
        cCommitTrans;
        CommonDlg.ShowMessage('Data credit card telah disimpan.');
        frmCreditCard.fraFooter5Button1btnRefreshClick(self);
        Close;
      end;

    end;

  finally
    cRollbackTrans;
  end;
  }

end;

procedure TfrmDialogCreditCard.edtLimitEnter(Sender: TObject);
begin
  inherited;
  edtLimit.SelectAll;

end;



procedure TfrmDialogCreditCard.FormShow(Sender: TObject);
begin
  inherited;

  ClearAtributFrmCc; /// ini diperjelas nama metodnya ya
  GetAtributFrmCc;   /// ini diperjelas nama metodnya ya
  edtCardName.SetFocus;

end;

procedure TfrmDialogCreditCard.footerDialogMasterbtnCloseClick(
  Sender: TObject);
begin
  inherited;
  Close;

end;

procedure TfrmDialogCreditCard.fedtChargeExit(Sender: TObject);
begin
  inherited;
  if fedtCharge.Value > 100 then
  fedtCharge.Value := 100;
end;

procedure TfrmDialogCreditCard.fedtDiscExit(Sender: TObject);
begin
  inherited;
  if fedtDisc.Value > 100 then
  fedtDisc.Value := 100;
end;

end.




