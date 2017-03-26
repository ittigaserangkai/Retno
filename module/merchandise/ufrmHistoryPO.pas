unit ufrmHistoryPO;

interface

uses
  Windows, Messages, SysUtils, DateUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  cxGroupBox, cxCheckGroup, System.Actions, Vcl.ActnList,
  ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC;

type
  TfrmHistoryPO = class(TfrmMasterBrowse)
    pnlTop: TPanel;
    schckgrpStatusPO: TcxCheckGroup;
    lbl1: TLabel;
    dtTglFrom: TcxDateEdit;
    dtTglTo: TcxDateEdit;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    edtSupplierCode: TEdit;
    edtSuplierName: TEdit;
    btnShow: TcxButton;
    edtMercNm: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure btnShowClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtSupplierCodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridDblClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure cbpMerchandiseChange(Sender: TObject);
  private
    function GetListMerchandiseByUnitId(): TDataSet;
    function GetListStatusPOByUnitId(): TDataSet;
    function GetSuplierNameByCode(ACode: string): string;
    function GetListPO(AStatusPO: string): TDataSet;
    procedure ParseComboMerchandise();
    procedure ParseListStatusPO();
    procedure ParseDataPO(AStatusPO: string);
  public
    procedure IsiDataSupplier;
    { Public declarations }
  end;

var
  frmHistoryPO: TfrmHistoryPO;

implementation

uses  uTSCommonDlg, uConstanta, ufrmSearchSupplier, ufrmDisplayPO, uRetnoUnit;

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
  for i := 0 to schckgrpStatusPO.Properties.Items.Count - 1 do
  begin
    if schckgrpStatusPO.States[i]=cbsChecked then
      strTemp := strTemp + QuotedStr(schckgrpStatusPO.Properties.Items[i].Caption) + ',';
  end;
  strTemp := Copy(strTemp, 0, Length(strTemp) - 1);
  strTemp := '(' + strTemp + ')';

  ParseDataPO(strTemp);
  IsiDataSupplier;
//  strgGrid.AutoSizeColumns(True, 5);
end;

function TfrmHistoryPO.GetListMerchandiseByUnitId: TDataSet;
begin
  Result := nil;
end;

function TfrmHistoryPO.GetListStatusPOByUnitId: TDataSet;
begin
  Result := nil;
end;

function TfrmHistoryPO.GetSuplierNameByCode(ACode: string): string;
begin
end;

procedure TfrmHistoryPO.ParseComboMerchandise;
var dataMerchandise: TDataSet;
begin
  dataMerchandise := GetListMerchandiseByUnitId;
  {
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
  }
end;

procedure TfrmHistoryPO.ParseListStatusPO;
var dataStatusPO: TDataSet;
    i: Integer;
begin
  dataStatusPO := GetListStatusPOByUnitId;
  {
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
  }
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
    {if not Assigned(frmDialogSearchSupplier) then
      frmDialogSearchSupplier := TfrmDialogSearchSupplier.Create(Application);

    if cbpMerchandise.Text = 'ALL' then
      frmDialogSearchSupplier.MerchanId := ''
    else
      frmDialogSearchSupplier.MerchanId := cbpMerchandise.Cells[0, cbpMerchandise.Row];
    frmDialogSearchSupplier.FormPengguna := fmHistoryPO;
    SetFormPropertyAndShowDialog(frmDialogSearchSupplier);
    }
    if frmDialogSearchSupplier.IsProcessSuccessfull then
    begin
      edtSupplierCode.Text := frmDialogSearchSupplier.SupplierCode;
    end;

    frmDialogSearchSupplier.Free;
  end;

  if Key = VK_RETURN then
    edtSuplierName.Text := GetSuplierNameByCode(edtSupplierCode.Text);
end;

