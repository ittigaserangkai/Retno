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
  cxDBExtLookupComboBox, ufrmDialogAdjustmentFaktur, uDXUtils, uAppUtils,
  Datasnap.DBClient;

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
    cxgridColOVAdjNo: TcxGridDBColumn;
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
  private
    FCDS: TClientDataSet;
    property CDS: TClientDataSet read FCDS write FCDS;
    { Private declarations }
  public
    procedure RefreshData; override;
    { Public declarations }
  end;

var
  frmAdjustmentFaktur: TfrmAdjustmentFaktur;

implementation

{$R *.dfm}

uses uDMClient, uDBUtils;

procedure TfrmAdjustmentFaktur.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogAdjustmentFaktur);
end;

procedure TfrmAdjustmentFaktur.actEditExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogAdjustmentFaktur, cxGridView.DS.FieldByName('adjustment_faktur_id').AsString);
end;

procedure TfrmAdjustmentFaktur.RefreshData;
begin
  inherited;
  try
    TAppUtils.cShowWaitWindow('Mohon Ditunggu');
    if Assigned(FCDS) then FreeAndNil(FCDS);

    CDS := TDBUtils.DSToCDS(
      DMClient.DSProviderClient.AdjFaktur_GetDSOverview(dtAwalFilter.Date,dtAkhirFilter.Date),
      Self
    );
    cxGridView.LoadFromCDS(FCDS, False, False);
    cxGridView.SetVisibleColumns(['adjustment_faktur_id'],False);
  finally
    TAppUtils.cCloseWaitWindow;
  end;
end;

end.
