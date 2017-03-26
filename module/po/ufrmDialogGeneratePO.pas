unit ufrmDialogGeneratePO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialogBrowse, ExtCtrls, StdCtrls, Mask,
  System.Actions, Vcl.ActnList, ufraFooterDialog3Button, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid;

type
  TfrmDialogDetailGeneratePO = class(TfrmMasterDialogBrowse)
    pnl1: TPanel;
    pnl2: TPanel;
    lbl1: TLabel;
    dtPO: TcxDateEdit;
    dtSO: TcxDateEdit;
    lbl2: TLabel;
    edtSO_NO: TEdit;
    lbl3: TLabel;
    lbl6: TLabel;
    edtMerchanGrup: TEdit;
    spl1: TSplitter;
    cxgrdParent: TcxGrid;
    grdParent: TcxGridDBTableView;
    grdlvlParent: TcxGridLevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure strgParentClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure ParseHeaderParentPO;
    procedure ParseHeaderChildPO;
    procedure ParseDataParentPO;
    procedure ParseDataChildPO;
  public
    { Public declarations }
  end;

var
  frmDialogDetailGeneratePO: TfrmDialogDetailGeneratePO;

implementation

uses ufrmGeneratePOForAll;

{$R *.dfm}

procedure TfrmDialogDetailGeneratePO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogDetailGeneratePO.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogDetailGeneratePO := nil;
end;

procedure TfrmDialogDetailGeneratePO.FormShow(Sender: TObject);
begin
  inherited;
  ParseDataParentPO;
  ParseDataChildPO;
end;

procedure TfrmDialogDetailGeneratePO.ParseDataChildPO;
var data: TDataSet;
    i: Integer;
//    arrParam: TArr;
begin
  {ParseHeaderChildPO;
  if strgParent.Cells[1,strgParent.Row]='' then Exit;
  if(not Assigned(PurchasingOrder))then
    PurchasingOrder := TPurchasingOrder.Create;

  SetLength(arrParam, 2);
  arrParam[0].tipe := ptString;
  arrParam[0].data := strgParent.Cells[1,strgParent.Row];
  arrParam[1].tipe := ptInteger;
  arrParam[1].data := dialogunit;

  data:= PurchasingOrder.GetPODetilByPoNo(arrParam);
  with data do
  if not IsEmpty then
  begin
    strgChild.RowCount:= RecordCount+1;
    i:=0;
    edtMerchanGrup.Text:= fieldbyname('MERCHANGRUP_NAME').AsVariant;
    while not Eof do
    begin
      with strgChild do
      begin
        Cells[0,i+1] := IntToStr(i+1);
        Cells[1,i+1] := fieldbyname('POD_BRG_CODE').AsVariant;
        Cells[2,i+1] := fieldbyname('BRG_NAME').AsVariant + ' ' + fieldbyname('BRG_MERK').AsVariant;
        Cells[3,i+1] := fieldbyname('POD_SAT_CODE_ORDER').AsVariant;
        Cells[4,i+1] := fieldbyname('POD_PRICE').AsVariant;
        Cells[5,i+1] := fieldbyname('POD_QTY_ORDER').AsVariant;
        Cells[6,i+1] := fieldbyname('POD_DISC1').AsVariant;
        Cells[7,i+1] := fieldbyname('POD_DISC2').AsVariant;
        Cells[8,i+1] := fieldbyname('POD_DISC3').AsVariant;
        Cells[9,i+1] := fieldbyname('POD_PPN').AsVariant;
        Cells[10,i+1] := fieldbyname('POD_PPNBM').AsVariant;
        if fieldbyname('POD_IS_BKP').AsInteger=1 then
          Cells[11,i+1] := 'BKP'
        else
          Cells[11,i+1] := 'BTKP';
      end;
      Next;
      Inc(i);
    end;
    strgChild.AutoSize:= True;
  end;
  }
end;

procedure TfrmDialogDetailGeneratePO.ParseDataParentPO;
var data: TDataSet;
    i: Integer;
//    arrParam: TArr;
begin
  {ParseHeaderParentPO;
  if(not Assigned(PurchasingOrder))then
    PurchasingOrder := TPurchasingOrder.Create;

  SetLength(arrParam, 2);
  arrParam[0].tipe := ptString;
  arrParam[0].data := edtSO_NO.Text;
  arrParam[1].tipe := ptInteger;
  arrParam[1].data := dialogunit;

  data:= PurchasingOrder.GetPOBySoNo(arrParam);
  with data do
  if not IsEmpty then
  begin
    strgParent.RowCount:= RecordCount+1;
    i:=0;
    while not Eof do
    begin
      with strgParent do
      begin
        Cells[0,i+1] := IntToStr(i+1);
        Cells[1,i+1] := fieldbyname('PO_NO').AsVariant;
        Cells[2,i+1] := fieldbyname('PO_DATE').AsVariant;
        Cells[3,i+1] := fieldbyname('PO_VALID_DATE').AsVariant;
        Cells[4,i+1] := fieldbyname('PO_DISC').AsVariant;
        Cells[5,i+1] := fieldbyname('PO_PPN').AsVariant;
        Cells[6,i+1] := fieldbyname('PO_PPNBM').AsVariant;
        Cells[7,i+1] := fieldbyname('PO_TOTAL').AsVariant;
        Cells[8,i+1] := fieldbyname('STAPO_NAME').AsVariant;
      end;
      Next;
      Inc(i);
    end;
    strgParent.AutoSize:= True;
  end;
  }
end;

procedure TfrmDialogDetailGeneratePO.ParseHeaderChildPO;
begin
  {with strgChild do
  begin
    Clear;
    RowCount := 2;
    ColCount := 12;
    Cells[0,0] := 'NO.';
    Cells[1,0] := 'PRODUCT CODE';
    Cells[2,0] := 'PRODUCT NAME';
    Cells[3,0] := 'UOM';
    Cells[4,0] := 'UNIT PRICE';
    Cells[5,0] := 'QTY ORDER';
    Cells[6,0] := 'DISC 1';
    Cells[7,0] := 'DISC 2';
    Cells[8,0] := 'DISC 3';
    Cells[9,0] := 'PPN';
    Cells[10,0] := 'PPNBM';
    Cells[11,0] := 'BKP/BTKP';

    FixedRows := 1;
    AutoSize := true;
  end;
  }
end;

procedure TfrmDialogDetailGeneratePO.ParseHeaderParentPO;
begin
  {with strgParent do
  begin
    Clear;
    RowCount := 10;
    ColCount := 9;    
    Cells[0,0] := 'NO.';
    Cells[1,0] := 'PO NO.';
    Cells[2,0] := 'DELIVERY DATE';
    Cells[3,0] := 'VALID DATE';;
    Cells[4,0] := 'DISC';
    Cells[5,0] := 'PPN';
    Cells[6,0] := 'PPNBM';
    Cells[7,0] := 'TOTAL PRICE';
    Cells[8,0] := 'STATUS';

    FixedRows := 1;
    AutoSize := true;
  end;
  }
end;

procedure TfrmDialogDetailGeneratePO.strgParentClick(Sender: TObject);
begin
  inherited;
  ParseDataChildPO;
end;

procedure TfrmDialogDetailGeneratePO.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//  inherited;
  if(Key = VK_RETURN) and (ssctrl in Shift) then
    footerDialogMaster.btnSave.Click
  else if(Key = VK_Escape) and (ssctrl in Shift) then
    actCancelExecute(Sender)
end;

end.


