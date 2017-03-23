unit ufrmListQuotation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, ActnList,
  System.Actions, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer, Vcl.ComCtrls, dxCore,
  cxDateUtils, Vcl.Menus, cxButtonEdit, ufraFooter4Button, cxButtons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC;

type
  TfrmListQuotation = class(TfrmMasterBrowse)
    pnlTop: TPanel;
    lbl8: TLabel;
    lbl1: TLabel;
    lbl6: TLabel;
    lbl10: TLabel;
    btnShowList: TcxButton;
    dtTgl1: TcxDateEdit;
    dtTgl2: TcxDateEdit;
    lbl9: TLabel;
    lbl2: TLabel;
    edtKodeSup1: TcxButtonEdit;
    edtKodeSup2: TcxButtonEdit;
    cxgrdDetail: TcxGrid;
    grdViewDetail: TcxGridDBTableView;
    grdlvlDetail: TcxGridLevel;
    procedure actPrintExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnShowListClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtKodeSup1KeyPress(Sender: TObject; var Key: Char);
    procedure edtKodeSup2KeyPress(Sender: TObject; var Key: Char);
    procedure clgrdDetailGetFloatFormat(Sender: TObject; ACol,
      ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
    procedure strgGridQuotationGetFloatFormat(Sender: TObject; ACol,
      ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
    procedure edtKodeSup1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtKodeSup2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure clgrdQuotListClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure edtKodeSup1ClickBtn(Sender: TObject);
    procedure edtKodeSup2ClickBtn(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dtTgl1KeyPress(Sender: TObject; var Key: Char);
    procedure dtTgl2KeyPress(Sender: TObject; var Key: Char);
    procedure btnShowListKeyPress(Sender: TObject; var Key: Char);
    procedure clgrdQuotListCanEditCell(Sender: TObject; ARow,
      ACol: Integer; var CanEdit: Boolean);
    procedure clgrdDetailCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
  private
    { Private declarations }
  public
    procedure ClearStrGrid;
    { Public declarations }
    procedure DoPrintListQuotation
    (sNoRef : String ; iUnitID : Integer;sLoginFulName: String; sUnitName : String);
  published
  end;

var
  frmListQuotation: TfrmListQuotation;

implementation

uses uTSCommonDlg, uConstanta, ufrmDialogPrintPreview, uRetnoUnit, uAppUtils;

const
  _kolMURp2 = 8;
  _kolMURp1 = 7;
  _KolHrgAvg = 5;
  _KolTgl   : Integer = 1;
  _KolRefNo : Integer = 2;

{$R *.dfm}

procedure TfrmListQuotation.actPrintExecute(Sender: TObject);
var
  sNoRef: string;
begin
  inherited;
//  sNoRef := clgrdQuotList.Cells[_KolRefNo,clgrdQuotList.Row];
//  DoPrintListQuotation(sNoRef,MasterNewUnit.ID,FLoginFullname,MasterNewUnit.Nama);
end;

procedure TfrmListQuotation.actRefreshExecute(Sender: TObject);
begin
  inherited;
  if MasterNewUnit = 0 then
  begin
    CommonDlg.ShowError(ER_COMPANY_NOT_SPECIFIC);
    //frmMain.cbbCompCode.SetFocus;
    Exit;
  end;

  if (EdtKodeSup1.Text = '') and (EdtKodeSup2.Text='') then
  begin
    CommonDlg.ShowErrorEmpty('Suplier code');
    EdtKodeSup1.SetFocus;
    Exit;
  end;

  if EdtKodeSup2.Text='' then
  begin
    CommonDlg.ShowErrorEmpty('Second suplier code');
    EdtKodeSup2.SetFocus;
    Exit;
  end;
end;

{ TfrmListQuotation }


procedure TfrmListQuotation.FormShow(Sender: TObject);
begin
  inherited;
    lblHeader.Caption:= 'LISTING QUOTATION';
    frmListQuotation.Caption:= 'Listing Quotation';
//    dtTgl1.Date := cGetServerTime;   /// pake cGetServerTime aj mas
//    dtTgl2.Date := cGetServerTime;   /// pake cGetServerTime aj mas
end;

procedure TfrmListQuotation.btnShowListClick(Sender: TObject);
var
  iUnitID: Integer;
  sKodeSup1,sKodeSup2: string;
  sSQL: string;
begin
  inherited;
  ClearStrGrid;
  sKodeSup1 := edtKodeSup1.Text;
  sKodeSup2 := edtKodeSup2.Text;
  iUnitID   := MasterNewUnit;

  sSQL := 'SELECT Q.QUOT_DATE AS "Date of Quote",Q.QUOT_REF_NO AS "RefNo", '
        + ' S.SUP_CODE AS "Suplier Code",S.SUP_NAME AS "Suplier Name", '
        + ' SMG.SUPMG_LEAD_TIME AS "LeadTime",Q.QUOT_DATE_EFFECTIVE AS "Date Effective", '
        + ' Q.QUOT_REMARK AS "Remark" '
        + ' FROM QUOTATION Q '
        + ' INNER JOIN SUPLIER_MERCHAN_GRUP SMG ON '
        + ' AND (Q.QUOT_SUPMG_SUB_CODE = SMG.SUPMG_SUB_CODE) '
        + ' INNER JOIN SUPLIER S ON (SMG.SUPMG_CODE = S.SUP_CODE) '
        + ' WHERE (S.SUP_CODE BETWEEN '+ QuotedStr(sKodeSup1) +' AND '+ QuotedStr(sKodeSup2) + ')'
        + ' AND (Q.QUOT_DATE BETWEEN ' + TAppUtils.QuotD(dtTgl1.Date) + ' AND ' +  TAppUtils.QuotD(dtTgl2.Date) + ')' /// ini filter jam dipake mas
        + ' AND (Q.QUOT_UNT_ID = ' + IntToStr(iUnitID) + ')';

//  cQueryToGrid(sSQL,clgrdQuotList,True);
//  clgrdQuotList.AutoSizeColumns(True,8);
end;

procedure TfrmListQuotation.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := caFree; 
end;

procedure TfrmListQuotation.DoPrintListQuotation
(sNoRef : String ; iUnitID : Integer;sLoginFulName: String; sUnitName : String);
var
  sRefNo: string;
  sSQL1: string;
  sKodeSup1, sKodeSup2 : string;
begin
  sRefNo := sNoRef;
  sKodeSup1 := edtKodeSup1.Text;
  sKodeSup2 := edtKodeSup2.Text;



  sSql1 := 'SELECT '
         + ' Q.QUOT_REF_NO, Q.QUOT_DATE, Q.QUOT_DATE_EFFECTIVE, QD.QUOTD_PRICE,'
         + ' QD.QUOTD_SAT_CODE, B.BRG_CODE, B.BRG_NAME, QD.QUOTD_SAT_CODE,'
         + ' QD.QUOTD_MU_PERSEN, QD.QUOTD_MU_RUPIAH, QD.QUOTD_HARGA_AVERAGE,'
         + ' S.SUP_CODE, SUP_NAME'
         + ' FROM QUOTATION Q, BARANG B, QUOTATION_DETIL QD, SUPLIER_MERCHAN_GRUP SMG,'
         + ' SUPLIER S'
         + ' WHERE (Q.QUOT_ID = QD.QUOTD_QUOT_ID)'
         + ' AND (Q.QUOT_UNT_ID = QD.QUOTD_QUOT_UNT_ID)'
         + ' AND (Q.QUOT_SUPMG_SUB_CODE = SMG.SUPMG_SUB_CODE)'
         + ' AND (QD.QUOTD_BRG_CODE = B.BRG_CODE)'
         + ' AND (SMG.SUPMG_CODE = S.SUP_CODE)'
         + ' AND (Q.QUOT_UNT_ID = ' + IntToStr(iUnitID) + ')'
         + ' AND (SMG.SUPMG_CODE BETWEEN '+ QuotedStr(sKodeSup1)    /// ini filter jam dpake mas
         + ' AND ' + QuotedStr(sKodeSup2)+')'
         + ' AND (Q.QUOT_DATE BETWEEN ' + TAppUtils.QuotD(dtTgl1.Date)
         + ' AND ' +  TAppUtils.QuotD(dtTgl2.Date,True) + ')'
         + ' ORDER BY QUOT_REF_NO';

//  dmReportNew.EksekusiReport('ListQuotation', sSQL1, '', True);
end;

procedure TfrmListQuotation.edtKodeSup1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key:= UpCase(Key);
end;

procedure TfrmListQuotation.edtKodeSup2KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
    Key:= UpCase(Key);
end;

procedure TfrmListQuotation.clgrdDetailGetFloatFormat(
  Sender: TObject; ACol, ARow: Integer; var IsFloat: Boolean;
  var FloatFormat: String);
begin
  if ARow = 0 then Exit;
  FloatFormat:= '%0.2n';
  case ACol of
//    3 : IsFloat:= True;
    5..10: IsFloat:= True;
  else
    IsFloat:= False;
  end;
end;

procedure TfrmListQuotation.strgGridQuotationGetFloatFormat(
  Sender: TObject; ACol, ARow: Integer; var IsFloat: Boolean;
  var FloatFormat: String);
begin
  inherited;
  FloatFormat:= '%0.2n';
  if ACol = 5 then IsFloat:= True else IsFloat:= False;
end;

procedure TfrmListQuotation.edtKodeSup1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_F5) then edtKodeSup1ClickBtn(self)
  else if (Key = 13) then Perform(WM_NEXTDLGCTL,0,0)  ;
end;

procedure TfrmListQuotation.edtKodeSup2KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_F5) then edtKodeSup2ClickBtn(self)
  else if (Key = 13) then Perform(WM_NEXTDLGCTL,0,0)  ;
end;

procedure TfrmListQuotation.clgrdQuotListClickCell(Sender: TObject; ARow,
  ACol: Integer);
var
  iUnitCode: Integer;
  sSQL: string;
  sRefNo: string;
begin
//  sRefNo := clgrdQuotList.Cells[_KolRefNo,clgrdQuotList.Row];
  iUnitCode := MasterNewUnit;

  sSQL := 'SELECT C.BRG_CODE AS "Kode Barang",'
       + ' C.BRG_ALIAS AS "Nama Barang",'
       + ' B.QUOTD_SAT_CODE AS "UOM",'
       + ' D.TPHRG_CODE AS "Tipe Harga",'
       + ' B.QUOTD_HARGA_AVERAGE AS "Harga Avg",'
       + ' B.QUOTD_MU_PERSEN AS "Markup %",'
       + ' B.QUOTD_MU_RUPIAH AS "Markup Rp I",'
       + ' B.QUOTD_MU_RUPIAH_PLUS_PPN AS "Markup Rp II"'
       + ' FROM BARANG C, QUOTATION_DETIL B, QUOTATION A, REF$TIPE_HARGA D'
       + ' WHERE (A.QUOT_ID = B.QUOTD_QUOT_ID)'
       + ' AND (A.QUOT_UNT_ID = B.QUOTD_QUOT_UNT_ID)'
       + ' AND (B.QUOTD_BRG_CODE = C.BRG_CODE)'
       + ' AND (B.QUOTD_TIPE_HARGA_ID = D.TPHRG_ID)'
       + ' AND (B.QUOTD_TIPE_HARGA_UNT_ID = D.TPHRG_UNT_ID)'
       + ' AND (A.QUOT_REF_NO = ' + QuotedStr(sRefNo) + ')'
       + ' AND (A.QUOT_UNT_ID = ' + IntToStr(iUnitCode) + ')';
  {
  cQueryToGrid(sSQL,clgrdDetail,True);
  clgrdDetail.AutoSizeColumns(True,8);
  clgrdDetail.ColWidths[_KolHrgAvg] := 100;
  clgrdDetail.ColWidths[_kolMURp1] := 100;
  clgrdDetail.ColWidths[_kolMURp2] := 100;
  }
end;

procedure TfrmListQuotation.edtKodeSup1ClickBtn(Sender: TObject);
var
  sSql: string;
begin
  inherited;
  sSQL := ' Select sup_code as " Kode", sup_name as " Nama" '
          + ' from Suplier ';
  {
  with cLookUp('Suplier',sSQL) do
  begin
    try
     if Strings[0] = '' then
        Exit;
        edtKodeSup1.Text := Strings[0];
    finally
        Free;
    end;
  end;
  }
end;

procedure TfrmListQuotation.edtKodeSup2ClickBtn(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
  sSQL := ' Select sup_code as " Kode", sup_name as " Nama" '
          + ' from Suplier ';
  {
  with cLookUp('Suplier',sSQL) do
  begin
    try
     if Strings[0] = '' then
        Exit;
        edtKodeSup2.Text := Strings[0];
    finally
        Free;
    end;
  end;
   }
end;

procedure TfrmListQuotation.FormActivate(Sender: TObject);
begin
  inherited;
  ClearStrGrid;
end;

procedure TfrmListQuotation.dtTgl1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmListQuotation.dtTgl2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmListQuotation.btnShowListKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmListQuotation.clgrdQuotListCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  CanEdit := False;
end;

procedure TfrmListQuotation.clgrdDetailCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  CanEdit := False;
end;

procedure TfrmListQuotation.ClearStrGrid;
begin
//  cClearGrid(clgrdQuotList, False);
//  cClearGrid(clgrdDetail, False);
end;

end.
