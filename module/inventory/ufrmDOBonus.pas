unit ufrmDOBonus;

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
  cxGridDBTableView, cxGrid, cxPC, Vcl.ExtCtrls, uDMClient, Datasnap.DBClient,
  uDBUtils, uModDOBonus, System.DateUtils, uDXUtils, ufrmDialogDoBonus;

type
  TfrmDOBonus = class(TfrmMasterBrowse)
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
  frmDOBonus: TfrmDOBonus;

implementation

{$R *.dfm}

procedure TfrmDOBonus.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogDoBonus)
end;

procedure TfrmDOBonus.actEditExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogDoBonus, FCDS.FieldByName('DOBONUS_ID').AsString);

end;

procedure TfrmDOBonus.RefreshData;
begin
  inherited;
  if Assigned(FCDS) then FreeAndNil(FCDS);
  FCDS := TDBUtils.DSToCDS(DMClient.DSProviderClient.DOBonus_GetDSOverview(StartOfTheDay(dtAwalFilter.Date), EndOfTheDay(dtAkhirFilter.Date), nil) ,Self );
  cxGridView.LoadFromCDS(FCDS);
  cxGridView.SetVisibleColumns(['DOBONUS_ID','DOB_UNIT_ID'],False);
end;

end.
