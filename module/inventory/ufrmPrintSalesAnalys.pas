unit ufrmPrintSalesAnalys;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, ufraFooter5Button, Grids, BaseGrid, AdvGrid, Mask,
  JvToolEdit, SUIButton, StdCtrls, ExtCtrls, ActnList, cbxbase, dblup1a, uConn;

type
  TfrmDailySalesAnalys = class(TfrmMaster)
    pnlTop: TPanel;
    lbl3: TLabel;
    lbl4: TLabel;
    btnShowPO: TsuiButton;
    dtTglFrom: TJvDateEdit;
    edtGroupName: TEdit;
    pnlContent: TPanel;
    strgGrid: TAdvStringGrid;
    fraFooter5Button1: TfraFooter5Button;
    actlst1: TActionList;
    actPrintSalesAnalys: TAction;
    cbpGroup: TColumnComboBox;
    dtTglTo: TJvDateEdit;
    lbl5: TLabel;
    actRefreshPrintSalesAnalys: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actPrintSalesAnalysExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbpGroupKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtTglFromChange(Sender: TObject);
    procedure cbpGroupCloseUp(Sender: TObject);
    procedure btnShowPOClick(Sender: TObject);
    procedure strgGridCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtTglFromKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNoPO1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actRefreshPrintSalesAnalysExecute(Sender: TObject);
  private
    { Private declarations }
    dataGroup,dataSalesAnalys: TResultDataSet;
    procedure LoadDropDownData(ACombo: TColumnComboBox; AColsOfData: Integer);
    procedure ParseGridData();
    procedure ParseHeaderGrid();
    procedure getDataSalesAnalys();
    function GetUnitId(): Integer;
  public
    { Public declarations }
  end;

var
  frmDailySalesAnalys: TfrmDailySalesAnalys;

implementation

uses uPrintSalesAnalys, udmReport, ufrmMain, ufrmDialogPrintPreview;

{$R *.dfm}

procedure TfrmDailySalesAnalys.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDailySalesAnalys.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'DAILY SALES ANALYSIS';
end;

procedure TfrmDailySalesAnalys.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDailySalesAnalys := nil;
  frmDailySalesAnalys.Free;
end;

procedure TfrmDailySalesAnalys.actPrintSalesAnalysExecute(Sender: TObject);
var ParamList: TStringList;
    ReportDataset: TResultDataSet;
    {countI,}countParam,jmlPrintData: Integer;
    {chkStatue: Boolean;}
    PathOfFile: String;
begin
  inherited;
  //init
  jmlPrintData := 0;
  countParam := 0;

//  if not Assigned(MasterAgreement) then MasterAgreement := TMasterAgreement.Create;

  ParamList := TStringList.Create;
//  ParamList.Add(DateToStr(Now));
  ParamList.Add(DateToStr(Now));
//  ParamList.Add(date; //0
  ParamList.Add(frmMain.LoginFullname); //1
  ParamList.Add(DateToStr(dtTglFrom.Date)); //2
  ParamList.Add(DateToStr(dtTglTo.Date)); //3

  getDataSalesAnalys();
  ReportDataset := dataSalesAnalys;

  if cbpGroup.Cells[0,cbpGroup.Row] = '-1' then
    PathOfFile:= frmMain.FilePathReport + 'frPrintSalesAnalysAll.fr3'
  else if cbpGroup.Cells[0, cbpGroup.Row] = '-2' then
    PathOfFile:= frmMain.FilePathReport + 'DailySalesReportByGroup.fr3'
  else
    PathOfFile:= frmMain.FilePathReport + 'frPrintSalesAnalys.fr3';

  if not assigned(frmDialogPrintPreview) then
    frmDialogPrintPreview:= TfrmDialogPrintPreview.Create(Application);

  frmDialogPrintPreview.ListParams:= ParamList;
  frmDialogPrintPreview.RecordSet:= ReportDataset;
  frmDialogPrintPreview.FilePath:= PathOfFile;
  frmDialogPrintPreview.ShowModal;

  frmDialogPrintPreview.Free;
  FreeAndNil(ParamList);
