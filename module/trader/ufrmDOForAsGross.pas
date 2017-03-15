unit ufrmDOForAsGross;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, Mask, JvToolEdit, Grids,
  BaseGrid, AdvGrid, ufraFooter5Button, ActnList, DB,
  SUIButton, uConn, JclStrings, cbxbase, dblup1a, JvEdit, uPOAssgrosNew,
  JvExStdCtrls, JvValidateEdit, AdvObj, JvExMask;

type
  TfrmDoForAsGross = class(TfrmMaster)
    Panel1: TPanel;
    fraFooter5Button1: TfraFooter5Button;
    Panel2: TPanel;
    strgGrid: TAdvStringGrid;
    lbl1: TLabel;
    dtTgl1: TJvDateEdit;
    actlstDOForTrader: TActionList;
    actCreateDOTrader: TAction;
    actDetilPOTrader: TAction;
    actDeleteDOTrader: TAction;
    dtTgl2: TJvDateEdit;
    lblPilih: TLabel;
    cbPilih: TComboBox;
    btnShow: TsuiButton;
    Label1: TLabel;
    btnShowReport: TsuiButton;
    pnlBayar: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    btnPrintReal: TsuiButton;
    edtNoTransaksi: TEdit;
    edtNoKartu: TEdit;
    edtNoOtorisasi: TEdit;
    cbpKasir: TColumnComboBox;
    cbpCredit: TColumnComboBox;
    btnBatal: TsuiButton;
    edtNoDO: TEdit;
    Label9: TLabel;
    btnPrintDOwoDisc: TsuiButton;
    currCash: TJvValidateEdit;
    currCredit: TJvValidateEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtTgl1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure actCreateDOTraderExecute(Sender: TObject);
    procedure actDetilPOTraderExecute(Sender: TObject);
    procedure fraFooter5Button1btnAddClick(Sender: TObject);
    procedure fraFooter5Button1btnUpdateClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    //procedure actDeleteDOTraderExecute(Sender: TObject);
    procedure fraFooter5Button1btnRefreshClick(Sender: TObject);
    procedure btnShowClick(Sender: TObject);
    procedure fraFooter5Button1btnDeleteClick(Sender: TObject);
    procedure btnShowReportClick(Sender: TObject);
    procedure btnPrintRealClick(Sender: TObject);
    procedure btnBatalClick(Sender: TObject);
    procedure strgGridGetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
    procedure cbpKasirChange(Sender: TObject);
    procedure cbpCreditChange(Sender: TObject);
    procedure cbpCreditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbpKasirKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure currCashChange(Sender: TObject);
    procedure currCreditChange(Sender: TObject);
    procedure strgGridGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure currCashKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure currCreditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNoKartuKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNoOtorisasiKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPrintDOwoDiscClick(Sender: TObject);
    procedure cbPilihChange(Sender: TObject);
    procedure btnShowEnter(Sender: TObject);
    procedure btnShowReportEnter(Sender: TObject);
    procedure btnPrintDOwoDiscEnter(Sender: TObject);
    procedure btnPrintRealEnter(Sender: TObject);
    procedure btnBatalEnter(Sender: TObject);
    procedure fraFooter5Button1btnAddEnter(Sender: TObject);
    procedure fraFooter5Button1btnUpdateEnter(Sender: TObject);
    procedure fraFooter5Button1btnRefreshEnter(Sender: TObject);
    procedure btnPrintRealExit(Sender: TObject);
    procedure btnBatalExit(Sender: TObject);
    procedure btnPrintDOwoDiscExit(Sender: TObject);
    procedure btnShowReportExit(Sender: TObject);
    procedure btnShowExit(Sender: TObject);
    procedure strgGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
//    procedure PrepareComboBeforePrintRealisasi(ADONo: string);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FTotalDO: Currency;
//    FDONo: string;

    procedure ParseHeaderGrid;
//    procedure ParseDataPOAssgros(ADate: TDateTime);
//    function CheckPOAssgrosIsCompleted(APONo: string;AUnitId: integer): boolean;
//    procedure ReviewDataPOAssgrosStatus;
    procedure PrintDOForAssgros(APOASNo: string);
    procedure ShowPOFromAsGross;
    procedure ShowDODelivered;
    procedure ShowDORealisasi;
    procedure PrepareReport(ANoDO: String; ACaption: String);

  public
    { Public declarations }
    NoDOAssgros: String;
    function GetUntaianNomorDO: string;
    procedure PrepareReportKasir(const AData: TResultDataSet);
  end;

var
  frmDoForAsGross: TfrmDoForAsGross;

implementation

uses uDeliveryOrder,  uGTSUICommonDlg,
  uConstanta, ufrmDetilPOFromTrader, ufrmDialogDOAsgross, uSearchPO,
  udmReport, Math, ufrmDialogPrintKasirPreview, uTemplatePrintText,
  ufrmDialogPrintPreview, suithemes, uRMSUnit, udmReportNew;

const
  PILIH_PO_FROM_ASSGROS = 'PO FROM ASSGROS';
  PILIH_DO_DELIVERED = 'DO DELIVERED';
  PILIH_DO_REALISASI = 'DO REALIZATION';
  CAPTION_PRINT_DO_DELIVERED = 'Print Report DO Assgros';
  CAPTION_PRINT_DO_WO_DISC = 'Print w/o Disc';
  CAPTION_PRINT_DO_REALISASI = 'Reprint DO Realisasi';
  STATUS_DELIVERED = 'DELIVERED';
  STATUS_RECEIPT = 'RECEIPT';
  STATUS_INVOICING = 'INVOICING';


{$R *.dfm}


procedure TfrmDoForAsGross.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDoForAsGross.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDoForAsGross := nil;
end;

procedure TfrmDoForAsGross.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'DO FOR ASSGROS';
end;

