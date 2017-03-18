unit ufrmPajak;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, ActnList, Grids, uModRefPajak,
  ufraFooter5Button, StdCtrls, ExtCtrls, System.Actions, cxStyles, cxClasses,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView, uAppUtils,
  cxGridDBTableView, cxGrid, DBClient, uDBUtils, UDXUtils, uClientClasses,
  uDMClient, ufrmMasterBrowse, dxBarBuiltInMenu, cxContainer, Vcl.ComCtrls,
  dxCore, cxDateUtils, Vcl.Menus, ufraFooter4Button, cxButtons, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxPC;

type
  TfrmPajak = class(TfrmMasterBrowse)
    cxGridViewColumn1: TcxGridDBColumn;
    cxGridViewColumn2: TcxGridDBColumn;
    cxGridViewColumn3: TcxGridDBColumn;
    cxGridViewColumn4: TcxGridDBColumn;
    cxGridViewColumn5: TcxGridDBColumn;
    cxGridViewColumn6: TcxGridDBColumn;
    cxGridViewColumn8: TcxGridDBColumn;
    cxGridViewColumn7: TcxGridDBColumn;
    cxGridViewColumn9: TcxGridDBColumn;
    cxGridViewColumn10: TcxGridDBColumn;
    cxGridViewColumn11: TcxGridDBColumn;
    cxGridViewColumn12: TcxGridDBColumn;
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
  private
//    FPajak : TNewPajak;
  protected
    procedure RefreshData; override;
  public
    { Public declarations }
  end;

var
  frmPajak: TfrmPajak;

implementation

uses ufrmDialogPajak, uConn, uConstanta, uTSCommonDlg;

{$R *.dfm}

procedure TfrmPajak.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogPajak)
end;

procedure TfrmPajak.actEditExecute(Sender: TObject);
begin
  inherited;
    ShowDialogForm(TfrmDialogPajak,
    cxGridView.DS.FieldByName('REF$PAJAK_ID').AsString)
end;

procedure TfrmPajak.btnUpdateClick(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogPajak,
    cxGridView.DS.FieldByName('REF$PAJAK_ID').AsString)
end;

procedure TfrmPajak.RefreshData;
begin
  cxGridView.LoadFromDS(
    DMClient.DSProviderClient.RefPajak_GetDSOverview, Self);
end;

end.
