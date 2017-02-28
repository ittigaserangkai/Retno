unit ufrmDialogLokasi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls,
  StdCtrls, uRetnoUnit, ufrmLokasi, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxCurrencyEdit;

type
  TFormMode = (fmAdd, fmEdit);

  TfrmDialogLokasi = class(TfrmMasterDialog)
    edtCode: TEdit;
    lbl1: TLabel;
    Label1: TLabel;
    edtDescrp: TEdit;
    lbl2: TLabel;
    cbbType: TComboBox;
    chkIsActive: TCheckBox;
    lbl3: TLabel;
    lblCode: TLabel;
    edtName: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edRack: TEdit;
    edBay: TEdit;
    edShelve: TEdit;
    edPotition: TEdit;
    intedtCapacity: TcxCurrencyEdit;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FIsProcessSuccessfull: Boolean;
    FLokasiCode: string;
    FFormMode: TFormMode;
//    FNewLocation : TNewLocation;
    aKodeLama : String;
    { Private declarations }
//    function SaveLokasi: Boolean;
//    function UpdateLokasi: Boolean;
    procedure SetFormMode(const Value: TFormMode);
    procedure SetIsProcessSuccessfull(const Value: Boolean);
    procedure SetLokasiCode(const Value: string);
//    procedure showDataEdit();
//    procedure prepareAddData;
  public
    code, rack, bay, shelve, position, name, typeLok, descrp: string;
    capacity: Integer;
    isActive: SmallInt;
    { Public declarations }
  published
    property FormMode: TFormMode read FFormMode write SetFormMode;
    property LokasiCode: string read FLokasiCode write SetLokasiCode;
    property IsProcessSuccessfull: Boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDialogLokasi: TfrmDialogLokasi;

implementation

uses uTSCommonDlg, uConn;

{$R *.dfm}

procedure TfrmDialogLokasi.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogLokasi.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogLokasi := nil;
end;

procedure TfrmDialogLokasi.footerDialogMasterbtnSaveClick(Sender: TObject);
begin
{  if (FormMode = fmAdd) then
  begin
    FIsProcessSuccessfull := SaveLokasi;
    if FIsProcessSuccessfull then
      Close;
  end
  else
  begin
    FIsProcessSuccessfull := UpdateLokasi;
    if FIsProcessSuccessfull then
      Close;
  end;
        }

  if edtCode.Text = '' then
  begin
    CommonDlg.ShowError('Kode Belum Diisi');
    edtCode.SetFocus;
  end

  else if edRack.Text = '' then
  begin
    CommonDlg.ShowError('Rack Belum Diisi');
    edRack.SetFocus;
  end

  else if edBay.Text = '' then
  begin
    CommonDlg.ShowError('Bay Belum Diisi');
    edBay.SetFocus;
  end

  else if edShelve.Text = '' then
  begin
    CommonDlg.ShowError('Shelve Belum Diisi');
    edShelve.SetFocus;
  end

  else if edPotition.Text = '' then
  begin
    CommonDlg.ShowError('Potition Belum Diisi');
    edShelve.SetFocus;
  end

  else if edtName.Text = '' then
  begin
    CommonDlg.ShowError('Nama Belum Diisi');
    edtName.SetFocus;
  end

  else if edtDescrp.Text = '' then
  begin
    CommonDlg.ShowError('Description Belum Diisi');
    edtDescrp.SetFocus;
  end

  else
  begin
  if chkIsActive.Checked then isActive := 1
  else isActive := 0;

{  if FNewLocation.isKodeExits(edtCode.Text,aKodeLama, DialogUnit) then
  begin
    CommonDlg.ShowError('Data Sudah ada');
    exit;
  end;

  FNewLocation.UpdateData(edBay.Text,
                          intedtCapacity.Value,
                          edtDescrp.Text,
                          isActive,
                          edtCode.Text,
                          edtName.Text,
                          DialogUnit,
                          edPotition.Text,
                          edRack.Text,
                          edShelve.Text,
                          cbbType.Text);
  try
    if FNewLocation.ExecuteGenerateSQL(aKodeLama) then
    begin
      cCommitTrans;
      CommonDlg.ShowMessage('Data Berhasil disimpan');
      close;
    end
    else begin
      cRollbackTrans;
      CommonDlg.ShowError('Data gagal Disimpan');
    end;
    finally;
      cRollbackTrans;
    end;}
    frmLokasi.actRefreshLokasiExecute(self);
  end;
