unit ufrmDialogBarangCompetitor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ExtCtrls, StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, DB,
  cxDBExtLookupComboBox, cxMaskEdit, cxCalendar, cxTextEdit, cxCurrencyEdit,
  System.Actions, Vcl.ActnList, ufraFooterDialog3Button;

type       
  TFormMode = (fmAdd, fmEdit);
  
  TfrmDialogBarangCompetitor = class(TfrmMasterDialog)
    lbl1: TLabel;
    edtcompttCode: TEdit;
    chkAddMore: TCheckBox;
    lbl3: TLabel;
    bvl1: TBevel;
    edtProductName: TEdit;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    cbbUOM: TComboBox;
    curedtPriceConv: TcxCurrencyEdit;
    lbl7: TLabel;
    dtSurvey: TcxDateEdit;
    lbl8: TLabel;
    curedtSellPrice: TcxCurrencyEdit;
    lbl9: TLabel;
    curedtConvert: TcxCurrencyEdit;
    edtProductCode: TEdit;
    cbpCompetitor_old: TcxExtLookupComboBox;
    cbpCompetitor: TcxExtLookupComboBox;
    fedtConvert: TcxCurrencyEdit;
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure cbpCompetitorCloseUp(Sender: TObject);
    procedure edtcompttCodeChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtProductCodeChange(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fedtConvertChange(Sender: TObject);
  private
    dataSearchNameKomptt: TDataSet;
//    dataSearchCodeKomptt: TDataSet;

    FIsProcessSuccessfull: boolean;
    FProductId: string;
    FFormMode: TFormMode;
    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: boolean);
    procedure SetProductId(const Value: string);

//    procedure CheckSellPriceByUOM();
    procedure setShow();
    function checkEmptyFields(): Boolean;
    { Private declarations }
  public
    KBD_ID: Integer;
    countSave: Integer;
    { Public declarations } 
  published
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property ProductId: string read FProductId write SetProductId;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDialogBarangCompetitor: TfrmDialogBarangCompetitor;

implementation

uses  uTSCommonDlg;

{$R *.dfm}

{ TfrmDialogBarangCompetitor }

procedure TfrmDialogBarangCompetitor.SetFormMode(const Value: TFormMode);
begin
  FFormMode := Value;
end;

