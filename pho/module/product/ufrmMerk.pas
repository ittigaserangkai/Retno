unit ufrmMerk;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterBrowse, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  System.Actions, Vcl.ActnList, cxClasses, ufraFooter4Button, Vcl.StdCtrls,
  cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC, Vcl.ExtCtrls, Datasnap.DBClient;

type
  TfrmMerk = class(TfrmMasterBrowse)
    procedure FormCreate(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
  private
    { Private declarations }
  public
    procedure RefreshData; override;
    { Public declarations }
  end;

var
  frmMerk: TfrmMerk;

implementation

uses
  uDMClient, uDBUtils, uDXUtils, uModBarang, ufrmDialogMerk, ufrmMasterDialog;

{$R *.dfm}

procedure TfrmMerk.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AutoRefreshData := True;
end;

procedure TfrmMerk.actAddExecute(Sender: TObject);
var
  frm: TfrmDialogMerk;
begin
  inherited;
  frm := TfrmDialogMerk.Create(Self);
  Try
    If frm.ShowModal = mrOk then
    begin
      showMessage(frm.ModMerk.ID);
    end;
  Finally
    frm.Free;
  End;
end;

procedure TfrmMerk.RefreshData;
begin
  inherited;
  cxGridView.LoadFromDS(DMClient.DSProviderClient.Merk_GetDSLookUp, Self);
  cxGridView.SetVisibleColumns([TModMerk.GetPrimaryField], False);
end;

end.
