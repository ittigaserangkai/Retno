unit ufrmSupplierGroup;

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
  cxGridDBTableView, cxGrid, cxPC, Vcl.ExtCtrls, uDXUtils, uDMClient,
  ufrmDialogSupplierGroup;

type
  TfrmSupplierGroup = class(TfrmMasterBrowse)
    cxGridViewColumn1: TcxGridDBColumn;
    cxGridViewColumn2: TcxGridDBColumn;
    cxGridViewColumn3: TcxGridDBColumn;
    cxGridViewColumn4: TcxGridDBColumn;
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
  private
    { Private declarations }
  public
    procedure RefreshData; override;
    { Public declarations }
  end;

var
  frmSupplierGroup: TfrmSupplierGroup;

implementation


{$R *.dfm}

procedure TfrmSupplierGroup.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogSupplierGroup);
end;

procedure TfrmSupplierGroup.actEditExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogSupplierGroup,
  cxGridView.DS.FieldByName('SUPLIER_GROUP_ID').AsString);
end;

procedure TfrmSupplierGroup.RefreshData;
begin
  inherited;
  cxGridView.LoadFromDS(
    DMClient.DSProviderClient.SuplierGroup_GetDSOverview1(),Self);
end;

end.
