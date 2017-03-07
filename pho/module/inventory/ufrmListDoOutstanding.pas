unit ufrmListDoOutstanding;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, ufraFooter5Button, JvEdit, Math,
   Mask, JvToolEdit, cbxbase, dblup1a, Grids, BaseGrid, AdvGrid,
  ActnList, uConn, SUIButton;

type
  TfrmListDoOutstanding = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    pnl2: TPanel;
    strgGrid: TAdvStringGrid;
    pnl1: TPanel;
    lblTanggal: TLabel;
    dtTgl: TJvDateEdit;
    lbl1: TLabel;
    cbpTrader: TColumnComboBox;
    btnshow: TsuiButton;
    lbl2: TLabel;
    edtTraderName: TEdit;
    lbl3: TLabel;
    edtTraderAddress: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure cbpTraderKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnshowClick(Sender: TObject);
    procedure fraFooter5Button1btnAddClick(Sender: TObject);
    procedure fraFooter5Button1btnUpdateClick(Sender: TObject);
    procedure dtTglKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FTraderCode: String;
    FDataReport : TResultDataSet;
    procedure SetHeaderStrgGrid;
    procedure ShowOutStandingDO;
    procedure PrintOutStandingDO;
    procedure ListTrader;
    procedure SetTraderCode(const Value: String);
    procedure SetDataReport(const Value: TResultDataSet);
  public
    { Public declarations }
  published
    property TraderCode: String read FTraderCode write SetTraderCode;
    property DataReport: TResultDataSet read FDataReport write SetDataReport;
  end;

var
  frmListDoOutstanding: TfrmListDoOutstanding;

implementation

uses ufrmMain, uOutstandingPO, DateUtils, udmReport, DB,
  ufrmDialogPrintPreview;

{$R *.dfm}

procedure TfrmListDoOutstanding.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    Action:= caFree;
end;

procedure TfrmListDoOutstanding.FormDestroy(Sender: TObject);
begin
  inherited;
    frmListDoOutstanding:= nil;
end;

procedure TfrmListDoOutstanding.PrintOutStandingDO;
var
  arrParam: TStringList;
begin
  arrParam:= TStringList.Create;
  arrParam.Add(frmMain.LoginFullname);
  arrParam.Add(FormatDateTime('dd/mm/yy', dtTgl.Date));

  if not assigned(frmDialogPrintPreview) then
    frmDialogPrintPreview:= TfrmDialogPrintPreview.Create(Application);

  frmDialogPrintPreview.ListParams:= arrParam;
  frmDialogPrintPreview.RecordSet:= DataReport;
  frmDialogPrintPreview.FilePath:=  frmMain.FilePathReport+'frListDoOutstanding.fr3';
  frmDialogPrintPreview.ShowModal;
//  with dmReport do
//  begin
//    Params:= arrParam;
//    frxDBDataset.DataSet:= DataReport;
//    pMainReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'/template/frListDoOutstanding.fr3');
//    pMainReport.ShowReport(True);
//  end;
  FreeAndNil(arrParam);
  frmDialogPrintPreview.free;
end;

procedure TfrmListDoOutstanding.SetDataReport(const Value: TResultDataSet);
begin
  FDataReport := Value;
end;

procedure TfrmListDoOutstanding.SetHeaderStrgGrid;
begin
  with strgGrid do
  begin
    ColCount:= 9;
    RowCount:= 2;
    Cells[0,0]:= 'NO';
    Cells[1,0]:= 'DO NO';
    Cells[2,0]:= 'TRADER CODE';
    Cells[3,0]:= 'TRADER NAME';
    Cells[4,0]:= 'RECEIPT DATE';
    Cells[5,0]:= 'TOTAL RECEIPT';
    Cells[6,0]:= 'CREDIT';
    Cells[7,0]:= 'RESIDU';
    Cells[8,0]:= 'EVIDANCE';
    FixedRows:= 1;
    AutoSize:= True;
  end;
end;

procedure TfrmListDoOutstanding.SetTraderCode(const Value: String);
begin
  FTraderCode := Value;
end;

procedure TfrmListDoOutstanding.ShowOutStandingDO;
var
  arrParam: TArr;
  Data    : TResultDataSet;
  i,
  DataCount: Integer;
  dtDueDate: TDate;
