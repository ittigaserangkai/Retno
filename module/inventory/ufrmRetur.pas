unit ufrmRetur;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, ufraFooter5Button, StdCtrls, ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxButtonEdit,
  System.Actions, Vcl.ActnList, ufraFooter4Button, cxButtons, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid, cxPC;

type
  TfrmRetur = class(TfrmMasterBrowse)
    pnl1: TPanel;
    lblNoBukti: TLabel;
    lbl1: TLabel;
    lblKeteranga: TLabel;
    edtMerchan: TcxButtonEdit;
    edtKeterangan: TEdit;
    lblTanggal: TLabel;
    dtDate: TcxDateEdit;
    edtMerchannama: TEdit;
    btn1: TcxButton;
    edtNoBukti: TEdit;
    cxcolNo: TcxGridDBColumn;
    cxcolPLU: TcxGridDBColumn;
    cxcolUOM: TcxGridDBColumn;
    cxcolQTY: TcxGridDBColumn;
    cxcolNOMORPO: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure frftr5btn1btnAddClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure frftr5btn1btnUpdateClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure frftr5btn1btnDeleteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure strgGridGetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
    procedure frftr5btn1btnRefreshClick(Sender: TObject);

  private
//    FNewRetur : TReturSupplier;
//    FBarang : TNewBarang;
//    FPO : TPO;
    procedure SetData;

    { Private declarations }
  public
        aID :Integer;
  procedure LoadDataToGrid;
    procedure SetHeaderGrid;

    { Public declarations }
  end;

var
  frmRetur: TfrmRetur;

implementation

uses ufrmDialogRetur, udmReport;

const
  _kolNO :Integer = 0;
  _kolPODID :Integer = 7;
  _kolReturItemID :Integer = 6;

_KolBarang :Integer = 1;
_KolNama :Integer = 2;
_KolUOM :Integer = 3;
_KolQTY :Integer = 4;
_KOLPo :Integer = 5;
{$R *.dfm}

procedure TfrmRetur.FormShow(Sender: TObject);
begin
  inherited;
  {FNewRetur.ClearProperties;

  dtDate.Date := cGetServerTime;
  edtNoBukti.Clear;
  edtMerchan.Clear;
  edtMerchannama.Clear;
  edtKeterangan.Clear;

  cClearGrid(strgGrid, False);
  strgGrid.Columns[_KolBarang].ReadOnly := True;
  strgGrid.Columns[_KolNama].ReadOnly := True;
  strgGrid.Columns[_kolUOM].ReadOnly := True;
  strgGrid.Columns[_KolQTY].ReadOnly := True;
  strgGrid.Columns[_KolPO].ReadOnly := True;

  aID := 0;
  }
end;

procedure TfrmRetur.SetData;
begin
    {edtNoBukti.Text := FNewRetur.NoBukti;
    dtDate.Date := FNewRetur.TglBukti;
    edtKeterangan.Text := FNewRetur.Keterangan;
    aID := FNewRetur.ID;

    edtMerchan.Text := FNewRetur.NewMerchadize.Kode;
    edtMerchannama.Text := FNewRetur.NewMerchadize.Nama;

    LoadDataToGrid;
    }
end;

procedure TfrmRetur.frftr5btn1btnAddClick(Sender: TObject);
begin
  inherited;
  {edtNoBukti.Clear;
  dtDate.Date := cGetServerTime;
  edtMerchan.Clear;
  edtMerchannama.Clear;
  edtKeterangan.Clear;
  cClearGrid(strgGrid,False);

  aID := 0;
  Application.CreateForm(tfrmdialogretur,frmdialogretur);
  frmDialogRetur.ReturID := 0;
  SetFormPropertyAndShowDialog(frmdialogretur);
  FNewRetur.LoadByID(frmDialogRetur.ReturID, MasterNewUnit.ID);
  SetData;
  FreeAndNil(frmdialogretur);
  }
end;

procedure TfrmRetur.LoadDataToGrid;
var
  i: Integer;
begin
  inherited;
  {for i := 0 to FNewRetur.NewReturSupplierItems.Count - 1 do
  begin
    strgGrid.Cells[_kolNO,i + 1]       := IntToStr(i+1);
    strgGrid.Cells[_KolBarang,i+1]     := FNewRetur.NewReturSupplierItems[i].Barang.Kode;
    strgGrid.Cells[_KolNama,i+1]       := FNewRetur.NewReturSupplierItems[i].Barang.Alias;
    strgGrid.Cells[_KolUOM,i+1]        := FNewRetur.NewReturSupplierItems[i].UOM.UOM;
    strgGrid.Floats[_KolQTY,i+1]       := FNewRetur.NewReturSupplierItems[i].QTY;
    strgGrid.Cells[_KolPO,i+1]         := FNewRetur.NewReturSupplierItems[i].POItemNo;
    strgGrid.Cells[_kolReturItemID,i+1]:= IntToStr(FNewRetur.NewReturSupplierItems[i].ID);
    strgGrid.Cells[_kolPODID,i+1]      := IntToStr(FNewRetur.NewReturSupplierItems[i].POItemID);
    strgGrid.AddRow;
  end;

  HapusBarisKosong(strgGrid, _KolBarang);
  }
end;



procedure TfrmRetur.FormCreate(Sender: TObject);
begin
  inherited;
  {FNewRetur := TReturSupplier.Create(Self);
  FBarang := TNewBarang.Create(Self);
  FPO :=TPO.Create(Self);
  }
