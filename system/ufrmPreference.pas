unit ufrmPreference;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMaster, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmPreference = class(TfrmMaster)
    rgMenu: TRadioGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPreference: TfrmPreference;

implementation

{$R *.dfm}

end.
