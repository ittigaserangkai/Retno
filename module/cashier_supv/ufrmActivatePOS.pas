unit ufrmActivatePOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, ActnList, Mask,
  System.Actions, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, ufraFooter4Button, cxButtons, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxPC, Vcl.Menus, Datasnap.DBClient, System.Generics.Collections,
  uModApp, uModSetupPOS, cxCustomData, cxFilter, cxData;

type
  TfrmActivatePOS = class(TfrmMasterBrowse)
    pnl2: TPanel;
    btnActivatePOS: TcxButton;
    lblCheckAll: TcxLabel;
    lblClearAll: TcxLabel;
    actActivatePOS: TAction;
    procedure FormCreate(Sender: TObject);
    procedure actActivatePOSExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure lblCheckAllClick(Sender: TObject);
    procedure lblClearAllClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lblCheckAllMouseEnter(Sender: TObject);
    procedure lblCheckAllMouseLeave(Sender: TObject);
    procedure lblClearAllMouseEnter(Sender: TObject);
    procedure lblClearAllMouseLeave(Sender: TObject);
  private
    FCDS: TClientDataSet;
    function GetFilterPOSCode: string;
    function IsBisaSimpan: Boolean;
    //dataActivePOS: TResultDataSet;
    procedure ParseHeaderGrid(jmlData: Integer);
    procedure ParseDataGrid();
    procedure prepareEdit();
    property CDS: TClientDataSet read FCDS write FCDS;
  public
    function IsBelumResetBB: Boolean;
    procedure RefreshData; override;
  end;

var
  frmActivatePOS: TfrmActivatePOS;

implementation

uses
  ufrmDialogActivatePOS, uTSCommonDlg, uConstanta, uAppUtils, uDBUtils, uDXUtils,
  uDMClient, uRetnoUnit;

//const
//  _ColPosCode = 1;
//  _ColCheckBox = 0;
//  _ColStatus = 5;

{$R *.dfm}

procedure TfrmActivatePOS.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption:= 'POS ACTIVATION';
end;

procedure TfrmActivatePOS.actActivatePOSExecute(Sender: TObject);
var
  lListPOS: TObjectList<TModApp>;
  lModPOS: TModSetupPOS;
begin
  inherited;
{
  if not IsValidDateKarenaEOD(masternewunit.id,dtActivate.Date,FMasterIsStore) then
    Exit;

  if not IsBisaSimpan then
    Exit;

  if IsBelumResetBB then
  begin
    CommonDlg.ShowMessage('Masih ada POS yang belum direset');
    Exit;
  end;
}
  if (CommonDlg.Confirm('Anda Yakin Akan Mengaktifkan POS (Tanggal : ' + FormatDateTime('dd/MMM/yyyy', dtAkhirFilter.Date) + ') ?') = mrYes) then
  begin
    lListPOS := TObjectList<TModApp>.Create();
    try
      CDS.First;
      while not CDS.Eof do
      begin
        if CDS.FieldByName('CHECK').AsBoolean = True then
        begin
          lModPOS := DMClient.CrudClient.Retrieve(TModSetupPOS.ClassName, CDS.FieldByName('SETUPPOS_ID').AsString) as TModSetupPOS;
          lModPOS.SETUPPOS_IS_ACTIVE := 1;
          lListPOS.Add(lModPOS);
        end;
        CDS.Next;
      end;

      if DMClient.CrudClient.SaveBatch(lListPOS) then
      begin
        FreeAndNil(lListPOS);
        TAppUtils.Information(CONF_EDIT_SUCCESSFULLY, False);
      end;
    except
      TAppUtils.Error(ER_UPDATE_FAILED);
      raise;
    end;
  end;
end;

procedure TfrmActivatePOS.FormDestroy(Sender: TObject);
begin
  inherited;
  frmActivatePOS := nil;
end;

procedure TfrmActivatePOS.ParseDataGrid;
var
//  intI: Integer;
  sSQL: string;