procedure TfrmDoForAsGross.FormShow(Sender: TObject);
begin
  dtTgl1.Date := now;
  dtTgl2.Date := now;
  fraFooter5Button1.btnAdd.Enabled := false;
  fraFooter5Button1.btnDelete.Enabled := false;
  fraFooter5Button1.btnUpdate.Enabled := false;
  //fraFooter5Button1.btnRefresh.Enabled := false;
  cbPilih.Clear;
  cbPilih.Items.Add(PILIH_PO_FROM_ASSGROS);
  cbPilih.Items.Add(PILIH_DO_DELIVERED);
  cbPilih.Items.Add(PILIH_DO_REALISASI);
  cbPilih.ItemIndex := 0;
  ParseHeaderGrid;
  dtTgl1.SetFocus;
  
  cbPilihChange(nil);
  btnShowClick(nil);
end;

procedure TfrmDoForAsGross.ParseHeaderGrid;
begin
  with strgGrid do
  begin
    Clear;
    if (Trim(UpperCase(cbPilih.Text)) = PILIH_PO_FROM_ASSGROS)
        or (cbPilih.ItemIndex = 0) then
    begin
      ColCount := 6;
      RowCount := 2;

      Cells[0,0] := '   ';
      Cells[1,0] := 'PO ASSGROS NO.';
      Cells[2,0] := 'PO DATE';
      Cells[3,0] := 'ASSGROS CODE';
      Cells[4,0] := 'ASSGROS NAME';
      Cells[5,0] := 'STATUS PO';
    end
    else
    if ((Trim(UpperCase(cbPilih.Text)) = PILIH_DO_DELIVERED)
        or (cbPilih.ItemIndex = 1))
        or ((cbPilih.ItemIndex = 2) or
        ((Trim(UpperCase(cbPilih.Text)) = PILIH_DO_REALISASI))) then
    begin
      ColCount := 8;
      RowCount := 2;

      Cells[0,0] := '   ';
      Cells[1,0] := 'DO NO.';
      Cells[2,0] := 'PO NO.';
      Cells[3,0] := 'DO DATE';
      Cells[4,0] := 'ASSGROS CODE';
      Cells[5,0] := 'ASSGROS NAME';
      Cells[6,0] := 'DO TOTAL';
      Cells[7,0] := 'CETAK [V]';
    end;

    FixedRows := 1;
    AutoSize := True;
  end;
end;

procedure TfrmDoForAsGross.dtTgl1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    //ParseDataPOAssgros(dtTgl1.Date);
  end;
end;

{
procedure TfrmDoForAsGross.ParseDataPOAssgros(ADate: TDateTime);
var
  i: integer;
  aParams: TArr;
  data: TResultDataSet;
begin
  SetLength(aParams,1);
  aParams[0].tipe := ptDateTime;
  aParams[0].data := ADate;
  data := DeliveryOrder.GetPOAssgrosByDeliverDate(aParams);
  ParseHeaderGrid;
  if data.RecordCount > 0 then
  begin;
    with strgGrid do
    begin
      RowCount := RowCount + data.RecordCount-1;
      i:=1;
      while not data.Eof do
      begin
        AddCheckBox(0,i,False,False);
        Cells[1,i] := data.FieldByName('POAS_NO').AsString;
        Cells[2,i] := FormatDateTime('dd-mm-yyyy',data.FieldByName('POAS_DATE').AsDateTime);
        Cells[3,i] := data.FieldByName('TRD_CODE').AsString;
        Cells[4,i] := data.FieldByName('TRD_NAME').AsString;
//        if (data.FieldByName('TRD_IS_ASSGROS').AsInteger = 1) then
//          Cells[5,i] := 'ASSGROS'
//        else
//          Cells[5,i] := 'TRADER';

        Cells[5,i] := data.FieldByName('POAS_STATUS').AsString;

        i:=i+1;
        data.Next;
      end; // end while
    end; // end with
  end;

  //ReviewDataPOAssgrosStatus;
end;
}
procedure TfrmDoForAsGross.strgGridCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  if (ACol in [0,7]) then
    CanEdit := true
  else
    CanEdit := false;
end;

{
function TfrmDoForAsGross.CheckPOAssgrosIsCompleted(APONo: string;
  AUnitId: integer): boolean;
var
  aParams: TArr;
  iRes: integer;
begin
  SetLength(aParams,2);
  aParams[0].tipe := ptString;
  aParams[0].data := APONo;
  aParams[1].tipe := ptInteger;
  aParams[1].data := AUnitId;
  iRes := PurchasingOrder.CheckIsPOAssgrosCompleted(aParams);

  if (iRes = 1) then
    Result := true
  else
    Result := false;
end;
}

{procedure TfrmDoForAsGross.ReviewDataPOAssgrosStatus;
var
  i,UnitId: integer;
  isCompleted: boolean;
begin
  if not assigned(DeliveryOrder) then
    DeliveryOrder := TDeliveryOrder.Create;
  UnitId := DeliveryOrder.GetUnitId;

  with strgGrid do
  begin
    for i:=1 to RowCount-1 do
    begin
      isCompleted := CheckPOAssgrosIsCompleted(Cells[1,i],UnitId);
      if (isCompleted) then
      begin
        Cells[7,i] := 'ORDERED COMPLETED';
        if not assigned(PurchasingOrder) then
          PurchasingOrder := TPurchasingOrder.Create;
        PurchasingOrder.UpdateStatusPOAssgrosOrdered(Cells[1,i]);
      end
      else
        Cells[7,i] := 'ORDERED NOT COMPLETED';

      if (Cells[7,i] = 'ORDERED COMPLETED') then
      begin
        SetCheckBoxState(0,i,True);
        Cells[10,i] := '1';
      end
      else
        Cells[10,i] := '0';
    end;
    AutoSize := true;
  end;
end;
}

procedure TfrmDoForAsGross.actCreateDOTraderExecute(Sender: TObject);
var
  i: integer;
  isPrint: boolean;
begin
  isPrint := false;
  for i:=1 to strgGrid.RowCount-1 do
  begin
    if (strgGrid.Cells[10,i] = '1') then
    begin
      isPrint := true;
      PrintDOForAssgros(strgGrid.Cells[1,i]);
      //if not assigned(PurchasingOrder) then
      //  PurchasingOrder := TPurchasingOrder.Create;
      TPO_ASSGROS.UpdateStatusPOAssgrosDelivered(strgGrid.Cells[1,i], MasterNewUnit.ID);
    end;
  end;

  if (isPrint) then
    CommonDlg.ShowConfirmGlobal(PRINT_DO_FOR_ASSGROS_SUCCESSFULLY);
