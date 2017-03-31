unit ufrmReturTrader;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, ufrmMasterBrowse, StdCtrls, ExtCtrls,
  jpeg, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  cxButtonEdit, System.Actions, Vcl.ActnList, ufraFooter4Button,
  cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxPC;

type
  TfrmReturTrader = class(TfrmMasterBrowse)
    pnl1: TPanel;
    lblNoBukti: TLabel;
    lbl1: TLabel;
    lblKeteranga: TLabel;
    edtMerchangroup: TcxButtonEdit;
    edtKeterangan: TEdit;
    lblTanggal: TLabel;
    dtDate: TcxDateEdit;
    edtMerchandisenama: TEdit;
    btn1: TcxButton;
    edtNoBukti: TEdit;
    Image1: TImage;
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

  private
//    FNewRetur : TReturTRADER;
//    FBarang : TNewBarang;
//    FPO : TPO;
    FWaiting: Boolean;
    procedure HideCols;
    function InProcessing: Boolean;
    procedure SetDataRetur(aReturSupplier: integer);

    { Private declarations }
  public
  procedure LoadDataToGrid(aReturSupplier: Integer);
  procedure SetHeaderGrid;

    { Public declarations }
  end;

var
  frmReturTrader: TfrmReturTrader;

implementation
{$R *.dfm}
uses ufrmDialogReturTrader, udmReport, uTSCommonDlg;

const
{
No
Barang
Nama
UOM
QTY
NOMOR DO

HARGA
}
  _kolNO :Integer = 0;
  _kolPODID :Integer = 7;
  _kolReturItemID :Integer = 6;

  _KolBarang :Integer = 1;
  _KolNama :Integer = 2;
  _KolUOM :Integer = 3;
  _KolQTY :Integer = 4;
  _KOLPo :Integer = 5;


procedure TfrmReturTrader.actAddExecute(Sender: TObject);
begin
  inherited;
  edtNoBukti.Text := '';
//  dtDate.Date := cGetServerTime;
  edtMerchangroup.Text := '';
  edtMerchandisenama.Text := '';
  edtKeterangan.Text := '';
//  cClearGrid(strgGrid,False);


  frmDialogReturTrader := TfrmDialogReturTrader.Create(Self);
  frmDialogReturTrader.SetIDRetur(0);
  SetFormPropertyAndShowDialog(frmDialogReturTrader);

//  FNewRetur.LoadByID(frmDialogReturTrader.GetIDRetur, MasterNewUnit.ID);
//  SetDataRetur(FNewRetur);
end;

procedure TfrmReturTrader.actEditExecute(Sender: TObject);
begin
  inherited;
  if InProcessing then
    exit;

  try
    FWaiting := True;

    frmDialogReturTrader := TfrmDialogReturTrader.Create(Self);
//    frmDialogReturTrader.SetIDRetur(FNewRetur.ID);
    SetFormPropertyAndShowDialog(frmDialogReturTrader);

//    FNewRetur.LoadByID(frmDialogReturTrader.GetIDRetur, MasterNewUnit.ID);
//    SetDataRetur(FNewRetur);
  finally
    FWaiting:= False;
  end;
end;

