unit ufrmSettingKoneksi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxLabel,
  cxTextEdit, cxGroupBox, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
  cxSpinEdit;

type
  TfrmSettingKoneksi = class(TfrmMasterDialog)
    cxGroupBox1: TcxGroupBox;
    edServer: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    gbStore: TcxGroupBox;
    cxLabel3: TcxLabel;
    edUser: TcxTextEdit;
    cxLabel4: TcxLabel;
    edPassword: TcxTextEdit;
    btnTest: TcxButton;
    cxLookupCabang: TcxExtLookupComboBox;
    cxLabel5: TcxLabel;
    edPort: TcxSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure btnTestClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure UpdateConn;
    { Public declarations }
  end;

var
  frmSettingKoneksi: TfrmSettingKoneksi;

implementation

uses
  uDMClient, Datasnap.DSClientRest, uAppUtils, uDXUtils;

{$R *.dfm}

procedure TfrmSettingKoneksi.FormCreate(Sender: TObject);
var
  lPort: Integer;
begin
  inherited;
  Try
    cxLookupCabang.LoadFromDS(
      DMClient.DSProviderClient.AutUnit_GetDSLookup,
      'AUT$UNIT_ID' , 'UNT_NAME',
      Self
    );
  except
  End;


  edServer.Text := TAppUtils.BacaRegistry('server');

  lPort := 0;
  TryStrToInt(TAppUtils.BacaRegistry('port'), lPort);
  edPort.Value := lPort;

  edUser.Text := TAppUtils.BacaRegistry('user');
  edPassword.Text := TAppUtils.BacaRegistry('password');
  cxLookupCabang.EditValue := TAppUtils.BacaRegistry('UnitStore');

end;

procedure TfrmSettingKoneksi.actSaveExecute(Sender: TObject);
begin
  inherited;
  UpdateConn;
  TAppUtils.TulisRegistry('server', edServer.Text );
  TAppUtils.TulisRegistry('port', edPort.Text );
  TAppUtils.TulisRegistry('user', edUser.Text );
  TAppUtils.TulisRegistry('password', edPassword.Text );
  TAppUtils.TulisRegistry('UnitStore', VarToStr(cxLookupCabang.EditValue) );

  TAppUtils.Information('Koneksi Berhasil di update');

end;

procedure TfrmSettingKoneksi.btnTestClick(Sender: TObject);
begin
  inherited;
  UpdateConn;

  DMClient.RestConn.TestConnection([toNoLoginPrompt]);

  cxLookupCabang.LoadFromDS(
    DMClient.DSProviderClient.AutUnit_GetDSLookup,
    'AUT$UNIT_ID' , 'UNT_NAME',
    Self
  );
end;

procedure TfrmSettingKoneksi.UpdateConn;
begin
  DMClient.RestConn.Host := edServer.Text;
  DMClient.RestConn.Port := edPort.Value;
  DMClient.RestConn.UserName := edUser.Text;
  DMClient.RestConn.Password := edPassword.Text;
end;

end.