end;

procedure TfrmRetur.frftr5btn1btnUpdateClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(Tfrmdialogretur,frmdialogretur);
  frmDialogRetur.ReturID := aID;
  SetFormPropertyAndShowDialog(frmdialogretur);
//  cClearGrid(strgGrid,False);
//  FNewRetur.LoadByID(frmDialogRetur.ReturID, MasterNewUnit.ID);
  SetData;
  FreeAndNil(frmdialogretur);
end;

procedure TfrmRetur.btn1Click(Sender: TObject);
var sSql:string;
begin
  inherited;
  sSQL :=' select distinct RET_NOBUKTI as "NO Bukti", RET_KETERANGAN as " Keterangan", RET_TGLBUKTI as "Tanggal" '
          + ' from retur '
          + ' where ret_unt_id = ' + IntToStr(MasterNewUnit);

  {
  with cLookUp('Data Retur',sSQL,200,1,True ) do
  begin
    try
      if Strings[0] = '' then
          Exit;

      ClearByTag(Self,[0]);
      cClearGrid(strgGrid,False);
      SetHeaderGrid;

      FNewRetur.LoadByNoBukti(Strings[0],MasterNewUnit.ID);
      SetData;


    finally
      Free;
    end;
  end;
    }
end;

procedure TfrmRetur.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var sSQL : string;
begin
//  inherited;
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

      sSQL :=' select distinct RET_NOBUKTI as "NO Bukti", RET_KETERANGAN as " Keterangan", RET_TGLBUKTI as "Tanggal" '
             + ' from retur '
             + ' where ret_unt_id = ' + IntToStr(MasterNewUnit)
             + ' and RET_NOBUKTI = '+ QuotedStr(edtNoBukti.Text);


     with cOpenQuery(sSQL ) do
     begin
      try
         if Fields[0].AsString = '' then
            Exit;

         ClearByTag(Self,[0]);
         cClearGrid(strgGrid,False);

         FNewRetur.LoadByNoBukti(Fields[0].AsString,MasterNewUnit.ID);
         edtNoBukti.Text := FNewRetur.NoBukti;
         dtDate.Date := FNewRetur.TglBukti;
         edtKeterangan.Text := FNewRetur.Keterangan;
         aID := FNewRetur.ID;

         edtMerchan.Text := FNewRetur.NewMerchadize.Kode;
         edtMerchannama.Text := FNewRetur.NewMerchadize.Nama;

         LoadDataToGrid;
      finally
        Free;
      end;
     end;
    end;
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
    Application.CreateForm(Tfrmdialogretur,frmdialogretur);
    frmdialogretur.ShowModal;
    FNewRetur.LoadByID(aID, MasterNewUnit.ID);
    SetData;
  end
  else if(Key = VK_DELETE) and (ssctrl in Shift) then
    GetAndRunButton('btnDelete')
  else if(Key = Ord('P')) and (ssctrl in Shift) then
    GetAndRunButton('btnRefresh')
  else if (Key = VK_ESCAPE) and (ssctrl in Shift) then
    GetAndRunButton('btnClose');
    }
end;


procedure TfrmRetur.frftr5btn1btnDeleteClick(Sender: TObject);
begin
  inherited;
  {if not IsValidDateKarenaEOD(Trim(edtNoBukti.Text),MasterNewUnit.ID,dtDate.Date,TTReturSupplier,FMasterIsStore) then
    Exit;

  if CommonDlg.Confirm('Anda Yakin Akan Menghapus Data') = mrYes then
  try
    if FNewRetur.RemoveFromDB then
    begin
      cCommitTrans;
      CommonDlg.ShowMessage('Berhasil Simpan Data');
      FormShow(nil);
    end else begin
      cRollbackTrans;
      CommonDlg.ShowError('Gagal Simpan Data');

    end;
  finally

  end;

  }
end;

procedure TfrmRetur.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action    := caFree;
  frmRetur  := nil;
end;

procedure TfrmRetur.strgGridGetFloatFormat(Sender: TObject; ACol,
  ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  inherited;
  FloatFormat := '%.3n';
  {if (ACol in [_KolQTY]) and (ARow >= strgGrid.FixedRows) then
  begin
    IsFloat := True;
  end else begin
    IsFloat := False;
  end;
  }
end;

procedure TfrmRetur.frftr5btn1btnRefreshClick(Sender: TObject);
var
  sSQL : string;
begin
  inherited;
  {
  sSQL  := GetSQLSlipReturn(MasterNewUnit.ID, edtNoBukti.Text,
        GetCompanyHeader(fLoginFullname,MasterNewUnit.Nama,cGetServerTime, cGetServerTime));
        GetExCompanyHeader(cGetServerTime, cGetServerTime, MasterNewUnit.ID,
                FLoginUsername, FLoginFullname);
  dmReportNew.EksekusiReport('frcetakRetur_Supp', sSQL,'',True);
  }
end;

procedure TfrmRetur.SetHeaderGrid;
begin
  {with strgGrid do
  begin
    Cells[_kolNO,0]     := 'No';
    Cells[_KolBarang,0] := 'Barang';
    Cells[_KolNama,0]   := 'Nama';
    Cells[_KolUOM,0]    := 'UOM';
    Cells[_KolQTY,0]    := 'QTY';
    Cells[_KOLPo,0]     := 'Nomor PO';
  end;
  }
end;

end.
