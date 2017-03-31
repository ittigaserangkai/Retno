unit ufrmMemberShip;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, ufraFooter5Button, StdCtrls, ExtCtrls, Mask,
  ActnList, uConn, uConstanta, ufrmMasterBrowse,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, System.Actions,
  cxCurrencyEdit, cxClasses, ufraFooter4Button, cxButtons, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel,
  cxGridCustomView, cxGrid, dxBarBuiltInMenu, cxPC, uDMClient, uClientClasses,
  uDBUtils, uDXUtils, uDSUtils;

type
  TfrmMemberShip = class(TfrmMasterBrowse)
    pnl1: TPanel;
    lblInput: TLabel;
    edtCompTypeName: TEdit;
    actlst1: TActionList;
    actAddMemberShip: TAction;
    actEditMemberShip: TAction;
    actDeleteMemberShip: TAction;
    actRefreshMemberShip: TAction;
    pnl2: TPanel;
    lbl5: TLabel;
    edtCardStatus: TEdit;
    edtTotalMain: TEdit;
    lbl2: TLabel;
    lblComboGrid: TLabel;
    edtCompName: TEdit;
    lbl9: TLabel;
    lbl8: TLabel;
    edtAddress: TEdit;
    lbl1: TLabel;
    edtNPWP: TEdit;
    edtCompType: TEdit;
    edtRefNoType: TEdit;
    edtRefNo: TEdit;
    dtValidFrom: TcxDateEdit;
    lbl4: TLabel;
    dtValidTo: TcxDateEdit;
    lbl3: TLabel;
    dtRegister: TcxDateEdit;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl10: TLabel;
    edtKelurahan: TEdit;
    edtCity: TEdit;
    edtPostCode: TEdit;
    edtTelephone: TEdit;
    lbl11: TLabel;
    lbl12: TLabel;
    edtFaxNo: TEdit;
    lbl13: TLabel;
    edtDocStatus: TEdit;
    edtPrintedStatus: TEdit;
    lbl14: TLabel;
    lbl15: TLabel;
    edtTotalSuppl: TEdit;
    lbl16: TLabel;
    lblDispPersonal: TcxLabel;
    lblDispFamily: TcxLabel;
    edtMemberStatus: TEdit;
    lbl17: TLabel;
    edtTotalTransaction: TcxCurrencyEdit;
    lbl18: TLabel;
    btnShow: TcxButton;
    cxTabSheet1: TcxTabSheet;
    procedure actAddMemberShipExecute(Sender: TObject);
    procedure actEditMemberShipExecute(Sender: TObject);
  private
  protected
    procedure RefreshData; override;
  public
    { Public declarations }
  published
  end;

var
  frmMemberShip: TfrmMemberShip;

implementation

uses uTSCommonDlg, uRetnoUnit, ufrmDialogPersonalMember;

{$R *.dfm}

procedure TfrmMemberShip.actAddMemberShipExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogPersonalMember);
end;

procedure TfrmMemberShip.actEditMemberShipExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogPersonalMember, cxGridView.DS.FieldByName('MEMBER_ID').AsString)
end;

procedure TfrmMemberShip.RefreshData;
begin
  inherited;
  cxGridView.LoadFromDS(DMClient.DSProviderClient.Member_GetDSOverview(), SELF);
  cxGridView.SetVisibleColumns(['MEMBER_ID','REF$GRUP_MEMBER_ID','REF$DISC_MEMBER_ID','REF$POIN_MEMBER_ID','MEMBER_ACTIVASI_ID','MEMBER_KELUARGA_ID'], False);
end;

end.