//  tempTransc: string;
begin
  sSQL := 'SELECT * FROM SETUPPOS'
          + ' where setuppos_date = ' + TAppUtils.QuotD(dtAwalFilter.Date)
          + '   ORDER BY SETUPPOS_TERMINAL_CODE';

  {
  with cOpenQuery(sSQL) do
  begin
    try
      Last;
      First;

      ParseHeaderGrid(RecordCount);

      if RecordCount > 0 then
      begin
        //initiate
        intI := 1;
        while not(Eof) do
        begin
          with strgGrid do
          begin
            AddCheckBox(0,intI,False,False);
            Cells[_ColPosCode,intI] := FieldByName('SETUPPOS_TERMINAL_CODE').AsString;
            Cells[2,intI] := FieldByName('SETUPPOS_NO_TRANSAKSI').AsString;
            Cells[3,intI] := FieldByName('SETUPPOS_COUNTER_NO').AsString;

            tempTransc:= StrLeft(Cells[2,intI],8) + StrPadLeft(Cells[3,intI],4,'0');
            Cells[4,intI] := tempTransc;

            if FieldByName('SETUPPOS_IS_ACTIVE').AsInteger = 1
            then Cells[5,intI] := 'ACTIVE'
            else Cells[5,intI] := 'NOT ACTIVE';
            Cells[6,intI] := FieldByName('SETUPPOS_IP').AsString;
            Cells[7,intI] := FieldByName('SETUPPOS_ID').AsString;
          end; //end with string grid

          Next;
          Inc(intI);
        end; //end while not eof
      end; // end if recordcount

      strgGrid.AutoSize := true;
      strgGrid.FixedRows := 1;
    finally
      Free;
    end;
  end;
  }
end;

procedure TfrmActivatePOS.ParseHeaderGrid(jmlData: Integer);
begin
 {
  with strgGrid do
  begin
    Clear;
    RowCount := jmlData + 1;
    ColCount := 7;
    Cells[0,0] := '';
    Cells[1,0] := 'CODE';
    Cells[2,0] := 'TRANSACTION NO.';
    Cells[3,0] := 'LAST COUNTER NO.';
    Cells[4,0] := 'LAST TRANS. NO.';
    Cells[5,0] := 'STATUS';
    Cells[6,0] := 'IP ADDRESS';

    if jmlData < 1 then
    begin
      RowCount := 2;
      AddCheckBox(0,1,False,False);
      Cells[1,1] := '';
      Cells[2,1] := '';
      Cells[3,1] := '';
      Cells[4,1] := '';
      Cells[5,1] := '';
      Cells[6,1] := '';
      Cells[7,1] := '0';
    end;

    FixedRows := 1;
    AutoSize := true;
  end;
  }
end;

procedure TfrmActivatePOS.prepareEdit();
  function CheckValidIPBlok(sData: string; var iLen: Byte): string;
  var i: Byte;
      sTmp: String;
  begin
    sTmp:= '';
    for i:=1 to Length(sData) do
    begin
      if not(sData[i] in ['0'..'9']) then
        Break
      else
      begin
        sTmp:= sTmp+sData[i];
      end;
    end;
    iLen:= i;
    Result:= sTmp;
  end;
//var
//  sTmp: String;
//  iLen,iStart: Byte;
begin
  {
  if strgGrid.Cells[5,strgGrid.Row] = 'ACTIVE' then
  begin
    CommonDlg.ShowError('POS Ini Sudah Aktif, Tidak Bisa Diedit');
    Exit;
  end;
  
  if not assigned(frmDialogActivePOS) then
    Application.CreateForm(TfrmDialogActivePOS, frmDialogActivePOS);
    
  frmDialogActivePOS.SetupPOS_ID := StrToInt(strgGrid.Cells[7,strgGrid.Row]);
  frmDialogActivePOS.dt1.Date := dtActivate.Date;
  frmDialogActivePOS.edtTerminalCode.Text := strgGrid.Cells[1,strgGrid.Row];

  if strgGrid.Cells[6,strgGrid.Row]<>'' then
  begin
    iLen:=3;
    iStart:=0;
    sTmp:= CheckValidIPBlok(StrLeft(strgGrid.Cells[6,strgGrid.Row],3),iLen);
    frmDialogActivePOS.jvpdrsPOS.AddressValues.Value1:= StrToInt(sTmp);
    iStart:= iStart+iLen+1;
    sTmp:= CheckValidIPBlok(StrMid(strgGrid.Cells[6,strgGrid.Row],iStart,3),iLen);
    frmDialogActivePOS.jvpdrsPOS.AddressValues.Value2:= StrToInt(sTmp);
    iStart:= iStart+iLen;
    sTmp:= CheckValidIPBlok(StrMid(strgGrid.Cells[6,strgGrid.Row],iStart,3),iLen);
    frmDialogActivePOS.jvpdrsPOS.AddressValues.Value3:= StrToInt(sTmp);
    iStart:= iStart+iLen;
    sTmp:= CheckValidIPBlok(StrMid(strgGrid.Cells[6,strgGrid.Row],iStart,3),iLen);
    frmDialogActivePOS.jvpdrsPOS.AddressValues.Value4:= StrToInt(sTmp);
    frmDialogActivePOS.edtCountNo.Text := strgGrid.Cells[3,strgGrid.Row];
  end;

  // set POS Status, coz if active it cant be edited
  if strgGrid.Cells[5,strgGrid.Row] = 'ACTIVE' then
      frmDialogActivePOS.SetupPOS_Status := 1
  else
      frmDialogActivePOS.SetupPOS_Status := 0;

  SetFormPropertyAndShowDialog(frmDialogActivePOS);

  if (frmDialogActivePOS.IsProcessSuccessfull) then
  begin
    actRefreshActivatePOSExecute(Self);
    CommonDlg.ShowConfirmSuccessfull(atAdd);
  end;
  frmDialogActivePOS.Free;    
  }
