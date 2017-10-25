unit ufrmPopupDetailVoucher;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls,
  System.Actions, Vcl.ActnList, ufraFooterDialog3Button, ufrmMasterDialogBrowse,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid;

type
  TfrmPopupDetailVoucher = class(TfrmMasterDialogBrowse)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FVoucherId: Integer;
    procedure SetVoucherId(const value: Integer);
    procedure ParseHeaderGrid;
    procedure ParseDataGrid;
  public
    property VoucherId: Integer read FVoucherId write SetVoucherId;
  end;

var
  frmPopupDetailVoucher: TfrmPopupDetailVoucher;

implementation
{$R *.dfm}

procedure TfrmPopupDetailVoucher.SetVoucherId(const value: Integer);
begin
  FVoucherId:= value;
end;

procedure TfrmPopupDetailVoucher.ParseHeaderGrid;
begin
//  with strgGrid do
//  begin
//    Clear;
//    RowCount:= 2;
//    ColCount:= 3;
//    Cells[0,0]:= 'NO';
//    Cells[1,0]:= 'NOMINAL';
//    Cells[2,0]:= 'STATUS';
//    AutoSize:= True;
//  end;
end;

procedure TfrmPopupDetailVoucher.ParseDataGrid;
var
    i: Integer;
begin
  ParseHeaderGrid;
  {
  'SELECT * FROM VOUCHER_DETIL ' +
    'WHERE VCRD_VCR_ID=:P_ID AND VCRD_VCR_UNT_ID = :P_VCRD_VCR_UNT_ID ' +
    'ORDER BY VCRD_NO ';
    }
//  with TVoucher.Create(Self) do
//  try
//  with strgGrid,VoucherDetils do
//  begin
//    LoadByID(FVoucherId,DialogUnit);
//    for i:=0 to Count-1 do
//    begin
//        if i>0 then
//          AddRow;
//        Cells[0,i+1]:=VoucherDetil[i].NO;
//        Cells[1,i+1]:= FormatFloat('#,##0.00',VoucherDetil[i].Nominal);
//        Cells[2,i+1]:=VoucherDetil[i].Status;
//    end;
//    AutoSize:= True;
//  end;
//  finally
//    free;
//  end;

 
end;

procedure TfrmPopupDetailVoucher.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmPopupDetailVoucher.FormDestroy(Sender: TObject);
begin
  inherited;
  frmPopupDetailVoucher := nil;
end;

procedure TfrmPopupDetailVoucher.FormShow(Sender: TObject);
begin
  inherited;
  ParseDataGrid;
end;

end.
