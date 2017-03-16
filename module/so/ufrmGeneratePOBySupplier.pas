unit ufrmGeneratePOBySupplier;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ComCtrls, JvProgressBar, ExtCtrls, Mask,
  JvToolEdit, SUIButton, ufraFooter1Button, ActnList, uWaitCursor, JclStrings;

type
  TSODetil  = array of record
    SOD_ID                  : Integer;
    SOD_UNT_ID              : Integer;
    SOD_SO_NO               : string;
    SOD_SO_UNT_ID           : Integer;
    SOD_BRGSUP_ID           : Integer;
    SOD_BRGSUP_UNT_ID       : Integer;
    SOD_QTY                 : Real;
    SOD_QTY_COMMON          : Real;
    SOD_QTY_TRADER          : Real;
    SOD_QTY_ASSGROS         : Real;
    SOD_SAT_CODE            : string;
    SOD_SAT_UNT_ID          : Integer;
    SOD_PRICE               : Currency;
    SOD_TOTAL               : Currency;
    SOD_DISC1               : Currency;
    SOD_DISC2               : Currency;
    SOD_DISC3               : Currency;
    SOD_TOTAL_TEMP          : Currency;
    SOD_TOTAL_DISC          : Currency;
    SOD_IS_ORDERED          : Byte;
    SOD_IS_BKP              : Byte;
    SOD_IS_REGULAR          : Byte;
    OP_CREATE               : Integer;
    DATE_CREATE             : TDateTime;
    OP_MODIFY               : Integer;
    DATE_MODIFY             : TDateTime;
    SOD_BRG_CODE            : string;
    SOD_BRG_UNT_ID          : Integer;
    SOD_SUP_CODE            : string;
    SOD_SUP_UNT_ID          : Integer;
    SOD_MERCHANGRUP_ID      : Integer;
    SOD_MERCHANGRUP_UNT_ID  : Integer;
    BRGSUP_SUPMG_SUB_CODE   : string;
    PJK_PPN                 : Currency;
    PJK_PPNBM               : Currency;
    SUPMG_LEAD_TIME         : Integer;
    BRG_IS_STOCK            : Byte;
  end;
  
  TfrmGeneratePOBySupplier = class(TfrmMaster)
    fraFooter1Button1: TfraFooter1Button;
    lbl3: TLabel;
    edtNoSO: TEdit;
    dtDateSO: TJvDateEdit;
    lbl4: TLabel;
    bvl1: TBevel;
    lbl1: TLabel;
    dtDatePO: TJvDateEdit;
    btnProcessPO: TsuiButton;
    pbProcess: TJvProgressBar;
    lbl2: TLabel;
    cbbMerchanGroup: TComboBox;
    lbl5: TLabel;
    cbbSupplierCode: TComboBox;
    edtSupplierName: TEdit;
    actlst1: TActionList;
    actGeneratPOBySupplier: TAction;
    pnl1: TPanel;
    lblKet: TLabel;
    btn1: TsuiButton;
    btn2: TsuiButton;
    procedure actGeneratPOBySupplierExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn1Click(Sender: TObject);
    procedure cbbSupplierCodeChange(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtNoSOChange(Sender: TObject);
    procedure edtNoSOKeyPress(Sender: TObject; var Key: Char);
    procedure cbbMerchanGroupChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    isSOFound: Boolean;
    DataSODetil: TSODetil;
    arrIdMerchangrup: array of Integer;
    arrSupName: array of string;
    FNoPO: string;
    FNoPODetil: Integer;
    procedure SearchSONo(ASONo: String);
    procedure LoadDataMerchangrup(ASONo: String);
    procedure LoadDataSuplier(ASONo: String);
    procedure LoadDataSODetil;
  public
    
  end;

var
  frmGeneratePOBySupplier: TfrmGeneratePOBySupplier;

implementation

uses uGTSUICommonDlg, uConstanta, ufrmSearchPO, ufrmSearchSO,
  ufrmDialogGeneratePO, uConn, uDataSO, uSearchSO, DB, uPurchasingOrder,
  ufrmMain;

{$R *.dfm}

procedure TfrmGeneratePOBySupplier.actGeneratPOBySupplierExecute(Sender: TObject);
var
  wCursor : IWaitCursor;
  i, j, _countToMaxPO: integer;
  Bkp: Byte;
  SupmgSubCode: string;
  ArrParam: TArr;
  DataBarangBonus: TResultDataSet;
begin
  if(isSOFound)and(cbbMerchanGroup.Text<>'')and(edtSupplierName.Text<>'')then
  try
    wCursor := TWaitCursor.Create;
    lblKet.Caption := 'processing generate PO...';

    if(not Assigned(PurchasingOrder))then
      PurchasingOrder := TPurchasingOrder.Create;
    Bkp:=2;
    SupmgSubCode:='';
    i:=0;
    j:=0;
    _countToMaxPO := INT_MAX_ROW_PO;
    pbProcess.Max:= Length(DataSODetil);
    while i <= Length(DataSODetil)-1 do
    begin
      pbProcess.Position := i+1;
      with DataSODetil[i] do
      begin
        if(BRGSUP_SUPMG_SUB_CODE <> SupmgSubCode)or
          (SOD_IS_BKP <> Bkp) or (_countToMaxPO = INT_MAX_ROW_PO) then
        begin
//          if (j < 20) then
//          begin
            FNoPO:= PurchasingOrder.NextPONo;
            _countToMaxPO := 0;

            //Input data to table PO
            SetLength(ArrParam,9);
            ArrParam[0].tipe:= ptString;
            ArrParam[0].data:= FNoPO;
            ArrParam[1].tipe:= ptDateTime;
            ArrParam[1].data:= Now + LEAD_TIME;
            ArrParam[2].tipe:= ptString;
            ArrParam[2].data:= SOD_SO_NO;
            ArrParam[3].tipe:= ptString;
            ArrParam[3].data:= BRGSUP_SUPMG_SUB_CODE;
            ArrParam[4].tipe:= ptString;
            ArrParam[4].data:= PO_DESCRIPTION_GENERATED;
            ArrParam[5].tipe:= ptInteger;
            ArrParam[5].data:= 1;
            ArrParam[6].tipe:= ptInteger;
            ArrParam[6].data:= 1;
            ArrParam[7].tipe:= ptInteger;
            ArrParam[7].data:= frmMain.LoginId;
            ArrParam[8].tipe:= ptInteger;
            ArrParam[8].data:= frmMain.LoginId;
            PurchasingOrder.InputDataPO(ArrParam);

            SupmgSubCode:= BRGSUP_SUPMG_SUB_CODE;
            Bkp:= SOD_IS_BKP;
//            Inc(j);
//          end
//          else
//          begin
//            j := 0;
//            FNoPO:= PurchasingOrder.NextPONo;
//            //Input data to table PO
//            SetLength(ArrParam,9);
//            ArrParam[0].tipe:= ptString;
//            ArrParam[0].data:= FNoPO;
//            ArrParam[1].tipe:= ptDateTime;
//            ArrParam[1].data:= Now + LEAD_TIME;
//            ArrParam[2].tipe:= ptString;
//            ArrParam[2].data:= SOD_SO_NO;
//            ArrParam[3].tipe:= ptString;
//            ArrParam[3].data:= BRGSUP_SUPMG_SUB_CODE;
//            ArrParam[4].tipe:= ptString;
//            ArrParam[4].data:= PO_DESCRIPTION_GENERATED;
//            ArrParam[5].tipe:= ptInteger;
//            ArrParam[5].data:= 1;
//            ArrParam[6].tipe:= ptInteger;
//            ArrParam[6].data:= 1;
//            ArrParam[7].tipe:= ptInteger;
//            ArrParam[7].data:= frmMain.LoginId;
//            ArrParam[8].tipe:= ptInteger;
//            ArrParam[8].data:= frmMain.LoginId;
//            PurchasingOrder.InputDataPO(ArrParam);
//
//            SupmgSubCode:= BRGSUP_SUPMG_SUB_CODE;
//            Bkp:= SOD_IS_BKP;
//          end;
        end;

        FNoPODetil:= PurchasingOrder.NextPONoDetil;
        //Input data to table PO_Detil
        SetLength(ArrParam,20);
        ArrParam[0].tipe:= ptString;
        ArrParam[0].data:= FNoPO;
        ArrParam[1].tipe:= ptInteger;
        ArrParam[1].data:= SOD_BRGSUP_ID;
        ArrParam[2].tipe:= ptCurrency;
        ArrParam[2].data:= SOD_QTY;
        ArrParam[3].tipe:= ptCurrency;
        ArrParam[3].data:= SOD_QTY_COMMON;
        ArrParam[4].tipe:= ptCurrency;
        ArrParam[4].data:= SOD_QTY_TRADER;
        ArrParam[5].tipe:= ptCurrency;
        ArrParam[5].data:= SOD_QTY_ASSGROS;
        ArrParam[6].tipe:= ptString;
        ArrParam[6].data:= SOD_SAT_CODE;
        ArrParam[7].tipe:= ptCurrency;
        ArrParam[7].data:= SOD_PRICE;
        ArrParam[8].tipe:= ptCurrency;
        ArrParam[8].data:= SOD_DISC1;
        ArrParam[9].tipe:= ptCurrency;
        ArrParam[9].data:= SOD_DISC2;
        ArrParam[10].tipe:= ptCurrency;
        ArrParam[10].data:= SOD_DISC3;
        //Cek BKP untuk menentukan pajak
        if SOD_IS_BKP=1 then
        begin
          ArrParam[11].tipe:= ptCurrency;
          ArrParam[11].data:= PJK_PPN;
          ArrParam[12].tipe:= ptCurrency;
          ArrParam[12].data:= PJK_PPNBM;
        end
        else
        begin
          ArrParam[11].tipe:= ptCurrency;
          ArrParam[11].data:= 0;
          ArrParam[12].tipe:= ptCurrency;
          ArrParam[12].data:= 0;
        end;
        ArrParam[13].tipe:= ptInteger;
        ArrParam[13].data:= BRG_IS_STOCK;
        ArrParam[14].tipe:= ptInteger;
        ArrParam[14].data:= SOD_IS_BKP;
        ArrParam[15].tipe:= ptInteger;
        ArrParam[15].data:= frmMain.LoginId;
        ArrParam[16].tipe:= ptInteger;
        ArrParam[16].data:= frmMain.LoginId;
        ArrParam[17].tipe:= ptInteger;
        ArrParam[17].data:= SOD_ID;
        ArrParam[18].tipe:= ptString;
        ArrParam[18].data:= SOD_BRG_CODE;
        ArrParam[19].tipe:= ptInteger;
        ArrParam[19].data:= FNoPODetil;
        PurchasingOrder.InputDataPODetil(ArrParam);
        PurchasingOrder.UpdateIsOrderedInSODetil(SOD_ID);
        if SOD_IS_BKP=1 then
        begin
          DataBarangBonus:= PurchasingOrder.GetBonusAturan(SOD_BRG_CODE, SOD_QTY_COMMON, SOD_QTY_COMMON, dtDatePO.Date, dtDatePO.Date);
          if not DataBarangBonus.IsEmpty then
          begin
            //Input data to table PO_Bonus
            SetLength(ArrParam,6);
            ArrParam[0].tipe:= ptInteger;
            ArrParam[0].data:= FNoPODetil;
            ArrParam[1].tipe:= ptString;
            ArrParam[1].data:= DataBarangBonus.fieldbyname('BNS_BRG_CODE_BNS').AsString;
            ArrParam[2].tipe:= ptInteger;
            ArrParam[2].data:= DataBarangBonus.fieldbyname('BNS_QTY_CS').AsInteger;
            ArrParam[3].tipe:= ptInteger;
            ArrParam[3].data:= DataBarangBonus.fieldbyname('BNS_QTY_SALES').AsInteger;
            ArrParam[4].tipe:= ptInteger;
            ArrParam[4].data:= frmMain.LoginId;
            ArrParam[5].tipe:= ptInteger;
            ArrParam[5].data:= frmMain.LoginId;
            PurchasingOrder.InputDataPOBonus(ArrParam);
          end;
        end;
      end;
      inc(i);
      Inc(_countToMaxPO);
    end;
    lblKet.Caption := 'Process generate PO successfully.';
    CommonDlg.ShowConfirmGlobal(GENERATE_PO_SUCCESSFULLY);
    btnProcessPO.Enabled := false;
    btn2.Visible := true;
  finally
    pbProcess.Position := pbProcess.Max;
  end
end;

procedure TfrmGeneratePOBySupplier.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmMain.DestroyMenu((Sender as TForm));
  Action := caFree;
end;

procedure TfrmGeneratePOBySupplier.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'GENERATE PURCHASING ORDER BY SUPPLIER';
  dtDatePO.Date := now;
  pbProcess.Position := 0;
end;

procedure TfrmGeneratePOBySupplier.FormDestroy(Sender: TObject);
begin
  inherited;
  frmGeneratePOBySupplier := nil;
end;

procedure TfrmGeneratePOBySupplier.FormKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;  
  if(Key = VK_F2) then
    btn1Click(self);    
  if(Key = VK_F5) then
    btnProcessPO.Click;
  if(Key = VK_F3) then
    btn2.Click;
end;

procedure TfrmGeneratePOBySupplier.btn1Click(Sender: TObject);
begin
  if not Assigned(frmDialogSearchSO) then
    Application.CreateForm(TfrmDialogSearchSO, frmDialogSearchSO);
  edtNoSOChange(Self);
  with frmDialogSearchSO do
  begin
    frmSuiMasterDialog.Caption := 'Search SO...';
    formMode := fmGPOBySup;
    ShowModal;
    if (IsProcessSuccessfull) then
      SearchSONo(NoSO);
  end;

  frmDialogSearchSO.Free;
end;

procedure TfrmGeneratePOBySupplier.cbbSupplierCodeChange(Sender: TObject);
begin
  edtSupplierName.Clear;
  if (cbbSupplierCode.ItemIndex >= 0) then
    edtSupplierName.Text := arrSupName[cbbSupplierCode.itemindex];
  LoadDataSODetil;
end;

procedure TfrmGeneratePOBySupplier.btn2Click(Sender: TObject);
begin
  if not assigned(frmDialogDetailGeneratePO) then
    frmDialogDetailGeneratePO := TfrmDialogDetailGeneratePO.Create(Application);
  with frmDialogDetailGeneratePO do
  begin
    edtSO_NO.Text:= Self.edtNoSO.Text;
    dtPO.Date:= Self.dtDatePO.Date;
    dtSO.Date:= Self.dtDateSO.Date;
    ShowModal;
    Free;
  end;
end;

procedure TfrmGeneratePOBySupplier.FormShow(Sender: TObject);
begin
  inherited;
  isSOFound:= False;
  edtNoSO.Clear;
  dtDatePO.Date:= Now;
end;

procedure TfrmGeneratePOBySupplier.edtNoSOChange(Sender: TObject);
begin
  inherited;
  dtDateSO.Clear;
  cbbMerchanGroup.Items.Clear;
  cbbSupplierCode.Items.Clear;
  edtSupplierName.Clear;
  isSOFound:= False;
  pbProcess.Position := 0;
  lblKet.Caption := '';
  btnProcessPO.Enabled := True;
  btn2.Visible := False;
end;

procedure TfrmGeneratePOBySupplier.LoadDataSuplier(ASONo: String);
var data: TResultDataSet;
    i: Integer;
begin
  if(not Assigned(DataSO))then
      DataSO := TDataSO.Create;
  data:= DataSO.GetSuplierInSODetilBySONo(ASONo);
  cbbSupplierCode.Items.Clear;
  if not data.IsEmpty then
  begin
    i:=0;
    SetLength(arrSupName,data.RecordCount);
    with data do
    while not Eof do
    begin
      arrSupName[i]:= fieldbyname('SUP_NAME').AsString;
      cbbSupplierCode.Items.Add(fieldbyname('SUP_CODE').AsString);
      Inc(i);
      Next;
    end;
    cbbSupplierCode.ItemIndex:=0;
    cbbSupplierCodeChange(Self);
  end;
end;

procedure TfrmGeneratePOBySupplier.LoadDataMerchangrup(ASONo: String);
var data: TResultDataSet;
    i: Integer;
begin
  if(not Assigned(DataSO))then
      DataSO := TDataSO.Create;
  data:= DataSO.GetMerchangrupInSODetilBySONo(ASONo);
  cbbMerchanGroup.Items.Clear;
  if not data.IsEmpty then
  begin
    i:=0;
    SetLength(arrIdMerchangrup,data.RecordCount);
    with data do
    while not Eof do
    begin
      arrIdMerchangrup[i]:= fieldbyname('MERCHANGRUP_ID').AsInteger;
      cbbMerchanGroup.Items.Add(fieldbyname('MERCHANGRUP_NAME').AsString);
      Inc(i);
      Next;
    end;
    cbbMerchanGroup.ItemIndex:=0;
  end;
end;

procedure TfrmGeneratePOBySupplier.LoadDataSODetil;
var tmpSODetil: TResultDataSet;
    arrParam: TArr;
    i: Integer;
begin
  if(not Assigned(DataSO))then
      DataSO := TDataSO.Create;
  SetLength(arrParam,4);
  arrParam[0].tipe:= ptString;
  arrParam[0].data:= edtNoSO.Text;
  arrParam[1].tipe:= ptString;
  arrParam[1].data:= cbbSupplierCode.Text;
  arrParam[2].tipe:= ptInteger;
  arrParam[2].data:= arrIdMerchangrup[cbbMerchanGroup.ItemIndex];
  arrParam[3].tipe := ptInteger;
  arrParam[3].data := frmMain.UnitId;
  
  tmpSODetil:= DataSO.GetSODetilBySupplier(arrParam);
  with tmpSODetil do
  if not IsEmpty then
  begin
    i:=0;
    SetLength(DataSODetil,RecordCount);
    while not Eof do
    begin
      DataSODetil[i].SOD_ID:= FieldByName('SOD_ID').AsInteger;
      DataSODetil[i].SOD_UNT_ID:= FieldByName('SOD_UNT_ID').AsInteger;
      DataSODetil[i].SOD_SO_NO:= FieldByName('SOD_SO_NO').AsString;
      DataSODetil[i].SOD_SO_UNT_ID:= FieldByName('SOD_SO_UNT_ID').AsInteger;
      DataSODetil[i].SOD_BRGSUP_ID:= FieldByName('SOD_BRGSUP_ID').AsInteger;
      DataSODetil[i].SOD_BRGSUP_UNT_ID:= FieldByName('SOD_BRGSUP_UNT_ID').AsInteger;
      DataSODetil[i].SOD_QTY:= FieldByName('SOD_QTY').AsFloat;
      DataSODetil[i].SOD_QTY_COMMON:= FieldByName('SOD_QTY_COMMON').AsFloat;
      DataSODetil[i].SOD_QTY_TRADER:= FieldByName('SOD_QTY_TRADER').AsFloat;
      DataSODetil[i].SOD_QTY_ASSGROS:= FieldByName('SOD_QTY_ASSGROS').AsFloat;
      DataSODetil[i].SOD_SAT_CODE:= FieldByName('SOD_SAT_CODE').AsString;
      DataSODetil[i].SOD_SAT_UNT_ID:= FieldByName('SOD_SAT_UNT_ID').AsInteger;
      DataSODetil[i].SOD_PRICE:= FieldByName('SOD_PRICE').AsCurrency;
      DataSODetil[i].SOD_TOTAL:= FieldByName('SOD_TOTAL').AsCurrency;
      DataSODetil[i].SOD_DISC1:= FieldByName('SOD_DISC1').AsCurrency;
      DataSODetil[i].SOD_DISC2:= FieldByName('SOD_DISC2').AsCurrency;
      DataSODetil[i].SOD_DISC3:= FieldByName('SOD_DISC3').AsCurrency;
      DataSODetil[i].SOD_TOTAL_TEMP:= FieldByName('SOD_TOTAL_TEMP').AsCurrency;
      DataSODetil[i].SOD_TOTAL_DISC:= FieldByName('SOD_TOTAL_DISC').AsCurrency;
      DataSODetil[i].SOD_IS_ORDERED:= FieldByName('SOD_IS_ORDERED').AsInteger;
      DataSODetil[i].SOD_IS_BKP:= FieldByName('SOD_IS_BKP').AsInteger;
      DataSODetil[i].SOD_IS_REGULAR:= FieldByName('SOD_IS_REGULAR').AsInteger;
      DataSODetil[i].OP_CREATE:= FieldByName('OP_CREATE').AsInteger;
      DataSODetil[i].DATE_CREATE:= FieldByName('DATE_CREATE').AsDateTime;
      DataSODetil[i].OP_MODIFY:= FieldByName('OP_MODIFY').AsInteger;
      //DataSODetil[i].DATE_MODIFY:= Fields[25].AsVariant;
      DataSODetil[i].SOD_BRG_CODE:= FieldByName('SOD_BRG_CODE').AsString;
      DataSODetil[i].SOD_BRG_UNT_ID:= FieldByName('SOD_BRG_UNT_ID').AsInteger;
      DataSODetil[i].SOD_SUP_CODE:= FieldByName('SOD_SUP_CODE').AsString;
      DataSODetil[i].SOD_SUP_UNT_ID:= FieldByName('SOD_SUP_UNT_ID').AsInteger;
      DataSODetil[i].SOD_MERCHANGRUP_ID:= FieldByName('SOD_MERCHANGRUP_ID').AsInteger;
      DataSODetil[i].SOD_MERCHANGRUP_UNT_ID:= FieldByName('SOD_MERCHANGRUP_UNT_ID').AsInteger;
      DataSODetil[i].BRGSUP_SUPMG_SUB_CODE:= FieldByName('BRGSUP_SUPMG_SUB_CODE').AsString;
      DataSODetil[i].PJK_PPN:= FieldByName('PJK_PPN').AsCurrency;
      DataSODetil[i].PJK_PPNBM:= FieldByName('PJK_PPNBM').AsCurrency;
      DataSODetil[i].SUPMG_LEAD_TIME:= FieldByName('SUPMG_LEAD_TIME').AsInteger;
      DataSODetil[i].BRG_IS_STOCK:= FieldByName('BRG_IS_STOCK').AsInteger;
      Next;
      inc(i);
    end;
  end;
end;

procedure TfrmGeneratePOBySupplier.SearchSONo(ASONo: String);
var data: TResultDataSet;
begin
  if(not Assigned(SearchSO))then
    SearchSO := TSearchSO.Create;
  data := SearchSO.GetListSOByNoForPOBySupplier(ASONo);
  if(data.RecordCount>0)then
  begin
    edtNoSO.Text:= data.FieldByName('SO_NO').AsString;
    dtDateSO.Date:= data.FieldByName('SO_DATE').AsDateTime;
    dtDatePO.Date := Now;
    isSOFound:= True;

    LoadDataMerchangrup(ASONo);
    if (cbbMerchanGroup.Text='') then Exit;

    LoadDataSuplier(ASONo);
    if (cbbSupplierCode.Text='') then Exit;

    LoadDataSODetil;
  end;
end;

procedure TfrmGeneratePOBySupplier.edtNoSOKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key=#13 then
    SearchSONo(StrPadLeft(edtNoSO.Text, 10, '0'))
  else
  if not(Key in['0'..'9',Chr(VK_BACK)]) then
    Key:=#0;
end;

procedure TfrmGeneratePOBySupplier.cbbMerchanGroupChange(Sender: TObject);
begin
  inherited;
  LoadDataSODetil;
end;

procedure TfrmGeneratePOBySupplier.FormActivate(Sender: TObject);
begin
  inherited;
  frmGeneratePOBySupplier.Caption := 'GENERATE PURCHASING ORDER BY SUPPLIER';
  frmMain.CreateMenu((Sender as TForm));
end;

end.
