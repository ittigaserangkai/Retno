unit ufrmSubGroup;

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
  TfrmSubGroup = class(TfrmMasterBrowse)
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
  private
    { Private declarations }
  public
    procedure RefreshData; override;
    { Public declarations }
  end;

var
  frmSubGroup: TfrmSubGroup;

implementation

uses
  uDMClient, uDBUtils, uDXUtils, uModBarang, ufrmDialogSubGroup;

{$R *.dfm}

procedure TfrmSubGroup.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogSubGroup);
end;

procedure TfrmSubGroup.actEditExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogSubGroup,
    cxGridView.DS.FieldByName('REF$SUB_GRUP_ID').AsString
  );
end;

procedure TfrmSubGroup.RefreshData;
begin
  inherited;
  cxGridView.LoadFromDS(DMClient.DSProviderClient.SubGroup_GetDSLookup, Self);
  cxGridView.SetVisibleColumns(['Ref$Sub_Grup_ID','Ref$Merchandise_Grup_ID'], False);
end;

end.
