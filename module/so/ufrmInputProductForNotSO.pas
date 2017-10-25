unit ufrmInputProductForNotSO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, System.Actions, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  cxButtonEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit,
  cxCalendar, cxLabel, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC,
  Vcl.ActnList, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmInputProductForNotSO = class(TfrmMasterBrowse)
    pnlSupplier: TPanel;
    lbl1: TLabel;
    edtName: TEdit;
    cbpCode: TcxExtLookupComboBox;
    actlstInputProductForNotSO: TActionList;
    actAddProductNotForSO: TAction;
    actEditProductNotForSO: TAction;
    actDeleteProductNotForSO: TAction;
    actRefreshProductNotForSO: TAction;
    edtKode: TcxButtonEdit;
    procedure actAddExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure cbpCodeChange(Sender: TObject);
    procedure cbpCodeKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure cbpCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure cbpCodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbpCodeCloseUp(Sender: TObject);
    procedure edtKodeClickBtn(Sender: TObject);
    procedure edtKodeKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
  public
    { Public declarations }
    iIdUnt: Integer;
    dataCodeSuplier: TDataSet;
    procedure LoadDropDownData(ACombo: TcxExtLookupComboBox; AColsOfData: Integer);
    procedure LoadDropDownDatax(ACombo: TcxExtLookupComboBox;
              Field1,Field2,Field3,TblName:string;
              ColTitle1,ColTitle2,ColTitle3:string;
              isSpeedButton:Boolean);
    procedure RefreshDataGrid;
  end;

var
  frmInputProductForNotSO: TfrmInputProductForNotSO;

implementation

uses ufrmDialogInputProductForNotSO, uTSCommonDlg;

{$R *.dfm}

procedure TfrmInputProductForNotSO.actAddExecute(Sender: TObject);
begin
  inherited;
  if not Assigned(frmDialogInputProductForNotSO) then
    Application.CreateForm(TfrmDialogInputProductForNotSO, frmDialogInputProductForNotSO);

  frmDialogInputProductForNotSO.edtKode.Text := edtKode.Text;
  frmDialogInputProductForNotSO.edtName.Text := edtName.Text;
  frmDialogInputProductForNotSO.Caption := 'Add Product For Not SO';
  frmDialogInputProductForNotSO.FormMode:=fmAdd;
  SetFormPropertyAndShowDialog(frmDialogInputProductForNotSO);
end;

procedure TfrmInputProductForNotSO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmInputProductForNotSO.FormDestroy(Sender: TObject);
begin
  inherited;
  frmInputProductForNotSO := nil;
end;

procedure TfrmInputProductForNotSO.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'INPUT PRODUCT NOT FOR SO';

end;

procedure TfrmInputProductForNotSO.LoadDropDownData(ACombo: TcxExtLookupComboBox; AColsOfData: Integer);
begin
    {Flush the old data}
//    ACombo.ClearGridData;

    {Make sure the allocated storage is big enough}
//    if AColsOfData>0 then
//      ACombo.RowCount := AColsOfData+1
//    else
//      ACombo.RowCount := 2;
//    ACombo.ColCount := 3;
//    ACombo.AddRow(['','CODE','NAME']);
//    if dataCodeSuplier <> nil then
//    while not dataCodeSuplier.Eof do
//    begin
//      try
//        ACombo.AddRow([dataCodeSuplier.FieldByName('SUP_CODE').AsString,
//                       dataCodeSuplier.FieldByName('SUP_CODE').AsString,
//                       dataCodeSuplier.FieldByName('SUP_NAME').AsString]);
//      except
//      end;
//      dataCodeSuplier.Next;
//    end
//    else
//      try
//        ACombo.AddRow(['0',' ',' ']);
//      except
//      end;
//    ACombo.FixedRows:=1;
    {Now shring the grid so its just big enough for the data}
//    ACombo.SizeGridToData;
end;

procedure TfrmInputProductForNotSO.LoadDropDownDatax(ACombo: TcxExtLookupComboBox;
  Field1,Field2,Field3,TblName:string;
  ColTitle1,ColTitle2,ColTitle3:string;
  isSpeedButton:Boolean);
var i: Integer;
    data: TDataSet;
begin
//  if not assigned(DataCombo) then
//    DataCombo := TDataCombo.Create;
  {Flush the old data}
//  ACombo.ClearGridData;
  {Load the data}
//  data:=DataCombo.GetListDataCombo(Field1,Field2,Field3,TblName);
  {Make sure the allocated storage is big enough}