//  with dmReport do
//  begin
//    Params := ParamList;
//    frxDBDataset.DataSet := ReportDataset;
//    if cbpGroup.Cells[0,cbpGroup.Row] = '-1' then
//      pMainReport.LoadFromFile(ExtractFilePath(Application.ExeName) + '/template/frPrintSalesAnalysAll.fr3')
//    else if cbpGroup.Cells[0, cbpGroup.Row] = '-2' then
//      pMainReport.LoadFromFile(ExtractFilePath(Application.ExeName) + '/template/DailySalesReportByGroup.fr3')
//    else
//      pMainReport.LoadFromFile(ExtractFilePath(Application.ExeName) + '/template/frPrintSalesAnalys.fr3');
//    pMainReport.ShowReport(True);
//  end;
end;

procedure TfrmDailySalesAnalys.LoadDropDownData(ACombo: TColumnComboBox;
  AColsOfData: Integer);
begin
  {Flush the old data}
  ACombo.ClearGridData;

  {Make sure the allocated storage is big enough}
  if AColsOfData = 0 then AColsOfData := 1;
  ACombo.RowCount := AColsOfData+2;
  ACombo.ColCount := 2;

  {Load the data}
  if ACombo = cbpGroup then
  begin
    ACombo.AddRow(['','ID','NAME']);
    ACombo.AddRow(['-1','ALL','ALL']);
    ACombo.AddRow(['-2','ALL BY GROUP','ALL BY GROUP']);

    if dataGroup.RecordCount > 0 then
    begin
      dataGroup.First;
      while not dataGroup.Eof do
      begin
        try
          ACombo.AddRow([dataGroup.FieldByName('MERCHANGRUP_ID').AsString,
                         dataGroup.FieldByName('MERCHANGRUP_ID').AsString,
                         dataGroup.FieldByName('MERCHANGRUP_NAME').AsString]);
        except
        end;

        dataGroup.Next;
      end;// end while
      ACombo.Value := ACombo.Cells[1,1];
    end// if comptt
    else ACombo.AddRow(['','','']);

  end; //end if acombo

  {Now shring the grid so its just big enough for the data}
  ACombo.SizeGridToData;
  ACombo.FixedRows:= 1;
end;//R

procedure TfrmDailySalesAnalys.FormShow(Sender: TObject);
begin
  inherited;

//  if not Assigned(MasterAgreement) then MasterAgreement := TMasterAgreement.Create;
//  dtTglFrom.Date := MasterAgreement.getServerDate;
//  dtTglTo.Date := MasterAgreement.getServerDate;
  dtTglFrom.Date := Now;
  dtTglTo.Date := Now;

  actRefreshPrintSalesAnalysExecute(Self);
end;

procedure TfrmDailySalesAnalys.cbpGroupKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Length(cbpGroup.Text) = 2 then
  begin
    if not Assigned(PrintSalesAnalys) then PrintSalesAnalys := TPrintSalesAnalys.Create;

//    dataGroup := PrintSalesAnalys.GetDataSupplier(cbpCodeSupplier.Text + '%');
    LoadDropDownData(cbpGroup,dataGroup.RecordCount);
  end;

  if(Key = 13) then
    ParseGridData();

end;

procedure TfrmDailySalesAnalys.dtTglFromChange(Sender: TObject);
begin
  inherited;
//  ParseGridData;
end;

procedure TfrmDailySalesAnalys.ParseGridData();
var countI: Integer;
    currSales, currGTSales, currProfit: Currency;
    persenSales, persenProfit: Real;
begin
  getDataSalesAnalys();
  ParseHeaderGrid;

  if dataSalesAnalys.RecordCount > 0 then
  begin
    with strgGrid do
    begin
      dataSalesAnalys.First;
      countI := 1;
      RowCount := dataSalesAnalys.RecordCount + 1;

      while not(dataSalesAnalys.Eof) do
      begin
        if cbpGroup.Cells[0, cbpGroup.Row] = '-2' then
          Cells[0, countI] := dataSalesAnalys.FieldByName('MERCHANGRUP_NAME').AsString
        else
          Cells[0,countI] := dataSalesAnalys.FieldByName('SUBGRUP_CODE').AsString + ' ' +
                             dataSalesAnalys.FieldByName('SUBGRUP_NAME').AsString;
        Cells[1,countI] := FormatCurr('#,##0.00',dataSalesAnalys.FieldByName('SALES').AsCurrency);
        currSales := dataSalesAnalys.FieldByName('SALES').AsCurrency;
        currGTSales := dataSalesAnalys.FieldByName('GTSALES').AsCurrency;
        currProfit := dataSalesAnalys.FieldByName('BFRPROFIT').AsCurrency;
//        try
//          persenSales := (currSales / currGTSales) * 100;
//        except
//          persenSales := 0;
//        end;
        if (currGTSales = 0) then
          persenSales := 0
        else
          persenSales := (currSales / currGTSales) * 100;
