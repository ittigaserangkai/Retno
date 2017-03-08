unit ufrmDialogAddProductForSO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ExtCtrls, StdCtrls, DateUtils, uConn,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxCheckBox, ufraFooterDialog3Button, ufrmMasterDialogBrowse,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.Menus, cxButtons;

type
  TThreadSO = class(TThread)
              private
              protected
                procedure Execute; override;
              end; { of class declaration }
  TintHari = record
                hrSenin : Byte;
                hrSelasa: Byte;
                hrRabu  : Byte;
                hrKamis : Byte;
                hrJumat : Byte;
                hrSabtu : Byte;
                hrAhad  : Byte;
             end;
  TfrmDialogAddProductForSO = class(TfrmMasterDialogBrowse)
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    cbbMerchanGroup: TComboBox;
    edtSuplier: TEdit;
    cbbSuplier: TComboBox;
    schckbxForecasting: TcxCheckBox;
    pnlSearchProduct: TPanel;
    edtProductCode: TEdit;
    Label1: TLabel;
    btnShow: TcxButton;
    cxGridViewColumn1: TcxGridDBColumn;
    cxGridViewColumn2: TcxGridDBColumn;
    cxGridViewColumn3: TcxGridDBColumn;
    cxGridViewColumn4: TcxGridDBColumn;
    cxGridViewColumn5: TcxGridDBColumn;
    cxGridViewColumn6: TcxGridDBColumn;
    cxGridViewColumn7: TcxGridDBColumn;
    cxGridViewColumn8: TcxGridDBColumn;
    cxGridViewColumn9: TcxGridDBColumn;
    cxGridViewColumn10: TcxGridDBColumn;
    cxGridViewColumn11: TcxGridDBColumn;
    cxGridViewColumn12: TcxGridDBColumn;
    cxGridViewColumn13: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure btnShowClick(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure strgGridCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure FormShow(Sender: TObject);
    procedure cbbSuplierChange(Sender: TObject);
    procedure cbbMerchanGroupChange(Sender: TObject);
    procedure cbbSuplierKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbbMerchanGroupKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtProductCodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    idMerchanGrup: array of Integer;
    sNamaSuplier: array of string;
    FIsProcessSuccessfull: boolean;
    isAdaData: Boolean;
    //intHari: Integer;
    FIsFromDialogSearch: Boolean;  
    bState: Boolean;
    FTmpBarangCode: string;
    procedure SetIsProcessSuccessfull(const Value: boolean);
    //procedure ShowDataForecasting(data: TResultDataSet);
    procedure ParseHeaderGrid;
    //function HitungJarakkeJadwalSO(hr: TintHari):Integer;
    //function PrediksiBarangTerjual(jrk:Integer):Real;
  public
    tglSO: TDateTime;
  published
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDialogAddProductForSO: TfrmDialogAddProductForSO;

implementation

uses ufrmCreateSO, ufrmSearchProduct, uRetnoUnit, uConstanta, ufrmSplash,
     uAppUtils;

{$R *.dfm}

procedure TThreadSO.Execute;
var data: TDataSet;
    i,j: integer;
    myRow: Integer;
    _code, _sup: string;
    bCodeExist: Boolean;
begin
  {with frmDialogAddProductForSO do
  try
    if not assigned(DataSO) then
      DataSO := TDataSO.Create;
    DataSO.isHari:=False;
    DataSO.IDMerchangrup:=idMerchanGrup[cbbMerchanGroup.ItemIndex-1];
    if cbbSuplier.ItemIndex=0 then
      DataSO.CodeSupplier:='All'
    else
      DataSO.CodeSupplier:=cbbSuplier.Text;

    DataSO.isForecasting:= schckbxForecasting.Checked;
    DataSO.BarangCode := FTmpBarangCode;

    if FIsFromDialogSearch then
    begin
      if schckbxForecasting.Checked then
        data := DataSO.DataSOBarangCode
      else
        data := DataSO.DataSOSupBarangCode;
    end
    else
    begin
      if schckbxForecasting.Checked then
        data := DataSO.Data
      else
        data := DataSO.DataSOSuplier;
    end;

    if FIsFromDialogSearch then // jika dia dari dialog search
    begin
      if data.IsEmpty then
      begin
        edtProductCode.SelectAll;
        Exit;
      end;

      edtProductCode.Clear;

      _code := data.fieldbyname('BRG_CODE').AsString;
      _sup := data.fieldbyname('SUP_CODE').AsString;
      for i:=1 to strgGrid.RowCount-1 do
      begin
        if (Trim(strgGrid.Cells[1,i]) = _code) and (Trim(strgGrid.Cells[6,i]) = _sup) then
          Exit;
      end;

      isAdaData := True;
      if not schckbxForecasting.Checked then
      begin
        if (strgGrid.RowCount = 2) and (Trim(strgGrid.Cells[2,1]) = '') then
          myRow := 1
        else
        begin
          myRow := strgGrid.RowCount;
          strgGrid.RowCount := strgGrid.RowCount + 1;
        end;
        strgGrid.RowColor[myRow] := clYellow;

        data.First;
        while not data.Eof do

          with strgGrid do
          begin
            cells[0,myRow] := inttostr(myRow);
            AddCheckBox(1,myRow,false,false);
            SetCheckBoxState(1,myRow,True);
            cells[1,myRow] := ' ' + data.fieldbyname('BRG_CODE').AsString;
            cells[2,myRow] := data.fieldbyname('BRG_ALIAS').AsString+ ' ' +
                              data.fieldbyname('BRG_MERK').AsString;
            cells[3,myRow] := data.fieldbyname('BRGSUP_SAT_CODE_BUY').AsString;
            cells[4,myRow] := IntToStr(data.fieldbyname('BRGT_STOCK_MIN').AsInteger);
            cells[5,myRow] := IntToStr(data.fieldbyname('BRGT_STOCK').AsInteger);
            cells[6,myRow] := data.fieldbyname('SUP_CODE').AsString;
            cells[7,myRow] := data.fieldbyname('SUP_NAME').AsString;
            cells[8,myRow] := IntToStr(data.fieldbyname('SUPMG_LEAD_TIME').AsInteger);
            cells[9,myRow] := FloatToStr(data.fieldbyname('BRGSUP_BUY_PRICE').AsFloat);
            cells[10,myRow]:= FloatToStr(data.fieldbyname('BRGSUP_DISC1').AsFloat);
            cells[11,myRow]:= FloatToStr(data.fieldbyname('BRGSUP_DISC2').AsFloat);
            cells[12,myRow]:= FloatToStr(data.fieldbyname('BRGSUP_DISC3').AsFloat);

            //Hidden Data
            cells[20,myRow] := data.fieldbyname('BRG_CODE').AsString;
            cells[21,myRow] := IntToStr(data.fieldbyname('BRGSUP_ID').AsInteger);
            cells[22,myRow] := IntToStr(data.fieldbyname('UNT_ID').AsInteger);
            cells[23,myRow] := '0'; //1 = "Regular"  0 = "Not Regular"
            cells[24,myRow] := data.fieldbyname('BRGT_COMMON_ALLOC').AsVariant;
            cells[25,myRow] := data.fieldbyname('BRGT_TRADER_ALLOC').AsVariant;
            cells[26,myRow] := data.fieldbyname('BRGT_ASSGROS_ALLOC').AsVariant;
            cells[27,myRow] := data.fieldbyname('BRGSUP_IS_BKP').AsVariant;
            cells[28,myRow] := IntToStr(data.fieldbyname('MERCHANGRUP_ID').AsInteger);

            data.Next;
            Inc(myRow);
          end;
        edtProductCode.Clear;
      end
      else // jk forecasting
      begin
        //ShowDataForecasting(data);
      end;
    end
    else // jika bukan dari form search
    begin
      if data.RecordCount=0 then
      begin
        strgGrid.RowCount := 2;
        strgGrid.Rows[1].Clear;
        strgGrid.AutoSize := True;
        Exit;
      end;
      isAdaData:=True;

      if not schckbxForecasting.Checked then
      begin
        strgGrid.RowCount := data.RecordCount+1;

        for i:=1 to strgGrid.RowCount-1 do
        begin
          with strgGrid do
          begin
            _code := data.fieldbyname('BRG_CODE').AsString;
            _sup := data.fieldbyname('SUP_CODE').AsString;
            bCodeExist := False;
            for j:=1 to RowCount-1 do
            begin
              if (Trim(strgGrid.Cells[1,j]) = _code) and (Trim(strgGrid.Cells[6,j]) = _sup) then
              begin
                bCodeExist := True;
                Break;
              end;
            end;
            if bCodeExist then
              Continue;

            cells[0,i] := inttostr(i);
            AddCheckBox(1,i,false,false);
            SetCheckBoxState(1,i,True);
            cells[1,i] := ' ' + data.fieldbyname('BRG_CODE').AsString;
            cells[2,i] := data.fieldbyname('BRG_ALIAS').AsString+
                          ' '+data.fieldbyname('BRG_MERK').AsString;
            cells[3,i] := data.fieldbyname('BRGSUP_SAT_CODE_BUY').AsString;
            cells[4,i] := IntToStr(data.fieldbyname('BRGT_STOCK_MIN').AsInteger);
            cells[5,i] := IntToStr(data.fieldbyname('BRGT_STOCK').AsInteger);
            cells[6,i] := data.fieldbyname('SUP_CODE').AsString;
            cells[7,i] := data.fieldbyname('SUP_NAME').AsString;
            cells[8,i] := IntToStr(data.fieldbyname('SUPMG_LEAD_TIME').AsInteger);
            cells[9,i] := FloatToStr(data.fieldbyname('BRGSUP_BUY_PRICE').AsFloat);
            cells[10,i]:= FloatToStr(data.fieldbyname('BRGSUP_DISC1').AsFloat);
            cells[11,i]:= FloatToStr(data.fieldbyname('BRGSUP_DISC2').AsFloat);
            cells[12,i]:= FloatToStr(data.fieldbyname('BRGSUP_DISC3').AsFloat);

            //Hidden Data
            cells[20,i] := data.fieldbyname('BRG_CODE').AsString;
            cells[21,i] := IntToStr(data.fieldbyname('BRGSUP_ID').AsInteger);
            cells[22,i] := IntToStr(data.fieldbyname('UNT_ID').AsInteger);
            cells[23,i] := '0'; //1 = "Regular"  0 = "Not Regular"
            cells[24,i] := data.fieldbyname('BRGT_COMMON_ALLOC').AsVariant;
            cells[25,i] := data.fieldbyname('BRGT_TRADER_ALLOC').AsVariant;
            cells[26,i] := data.fieldbyname('BRGT_ASSGROS_ALLOC').AsVariant;
            cells[27,i] := IntToStr(data.fieldbyname('BRGSUP_IS_BKP').AsInteger);
            cells[28,i] := IntToStr(data.fieldbyname('MERCHANGRUP_ID').AsInteger);

            data.Next;
          end;
        end;
      end
      else
      begin
        //ShowDataForecasting(data);
        if strgGrid.RowCount=1 then
        begin
          strgGrid.RowCount := 2;
          strgGrid.Rows[1].Clear;
        end;
        strgGrid.FixedRows:=1;
      end;
    end;
    strgGrid.AutoSize := True;
  finally
    frmDialogAddProductForSO.Enabled:= True;
    frmSplash.Close;
    Terminate;
  end;   }
end; { of procedure }

procedure TfrmDialogAddProductForSO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogAddProductForSO.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogAddProductForSO := nil;
end;

{function TfrmDialogAddProductForSO.PrediksiBarangTerjual(jrk:Integer):Real;
var i: Integer;
    JmlTerjual: Real;
    //tglAwal: TDateTime;
begin
  if not assigned(Trend) then
    Trend := TTrend.Create;
  //tglAwal:=tglSO-6;
  // Ambil data dari tabel sesuai tgl;
  JmlTerjual:=0;
  with Trend do
  begin
    AddData(25);
    AddData(30);
    AddData(29);
    AddData(28);
    AddData(40);
    AddData(27);
    for i:=1 to jrk do
    begin
      TrendKe:=DataCount+i;
      JmlTerjual:=JmlTerjual+TrendResult;
    end;
  end;
  Result:=JmlTerjual;
end;
}
{function TfrmDialogAddProductForSO.HitungJarakkeJadwalSO(hr: TintHari):Integer;
var i,jrk: Integer;
    isKetemu: Boolean;
function cekData(x: Integer):Boolean;
var hasil: Boolean;
begin
  hasil:=False;
  case x of
      1: if hr.hrSenin=1 then
           hasil:=True;
      2: if hr.hrSelasa=1 then
           hasil:=True;
      3: if hr.hrRabu=1 then
           hasil:=True;
      4: if hr.hrKamis=1 then
           hasil:=True;
      5: if hr.hrJumat=1 then
           hasil:=True;
      6: if hr.hrSabtu=1 then
           hasil:=True;
      7: if hr.hrAhad=1 then
           hasil:=True;
      else hasil:=False;
  end;
  Result:=hasil;
end;
begin
  intHari:=DayOfTheWeek(tglSO);
  isKetemu:=False;
  for i:=intHari+1 to 7 do
  begin
    isKetemu:= cekData(i);
    if isKetemu then
      Break;
  end;
  jrk:=i-intHari-1;
  if not isKetemu then
  begin
    for i:=1 to intHari-1 do
    begin
      isKetemu:= cekData(i);
      if isKetemu then
        Break;
    end;
    jrk:=7-intHari+i;
  end;
  Result:= jrk;
end;
}
{procedure TfrmDialogAddProductForSO.ShowDataForecasting(data: TDataSet);
var i, myRow, j:Integer;
    JrkkeJdwlSO: Integer;
    PredSisaStok: Real;
    hr: TintHari;
    _code, _sup: string;
    bCodeExist: Boolean;
begin
  if FIsFromDialogSearch then
  begin
    myRow := strgGrid.RowCount;
    strgGrid.RowCount := strgGrid.RowCount + 1;
    strgGrid.InsertRows(myRow, 1);
    strgGrid.RowColor[myRow] := clYellow;

    with hr do
    begin
      hrSenin   := data.fieldbyname('SUPMG_IS_MON').AsInteger;
      hrSelasa  := data.fieldbyname('SUPMG_IS_TUE').AsInteger;
      hrRabu    := data.fieldbyname('SUPMG_IS_WED').AsInteger;
      hrKamis   := data.fieldbyname('SUPMG_IS_THU').AsInteger;
      hrJumat   := data.fieldbyname('SUPMG_IS_FRI').AsInteger;
      hrSabtu   := data.fieldbyname('SUPMG_IS_SAT').AsInteger;
      hrAhad    := data.fieldbyname('SUPMG_IS_SUN').AsInteger;
    end;

    JrkkeJdwlSO := HitungJarakkeJadwalSO(hr);
    PredSisaStok:= data.fieldbyname('BRGT_STOCK').AsInteger - PrediksiBarangTerjual(JrkkeJdwlSO);
    if PredSisaStok < data.fieldbyname('BRGT_STOCK_MIN').AsInteger then
    begin
      strgGrid.RowCount := strgGrid.RowCount + 1;
      with strgGrid do
      begin
        _code       := data.fieldbyname('BRG_CODE').AsString;
        _sup        := data.fieldbyname('SUP_CODE').AsString;
        bCodeExist  := False;
        for j := 1 to RowCount - 1 do
        begin
          if (Trim(strgGrid.Cells[1,j]) = _code) and (Trim(strgGrid.Cells[6,j]) = _sup) then
          begin
            bCodeExist := True;
            Break;
          end;
        end;
        if bCodeExist then
          Exit;

        cells[0,i] := IntToStr(i);
        AddCheckBox(1,i,false,false);
        SetCheckBoxState(1,i,True);
        cells[1,i] := ' ' + data.fieldbyname('BRG_CODE').AsString;
        cells[2,i] := data.fieldbyname('BRG_NAME').AsString+ ' ' +
                      data.fieldbyname('BRG_MERK').AsString;
//                      ') '+data.fieldbyname('BRG_NAME').AsString;
        cells[3,i] := data.fieldbyname('BRGSUP_SAT_CODE_BUY').AsString;
        cells[4,i] := IntToStr(data.fieldbyname('BRGT_STOCK_MIN').AsInteger);
        cells[5,i] := IntToStr(data.fieldbyname('BRGT_STOCK').AsInteger);
        cells[6,i] := data.fieldbyname('SUP_CODE').AsString;
        cells[7,i] := data.fieldbyname('SUP_NAME').AsString;
        cells[8,i] := IntToStr(data.fieldbyname('SUPMG_LEAD_TIME').AsInteger);
        cells[9,i] := FloatToStr(data.fieldbyname('BRGSUP_BUY_PRICE').AsFloat);
        cells[10,i]:= FloatToStr(data.fieldbyname('BRGSUP_DISC1').AsFloat);
        cells[11,i]:= FloatToStr(data.fieldbyname('BRGSUP_DISC2').AsFloat);
        cells[12,i]:= FloatToStr(data.fieldbyname('BRGSUP_DISC3').AsFloat);

        //Hidden Data
        cells[20,i] := data.fieldbyname('BRG_CODE').AsString;
        cells[21,i] := IntToStr(data.fieldbyname('BRGSUP_ID').AsInteger);
        cells[22,i] := IntToStr(data.fieldbyname('UNT_ID').AsInteger);
        cells[23,i] := '0'; //1 = "Regular"  0 = "Not Regular"
        cells[24,i] := data.fieldbyname('BRGT_COMMON_ALLOC').AsVariant;
        cells[25,i] := data.fieldbyname('BRGT_TRADER_ALLOC').AsVariant;
        cells[26,i] := data.fieldbyname('BRGT_ASSGROS_ALLOC').AsVariant;
        cells[27,i] := data.fieldbyname('BRGSUP_IS_BKP').AsVariant;
        cells[28,i] := IntToStr(data.fieldbyname('MERCHANGRUP_ID').AsInteger);
      end;
    end;
  end
  else
  begin
    strgGrid.RowCount := 1;
    for i := 1 to data.RecordCount do
    begin
      with hr do
      begin
        hrSenin:= data.fieldbyname('SUPMG_IS_MON').AsInteger;
        hrSelasa:= data.fieldbyname('SUPMG_IS_TUE').AsInteger;
        hrRabu:= data.fieldbyname('SUPMG_IS_WED').AsInteger;
        hrKamis:= data.fieldbyname('SUPMG_IS_THU').AsInteger;
        hrJumat:= data.fieldbyname('SUPMG_IS_FRI').AsInteger;
        hrSabtu:= data.fieldbyname('SUPMG_IS_SAT').AsInteger;
        hrAhad:= data.fieldbyname('SUPMG_IS_SUN').AsInteger;
      end;
      JrkkeJdwlSO:=HitungJarakkeJadwalSO(hr);
      PredSisaStok:= data.fieldbyname('BRGT_STOCK').AsInteger-PrediksiBarangTerjual(JrkkeJdwlSO);
      if PredSisaStok<data.fieldbyname('BRGT_STOCK_MIN').AsInteger then
      begin
        strgGrid.RowCount := strgGrid.RowCount+1;
        with strgGrid do
        begin
          _code := data.fieldbyname('BRG_CODE').AsString;
          _sup := data.fieldbyname('SUP_CODE').AsString;
          bCodeExist := False;
          for j:=1 to RowCount-1 do
          begin
          if (Trim(strgGrid.Cells[1,j]) = _code) and (Trim(strgGrid.Cells[6,j]) = _sup) then
            begin
              bCodeExist := True;
              Break;
            end;
          end;
          if bCodeExist then
            Continue;

          cells[0,i] := inttostr(i);
          AddCheckBox(1,i,false,false);
          SetCheckBoxState(1,i,True);
          cells[1,i] := ' ' + data.fieldbyname('BRG_CODE').AsString;
          cells[2,i] := data.fieldbyname('BRG_NAME').AsString+
                        ' '+data.fieldbyname('BRG_MERK').AsString;
          cells[3,i] := data.fieldbyname('BRGSUP_SAT_CODE_BUY').AsString;
          cells[4,i] := IntToStr(data.fieldbyname('BRGT_STOCK_MIN').AsInteger);
          cells[5,i] := IntToStr(data.fieldbyname('BRGT_STOCK').AsInteger);
          cells[6,i] := data.fieldbyname('SUP_CODE').AsString;
          cells[7,i] := data.fieldbyname('SUP_NAME').AsString;
          cells[8,i] := IntToStr(data.fieldbyname('SUPMG_LEAD_TIME').AsInteger);
          cells[9,i] := FloatToStr(data.fieldbyname('BRGSUP_BUY_PRICE').AsFloat);
          cells[10,i]:= FloatToStr(data.fieldbyname('BRGSUP_DISC1').AsFloat);
          cells[11,i]:= FloatToStr(data.fieldbyname('BRGSUP_DISC2').AsFloat);
          cells[12,i]:= FloatToStr(data.fieldbyname('BRGSUP_DISC3').AsFloat);

          //Hidden Data
          cells[20,i] := data.fieldbyname('BRG_CODE').AsString;
          cells[21,i] := IntToStr(data.fieldbyname('BRGSUP_ID').AsInteger);
          cells[22,i] := IntToStr(data.fieldbyname('UNT_ID').AsInteger);
          cells[23,i] := '0'; //1 = "Regular"  0 = "Not Regular"
          cells[24,i] := data.fieldbyname('BRGT_COMMON_ALLOC').AsVariant;
          cells[25,i] := data.fieldbyname('BRGT_TRADER_ALLOC').AsVariant;
          cells[26,i] := data.fieldbyname('BRGT_ASSGROS_ALLOC').AsVariant;
          cells[27,i] := data.fieldbyname('BRGSUP_IS_BKP').AsVariant;
          cells[28,i] := IntToStr(data.fieldbyname('MERCHANGRUP_ID').AsInteger);
        end;
      end;
    end;
  end;
end;
}

procedure TfrmDialogAddProductForSO.btnShowClick(Sender: TObject);
begin
  isAdaData:=False;
  FIsFromDialogSearch := false;
  if cbbMerchanGroup.ItemIndex=0 then
  begin
//    strgGrid.RowCount := 2;
//    strgGrid.Rows[1].Clear;
//    strgGrid.AutoSize := True;
    Exit;
  end;

  if not assigned(frmSplash) then
    frmSplash := TfrmSplash.Create(Application);
  frmSplash.Show;
  frmDialogAddProductForSO.Enabled:= False;
  TThreadSO.Create(False);

end;

procedure TfrmDialogAddProductForSO.SetIsProcessSuccessfull(
  const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogAddProductForSO.footerDialogMasterbtnSaveClick(
  Sender: TObject);
var i,j: Integer;
    state, bCodeExist: Boolean;
    _code, _sup: string;
    _flSOComp: Real;
begin
  {for i:=1 to strgGrid.RowCount-1 do
  begin
    strgGrid.GetCheckBoxState(1,i,state);
    if state then
    begin
      with frmCreateSO.strgGrid do
      begin
        _code := Trim(strgGrid.Cells[1,i]);
        _sup := Trim(strgGrid.Cells[6,i]);
        bCodeExist := False;
        //k := RowCount;

        for j:=1 to RowCount-1 do
        begin
          if (_code = Trim(Cells[1,j])) and (_sup = Cells[12,i]) then
          begin
            bCodeExist := True;
            Break;
          end;
        end;
        if bCodeExist then
          Continue;
          
        if(not((RowCount=2)and(Cells[0,1]<>'1')))then
          AddRow;
        Cells[0,RowCount-1]:=IntToStr(RowCount-1);
        AddCheckBox(1,RowCount-1,false,false);
        SetCheckBoxState(1,RowCount-1,True);
        Cells[1,RowCount-1]:=strgGrid.Cells[1,i];
        Cells[2,RowCount-1]:=strgGrid.Cells[2,i];
        Cells[3,RowCount-1]:=strgGrid.Cells[3,i];
        Cells[4,RowCount-1]:=strgGrid.Cells[4,i];
        Cells[5,RowCount-1]:=strgGrid.Cells[5,i];
        Cells[6,RowCount-1]:='0';                  // avg sales --> ToDoNext
        Cells[8,RowCount-1]:='0';
        Cells[9,RowCount-1]:='0';
        Cells[10,RowCount-1]:='0';
        Cells[11,RowCount-1]:='0';
        Cells[12,RowCount-1]:=strgGrid.Cells[6,i];
        Cells[13,RowCount-1]:=strgGrid.Cells[7,i];
        Cells[14,RowCount-1]:=strgGrid.Cells[8,i];
        Cells[15,RowCount-1]:=strgGrid.Cells[9,i];
        Cells[16,RowCount-1]:=strgGrid.Cells[10,i];
        Cells[17,RowCount-1]:=strgGrid.Cells[11,i];
        Cells[18,RowCount-1]:=strgGrid.Cells[12,i];

        //Hidden Data
        Cells[21,RowCount-1]:= strgGrid.Cells[20,i];
        Cells[22,RowCount-1]:= strgGrid.Cells[21,i];
        Cells[23,RowCount-1]:= strgGrid.Cells[22,i];
        Cells[24,RowCount-1]:= strgGrid.Cells[23,i];
        Cells[25,RowCount-1]:= strgGrid.Cells[24,i];
        Cells[26,RowCount-1]:= strgGrid.Cells[25,i];
        Cells[27,RowCount-1]:= strgGrid.Cells[26,i];
        Cells[28,RowCount-1]:= strgGrid.Cells[27,i];
        Cells[29,RowCount-1]:= strgGrid.Cells[28,i];
        Cells[30,RowCount-1]:= '';
        _flSOComp := StrToFloat(Cells[4,i]) +     // Min Stock
                     StrToFloat(Cells[6,i]) * StrToFloat(Cells[14,i]) -  // avg_sales * lead_time
                     StrToFloat(Cells[5,i]);      // Current Stock

        if _flSOComp <= 0 then
          Cells[7,i] := '0'
        else
          Cells[7,i] := FloatToStr(_flSOComp);
        RowColor[RowCount-1]:=clSkyBlue;
      end;
    end;
  end;
  FIsProcessSuccessfull := true;
  Close;}
end;

procedure TfrmDialogAddProductForSO.strgGridCanEditCell(Sender: TObject;
  ARow, ACol: Integer; var CanEdit: Boolean);
begin
  if (ACol in [1])and(isAdaData) then
    CanEdit := true
  else
    CanEdit := false;
end;

procedure TfrmDialogAddProductForSO.FormShow(Sender: TObject);
var i,JmlData: Integer;
    data: TDataSet;
begin
  inherited;
  bState := True;
  cbbMerchanGroup.Style:=csDropDownList;
//  if not assigned(DataCombo) then
//    DataCombo := TDataCombo.Create;

  JmlData:=data.RecordCount;
  cbbMerchanGroup.Items.Clear;
  cbbMerchanGroup.Items.Add('Pilih...');
  SetLength(idMerchanGrup,JmlData);
  for i:=1 to JmlData do
  begin
    cbbMerchanGroup.Items.Add(data.Fields[0].AsVariant);
    idMerchanGrup[i-1]:=data.Fields[1].AsVariant;
    data.Next;
  end;
  cbbMerchanGroup.ItemIndex:=frmCreateSO.cbbMerchanGroup.ItemIndex;
  JmlData:=data.RecordCount;
  cbbSuplier.Items.Clear;
  cbbSuplier.Items.Add('All Supplier');
  SetLength(sNamaSuplier,JmlData);
  for i:=1 to JmlData do
  begin
    cbbSuplier.Items.Add(data.Fields[0].AsVariant);
    sNamaSuplier[i-1]:=data.Fields[1].AsVariant;
    data.Next;
  end;
  cbbSuplier.ItemIndex:=0;
  cbbSuplierChange(Self);
  ParseHeaderGrid;
end;

procedure TfrmDialogAddProductForSO.cbbSuplierChange(Sender: TObject);
begin
  inherited;
  if cbbSuplier.ItemIndex=0 then
    edtSuplier.Clear
  else
  begin
    if cbbSuplier.ItemIndex > -1 then
      edtSuplier.Text:=sNamaSuplier[cbbSuplier.itemindex-1];
  end;
//  strgGrid.RowCount := 2;
//  strgGrid.Rows[1].Clear;
end;

procedure TfrmDialogAddProductForSO.cbbMerchanGroupChange(Sender: TObject);
begin
  inherited;
//  strgGrid.RowCount := 2;
//  strgGrid.Rows[1].Clear;

  // Pilih PLU berdasarkan merchandise grup
end;

procedure TfrmDialogAddProductForSO.cbbSuplierKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    btnShow.Click
  else if Key = VK_TAB then
    edtProductCode.SetFocus;
end;

procedure TfrmDialogAddProductForSO.FormKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  i: Integer;
  //bs: Boolean;
begin
  inherited;
  //bs := True;
  if ((Key = Ord('x')) or (Key = Ord('X'))) and (ssCtrl in Shift) then
  begin
    bState := not bState;
//    for i:=1 to strgGrid.RowCount-1 do
//      strgGrid.SetCheckBoxState(1, i, bState);
  end;


  if Key = VK_F5 then
  begin
    if cbbMerchanGroup.ItemIndex = 0 then
      Exit;

    if not Assigned(frmDialogSearchProduct) then
      frmDialogSearchProduct := TfrmDialogSearchProduct.Create(Self);

    frmDialogSearchProduct.DialogUnit := DialogUnit;  
    frmDialogSearchProduct.ShowModal;

    FTmpBarangCode := frmDialogSearchProduct.ProductCode;

    isAdaData:=False;
    FIsFromDialogSearch := True;
    if cbbMerchanGroup.ItemIndex = 0 then
    begin
//      strgGrid.RowCount := 2;
//      strgGrid.Rows[1].Clear;
//      strgGrid.AutoSize := True;
      Exit;
    end;

    if not assigned(frmSplash) then
      frmSplash := TfrmSplash.Create(Application);
    frmSplash.Show;
    frmDialogAddProductForSO.Enabled:= False;
    TThreadSO.Create(False);
  end;
end;

procedure TfrmDialogAddProductForSO.cbbMerchanGroupKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    cbbSuplier.SetFocus;
end;

procedure TfrmDialogAddProductForSO.edtProductCodeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_TAB) and (ssShift in Shift) then
    cbbSuplier.SetFocus
  else
  if Key = VK_RETURN then
  begin
    if cbbMerchanGroup.ItemIndex = 0 then
      Exit;

    FTmpBarangCode := TAppUtils.StrPadLeft(edtProductCode.Text, igProd_Code_Length, '0');

    isAdaData:=False;
    FIsFromDialogSearch := True;
//    if cbbMerchanGroup.ItemIndex = 0 then
//    begin
//      strgGrid.RowCount := 2;
//      strgGrid.Rows[1].Clear;
//      strgGrid.AutoSize := True;
//      Exit;
//    end;
//
    if not assigned(frmSplash) then
      frmSplash := TfrmSplash.Create(Application);
    frmSplash.Show;
    frmDialogAddProductForSO.Enabled:= False;
    TThreadSO.Create(False);
  end;

end;

procedure TfrmDialogAddProductForSO.ParseHeaderGrid;
begin
  {with strgGrid do
  begin
    Clear;
    RowCount := 2;
    ColCount := 13;
    FixedRows := 1;
    Cells[0,0] := 'No.';
    Cells[1,0] := 'PLU';
    Cells[2,0] := 'Product Branch Name';
    Cells[3,0] := 'UOM';
    Cells[4,0] := 'Stock'+ #13 +'Min.';
    Cells[5,0] := 'Current'+ #13 +'Stock';
    Cells[6,0] := 'Supplier'+ #13 +'Primer';
    Cells[7,0] := 'Supplier'+ #13 +'Name';
    Cells[8,0] := 'Lead'+ #13 +'Time';
    Cells[9,0] := 'Harga'+ #13 +'Beli';
    Cells[10,0] := 'Disc 1'+ #13 +'(%)';
    Cells[11,0] := 'Disc 2'+ #13 +'(%)';
    Cells[12,0] := 'Disc 3'+ #13 +'(Rp.)';
    RowHeights[0] := 34;
    AutoSize := True;;
  end; }
end;

end.



