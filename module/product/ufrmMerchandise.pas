unit ufrmMerchandise;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterBrowse, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  System.Actions, Vcl.ActnList, cxClasses, ufraFooter4Button, Vcl.StdCtrls,
  cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC, Vcl.ExtCtrls;

type
  TfrmMerchandise = class(TfrmMasterBrowse)
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
  private
    { Private declarations }
  public
    procedure RefreshData; override;
    { Public declarations }
  end;

var
  frmMerchandise: TfrmMerchandise;

implementation

uses
  uDMClient, uDBUtils, uDXUtils, uModBarang, ufrmDialogMerchandise, uModSuplier;

{$R *.dfm}

procedure TfrmMerchandise.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogMerchandise)
end;

procedure TfrmMerchandise.actEditExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogMerchandise,
    cxGridView.DS.FieldByName(TModMerchandise.GetPrimaryField).AsString)
end;

procedure TfrmMerchandise.RefreshData;
begin
  inherited;
  cxGridView.LoadFromDS(DMClient.DSProviderClient.Merchandise_GetDSLookup, Self);
  cxGridView.SetVisibleColumns([TModMerchandise.GetPrimaryField], False);
end;

end.
