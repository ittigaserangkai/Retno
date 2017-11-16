unit ufrmElectricTransaction;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, ComCtrls, ActnList,
  System.Actions, cxGridCustomTableView, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  dxCore, cxDateUtils, Vcl.Menus, cxGridTableView, cxGridDBTableView,
  ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel, cxGridLevel, cxClasses, cxGridCustomView, cxGrid, cxPC;

type
  data_customer = record
    elcust_id: Integer;
    elcust_unit_id: Integer;
  end;
  
  TfrmElectricTransaction = class(TfrmMasterBrowse)
    pnl1: TPanel;
    lblComboGrid: TLabel;
    btnShow: TcxButton;
    dtpPeriode: TDateTimePicker;
    btnPrint: TcxButton;
    cxcolNo: TcxGridDBColumn;
    cxcolCustomerCode: TcxGridDBColumn;
    cxcolCustomerName: TcxGridDBColumn;
    cxcolBegin: TcxGridDBColumn;
    cxcolEnd: TcxGridDBColumn;
    cxcolUsed: TcxGridDBColumn;
    cxcolRate: TcxGridDBColumn;
    cxcolCost: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure cxGridViewEditChanged(Sender: TcxCustomGridTableView; AItem:
        TcxCustomGridTableItem);
  private
    is_grid_editable: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmElectricTransaction: TfrmElectricTransaction;

implementation

uses uConn, uTSCommonDlg, uConstanta;

const
     _KolNo : Byte = 0;
     _KolCustomer_Code : Byte = 1;
     _KolCustomer_Name : Byte = 2;
     _KolBegin : Byte = 3;
     _KolEnd : Byte = 4;
     _KolUsed : Byte = 5;
     _KolRate_perkwh : Byte = 6;
     _KolCost : Byte = 7;

var // arrParam: TArr;
    list_customer: array of data_customer;

{$R *.dfm}

procedure TfrmElectricTransaction.FormCreate(Sender: TObject);
var i: Integer;
begin
  inherited;
  lblHeader.Caption := 'Electric Transaction';

  is_grid_editable:= False;
  dtpPeriode.Date:= Now;
end;

procedure TfrmElectricTransaction.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action:= caFree;
end;

procedure TfrmElectricTransaction.FormDestroy(Sender: TObject);
begin
  inherited;

  frmElectricTransaction:= nil;
end;

procedure TfrmElectricTransaction.actAddExecute(Sender: TObject);
var dataAddElectricTransaction: TDataSet;
  sSS: TStrings;
//  isSaveError: Boolean;
  aELEC_RATE_PER_KWH: Double;
  aELEC_COST: Double;
  aELEC_BEGIN_STAND: Double;
  aELEC_END_STAND: Double;
  aELEC_PERIOD: TDate;
  aELEC_ELCUST_ID: Integer;
  aELEC_ELCUST_UNT_ID: Integer;
    aUnitTrans: Integer;
    Year, Month, Day: Word;
    i, j: Integer;
    customer_id_temp: array of Integer;
    Cust_Id_Exist: Boolean;
    dtPeriod, dtLastProcess: TDateTime;
    sTemp : String;
begin
  inherited;

//  if Mastercompany.ID = 0 then
//  begin
//    CommonDlg.ShowError(ER_COMPANY_NOT_SPECIFIC);
//    Exit;
//  end
//  else if MasterNewUnit.ID = 0 then
//  begin
//    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
//    Exit;
//  end;

//  aELEC_RATE_PER_KWH := 900;
//  try
//      sTemp := getGlobalVar('ELECTRIC_RATE');
//      if Trim(sTemp)='' then
//      begin
//          CommonDlg.ShowError('"ELECTRIC_RATE" belum didefinisikan dalam System Parameter!'
//                          +#13#10 + 'Mengacu ke nilai default Rp.900,-');
//         sTemp := '900';
//      end;
//      aELEC_RATE_PER_KWH := StrToInt(sTemp);
//  except
//  end;


