unit ufrmPilihUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, StdCtrls, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, uModUnit,
  cxNavigator, uDMClient, Datasnap.DBClient, uDXUtils;

type
  TfrmPilihCabang = class(TForm)
    cbbUnit: TcxExtLookupComboBox;
    lblCabang: TLabel;
    btnPilih: TButton;
    cxGridRepCabang: TcxGridViewRepository;
    cxGridDBTableCabang: TcxGridDBTableView;
    cxgrdbclmnGridDBTableCabangColumnKode: TcxGridDBColumn;
    cxgrdbclmnGridDBTableCabangColumnNama: TcxGridDBColumn;
    procedure btnPilihClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FCDSUnit: TClientDataSet;
    function GetCDSUnit: TClientDataSet;
    procedure InisialisasiDataCabang;
    property CDSUnit: TClientDataSet read GetCDSUnit write FCDSUnit;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPilihCabang: TfrmPilihCabang;

implementation
uses
  uAppUtils, uDBUtils, uRetnoUnit;

{$R *.dfm}

procedure TfrmPilihCabang.btnPilihClick(Sender: TObject);
begin
  TRetno.UnitStore := TModUnit(DMClient.CrudClient.Retrieve(TModUnit.ClassName, cbbUnit.EditValue));
  TAppUtils.TulisRegistry('UnitStore', TRetno.UnitStore.ID);
end;

procedure TfrmPilihCabang.FormCreate(Sender: TObject);
begin
  InisialisasiDataCabang;
end;

function TfrmPilihCabang.GetCDSUnit: TClientDataSet;
begin
  if not assigned(FCDSUnit) then
    FCDSUnit := Tdbutils.DSToCDS(DMClient.DSProviderClient.Unit_GetDSLookUp, self);

  Result := FCDSUnit;
end;

procedure TfrmPilihCabang.InisialisasiDataCabang;
begin
  cbbUnit.Properties.LoadFromCDS(CDSUnit,'AUT$UNIT_ID', 'UNT_NAME', ['AUT$UNIT_ID'] , self);
  cbbUnit.Properties.SetMultiPurposeLookup;
end;

end.
