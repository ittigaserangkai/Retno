unit ufrmDialogInputProductForNotSO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialogBrowse, ExtCtrls, StdCtrls,
  uTSCommonDlg, System.Actions, Vcl.ActnList, ufraFooterDialog3Button,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, cxLabel, cxTextEdit, cxMaskEdit, cxButtonEdit,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid;

type
  TThreadSO = class(TThread)
              private
              protected
                procedure Execute; override;
              end; { of class declaration }
  TFormMode = (fmAdd, fmEdit);
  TfrmDialogInputProductForNotSO = class(TfrmMasterDialogBrowse)
    pnlTop: TPanel;
    lbl1: TLabel;
    edtName: TEdit;
    edtCode: TEdit;
    lblTambah: TcxLabel;
    edtKode: TcxButtonEdit;
    lblHapus: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure cbpCodeChange(Sender: TObject);
    procedure strgGridComboChange(Sender: TObject; ACol, ARow,
      AItemIndex: Integer; ASelection: String);
    procedure cbpCodeKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure lblTambahClick(Sender: TObject);
    procedure cbpCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbpCodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbpCodeCloseUp(Sender: TObject);
    procedure cbpCodeExit(Sender: TObject);
    procedure edtKodeClickBtn(Sender: TObject);
    procedure lbl2Click(Sender: TObject);
    procedure lblHapusClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridCellValidate(Sender: TObject; ACol, ARow: Integer;
      var Value: String; var Valid: Boolean);
    procedure btnDeleteClick(Sender: TObject);
  private
    FIsProcessSuccessfull: boolean;
    FSuplierCode: string;
//    iIDUnt: Integer;
    dtProduk: array of record
                id: Integer;
                code: string;
                name: string;
              end;
    FFormMode: TFormMode;
    isCodeChange: Boolean;
    procedure SetFormMode(const Value: TFormMode);
    procedure SetSuplierCode(const Value: string);
    procedure prepareAddData;
    function SaveData: boolean;
    function UpdateData: boolean;
    procedure SetIsProcessSuccessfull(const Value: boolean);
  public
    function IsAdaDataDouble: Boolean;
    procedure LoadDataBarang;
  published
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
    property SuplierCode: string read FSuplierCode write SetSuplierCode;
  end;

var
  frmDialogInputProductForNotSO: TfrmDialogInputProductForNotSO;

implementation

uses ufrmInputProductForNotSO, ufrmSplash, ufrmInputSupplierForNotSO;

{$R *.dfm}

procedure TfrmDialogInputProductForNotSO.SetFormMode(const Value: TFormMode);
begin
  FFormMode := Value;
end;

procedure TfrmDialogInputProductForNotSO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmDialogInputProductForNotSO := nil;
end;

procedure TfrmDialogInputProductForNotSO.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogInputProductForNotSO := nil;
end;

function TfrmDialogInputProductForNotSO.SaveData: boolean;
var i:Integer;
  SS: TStrings;
  sSQL: string;
  aID: Integer;
begin
  Result := False;
  {
  SS := TStringList.Create;
  try
    for i := 1 to strgGrid.RowCount - 1 do
    begin
      if strgGrid.Cells[0,i] <> '' then
      begin
        aID := cGetNextID('GEN_SO_BARANG_BLACKLIST_ID');

        sSQL := 'insert into SO_BARANG_BLACKLIST'
                + '(SOBB_ID'
                + ',SOBB_UNT_ID'
                + ',SOBB_BRGSUP_ID'
                + ') values ( '
                + IntToStr(aID) + ', '
                + IntToStr(dialogunit) + ', '
                + QuotedStr(strgGrid.Cells[2,i])
                + ' );';

        SS.Add(sSQL);
      end;
    end;

    if kExecuteSQLs(1,SS) then
      Result := SimpanBlob(SS, 1);
  finally
    SS.Free
  end;

  }
end;

function TfrmDialogInputProductForNotSO.UpdateData: boolean;
var
  aID: Integer;
  i: Integer;
  sSQL: string;

