unit ufrmJurnal;

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
  cxGridDBTableView, cxGrid, cxPC, Vcl.ExtCtrls,  Datasnap.DBClient,
  ufrmDialogJurnal, uDXUtils, uAppUtils, uDButils;

type
  TfrmJurnal = class(TfrmMasterBrowse)
    cxGridViewColumn1: TcxGridDBColumn;
    cxGridViewColumn2: TcxGridDBColumn;
    cxGridViewColumn3: TcxGridDBColumn;
    cxGridViewColumn4: TcxGridDBColumn;
    cxGridViewColumn5: TcxGridDBColumn;
    cxGridViewColumn6: TcxGridDBColumn;
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
  private
    FCDS: TClientDataSet;
    property CDS: TClientDataSet read FCDS write FCDS;
    { Private declarations }
  protected
  public
    procedure RefreshData; override;
    { Public declarations }
  end;

var
  frmJurnal: TfrmJurnal;

implementation

{$R *.dfm}

uses uDMClient;

procedure TfrmJurnal.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogJurnal)
end;

procedure TfrmJurnal.actEditExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogJurnal, cxGridView.DS.FieldByName('JURNAL_ID').AsString);
end;

procedure TfrmJurnal.RefreshData;
begin
  inherited;
    try
    TAppUtils.cShowWaitWindow('Mohon Ditunggu');
    if Assigned(FCDS) then FreeAndNil(FCDS);

    CDS := TDBUtils.DSToCDS(
      DMClient.DSProviderClient.Jurnal_GetDSOverview(dtAwalFilter.Date,dtAkhirFilter.Date),
      Self
    );
    cxGridView.LoadFromCDS(FCDS, False, False);
//    cxGridView.ApplyBestFit();
  finally
    TAppUtils.cCloseWaitWindow;
  end;
end;

end.
