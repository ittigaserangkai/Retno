unit ufrmCN;

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
  cxGridDBTableView, cxGrid, cxPC, Vcl.ExtCtrls, uDXUtils, ufrmDialogCN;

type
  TfrmCN = class(TfrmMasterBrowse)
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure RefreshData; override;
  public
    { Public declarations }
  end;

var
  frmCN: TfrmCN;

implementation

{$R *.dfm}

procedure TfrmCN.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogCN);

end;

procedure TfrmCN.actEditExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogCN, cxGridView.DS.FieldByName('ID').AsString);
end;

procedure TfrmCN.RefreshData;
begin
  inherited;
  // TODO -cMM: TfrmCN.RefreshData default body inserted
end;

end.
