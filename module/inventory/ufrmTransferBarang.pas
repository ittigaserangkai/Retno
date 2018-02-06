unit ufrmTransferBarang;

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
  cxGridDBTableView, cxGrid, cxPC, Vcl.ExtCtrls, uDBUtils, uModTransferBarang,
  uDXUtils, Datasnap.DBClient, uDMClient, uAppUtils, uModBarang, uModSatuan,
  uModGudang, System.DateUtils, System.StrUtils, ufrmDialogTransferBarang,
  uRetnoUnit;

type
  TfrmTransferBarang = class(TfrmMasterBrowse)
    cxGridViewColumn1: TcxGridDBColumn;
    cxGridViewColumn2: TcxGridDBColumn;
    cxGridViewColumn3: TcxGridDBColumn;
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
  private
    FCDS: TClientDataset;
    { Private declarations }
  public
    procedure RefreshData; override;
    { Public declarations }
  end;

var
  frmTransferBarang: TfrmTransferBarang;

implementation

{$R *.dfm}

procedure TfrmTransferBarang.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogTransferBarang);
end;

procedure TfrmTransferBarang.actEditExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogTransferBarang,
    FCDS.FieldByName('TRANSFERBARANG_ID').AsString
  );
end;

procedure TfrmTransferBarang.RefreshData;
begin
  inherited;
  cxGridView.PrepareFromCDS(
    TDBUtils.DSToCDS(
      DMClient.DSProviderClient.TransferBarang_GetDSOverview(
        dtAwalFilter.Date, dtAkhirFilter.Date, TRetno.UnitStore
      ), Self
    )
  );
end;

end.
