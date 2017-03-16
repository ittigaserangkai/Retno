unit ufrmHistorySo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, ActnList, System.Actions, cxStyles,
  cxClasses, ufrmMasterBrowse, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, Data.DB, cxDBData, cxContainer, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxButtons, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, ufraFooter4Button, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel, cxGridLevel, cxGridCustomView, cxGrid, Vcl.Menus,
  dxBarBuiltInMenu, cxPC;

type
  TfrmHistorySO = class(TfrmMasterBrowse)
    pnlTop: TPanel;
    cbbMerchanGroup: TComboBox;
    lbl3: TLabel;
    bvl1: TBevel;
    actlst1: TActionList;
    actCancelSO: TAction;
    Label1: TLabel;
    cxGridViewColumn1: TcxGridDBColumn;
    cxGridViewColumn2: TcxGridDBColumn;
    cxGridViewColumn3: TcxGridDBColumn;
    cxGridViewColumn4: TcxGridDBColumn;
    cxGridViewColumn5: TcxGridDBColumn;
    ppmn1: TPopupMenu;
    miShowDetailSO: TMenuItem;
    N1: TMenuItem;
    miBatalkan: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actCancelSOExecute(Sender: TObject);
    procedure miShowDetailSOClick(Sender: TObject);
    procedure strgGridDblClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure FormShow(Sender: TObject);
    procedure cbbMerchanGroupChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridGetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
    procedure btnSearchClick(Sender: TObject);
  private
    idMerchanGrup: array of Integer;
  public
    function GetPrice(aSoNo:String): Double;
    function GetStatusSO(aNoSO : String): string;
    { Public declarations }
  end;

var
  frmHistorySO: TfrmHistorySO;

implementation

uses uTSCommonDlg, uConn, ufrmDialogDetailSO, uRetnoUnit, uAppUtils;

{$R *.dfm}
const
  _kolNo      : integer = 0;
  _kolSoNo    : Integer = 1;
  _kolDate    : Integer = 2;
//  _kolQtyAss  : integer = 3;
//  _kolQtyCom  : Integer = 4;
//  _kolQtyTrad : integer = 5;
//  _kolQty     : integer = 3;
//  _kolPrice   : Integer = 4; 
  _kolTotal  : Integer = 3;
  _kolStatus  : Integer = 4;
//  _kolOpNm    : Integer = 6;

procedure TfrmHistorySO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmHistorySO.FormDestroy(Sender: TObject);
begin
  inherited;
  frmHistorySO := nil;
end;

procedure TfrmHistorySO.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption  := 'HISTORY SUGGESTION ORDER';
  dtAwalFilter.Date  := Now-1;
  dtAkhirFilter.Date := Now;
end;

procedure TfrmHistorySO.actCancelSOExecute(Sender: TObject);
begin
//  if (CommonDlg.Confirm('Are you sure want to delete SO (No. SO: '+strgGrid.Cells[1,strgGrid.Row]+')?') = mrOk) then
  begin
    // todo: put your code to delete data here..
    // code goes here..
    CommonDlg.ShowMessage(1,'Information','Process delete SO successfully.', mtInformation);
  end;
end;

procedure TfrmHistorySO.miShowDetailSOClick(Sender: TObject);
begin
  if not Assigned(frmDialogDetailSO) then
    frmDialogDetailSO := TfrmDialogDetailSO.Create(Application);
  {
  if strgGrid.Cells[_kolNo,strgGrid.Row]<>'' then
  begin
    frmDialogDetailSO.NoSO := strgGrid.Cells[_kolSoNo ,strgGrid.Row];
    frmDialogDetailSO.SODate := StrToDate(strgGrid.Cells[_kolDate,strgGrid.Row]);
    if Trim(strgGrid.Cells[_kolStatus, strgGrid.Row]) = 'Belum PO' then
      frmDialogDetailSO.IsBelumPO := True
    else
      frmDialogDetailSO.IsBelumPO := false;

    SetFormPropertyAndShowDialog(frmDialogDetailSO);
    frmDialogDetailSO.Free;
  end;
  }

end;

procedure TfrmHistorySO.strgGridDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  if (Arow > 0) then
    miShowDetailSOClick(Self);
end;

procedure TfrmHistorySO.FormShow(Sender: TObject);
var i,JmlData: Integer;
    data: TDataSet;
begin
  inherited;
  {if not assigned(DataSO) then
    DataSO := TDataSO.Create;
  cbbMerchanGroup.Style:=csDropDownList;
  if not assigned(DataCombo) then
    DataCombo := TDataCombo.Create;

  data:=DataCombo.GetListDataCombo('Merchan_Name','Merchan_Id','MERCHAN_CODE','Ref$Merchandise');
  }
  JmlData:=data.RecordCount;
  cbbMerchanGroup.Items.Clear;
  cbbMerchanGroup.Items.Add('All');
  SetLength(idMerchanGrup,JmlData);
  for i:=1 to JmlData do
  begin
    cbbMerchanGroup.Items.Add(data.Fields[0].AsVariant);
    idMerchanGrup[i-1]:=StrToInt(data.Fields[1].AsVariant);
    data.Next;
  end;
  cbbMerchanGroup.ItemIndex:=0;
