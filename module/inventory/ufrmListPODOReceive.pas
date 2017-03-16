unit ufrmListPODOReceive;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, SUIButton, ComCtrls, uConn, JclStrings,
  ufraFooter5Button, ActnList;

type
  TfrmPODOReceive = class(TfrmMaster)
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    dtpFrom: TDateTimePicker;
    dtpTo: TDateTimePicker;
    btnPrint: TsuiButton;
    edtPOFrom: TEdit;
    edtPOTo: TEdit;
    Label5: TLabel;
    fraFooter5Button1: TfraFooter5Button;
    actlstPODOReceive: TActionList;
    actListPrintPODOReceive: TAction;
    procedure btnPrintClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actListPrintPODOReceiveExecute(Sender: TObject);
    procedure btnPrintEnter(Sender: TObject);
    procedure btnPrintExit(Sender: TObject);
    procedure edtPOFromKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPOToKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPODOReceive: TfrmPODOReceive;

implementation

uses uPurchasingOrder,suithemes, ufrmDialogPrintPreview,  uGTSUICommonDlg, fr_Class, uRMSUnit,
  udmReportNew;

{$R *.dfm}

procedure TfrmPODOReceive.btnPrintClick(Sender: TObject);
begin
  actListPrintPODOReceiveExecute(Sender);
end;

procedure TfrmPODOReceive.FormDestroy(Sender: TObject);
begin
  inherited;
  frmPODOReceive := nil;
end;

procedure TfrmPODOReceive.FormShow(Sender: TObject);
begin
  inherited;
  dtpFrom.Date := Now;
  dtpTo.Date := Now;
end;

