
unit ufrmListCNDamage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, ufraFooter5Button, StdCtrls, ExtCtrls, SUIButton, uConn,
  Mask, JvToolEdit, SUIComboBox, Grids, BaseGrid, AdvGrid, cbxbase, dblup1a, ufrmSearchSupplier,
  AdvObj, JvExMask;

type
  TfrmListCNDamage = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    pnl1: TPanel;
    lbl2: TLabel;
    dtDateTo: TJvDateEdit;
    btnAddRow: TsuiButton;
    dtDateFrom: TJvDateEdit;
    lbl1: TLabel;
    cbbReportType: TsuiComboBox;
    strgGrid: TAdvStringGrid;
    lbl6: TLabel;
    cbpMerchandiseGrup: TColumnComboBox;
    Label1: TLabel;
    lbl5: TLabel;
    edtSupCode: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAddRowClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure fraFooter5Button1btnAddClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbpMerchandiseGrupKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbpMerchandiseGrupKeyPress(Sender: TObject; var Key: Char);
    procedure cbpMerchandiseGrupChange(Sender: TObject);
    procedure strgGridGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure strgGridGetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
    procedure fraFooter5Button1btnRefreshClick(Sender: TObject);
    procedure cbbReportTypeChange(Sender: TObject);
    procedure edtSupCodeKeyPress(Sender: TObject; var Key: Char);
    procedure edtSupCodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSupCodeChange(Sender: TObject);
    procedure btnAddRowEnter(Sender: TObject);
    procedure btnAddRowExit(Sender: TObject);
  private
    { Private declarations }
    FMerchanGrupID: Integer;
    FSupplierCode : String;
    procedure SetHeaderMerchandiseGroup;
    procedure SetHeaderSupplier;
    procedure ShowListMerchandiseGroup;
    procedure ShowListDamage;
    function ListingCNDamage(AValue: Integer): TResultDataSet;
    function GetCNDamageSupplier: TResultDataSet;
    function GetCNDamageMerchandiseGroup: TResultDataSet;
    procedure SetMerchanGrupID(const Value: Integer);
    procedure SetSuplierCode(const Value: String);
  public
    { Public declarations }
  published
    property MerchanGrupID: Integer read FMerchanGrupID write SetMerchanGrupID;
    property SupplierCode: String read FSupplierCode write SetSuplierCode;
  end;

var
  frmListCNDamage: TfrmListCNDamage;

implementation

uses suithemes, uGroups, uSupplier, uGTSUICommonDlg,
  ufrmDialogPrintPreview, uListCNDamage, uConstanta;

{$R *.dfm}

{ TfrmListWastage }

function TfrmListCNDamage.GetCNDamageSupplier: TResultDataSet;
var
  Parrams: TArr;
begin
  SetLength(Parrams, 3);
  Parrams[0].tipe:= ptDateTime;
  Parrams[0].data:= dtDateFrom.Date;
  Parrams[1].tipe:= ptDateTime;
  Parrams[1].data:= dtDateTo.Date;
  Parrams[2].tipe:= ptString;
  Parrams[2].data:= SupplierCode;
  Result:= ListCNDamage.GetListCNDamageBySup(Parrams);
end;

function TfrmListCNDamage.GetCNDamageMerchandiseGroup: TResultDataSet;
var
  Parrams: TArr;
begin
  if MerchanGrupID = 0 then
  begin
    SetLength(Parrams, 2);
    Parrams[0].tipe:= ptDateTime;
    Parrams[0].data:= dtDateFrom.Date;
    Parrams[1].tipe:= ptDateTime;
    Parrams[1].data:= dtDateTo.Date;
    Result:= ListCNDamage.GetListCNDamageByMGAll(Parrams);
  end else
  begin
    SetLength(Parrams, 3);
    Parrams[0].tipe:= ptDateTime;
    Parrams[0].data:= dtDateFrom.Date;
    Parrams[1].tipe:= ptDateTime;
    Parrams[1].data:= dtDateTo.Date;
    Parrams[2].tipe:= ptInteger;
    Parrams[2].data:= MerchanGrupID;
    Result:= ListCNDamage.GetListCNDamageByMG(Parrams);
  end;
