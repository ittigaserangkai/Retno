unit ufrmCrazyPrice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, StdCtrls, ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer, Vcl.ComCtrls, dxCore,
  cxDateUtils, Vcl.Menus, System.Actions, ufraFooter4Button, cxButtons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC, Vcl.ActnList, uDBUtils, uDXUtils,
  Datasnap.DBClient, uDMClient, System.DateUtils, ufrmDialogCrazyPrice,
  cxCheckBox, cxCurrencyEdit;

type
  TfrmCrazyPrice = class(TfrmMasterBrowse)
    chkPilih: TcxCheckBox;
    cxGridColCPPilih: TcxGridDBColumn;
    cxGridColTanggal: TcxGridDBColumn;
    cxGridColKode: TcxGridDBColumn;
    cxGridColNama: TcxGridDBColumn;
    cxGridColCOGS: TcxGridDBColumn;
    cxGridColDiskon: TcxGridDBColumn;
    cxGridColMarkUp: TcxGridDBColumn;
    cxGridColHargaJualPPN: TcxGridDBColumn;
    cxGridColAwal: TcxGridDBColumn;
    cxGridColAkhir: TcxGridDBColumn;
    cxGridColCreated: TcxGridDBColumn;
    cxGridColModified: TcxGridDBColumn;
    cxGridColSatuan: TcxGridDBColumn;
    cxGridColPPN: TcxGridDBColumn;
    cxGridColOrgCode: TcxGridDBColumn;
    cxGridColOrgName: TcxGridDBColumn;
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure chkPilihClick(Sender: TObject);
    procedure cxGridViewEditing(Sender: TcxCustomGridTableView; AItem:
        TcxCustomGridTableItem; var AAllow: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    FCDS: TClientDataset;
    { Private declarations }
    //procedure ParseHeaderGrid;
    //procedure GetListAllCrazyPrice;
    //procedure ParseDataGrid(AData: TResultDataSet);
  public
    procedure RefreshData; override;
    { Public declarations }
  end;

var
  frmCrazyPrice: TfrmCrazyPrice;

implementation

uses uTSCommonDlg, uConstanta, uRetnoUnit, uAppUtils;

{$R *.dfm}

procedure TfrmCrazyPrice.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogCrazyPrice)
end;

procedure TfrmCrazyPrice.actEditExecute(Sender: TObject);
var
  sIDs: string;
begin
  inherited;
  if FCDS = nil then
    Exit;

  sIDs := '';

  FCDS.First;
  while not FCDS.Eof do
  begin
    if FCDS.FieldByName('pilih').AsBoolean then
    begin
      if sIDs = '' then
        sIDs := FCDS.FieldByName('CRAZYPRICE_ID').AsString
      else
        sIDs := sIDs + ',' + FCDS.FieldByName('CRAZYPRICE_ID').AsString;
    end;

    FCDS.Next;
  end;

  if sIDs = '' then
  begin
    TAppUtils.Warning('Pilih Data Yang Akan Diedit Terlebih Dahulu');
    Exit;
  end;
  ShowDialogForm(TfrmDialogCrazyPrice, sIDs);
end;

procedure TfrmCrazyPrice.chkPilihClick(Sender: TObject);
begin
  inherited;
  if FCDS = nil then
    Exit;

  FCDS.First;

  while not FCDS.Eof do
  begin
    FCDS.Edit;
    FCDS.FieldByName('pilih').AsBoolean := chkPilih.Checked;
    FCDS.Post;

    FCDS.Next;
  end;

end;

procedure TfrmCrazyPrice.cxGridViewEditing(Sender: TcxCustomGridTableView;
    AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
  inherited;
  AAllow := AItem.Index = 0;
end;

procedure TfrmCrazyPrice.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmCrazyPrice.FormDestroy(Sender: TObject);
begin
  inherited;
  frmCrazyPrice := nil;
end;

procedure TfrmCrazyPrice.RefreshData;
begin
  inherited;

  if Assigned(FCDS) then FreeAndNil(FCDS);

  chkPilih.Checked := False;
  FCDS := TDBUtils.DSToCDS(DMClient.DSProviderClient.CrazyPrice_GetDSOverview(StartOfTheDay(dtAwalFilter.Date), EndOfTheDay(dtAkhirFilter.Date)) ,Self );
  cxGridView.LoadFromCDS(FCDS);

  cxGridView.SetVisibleColumns(['CRAZY_DISC_NOMINAL',
                                'CRAZY_ORGANIZATION_ID',
                                'CRAZY_SELLPRICE_DISC',
                                'CRAZY_BARANG_ID',
                                'CRAZY_KONVERSI',
                                'CRAZY_SATUAN_ID',
                                'CRAZY_ORGANIZATION_ID',
                                'DATE_CREATE',
                                'DATE_MODIFY',
                                'CRAZYPRICE_ID'],False);

  cxGridView.Columns[0].Width := 100;
end;

end.


