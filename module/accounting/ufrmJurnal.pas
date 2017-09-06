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
  cxGridDBTableView, cxGrid, cxPC, Vcl.ExtCtrls, ufrmDialogJurnal, Datasnap.DBClient;

type
  TfrmJurnal = class(TfrmMasterBrowse)
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
  private
    FCDS: TClientDataset;
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

procedure TfrmJurnal.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogJurnal)
end;

procedure TfrmJurnal.actEditExecute(Sender: TObject);
begin
  inherited;
  if FCDS = nil then
    Exit;

  ShowDialogForm(TfrmDialogJurnal, FCDS.FieldByName('JURNAL_ID').AsString)
end;

procedure TfrmJurnal.RefreshData;
begin
  inherited;
end;

end.