end;

procedure TfrmDoForAsGross.actDetilPOTraderExecute(Sender: TObject);
begin
//  if not assigned(frmDetilPOFromTrader) then
//    frmDetilPOFromTrader := TfrmDetilPOFromTrader.Create(Application);
//  frmDetilPOFromTrader.POASNo := strgGrid.Cells[1,strgGrid.Row];
//  frmDetilPOFromTrader.Show;
  if cbPilih.ItemIndex = 0 then
    actCreateDOTraderExecute(Self);
end;

procedure TfrmDoForAsGross.fraFooter5Button1btnAddClick(Sender: TObject);
//var
  //NoDO: string;
begin
//  actCreateDOTraderExecute(Self);
  if not Assigned(frmDialogDOAsGross) then
    frmDialogDOAsGross := TfrmDialogDOAsGross.Create(Self);


  frmDialogDOAsGross.FormMode       := fmAddDOAssgros;
  frmDialogDOAsGross.NoPOReferenced := strgGrid.Cells[1, strgGrid.Row];
  frmDialogDOAsGross.NoDOReferenced := '';

  SetFormPropertyAndShowDialog(frmDialogDOAsGross);
  btnShowClick(Self);
end;

procedure TfrmDoForAsGross.fraFooter5Button1btnUpdateClick(Sender: TObject);
begin
  if cbPilih.ItemIndex = 0 then // Lihat PO Detil
  begin
    if not Assigned(frmDetilPOFromTrader) then
      frmDetilPOFromTrader := TfrmDetilPOFromTrader.Create(Self);

    frmDetilPOFromTrader.POASNo := strgGrid.Cells[1, strgGrid.Row];
    frmDetilPOFromTrader.UnitID := masternewunit.id;
    SetFormPropertyAndShowDialog(frmDetilPOFromTrader);

    frmDetilPOFromTrader.Free;
  end
  else //Lihat DO Detil
  begin
    if not Assigned(frmDialogDOAsGross) then
      frmDialogDOAsGross := TfrmDialogDOAsGross.Create(Self);
      
    if cbPilih.ItemIndex = 1 then
    begin
      frmDialogDOAsGross.NoDOReferenced := strgGrid.Cells[1,strgGrid.Row];
      frmDialogDOAsGross.NoPOReferenced := '';
      frmDialogDOAsGross.FormMode := fmDetilDO;
    end else
    begin
      frmDialogDOAsGross.NoDOReferenced := strgGrid.Cells[1,strgGrid.Row];
      frmDialogDOAsGross.NoPOReferenced := '';
      frmDialogDOAsGross.FormMode := fmDetilRealisasi;
    end;





    SetFormPropertyAndShowDialog(frmDialogDOAsGross);

    frmDialogDOAsGross.Free;
  end;
end;

procedure TfrmDoForAsGross.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key = Ord('C'))and(ssctrl in Shift) then        //dulunya ctrl T
    GetAndRunButton('btnAdd');
  if(Key = Ord('D'))and(ssctrl in Shift) then
    GetAndRunButton('btnUpdate');
  if(Key = VK_F5)and(ssctrl in Shift) then
    GetAndRunButton('btnRefresh');
end;

procedure TfrmDoForAsGross.PrintDOForAssgros(APOASNo: string);
begin
//
end;

{procedure TfrmDoForAsGross.actDeleteDOTraderExecute(Sender: TObject);
var
  _bResult: Boolean;
  _DONo: string;
begin
//  ParseDataPOAssgros(dtTgl1.Date);
  if CommonDlg.Confirm('Are you sure to delete this DO?') <> mrYes then
    Exit;

  _DONo := Trim(strgGrid.Cells[1, strgGrid.Row]);
  if (_DONo <> '') and (_DONo <> 'DO NO.') then
  begin

    _bResult := True;

    try
      try
        _bResult := _bResult and PurchasingOrder.DeleteDOAssgrosDetil(_DONo, masternewunit.id);
        if _bResult then
          ADConn.Commit;
      except
        ADConn.Rollback;
        Exit;
      end;
      try
        _bResult := _bResult and PurchasingOrder.DeleteDOAssgros(_DONo, masternewunit.id);
        if _bResult then
          ADConn.Commit;
        btnShow.Click;
      except
        ADConn.Rollback;
      end;

    except
      ADConn.Rollback;
    end;
  end;
end;
}

procedure TfrmDoForAsGross.fraFooter5Button1btnRefreshClick(
  Sender: TObject);
begin
  if cbPilih.ItemIndex = 2 then
  begin
    if not Assigned(frmDialogDOAsGross) then
      frmDialogDOAsGross := TfrmDialogDOAsGross.Create(Self);


    frmDialogDOAsGross.NoDOReferenced := strgGrid.Cells[1,strgGrid.Row];
    frmDialogDOAsGross.NoPOReferenced := '';
    frmDialogDOAsGross.FormMode := fmEditRealisasi;

    SetFormPropertyAndShowDialog(frmDialogDOAsGross);
    if frmDialogDOAsGross.IsBerhasilSimpan then
    begin
      CommonDlg.ShowMessage('Berhasil Simpan Data');
      frmDialogDOAsGross.Free;
    end;
  end;

end;

procedure TfrmDoForAsGross.btnShowClick(Sender: TObject);
begin
  inherited;
  btnShowReport.Visible := false;
  pnlBayar.Visible := false;
  btnPrintDOwoDisc.Visible := false;
  if (Trim(UpperCase(cbPilih.Text)) = PILIH_PO_FROM_ASSGROS)
        or (cbPilih.ItemIndex = 0) then
  begin
    ShowPOFromAsGross;
    fraFooter5Button1.btnDelete.Enabled := false;
    //fraFooter5Button1.btnRefresh.Enabled := False;
    btnPrintDOwoDisc.Visible := False;
  end
  else
  if (Trim(UpperCase(cbPilih.Text)) = PILIH_DO_DELIVERED)
        or (cbPilih.ItemIndex = 1) then
  begin
    ShowDODelivered;
    fraFooter5Button1.btnAdd.Enabled := false;
    btnShowReport.Caption := CAPTION_PRINT_DO_DELIVERED;
    btnShowReport.Visible := true;
    //btnPrintDOwoDisc.Visible := True;
  end
  else
  if (Trim(UpperCase(cbPilih.Text)) = PILIH_DO_REALISASI)
        or (cbPilih.ItemIndex = 2) then
  begin
    ShowDORealisasi;
    fraFooter5Button1.btnAdd.Enabled := false;
    btnShowReport.Caption := CAPTION_PRINT_DO_REALISASI;
    //fraFooter5Button1.btnRefresh.Enabled := False;
    btnShowReport.Visible := true;
    btnPrintDOwoDisc.Visible := False;
  end
  else
    CommonDlg.ShowError('Choose the Right Options first, Please');

  btnShow.SetFocus;  

