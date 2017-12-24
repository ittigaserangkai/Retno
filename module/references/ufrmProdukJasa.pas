unit ufrmProdukJasa;

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
  cxGridDBTableView, cxGrid, cxPC, Vcl.ExtCtrls, uDXUtils, uDBUtils, uDMClient,
  ufrmDialogProdukJasa;

type
  TfrmProdukJasa = class(TfrmMasterBrowse)
    cxGridViewColumn1: TcxGridDBColumn;
    cxGridViewColumn2: TcxGridDBColumn;
    cxGridViewColumn3: TcxGridDBColumn;
    cxGridViewColumn4: TcxGridDBColumn;
    procedure actAddExecute(Sender: TObject);
  private
    { Private declarations }
  public
    procedure RefreshData; override;
    { Public declarations }
  end;

var
  frmProdukJasa: TfrmProdukJasa;

implementation

{$R *.dfm}

procedure TfrmProdukJasa.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogProdukJasa);
end;

procedure TfrmProdukJasa.RefreshData;
begin
  inherited;
  cxGridView.PrepareFromCDS(
    TDBUtils.DSToCDS(DMClient.DSProviderClient.ProdukJasa_GetDSOverview(),Self) );
end;

end.
