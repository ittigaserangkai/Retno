unit ufrmBarcodeRequest;

interface

uses
  SysUtils, Classes, Controls, Forms, ufrmMasterBrowse, StdCtrls, ExtCtrls,
  ActnList, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  cxButtonEdit, System.Actions, ufraFooter4Button, cxButtons, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxPC;

type
  TfrmBarcodeRequest = class(TfrmMasterBrowse)
    Panel1: TPanel;
    lbl6: TLabel;
    Label1: TLabel;
    edtSupplierCode: TEdit;
    edtSupplierName: TEdit;
    dtDateFrom: TcxDateEdit;
    Label3: TLabel;
    dtDateTo: TcxDateEdit;
    btnAddRow: TcxButton;
    chkDateOfTransaction: TCheckBox;
    edbNoTransaksi: TcxButtonEdit;
    actAddRow: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtSupplierCodeKeyPress(Sender: TObject; var Key: Char);
    procedure actAddExecute(Sender: TObject);
    procedure actAddRowExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure edbNoTransaksiButtonClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetHeaderGrid;
    procedure FetchDataBarcodeRequest;
    function SearchTo: Integer;
    function GEtSqlListBarcodeRequest(SearchNo: Integer): string;
  public
    { Public declarations }
  end;

var
  frmBarcodeRequest: TfrmBarcodeRequest;

implementation
{$R *.dfm}
uses
  ufrmDialogBarcodeRequest, uTSCommonDlg, uAppUtils;



procedure TfrmBarcodeRequest.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'BARCODE LABEL REQUESTITION';
end;

procedure TfrmBarcodeRequest.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmBarcodeRequest.FormDestroy(Sender: TObject);
begin
  inherited;
  frmBarcodeRequest := nil;
end;

procedure TfrmBarcodeRequest.FetchDataBarcodeRequest;
var
  I     : Integer;
begin

  SetHeaderGrid;
  {
  with cOpenQuery(GEtSqlListBarcodeRequest(SearchTo), False) do
  begin
    try
      Last;
      I := 1;
      if RecordCount > 0 then
      begin
        strgGrid.RowCount := RecordCount + I;

        First;
        while not Eof do
        begin
          strgGrid.Cells[0, I] := IntToStr(I) +'.';
          strgGrid.Cells[1, I] := FieldByName('BAR_NO').AsString;
          strgGrid.Cells[2, I] := FormatDateTime('dd/MM/yyyy', FieldByName('BAR_DATE').AsDateTime);
          strgGrid.Cells[3, I] := FieldByName('SUP_CODE').AsString;
          strgGrid.Cells[4, I] := FieldByName('SUP_NAME').AsString;
          strgGrid.Cells[5, I] := FieldByName('BAR_TOTAL_PRICE').AsString;
          Inc(I);

          Next;
        end;
        strgGrid.AutoSize:= True;
      end;
    finally
      Free;
    end;
  end;
  }
end;

procedure TfrmBarcodeRequest.SetHeaderGrid;
begin
  {
  with strgGrid do
  begin
    Clear;
    RowCount  := 2;
    ColCount  := 6;
    FixedRows := 1;
    
    Cells[0, 0] := 'No';
    Cells[1, 0] := 'Transaction No';
    Cells[2, 0] := 'Date Transaction';
    Cells[3, 0] := 'Supplier Code';
    Cells[4, 0] := 'Supplier Name';
    Cells[5, 0] := 'Total Transaction';
  end;
  }
end;

function TfrmBarcodeRequest.SearchTo: Integer;
var
  AResult: Integer;
begin
  AResult:= -1;
  if ((edbNoTransaksi.Text = '') and (edtSupplierCode.Text = '') and
      (chkDateOfTransaction.Checked = False)) then AResult := 0;                //All

  if Length(edbNoTransaksi.Text) >= 10 then AResult := 1;                              //by Transaction No

  if ((Length(edbNoTransaksi.Text) < 10) and (Length(edtSupplierCode.Text) > 2) and
    (chkDateOfTransaction.Checked = False)) then AResult := 2;                  //by Supplier Code

  if ((Length(edbNoTransaksi.Text) < 10) and (Length(edtSupplierCode.Text) > 2) and
    (chkDateOfTransaction.Checked = True)) then AResult := 3;                   //by Supplier Code and Date

  if ((Length(edbNoTransaksi.Text) < 10) and (edtSupplierCode.Text = '') and
    (chkDateOfTransaction.Checked = True)) then AResult := 4;                   //by Date

  Result:= AResult;
end;

function TfrmBarcodeRequest.GEtSqlListBarcodeRequest(SearchNo: Integer): string;
var
  s: string;
