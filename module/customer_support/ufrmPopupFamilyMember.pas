unit ufrmPopupFamilyMember;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, DateUtils, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, cxLabel;

type
  TfrmPopupFamilyMember = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    lblClose: TcxLabel;
    pnl3: TPanel;
    lbl4: TLabel;
    lbl5: TLabel;
    edtMemberName: TEdit;
    edtCardNo: TEdit;
    lblEditFamily: TcxLabel;
    cxGrid: TcxGrid;
    cxGridView: TcxGridDBTableView;
    cxlvMaster: TcxGridLevel;
    cxGridViewColumn1: TcxGridDBColumn;
    cxGridViewColumn2: TcxGridDBColumn;
    cxGridViewColumn3: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lblCloseClick(Sender: TObject);
    procedure lblEditFamilyClick(Sender: TObject);
  private
    dataFamily: TDataSet;

    procedure ParseHeaderGrid(jmlData: Integer);
    procedure ParseDataGrid();
  public
    FSelfUnitID: Integer;
    { Public declarations }
    MemberID: Integer;
  end;

var
  frmPopupFamilyMember: TfrmPopupFamilyMember;

implementation

uses ufrmDialogFamilyMember, uTSCommonDlg;

{$R *.dfm}

procedure TfrmPopupFamilyMember.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmPopupFamilyMember.FormDestroy(Sender: TObject);
begin
  frmPopupFamilyMember := nil;
end;

procedure TfrmPopupFamilyMember.ParseDataGrid;
var intI: Integer;
//    arrParam: TArr;
begin
  {if not Assigned(MemberShip) then MemberShip := TMemberShip.Create;

  SetLength(arrParam,1);
  arrParam[0].tipe := ptInteger;
  arrParam[0].data := MemberID;
  dataFamily := MemberShip.GetListKeluargaMemberShip(arrParam);

  ParseHeaderGrid(dataFamily.RecordCount);
  if dataFamily.RecordCount > 0 then
  begin
    //initiate
    intI := 1;
    dataFamily.First;

    while not(dataFamily.Eof) do
    begin
      with strgGrid do
      begin
        Cells[0,intI] := dataFamily.FieldByName('MEMBERKLRG_STAKLRG_ID').AsString +
                         '=' + dataFamily.FieldByName('STAKLRG_NAME').AsString;
        Cells[1,intI] := dataFamily.FieldByName('MEMBERKLRG_FULL_NAME').AsString;
        Cells[2,intI] := dataFamily.FieldByName('MEMBERKLRG_BIRTH_DATE').AsString;
      end;

      Inc(intI);
      dataFamily.Next;
    end; //while not eof
  end;// end if recordcount

  strgGrid.FixedRows := 1;
  strgGrid.AutoSize := true;
  }
end;

procedure TfrmPopupFamilyMember.ParseHeaderGrid(jmlData: Integer);
begin
  {
  with strgGrid do
  begin
    Clear;
    ColCount := 3;
    RowCount := jmlData + 1;
    Cells[0,0] := 'STATUS DLM KELUARGA';
    Cells[1,0] := 'NAMA LENGKAP';
    Cells[2,0] := 'TANGGAL LAHIR';

    if jmlData < 1 then
    begin
      RowCount := 2;
      Cells[0,1] := '';
      Cells[1,1] := '';
      Cells[2,1] := '';
    end;

    FixedRows := 1;
    AutoSize := true;
  end;
  }
end;

procedure TfrmPopupFamilyMember.FormShow(Sender: TObject);
begin
  ParseDataGrid;
end;

procedure TfrmPopupFamilyMember.lblCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPopupFamilyMember.lblEditFamilyClick(Sender: TObject);
var countI: Integer;
begin
  if not Assigned(frmDialogFamilyMember) then
      frmDialogFamilyMember := TfrmDialogFamilyMember.Create(Self);

  frmDialogFamilyMember.MemberID := MemberID;
  frmDialogFamilyMember.edtMemberName.Text := edtMemberName.Text;
  frmDialogFamilyMember.edtCardNo.Text := edtCardNo.Text;
  {frmDialogFamilyMember.strgGrid.RowCount := strgGrid.RowCount;

  if strgGrid.RowCount > 1 then
  for countI := 1 to strgGrid.RowCount-1 do
  begin
    frmDialogFamilyMember.strgGrid.Cells[0,countI] := strgGrid.Cells[0,countI];
    frmDialogFamilyMember.strgGrid.Cells[1,countI] := strgGrid.Cells[1,countI];
    frmDialogFamilyMember.strgGrid.Cells[2,countI] := strgGrid.Cells[2,countI];
  end;
  }
  frmDialogFamilyMember.DialogUnit := FSelfUnitID;
  frmDialogFamilyMember.ShowModal;

  if frmDialogFamilyMember.IsProcessSuccessfull then
  begin
    CommonDlg.ShowConfirmSuccessfull(atEdit);
    ParseDataGrid;
  end;

  frmDialogFamilyMember.Free;
end;

end.
