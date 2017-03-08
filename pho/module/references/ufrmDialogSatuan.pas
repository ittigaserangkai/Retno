unit ufrmDialogSatuan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls,
  StdCtrls, uRetnoUnit, ufraFooterDialog3Button;

type
  TFormMode = (fmAdd, fmEdit);

  TfrmDialogSatuan = class(TfrmMasterDialog)
    lbl1: TLabel;
    edtCode: TEdit;
    Lbl2: TLabel;
    edtName: TEdit;
    lbl3: TLabel;
    cbbGroup: TComboBox;
    Label1: TLabel;
    cbbUrutan: TComboBox;
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FIsProcessSuccessfull: boolean;
    FSatuanId: string;
    FFormMode: TFormMode;
//    FNewUOM : TNewUOM;
    FUOMLama : String;
    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: Boolean);
    procedure SetSatuanId(const Value: string);
    procedure prepareAddData;
    procedure SetUrutanUOM;
  public
    { Public declarations }
  published
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property SatuanId: string read FSatuanId write SetSatuanId;
    property IsProcessSuccessfull: Boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDialogSatuan: TfrmDialogSatuan;

implementation

uses uTSCommonDlg, uConn, DB, ufrmsatuan;

{$R *.dfm}

procedure TfrmDialogSatuan.SetFormMode(const Value: TFormMode);
begin
  FFormMode := Value;
end;

procedure TfrmDialogSatuan.SetIsProcessSuccessfull(const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogSatuan.SetSatuanId(const Value: string);
begin
  FSatuanId := Value;
end;

procedure TfrmDialogSatuan.prepareAddData;
begin
  edtCode.Clear;
  edtName.Clear;
  cbbGroup.ItemIndex := 0;
  cbbUrutan.Items.Clear;

end;

procedure TfrmDialogSatuan.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogSatuan := nil;
end;

procedure TfrmDialogSatuan.FormShow(Sender: TObject);
begin
  inherited;
  if (FFormMode = fmEdit) then
  begin
    FUOMLama := SatuanId;
  end
  else
  begin
    FUOMLama := '';
  end;

  prepareAddData();
  SetUrutanUOM;

end;

procedure TfrmDialogSatuan.footerDialogMasterbtnSaveClick(Sender: TObject);
//var
//  TUom: TNewUOM;
begin
  inherited;
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

  {
  TUom := TNewUOM.Create(Self);
  try

    if (FUOMLama <> edtCode.Text) then
    begin
      if TUom.LoadByUOM(edtCode.Text) then
      begin
        CommonDlg.ShowErrorExist('CODE',edtCode.Text);
        edtCode.SetFocus;
        Exit;
      end;
    end;
  finally
    FreeAndNil(TUom);
  end;

  FNewUOM.UpdateData(
    cbbGroup.Text,
    edtName.Text,
    edtCode.Text,
    StrToInt(cbbUrutan.Text));

  try
    if FNewUOM.ExecuteGenerateSQL(FUOMLama) then
    begin
      cCommitTrans;
      CommonDlg.ShowMessage('Berhasil Menyimpan Data');
      Close;
    end
    else
    begin
      cRollbackTrans;
      CommonDlg.ShowMessage('Data Gagal disimpan');
    end;
  finally
    cRollbackTrans;
  end;
   }
  frmSatuan.actRefreshSatuanExecute(sender);
end;

procedure TfrmDialogSatuan.FormCreate(Sender: TObject);
begin
  inherited;
//  FNewUOM := TNewUOM.Create(self);
  FUOMLama := '';
end;

procedure TfrmDialogSatuan.SetUrutanUOM;
var
  iData: Integer;
  isFound : Boolean;
  i, m, j : Integer;
begin
//  iData :=   FNewUOM.GetUrutanTerakhir();

  for i := 1 to iData do
  begin
    isFound := False;
//    for j := 1 to frmSatuan.cxGridViewSatuan.datacontroller.RowCount - 1 do
//    begin
////      if IntToStr(i) = frmSatuan.strgGrid.Cells[3,j] then
//      begin
//        isFound := True;
//        Continue;
//      end;
//    end ;

    if not isFound then
    begin
      cbbUrutan.Items.Add(IntToStr(i));
    end;
  end;

  cbbUrutan.Items.Add(IntToStr(iData + 1));


  if FUOMLama <> '' then
  begin
{    if FNewUOM.LoadByUOM(FUOMLama) then
    begin
      edtCode.Text          := FNewUOM.UOM;
      edtName.Text          := FNewUOM.Nama;

      cbbGroup.ItemIndex    := cbbGroup.Items.IndexOf(FNewUOM.Group);
      i := 0;
      while i < cbbUrutan.Items.Count  do
      begin
        if TryStrToInt(Trim(cbbUrutan.Items.Strings[i]), j) then
        begin
          if (j > FNewUOM.Urutan) then
          begin
            if i > 0 then
              m := i - 1
            else
              m := i;
  
            cbbUrutan.Items.Insert(m, IntToStr(FNewUOM.Urutan));
            cbbUrutan.ItemIndex   := m;
            Break;
          end;
        end;
        Inc(i);
      end;//
    end;   }
  end;


end;

end.