begin
  s:= 'SELECT DISTINCT BR.*, SUP.SUP_CODE, SUP.SUP_NAME,'
    + ' BR.BAR_TOTAL_PRICE'
    + ' FROM BARCODE_REQUEST BR'
    + ' LEFT JOIN SUPLIER SUP ON BR.BAR_SUP_CODE = SUP.SUP_CODE'
    + ' AND BR.BAR_SUP_UNT_ID = SUP.SUP_UNT_ID'
    + ' LEFT JOIN BARCODE_REQUEST_DETIL BRD ON BR.BAR_NO = BRD.BARD_BAR_NO'
    + ' AND BR.BAR_UNT_ID = BRD.BARD_BAR_UNT_ID'
    + ' WHERE BAR_UNT_ID = '+ IntToStr(MasterNewUnit);

  if SearchNo = 0 then
  begin
    s:= s;
  end
  else if SearchNo = 1 then
  begin
    s:= s
      + ' AND BR.BAR_NO = '+ QuotedStr(edbNoTransaksi.Text)
      + ' ORDER BY BR.BAR_NO, BR.BAR_DATE, SUP.SUP_CODE, SUP.SUP_NAME';
  end
  else if SearchNo = 2 then
  begin
    s:= s
      + ' AND SUP.SUP_CODE = '+ QuotedStr(edtSupplierCode.Text);
  end
  else if SearchNo = 3 then
  begin
    s:= s
      + ' AND SUP.SUP_CODE = '+ QuotedStr(edtSupplierCode.Text)
      + ' AND (BR.BAR_DATE BETWEEN '+ TAppUtils.QuotD(dtDateFrom.Date)
      + ' AND '+ TAppUtils.QuotD(dtDateTo.Date, True) + ')';
  end
  else
  begin
    s:= s
      + ' AND (BR.BAR_DATE BETWEEN '+ TAppUtils.QuotD(dtDateFrom.Date)
      + ' AND '+ TAppUtils.QuotD(dtDateTo.Date, True) + ')';
  end;

  s:= s
    + ' ORDER BY BR.BAR_NO, BR.BAR_DATE, SUP.SUP_CODE, SUP.SUP_NAME';

  Result:= s;

end;

procedure TfrmBarcodeRequest.FormShow(Sender: TObject);
begin
  inherited;
    SetHeaderGrid;
end;

procedure TfrmBarcodeRequest.edtSupplierCodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
    Key := UpCase(Key);
end;

procedure TfrmBarcodeRequest.actAddExecute(Sender: TObject);
begin
  inherited;
  if not Assigned(frmDialogBarcodeRequest) then
    frmDialogBarcodeRequest := TfrmDialogBarcodeRequest.Create(Application);

  frmDialogBarcodeRequest.Process := ptAdd;
  SetFormPropertyAndShowDialog(frmDialogBarcodeRequest);

  if IsSuccessfull then
  begin
    CommonDlg.ShowConfirmSuccessfull(atAdd);
    FetchDataBarcodeRequest;
  end;
  frmDialogBarcodeRequest.Free;
end;

procedure TfrmBarcodeRequest.actAddRowExecute(Sender: TObject);
begin
  inherited;
  FetchDataBarcodeRequest;
end;

procedure TfrmBarcodeRequest.actEditExecute(Sender: TObject);
begin
  inherited;
  if not Assigned(frmDialogBarcodeRequest) then
    frmDialogBarcodeRequest := TfrmDialogBarcodeRequest.Create(Application);

  frmDialogBarcodeRequest.Process := ptEdit;
//  frmDialogBarcodeRequest.edtBarNo.Text := strgGrid.Cells[1, strgGrid.Row];
  SetFormPropertyAndShowDialog(frmDialogBarcodeRequest);

  if IsSuccessfull then
  begin
    CommonDlg.ShowConfirmSuccessfull(atEdit);
    FetchDataBarcodeRequest;
  end;
  frmDialogBarcodeRequest.Free;
end;

procedure TfrmBarcodeRequest.actRefreshExecute(Sender: TObject);
begin
  inherited;
  FetchDataBarcodeRequest;
end;

procedure TfrmBarcodeRequest.edbNoTransaksiButtonClick(Sender: TObject);
var
  s: string;
begin
  inherited;
  s := 'SELECT a.BAR_NO as NOBARCODE, BAR_DATE as TANGGAL, b.SUP_CODE as KODESUPPLIER, b.SUP_NAME as NAMASUPPLIER, a.BAR_TOTAL_PRICE as TOTAL'
     + ' FROM BARCODE_REQUEST a'
     + ' LEFT JOIN SUPLIER b ON a.BAR_SUP_CODE = b.SUP_CODE'
     + ' AND a.BAR_SUP_UNT_ID = b.SUP_UNT_ID'
     + ' WHERE a.BAR_UNT_ID = ' + IntToStr(masternewunit);
  {
  with clookup('Daftar Barcode Request', s, 200, 1, True) do
  begin
    Try
      if Strings[0] = '' then Exit;
      edbNoTransaksi.Text   := Strings[0];
      edtSupplierCode.Text  := Strings[2];
      edtSupplierName.Text  := Strings[3];
      
      btnAddRowClick(Self);
      
    Finally
      Free;
    End;
  end;                  
  }

end;

end.


