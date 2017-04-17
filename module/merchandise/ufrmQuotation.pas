unit ufrmQuotation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls,
  uRetnoUnit, ComCtrls, frxClass, jpeg, dxBarBuiltInMenu, cxStyles,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData,
  cxContainer, dxCore, cxDateUtils, Vcl.Menus, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, System.Actions, cxClasses,
  ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel, cxGridLevel, cxGridCustomView, cxGrid, cxPC, cxButtonEdit,
  Data.DB, Vcl.ActnList;

type
  TfrmQuotation = class(TfrmMasterBrowse)
    frxReport1: TfrxReport;
    cxTabSheet1: TcxTabSheet;
    pnlTop: TPanel;
    lbl1: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    lbl3: TLabel;
    Label5: TLabel;
    lbl7: TLabel;
    img1: TImage;
    dtEffectiveDate: TcxDateEdit;
    dtRefDate: TcxDateEdit;
    edtRemark: TEdit;
    edtSupplierName: TEdit;
    edtMGName: TEdit;
    edtSupplier: TcxButtonEdit;
    edtMGCode: TcxButtonEdit;
    edtQuotationref: TcxButtonEdit;
    btnSlip: TButton;
    pnlBottom: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    edtProdName: TEdit;
    edtCatalog: TEdit;
    edtKode: TEdit;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridDBColumn12: TcxGridDBColumn;
    cxGridDBColumn13: TcxGridDBColumn;
    cxGridDBColumn14: TcxGridDBColumn;
    cxGridDBColumn15: TcxGridDBColumn;
    cxGridDBColumn16: TcxGridDBColumn;
    cxGridDBColumn17: TcxGridDBColumn;
    cxGridDBColumn18: TcxGridDBColumn;
    cxGridDBColumn19: TcxGridDBColumn;
    cxGridDBColumn20: TcxGridDBColumn;
    cxGridDBColumn21: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
  private



  public
  end;

var
  frmQuotation: TfrmQuotation;

implementation

uses  ufrmDialogQuotation, uTSCommonDlg, uConstanta, uAppUtils;

//const
//  _KolIsParent      : Integer = 0;
//  _KolPLUPurchase   : Integer = 1;
//  _KolPLU           : Integer = 2;
//  _KolNamaBarang    : Integer = 3;
//  _KolTipeHArga     : Integer = 4;
//  _KolUOM           : Integer = 5;
//  _KolHargaBeli     : Integer = 6;
//  _KolUOMHargaBeli  : Integer = 7;
//  _KolPPNPersen     : Integer = 8;
//  _KolPrice         : Integer = 9;
//  _KolDisc          : Integer = 10;
//  _KolDiscPersen    : Integer = 11;
//  _KolSetelahDisc   : Integer = 12;
//  _KolHArgaAVGIncPPN: Integer = 13;
//  _KolHArgaAVGExcPPN: Integer = 14;
//  _MUPersen         : Integer = 15;
//  _MURupiah         : Integer = 16;
//  _KonvValue        : Integer = 17;
//  _KolItemID        : Integer = 18;
//  _isMailer         : Integer = 19;

{$R *.dfm}

end.