begin
  {
  for i := 1 to strgGrid.RowCount - 1 do
  begin
    if strgGrid.Cells[3,i] <> '' then
    begin
      sSQL := 'Update SO_BARANG_BLACKLIST set '
              + ' SOBB_BRGSUP_ID = ' + QuotedStr(strgGrid.Cells[2,i]) + ', '
              + ' where SOBB_ID = ' + QuotedStr(strgGrid.Cells[3,i])
              + ';';
    end
    else begin
      aID := cGetNextID('GEN_SO_BARANG_BLACKLIST_ID');

       sSQL := 'insert into SO_BARANG_BLACKLIST'
              + '(SOBB_ID'
              + ',SOBB_UNT_ID'
              + ',SOBB_BRGSUP_ID'
              + '0 values ( '
              + IntToStr(aID) + ', '
              + IntToStr(dialogunit) + ', '
              + QuotedStr(strgGrid.Cells[2,i])
              + ' );';
    end;

    try
      if not cExecSQL(sSQL,False,1201) then
      begin
        cRollbackTrans;
        Result := False;
        Exit;
      end else if not SimpanBlob(sSQL, 1) then
      begin
        cRollbackTrans;
        Result := False;
        Exit;
      end
      else begin
        cCommitTrans;
      end;
    finally
      cRollbackTrans;
    end;

  end;

  Result := True;
  if Result then
  begin
    CommonDlg.ShowMessage('Data Berhasil Disimpan');
    Close;
  end
  else begin
    CommonDlg.ShowError('Data Gagal Disimpan');
    Exit;
  end;
  }
end;

procedure TfrmDialogInputProductForNotSO.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin
  inherited;
  {
  if not IsValidDateKarenaEOD(dialogunit,cGetServerTime,FMasterIsStore) then
    Exit;

  try
    if CommonDlg.Confirm('Anda Yakin Akan Menyimpan Data ?') = mrNO then
      Exit;

    if IsAdaDataDouble then
      Exit;
        
    if (FormMode = fmAdd) then
    begin
      FIsProcessSuccessfull := SaveData;
    end
    else begin
      FIsProcessSuccessfull := UpdateData;
    end; 

    if FIsProcessSuccessfull then
    begin
      cCommitTrans;
      CommonDlg.ShowMessage('Berhasil Simpan Data');
      Close;
    end else begin
      cRollbackTrans;
      CommonDlg.ShowError('Gagal Simpan Data');
    end;
  finally
    cRollbackTrans;
    frmInputProductForNotSO.RefreshDataGrid;
  end;
  }
end;

