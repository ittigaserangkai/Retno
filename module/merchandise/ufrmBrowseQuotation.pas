unit ufrmBrowseQuotation;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterBrowse, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  System.Actions, Vcl.ActnList, ufraFooter4Button, Vcl.StdCtrls, cxButtons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC, Vcl.ExtCtrls;

type
  TfrmBrowseQuotation = class(TfrmMasterBrowse)
    btnActivate: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure btnActivateClick(Sender: TObject);
    procedure cxGridViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
        APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
        ANewItemRecordFocusingChanged: Boolean);
  private
    { Private declarations }
  protected
  public
    procedure RefreshData; override;
    { Public declarations }
  end;

var
  frmBrowseQuotation: TfrmBrowseQuotation;

implementation

uses
  ufrmDialogQuotation, uDMClient, uDXUtils;

{$R *.dfm}

procedure TfrmBrowseQuotation.FormCreate(Sender: TObject);
begin
  inherited;
  btnActivate.Visible := False;
end;

procedure TfrmBrowseQuotation.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogQuotation);
end;

procedure TfrmBrowseQuotation.actEditExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogQuotation,
    cxGridView.DS.FieldByName('Quotation_ID').AsString);
end;

procedure TfrmBrowseQuotation.btnActivateClick(Sender: TObject);
var
  frm: TfrmDialogQuotation;
  lResult: Integer;
begin
  frm := TfrmDialogQuotation.Create(Application);
  Self.Enabled := False;
  Try
    frm.LoadData(cxGridView.DS.FieldByName('Quotation_ID').AsString);
    frm.InitActivation(True);
    lResult := frm.ShowModal;
    if (AutoRefreshData) and (lResult = mrOk) then RefreshData;
  Finally
    FreeAndNil(frm);
    Self.Cursor := crDefault;
    Self.Enabled := True;
    Self.SetFocusRec(cxGrid);
  End;
end;

procedure TfrmBrowseQuotation.cxGridViewFocusedRecordChanged(Sender:
    TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord:
    TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
var
  lDS: TDataSet;
begin
  inherited;
  lDS := cxGridView.DS;
  if not Assigned(lDS) then exit;
  if lDS.Eof then exit;

  btnActivate.Left := btnSearch.Left-btnActivate.Width;
  btnActivate.Visible := cxGridView.DS.FieldByName('ISPROCESSED').AsInteger = 0;

end;

procedure TfrmBrowseQuotation.RefreshData;
begin
  cxGridView.LoadFromDS(
    DMClient.DSProviderClient.Quotation_GetDSOverview(dtAwalFilter.Date, dtAkhirFilter.Date),
    Self
  );
  cxGridView.SetVisibleColumns(['Quotation_ID'], False);
end;

end.
