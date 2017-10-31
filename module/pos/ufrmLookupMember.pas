unit ufrmLookupMember;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxEdit, cxGridCustomTableView,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxContainer,
  Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls, cxProgressBar, cxGridLevel,
  cxGridTableView, cxClasses, cxGridCustomView, cxGrid, Data.DB, cxDBData,
  cxGridDBTableView, Datasnap.DBClient, uModMember, uDBUtils, uDXUtils;

type
  TfrmLookupMember = class(TForm)
    cxGrid: TcxGrid;
    sgLookup: TcxGridTableView;
    cxcolKode: TcxGridColumn;
    cxcolNama: TcxGridColumn;
    cxcolAlamat: TcxGridColumn;
    cxcolAktif: TcxGridColumn;
    cxcolValid: TcxGridColumn;
    grdlvlLookupMember: TcxGridLevel;
    pbLookup: TcxProgressBar;
    pnlHeader: TPanel;
    Label1: TLabel;
    edNama: TEdit;
    rbDepan: TRadioButton;
    rbSemua: TRadioButton;
    pmLookup: TPopupMenu;
    ExporttoCSV1: TMenuItem;
    dlgSaveLookup: TSaveDialog;
    cxGrdMember: TcxGridDBTableView;
    clKode: TcxGridDBColumn;
    clNama: TcxGridDBColumn;
    clAlamat: TcxGridDBColumn;
    procedure cxGrdMemberDblClick(Sender: TObject);
    procedure cxGrdMemberKeyDown(Sender: TObject; var Key: Word; Shift:
        TShiftState);
    procedure edNamaChange(Sender: TObject);
    procedure edNamaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure sgLookupDblClick(Sender: TObject);
    procedure sgLookupKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FCDS: TClientDataSet;
    FIsProcessing: Boolean;
    FIsStop: Boolean;
    FMemberCode: string;
    FUnitID: string;
    property CDS: TClientDataSet read FCDS write FCDS;
    { Private declarations }
  public
    class function CreateAt(aContainer: TWinControl): TfrmLookupMember;
    procedure LoadData(ANama: String = ''; AIsDepan: Boolean = True);
    procedure SelectItem;
    property IsProcessing: Boolean read FIsProcessing write FIsProcessing;
    property IsStop: Boolean read FIsStop write FIsStop;
    property MemberCode: string read FMemberCode write FMemberCode;
    property UnitID: string read FUnitID write FUnitID;
    { Public declarations }
  end;

var
  frmLookupMember: TfrmLookupMember;

implementation

{$R *.dfm}

uses ufrmMain, uDMClient;

class function TfrmLookupMember.CreateAt(aContainer: TWinControl):
    TfrmLookupMember;
begin
  Result              := TfrmLookupMember.Create(Application);
  Result.BoundsRect   := aContainer.BoundsRect;
  Result.Left         := aContainer.ClientToScreen(Point(0,0)).X;
  Result.Top          := aContainer.ClientToScreen(Point(0,0)).Y;
  Result.UNITID       := frmMain.UnitID;
  Result.BorderIcons  := [];
  Result.BorderStyle  := bsNone;
end;

procedure TfrmLookupMember.cxGrdMemberDblClick(Sender: TObject);
begin
  SelectItem;
end;

procedure TfrmLookupMember.cxGrdMemberKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
  if ((Key = VK_UP) or (Key = 33)) and (cxGrdMember.DataController.FocusedRowIndex = 0) then
  begin
    edNama.SetFocus;
    edNama.SelectAll;
    Exit;
  end
  else
  if ((Key = VK_DOWN) or (Key = 34)) and
    (cxGrdMember.DataController.FocusedRowIndex = (cxGrdMember.DataController.RowCount-1)) then
  begin
    edNama.SetFocus;
    edNama.SelectAll;
    Exit;
  end
  else
  if Key = VK_F5 then
  begin
    edNama.SetFocus;
    edNama.SelectAll;
  end
  else if Key in [VK_ESCAPE] then
  begin
    Self.ModalResult := mrCancel;
  end
  else if Key = VK_RETURN then
  begin
    IsStop := True;
    SelectItem;
  end
  else if Key in [VK_MULTIPLY,Ord('*')] then
  begin
    //IsStop := True;
  end;