//  if fraFooter4Button1.btnAdd.Tag = 0 then begin     // ADD
//    DecodeDate(IncMonth(dtpPeriode.Date, -1), Year, Month, Day);
//    dtLastProcess := EncodeDate(Year, Month, 1);
//    DecodeDate(dtpPeriode.Date, Year, Month, Day);
//    dtPeriod      := EncodeDate(Year, Month, 1);
//    dataAddElectricTransaction:= GetListAddElectricTransaction(dtPeriod, dtLastProcess);
//
//    if not dataAddElectricTransaction.IsEmpty then begin
//      fraFooter4Button1.btnAdd.Tag     := 1;
//      fraFooter4Button1.btnAdd.Caption := '&Save';
//      btnShow.Enabled                 := False;
//      fraFooter4Button1.btnClose.Tag   := 1;
//      fraFooter4Button1.btnClose.Caption:= 'Abort';
//
//      is_grid_editable:= True;
//
//      Cust_Id_Exist:= False;
//      i:= 0;
//
//      with strgElectricTransaction do begin
//        ClearNormalCells;
//        dataAddElectricTransaction.Last;
//        SetLength(list_customer, dataAddElectricTransaction.RecordCount);
//        dataAddElectricTransaction.First;
//        while not dataAddElectricTransaction.Eof do begin
//          if Length(customer_id_temp) > 0 then begin
//            for j:= 0 to Length(customer_id_temp)-1 do begin
//              if dataAddElectricTransaction.FieldByName('ELCUST_ID').AsInteger = customer_id_temp[j] then begin
//                Cust_Id_Exist:= True;
//                Break;
//              end
//              else
//                Cust_Id_Exist:= False;
//            end;
//          end;
//
//          if not Cust_Id_Exist then begin
//            SetLength(customer_id_temp,Length(customer_id_temp) + 1);
//            customer_id_temp[Length(customer_id_temp) - 1]:= dataAddElectricTransaction.FieldByName('ELCUST_ID').AsInteger;
//          end
//          else begin
//            dataAddElectricTransaction.Next;
//            Continue;
//          end;
//
//          Inc(i);
//          RowCount:= i + 1;
//
//          Cells[_KolNo ,i]           := IntToStr(i);
//          Alignments[_KolNo ,i]      := taCenter;
//          Cells[_KolCustomer_Code ,i]:= dataAddElectricTransaction.FieldByName('CUST_CODE').AsString;
//          Cells[_KolCustomer_Name,i] := dataAddElectricTransaction.FieldByName('CUST_NAME').AsString;
//          if dataAddElectricTransaction.FieldByName('ELEC_END_STAND').AsString = '' then
//            Floats[_KolBegin ,i]:= 0
//          else
//            Floats[_KolBegin ,i]:= dataAddElectricTransaction.FieldByName('ELEC_END_STAND').AsFloat;
//
//          CellProperties[_KolEnd ,i].BrushColor:= clInfoBk;
//          Floats[_KolRate_perkwh ,i]      := aELEC_RATE_PER_KWH;
//          CellProperties[_KolRate_perkwh ,i].BrushColor:= clInfoBk;
//          list_customer[i-1].elcust_id      := dataAddElectricTransaction.FieldByName('ELCUST_ID').AsInteger;
//          list_customer[i-1].elcust_unit_id := dataAddElectricTransaction.FieldByName('ELCUST_UNT_ID').AsInteger;
//
//          Alignments[_KolBegin,i]        := taRightJustify;
//          Alignments[_KolEnd ,i]         := taRightJustify;
//          Alignments[_KolUsed ,i]        := taRightJustify;
//          Alignments[_KolRate_perkwh ,i] := taRightJustify;
//          Alignments[_KolCost ,i]        := taRightJustify;
//
//          dataAddElectricTransaction.Next;
//        end;
//      end;
//    end
//    else begin
//      CommonDlg.ShowError('Tidak ada Customer yang dapat ditambahkan lagi.');
//    end;
//  end
//  else
//  begin  // S A V E
//    //isSaveError := False;
//    with strgElectricTransaction do
//    begin
//      sTemp := '';
//      for i:= 1 to RowCount-1 do
//      begin
//        if (Trim(Cells[_KolCost ,i]) <> '') and (Trim(Cells[_KolEnd ,i]) <> '') then
//        begin
//           if (Floats[_KolEnd ,i]<Floats[_KolBegin ,i]) then
//           begin
//             sTemp := sTemp + #13#10+'Customer "' + Cells[_KolCustomer_Code, i] + ' - ' + Cells[_KolCustomer_Name, i] + '"';
//           end
//        end;
//      end;
//      if sTemp <> '' then
//      begin
//          CommonDlg.ShowError('Data Rekening akhir salah' + sTemp);
//          is_grid_editable:= True;
//          Exit;
//      End;
//      try
//        sSS := TStringList.Create;
//        try
//          for i:= 1 to RowCount-1 do
//          begin
//            if (Trim(Cells[_KolCost ,i]) <> '') and (Trim(Cells[_KolEnd ,i]) <> '') then
//            begin
//                  // insert ke tabel electric_use
//                  if MasterNewUnit.ID < 1 then
//                    aUnitTrans := 0
//                  else
//                  aUnitTrans := MasterNewUnit.ID;  //ELEC_UNT_ID
//                  aELEC_ELCUST_ID      := list_customer[i-1].elcust_id;  //ELEC_ELCUST_ID
//                  aELEC_ELCUST_UNT_ID  := list_customer[i-1].elcust_unit_id; //ELEC_ELCUST_UNT_ID
//                  DecodeDate(dtpPeriode.Date, Year, Month, Day);
//                  aELEC_PERIOD         := EncodeDate(Year, Month, 1);     //ELEC_PERIOD
//                  aELEC_BEGIN_STAND    := StrToFloat(Cells[_KolBegin ,i]); //ELEC_BEGIN_STAND
//                  aELEC_END_STAND      := StrToFloat(Cells[_KolEnd ,i]); //ELEC_END_STAND
//                  aELEC_RATE_PER_KWH   := StrToFloat(Cells[_KolRate_perkwh ,i]);  //ELEC_RATE_PER_KWH
//                  aELEC_COST           := StrToFloat(Cells[_KolCost ,i]);  //ELEC_COST
//                  FNewElectric_Use.UpdateData(aELEC_BEGIN_STAND, aELEC_COST, aELEC_ELCUST_ID,
//                                    aELEC_ELCUST_UNT_ID, aELEC_END_STAND, 0, aUnitTrans,
//                                    aELEC_PERIOD, aELEC_RATE_PER_KWH, 0, aUnitTrans);
//
//                  // update last_process on table electric_customer
//                  sSS.AddStrings(FNewElectric_Use.GenerateSQL());
//            end;
//          end;
//
//          if sSS.Count > 0 then
//          begin
//            if FNewElectric_Use.SaveToDB(sSS) then
//            begin
//              cCommitTrans;
//              CommonDlg.ShowMessage('Sukses Menyimpan Data');
////              +#13#10+'Customer "' + Cells[_KolCustomer_Code, i]
////                                         + ' - ' + Cells[_KolCustomer_Name, i] + '"');
//            end
//            else
//            begin
//              //isSaveError := True;
//              cRollbackTrans;
//              CommonDlg.ShowError('Gagal Menyimpan Data');
//            end;
//          end
//          else
//          begin
//            CommonDlg.ShowError('Cek jumlah penggunaan');
//            exit;
//          end;
//
//
//        finally
//          sSS.Free;
//        end;
//      except
//        cRollbackTrans;
//        CommonDlg.ShowError('Some Data failed save to Database.');
//      end;
//    end;
//    is_grid_editable:= False;
//    fraFooter4Button1.btnAdd.Tag     := 0;
//    fraFooter4Button1.btnAdd.Caption := '&Add';
//    btnShow.Enabled                 := True;
//    fraFooter4Button1.btnClose.Tag   := 0;
//    fraFooter4Button1.btnClose.Caption:= 'Close';
//
//    SetLength(list_customer,0);
//    actre(Self);
//  end;
end;

