unit ufrmWastageReal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, Vcl.ActnList,
  cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  Vcl.Menus, cxButtons, cxCurrencyEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, System.Actions,
  ufraFooter4Button, cxLabel, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC;

type
  TfrmWastageReal = class(TfrmMasterBrowse)
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    dtTgl: TcxDateEdit;
    curredtSubTotal: TcxCurrencyEdit;
    mmoNote: TMemo;
    lbl6: TLabel;
    curredtPPN: TcxCurrencyEdit;
    curredtPPNBM: TcxCurrencyEdit;
    curredtTotWastage: TcxCurrencyEdit;
    lbl10: TLabel;
    lbl11: TLabel;
    edtWastageNo: TEdit;
    lblXXX: TLabel;
    Label1: TLabel;
    pnl4: TPanel;
    lbl7: TLabel;
    edtProductName: TEdit;
    cxcolKODEBARANG: TcxGridDBColumn;
    cxcolALIASBARANG: TcxGridDBColumn;
    cxcolUOM: TcxGridDBColumn;
    cxcolQTY: TcxGridDBColumn;
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure strgGridGetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
    procedure cbpWstgRealNoKeyPress(Sender: TObject; var Key: Char);
    procedure edtWastageNoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fraFooter5Button1btnDeleteClick(Sender: TObject);
    procedure colgridCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure colgridClickCell(Sender: TObject; ARow, ACol: Integer);

  private
//    FBarang: TNewBarang;
    FParamList: TStringList;
//    FWastage: TWastage;
    procedure ClearForm();
    procedure SetParamList(const Value: TStringList);
  public
    FNoBukti: string;
    procedure JumlahAkhir;
    procedure LoadDataWastage;
    procedure LoadDetilWastage;
    procedure LoadHeaderWastage;
    procedure RefreshData; override;
    property ParamList: TStringList read FParamList write SetParamList;
  end;

var
  frmWastageReal: TfrmWastageReal;

implementation

uses  uTSCommonDlg, ufrmSearchWastageReal, uConstanta, udmReport, uSpell,
  ufrmDialogPrintPreview, ufrmDialogWastageReal, uRetnoUnit;

const
  _kolTotal : Integer = 10;
  _kolPPNBM : Integer = 9;
  _kolPPNBMPersen : Integer = 8;
  _kolPPN : Integer = 7;
  _kolPPNPersen : Integer = 6;
  _kolUOMStock : Integer = 5;
  _kolHargaAverage : Integer = 4;
  _kolQTY : Integer = 3;
  _kolUOMKonversi : Integer = 2;
  _kolAliasBarang : Integer = 1;
  _kolKodeBarang : Integer = 0;

{$R *.dfm}

procedure TfrmWastageReal.actAddExecute(Sender: TObject);
begin
  inherited;
  FNoBukti := '';
  frmDialogWastageReal := TfrmDialogWastageReal.Create(Self);
  SetFormPropertyAndShowDialog(frmDialogWastageReal);
end;

procedure TfrmWastageReal.actEditExecute(Sender: TObject);
begin
  inherited;
//  if Trim(FWastage.WSTRL_NO) = '' then
  begin
    CommonDlg.ShowError('No Bukti Belum Dipilih');
    edtWastageNo.SetFocus;
    Exit;
  end;

//  FNoBukti := FWastage.WSTRL_NO;
  frmDialogWastageReal := TfrmDialogWastageReal.Create(Self);
  frmDialogWastageReal.Show;
end;

procedure TfrmWastageReal.actPrintExecute(Sender: TObject);
begin
  inherited;

  if edtWastageNo.Text <> '' then
  begin
//    DoSlipWastage(Trim(edtWastageNo.Text),IntToStr(masternewunit.id),Floginfullname, masternewunit.Nama,MasterNewUnit.ID);
  end
  else
  CommonDlg.ShowErrorEmpty('NO Transaksi');
end;

procedure TfrmWastageReal.actRefreshExecute(Sender: TObject);
begin
  inherited;

//  FWastage.LoadByWSTRL_NO(edtWastageNo.Text, masternewunit.id);
  LoadHeaderWastage;
  LoadDetilWastage;
end;

procedure TfrmWastageReal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmWastageReal.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'WASTAGE DAMAGE / REAL';
  ParamList := TStringList.Create;
//  FWastage := TWastage.Create(Self);
//  FBarang := TNewBarang.Create(Self);
end;

procedure TfrmWastageReal.FormDestroy(Sender: TObject);
begin
  inherited;
  frmWastageReal := nil;
end;

procedure TfrmWastageReal.FormShow(Sender: TObject);
begin
  inherited;
  ClearForm();

end;

procedure TfrmWastageReal.ClearForm();
begin
  
end;

procedure TfrmWastageReal.SetParamList(const Value: TStringList);
begin
  FParamList := Value;
end;

