unit ufrmGudang;

interface
 
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, System.Actions, Vcl.ActnList, cxClasses,
  ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel, cxGridLevel, cxGridCustomView, cxGrid;

type
  TfrmGudang = class(TfrmMasterBrowse)
    pnl1: TPanel;
    lbl2: TLabel;
    edtUnitID: TEdit;
    edtUnitNm: TEdit;
    Label6: TLabel;
    cxGridViewColumn1: TcxGridDBColumn;
    cxGridViewColumn2: TcxGridDBColumn;
    cxGridViewColumn3: TcxGridDBColumn;
    cxGridViewColumn4: TcxGridDBColumn;
    cxGridViewColumn5: TcxGridDBColumn;
    cxGridViewColumn6: TcxGridDBColumn;
    cxGridViewColumn7: TcxGridDBColumn;
    cxGridViewColumn8: TcxGridDBColumn;
    cxGridViewColumn9: TcxGridDBColumn;
    cxGridViewColumn10: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fraFooter5Button1btnAddClick(Sender: TObject);
    procedure fraFooter5Button1btnRefreshClick(Sender: TObject);
    procedure fraFooter5Button1btnUpdateClick(Sender: TObject);
    procedure fraFooter5Button1btnDeleteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    FUnitID     : Integer;
    FUnitIDChs  : Integer;
    FUserID     : Integer;
//    FGudang     : TGudang;
    { Private declarations }
    procedure LookUpData(Sender: TObject);
    procedure ParseHeader;
  public
    procedure ShowWithID(aUnit: Integer; aUserID: integer);
    { Public declarations }
  end;

var
  frmGudang: TfrmGudang;

implementation
uses uRetnoUnit, ufrmDialogGudang;


{$R *.dfm}
const
  _kolNO      : Integer = 0;
  _kolKode    : Integer = 1;
  _kolNm      : Integer = 2;
  _kolAdrss   : Integer = 3;
  _kolTlp     : Integer = 4;
  _kolFax     : Integer = 5;
  _kolCity    : Integer = 6;
  _kolZip     : Integer = 7;
  _kolContact : Integer = 8;
  _kolId      : Integer = 9;
  _kolUnitID  : Integer = 10;

  _fixedRow   : Integer = 1;
  _rowCount   : Integer = 2;
  _colCount   : Integer = 9;



procedure TfrmGudang.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'GUDANG';

end;

procedure TfrmGudang.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F5)  and (not (ssCtrl in Shift)) then
  begin
    LookUpData(ActiveControl);
  end;
end;

procedure TfrmGudang.LookUpData(Sender: TObject);
var
  aNm   : string;
  aCode : string;
  aFid  : string;
  sSQL  : string;
begin
  if Sender = edtUnitID then
  begin
      sSQL := 'select a.UNT_ID, UNT_CODE, a.UNT_NAME, a.UNT_DESCRIPTION'
        + ' from AUT$UNIT a';

//    GetDataIdNm('Unit', sSQL, aFid, aCode, aNm);

    if aFid = '' then
      FUnitIDChs  := 0
    else
      FUnitIDChs  := StrToInt(aFid);

    edtUnitID.Text  := aCode;
    edtUnitNm.Text  := aNm;

    ParseHeader;
  end
end;

procedure TfrmGudang.ParseHeader;
begin
  {with strgGrid do
  begin
    clear;
    RowCount  := _rowCount;
    FixedRows := _fixedRow;
    ColCount  := _colCount;

    Cells[_kolNO, 0]      := 'NO';
    Cells[_kolKode, 0]    := 'CODE';
    Cells[_kolNm, 0]      := 'NAME';
    Cells[_kolAdrss, 0]   := 'ADDRESS';
    Cells[_kolTlp, 0]     := 'TLP';
    Cells[_kolFax, 0]     := 'FAX';
    Cells[_kolCity, 0]    := 'CITY';
    Cells[_kolZip, 0]     := 'ZIP';
    Cells[_kolContact, 0] := 'CONTACT PERSON';

    AutoSize  := True;

  end;
    }
