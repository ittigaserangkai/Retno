unit ufrmSysParm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, ufraFooter5Button, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.Menus, cxButtons,
  dxBarBuiltInMenu, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils,
  System.Actions, Vcl.ActnList, ufraFooter4Button, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxLabel, cxPC;

type
  TfrmSysParm = class(TfrmMasterBrowse)
    pnlTop: TPanel;
    grp1: TGroupBox;
    edtSearchKode: TEdit;
    edtSearchNama: TEdit;
    chkKode: TCheckBox;
    chkNama: TCheckBox;
    btnShow: TcxButton;
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure strgGridRowChanging(Sender: TObject; OldRow, NewRow: Integer;
      var Allow: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure fraFooter5Button1btnRefreshClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnShowClick(Sender: TObject);
  private
    { Private declarations }
    iY          : integer;
//    FsetAdvGrd  : TSetAdvGrid;
//    FSysParm    : TSysParm;
    procedure GetRec;
  public
    { Public declarations }
  end;

var
  frmSysParm: TfrmSysParm;

implementation

uses ufrmDialogSysParm, uTSCommonDlg, uRetnoUnit;

{$R *.dfm}
const
  _KolNo  : Integer = 0;
  _kolId  : Integer = 1;
  _KolNm  : Integer = 2;

procedure TfrmSysParm.actAddExecute(Sender: TObject);
begin
  inherited;
  if not Assigned(frmDialogSysParm) then
  frmDialogSysParm   := TfrmDialogSysParm.Create(self);

  frmDialogSysParm.ShowWithId;
  GetRec;end;

procedure TfrmSysParm.actEditExecute(Sender: TObject);
begin
  inherited;
  if not Assigned(frmDialogSysParm) then
  frmDialogSysParm   := TfrmDialogSysParm.Create(self);

//  frmDialogSysParm.ShowWithId(strgGrid.Ints[_kolId, iY]);
  GetRec;end;

procedure TfrmSysParm.GetRec;
begin
//  strgGrid := FsetAdvGrd.GetAdvGrd(FSysParm.GetRec(edtSearchNama.Text,
//                      edtSearchKode.Text, chkNama.Checked, chkKode.Checked));
//  strgGrid.SelectRows(iY, 1);
//  strgGrid.ColWidths[_kolId] := 0;
end;

procedure TfrmSysParm.strgGridRowChanging(Sender: TObject; OldRow,
  NewRow: Integer; var Allow: Boolean);
begin
  inherited;
  iY := NewRow;
end;

procedure TfrmSysParm.FormDestroy(Sender: TObject);
begin
//  FreeAndNil(FSysParm);
//  FreeAndNil(FsetAdvGrd);
  frmSysParm  := nil;
  inherited;
end;

procedure TfrmSysParm.fraFooter5Button1btnRefreshClick(Sender: TObject);
begin
  inherited;
  GetRec;
end;

procedure TfrmSysParm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action  := caFree;
end;

procedure TfrmSysParm.FormShow(Sender: TObject);
begin
  inherited;
//  iY              := strgGrid.FixedRows;
//  FSysParm        := TSysParm.Create(nil);
//  FsetAdvGrd      := TSetAdvGrid.CreateWithAdvGrd(Self, strgGrid);
  GetRec;
end;

procedure TfrmSysParm.btnShowClick(Sender: TObject);
begin
  inherited;
  GetRec;
end;

end.