procedure TfrmElectricTransaction.actPrintExecute(Sender: TObject);
var
  sSQL: string;
  Year, Month, Day: Word;
begin
  inherited;
  DecodeDate(dtpPeriode.Date, Year, Month, Day);

//  sSQL := GetListElectricTransactionSQL(EncodeDate(Year, Month, 1));
//  frVariables.Variable['Floginname'] := fLoginFullname;
//  frVariables.Variable['Funitname']  := MasterNewUnit.Nama;
//  frVariables.Variable['FPeriode']   := dtpPeriode.Date;
//
//  dmReportNew.EksekusiReport('frListElectricTransaction', sSQL, '', True);
end;

procedure TfrmElectricTransaction.actRefreshExecute(Sender: TObject);
var dataElectricTransaction: TDataSet;
    Year, Month, Day: Word;
    i: Integer;
    begin_stand, end_stand: Double;
begin
  inherited;
  DecodeDate(dtpPeriode.Date, Year, Month, Day);

//  dataElectricTransaction:= GetListElectricTransaction(EncodeDate(Year, Month, 1));
//
//  strgElectricTransaction.ClearNormalCells;
//  strgElectricTransaction.RowCount:= 2;
//  if not dataElectricTransaction.IsEmpty then begin
//    with strgElectricTransaction do begin
//      is_grid_editable := False;
//      dataElectricTransaction.Last;
//      RowCount:= dataElectricTransaction.RecordCount + 1;
//      dataElectricTransaction.First;
//      for i:= 1 to RowCount-1 do begin
//        if dataElectricTransaction.FieldByName('ELEC_BEGIN_STAND').AsString = '' then
//          begin_stand := 0
//        else
//          begin_stand := dataElectricTransaction.FieldByName('ELEC_BEGIN_STAND').AsFloat;
//        if dataElectricTransaction.FieldByName('ELEC_END_STAND').AsString = '' then
//          end_stand := 0
//        else
//          end_stand := dataElectricTransaction.FieldByName('ELEC_END_STAND').AsFloat;
//        if dataElectricTransaction.FieldByName('ELEC_RATE_PER_KWH').AsString = '' then
//          Floats[_KolRate_perkwh ,i] := 0
//        else
//          Floats[_KolRate_perkwh ,i] := dataElectricTransaction.FieldByName('ELEC_RATE_PER_KWH').AsFloat;
//
//        Cells[_KolNo ,i]     := IntToStr(i);
//        Alignments[_KolNo,i] := taCenter;
//        Cells[_KolCustomer_Code ,i] := dataElectricTransaction.FieldByName('CUST_CODE').AsString;
//        Cells[_KolCustomer_Name ,i] := dataElectricTransaction.FieldByName('CUST_NAME').AsString;
//
//        Floats[_KolBegin ,i]     := begin_stand;
//        Floats[_KolEnd ,i]       := end_stand;
//        Floats[_KolUsed ,i]      := (end_stand - begin_stand);
//
//        if dataElectricTransaction.FieldByName('ELEC_COST').AsString = '' then
//          Floats[_KolCost ,i]:= 0
//        else
//          Floats[_KolCost ,i]:= dataElectricTransaction.FieldByName('ELEC_COST').AsFloat;
//
//        dataElectricTransaction.Next;
//      end;
//      AutoSizeCol(_KolCustomer_Code);
//      AutoSizeCol(_KolCustomer_Name);
//      Columns[_KolBegin].Alignment       := taRightJustify;
//      Columns[_KolEnd].Alignment         := taRightJustify;
//      Columns[_KolUsed].Alignment        := taRightJustify;
//      Columns[_KolRate_perkwh].Alignment := taRightJustify;
//      Columns[_KolCost].Alignment        := taRightJustify;
//
//    end;
//  end;
end;

