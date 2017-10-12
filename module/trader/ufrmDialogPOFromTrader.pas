unit ufrmDialogPOFromTrader;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialogBrowse, ufraFooterDialog2Button, ExtCtrls,
  StdCtrls, frxClass, DateUtils, ActnList,
  System.Actions, ufraFooterDialog3Button, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, cxLabel, cxCurrencyEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxButtonEdit, cxMemo;

type
  TFormMode = (fmAdd, fmEdit);
  TModul    = (mPOFromTrader, mPriceConf, mNone);
  TfrmDialogPOFromTrader = class(TfrmMasterDialogBrowse)
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    dtTgl: TcxDateEdit;
    lbl5: TLabel;
    lbl9: TLabel;
    lbl6: TLabel;
    edTotalPO: TcxCurrencyEdit;
    lblIsMember: TLabel;
    edNoBukti: TcxTextEdit;
    lblOrganizasi: TLabel;
    edOrganization: TcxButtonEdit;
    edOrganizationName: TcxButtonEdit;
    edTipeMember: TcxTextEdit;
    edLeadTime: TcxTextEdit;
    edTOP: TcxTextEdit;
    memDescription: TcxMemo;
    lblDesc: TLabel;
    cxGridColGridViewColumn1: TcxGridDBColumn;
    cxGridColGridViewColumn2: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
    procedure ShowPriceConfirmation(aID : Integer);
    { Public declarations }
  published
  end;

var
  frmDialogPOFromTrader: TfrmDialogPOFromTrader;

implementation

uses
  uTSCommonDlg, uConstanta, StrUtils, ufrmPOFromTrader, uAppUtils, uRetnoUnit;

{$R *.dfm}

procedure TfrmDialogPOFromTrader.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmDialogPOFromTrader.ShowPriceConfirmation(aID : Integer);
//var
//  SS: TStrings;
//  i: Integer;
//  sSQL: string;
begin
  {SS := TStringList.Create;
  try
    Self.Enabled := False;
    for i := 1 to strgGrid.RowCount - 1 do
    begin
      if Trim(strgGrid.Cells[_KolKode,i]) = '' then
        Continue;

      sSQL := 'Insert Into TEMP_LAPORAN (LAPORAN_ID,user_id,char1,char2,char3,'
              + ' char4,char5,char6,num1,num2,num3,num4) values('
              + IntToStr(aID) + ','
              + IntToStr(aID) + ','
              + Quot(cbTraderCode.Text) + ','
              + Quot(edtTraderName.Text) + ','
              + Quot(cbTipeHarga.Text) + ','
              + Quot(strgGrid.Cells[_KolKode,i]) + ','
              + Quot(strgGrid.Cells[_KolAlias,i]) + ','
              + Quot(strgGrid.Cells[_KolSatCode,i]) + ','

              + FormatFloat('0.00',strgGrid.Floats[_KolHarga,i]) + ','
              + FormatFloat('0.00',strgGrid.Floats[_KolDiscMember,i]) + ','
              + FormatFloat('0.00',strgGrid.Floats[_KolQTY,i]) + ','
              + FormatFloat('0.00',strgGrid.Floats[_KolTOtalHarga,i]) + ');';
      SS.Add(sSQL);
    end;

    if kExecuteSQLsNoBlob(SS) then
    begin
       sSQL := ' select ' + GetCompanyHeader(FLoginUsername, FDialogUnitName,cGetServerTime,cGetServerTime)
               + 'char1 as KodeTrader, char2 as NamaTrader, char3 as TipeHarga, char4 as KodeBrg,'
               + ' char5 as NamaBarang, char6 as Satuan, num1 as Harga, num2 as Diskon, num3 as Qty,num4 as Total'
               + ' from TEMP_LAPORAN'
               + ' where LAPORAN_ID = ' + IntToStr(aID)
               + ' and user_ID = ' + IntToStr(aID);

       dmReportNew.EksekusiReport('PriceConfirmation',sSQL,'',True);
    end
    else
      cRollbackTrans;
  finally
    cRollbackTrans;
    SS.Free;
    Self.Enabled := True;
  end;
   }
end;

end.