//        try
//          persenProfit := ((currSales - currProfit) / currSales) * 100;
//        except
//          persenProfit := 0;
//        end;
        if (currSales = 0) then
          persenProfit := 0
        else
          persenProfit := ((currSales - currProfit) / currSales) * 100;
        Cells[2,countI] := FormatFloat('0.#0',persenSales);
        Cells[3,countI] := FormatCurr('#,##0.00',currSales - currProfit);
        Cells[4,countI] := FormatFloat('0.#0',persenProfit);

        Inc(countI);
        dataSalesAnalys.Next;
      end;

      FixedRows := 1;
      AutoSize := True;
    end; //with strgrd
  end // recordcount > 0
  else
  begin
    with strgGrid do
    begin
      strgGrid.RowCount := 2;
      Cells[0,1] := '';
      Cells[1,1] := '';
      Cells[2,1] := '';
      Cells[3,1] := '';
      Cells[4,1] := '';

      FixedRows := 1;
      AutoSize := True;
    end; //with strgrd
  end;
end;

procedure TfrmDailySalesAnalys.cbpGroupCloseUp(Sender: TObject);
begin
  inherited;
  edtGroupName.Text := cbpGroup.Cells[2,cbpGroup.Row];
end;

procedure TfrmDailySalesAnalys.btnShowPOClick(Sender: TObject);
begin
  inherited;
  ParseGridData();
end;

procedure TfrmDailySalesAnalys.strgGridCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  inherited;
  if ACol = 0 then CanEdit := True
  else CanEdit := False;
end;

procedure TfrmDailySalesAnalys.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if(Key = Ord('P'))and(ssctrl in Shift) then
    actPrintSalesAnalysExecute(Self);
end;

procedure TfrmDailySalesAnalys.dtTglFromKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
   if(Key = 13) then
    ParseGridData();
end;

procedure TfrmDailySalesAnalys.edtNoPO1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if(Key = 13) then
    ParseGridData()

end;

procedure TfrmDailySalesAnalys.actRefreshPrintSalesAnalysExecute(
  Sender: TObject);
var arrParam: TArr;
begin
  inherited;
  if not Assigned(PrintSalesAnalys) then PrintSalesAnalys := TPrintSalesAnalys.Create;

  SetLength(arrParam,1);
  arrParam[0].tipe := ptInteger;
  arrParam[0].data := GetUnitId;

  dataGroup := PrintSalesAnalys.GetListGrup(arrParam);
  LoadDropDownData(cbpGroup,dataGroup.RecordCount);
end;

