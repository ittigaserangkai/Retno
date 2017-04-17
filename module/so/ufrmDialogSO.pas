unit ufrmDialogSO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxDBExtLookupComboBox,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, cxLookupEdit, cxDBLookupEdit, uDXUtils,
  uModSO, Datasnap.DBClient, cxCheckBox, cxCurrencyEdit, cxSpinEdit;

type
  TfrmDialogSO = class(TfrmMasterDialog)
    pnlTop: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    edtNoSO: TEdit;
    dtTgl: TcxDateEdit;
    pnl1: TPanel;
    lbl4: TLabel;
    btnAddOthersProdSO: TcxButton;
    btnToExcel: TcxButton;
    btnAddFromPOTrader: TcxButton;
    btnShow: TcxButton;
    cxGrid: TcxGrid;
    cxGridView: TcxGridDBTableView;
    clNo: TcxGridDBColumn;
    clStatus: TcxGridDBColumn;
    clPLU: TcxGridDBColumn;
    clNamaBarang: TcxGridDBColumn;
    clUOM: TcxGridDBColumn;
    clMinOrder: TcxGridDBColumn;
    clCurrStock: TcxGridDBColumn;
    clQTYSO: TcxGridDBColumn;
    clQTYOrder: TcxGridDBColumn;
    clMaxOrder: TcxGridDBColumn;
    clSuppCode: TcxGridDBColumn;
    clSuppName: TcxGridDBColumn;
    clLeadTime: TcxGridDBColumn;
    clBuyPrice: TcxGridDBColumn;
    clDisc1: TcxGridDBColumn;
    clDisc2: TcxGridDBColumn;
    clDisc3: TcxGridDBColumn;
    clNetPrice: TcxGridDBColumn;
    cxlvMaster: TcxGridLevel;
    cxLookupMerchan: TcxExtLookupComboBox;
    cxLookupSupplier: TcxExtLookupComboBox;
    lblSuppMerGroup: TLabel;
    lblSuppMerGroupOpsional: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure btnShowClick(Sender: TObject);
  private
    FCDS: TClientDataSet;
    FSO: TModSO;
    procedure GenerateSO;
    function GetCDS: TClientDataSet;
    function GetSO: TModSO;
    procedure InitView;
    function ValidateGenerate: Boolean;
    property CDS: TClientDataSet read GetCDS write FCDS;
    property SO: TModSO read GetSO write FSO;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDialogSO: TfrmDialogSO;

implementation

uses
  uDBUtils, uDMClient, uAppUtils, uClientClasses;

{$R *.dfm}

procedure TfrmDialogSO.btnShowClick(Sender: TObject);
begin
  inherited;
  GenerateSO;
end;

procedure TfrmDialogSO.FormCreate(Sender: TObject);
begin
  inherited;
  InitView;
end;

procedure TfrmDialogSO.FormDestroy(Sender: TObject);
begin
  inherited;
  SO.Free;
end;

procedure TfrmDialogSO.actSaveExecute(Sender: TObject);
begin
  inherited;
  if not ValidateEmptyCtrl([1]) then
    Exit;

  SO.SO_NO := edtNoSO.Text;
//  SO.AUTUNIT :=

end;

procedure TfrmDialogSO.GenerateSO;
var
  lCDS: TClientDataSet;
  lSO: TSuggestionOrderClient;
  SupID: string;
