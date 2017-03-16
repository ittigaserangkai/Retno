unit ufrmPopupDetailVoucher;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls, SUIForm,
  Grids, BaseGrid, AdvGrid, AdvObj;

type
  TfrmPopupDetailVoucher = class(TfrmMasterDialog)
    strgGrid: TAdvStringGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure strgGridGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
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

uses uGenerateVoucher, uConn, DB;

{$R *.dfm}

procedure TfrmPopupDetailVoucher.SetVoucherId(const value: Integer);
begin
  FVoucherId:= value;
end;

procedure TfrmPopupDetailVoucher.ParseHeaderGrid;
begin
  with strgGrid do
  begin
    Clear;
    RowCount:= 2;
    ColCount:= 3;
    Cells[0,0]:= 'NO';
    Cells[1,0]:= 'NOMINAL';
    Cells[2,0]:= 'STATUS';
    AutoSize:= True;
  end;
end;

procedure TfrmPopupDetailVoucher.ParseDataGrid;
var data: TResultDataSet;
    i: Integer;
    AParam: TArr;
begin
  ParseHeaderGrid;
  SetLength(AParam,1);
  AParam[0].tipe:= ptInteger;
  AParam[0].data:= FVoucherId;
  if not assigned(GenerateVoucher) then
    GenerateVoucher := TGenerateVoucher.Create;
  data:= GenerateVoucher.GetListVoucherDetil(AParam);
  with strgGrid, data do
  begin
    if not IsEmpty then
    begin
      RowCount:= RecordCount+1;
      i:=0;
      while not Eof do
      begin
        Inc(i);
        Cells[0,i]:= fieldbyname('VCRD_NO').AsString;
        Cells[1,i]:= FormatFloat('#,##0.00',fieldbyname('VCRD_NOMINAL').AsFloat);
        Cells[2,i]:= fieldbyname('VCRD_STATUS').AsString;
        Next;
      end;
      AutoSize:= True;
    end;
  end;
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

procedure TfrmPopupDetailVoucher.strgGridGetAlignment(Sender: TObject;
  ARow, ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  inherited;
  if(ARow=0)or(ACol=2)then HAlign:= taCenter;
  if(ACol=1)and(ARow<>0)then HAlign:= taRightJustify;
end;

end.
