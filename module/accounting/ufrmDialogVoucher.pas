
unit ufrmDialogVoucher;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialogBrowse, ExtCtrls, Vcl.StdCtrls,
  System.Actions, Vcl.ActnList, ufraFooterDialog3Button, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, cxButtons,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxDropDownEdit,
  cxCalendar, cxTextEdit, cxMaskEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, cxGridLevel, cxClasses, cxGridCustomView, cxGrid;

type
  TfrmDialogVoucher = class(TfrmMasterDialogBrowse)
    Panel1: TPanel;
    lblComboGrid: TLabel;
    cbpDataCombo: TcxExtLookupComboBox;
    Label1: TLabel;
    dtTgl: TcxDateEdit;
    edtInput: TEdit;
    lblInput: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    JvDateEdit1: TcxDateEdit;
    Label3: TLabel;
    JvDateEdit2: TcxDateEdit;
    cxcolGridViewColumn1: TcxGridDBColumn;
    cxcolGridViewColumn2: TcxGridDBColumn;
    cxcolGridViewColumn3: TcxGridDBColumn;
    cxcolGridViewColumn4: TcxGridDBColumn;
    cxcolGridViewColumn5: TcxGridDBColumn;
    btnGenerate: TcxButton;
    actGenerateVouchers: TAction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDialogVoucher: TfrmDialogVoucher;

implementation

{$R *.dfm}

end.
