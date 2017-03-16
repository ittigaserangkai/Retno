unit ufrmListPOCancel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, ufraFooter5Button, SUIButton,
  ComCtrls, ActnList;

type
  TfrmListPOCancel = class(TfrmMaster)
    Label2: TLabel;
    dtpFrom: TDateTimePicker;
    btnPrint: TsuiButton;
    fraFooter5Button1: TfraFooter5Button;
    actlstMembership: TActionList;
    actListPrintPOCancel: TAction;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actListPrintPOCancelExecute(Sender: TObject);
    procedure btnPrintEnter(Sender: TObject);
    procedure btnPrintExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListPOCancel: TfrmListPOCancel;

implementation

uses uSQLPurchasingOrder,suithemes, uPurchasingOrder, uConn,
  ufrmDialogPrintPreview, uRMSUnit, fr_Class, udmReportNew;

{$R *.dfm}

procedure TfrmListPOCancel.FormShow(Sender: TObject);
begin
  inherited;
  dtpFrom.Date := Now;
end;

procedure TfrmListPOCancel.FormDestroy(Sender: TObject);
begin
  inherited;
  frmListPOCancel := nil;
end;

procedure TfrmListPOCancel.actListPrintPOCancelExecute(Sender: TObject);
var
  sSQL: string;
{var
  SeparatorDate: Char;
  data: TResultDataSet;
  ParamList: TStringList;
  formatTanggalPendek: string;
 $ arrParam: TArr;}
begin
  inherited;
    sSQL :=
    'SELECT ' +
        'SP.SUP_CODE,' +
        'RTP.TPPERSH_CODE,' + 
        'SP.SUP_NAME,' + 
        'P.PO_DATE,' + 
        'P.PO_DELIVER_DATE,' +  
        'P.PO_NO,' +  
        'S.SO_DATE,' +  
        'S.SO_NO,' +  
        'P.PO_DISC AS "PO_TOTAL",' +
        'P.PO_PPN,' +  
        'P.PO_PPNBM,' +  
        'P.PO_STAPO_ID,' +  
        '(P.PO_DISC + P.PO_PPN + P.PO_PPNBM) AS "PURCHASE" ' +
    'FROM ' +
        'PO P ' +
    'LEFT JOIN SUPLIER SP ' +
        'ON SP.SUP_CODE = P.PO_SUP_CODE ' +
    'LEFT JOIN SO S ' +
        'ON S.SO_NO = P.PO_SO_NO AND S.SO_UNT_ID = P.PO_SO_UNT_ID ' +
    'LEFT JOIN REF$TIPE_PERUSAHAAN RTP ' +
        'ON SP.SUP_TPPERSH_ID = RTP.TPPERSH_ID ' +
    'WHERE ' +
        '(P.PO_DELIVER_DATE BETWEEN ' + QuotD(dtpFrom.Date) +
        ' AND ' + QuotD(dtpFrom.Date + 0.9999) + ') ' +
        ' AND P.PO_STAPO_ID = 3 ' +
        ' AND P.PO_UNT_ID = ' + IntToStr(MasterNewUnit.ID) +
    ' ORDER BY SP.SUP_CODE ';


    frVariables.Variable['loginname']    := FLoginFullname;
    frVariables.Variable['Floginname']     := FLoginUsername;
    frVariables.Variable['Floginfullname'] := FLoginFullname;
    frVariables.Variable['Funitname']      := MasterNewUnit.Nama;

    frVariables.Variable['FPODate']  := FormatDateTime('dd/mm/yyyy', dtpFrom.Date);

    dmReportNew.EksekusiReport('frListPOCancel',sSQL);

{
  SeparatorDate:= DateSeparator;
  try
    DateSeparator:= '/';
    formatTanggalPendek:= ShortDateFormat;
    ShortDateFormat:= 'mm/dd/yyyy';

    ParamList := TStringList.Create;
    ParamList.Add(FormatDateTime('dd/MM/yyyy', dtpFrom.Date));  //0
    ParamList.Add(FLoginFullname);                       //1
    ParamList.Add(MasterNewUnit.Nama);                        //2

    if not Assigned(PurchasingOrder) then
      PurchasingOrder := TPurchasingOrder.Create;
    SetLength(arrParam,1);
    arrParam[0].tipe:= ptDateTime;
    arrParam[0].data:= Trunc(dtpFrom.Date);

    data := PurchasingOrder.GetListPOCancel(arrParam);

    if not assigned(frmDialogPrintPreview) then
      frmDialogPrintPreview := TfrmDialogPrintPreview.Create(Application);

//    frmDialogPrintPreview.IsTextReport := True;
    frmDialogPrintPreview.ListParams := ParamList;
    frmDialogPrintPreview.RecordSet := data;
    frmDialogPrintPreview.FilePath := FFilePathReport+'frListPOCancel.fr3';
    SetFormPropertyAndShowDialog(frmDialogPrintPreview);
  finally
    FreeAndNil(ParamList);
    frmDialogPrintPreview.Free;
    DateSeparator := SeparatorDate;
    ShortDateFormat := formatTanggalPendek;
  end;
}
end;

procedure TfrmListPOCancel.btnPrintEnter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmListPOCancel.btnPrintExit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

end.

