unit ufrmOutstandingPO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, dxGDIPlusClasses,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid;

type
  TfrmOutstandingPO = class(TForm)
    pnlBody: TPanel;
    pnlHeader: TPanel;
    pnlFooter: TPanel;
    lbl1: TLabel;
    cxGrid: TcxGrid;
    cxGridView: TcxGridDBTableView;
    cxlvMaster: TcxGridLevel;
    Image1: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sgDataCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure sgDataGetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
    procedure sgDataDblClick(Sender: TObject);
  private
    procedure AturLebarKolom;
    //procedure GridHeader;
    //procedure GridData;
  public
    procedure ShowDataPOOutStanding(aSupMGCode: String);
    { Public declarations }
  end;

var
  frmOutstandingPO: TfrmOutstandingPO;

const
  _KolNoBUkti   : Integer = 1;
  _KolTglBukti  : Integer = 2;
  _KolNilai     : Integer = 3;
  _KolPPN       : Integer = 4;
  _KolPPNBM     : Integer = 5;
  _KolTotal     : Integer = 6;

implementation

uses uConn, ufrmSupplier, uRetnounit, ufrmDisplayPO;

{$R *.dfm}

procedure TfrmOutstandingPO.AturLebarKolom;
begin
  {sgData.AutoSizeColumns(True, 5);
  sgData.Columns[_KolNilai].Width := 100;
  sgData.Columns[_KolPPN].Width   := 100;
  sgData.Columns[_KolPPNBM].Width := 100;
  sgData.Columns[_KolTotal].Width := 100; }
end;

procedure TfrmOutstandingPO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmOutstandingPO.FormCreate(Sender: TObject);
begin
  // inisialisasi dbgrid
  //GridData;
end;

procedure TfrmOutstandingPO.FormDestroy(Sender: TObject);
begin
  frmOutstandingPO := nil;
end;

procedure TfrmOutstandingPO.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=chr(VK_RETURN) then Close;
end;

procedure TfrmOutstandingPO.ShowDataPOOutStanding(aSupMGCode: String);
var
  sSQL: string;
begin
  sSQL := 'select a.PO_no as NoBukti, a.PO_date as Tanggal, a.PO_total as Nilai, a.po_ppn as PPN, a.po_ppnbm as PPNBM, (a.PO_total + a.po_ppn + a.po_ppnbm) as Total'
          + ' from po a, suplier_merchan_grup b'
          + ' where a.po_supmg_sub_code = b.supmg_sub_code'

          + ' and b.supmg_sub_code = ' + QuotedSTr(aSupMGCode)
          + ' and a.po_stapo_id not in (3,5,6) ';

//  cQueryToGrid(sSQL, sgData);
  AturLebarKolom;


end;

procedure TfrmOutstandingPO.sgDataCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  CanEdit := False;
end;

procedure TfrmOutstandingPO.sgDataGetFloatFormat(Sender: TObject; ACol,
  ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  FloatFormat := '%.2n';
  if ARow <= 0 then
    IsFloat := False
  else if ACol in [_KolNilai, _KolPPN, _KolPPNBM, _KolTotal] then
    IsFloat := True
  else
    IsFloat := False;
end;

procedure TfrmOutstandingPO.sgDataDblClick(Sender: TObject);
var
  cChar: Char;
  sNoPO: string;
begin
  cChar := #13;
  
  sNoPO := cxGridView.Datacontroller.Values[_KolNoBukti, cxGridView.Datacontroller.RecNo];
  with TfrmDisplayPO.Create(Self) do
  begin
    try
      edtPONo.Text := sNoPO;
      edtPONoKeyPress(edtPONo, cChar);
    finally

    end;  
  end;
end;

end.
