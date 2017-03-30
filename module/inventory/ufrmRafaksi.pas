unit ufrmRafaksi;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms,
  ufrmMasterBrowse, StdCtrls, ExtCtrls,  jpeg,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer, Vcl.ComCtrls, dxCore,
  cxDateUtils, Vcl.Menus, cxButtonEdit, System.Actions, Vcl.ActnList,
  ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC;

type
  TfrmRafaksi = class(TfrmMasterBrowse)
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
    procedure FormShow(Sender: TObject);
    procedure frftr5btn1btnAddClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure frftr5btn1btnRefreshClick(Sender: TObject);
  private
//    FNewRafaksi : TRafaksiSupplier;
//    FBarang : TNewBarang;
    procedure SetDataRafaksi(aRafaksiSupplier: Integer);

    { Private declarations }
  public
  procedure LoadDataToGrid(aRafaksiSupplier: Integer);
  procedure SetHeaderGrid;

    { Public declarations }
  end;

var
  frmRafaksi: TfrmRafaksi;

implementation

uses ufrmDialogRafaksi, udmReport;

const
{
No
Barang
Nama
UOM
STOCK
QTY RAFAKSI
NILAI RAFAKSI
QTY RAFAKSI
}
  _kolNO     :Integer = 0;
  _KolBarang :Integer = 1;
  _KolNama   :Integer = 2;
  _KolUOM    :Integer = 3;
  _KolSTOCK  :Integer = 4;
  _KOLQTYRAF :Integer = 5;
  _KOLNILRAF :Integer = 6;
  _KOLTOTRAF :Integer = 7;


{$R *.dfm}

procedure TfrmRafaksi.FormShow(Sender: TObject);
begin
  inherited;
  {
  if FNewRafaksi<> nil then
    FNewRafaksi.ClearProperties;

  dtDate.Date := cGetServerTime;
  edtNoBukti.Clear;
  edtMerchangroup.Clear;
  edtMerchandisenama.Clear;
  edtKeterangan.Clear;

  cClearGrid(strgGrid, False);
  strgGrid.Columns[_KolBarang].ReadOnly := True;
  strgGrid.Columns[_KolNama].ReadOnly := True;
  strgGrid.Columns[_KolUOM].ReadOnly := True;
  strgGrid.Columns[_KolSTOCK].ReadOnly := True;
  strgGrid.Columns[_KOLQTYRAF].ReadOnly := True;
  strgGrid.Columns[_KOLNILRAF].ReadOnly := True;
  strgGrid.Columns[_KOLTOTRAF].ReadOnly := True;
  }
end;

procedure TfrmRafaksi.SetDataRafaksi(aRafaksiSupplier: Integer);
begin
  {
    edtNoBukti.Text         := aRafaksiSupplier.NoBukti;
    dtDate.Date             := aRafaksiSupplier.TglBukti;
    edtKeterangan.Text      := aRafaksiSupplier.Keterangan;

    edtMerchangroup.Text    := aRafaksiSupplier.SupplierMerGroup.Kode;
    edtMerchandisenama.Text := aRafaksiSupplier.SupplierMerGroup.Nama;

    LoadDataToGrid(aRafaksiSupplier);
    }
end;

procedure TfrmRafaksi.frftr5btn1btnAddClick(Sender: TObject);
begin
  inherited;
  edtNoBukti.Text := '';
//  dtDate.Date := cGetServerTime;
  edtMerchangroup.Text := '';
  edtMerchandisenama.Text := '';
  edtKeterangan.Text := '';
//  cClearGrid(strgGrid,False);


  frmDialogRafaksi := TfrmDialogRafaksi.Create(Self);
  frmDialogRafaksi.SetIDRafaksi(0);
  SetFormPropertyAndShowDialog(frmdialogRafaksi);

//  FNewRafaksi.LoadByID(frmDialogRafaksi.GetIDRafaksi, MasterNewUnit.ID);
//  SetDataRafaksi(FNewRafaksi);
end;

procedure TfrmRafaksi.LoadDataToGrid(aRafaksiSupplier: Integer);
var
  i: Integer;