begin
  if not ValidateGenerate then exit;

  SupID := '';
  If not VarIsNull(cxLookupSupplier.EditValue) then SupID := cxLookupSupplier.EditValue;

  lSO := TSuggestionOrderClient.Create(DMClient.RestConn, False);
  lCDS := TClientDataSet(lSO.GenerateSO(dtTgl.Date, cxLookupMerchan.EditValue, SupID));
  CDS.DisableControls;
  Try
    CDS.EmptyDataSet;
    while not lCDS.eof do
    begin
      CDS.Append;

      CDS.FieldByName('Checked').AsBoolean := True;
      CDS.FieldByName('PLU').AsString := lCDS.FieldByName('KODEBARANG').AsString;
      CDS.FieldByName('NamaBarang').AsString := lCDS.FieldByName('NAMABARANG').AsString;
      CDS.FieldByName('UOM').AsString := lCDS.FieldByName('SATUAN').AsString;
      CDS.FieldByName('MinOrder').AsFloat := lCDS.FieldByName('MINQTY').AsFloat;
      CDS.FieldByName('MaxOrder').AsFloat :=  lCDS.FieldByName('MAXQTY').AsFloat;
      CDS.FieldByName('CurrentStock').AsFloat := lCDS.FieldByName('STOCK').AsFloat;
      CDS.FieldByName('QTYSO').AsFloat := lCDS.FieldByName('QTYSO').AsFloat;
      CDS.FieldByName('QTYOrder').AsFloat := lCDS.FieldByName('QTYSO').AsFloat;
      CDS.FieldByName('SupplierCode').AsString := lCDS.FieldByName('XXX').AsString;
      CDS.FieldByName('SupplierName').AsString := lCDS.FieldByName('XXX').AsString;
      CDS.FieldByName('LeadTime').AsString := lCDS.FieldByName('LEADTIME').AsString;
      CDS.FieldByName('BuyPrice').AsFloat := lCDS.FieldByName('BUYPRICE').AsFloat;
      CDS.FieldByName('Disc1').AsFloat := lCDS.FieldByName('DISC1').AsFloat;
      CDS.FieldByName('Disc2').AsFloat := lCDS.FieldByName('DISC2').AsFloat;
      CDS.FieldByName('Disc3').AsFloat := lCDS.FieldByName('DISC3').AsFloat;
      CDS.FieldByName('NetPrice').AsFloat := lCDS.FieldByName('NETPRICE').AsFloat;


      CDS.Post;
      lCDS.Next;
    end;
  Finally
    CDS.EnableControls;
    lSO.Free;
    lCDS.Free;
  End;
end;

function TfrmDialogSO.GetCDS: TClientDataSet;
begin
  If not Assigned(FCDS) then
  begin
    FCDS := TClientDataSet.Create(Self);
    FCDS.AddField('No',ftInteger);
    FCDS.AddField('Checked',ftBoolean);
    FCDS.AddField('PLU',ftString);
    FCDS.AddField('NamaBarang',ftString);
    FCDS.AddField('UOM',ftString);
    FCDS.AddField('MinOrder',ftFloat);
    FCDS.AddField('MaxOrder',ftFloat);
    FCDS.AddField('CurrentStock',ftFloat);
    FCDS.AddField('QTYSO',ftFloat);
    FCDS.AddField('QTYOrder',ftFloat);
    FCDS.AddField('SupplierCode',ftString);
    FCDS.AddField('SupplierName',ftString);
    FCDS.AddField('LeadTime',ftString);
    FCDS.AddField('BuyPrice',ftFloat);
    FCDS.AddField('Disc1',ftFloat);
    FCDS.AddField('Disc2',ftFloat);
    FCDS.AddField('Disc3',ftFloat);
    FCDS.AddField('NetPrice',ftFloat);

    FCDS.CreateDataSet;
  end;
  Result := FCDS;
end;

function TfrmDialogSO.GetSO: TModSO;
begin
  if FSO = nil then
    FSO := TModSO.Create;

  Result := FSO;
end;

procedure TfrmDialogSO.InitView;
begin
  With DMClient.DSProviderClient do
  begin
    cxLookupMerchan.LoadFromDS(Merchandise_GetDSLookup,
      'REF$MERCHANDISE_ID','MERCHAN_NAME' ,Self);
    cxLookupSupplier.LoadFromDS(Suplier_GetDSLookup,
      'SUPLIER_ID','SUP_NAME', ['SUPLIER_ID'], Self);
  end;

  cxGridView.LoadFromCDS(CDS);
  //inisialisasi
end;

function TfrmDialogSO.ValidateGenerate: Boolean;
begin
  Result := False;

  if VarIsNull(cxLookupMerchan.EditValue) then
  begin
    TAppUtils.Warning('Merchan Grup wajib diisi');
    cxLookupMerchan.SetFocus;
    exit;
  end;

  if CDS.RecordCount > 0 then
  begin
    if not TAppUtils.Confirm('Grid akan direset, Anda yakin akan generate SO ?') then
      exit;
  end;

  Result := True;
end;

end.