end;

procedure TfrmDoForAsGross.ShowDODelivered;
var
  aData: TResultDataSet;
  i: Integer;
  aParam: TArr;
begin
  SetLength(aParam, 2);
  aParam[0].tipe := ptDateTime;
  aParam[0].data := dtTgl1.Date;
  aParam[1].tipe := ptDateTime;
  aParam[1].data := dtTgl2.Date;

  //if not Assigned(PurchasingOrder) then
  //  PurchasingOrder := TPurchasingOrder.Create;
  
  aData := TPO_ASSGROS.GetListDOAsgrossDelivered(dtTgl1.Date,dtTgl2.Date, MasterNewUnit.ID);
  ParseHeaderGrid;
  aData.Last;
  if aData.RecordCount > 0 then
  begin;
    with strgGrid do
    begin
      RowCount := RowCount + aData.RecordCount-1;
      i:=1;
      aData.First;
      while not aData.Eof do
      begin
//        AddCheckBox(0,i,False,False);
        Cells[0,i] := IntToStr(i);
        Cells[1,i] := aData.FieldByName('DOAS_NO').AsString;
        Cells[2,i] := aData.FieldByName('DOAS_POAS_NO').AsString;
        Cells[3,i] := FormatDateTime('dd-mm-yyyy',aData.FieldByName('DOAS_DATE').AsDateTime);
        Cells[4,i] := aData.FieldByName('TRD_CODE').AsString;
        Cells[5,i] := aData.FieldByName('TRD_NAME').AsString;
        Cells[6,i] := aData.FieldByName('DOAS_TOTAL').AsString;
        AddCheckBox(7,i,True,True);
        SetCheckBoxState(7,i,True);

        i:=i+1;
        aData.Next;
      end; // end while
     AutoSize := true;
    end; // end with
    fraFooter5Button1.btnDelete.Enabled := True;
    fraFooter5Button1.btnUpdate.Enabled := True;
    //fraFooter5Button1.btnRefresh.Enabled := True;
    btnShowReport.Enabled := True;
  end
  else
  begin
    fraFooter5Button1.btnDelete.Enabled := False;
    fraFooter5Button1.btnUpdate.Enabled := False;
    //fraFooter5Button1.btnRefresh.Enabled := False;
    btnShowReport.Enabled := False;
  end;
end;

procedure TfrmDoForAsGross.ShowPOFromAsGross;
var
  aData: TResultDataSet;
  i: Integer;
  aParam: TArr;
begin
  SetLength(aParam, 2);
  aParam[0].tipe := ptDateTime;
  aParam[0].data := dtTgl1.Date;
  aParam[1].tipe := ptDateTime;
  aParam[1].data := dtTgl2.Date;
  //if not Assigned(PurchasingOrder) then
  //  PurchasingOrder := TPurchasingOrder.Create;
  aData := TPO_ASSGROS.GetListPOAsGrossBetweenDate(dtTgl1.Date, dtTgl2.Date, MasterNewUnit.ID);
  ParseHeaderGrid;
  aData.Last;
  if aData.RecordCount > 0 then
  begin;
    with strgGrid do
    begin
      RowCount := RowCount + aData.RecordCount-1;
      i:=1;
      aData.First;
      while not aData.Eof do
      begin
//        AddCheckBox(0,i,False,False);
        Cells[0,i] := IntToStr(i);
        Cells[1,i] := aData.FieldByName('POAS_NO').AsString;
        Cells[2,i] := FormatDateTime('dd-mm-yyyy',aData.FieldByName('POAS_DATE').AsDateTime);
        Cells[3,i] := aData.FieldByName('TRD_CODE').AsString;
        Cells[4,i] := aData.FieldByName('TRD_NAME').AsString;
{        if (aData.FieldByName('TRD_IS_ASSGROS').AsInteger = 1) then
          Cells[5,i] := 'ASSGROS'
        else
          Cells[5,i] := 'TRADER';
}        Cells[5,i] := aData.FieldByName('POAS_STATUS').AsString;

        i:=i+1;
        aData.Next;
      end; // end while
    end; // end with
    fraFooter5Button1.btnAdd.Enabled := true;
    fraFooter5Button1.btnUpdate.Enabled := True;
  end
  else
  begin
    fraFooter5Button1.btnAdd.Enabled := False;
    fraFooter5Button1.btnUpdate.Enabled := False;
  end;

end;

procedure TfrmDoForAsGross.fraFooter5Button1btnDeleteClick(
  Sender: TObject);
//var
//  NoDO: String;
begin
  inherited;

  if not Assigned(frmDialogDOAsGross) then
    frmDialogDOAsGross := TfrmDialogDOAsGross.Create(Self);

  frmDialogDOAsGross.FormMode       := fmRealisasi;
  frmDialogDOAsGross.NoDOReferenced := strgGrid.Cells[1, strgGrid.Row];
  SetFormPropertyAndShowDialog(frmDialogDOAsGross);
  if frmDialogDOAsGross.IsBerhasilSimpan then
  begin
    CommonDlg.ShowMessage('Berhasil Simpan Data');
  end;
  btnShowClick(Self);

end;

procedure TfrmDoForAsGross.btnShowReportClick(Sender: TObject);
var
  sStatus: string;
  sUntaianNoDO: string;