function TfrmHistoryPO.GetListPO(AStatusPO: string): TDataSet;
begin
  Result := nil;
  {
  if not Assigned(HistoryPO) then
    HistoryPO := THistoryPO.Create;

  if (cbpMerchandise.Text = 'ALL') and (edtSupplierCode.Text = '') then
  begin
    SetLength(arrParam, 3);
    arrParam[0].tipe := ptDateTime;
    arrParam[0].data := dtTglFrom.Date;
    arrParam[1].tipe := ptDateTime;
    arrParam[1].data := dtTglTo.Date;
    arrParam[2].tipe := ptInteger;
    arrParam[2].data := masternewunit.id;

    HistoryPO.StatusPO := AStatusPO;
    Result := HistoryPO.GetListPOByPeriode(arrParam);
  end
  else if (cbpMerchandise.Text <> 'ALL') and (edtSupplierCode.Text = '') then
  begin
    SetLength(arrParam, 4);
    arrParam[0].tipe := ptDateTime;
    arrParam[0].data := dtTglFrom.Date;
    arrParam[1].tipe := ptDateTime;
    arrParam[1].data := dtTglTo.Date;
    arrParam[2].tipe := ptInteger;
    arrParam[2].data := masternewunit.id;
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
    arrParam[1].data := dtTglTo.Date;
    arrParam[2].tipe := ptInteger;
    arrParam[2].data := masternewunit.id;
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
    arrParam[1].data := dtTglTo.Date;
    arrParam[2].tipe := ptInteger;
    arrParam[2].data := masternewunit.id;
    arrParam[3].tipe := ptString;
    arrParam[3].data := edtSupplierCode.Text;
    arrParam[4].tipe := ptString;
    arrParam[4].data := cbpMerchandise.Cells[0, cbpMerchandise.Row];

    HistoryPO.StatusPO := AStatusPO;
    Result := HistoryPO.GetListPOByPeriodeMerchanAndAsuplierCode(arrParam);
  end;
  }
end;

procedure TfrmHistoryPO.ParseDataPO(AStatusPO: string);
var dataPO: TDataSet;
    i: Integer;
begin
  dataPO := GetListPO(AStatusPO);
  {
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
        Cells[5, i] := CurrToStr(dataPO.fieldbyname('PO_TOTAL').AsCurrency
                          + dataPO.fieldbyname('PO_PPN').AsCurrency
                          + dataPO.fieldbyname('PO_PPNBM').AsCurrency
                          );
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
  }
end;

procedure TfrmHistoryPO.strgGridDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
var
  Key: Char;
  st: string;
begin
  inherited;
  if not Assigned(frmDisplayPO) then
    frmDisplayPO := TfrmDisplayPO.Create(Self);

  Key := #13;

//  st := strgGrid.Cells[0, strgGrid.Row];
  frmDisplayPO.edtPONo.Text := st;
  frmDisplayPO.edtPONoKeyPress(Self, Key);
  frmDisplayPO.Modul:= mHistoryPO;
  frmDisplayPO.Show;
end;

procedure TfrmHistoryPO.IsiDataSupplier;
var
  sSQL: String;
  i: Integer;
begin
  try
    Self.Enabled := False;
    {
    for i := 1 to strgGrid.RowCount - 1 do
    begin
      cShowWaitWindow(strgGrid.Cells[0,i]);
      
      sSQL := 'select c.sup_code, c.sup_name from po a, SUPLIER_MERCHAN_GRUP b, suplier c'
              + ' where po_no = ' + Quot(strgGrid.Cells[0,i])
              + ' and a.po_supmg_sub_code = b.SUPMG_SUB_CODE'
              + ' and b.SUPMG_CODE = c.sup_code';

      with cOpenQuery(sSQL) do
      begin
        try
          while not Eof do
          begin
            if not Fields[0].IsNull then
              strgGrid.Cells[3,i] := FieldByName('sup_code').AsString + '-' + FieldByName('sup_name').AsString;
            Next;
          end;
        finally
          Free;
        end;
      end;
    end;
    }
  finally
    cCloseWaitWindow;
    Self.Enabled := True;
  end;
end;

procedure TfrmHistoryPO.cbpMerchandiseChange(Sender: TObject);
begin
  inherited;
//  edtMercNm.Text  := cbpMerchandise.Cells[2, cbpMerchandise.Row];
end;

end.


