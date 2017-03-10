unit ufrmDiscountMember;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, ufraFooter5Button, StdCtrls, ExtCtrls, Grids,
  BaseGrid, AdvGrid, SUIButton, uSetAdvGrid, uDiscountMember, AdvObj;

type
  TfrmDiscountMember = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    pnlTop: TPanel;
    btnShow: TsuiButton;
    grp1: TGroupBox;
    edtSearchKode: TEdit;
    edtSearchNama: TEdit;
    chkKode: TCheckBox;
    chkNama: TCheckBox;
    pnlMain: TPanel;
    strgGrid: TAdvStringGrid;
    procedure strgGridGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure strgGridRowChanging(Sender: TObject; OldRow, NewRow: Integer;
      var Allow: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fraFooter5Button1btnAddClick(Sender: TObject);
    procedure fraFooter5Button1btnUpdateClick(Sender: TObject);
    procedure fraFooter5Button1btnDeleteClick(Sender: TObject);
    procedure fraFooter5Button1btnRefreshClick(Sender: TObject);
    procedure fraFooter5Button1btnCloseClick(Sender: TObject);
    procedure btnShowClick(Sender: TObject);
    procedure strgGridGetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
    procedure btnShowEnter(Sender: TObject);
    procedure btnShowExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FLoginId    : Integer;
    FUnitID     : Integer;
    iY          : integer;
    FsetAdvGrd  : TSetAdvGrid;
    FDiscMem    : TDiscountMember;
    procedure GetRec;
  public
    { Public declarations }
//    procedure ShowWithId(aUnitID: Integer; aLoginId: Integer);
  end;

var
  frmDiscountMember: TfrmDiscountMember;

implementation
uses  uGTSUICommonDlg, suithemes, uRMSUnit, ufrmDialogDiscountMember;
{$R *.dfm}


const
  _KolNo    : Integer = 0;
  _kolId    : Integer = 1;
  _KolNm    : Integer = 2;
  _KolMin   : Integer = 3;
  _KolMax   : Integer = 4;
  _KolDisc  : Integer = 5;

//procedure TfrmDiscountMember.ShowWithId(aUnitID: Integer; aLoginId: Integer);
//begin
//  FUnitID     := aUnitID;
//  FLoginId    := aLoginId;
//  FDiscMem    := TDiscountMember.Create(nil);
//  FsetAdvGrd  := TSetAdvGrid.CreateWithAdvGrd(Self, strgGrid);
//  iY          := strgGrid.FixedRows;
//  GetRec;
//  self.Show;
//end;

procedure TfrmDiscountMember.GetRec;
//var
//  sSQL: String;
begin
  strgGrid := FsetAdvGrd.GetAdvGrd(FDiscMem.GetRec(edtSearchNama.Text,
                      edtSearchKode.Text, chkNama.Checked, chkKode.Checked, MasterNewUnit.ID));
  strgGrid.SelectRows(iY, 1);
  strgGrid.ColWidths[_KolMin] := 125;
  strgGrid.ColWidths[_KolMax] := 125;
  strgGrid.ColWidths[_KolNm]  := 150;
  strgGrid.ColWidths[_kolId]  := 0;
end;

procedure TfrmDiscountMember.strgGridGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  inherited;
  HAlign := taLeftJustify;
  if ARow < strgGrid.FixedRows then
  begin
    HAlign := taCenter;
  end
  else
  begin
    if ACol in [_KolMin,_KolMax,_KolDisc] then
    begin
      HAlign := taRightJustify;
    end;
  end;

end;

procedure TfrmDiscountMember.strgGridRowChanging(Sender: TObject; OldRow,
  NewRow: Integer; var Allow: Boolean);
begin
  inherited;
  Iy := newRow;
end;

procedure TfrmDiscountMember.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FDiscMem);
  FreeAndNil(FsetAdvGrd);
  frmDiscountMember := nil;
  inherited;
end;

procedure TfrmDiscountMember.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action  := caFree;
end;

procedure TfrmDiscountMember.fraFooter5Button1btnAddClick(Sender: TObject);
begin
  if not Assigned(frmDialogDiscountMember) then
  frmDialogDiscountMember   := TfrmDialogDiscountMember.Create(self);

  frmDialogDiscountMember.ShowWithId(FUnitID, FLoginId);
  GetRec;

end;

procedure TfrmDiscountMember.fraFooter5Button1btnUpdateClick(
  Sender: TObject);
begin
  inherited;
  if not Assigned(frmDialogDiscountMember) then
  frmDialogDiscountMember   := TfrmDialogDiscountMember.Create(self);

  frmDialogDiscountMember.ShowWithId(FUnitID, FLoginId, strgGrid.Ints[_kolId, iY]);
  GetRec;

end;

procedure TfrmDiscountMember.fraFooter5Button1btnDeleteClick(
  Sender: TObject);
begin
  inherited;
  if MessageDlg('Apakah yakin akan menghapus Discount Member ' +
          strgGrid.Cells[_KolNm , iy] + ' ?',
          mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
    if FDiscMem.LoadByID(strgGrid.Ints[_kolId, iy], FUnitID ) then
    begin
      try
        if FDiscMem.RemoveFromDB then
        begin
          cCommitTrans;
          CommonDlg.ShowMessage('Sukses Hapus Discount Member');
          GetRec;
        end
        else
        begin
          cRollbackTrans;
          CommonDlg.ShowError('Gagal Hapus Discount Member');
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

procedure TfrmDiscountMember.fraFooter5Button1btnRefreshClick(
  Sender: TObject);
begin
  inherited;
  GetRec;
end;

procedure TfrmDiscountMember.fraFooter5Button1btnCloseClick(
  Sender: TObject);
begin
  inherited;
  fraFooter5Button1.btnCloseClick(Sender);

end;

procedure TfrmDiscountMember.btnShowClick(Sender: TObject);
begin
  inherited;
  GetRec;
end;

procedure TfrmDiscountMember.strgGridGetFloatFormat(Sender: TObject; ACol,
  ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  inherited;
  FloatFormat := '%.2n';
  if ACol in [_KolNo, _kolId, _KolNm] then
    IsFloat := False
  else
    IsFloat := True;


//  if ACol in [_KolNo, _kolId, _KolNm] then IsFloat := False;
//
////  if ACol in [_KolMin, _KolMax, _KolDisc] then
//  if IsFloat then
//    FloatFormat := '%.2n';
end;

procedure TfrmDiscountMember.btnShowEnter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmDiscountMember.btnShowExit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

procedure TfrmDiscountMember.FormShow(Sender: TObject);
begin
  inherited;
  FUnitID     := FLoginUnitId;
  FLoginId    := FLoginId;
  FDiscMem    := TDiscountMember.Create(nil);
  FsetAdvGrd  := TSetAdvGrid.CreateWithAdvGrd(Self, strgGrid);
  iY          := strgGrid.FixedRows;
  GetRec;
end;

end.
