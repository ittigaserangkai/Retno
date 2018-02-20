unit ufrmPopupSelectCustomer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, Vcl.Menus, Vcl.StdCtrls, cxButtons;

type
  TModul = (mMasterAgreement, mPotongTagihan, mARPayment, mInvoice, null);
  TfrmPopUpSelectCustomer = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    cxGrid: TcxGrid;
    cxGridView: TcxGridDBTableView;
    cxcolGridViewColumn2: TcxGridDBColumn;
    cxcolGridViewColumn3: TcxGridDBColumn;
    cxcolGridViewColumn10: TcxGridDBColumn;
    cxlvMaster: TcxGridLevel;
    btnSelect: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure strgGridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridDblClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FCustomerCode: string;
    FCustomerID: Integer;
    FSuplierCode: string;
    FMOdul: TModul;
    FIsProcessSuccessfull: Boolean;
    procedure SetCustomerCode(const Value: string);
    procedure SetModul(const Value: TModul);
    procedure ParseDataCustomer;
    procedure SetCustomerID(const Value: Integer);
    procedure SetSuplierCode(const Value: string);
    procedure SetIsProcessSuccessfull(const Value: Boolean);
  public
    property CustomerCode : string read FCustomerCode write SetCustomerCode;
    property CustomerID: Integer read FCustomerID write SetCustomerID;
    property SuplierCode: string read FSuplierCode write SetSuplierCode;
    property Modul: TModul read FMOdul write SetModul;
    property IsProcessSuccessfull: Boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmPopUpSelectCustomer: TfrmPopUpSelectCustomer;

implementation
{$R *.dfm}

uses
  uRetnoUnit;



{ TfrmPopUpSelectCustomer }

procedure TfrmPopUpSelectCustomer.SetCustomerCode(const Value: string);
begin
  FCustomerCode := Value;
end;

procedure TfrmPopUpSelectCustomer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmPopUpSelectCustomer.FormDestroy(Sender: TObject);
begin
  frmPopUpSelectCustomer := nil;
end;

procedure TfrmPopUpSelectCustomer.SetModul(const Value: TModul);
begin
  FMOdul := Value;
end;

procedure TfrmPopUpSelectCustomer.ParseDataCustomer;
var
//  i: Integer;
  s: string;
begin
  //init

  if (Modul in [mPotongTagihan, mARPayment, mInvoice]) then
  begin
    s:= 'SELECT DISTINCT CUST.CUST_ID, AGR.AGR_CUST_CODE, CUST.CUST_NAME,'
      + ' SUPMG.SUPMG_SUB_CODE FROM AGREEMENT AGR'
      + ' LEFT JOIN CUSTOMER CUST ON CUST.CUST_CODE = AGR.AGR_CUST_CODE'
      + '     AND CUST.CUST_UNT_ID = AGR.AGR_CUST_UNT_ID'
      + ' LEFT JOIN SUPLIER_MERCHAN_GRUP SUPMG ON SUPMG.SUPMG_SUB_CODE = CUST.CUST_SUPMG_SUB_CODE'
      + '     AND SUPMG.SUPMG_UNT_ID = CUST.CUST_SUPMG_UNT_ID'
      + ' WHERE SUPMG.SUPMG_CODE = '+ QuotedStr(FSuplierCode);

  end
  else
  if (Modul = mMasterAgreement) then
  begin
    s:= 'SELECT CUST_ID, CUST_CODE AS AGR_CUST_CODE, CUST_NAME'
      + ' FROM CUSTOMER'
      + ' WHERE CUST_SUP_CODE = '+ QuotedStr(FSuplierCode);

  end;

//  with cOpenQuery(s, False) do
//  begin
//    try
//      if not IsEmpty then
//      begin
//        i := 1;
//        strgGrid.RowCount := RecordCount + 1;
//
//        while not Eof do
//        begin
//          strgGrid.Cells[0, i] := FieldByName('AGR_CUST_CODE').AsString;
//          strgGrid.Cells[1, i] := FieldByName('CUST_NAME').AsString;
//          strgGrid.Cells[2, i] := IntToStr(FieldByName('CUST_ID').AsInteger);
//
//          Inc(i);
//          Next;
//        end;
//
//        strgGrid.AutoSize := True;
//      end
//      else
//      begin
//        strgGrid.RowCount := 2;
//        strgGrid.Cells[0, 1] := '';
//        strgGrid.Cells[1, 1] := '';
//        strgGrid.Cells[2, 1] := '0';
//      end;
//
//    finally
//      Free;
//    end;
//  end;
end;

procedure TfrmPopUpSelectCustomer.SetSuplierCode(const Value: string);
begin
  FSuplierCode := Value;
end;

procedure TfrmPopUpSelectCustomer.btnSelectClick(Sender: TObject);
begin
//  CustomerCode := strgGrid.Cells[0, strgGrid.Row];
//  CustomerID   := StrToInt(strgGrid.Cells[2, strgGrid.Row]);
  IsProcessSuccessfull := True;
  Close;
end;

procedure TfrmPopUpSelectCustomer.SetIsProcessSuccessfull(
  const Value: Boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmPopUpSelectCustomer.FormShow(Sender: TObject);
begin
  ParseDataCustomer;
end;

{ TfrmPopUpSelectCustomer }

procedure TfrmPopUpSelectCustomer.SetCustomerID(const Value: Integer);
begin
  FCustomerID := Value;
end;

procedure TfrmPopUpSelectCustomer.strgGridKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    btnSelectClick(Self);
end;

procedure TfrmPopUpSelectCustomer.strgGridDblClick(Sender: TObject);
begin
     btnSelectClick(Sender);
end;

procedure TfrmPopUpSelectCustomer.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Key=VK_ESCAPE) then
       Self.Close;
end;

end.
