unit ufrmDialogProductType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, StdCtrls, ufraFooterDialog2Button, ExtCtrls,
  SUIForm, uTipeProduct, ufrmProductType, uRetnoUnit;

type     
  TFormMode = (fmAdd, fmEdit);
  
  TfrmDialogProductType = class(TfrmMasterDialog)
    lbl1: TLabel;
    lbl2: TLabel;
    edtCode: TEdit;
    edtName: TEdit;
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FIsProcessSuccessfull: boolean;
    FProductTypeId: Integer;
    FFormMode: TFormMode;
    FTipeProduct : TTipeProduk;
    aIDLokal : Integer;
    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: boolean);
    procedure SetProductTypeId(const Value: Integer);
    procedure ShowDataEdit(AProductTypeId: integer);
    procedure PrepareAddData();
    function SaveProductType: boolean;
    function UpdateProductType: boolean;

  public
    function cekProduk(aKodeBaru : string): Boolean;
    { Public declarations }
  published
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property ProductTypeId: Integer read FProductTypeId write SetProductTypeId;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDialogProductType: TfrmDialogProductType;

implementation

uses uProductType, uTSCommonDlg, uConn;

{$R *.dfm}

function TfrmDialogProductType.cekProduk(aKodeBaru : string): Boolean;
var
  sKodeLama: string;
  i: Integer;
begin
  Result := False ;
  for i := 1 to frmProductType.strgGrid.RowCount - 1 do
  begin
     sKodeLama := frmProductType.strgGrid.Cells[0, i];
     if aKodeBaru = sKodeLama then
     begin
       Result := True;
       Break;
     end;
  end;
end;

{ TfrmDialogProductType }

procedure TfrmDialogProductType.SetFormMode(const Value: TFormMode);
begin
  FFormMode := Value;
end;

procedure TfrmDialogProductType.SetIsProcessSuccessfull(
  const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogProductType.SetProductTypeId(const Value: Integer);
begin
  FProductTypeId := Value;
end;

procedure TfrmDialogProductType.footerDialogMasterbtnSaveClick(
  Sender: TObject);
var
  IDLama: Integer;
begin
  inherited;
  if (FormMode = fmAdd) then
  begin
    FIsProcessSuccessfull := SaveProductType;
    if FIsProcessSuccessfull then
      Close;
  end
  else
  begin
    IDLama := StrToInt(frmProductType.strgGrid.cells[2,frmProductType.strgGrid.Row]);
    FTipeProduct.LoadByID(IDLama) ;
    FIsProcessSuccessfull := UpdateProductType;
    if FIsProcessSuccessfull then
      Close;
  end; // end if
end;

function TfrmDialogProductType.SaveProductType: boolean;
var
  aKode: string;
  ANama: string;

begin
  //=========R ==============
  result := false;
  if edtCode.Text='' then
  begin
    CommonDlg.ShowErrorEmpty('KODE');
    edtCode.SetFocus;
    Exit;
  end;
  if edtName.Text='' then
  begin
    CommonDlg.ShowErrorEmpty('NAME ');
    edtName.SetFocus;
    Exit;
  end;
  if cekProduk(Trim(UpperCase(edtCode.Text))) then
  begin
    CommonDlg.ShowMessage('Nama Produk ' + edtCode.Text + ' telah terdaftar');
    edtCode.SetFocus;
    Exit;
  end;

  aIDLokal := 0;
  aKode := UpperCase(edtCode.Text);
  ANama := UpperCase(edtName.Text);

  FTipeProduct.UpdateData(aIDLokal,aKode,ANama);

  if FTipeProduct.ExecuteGenerateSQL then
  begin
    cCommitTrans;
    Result := True
  end
  else
  begin
    cRollbackTrans;
    Result := False;
    CommonDlg.ShowMessage('Pengisian tipe barang gagal');
  end


end;

function TfrmDialogProductType.UpdateProductType: boolean;
var
  aIDLokal: Integer;
  aKode: string;
  ANama: string;
begin
  result := false;
  if edtCode.Text='' then
  begin
    CommonDlg.ShowErrorEmpty('CODE');
    edtCode.SetFocus;
    Exit;
  end;
  if edtName.Text='' then
  begin
    CommonDlg.ShowErrorEmpty('NAME');
    edtName.SetFocus;
    Exit;
  end;

  aIDLokal := FTipeProduct.ID ;
  aKode := UpperCase(edtCode.Text);
  ANama := UpperCase(edtName.Text);

  FTipeProduct.UpdateData(aIDLokal,aKode,ANama);

  if FTipeProduct.ExecuteGenerateSQL then
    Result := True
  else
  begin
    Result := False;
    CommonDlg.ShowMessage('Update data gagal');
  end;


end;

procedure TfrmDialogProductType.FormShow(Sender: TObject);
begin
  inherited;

  if (FFormMode = fmEdit) then
    ShowDataEdit(ProductTypeId)
  else
    PrepareAddData();
end;

procedure TfrmDialogProductType.ShowDataEdit(AProductTypeId: integer);
var
  data: TResultDataSet;
begin
  if not assigned(ProductType) then
    ProductType := TProductType.Create;

  data:= ProductType.SearchDataProductType(AProductTypeId);
  edtCode.Text := data.Fields[0].AsString;
  edtName.Text := data.Fields[1].AsString;

end;

procedure TfrmDialogProductType.PrepareAddData;
begin
  edtCode.Clear;
  edtName.Clear;
end;

procedure TfrmDialogProductType.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogProductType.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogProductType := nil;
end;

procedure TfrmDialogProductType.FormCreate(Sender: TObject);
begin
  inherited;
  FTipeProduct := TTipeProduk.Create(self);
end;

end.
