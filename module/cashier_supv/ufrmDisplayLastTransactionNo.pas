unit ufrmDisplayLastTransactionNo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls, ActnList , System.Actions,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer, Vcl.ComCtrls, dxCore,
  cxDateUtils, Vcl.Menus, ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC;

type
  TfrmDisplayLastTransactionNo = class(TfrmMasterBrowse)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
  private
    procedure ParseHeaderGrid();
    procedure ParseDataGrid();
  public
    { Public declarations }
  end;

var
  frmDisplayLastTransactionNo: TfrmDisplayLastTransactionNo;

implementation

uses uAppUtils;

const
  _kol_Pos_Code   : Integer = 0;
  _kol_Last_trans : Integer = 1;
  _kol_count_no   : Integer = 2;
  _kol_Active     : Integer = 3;

{$R *.dfm}

procedure TfrmDisplayLastTransactionNo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDisplayLastTransactionNo.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'DISPLAY LAST TRANSACTION NO.';
end;

procedure TfrmDisplayLastTransactionNo.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDisplayLastTransactionNo := nil;
end;

procedure TfrmDisplayLastTransactionNo.FormShow(Sender: TObject);
begin
  inherited;
  ParseDataGrid;
//  HapusBarisKosong(strgGrid,1);
end;

procedure TfrmDisplayLastTransactionNo.ParseDataGrid;
var
  sSql : string;
  i    : Integer;
begin
  ParseHeaderGrid;
//  i:=0;
   ssql:= ' select setuppos_terminal_code'
        + ' ,trim(substr(setuppos_no_transaksi,1,11)||setuppos_counter_no) notran'
        + ' ,setuppos_counter_no'
        + ' ,setuppos_is_active '
        + ' from setuppos '
//        + ' where setuppos_date = ' + TAppUtils.QuotD(cGetServerTime)
        + ' and setuppos_unt_id = ' + IntToStr(MasterNewUnit);
   {
   with cOpenQuery(sSql) do
   begin
      while not eof do
      begin
        i := i + 1 ;
          with strgGrid do
          begin
            RowCount := RowCount + 2;

            Cells[_kol_Pos_Code,i]   := Fields[0].AsString;
            Cells[_kol_Last_trans,i] := Fields[1].AsString;;
            Alignments[_kol_Pos_Code,i] := taCenter;
            Cells[_kol_count_no,i] := IntToStr(Fields[2].AsInteger);
            Alignments[_kol_count_no,i] := taCenter;
            Cells[_kol_Active,i] := IntToStr(Fields[3].AsInteger);
            Alignments[_kol_Active,i] := taCenter;
          end;
        Next;
      end;
  end;
  }
end;

procedure TfrmDisplayLastTransactionNo.ParseHeaderGrid;
begin
  {
  with strgGrid do
  begin
    Clear;
    ColCount := 4;
    RowCount := 2;
    Cells[0,0] := 'POS CODE';
    Cells[1,0] := 'LAST TRANSACTION NO.';
    Cells[2,0] := 'LAST COUNTER NO.';
    Cells[3,0] := 'ACTIVE/NON ACTIVE';

    FixedRows := 1;
    AutoSize := true;
  end;
  }
end;

procedure TfrmDisplayLastTransactionNo.actRefreshExecute(Sender: TObject);
begin
  inherited;
  ParseDataGrid;
//  HapusBarisKosong(strgGrid,1);
end;

end.