procedure TfrmReturTrader.actPrintExecute(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
  {
  sSQL  := GetSQLSlipReturnTrader(masternewunit.id, edtNoBukti.Text,
        GetCompanyHeader(FLoginFullname,MasterNewunit.Nama,cGetServerTime, cGetServerTime));
  dmReportNew.EksekusiReport('slip_retur_TRADER', sSQL,'',True);
  }
end;

procedure TfrmReturTrader.actRefreshExecute(Sender: TObject);
var
  sSQL  : string;
  sSQL2 : string;
begin
  inherited;
  {
  sSQL  := GetSQLSlipReturnTrader(masternewunit.id, edtNoBukti.Text,
        GetCompanyHeader(FLoginFullname,MasterNewunit.Nama,cGetServerTime, cGetServerTime));
  sSQL2 := GetSQLTotalHutang(masternewunit.id,edtMerchangroup.Text);

  dmReportNew.EksekusiReport('slip_retur_TRADER', sSQL, sSQL2,True);
 }
end;

procedure TfrmReturTrader.FormShow(Sender: TObject);
begin
  inherited;
//  if FNewRetur<> nil then
//    FNewRetur.ClearProperties;

//  dtDate.Date := cGetServerTime;
  edtNoBukti.Clear;
  edtMerchangroup.Clear;
  edtMerchandisenama.Clear;
  edtKeterangan.Clear;
  {
  cClearGrid(strgGrid, False);
  strgGrid.Columns[_KolBarang].ReadOnly := True;
  strgGrid.Columns[_KolNama].ReadOnly := True;
  strgGrid.Columns[_kolUOM].ReadOnly := True;
  strgGrid.Columns[_KolQTY].ReadOnly := True;
  strgGrid.Columns[_KolPO].ReadOnly := True;

   }
end;

procedure TfrmReturTrader.SetDataRetur(aReturSupplier: integer);
begin
    {
    edtNoBukti.Text         := aReturSupplier.NoBukti;
    dtDate.Date             := aReturSupplier.TglBukti;
    edtKeterangan.Text      := aReturSupplier.Keterangan;

    edtMerchangroup.Text    := aReturSupplier.TRADER.Kode;
    edtMerchandisenama.Text := aReturSupplier.TRADER.Nama;

    LoadDataToGrid(aReturSupplier);
    }
end;

procedure TfrmReturTrader.LoadDataToGrid(aReturSupplier: Integer);
var
  i: Integer;
begin
  inherited;
  {
  cClearGrid(strgGrid, False);
  for i := 0 to aReturSupplier.NewReturTRADERItems.Count - 1 do
  begin
    strgGrid.Cells[_kolNO,i + 1]       := IntToStr(i+1);
    strgGrid.Cells[_KolBarang,i+1]     := aReturSupplier.NewReturTRADERItems[i].Barang.Kode;
    strgGrid.Cells[_KolNama,i+1]       := aReturSupplier.NewReturTRADERItems[i].Barang.Alias;
    strgGrid.Cells[_KolUOM,i+1]        := aReturSupplier.NewReturTRADERItems[i].UOM.UOM;
    strgGrid.Floats[_KolQTY,i+1]       := aReturSupplier.NewReturTRADERItems[i].QTY;
    strgGrid.Cells[_KolPO,i+1]         := aReturSupplier.NewReturTRADERItems[i].DOItem.DOASD_DOAS_NO;
    strgGrid.Cells[_kolReturItemID,i+1]:= IntToStr(aReturSupplier.NewReturTRADERItems[i].ID);
    strgGrid.Cells[_kolPODID,i+1]      := IntToStr(aReturSupplier.NewReturTRADERItems[i].DOItem.DOASD_ID);
    strgGrid.AddRow;
  end;

  HapusBarisKosong(strgGrid, _KolBarang);
  }
end;



procedure TfrmReturTrader.FormCreate(Sender: TObject);
begin
  inherited;
//  FNewRetur := TReturTRADER.Create(Self);
//  FBarang := TNewBarang.Create(Self);
//  FPO :=TPO.Create(Self);
end;

procedure TfrmReturTrader.btn1Click(Sender: TObject);
var sSql:string;
begin
  inherited;
  if InProcessing then
    exit;

  sSQL :=' select distinct RETASS_NOBUKTI as "NO Bukti", RETASS_KETERANGAN as " Keterangan", RETASS_TGLBUKTI as "Tanggal" '
          + ' from retur_TRADER '
          + ' where retass_unt_id = ' + IntToStr(masternewunit);

  {
  with cLookUp('Data Retur TRADER',sSQL,200,1,True ) do
  begin
    try
      FWaiting:= True;

      if Strings[0] = '' then
          Exit;

      ClearByTag(Self,[0]);
      cClearGrid(strgGrid,False);
      SetHeaderGrid;

      FNewRetur.LoadByNoBukti(Strings[0],masternewunit.id);
      SetDataRetur(FNewRetur);


    finally
      strgGrid.AutoSizeColumns(True, 5);
      HideCols;
      Free;
      FWaiting:= False;
    end;
  end;
  }
end;

procedure TfrmReturTrader.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  {
  if (key = VK_F2) and (ActiveControl =edtNoBukti) then
  begin
    btn1Click(Self);
    Exit;
  end;
  if (Key = VK_RETURN) then
  begin
    if ActiveControl=edtNoBukti then
    begin
       FNewRetur.LoadByNoBukti(edtNoBukti.Text, MasterNewUnit.ID);
       SetDataRetur(FNewRetur);
    end else
    if (ActiveControl=strgGrid) then
    begin
      if strgGrid.Col+1 >= strgGrid.ColCount then strgGrid.Col:=1 else strgGrid.Col:=strgGrid.Col+1;
    end
    else
      SelectNext(ActiveControl,true,true);
  end
  else if(Key = Ord('C')) and (ssctrl in Shift) then
    GetAndRunButton('btnAdd')
  else if(Key = Ord('E')) and (ssctrl in Shift) then
  Begin
    Application.CreateForm(TfrmDialogReturTrader,frmDialogReturTrader);

    frmDialogReturTrader.SetIDRetur(FNewRetur.ID);
    SetFormPropertyAndShowDialog(frmDialogReturTrader);

    FNewRetur.LoadByID(frmDialogReturTrader.GetIDRetur, masternewunit.id);
    SetDataRetur(FNewRetur);
  end
  else if(Key = VK_DELETE) and (ssctrl in Shift) then
    GetAndRunButton('btnDelete')
  else if(Key = Ord('P')) and (ssctrl in Shift) then
    GetAndRunButton('btnRefresh')
  else if (Key = VK_ESCAPE) and (ssctrl in Shift) then
    GetAndRunButton('btnClose');
    }
end;


procedure TfrmReturTrader.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action    := caFree;
  frmReturTrader := nil;
end;

procedure TfrmReturTrader.SetHeaderGrid;
begin
 { with strgGrid do
  begin
    Cells[_kolNO,0]     := 'No';
    Cells[_KolBarang,0] := 'Barang';
    Cells[_KolNama,0]   := 'Nama';
    Cells[_KolUOM,0]    := 'UOM';
    Cells[_KolQTY,0]    := 'QTY';
    Cells[_KOLPo,0]     := 'Nomor DO';
  end;
  }
end;

procedure TfrmReturTrader.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  CanClose:= not InProcessing;
end;

procedure TfrmReturTrader.HideCols;
begin
  {
  strgGrid.ColWidths[_kolReturItemID] := 0;
  strgGrid.ColWidths[_kolPODID]:= 0;
  }
end;

function TfrmReturTrader.InProcessing: Boolean;
begin
  Result:= False;
  if FWaiting then
  begin
    CommonDlg.ShowConfirmGlobal('Tunggu proses sampai selesai!');
    Result := True;
  end;

end;

end.




