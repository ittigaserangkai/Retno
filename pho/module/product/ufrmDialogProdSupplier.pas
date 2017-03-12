unit ufrmDialogProdSupplier;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls,
  StdCtrls, Mask, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, System.Actions, Vcl.ActnList, ufraFooterDialog3Button;

type
  TfrmDialogProdSupplier = class(TfrmMasterDialog)
    lbl1: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    edt3: TEdit;
    edt4: TEdit;
    edTimeCreate: TEdit;
    edUserCreate: TEdit;
    lbl8: TLabel;
    lbl9: TLabel;
    edtTimeUpdate: TEdit;
    edUserUpdate: TEdit;
    lbl10: TLabel;
    dtTglCreate: TcxDateEdit;
    dtTglUpdate: TcxDateEdit;
    cxGridViewSupplier: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGrid: TcxGrid;
    cxGridViewSupplierColumn1: TcxGridDBColumn;
    cxGridViewSupplierColumn2: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDialogProdSupplier: TfrmDialogProdSupplier;

implementation

{$R *.dfm}

procedure TfrmDialogProdSupplier.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogProdSupplier.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogProdSupplier := nil;
end;

procedure TfrmDialogProdSupplier.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin
  inherited;
  Close;
end;

end.
