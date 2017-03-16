unit ufrmSearchSO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxLabel, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  ufrmMasterDialogBrowse, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, Vcl.Menus, cxButtons, ufraFooterDialog3Button;

type
  TFormMode = (fmGPOForAll,fmGPOBySup);

  TfrmDialogSearchSO = class(TfrmMasterDialogBrowse)
    pnl1: TPanel;
    lbl1: TLabel;
    lbl5: TLabel;
    edt1: TEdit;
    dt2: TcxDateEdit;
    dt1: TcxDateEdit;
    chk1: TCheckBox;
    lblTambah: TcxLabel;
    cbStatusSO: TComboBox;
    lblPilih: TLabel;
    cxGridViewColumn1: TcxGridDBColumn;
    cxGridViewColumn2: TcxGridDBColumn;
    cxGridViewColumn3: TcxGridDBColumn;
    btnSearch: TcxButton;
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edt1Change(Sender: TObject);
    procedure chk1Click(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lblTambahClick(Sender: TObject);
    procedure strgGridDblClick(Sender: TObject);
    procedure edt1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FIsProcessSuccessfull: boolean;
    FNoSO: string;
    FSODate: TDate;
//    FNEWSO : TSO;
    procedure SetIsProcessSuccessfull(const Value: boolean);
    procedure FindDataOnGrid(AText: String);
    procedure getdataAndShow(tglAwal,tglAkhir: TDateTime);
    procedure SetNoSO(const Value: string);
    procedure SetSODate(const Value: TDate);
    procedure ShowDetailSO();
  public
    formMode: TFormMode;
  published
    property NoSO: string read FNoSO write SetNoSO;
    property SODate: TDate read FSODate write SetSODate;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDialogSearchSO: TfrmDialogSearchSO;

implementation

uses ufrmDialogDetailSO, Math, dateutils, ufrmMain, uAppUtils;

{$R *.dfm}

{ TfrmMasterDialog1 }

procedure TfrmDialogSearchSO.SetIsProcessSuccessfull(const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogSearchSO.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin
  {if strgGrid.Cells[0,strgGrid.Row]='' then
    IsProcessSuccessfull:= False
  else
  begin
    NoSO := strgGrid.Cells[1,strgGrid.Row];
    with TSO.Create(nil) do
    begin
      try

        IsProcessSuccessfull := LoadByCode(NoSO, dialogUnit);
        SODate := TglBukti;
      finally
        Free;
      end;

    end;

    Close;
  end;
   }
end;

procedure TfrmDialogSearchSO.FormShow(Sender: TObject);
var
  dtTanggal: TDateTime;
begin
  if formMode = fmGPOForAll then
  begin
    cbStatusSO.Visible := False;
    lblPilih.Visible   := False;
  end else begin
    cbStatusSO.Visible := True;
    lblPilih.Visible   := True;
  end;
  
  edt1.Text := '';
//  dtTanggal := cGetServerTime;
  dt1.Date  := EncodeDate(YearOf(dtTanggal), MonthOf(dtTanggal), DayOf(dtTanggal));
  dt2.Date  := dt1.Date;
  getdataAndShow(dt1.Date,dt2.Date);
end;

procedure TfrmDialogSearchSO.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogSearchSO := nil;
end;

procedure TfrmDialogSearchSO.FindDataOnGrid(AText: String);
var
  resPoint: TPoint;
begin
  if (AText <> '') then
  begin
//    resPoint := strgGrid.Find(Point(0,0),AText,[fnIncludeFixed]);
    if (resPoint.Y <> -1) then
    begin
//      strgGrid.ScrollInView(resPoint.X, resPoint.Y);
//      strgGrid.SelectRows(resPoint.Y, 1);
    end;
  end;
end;

procedure TfrmDialogSearchSO.edt1Change(Sender: TObject);
begin
  FindDataOnGrid(edt1.Text);
end;

procedure TfrmDialogSearchSO.getdataAndShow(tglAwal,tglAkhir: TDateTime);
var i: Integer;
  dateFilter: string;
  sSQL: string;
begin
//  cclearStringGrid(strgGrid, False);
  if chk1.Checked = True then
  begin
    dateFilter := ' and e.so_date between' + TAppUtils.QuotD(tglAwal) + ' and ' + TAppUtils.QuotD(tglAkhir);
  end else
    dateFilter := '';

  sSQL := ' select  distinct d.merchangrup_name, e.so_no, e.so_date '
          + ' from so_detil a, barang_suplier b, suplier_merchan_grup c, ref$merchandise_grup d, so e '
          + ' where a.sod_is_ordered = 0 '
          + dateFilter
          + ' and e.so_no = a.sod_so_no '
          + ' and e.so_unt_id = a.sod_so_unt_id '
          + ' and b.brgsup_id = a.sod_brgsup_id '
          + ' and c.SUPMG_SUB_CODE = b.BRGSUP_SUPMG_SUB_CODE '
          + ' and d.merchangrup_id = c.SUPMG_MERCHANGRUP_ID '
          + ' order by d.merchangrup_name, e.so_date';
  {
  with cOpenQuery(sSQL) do
  begin
    i := 1;
    //strgGrid.RemoveRows(1,1);
    while not Eof do
    begin

      strgGrid.Cells[0,i] := fieldByName('merchangrup_name').AsString;
      strgGrid.Cells[1,i] := fieldByName('so_no').AsString;
      strgGrid.Cells[2,i] := FormatDateTime('dd-MM-yyyy', fieldByName('so_date').AsDateTime);
      Inc(i,1);

      Next;
      if not EOF then
        strgGrid.AddRow;

    end;
    Free;
  end;
  strgGrid.AutoSize := True;
  strgGrid.FixedRows := 1;
  }
end;

procedure TfrmDialogSearchSO.chk1Click(Sender: TObject);
begin
  inherited;
  if chk1.Checked then
  begin
    dt1.Enabled := True;
    dt2.Enabled := True;
  end
  else
    begin
    dt1.Enabled := False;
    dt2.Enabled := False;
  end;
end;

procedure TfrmDialogSearchSO.btnSearchClick(Sender: TObject);
begin
  inherited;
  getdataAndShow(dt1.Date,dt2.Date);
end;

procedure TfrmDialogSearchSO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogSearchSO.SetNoSO(const Value: string);
begin
  FNoSO := Value;
end;

procedure TfrmDialogSearchSO.SetSODate(const Value: TDate);
begin
  FSODate := Value;
end;

procedure TfrmDialogSearchSO.ShowDetailSO;
begin
  if not Assigned(frmDialogDetailSO) then
    frmDialogDetailSO := TfrmDialogDetailSO.Create(Application);
  {
  if strgGrid.Cells[0,strgGrid.Row]<>'' then
  begin
    frmDialogDetailSO.NoSO := strgGrid.Cells[1,strgGrid.Row];
    frmDialogDetailSO.SODate := StrToDate(strgGrid.Cells[2,strgGrid.Row]);

    frmDialogDetailSO.DialogUnit := DialogUnit;
    frmDialogDetailSO.ShowModal;
    frmDialogDetailSO.Free;
  end;
  }
end;

procedure TfrmDialogSearchSO.lblTambahClick(Sender: TObject);
begin
  ShowDetailSO;
end;

procedure TfrmDialogSearchSO.strgGridDblClick(Sender: TObject);
begin
  inherited;
  footerDialogMasterbtnSaveClick(Self);
end;

procedure TfrmDialogSearchSO.edt1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_DOWN) then
  begin
    cxGrid.SetFocus;
  end;

end;

procedure TfrmDialogSearchSO.edt1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=VK_DOWN) then
    cxGrid.SetFocus;
end;

procedure TfrmDialogSearchSO.FormCreate(Sender: TObject);
begin
  inherited;
//  FNEWSO := TSO.Create(Self);
end;

procedure TfrmDialogSearchSO.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (ssCtrl in Shift) and (Key = Ord('D'))then
  begin
    ShowDetailSO;
  end else if Key = VK_RETURN then
  begin
    footerDialogMasterbtnSaveClick(Sender)
  end else if Key = VK_ESCAPE then
    Close;
end;

end.