end;

procedure TfrmDialogLokasi.SetFormMode(const Value: TFormMode);
begin
  FFormMode := Value;
end;

procedure TfrmDialogLokasi.SetIsProcessSuccessfull(const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDialogLokasi.SetLokasiCode(const Value: string);
begin
  FLokasiCode := Value;
end;

procedure TfrmDialogLokasi.FormShow(Sender: TObject);
begin
  inherited;

  if (FFormMode = fmEdit) then
  begin
//    aKodeLama := frmLokasi.strgGrid.Cells[0,frmLokasi.strgGrid.Row];
    //ShowMessage(aKodeLama);
{    if FNewLocation.LoadByKode(aKodeLama) then
    begin
      edRack.Text := FNewLocation.Rack;
      edBay.Text := FNewLocation.Bay;
      edShelve.Text := FNewLocation.Shelve;
      edPotition.Text := FNewLocation.Position;
      edtCode.Text := FNewLocation.Kode;
      edtName.Text := FNewLocation.Nama;
      edtDescrp.Text := FNewLocation.Description;
      intedtCapacity.Value := FNewLocation.Capacity;
      cbbType.ItemIndex := cbbType.Items.IndexOf(FNewLocation.Tipe);
      chkIsActive.Checked := FNewLocation.isActive = 1;

    end else}
    begin
      aKodeLama := '';
      edRack.Text := '';
      edBay.Text := '';
      edShelve.Text := '';
      edPotition.Text := '';
      edtCode.Text := '';
      edtName.Text := '';
      edtDescrp.Text := '';
      intedtCapacity.Value := 0;
      cbbType.ItemIndex := 0;
      chkIsActive.Checked := False;
    end;
  end;
end;

//procedure TfrmDialogLokasi.showDataEdit();
//begin
//  edtCode.Text    := code;
//  edRack.Text     := rack;
//  edBay.Text      := bay;
//  edShelve.Text   := shelve;
//  edPotition.Text := position;
//  edtName.Text    := name;
//  cbbType.Text    := typeLok;
//  edtDescrp.Text  := descrp;
//  intedtCapacity.Value := capacity;
//
//  if isActive = 1 then chkIsActive.Checked := True
//  else chkIsActive.Checked := False;
//
//end;

//procedure TfrmDialogLokasi.prepareAddData;
//begin
//  edtCode.Text := '';
//  edtName.Text := '';
//  cbbType.ItemIndex := 0;
//  edtDescrp.Text := '';
//  intedtCapacity.Value := 0;
//  chkIsActive.Checked := True;
//end;

//function TfrmDialogLokasi.SaveLokasi: Boolean;
//var intActive: SmallInt;
//begin
//  Result := False;
//
//  if edtName.Text='' then
//  begin
//    CommonDlg.ShowErrorEmpty('NAME');
//    edtName.SetFocus;
//    Exit;
//  end;
//
//  if chkIsActive.Checked then intActive := 1
//  else intActive := 0;
//
//  if not assigned(Lokasi) then
//    Lokasi := TLokasi.Create;
//
//  Result:= Lokasi.InsertLokasi(DialogUnit, edRack.Text, edBay.Text, edShelve.Text, edPotition.Text,
//                               edtName.Text,cbbType.Text, edtDescrp.Text,intActive,intedtCapacity.Value,
//                               FLoginId);
//end;

//function TfrmDialogLokasi.UpdateLokasi: Boolean;
//var intActive: Integer;
//begin
//  Result := false;
//
//  if edtDescrp.Text='' then
//  begin
//    CommonDlg.ShowErrorEmpty('DESCRIPTIONS');
//    edtDescrp.SetFocus;
//    Exit;
//  end;
//
//  if chkIsActive.Checked then intActive := 1
//  else intActive := 0;
//
//  if not assigned(Lokasi) then
//    Lokasi := TLokasi.Create;
//
//  Result:=Lokasi.UpdateLokasi(DialogUnit, edRack.Text, edBay.Text, edShelve.Text, edPotition.Text,
//                              edtName.Text,cbbType.Text,edtDescrp.Text,intActive,intedtCapacity.Value,
//                              FLoginId,LokasiCode);
//end;

procedure TfrmDialogLokasi.FormCreate(Sender: TObject);
begin
  inherited;
//  FNewLocation := TNewLocation.Create(self);
  aKodeLama := '';
end;

end.
