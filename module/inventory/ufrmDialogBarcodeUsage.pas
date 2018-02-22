unit ufrmDialogBarcodeUsage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  ufrmMasterDialog, System.Actions, Vcl.ActnList, ufraFooterDialog3Button,
  Vcl.ExtCtrls, uInterface, cxGraphics, System.Generics.Collections,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxControls, cxContainer,
  cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils, cxLabel, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, Vcl.StdCtrls, cxButtons, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxCheckBox, uDMClient, cxMemo, Datasnap.DBClient,
  uDBUtils, System.DateUtils, cxCurrencyEdit, uDXUtils, uModBarcodeUsage,
  cxButtonEdit, uModOrganization;

type
  TfrmDialogBarcodeUsage = class(TfrmMasterDialog, ICRUDAble)
    pnlFilter: TPanel;
    btnSearch: TcxButton;
    dtAkhirFilter: TcxDateEdit;
    lblFilterData: TcxLabel;
    dtAwalFilter: TcxDateEdit;
    lblsdFilter: TcxLabel;
    cxgrdlvlBarcodeUsage: TcxGridLevel;
    cxgrdBarcodeUsage: TcxGrid;
    pnlHeder: TPanel;
    pnlCaption: TPanel;
    lblNoBukti: TLabel;
    lblTanggal: TLabel;
    lblKeterangan: TLabel;
    edNoBukti: TcxTextEdit;
    dtTanggal: TcxDateEdit;
    memKeterangan: TcxMemo;
    cxGridDBTableBarcodeUsage: TcxGridDBTableView;
    cxGridColSupplier: TcxGridDBColumn;
    cxGridColNo: TcxGridDBColumn;
    cxGridColTgl: TcxGridDBColumn;
    cxGridColNominal: TcxGridDBColumn;
    procedure actDeleteExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
  private
    FCDSBarcodeReq: TClientDataSet;
    FCDSDetail: TClientDataset;
    function GetCDSDetail: TClientDataset;
    function IsValidate: Boolean;
    procedure SavingData;
    property CDSDetail: TClientDataset read GetCDSDetail write FCDSDetail;
  public
    procedure LoadData(AID : String);
  end;

var
  frmDialogBarcodeUsage: TfrmDialogBarcodeUsage;

implementation

uses
  uAppUtils, uConstanta, ufrmCXLookUp, udmReport, uRetnoUnit, uModelHelper,
  uModBarcodeRequest, uModApp, uModRekening, uModUnit;

{$R *.dfm}

procedure TfrmDialogBarcodeUsage.actDeleteExecute(Sender: TObject);
var
  lModBarcodeUsage: TModBarcodeUsage;
begin
  inherited;
  if TAppUtils.Confirm(CONF_VALIDATE_FOR_DELETE) then
  begin
    try
      if VarToStr(edNoBukti.EditValue) <> '' then
      begin
        lModBarcodeUsage := TModBarcodeUsage.Create;
        try
          lModBarcodeUsage := DMClient.CrudClient.RetrieveByCode(TModBarcodeUsage.ClassName, edNoBukti.EditValue) as TModBarcodeUsage;
          DMClient.CrudClient.DeleteFromDB(lModBarcodeUsage);
          TAppUtils.Information(CONF_DELETE_SUCCESSFULLY);
          ModalResult := mrOk;
        finally
          lModBarcodeUsage.Free;
        end;
      end;
    except
      TAppUtils.Error(ER_DELETE_FAILED);
      raise;
    end;
  end;
end;

procedure TfrmDialogBarcodeUsage.actPrintExecute(Sender: TObject);
begin
  inherited;
//  DmReport.ExecuteReport(
//    'reports\BarcodeUsage_Slip',
//    DMReport.ReportClient.BarcodeUsage_SlipByID(ModBarcodeUsage.ID),
//    []
//  );
end;

procedure TfrmDialogBarcodeUsage.actSaveExecute(Sender: TObject);
begin
  inherited;
  if IsValidate then
  begin
    SavingData;
  end;
end;

procedure TfrmDialogBarcodeUsage.FormCreate(Sender: TObject);
begin
  inherited;
  ClearByTag([0,1]);
  dtTanggal.Date      := Now;
  dtAwalFilter.Date   := StartOfTheMonth(Now);
  dtAkhirFilter.Date  := EndOfTheMonth(Now);

  cxGridDBTableBarcodeUsage.PrepareFromCDS(CDSDetail);
  cxGridDBTableBarcodeUsage.ApplyBestFit();
