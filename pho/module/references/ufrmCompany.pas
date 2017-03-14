unit ufrmCompany;

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
  cxGridDBTableView, cxGrid, cxPC, Vcl.ExtCtrls, uDXUtils, uDMClient, ufrmDialogCompany;

type
  TfrmCompany = class(TfrmMasterBrowse)
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
  frmCompany: TfrmCompany;

implementation

{$R *.dfm}

procedure TfrmCompany.actAddExecute(Sender: TObject);
begin
  inherited;
  frmDialogCompany := TfrmDialogCompany.Create(nil);
  try
   frmDialogCompany.LoadData('00000000-0000-0000-0000-000000000000');
   frmDialogCompany.ShowModal;

    if frmDialogCompany.ModalResult = mrOk then
      actRefreshExecute(Sender);
  finally
   frmDialogCompany.Free;
  end;
end;

procedure TfrmCompany.actEditExecute(Sender: TObject);
begin
  inherited;
  frmDialogCompany := TfrmDialogCompany.Create(nil);
  try
   frmDialogCompany.LoadData(cxGridView.DS.FieldByName('COMPANY_ID').AsString);
   frmDialogCompany.ShowModal;

    if frmDialogCompany.ModalResult = mrOk then
      actRefreshExecute(Sender);
  finally
   frmDialogCompany.Free;
  end;
end;

procedure TfrmCompany.RefreshData;
begin
  inherited;
  cxGridView.LoadFromDS(DMClient.DSProviderClient.Company_GetDSOverview(), cxGridView);
  cxGridView.SetVisibleColumns(['COMPANY_ID'], False);
end;

end.
