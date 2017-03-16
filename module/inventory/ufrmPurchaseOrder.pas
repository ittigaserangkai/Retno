unit ufrmPurchaseOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, ufraFooter1Button, SUIButton, ComCtrls, StdCtrls,
  ExtCtrls, SUIComboBox;

type
  TfrmPrintPurchaseOrder = class(TfrmMaster)
    Label2: TLabel;
    Label3: TLabel;
    lbl4: TLabel;
    edtSupplierCode1: TEdit;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    btnShowPO: TsuiButton;
    fraFooter1Button1: TfraFooter1Button;
    Label1: TLabel;
    edtSupplierCode2: TEdit;
    lbl1: TLabel;
    cbbStatusPO: TsuiComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnShowPOClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure FetchPOStatus;
  public
    { Public declarations }
  end;

var
  frmPrintPurchaseOrder: TfrmPrintPurchaseOrder;

implementation

uses uConn, udmReport, uPurchaseOrder, DateUtils, ufrmMain,
  ufrmDialogPrintPreview, uGTSUICommonDlg, uConstanta;

{$R *.dfm}

procedure TfrmPrintPurchaseOrder.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmMain.DestroyMenu((Sender as TForm));
  Action := caFree;
end;

procedure TfrmPrintPurchaseOrder.FormDestroy(Sender: TObject);
begin
  inherited;

  frmPrintPurchaseOrder:= nil;
end;

procedure TfrmPrintPurchaseOrder.FormShow(Sender: TObject);
begin
  inherited;
  FetchPOStatus;
  dtp1.Date:= Now;
  dtp2.Date:= Now;
end;

procedure TfrmPrintPurchaseOrder.btnShowPOClick(Sender: TObject);
var SeparatorDate: Char;
  data: TResultDataSet;
  arrParam: TArr;
  ParamList: TStringList;
begin
  inherited;
  if frmMain.cbbCompCode.ItemIndex = 0 then
  begin
    CommonDlg.ShowError(ER_COMPANY_NOT_SPECIFIC);
    Exit;
  end;

  if frmMain.cbbUnit.ItemIndex = 0 then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    Exit;
  end;

  if (cbbStatusPO.Text = '') or (cbbStatusPO.ItemIndex < 0) then
  begin
    CommonDlg.ShowErrorEmpty('Status PO');
    cbbStatusPO.SetFocus;
    Exit;
  end;
  
  SeparatorDate:= DateSeparator;
  ShortDateFormat := 'mm/dd/yyyy';

  try
    DateSeparator:= '/';

    SetLength(arrParam,6);
    arrParam[0].tipe:= ptString;
    arrParam[0].data:= edtSupplierCode1.Text;
    arrParam[1].tipe:= ptString;
    arrParam[1].data:= edtSupplierCode2.Text;
    arrParam[2].tipe:= ptDateTime;
    arrParam[2].data:= StrToDateTime(FormatDateTime('mm/dd/yyyyy', dtp1.Date) + ' 00:00:00');
    arrParam[3].tipe:= ptDateTime;
    arrParam[3].data:= IncDay(StrToDateTime(FormatDateTime('mm/dd/yyyyy', dtp2.Date) + ' 00:00:00'),1);
    arrParam[4].tipe:= ptString;
    arrParam[4].data:= cbbStatusPO.Text;
    arrParam[5].tipe:= ptInteger;
    arrParam[5].data:= frmMain.UnitId;

    if not Assigned(PurchaseOrder) then
      PurchaseOrder:= TPurchaseOrder.Create;
    data:= PurchaseOrder.GetListDataPurchaseOrder(arrParam);

    if not Assigned(ParamList) then
      ParamList := TStringList.Create;
    ParamList.Add(edtSupplierCode1.Text); //0
    ParamList.Add(edtSupplierCode2.Text); //1
    ParamList.Add(FormatDateTime('dd/mm/yyyy', dtp1.Date)); //2
    ParamList.Add(FormatDateTime('dd/mm/yyyy', dtp2.Date)); //3
    ParamList.Add(frmMain.LoginUsername); //4
    ParamList.Add(cbbStatusPO.Text); //5
    ParamList.Add(frmMain.cbbUnit.Text); //6

    if not assigned(frmDialogPrintPreview) then
      frmDialogPrintPreview:= TfrmDialogPrintPreview.Create(Application);
    IF NOT DATA.ISEMPTY THEN
    BEGIN
    frmDialogPrintPreview.ListParams:= ParamList;
    frmDialogPrintPreview.RecordSet:= data;
    frmDialogPrintPreview.FilePath:= frmMain.FilePathReport + 'frPurchaseOrder.fr3';
    frmDialogPrintPreview.ShowModal;
    END;
  finally
    FreeAndNil(ParamList);
    FreeAndNil(PurchaseOrder);
    frmDialogPrintPreview.Free;
    DateSeparator:= SeparatorDate;
  end;
end;

procedure TfrmPrintPurchaseOrder.FormActivate(Sender: TObject);
begin
  inherited;
  frmPrintPurchaseOrder.Caption := 'LISTING PURCHASE ORDER';
  frmMain.CreateMenu((Sender as TForm));
end;

procedure TfrmPrintPurchaseOrder.FormCreate(Sender: TObject);
begin
  inherited;
  frmPrintPurchaseOrder.Caption := 'LISTING PURCHASE ORDER';
end;

procedure TfrmPrintPurchaseOrder.FetchPOStatus;
var
  AData: TResultDataSet;
begin
  AData:= PurchaseOrder.GetListPOStatus;
  cbbStatusPO.Clear;
  while not AData.Eof do
  begin
    cbbStatusPO. Items.Add(AData.FieldByName('STAPO_NAME').AsString);
    AData.Next;
  end;
end;

end.
