unit ufrmElectricCustomer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, ExtCtrls, ActnList, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
  ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit, cxCalendar, cxLabel,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxPC, Vcl.StdCtrls, System.Actions;

type
  data_customer = record
    elcust_id: Integer;
    cust_id: Integer;
    cust_unit_id: Integer;
    cust_elec_rate_id: Integer;
    cust_elec_rate_unit_id: Integer;
  end;

  data_electric_rate = record
    elec_rate_id: Integer;
    elec_rate_unit_id: Integer;
    elec_rate_group: string;
    elec_rate_power: Double;
    elec_rate_charge: Currency;
  end;
  
  TfrmElectricCustomer = class(TfrmMasterBrowse)
    pnl1: TPanel;
    lblComboGrid: TLabel;
    edtCustName: TEdit;
    cbpCustCode: TcxExtLookupComboBox;
    actlstElectricCustomer: TActionList;
    actAddElectricCustomer: TAction;
    actEditElectricCustomer: TAction;
    actDeleteElectricCustomer: TAction;
    cxcolGridViewColumn1: TcxGridDBColumn;
    cxcolGridViewColumn2: TcxGridDBColumn;
    cxcolGridViewColumn3: TcxGridDBColumn;
    cxcolGridViewColumn4: TcxGridDBColumn;
    cxcolGridViewColumn5: TcxGridDBColumn;
    cxcolGridViewColumn6: TcxGridDBColumn;
    cxcolGridViewColumn7: TcxGridDBColumn;
    cxcolGridViewColumn8: TcxGridDBColumn;
    cxcolGridViewColumn9: TcxGridDBColumn;
    cxcolGridViewColumn10: TcxGridDBColumn;
    btnShow: TcxButton;
    btnPrint: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbpCustCodeChange(Sender: TObject);
    procedure btnShowClick(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure strgElectricCustomerCanEditCell(Sender: TObject; ARow,
      ACol: Integer; var CanEdit: Boolean);
    procedure actDeleteElectricCustomerExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure strgElectricCustomerComboChange(Sender: TObject; ACol, ARow,
      AItemIndex: Integer; ASelection: String);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
    dataCustCode: TDataSet;
//    FNewElectrical_Customer: TNewElectrical_Customer;
    isOnAdd: Boolean;
    isOnEdit: Boolean;
    procedure LoadDropDownData(ACombo: TcxExtLookupComboBox; AColsOfData: Integer);
//    procedure ParseGridElectricRateCombobox(aUnit_ID: Integer=0);
  public
    { Public declarations }
  end;

var
  frmElectricCustomer: TfrmElectricCustomer;
  is_cell_editable: Boolean;

implementation

uses uTSCommonDlg, uConstanta, DateUtils, uRetnoUnit;

const
     _KolNo : Byte = 0;
     _KolCustomer_Code : Byte = 1;
     _KolCustomer_Name : Byte = 2;
     _KolKavling : Byte = 3;
     _KolBegin_Periode : Byte = 4;
     _KolGroup : Byte = 5;
     _KolPower : Byte = 6;
     _KolCharge : Byte = 7;
     _KolLast_Periode : Byte = 8;
     _KolActive : Byte = 9;
     
var
    list_customer: array of data_customer;
    list_electric_rate: array of data_electric_rate;

{$R *.dfm}

procedure TfrmElectricCustomer.FormShow(Sender: TObject);
begin
  inherited;

//  if not Assigned(FNewElectrical_Customer) then
//    FNewElectrical_Customer := TNewElectrical_Customer.CreateWithUser(Self, FLoginId, FLoginUnitId);

  isOnAdd  := False;
  isOnEdit := False;
//  dataCustCode := GetListCustomerByUnitId(MasterNewUnit.ID);
  dataCustCode.Last;
  LoadDropDownData(cbpCustCode,dataCustCode.RecordCount);
end;

procedure TfrmElectricCustomer.LoadDropDownData(ACombo: TcxExtLookupComboBox;
  AColsOfData: Integer);
begin
  {Flush the old data}
//  ACombo.ClearGridData;

  {Make sure the allocated storage is big enough}
//  if AColsOfData < 1 then AColsOfData := 0;
////  ACombo.RowCount := AColsOfData + 2;
////  ACombo.ColCount := 3;
//
//  {Load the data}
//  if Acombo = cbpCustCode then
//  begin
////    ACombo.AddRow(['','CODE','NAME']);
////    ACombo.AddRow(['-','-','< ALL >']);
//
//    if dataCustCode.RecordCount > 0 then
//    begin
//      dataCustCode.First;
//      while not dataCustCode.Eof do
//      begin
//        try
////          ACombo.AddRow([dataCustCode.FieldByName('CUST_CODE').AsString,
////                         dataCustCode.FieldByName('CUST_CODE').AsString,
////                         dataCustCode.FieldByName('CUST_NAME').AsString]);
//        except
//        end;
//        dataCustCode.Next;
//      end; //END WHILE
//    end; //END <> NIL
//  end;

  {Now shring the grid so its just big enough for the data}
//  ACombo.SizeGridToData;
  //trik to activate acombo
//  ACombo.FixedRows := 1;
end;

procedure TfrmElectricCustomer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  Action:= caFree;
end;

procedure TfrmElectricCustomer.FormDestroy(Sender: TObject);
begin
  inherited;

//  FNewElectrical_Customer.Free;
  frmElectricCustomer:= nil;
end;

procedure TfrmElectricCustomer.FormCreate(Sender: TObject);
//var i: Integer;
begin
  inherited;

  lblHeader.Caption := 'List Electric Customer';

//  for i:= 0 to strgElectricCustomer.ColCount-1 do begin
//    strgElectricCustomer.Alignments[i,0]:= taCenter;
//  end;
  is_cell_editable:= False;
end;

procedure TfrmElectricCustomer.cbpCustCodeChange(Sender: TObject);
begin
  inherited;

//  edtCustName.Text := cbpCustCode.Cells[2, cbpCustCode.Row];
end;

procedure TfrmElectricCustomer.btnShowClick(Sender: TObject);
//var dataElectricCustomer: TDataSet;
//    i: Integer;
//    aCustCode: String;
begin
  inherited;
  {
  strgElectricCustomer.ClearNormalCells;
  strgElectricCustomer.RowCount:= 2;

  if cbpCustCode.Cells[0,cbpCustCode.Row] <> '' then begin
    if cbpCustCode.Cells[0,cbpCustCode.Row] = '-' then
    begin
      SetLength(arrParam,0);
      aCustCode := '';
    end
    else begin
      SetLength(arrParam,1);
      arrParam[0].tipe := ptString;
      arrParam[0].data := cbpCustCode.Cells[0,cbpCustCode.Row];
      aCustCode := cbpCustCode.Cells[0,cbpCustCode.Row];
    end;
    dataElectricCustomer := GetListElectricCustomerByCustomerId(aCustCode);
    dataElectricCustomer.Last;
    if not dataElectricCustomer.IsEmpty then begin
      with strgElectricCustomer do begin
        ClearNormalCells;
        is_cell_editable:= False;
        RowCount:= dataElectricCustomer.RecordCount + 1;
        AddCheckBox(_KolCustomer_Code,0,False,False);
        SetCheckBoxState(_KolCustomer_Code,0,False);
        AddCheckBox(_KolActive,0,False,False);
        dataElectricCustomer.First;
        SetLength(list_customer, dataElectricCustomer.RecordCount);
        for i:= 1 to RowCount-1 do begin
          Cells[_KolNo,i]:= IntToStr(i);
          Alignments[_KolNo,i]:= taCenter;
          AddCheckBox(_KolCustomer_Code,i,False,False);
          Cells[_KolCustomer_Code,i]:= dataElectricCustomer.FieldByName('CUST_CODE').AsString;
          Cells[_KolCustomer_Name,i]:= dataElectricCustomer.FieldByName('CUST_NAME').AsString;
          Cells[_KolKavling,i]:= dataElectricCustomer.FieldByName('ELCUST_KAVLING_CODE').AsString;
          Cells[_KolBegin_Periode,i]:= FormatDateTime('mmmm yyyy', dataElectricCustomer.FieldByName('ELCUST_DATE_BEGIN').AsDateTime);
          Cells[_KolGroup,i]:= dataElectricCustomer.FieldByName('ELECTR_GROUP').AsString;
          Cells[_KolPower,i]:= dataElectricCustomer.FieldByName('ELECTR_POWER').AsString;
          Alignments[_KolPower,i]:= taRightJustify;
          Cells[_KolCharge,i]:= FormatCurr('#,##0.##', dataElectricCustomer.FieldByName('ELECTR_COST_ABODEMEN').AsCurrency);
          Alignments[_KolCharge,i]:= taRightJustify;
          Cells[_KolLast_Periode, i] := FormatDateTime('mmmm yyyy', dataElectricCustomer.FieldByName('ELCUST_LAST_PROCESS').AsDateTime);
          if dataElectricCustomer.FieldByName('ELCUST_IS_ACTIVE').AsInteger=0 then
              AddCheckBox(_KolActive,i,False,False)
          else
              AddCheckBox(_KolActive,i,True,False);
          //Cells[_KolActive, i] := dataElectricCustomer.FieldByName('ELCUST_IS_ACTIVE').AsString;
          Alignments[_KolActive,i]:= taCenter;

          list_customer[i-1].elcust_id:= dataElectricCustomer.FieldByName('ELCUST_ID').AsInteger;
          dataElectricCustomer.Next;
        end;
        AutoSizeCol(_KolCustomer_Code);
        AutoSizeCol(_KolCustomer_Name);
      end;
    end
    else begin
      strgElectricCustomer.RemoveCheckBox(_KolCustomer_Code,0);
    end;
  end;
  }
end;

procedure TfrmElectricCustomer.actAddExecute(Sender: TObject);
//var dataAddElectricCustomer: TDataSet;
//  isSaveError: Boolean;
//    i: Integer;
//    Year, Month, Day: Word;
//    aDate_Begin: TDateTime;
begin
  inherited;

//  if Mastercompany.ID = 0 then begin
    CommonDlg.ShowError(ER_COMPANY_NOT_SPECIFIC);
    Exit;
//  end
//  else if MasterNewUnit.ID = 0 then begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
//    Exit;
//  end;
  {
  strgElectricCustomer.RemoveCheckBox(_KolCustomer_Code,0);

  if fraFooter4Button1.btnAdd.Tag = 0 then begin    //ADD New cust
    ParseGridElectricRateCombobox();

    SetLength(arrParam,0);
    dataAddElectricCustomer := GetListAddElectricCustByCustId();
    dataAddElectricCustomer.Last;
    if dataAddElectricCustomer.RecordCount > 0 then begin
      fraFooter4Button1.btnAdd.Tag := 1;
      fraFooter4Button1.btnAdd.Caption:= '&Save';
      isOnAdd := True;
      fraFooter4Button1.btnUpdate.Enabled:= False;
      fraFooter4Button1.btnDelete.Enabled:= False;
      btnShow.Enabled:= False;
      fraFooter4Button1.btnClose.Tag := 1;
      fraFooter4Button1.btnClose.Caption:= 'Abort';

      is_cell_editable:= True;
      SetLength(list_customer, dataAddElectricCustomer.RecordCount);
      with strgElectricCustomer do begin
        ClearNormalCells;
        RowCount:= dataAddElectricCustomer.RecordCount + 1;
        dataAddElectricCustomer.First;
        for i:= 1 to RowCount-1 do begin
          Cells[_KolNo,i]:= IntToStr(i);
          Alignments[_KolNo,i]:= taCenter;
          Cells[_KolCustomer_Code,i]:= dataAddElectricCustomer.FieldByName('CUST_CODE').AsString;
          Cells[_KolCustomer_Name,i]:= dataAddElectricCustomer.FieldByName('CUST_NAME').AsString;
          CellProperties[_KolKavling,i].BrushColor:= clInfoBk;
          //Cells[_KolBegin_Periode,i]:= FormatDateTime('mmmm yyyy',Now);
          CellProperties[_KolBegin_Periode,i].BrushColor:= clInfoBk;
          Cells[_KolBegin_Periode,i]:= DateToStr(StartOfTheMonth(Now));
          Cells[_KolGroup,i]:= list_electric_rate[0].elec_rate_group;
          Alignments[_KolGroup,i]:= taRightJustify;
          CellProperties[_KolGroup,i].BrushColor:= clInfoBk;
          Cells[_KolPower,i]:= FloatToStr(list_electric_rate[0].elec_rate_power);
          Alignments[_KolPower,i]:= taRightJustify;
          Cells[_KolCharge,i]:= CurrToStr(list_electric_rate[0].elec_rate_charge);
          Alignments[_KolCharge,i]:= taRightJustify;

          list_customer[i-1].cust_id:= dataAddElectricCustomer.FieldByName('CUST_ID').AsInteger;
          list_customer[i-1].cust_unit_id:= dataAddElectricCustomer.FieldByName('CUST_UNT_ID').AsInteger;
          list_customer[i-1].cust_elec_rate_id:= list_electric_rate[0].elec_rate_id;
          list_customer[i-1].cust_elec_rate_unit_id:= list_electric_rate[0].elec_rate_unit_id;
          dataAddElectricCustomer.Next;
        end;
      end;
    end
    else begin
      CommonDlg.ShowError('There''s no customer to add.');
    end;
  end
  else begin       //Save New Cust w Kavling
    fraFooter4Button1.btnAdd.Tag := 0;
    fraFooter4Button1.btnAdd.Caption:= '&Add';
    isOnAdd := False;

    fraFooter4Button1.btnUpdate.Enabled:= True;
    fraFooter4Button1.btnDelete.Enabled:= True;
    btnShow.Enabled:= True;
    fraFooter4Button1.btnClose.Tag := 0;
    fraFooter4Button1.btnClose.Caption:= 'Close';
    is_cell_editable:= False;
    with strgElectricCustomer do begin
      for i:= 1 to RowCount-1 do begin
        if Cells[_KolKavling,i] <> '' then begin
          // insert ke tabel electric_customer
          try
            DecodeDate(StrToDate(Cells[_KolBegin_Periode,i]), Year, Month, Day);
          except
            DecodeDate(Now, Year, Month, Day);  //ELCUST_DATE_BEGIN
          end;
          aDate_Begin := EncodeDate(Year, Month, 1);
          FNewElectrical_Customer.UpdateData(0, list_customer[i-1].cust_id, list_customer[i-1].cust_unit_id,
                                  StartOfTheMonth(aDate_Begin), list_customer[i-1].cust_elec_rate_id, list_customer[i-1].cust_elec_rate_unit_id,
                                  1, (Cells[_KolKavling,i]), 0, StartOfTheMonth(aDate_Begin), MasterNewUnit.ID);
          if FNewElectrical_Customer.SaveToDB then
          begin
            cCommitTrans;
          end else
          begin
            cRollbackTrans;
            CommonDlg.ShowError('Gagal Menyimpan Data'+#13#10+'Customer "' + Cells[_KolCustomer_Code, i]
                                       + ' - ' + Cells[_KolCustomer_Name, i] + '"');
          end;
        end;
      end;
    end;
    SetLength(list_customer, 0);
    btnShowClick(Self);
  end;
  }
end;

procedure TfrmElectricCustomer.strgElectricCustomerCanEditCell(
  Sender: TObject; ARow, ACol: Integer; var CanEdit: Boolean);
begin
  inherited;
  {
  if (ACol = _KolKavling) and is_cell_editable then begin
    CanEdit:= True;
  end
  else if (ACol = _KolBegin_Periode) and is_cell_editable and (fraFooter4Button1.btnUpdate.Tag = 1) then begin
    CanEdit:= True;
  end
  else if (ACol = _KolCustomer_Code) and (not is_cell_editable)
    and (strgElectricCustomer.Cells[_KolNo,ARow] <> '') then begin
    CanEdit:= True;
  end
  else if (ACol = _KolGroup) and is_cell_editable then
    CanEdit:= True
  else if (ACol = _KolCustomer_Code) and (is_cell_editable)
    and (strgElectricCustomer.Cells[_KolNo,ARow] <> '') then begin
    CanEdit:= True;
  end
  else if (ACol = _KolBegin_Periode) and is_cell_editable and (fraFooter4Button1.btnAdd.Tag = 1) then
    CanEdit:= True
  else if (ACol = _KolActive) and is_cell_editable and (fraFooter4Button1.btnUpdate.Tag = 1) then
    CanEdit:= True
  else begin
    CanEdit:= False;
  end;
  }
end;

procedure TfrmElectricCustomer.actDeleteElectricCustomerExecute(
  Sender: TObject);
//var i: Integer;
//    isChecked: Boolean;
begin
  inherited;
  if CommonDlg.Confirm('Are you sure you want to delete the selected data ?') = mrYes then begin
    {for i:= 1 to strgElectricCustomer.RowCount-1 do begin
      isChecked:= False;
      strgElectricCustomer.GetCheckBoxState(_KolCustomer_Code,i, isChecked);
      if isChecked then begin
        // delete
        if FNewElectrical_Customer.LoadByID(list_customer[i-1].elcust_id, MasterNewUnit.ID) then
        begin
          try
            if FNewElectrical_Customer.RemoveFromDB then
            begin
              cCommitTrans;
              CommonDlg.ShowMessage('Berhasil Menghapus Data');
            end else begin
              cRollbackTrans;
              CommonDlg.ShowMessage('Gagal menghapus data');
            end;
          finally
            cRollbackTrans;
          end;
        end;
      end;
    end;}
    btnShowClick(Self);
  end;
end;

procedure TfrmElectricCustomer.actEditExecute(Sender: TObject);
//var dataEditElectricCustomer: TDataSet;
//  iCustomerState: Integer;
//  isActive: Boolean;
//    i: Integer;
//    aDate_Begin, aDate_Last: TDateTime;
//    Year, Month, Day: Word;
//    aCustCode: String;
//    isCheck, isAnyUpdate, isError: Boolean;
begin
  inherited;

  {strgElectricCustomer.RemoveCheckBox(_KolCustomer_Code,0);

  if fraFooter4Button1.btnUpdate.Tag = 0 then begin   //View Editable Cust
    ParseGridElectricRateCombobox();

    if cbpCustCode.Cells[_KolNo,cbpCustCode.Row] <> '' then begin
      if cbpCustCode.Cells[_KolNo,cbpCustCode.Row] = '-' then
      begin
        SetLength(arrParam,0);
        aCustCode := '';
      end
      else begin
        SetLength(arrParam,1);
        arrParam[0].tipe := ptString;
        arrParam[0].data := cbpCustCode.Cells[_KolNo,cbpCustCode.Row];
        aCustCode := cbpCustCode.Cells[_KolNo,cbpCustCode.Row];
      end;
    end;

    dataEditElectricCustomer := GetListEditElectricCustomerByCustomerCode(aCustCode);
    dataEditElectricCustomer.Last;
    if dataEditElectricCustomer.RecordCount > 0 then begin
      fraFooter4Button1.btnUpdate.Tag := 1;
      fraFooter4Button1.btnUpdate.Caption:= '&Save';
      isOnEdit := True;

      fraFooter4Button1.btnAdd.Enabled:= False;
      fraFooter4Button1.btnDelete.Enabled:= False;
      btnShow.Enabled:= False;
      fraFooter4Button1.btnClose.Tag := 1;
      fraFooter4Button1.btnClose.Caption:= 'Abort';

      is_cell_editable:= True;
      SetLength(list_customer, dataEditElectricCustomer.RecordCount);
      with strgElectricCustomer do begin
        ClearNormalCells;
        RowCount:= dataEditElectricCustomer.RecordCount + 1;
        AddCheckBox(_KolCustomer_Code,0,False,False);
        SetCheckBoxState(_KolCustomer_Code,0,False);
        dataEditElectricCustomer.First;
        for i:= 1 to RowCount-1 do begin
          Cells[_KolNo,i]:= IntToStr(i);
          Alignments[_KolNo,i]:= taCenter;
          AddCheckBox(_KolCustomer_Code,i,False,False);
          Cells[_KolCustomer_Code,i]:= dataEditElectricCustomer.FieldByName('CUST_CODE').AsString;
          Cells[_KolCustomer_Name,i]:= dataEditElectricCustomer.FieldByName('CUST_NAME').AsString;
          CellProperties[_KolKavling,i].BrushColor:= clInfoBk;
          Cells[_KolKavling,i]:= dataEditElectricCustomer.FieldByName('ELCUST_KAVLING_CODE').AsString;
          CellProperties[_KolBegin_Periode,i].BrushColor:= clInfoBk;
          Cells[_KolBegin_Periode,i]:= dataEditElectricCustomer.FieldByName('ELCUST_DATE_BEGIN').AsString;
          Cells[_KolGroup,i]:= dataEditElectricCustomer.FieldByName('ELECTR_GROUP').AsString;
          CellProperties[_KolGroup,i].BrushColor:= clInfoBk;
          Cells[_KolPower,i]:= dataEditElectricCustomer.FieldByName('ELECTR_POWER').AsString;
          Alignments[_KolPower,i]:= taRightJustify;
          Cells[_KolCharge,i]:= FormatCurr('#,##0.##', dataEditElectricCustomer.FieldByName('ELECTR_COST_ABODEMEN').AsCurrency);
          Alignments[_KolCharge,i]:= taRightJustify;
          Cells[_KolLast_Periode, i] := FormatDateTime('mmmm yyyy', dataEditElectricCustomer.FieldByName('ELCUST_LAST_PROCESS').AsDateTime);
          if dataEditElectricCustomer.FieldByName('ELCUST_IS_ACTIVE').AsInteger=0 then
              AddCheckBox(_KolActive,i,False,False)
          else
              AddCheckBox(_KolActive,i,True,False);
          Alignments[_KolActive,i]:= taCenter;
          CellProperties[_KolActive,i].BrushColor:= clInfoBk;

          list_customer[i-1].elcust_id:= dataEditElectricCustomer.FieldByName('ELCUST_ID').AsInteger;
          list_customer[i-1].cust_id:= dataEditElectricCustomer.FieldByName('CUST_ID').AsInteger;
          list_customer[i-1].cust_unit_id:= dataEditElectricCustomer.FieldByName('CUST_UNT_ID').AsInteger;

          list_customer[i-1].cust_elec_rate_id:= dataEditElectricCustomer.FieldByName('ELECTR_ID').AsInteger;
          list_customer[i-1].cust_elec_rate_unit_id:= dataEditElectricCustomer.FieldByName('ELECTR_UNT_ID').AsInteger;
          dataEditElectricCustomer.Next;
        end;
      end;
    end
    else begin
      CommonDlg.ShowError('There''s no customer to edit.');
    end;
  end
  else begin  //SAVE after Edit
    is_cell_editable:= False;
    isAnyUpdate := False;
    isError := False;
    with strgElectricCustomer do begin
      for i:= 1 to RowCount-1 do begin
        // update tabel electric_customer
        isCheck := False;
        strgElectricCustomer.GetCheckBoxState(_KolCustomer_Code,i, isCheck);
        if isCheck then begin
            if (FNewElectrical_Customer.LoadByID(list_customer[i-1].elcust_id, MasterNewUnit.ID) ) then
            begin
                isAnyUpdate := True;
                try
                  DecodeDate(StrToDate(Cells[_KolBegin_Periode,i]), Year, Month, Day);
                except
                  DecodeDate(Now, Year, Month, Day);  //ELCUST_DATE_BEGIN
                end;
                aDate_Begin := EncodeDate(Year, Month, 1);
                if FNewElectrical_Customer.LAST_PROCESS<aDate_Begin then
                   aDate_Last := aDate_Begin
                else
                   aDate_Last := FNewElectrical_Customer.LAST_PROCESS;
                GetCheckBoxState(_KolActive,i, isActive);
                if isActive then
                   iCustomerState := 1
                else
                   iCustomerState := 0;
                FNewElectrical_Customer.UpdateData(list_customer[i-1].elcust_id, list_customer[i-1].cust_id,
                                        list_customer[i-1].cust_unit_id, aDate_Begin, list_customer[i-1].cust_elec_rate_id, list_customer[i-1].cust_elec_rate_unit_id,
                                        iCustomerState, Cells[_KolKavling,i], 0, aDate_Last, MasterNewUnit.ID );
                if FNewElectrical_Customer.SaveToDB then
                begin
                  cCommitTrans;
                end else
                begin
                  isError := True;
                  cRollbackTrans;
                  CommonDlg.ShowError('Gagal Menyimpan Data'+#13#10+'Customer "' + Cells[_KolCustomer_Code, i]
                                             + ' - ' + Cells[_KolCustomer_Name, i] + '"');
                end;
            end;
        end;
      end;
    end;
    if isAnyUpdate and not isError then
    begin
          fraFooter4Button1.btnUpdate.Tag := 0;
          fraFooter4Button1.btnUpdate.Caption:= '&Edit';
          fraFooter4Button1.btnAdd.Enabled:= True;
          isOnEdit := False;
          fraFooter4Button1.btnDelete.Enabled:= True;
          btnShow.Enabled:= True;
          fraFooter4Button1.btnClose.Tag := 0;
          fraFooter4Button1.btnClose.Caption:= 'Close';
          SetLength(list_customer, 0);
          btnShowClick(Self);
    end
    else if not isError then
    begin
         is_cell_editable:= True;
         CommonDlg.ShowMessage('Cek Box untuk Customer yang di Edit');
    end;
  end;
  }
end;

procedure TfrmElectricCustomer.strgElectricCustomerComboChange(
  Sender: TObject; ACol, ARow, AItemIndex: Integer; ASelection: String);
begin
  inherited;

//  strgElectricCustomer.Cells[_KolPower,ARow]:= FloatToStr(list_electric_rate[AItemIndex].elec_rate_power);
//  strgElectricCustomer.Cells[_KolCharge,ARow]:= CurrToStr(list_electric_rate[AItemIndex].elec_rate_charge);

  list_customer[ARow-1].cust_elec_rate_id:= list_electric_rate[AItemIndex].elec_rate_id;
  list_customer[ARow-1].cust_elec_rate_unit_id:= list_electric_rate[AItemIndex].elec_rate_unit_id;
end;

//procedure TfrmElectricCustomer.ParseGridElectricRateCombobox(aUnit_ID:
//    Integer=0);
//var
//  dataElectricRate: TDataSet;
//  j: Integer;
//begin
//  {dataElectricRate:= GetAllListElectricRate(aUnit_ID);
//  dataElectricRate.Last;
//  SetLength(list_electric_rate, dataElectricRate.RecordCount);
//  if not dataElectricRate.IsEmpty then begin
//    dataElectricRate.First;
//    strgElectricCustomer.Combobox.Clear;
//    for j:= 0 to dataElectricRate.RecordCount-1 do begin
//      list_electric_rate[j].elec_rate_id:= dataElectricRate.FieldByName('ELECTR_ID').AsInteger;
//      list_electric_rate[j].elec_rate_unit_id:= dataElectricRate.FieldByName('ELECTR_UNT_ID').AsInteger;
//      list_electric_rate[j].elec_rate_group:= dataElectricRate.FieldByName('ELECTR_GROUP').AsString;
//      list_electric_rate[j].elec_rate_power:= dataElectricRate.FieldByName('ELECTR_POWER').AsFloat;
//      list_electric_rate[j].elec_rate_charge:= dataElectricRate.FieldByName('ELECTR_COST_ABODEMEN').AsCurrency;
//
//      strgElectricCustomer.Combobox.Items.Add(dataElectricRate.FieldByName('ELECTR_GROUP').AsString);
//      dataElectricRate.Next;
//    end;
//    strgElectricCustomer.Combobox.ItemIndex:= 0;
//  end;
//  }
//end;

procedure TfrmElectricCustomer.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  inherited;
  if(Key = Ord('C')) and (ssctrl in Shift) then
  begin
    if not isOnAdd then
    actAddExecute(Self)
    else
    Exit
  end
  else if(Key = Ord('E')) and (ssctrl in Shift) then
  begin
    if not isOnEdit then
       actEditExecute(Self)
    else
    Exit
  end
  else if(Key = VK_RETURN) and (ssctrl in Shift) then
    begin
      if isOnAdd then
      actAddExecute(Self)
      else if isOnEdit then
      actEditExecute(Self)
      else
      Exit
    end
  else if(Key = VK_Delete) and (ssctrl in Shift) then   //History PO
  begin
//    if Not isOnAdd then
//    actDeleteElectricCustomerExecute(Self)
//    else if not isOnEdit then
//    actDeleteElectricCustomerExecute(Self)
//    else
//    Exit
  end
  else if(Key = VK_Escape) and (ssctrl in Shift) then   //History PO
    begin
      if isOnAdd then
      Exit
      else if isOnEdit then
      Exit
      else
      Close
    end
end;

procedure TfrmElectricCustomer.btnPrintClick(Sender: TObject);
//var
//  sSQL: string;
//  aCustCode: String;
begin
  inherited;
  {
  if cbpCustCode.Cells[0,cbpCustCode.Row] <> '' then begin
    if cbpCustCode.Cells[0,cbpCustCode.Row] = '-' then
    begin
      SetLength(arrParam,0);
      aCustCode := '';
    end
    else begin
      SetLength(arrParam,1);
      arrParam[0].tipe := ptString;
      arrParam[0].data := cbpCustCode.Cells[0,cbpCustCode.Row];
      aCustCode := cbpCustCode.Cells[0,cbpCustCode.Row];
    end;
  end;
  sSQL := GetListElectricCustomerByCustomerIdSQL(aCustCode);
  frVariables.Variable['Floginname'] := fLoginFullname;
  frVariables.Variable['Funitname']  := MasterNewUnit.Nama;
  frVariables.Variable['FCustCode']  := aCustCode;
  frVariables.Variable['FCustName']  := edtCustName.Text;

  dmReportNew.EksekusiReport('frListElectricCustomer', sSQL, '', True);
  }
end;

end.