end;

function TfrmListCNDamage.ListingCNDamage(AValue: Integer): TResultDataSet;
begin
  Result:= nil;
  case AValue of
    1: Result:= GetCNDamageSupplier;
    2: Result:= GetCNDamageMerchandiseGroup;   
  end;
end;

procedure TfrmListCNDamage.SetHeaderMerchandiseGroup;
begin
  with strgGrid do
  begin
    Clear;
    RowCount:= 2;
    ColCount:= 5;
    Cells[0,0]:= 'Category';
    Cells[1,0]:= 'Product Code & Product Name';
    Cells[2,0]:= 'Total Qty';
    Cells[3,0]:= 'Total Unit Price';
    Cells[4,0]:= 'Total Damage';
    FixedRows:= 1;
  end;
end;

procedure TfrmListCNDamage.SetHeaderSupplier;
begin
  with strgGrid do
  begin
    Clear;
    RowCount:= 2;
    ColCount:= 5;
    Cells[0,0]:= 'Supplier Code & Supplier Name';
    Cells[1,0]:= 'Barang Code & Barang Name';
    Cells[2,0]:= 'Total Qty';
    Cells[3,0]:= 'Total Unit Price';
    Cells[4,0]:= 'Total Damage';
    FixedRows:= 1;
  end;
end;

procedure TfrmListCNDamage.ShowListMerchandiseGroup;
var
  AData: TResultDataSet;
begin
  AData:= Groups.GetDataGroup();

  cbpMerchandiseGrup.ClearGridData;
  cbpMerchandiseGrup.RowCount:= 2;
  cbpMerchandiseGrup.AddRow(['ID','Group Code','Group Name']);
  cbpMerchandiseGrup.AddRow(['0', ' --ALL-- ', ' --ALL-- ']);

  if AData.RecordCount>0 then
  begin
    cbpMerchandiseGrup.RowCount:= AData.RecordCount + cbpMerchandiseGrup.RowCount;
    AData.First;
    while not AData.Eof do
    begin
      cbpMerchandiseGrup.AddRow([AData.FieldByName('Grup_ID').AsString,
                            AData.FieldByName('Grup_Code').AsString,
                            AData.FieldByName('Grup_Name').AsString]);
      AData.Next;
    end;
  end;

  cbpMerchandiseGrup.FixedRows:= 1;
  cbpMerchandiseGrup.ShowSpeedButton:= False;
end;

procedure TfrmListCNDamage.ShowListDamage;
var
  I: Integer;
  AData: TResultDataSet;
begin
  AData:= ListingCNDamage(cbbReportType.ItemIndex);
  case cbbReportType.ItemIndex of
    1: SetHeaderSupplier;
    2: SetHeaderMerchandiseGroup;
  end;

  I:= 1;
  if AData.RecordCount>0 then
  begin
    strgGrid.RowCount:= AData.RecordCount + I;
    AData.First;
    while not AData.Eof do
    begin
      case cbbReportType.ItemIndex of
        1:  begin
              strgGrid.Cells[0, I]:= AData.FieldByName('SUP_CODE').AsString + ' '+
                                     AData.FieldByName('SUP_NAME').AsString;
              strgGrid.Cells[1, I]:= AData.FieldByName('BRG_CODE').AsString + ' '+
                                     AData.FieldByName('BRG_NAME').AsString + ' '+
                                     AData.FieldByName('BRG_MERK').AsString;
            end;
        2:  begin
              strgGrid.Cells[0, I]:= AData.FieldByName('MERCHANGRUP_NAME').AsString;
              strgGrid.Cells[1, I]:= AData.FieldByName('BRG_CODE').AsString + ' '+
                                     AData.FieldByName('BRG_NAME').AsString + ' '+
                                     AData.FieldByName('BRG_MERK').AsString;
            end;
      end;
      strgGrid.Cells[2, I]:= AData.FieldByName('QTY').AsString;
      strgGrid.Cells[3, I]:= AData.FieldByName('SUB_TOTAL').AsString;
      strgGrid.Cells[4, I]:= AData.FieldByName('TOTAL').AsString;
      Inc(I);
      AData.Next;
    end;
    strgGrid.AutoSize:= True;
  end;
