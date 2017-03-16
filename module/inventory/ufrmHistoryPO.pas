unit ufrmHistoryPO;

interface

uses
  Windows, Messages, SysUtils, DateUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, ufraFooter5Button,
  SUIImagePanel, SUIGroupBox, SUIRadioGroup, SUIButton, cbxbase, dblup1a,
  Mask, JvToolEdit, uConn, Grids, BaseGrid, AdvGrid, ufrmSearchSupplier;

type
  TfrmHistoryPO = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    pnlTop: TPanel;
    pnlMain: TPanel;
    schckgrpStatusPO: TsuiCheckGroup;
    lbl1: TLabel;
    dtTglFrom: TJvDateEdit;
    dtTglTo: TJvDateEdit;
    lbl2: TLabel;
    lbl3: TLabel;
    cbpMerchandise: TColumnComboBox;
    lbl4: TLabel;
    edtSupplierCode: TEdit;
    edtSuplierName: TEdit;
    btnShow: TsuiButton;
    strgGrid: TAdvStringGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure btnShowClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtSupplierCodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridGetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
    procedure strgGridDblClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure FormDeactivate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnShowEnter(Sender: TObject);
    procedure btnShowExit(Sender: TObject);
  private
    function GetListMerchandiseByUnitId(): TResultDataSet;
    function GetListStatusPOByUnitId(): TResultDataSet;
    function GetSuplierNameByCode(ACode: string): string;
    function GetListPO(AStatusPO: string): TResultDataSet;
    procedure ParseComboMerchandise();
    procedure ParseListStatusPO();
    procedure ParseDataPO(AStatusPO: string);
  public
    { Public declarations }
  end;

var
  frmHistoryPO: TfrmHistoryPO;

implementation

uses suithemes, uGTSUICommonDlg, uConstanta, uHistoryPO,
      ufrmDisplayPO;

{$R *.dfm}

procedure TfrmHistoryPO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmHistoryPO.FormDestroy(Sender: TObject);
begin
  inherited;
  frmHistoryPO := nil;
end;

procedure TfrmHistoryPO.btnShowClick(Sender: TObject);
var i: Integer;
    strTemp: string;
begin
  inherited;
  strTemp := '';

  for i := 0 to schckgrpStatusPO.Items.Count - 1 do
  begin
    if schckgrpStatusPO.Checked[i] then
      strTemp := strTemp + QuotedStr(schckgrpStatusPO.Items.Strings[i]) + ',';
  end;
  strTemp := Copy(strTemp, 0, Length(strTemp) - 1);
  strTemp := '(' + strTemp + ')';

  ParseDataPO(strTemp);
end;

function TfrmHistoryPO.GetListMerchandiseByUnitId: TResultDataSet;
var arrParam: TArr;
begin
  SetLength(arrParam, 0);
  arrParam  := nil;

  if not Assigned(HistoryPO) then
    HistoryPO := THistoryPO.Create;

  Result := HistoryPO.GetListMerchandiseByUnitId(arrParam);
end;

function TfrmHistoryPO.GetListStatusPOByUnitId: TResultDataSet;
var arrParam: TArr;
begin
  SetLength(arrParam, 0);
  arrParam  := nil;

  if not Assigned(HistoryPO) then
    HistoryPO := THistoryPO.Create;

  Result := HistoryPO.GetListStatusPOByUnitId(arrParam);
end;

function TfrmHistoryPO.GetSuplierNameByCode(ACode: string): string;
var arrParam: TArr;
    temResult: TResultDataSet;
begin
  SetLength(arrParam, 1);
  arrParam[0].tipe := ptString;
  arrParam[0].data := ACode;


  if not Assigned(HistoryPO) then
    HistoryPO := THistoryPO.Create;

  temResult := HistoryPO.GetSuplierNameByCode(arrParam);
  Result := temResult.FieldByName('SUP_NAME').AsString;
end;