begin
  inherited;
  {if strgGrid.IsSelected(strgGrid.Col, strgGrid.Row) then
  begin
    if (btnShowReport.Caption = CAPTION_PRINT_DO_DELIVERED) or
       (btnShowReport.Caption = CAPTION_PRINT_DO_REALISASI) then
      PrepareReport(strgGrid.Cells[1, strgGrid.Row], btnShowReport.Caption)
    else
    begin
      PrepareComboBeforePrintRealisasi(strgGrid.Cells[1, strgGrid.Row]);
    end;
  end
  else
    CommonDlg.ShowError('Pilih Dulu Nomor DO Kringnya');
  }

  if btnShowReport.Caption = CAPTION_PRINT_DO_DELIVERED then
  begin
    sStatus := 'DELIVERED';
  end else begin
    sStatus := 'RECEIPT';
  end;

  sUntaianNoDO := GetUntaianNomorDO;
  DoSlipDoKring(sUntaianNoDO,sStatus, masternewunit.id, FLoginUsername,MasterNewunit.Nama,cgetServerTime, cgetServerTime);
end;

procedure TfrmDoForAsGross.PrepareReport(ANoDO: String; ACaption: string);
var
  s: string;
begin
  inherited;
  try
    if (ACaption = CAPTION_PRINT_DO_DELIVERED) or (ACaption = CAPTION_PRINT_DO_REALISASI) then
    begin
      if ACaption = CAPTION_PRINT_DO_REALISASI then
        s := 'SELECT ' + GetCompanyHeader(FLoginUsername, MasterNewUnit.Nama, Date, Date)
           + ' a.DOAS_NO, a.DOAS_POAS_NO, b.POAS_DATE, a.DOAS_DATE,'
           + ' c.TRD_ID, c.TRD_UNT_ID, c.TRD_CODE, c.TRD_NAME, c.TRD_ADDRESS,'
           + ' c.TRD_TELP, c.TRD_NPWP, c.TRD_TOP, c.TRD_IS_ASSGROS,'
           + ' a.DOAS_DESCRIPTION, a.DOAS_STATUS, a.DOAS_TOTAL, a.OP_CREATE,'
           + ' d.DOASD_ID, d.DOASD_BRG_CODE, e.BRG_NAME || '' '' || e.BRG_MERK AS BRG_NAME,'
           + ' d.DOASD_SAT_CODE, d.DOASD_QTY_RECEIPT as DOASD_QTY, d.DOASD_SELL_PRICE,'
           + ' d.DOASD_SELL_PRICE_DISC, d.DOASD_DISC, d.DOASD_PPN,'
           + ' d.DOASD_PPNBM, d.DOASD_TOTAL_PRICE_RECEIPT as DOASD_TOTAL_PRICE, d.DOASD_DISC_MEMBER_RECEIPT as DOASD_DISC_MEMBER,'
           + ' d.DOASD_COGS, d.DOASD_LAST_COST, f.TPBYR_NAME, g.POASD_QTY'
           + ' FROM DO_ASSGROS a LEFT JOIN DO_ASSGROS_DETIL d'
           + ' ON a.DOAS_NO = d.DOASD_DOAS_NO AND a.DOAS_UNT_ID = d.DOASD_DOAS_UNT_ID'
           + ' LEFT JOIN TRADER c ON c.TRD_ID = a.DOAS_TRD_ID'
           + ' AND c.TRD_UNT_ID = a.DOAS_TRD_UNT_ID'
           + ' LEFT JOIN BARANG e ON e.BRG_CODE = d.DOASD_BRG_CODE'
           + ' LEFT JOIN PO_ASSGROS b ON a.DOAS_POAS_NO = b.POAS_NO'
           + ' AND a.DOAS_POAS_UNT_ID = b.POAS_UNT_ID'
           + ' LEFT JOIN PO_ASSGROS_DETIL g ON g.POASD_POAS_NO = b.POAS_NO'
           + ' AND g.POASD_POAS_UNT_ID = b.POAS_UNT_ID'
           + ' AND g.POASD_BRG_CODE = d.DOASD_BRG_CODE'
           + ' AND g.POASD_SAT_CODE = d.DOASD_SAT_CODE '
           + ' LEFT JOIN REF$TIPE_PEMBAYARAN f ON c.TRD_TPBYR_ID = f.TPBYR_ID'
           + ' WHERE a.DOAS_STATUS = ' + Quot('RECEIPT')
           + ' AND a.DOAS_NO = ' + Quot(ANoDO)
       else
        s := 'SELECT ' + GetCompanyHeader(FLoginUsername, MasterNewUnit.Nama, Date, Date)
           + ' a.DOAS_NO, a.DOAS_POAS_NO, b.POAS_DATE, a.DOAS_DATE,'
           + ' c.TRD_ID, c.TRD_UNT_ID, c.TRD_CODE, c.TRD_NAME, c.TRD_ADDRESS,'
           + ' c.TRD_TELP, c.TRD_NPWP, c.TRD_TOP, c.TRD_IS_ASSGROS,'
           + ' a.DOAS_DESCRIPTION, a.DOAS_STATUS, a.DOAS_TOTAL, a.OP_CREATE,'
           + ' d.DOASD_ID, d.DOASD_BRG_CODE, e.BRG_NAME || '' '' || e.BRG_MERK AS BRG_NAME,'
           + ' d.DOASD_SAT_CODE, d.DOASD_QTY, d.DOASD_SELL_PRICE,'
           + ' d.DOASD_SELL_PRICE_DISC, d.DOASD_DISC, d.DOASD_PPN,'
           + ' d.DOASD_PPNBM, d.DOASD_TOTAL_PRICE, d.DOASD_DISC_MEMBER,'
           + ' d.DOASD_COGS, d.DOASD_LAST_COST, f.TPBYR_NAME, g.POASD_QTY'
           + ' FROM DO_ASSGROS a LEFT JOIN DO_ASSGROS_DETIL d'
           + ' ON a.DOAS_NO = d.DOASD_DOAS_NO AND a.DOAS_UNT_ID = d.DOASD_DOAS_UNT_ID'
           + ' LEFT JOIN TRADER c ON c.TRD_ID = a.DOAS_TRD_ID'
           + ' AND c.TRD_UNT_ID = a.DOAS_TRD_UNT_ID'
           + ' LEFT JOIN BARANG e ON e.BRG_CODE = d.DOASD_BRG_CODE'
           + ' LEFT JOIN PO_ASSGROS b ON a.DOAS_POAS_NO = b.POAS_NO'
           + ' AND a.DOAS_POAS_UNT_ID = b.POAS_UNT_ID'
           + ' LEFT JOIN PO_ASSGROS_DETIL g ON g.POASD_POAS_NO = b.POAS_NO'
           + ' AND g.POASD_POAS_UNT_ID = b.POAS_UNT_ID'
           + ' AND g.POASD_BRG_CODE = d.DOASD_BRG_CODE '
           + ' AND g.POASD_SAT_CODE = d.DOASD_SAT_CODE '
           + ' LEFT JOIN REF$TIPE_PEMBAYARAN f ON c.TRD_TPBYR_ID = f.TPBYR_ID'
           + ' WHERE a.DOAS_STATUS = ' + Quot('DELIVERED')
           + ' AND a.DOAS_NO = ' + Quot(ANoDO);
      dmReportNew.EksekusiReport('frDeliveryOrderAsGross', S, '', True);
    end
    else
    begin
      //
    end;
  finally
    //FreeAndNil(PurchasingOrder);
  end;
