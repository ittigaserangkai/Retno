unit ufrmChangeStatusPO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, 
  System.Actions, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer, Vcl.ComCtrls, dxCore,
  cxDateUtils, Vcl.Menus, ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC,
  Vcl.ActnList;

type
  TfrmChangeStatusPO = class(TfrmMasterBrowse)
    pnlTop: TPanel;
    lbl1: TLabel;
    edPONOAwal: TEdit;
    lbl2: TLabel;
    edPONOAkhir: TEdit;
    btnShowPO: TcxButton;
    lbl3: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure btnShowPOClick(Sender: TObject);
    procedure strgGridCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure strgGridCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure strgGridGetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
    procedure edPONOAwalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure ShowPOByRangeNumber(AFirstNumber, ALastNumber: string);
    procedure ParseHeaderGrid();
  public
    { Public declarations }
  end;

var
  frmChangeStatusPO: TfrmChangeStatusPO;

const
    _Kol_s_PO_NO :Integer = 1;
    _Kol_d_PO_Date :Integer = 2;
    _Kol_s_Sup_Code :Integer  = 3;
    _Kol_d_PO_Val_Date :Integer = 4;
    _Kol_f_PO_Total :Integer = 5;
    _Kol_s_PO_Stat_Nama : Integer = 6;
    _Kol_i_PO_Stat_ID :Integer = 7;
    _Kol_s_Check_Char : Integer = 8;

implementation

uses uTSCommonDlg, uConstanta, uRetnoUnit, ufrmCancellationPO;

{$R *.dfm}

procedure TfrmChangeStatusPO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
//  frmMain.DestroyMenu((Sender as TForm));
  Action := caFree;
end;

procedure TfrmChangeStatusPO.FormDestroy(Sender: TObject);
begin
  inherited;
  frmChangeStatusPO := nil;
end;

procedure TfrmChangeStatusPO.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'Change Status Purchasing Order';
end;

procedure TfrmChangeStatusPO.actEditExecute(Sender: TObject);
var sSQL: String;
  IsCheck: Boolean;
  SS: TStrings;
    countData, i: Integer;
begin
  {countData := strgGrid.RowCount;

  SS := TStringList.Create;
  try
    for i:=1 to countData do
    begin
      with strgGrid do
      begin
        strgGrid.GetCheckBoxState(0,i,IsCheck);
        if IsCheck then
        begin

          sSQL := 'update po set PO_STAPO_ID = 2, '
                  + ' PO_DESCRIPTION = ' + Quot('Ubah Status') + ','
                  + ' OP_MODIFY =  ' + IntToStr(FLoginId) +','
                  + ' OPM_UNIT = ' + IntToStr(FLoginUnitId) + ','
                  + ' DATE_MODIFY = ' +QuotDT(cGetServerTime)
                  + ' where PO_NO = ' + Quot(Cells[_Kol_s_PO_NO,i])
                  + ' and PO_UNT_ID = ' + IntToStr(MasterNewUnit.ID);

          SS.Add(sSQL);
        end;
      end;
    end;

    if kExecuteSQLs(TPO.getHeaderFlag,SS) then
    begin
      if SimpanBlob(SS, TPO.getHeaderFlag) then
      begin
        cCommitTrans;
        CommonDlg.ShowMessage('Berhasil Menyimpan Data');
        btnShowPOClick(Self);
      end else begin
        cRollbackTrans;
        CommonDlg.ShowError('Gagal Menyimpan Data');
      end;
    end else begin
      cRollbackTrans;
      CommonDlg.ShowError('Gagal Menyimpan Data');
    end;
  finally
    cRollbackTrans;
    SS.Free;
  end;
  }
end;

procedure TfrmChangeStatusPO.btnShowPOClick(Sender: TObject);
begin
  ShowPOByRangeNumber(edPONOAwal.Text, edPONOAkhir.Text);
end;

procedure TfrmChangeStatusPO.ShowPOByRangeNumber(AFirstNumber,
  ALastNumber: string);
var
  i: integer;
  sFilterNoPO, sSQL : string;
