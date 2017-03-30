unit ufrmApprovalPO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, ufraFooter5Button, StdCtrls, ExtCtrls, ActnList,
  math, System.Actions, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, ufraFooter4Button, cxButtons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC;

type
  TfrmApprovallPO = class(TfrmMasterBrowse)
    pnlTop: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    edtNoPO1: TEdit;
    edtNoPO2: TEdit;
    btnShowPO: TcxButton;
    lbl3: TLabel;
    dtTglPO: TcxDateEdit;
    edtKodeSuplier: TEdit;
    lbl4: TLabel;
    edtNamaSuplier: TEdit;
    cbbMerchanGroup: TComboBox;
    lb1: TLabel;
    bvlSeparator: TBevel;
    actApproveApprovalPO: TAction;
    procedure actAddExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnShowPOClick(Sender: TObject);
    procedure strgGridCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure edtKodeSuplierKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNoPO1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtKodeSuplierKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
//    FPO : TPO;
//    procedure LoadDataPO;
    procedure ParseHeaderGrid;
  public
    procedure LoadDataToCbbMerchanGrup;
    { Public declarations }
  end;

var
  frmApprovallPO: TfrmApprovallPO;

const
    _Kol_s_PO_NO :Integer = 1;
    _Kol_d_PO_Date :Integer = 2;
    _Kol_s_Sup_Code :Integer  = 3;
    _Kol_s_Sup_Nama :Integer  = 4;
    _Kol_f_PO_Total :Integer = 5;
    _Kol_s_Unit_GR : Integer = 6;
    _Kol_s_Nama_GR : Integer = 7;
    _Kol_s_PO_Stat_Nama : Integer = 8;
    _Kol_i_PO_Stat_ID :Integer = 9;
    _Kol_s_Check_Char : Integer = 10;
    _kol_i_po_unt_id : Integer = 11;
    _kol_s_Unit_GR_Temp : Integer = 12;

implementation

uses ufrmSearchSupplier, uTSCommonDlg, uConstanta, StrUtils;

{$R *.dfm}

procedure TfrmApprovallPO.actAddExecute(Sender: TObject);
//var
//  i: integer;
//  state: Boolean;
begin
  {
  for i := strgGrid.FixedRows to strgGrid.RowCount - 1 do
  begin
    strgGrid.GetCheckBoxState(0,i,state);
    if state then
    begin

      if not FPO.LoadByNoBukti(strgGrid.Cells[_Kol_s_PO_NO,i],MasterNewUnit.ID) then
      begin
        cRollbackTrans;
        CommonDlg.ShowMessage('Gagal Menampilkan Data PO Berdasar No Bukti ' + strgGrid.Cells[1,i]);
        Exit;
      end;

      if not FPO.UpdateStatusPO(2, FLoginId, FLoginUnitId) then
      begin
        cRollbackTrans;
        CommonDlg.ShowMessage('Gagal Update Status PO menjadi Approve ');
        Exit;
      end;

      if strgGrid.Cells[_Kol_s_Unit_GR,i]<>strgGrid.Cells[_kol_s_Unit_GR_Temp,i] then
      begin
        if not FPO.UpdateUnitGR(strgGrid.Cells[_Kol_s_Unit_GR,i]) then
        begin
          cRollbackTrans;
          CommonDlg.ShowMessage('Gagal Update Perubahan Unit Penerima GR');
          Exit;
        end;
      end;

    end;
  end;

  cCommitTrans;
  }
  CommonDlg.ShowMessage('PO Berhasil Di Approve');
  btnShowPOClick(actApproveApprovalPO);
end;

procedure TfrmApprovallPO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmApprovallPO.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'APPROVAL PURCHASING ORDER';
//  FPO := TPO.Create(Self);
end;

procedure TfrmApprovallPO.FormDestroy(Sender: TObject);
begin
  inherited;
  frmApprovallPO := nil;
end;

procedure TfrmApprovallPO.btnShowPOClick(Sender: TObject);
begin
  {if Sender <> actApproveApprovalPO then
    if strgGrid.RowCount > 2 then
      if trim(strgGrid.Cells[_Kol_s_PO_NO,1])<>'' then
        if CommonDlg.Confirm('Masih ada data dalam grid, anda yakin akan mengambil ulang PO ?')<> mrYes then
          Exit;

  LoadDataPO;
  }
end;

procedure TfrmApprovallPO.strgGridCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin

  if (ACol in [0{,_Kol_s_Unit_GR}]) then
    CanEdit := true
  else
    CanEdit := false;

end;