end;

procedure TfrmActivatePOS.actAddExecute(Sender: TObject);
begin
  inherited;
  {
  if not assigned(frmDialogActivePOS) then
    Application.CreateForm(TfrmDialogActivePOS, frmDialogActivePOS);

  frmDialogActivePOS.Caption := 'Add POS Terminal';
  frmDialogActivePOS.FormMode := fmAdd;
  frmDialogActivePOS.dt1.Date := dtAwalFilter.Date;
  SetFormPropertyAndShowDialog(frmDialogActivePOS);

  if (frmDialogActivePOS.IsProcessSuccessfull) then
  begin
    actRefreshExecute(Self);
    CommonDlg.ShowConfirmSuccessfull(atAdd);
  end;
  frmDialogActivePOS.Free;
  }
  ShowDialogForm(TfrmDialogActivePOS);
end;

procedure TfrmActivatePOS.actEditExecute(Sender: TObject);
begin
  inherited;
  {
  if strgGrid.Cells[7,strgGrid.Row] = '0' then Exit;

  if not assigned(frmDialogActivePOS) then
    Application.CreateForm(TfrmDialogActivePOS, frmDialogActivePOS);

  frmDialogActivePOS.frmSuiMasterDialog.Caption := 'Edit POS Terminal';
  frmDialogActivePOS.FormMode := fmEdit;
  prepareEdit();
  SetFormPropertyAndShowDialog(frmDialogActivePOS);

  if (frmDialogActivePOS.IsProcessSuccessfull) then
  begin
    actRefreshActivatePOSExecute(Self);
    CommonDlg.ShowConfirmSuccessfull(atEdit);
  end;
  frmDialogActivePOS.Free;
  }
  ShowDialogForm(TfrmDialogActivePOS, CDS.FieldByName('SETUPPOS_ID').AsString);
end;

procedure TfrmActivatePOS.lblCheckAllClick(Sender: TObject);
//var i: Integer;
begin
  {with strgGrid do
  begin
    for i:=0 to RowCount-1 do
    begin
      SetCheckBoxState(0,i,true);
    end;
  end;
  }

  CDS.First;
  while not CDS.Eof do
  begin
    CDS.Edit;
    CDS.FieldByName('CHECK').AsBoolean := True;
    CDS.Post;
    CDS.Next;
  end;
end;

procedure TfrmActivatePOS.lblClearAllClick(Sender: TObject);
//var i: Integer;
begin
  {with strgGrid do
  begin
    for i:=0 to RowCount-1 do
    begin
      SetCheckBoxState(0,i,False);
    end;
  end;
  }
  CDS.First;
  while not CDS.Eof do
  begin
    CDS.Edit;
    CDS.FieldByName('CHECK').AsBoolean := False;
    CDS.Post;
    CDS.Next;
  end;
end;

procedure TfrmActivatePOS.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F9 then
    actActivatePOSExecute(Self);
end;

procedure TfrmActivatePOS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
//  if (Key = VK_RETURN) and (ssctrl in Shift) then
//    actActivatePOSExecute(Sender);
end;

function TfrmActivatePOS.GetFilterPOSCode: string;
//var
//  chkStatue: Boolean;
//  intI: Integer;
begin
  Result := '';
  {
  for intI := 1 to strgGrid.RowCount - 1 do
  begin
    strgGrid.GetCheckBoxState(0,intI,chkStatue);

    if strgGrid.Cells[_colStatus,intI] <> 'ACTIVE' then
    begin
      if chkStatue then
      begin
        if Result = '' then
          Result := Quot(strgGrid.Cells[_ColPosCode,intI])
        else
          Result := Result + ',' + Quot(strgGrid.Cells[_ColPosCode,intI])  
      end;
    end;
  end;
  }
end;

function TfrmActivatePOS.IsBelumResetBB: Boolean;
var
//  sDaftarTanggal: string;
  sSQL: String;
