unit ufrmKuponBotol;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, ufraFooter5Button, StdCtrls, ExtCtrls, Mask,
  JvToolEdit, Grids, BaseGrid, AdvGrid, SUIButton, 
  ActnList, uConn, uConstanta,  JvEdit, te_controls,
  AdvEdit, AdvEdBtn, FR_Class, uNewKuponBotol, ufrmDialogKuponBotol,
  JvExStdCtrls, JvValidateEdit, AdvObj, JvExMask;

type
  TfrmKuponBotol = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    pnl1: TPanel;
    edtMemberName: TEdit;
    actlst1: TActionList;
    actPrintKuponBotol: TAction;
    lblComboGrid: TLabel;
    edtKodeMember: TEdit;
    lbl13: TLabel;
    edtStatus: TEdit;
    pnl2: TPanel;
    actDeleteKuponBotol: TAction;
    lbl1: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    edtKeterangan: TEdit;
    actRefreshKuponBotol: TAction;
    actAddKuponBotol: TAction;
    actEditKuponBotol: TAction;
    dtpTanggal: TJvDateEdit;
    btn2: TsuiButton;
    actAfterPrintKuponBotol: TAction;
    strgGrid: TAdvStringGrid;
    lbl5: TLabel;
    curredtTotalPrice: TJvValidateEdit;
    lbl6: TLabel;
    edtPOSTransNo: TEdit;
    lbl2: TLabel;
    edTransactionNo: TAdvEditBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure actPrintKuponBotolExecute(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure strgGridGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure actDeleteKuponBotolExecute(Sender: TObject);
    procedure actAddKuponBotolExecute(Sender: TObject);
    procedure actEditKuponBotolExecute(Sender: TObject);
    procedure actAfterPrintKuponBotolExecute(Sender: TObject);
    procedure dtpTanggalKeyPress(Sender: TObject; var Key: Char);
    procedure cbpTransNoKeyPress(Sender: TObject; var Key: Char);
    procedure actRefreshKuponBotolExecute(Sender: TObject);
    procedure cbpTransNoExit(Sender: TObject);
    procedure cbpTransNoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edTransactionNoEnter(Sender: TObject);
    procedure edTransactionNoExit(Sender: TObject);
    procedure strgGridGetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
    procedure edTransactionNoClickBtn(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn2Exit(Sender: TObject);
    procedure btn2Enter(Sender: TObject);
  private
    { Private declarations }
    MemberID        : Integer;
//    VoucherNo       : string;
    dataKuponBotol  : TResultDataSet;
    totalNilai      : Currency;
    FnewKuponBotol  : TKuponBotolNew;
    FfrmDlgKuponBtl : TfrmDialogKuponBotol;
    procedure ParseHeaderGrid;
//    procedure ParseDataGrid();
    procedure clearView();
    
//    procedure getLastNo();
//    procedure saveKuponBotol();
//    procedure updateKuponBotol();
    function checkEmpty(): Boolean;
    procedure GetLastKuponBtl;
    procedure ParseDataTransaksiKuponBotolByDate(ADate: TDateTime);
    procedure ParseDataDetilTransaksiKuponBotol(ATransNo: string);
    
    procedure WM_STORE_MESSAGE_Handle(var msg: TMessage); message WM_STORE_MESSAGE;
  public
    { Public declarations }
  end;

var
  frmKuponBotol: TfrmKuponBotol;

implementation

uses uKuponBotol,  uGTSUICommonDlg,
  DB, uSpell, suithemes,
  ufrmDialogPrintPreview, uRMSUnit, uNewMembership, udmReportNew;

var mySpell: TSpell;

{$R *.dfm}

procedure TfrmKuponBotol.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmDialogKuponBotol := nil;
end;

procedure TfrmKuponBotol.clearView();
begin
  //clear header
//  edtKodeMember.Clear;
//  edtMemberName.Clear;
  edtStatus.Clear;
  edtKeterangan.Clear;
  curredtTotalPrice.Value := 0;
  edtPOSTransNo.Clear;
end;

procedure TfrmKuponBotol.FormShow(Sender: TObject);
var
  sTemp: string;
	sSQL: string;
  data: TResultDataSet;
  intUnitID: Integer;
begin
  FnewKuponBotol := TKuponBotolNew.Create(Self);
  intUnitId := masternewunit.id;
  dtpTanggal.Date:= cGetServerTime;
//  sTemp := TKuponBotolNew.GetLastVoucherNo(dtpTanggal.Date,masternewunit.id);
  sTemp := FnewKuponBotol.GetLastVoucherNo(dtpTanggal.Date,masternewunit.id);

  if sTemp <> '' then
  begin
    edTransactionNoEnter(edTransactionNo);
    edTransactionNo.Text := sTemp;
    edTransactionNo.Tag := 1;
    edTransactionNoExit(edTransactionNo);
    ParseDataDetilTransaksiKuponBotol(sTemp);
    FnewKuponBotol.LoadByNO(edTransactionNo.Text, masternewunit.id);
    strgGrid.SetFocus;
    Exit;
  end;
  
  edtKodeMember.Text := getGlobalVar('POS_DEF_CUST');  
  sSQL := 'SELECT MEMBER_ID, MEMBER_CARD_NO, MEMBER_NAME, TPMEMBER_NAME '
    + 'FROM MEMBER '
    + ' INNER JOIN REF$TIPE_MEMBER ON (TPMEMBER_ID=MEMBER_TPMEMBER_ID) '
    + ' WHERE MEMBER_UNT_ID = ' + IntToStr(intUnitID)
    + ' AND (MEMBER_IS_ACTIVE = 1) '
    + ' AND MEMBER_CARD_NO = ' + Quot(edtKodeMember.Text);
  data := cOpenQuery(sSQL);
  if not data.IsEmpty then
  try
    begin
      edtMemberName.Text := data.FieldByName('MEMBER_NAME').AsString;
      MemberID := data.FieldByName('MEMBER_ID').AsInteger;
    end;
    lblHeader.Caption := 'TRANSAKSI KUPON BOTOL';

    dtpTanggal.SetFocus;
    dtpTanggal.SelectAll;
    ParseDataTransaksiKuponBotolByDate(dtpTanggal.Date);
    ParseHeaderGrid;
  finally
    FreeAndNil(data);
  end;
end;

procedure TfrmKuponBotol.actPrintKuponBotolExecute(
  Sender: TObject);
var arrParam: TArr;
	sSQL: string;
    ParamList: TStringList;
    SeparatorTanggal: Char;
begin
  //check empty
  if not(checkEmpty) then Exit;

  sSQL := 'SELECT KBD.*, KB.*, MB.MEMBER_CARD_NO, MB.MEMBER_NAME, '
    + 'BRG.BRG_MERK, BRG.BRG_NAME, BRG.BRG_ALIAS, RS.SAT_NAME, GM.GROMEMBER_NAME '
    + 'FROM TRANS_KUPON_BOTOL KB '
    + 'INNER JOIN TRANS_KUPON_BOTOL_DETIL KBD ON KB.TKB_NO = KBD.TKBD_TKB_NO '
    + ' AND KB.TKB_UNT_ID = KBD.TKBD_TKB_UNT_ID '
    + 'INNER JOIN MEMBER MB ON MB.MEMBER_ID = KB.TKB_MEMBER_ID '
    + ' AND KB.TKB_MEMBER_UNT_ID = MB.MEMBER_UNT_ID '
    + 'INNER JOIN BARANG BRG ON BRG.BRG_CODE = KBD.TKBD_BRG_CODE '
    + 'INNER JOIN ref$satuan RS on KBD.TKBD_SAT_CODE = RS.sat_code '
    + 'INNER JOIN REF$GRUP_MEMBER GM ON MB.MEMBER_GROMEMBER_ID = GM.GROMEMBER_ID '
    + ' AND MB.MEMBER_GROMEMBER_UNT_ID = GM.GROMEMBER_UNT_ID '
    + ' WHERE KB.TKB_NO = ' + Quot(edTransactionNo.Text)
    + ' ORDER BY BRG.BRG_CODE';

  SeparatorTanggal:= FormatSettings.DateSeparator;
  FormatSettings.DateSeparator:= '/';
  frVariables.Variable['TANGGAL'] := FormatDateTime('dd/mm/yyyy', dtpTanggal.Date);
  FormatSettings.DateSeparator:= SeparatorTanggal;
  frVariables.Variable['USERNAME'] := FLoginUsername;

  if not Assigned(mySpell) then
     mySpell := TSpell.Create;

  frVariables.Variable['TERBILANG'] := mySpell.Spell(CurrToStr(totalNilai)) + ' Rupiah';
  frVariables.Variable['CL1'] := MasterNewunit.Nama;
  dmReportNew.EksekusiReport('KuponBotol_Slip',sSQL,'',True);
  Exit;

  if not Assigned(KuponBotol) then
    KuponBotol := TKuponBotol.Create;

  SetLength(arrParam,1);
  arrParam[0].tipe := ptString;
  arrParam[0].data := edTransactionNo.Text;
  dataKuponBotol := KuponBotol.searchKuponBotol(arrParam);

  ParamList := TStringList.Create;
//  ParamList.Add(DateToStr(MasterAgreement.getServerDate)); //0
  ParamList.Add(FLoginUsername); //0
  SeparatorTanggal:= FormatSettings.DateSeparator;
  FormatSettings.DateSeparator:= '/';
  ParamList.Add(FormatDateTime('dd/mm/yyyy', dtpTanggal.Date)); //1
  FormatSettings.DateSeparator:= SeparatorTanggal;
  //ParamList.Add(cbpTransNo.Text); //2
  //ParamList.Add(dataKuponBotol.FieldByName('MEMBER_CARD_NO').AsString); //3
  ParamList.Add(edTransactionNo.Text);
  ParamList.Add(edtKodeMember.Text);

  if dataKuponBotol.FieldByName('TKB_IS_PRINTED').Value = 1 then
     ParamList.Add('<<<< ( Cetak Ulang ) >>>>') //4
  else
     ParamList.Add(''); //4

  ParamList.Add(mySpell.Spell(CurrToStr(totalNilai)) + ' Rupiah'); // 5
  ParamList.Add(MasterNewunit.Nama); //6

  if not Assigned(frmDialogPrintPreview) then
    frmDialogPrintPreview := TfrmDialogPrintPreview.Create(Application);
  frmDialogPrintPreview.FilePath := FFilePathReport + 'frCetakKuponBotol.fr3';
  frmDialogPrintPreview.ListParams := ParamList;
  frmDialogPrintPreview.RecordSet := dataKuponBotol;
  SetFormPropertyAndShowDialog(frmDialogPrintPreview);

  frmDialogPrintPreview.Free;

  FreeAndNil(ParamList);

//  with dmReport do begin
//    Params := ParamList;
//
//    pMainReport.OnAfterPrintReport:= actAfterPrintKuponBotolExecute;
//
//    frxDBDataset.DataSet := dataKuponBotol;
//    pMainReport.LoadFromFile(ExtractFilePath(Application.ExeName) + '/template/frCetakKuponBotol.fr3');
//    pMainReport.ShowReport(True);
//  end;
end;

//procedure TfrmKuponBotol.ParseDataGrid;
////var intI: Integer;
////    arrParam: TArr;
////    total: Currency;
//begin
////  INIT
////  total := 0;
////
////  if not Assigned(KuponBotol) then
////    KuponBotol := TKuponBotol.Create;
////
////  SetLength(arrParam,1);
////  arrParam[0].tipe := ptString;
////  arrParam[0].data := cbpTransNo.Text;
////  dataKuponBotol := KuponBotol.searchKuponBotol(arrParam);
////  clearView;
////  ParseHeaderGrid;
////  if dataKuponBotol.RecordCount > 0 then
////  begin
////    initiate
////    strgGrid.RowCount := dataKuponBotol.RecordCount + 1;
////    intI := 1;
////    dataKuponBotol.First;
////
////    MemberID := dataKuponBotol.FieldByName('TKB_MEMBER_ID').AsInteger;
////    VoucherNo := dataKuponBotol.FieldByName('TKBD_TKB_NO').AsString;
////    edtKodeMember.Text := dataKuponBotol.FieldByName('MEMBER_CARD_NO').AsString;
////    edtMemberName.Text := dataKuponBotol.FieldByName('MEMBER_NAME').AsString;
////    edtKeterangan.Text := dataKuponBotol.FieldByName('TKB_DESCRIPTION').AsString;
////    edtStatus.Text := dataKuponBotol.FieldByName('TKB_STATUS').AsString;
////    {if dataKuponBotol.FieldByName('TKB_IS_ACTIVE').AsInteger = 1 then
////      edtStatus.Text := 'OPEN'
////    else edtStatus.Text := 'CLOSED';}
////
////    while not(dataKuponBotol.Eof) do
////    begin
////      with strgGrid do
////      begin
////        Cells[0,intI] :=  dataKuponBotol.FieldByName('TKBD_BRG_CODE').AsString;
//////        Cells[1,intI] :=  dataKuponBotol.FieldByName('BRG_ALIAS').AsString;
////        Cells[1,intI] :=  dataKuponBotol.FieldByName('BRG_MERK').AsString + ' ' +
////                          dataKuponBotol.FieldByName('BRG_NAME').AsString;
////        Cells[2,intI] :=  dataKuponBotol.FieldByName('TKBD_SAT_CODE').AsString;
////        Cells[3,intI] :=  dataKuponBotol.FieldByName('TKBD_QTY').AsString;
////        Cells[4,intI] :=  dataKuponBotol.FieldByName('TKBD_DISC').AsString;
////        Cells[5,intI] :=  dataKuponBotol.FieldByName('TKBD_SELL_PRICE').AsString;
////        Cells[6,intI] :=  dataKuponBotol.FieldByName('TKBD_SELL_PRICE_DISC').AsString;
////
////        total := total + dataKuponBotol.FieldByName('TKBD_SELL_PRICE_DISC').AsCurrency;
////      end; //end with strggrid
////
////      Inc(intI);
////      dataKuponBotol.Next;
////    end; //end while
////  end;
////
////  curredtTotalPrice.Value := total;   
////  totalNilai:= total;
////
////  strgGrid.FixedRows := 1;
////  strgGrid.AutoSize := true;
//end;

procedure TfrmKuponBotol.ParseHeaderGrid;
begin
  with strgGrid do
  begin
    ClearRows(0,RowCount);
    RowCount := 2;
    ColCount := 8;
    Cells[0,0] := 'PLU';
    Cells[1,0] := 'PRODUCT NAME';
    Cells[2,0] := 'UOM';
    Cells[3,0] := 'QTY';
    Cells[4,0] := 'SELL PRICE';
    Cells[5,0] := 'DISC';
    Cells[6,0] := 'SELL PRICE DISC';
    Cells[7,0] := 'TOTAL SELL PRICE DISC';

    FixedRows := 1;
    AutoSize := true;
  end;
end;

procedure TfrmKuponBotol.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = Ord('N')) and (ssctrl in Shift) then
  begin
    if strgGrid.Cells[1,strgGrid.RowCount-1] = '' then
    begin
      CommonDlg.ShowErrorEmpty('PRODUCT NAME');
      strgGrid.SetFocus;
      Exit;
    end
    else if strgGrid.Cells[3,strgGrid.RowCount-1] = '' then
    begin
      CommonDlg.ShowErrorEmpty('QTY');
      strgGrid.SetFocus;
      Exit;
    end
    else if strgGrid.Cells[4,strgGrid.RowCount-1] = '' then
    begin
      CommonDlg.ShowErrorEmpty('DISC');
      strgGrid.SetFocus;
      Exit;
    end
    else if strgGrid.Cells[6,strgGrid.RowCount-1] = '' then
    begin
      CommonDlg.ShowErrorEmpty('TOTAL');
      strgGrid.SetFocus;
      Exit;
    end
    else strgGrid.AddRow;
    strgGrid.SetFocus;
  end //ctrl + N
  else if (Key = Ord('D')) and (ssctrl in Shift) then
  begin
    strgGrid.RemoveSelectedRows;
  end; //ctrl + D

  if (Key = Ord('P')) and (ssctrl in Shift) then
    actPrintKuponBotolExecute(Self);
end;

//procedure TfrmKuponBotol.getLastNo();
//begin
////  if not Assigned(KuponBotol) then KuponBotol := TKuponBotol.Create;
//
//  //edtLastNo.Text := KuponBotol.GetLastTKBNo;
//end;

function TfrmKuponBotol.checkEmpty(): Boolean;
var countI: Integer;
begin
  //init
  Result := True;

  if edtKodeMember.Text = '' then
  begin
    CommonDlg.ShowErrorEmpty('KODE MEMBER');
    edTransactionNo.SetFocus;
    Result := False;
    Exit;
  end;

  for countI := 1 to strgGrid.RowCount -1 do
  begin
    if (strgGrid.Cells[0,countI] = '')
    or (strgGrid.Cells[3,countI] = '')
    or (strgGrid.Cells[4,countI] = '') then
    begin
      CommonDlg.ShowErrorEmpty('KODE / QTY / DISC');
      strgGrid.SetFocus;
      Result := False;
      Exit;
    end;
  end;

end;

//procedure TfrmKuponBotol.saveKuponBotol();
////var arrParam: TArr;
////    countI: Integer;
////    hasil: Boolean;
//begin
////  if not Assigned(KuponBotol) then KuponBotol := TKuponBotol.Create;
////
////  hasil := False;
////  //save Kupon
////  SetLength(arrParam,4);
////  arrParam[0].tipe := ptDateTime;
////  arrParam[0].data := KuponBotol.getServerDate;
////  arrParam[1].tipe := ptInteger;
////  arrParam[1].data := MemberID;
////  arrParam[2].tipe := ptInteger;
////  arrParam[2].data := 1;
////  arrParam[3].tipe := ptInteger;
////  arrParam[3].data := FLoginId;
////  KuponBotol.InputDataKuponBotol(arrParam);
////
////  //save kupon detil
////  for countI := 1 to strgGrid.RowCount-1 do
////  begin
////    SetLength(arrParam,8);
////    arrParam[0].tipe := ptString;
////    arrParam[0].data := KuponBotol.GetLastTKBNo;
////    arrParam[1].tipe := ptString;
////    arrParam[1].data := strgGrid.cells[0,countI];
////    arrParam[2].tipe := ptString;
////    arrParam[2].data := strgGrid.cells[2,countI];
////    arrParam[3].tipe := ptInteger;
////    arrParam[3].data := strgGrid.cells[3,countI];
////    arrParam[4].tipe := ptCurrency;
////    arrParam[4].data := strgGrid.cells[5,countI];
////    arrParam[5].tipe := ptCurrency;
////    arrParam[5].data := strgGrid.cells[4,countI];
////    arrParam[6].tipe := ptCurrency;
////    arrParam[6].data := strgGrid.cells[6,countI];
////    arrParam[7].tipe := ptInteger;
////    arrParam[7].data := FLoginId;
////    hasil := KuponBotol.InputDataKuponBotolDetil(arrParam);
////  end;
////
////  if hasil then
////  begin
////    CommonDlg.ShowConfirmSuccessfull(atAdd);
////    //print
////    clearView;
////  end;
//
//end;

//procedure TfrmKuponBotol.updateKuponBotol();
////var arrParam: TArr;
////    countI: Integer;
////    hasil: Boolean;
//begin
////  hasil := False;
////
////  if (CommonDlg.Confirm('Are you sure you wish to Update Voucher Botol (Transc No.: '+ VoucherNo +')?') = mrYes) then
////  begin
////    // put your code here
////    // ...
////    if not Assigned(KuponBotol) then KuponBotol := TKuponBotol.Create;
////    // delete detilna
////    //KuponBotol.DeleteDataKuponBotolDetil(cbpTransNo.Text, KuponBotol.GetDefaultUnitId);
////
////    //save kupon detil
////    for countI := 1 to strgGrid.RowCount-1 do
////    begin
////      SetLength(arrParam,8);
////      arrParam[0].tipe := ptString;
////      arrParam[0].data := VoucherNo;
////      arrParam[1].tipe := ptString;
////      arrParam[1].data := strgGrid.cells[0,countI];
////      arrParam[2].tipe := ptString;
////      arrParam[2].data := strgGrid.cells[2,countI];
////      arrParam[3].tipe := ptInteger;
////      arrParam[3].data := strgGrid.cells[3,countI];
////      arrParam[4].tipe := ptCurrency;
////      arrParam[4].data := strgGrid.cells[5,countI];
////      arrParam[5].tipe := ptCurrency;
////      arrParam[5].data := strgGrid.cells[4,countI];
////      arrParam[6].tipe := ptCurrency;
////      arrParam[6].data := strgGrid.cells[6,countI];
////      arrParam[7].tipe := ptInteger;
////      arrParam[7].data := FLoginId;
////      hasil := KuponBotol.InputDataKuponBotolDetil(arrParam);
////    end;
////
////    if hasil then
////    begin
////      CommonDlg.ShowConfirmSuccessfull(atEdit);
////      //print
////      clearView;
////    end;
////
////  end;
//
//end;

procedure TfrmKuponBotol.FormActivate(Sender: TObject);
begin
  inherited;
  ////frmMain.CreateMenu((Sender as TForm));
end;

procedure TfrmKuponBotol.strgGridGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  inherited;
  if (ACol in [3,4,5,6,7]) then HAlign:= taRightJustify
  else HAlign:= taLeftJustify;
end;

procedure TfrmKuponBotol.actDeleteKuponBotolExecute(Sender: TObject);
//var
//  unit_id: integer;
begin
  inherited;
    //==> Blocked by AnDhaNk

  if (Trim(edTransactionNo.Text) <> '') then
  begin
    if (CommonDlg.Confirm('Are you sure you wish to delete Voucher Botol (Transc No.: '+ edTransactionNo.Text +')?') = mrYes) then
    begin
      if not FnewKuponBotol.RemoveFromDB then
      begin
        cRollbackTrans;
        CommonDlg.ShowMessage('Gagal Menghapus Data');
        clearView; 
      end
      else
      begin
        cCommitTrans;
        cclearStringGrid(strgGrid, False);
        ClearByTag(frmKuponBotol, [0]);
        CommonDlg.ShowMessage('Berhasil Menghapus Data');
      end;
    end;
  end;
//      if not Assigned(KuponBotol) then
//        KuponBotol := TKuponBotol.Create;
//      unit_id := KuponBotol.GetDefaultUnitId;
//
//      if KuponBotol.DeleteDataKuponBotol(cbpTransNo.Text,unit_id) then
//      begin
//        cbpTransNo.Text := '';
//        clearView;
//        actRefreshKuponBotolExecute(Self);
//        CommonDlg.ShowConfirmSuccessfull(atDelete);
//        dtpTanggal.SetFocus;
//        dtpTanggal.SelectAll;
//      end;
//    end;
    //===> End of block, by AndhAnk
end;

procedure TfrmKuponBotol.actAddKuponBotolExecute(Sender: TObject);
begin
  inherited;

  frmDialogKuponBotol := TfrmDialogKuponBotol.Create(Self);
  with frmDialogKuponBotol do
  begin
    FormMode := fmAdd;
    SetFormPropertyAndShowDialog(frmDialogKuponBotol);

    {if(IsProcessSuccessfull)then
    begin
      CommonDlg.ShowConfirmSuccessfull(atAdd);
//      actRefreshKuponBotolExecute(Self);
//      frmKuponBotol.dtpTanggal.SetFocus;
//      frmKuponBotol.dtpTanggal.SelectAll;
      GetLastKuponBtl;
    end;
    }
  end;

//  if not assigned(frmDialogKuponBotol) then
//    Application.CreateForm(TfrmDialogKuponBotol, frmDialogKuponBotol);
//
//  with frmDialogKuponBotol do
//  begin
//    FormMode := fmAdd;
//
//    if(IsProcessSuccessfull)then
//    begin                               
//      CommonDlg.ShowConfirmSuccessfull(atAdd);
//      actRefreshKuponBotolExecute(Self);
//      frmKuponBotol.dtpTanggal.SetFocus;
//      frmKuponBotol.dtpTanggal.SelectAll;
//    end;
////    Free;
//  end;
end;

procedure TfrmKuponBotol.actEditKuponBotolExecute(Sender: TObject);
//var
//    chKey: Char;
begin
  inherited;
//  if (edtStatus.Text = 'OPEN') then
//  begin
//      //==> Blocked by AnDhaNk
//    if (Trim(cbpTransNo.Text) <> '') then
//    begin
//      if not assigned(frmDialogKuponBotol) then
//        Application.CreateForm(TfrmDialogKuponBotol, frmDialogKuponBotol);
//
//      frmDialogKuponBotol.FormMode := fmEdit;
//      frmDialogKuponBotol.NoTransaksi:= cbpTransNo.Text;
//      frmDialogKuponBotol.MemberId:= MemberID;
//
//      if (frmDialogKuponBotol.IsProcessSuccessfull) then
//      begin
//        CommonDlg.ShowConfirmSuccessfull(atEdit);
//        actRefreshKuponBotolExecute(Self);
//        dtpTanggal.SetFocus;
//        dtpTanggal.SelectAll;
//      end;
//      frmDialogKuponBotol.Free;
//    end;
//      //===> End of block, by AndhAnk
//  end
//  else
//  begin
//    CommonDlg.ShowConfirmGlobal('Status is not OPEN. Can''t edit this transaction.');
//  end;

  if (edtStatus.Text = 'OPEN') then
  begin

    if (Trim(edTransactionNo.Text) <> '') then
    begin
      frmDialogKuponBotol := TfrmDialogKuponBotol.Create(Self);
      with frmDialogKuponBotol do
      begin
        FormMode    := fmEdit;
        NoTransaksi := edTransactionNo.Text;
        MemberId    := MemberID;
        SetFormPropertyAndShowDialog(frmDialogKuponBotol);
        GetLastKuponBtl;
        {if (IsProcessSuccessfull) then
        begin
          GetLastKuponBtl;
//          actRefreshKuponBotolExecute(Self);
//          dtpTanggal.SetFocus;
//          dtpTanggal.SelectAll;
        end;
        }
      end;


//      if not assigned(frmDialogKuponBotol) then
//        Application.CreateForm(TfrmDialogKuponBotol, frmDialogKuponBotol);
//
//      frmDialogKuponBotol.FormMode := fmEdit;
//      frmDialogKuponBotol.NoTransaksi:= edTransactionNo.Text;
//      frmDialogKuponBotol.MemberId:= MemberID;
//
////      frmDialogKuponBotol.edtMemberCodeEnter(frmDialogKuponBotol.edtMemberCode);
////      frmDialogKuponBotol.edtMemberCode.Text := edtKodeMember.Text;
////      chKey := Chr(VK_RETURN);
////      frmDialogKuponBotol.edtMemberCodeKeyPress(Sender, chKey);
//
//
//      if (frmDialogKuponBotol.IsProcessSuccessfull) then
//      begin
//        actRefreshKuponBotolExecute(Self);
//        dtpTanggal.SetFocus;
//        dtpTanggal.SelectAll;
//      end;
////      frmDialogKuponBotol.Free;
////      frmDialogKuponBotol := nil;
    end;
  end
  else
  begin
    CommonDlg.ShowConfirmGlobal('Status is not OPEN. Can''t edit this transaction.');
  end;

end;

procedure TfrmKuponBotol.actAfterPrintKuponBotolExecute(Sender: TObject);
var arrParam: TArr;
begin
  inherited;

  if not Assigned(KuponBotol) then
    KuponBotol := TKuponBotol.Create;

  SetLength(arrParam,1);
  arrParam[0].tipe := ptString;
  //arrParam[0].data := cbpTransNo.Text;
  KuponBotol.UpdateIsPrinted(arrParam);
end;

procedure TfrmKuponBotol.WM_STORE_MESSAGE_Handle(var msg: TMessage);
begin
  case msg.WParam of
    STORE_REFRESH_TRANS_BOTOL: actRefreshKuponBotolExecute(self);
  end;
end;

procedure TfrmKuponBotol.dtpTanggalKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    {  //==> Blocked by AnDhaNk
    cbpTransNo.Text := '';
    ParseDataTransaksiKuponBotolByDate(dtpTanggal.Date);
    cbpTransNo.SetFocus;
    cbpTransNo.SelectAll;
    }  //===> End of block, by AndhAnk
  end;
end;

procedure TfrmKuponBotol.ParseDataTransaksiKuponBotolByDate(
  ADate: TDateTime);
//var
////  unit_id: integer;
//  data: TResultDataSet;
begin
  {  //==> Blocked by AnDhaNk
  if not assigned(KuponBotol) then
    KuponBotol := TKuponBotol.Create;
  unit_id := KuponBotol.GetDefaultUnitId;

  // get data transaksi kupon botol berdasarkan tanggal
  data := KuponBotol.GetListTKBNoByDate(ADate,unit_id);
  if not (data.IsEmpty) then
  begin
    with cbpTransNo do
    begin
      ClearGridData;
      RowCount := data.RecordCount+2;
      ColCount := 2;
      AddRow(['id','TRANSAKSI NO.']);

      while not data.Eof do
      begin
        AddRow([data.FieldByName('TKB_NO').AsString,data.FieldByName('TKB_NO').AsString]);
        data.Next;
      end;

      FixedRows := 1;
      //ShowSpeedButton := false;
      SizeGridToData;
    end;
  end;
  }  //===> End of block, by AndhAnk
end;

procedure TfrmKuponBotol.cbpTransNoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    {  //==> Blocked by AnDhaNk
    if (Trim(cbpTransNo.Text) <> '') then
      ParseDataDetilTransaksiKuponBotol(cbpTransNo.Text);
    totalNilai := curredtTotalPrice.Value;
    }  //===> End of block, by AndhAnk
  end;
end;

procedure TfrmKuponBotol.ParseDataDetilTransaksiKuponBotol(
  ATransNo: string);
var
  i: Integer;
begin
{
  if not assigned(KuponBotol) then
    KuponBotol := TKuponBotol.Create;
  unit_id := KuponBotol.GetDefaultUnitId;
  data := KuponBotol.GetInfoHeaderTKBByNo(ATransNo, unit_id);
  if not (data.IsEmpty) then
  begin
    data.First;
    MemberID := data.fieldbyName('MEMBER_ID').AsInteger;
    edtKodeMember.Text := data.fieldbyName('MEMBER_CARD_NO').AsString;
    edtMemberName.Text := data.fieldbyName('MEMBER_NAME').AsString;
    edtStatus.Text := data.fieldbyName('TKB_STATUS').AsString;
    edtKeterangan.Text := data.fieldbyName('TKB_DESCRIPTION').AsString;
    curredtTotalPrice.Value := data.fieldByName('TKB_SELL_PRICE_DISC').AsCurrency;
    edtPOSTransNo.Text := data.fieldByName('TKB_POS_TRANS_NO').AsString;
    totalNilai := curredtTotalPrice.Value;
  end;

  data := KuponBotol.GetDataDetilTKBByNo(ATransNo, unit_id);
}


  with TKuponBotolNew.CreateWithUser(Self,FLoginId,masternewunit.id) do
//  with FnewKuponBotol do
  begin
    try
      if LoadByNO(edTransactionNo.Text,masternewunit.id) then
      begin
        edtKodeMember.Text := Member.CardNo;
        edtMemberName.Text := Member.Name;
        edtPOSTransNo.Text := Pos_Trans_No;
        edtStatus.Text := Status;
        edtKeterangan.Text := Description;
        edTransactionNoExit(edTransactionNo);
          
        curredtTotalPrice.Value := Sell_Price_Disc;
        totalNilai := curredtTotalPrice.Value;
        dtpTanggal.Date :=  Date;
        
        if (KuponBotolItems.Count > 0) then
        begin
          with strgGrid do
          begin
            RowCount := KuponBotolItems.Count + 1;
            for i := 0 to KuponBotolItems.Count - 1 do    // Iterate
            begin
              Cells[0,i+1] := KuponBotolItems[i].Barang.Kode;
              Cells[1,i+1] := KuponBotolItems[i].Barang.Alias;
              Cells[2,i+1] := KuponBotolItems[i].FSat_CODE;
              Floats[3,i+1] := KuponBotolItems[i].Qty;  //FormatFloat('#,##0', data.fieldByName('TKBD_QTY').AsCurrency);
              Floats[4,i+1] := KuponBotolItems[i].Sell_Price; //FormatFloat('#,##0', data.fieldByName('TKBD_SELL_PRICE').AsCurrency);
              Floats[5,i+1] := KuponBotolItems[i].Disc; //FormatFloat('#,##0', data.fieldByName('TKBD_DISC').AsCurrency);
              Floats[6,i+1] := KuponBotolItems[i].Sell_Price_Disc; //FormatFloat('#,##0', data.fieldByName('TKBD_SELL_PRICE_DISC').AsCurrency);
              Floats[7,i+1] := KuponBotolItems[i].Total_Sell_Price_Disc; //FormatFloat('#,##0', data.fieldByName('TKBD_TOTAL_SELL_PRICE_DISC').AsCurrency);
            end;

            AutoSize := true;
          end;
        end;
      end;          
    finally
      Free;
    end;   
  end;    // with

{
  if not (data.IsEmpty) then
  begin
    with strgGrid do
    begin
      i := 1;
      data.first;
      RowCount := data.RecordCount+1;
      while not data.Eof do
      begin
        Cells[0,i] := data.fieldByName('TKBD_BRG_CODE').AsString;
        Cells[1,i] := data.fieldByName('BRG_ALIAS').AsString;
        Cells[2,i] := data.fieldByName('TKBD_SAT_CODE').AsString;
        Cells[3,i] := FormatFloat('#,##0.00', data.fieldByName('TKBD_QTY').AsCurrency);
        Cells[4,i] := FormatFloat('#,##0.00', data.fieldByName('TKBD_SELL_PRICE').AsCurrency);
        Cells[5,i] := FormatFloat('#,##0.00', data.fieldByName('TKBD_DISC').AsCurrency);
        Cells[6,i] := FormatFloat('#,##0.00', data.fieldByName('TKBD_SELL_PRICE_DISC').AsCurrency);
        Cells[7,i] := FormatFloat('#,##0.00', data.fieldByName('TKBD_TOTAL_SELL_PRICE_DISC').AsCurrency);

        data.Next;
        i := i + 1;
      end;

      AutoSize := true;
    end;
  end;
}  
end;

procedure TfrmKuponBotol.actRefreshKuponBotolExecute(Sender: TObject);
begin
  inherited;
  {  //==> Blocked by AnDhaNk
  if (Trim(cbpTransNo.Text) <> '') then
  begin
    ParseDataDetilTransaksiKuponBotol(cbpTransNo.Text);
    dtpTanggal.SetFocus;
    dtpTanggal.SelectAll;
  end
  else
  begin
    ParseHeaderGrid;
    clearView;
    dtpTanggal.Date := now;
    ParseDataTransaksiKuponBotolByDate(dtpTanggal.Date);
    dtpTanggal.SetFocus;
    dtpTanggal.SelectAll;
  end;
  }  //===> End of block, by AndhAnk

  ParseHeaderGrid;
  if (Trim(edTransactionNo.Text) <> '') then
  begin
    ParseDataDetilTransaksiKuponBotol(edTransactionNo.Text);
    FnewKuponBotol.LoadByNO(edTransactionNo.Text, masternewunit.id);
    dtpTanggal.SetFocus;
    dtpTanggal.SelectAll;
  end;
//  else
//  begin
//    clearView;
//    dtpTanggal.Date := now;
//    ParseDataTransaksiKuponBotolByDate(dtpTanggal.Date);
//    dtpTanggal.SetFocus;
//    dtpTanggal.SelectAll;
//  end;


end;

procedure TfrmKuponBotol.cbpTransNoExit(Sender: TObject);
begin
  {  //==> Blocked by AnDhaNk
  if (Trim(cbpTransNo.Text) <> '') then
    ParseDataDetilTransaksiKuponBotol(cbpTransNo.Text);
  }  //===> End of block, by AndhAnk
end;

procedure TfrmKuponBotol.cbpTransNoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_DELETE) then
    Key := ord(VK_NONAME);
