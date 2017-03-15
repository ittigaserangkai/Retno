unit ufrmSearchDataCustomer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls, SUIForm,
  Grids, BaseGrid, AdvGrid, StdCtrls;

type
  TfrmSearchDataCustomer = class(TfrmMasterDialog)
    pnl1: TPanel;
    lbl2: TLabel;
    edtData: TEdit;
    pnl2: TPanel;
    strgGrid: TAdvStringGrid;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure edtDataChange(Sender: TObject);
    procedure edtDataKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgGridDblClick(Sender: TObject);
    procedure strgGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure FindDataOnGrid(AText: string);
    procedure ParseHeaderGrid();
    procedure ParseDataGrid();
  public
    { Public declarations }
  end;

var
  frmSearchDataCustomer: TfrmSearchDataCustomer;

implementation

uses uConn, uDataCustomer, ufrmCustomerAgreement;

{$R *.dfm}

procedure TfrmSearchDataCustomer.FormShow(Sender: TObject);
begin
  inherited;
  footerDialogMaster.btnSave.Caption:= 'Select';
  ParseDataGrid;
end;

procedure TfrmSearchDataCustomer.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    footerDialogMasterbtnSaveClick(Self);
end;

procedure TfrmSearchDataCustomer.footerDialogMasterbtnSaveClick(
  Sender: TObject);
var tmp: Char;
begin
  inherited;
  frmCustomerAgreement.edtCode.Text:= strgGrid.Cells[0,strgGrid.Row];
  tmp:= Chr(VK_RETURN);
  frmCustomerAgreement.edtCodeKeyPress(frmCustomerAgreement,tmp);
  Close;
end;

procedure TfrmSearchDataCustomer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmSearchDataCustomer.FormDestroy(Sender: TObject);
begin
  inherited;
  frmSearchDataCustomer := nil;
end;

procedure TfrmSearchDataCustomer.FindDataOnGrid(AText: string);
var
  resPoint: TPoint;
begin
  if (AText <> '') then
  begin
    resPoint := strgGrid.Find(Point(0,0),AText,[fnIncludeFixed]);
    if (resPoint.Y <> -1) then
    begin
      strgGrid.ScrollInView(resPoint.X, resPoint.Y);
      strgGrid.SelectRows(resPoint.Y, 1);
    end;
  end;
end;

procedure TfrmSearchDataCustomer.edtDataChange(Sender: TObject);
begin
  inherited;
  FindDataOnGrid(edtData.Text);
end;

procedure TfrmSearchDataCustomer.ParseHeaderGrid();
begin
  with strgGrid do
  begin
    Clear;
    RowCount:= 2;
    ColCount:= 5;
    Cells[0,0]:= 'CODE';
    Cells[1,0]:= 'NAME';
    Cells[2,0]:= 'ADDRESS';
    Cells[3,0]:= 'TELEPHONE';
    Cells[4,0]:= 'CONTACT PERSON';
    AutoSize:= True;
  end;
end;

procedure TfrmSearchDataCustomer.ParseDataGrid;
var data: TResultDataSet;
    arr: TArr;
    i: Integer;
begin
  ParseHeaderGrid;
  SetLength(arr,0);
  if not assigned(DataCustomer) then
    DataCustomer := TDataCustomer.Create;
  data:= DataCustomer.GetListCustomer(arr);
  with strgGrid, data do
  begin
    if not IsEmpty then
    begin
      RowCount:= RecordCount+1;
      i:=0;
      while not Eof do
      begin
        Inc(i);
        Cells[0,i]:= fieldbyname('CUSTV_CODE').AsString;
        Cells[1,i]:= fieldbyname('CUSTV_NAME').AsString;
        Cells[2,i]:= fieldbyname('CUSTV_ADDRESS').AsString;
        Cells[3,i]:= fieldbyname('CUSTV_TELP').AsString;
        Cells[4,i]:= fieldbyname('CUSTV_CONTACT_PERSON').AsString;
        Cells[5,i]:= IntToStr(fieldbyname('CUSTV_ID').AsInteger);
        Next;
      end;
      AutoSize:= True;
    end;
  end;
end;

procedure TfrmSearchDataCustomer.edtDataKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key in [VK_DOWN]) then
    strgGrid.SetFocus;
end;

procedure TfrmSearchDataCustomer.strgGridDblClick(Sender: TObject);
begin
  inherited;
  footerDialogMasterbtnSaveClick(Self);
end;

procedure TfrmSearchDataCustomer.strgGridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  {add by didit: 19112007}
  if (Key = VK_UP) then
    if (strgGrid.Row = 1) then
    begin
      edtData.SetFocus;
      edtData.SelectAll;
    end;
end;

end.
