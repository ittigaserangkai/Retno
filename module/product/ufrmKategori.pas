unit ufrmKategori;

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
  cxGridDBTableView, cxGrid, cxPC, Vcl.ExtCtrls;

type
  TfrmKategori = class(TfrmMasterBrowse)
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
  private
    { Private declarations }
  public
    procedure RefreshData; override;
    { Public declarations }
  end;

var
  frmKategori: TfrmKategori;

implementation

uses
  uDMClient, uDBUtils, uDXUtils, uModBarang, ufrmDialogKategori;

{$R *.dfm}

procedure TfrmKategori.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogKategori);
end;

procedure TfrmKategori.actEditExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogKategori,
    cxGridView.DS.FieldByName('REF$KATEGORI_ID').AsString
  );
end;

procedure TfrmKategori.RefreshData;
begin
  inherited;
  cxGridView.LoadFromDS(DMClient.DSProviderClient.Kategori_GetDSLookup, Self);
  cxGridView.SetVisibleColumns(['Ref$Kategori_ID','Ref$Sub_Grup_ID'], False);
end;

end.