end;

procedure TfrmDoForAsGross.ShowDORealisasi;
var
  aData: TResultDataSet;
  i: Integer;
  aParam: TArr;
begin
  SetLength(aParam, 2);
  aParam[0].tipe := ptDateTime;
  aParam[0].data := dtTgl1.Date;
  aParam[1].tipe := ptDateTime;
  aParam[1].data := dtTgl2.Date;
  {
  if not Assigned(PurchasingOrder) then
    PurchasingOrder := TPurchasingOrder.Create;
  }
  
  aData := TPO_ASSGROS.GetListDOAsgrossRealisasi(dtTgl1.Date,dtTgl2.Date,MasterNewUnit.ID);
  ParseHeaderGrid;
  aData.Last;
  if aData.RecordCount > 0 then
  begin;
    with strgGrid do
    begin
      RowCount := RowCount + aData.RecordCount-1;
      i:=1;
      aData.First;
      while not aData.Eof do
      begin
        Cells[0,i] := IntToStr(i);
        Cells[1,i] := aData.FieldByName('DOAS_NO').AsString;
        Cells[2,i] := aData.FieldByName('DOAS_POAS_NO').AsString;
        Cells[3,i] := FormatDateTime('dd-mm-yyyy',aData.FieldByName('DOAS_DATE').AsDateTime);
        Cells[4,i] := aData.FieldByName('TRD_CODE').AsString;
        Cells[5,i] := aData.FieldByName('TRD_NAME').AsString;
        Cells[6,i] := aData.FieldByName('DOAS_TOTAL_RECIPT').AsString;

        AddCheckBox(7,i,True,True);
        SetCheckBoxState(7,i,True);

        i:=i+1;
        aData.Next;
      end; // end while
     AutoSize := true;
    end; // end with
    fraFooter5Button1.btnDelete.Enabled := False;
    fraFooter5Button1.btnUpdate.Enabled := True;
    btnShowReport.Enabled := True;
  end
  else
  begin
    fraFooter5Button1.btnDelete.Enabled := false;
    fraFooter5Button1.btnUpdate.Enabled := False;
    btnShowReport.Enabled := False;
  end;
end;

procedure TfrmDoForAsGross.PrepareReportKasir(const AData: TResultDataSet);
var
  _total_qty,
  _total_harga: Real;
  _count_data, i: integer;
  _ppn, _ppnbm, _sell_price: Currency;
begin
  if not Assigned(frmDialogPrintKasirPreview) then
    frmDialogPrintKasirPreview := TfrmDialogPrintKasirPreview.Create(Self);

  _total_qty := 0.0;
  _total_harga := 0.0;

  with frmDialogPrintKasirPreview.mmoPrint.Lines do
  begin
    Add(DO_REAL_TEXT_HEADER_PRINT);
    Add(DO_REAL_TEXT_HEADER_PRINT + AData.FieldByName('DOAS_NO').AsString + ' / ' + AData.FieldByName('DOAS_POAS_NO').AsString); //13
    Add(DO_REAL_TEXT_HEADER_TGL_JAM + FormatDateTime('dd-MM-yyyy hh:mm:ss', Now));  //02-02-2008 10:10:10
    Add(DO_REAL_TEXT_HEADER_NO_TRANSAKSI + AData.FieldByName('DOAS_NO_TRAKSAKSI').AsString); //000-999
    Add(DO_REAL_TEXT_HEADER_NO_POS + AData.FieldByName('SETUPPOS_TERMINAL_CODE').AsString + ' - ' + AData.FieldByName('USR_FULLNAME').AsString); //13
    Add(GENERAL_TEXT_SINGLE_LINE);
    Add(DO_REAL_TEXT_COLUMN_HEADER);
    Add(GENERAL_TEXT_SINGLE_LINE);

    if not AData.IsEmpty then
    begin
      AData.First;
      _count_data := AData.RecordCount - 1;
      for i:= 0 to _count_data do
      begin
        _sell_price := AData.FieldByName('DOASD_SELL_PRICE').AsCurrency;
        _ppn := AData.FieldByName('DOASD_PPN').AsFloat * _sell_price / 100;
        _ppnbm := AData.FieldByName('DOASD_PPNBM').AsFloat * _sell_price / 100;

        Add(AData.FieldByName('DOASD_BRG_CODE').AsString + ' ' +
            AData.FieldByName('BRG_NAME').AsString);
        Add(StrPadLeft(FormatFloat('#,###0.0', AData.FieldByName('DOASD_DISC').AsFloat), DO_REAL_INT_JANGKAUAN_DISC, ' ') +
            StrPadLeft(FormatFloat('#,###0.0', AData.FieldByName('DOASD_QTY_RECEIPT').AsFloat), DO_REAL_INT_JANGKAUAN_QTY, ' ') +
            StrPadLeft(FormatFloat('#,###0.00', _sell_price + _ppn + _ppnbm), DO_REAL_INT_JANGKAUAN_HARGA, ' ') +
            StrPadLeft(FormatFloat('#,###0.00', AData.FieldByName('DOASD_TOTAL_PRICE_RECEIPT').AsFloat), DO_REAL_INT_JANGKAUAN_TOTAL, ' '));

        _total_qty := _total_qty + AData.FieldByName('DOASD_QTY_RECEIPT').AsFloat;
        _total_harga := _total_harga + AData.FieldByName('DOASD_TOTAL_PRICE_RECEIPT').AsFloat;
        
        AData.Next;
      end;
    end;

    Add(GENERAL_TEXT_SINGLE_LINE);
    Add(DO_REAL_TEXT_JNS_KARTU + StrPadRight(AData.FieldByName('CARD_NAME').AsString, DO_REAL_INT_JANGKAUAN_KARTU, ' ') +
        DO_REAL_TEXT_TOTAL + StrPadLeft(FormatFloat('#,###0.00', _total_harga), DO_REAL_INT_JANGKAUAN_REKAP, ' '));
    Add(DO_REAL_TEXT_NO_KARTU + StrPadRight(AData.FieldByName('DOAS_NO_CARD').AsString, DO_REAL_INT_JANGKAUAN_KARTU, ' ') +
        DO_REAL_TEXT_CASH + StrPadLeft(FormatFloat('#,###0.00', AData.FieldByName('DOAS_CASH').AsCurrency), DO_REAL_INT_JANGKAUAN_REKAP, ' '));
    Add(DO_REAL_TEXT_OTORISASI + StrPadRight(AData.FieldByName('DOAS_OTORISASI').AsString, DO_REAL_INT_JANGKAUAN_KARTU, ' ') +
        DO_REAL_TEXT_CARD + StrPadLeft(FormatFloat('#,###0.00', AData.FieldByName('DOAS_CARD').AsCurrency), DO_REAL_INT_JANGKAUAN_REKAP, ' '));
    Add(DO_REAL_TEXT_VOUCHER_G + DO_REAL_TEXT_VCHR + StrPadLeft(FormatFloat('#,###0.00', 0), DO_REAL_INT_JANGKAUAN_REKAP, ' '));
    Add(DO_REAL_TEXT_VOUCHER_B + DO_REAL_TEXT_LINE_SHORT);
    Add(DO_REAL_TEXT_VOUCHER_L + DO_REAL_TEXT_KEMBALI + StrPadLeft(FormatFloat('#,###0.00', 0), DO_REAL_INT_JANGKAUAN_KEMBALI, ' '));
    Add(DO_REAL_TEXT_TOTAL_COLIE + StrPadLeft(FormatFloat('#,###0.00', _total_qty), DO_REAL_INT_JANGKAUAN_KEMBALI, ' '));
    Add(DO_REAL_TEXT_FOOTER_PRINT);
  end;

  SetFormPropertyAndShowDialog(frmDialogPrintKasirPreview);

  frmDialogPrintKasirPreview.Free;
