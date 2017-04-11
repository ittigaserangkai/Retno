unit ufrmLookupBarang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid;

type
  TfrmLookupBarang = class(TForm)
    btnClose: TButton;
    cxgrdBarang: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxcolNo: TcxGridDBColumn;
    cxcolPLU: TcxGridDBColumn;
    cxcolNamaBarang: TcxGridDBColumn;
    cxcolJumlah: TcxGridDBColumn;
    cxcolHarga: TcxGridDBColumn;
    cxcolDisc: TcxGridDBColumn;
    cxcolTotal: TcxGridDBColumn;
    cxcolIsDecimal: TcxGridDBColumn;
    cxcolIsDiscAMC: TcxGridDBColumn;
    grdlvlTransaksi: TcxGridLevel;
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
