unit ufrmSalesReportContrabon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, ufraFooter5Button, Mask,
  JvToolEdit, cbxbase, dblup1a, Grids, BaseGrid, AdvGrid, uConn, JclStrings,
  SUIButton, EditBtn, AdvCGrid, udmReportNew, AdvObj, JvExMask,
  uADStanIntf, uADStanOption, uADStanParam, uADStanError, uADDatSManager,
  uADPhysIntf, uADDAptIntf, uADStanAsync, uADDAptManager, DB, uADCompDataSet,
  FireDAC.Comp.Client;


type
  TfrmSalesReportContrabon = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    pnlTop: TPanel;
    lbl1: TLabel;
    dtTglFrom: TJvDateEdit;
    lbl2: TLabel;
    dtTglTo: TJvDateEdit;
    lbl3: TLabel;
    edtsuplierNameFrom: TEdit;
    lbl4: TLabel;
    lbl5: TLabel;
    edtSuplierNamaTo: TEdit;
    pnlMiddle: TPanel;
    btnView: TsuiButton;
    edKodeSupplier1: TEditBtn;
    edKodeSupplier2: TEditBtn;
    spl1: TSplitter;
    sgData: TAdvColumnGrid;
    sgDataDetail: TAdvColumnGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
//    procedure cbpSuplierCodeFromKeyUp(Sender: TObject; var Key: Word;
//      Shift: TShiftState);
//    procedure cbpSuplierCodeToKeyUp(Sender: TObject; var Key: Word;
//      Shift: TShiftState);
//    procedure cbpSuplierCodeToKeyPress(Sender: TObject; var Key: Char);
//    procedure cbpSuplierCodeFromKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure dtTglFromKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtTglToKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnViewClick(Sender: TObject);
    procedure sgDataDetailListSuplierRowChanging(Sender: TObject; OldRow,
      NewRow: Integer; var Allow: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure fraFooter5Button1btnAddClick(Sender: TObject);
    procedure fraFooter5Button1btnUpdateClick(Sender: TObject);
    procedure btnViewEnter(Sender: TObject);
    procedure btnViewExit(Sender: TObject);
    procedure edKodeSupplier1ClickBtn(Sender: TObject);
    procedure edKodeSupplier2ClickBtn(Sender: TObject);
    procedure sgDataCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure sgDataGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure sgDataGetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
    procedure sgDataRowChanging(Sender: TObject; OldRow, NewRow: Integer;
      var Allow: Boolean);
    procedure sgDataClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure sgDataDetailCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure sgDataDetailGetAlignment(Sender: TObject; ARow,
      ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure sgDataDetailGetFloatFormat(Sender: TObject; ACol,
      ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
  private
    FListParam: TStringList;
//    FRekapDataset: TResultDataSet;
    //function GetListSuplierByCode(ACode: string): TResultDataSet;
    //function GetListSalesContrabonByDateAndSuplierCode(ADate1, ADate2: TDateTime; ASupCode1, ASupCode2: string): TResultDataSet;
    //function GetListSalesContrabondetilBySupCode(ASupCode: string): TResultDataSet;
    function GetSQLContrabonKring(aTglAwal : TDateTime; aTglAkhir : TDateTime;
        aUnitID : Integer): string;
    function GetSQLDetail(aTglAwal, aTglAkhir: TDateTime; aUnitID: Integer;
        aKodeSupplier: String): string;
    function GetSQLTransaksiCOntrabonPOS(aTglAwal : TDateTime; aTglAkhir :
        TDateTime; aUnitID : Integer): string;
    procedure MoveDataFromQtoGrid(aQ: TFDQuery);
//    function GetListSalesContrabonDetilByDateAndSupCode(ADate1, ADate2: TDateTime; ASupCode1, ASupCode2: string): TResultDataSet;
//    procedure ParseComboSuplierFrom;
//    procedure ParseComboSuplierTo;
//    procedure ParseDataSalesContrabon;
//    procedure ParseDataSalesContrabonDetilBySupCode(ACode: string);
    procedure SetListParam(const Value: TStringList);
  public
    procedure AturLebarKolomSgData;
    function GetBarisBKodeSupplier(aKodeSupplier : String): Integer;
    function GetBarisByKodeBrg(aKodeBrg : String): Integer;
    procedure LoadDataPenjualanContrabon;
    procedure LoadDataPenjualanContrabonDetail(aTglAwal : TDateTime; aTglAkhir :
        TDateTime;  aUnitID : Integer; aKodeSupplier : String);
    procedure LoadDataPenjualanContrabonKring;
    procedure LoadDataPenjualanContrabonPOS;
    procedure LoadDataSupplier(aSender : TEditBtn; aKode : String; aUnitID :
        Integer);
    property ListParam: TStringList read FListParam write SetListParam;
  end;

var
  frmSalesReportContrabon: TfrmSalesReportContrabon;

implementation

uses suithemes, uGTSUICommonDlg, uConstanta, uReportSalesContrabon,
  udmReport, ufrmDialogPrintPreview, uNewSupplier, uRMSUnit, dateutils;

const
  _KolKodeSupplier    : Integer = 1;
  _KolNamaSupplier    : Integer = 2;
  _KolGrosssales      : Integer = 3;
  _KolDiskonPenjualan : Integer = 4;
  _KolPPN             : Integer = 5;
  _KolDiskonAMC       : Integer = 6;
  _KolTotal           : Integer = 7;

  _DKolBRGCode        : Integer = 1;
  _DKolUOM            : Integer = 2;
  _DKolQty            : Integer = 3;
  _DKolHarga          : Integer = 4;
  _DKolDiskon         : Integer = 5;
  _DKolPPNPersen      : Integer = 6;
  _DKolTotalGrossSales: Integer = 7;
  _DKolTotalDisc      : Integer = 8;
  _DKolTotalPPN       : Integer = 9;
  _DKolTotalAMC       : Integer = 10;
  _DKolTotal          : Integer = 11;

{$R *.dfm}

procedure TfrmSalesReportContrabon.AturLebarKolomSgData;
begin
  with sgData do
  begin
    AutoSizeColumns(True, 5);
    Columns[_KolGrosssales].Width       := 100;
    Columns[_KolDiskonPenjualan].Width  := 90;
    Columns[_KolPPN].Width              := 90;
    Columns[_KolDiskonAMC].Width        := 90;
    Columns[_KolTotal].Width            := 100;
  end;
end;

procedure TfrmSalesReportContrabon.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmSalesReportContrabon.FormDestroy(Sender: TObject);
begin
  inherited;
  frmSalesReportContrabon := nil;
  frmSalesReportContrabon.Free;
end;

{function TfrmSalesReportContrabon.GetListSuplierByCode(
  ACode: string): TResultDataSet;
var arrParam: TArr;
begin
  if ACode = '' then
  begin
    SetLength(arrParam, 1);
    arrParam[0].tipe := ptString;
    arrParam[0].data := 'A%';
  end
  else
  begin
    SetLength(arrParam, 1);
    arrParam[0].tipe := ptString;
    arrParam[0].data := ACode + '%';
  end;

  if not Assigned(ReportSalesContrabon) then
    ReportSalesContrabon := TReportSalesContrabon.Create;

  Result := ReportSalesContrabon.GetListSuplierByCode(arrParam);
end;
}

//procedure TfrmSalesReportContrabon.ParseComboSuplierFrom;
//var dataSuplier: TResultDataSet;
//    i: Integer;
//begin
//  dataSuplier := GetListSuplierByCode(cbpSuplierCodeFrom.Text);
//
//  with cbpSuplierCodeFrom do
//  begin
//    ClearGridData;
//    if not dataSuplier.IsEmpty then
//    begin
//      RowCount := dataSuplier.RecordCount + 1;
//      AddRow(['Id', 'Suplier Code', 'Suplier Name']);
//
//      i := 1;
//      while not dataSuplier.Eof do
//      begin
//        AddRow([IntToStr(i),
//          dataSuplier.FieldByName('SUP_CODE').AsString,
//          dataSuplier.FieldByName('SUP_NAME').AsString]);
//
//        Inc(i);
//        dataSuplier.Next;
//      end;
//    end
//    else
//    begin
//      RowCount := 2;
//      AddRow(['Id', 'Suplier Code', 'Suplier Name']);
//      AddRow(['1', ' ', ' ']);
//    end;
//
//    FixedRows := 1;
//    SizeGridToData;
//    Text := Value;
//  end;
//end;
//
//procedure TfrmSalesReportContrabon.ParseComboSuplierTo;
//var dataSuplier: TResultDataSet;
//    i: Integer;
//begin
//  dataSuplier := GetListSuplierByCode(cbpSuplierCodeTo.Text);
//
//  with cbpSuplierCodeTo do
//  begin
//    ClearGridData;
//    if not dataSuplier.IsEmpty then
//    begin
//      RowCount := dataSuplier.RecordCount + 1;
//      AddRow(['Id', 'Suplier Code', 'Suplier Name']);
//
//      i := 1;
//      while not dataSuplier.Eof do
//      begin
//        AddRow([IntToStr(i),
//          dataSuplier.FieldByName('SUP_CODE').AsString,
//          dataSuplier.FieldByName('SUP_NAME').AsString]);
//
//        Inc(i);
//        dataSuplier.Next;
//      end;
//    end
//    else
//    begin
//      RowCount := 2;
//      AddRow(['Id', 'Suplier Code', 'Suplier Name']);
//      AddRow(['1', ' ', ' ']);
//    end;
//
//    FixedRows := 1;
//    SizeGridToData;
//    Text := Value;
//  end;
//end;

//procedure TfrmSalesReportContrabon.cbpSuplierCodeFromKeyUp(Sender: TObject;
//  var Key: Word; Shift: TShiftState);
//begin
//  inherited;
//  if (StrLength(cbpSuplierCodeFrom.Value) = 1) then
//    ParseComboSuplierFrom;
//
//  if (Key = VK_RETURN) then
//  begin
//    edtsuplierNameFrom.Text := cbpSuplierCodeFrom.Cells[2, cbpSuplierCodeFrom.Row];
//    cbpSuplierCodeTo.SetFocus;
//  end;
//end;
//
//procedure TfrmSalesReportContrabon.cbpSuplierCodeToKeyUp(Sender: TObject;
//  var Key: Word; Shift: TShiftState);
//begin
//  inherited;
//  if (StrLength(cbpSuplierCodeTo.Value) = 1) then
//    ParseComboSuplierTo;
//
//  if (Key = VK_RETURN) then
//  begin
//    edtSuplierCodeTo.Text := cbpSuplierCodeTo.Cells[2, cbpSuplierCodeTo.Row];
//    btnView.SetFocus;
//  end;
//end;

//procedure TfrmSalesReportContrabon.cbpSuplierCodeToKeyPress(
//  Sender: TObject; var Key: Char);
//begin
//  inherited;
//  Key := UpCase(Key);
//end;

//procedure TfrmSalesReportContrabon.cbpSuplierCodeFromKeyPress(
//  Sender: TObject; var Key: Char);
//begin
//  inherited;
//  Key := UpCase(Key);
//end;

procedure TfrmSalesReportContrabon.FormShow(Sender: TObject);
begin
  inherited;
  fraFooter5Button1.btnAdd.Enabled := True;
  fraFooter5Button1.btnUpdate.Enabled := True;
  
  cClearGrid(sgData, False);
  edtsuplierNameFrom.Text := '';
  edtSuplierNamaTo.Text   := '';

  edKodeSupplier1.Text := '';
  edKodeSupplier2.Text := '';

  dtTglFrom.Date := StartOfTheMonth(cGetServerTime);
  dtTglTo.Date   := EndOfTheMonth(dtTglFrom.Date);
  dtTglFrom.SetFocus;
end;

procedure TfrmSalesReportContrabon.dtTglFromKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
    dtTglTo.SetFocus;
end;

procedure TfrmSalesReportContrabon.dtTglToKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
//  if (Key = VK_RETURN) then
//    cbpSuplierCodeFrom.SetFocus;
end;

{
function TfrmSalesReportContrabon.GetListSalesContrabonByDateAndSuplierCode(
  ADate1, ADate2: TDateTime; ASupCode1, ASupCode2: string): TResultDataSet;
var arrParam: TArr;
begin
  SetLength(arrParam, 5);
  arrParam[0].tipe := ptString;
  arrParam[0].data := ASupCode1;
  arrParam[1].tipe := ptString;
  arrParam[1].data := ASupCode2;
  arrParam[2].tipe := ptDateTime;
  arrParam[2].data := ADate1;
  arrParam[3].tipe := ptDateTime;
  arrParam[3].data := ADate2;
  arrParam[4].tipe := ptInteger;
  arrParam[4].data := MasterNewUnit.ID;

  if not Assigned(ReportSalesContrabon) then
    ReportSalesContrabon := TReportSalesContrabon.Create;

  Result := ReportSalesContrabon.GetListSalesReportOfContrabonByDateAndSupCode(arrParam);
end;
}
//procedure TfrmSalesReportContrabon.ParseDataSalesContrabon;
//var dataSalesContrabon: TResultDataSet;
//    i: Integer;
//begin
//  dataSalesContrabon := GetListSalesContrabonByDateAndSuplierCode(dtTglFrom.Date, dtTglTo.Date, cbpSuplierCodeFrom.Text, cbpSuplierCodeTo.Text);
//
//  with sgDataDetailListSuplier do
//  begin
//    if not dataSalesContrabon.IsEmpty then
//    begin
//      RowCount := dataSalesContrabon.RecordCount + 1;
//
//      i := 1;
//      while not dataSalesContrabon.Eof do
//      begin
//        Cells[0, i] := dataSalesContrabon.FieldByName('SUP_CODE').AsString;
//        Cells[1, i] := dataSalesContrabon.FieldByName('SUP_NAME').AsString;
//        Cells[2, i] := dataSalesContrabon.FieldByName('AMOUNT').AsString;
//        Cells[3, i] := dataSalesContrabon.FieldByName('AMOUNT_DISC').AsString;
//        Cells[4, i] := dataSalesContrabon.FieldByName('TAX_AMOUNT').AsString;
//        Cells[5, i] := dataSalesContrabon.FieldByName('NET_SALES').AsString;
//        Cells[6, i] := dataSalesContrabon.FieldByName('TOTAL_SALES').AsString;
//
//        Inc(i);
//        dataSalesContrabon.Next;
//      end;
//    end
//    else
//    begin
//      RowCount := 2;
//      Cells[0, 1] := '';
//      Cells[1, 1] := '';
//      Cells[2, 1] := '';
//      Cells[3, 1] := '';
//      Cells[4, 1] := '';
//      Cells[5, 1] := '';
//      Cells[6, 1] := '';
//    end;
//
//    AutoSize := True;
//    FixedRows := 1;
//  end;
//end;

procedure TfrmSalesReportContrabon.btnViewClick(Sender: TObject);
begin
  inherited;
//  if (dtTglFrom.Text <> '  /  /    ') and
//     (dtTglTo.Text <> '  /  /    ') and
//     (cbpSuplierCodeFrom.Text <> '') and
//     (cbpSuplierCodeTo.Text <> '') then
//  begin
////    ParseDataSalesContrabon;
//    fraFooter5Button1.btnAdd.Enabled := True;
//    fraFooter5Button1.btnUpdate.Enabled := True;
////    ParseDataSalesContrabonDetilBySupCode(sgDataDetailListSuplier.Cells[0, 1]);
//  end
//  else
//    CommonDlg.ShowError('Date From, Date To, Suplier From, and Suplier To ' + ER_EMPTY);
  LoadDataPenjualanContrabon;


end;

{
function TfrmSalesReportContrabon.GetListSalesContrabondetilBySupCode(
  ASupCode: string): TResultDataSet;
var arrParam: TArr;
begin
  if ASupCode = '' then
    SetLength(arrParam, 0)
  else
  begin
    SetLength(arrParam, 2);
    arrParam[0].tipe := ptString;
    arrParam[0].data := ASupCode;
    arrParam[1].tipe := ptInteger;
    arrParam[1].data := MasterNewUnit.ID;
  end;

  if not Assigned(ReportSalesContrabon) then
    ReportSalesContrabon := TReportSalesContrabon.Create;

  Result := ReportSalesContrabon.GetListSalesReportContrabonDetilBySupCode(arrParam);
end;
}

//procedure TfrmSalesReportContrabon.ParseDataSalesContrabonDetilBySupCode(
//  ACode: string);
//var dataSalesContrabonDetil: TResultDataSet;
//    i: Integer;
//begin
//  dataSalesContrabonDetil := GetListSalesContrabondetilBySupCode(ACode);
//
//  with sgDataDetail do
//  begin
//    if not dataSalesContrabonDetil.IsEmpty then
//    begin
//      RowCount := dataSalesContrabonDetil.RecordCount + 1;
//
//      i := 1;
//      while not dataSalesContrabonDetil.Eof do
//      begin
//        Cells[0, i] := dataSalesContrabonDetil.FieldByName('BRG_CODE').AsString;
//        Cells[1, i] := dataSalesContrabonDetil.FieldByName('BRG_NAME').AsString;
//        Cells[2, i] := dataSalesContrabonDetil.FieldByName('UOM').AsString;
//        Cells[3, i] := dataSalesContrabonDetil.FieldByName('QTY').AsString;
//        Cells[4, i] := dataSalesContrabonDetil.FieldByName('UNIT_PRICE').AsString;
//        Cells[5, i] := dataSalesContrabonDetil.FieldByName('GROSS_SALES').AsString;
//        Cells[6, i] := dataSalesContrabonDetil.FieldByName('AMOUNT_DISC').AsString;
//        Cells[7, i] := dataSalesContrabonDetil.FieldByName('TAX_AMOUNT').AsString;
//        Cells[8, i] := dataSalesContrabonDetil.FieldByName('NET_SALES').AsString;
//        Cells[9, i] := dataSalesContrabonDetil.FieldByName('TOTAL_SALES').AsString;
//
//        Inc(i);
//        dataSalesContrabonDetil.Next;
//      end;
//    end
//    else
//    begin
//      RowCount := 2;
//      Cells[0, 1] := '';
//      Cells[1, 1] := '';
//      Cells[2, 1] := '';
//      Cells[3, 1] := '';
//      Cells[4, 1] := '';
//      Cells[5, 1] := '';
//      Cells[6, 1] := '';
//      Cells[7, 1] := '';
//      Cells[8, 1] := '';
//      Cells[9, 1] := '';
//    end;
//
//    AutoSize := True;
//    FixedRows := 1;
//  end;
//end;

procedure TfrmSalesReportContrabon.sgDataDetailListSuplierRowChanging(
  Sender: TObject; OldRow, NewRow: Integer; var Allow: Boolean);
begin
  inherited;
//  ParseDataSalesContrabonDetilBySupCode(sgDataDetailListSuplier.Cells[0, NewRow]);
end;

procedure TfrmSalesReportContrabon.SetListParam(const Value: TStringList);
begin
  FListParam := Value;
end;

procedure TfrmSalesReportContrabon.FormCreate(Sender: TObject);
begin
  inherited;
  ListParam := TStringList.Create;
end;

procedure TfrmSalesReportContrabon.fraFooter5Button1btnAddClick(
  Sender: TObject);
var
  sSQL: string;
begin
  inherited;
  sSQL := GetSQLDetail(dtTglFrom.Date,dtTglTo.Date, MasterNewUnit.ID,'');
  dmReportNew.EksekusiReport('SalesReportContrabonRekap',sSQL,'',True);
end;

{function TfrmSalesReportContrabon.GetListSalesContrabonDetilByDateAndSupCode(
  ADate1, ADate2: TDateTime; ASupCode1, ASupCode2: string): TResultDataSet;
var arrParam: TArr;
begin
  SetLength(arrParam, 5);
  arrParam[0].tipe := ptString;
  arrParam[0].data := ASupCode1;
  arrParam[1].tipe := ptString;
  arrParam[1].data := ASupCode2;
  arrParam[2].tipe := ptDateTime;
  arrParam[2].data := ADate1;
  arrParam[3].tipe := ptDateTime;
  arrParam[3].data := ADate2;
  arrParam[4].tipe := ptInteger;
  arrParam[4].data := MasterNewUnit.ID;

  if not Assigned(ReportSalesContrabon) then
    ReportSalesContrabon := TReportSalesContrabon.Create;

  Result := ReportSalesContrabon.GetListSalesReportContrabonDetilByDateAndSupCode(arrParam);
end;
}

procedure TfrmSalesReportContrabon.fraFooter5Button1btnUpdateClick(
  Sender: TObject);
var
  sSQL: string;
begin
  inherited;
  sSQL := GetSQLDetail(dtTglFrom.Date,dtTglTo.Date, MasterNewUnit.ID,'');
  dmReportNew.EksekusiReport('SalesReportContrabonDetail',sSQL,'',True);

  {ListParam.Clear;

  ListParam.Add(dtTglFrom.Text);
  ListParam.Add(dtTglTo.Text);
  ListParam.Add(cbpSuplierCodeFrom.Text);
  ListParam.Add(cbpSuplierCodeTo.Text);
  ListParam.Add(FLoginUsername);
  ListParam.Add(MasterNewUnit.Nama);

  if not Assigned(frmDialogPrintPreview) then
    frmDialogPrintPreview:= TfrmDialogPrintPreview.Create(Application);

  with frmDialogPrintPreview do
  begin
    ListParams:= ListParam;
    FilePath  := FFilePathReport + 'frCetakSalesContrabon.fr3';
//    RecordSet := GetListSalesContrabonDetilByDateAndSupCode(dtTglFrom.Date, dtTglTo.Date, cbpSuplierCodeFrom.Text, cbpSuplierCodeTo.Text);
    SetFormPropertyAndShowDialog(frmDialogPrintPreview)
  end;
  FreeAndNil(frmDialogPrintPreview);
  }
end;

procedure TfrmSalesReportContrabon.btnViewEnter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmSalesReportContrabon.btnViewExit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

procedure TfrmSalesReportContrabon.edKodeSupplier1ClickBtn(
  Sender: TObject);
var
  sSQL: string;
begin
  inherited;
  sSQL := 'select a.sup_code as Kode , a.sup_name as Nama'
          + ' from suplier a';

  with cLookUp('Daftar Supplier', sSQL) do
  begin
    try
      if Trim(Strings[0]) = '' then
        Exit;

      LoadDataSupplier(edKodeSupplier1, Strings[0], MasterNewUnit.ID);
    finally
      Free;
    end;
  end;

end;

procedure TfrmSalesReportContrabon.LoadDataSupplier(aSender : TEditBtn; aKode :
    String; aUnitID : Integer);
begin
  with TNewSupplier.Create(Application) do
  begin
    try
      if LoadByKode(aKode) then
      begin
        if aSender = edKodeSupplier1 then
        begin
          edKodeSupplier1.Text := Kode;
          edtsuplierNameFrom.Text := Nama;
        end else begin
          edKodeSupplier2.Text := Kode;
          edtSuplierNamaTo.Text := Nama;
        end;
      end else begin
        if aSender = edKodeSupplier1 then
        begin
          edKodeSupplier1.Text := '';
          edtsuplierNameFrom.Text := '';
        end else begin
          edKodeSupplier2.Text := '';
          edtSuplierNamaTo.Text := '';
        end;
      end;
    finally
      Free;
    end;
  end;
end;

procedure TfrmSalesReportContrabon.edKodeSupplier2ClickBtn(
  Sender: TObject);
var
  sSQL: string;
begin
  inherited;
  sSQL := 'select a.sup_code as Kode , a.sup_name as Nama'
          + ' from suplier a';

  with cLookUp('Daftar Supplier', sSQL) do
  begin
    try
      if Trim(Strings[0]) = '' then
        Exit;

      LoadDataSupplier(edKodeSupplier2, Strings[0], MasterNewUnit.ID);
    finally
      Free;
    end;
  end;

end;

function TfrmSalesReportContrabon.GetBarisBKodeSupplier(aKodeSupplier :
    String): Integer;
var
  i: Integer;
begin
  Result := 0;

  for i := 1 to sgData.RowCount - 1 do
  begin
    if aKodeSupplier = sgData.Cells[_KolKodeSupplier,i] then
    begin
      Result := i;
      Exit;
    end;
  end;

  if Result = 0 then
    Result := GetBarisKosong(sgData,_KolKodeSupplier);

end;

function TfrmSalesReportContrabon.GetBarisByKodeBrg(aKodeBrg : String): Integer;
var
  i: Integer;
begin
  Result := 0;

  for i := 1 to sgDataDetail.RowCount - 1 do
  begin
    if aKodeBrg = sgDataDetail.Cells[_DKolBRGCode,i] then
    begin
      Result := i;
      Exit;
    end;
  end;

  if Result = 0 then
    Result := GetBarisKosong(sgDataDetail,_KolKodeSupplier);

end;

function TfrmSalesReportContrabon.GetSQLContrabonKring(aTglAwal : TDateTime;
    aTglAkhir : TDateTime;  aUnitID : Integer): string;
begin
  Result := 'select d.sup_code, d.sup_name,'
            + ' sum(b.doasd_qty_receipt * b.doasd_sell_price * 100 / (100 + b.doasd_ppn)) as GrossSales,'
            + ' sum(b.doasd_qty_receipt * (b.doasd_sell_price - b.doasd_sell_price_disc) * 100 / (100 + b.doasd_ppn)) as Disc,'
            + ' sum(b.doasd_qty_receipt * b.doasd_sell_price_disc * b.doasd_ppn / (100 + b.doasd_ppn)) as PPN,'
            + ' sum(b.doasd_qty_receipt * DOASD_DISC_MEMBER_RECEIPT) as discamc'
            + ' from do_assgros a, do_assgros_detil b, barang_suplier c, suplier d, barang e'
            + ' where a.doas_no = b.doasd_doas_no'
            + ' and a.doas_unt_id = b.doasd_doas_unt_id'
            + ' and b.doasd_brg_code = c.brgsup_brg_code'
            + ' and c.brgsup_sup_code = d.sup_code'
            + ' and b.doasd_brg_code = e.brg_code'
            + ' and e.brg_tpbrg_id = 2'
            + ' and a.doas_unt_id = ' + IntToStr(aUnitID)
            + ' and a.doas_date_receipt between ' + QuotDTNol(aTglAwal) + ' and ' + QuotD(aTglAkhir, True)
            + ' and a.DOAS_STATUS not in (' + Quot('DELIVERED') + ',' + Quot('RECEIPT') + ')'
            + ' group by d.sup_code, d.sup_name';
end;

function TfrmSalesReportContrabon.GetSQLDetail(aTglAwal, aTglAkhir: TDateTime;
    aUnitID: Integer; aKodeSupplier: String): string;
var
  sFilterSupplierKring: string;
  sFilterSupplierPOS: string;
begin
  sFilterSupplierPOS    := '';
  sFilterSupplierKring  := '';
  if aKodeSupplier <> '' then
  begin
    sFilterSupplierKring := ' and d.sup_code = ' + Quot(aKodeSupplier);
    sFilterSupplierPOS := ' and f.sup_code = ' + Quot(aKodeSupplier);
  end;

  Result := 'select d.sup_code, '
            + GetCompanyHeader(FLoginUsername,MasterNewUnit.Nama,aTglAwal,aTglAkhir)
            + ' d.sup_name,b.doasd_brg_code as brg_code, b.doasd_sat_code as UOM,b.DOASD_QTY_RECEIPT as QTY,'
            + ' (b.doasd_sell_price * 100 / (100 + b.doasd_ppn)) as Harga, '
            + ' ((b.doasd_sell_price - b.doasd_sell_price_disc) * 100 / (100 + b.doasd_ppn)) as Disc, '
            + ' b.doasd_ppn as PPNPersen,'
            + ' (b.doasd_qty_receipt * b.doasd_sell_price * 100 / (100 + b.doasd_ppn)) as GrossSales, '
            + ' (b.doasd_qty_receipt * (b.doasd_sell_price - b.doasd_sell_price_disc) * 100 / (100 + b.doasd_ppn)) as TotalDisc, '
            + ' (b.doasd_qty_receipt * b.doasd_sell_price_disc * b.doasd_ppn / (100 + b.doasd_ppn)) as TotalPPN, '
            + ' (b.doasd_qty_receipt * DOASD_DISC_MEMBER_RECEIPT) as discamc '
            + ' from do_assgros a, do_assgros_detil b, barang_suplier c, suplier d, barang e'
            + ' where a.doas_no = b.doasd_doas_no'
            + ' and a.doas_unt_id = b.doasd_doas_unt_id'
            + ' and b.doasd_brg_code = c.brgsup_brg_code'
            + ' and c.brgsup_sup_code = d.sup_code'
            + ' and b.doasd_brg_code = e.brg_code'
            + ' and e.brg_tpbrg_id = 2'
            + ' and a.doas_unt_id = ' + IntToStr(aUnitID)
            + ' and a.doas_date_receipt between ' + QuotDTNol(aTglAwal) + ' and ' + QuotD(aTglAkhir, True)
            + ' and a.DOAS_STATUS not in (' + Quot('DELIVERED') + ',' + Quot('RECEIPT') + ')'
            + sFilterSupplierKring
            + ' union ALL'
            + ' select f.sup_code, '
            + GetCompanyHeader(FLoginUsername,MasterNewUnit.Nama,aTglAwal,aTglAkhir)
            + ' f.sup_name,d.brg_code, c.bss_sat_code as UOM, b.transd_qty as Qty,'
            + ' (b.transd_sell_price * 100 / (100 + b.transd_ppn)) as Harga,'
            + ' ((b.transd_sell_price - b.transd_sell_price_disc) * 100 / (100 + b.transd_ppn)) as Disc,'
            + ' b.transd_ppn as PPNPersen, '
            + ' (b.transd_qty * b.transd_sell_price * 100 / (100 + b.transd_ppn)) as GrossSales,'
            + ' (b.transd_qty * (b.transd_sell_price - b.transd_sell_price_disc) * 100 / (b.transd_ppn + 100)) as TotalDisc,'
            + ' (b.transd_qty * b.transd_sell_price_disc * b.transd_ppn / (100 + b.transd_ppn)) as Totalppn,'
            + ' (b.transd_qty * b.transd_disc_gmc_nominal) as discamc'
            + ' from transaksi a, transaksi_detil b,barang_stok_sirkulasi c, barang d, barang_suplier e, suplier f'
            + ' where a.trans_id = b.transd_trans_id'
            + ' and a.trans_unt_id = b.transd_trans_unt_id'
            + ' and a.trans_no = c.bss_doc_no'
            + ' and a.trans_unt_id = c.bss_unt_id'
            + ' and c.bss_type = ' + Quot('POS')
            + ' and c.bss_brg_code = d.brg_code'
            + ' and b.transd_brg_code = d.brg_code'
            + ' and d.brg_code = e.brgsup_brg_code'
            + ' and e.brgsup_sup_code = f.sup_code'
            + ' and b.transd_tpbrg_id = 2'
            + ' and a.TRANS_IS_PENDING = 0'
            + ' and a.trans_date between ' + QuotDTNol(aTglAwal) + ' and ' + QuotD(aTglAkhir, True)
            + sFilterSupplierPOS
            + ' and a.trans_unt_id = ' + IntToStr(aUnitID)
            + ' order by 1';
end;

function TfrmSalesReportContrabon.GetSQLTransaksiCOntrabonPOS(aTglAwal :
    TDateTime; aTglAkhir : TDateTime; aUnitID : Integer): string;
begin
  Result := 'select f.sup_code, f.sup_name,'
            + ' sum(b.transd_qty * b.transd_sell_price * 100 / (100 + b.transd_ppn)) as GrossSales,'
            + ' sum(b.transd_qty * (b.transd_sell_price - b.transd_sell_price_disc) * 100 / (b.transd_ppn + 100)) as Disc,'
            + ' sum(b.transd_qty * b.transd_sell_price_disc * b.transd_ppn / (100 + b.transd_ppn)) as ppn,'
            + ' sum(b.transd_qty * b.transd_disc_gmc_nominal) as discamc'
            + ' from transaksi a, transaksi_detil b,barang_stok_sirkulasi c, barang d, barang_suplier e, suplier f'
            + ' where a.trans_id = b.transd_trans_id'
            + ' and a.trans_unt_id = b.transd_trans_unt_id'
            + ' and a.trans_no = c.bss_doc_no'
            + ' and a.trans_unt_id = c.bss_unt_id'
            + ' and c.bss_type = ' + Quot('POS')
            + ' and c.bss_brg_code = d.brg_code'
            + ' and b.transd_brg_code = d.brg_code'
            + ' and d.brg_code = e.brgsup_brg_code'
            + ' and e.brgsup_sup_code = f.sup_code'
            + ' and b.transd_tpbrg_id = 2'
            + ' and a.TRANS_IS_PENDING = 0'
            + ' and a.trans_date between ' + QuotDTNol(aTglAwal) + ' and ' + QuotD(aTglAkhir, True)
            //+ ' and f.sup_code between ' + Quot(aSupCode1) + ' and ' + Quot(aSupCode2)
            + ' and a.trans_unt_id = ' + IntToStr(aUnitID)
            + ' group by f.sup_code, f.sup_name';
end;

procedure TfrmSalesReportContrabon.LoadDataPenjualanContrabon;
begin

  Self.Enabled := True;
  try
    cClearGrid(sgData, False);
    cClearGrid(sgDataDetail, False);

    LoadDataPenjualanContrabonPOS;
    LoadDataPenjualanContrabonKring;     

    SetWarnaBarisSG(sgData);
    AturLebarKolomSgData;
  finally


    Self.Enabled := True;
  end;
end;

procedure TfrmSalesReportContrabon.LoadDataPenjualanContrabonDetail(aTglAwal :
    TDateTime; aTglAkhir : TDateTime;  aUnitID : Integer; aKodeSupplier :
    String);
var
  i: Integer;
  sSQL: string;
begin
  sgDataDetail.FloatingFooter.Visible := False;
  cClearGrid(sgDataDetail, False);
  sSQL := GetSQLDetail(aTglAwal, aTglAkhir, aUnitID, aKodeSupplier);

  with cOpenQuery(sSQL) do
  begin
    try
      i := 1;
      while not Eof do
      begin
        //if FieldByName('sup_code').AsString <> aKodeSupplier then
        //  Continue;

        sgDataDetail.Ints[0,i] := i;
        sgDataDetail.Cells[_DKolBRGCode,i]          := FieldByName('brg_code').AsString;
        sgDataDetail.Cells[_DKolUOM, i]             := FieldByName('uom').AsString;
        sgDataDetail.Floats[_DKolHarga,i]           := FieldByName('harga').AsFloat;
        sgDataDetail.Floats[_DKolQty,i]             := FieldByName('qty').AsFloat;
        sgDataDetail.Floats[_DKolDiskon,i]          := FieldByName('disc').AsFloat;
        sgDataDetail.Floats[_DKolPPNPersen,i]       := FieldByName('ppnpersen').AsFloat;
        sgDataDetail.Floats[_DKolTotalGrossSales,i] := FieldByName('GrossSales').AsFloat;
        sgDataDetail.Floats[_DKolTotalDisc,i]       := FieldByName('TotalDisc').AsFloat;
        sgDataDetail.Floats[_DKolTotalPPN,i]        := FieldByName('totalppn').AsFloat;
        sgDataDetail.Floats[_DKolTotalAMC,i]        := FieldByName('discamc').AsFloat;
        sgDataDetail.Floats[_DKolTotal,i]        := FieldByName('GrossSales').AsFloat -
                                                       FieldByName('TotalDisc').AsFloat +
                                                       FieldByName('TotalPPN').AsFloat -
                                                       FieldByName('discamc').AsFloat;

        Next;
        if not Eof then
        begin
          inc(i);
          sgDataDetail.AddRow;
        end;
      end;

      SetWarnaBarisSG(sgDataDetail);
      sgDataDetail.AutoSizeColumns(True, 5);
    finally
      Free;
    end;
  end;
end;

procedure TfrmSalesReportContrabon.LoadDataPenjualanContrabonKring;
var
  Q: TFDQuery;
  sSQL: string;
begin
  sSQL := GetSQLContrabonKring(dtTglFrom.Date, dtTglTo.Date, MasterNewUnit.ID);

  Q := cOpenQuery(sSQL);
  try
    MoveDataFromQtoGrid(Q);
  finally
    Q.Free;
  end;

end;

procedure TfrmSalesReportContrabon.LoadDataPenjualanContrabonPOS;
var
  Q: TFDQuery;
  sSQL: string;
begin
  sSQL := GetSQLTransaksiCOntrabonPOS(dtTglFrom.Date, dtTglTo.Date, MasterNewUnit.ID);

  Q := cOpenQuery(sSQL);
  try

    MoveDataFromQtoGrid(Q);
  finally
    Q.Free;
  end;

end;

procedure TfrmSalesReportContrabon.MoveDataFromQtoGrid(aQ: TFDQuery);
var
  iBaris: Integer;
begin
  with aQ do
  begin
    try
      while not Eof do
      begin
        iBaris := GetBarisBKodeSupplier(FieldByName('sup_code').AsString);
        if iBaris > 0 then
        begin
          cShowWaitWindow('Data Penjualan  ' + FieldByName('sup_code').AsString);
          Application.ProcessMessages;

          sgData.Ints[0,iBaris]                     := iBaris;
          sgData.Cells[_KolKodeSupplier,iBaris]     := FieldByName('sup_code').AsString;
          sgData.Cells[_KolNamaSupplier,iBaris]     := FieldByName('sup_name').AsString;
          sgData.Floats[_KolGrosssales,iBaris]      := sgData.Floats[_KolGrosssales,iBaris] + FieldByName('Grosssales').AsFloat;
          sgData.Floats[_KolDiskonPenjualan,iBaris] := sgData.Floats[_KolDiskonPenjualan,iBaris] + FieldByName('disc').AsFloat;
          sgData.Floats[_KolPPN,iBaris]             := sgData.Floats[_KolPPN,iBaris] + FieldByName('ppn').AsFloat;
          sgData.Floats[_KolDiskonAMC,iBaris]       := sgData.Floats[_KolDiskonAMC,iBaris] + FieldByName('discamc').AsFloat;
          sgData.Floats[_KolTotal,iBaris]           := sgData.Floats[_KolTotal,iBaris] + FieldByName('Grosssales').AsFloat - FieldByName('disc').AsFloat + FieldByName('ppn').AsFloat - FieldByName('discamc').AsFloat;
        end;
  
        Next;
      end;
    finally
      cCloseWaitWindow;
      //Free;
    end;
  end;
end;

procedure TfrmSalesReportContrabon.sgDataCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  inherited;
  CanEdit := False;
end;

procedure TfrmSalesReportContrabon.sgDataGetAlignment(Sender: TObject;
  ARow, ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  inherited;
  if ARow < 1 then
    HAlign := taCenter
  else if ACol in [0, _KolGrosssales, _KolDiskonPenjualan, _KolPPN, _KolDiskonAMC, _KolTotal] then
    HAlign := taRightJustify
  else
    HAlign := taLeftJustify;    
end;

procedure TfrmSalesReportContrabon.sgDataGetFloatFormat(Sender: TObject;
  ACol, ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  inherited;
  FloatFormat := '%.2n';
  if ARow < 1 then
    IsFloat := False
  else if ACol in [_KolGrosssales, _KolDiskonPenjualan, _KolPPN, _KolDiskonAMC, _KolTotal] then
    IsFloat := True
  else
    IsFloat := False;
end;

procedure TfrmSalesReportContrabon.sgDataRowChanging(Sender: TObject;
  OldRow, NewRow: Integer; var Allow: Boolean);
begin
  inherited;
  //LoadDataPenjualanContrabonDetail(dtTglFrom.Date, dtTglTo.Date,MasterNewUnit.ID, sgData.Cells[_KolKodeSupplier,NewRow]);

end;

procedure TfrmSalesReportContrabon.sgDataClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  inherited;
  LoadDataPenjualanContrabonDetail(dtTglFrom.Date, dtTglTo.Date,MasterNewUnit.ID, sgData.Cells[_KolKodeSupplier,ARow]);
  sgDataDetail.AddRow;

  sgDataDetail.FloatingFooter.Visible := True;
  sgDataDetail.FloatingFooter.ColumnCalc[_DKolTotalGrossSales]  := acSUM;
  sgDataDetail.FloatingFooter.ColumnCalc[_DKolTotalDisc]        := acSUM;
  sgDataDetail.FloatingFooter.ColumnCalc[_DKolTotalPPN]         := acSUM;
  sgDataDetail.FloatingFooter.ColumnCalc[_DKolTotalAMC]         := acSUM;
  sgDataDetail.FloatingFooter.ColumnCalc[_DKolTotal]            := acSUM;
  //DecorateFooter(sg);
end;

procedure TfrmSalesReportContrabon.sgDataDetailCanEditCell(Sender: TObject;
  ARow, ACol: Integer; var CanEdit: Boolean);
begin
  inherited;
  CanEdit := False;
end;

procedure TfrmSalesReportContrabon.sgDataDetailGetAlignment(
  Sender: TObject; ARow, ACol: Integer; var HAlign: TAlignment;
  var VAlign: TVAlignment);
begin
  inherited;
  if ARow < 1 then
    HAlign := taCenter
  else if ACol in [_DKolBRGCode,_DKolUOM] then
    HAlign := taLeftJustify
  else
    HAlign := taRightJustify;    
end;

procedure TfrmSalesReportContrabon.sgDataDetailGetFloatFormat(
  Sender: TObject; ACol, ARow: Integer; var IsFloat: Boolean;
  var FloatFormat: String);
begin
  inherited;
  FloatFormat := '%.2n';
  IsFloat := False;
  if (ARow > 0) and not (ACol in [0,_DKolBRGCode,_DKolUOM]) then
    IsFloat := True;
end;

end.


