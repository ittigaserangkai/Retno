unit ufrmTipePengirimanPO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls,
  ufraFooter5Button, ActnList, uConn, uRetnoUnit, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, System.Actions, ufrmMasterBrowse, dxBarBuiltInMenu,
  cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, ufraFooter4Button,
  cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxPC;

type
  TfrmTipePengirimanPO = class(TfrmMasterBrowse)
    cxGridViewColumn1: TcxGridDBColumn;
    cxGridViewColumn2: TcxGridDBColumn;
    cxGridViewColumn3: TcxGridDBColumn;
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
  private
  protected
    procedure RefreshData; override;
  public
    { Public declarations }
  end;

var
  frmTipePengirimanPO: TfrmTipePengirimanPO;

implementation

uses uTSCommonDlg, ufrmDialogTipePengirimanPO,  uConstanta,  udMClient, udXUtils;

{$R *.dfm}

procedure TfrmTipePengirimanPO.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogTipePengirimanPO);
end;

procedure TfrmTipePengirimanPO.actEditExecute(Sender: TObject);
begin
  inherited;
    ShowDialogForm(TfrmDialogTipePengirimanPO,
    cxGridView.DS.FieldByName('REF$Tipe_Kirim_PO_ID').AsString
    );
end;

procedure TfrmTipePengirimanPO.RefreshData;
begin
  cxGridView.LoadFromDS(DMClient.DSProviderClient.TipeKirimPO_GetDSOverview(),self);
end;

end.
