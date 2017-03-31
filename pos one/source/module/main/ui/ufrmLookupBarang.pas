unit ufrmLookupBarang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, BaseGrid, AdvGrid, AdvCGrid;

type
  TfrmLookupBarang = class(TForm)
    btnClose: TButton;
    sgTransaksi: TAdvColumnGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLookupBarang: TfrmLookupBarang;

implementation

{$R *.dfm}

procedure TfrmLookupBarang.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	Action := caFree;
end;

procedure TfrmLookupBarang.btnCloseClick(Sender: TObject);
begin
	Self.Close;
end;

end.
