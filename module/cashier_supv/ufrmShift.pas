unit ufrmShift;

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
  cxGridDBTableView, cxGrid, cxPC, Vcl.ExtCtrls, uDXUtils, cxTimeEdit,
  ufrmDialogShift;


type
  TfrmShift = class(TfrmMasterBrowse)
    cxGridViewColumn2: TcxGridDBColumn;
    cxGridViewColumn3: TcxGridDBColumn;
    cxGridViewColumn4: TcxGridDBColumn;
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
  private
    { Private declarations }
  protected
  public
    procedure RefreshData; override;
    { Public declarations }
  end;

var
  frmShift: TfrmShift;

implementation

{$R *.dfm}

uses uDMClient, uDBUtils;

procedure TfrmShift.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogShift);
end;

procedure TfrmShift.actEditExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogShift,
  cxGridView.DS.FieldByName('SHIFT_ID').AsString);
end;

procedure TfrmShift.RefreshData;
begin
  inherited;
  cxGridView.PrepareFromCDS(
    TDBUtils.DSToCDS(DMClient.DSProviderClient.Shift_GetDSOverview(),Self) );
end;

end.
