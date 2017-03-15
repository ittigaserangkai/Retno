unit ufrmListDoOutstanding;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, ufraFooter5Button, JvEdit, Math,
  Mask, JvToolEdit, cbxbase, dblup1a, Grids, BaseGrid, AdvGrid,
  ActnList, uConn, SUIButton, DB, IBCustomDataSet, AdvCGrid, JvExMask, AdvObj,
  uADStanIntf, uADStanOption, uADStanError, uADGUIxIntf, uADPhysIntf,
  uADStanDef, uADStanPool, uADStanAsync, uADPhysManager, uADStanParam,
  uADDatSManager, uADDAptIntf, uADDAptManager, FireDAC.Comp.Client, uADCompDataSet;


type
  TfrmListDoOutstanding = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    pnl2: TPanel;
    pnl1: TPanel;
    lblTanggal: TLabel;
    dtTgl: TJvDateEdit;
    lbl1: TLabel;
    cbpTrader: TColumnComboBox;
    btnshow2: TsuiButton;
    lbl2: TLabel;
    edtTraderName: TEdit;
    lbl3: TLabel;
    edtTraderAddress: TEdit;
    IBQuery1: TFDQuery;
    clGrid: TAdvColumnGrid;
    strgGrid: TAdvStringGrid;
    btnShow: TsuiButton;
    btnCetak: TsuiButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure cbpTraderKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnshow2Click(Sender: TObject);
    procedure fraFooter5Button1btnAddClick(Sender: TObject);
    procedure fraFooter5Button1btnUpdateClick(Sender: TObject);
    procedure dtTglKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnshow2Enter(Sender: TObject);
    procedure btnshow2Exit(Sender: TObject);
    procedure clGridGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure clGridGetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
    procedure btnShowClick(Sender: TObject);
    procedure btnCetakClick(Sender: TObject);
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
    procedure SetHeaderColGrid;
  public
    { Public declarations }
  published
    property TraderCode: String read FTraderCode write SetTraderCode;
    property DataReport: TResultDataSet read FDataReport write SetDataReport;
  end;

var
  frmListDoOutstanding: TfrmListDoOutstanding;

implementation

uses  suithemes, uOutstandingPO, DateUtils, udmReport,
  ufrmDialogPrintPreview, uRMSUnit, udmReportNew;

const
  _kolNO                  :Integer = 0;
  _KolNoDO                :Integer = 1;
  _KolTglDO               :Integer = 2;
  _KolTotalDO             :Integer = 3;
  _KolDescDO              :Integer = 4;
  _KOLStatusDO            :Integer = 5;
  _KolTglReceipt          :Integer = 6;
  _KolTotalReceipt        :Integer = 7;
  _KolTraderKode          :Integer = 8;
  _KolTraderNama          :Integer = 9;
  _KOLTraderAlamat        :Integer = 10;
  _KOLDueDate             :Integer = 11;

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
  sSQL2: String;
//  strTraderCode: string;
  sSQL: String;
 // arrParam: TStringList;
begin

  sSQL := IBQuery1.SQL.Text
       + ' where doas.doas_status=' + Quot('RECEIPT')
//       + ' or doas.doas_status=' + Quot('INVOICEING')
//       + ' and invas.invas_due_date is null'
//       + ' or invas.invas_due_date <= ' + QuotD(dtTgl.Date)
       + ' and trd.trd_code =' + Quot(cbpTrader.Text)
       + ' and doas.doas_unt_id=' + IntToStr(masternewunit.id);
//
  sSQL2 := 'select ' + GetCompanyHeader(MasterNewunit.Nama,MasterNewunit.Nama,dtTgl.Date,dtTgl.Date)
       + ' UNT_ID from AUT$UNIT ' ;



  dmReportNew.EksekusiReport('ListOutstandingDOAssGross',sSQL, sSQL2, True);

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
  arrParam[4].data:= masternewunit.id;

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
  begin
    cClearStringGrid(strgGrid,True);
    SetHeaderStrgGrid;
    fraFooter5Button1.btnAdd.Enabled := false;
  end;

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
  //i: Integer;
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
      //i:= 0;
      while not DataTrader.Eof do
      begin
        AddRow([DataTrader.FieldByName('TRD_ID').AsString, // IntToStr(i),
               DataTrader.FieldByName('TRD_CODE').AsString,
               DataTrader.FieldByName('TRD_NAME').AsString]);
        //Inc(i);
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
  cClearGrid(clGrid,False);