end;

procedure TfrmDoForAsGross.btnPrintRealClick(Sender: TObject);
begin
  inherited;
  PrepareReport(strgGrid.Cells[1, strgGrid.Row], CAPTION_PRINT_DO_REALISASI);
  btnBatalClick(Sender);
  btnShowClick(Sender);
end;

{procedure TfrmDoForAsGross.PrepareComboBeforePrintRealisasi(ADONo: string);
var
  _data: TResultDataSet;
  i: integer;
begin
  pnlBayar.Visible := True;
  cbpKasir.Clear;
  edtNoTransaksi.Clear;
  currCash.Value := 0;
  currCredit.Value := 0;
  cbpCredit.Clear;
  edtNoKartu.Clear;
  edtNoOtorisasi.Clear;
  cbpKasir.SetFocus;
  FDONo := ADONo;
  edtNoDO.Text := FDONo;

  if not Assigned(PurchasingOrder) then
    PurchasingOrder := TPurchasingOrder.Create;

  // Load u/ combo Kasir
  _data := PurchasingOrder.GetBeginningBalanceKasir;

  if not _data.IsEmpty then
  begin
    with cbpKasir do
    begin
      FixedRows := 1;
      RowCount := _data.RecordCount + 1;
      AddRow(['', 'CODE', 'NAMA KASIR']);
      _data.First;
      for i:=1 to RowCount-1 do
      begin
        AddRow([_data.FieldByName('BALANCE_ID').AsString,
                _data.FieldByName('SETUPPOS_TERMINAL_CODE').AsString,
                _data.FieldByName('USR_FULLNAME').AsString]);
        _data.Next;
      end;
    end;
  end;

  // Cek apakah pernah d cetak ato blm
  edtNoTransaksi.Text := PurchasingOrder.GetDOAssgrosNoTransaction(FDONo);
  if edtNoTransaksi.Text = '' then
    // Select Max no transaksi hari ini
    edtNoTransaksi.Text := PurchasingOrder.GetMaxNoTodaysTransaction;

  // Cash = 0, Credit = amount DO receipt
  FTotalDO := StrToCurr(strgGrid.Cells[6, strgGrid.Row]);
  currCash.Value := 0;
  currCredit.Value := FTotalDO;

  // Load u/ cara bayar (ref credit card)
  _data := PurchasingOrder.GetRefCreditCard;

  if not _data.IsEmpty then
  begin
    with cbpCredit do
    begin
      FixedRows := 1;
      RowCount := _data.RecordCount + 1;
      AddRow(['', 'CODE', 'CARD']);
      _data.First;
      for i:=1 to RowCount-1 do
      begin
        AddRow([_data.FieldByName('CARD_ID').AsString,
                _data.FieldByName('CARD_CODE').AsString,
                _data.FieldByName('CARD_NAME').AsString]);
        _data.Next;
      end;
    end;
  end;

  // No kartu --> no trader or assgros
  edtNoKartu.Text := PurchasingOrder.GetCardNoByTraderCode(strgGrid.Cells[4, strgGrid.Row]);
end;
}

procedure TfrmDoForAsGross.btnBatalClick(Sender: TObject);
begin
  inherited;
  pnlBayar.Visible := false;
  btnShowClick(Sender);
end;

