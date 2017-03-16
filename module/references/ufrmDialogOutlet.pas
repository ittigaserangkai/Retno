unit ufrmDialogOutlet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls, 
  StdCtrls, uRetnoUnit, System.Actions, Vcl.ActnList, ufraFooterDialog3Button,
  uInterface, uClientClasses, uDMClient, uModOutlet;

type
  TFormMode = (fmAdd, fmEdit);

  TfrmDialogOutlet = class(TfrmMasterDialog, iCRUDABLE)
    edtCode: TEdit;
    lbl1: TLabel;
    Label1: TLabel;
    edtName: TEdit;
    Label2: TLabel;
    edtDescription: TEdit;
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FCrud: TCrudClient;
    FIsProcessSuccessfull: Boolean;
    FOutletId: Integer;
    FFormMode: TFormMode;
    FModOutlet: TModOutlet;
//    FNewOutlet: TNewSalesOutlet;
    IDLokal: Integer;
    function GetCrud: TCrudClient;
    function GetModOutlet: TModOutlet;
    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: Boolean);
    procedure SetOutletId(const Value: Integer);
    procedure prepareAddData;
    procedure SimpanData;
    property Crud: TCrudClient read GetCrud write FCrud;
    property ModOutlet: TModOutlet read GetModOutlet write FModOutlet;
  public
    procedure LoadData(AID: String);
    { Public declarations }
  published
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property OutletId: Integer read FOutletId write SetOutletId;
    property IsProcessSuccessfull: Boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDialogOutlet: TfrmDialogOutlet;

implementation

uses uTSCommonDlg, ufrmOutlet, uAppUtils, uConstanta;

{$R *.dfm}

procedure TfrmDialogOutlet.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if not TAppUtils.ConfirmHapus then Exit;
  Try
    DMClient.CrudClient.DeleteFromDB(ModOutlet);
    Self.ModalResult := mrOK;
    TAppUtils.Information(CONF_DELETE_SUCCESSFULLY);
  Except
    TAppUtils.Error(ER_DELETE_FAILED);
    Raise
  End;
end;

procedure TfrmDialogOutlet.actSaveExecute(Sender: TObject);
begin
  inherited;
  if edtCode.Text = '' then
  begin
    CommonDlg.ShowError('Data Kode Belum diisi');
    edtCode.SetFocus;
    Exit;
  end;

  if edtName.Text = '' then
  begin
    CommonDlg.ShowError(' Data Nama Belum diisi');
    edtName.SetFocus;
    Exit;
  end;

  SimpanData();
end;

procedure TfrmDialogOutlet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogOutlet.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogOutlet := nil;
end;

procedure TfrmDialogOutlet.SetFormMode(const Value: TFormMode);
begin
  FFormMode := Value;
end;

procedure TfrmDialogOutlet.SetIsProcessSuccessfull(const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogOutlet.SetOutletId(const Value: integer);
begin
  FOutletId := Value;
end;

procedure TfrmDialogOutlet.FormShow(Sender: TObject);
begin
  inherited;
   if (FFormMode = fmEdit) then
   begin
    IDLokal := FOutletId;
//    if FNewOutlet.LoadByID(IDLokal) then
    begin
//      edtCode.Text := FNewOutlet.Kode;
//      edtName.Text := FNewOutlet.Nama;
    end
   end else begin
    IDLokal := 0;
    prepareAddData();
  end;  
end;

procedure TfrmDialogOutlet.prepareAddData;
begin
  edtCode.Clear;
  edtName.Clear;
end;

procedure TfrmDialogOutlet.FormCreate(Sender: TObject);
begin
  inherited;
//  FNewOutlet := TNewSalesOutlet.Create(Self);
end;

function TfrmDialogOutlet.GetCrud: TCrudClient;
begin
  if not Assigned(FCrud) then
    fCrud := TCrudClient.Create(DMClient.RestConn, FALSE);
  Result := FCrud;
end;

function TfrmDialogOutlet.GetModOutlet: TModOutlet;
begin
  if not Assigned(FModOutlet) then FModOutlet := TModOutlet.Create;
  Result := FModOutlet;
end;

procedure TfrmDialogOutlet.LoadData(AID: String);
begin
  if Assigned(fModOutlet) then FreeAndNil(fModOutlet);
  fModOutlet := Crud.Retrieve(TModOutlet.ClassName, AID) as TModOutlet;

  edtCode.Text        := ModOutlet.OUTLET_CODE;
  edtName.Text        := ModOutlet.OUTLET_NAME;
  edtDescription.Text := ModOUtlet.OUTLET_DESCRIPTION;
end;

procedure TfrmDialogOutlet.SimpanData;
begin
  ModOutlet.OUTLET_CODE        := edtCode.Text;
  ModOutlet.OUTLET_NAME        := edtName.Text;
  ModOutlet.OUTLET_DESCRIPTION := edtDescription.Text;
  try
    Crud.SaveToDB(ModOutlet);
    TAppUtils.Information('Simpan Berhasil.');
    Self.ModalResult := mrOK;
  except
    TAppUtils.Error('Gagal Menyimpan Data.');
    Raise
  end;
end;

end.
