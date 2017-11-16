unit ufrmTransaksiPending;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, uDMClient, uAppUtils;

type
  TfrmTransaksiPending = class(TForm)
    btnClose: TButton;
    btnRefresh: TButton;
    cxTransaksi: TcxGrid;
    sgTransaksi: TcxGridDBTableView;
    grdlvlTransaksi: TcxGridLevel;
    sgTransaksiColumn1: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sgTransaksiDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnRefreshClick(Sender: TObject);
    procedure sgTransaksiColumn1GetDisplayText(Sender: TcxCustomGridTableItem;
        ARecord: TcxCustomGridRecord; var AText: string);
    procedure sgTransaksiKeyDown(Sender: TObject; var Key: Word; Shift:
        TShiftState);
  private
    procedure RefreshTransPending;
  public
    procedure LoadPending;
  end;

var
  frmTransaksiPending: TfrmTransaksiPending;

implementation

uses
  uConstanta, ufrmMain, ufrmTransaksi, uTSCommonDlg, uDXUtils,
  uNewPosTransaction, udmMain;

const
   _Kol_No                  : Byte = 0;
   _Kol_MEMBER_CARD_NO      : Byte = 1;
   _Kol_MEMBER_NAME         : Byte = 2;
   _Kol_TRANS_NO            : Byte = 3;
   _Kol_TRANS_DATE          : Byte = 4;
   _Kol_TRANS_TOTAL         : Byte = 5;
   _Kol_TRANS_IS_ACTIVE     : Byte = 6;
   _Kol_TRANS_ID            : Byte = 7;
   _Kol_TRANS_MEMBER_ID     : Byte = 8;
//   _Kol_TRANS_MEMBER_UNT_ID : Byte = 9;

{$R *.dfm}

procedure TfrmTransaksiPending.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	Action := caFree;
  frmMain.miTransactionEndUserClick(Self);
end;

procedure TfrmTransaksiPending.btnCloseClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmTransaksiPending.LoadPending;
var
  lfrm: TfrmTransaksi;
begin
  lfrm := TfrmTransaksi.Create(Application);
  try
    lfrm.LoadData(sgTransaksi.DataController.DataSet.FieldByName('TRANSAKSI_ID').AsString);
  finally
    Self.Close;
  end;
end;


procedure TfrmTransaksiPending.FormShow(Sender: TObject);
begin
  RefreshTransPending;
  cxTransaksi.SetFocus;
end;

procedure TfrmTransaksiPending.RefreshTransPending;
begin
  {
  cQueryToGrid(GetListPendingTransByUserIDAndDate(frmMain.UnitID, frmMain.UserID, cGetServerTime),
               sgTransaksi, True);
  if sgTransaksi.Cells[_Kol_MEMBER_CARD_NO, 1] = '' then
  begin
    frmTransaksi := GetFormByClass(TfrmTransaksi) as TfrmTransaksi;
    if frmTransaksi <> nil then
      CommonDlg.ShowMessage('Tidak ada Transaksi Pending');
    Close;
  end;
  sgTransaksi.AutoSizeColumns(True, 5);
  HideColumnsGrid(sgTransaksi, _Kol_TRANS_ID, sgTransaksi.ColCount-1);
  sgTransaksi.ColWidths[_Kol_TRANS_TOTAL] := 100;
  if sgTransaksi.Cells[_Kol_TRANS_NO, 1] <> '' then
  begin
     sgTransaksi.Row := 1;
     sgTransaksi.Col := 1;
  end;
  }
//  sgTransaksi.LoadFromCDS(cOpenDataset(GetListPendingTransByUserIDAndDate(frmMain.UserID, cGetServerDateTime)));
  if frmMain.AuthUser.ID = '' then
    Raise Exception.Create('User Login belum ada');

  sgTransaksi.LoadFromDS(
    DMCLient.POSClient.GetListPendingTransByUserIDAndDate(frmMain.AuthUser.ID, Now()), Self
  );
  if sgTransaksi.DataController.RecordCount = 0 then
  begin
    frmTransaksi := GetFormByClass(TfrmTransaksi) as TfrmTransaksi;
    if frmTransaksi <> nil then
      TAppUtils.Information('Tidak ada Transaksi Pending');
//      CommonDlg.ShowMessage('Tidak ada Transaksi Pending');
    Close;
  end else
  begin
    sgTransaksi.SetVisibleColumns(_Kol_TRANS_IS_ACTIVE, _Kol_TRANS_MEMBER_ID, False);
  end;
//  sgTransaksi.SetVisibleColumns(['_Kol_TRANS_ID'],False);
//  sgTransaksi.SetColumnsWidth(['_Kol_TRANS_TOTAL'],100);
end;

procedure TfrmTransaksiPending.sgTransaksiDblClick(Sender: TObject);
begin
  LoadPending();
  self.Close;
end;

procedure TfrmTransaksiPending.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    RefreshTransPending;
  end;
end;

procedure TfrmTransaksiPending.btnRefreshClick(Sender: TObject);
begin
  RefreshTransPending;
end;

procedure TfrmTransaksiPending.sgTransaksiColumn1GetDisplayText(Sender:
    TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
var
  Row: Integer;
begin
  Row := Sender.GridView.DataController.GetRowIndexByRecordIndex(ARecord.RecordIndex, False);
  AText := IntToStr(Row+1);
end;

procedure TfrmTransaksiPending.sgTransaksiKeyDown(Sender: TObject; var Key:
    Word; Shift: TShiftState);
begin
	if Key = VK_RETURN then
  begin
    sgTransaksiDblClick(sgTransaksi);
  end
end;

end.