procedure TfrmDoForAsGross.strgGridGetFloatFormat(Sender: TObject; ACol,
  ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  inherited;
  FloatFormat := '%.2n';
  if ACol = 6 then
    IsFloat := True
  else
    IsFloat := False;
end;

procedure TfrmDoForAsGross.cbpKasirChange(Sender: TObject);
begin
  inherited;
  cbpKasir.Text := cbpKasir.Cells[2, cbpKasir.Row];
end;

procedure TfrmDoForAsGross.cbpCreditChange(Sender: TObject);
begin
  inherited;
  cbpCredit.Text := cbpCredit.Cells[2, cbpCredit.Row];
end;

procedure TfrmDoForAsGross.cbpCreditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_DOWN then
    if Trim(cbpCredit.Text) = '' then
      cbpCredit.Text := cbpCredit.Cells[2, 1];

  if Key = VK_RETURN then
    edtNoKartu.SetFocus;
end;

procedure TfrmDoForAsGross.cbpKasirKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_DOWN then
    if Trim(cbpKasir.Text) = '' then
      cbpKasir.Text := cbpKasir.Cells[2, 1];

  if Key = VK_RETURN then
    currCash.SetFocus;
end;

procedure TfrmDoForAsGross.currCashChange(Sender: TObject);
begin
  inherited;
  if (FTotalDO - currCash.Value) < 0 then
    currCash.Value := FTotalDO;
  currCredit.Value := FTotalDO - currCash.Value;
end;

procedure TfrmDoForAsGross.currCreditChange(Sender: TObject);
begin
  inherited;
  if (FTotalDO - currCredit.Value) < 0 then
    currCredit.Value := FTotalDO;
  currCash.Value := FTotalDO - currCredit.Value;
end;

procedure TfrmDoForAsGross.strgGridGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  inherited;
  if (ACol in [6]) then
    HAlign := taRightJustify
  else if (ACol in [7]) then
    HAlign := taCenter
  else  
    HAlign := taLeftJustify;
end;

procedure TfrmDoForAsGross.currCashKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    currCredit.SetFocus;
end;

procedure TfrmDoForAsGross.currCreditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    cbpCredit.SetFocus;
end;

procedure TfrmDoForAsGross.edtNoKartuKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    edtNoOtorisasi.SetFocus;
end;

procedure TfrmDoForAsGross.edtNoOtorisasiKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    btnPrintReal.SetFocus;
end;

procedure TfrmDoForAsGross.btnPrintDOwoDiscClick(Sender: TObject);
begin
  inherited;
  if strgGrid.IsSelected(strgGrid.Col, strgGrid.Row) then
  begin
    PrepareReport(strgGrid.Cells[1, strgGrid.Row], CAPTION_PRINT_DO_WO_DISC)
  end
  else
    CommonDlg.ShowError('Select Row in the Grid First');
end;

procedure TfrmDoForAsGross.cbPilihChange(Sender: TObject);
begin
  inherited;
  if cbPilih.Text = PILIH_DO_REALISASI then
    fraFooter5Button1.btnRefresh.Enabled := True
  else
    fraFooter5Button1.btnRefresh.Enabled := False;

end;

procedure TfrmDoForAsGross.btnShowEnter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmDoForAsGross.btnShowReportEnter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmDoForAsGross.btnPrintDOwoDiscEnter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmDoForAsGross.btnPrintRealEnter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmDoForAsGross.btnBatalEnter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmDoForAsGross.fraFooter5Button1btnAddEnter(Sender: TObject);
begin
  inherited;
  fraFooter5Button1.btnAddEnter(Sender);

end;

procedure TfrmDoForAsGross.fraFooter5Button1btnUpdateEnter(
  Sender: TObject);
begin
  inherited;
  fraFooter5Button1.btnAddEnter(Sender);

end;

procedure TfrmDoForAsGross.fraFooter5Button1btnRefreshEnter(
  Sender: TObject);
begin
  inherited;
  fraFooter5Button1.btnAddEnter(Sender);

end;

procedure TfrmDoForAsGross.btnPrintRealExit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

procedure TfrmDoForAsGross.btnBatalExit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

procedure TfrmDoForAsGross.btnPrintDOwoDiscExit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

procedure TfrmDoForAsGross.btnShowReportExit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

procedure TfrmDoForAsGross.btnShowExit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

function TfrmDoForAsGross.GetUntaianNomorDO: string;
var
  isChecked: Boolean;
  i: Integer;
begin
  Result := '';
  for i := 1 to strgGrid.RowCount - 1 do
  begin
    strgGrid.GetCheckBoxState(7,i,isChecked);
    if isChecked then
    begin
      Result := Result + Quot(strgGrid.Cells[1,i]) + ',';
    end;
  end;

  Result := Copy(Result,0,length(Result) - 1);
end;

procedure TfrmDoForAsGross.strgGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  IsChecked: Boolean;
  i: Integer;
begin
  inherited;
  if cbPilih.ItemIndex > 0 then
  begin
    if (ssCTRl in Shift) and (Key = Ord('X')) then
    begin
      for i := 1 to strgGrid.RowCount - 1 do
      begin
        strgGrid.GetCheckBoxState(7,i,IsChecked);
        strgGrid.SetCheckBoxState(7,i,not IsChecked);
      end;
    end;
  end;
end;

procedure TfrmDoForAsGross.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  inherited;
  if(Key = Ord('C'))and(ssctrl in Shift) then
  begin
    if fraFooter5Button1.btnAdd.Enabled then
      fraFooter5Button1btnAddClick(nil);
  end
  else if(Key = Ord('E'))and(ssctrl in Shift) then
  begin
    if fraFooter5Button1.btnRefresh.Enabled then
      fraFooter5Button1btnRefreshClick(nil);
  end
  else if(Key = Ord('D'))and(ssctrl in Shift) then
  begin
    if fraFooter5Button1.btnUpdate.Enabled then
      fraFooter5Button1btnUpdateClick(nil);
  end
//  else if(Key = Ord('S'))and(ssctrl in Shift) then
//  begin
//    if dtTgl1.Focused or dtTgl2.Focused  then
//    begin
//      dtTgl1KeyUp(dtTgl1, Key, Shift);
//      btnShow.SetFocus;
//    end;
//
//    btnShowClick(btnShow);
//  end
  else if(Key = Ord('R'))and(ssctrl in Shift) then
  begin
    if fraFooter5Button1.btnDelete.Enabled then
      fraFooter5Button1btnDeleteClick(nil);
  end;

end;

end.



