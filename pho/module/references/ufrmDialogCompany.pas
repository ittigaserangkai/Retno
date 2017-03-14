unit ufrmDialogCompany;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls;

type
  TfrmDialogCompany = class(TfrmMasterDialog)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDialogCompany: TfrmDialogCompany;

implementation
uses
  uAppUtils, uDXUtils, System.DateUtils, uDBUtils, uDMClient;

{$R *.dfm}

procedure TfrmDialogCompany.FormCreate(Sender: TObject);
begin
  inherited;
//  Self.ev
end;

end.
