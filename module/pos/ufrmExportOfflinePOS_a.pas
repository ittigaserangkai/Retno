unit ufrmExportOfflinePOS_a;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, ComCtrls;

type
  TfrmExportOfflinePOS_a = class(TfrmMaster)
    Panel1: TPanel;
    dtTanggal: TDateTimePicker;
    Label1: TLabel;
    btnExport: TButton;
    mmoExport: TMemo;
    dlgSave: TSaveDialog;
    procedure FormShow(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FUnitID: Integer;
    { Private declarations }
  public

    property UnitID: Integer read FUnitID write FUnitID;
    { Public declarations }
  end;

var
  frmExportOfflinePOS_a: TfrmExportOfflinePOS_a;

implementation

uses urmsunit, uExportOfflinePOS, ugTSUICommonDlg;

{$R *.dfm}

procedure TfrmExportOfflinePOS_a.FormShow(Sender: TObject);
begin
  inherited;
  dtTanggal.DateTime := cGetServerTime;
end;

procedure TfrmExportOfflinePOS_a.btnExportClick(Sender: TObject);
begin
  inherited;
  if UnitID <= 0 then
  begin
    CommonDlg.ShowError('Unit Belum Dipilih');
    Close;
  end;
  mmoExport.Clear;
  //LoadDataSetupPOS(UnitID, dtTanggal.DateTime, mmoExport);
  //LoadDataBeginningBalance(UnitID, dtTanggal.DateTime,mmoExport);
  LoadDataTransaksi(UnitID, dtTanggal.DateTime,mmoExport);
  LoadDataTransaksiDetil(UnitID, dtTanggal.DateTime,mmoExport);
  LoadDataTransaksiCard(UnitID, dtTanggal.DateTime,mmoExport);
  LoadDataTransaksiVoucherLain(UnitID, dtTanggal.DateTime,mmoExport);
  LoadDataTransaksiVoucherAssalam(UnitID, dtTanggal.DateTime,mmoExport);
  LoadDataTransaksiKuponBotol(UnitID, dtTanggal.DateTime,mmoExport);

  if dlgSave.Execute then
  begin
    mmoExport.Lines.SaveToFile(dlgSave.FileName);
  end;
end;


procedure TfrmExportOfflinePOS_a.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    Close;
end;

end.
