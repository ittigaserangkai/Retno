unit ufrmInputRekening;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMaster, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, cxMaskEdit, cxSpinEdit, cxTextEdit, cxStyles,
  cxClasses, Vcl.ExtCtrls, uModRekening, uDmClient, UClientClasses, UAppUtils, uDxutils,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, uDbUtils, DbClient, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBExtLookupComboBox;


type
  TfrmInputRekening = class(TfrmMaster)
    Label2: TLabel;
    edDesciption: TcxTextEdit;
    Label3: TLabel;
    Label4: TLabel;
    edName: TcxTextEdit;
    edLevel: TcxSpinEdit;
    Label5: TLabel;
    edRekCode: TcxTextEdit;
    Label6: TLabel;
    pnlFooter: TPanel;
    btnSave: TcxButton;
    btnClose: TcxButton;
    cxButton1: TcxButton;
    cxLookupRekening: TcxExtLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    FCDSRekening: tclientDataset;
    FCrud: TCrudClient;
    FDsProvider: TDSProviderClient;
    FModRekening: TModRekening;
    function GetCDSRekening: tclientDataset;
    function GetCrud: TCrudClient;
    function GetDsProvider: TDSProviderClient;
    function GetModRekening: TModRekening;
    procedure SimpanData;
    property CDSRekening: tclientDataset read GetCDSRekening write FCDSRekening;
    property Crud: TCrudClient read GetCrud write FCrud;
    property DsProvider: TDSProviderClient read GetDsProvider write FDsProvider;
    { Private declarations }
  public
    { Public declarations }
  published
    property ModRekening: TModRekening read GetModRekening write FModRekening;
  end;

var
  frmInputRekening: TfrmInputRekening;

implementation

{$R *.dfm}

procedure TfrmInputRekening.FormCreate(Sender: TObject);
begin
  inherited;
    cxLookupRekening.Properties.LoadFromCDS(cdsrekening,'REK_CODE', 'REK_NAME', ['ID'] , self);
    cxLookupRekening.Properties.SetMultiPurposeLookup;
end;

procedure TfrmInputRekening.btnSaveClick(Sender: TObject);
begin
  inherited;
  SimpanData;
end;

function TfrmInputRekening.GetCDSRekening: tclientDataset;
begin
  if not assigned(FCDSRekening) then
    fCDSRekening := Tdbutils.DSToCDS(DsProvider.Rekening_GetDSOverview(), self);
  Result := FCDSRekening;
end;

function TfrmInputRekening.GetCrud: TCrudClient;
begin
  if not assigned(fCrud) then
    fCrud := TCrudClient.Create(DmClient.RestConn,False);
  Result := FCrud;
end;

function TfrmInputRekening.GetDsProvider: TDSProviderClient;
begin
  if not assigned(FDsProvider) then
    FDsProvider := TDSProviderClient.Create(DmClient.RestConn,False);
  Result := FDsProvider;
end;

function TfrmInputRekening.GetModRekening: TModRekening;
begin
  if not assigned(fModRekening) then
    FModRekening := TModRekening.Create;
  Result := FModRekening;
end;

procedure TfrmInputRekening.SimpanData;
begin
  ModRekening.REK_CODE := edRekCode.Text;
  ModRekening.REK_DESCRIPTION := edDesciption.Text;
  ModRekening.REK_PARENT_CODE := cxLookupRekening.EditValue;
  ModRekening.REK_NAME := edName.Text;
  ModRekening.REK_LEVEL := edLevel.Value;



  try
    Crud.SaveToDB(ModRekening);
    TAppUtils.Information('Berhasil bro');
  except
    TAppUtils.Error('gagal');
    raise
  end;
end;

end.