//  ACombo.RowCount := data.RecordCount+1;
//  ACombo.ColCount := 3;
//  ACombo.AddRow([ColTitle1,ColTitle2,ColTitle3]);
//
//  for i:=1 to ACombo.RowCount-1 do
//    try
//      ACombo.AddRow([data.Fields[0].AsVariant,data.Fields[1].AsVariant,data.Fields[2].AsVariant]);
//      data.Next;
//    except
//    end;
//
  {Now shring the grid so its just big enough for the data}
//  ACombo.SizeGridToData;
//  ACombo.ShowSpeedButton:=isSpeedButton;
//  if ACombo.RowCount>1 then
//  begin
//    ACombo.Text:=ACombo.Cells[1,1];
//    ACombo.FixedRows:=1;
//    ACombo.TitleColor:=clSkyBlue;
//  end
//  else
//  begin
//    ACombo.Text:='';
//    ACombo.FixedRows:=0;
//  end;
end;

procedure TfrmInputProductForNotSO.actEditExecute(Sender: TObject);
begin
  inherited;
  {
  if strgGrid.Cells[2,strgGrid.Row]='0' then Exit;
  if not Assigned(frmDialogInputProductForNotSO) then
    Application.CreateForm(TfrmDialogInputProductForNotSO, frmDialogInputProductForNotSO);
  frmDialogInputProductForNotSO.Caption := 'Edit Product For Not SO';
  frmDialogInputProductForNotSO.FormMode:=fmEdit;
  frmDialogInputProductForNotSO.SuplierCode:=cbpCode.Text;


  if (frmDialogInputProductForNotSO.IsProcessSuccessfull) then
  begin
    actRefreshProductNotForSOExecute(Self);
    CommonDlg.ShowConfirmSuccessfull(atEdit);
  end;

  frmDialogInputProductForNotSO.Free;
  }
end;

procedure TfrmInputProductForNotSO.actRefreshExecute(Sender: TObject);
// //data: TDataSet;
    //i: Integer;
begin
  {if not assigned(ProductBlackList) then
    ProductBlackList := TProductBlackList.Create;

  //Set Data
  ProductBlackList.SuplierCode:=cbpCode.Text;
  data:= ProductBlackList.Data;
  with strgGrid do
  begin
    Clear;
    ColCount := 2;
    RowCount := data.RecordCount+1;

    Cells[0, 0] := 'PRODUCT CODE';
    Cells[1, 0] := 'PRODUCT NAME';

    if RowCount>1 then
    with data do
    begin
      i:=1;
      while not Eof do
      begin
        Cells[0, i] := data.fieldbyname('BRG_CODE').AsString;
        Cells[1, i] := data.fieldbyname('BRG_NAME').AsString;
        Cells[2, i] := IntToStr(data.fieldbyname('SOBB_ID').AsInteger);
        Cells[3, i] := IntToStr(data.fieldbyname('BRGSUP_ID').AsInteger);
        Cells[4, i] := IntToStr(data.fieldbyname('UNT_ID').AsInteger);
        i:= i+1;
        Next;
      end;
    end
    else
    begin
      RowCount:=2;
      Cells[0, 1] := ' ';
      Cells[1, 1] := ' ';
      Cells[2, 1] := '0';
      Cells[3, 1] := '0';
      Cells[4, 1] := '0';
    end;
    AutoSize:=True;
  end;
  strgGrid.FixedRows:=1;


       }
end;

procedure TfrmInputProductForNotSO.cbpCodeChange(Sender: TObject);
begin
  inherited;
  {try
    iIdUnt:=StrToInt(cbpCode.Cells[0,cbpCode.Row]);
  except
    iIdUnt:=0;
  end;}
end;

procedure TfrmInputProductForNotSO.cbpCodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key=#13 then
    actRefreshExecute(Self);
end;

procedure TfrmInputProductForNotSO.FormShow(Sender: TObject);
begin
  inherited;
  cbpCode.SelStart := 7;
  edtKode.Text := '';
  {strgGrid.ColWidths[1] := 250;
  strgGrid.ColWidths[2] := 0;
  strgGrid.ColWidths[3] := 0;
  strgGrid.ColWidths[4] := 0;
  }
  edtKode.SetFocus;
end;

procedure TfrmInputProductForNotSO.cbpCodeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_DELETE)and(ssctrl in Shift) then
    Key := VK_NONAME;
end;

procedure TfrmInputProductForNotSO.FormActivate(Sender: TObject);
begin
  inherited;
  frmInputProductForNotSO.Caption := 'INPUT PRODUCT NOT FOR SO';
end;

procedure TfrmInputProductForNotSO.cbpCodeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var supCode: string;
begin
  inherited;
  if Length(cbpCode.Text) = 1 then
  begin
    supCode := UpperCase(cbpCode.Text) + '%';