end;

procedure TfrmHistorySO.cbbMerchanGroupChange(Sender: TObject);
begin
  inherited;
//  strgGrid.RowCount:=2;
//  strgGrid.ClearRows(1,1);
end;

function TfrmHistorySO.GetStatusSO(aNoSO : String): string;
var
  sSQL: string;
begin
  Result := 'Belum PO';
  sSQL := 'select  count(a.so_no) from so a, po b'
          + ' where a.so_no = b.po_so_no'
          + ' and a.so_unt_id = b.po_so_unt_id'
          + ' and a.so_no = ' + QuotedStr(aNoSO);
  {
  with cOpenQuery(sSQL) do
  begin
    try
      if not Fields[0].IsNull then
        if Fields[0].AsInteger > 0 then
          Result := 'Sudah PO';
    finally
      Free;
    end;
  end;
  }
end;

procedure TfrmHistorySO.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmHistorySO.strgGridGetFloatFormat(Sender: TObject; ACol,
  ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  inherited;
  if ACol in [_kolNo, _kolSoNo, _kolDate, _kolStatus] then
    IsFloat := False;

  if IsFloat then
    FloatFormat := '%.2n';
end;

procedure TfrmHistorySO.btnSearchClick(Sender: TObject);
var
  sFilterMerGroup: string;
  iBaris: Integer;
  sSQL: string;
  iMerchandizeGrupID: Integer;
begin
  inherited;

  iMerchandizeGrupID := idMerchanGrup[cbbMerchanGroup.ItemIndex-1];
  if cbbMerchanGroup.ItemIndex <> 0 then // All Mer Group
    sFilterMerGroup := ' and so.SO_MERCHANGRUP_ID = ' + IntToStr(iMerchandizeGrupID)
  else
    sFilterMerGroup := '';

  begin
//  cclearStringGrid(strgGrid,False);
  sSQL := 'select so.SO_MERCHANGRUP_ID, so.so_no,so_date'
          + ' from so, SO_DETIL sod '
          + ' where sod.SOD_SO_NO = so.SO_NO'
          + ' and sod.SOD_SO_UNT_ID = SO_UNT_ID'
          + ' and so_date between ' + TAppUtils.QuotD(dtAwalFilter.Date)
          + ' and ' + TAppUtils.QuotD(dtAkhirFilter.Date)
          + sFilterMerGroup
          + ' group by so.so_no, so.SO_MERCHANGRUP_ID, so.so_date'
          + ' order by so.SO_NO';

  {
  with cOpenQuery(sSQL) do
  begin
    try
      iBaris := 0;
      while not Eof do
      begin
        Inc(iBaris);
        strgGrid.Cells[_kolNo,iBaris]         := IntToStr(iBaris);
        strgGrid.Cells[_kolSoNo,iBaris]       := FieldByName('so_no').AsString;
        strgGrid.Cells[_kolDate,iBaris]       := FormatDateTime('dd/MM/YYYY', FieldByName('so_date').AsDateTime);
        strgGrid.Cells[_kolTotal,iBaris]      := FloatToStr(GetPrice(FieldByName('so_no').AsString));

        Next;
        if not Eof then
          strgGrid.AddRow;
      end;
    finally
      Free;
    end;
  end;
  }
  end;
end;

function TfrmHistorySO.GetPrice(aSoNo:String): Double;
var
  dTotal : Extended;
  sSQL: String;
  dDisc1,dDisc2,dDisc3,dPrice: Extended;
  iDisc1,iDisc2,iQTY : Real;
begin
  dTotal := 0;
  sSQL   := 'Select * from SO_Detil Where SOD_SO_NO='+QuotedStr(aSoNo);
  {
  with cOpenQuery(sSQL) do
  begin
    try
      while not Eof do
      begin
        iQTY   := fieldbyname('SOD_QTY').AsFloat;
        iDisc1 := fieldbyname('SOD_DISC1').AsFloat;
        iDisc2 := fieldbyname('SOD_DISC2').AsFloat;
        dDisc3 := fieldbyname('SOD_DISC3').AsFloat;
        dPrice := fieldbyname('SOD_PRICE').AsFloat;
        dDisc1 := (iDisc1/100)*dPrice;
        dDisc2 := (iDisc2/100)*(dPrice-dDisc1);
        dTotal := dTotal+(iQTY*(dPrice-(dDisc1+dDisc2+dDisc3)));
        Next;
      end
    finally
      Result := dTotal;
      Free;
    end
  end}
end;

end.