procedure TfrmWastageReal.strgGridGetFloatFormat(Sender: TObject; ACol,
  ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  inherited;
  FloatFormat := '%.2n';
  if ACol in [3,4,5] then
    IsFloat := True
  else
    IsFloat := False;
end;

procedure TfrmWastageReal.cbpWstgRealNoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
//  Key := CharUpper(Key);
end;

procedure TfrmWastageReal.edtWastageNoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sSQL: string;
begin
  inherited;
  if (Key = vk_F5 ) then
  begin
    sSQL := 'select wstrl_no as "NO WASTAGE", wstrl_date as "TANGGAL" '
            + ' from wastage_real '
            + ' where wstrl_unt_id = ' + IntToStr(masternewunit);
    {
    with cLookUp('DAFTAR WASTAGE',sSQL,200,1,True) do
    begin
      if Strings[0] <> '' then
      begin
        edtWastageNo.Text := Strings[0];
        LoadDataWastage;
      end;
      Free;
    end;
    }
  end;
end;

procedure TfrmWastageReal.JumlahAkhir;
begin
//  curredtSubTotal.Value := SumColAdvColGrid(colgrid, _kolTotal);
//  curredtPPN.Value := SumColAdvColGrid(colgrid, _kolPPN);
//  curredtPPNBM.Value := SumColAdvColGrid(colgrid, _kolPPNBM);

  curredtTotWastage.Value := curredtSubTotal.Value + curredtPPN.Value + curredtPPNBM.Value ;
end;

procedure TfrmWastageReal.LoadDetilWastage;
var
  j: Integer;
  i: Integer;
begin
  {
  cClearGrid(colgrid, False);

  j := colgrid.FixedRows;
  for i := 0 to FWastage.WastageItems.Count - 1 do
  begin
    colgrid.Cells[_kolKodeBarang, j] := FWastage.WastageItems[i].Barang.Kode;
    colgrid.Cells[_kolAliasBarang, j] := FWastage.WastageItems[i].Barang.Alias;
    colgrid.Cells[_kolUOMKonversi, j] := FWastage.WastageItems[i].SATUAN;
    colgrid.Floats[_kolQTY, j] :=  (FWastage.WastageItems[i].QTY);
    colgrid.Cells[_kolHargaAverage, j] := FloatToStr(FWastage.WastageItems[i].HARGA);
    colgrid.Cells[_kolUOMStock, j] := FWastage.WastageItems[i].Barang.KodeSatuanStock.UOM;
    colgrid.Cells[_kolPPNPersen, j] :=FloatToStr(FWastage.WastageItems[i].PPN_PERSEN);
    colgrid.Cells[_kolPPN, j ] := FloatToStr(FWastage.WastageItems[i].PPN_NOMINAL);
    colgrid.Cells[_kolPPNBMPersen, j] := FloatToStr(FWastage.WastageItems[i].PPNBM_PERSEN);
    colgrid.Cells[_kolPPNBM, j] := FloatToStr(FWastage.WastageItems[i].PPNBM_NOMINAL);
    colgrid.Cells[_kolTotal , j] := FloatToStr(FWastage.WastageItems[i].Total);
    colgrid.AddRow;
    Inc(j);
  end;
  HapusBarisKosong(colgrid,_kolKodeBarang);
  JumlahAkhir;
  }
end;

procedure TfrmWastageReal.LoadHeaderWastage;
begin
//  edtWastageNo.Text := FWastage.WSTRL_NO;
//  dtTgl.Date := FWastage.WSTRL_DATE;
//  mmoNote.Text := FWastage.WSTRL_DESCRIPTION;

end;

procedure TfrmWastageReal.fraFooter5Button1btnDeleteClick(Sender: TObject);
begin
  inherited;
  {
  if CommonDlg.Confirm('Anda Yakin Ingin Menghapus Data Wastage Dengan No ' + edtWastageNo.Text) = mrYes then
  begin

    if not FWastage.RemoveFromDB then
    begin
      cRollbackTrans;
      CommonDlg.ShowMessage('Gagal Menghapus Data');
    end
    else
    begin
      cCommitTrans;
      cClearGrid(ColGrid, False);
      ClearByTag(frmWastageReal, [0]);
      CommonDlg.ShowMessage('Berhasil Menghapus Data');
    end;
  end;
  }
end;

procedure TfrmWastageReal.colgridCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  inherited;
  CanEdit := False;
end;

procedure TfrmWastageReal.colgridClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  inherited;
  {
  FBarang.LoadByKode(colgrid.Cells[_kolKodeBarang, colgrid.Row]);

  edtProductName.Text := FBarang.Alias;
  }
end;

procedure TfrmWastageReal.LoadDataWastage;
begin
//  FWastage.LoadByWSTRL_NO(edtWastageNo.Text, masternewunit.id);
//  LoadHeaderWastage;
//  LoadDetilWastage;

end;

procedure TfrmWastageReal.RefreshData;
begin
  inherited;
  // TODO -cMM: TfrmWastageReal.RefreshData default body inserted
end;

end.