procedure TfrmDialogInputProductForNotSO.SetIsProcessSuccessfull(
  const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogInputProductForNotSO.btnDeleteClick(Sender: TObject);
var
  sSQL: string;
  IDLokal: Integer;
begin
    {if strgGrid.Cells[2,strgGrid.Row] = '0'
      then Exit;

    if (CommonDlg.Confirm('Anda Yakin Akan Menghapus Data : ' + strgGrid.Cells[0,strgGrid.Row] + ' ?') = mrYes) then
    begin
      IDLokal := StrToInt(strgGrid.Cells[3,strgGrid.Row]);
      sSQL := 'delete from SO_BARANG_BLACKLIST where '
              + ' SOBB_ID = ' + IntToStr(IDLokal)
              + ' and SOBB_UNT_ID = ' + IntToStr(masternewunit.id);

      if not cExecSQL(sSQL,False,1201) then
      begin
        cRollbackTrans;
        CommonDlg.ShowError('Data Gagal Dihapus');
        Exit;
      end
      else if not SimpanBlob(sSQL,1) then
      begin
        cRollbackTrans;
        CommonDlg.ShowError('Data Gagal Disimpan');
        Exit;
      end
      else begin
        cCommitTrans;
        CommonDlg.ShowMessage('Data Berhasil Dihapus');
        strgGrid.Clear;
      end;
    end;

    RefreshDataGrid;
    strgGrid.SetFocus;
    }
end;

procedure TfrmDialogInputProductForNotSO.cbpCodeChange(Sender: TObject);
begin
  inherited;
  if FFormMode=fmEdit then Exit;
  {edtName.Text:=cbpCode.Cells[2,cbpCode.Row];
  try
    iIdUnt:=StrToInt(cbpCode.Cells[0,cbpCode.Row]);
  except
    iIdUnt:=0;
  end;}
  isCodeChange:=True;
end;

procedure TfrmDialogInputProductForNotSO.strgGridComboChange(
  Sender: TObject; ACol, ARow, AItemIndex: Integer; ASelection: String);
begin
  inherited;
 { case ACol of
    0: begin
        strgGrid.Cells[1,ARow]:= dtProduk[AItemIndex].name;
        strgGrid.Cells[2,ARow]:= IntToStr(dtProduk[AItemIndex].id);
       end;
    1: begin
        strgGrid.Cells[0,ARow]:= dtProduk[AItemIndex].code;
        strgGrid.Cells[2,ARow]:= IntToStr(dtProduk[AItemIndex].id);
       end;
  end;
  isCodeChange:=True;  }
end;

procedure TThreadSO.Execute;
var i: Integer;
    data: TDataSet;
begin
  {
  with frmDialogInputProductForNotSO do
  try
    if not assigned(BarangSuplier) then
      BarangSuplier := TBarangSuplier.Create;
    if FFormMode=fmAdd then
      data:=BarangSuplier.GetListBarangSupplierNotBlackList(edtKode.Text)
    else
      data:=BarangSuplier.GetListBarangSuplierByCode(edtKode.Text);
    SetLength(dtProduk,data.RecordCount+1);
    dtProduk[0].id:= 0;
    dtProduk[0].code:= ' ';
    dtProduk[0].name:= ' ';
    data.First;
    for i:=0 to data.RecordCount-1 do
    begin
      dtProduk[i+1].id:= data.fieldbyname('BRGSUP_ID').AsInteger;
      dtProduk[i+1].code:= data.fieldbyname('BRG_CODE').AsString;
      dtProduk[i+1].name:= data.fieldbyname('BRG_ALIAS').AsString;
      data.Next;
    end;
    for i:=1 to strgGrid.RowCount-1 do
    begin
      strgGrid.Cells[0,i]:=' ';
      strgGrid.Cells[1,i]:=' ';
    end;

    if FFormMode=fmEdit then
    for i:=1 to frmInputProductForNotSO.strgGrid.RowCount-1 do
    begin
      frmDialogInputProductForNotSO.strgGrid.Cells[0,i]:=frmInputProductForNotSO.strgGrid.Cells[0,i];
      frmDialogInputProductForNotSO.strgGrid.Cells[1,i]:=frmInputProductForNotSO.strgGrid.Cells[1,i];
      frmDialogInputProductForNotSO.strgGrid.Cells[2,i]:=frmInputProductForNotSO.strgGrid.Cells[3,i];
      frmDialogInputProductForNotSO.strgGrid.Cells[3,i]:=frmInputProductForNotSO.strgGrid.Cells[2,i];
    end;
  finally
    frmDialogInputProductForNotSO.Enabled:= True;
    frmSplash.Close;
    Terminate;
  end;
  }
end; { of procedure }

procedure TfrmDialogInputProductForNotSO.cbpCodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  {if Key=#13 then
  begin
    if not assigned(frmSplash) then
      frmSplash := TfrmSplash.Create(Application);
    frmSplash.Show;
    frmDialogInputProductForNotSO.Enabled:= False;
    TThreadSO.Create(False);
  end;}
end;

procedure TfrmDialogInputProductForNotSO.SetSuplierCode(const Value: string);
begin
  FSuplierCode:= Value;
end;

procedure TfrmDialogInputProductForNotSO.prepareAddData;
begin

end;

procedure TfrmDialogInputProductForNotSO.FormShow(Sender: TObject);
var
  iBaris: Integer;
  aSQL: string;
begin
{
  strgGrid.ColWidths[2] := 0;
  strgGrid.ColWidths[3] := 0;

  if (FFormMode = fmEdit) then
  begin
    //showDataEdit(FSuplierCode)


    aSQL := ' select a.sup_code, b.SOBB_BRGSUP_ID, d.brg_alias, d.brg_code,b.SOBB_ID '
            + ' from suplier a, SO_BARANG_BLACKLIST b, barang_suplier c, barang d '
            + ' where a.sup_code = ' + QuotedStr(edtKode.Text)
            + ' and b.SOBB_UNT_ID = ' + IntToStr(dialogunit)
            + ' and c.brgsup_sup_code = a.sup_code '
            + ' and d.brg_code = c.brgsup_brg_code '
            + ' and b.sobb_brgsup_id = c.brgsup_id '
            + ' ORDER BY d.brg_CODE ASC' ;

    with cOpenQuery(aSQL) do
    begin
      iBaris := 0;
      while not Eof do
      begin
        strgGrid.Cells[0,iBaris + 1] := fieldByName('brg_code').AsString;
        strgGrid.Cells[1,iBaris + 1] := fieldByName('brg_alias').AsString;
        strgGrid.Cells[2,iBaris + 1] := fieldByName('SOBB_BRGSUP_ID').AsString;
        strgGrid.Cells[3,iBaris + 1] := fieldByName('SOBB_ID').AsString;
        Next;
        strgGrid.AddRow;
        Inc(iBaris);
      end;
      HapusBarisKosong(strgGrid,1);
    end;
  end
  else
   prepareAddData();

  strgGrid.ControlLook.DropDownAlwaysVisible:=True;
  isCodeChange:=False;
  }
end;

procedure TfrmDialogInputProductForNotSO.lblTambahClick(Sender: TObject);
begin
  inherited;
  {strgGrid.AddRow;
  strgGrid.SetFocus;
  strgGrid.Col := 0;
  strgGrid.Row := strgGrid.RowCount - 1;
  }
end;

procedure TfrmDialogInputProductForNotSO.cbpCodeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  {
  if(not(isCodeChange))and(Key=VK_ESCAPE)then
      footerDialogMaster.btnClose.Click
  else if(isCodeChange)and(Key in [VK_ESCAPE,VK_RETURN]) then
    isCodeChange:=False;
  }  
end;

procedure TfrmDialogInputProductForNotSO.cbpCodeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
//var supCode: string;
begin
  inherited;
  {if Length(cbpCode.Text) = 1 then
  begin
    supCode := UpperCase(cbpCode.Text) + '%';

    frmInputProductForNotSO.dataCodeSuplier := SearchSupplier.GetDataSupplier(supCode, dialogunit);
    frmInputProductForNotSO.LoadDropDownData(cbpCode,frmInputProductForNotSO.dataCodeSuplier.RecordCount);
  end; //if length }
end;

procedure TfrmDialogInputProductForNotSO.cbpCodeCloseUp(Sender: TObject);
begin
  inherited;
  if FFormMode=fmEdit then Exit;
 // edtName.Text:=cbpCode.Cells[2,cbpCode.Row];
  isCodeChange:=True;

  {if not assigned(frmSplash) then
      frmSplash := TfrmSplash.Create(Application);
  frmSplash.Show;
  frmDialogInputProductForNotSO.Enabled:= False;
  TThreadSO.Create(False);}
end;

procedure TfrmDialogInputProductForNotSO.cbpCodeExit(Sender: TObject);
begin
  inherited;
{  if not assigned(frmSplash) then
      frmSplash := TfrmSplash.Create(Application);
  frmSplash.Show;
  frmDialogInputProductForNotSO.Enabled:= False;
  TThreadSO.Create(False);  }
end;

procedure TfrmDialogInputProductForNotSO.edtKodeClickBtn(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
  sSQL := 'select sup_code as "Kode Suplier", sup_name as "Nama Suplier" '
       + ' from suplier ';
  {
  with cLookUp('Data Suplier',sSQL) do
  begin
    if Strings[0] = '' then
    begin
      Exit;
    end;

    edtKode.Text := Strings[0];
    edtName.Text := Strings[1];
  end;
  }
end;

procedure TfrmDialogInputProductForNotSO.lbl2Click(Sender: TObject);
begin
  inherited;
  //strgGrid.RemoveSelectedRows;
end;

procedure TfrmDialogInputProductForNotSO.lblHapusClick(Sender: TObject);
begin
  inherited;
  {strgGrid.Rows[strgGrid.Row].Clear;
  if strgGrid.RowCount > strgGrid.FixedRows + 1 then
    strgGrid.RemoveSelectedRows
  }
end;

procedure TfrmDialogInputProductForNotSO.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  {
  if ssCtrl in Shift then
  begin
    if (Key = Ord('R')) and (ssctrl in Shift) then
      lblHapusClick(nil)
    else if (Key = Ord('T')) and (ssctrl in Shift) then
      lblTambahClick(nil);
  end else if Key = VK_RETURN then
  begin
    if ActiveControl = strgGrid then
    begin
       if strgGrid.Col + 1 > strgGrid.ColCount - 1 then
         strgGrid.Col := 0
       else
         strgGrid.Col := strgGrid.Col + 1;
    end else
       SelectNext(ActiveControl,true,true);
  end else if Key = VK_F5 then
  begin
    if ActiveControl = strgGrid then
    begin
      LoadDataBarang;
    end;
  end;
  }
end;

function TfrmDialogInputProductForNotSO.IsAdaDataDouble: Boolean;
var
  j: Integer;
  i: Integer;
begin
  Result := False;
  {for i := 1 to strgGrid.RowCount - 1 do
  begin
    for j := i + 1 to strgGrid.RowCount - 1 do
    begin
      if strgGrid.Cells[0,i] = strgGrid.Cells[0,j] then
      begin
        strgGrid.Row := i;
        CommonDlg.ShowError('Ada Data Double Baris ' + IntToStr(i) + ' dan ' + IntToStr(j));
        Result := True;
        Exit;
      end;
    end;
  end;
  }
end;

procedure TfrmDialogInputProductForNotSO.LoadDataBarang;
var
  sSQL: string;
begin
  sSQL := 'select a.BRGSUP_BRG_CODE as "Kode Barang", b.BRG_ALIAS as "Nama Barang",b.brg_alias as "Alias", a.brgsup_id as "ID"'
          + ' from barang_suplier a, barang b'
          + ' where a.BRGSUP_SUP_CODE = ' + QuotedStr(edtKode.Text)
          + ' and b.brg_code = a.brgsup_brg_code'
          + ' and a.BRGSUP_ID not in '
          + ' (select c.SOBB_BRGSUP_ID '
          + ' from SO_BARANG_BLACKLIST c'
          + ' where c.SOBB_BRGSUP_ID = a.BRGSUP_ID '
          + ' and c.SOBB_UNT_ID = ' + IntToStr(dialogunit)
          + ')';


     {
      with cLookUp('Data Barang',sSQL) do
      begin
        try
          if Strings[0] = '' then
          begin
            Exit;
          end;

          strgGrid.Cells[0,strgGrid.Row] := Strings[0];
          strgGrid.Cells[1,strgGrid.Row] := Strings[2];
          strgGrid.Cells[2,strgGrid.Row] := Strings[3];
        finally
          Free;
        end;
      end;
      }
end;

procedure TfrmDialogInputProductForNotSO.strgGridCellValidate(
  Sender: TObject; ACol, ARow: Integer; var Value: String;
  var Valid: Boolean);
var
  iBrgSupID: Integer;
begin
  inherited;
  {if ACol in [0] then
  begin
    with TNewBarang.Create(Self) do
    begin
      if LoadByKode(Value) then
      begin
        Valid := IsBarangMilikSupplier(Value, edtKode.Text, iBrgSupID);
      end;


      if Valid then
      begin
        strgGrid.Cells[0,strgGrid.Row] := Kode;
        strgGrid.Cells[1,strgGrid.Row] := Alias;
        strgGrid.Cells[2,strgGrid.Row] := IntToStr(iBrgSupID);
      end;
    end;
  end;
  }
end;

end.






