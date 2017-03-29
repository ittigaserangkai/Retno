unit ufrmServiceLevel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, ActnList, System.Actions,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer, Vcl.ComCtrls, dxCore,
  cxDateUtils, Vcl.Menus, cxCurrencyEdit, ufraFooter4Button, cxButtons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC;

type
  TfrmServiceLevel = class(TfrmMasterBrowse)
    Panel1: TPanel;
    pnl2: TPanel;
    lbl4: TLabel;
    fedtAvarageServiceLevel: TcxCurrencyEdit;
    lbl3: TLabel;
    lblSupplier: TLabel;
    lblGrup: TLabel;
    lblSubGrup: TLabel;
    edtKodeSuplier: TEdit;
    edtNamaSuplier: TEdit;
    chkAllSup: TCheckBox;
    edtGrpCd: TEdit;
    edtGrpNm: TEdit;
    chkAllGrp: TCheckBox;
    edtSubGrpCd: TEdit;
    edtSubGrpNm: TEdit;
    chkAllSubGrp: TCheckBox;
    procedure actEditExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtKodeSuplierKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridGetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
  private
    procedure ParseHeaderGrid;
    procedure ParseDataGrid;
//    function GetPODetil(AFromDate, AToDate, ASupCode: string): TResultDataSet;
   // function CountServiceLevel(ANoPO: string): TResultDataSet;
   // function CountAvarageServiceLevel(AGrid: TAdvStringGrid): Real;
    function UpdatePOSetServiceLevel(AServiceLevel, APONo: string): Boolean;
    function UpdateSuplierSetServiceLevel(AServiceLevel, ASupCode: string): Boolean;
  public
    { Public declarations }
  end;

var
  frmServiceLevel: TfrmServiceLevel;

implementation

uses uTSCommonDlg, uConstanta, ufrmSearchSupplier, uAppUtils;

{$R *.dfm}

const
    _kolNo      : Integer = 0;
    _kolPoNo    : Integer = 1;
    _kolPoDate  : Integer = 2;
    _kolQtyPo   : Integer = 3;
    _kolRpPo    : Integer = 4;
    _kolQtyDo   : Integer = 5;
    _kolRpDo    : Integer = 6;
    _kolService : Integer = 7;
    _RowCount   : Integer = 2;
    _ColCOunt   : Integer = 8;


procedure TfrmServiceLevel.actEditExecute(Sender: TObject);
var i: integer;
    bAct1, bAct2: Boolean;
begin
  inherited;
  //init
  bAct1 := False;
  {
  for i:=1 to strgGrid.RowCount-1 do
  begin
    with strgGrid do
    begin
      bAct1 := UpdatePOSetServiceLevel(Cells[_kolService, i], Cells[_kolPoNo, i])
    end;
  end;
  }
  bAct2 := UpdateSuplierSetServiceLevel(FloatToStr(fedtAvarageServiceLevel.Value), edtKodeSuplier.Text);

  if (bAct1) and (bAct2) then
    CommonDlg.ShowConfirmGlobal(SAVE_SERVICE_LEVEL_SUCCESSFULLY);
 end;

procedure TfrmServiceLevel.actRefreshExecute(Sender: TObject);
begin
  inherited;
//  if (Trim(edtKodeSuplier.Text) <> '') or (chkAllSup.Checked) then
//  begin
//    if chkAllSup.Checked then
//      ParseDataByAllSup
//    else
//      ParseDataGrid;
//  end
//  else
//  begin
//    ParseDataByAllSup;
//  end;
end;

procedure TfrmServiceLevel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmServiceLevel.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'MONITORING SERVICE LEVEL';
  dtAwalFilter.Date := now;
  dtAkhirFilter.Date := now;
  ParseHeaderGrid;
end;

procedure TfrmServiceLevel.FormDestroy(Sender: TObject);
begin
  inherited;
  frmServiceLevel := nil;
end;