end;

procedure TfrmListDoOutstanding.btnshow2Click(Sender: TObject);
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
  if Key = VK_RETURN then
    cbpTrader.SetFocus;
end;

procedure TfrmListDoOutstanding.btnshow2Enter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmListDoOutstanding.btnshow2Exit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

procedure TfrmListDoOutstanding.clGridGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  inherited;
  if ARow = 0 then
    HAlign := taCenter
  else if aCol in [2,6] then
    HAlign:= taCenter
  else if ACol in [3,7] then
    HAlign := taRightJustify
  else
    HAlign := taLeftJustify;
end;

procedure TfrmListDoOutstanding.clGridGetFloatFormat(Sender: TObject; ACol,
  ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  inherited;
  FloatFormat := '%.2n';
  if (ARow > 0) and (ACol in [3,7]) then
    IsFloat := True
  else
    IsFloat := False;
end;

procedure TfrmListDoOutstanding.SetHeaderColGrid;
begin
  with clGrid do
  begin
    ColCount:= 12;
    Cells[_kolNO,0]              := 'NO';
    Cells[_KolNoDO,0]            := 'DO NO';
    Cells[_KolTglDO,0]           := 'Tgl DO';
    Cells[_KolTotalDO,0]         := 'Total';
    Cells[_KolDescDO,0]          := 'Desc DO';
    Cells[_KOLStatusDO,0]        := 'Status DO';
    Cells[_KolTglReceipt,0]      := 'Tgl Receipt';
    Cells[_KolTotalReceipt,0]    := 'Total Receipt';
    Cells[_KolTraderKode,0]      := 'Kode Trader';
    Cells[_KolTraderNama,0]      := 'Nama Trader';
    Cells[_KOLTraderAlamat,0]    := 'Alamat Trader';
    Cells[_KOLDueDate,0]         := 'Due Date';
    FixedRows  := 1;
    AutoSize:= True;
  end;
end;

procedure TfrmListDoOutstanding.btnShowClick(Sender: TObject);
var
  sFilterTrader: string;
//  iDue: Integer;
  n: Integer;
  i: Integer;
  sDate: String;
  sSQL: String;
begin
  inherited;
  sDate := '03-30-2009';
//  sSQL := IBQuery1.SQL.Text   
//  sSQL := 'select doas.doas_no as "No DO",doas.doas_date as "Tgl DO",doas.doas_total as "Total DO",'
//        + ' doas.doas_description as "Desc DO",doas.doas_status as "Status DO",doas.doas_np as "NP DO",'
//        + ' doas.doas_date_receipt as "Tgl Receipt",doas.doas_total_recipt as "Total Receipt",'
//        + ' doas.doas_residu as "Residu DO",trd.trd_code as "Kode Trader",'
//        + ' trd.trd_name as "Nama Trader",trd.trd_address as "Alamat Trader",'
//        + ' invas.invas_due_date as "Due Date",daysbetween(invas.invas_due_date,'+Quot(sDate)
//        + ' )as tanggal '
//        + ' from do_assgros doas '
//        + ' left join trader trd on doas.doas_trd_id=trd.trd_id '
//        + ' and doas.doas_trd_unt_id=trd.trd_unt_id '
//        + ' left join invoice_assgros invas on doas.doas_no=invas.invas_doas_no '
//        + ' and doas.doas_unt_id=invas.invas_doas_unt_id '
//        + ' where doas.doas_status=' + Quot('RECEIPT')
//        + ' or doas.doas_status=' + Quot('INVOICING')
//        + ' and invas.invas_due_date is null'
//        + ' or invas.invas_due_date <= ' + QuotD(dtTgl.Date)
//        + ' and trd.trd_code =' + Quot(cbpTrader.Text)
//        + ' and doas.doas_unt_id=' + IntToStr(masternewunit.id);
  if cbpTrader.Text <> '' then
  sFilterTrader := ' T.TRD_CODE = ' + Quot(cbpTrader.Text)+ ' AND'
  else
  sFilterTrader := '';

  sSQL := 'SELECT DA.DOAS_NO,T.TRD_CODE,DA.DOAS_DATE,DA.DOAS_TOTAL,DA.DOAS_DESCRIPTION, '
        + ' DA.DOAS_STATUS,DA.DOAS_DATE_RECEIPT,DA.DOAS_TOTAL_RECIPT,T.TRD_NAME, '
        + ' T.TRD_ADDRESS,PA.POAS_TOP '
        + ' FROM TRADER T '
        + ' INNER JOIN DO_ASSGROS DA ON (T.TRD_ID = DA.DOAS_TRD_ID) '
        + ' AND (T.TRD_UNT_ID = DA.DOAS_TRD_UNT_ID) '
        + ' INNER JOIN PO_ASSGROS PA ON (DA.DOAS_POAS_NO = PA.POAS_NO) '
        + ' AND (DA.DOAS_POAS_UNT_ID = PA.POAS_UNT_ID) '
        + ' WHERE ' +sFilterTrader            
        + ' DA.DOAS_STATUS = '+ Quot('RECEIPT');
//        + ' (DA.DOAS_STATUS = '+ Quot('RECEIPT')
//        + ' OR DA.DOAS_STATUS = '+ Quot('INVOICING')+')';
//  cQueryToGrid(sSQL,clGrid,True);
//  clGrid.AutoSizeColumns(True,8);


  
  try
    cShowWaitWindow();
    cClearGrid(clGrid,False);
    i := 0;      
    SetHeaderColGrid;
    with cOpenQuery(sSQL) do
    begin
      try
        while not Eof do
        begin
          if i > 0 then
            clGrid.AddRow;

          n := i + clGrid.FixedRows;
          clGrid.Cells[_kolNO, n]             := IntToStr(i+1);
          clGrid.Cells[_KolNoDO, n]           := FieldByName('doas_no').AsString;
          clGrid.Cells[_KolTglDO, n]          := FieldByName('doas_date').AsString;
          clGrid.Cells[_KolTotalDO, n]        := FormatFloat('0.000',FieldByName('doas_total').AsFloat);
          clGrid.Cells[_KolDescDO, n]         := FieldByName('doas_description').AsString;
          clGrid.Cells[_KOLStatusDO, n]       := FieldByName('doas_status').AsString;
          if FieldByName('doas_date_receipt').AsString <> '30-12-1899' then
          clGrid.Cells[_KolTglReceipt, n]     := FieldByName('doas_date_receipt').AsString
          else
          clGrid.Cells[_KolTglReceipt, n]     := '-';
          clGrid.Cells[_KolTotalReceipt, n]   := FormatFloat('0.000',FieldByName('doas_total_recipt').AsFloat);
          clGrid.Cells[_KolTraderKode, n]     := FieldByName('trd_code').AsString;
          clGrid.Cells[_KolTraderNama, n]     := FieldByName('trd_name').AsString;
          clGrid.Cells[_KOLTraderAlamat, n]   := FieldByName('trd_address').AsString;
          if FieldByName('POAS_TOP').AsInteger <> 0 then
          begin
            clGrid.Cells[_KOLDueDate, n]      := DateToStr(IncDay(FieldByName('doas_date').AsDateTime,FieldByName('POAS_TOP').AsInteger));
          end
          else 
            clGrid.Cells[_KOLDueDate, n]      := FieldByName('doas_date').AsString;

          Inc(i);
          Next;
        end;
      finally
        Free;
        SetHeaderColGrid;
        clGrid.AutoSize := True;
      end;
    end;

  finally
    cCloseWaitWindow;
  end;
end;

procedure TfrmListDoOutstanding.btnCetakClick(Sender: TObject);
begin
  inherited;
  PrintOutStandingDO;
end;

end.