procedure TfrmDialogBarangCompetitor.SetIsProcessSuccessfull(
  const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogBarangCompetitor.SetProductId(const Value: string);
begin
  FProductId := Value;
end;

procedure TfrmDialogBarangCompetitor.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin

  if checkEmptyFields() then
  if (FormMode = fmAdd) then
  begin
    //croscheck uom input Vs satCodeBuy
    {
    FIsProcessSuccessfull :=
      BarangCompetitor.InputBarangCompetitor(
          StrToInt(cbpCompetitor.Cells[0,cbpCompetitor.Row]),
          dtSurvey.Date,
          edtProductCode.Text,
          cbbUOM.Text,
          curedtSellPrice.Value,
          fedtConvert.Value,
          DialogUnit,
          FLoginId,
          countSave);
    if not(chkAddMore.Checked) then Close
    else
    begin
      setShow();
      Inc(countSave);
    end;
  end //end if fmadd
  else
  begin
    //croscheck uom input Vs satCodeBuy

    FIsProcessSuccessfull :=
        BarangCompetitor.UpdateBarangCompetitor(KBD_ID,
            edtProductCode.Text,
            cbbUOM.Text,
            curedtSellPrice.Value,
            fedtConvert.Value,
            FLoginId);
    if FIsProcessSuccessfull then Close;
    }
  end; // end else fmadd

end;

procedure TfrmDialogBarangCompetitor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogBarangCompetitor.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogBarangCompetitor := nil;
end;

procedure TfrmDialogBarangCompetitor.cbpCompetitorCloseUp(Sender: TObject);
begin
  inherited;
//  dataSearchNameKomptt := DaftarCompetitor.SearchDataCompetitor(StrToInt(cbpCompetitor.Cells[0,cbpCompetitor.Row]));
  edtcompttCode.Text := dataSearchNameKomptt.FieldByName('KOMPT_CODE').AsString;
end;

procedure TfrmDialogBarangCompetitor.edtcompttCodeChange(Sender: TObject);
begin
  inherited;
//  dataSearchCodeKomptt := DaftarCompetitor.SearchCompetitorByCode(edtcompttCode.Text);

//  if dataSearchCodeKomptt.RecordCount > 0 then
//    cbpCompetitor.Value := dataSearchCodeKomptt.FieldByName('KOMPT_NAME').AsString;
end;

procedure TfrmDialogBarangCompetitor.FormShow(Sender: TObject);
begin
  inherited;
  setShow();
end;

procedure TfrmDialogBarangCompetitor.edtProductCodeChange(Sender: TObject);
begin
  inherited;
//  if not Assigned(BarangCompetitor) then
//    BarangCompetitor := TBarangCompetitor.Create;
//  edtProductName.Text := BarangCompetitor.SearchProductName(edtProductCode.Text);
end;

//procedure TfrmDialogBarangCompetitor.CheckSellPriceByUOM();
//var trueUOM: string;
//    trueSellprice: Currency;
//begin
//  if not Assigned(BarangCompetitor) then BarangCompetitor := TBarangCompetitor.Create;
//  BarangCompetitor.SellPriceAfterCheckUOM(edtProductCode.Text,cbbUOM.Text,DialogUnit,curedtSellPrice.Value,trueUOM,trueSellprice);

//  curedtSellPrice.Value := trueSellprice;
//  fedtConvertChange(Self);
//  cbbUOM.Text := trueUOM;
//end;

procedure TfrmDialogBarangCompetitor.setShow();
begin
  if FormMode = fmAdd then
  begin
    edtcompttCode.Enabled := True;
    cbpCompetitor.Enabled := True;
    dtSurvey.Enabled := True;
    chkAddMore.Checked := True;
    chkAddMore.Visible := True;
    //initiate
    edtProductCode.Text := '';
    edtProductName.Text := '';
    curedtSellPrice.Value := 0;
    fedtConvert.Value := 0.0;
    curedtConvert.Value := 0;
    curedtPriceConv.Value := 0;
    cbbUOM.ItemIndex := 0;
  end
  else
  begin
    edtcompttCode.Enabled := False;
    cbpCompetitor.Enabled := False;
    dtSurvey.Enabled := False;
    chkAddMore.Checked := False;
    chkAddMore.Visible := False;
  end;
end;

function TfrmDialogBarangCompetitor.checkEmptyFields(): Boolean;
begin
  Result := True;
  if edtcompttCode.Text = '' then
  begin
    Result := False;
    commonDlg.ShowErrorEmpty(' Competitor Code ');
    Exit;
  end;
  if edtProductCode.Text = '' then
  begin
    Result := False;
    commonDlg.ShowErrorEmpty(' Product Code ');
    Exit;
  end;
end;

procedure TfrmDialogBarangCompetitor.FormKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F5) then
    begin
//      if not assigned(frmDialogSearchProduct) then
//        frmDialogSearchProduct := TfrmDialogSearchProduct.Create(Application);
//
//      frmDialogSearchProduct.DialogUnit := Self.DialogUnit;
//      frmDialogSearchProduct.FLoginId := Self.FLoginId;
//
//      frmDialogSearchProduct.Modul := mNone;
//
//      frmDialogSearchProduct.ShowModal;
//
//      if frmDialogSearchProduct.IsProcessSuccessfull = True then
//      begin
//        edtProductCode.Text := frmDialogSearchProduct.ProductCode;
//        edtProductName.Text := frmDialogSearchProduct.ProductName;
//      end;
//
//      frmDialogSearchProduct.Free;
  end;
end;

procedure TfrmDialogBarangCompetitor.fedtConvertChange(Sender: TObject);
begin
  inherited;
  try
    curedtConvert.Value := curedtSellPrice.Value * fedtConvert.Value / 100;
    curedtPriceConv.Value := curedtSellPrice.Value - curedtConvert.Value;
  except
    curedtConvert.Value := 0;
    curedtPriceConv.Value := 0;
  end;
end;

end.