procedure TfrmApprovallPO.edtKodeSuplierKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  sSQL: string;
begin
  inherited;
  if (Key = VK_F5) then
  begin
    sSQL := ' select a.supmg_code as Kode, b.sup_name as Nama'
            + ' from suplier_merchan_grup a, suplier b, po c '
            + ' where b.sup_code = a.supmg_code '
            + ' and a.supmg_sub_code = c.po_supmg_sub_code '
            + ' and a.supmg_sub_code = c.po_supmg_sub_code '
            + ' group by a.supmg_code, b.sup_name ';
    {with cLookUp('DAFTAR SUPLIER ',sSQL) do
    begin
      edtKodeSuplier.Text := Strings[0];
      edtNamaSuplier.Text := Strings[1];

      edtNoPO1.SetFocus;
      Free;
    end;
    }
  end else if (Key = VK_RETURN) then
  begin
    sSQL := ' select sup_code, sup_name '
            + ' from suplier '
            + ' where sup_code = ' + QuotedStr(edtKodeSuplier.Text);
   {
    with cOpenQuery(sSQL) do
    begin
      edtKodeSuplier.Text := fieldByName('sup_code').AsString;
      edtNamaSuplier.Text := fieldByName('sup_name').AsString;

      edtNoPO1.SetFocus;
      Free;
    end;
    }
  end;
end;

procedure TfrmApprovallPO.FormShow(Sender: TObject);
begin
  inherited;
  if (FMasterIsHO <> 1) and (FMasterIsStore <> 0) then
  begin
    CommonDlg.ShowError('Hanya unit merchandise yang bisa membuat PSL!');
    Close;
    exit;
  end;

  LoadDataToCbbMerchanGrup;
  dtTglPO.Date := Now;
  dtTglPO.SetFocus;
  ParseHeaderGrid;
end;

//procedure TfrmApprovallPO.LoadDataPO;
//var
//  sFilterNoPO, sFilterSuplier, sFilterDate, sFilterMerchan: string;
//  NOPO: string;
//  i: Integer;
//  sSQL: string;
//begin
   {
   sFilterMerchan := ' and mg.MERCHANGRUP_MERCHAN_ID= '+IntToStr(cGetIDfromCombo(cbbMerchanGroup))+' ';

   if trim(LeftStr(dtTglPO.Text,2)) <> '' then
     sFilterDate := ' and po.po_date = ' +  QuotD(dtTglPO.Date)+' '
   else
     sFilterDate := '';

   if Trim(edtKodeSuplier.Text) <> '' then
   begin
     sFilterSuplier := ' and sm.supmg_code = ' + Quot(edtKodeSuplier.Text)+' ';
   end else
   begin
     sFilterSuplier := '';
   end;

   if (Trim(edtNoPO1.Text) <> '') and (Trim(edtNoPO2.Text) <> '') then
   begin
     sFilterNoPO := ' and po.po_no >= ' + Quot(edtNoPO1.Text)+
                    ' and po.po_no <= ' + Quot(edtNoPO2.Text)+' ';
   end else if (Trim(edtNoPO1.Text) <> '') and (Trim(edtNoPO2.Text) = '') then
   begin
     sFilterNoPO := ' and po.po_no =' + Quot(edtNoPO1.Text)+' ';
   end else if (Trim(edtNoPO1.Text) = '') and (Trim(edtNoPO2.Text) <> '') then
   begin
     sFilterNoPO := ' and po.po_no =' + Quot(edtNoPO2.Text)+' ';
   end else
    sFilterNoPO := '';

     sSQL := 'select po.po_no, po.po_unt_id '+
             'from '+
             '  po '+
             '  left join suplier_merchan_grup sm on (sm.supmg_sub_code=po.po_supmg_sub_code) '+
             '  left join REF$MERCHANDISE_GRUP mg on (mg.MERCHANGRUP_ID=sm.SUPMG_MERCHANGRUP_ID) '+
             'where '+
             ' po.po_stapo_id = 1 '+
             ' and po.is_po_bonus = 0 '+
             sFilterMerchan+
             sFilterDate+
             sFilterSuplier+
             sFilterNoPO;

   with cOpenQuery(sSQL) do
   begin
     try
       ParseHeaderGrid;
       i := 1;
       while not Eof do
       begin
         NOPO := fieldByName('po_no').AsString;
         FPO.LoadByNoBukti(fieldByName('po_no').AsString,fieldByName('po_unt_id').AsInteger);
         strgGrid.AddCheckBox(0, i , true, true);
         strgGrid.SetCheckBoxState(0, i , true);
         strgGrid.Alignments[0,i ] := taCenter;

         strgGrid.Cells[_Kol_s_PO_NO,i ]        := FPO.NoBukti;
         strgGrid.Cells[_Kol_d_PO_Date,i ]      := DateToStr(FPO.TglBukti);
         strgGrid.Cells[_Kol_s_Sup_Code,i ]     := FPO.NewSupplierMerGroup.NewSupplier.Kode;
         strgGrid.Cells[_Kol_s_Sup_Nama,i]      := FPO.NewSupplierMerGroup.NewSupplier.Nama;
         strgGrid.Floats[_Kol_f_PO_Total,i ]    := FPO.Total - FPO.Disc + FPO.PPN + FPO.PPNBM;
         strgGrid.Cells[_Kol_s_Unit_GR,i]       := FPO.GRUnit.Kode;
         strgGrid.Cells[_Kol_s_Nama_GR,i]       := FPO.GRUnit.Nama;
         strgGrid.Cells[_Kol_s_PO_Stat_Nama,i ] := FPO.StatusPO.Nama;
         strgGrid.Cells[_Kol_i_PO_Stat_ID,i ]   := IntToStr(FPO.StatusPO.ID);
         strgGrid.Cells[_Kol_s_Check_Char,i]    := 'Y';
         strgGrid.Cells[_kol_i_po_unt_id,i]     := fieldByName('po_unt_id').AsString;
         strgGrid.Cells[_kol_s_Unit_GR_Temp,i]  := FPO.GRUnit.Kode;

         strgGrid.AddRow;
         Inc(i,1);
         Next;
       end;
     finally
       Free;
       strgGrid.AutoSizeColumns(True, 10);
     end;  
   end;

   HapusBarisKosong(strgGrid,1);
   }
