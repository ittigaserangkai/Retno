unit ufrmAdjustmentFaktur;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterBrowse, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  System.Actions, Vcl.ActnList, ufraFooter4Button, Vcl.StdCtrls, cxButtons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC, Vcl.ExtCtrls, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, ufrmDialogAdjustmentFaktur, uDXUtils, uAppUtils;

type
  TfrmAdjustmentFaktur = class(TfrmMasterBrowse)
    cxgridColOVPO: TcxGridDBColumn;
    cxgridColOVNP: TcxGridDBColumn;
    cxgridColOVTanggalAdj: TcxGridDBColumn;
    cxgridColOVJenis: TcxGridDBColumn;
    cxgridColAdjustmen: TcxGridDBColumn;
    cxgridColKeterangan: TcxGridDBColumn;
    cxgridColSupplierMG: TcxGridDBColumn;
    lblSupMG: TcxLabel;
    cbbSupMGAwal: TcxExtLookupComboBox;
    lblTo: TcxLabel;
    cbbSupMGAkhir: TcxExtLookupComboBox;
    procedure actAddExecute(Sender: TObject);
  private
    { Private declarations }
  public
    procedure RefreshData; override;
    { Public declarations }
  end;

var
  frmAdjustmentFaktur: TfrmAdjustmentFaktur;

implementation

{$R *.dfm}

procedure TfrmAdjustmentFaktur.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogAdjustmentFaktur);
end;

procedure TfrmAdjustmentFaktur.RefreshData;
begin
  inherited;
  // TODO -cMM: TfrmAdjustmentFaktur.RefreshData default body inserted
end;

end.