begin
  Result := False;
  sSQL := 'SELECT distinct BB.BALANCE_SHIFT_DATE, SP.SETUPPOS_TERMINAL_CODE '
        + ' FROM SETUPPOS SP '
        + ' inner JOIN BEGINNING_BALANCE BB ON BB.BALANCE_SETUPPOS_ID = SP.SETUPPOS_ID AND BB.BALANCE_SETUPPOS_UNT_ID=SP.SETUPPOS_UNT_ID '
        + ' inner JOIN SHIFT S ON S.SHIFT_ID = BB.BALANCE_SHIFT_ID AND S.SHIFT_UNT_ID=BB.BALANCE_SHIFT_UNT_ID '
        + ' LEFT JOIN FINAL_PAYMENT FP ON FP.FINPAYMENT_BALANCE_ID = BB.BALANCE_ID AND FP.FINPAYMENT_BALANCE_UNT_ID=BB.BALANCE_UNT_ID '
        + ' LEFT JOIN AUT$USER AU ON AU.USR_ID = BB.BALANCE_USR_ID AND AU.USR_UNT_ID=BB.BALANCE_USR_UNT_ID '
        + ' where CAST(BB.BALANCE_SHIFT_DATE as Date)<'+TAppUtils.QuotD(dtAwalFilter.Date)
        + ' AND BB.BALANCE_UNT_ID = '+IntToStr(masternewunit)
//        + ' AND BB.BALANCE_STATUS = '+Quot('OPEN')
        + ' and FP.FINPAYMENT_BALANCE_ID is null'
        + ' and SP.SETUPPOS_TERMINAL_CODE in ( ' + GetFilterPOSCode + ')'
        + ' ORDER BY SP.SETUPPOS_TERMINAL_CODE, BB.BALANCE_SHIFT_DATE' ;
  {
  with cOpenQuery(sSQL) do
  begin
    try
      Last;
      First;
      if Recordcount > 0 then
      begin
        Result := True;
        sDaftarTanggal := '';
        while not Eof do
        begin
          sDaftarTanggal := sDaftarTanggal + FieldByName('BALANCE_SHIFT_DATE').AsString + #13;
          Next;
        end;
        CommonDlg.ShowMessage('Daftar Tanggal POS Belum Reset : ' + #13 + sDaftarTanggal);
      end;  

    finally
      Free;
    end
  end
  }
end;

function TfrmActivatePOS.IsBisaSimpan: Boolean;
//var
//  i: Integer;
//  iCountActive: Integer;
//  IsChecked: Boolean;
begin
  {
  Result := False;

  iCountActive := 0;
  for i := 1 to strgGrid.RowCount - 1 do
  begin
    if strgGrid.Cells[_ColStatus,i] <> 'ACTIVE' then
    begin
      strgGrid.GetCheckBoxState(_ColCheckBox,i,IsChecked);
      if IsChecked then
      begin
        Inc(iCountActive);
        Break;
      end;
    end;
  end;

  if iCountActive = 0 then
  begin
    CommonDlg.ShowError('Tidak Ada POS yang dipilih');
    Exit;
  end;
  }
  Result := True;
end;

procedure TfrmActivatePOS.lblCheckAllMouseEnter(Sender: TObject);
begin
  inherited;
  lblCheckAll.Style.TextStyle := [fsUnderline];
end;

procedure TfrmActivatePOS.lblCheckAllMouseLeave(Sender: TObject);
begin
  inherited;
  lblCheckAll.Style.TextStyle := [];
end;

procedure TfrmActivatePOS.lblClearAllMouseEnter(Sender: TObject);
begin
  inherited;
  lblClearAll.Style.TextStyle := [fsUnderline];
end;

procedure TfrmActivatePOS.lblClearAllMouseLeave(Sender: TObject);
begin
  inherited;
  lblClearAll.Style.TextStyle := [];
end;

procedure TfrmActivatePOS.RefreshData;
begin
  inherited;
  if Assigned(FCDS) then FreeAndNil(FCDS);
  FCDS := TDBUtils.DSToCDS(DMClient.DSProviderClient.SetupPOS_GetDSOverview(dtAkhirFilter.Date, TRetno.UnitStore.ID) ,Self );
  cxGridView.LoadFromCDS(CDS);
  cxGridView.SetVisibleColumns(['SETUPPOS_ID','SETUPPOS_DATE','AUT$UNIT_ID'],False);
  cxGridView.SetReadOnlyAllColumns(True);
  cxGridView.SetReadOnlyColumns(['CHECK'],False);
end;

end.


