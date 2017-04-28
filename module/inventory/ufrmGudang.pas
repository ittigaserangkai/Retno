unit ufrmGudang;

interface
 
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, System.Actions, Vcl.ActnList, cxClasses,
  ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel, cxGridLevel, cxGridCustomView, cxGrid, dxBarBuiltInMenu,
  cxPC;

type
  TfrmGudang = class(TfrmMasterBrowse)
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
  private
  protected
    procedure RefreshData; override;
  public
  end;

var
  frmGudang: TfrmGudang;

implementation

uses
  uDMClient, uDXUtils, ufrmDialogGudang;

{$R *.dfm}

procedure TfrmGudang.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogGudang)

end;

procedure TfrmGudang.actEditExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogGudang,cxGridView.DS.FieldByName('GUDANG_ID').AsString);

end;

procedure TfrmGudang.RefreshData;
begin
  inherited;
  cxGridView.LoadFromDS(DMClient.DSProviderClient.Gudang_GetDSOverview, self);
  cxGridView.SetVisibleColumns(['GUDANG_ID'],False);
end;

end.