end;

procedure TfrmGudang.ShowWithID(aUnit: Integer; aUserID: integer);
begin
  FUnitID := aUnit;
  FUserID := aUserID;
//  FGudang := TGudang.Create(nil);

  Self.Show;
end;

procedure TfrmGudang.fraFooter5Button1btnAddClick(Sender: TObject);
begin
  inherited;

  if not Assigned(frmDialogGudang) then
    frmDialogGudang := TfrmDialogGudang.Create(Application);

  frmDialogGudang.ShowWithID(FUnitID, FUserID);
end;

procedure TfrmGudang.fraFooter5Button1btnRefreshClick(Sender: TObject);
var
  n   : Integer;
  i   : Integer;
  sSQL: string;
begin
  inherited;
  ParseHeader;
  {
  sSQL  := GetSQLGudang(FUnitIDChs);
  with cOpenQuery(sSQL) do
  begin
    try
      i := 0;
      while not Eof do
      begin
        if i > 0 then
          strgGrid.AddRow;

        n := i + _fixedRow;
        strgGrid.Cells[_kolNO, n]       := IntToStr(i + 1);
        strgGrid.Cells[_kolKode, n]     := FieldByName('GUD_CODE').AsString;
        strgGrid.Cells[_kolNm, n]       := FieldByName('GUD_NAME').AsString;
        strgGrid.Cells[_kolAdrss, n]    := FieldByName('GUD_ADDRESS').AsString;
        strgGrid.Cells[_kolTlp, n]      := FieldByName('GUD_TELP').AsString;
        strgGrid.Cells[_kolFax, n]      := FieldByName('GUD_FAX').AsString;
        strgGrid.Cells[_kolCity, n]     := FieldByName('GUD_CITY').AsString;
        strgGrid.Cells[_kolZip, n]      := FieldByName('GUD_POST_CODE').AsString;
        strgGrid.Cells[_kolContact, n]  := FieldByName('GUD_CONTACT_PERSON').AsString;
        strgGrid.Cells[_kolId, n]       := FieldByName('GUD_ID').AsString;
        strgGrid.Cells[_kolUnitID, n]   := FieldByName('GUD_UNT_ID').AsString;

        Inc(i);
        Next;
      end;
      strgGrid.AutoSize  := True;
    finally
      free;
    end;
  end; }
end;

procedure TfrmGudang.fraFooter5Button1btnUpdateClick(Sender: TObject);
var
  aIdUnt: Integer;
  aId   : Integer;
begin
  inherited;
  if Trim(edtUnitNm.Text) ='' then
    exit;

  if not Assigned(frmDialogGudang) then
    frmDialogGudang := TfrmDialogGudang.Create(Application);

//  aId     := strgGrid.Ints[_kolId, strgGrid.Row];
//  aIdUnt  := strgGrid.Ints[_kolUnitID, strgGrid.Row];
  frmDialogGudang.ShowWithID(FUnitID, FUserID, aId, aIdUnt);
end;

procedure TfrmGudang.fraFooter5Button1btnDeleteClick(Sender: TObject);
var
  aUnitID : Integer;
  aCode   : string;
  aID     : Integer;
begin
  inherited;
//  aID     := strgGrid.Ints[_kolId, strgGrid.Row];
//  aUnitID := strgGrid.Ints[_kolUnitID, strgGrid.Row];
//  aCode   := strgGrid.Cells[_kolKode, strgGrid.Row];
//
//  if DeleteData( aID, aUnitID, FGudang, aCode) then
//    fraFooter5Button1btnRefreshClick(Self);

end;

procedure TfrmGudang.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action  := caFree;
end;

procedure TfrmGudang.FormDestroy(Sender: TObject);
begin
  inherited;
//  FreeAndNil(FGudang);
  frmGudang := nil;
end;

end.
