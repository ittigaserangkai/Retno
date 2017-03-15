unit ufrmDialogSupplierType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls, 
  StdCtrls, uRetnoUnit, System.Actions, Vcl.ActnList, ufraFooterDialog3Button;

type
  TFormMode = (fmAdd, fmEdit);

  TfrmDialogSupplierType = class(TfrmMasterDialog)
    edtName: TEdit;
    lbl1: TLabel;
    edtCode: TEdit;
    lbl2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FIsProcessSuccessfull: Boolean;
    FSupplierTypeId: Integer;
    FFormMode: TFormMode;
//    FNewSupplierType : TNewTipeSupplier;
    IDLokal : Integer;
    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: Boolean);
    procedure SetSupplierTypeId(const Value: Integer);
    procedure prepareAddData;
  public
    { Public declarations }
  published
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property SupplierTypeId: Integer read FSupplierTypeId write SetSupplierTypeId;
    property IsProcessSuccessfull: Boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDialogSupplierType: TfrmDialogSupplierType;

implementation
 uses uTSCommonDlg,  ufrmSupplierType;
{$R *.dfm}

procedure TfrmDialogSupplierType.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogSupplierType.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogSupplierType := nil;
end;

procedure TfrmDialogSupplierType.prepareAddData;
begin
  edtCode.Clear;
  edtName.Clear;
end;

procedure TfrmDialogSupplierType.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin
{  if (FormMode = fmAdd) then
  begin
    FIsProcessSuccessfull := SaveSupplierType;
    if FIsProcessSuccessfull then
      Close;
  end
  else
  begin
    FIsProcessSuccessfull := UpdateSupplierType;
    if FIsProcessSuccessfull then
      Close;
  end; // end if       }

  if edtCode.Text = '' then
  begin
    CommonDlg.ShowError('Data Kode Belum diisi');
    edtCode.SetFocus;
    Exit;
  end;

  if edtName.Text = '' then
  begin
    CommonDlg.ShowError('Nama Belum diisi');
    edtName.SetFocus;
    Exit;
  end;
  {
  if FNewSupplierType.isKodeExits(edtCode.Text,FNewSupplierType.ID) then
  begin
    CommonDlg.ShowError('Code ' + edtCode.Text + ' Sudah Ada');
    edtCode.SetFocus;
    Exit;
  end;
  
  FNewSupplierType.UpdateData(IDLokal,
                              edtCode.Text,
                              edtName.Text
                              );

  try
    if FNewSupplierType.ExecuteGenerateSQL(IDLokal) then
    begin
      cCommitTrans;
      CommonDlg.ShowMessage('Data Sudah disimpan');
      frmSupplierType.actRefreshSupplierTypeExecute(self);
      Close;
    end
    else
    begin
      cRollbackTrans;
      CommonDlg.ShowError('Data Gagal disimpan');
      Exit;
    end;
  Finally;
    cRollbackTrans;
  end;
  }
end;

procedure TfrmDialogSupplierType.SetFormMode(const Value: TFormMode);
begin
  FFormMode := Value;
end;

procedure TfrmDialogSupplierType.SetIsProcessSuccessfull(
  const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogSupplierType.SetSupplierTypeId(const Value: integer);
begin
  FSupplierTypeId := Value;
end;

procedure TfrmDialogSupplierType.FormShow(Sender: TObject);
begin
  inherited;
 if (FFormMode = fmEdit) then
  begin
    IDLokal := FSupplierTypeId;
    {if FNewSupplierType.LoadByID(IDLokal) then
    begin
      edtCode.Text := FNewSupplierType.Kode;
      edtName.Text := FNewSupplierType.Nama;
    end
    end else begin
      IDLokal := 0;
      prepareAddData();
      }
  end;
end;

procedure TfrmDialogSupplierType.FormCreate(Sender: TObject);
begin
  inherited;
//  FNewSupplierType := TNewTipeSupplier.create(self);
end;

end.