procedure TfrmHistoryPO.ParseComboMerchandise;
var dataMerchandise: TResultDataSet;
begin
  dataMerchandise := GetListMerchandiseByUnitId;

  with cbpMerchandise do
  begin
    ClearGridData;

    if not dataMerchandise.IsEmpty then
    begin
      RowCount := dataMerchandise.RecordCount + 2;
      AddRow(['ID', 'CODE', 'NAME']);
      AddRow(['0', 'ALL', 'ALL']);

      while not dataMerchandise.Eof do
      begin
        AddRow([dataMerchandise.FieldByName('MERCHAN_ID').AsString,
          dataMerchandise.FieldByName('MERCHAN_CODE').AsString,
          dataMerchandise.FieldByName('MERCHAN_NAME').AsString]);

        dataMerchandise.Next;
      end;  
    end
    else
    begin
      RowCount := 2;
      AddRow(['ID', 'CODE', 'NAME']);
      AddRow(['0', 'ALL', 'ALL']);
    end;

    FixedRows := 1;
    SizeGridToData;
    Value := Cells[1, 1];
    DoSearch;
  end;
end;

procedure TfrmHistoryPO.ParseListStatusPO;
var dataStatusPO: TResultDataSet;
    i: Integer;
begin
  dataStatusPO := GetListStatusPOByUnitId;

  with schckgrpStatusPO do
  begin
    Items.Clear;

    if not dataStatusPO.IsEmpty then
    begin
      Columns := dataStatusPO.RecordCount;
      i := 0;

      while not dataStatusPO.Eof do
      begin
        Items.Insert(i, dataStatusPO.fieldbyname('STAPO_NAME').AsString);
        
        Inc(i);
        dataStatusPO.Next;
      end;   
    end;  
  end;  
end;

procedure TfrmHistoryPO.FormShow(Sender: TObject);
begin
  inherited;
  ParseComboMerchandise;
  ParseListStatusPO;
  dtTglFrom.Date := Date;
  dtTglTo.Date := Date;
end;

procedure TfrmHistoryPO.edtSupplierCodeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F5 then
  begin
    if not Assigned(frmDialogSearchSupplier) then
      frmDialogSearchSupplier := TfrmDialogSearchSupplier.Create(Application);
    frmDialogSearchSupplier.searchFor:= sfHistoryPO;
  //  frmDialogSearchSupplier.FormPengguna := fmHistoryPO;
    SetFormPropertyAndShowDialog(frmDialogSearchSupplier);

    if frmDialogSearchSupplier.IsProcessSuccessfull then
    begin
      edtSupplierCode.Text := frmDialogSearchSupplier.SupplierCode;
    end;

    frmDialogSearchSupplier.Free;
  end;

  if Key = VK_RETURN then
    edtSuplierName.Text := GetSuplierNameByCode(edtSupplierCode.Text);
end;

