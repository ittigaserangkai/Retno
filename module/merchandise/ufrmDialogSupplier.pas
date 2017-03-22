unit ufrmDialogSupplier;

interface

uses
  uConn, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ExtCtrls, ActnList,
  uRetnoUnit, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit, cxCurrencyEdit,
  System.Actions, ufraFooterDialog3Button, Vcl.Mask, Vcl.StdCtrls, cxButtonEdit,
  dxBarBuiltInMenu, cxPC;

type
  TFormMode = (fmAddSup, fmAddMer, fmEdit);

  TfrmDialogSupplier = class(TfrmMasterDialog)
    pc1: TcxPageControl;
    tsSupplier: TcxTabSheet;
    tsMerchandiseGroup: TcxTabSheet;
    edtSupCode: TEdit;
    edtSupName: TEdit;
    lbl3: TLabel;
    edtAddress: TEdit;
    edtCity: TEdit;
    lbl4: TLabel;
    lbl18: TLabel;
    edtPostCode: TEdit;
    edtFax: TEdit;
    lbl19: TLabel;
    edtPhone: TEdit;
    lbl5: TLabel;
    lbl6: TLabel;
    edtContactP: TEdit;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl10: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    bvl2: TBevel;
    edtAccountName: TEdit;
    edtAccountNo: TEdit;
    edtBankName: TEdit;
    cbbPKP: TComboBox;
    lbl36: TLabel;
    edtTaxNo: TEdit;
    lbl21: TLabel;
    edtTitle: TEdit;
    lbl37: TLabel;
    edtMerGrup: TEdit;
    lbl23: TLabel;
    lbl24: TLabel;
    edtTermOP: TEdit;
    lbl27: TLabel;
    lbl28: TLabel;
    lbl25: TLabel;
    edtLeadTime: TEdit;
    lbl26: TLabel;
    lbl22: TLabel;
    curedtCreditLmt: TcxCurrencyEdit;
    lbl15: TLabel;
    curedtAPEndB: TcxCurrencyEdit;
    curedtCNBln: TcxCurrencyEdit;
    lbl16: TLabel;
    lbl34: TLabel;
    dtLastPurchs: TcxDateEdit;
    lbl35: TLabel;
    curedtPaymnt: TcxCurrencyEdit;
    curedtOutsdPaymnt: TcxCurrencyEdit;
    lbl9: TLabel;
    lbl33: TLabel;
    edtNoOfPO: TEdit;
    lbl29: TLabel;
    edtExtdDesc: TEdit;
    chkEnableCN: TCheckBox;
    pnl1: TPanel;
    lbl30: TLabel;
    lbl31: TLabel;
    lbl32: TLabel;
    lbl38: TLabel;
    lbl39: TLabel;
    lbl40: TLabel;
    lbl41: TLabel;
    lbl42: TLabel;
    lbl43: TLabel;
    lbl44: TLabel;
    edtAddrMer: TEdit;
    edtCityMer: TEdit;
    edtPostCodeMer: TEdit;
    edtFaxMer: TEdit;
    edtPhoneMer: TEdit;
    edtContactMer: TEdit;
    edtTitleMer: TEdit;
    edtBankCodeMer: TEdit;
    edtBankAccNameMer: TEdit;
    edtBankAccNoMer: TEdit;
    grp: TGroupBox;
    lbl45: TLabel;
    chkMon: TCheckBox;
    chkTue: TCheckBox;
    chkWed: TCheckBox;
    chkThu: TCheckBox;
    chkFri: TCheckBox;
    chkSat: TCheckBox;
    chkSun: TCheckBox;
    chkIsDif: TCheckBox;
    cbbBKP: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    edtFee: TEdit;
    Label3: TLabel;
    chkFee: TCheckBox;
    actSupplier: TActionList;
    actUpdateBank: TAction;
    Label5: TLabel;
    Label4: TLabel;
    medtNPWP: TMaskEdit;
    cbTipePerusahaan: TComboBox;
    cbTipeSupplier: TComboBox;
    edKodeBank: TcxButtonEdit;
    cbpBankCodeMer: TcxButtonEdit;
    cbpDeliverPO: TComboBox;
    cbpPayment: TComboBox;
    cbpMerchGroup: TComboBox;
    Label6: TLabel;
    edtSuppGrpNo: TEdit;
    edtSuppGrpNm: TEdit;
    edtCabangBank: TEdit;
    Label7: TLabel;
    edtBankBranch: TEdit;
    Label8: TLabel;
    edtBankAddrss: TEdit;
    edtAlamatBank: TEdit;
    Lbl2: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    cbbPpn: TComboBox;
    chkSupActive: TCheckBox;
    Label11: TLabel;
    edtDisc: TcxCurrencyEdit;
    Label12: TLabel;
    chkAllMer: TCheckBox;
    edtNPWPAlamat: TEdit;
    Label13: TLabel;


  private


  public
  published
  end;

var
  frmDialogSupplier: TfrmDialogSupplier;

implementation


{$R *.dfm}

end.
