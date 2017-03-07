unit ufrmRekapitulasiCN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, ActnList, StdCtrls, ExtCtrls, SUIButton, ComCtrls,
  ufraFooter1Button, DateUtils;

type
  TfrmRekapitulasiCN = class(TfrmMaster)
    fraFooter1Button1: TfraFooter1Button;
    dtp1: TDateTimePicker;
    Label1: TLabel;
    btn2: TsuiButton;
    ActionList1: TActionList;
    actPrintRekapitulasiCN: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure actPrintRekapitulasiCNExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn2Enter(Sender: TObject);
    procedure btn2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRekapitulasiCN: TfrmRekapitulasiCN;

implementation

uses uConn,suithemes, udmReport, uGTSUICommonDlg,
  ufrmDialogPrintPreview,  uRekapitulasiCN;

{$R *.dfm}

procedure TfrmRekapitulasiCN.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  Action:= caFree;
end;

procedure TfrmRekapitulasiCN.FormDestroy(Sender: TObject);
begin
  inherited;

  frmRekapitulasiCN:= nil;
end;

procedure TfrmRekapitulasiCN.actPrintRekapitulasiCNExecute(
  Sender: TObject);
var SeparatorDate: Char;
  data: TResultDataSet;
  arrParam: TArr;
  ParamList: TStringList;
begin
  inherited;

  SeparatorDate:= FormatSettings.DateSeparator;

  try
    FormatSettings.DateSeparator:= '/';

    SetLength(arrParam,2);
    arrParam[0].tipe:= ptDateTime;
    arrParam[0].data:= DateOf(dtp1.Date);
    arrParam[1].tipe:= ptDateTime;
    arrParam[1].data:= MasterNewUnit.ID;

    if not Assigned(RekapitulasiCN) then
      RekapitulasiCN:= TRekapitulasiCN.Create;
    data:= RekapitulasiCN.GetListDataRekapCN(arrParam);

    if not Assigned(ParamList) then
      ParamList := TStringList.Create;

    ParamList.Add(FormatDateTime('dd/mm/yyyy', dtp1.Date)); //0
    ParamList.Add(MasterNewUnit.Nama); //1

    if not assigned(frmDialogPrintPreview) then
      frmDialogPrintPreview:= TfrmDialogPrintPreview.Create(Application);

    frmDialogPrintPreview.ListParams:= ParamList;
    frmDialogPrintPreview.RecordSet:= data;
    frmDialogPrintPreview.FilePath:= FFilePathReport+'frRekapCN.fr3';
    SetFormPropertyAndShowDialog(frmDialogPrintPreview);

  finally
    FreeAndNil(ParamList);
    frmDialogPrintPreview.Free;
    FreeAndNil(RekapitulasiCN);
    FormatSettings.DateSeparator:= SeparatorDate;
  end;
end;

procedure TfrmRekapitulasiCN.FormShow(Sender: TObject);
begin
  inherited;

  dtp1.DateTime:= Now;
end;

procedure TfrmRekapitulasiCN.btn2Enter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmRekapitulasiCN.btn2Exit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

end.

