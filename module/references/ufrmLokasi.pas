unit ufrmLokasi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, ufraFooter5Button, StdCtrls, ExtCtrls, Grids, DB,
  ActnList, uConn, uRetnoUnit, System.Actions, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, ufrmMasterBrowse, dxBarBuiltInMenu, cxContainer, Vcl.ComCtrls, dxCore,
  cxDateUtils, Vcl.Menus, ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxLabel, cxPC;

type
  TfrmLokasi = class(TfrmMasterBrowse)
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
  private
  protected
  public
    procedure RefreshData; override;
    { Public declarations }
  end;

var
  frmLokasi: TfrmLokasi;

implementation

uses uTSCommonDlg, ufrmDialogLokasi, uConstanta, uDMClient, uDXUtils;

{$R *.dfm}

procedure TfrmLokasi.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogLokasi)
end;

procedure TfrmLokasi.actEditExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogLokasi,
    cxGridView.DS.FieldByName('Ref$Lokasi_ID').AsString
  )
end;

procedure TfrmLokasi.RefreshData;
begin
  inherited;
  cxGridView.LoadFromDS(DMClient.DSProviderClient.Lokasi_GetDSLookup(), Self);
  cxGridView.SetVisibleColumns(['Ref$Lokasi_ID'], False);
end;

end.
