unit ufrmDialogCrazyPrice;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls, uInterface, uDBUtils,
  uDXUtils, Datasnap.DBClient, System.DateUtils, uModCrazyPrice;

type
  TfrmDialogCrazyPrice = class(TfrmMasterDialog, ICRUDAble)
  private
    { Private declarations }
  public
    procedure LoadData(AID : String);
    { Public declarations }
  end;

var
  frmDialogCrazyPrice: TfrmDialogCrazyPrice;

implementation

{$R *.dfm}

procedure TfrmDialogCrazyPrice.LoadData(AID : String);
begin

end;

end.