begin
  SetLength(arrParam, 5);
  arrParam[0].tipe:= ptString;
  arrParam[0].data:= 'RECEIPT';
  arrParam[1].tipe:= ptString;
  arrParam[1].data:= 'INVOICING';
  arrParam[2].tipe:= ptDateTime;
  arrParam[2].data:= dtTgl.Date;
  arrParam[3].tipe:= ptString;
  arrParam[3].data:= TraderCode;
  arrParam[4].tipe:= ptInteger;
  arrParam[4].data:= frmMain.UnitId;

  Data:= OutstandingPO.GetOutStandingDO(arrParam);
  DataReport:= Data;
  DataCount := Data.RecordCount;
  if DataCount>0 then
  begin
    i:= 1;
    SetHeaderStrgGrid;
    with strgGrid do
    begin
      RowCount:= DataCount + i;
      while not Data.Eof do
      begin
        cells[0,i]:= IntToStr(i)+'.';
        cells[1,i]:= Data.FieldByName('DOAS_NO').AsString;
        cells[2,i]:= Data.FieldByName('TRD_CODE').AsString;
        cells[3,i]:= Data.FieldByName('TRD_NAME').AsString;
        cells[4,i]:= Data.FieldByName('DOAS_DATE_RECEIPT').AsString;
        cells[5,i]:= Data.FieldByName('DOAS_TOTAL_RECIPT').AsString;
        cells[6,i]:= Data.FieldByName('DOAS_TOTAL_PAID').AsString;
        cells[7,i]:= Data.FieldByName('DOAS_RESIDU').AsString;
        dtDueDate := Data.FieldByName('INVAS_DUE_DATE').AsDateTime;
        if (dtDueDate = 0) or (Data.FieldByName('TANGGAL').AsInteger<0) then
          Cells[8,i]:= 'Belum Jatuh Tempo'
        else
          Cells[8,i]:= 'Lewat '+Data.FieldByName('TANGGAL').AsString+' Hari';
        Inc(i);
        Data.Next;
      end;
      AutoSize:= True;
    end;
  end
  else
    fraFooter5Button1.btnAdd.Enabled := false;

  fraFooter5Button1.btnAdd.Enabled := True;
end;

procedure TfrmListDoOutstanding.cbpTraderKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
//var
//  aParam: TArr;
//  data: TResultDataSet;
//  i: integer;
begin
  inherited;
//  if (Length(Trim(cbpTrader.Text)) >= 3) and (Length(Trim(cbpTrader.Text)) <= 7) then
//  begin
//    SetLength(aParam, 1);
//    aParam[0].tipe := ptString;
//    aParam[0].data := Trim(cbpTrader.Text);
//
//    if not Assigned(OutstandingPO) then
//      OutstandingPO := TOutstandingPO.Create;
//
//    data := OutstandingPO.GetDataTraderByCode(aParam);
//
//    with cbpTrader do
//    begin
//      ClearGridData;
//      RowCount:= data.RecordCount + 1;
//      ColCount:= 3;
//      AddRow(['ID','TRADER CODE','TRADER NAME']); // ,'TRADER ADDRESS'
//      if data.RecordCount>0 then
//      begin
//        i:= 0;
//        while not data.Eof do
//        begin
//          AddRow([data.FieldByName('TRD_ID').AsString,  // IntToStr(i),
//                 data.FieldByName('TRD_CODE').AsString,
//                 data.FieldByName('TRD_NAME').AsString]);
//          Inc(i);
//          data.Next;
//        end;
//        FixedRows:=1;
//      end else
//        RowCount:= 2;
//      SizeGridToData;
//    end
//  end
//  else
//    Exit;

  if Key = VK_RETURN then
  begin
    if cbpTrader.Text<>'' then
    begin
      edtTraderName.Text:= cbpTrader.Cells[2, cbpTrader.Row];
      edtTraderAddress.Text:= cbpTrader.Cells[3, cbpTrader.Row];
      TraderCode:= cbpTrader.Text;
    end;
  end;

  if Key = VK_DOWN then
      cbpTrader.Text := cbpTrader.Cells[1, cbpTrader.Row];

end;

procedure TfrmListDoOutstanding.ListTrader;
var
  DataTrader: TResultDataSet;
  i: Integer;
begin
  DataTrader:= OutstandingPO.GetDataTrader;
  with cbpTrader do
  begin
    Clear;
    RowCount:= DataTrader.RecordCount + 1;
    ColCount:= 3;
    AddRow(['ID','TRADER CODE','TRADER NAME']);  // ,'TRADER ADDRESS'
    if DataTrader.RecordCount>0 then
    begin
      i:= 0;
      while not DataTrader.Eof do
      begin
        AddRow([DataTrader.FieldByName('TRD_ID').AsString, // IntToStr(i),
               DataTrader.FieldByName('TRD_CODE').AsString,
               DataTrader.FieldByName('TRD_NAME').AsString]);
        Inc(i);
        DataTrader.Next;
      end;
      FixedRows:=1;
    end else
      RowCount:= 2;
    SizeGridToData;
  end
end;

procedure TfrmListDoOutstanding.FormShow(Sender: TObject);
begin
  inherited;
  ListTrader;
  fraFooter5Button1.btnAdd.Enabled := false;
  dtTgl.Date := Now;
  dtTgl.SetFocus;
end;

procedure TfrmListDoOutstanding.btnshowClick(Sender: TObject);
begin
  inherited;
    ShowOutStandingDO;
end;

procedure TfrmListDoOutstanding.fraFooter5Button1btnAddClick(
  Sender: TObject);
begin
  inherited;
    PrintOutStandingDO;
end;

procedure TfrmListDoOutstanding.fraFooter5Button1btnUpdateClick(
  Sender: TObject);
begin
  inherited;
    ShowOutStandingDO;
end;

procedure TfrmListDoOutstanding.dtTglKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = Ord(VK_RETURN) then
    cbpTrader.SetFocus;
end;

end.