begin
  inherited;
  {
  cClearGrid(strgGrid, False);
  for i := 0 to aRafaksiSupplier.NewRafaksiSupplierItems.Count - 1 do
  begin
    strgGrid.Cells[_kolNO,i + 1]        := IntToStr(i+1);
    strgGrid.Cells[_KolBarang,i + 1]      := aRafaksiSupplier.NewRafaksiSupplierItems[i].Barang.Kode;
    strgGrid.Cells[_KolNama,i + 1]        := aRafaksiSupplier.NewRafaksiSupplierItems[i].Barang.Alias;
    strgGrid.Cells[_KolUOM,i + 1]         := aRafaksiSupplier.NewRafaksiSupplierItems[i].UOM.UOM;
    strgGrid.Floats[_KolSTOCK,i + 1]        := aRafaksiSupplier.NewRafaksiSupplierItems[i].STOCK;
    strgGrid.Floats[_KOLQTYRAF,i + 1]     := aRafaksiSupplier.NewRafaksiSupplierItems[i].QTY;
    strgGrid.Floats[_KOLNILRAF,i + 1]       := aRafaksiSupplier.NewRafaksiSupplierItems[i].NILAIRAF;
    strgGrid.Floats[_KOLTOTRAF,i + 1]      := aRafaksiSupplier.NewRafaksiSupplierItems[i].QTY * aRafaksiSupplier.NewRafaksiSupplierItems[i].NILAIRAF;
    strgGrid.AddRow;
  end;

  HapusBarisKosong(strgGrid, _KolBarang);
  }
end;



procedure TfrmRafaksi.FormCreate(Sender: TObject);
begin
  inherited;
  {
  FNewRafaksi := TRafaksiSupplier.Create(Self);
  FBarang := TNewBarang.Create(Self);
  }
 end;

procedure TfrmRafaksi.btn1Click(Sender: TObject);
var sSql:string;
begin
  inherited;
  sSQL :=' select distinct RAF_NOBUKTI as "NO Bukti", RAF_KETERANGAN as " Keterangan", RAF_TGLBUKTI as "Tanggal" '
          + ' from Rafaksi '
          + ' where rAF_unt_id = ' + IntToStr(masternewunit);

 {
  with cLookUp('Data Rafaksi',sSQL,200,1,True ) do
  begin
    try
      if Strings[0] = '' then
          Exit;

      ClearByTag(Self,[0]);
      cClearGrid(strgGrid,False);
      SetHeaderGrid;

      FNewRafaksi.LoadByNoBukti(Strings[0],masternewunit.id);
      SetDataRafaksi(FNewRafaksi);


    finally
      Free;
    end;
  end;
   }
end;

procedure TfrmRafaksi.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  {
  if (key = VK_F5) and (ActiveControl =edtNoBukti) then
  begin
    btn1Click(Self);
    Exit;
  end;
  if (Key = VK_RETURN) then
  begin
    if ActiveControl=edtNoBukti then
    begin
       FNewRafaksi.LoadByNoBukti(edtNoBukti.Text, MasterNewUnit.ID);
       SetDataRafaksi(FNewRafaksi);
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
    Application.CreateForm(TfrmdialogRafaksi,frmdialogRafaksi);

    frmDialogRafaksi.SetIDRafaksi(FNewRafaksi.ID);
    SetFormPropertyAndShowDialog(frmdialogRafaksi);

    FNewRafaksi.LoadByID(frmDialogRafaksi.GetIDRafaksi, masternewunit.id);
    SetDataRafaksi(FNewRafaksi);
  end

  else if(Key = Ord('P')) and (ssctrl in Shift) then
    GetAndRunButton('btnRefresh')
  else if (Key = VK_ESCAPE) and (ssctrl in Shift) then
    GetAndRunButton('btnClose');
    }
end;


procedure TfrmRafaksi.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action    := caFree;
  frmRafaksi  := nil;
end;

procedure TfrmRafaksi.frftr5btn1btnRefreshClick(Sender: TObject);
var
  sSQL : string;
begin
  inherited;
//  sSQL  := GetSQLSlipRafaksin(masternewunit.id, edtNoBukti.Text,
//        GetCompanyHeader(FLoginFullname,MasterNewunit.Nama,cGetServerTime, cGetServerTime));
//  dmReportNew.EksekusiReport('frcetakRafaksi_Supp', sSQL,'',True);

end;

procedure TfrmRafaksi.SetHeaderGrid;
begin
  {
  with strgGrid do
  begin
    Cells[_kolNO,0]         := 'No';
    Cells[_KolBarang,0]     := 'Barang';
    Cells[_KolNama,0]       := 'Nama';
    Cells[_KolUOM,0]        := 'UOM';
    Cells[_KolSTOCK,0]      := 'STOCK';
    Cells[_KOLQTYRAF,0]     := 'QTY RAFAKSI';
    Cells[_KOLNILRAF,0]     := 'NILAI RAFAKSI';
    Cells[_KOLTOTRAF,0]     := 'TOTAL RAFAKSI';
  end;
  }
end;

end.




