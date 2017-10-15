unit ufrmKuponBotol;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterBrowse, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  System.Actions, Vcl.ActnList, ufraFooter4Button, Vcl.StdCtrls, cxButtons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC, Vcl.ExtCtrls, cxCurrencyEdit, cxButtonEdit,
  Datasnap.DBClient;

type
  TfrmKuponBotol = class(TfrmMasterBrowse)
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    dtpTanggal: TcxDateEdit;
    edTransactionNo: TcxButtonEdit;
    edtKodeMember: TcxTextEdit;
    edtMemberName: TcxTextEdit;
    edtPOSTransNo: TcxTextEdit;
    edtStatus: TcxTextEdit;
    edtKeterangan: TcxTextEdit;
    cxLabel8: TcxLabel;
    curredtTotalPrice: TcxCurrencyEdit;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edTransactionNoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    procedure ParseDataDetilTransaksiKuponBotol(ATransNo: string);
  public
  end;

var
  frmKuponBotol: TfrmKuponBotol;

implementation

uses
  ufrmCXLookup;

{$R *.dfm}

procedure TfrmKuponBotol.FormDestroy(Sender: TObject);
begin
  inherited;
  frmKuponBotol := nil;
end;

procedure TfrmKuponBotol.edTransactionNoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;

  with TfrmCXLookup.Execute('Look Up Kupon Botol', 'TDSProvider.KuponBotol_GetDSLookUp',
    dtpTanggal.Date, dtpTanggal.Date) do
  begin
    Try
      if ShowModal = mrOK then
      begin
        edTransactionNo.EditValue := Data.FieldByName('NO_VOUCHER').AsString;
        ParseDataDetilTransaksiKuponBotol(edTransactionNo.Text);
      end;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmKuponBotol.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption:= 'TRANSAKSI KUPON BOTOL';
end;

procedure TfrmKuponBotol.ParseDataDetilTransaksiKuponBotol(ATransNo: string);
begin

end;

end.
