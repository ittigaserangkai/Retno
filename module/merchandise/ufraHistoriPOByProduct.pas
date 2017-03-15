unit ufraHistoriPOByProduct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, uConn,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxLabel, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid;

type
  TFromMode = (fmProduct, fmSupplier);

  TfraHistoriPOByProduct = class(TFrame)
    pnl1: TPanel;
    lblAdd: TcxLabel;
    lblEdit: TcxLabel;
    lblDelete: TcxLabel;
    lblClose: TcxLabel;
    pnl4: TPanel;
    cxGrid: TcxGrid;
    cxGridView: TcxGridDBTableView;
    cxlvMaster: TcxGridLevel;
    procedure lblCloseClick(Sender: TObject);
  private
    { Private declarations }
    FProductCode: string;

//    objPO: TSearchPO;
    FSupplierCode: string;
    FFromMode: TFromMode;

    procedure SetProductCode(const Value: string);
    procedure SetHeaderGrid(ARowCount: Integer);
    procedure SetHeaderGridBySupplier(ARowCount: Integer);
    procedure SetSupplierCode(const Value: string);

  public
    { Public declarations }

    FUnitID : Integer;
    procedure ShowPOByProduct;
    procedure ShowPOBySupplier;

    property ProductCode: string read FProductCode write SetProductCode;
    property SupplierCode: string read FSupplierCode write SetSupplierCode;
    property FromMode: TFromMode read FFromMode write FFromMode;
  end;

var
  fraHistoriPOByProduct: TfraHistoriPOByProduct;
  
implementation

uses  ufrmProduct;//, ufrmSupplier;

{$R *.dfm}

{ TfraHistoriPOByProduct }

procedure TfraHistoriPOByProduct.SetHeaderGrid(ARowCount: Integer);
begin
  {with strgGrid do
  begin
    ColCount := 8;
    RowCount := ARowCount;
    FixedRows := 1;

    Cells[0,0] := 'NO PO';
    Cells[1,0] := 'DATE';
    Cells[2,0] := 'QTY';
    Cells[3,0] := 'UOM';
    Cells[4,0] := 'STATUS';
    Cells[5,0] := 'DATE RECEIVE';
    Cells[6,0] := 'EXPIRED DATE';
    Cells[7,0] := 'AMOUNT';

    AutoSize := True;
  end; }
end;

procedure TfraHistoriPOByProduct.SetHeaderGridBySupplier(ARowCount: Integer);
begin
 { with strgGrid do
  begin
    ColCount := 4;
    RowCount := ARowCount;
    FixedRows := 1;

    Cells[0,0] := 'NO PO';
    Cells[1,0] := 'DATE';
    Cells[2,0] := 'EXPIRED DATE';
    Cells[3,0] := 'AMOUNT';

    AutoSize := True;
  end; }
end;

procedure TfraHistoriPOByProduct.SetProductCode(const Value: string);
begin
  FProductCode := Value;
end;

procedure TfraHistoriPOByProduct.ShowPOByProduct;
var dsPO: TDataSet;
    arrParam: TArr;
    i: Integer;
begin
//  if not Assigned(objPO) then
//    objPO := TSearchPO.Create;
  SetLength(arrParam,1);
  arrParam[0].tipe := ptString;
  arrParam[0].data := FProductCode;


//  dsPO := objPO.GetListPOByProductCode(arrParam);
  if dsPO.RecordCount > 0 then
    SetHeaderGrid(dsPO.RecordCount+1)
  else
    SetHeaderGrid(2);
  i:= 1;
  {with strgGrid do
  begin
    while not dsPO.Eof do
    begin
      Cells[0,i] := dsPO.FieldByName('PO_NO').AsString;
      Cells[1,i] := FormatDateTime('mm/dd/yyyy',dsPO.FieldByName('PO_DATE').AsDateTime);
      Cells[2,i] := FloatToStr(dsPO.FieldByName('POD_QTY_ORDER').AsFloat);
      Cells[3,i] := dsPO.FieldByName('POD_SAT_CODE_ORDER').AsString;
      Cells[4,i] := dsPO.FieldByName('STAPO_NAME').AsString;
      Cells[5,i] := FormatDateTime('mm/dd/yyyy',dsPO.FieldByName('DO_DATE').AsDateTime);
      Cells[6,i] := FormatDateTime('mm/dd/yyyy',dsPO.FieldByName('PO_VALID_DATE').AsDateTime);
      Cells[7,i] := CurrToStr(dsPO.FieldByName('POD_TOTAL_DISC').AsCurrency);

      Inc(i);
      dsPO.Next;
    end;
    AutoSize := True;
  end;
  FreeAndNil(objPO);  }
end;

procedure TfraHistoriPOByProduct.lblCloseClick(Sender: TObject);
begin
  fraHistoriPOByProduct.Parent := nil;
  if FFromMode = fmProduct then
    frmProduct.SetActiveFooter5Button(True)
//  else if FFromMode = fmSupplier then
//    frmSupplier.SetActiveFooter5Button(True);
end;

procedure TfraHistoriPOByProduct.SetSupplierCode(const Value: string);
begin
  FSupplierCode := Value;
end;

procedure TfraHistoriPOByProduct.ShowPOBySupplier;
var dsPO: TDataSet;
    arrParam: TArr;
    i: Integer;
begin
//  if not Assigned(objPO) then
//    objPO := TSearchPO.Create;
  SetLength(arrParam,2);
  arrParam[0].tipe := ptString;
  arrParam[0].data := FSupplierCode;
  arrParam[1].tipe := ptInteger;
  arrParam[1].data := FUnitID;

//  dsPO := objPO.GetListOutstandingPO(arrParam);
  if dsPO.RecordCount > 0 then
    SetHeaderGridBySupplier(dsPO.RecordCount+1)
  else
    SetHeaderGridBySupplier(2);
  i:= 1;
  {with strgGrid do
  begin
    while not dsPO.Eof do
    begin
      Cells[0,i] := dsPO.FieldByName('PO_NO').AsString;
      Cells[1,i] := FormatDateTime('mm/dd/yyyy',dsPO.FieldByName('PO_DATE').AsDateTime);
      Cells[2,i] := FormatDateTime('mm/dd/yyyy',dsPO.FieldByName('PO_VALID_DATE').AsDateTime);
      Cells[3,i] := CurrToStr(dsPO.FieldByName('TOTAL_PO').AsCurrency);

      Inc(i);
      dsPO.Next;
    end;
    AutoSize := True;
  end;
  FreeAndNil(objPO);   }
end;

end.
