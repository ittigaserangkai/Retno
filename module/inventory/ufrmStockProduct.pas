unit ufrmStockProduct;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterReport, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxControls, cxContainer,
  cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
  cxTextEdit, cxMaskEdit, cxCalendar;

type
  TfrmStockProduct = class(TfrmMasterReport)
    Panel2: TPanel;
    Label2: TLabel;
    dtEnd: TcxDateEdit;
    cxLookupGudang: TcxExtLookupComboBox;
    ckGudang: TCheckBox;
    cxLookupSupplier: TcxExtLookupComboBox;
    cxLookupGroup: TcxExtLookupComboBox;
    ckSupplier: TCheckBox;
    CheckBox2: TCheckBox;
    cxGrid: TcxGrid;
    cxGridView: TcxGridDBTableView;
    cxlvMaster: TcxGridLevel;
    ckGroup: TCheckBox;
    procedure actExportExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure ckGroupClick(Sender: TObject);
    procedure ckGudangClick(Sender: TObject);
    procedure ckSupplierClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure initView;
    procedure LoadData;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmStockProduct: TfrmStockProduct;

implementation

uses
  uDMClient, uDXUtils, uDMReport;

{$R *.dfm}

procedure TfrmStockProduct.actExportExecute(Sender: TObject);
begin
  inherited;
  cxGridView.ExportToXLS();
end;

procedure TfrmStockProduct.actRefreshExecute(Sender: TObject);
begin
  inherited;
  LoadData;
end;

procedure TfrmStockProduct.ckGroupClick(Sender: TObject);
begin
  inherited;
  cxLookupGroup.Enabled := ckGroup.Checked;
  if not cxLookupGroup.Enabled then cxLookupGroup.EditValue := null;
end;

procedure TfrmStockProduct.ckGudangClick(Sender: TObject);
begin
  inherited;
  cxLookupGudang.Enabled := ckGudang.Checked;
  if not cxLookupGudang.Enabled then cxLookupGudang.EditValue := null;
end;

procedure TfrmStockProduct.ckSupplierClick(Sender: TObject);
begin
  inherited;
  cxLookupSupplier.Enabled := ckSupplier.Checked;
  if not cxLookupSupplier.Enabled then cxLookupSupplier.EditValue := null;
end;

procedure TfrmStockProduct.FormCreate(Sender: TObject);
begin
  inherited;
  initView;
  ckSupplierClick(Self);
  ckGroupClick(Self);
  ckGudangClick(Self);
  dtEnd.Date := Now();
end;

procedure TfrmStockProduct.initView;
begin
  With DMClient.DSProviderClient do
  begin
    cxLookupGroup.LoadFromDS(
      MerchandiseGroup_GetDSLookup, 'REF$MERCHANDISE_GRUP_ID','MERCHANGRUP_NAME' ,
      ['REF$MERCHANDISE_GRUP_ID','REF$MERCHANDISE_ID'], Self
    );
    cxLookupSupplier.LoadFromDS(Suplier_GetDSLookup, 'SUPLIER_ID','SUP_NAME', ['SUPLIER_ID'], Self);
    cxLookupGudang.LoadFromDS(Gudang_GetDSLookUp,'GUDANG_ID','GUD_NAME', [], Self);
  end;
end;

procedure TfrmStockProduct.LoadData;
begin
  cxGridView.LoadFromDS(
    DMReport.ReportClient.StockProduct_GetDS(
      dtEnd.Date,
      VarToStr(cxLookupGroup.EditValue),
      VarToStr(cxLookupSupplier.EditValue),
      VarToStr(cxLookupGudang.EditValue)
    ),
    Self
  );
end;

end.