procedure TfrmServiceLevel.ParseHeaderGrid;
begin
  {with strgGrid do
  begin
    Clear;
    RowCount  := _RowCount;
    FixedRows := 1;
    ColCount  := _ColCOunt;

    Cells[_kolNo,0]     := 'No.';
    Cells[_kolPoNo,0]   := 'PO NO.';
    Cells[_kolPoDate,0] := 'PO DATE';
    Cells[_kolQtyPo,0]  := 'TOTAL QTY PO';
    Cells[_kolRpPo,0]   := 'TOTAL PO (RP.)';
    Cells[_kolQtyDo,0]  := 'TOTAL QTY DO';
    Cells[_kolRpDo,0]   := 'TOTAL DO (RP.)';
    Cells[_kolService,0]:= 'SERVICE LEVEL (%)';

    AutoSize := true;

  end;
  }
end;

procedure TfrmServiceLevel.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key = Ord('C'))and(ssctrl in Shift) then
    GetAndRunButton('btnAdd');
  if(Key = Ord('S'))and(ssctrl in Shift) then
    GetAndRunButton('btnUpdate');
  if(Key = VK_ESCAPE) then
    GetAndRunButton('btnClose');
end;

procedure TfrmServiceLevel.ParseDataGrid;
var i: integer;
  sSQL: string;
begin
  ParseHeaderGrid;


  sSQL  := 'SELECT P.PO_NO, P.PO_DATE, (P.PO_TOTAL + P.PO_PPN + P.PO_PPNBM) as PO_TOTAL,'
        + ' (select sum(dod1.DOD_QTY_ORDER_RECV * dod1.DOD_PRICE * (1 - (1 *  dod1.dod_disc1 /100) - ((1 - 1 *  dod1.dod_disc1 /100) * dod1.dod_disc2 /100) ) * (1 + CAST(dod1.DOD_PPN_PERSEN/100 as double PRECISION))'
        + ')'
        + ' from do_detil dod1'
        + ' where dod1.DOD_DO_NO = d.DO_NO'
        + ' and dod1.DOD_DO_UNT_ID = d.DO_UNT_ID'
        + ' )'
        + ' as  DO_TOTAL,'
        + ' (SELECT SUM(POD_QTY_ORDER) FROM PO_DETIL'
        + ' WHERE POD_PO_NO = P.PO_NO'
        + ' and POD_PO_UNT_ID = p.PO_UNT_ID'
        + ' ) AS TOT_QTY_PO,'
        + ' (SELECT SUM(DOD_QTY_ORDER_RECV) FROM DO_DETIL'
        + ' WHERE DOD_DO_NO = D.DO_NO'
        + ' and DOD_DO_UNT_ID = D.DO_UNT_ID'
        + ' ) AS TOT_QTY_DO'
        + ' FROM PO P'
        + ' INNER JOIN DORD D ON D.DO_PO_NO = P.PO_NO'
        + ' and d.DO_PO_UNT_ID = p.PO_UNT_ID'
        + ' INNER JOIN SUPLIER_MERCHAN_GRUP SUPMG ON SUPMG.SUPMG_SUB_CODE = P.PO_SUPMG_SUB_CODE'
        + ' and SUPMG.SUPMG_UNT_ID = p.PO_SUPMG_UNT_ID'
        + ' INNER JOIN SUPLIER SPR ON SUPMG.SUPMG_CODE = SPR.SUP_CODE'
        + ' AND SUPMG.SUPMG_SUP_UNT_ID = SPR.SUP_UNT_ID'
        + ' and P.PO_DATE >= '+ TAppUtils.QuotD(dtAwalFilter.Date)
        + ' AND P.PO_DATE <= '+ TAppUtils.QuotD(dtAkhirFilter.Date)
        + ' AND SPR.SUP_CODE = '+ QuotedStr(edtKodeSuplier.Text)
        + ' AND SPR.SUP_UNT_ID = '+ IntToStr(MasterNewUnit);
  {
  with cOpenQuery(sSQL)do
  begin
    try
      i := strgGrid.FixedRows;
      while not Eof do
      begin
        if i > strgGrid.FixedRows then
          strgGrid.AddRow;

        strgGrid.Cells[_kolNo,i]      := inttostr(i);
        strgGrid.Cells[_kolPoNo,i]    := FieldByName('PO_NO').AsString;
        strgGrid.Cells[_kolPoDate,i]  := FieldByName('PO_DATE').AsString;
        strgGrid.Cells[_kolQtyPo,i]   := FieldByName('TOT_QTY_PO').AsString;
        strgGrid.Cells[_kolRpPo,i]    := FieldByName('PO_TOTAL').AsString;
        strgGrid.Cells[_kolQtyDo,i]   := FieldByName('TOT_QTY_DO').AsString;
        strgGrid.Cells[_kolRpDo,i]    := FieldByName('DO_TOTAL').AsString;
        strgGrid.Floats[_kolService,i] := FieldByName('TOT_QTY_DO').AsFloat / FieldByName('TOT_QTY_PO').AsFloat * 100;

        Inc(i);
        Next;
      end;
    finally
      Free;
      strgGrid.AutoSize := true;
    end;
  end;
  }

