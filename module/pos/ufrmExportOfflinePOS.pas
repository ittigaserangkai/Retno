unit ufrmExportOfflinePOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls , IdBaseComponent, IdMailBox;

type
  TfrmExportOfflinePOS = class(TForm)
    pnlBody: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    dtTanggal: TDateTimePicker;
    btnExport: TButton;
    mmoExport: TMemo;
    pnlHeader: TPanel;
    lblHeader: TLabel;
    dlgSave: TSaveDialog;
    chkOnline: TCheckBox;
    idmlExpPOS: TIdMailBox;
    procedure FormShow(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
//    Cnn : TConnection;
    FDefUnitID: Integer;
    FLDateImp : TDateTime;
    { Private declarations }
    FUnitID: Integer;
  public
    { Public declarations }
    property UnitID: Integer read FUnitID write FUnitID;
  end;

var
  frmExportOfflinePOS: TfrmExportOfflinePOS;

implementation
uses uTSCommonDlg, ufrmMain, udmMain;

{$R *.dfm}

procedure TfrmExportOfflinePOS.FormShow(Sender: TObject);
var
  ssql:string;
begin
//  dtTanggal.DateTime := cGetServerTime;
  FDefUnitID := StrToInt(dmMain.getGlobalVar('UNITID'));
  sSQL := 'select UPRD_DATE from ULINK_PRD order by UPRD_DATE desc rows 1';
  {
  with cOpenQuery(sSQL) do
  begin
    try
      if not Eof then
      begin
        FLDateImp := Fields[0].AsDateTime;
      end;
    finally
      Free;
    end;
  end;
  }
end;

procedure TfrmExportOfflinePOS.btnExportClick(Sender: TObject);
var
  aListAll : TStrings;
  SS    : TStrings;
  sSql: String;
begin
  {
  if UnitID <= 0 then
  begin
    CommonDlg.ShowError('Unit Belum Dipilih');
    Close;
  end;
  if chkOnline.Checked = False then
  begin
      mmoExport.Clear;
      LoadDataSetupPOS(UnitID, FLDateImp, mmoExport);
      //LoadDataBeginningBalance(UnitID, dtTanggal.DateTime,mmoExport);
      LoadDataTransaksi(UnitID, FLDateImp,mmoExport);
      LoadDataTransaksiDetil(UnitID, FLDateImp,mmoExport);
      LoadDataTransaksiCard(UnitID, FLDateImp,mmoExport);
      LoadDataTransaksiVoucherLain(UnitID, FLDateImp,mmoExport);
      LoadDataTransaksiVoucherAssalam(UnitID, FLDateImp,mmoExport);
      LoadDataTransaksiKuponBotol(UnitID, FLDateImp,mmoExport);

      if dlgSave.Execute then
      begin
        mmoExport.Lines.SaveToFile(dlgSave.FileName);
        sSql  := 'insert into uLINK_PRD (uPRD_DATE, uPRD_UNIT, uPRD_POSCODE) values('
            + Quot(FormatDateTime('MM-DD-YYYY hh:mm:ss', cGetServerTime))
            + ', ' + IntToStr(FDefUnitID)
            + ', ' + Quot(frmMain.FPOSCode)
            + ');';
        cExecSQLDoNotUseIt(ssQL);
        CommonDlg.ShowMessage('Sukses Export file');
        cCommitTrans;

      end;
  end
  else
  begin
     aListAll := TStringList.Create;
      SS  := GetDataTransaksi(FDefUnitID,FLDateImp);
      aListALL.AddStrings(SS);
      SS.Free;

      SS  := GetDataTransaksiDetail(FDefUnitID,FLDateImp);
      aListAll.AddStrings(SS);
      SS.Free;
//
      SS  := GetDataTransaksiCard(FDefUnitID,FLDateImp);
      aListAll.AddStrings(SS);
      SS.Free;
//
      SS  := GetDataTransaksiVoucher(FDefUnitID,FLDateImp);
      aListAll.AddStrings(SS);
      SS.Free;
//
      SS  := GetDataTransaksiVoucherAssalam(FDefUnitID,FLDateImp);
      aListAll.AddStrings(SS);
      SS.Free;
//
      SS  := GetDataTransaksiKuponBotol(FDefUnitID,FLDateImp);
      aListAll.AddStrings(SS);
      SS.Free;

      SS  := GetDatasetuppos(FDefUnitID,FLDateImp);
      aListAll.AddStrings(SS);
      SS.Free;


     try
      aListAll.SaveToFile(FormatDateTime('DDMMYYYYhhmmss', cGetServerTime) + '.txt');
      Cnn.kExecuteSQLs(aListAll);
      Cnn.cCommitTrans;
      sSql  := 'insert into uLINK_PRD (uPRD_DATE, uPRD_UNIT, uPRD_POSCODE) values('
            + Quot(FormatDateTime('MM-DD-YYYY hh:mm:ss', cGetServerTime))
            + ', ' + IntToStr(FDefUnitID)
            + ', ' + Quot(frmMain.FPOSCode)
            + ');';
      cExecSQLDoNotUseIt(ssQL);
      CommonDlg.ShowMessage('Sukses Export file');
      cCommitTrans; 
    except
      CommonDlg.ShowError('Gagal Export file');
      exit;
    end;
  end;
  }
end;

procedure TfrmExportOfflinePOS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

end.