end;

procedure TfrmListCNDamage.FormShow(Sender: TObject);
begin
  inherited;
    SetHeaderSupplier;
    edtSupCode.Enabled        := False;
    cbpMerchandiseGrup.Enabled:= False;
    ShowListMerchandiseGroup;
end;

procedure TfrmListCNDamage.FormCreate(Sender: TObject);
begin
  inherited;
  cbbReportType.ItemIndex := 0;
  dtDateFrom.Date := Now;
  dtDateTo.Date   := Now;
  lblHeader.Caption:= 'LISTING CN DAMAGE';
end;                                                    

procedure TfrmListCNDamage.btnAddRowClick(Sender: TObject);
begin
  inherited;
//  if Mastercompany.ID = 0 then
//  begin
//    CommonDlg.ShowError(ER_COMPANY_NOT_SPECIFIC);
//    Exit;
//  end;
//
//  if MasterNewUnit.ID = 0 then
//  begin
//    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
//    //frmMain.cbbUnit.SetFocus;
//    Exit;
//  end;

  if cbbReportType.ItemIndex = 0 then
  begin
    CommonDlg.ShowError('Please select CN Damage report');
    cbbReportType.SelectAll;
    Exit;
  end;

  ShowListDamage;
end;

procedure TfrmListCNDamage.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action:= caFree;
end;

procedure TfrmListCNDamage.FormDestroy(Sender: TObject);
begin
  inherited;
  frmListCNDamage:= nil;
end;

procedure TfrmListCNDamage.fraFooter5Button1btnAddClick(Sender: TObject);
var
  AList: TStringList;
begin
  inherited;
//  if Mastercompany.ID = 0 then
//  begin
//    CommonDlg.ShowError(ER_COMPANY_NOT_SPECIFIC);
//    //frmMain.cbbCompCode.SelectAll;
//    //frmMain.cbbCompCode.SetFocus;
//    Exit;
//  end;
//
//  if MasterNewUnit.ID = 0 then
//  begin
//    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
//    //frmMain.cbbUnit.SelectAll;
//    //frmMain.cbbUnit.SetFocus;
//    Exit;
//  end;

  if cbbReportType.ItemIndex = 0 then
  begin
    CommonDlg.ShowError('Please select CN Damage report');
    cbbReportType.SelectAll;
    Exit;
  end;

  FormatSettings.DateSeparator:= '/';
  if not Assigned(frmDialogPrintPreview) then
    frmDialogPrintPreview:= TfrmDialogPrintPreview.Create(Application);

  AList:= TStringList.Create;
  try
    AList.Add('');
    AList.Add(FLoginFullname);
    AList.Add(FormatDateTime('dd/MM/yyyy', dtDateFrom.Date));
    AList.Add(FormatDateTime('dd/MM/yyyy', dtDateTo.Date));
    AList.Add('Posted');
    AList.Add(MasterNewUnit.Nama);

    frmDialogPrintPreview.ListParams:= AList;
    frmDialogPrintPreview.RecordSet:= ListingCNDamage(cbbReportType.ItemIndex);
    case cbbReportType.ItemIndex of
      1: frmDialogPrintPreview.FilePath:= FFilePathReport + 'frListCNDamageBySupplier.fr3';
      2: frmDialogPrintPreview.FilePath:= FFilePathReport + 'frListCNDamageByMerchandiseGroup.fr3';
    end;
    SetFormPropertyAndShowDialog(frmDialogPrintPreview);
  finally
    frmDialogPrintPreview.Free;
    FreeAndNil(AList);
  end;
end;

procedure TfrmListCNDamage.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if ((Key = Ord('P')) and (ssCtrl in Shift)) then
    fraFooter5Button1.btnAdd.Click;  
end;

