unit ufrmDialogJurnal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterDialog, System.Actions,
  Vcl.ActnList, ufraFooterDialog3Button, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxGridLevel, cxGrid,
  cxCurrencyEdit, uDMClient, cxContainer, cxLabel, cxTextEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxMemo, cxMaskEdit, cxDropDownEdit, cxCalendar,
  uModJurnal, uAppUtils,
  uConstanta, uDXUtils, cxDBExtLookupComboBox, cxCalc, Datasnap.DBClient,
  uDBUtils, uModRekening, uModCostCenter;

type
  TfrmDialogJurnal = class(TfrmMasterDialog)
    pnlHeader: TPanel;
    cxgrdlvlDetail: TcxGridLevel;
    cxgrdJurnal: TcxGrid;
    cxGridTableJurnal: TcxGridTableView;
    cxGridColJurKode: TcxGridColumn;
    cxGridColJurNama: TcxGridColumn;
    cxGridColJurCostCenter: TcxGridColumn;
    cxGridColJurDescription: TcxGridColumn;
    cxGridColJurDebet: TcxGridColumn;
    cxGridColJurCredit: TcxGridColumn;
    lblNo: TcxLabel;
    lblJurnalDate: TcxLabel;
    lblReferensi: TcxLabel;
    lblDescription: TcxLabel;
    dtTanggal: TcxDateEdit;
    memDesc: TcxMemo;
    edReference: TcxTextEdit;
    edNo: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure cxGridColJurKodePropertiesEditValueChanged(Sender: TObject);
  private
    FCDSAccount: TClientDataSet;
    FModJurnal: TModJurnal;
    FCDSCostCenter: TClientDataSet;
    function GetModJurnal: TModJurnal;
    procedure initView;
    procedure SimpanData;
    procedure ValidateData;
    procedure UpdateData;
    property CDSAccount: TClientDataSet read FCDSAccount write FCDSAccount;
    property CDSCostCenter: TClientDataSet read FCDSCostCenter write FCDSCostCenter;
    property ModJurnal: TModJurnal read GetModJurnal write FModJurnal;
    { Private declarations }
  public
    procedure LoadData(ID: String);
    { Public declarations }
  end;

var
  frmDialogJurnal: TfrmDialogJurnal;

implementation

{$R *.dfm}

procedure TfrmDialogJurnal.cxGridColJurKodePropertiesEditValueChanged(
  Sender: TObject);
var
  lRecordIndex: Integer;
begin
  inherited;
  //ketika kolom kode dipilih, kolom nama otomatis terisi

  //format
  //grid.datacontroller.values[ baris, kolom]

  //utk mendapatkan baris:
  lRecordIndex := cxGridTableJurnal.DataController.FocusedRecordIndex;
  cxGridTableJurnal.DataController.Values[lRecordIndex, cxGridColJurNama.Index] := CDSAccount.FieldByName('REK_NAME').AsString;

end;

procedure TfrmDialogJurnal.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
  initView;
end;

procedure TfrmDialogJurnal.actSaveExecute(Sender: TObject);
begin
  inherited;
  UpdateData;
  SimpanData;
end;

function TfrmDialogJurnal.GetModJurnal: TModJurnal;
begin
  if FModJurnal = nil then
    FModJUrnal := TModJurnal.Create;
  Result := FModJurnal;
end;

procedure TfrmDialogJurnal.initView;
begin
  With DMClient.DSProviderClient do
  begin
    CDSAccount := TDBUtils.DSToCDS(Rekening_GetDSLookup, Self); //konversi dataset ke client dataset
    TcxExtLookup(cxGridColJurKode.Properties).LoadFromCDS(
      CDSAccount, 'REKENING_ID','REK_CODE', Self
    );  //method utk mengisi property dari kolom kode, menjadi lookup dari cdsaccount

    TcxExtLookup(cxGridColJurKode.Properties).SetMultiPurposeLookup;

    CDSCostCenter := TDBUtils.DSToCDS(CostCenter_GetDSLookup, Self);
    TcxExtLookup(cxGridColJurCostCenter.Properties).LoadFromCDS(
      CDSCostCenter, 'COST_CENTER_ID','COCTER_CODE', Self
    );
  end;

//  LoadData('');
end;

procedure TfrmDialogJurnal.LoadData(ID: String);
begin
  FModJurnal := DMclient.CrudClient.Retrieve(TModJurnal.ClassName, ID) as TModJurnal;

  edNo.Text         := ModJurnal.JUR_NO;
  dtTanggal.Date    := ModJurnal.JUR_DATE;
  edReference.Text  := ModJurnal.JUR_REF_NO;
  memDesc.Text      := ModJurnal.JUR_DESCRIPTION;
end;

procedure TfrmDialogJurnal.SimpanData;
begin
//  if not ValidateEmptyCtrl([1], True, pnlBody) then exit;

  try
    DMClient.CrudClient.SaveToDB(ModJurnal);
    TAppUtils.Information(CONF_ADD_SUCCESSFULLY);
    self.ModalResult:=mrOk;
  except
    TAppUtils.Error(ER_INSERT_FAILED);
    raise;
  end;
end;

procedure TfrmDialogJurnal.ValidateData;
begin

end;

procedure TfrmDialogJurnal.UpdateData;
var
  i: Integer;
  lItem: TModJurnalItem;  //var nama bebas
begin
//header
  ModJurnal.JUR_NO          := edNo.Text;
  ModJurnal.JUR_DATE        := dtTanggal.Date;
  ModJurnal.JUR_REF_NO      := edReference.Text;
  ModJurnal.JUR_DESCRIPTION := memDesc.Text;
  ModJurnal.JUR_CREDIT      := cxGridTableJurnal.GetFooterSummary(cxGridColJurCredit);
  ModJurnal.JUR_DEBET       := cxGridTableJurnal.GetFooterSummary(cxGridColJurDebet);
//detail
  ModJurnal.JUR_JURNALITEMS.Clear; //hapus yg sudah ada, biasanya kl edit, biar ga dobel.

  for i := 0 to cxGridTableJurnal.DataController.RecordCount-1 do
    begin
      lItem := TModJurnalItem.Create;
      lItem.JURD_REKENING := TModRekening.CreateID(cxGridTableJurnal.Values(i,cxGridColJurKode.Index));
      if not VarIsNull(cxGridTableJurnal.Values(i,cxGridColJurCostCenter.Index)) then
        lItem.JURD_COCENTER := TModCostCenter.CreateID(cxGridTableJurnal.Values(i,cxGridColJurCostCenter.Index));
      if not VarIsNull(cxGridTableJurnal.Values(i,cxGridColJurDescription.Index)) then
        lItem.JURD_DESCRIPTION  := cxGridTableJurnal.Values(i,cxGridColJurDescription.Index);
      lItem.JURD_DEBET        := cxGridTableJurnal.Values(i,cxGridColJurDebet.Index);
      lItem.JURD_CREDIT       := cxGridTableJurnal.Values(i,cxGridColJurCredit.Index);
      ModJurnal.JUR_JURNALITEMS.Add(lItem)
    end;


end;

end.