end;

procedure TfrmKuponBotol.edTransactionNoEnter(Sender: TObject);
begin
  inherited;
  with edTransactionNo do
  begin
    if Tag = 0 then
    begin
      Font.Style := [];
      Font.Color := clWindowText;      
      //Clear;
      Tag := 1;
    end;
  end;    // with
end;

procedure TfrmKuponBotol.edTransactionNoExit(Sender: TObject);
begin
  inherited;
  with edTransactionNo do
  begin
    if Trim(Text) = '' then
    begin
      Font.Style := [fsItalic];
      Font.Color := clSilver;
      Text := '[Input Voucher No.]';
      Tag := 0;
    end;
  end;    // with
end;

procedure TfrmKuponBotol.strgGridGetFloatFormat(Sender: TObject; ACol,
  ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  inherited;   
  FloatFormat := '%.3n';
  if (ACol in [3]) and (ARow > 0) then
    IsFloat := True
  else
  if (ACol in [4,5,6,7]) and (ARow > 0) then
  begin
    FloatFormat := '%.2n';
    IsFloat := True;
  end
  else
    IsFloat := False;


//  if ACol in [3,4,5,6,7] then
//  begin
//    FloatFormat := '%.n';
//  end
//  else if ACol in [0] then
//  begin
//    IsFloat := False;
//  end;
end;

procedure TfrmKuponBotol.edTransactionNoClickBtn(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
  sSQL := 'select a.tkb_no as "NO VOUCHER", a.tkb_date as "TANGGAL", '
    + 'a.tkb_qty as QTY, a.tkb_sell_price_disc as TOTAL '
    + 'from trans_kupon_botol a '
    + 'where a.tkb_date = ' + QuotD(dtpTanggal.Date);
  with cLookUp('Daftar Voucher Botol',sSQL) do
  begin
    try
      if Strings[0] <> '' then
      begin
        edTransactionNo.Text := Strings[0];
        ParseDataDetilTransaksiKuponBotol(edTransactionNo.Text);
        FnewKuponBotol.LoadByNO(edTransactionNo.Text, masternewunit.id);
      end;  
    finally
      Free;
    end;   
  end;    // with
end;

procedure TfrmKuponBotol.FormCreate(Sender: TObject);
begin
  inherited;
  FfrmDlgKuponBtl := TfrmDialogKuponBotol.Create(Self);
end;

procedure TfrmKuponBotol.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (ssCtrl in Shift) then
  begin
    if Key = Ord('P') then
    begin
      actPrintKuponBotolExecute(btn2);
    end;
  end else begin
    if Key = VK_F5 then
    begin
      if ActiveControl = edTransactionNo then
        edTransactionNoClickBtn(nil);
    end else if Key = VK_RETURN then
      if ActiveControl <> btn2 then
        SelectNext(ActiveControl,True,True);    
  end;
end;

procedure TfrmKuponBotol.GetLastKuponBtl;
var
  sTemp: string;
//	sSQL: string;
//  intUnitID: Integer;
begin
  if not Assigned(frmKuponBotol) then
    FnewKuponBotol := TKuponBotolNew.Create(Self);

//  intUnitId := masternewunit.id;
  dtpTanggal.Date:= cGetServerTime;

  sTemp := FnewKuponBotol.GetLastVoucherNo(dtpTanggal.Date,masternewunit.id);

  if sTemp <> '' then
  begin
    edTransactionNoEnter(edTransactionNo);
    edTransactionNo.Text := sTemp;
    edTransactionNo.Tag := 1;
    edTransactionNoExit(edTransactionNo);
    ParseDataDetilTransaksiKuponBotol(sTemp);
    FnewKuponBotol.LoadByNO(edTransactionNo.Text, masternewunit.id);
    strgGrid.SetFocus;

  end;
end;

procedure TfrmKuponBotol.btn2Exit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

procedure TfrmKuponBotol.btn2Enter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

end.