procedure TfrmHistoryPO.strgGridGetFloatFormat(Sender: TObject; ACol,
  ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  inherited;
  FloatFormat := '%.2n';
  if ACol in [5] then
    IsFloat := True
  else
    IsFloat := False;
end;

function TfrmHistoryPO.GetListPO(AStatusPO: string): TResultDataSet;
var arrParam: TArr;
begin
  if not Assigned(HistoryPO) then
    HistoryPO := THistoryPO.Create;

  if (cbpMerchandise.Text = 'ALL') and (edtSupplierCode.Text = '') then
  begin
    SetLength(arrParam, 3);
    arrParam[0].tipe := ptDateTime;
    arrParam[0].data := dtTglFrom.Date;
    arrParam[1].tipe := ptDateTime;
    arrParam[1].data := IncDay(dtTglTo.Date);
    arrParam[2].tipe := ptInteger;
    arrParam[2].data := MasterNewUnit.ID;

    HistoryPO.StatusPO := AStatusPO;
    Result := HistoryPO.GetListPOByPeriode(arrParam);
  end
  else if (cbpMerchandise.Text <> 'ALL') and (edtSupplierCode.Text = '') then
  begin
    SetLength(arrParam, 4);
    arrParam[0].tipe := ptDateTime;
    arrParam[0].data := dtTglFrom.Date;
    arrParam[1].tipe := ptDateTime;
    arrParam[1].data := IncDay(dtTglTo.Date);
    arrParam[2].tipe := ptInteger;
    arrParam[2].data := MasterNewUnit.ID;
    arrParam[3].tipe := ptString;
    arrParam[3].data := cbpMerchandise.Cells[0, cbpMerchandise.Row];

    HistoryPO.StatusPO := AStatusPO;
    Result := HistoryPO.GetListPOByPeriodeAndMerchand(arrParam);
  end
  else if (cbpMerchandise.Text = 'ALL') and (edtSupplierCode.Text <> '') then
  begin
    SetLength(arrParam, 4);
    arrParam[0].tipe := ptDateTime;
    arrParam[0].data := dtTglFrom.Date;
    arrParam[1].tipe := ptDateTime;
    arrParam[1].data := IncDay(dtTglTo.Date);
    arrParam[2].tipe := ptInteger;
    arrParam[2].data := MasterNewUnit.ID;
    arrParam[3].tipe := ptString;
    arrParam[3].data := edtSupplierCode.Text;

    HistoryPO.StatusPO := AStatusPO;
    Result := HistoryPO.GetListPOByPeriodeAndSuplierCode(arrParam);
  end
  else
  begin
    SetLength(arrParam, 5);
    arrParam[0].tipe := ptDateTime;
    arrParam[0].data := dtTglFrom.Date;
    arrParam[1].tipe := ptDateTime;
    arrParam[1].data := IncDay(dtTglTo.Date);
    arrParam[2].tipe := ptInteger;
    arrParam[2].data := MasterNewUnit.ID;
    arrParam[3].tipe := ptString;
    arrParam[3].data := edtSupplierCode.Text;
    arrParam[4].tipe := ptString;
    arrParam[4].data := cbpMerchandise.Cells[0, cbpMerchandise.Row];

    HistoryPO.StatusPO := AStatusPO;
    Result := HistoryPO.GetListPOByPeriodeMerchanAndAsuplierCode(arrParam);
  end;
end;

procedure TfrmHistoryPO.ParseDataPO(AStatusPO: string);
var dataPO: TResultDataSet;
    i: Integer;
begin
  dataPO := GetListPO(AStatusPO);

  with strgGrid do
  begin
    if not dataPO.IsEmpty then
    begin
      RowCount := dataPO.RecordCount + 1;
      i := 1;

      while not dataPO.Eof do
      begin
        Cells[0, i] := dataPO.fieldbyname('PO_NO').AsString;
        Cells[1, i] := DateToStr(dataPO.fieldbyname('PO_DATE').AsDateTime);
        Cells[2, i] := DateToStr(dataPO.fieldbyname('DO_DATE').AsDateTime);
        Cells[3, i] := dataPO.fieldbyname('SUP_NAME').AsString;
        Cells[4, i] := dataPO.fieldbyname('MERCHAN_NAME').AsString;
        Cells[5, i] := CurrToStr(dataPO.fieldbyname('PO_TOTAL').AsCurrency);
        Alignments[5, i] := taRightJustify;
        Cells[6, i] := dataPO.fieldbyname('STAPO_NAME').AsString;

        Inc(i);
        dataPO.Next;
      end;
    end
    else
    begin
      RowCount := 2;
      Cells[0, 1] := '';
      Cells[1, 1] := '';
      Cells[2, 1] := '';
      Cells[3, 1] := '';
      Cells[4, 1] := '';
      Cells[5, 1] := '0';
      Alignments[5, 1] := taRightJustify;
      Cells[6, 1] := '';
    end;

    FixedRows := 1;
    AutoSize := True;
    ColWidths[5] := 150;
  end;
end;

procedure TfrmHistoryPO.strgGridDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
//var
//  Key: Char;
//  st: string;
begin
  inherited;
//  if not Assigned(frmDisplayPO) then
//    frmDisplayPO := TfrmDisplayPO.Create(Self);
//
//  Key := #13;
//
//  st := strgGrid.Cells[0, strgGrid.Row];
//  frmDisplayPO.edtPONo.Text := st;
//  frmDisplayPO.edtPONoKeyPress(Self, Key);
//  frmDisplayPO.Modul:= mHistoryPO;
//  frmDisplayPO.Show;
end;

procedure TfrmHistoryPO.FormDeactivate(Sender: TObject);
begin
  inherited;
//
end;

procedure TfrmHistoryPO.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  IF (Key = VK_ESCAPE) then
    Close;
end;

procedure TfrmHistoryPO.btnShowEnter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmHistoryPO.btnShowExit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

end.