procedure TfrmDailySalesAnalys.getDataSalesAnalys();
var arrParam: TArr;
begin
  if not Assigned(PrintSalesAnalys) then PrintSalesAnalys := TPrintSalesAnalys.Create;

  {//ALL
  if (frmMain.UnitId = 0) and (cbpGroup.Cells[0,cbpGroup.Row] = '-1') then
  begin
    SetLength(arrParam,6);
    arrParam[0].tipe := ptDateTime;
    arrParam[0].data := dtTglFrom.Date;
    arrParam[1].tipe := ptDateTime;
    arrParam[1].data := dtTglTo.Date;
    arrParam[2].tipe := ptDateTime;
    arrParam[2].data := dtTglFrom.Date;
    arrParam[3].tipe := ptDateTime;
    arrParam[3].data := dtTglTo.Date;
    arrParam[4].tipe := ptDateTime;
    arrParam[4].data := dtTglFrom.Date;
    arrParam[5].tipe := ptDateTime;
    arrParam[5].data := dtTglTo.Date;

    dataSalesAnalys := PrintSalesAnalys.GetDataPrintSalesAnalysALL(arrParam);
  end;

  //BY SUB GRUP
  if (frmMain.UnitId = 0) and (cbpGroup.Cells[0,cbpGroup.Row] <> '-1') then
  begin
    SetLength(arrParam,8);
    arrParam[0].tipe := ptInteger;
    arrParam[0].data := StrToInt(cbpGroup.Cells[0,cbpGroup.Row]);
    arrParam[1].tipe := ptDateTime;
    arrParam[1].data := dtTglFrom.Date;
    arrParam[2].tipe := ptDateTime;
    arrParam[2].data := dtTglTo.Date;
    arrParam[3].tipe := ptInteger;
    arrParam[3].data := StrToInt(cbpGroup.Cells[0,cbpGroup.Row]);
    arrParam[4].tipe := ptDateTime;
    arrParam[4].data := dtTglFrom.Date;
    arrParam[5].tipe := ptDateTime;
    arrParam[5].data := dtTglTo.Date;
    arrParam[6].tipe := ptDateTime;
    arrParam[6].data := dtTglFrom.Date;
    arrParam[7].tipe := ptDateTime;
    arrParam[7].data := dtTglTo.Date;

    dataSalesAnalys := PrintSalesAnalys.GetDataPrintSalesAnalysByGrupID(arrParam);
  end;}

  //BY UNT
  if (cbpGroup.Cells[0,cbpGroup.Row] = '-1') then
  begin
    SetLength(arrParam,7);
    arrParam[0].tipe := ptInteger;
    arrParam[0].data := GetUnitId;
    arrParam[1].tipe := ptDateTime;
    arrParam[1].data := dtTglFrom.Date;
    arrParam[2].tipe := ptDateTime;
    arrParam[2].data := dtTglTo.Date;
    arrParam[3].tipe := ptDateTime;
    arrParam[3].data := dtTglFrom.Date;
    arrParam[4].tipe := ptDateTime;
    arrParam[4].data := dtTglTo.Date;
    arrParam[5].tipe := ptDateTime;
    arrParam[5].data := dtTglFrom.Date;
    arrParam[6].tipe := ptDateTime;
    arrParam[6].data := dtTglTo.Date;

    dataSalesAnalys := PrintSalesAnalys.GetDataPrintSalesAnalysByIDUnt(arrParam);
  end
  else
  // Get List DSA Per Grup
  if (cbpGroup.Cells[0,cbpGroup.Row] = '-2') then
  begin
    SetLength(arrParam,7);
    arrParam[0].tipe := ptInteger;
    arrParam[0].data := GetUnitId;
    arrParam[1].tipe := ptDateTime;
    arrParam[1].data := dtTglFrom.Date;
    arrParam[2].tipe := ptDateTime;
    arrParam[2].data := dtTglTo.Date;
    arrParam[3].tipe := ptDateTime;
    arrParam[3].data := dtTglFrom.Date;
    arrParam[4].tipe := ptDateTime;
    arrParam[4].data := dtTglTo.Date;
    arrParam[5].tipe := ptDateTime;
    arrParam[5].data := dtTglFrom.Date;
    arrParam[6].tipe := ptDateTime;
    arrParam[6].data := dtTglTo.Date;

    dataSalesAnalys := PrintSalesAnalys.GetDataPrintSalesAnalysByGrup(arrParam);
  end
  else
  //by UNT & SUB GRUP
  begin
    SetLength(arrParam,9);
    arrParam[0].tipe := ptInteger;
    arrParam[0].data := StrToInt(cbpGroup.Cells[0,cbpGroup.Row]);
    arrParam[1].tipe := ptInteger;
    arrParam[1].data := GetUnitId;
    arrParam[2].tipe := ptDateTime;
    arrParam[2].data := dtTglFrom.Date;
    arrParam[3].tipe := ptDateTime;
    arrParam[3].data := dtTglTo.Date; arrParam[0].tipe := ptInteger;
    arrParam[4].tipe := ptInteger;
    arrParam[4].data := StrToInt(cbpGroup.Cells[0,cbpGroup.Row]);
    arrParam[5].tipe := ptDateTime;
    arrParam[5].data := dtTglFrom.Date;
    arrParam[6].tipe := ptDateTime;
    arrParam[6].data := dtTglTo.Date;
    arrParam[7].tipe := ptDateTime;
    arrParam[7].data := dtTglFrom.Date;
    arrParam[8].tipe := ptDateTime;
    arrParam[8].data := dtTglTo.Date;

    dataSalesAnalys := PrintSalesAnalys.GetDataPrintSalesAnalysByGrupIDUnt(arrParam);
  end;
end;

function TfrmDailySalesAnalys.GetUnitId: Integer;
begin
  if not Assigned(PrintSalesAnalys) then
    PrintSalesAnalys := TPrintSalesAnalys.Create;

  Result := PrintSalesAnalys.GetDefaultUnitId;
end;

procedure TfrmDailySalesAnalys.ParseHeaderGrid;
begin
  if cbpGroup.Cells[0, cbpGroup.Row] = '-2' then
    strgGrid.Cells[0, 0] := 'GROUP'
  else
    strgGrid.Cells[0, 0] := 'SUB GROUP CODE & NAME';
end;

end.