procedure TfrmPODOReceive.actListPrintPODOReceiveExecute(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
  edtPOFrom.Text := Trim(edtPOFrom.Text);
  edtPOTo.Text := Trim(edtPOTo.Text);

  if (edtPOFrom.Text = '') and (edtPOTo.Text <> '') then edtPOFrom.Text := edtPOTo.Text
  else if (edtPOTo.Text = '') and (edtPOFrom.Text <> '') then edtPOTo.Text := edtPOFrom.Text;

  if (edtPOFrom.Text <> '') and (edtPOTo.Text <> '') then
  begin
    edtPOFrom.Text := StrPadLeft(edtPOFrom.Text, 10, '0');
    edtPOTo.Text := StrPadLeft(edtPOTo.Text, 10, '0');

    sSQL :=
       'SELECT ' +
           'DA.DOAS_NO,' +
           'DA.DOAS_POAS_NO,' +
           'PA.POAS_DATE,' +
           'DA.DOAS_DATE,' +
           'T.TRD_CODE,' +
           'T.TRD_NAME,' +
           'T.TRD_ADDRESS,' +
           'T.TRD_TELP,' +
           'T.TRD_NPWP,' +
           'T.TRD_TOP, ' +
           'DA.DOAS_DESCRIPTION,' +
           'DA.DOAS_STATUS,' +
           'DA.DOAS_TOTAL_RECIPT,' +
           'DA.OP_CREATE,' +
           'DAD.DOASD_ID,' +
           'DAD.DOASD_BRG_CODE,' +
           'B.BRG_NAME,' +
           'B.BRG_MERK,' +
           'RP.PJK_CODE,' +
           'DAD.DOASD_SAT_CODE,' +
           'DAD.DOASD_SELL_PRICE,' +
           'DAD.DOASD_SELL_PRICE_DISC,' +
           'DAD.DOASD_DISC,' +
           'DAD.DOASD_PPN,' +
           'DAD.DOASD_PPNBM,' +
           'DAD.DOASD_QTY_RECEIPT,' +
           'DAD.DOASD_TOTAL_PRICE_RECEIPT,' +
           'DAD.DOASD_DISC_MEMBER_RECEIPT,' +
           'DAD.DOASD_COGS,' +
           'DAD.DOASD_LAST_COST ' +
       'FROM ' +
           'DO_ASSGROS DA ' +
       'LEFT JOIN DO_ASSGROS_DETIL DAD ' +
          'ON DA.DOAS_NO = DAD.DOASD_DOAS_NO ' +
           'AND DA.DOAS_UNT_ID = DAD.DOASD_DOAS_UNT_ID ' +
       'LEFT JOIN TRADER T ' +
          'ON T.TRD_ID = DA.DOAS_TRD_ID ' +
           'AND T.TRD_UNT_ID = DA.DOAS_TRD_UNT_ID ' +
       'LEFT JOIN BARANG B ' +
          'ON B.BRG_CODE = DAD.DOASD_BRG_CODE ' +
       'LEFT JOIN PO_ASSGROS PA ' +
          'ON DA.DOAS_POAS_NO = PA.POAS_NO ' +
           'AND DA.DOAS_POAS_UNT_ID = PA.POAS_UNT_ID ' +
       'LEFT JOIN REF$PAJAK RP ' +
          'ON B.BRG_PJK_ID = RP.PJK_ID ' +
       'WHERE ' + 
           'DA.DOAS_STATUS =   ''RECEIPT'' ' +
           ' AND DA.DOAS_POAS_NO BETWEEN ' + QuotedStr(edtPOFrom.Text) +
           ' AND ' + QuotedStr(edtPOTo.Text) +
           ' AND DA.DOAS_DATE BETWEEN ' + QuotD(dtpFrom.Date) +
           ' AND ' + QuotD(dtpTo.Date) +
           ' AND DA.DOAS_UNT_ID = ' + IntToStr(MasterNewUnit.ID);


    frVariables.Variable['loginname']    := FLoginFullname;
    frVariables.Variable['unitname']     := MasterNewUnit.Nama;

    frVariables.Variable['FDtDOFrom']  := FormatDateTime('dd/mm/yyyy', dtpFrom.Date);
    frVariables.Variable['FDtDOTo']    := FormatDateTime('dd/mm/yyyy', dtpTo.Date);
    frVariables.Variable['FPONoFrom']  := edtPOFrom.Text;
    frVariables.Variable['FPONoTo']    := edtPOTo.Text;

    dmReportNew.EksekusiReport('frListPODOReceive',sSQL);

  end
  else
    CommonDlg.ShowError('No PO Diisi dulu');
end;

procedure TfrmPODOReceive.btnPrintEnter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmPODOReceive.btnPrintExit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

procedure TfrmPODOReceive.edtPOFromKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sSQL: string;
begin
  inherited;
  sSQL := 'SELECT PA.POAS_NO,PA.POAS_DATE,PA.POAS_DATE,T.TRD_CODE,T.TRD_NAME,T.TRD_ADDRESS,T.TRD_TOP '
       +  ' FROM PO_ASSGROS PA '
       +  ' LEFT JOIN TRADER T ON T.TRD_ID = PA.POAS_TRD_ID AND T.TRD_UNT_ID = PA.POAS_TRD_UNT_ID '
       +  ' WHERE PA.POAS_UNT_ID = ' + IntToStr(MasterNewUnit.ID);
  if (Key = VK_F5) then
  Begin
    with cLookUp('Daftar PO RECEIVE', sSQL) do
    begin
      try
        if Strings[0] = '' then Exit;
        edtPOFrom.Text := Strings[0];
      finally
        Free;
      end;

    end;
  end

end;

procedure TfrmPODOReceive.edtPOToKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sSQL: string;
begin
  inherited;
  sSQL := 'SELECT PA.POAS_NO,PA.POAS_DATE,PA.POAS_DATE,T.TRD_CODE,T.TRD_NAME,T.TRD_ADDRESS,T.TRD_TOP '
       +  ' FROM PO_ASSGROS PA '
       +  ' LEFT JOIN TRADER T ON T.TRD_ID = PA.POAS_TRD_ID AND T.TRD_UNT_ID = PA.POAS_TRD_UNT_ID '
       +  ' WHERE PA.POAS_UNT_ID = ' + IntToStr(MasterNewUnit.ID);
  if (Key = VK_F5) then
  Begin
    with cLookUp('Daftar PO RECEIVE', sSQL) do
    begin
      try
        if Strings[0] = '' then Exit;
        edtPOTo.Text := Strings[0];
      finally
        Free;
      end;

    end;
  end

end;

end.