end;

procedure TfrmDialogBarcodeUsage.btnSearchClick(Sender: TObject);
var
  lModRekening: TModRekening;
begin
  inherited;
  CDSDetail.EmptyDataSet;
  FCDSBarcodeReq := TDBUtils.DSToCDS(DMClient.DSProviderClient.BarcodeRequest_GetDSOverview(StartOfTheDay(dtAwalFilter.Date), EndOfTheDay(dtAkhirFilter.Date), TRetno.UnitStore, '') ,Self );

  if FCDSBarcodeReq = nil then
    Exit;

  lModRekening := TModRekening.Create;
  try
    lModRekening := DMClient.CrudClient.RetrieveByCode(TModRekening.ClassName, TRetno.SettingApp.REKENING_PENDAPATAN_LABEL) as TModRekening;

    FCDSBarcodeReq.First;
    while not FCDSBarcodeReq.Eof do
    begin
      if FCDSBarcodeReq.FieldByName('BR_IS_INVOICED').AsInteger = 0 then
      begin
        CDSDetail.Append;
        CDSDetail.FieldByName('BU_ID').Value              := '';
        CDSDetail.FieldByName('BUI_BARCODEREQUEST').Value := FCDSBarcodeReq.FieldByName('BARCODEREQUEST_ID').AsString;
        CDSDetail.FieldByName('BUI_NOMINAL').Value        := FCDSBarcodeReq.FieldByName('TOTAL').AsFloat;
        CDSDetail.FieldByName('BUI_KETERANGAN').Value     := FCDSBarcodeReq.FieldByName('KETERANGAN').AsString;
        CDSDetail.FieldByName('BUI_REKENING').Value       := lModRekening.ID;
        CDSDetail.FieldByName('TANGGAL').Value            := FCDSBarcodeReq.FieldByName('TANGGAL').AsDateTime;
        CDSDetail.FieldByName('SUPPLIERMG').Value         := FCDSBarcodeReq.FieldByName('BR_SUPMG_ID').AsString;
        CDSDetail.FieldByName('SUPPLIER').Value           := FCDSBarcodeReq.FieldByName('NAMA').AsString;
        CDSDetail.FieldByName('NOBUKTI').Value            := FCDSBarcodeReq.FieldByName('NO').AsString;
        CDSDetail.Post;
      end;
      FCDSBarcodeReq.Next;
    end;
  finally
    lModRekening.Free;
    cxGridDBTableBarcodeUsage.ApplyBestFit();
  end;
end;

function TfrmDialogBarcodeUsage.GetCDSDetail: TClientDataset;
begin
  if not Assigned(FCDSDetail) then
  begin
    FCDSDetail := TDBUtils.CreateObjectDataSet(TModBarcodeUsageItem, Self, False);
    FCDSDetail.AddField('BU_ID', ftString);
    FCDSDetail.AddField('TANGGAL', ftDate);
    FCDSDetail.AddField('SUPPLIERMG', ftString);
    FCDSDetail.AddField('SUPPLIER', ftString);
    FCDSDetail.AddField('NOBUKTI', ftString);
    FCDSDetail.AddField('PROSES', ftString);

    FCDSDetail.IndexFieldNames := 'SUPPLIERMG';
    FCDSDetail.CreateDataSet;
  end;

  Result := FCDSDetail;
end;

function TfrmDialogBarcodeUsage.IsValidate: Boolean;
begin
  Result := False;

  if CDSDetail.IsEmpty then
  begin
    TAppUtils.Warning('Tidak ada data yang akan disimpan');
    Exit;
  end else
    Result := True;
end;

procedure TfrmDialogBarcodeUsage.LoadData(AID : String);
var
  i: Integer;
  lItem: TModBarcodeUsageItem;
  lModBarcodeUsage: TModBarcodeUsage;