//end;

procedure TfrmApprovallPO.ParseHeaderGrid();
begin
  {with strgGrid do
  begin
    Clear;
    RowCount                    := 2;
    ColCount                    := 9;
    
    Cells[0,0]                  := '';
    Cells[_Kol_s_PO_NO,0]       := 'PO NO./SPB';
    Cells[_Kol_d_PO_Date,0]     := 'PO DATE';
    Cells[_Kol_s_Sup_Code,0]    := 'SUPP. CODE';
    Cells[_Kol_s_Sup_Nama,0]    := 'SUPP. NAME';
    Cells[_Kol_f_PO_Total,0]    := 'TOT. PURCH.';
    Cells[_Kol_s_Unit_GR,0]     := 'GR Dest.';
    Cells[_Kol_s_Nama_GR,0]     := 'GR Dest. Name';
    Cells[_Kol_s_PO_Stat_Nama,0]:= 'STATUS';

    FixedRows := 1;
    AutoSize := True;
  end;
  }
end;

procedure TfrmApprovallPO.FormActivate(Sender: TObject);
begin
  inherited;
  frmApprovallPO.Caption := 'APPROVAL PURCHASING ORDER';
end;

procedure TfrmApprovallPO.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
//var
//  _isChecked: Boolean;
//  i: Integer;
begin
  inherited;
  if (Key = 13) and (ssctrl in Shift) then
    actAddExecute(Self);
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

procedure TfrmApprovallPO.edtNoPO1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sSQL: string;
begin
  inherited;
  if Key = VK_F5 then
  begin
    sSQL := 'select PO_NO as "NOMOR PO", PO_DATE as "TGL PO"'
            + ' from po'
            + ' where is_po_bonus = 0'
            + ' and po_unt_id = ' + IntToStr(MasterNewUnit)
            + ' and po_stapo_id in (1)';
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

procedure TfrmApprovallPO.LoadDataToCbbMerchanGrup;
var sSQL: string;
begin
 sSQL := ' select merchan_id , merchan_name '
         + ' from ref$merchandise ';
// cQueryToComboObject(cbbMerchanGroup,sSQL);
end;

procedure TfrmApprovallPO.edtKodeSuplierKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key=vk_delete) or (Key=vk_back) then
  begin
      edtKodeSuplier.Text := '';
      edtNamaSuplier.Text := '';
  end;
end;

procedure TfrmApprovallPO.strgGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
//var sSql : string;
begin
  inherited;
  {if Key= vk_f5 then
  begin
    with strgGrid do
    begin
      if Col=_Kol_s_Unit_GR then
      begin
        if Trim(Cells[_Kol_s_PO_NO,Row]) = '' then
          Exit;
          
        sSql := 'select au.unt_code, au.unt_name, ui.uti_address '+
                'from '+
                '  aut$unit au '+
                '  left join unit_info ui on (ui.UTI_UNT_ID=au.unt_id) '
        ;

        with cLookUp('Unit Tujuan GR',sSql) do
        try
          if Strings[0]<>'' then
          begin
            Cells[_Kol_s_Unit_GR, Row] := Strings[0];
            Cells[_Kol_s_Nama_GR, Row] := Strings[1];
          end;
        finally
          Free;
        end;
      end
    end;
  end;
  }
end;

end.
