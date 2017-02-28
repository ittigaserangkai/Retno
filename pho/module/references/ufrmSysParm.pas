unit ufrmSysParm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, ufraFooter5Button, SUIButton,
  Grids, BaseGrid, AdvGrid, uSetAdvGrid, uSysParm, AdvObj;

type
  TfrmSysParm = class(TfrmMaster)
    pnlMain: TPanel;
    strgGrid: TAdvStringGrid;
    pnlTop: TPanel;
    btnShow: TsuiButton;
    grp1: TGroupBox;
    edtSearchKode: TEdit;
    edtSearchNama: TEdit;
    chkKode: TCheckBox;
    chkNama: TCheckBox;
    fraFooter5Button1: TfraFooter5Button;
    procedure strgGridRowChanging(Sender: TObject; OldRow, NewRow: Integer;
      var Allow: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure fraFooter5Button1btnAddClick(Sender: TObject);
    procedure fraFooter5Button1btnUpdateClick(Sender: TObject);
    procedure fraFooter5Button1btnRefreshClick(Sender: TObject);
    procedure fraFooter5Button1btnDeleteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnShowClick(Sender: TObject);
    procedure strgGridGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure btnShowEnter(Sender: TObject);
    procedure btnShowExit(Sender: TObject);
  private
    { Private declarations }
    iY          : integer;
    FsetAdvGrd  : TSetAdvGrid;
    FSysParm    : TSysParm;
    procedure GetRec;
  public
    { Public declarations }
  end;

var
  frmSysParm: TfrmSysParm;

implementation

uses ufrmDialogSysParm,suithemes, uTSCommonDlg, uRetnoUnit;

{$R *.dfm}
const
  _KolNo  : Integer = 0;
  _kolId  : Integer = 1;
  _KolNm  : Integer = 2;

procedure TfrmSysParm.GetRec;
begin
  strgGrid := FsetAdvGrd.GetAdvGrd(FSysParm.GetRec(edtSearchNama.Text,
                      edtSearchKode.Text, chkNama.Checked, chkKode.Checked));
  strgGrid.SelectRows(iY, 1);
  strgGrid.ColWidths[_kolId] := 0;
end;

procedure TfrmSysParm.strgGridRowChanging(Sender: TObject; OldRow,
  NewRow: Integer; var Allow: Boolean);
begin
  inherited;
  iY := NewRow;
end;

procedure TfrmSysParm.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FSysParm);
  FreeAndNil(FsetAdvGrd);
  frmSysParm  := nil;
  inherited;
end;

procedure TfrmSysParm.fraFooter5Button1btnAddClick(Sender: TObject);
begin
  inherited;
  if not Assigned(frmDialogSysParm) then
  frmDialogSysParm   := TfrmDialogSysParm.Create(self);

  frmDialogSysParm.ShowWithId;
  GetRec;
end;

procedure TfrmSysParm.fraFooter5Button1btnUpdateClick(Sender: TObject);
begin   
  inherited;
  if not Assigned(frmDialogSysParm) then
  frmDialogSysParm   := TfrmDialogSysParm.Create(self);

  frmDialogSysParm.ShowWithId(strgGrid.Ints[_kolId, iY]);
  GetRec;
end;

procedure TfrmSysParm.fraFooter5Button1btnRefreshClick(Sender: TObject);
begin
  inherited;
  GetRec;
end;

procedure TfrmSysParm.fraFooter5Button1btnDeleteClick(Sender: TObject);
begin
  inherited;
  /// tanya ke user dl mas, apakah yakin akan hapus DB
  if MessageDlg('Apakah yakin akan menghapus System Parameter ' +
          strgGrid.Cells[_KolNm , iy] + ' ?',
          mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
    if FSysParm.LoadByID(strgGrid.Ints[_kolId, iy]) then
    begin
      try
        if FSysParm.RemoveFromDB then
        begin
          cCommitTrans;
          CommonDlg.ShowMessage('Sukses Hapus System Parameter');
          GetRec;
        end
        else
        begin
          cRollbackTrans;
          CommonDlg.ShowError('Gagal Hapus System Parameter');
        end;
      finally
        cRollbackTrans;
      end;
    end
    else
    begin
       CommonDlg.ShowConfirmGlobal ('Data yang dihapus tidak ada!'); 
    end;
  end;
end;

procedure TfrmSysParm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action  := caFree;
end;

procedure TfrmSysParm.FormShow(Sender: TObject);
begin
  inherited;
  iY              := strgGrid.FixedRows;
  FSysParm        := TSysParm.Create(nil);
  FsetAdvGrd      := TSetAdvGrid.CreateWithAdvGrd(Self, strgGrid);
  GetRec;
end;

procedure TfrmSysParm.btnShowClick(Sender: TObject);
begin
  inherited;
  GetRec;
end;


procedure TfrmSysParm.strgGridGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  HAlign := taLeftJustify;
  if ARow < strgGrid.FixedRows then
  begin
    HAlign := taCenter;
  end;

end;

procedure TfrmSysParm.btnShowEnter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmSysParm.btnShowExit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

end.