begin
  ClearByTag([0,1]);
  dtTanggal.Date := Now;

  if AID = '' then Exit;

  lModBarcodeUsage := TModBarcodeUsage.Create;
  try
    lModBarcodeUsage := DMClient.CrudClient.Retrieve(TModBarcodeUsage.ClassName, AID) as TModBarcodeUsage;
    lModBarcodeUsage.BU_SUPMG.Reload();

    edNoBukti.EditValue     := lModBarcodeUsage.BU_NO;
    dtTanggal.EditValue     := lModBarcodeUsage.BU_TANGGAL;
    memKeterangan.EditValue := lModBarcodeUsage.BU_KETERANGAN;

    for i := 0 to lModBarcodeUsage.BarcodeUsageItems.Count-1 do
    begin
      lItem := lModBarcodeUsage.BarcodeUsageItems[i];
      lItem.BUI_BarcodeRequest.Reload();
      lItem.BUI_BarcodeRequest.BR_SUPMG.Reload();

      CDSDetail.Append;
      lItem.UpdateToDataset(CDSDetail);
      CDSDetail.FieldByName('ID').Value         := lModBarcodeUsage.ID;
      CDSDetail.FieldByName('SUPPLIERMG').Value := lItem.BUI_BarcodeRequest.BR_SUPMG.ID;
      CDSDetail.FieldByName('SUPPLIER').Value   := lItem.BUI_BarcodeRequest.BR_SUPMG.SUPMG_NAME;
      CDSDetail.FieldByName('NOBUKTI').Value    := lItem.BUI_BarcodeRequest.BR_NO;
      CDSDetail.FieldByName('TANGGAL').Value    := lItem.BUI_BarcodeRequest.BR_DATE;
      CDSDetail.Post;
    end;
  finally
    lModBarcodeUsage.Free;
    cxGridDBTableBarcodeUsage.ApplyBestFit();
  end;
end;

procedure TfrmDialogBarcodeUsage.SavingData;
var
  listBarcodeUsage: TobjectList<TModApp>;
  lBUItem: TModBarcodeUsageItem;
  lCDSDetail: TClientDataset;
  lModBarcodeUsage: TModBarcodeUsage;
  sSupMG: string;
begin
  sSupMG := '';
  listBarcodeUsage := TObjectList<TModApp>.Create();

  lCDSDetail := TClientDataSet.Create(Self);
  try
    lCDSDetail.CloneCursor(CDSDetail, True);

    CDSDetail.First;
    while not CDSDetail.Eof do
    begin
      if sSupMG <> CDSDetail.FieldByName('SUPPLIERMG').AsString then
      begin
        sSupMG := CDSDetail.FieldByName('SUPPLIERMG').AsString;
        lModBarcodeUsage := TModBarcodeUsage.Create;

        //check new or edit data
        if CDSDetail.FieldByName('BU_ID').AsString <> '' then
          lModBarcodeUsage := DMClient.CrudClient.Retrieve(TModBarcodeUsage.ClassName, CDSDetail.FieldByName('BU_ID').AsString) as TModBarcodeUsage
        else
          lModBarcodeUsage.BU_NO := '';

        //set header
        lModBarcodeUsage.BU_SUPMG      := TModOrganization.CreateID(sSupMG);
        lModBarcodeUsage.BU_KETERANGAN := VarToStr(memKeterangan.EditValue);
        lModBarcodeUsage.BU_TANGGAL    := dtTanggal.EditValue;
        lModBarcodeUsage.BU_TOTAL      := 0;
        lModBarcodeUsage.BU_UNIT       := TModUnit.CreateID(TRetno.UnitStore.ID);

        //set detail
        lModBarcodeUsage.BarcodeUsageItems.Clear;
        lCDSDetail.First;
        while not lCDSDetail.Eof do
        begin
          if sSupMG = lCDSDetail.FieldByName('SUPPLIERMG').AsString then
          begin
            lBUItem := TModBarcodeUsageItem.Create;
            lBUItem.SetFromDataset(lCDSDetail);
            lModBarcodeUsage.BU_TOTAL := lModBarcodeUsage.BU_TOTAL + lCDSDetail.FieldByName('BUI_NOMINAL').AsFloat;
            lModBarcodeUsage.BarcodeUsageItems.Add(lBUItem);
          end;
          lCDSDetail.Next;
        end;

        listBarcodeUsage.Add(lModBarcodeUsage);
      end;

      CDSDetail.Next;
    end;

    Try
      if DMClient.CRUDBarcodeUsageClient.SaveBatch(listBarcodeUsage) then
      begin
        FreeAndNil(listBarcodeUsage);
        TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
        ModalResult := mrOk;
      end;
    except
      TAppUtils.Error(ER_INSERT_FAILED);
      Raise;
    End;
  finally
    lCDSDetail.Free;
  end;
end;

end.