end;

procedure TfrmLookupMember.edNamaChange(Sender: TObject);
begin
{
  with sgLookup.DataController do
  begin
    Filter.Clear;
    Filter.Active := False;
    Filter.Options := [];
    Filter.PercentWildcard := '*';
    Filter.FilterText := ';*' + edNama.Text + '*';
    Filter.SupportedLike := True;
    KeyFieldNames := sgLookup.Columns[_KolNama].Caption;
    Filter.Active := True;
  end;
}
end;

procedure TfrmLookupMember.edNamaKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  if (key in [VK_ESCAPE]) then
  begin
    sgLookupKeyDown(Sender,Key,Shift);
  end
  else if (key in [VK_RETURN]) then
  begin
    IsStop := False;
    if IsProcessing then
      IsStop := True
    else
      LoadData(Trim(edNama.Text),rbDepan.Checked);
  end
  else if (key in [VK_UP,VK_DOWN,33,34]) then
  begin
    cxGrid.SetFocus;
    if cxGrdMember.DataController.RowCount > 0 then
      cxGrdMember.Controller.FocusedRowIndex := 0;
//    if sgLookup.DataController.RowCount <= 1 then exit;
  end
  else if (key in [VK_F2]) then
  begin
    rbDepan.Checked := True;
  end
  else if (key in [VK_F3]) then
  begin
    rbSemua.Checked := True;
  end;
end;

procedure TfrmLookupMember.FormShow(Sender: TObject);
begin
  Self.SetFocus;
  Self.edNama.SetFocus;
  Self.edNama.SelectAll;
end;

procedure TfrmLookupMember.LoadData(ANama: String = ''; AIsDepan: Boolean = True);
var
  iRecordCOunt: Integer;
  sFilter: string;
begin
  IsProcessing := True;
  try
    sFilter := ANama + '%';
    if not AIsDepan then sFilter := '%' + sFilter;
    if Assigned(FCDS) then FreeAndNil(FCDS);
    FCDS := TDBUtils.DSToCDS(DMClient.POSClient.LookupMember(sFilter), Self);
    cxGrdMember.LoadFromCDS(FCDS);
    cxGrdMember.SetVisibleColumns(['MEMBER_ID'], false);
  finally
    IsProcessing := False;
  end;

end;

procedure TfrmLookupMember.SelectItem;
begin
  if not Assigned(FCDS) then exit;
  if FCDS.Eof then exit;
  MemberCode        := CDS.FieldByName('KODE').AsString;
  Self.ModalResult  := mrOk;
end;

procedure TfrmLookupMember.sgLookupDblClick(Sender: TObject);
begin
  Self.ModalResult := mrOK;
end;

procedure TfrmLookupMember.sgLookupKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  IsStop := False;
  if ((Key = VK_UP) or (Key = 33)) and (sgLookup.DataController.FocusedRowIndex = 0) then
  begin
    edNama.SetFocus;
    edNama.SelectAll;
    Exit;
  end
  else
  if ((Key = VK_DOWN) or (Key = 34)) and (sgLookup.DataController.FocusedRowIndex = (sgLookup.DataController.RowCount-1)) then
  begin
    edNama.SetFocus;
    edNama.SelectAll;
    Exit;
  end
  else
  if Key = VK_F5 then
  begin
    edNama.SetFocus;
    edNama.SelectAll;
  end
  else if Key in [VK_ESCAPE] then
  begin
    Self.ModalResult := mrCancel;
  end
  else if Key = VK_RETURN then
  begin
    IsStop := True;
    sgLookupDblClick(sgLookup);
  end
  else if Key in [VK_MULTIPLY,Ord('*')] then
  begin
    //IsStop := True;
  end;

end;

end.