procedure TfrmElectricTransaction.cxGridViewEditChanged(Sender:
    TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
begin
  inherited;

//  if ACol = _KolEnd then begin
//    if strgElectricTransaction.Cells[_KolEnd,ARow] <> '' then begin
//      if (strgElectricTransaction.Floats[_KolEnd,ARow]) >= (strgElectricTransaction.Floats[_KolBegin,ARow]) then begin
//        strgElectricTransaction.Floats[_KolUsed ,ARow] :=
//           (strgElectricTransaction.Floats[_KolEnd,ARow]
//           - strgElectricTransaction.Floats[_KolBegin ,ARow]);
//      end
//      else
//        strgElectricTransaction.Floats[_KolUsed ,ARow]:= 0;
//
//      if strgElectricTransaction.Cells[_KolRate_perkwh ,ARow] <> '' then begin
//        strgElectricTransaction.Floats[_KolCost , ARow]:=
//           (strgElectricTransaction.Floats[_KolUsed, ARow]
//           * strgElectricTransaction.Floats[_KolRate_perkwh ,ARow]);
//      end
//      else begin
//        strgElectricTransaction.Floats[_KolRate_perkwh ,ARow] := 0;
//        strgElectricTransaction.Floats[_KolCost ,ARow]        := 0;
//      end;
//    end
//    else begin
//      strgElectricTransaction.Floats[_KolUsed ,ARow] := 0;
//      strgElectricTransaction.Floats[_KolCost ,ARow] := 0;
//    end;
//  end;
//  if ACol = _KolRate_perkwh then begin
//    if strgElectricTransaction.Cells[_KolRate_perkwh ,ARow] <> '' then begin
//      if strgElectricTransaction.Cells[_KolUsed ,ARow] <> '' then begin
//        strgElectricTransaction.Floats[_KolCost ,ARow]:=
//           (strgElectricTransaction.Floats[_KolUsed, ARow]
//           * strgElectricTransaction.Floats[_KolRate_perkwh ,ARow]);
//      end
//      else
//        strgElectricTransaction.Floats[_KolCost ,ARow]:= 0;
//    end
//    else begin
//      strgElectricTransaction.Floats[_KolRate_perkwh ,ARow] := 0;
//      strgElectricTransaction.Floats[_KolCost ,ARow]        := 0;
//    end;
//  end;
end;

end.