//  FPO : TPO;
begin

    if (Trim(edPONOAwal.Text) <> '') and (Trim(edPONOAkhir.Text) <> '') then
    begin
      sFilterNoPO := 'and a.po_no >=' + QuotedStr(edPONOAwal.Text)
                    + ' and a.po_no <= ' + QuotedStr(edPONOAkhir.Text);
    end else if (Trim(edPONOAwal.Text) <> '') and (Trim(edPONOAkhir.Text) = '') then
    begin
      sFilterNoPO := 'and a.po_no =' + QuotedStr(edPONOAwal.Text);
    end else if (Trim(edPONOAwal.Text) = '') and (Trim(edPONOAkhir.Text) <> '') then
    begin
      sFilterNoPO := 'and a.po_no =' + QuotedStr(edPONOAkhir.Text);
    end else
      sFilterNoPO := '';

    sSQL := ' select a.po_no '
         + ' from po a '
         + ' where '
         + ' a.po_stapo_id in (3) '
         + ' and a.is_po_bonus = 0 '
         + ' and a.po_unt_id = '+IntToStr(MasterNewUnit)+' '
         + sFilterNoPO;
  {
  with cOpenQuery(sSQL) do
  begin
     try
        ParseHeaderGrid;
        if RecordCount > 0 then
        begin
          //initiate
          First;
          i := 1;
          while not (Eof) do
          begin

            FPO := TPO.Create(nil);
            try
              if FPO.LoadByNoBukti(fieldByName('po_no').AsString,MasterNewUnit.ID) then
              begin
                with strgGrid do
                begin
                  AddCheckBox(0, i, true, true);
                  SetCheckBoxState(0, i, False);
                  Alignments[0,i]               := taCenter;
                  Cells[_Kol_s_PO_NO,i]         := FPO.NoBukti;
                  Cells[_Kol_d_PO_Date,i]       := DateToStr(FPO.TglBukti);
                  Cells[_Kol_s_Sup_Code,i]      := FPO.NewSupplierMerGroup.NewSupplier.Kode;
                  Cells[_Kol_d_PO_Val_Date,i]   := DateToStr(FPO.TglValid);
                  Floats[_Kol_f_PO_Total,i]     := FPO.Total;
                  Alignments[_Kol_f_PO_Total,i] := taRightJustify;
                  Cells[_Kol_s_PO_Stat_Nama,i]  := FPO.StatusPO.Nama;
                  Cells[_Kol_s_Check_Char,i]    := '';
                end;
                strgGrid.AddRow;
                Inc(i,1);
                Next;
              end;
            finally
              FreeAndNil(FPO);
            end;
          end;
        end;
      finally
        Free;
      end;
  end;

  strgGrid.AutoSize := True;
  strgGrid.FixedRows := 1;
  HapusBarisKosong(strgGrid,1);
  }
end;

procedure TfrmChangeStatusPO.ParseHeaderGrid();
begin
  {with strgGrid do
  begin
    Clear;
    RowCount := 2;
    ColCount := 7;
    Cells[0,0]                  := '';
    Cells[_Kol_s_PO_NO,0]       := 'PO NO./SPB';
    Cells[_Kol_d_PO_Date,0]     := 'PO DATE';
    Cells[_Kol_s_Sup_Code,0]    := 'SUPP. CODE';
    Cells[_Kol_d_PO_Val_Date,0] := 'PO VALIDITY DATE';
    Cells[_Kol_f_PO_Total,0]    := 'TOT. PURCH.';
    Cells[_Kol_s_PO_Stat_Nama,0]:= 'STATUS';

    FixedRows := 1;
    AutoSize := True;
  end;
  }
end;

procedure TfrmChangeStatusPO.strgGridCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  if (ACol = 0) then
    CanEdit := true
  else
    CanEdit := false;
end;

procedure TfrmChangeStatusPO.strgGridCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  {if (State = true) then
    strgGrid.Cells[_Kol_s_Check_Char,ARow] := 'Y'
  else
    strgGrid.Cells[_Kol_s_Check_Char,ARow] := 'N'
    }
end;

procedure TfrmChangeStatusPO.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i: Integer;
  _isChecked: Boolean;
begin
  inherited;
  
  {
  if (Key = 88) then
  begin
    for i:= 1 to strgGrid.RowCount do
    begin
      strgGrid.GetCheckBoxState(0,i,_isChecked);
      if _isChecked then
        strgGrid.SetCheckBoxState(0,i,False)
      else
        strgGrid.SetCheckBoxState(0,i,True);
    end;
  end;
  }
end;

procedure TfrmChangeStatusPO.FormShow(Sender: TObject);
begin
  inherited;
  if (FMasterIsHO <> 1) and (FMasterIsStore <> 0) then
  begin
    CommonDlg.ShowError('Hanya unit merchandise yang bisa membuat PSL!');
    Close;
    exit;
  end;  
  ParseHeaderGrid;
end;

procedure TfrmChangeStatusPO.actRefreshExecute(Sender: TObject);
begin
  inherited;
  ShowPOByRangeNumber('','');
end;

procedure TfrmChangeStatusPO.FormActivate(Sender: TObject);
begin
  inherited;
  frmChangeStatusPO.Caption:= 'CHANGE STATUS PURCHASING ORDER';
end;

procedure TfrmChangeStatusPO.strgGridGetFloatFormat(Sender: TObject; ACol,
  ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  inherited;
  FloatFormat := '%.2n';
  if (ACol in [_Kol_f_PO_Total]) then
    IsFloat := True
  else
    IsFloat := False;
end;

procedure TfrmChangeStatusPO.edPONOAwalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sSQL: string;
begin
  inherited;
  if Key = VK_F5 then
  begin
    sSQL := 'select PO_NO as "NOMOR PO", PO_DATE as "TGL PO"'
            + ' from po'
            + ' where po_unt_id = ' + IntToStr(MasterNewUnit)
            + ' and po_stapo_id in (3)';

    {
    with cLookUp('Daftar PO', sSQL) do
    begin
      try
        if Strings[0] = '' then
          Exit;

        (Sender as TEdit).Text := Strings[0];  
      finally
        Free;
      end;
    end;
    }
  end;
end;

procedure TfrmChangeStatusPO.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if(Key = Ord('C'))and(ssctrl in Shift) then
    actEditExecute(self);
end;

end.