end;

procedure TfrmServiceLevel.edtKodeSuplierKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var dataSuplier: TDataSet;
begin
  {if (Key = VK_RETURN) then
  begin
    SetLength(arrParam, 2);
    arrParam[0].tipe := ptString;
    arrParam[0].data := edtKodeSuplier.Text;
    arrParam[1].tipe := ptInteger;
    arrParam[1].data := MasterNewUnit.ID;

    if not Assigned(MonitoringServiceLevel) then
      MonitoringServiceLevel := TMonitoringServiceLevel.Create;

    dataSuplier := MonitoringServiceLevel.CekKodeSuplier(arrParam);

    if dataSuplier.RecordCount > 0 then
      edtNamaSuplier.Text := dataSuplier.FieldByName('SUP_NAME').AsString
    else
    begin
      CommonDlg.ShowMessage('Suplier code is not valid. Press F5 to search');
      edtKodeSuplier.SetFocus;
    end;

    btnShow.SetFocus;
  end
  else if (Key = VK_F5) then
  begin
    if not assigned(frmDialogSearchSupplier) then
      frmDialogSearchSupplier := TfrmDialogSearchSupplier.Create(Application);

    frmDialogSearchSupplier.FormPengguna := fmServiceLevel;
    SetFormPropertyAndShowDialog(frmDialogSearchSupplier);

    if (frmDialogSearchSupplier.IsProcessSuccessfull) then
    begin
      edtKodeSuplier.Text := frmDialogSearchSupplier.strgGrid.Cells[0, frmDialogSearchSupplier.strgGrid.Row];
      edtNamaSuplier.Text := frmDialogSearchSupplier.strgGrid.Cells[1, frmDialogSearchSupplier.strgGrid.Row];
    end;
    frmDialogSearchSupplier.Free;
  end;
  }
end;


function TfrmServiceLevel.UpdatePOSetServiceLevel(AServiceLevel,
  APONo: string): Boolean;
begin
  {SetLength(arrParam, 3);
  arrParam[0].tipe := ptString;
  arrParam[0].data := AServiceLevel;
  arrParam[1].tipe := ptString;
  arrParam[1].data := APONo;
  arrParam[2].tipe := ptInteger;
  arrParam[2].data := MasterNewUnit.ID;

  if not Assigned(MonitoringServiceLevel) then
    MonitoringServiceLevel := TMonitoringServiceLevel.Create;

  Result := MonitoringServiceLevel.UpdatePOSetServiceLevel(arrParam);
  }
end;

function TfrmServiceLevel.UpdateSuplierSetServiceLevel(AServiceLevel,
  ASupCode: string): Boolean;
begin
  {SetLength(arrParam, 3);
  arrParam[0].tipe := ptString;
  arrParam[0].data := AServiceLevel;
  arrParam[1].tipe := ptString;
  arrParam[1].data := ASupCode;
  arrParam[2].tipe := ptInteger;
  arrParam[2].data := MasterNewUnit.ID;

  if not Assigned(MonitoringServiceLevel) then
    MonitoringServiceLevel := TMonitoringServiceLevel.Create;

  Result := MonitoringServiceLevel.UpdateSuplierSetServiceLevel(arrParam);
  }
end;

procedure TfrmServiceLevel.strgGridGetFloatFormat(Sender: TObject; ACol,
  ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  inherited;
  FloatFormat := '%.3n';
  if (ACol in [_kolQtyPo,_kolQtyDo]) and (ARow > 0) then
    IsFloat := True
  else
  if (ACol in [_kolRpPo,_kolRpDo,_kolService]) and (ARow > 0) then
  begin
    FloatFormat := '%.2n';
    IsFloat := True;
  end
  else
    IsFloat := False;
end;

end.



