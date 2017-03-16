unit ufrmDialogProductType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, StdCtrls, ufraFooterDialog2Button, ExtCtrls,
  ufrmProductType, uRetnoUnit, uModBarang,  uDMClient, uClientClasses,
  System.Actions, Vcl.ActnList, ufraFooterDialog3Button, uInterface;

type     
  TFormMode = (fmAdd, fmEdit);
  
  TfrmDialogProductType = class(TfrmMasterDialog, ICrudable)
    lbl1: TLabel;
    lbl2: TLabel;
    edtCode: TEdit;
    edtName: TEdit;
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    FIsProcessSuccessfull: boolean;
    FProductTypeId: Integer;
    FFormMode: TFormMode;
//    FTipeProduct : TTipeProduk;
    aIDLokal : Integer;
    FCrud: TCrudClient;
    FModTipeBarang: TModTipeBarang;
    function GetCrud: TCrudClient;
    function GetModTipeBarang: TModTipeBarang;
    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: boolean);
    procedure SetProductTypeId(const Value: Integer);
    procedure ShowDataEdit(AProductTypeId: integer);
    procedure PrepareAddData();
    function SaveProductType: boolean;
    procedure SimpanData;
    function UpdateProductType: boolean;
    property Crud: TCrudClient read GetCrud write FCrud;
    property ModTipeBarang: TModTipeBarang read GetModTipeBarang write
        FModTipeBarang;

  public
    function cekProduk(aKodeBaru : string): Boolean;
    procedure LoadData(ID: String);
    { Public declarations }
  published
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property ProductTypeId: Integer read FProductTypeId write SetProductTypeId;
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDialogProductType: TfrmDialogProductType;

implementation

uses uTSCommonDlg, uConn, DB, uApputils, uConstanta;

{$R *.dfm}

procedure TfrmDialogProductType.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if not TAppUtils.ConfirmHapus then Exit;
  Try
    DMClient.CrudClient.DeleteFromDB(ModTipeBarang);
    Self.ModalResult := mrOK;
    TAppUtils.Information(CONF_DELETE_SUCCESSFULLY);
  Except
    TAppUtils.Error(ER_DELETE_FAILED);
    Raise
  End;
end;

procedure TfrmDialogProductType.actSaveExecute(Sender: TObject);
begin
  inherited;
  SimpanData();
end;

function TfrmDialogProductType.cekProduk(aKodeBaru : string): Boolean;
var
  sKodeLama: string;
  i: Integer;
begin
  Result := False ;
  {for i := 1 to frmProductType.strgGrid.RowCount - 1 do
  begin
     sKodeLama := frmProductType.strgGrid.Cells[0, i];
     if aKodeBaru = sKodeLama then
     begin
       Result := True;
       Break;
     end;
  end;
  }
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
  {
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
   }

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

//  aIDLokal := FTipeProduct.ID ;
  aKode := UpperCase(edtCode.Text);
  ANama := UpperCase(edtName.Text);

//  FTipeProduct.UpdateData(aIDLokal,aKode,ANama);

//  if FTipeProduct.ExecuteGenerateSQL then
    Result := True;
//  else
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
  data: TDataSet;
begin
//  if not assigned(ProductType) then
//    ProductType := TProductType.Create;
//
//  data:= ProductType.SearchDataProductType(AProductTypeId);
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

function TfrmDialogProductType.GetCrud: TCrudClient;
begin
  if not Assigned(FCrud) then
    fCrud := TCrudClient.Create(DMClient.RestConn, FALSE);
  Result := FCrud;
end;

function TfrmDialogProductType.GetModTipeBarang: TModTipeBarang;
begin
  if not Assigned(FModTipeBarang) then
    fModTipeBarang := TModTipeBarang.Create();
  Result := FModTipeBarang;
end;

procedure TfrmDialogProductType.LoadData(ID: String);
begin
  if Assigned(fModTipeBarang) then FreeAndNil(fModTipeBarang);
  fModTipeBarang := Crud.Retrieve(TModTipeBarang.ClassName, ID) as TModTipeBarang;

  edtCode.Text := ModTipeBarang.TPBRG_CODE;
  edtName.Text := ModTipeBarang.TPBRG_NAME;
end;

procedure TfrmDialogProductType.SimpanData;
begin
  MODTipeBarang.TPBRG_CODE := edtCode.Text;
  MODTipeBarang.TPBRG_NAME := edtName.Text;

  try
    Crud.SaveToDB(MODTipeBarang);
    TAppUtils.Information('Simpan Berhasil.');
    Self.ModalResult := mrOk;
  except
    TAppUtils.Error('Gagal Menyimpan Data.');
    Raise
  end;
end;

end.
