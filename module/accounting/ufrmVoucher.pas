unit ufrmVoucher;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBExtLookupComboBox, System.Actions, Vcl.ActnList,
  ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit, cxCalendar, cxLabel,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, cxPC, Vcl.ExtCtrls;

type
  TfrmVoucher = class(TfrmMasterBrowse)
    Panel1: TPanel;
    lblComboGrid: TLabel;
    cbpDataCombo: TcxExtLookupComboBox;
    Label1: TLabel;
    dtTgl: TcxDateEdit;
    Label2: TLabel;
    JvDateEdit1: TcxDateEdit;
    edtInput: TEdit;
    cxcolGridViewColumn1: TcxGridDBColumn;
    cxcolGridViewColumn2: TcxGridDBColumn;
    cxcolGridViewColumn3: TcxGridDBColumn;
    cxcolGridViewColumn4: TcxGridDBColumn;
    cxcolGridViewColumn5: TcxGridDBColumn;
    procedure actAddExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVoucher: TfrmVoucher;

implementation

uses ufrmDialogVoucher;

{$R *.dfm}

procedure TfrmVoucher.actAddExecute(Sender: TObject);
begin
  inherited;
  if not Assigned(frmDialogVoucher) then
    frmDialogVoucher := TfrmDialogVoucher.Create(Application);

  SetFormPropertyAndShowDialog(frmDialogVoucher);
end;

end.