procedure TfrmListCNDamage.SetMerchanGrupID(const Value: Integer);
begin
  FMerchanGrupID := Value;
end;

procedure TfrmListCNDamage.SetSuplierCode(const Value: String);
begin
  FSupplierCode := Value;
end;

procedure TfrmListCNDamage.cbpMerchandiseGrupKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_DOWN then
  begin
    if Trim(cbpMerchandiseGrup.Text) = '' then
    begin
      cbpMerchandiseGrup.Text := cbpMerchandiseGrup.Cells[2, 1];
    end;
  end;  

  if Key = VK_RETURN then
    MerchanGrupID:= StrToInt(cbpMerchandiseGrup.Cells[0, cbpMerchandiseGrup.Row]);
end;

procedure TfrmListCNDamage.cbpMerchandiseGrupKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = Char(VK_RETURN) then
    if cbpMerchandiseGrup.Cells[0, cbpMerchandiseGrup.Row] = '' then
      Key:= #0;
end;

procedure TfrmListCNDamage.cbpMerchandiseGrupChange(Sender: TObject);
begin
  inherited;
  if (cbpMerchandiseGrup.Cells[0, cbpMerchandiseGrup.Row]<> '') and
     (cbpMerchandiseGrup.Cells[0, cbpMerchandiseGrup.Row]<> 'ID') and
     (MasterNewUnit.ID > 0) then
  begin
    MerchanGrupID:= StrToInt(cbpMerchandiseGrup.Cells[0, cbpMerchandiseGrup.Row]);
    cbpMerchandiseGrup.Text := cbpMerchandiseGrup.Cells[2, cbpMerchandiseGrup.Row];
  end;
end;

procedure TfrmListCNDamage.strgGridGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  inherited;
  if ARow = 0 then
    HAlign:= taCenter
  else
  begin
    case ACol of
      0..1: HAlign:= taLeftJustify;
      2..4: HAlign:= taRightJustify;
    end;
  end;
end;

procedure TfrmListCNDamage.strgGridGetFloatFormat(Sender: TObject; ACol,
  ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  inherited;
  FloatFormat:= '%.2n';
  if ACol in [2..4] then
    IsFloat:= True
  else IsFloat:= False;
end;

procedure TfrmListCNDamage.fraFooter5Button1btnRefreshClick(
  Sender: TObject);
begin
  inherited;
  ShowListMerchandiseGroup;
end;

procedure TfrmListCNDamage.cbbReportTypeChange(Sender: TObject);
begin
  inherited;
  case cbbReportType.ItemIndex of
    0: begin
         cbpMerchandiseGrup.Enabled:= False;
         edtSupCode.Enabled:= False;
       end;
    1: begin
         cbpMerchandiseGrup.Enabled:= False;
         edtSupCode.Enabled:= True;
         edtSupCode.SetFocus;
       end;
    2: begin
         cbpMerchandiseGrup.Enabled:= True;
         edtSupCode.Enabled:= False;
         cbpMerchandiseGrup.SetFocus;
       end;
  end;
end;

procedure TfrmListCNDamage.edtSupCodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key:= UpCase(Key)
end;

procedure TfrmListCNDamage.edtSupCodeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    btnAddRow.SetFocus;
    exit;
  end;

  if Key = VK_F5 then
  begin
    if not Assigned(frmDialogSearchSupplier) then
      frmDialogSearchSupplier:= TfrmDialogSearchSupplier.Create(Application);

    frmDialogSearchSupplier.searchFor:= sfCNDamage;
    SetFormPropertyAndShowDialog(frmDialogSearchSupplier);
    edtSupCode.Text := frmDialogSearchSupplier.SupplierCode;
    SupplierCode    := edtSupCode.Text;
    frmDialogSearchSupplier.Free;
  end;
end;

procedure TfrmListCNDamage.edtSupCodeChange(Sender: TObject);
begin
  inherited;
  SupplierCode:= edtSupCode.Text;
end;

procedure TfrmListCNDamage.btnAddRowEnter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmListCNDamage.btnAddRowExit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

end.

