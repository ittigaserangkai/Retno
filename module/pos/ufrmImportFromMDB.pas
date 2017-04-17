unit ufrmImportFromMDB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, uTSCommonDlg, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxButtonEdit;

type
  TfrmImportFromMDB = class(TfrmMaster)
    Panel1: TPanel;
    btnImport: TButton;
    mmoImport: TMemo;
    OpenDialog1: TOpenDialog;
    Label1: TLabel;
    edtFileName: TcxButtonEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnImportClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure edtFileNamePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
//    FCabang: TCabang;
//    FCategory: TCategory;
    FCompID: Integer;
//    FDivisi: TDivisi;
//    FHargaJual: THargaJual;
//    FMasterItemBarang: TMasterItemBarang;
    FPosCode: string;
//    FRegional: TRegional;
//    FSubCategory: TSubCategory;
    FUnitID: Integer;
    FUserID: Integer;
    function IsImportSuccess: Boolean;
    function IsParameterValid: Boolean;
  public
    property CompID: Integer read FCompID write FCompID;
    property PosCode: string read FPosCode write FPosCode;
    property UnitID: Integer read FUnitID write FUnitID;
    property UserID: Integer read FUserID write FUserID;
  end;

var
  frmImportFromMDB: TfrmImportFromMDB;

implementation

{$R *.dfm}

procedure TfrmImportFromMDB.FormCreate(Sender: TObject);
begin
  inherited;
  {
  FRegional := TRegional.Create(Self);
  FCabang := TCabang.Create(Self);
  FDivisi := TDivisi.Create(Self);
  FCategory := TCategory.Create(Self);
  FSubCategory := TSubCategory.Create(Self);
  FMasterItemBarang := TMasterItemBarang.Create(Self);
  FHargaJual := THargaJual.Create(Self);
  }
end;

procedure TfrmImportFromMDB.btnImportClick(Sender: TObject);
begin
  inherited;
  if IsParameterValid then
  begin
    mmoImport.Clear;
    if IsImportSuccess then
      CommonDlg.ShowMessage('Import Data Sukses')
    else
      CommonDlg.ShowError('Import Data Gagal');
  end;
end;

procedure TfrmImportFromMDB.edtFileNamePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  if OpenDialog1.Execute then
  begin
    edtFileName.Text := OpenDialog1.FileName;
  end;

end;

procedure TfrmImportFromMDB.FormKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmImportFromMDB.FormShow(Sender: TObject);
begin
  inherited;
//  ClearByTag(Self, [0]);
end;

function TfrmImportFromMDB.IsImportSuccess: Boolean;
var
  sSQL: string;
begin
  Result := False;
  Self.Enabled := False;
  {
  try

    mmoImport.Lines.Add('1. Importing Regional ...');
    if FRegional.ImportMDBtoIB(edtFileName.Text, UnitID) then
    begin
      cCommitTrans;
      mmoImport.Lines.Add('   Sukses Import Regional');
    end else
    begin
      mmoImport.Lines.Add('   Gagal Import Regional');
      Exit;
    end;

    mmoImport.Lines.Add('');
    mmoImport.Lines.Add('2. Importing Cabang ...');
    if FCabang.ImportMDBtoIB(edtFileName.Text, UserID, UnitID, CompID) then
    begin
      cCommitTrans;
      mmoImport.Lines.Add('   Sukses Import Cabang');
    end else
    begin
      mmoImport.Lines.Add('   Gagal Import Cabang');
      Exit;
    end;

    mmoImport.Lines.Add('');
    mmoImport.Lines.Add('3. Importing Divisi ...');
    if FDivisi.ImportMDBtoIB(edtFileName.Text) then
    begin
      cCommitTrans;
      mmoImport.Lines.Add('   Sukses Import Divisi');
    end else
    begin
      mmoImport.Lines.Add('   Gagal Import Divisi');
      Exit;
    end;

    mmoImport.Lines.Add('');
    mmoImport.Lines.Add('4. Importing Category ...');
    if FCategory.ImportMDBtoIB(edtFileName.Text, CompID) then
    begin
      cCommitTrans;
      mmoImport.Lines.Add('   Sukses Import Category');
    end else
    begin
      mmoImport.Lines.Add('   Gagal Import Category');
      Exit;
    end;

    mmoImport.Lines.Add('');
    mmoImport.Lines.Add('5. Importing SubCategory ...');
    if FSubCategory.ImportMDBtoIB(edtFileName.Text) then
    begin
      cCommitTrans;
      mmoImport.Lines.Add('   Sukses Import SubCategory');
    end else
    begin
      mmoImport.Lines.Add('   Gagal Import SubCategory');
      Exit;
    end;

    mmoImport.Lines.Add('');
    mmoImport.Lines.Add('6. Importing MasterItemBarang ...');
    if FMasterItemBarang.ImportMDBtoIB(edtFileName.Text, UserID, UnitID) then
    begin
      cCommitTrans;
      mmoImport.Lines.Add('   Sukses Import MasterItemBarang');
    end else
    begin
      mmoImport.Lines.Add('   Gagal Import MasterItemBarang');
      Exit;
    end;

    mmoImport.Lines.Add('');
    mmoImport.Lines.Add('7. Importing HargaJual ...');
    if FHargaJual.ImportMDBtoIB(edtFileName.Text, UnitID) then
    begin
      cCommitTrans;
      mmoImport.Lines.Add('   Sukses Import HargaJual');
    end else
    begin
      mmoImport.Lines.Add('   Gagal Import HargaJual');
      Exit;
    end;

    mmoImport.Lines.Add('');
    mmoImport.Lines.Add('8. Insert LOG ...');
    sSQL  := 'insert into TLOGEXIMMDB ( '
          + ' LOG_DATE, LOG_DATEBYUSER, LOG_UNIT, LOG_POSCODE, LOG_ISEXPORT '
          + ' ) values( '
          + Quot(FormatDateTime('MM-DD-YYYY hh:mm:ss', cGetServerTime))
          + ', ' + Quot(FormatDateTime('MM-DD-YYYY hh:mm:ss', cGetServerTime))
          + ', ' + IntToStr(UnitID)
          + ', ' + Quot(POSCode)
          + ', 0 );';
    if cExecSQL(sSQL) then
    begin
      cCommitTrans;
      mmoImport.Lines.Add('   Success Insert LOG');
    end else
    begin
      mmoImport.Lines.Add('   Gagal Insert LOG');
      Exit;
    end;

    Result := True;
  finally
    cRollbackTrans;
    Self.Enabled := True;
  end;
  }
end;

function TfrmImportFromMDB.IsParameterValid: Boolean;
begin
  Result := False;
  if CompID <= 0 then
    CommonDlg.ShowMessage('Company belum dipilih')
  else
  if UnitID <= 0 then
    CommonDlg.ShowMessage('Unit belum dipilih')
  else
  if UserID <= 0 then
    CommonDlg.ShowMessage('User tidak valid')
  else
  if Trim(edtFileName.Text) = '' then
    CommonDlg.ShowMessage('File yang akan diimport belum dipilih')
  else
    Result := True;
end;

end.
