unit ufrmGenerateVoucher;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, ufraFooter5Button, Grids,
  BaseGrid, AdvGrid, ActnList, uConstanta, AdvObj;

type
  TfrmGenerateVoucher = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    pnl1: TPanel;
    pnl2: TPanel;
    strgAgreement: TAdvStringGrid;
    strgVoucher: TAdvStringGrid;
    actlstInputSupplierForNotSO: TActionList;
    actAddGenerateVoucher: TAction;
    actDetailGenerateVoucher: TAction;
    actDeletelGenerateVoucher: TAction;
    actRefreshlGenerateVoucher: TAction;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actAddGenerateVoucherExecute(Sender: TObject);
    procedure actDetailGenerateVoucherExecute(Sender: TObject);
    procedure actDeletelGenerateVoucherExecute(Sender: TObject);
    procedure actRefreshlGenerateVoucherExecute(Sender: TObject);
    procedure strgAgreementGetAlignment(Sender: TObject; ARow,
      ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure strgVoucherGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure strgAgreementRowChanging(Sender: TObject; OldRow,
      NewRow: Integer; var Allow: Boolean);
  private
    procedure ParseHeaderGridAgreement;
    procedure ParseDataGridAgreement;
    procedure RefreshAgreement;
    procedure ParseHeaderGridVoucher;
    procedure ParseDataGridVoucher(MasterRow: Integer);
    procedure RefreshVoucher(Baris: Integer);
    function  SumTotalVoucher: Real;

    procedure WM_STORE_MESSAGE_Handle(var msg: TMessage); message WM_STORE_MESSAGE;
  public
    FTotalVoucher: Real;
  end;

var
  frmGenerateVoucher: TfrmGenerateVoucher;

implementation

uses  uConn, uGenerateVoucher, DB, ufrmDialogGenerateVoucher,
  uGTSUICommonDlg, ufrmPopupDetailVoucher;

{$R *.dfm}

procedure TfrmGenerateVoucher.FormActivate(Sender: TObject);
begin
  inherited;
  ////frmMain.CreateMenu((Sender as TForm));
end;

procedure TfrmGenerateVoucher.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  //////frmMain.DestroyMenu((Sender as TForm));
  Action := caFree;
end;

procedure TfrmGenerateVoucher.FormCreate(Sender: TObject);
begin
  inherited;
  Self.Caption := 'GENERATE VOUCHER';
  lblHeader.Caption := Self.Caption;
  actRefreshlGenerateVoucherExecute(Self);
end;

procedure TfrmGenerateVoucher.FormDestroy(Sender: TObject);
begin
  inherited;
  frmGenerateVoucher := nil;
end;

procedure TfrmGenerateVoucher.ParseHeaderGridAgreement;
begin
  with strgAgreement do
  begin
    Clear;
    RowCount:= 2;
    ColCount:= 5;
    Cells[0,0]:= 'CUSTOMER NAME';
    Cells[1,0]:= 'AGREEMENT DATE';
    Cells[2,0]:= 'AGREEMENT NO';
    Cells[3,0]:= 'AGREEMENT TOTAL';
    Cells[4,0]:= 'AGREEMENT STATUS';
    AutoSize:= True;
  end;
end;

procedure TfrmGenerateVoucher.ParseDataGridAgreement;
var data: TResultDataSet;
    tmp : string;
    i: Integer;
begin
  ParseHeaderGridAgreement;
  if not assigned(GenerateVoucher) then
    GenerateVoucher := TGenerateVoucher.Create;
  data:= GenerateVoucher.GetListAgreementVoucher;
  with strgAgreement, data do
  begin
    if not IsEmpty then
    begin
      RowCount:= RecordCount+1;
      i:=0;
      tmp:='';
      while not Eof do
      begin
        Inc(i);
        if tmp<>fieldbyname('CUSTV_NAME').AsString then
        begin
          Cells[0,i]:= fieldbyname('CUSTV_NAME').AsString;
          tmp:= fieldbyname('CUSTV_NAME').AsString;
        end
        else
          Cells[0,i]:= ' ';
        Cells[1,i]:= FormatDateTime('dd/MM/yyyy',fieldbyname('AGRV_DATE').AsDateTime);
        Cells[2,i]:= fieldbyname('AGRV_NO').AsString;
        Cells[3,i]:= FormatFloat('#,##0.00',fieldbyname('AGRV_TOTAL').AsFloat);
        Cells[4,i]:= fieldbyname('AGRV_STATUS').AsString;
        Cells[5,i]:= fieldbyname('CUSTV_CODE').AsString;
        Cells[6,i]:= IntToStr(fieldbyname('CUSTV_COUNTER').AsInteger);
        Cells[7,i]:= FloatToStr(fieldbyname('AGRV_TOTAL').AsFloat);
        Cells[8,i]:= IntToStr(fieldbyname('CUSTV_ID').AsInteger);
        Next;
      end;
      AutoSize:= True;
    end;
  end;
end;

procedure TfrmGenerateVoucher.RefreshAgreement;
begin
  ParseDataGridAgreement;
end;

procedure TfrmGenerateVoucher.ParseHeaderGridVoucher;
begin
  with strgVoucher do
  begin
    Clear;
    RowCount:= 2;
    ColCount:= 6;
    Cells[0,0]:= 'ISSUED DATE';
    Cells[1,0]:= 'START DATE';
    Cells[2,0]:= 'EXPIRE DATE';
    Cells[3,0]:= 'NOMINAL';
    Cells[4,0]:= 'QUANTITY';
    Cells[5,0]:= 'TOTAL';
    Cells[6,1]:= '';
    Cells[7,1]:= '';
    AutoSize:= True;
  end;
end;

procedure TfrmGenerateVoucher.ParseDataGridVoucher(MasterRow: Integer);
var data: TResultDataSet;
    i: Integer;
    AParam: TArr;
begin
  ParseHeaderGridVoucher;
  SetLength(AParam,1);
  AParam[0].tipe:= ptString;
  AParam[0].data:= strgAgreement.Cells[2,MasterRow];
  if not assigned(GenerateVoucher) then
    GenerateVoucher := TGenerateVoucher.Create;
  data:= GenerateVoucher.GetListVoucher(AParam);
  with strgVoucher, data do
  begin
    if not IsEmpty then
    begin
      RowCount:= RecordCount+1;
      i:=0;
      while not Eof do
      begin
        Inc(i);
        Cells[0,i]:= FormatDateTime('dd/MM/yyyy',fieldbyname('VCR_ISSUED_DATE').AsDateTime);
        Cells[1,i]:= FormatDateTime('dd/MM/yyyy',fieldbyname('VCR_START_DATE').AsDateTime);
        Cells[2,i]:= FormatDateTime('dd/MM/yyyy',fieldbyname('VCR_EXPIRE_DATE').AsDateTime);
        Cells[3,i]:= FormatFloat('#,##0.00',fieldbyname('VCR_NOMINAL').AsFloat);
        Cells[4,i]:= IntToStr(fieldbyname('VCR_QTY').AsInteger);
        Cells[5,i]:= FormatFloat('#,##0.00',fieldbyname('VCR_NOMINAL').AsFloat*
                                  fieldbyname('VCR_QTY').AsInteger);
        Cells[6,i]:= IntToStr(fieldbyname('VCR_ID').AsInteger);
        Cells[7,i]:= FloatToStr(fieldbyname('VCR_NOMINAL').AsFloat*
                                fieldbyname('VCR_QTY').AsInteger);
        Next;
      end;
      AutoSize:= True;
    end;
  end;
  FTotalVoucher:= 0;
  FTotalVoucher:= SumTotalVoucher;
end;

procedure TfrmGenerateVoucher.RefreshVoucher(Baris: Integer);
begin
  ParseDataGridVoucher(Baris);
end;

procedure TfrmGenerateVoucher.actAddGenerateVoucherExecute(
  Sender: TObject);
begin
  inherited;
  if StrToFloat(strgAgreement.Cells[7,strgAgreement.row])<=FTotalVoucher then
  begin
    CommonDlg.ShowConfirmGlobal(CONF_TOTAL_AGREEMENT);
    strgAgreement.SetFocus;
    Exit;
  end;
  if not Assigned(frmDialogGenerateVoucher) then
    Application.CreateForm(TfrmDialogGenerateVoucher, frmDialogGenerateVoucher);
  frmDialogGenerateVoucher.AgrvNo:= strgAgreement.Cells[2,strgAgreement.Row];
  frmDialogGenerateVoucher.CustCounter:= StrToInt(strgAgreement.Cells[6,strgAgreement.Row]);
  frmDialogGenerateVoucher.CustCode:= strgAgreement.Cells[5,strgAgreement.Row];

  SetFormPropertyAndShowDialog(frmDialogGenerateVoucher);
  if (frmDialogGenerateVoucher.IsProcessSuccessfull) then
  begin
    RefreshVoucher(strgAgreement.Row);
    CommonDlg.ShowConfirmSuccessfull(atAdd);
  end;

  frmDialogGenerateVoucher.Free;
  strgAgreement.SetFocus;
end;

procedure TfrmGenerateVoucher.actDetailGenerateVoucherExecute(
  Sender: TObject);
begin
  inherited;
  if strgVoucher.Cells[6,strgVoucher.Row]='' then Exit;
  if not Assigned(frmPopupDetailVoucher) then
    Application.CreateForm(TfrmPopupDetailVoucher, frmPopupDetailVoucher);
  frmPopupDetailVoucher.VoucherId:= StrToInt(strgVoucher.Cells[6,strgVoucher.Row]);

  SetFormPropertyAndShowDialog(frmPopupDetailVoucher);
end;

procedure TfrmGenerateVoucher.actDeletelGenerateVoucherExecute(
  Sender: TObject);
var arr: TArr;
begin
  inherited;
  if strgVoucher.Cells[6,strgVoucher.Row]='' then Exit;
  if (CommonDlg.Confirm('Are you sure you wish to delete Voucher (Issued Date: '+ strgVoucher.Cells[0,strgVoucher.Row] +')?') = mrNo) then
    Exit;
  SetLength(arr,1);
  arr[0].tipe:= ptInteger;
  arr[0].data:= strgVoucher.Cells[6,strgVoucher.Row];
  if not assigned(GenerateVoucher) then
    GenerateVoucher := TGenerateVoucher.Create;
  if GenerateVoucher.DeleteVoucher(arr) then
  begin
    RefreshVoucher(strgAgreement.Row);
    CommonDlg.ShowConfirmSuccessfull(atDelete);
  end;
  strgVoucher.SetFocus;
end;

procedure TfrmGenerateVoucher.actRefreshlGenerateVoucherExecute(
  Sender: TObject);
begin
  inherited;
  RefreshAgreement;
  RefreshVoucher(strgAgreement.Row);
end;

procedure TfrmGenerateVoucher.strgAgreementGetAlignment(Sender: TObject;
  ARow, ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  inherited;
  if(ARow=0)or(ACol in [1,4])then
    HAlign:= taCenter;
  if(ARow<>0)and(ACol=3)then
    HAlign:= taRightJustify;
end;

procedure TfrmGenerateVoucher.strgVoucherGetAlignment(Sender: TObject;
  ARow, ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  inherited;
  if(ARow=0)or(ACol in [0,1,2,4])then
    HAlign:= taCenter;
  if(ARow<>0)and(ACol in [3,5])then
    HAlign:= taRightJustify;
end;

function TfrmGenerateVoucher.SumTotalVoucher: Real;
var i: Integer;
    tmp: Real;
begin
  tmp:= 0;
  for i:=1 to strgVoucher.RowCount-1 do
  begin
    if strgVoucher.Cells[7,i]='' then
      strgVoucher.Cells[7,i]:='0';
    tmp:= tmp+ StrToFloat(strgVoucher.Cells[7,i]);
  end;
  Result:= tmp;
end;

procedure TfrmGenerateVoucher.strgAgreementRowChanging(Sender: TObject;
  OldRow, NewRow: Integer; var Allow: Boolean);
begin
  inherited;
  RefreshVoucher(NewRow);
end;

procedure TfrmGenerateVoucher.WM_STORE_MESSAGE_Handle(var msg: TMessage);
begin
  case msg.WParam of
    STORE_REFRESH_VOUCHER: actRefreshlGenerateVoucherExecute(self);
  end;
end;

end.



