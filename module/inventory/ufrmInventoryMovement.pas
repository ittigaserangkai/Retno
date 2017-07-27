unit ufrmInventoryMovement;

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
  TfrmInventoryMovement = class(TfrmMasterReport)
    Panel2: TPanel;
    Label2: TLabel;
    dtStart: TcxDateEdit;
    cxLookupGudang: TcxExtLookupComboBox;
    ckGudang: TCheckBox;
    cxLookupSupplier: TcxExtLookupComboBox;
    cxLookupGroup: TcxExtLookupComboBox;
    ckSupplier: TCheckBox;
    CheckBox2: TCheckBox;
    ckGroup: TCheckBox;
    dtEnd: TcxDateEdit;
    Label3: TLabel;
    cxGrid: TcxGrid;
    cxGridView: TcxGridDBTableView;
    cxlvMaster: TcxGridLevel;
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
  frmInventoryMovement: TfrmInventoryMovement;

implementation

{$R *.dfm}

uses uDMClient, uDMReport, uDXUtils, DateUtils;

procedure TfrmInventoryMovement.actExportExecute(Sender: TObject);
begin
  inherited;
  cxGridView.ExportToXLS();
end;

procedure TfrmInventoryMovement.actRefreshExecute(Sender: TObject);
begin
  inherited;
  LoadData;
end;

procedure TfrmInventoryMovement.ckGroupClick(Sender: TObject);
begin
  inherited;
  cxLookupGroup.Enabled := ckGroup.Checked;
  if not cxLookupGroup.Enabled then cxLookupGroup.EditValue := null;
end;

procedure TfrmInventoryMovement.ckGudangClick(Sender: TObject);
begin
  inherited;
  cxLookupGudang.Enabled := ckGudang.Checked;
  if not cxLookupGudang.Enabled then cxLookupGudang.EditValue := null;
end;

procedure TfrmInventoryMovement.ckSupplierClick(Sender: TObject);
begin
  inherited;
  cxLookupSupplier.Enabled := ckSupplier.Checked;
  if not cxLookupSupplier.Enabled then cxLookupSupplier.EditValue := null;
end;

procedure TfrmInventoryMovement.FormCreate(Sender: TObject);
begin
  inherited;
  initView;
  ckSupplierClick(Self);
  ckGroupClick(Self);
  ckGudangClick(Self);
  dtStart.Date := StartOfTheMonth(Now());
  dtEnd.Date := Now();
end;

procedure TfrmInventoryMovement.initView;
begin
  With DMClient.DSProviderClient do
  begin
    cxLookupGroup.LoadFromDS(
      MerchandiseGroup_GetDSLookup, 'REF$MERCHANDISE_GRUP_ID','MERCHANGRUP_NAME' ,
      ['REF$MERCHANDISE_GRUP_ID','REF$MERCHANDISE_ID'], Self
    );
    cxLookupSupplier.LoadFromDS(Suplier_GetDSLookup, 'SUPLIER_ID','SUP_NAME', ['SUPLIER_ID'], Self);
    cxLookupSupplier.SetMultiPurposeLookup;
    cxLookupGudang.LoadFromDS(Gudang_GetDSLookUp,'GUDANG_ID','GUD_NAME', [], Self);
  end;
end;

procedure TfrmInventoryMovement.LoadData;
begin
  cxGridView.LoadFromDS(
    DMReport.ReportClient.InvMovement_GetDS(
      dtStart.Date,
      dtEnd.Date,
      VarToStr(cxLookupGroup.EditValue),
      VarToStr(cxLookupSupplier.EditValue),
      VarToStr(cxLookupGudang.EditValue)
    ),
    Self
  );
end;

end.