//    dataCodeSuplier := SearchSupplier.GetDataSupplier(supCode);
    LoadDropDownData(cbpCode,dataCodeSuplier.RecordCount);
  end; //if length
end;

procedure TfrmInputProductForNotSO.cbpCodeCloseUp(Sender: TObject);
begin
  inherited;
//  edtName.Text:=cbpCode.Cells[2,cbpCode.Row];
end;

procedure TfrmInputProductForNotSO.edtKodeClickBtn(Sender: TObject);
var
  IBaris: Integer;
  iSQL: string;
  sSQL: string;
begin
  inherited;
  {
  strgGrid.ColWidths[1] := 250;
  
  sSQL := 'select sup_code as "Kode Suplier", sup_name as "Nama Suplier" '
        + ' from suplier ';

  with cLookUp('Data Suplier',sSQL) do
  begin
    if Strings[0] = '' then
    begin
      Exit;
    end;

    edtKode.Text := Strings[0];
    edtName.Text := Strings[1];
  end;

  iSQL := ' select a.sup_code, b.SOBB_BRGSUP_ID, d.brg_alias,d.brg_code,b.SOBB_ID '
          + ' from suplier a, SO_BARANG_BLACKLIST b, barang_suplier c, barang d'
          + ' where a.sup_code = ' + QuotedStr(edtKode.Text)
          + ' and b.SOBB_UNT_ID = ' + IntToStr(masternewunit.id)
          + ' and c.brgsup_sup_code = a.sup_code '
          + ' and d.brg_code = c.brgsup_brg_code '
          + ' and b.sobb_brgsup_id = c.brgsup_id ';

  with cOpenQuery(iSQL) do
  begin
    IBaris := 0;
    while not Eof do
    begin
      strgGrid.Cells[0,IBaris + 1] := FieldByName('brg_code').AsString;
      strgGrid.Cells[1, IBaris + 1] := FieldByName('brg_alias').AsString;
      strgGrid.Cells[2, IBaris + 1] := FieldByName('SOBB_BRGSUP_ID').AsString;
      strgGrid.Cells[3, IBaris + 1] := FieldByName('SOBB_ID').AsString;
      Next;
      strgGrid.AddRow;
      Inc(IBaris);
    end;
    HapusBarisKosong(strgGrid,1);
  end;
  }
end;

procedure TfrmInputProductForNotSO.RefreshDataGrid;
var
  IBaris: Integer;
  iSQL: string;
begin
  {cclearStringGrid(strgGrid, True);
  strgGrid.Cells[0, 0] := 'PRODUCT CODE';
  strgGrid.Cells[1, 0] := 'PRODUCT NAME';

  iSQL := ' select a.sup_code, b.SOBB_BRGSUP_ID, d.brg_alias,d.brg_code,b.SOBB_ID '
          + ' from suplier a, SO_BARANG_BLACKLIST b, barang_suplier c, barang d'
          + ' where a.sup_code = ' + QuotedStr(edtKode.Text)
          + ' and b.SOBB_UNT_ID = ' + IntToStr(masternewunit.id)
          + ' and c.brgsup_sup_code = a.sup_code '
          + ' and d.brg_code = c.brgsup_brg_code '
          + ' and b.sobb_brgsup_id = c.brgsup_id ';

  with cOpenQuery(iSQL) do
  begin
    IBaris := 0;
    while not Eof do
    begin
      strgGrid.Cells[0,IBaris + 1] := FieldByName('brg_code').AsString;
      strgGrid.Cells[1, IBaris + 1] := FieldByName('brg_alias').AsString;
      strgGrid.Cells[2, IBaris + 1] := FieldByName('SOBB_BRGSUP_ID').AsString;
      strgGrid.Cells[3, IBaris + 1] := FieldByName('SOBB_ID').AsString;
      Next;
      strgGrid.AddRow;
      Inc(IBaris);
    end;
    HapusBarisKosong(strgGrid,1);
  end;
  }
  edtKode.SetFocus;
end;

procedure TfrmInputProductForNotSO.edtKodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := UpCase(Key);
end;

procedure TfrmInputProductForNotSO.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  {if (key = VK_F5) and (ActiveControl =edtKode) then
  begin
    edtKodeClickBtn(Self);
  end else if (Key = VK_RETURN) then
  begin
    if ActiveControl = edtKode then
    begin
      with TNewSupplier.Create(nil) do
      begin
        try
          if LoadByKode(edtKode.Text) then
          begin
            edtKode.Text := Kode;
            edtName.Text := Nama;
          end else begin
            edtKode.Text := '';
            edtName.Text := '';
          end;

          RefreshDataGrid;
        finally
          Free;
        end;

      end;
    end;

    SelectNext(ActiveControl,true,true);
  end;
  }
end;

end.






