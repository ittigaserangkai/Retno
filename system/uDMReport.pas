unit udmReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ExtCtrls, StdCtrls, Math, frxDesgn, frxClass, frxDBSet,
  frxPreview, Vcl.ComCtrls;

type
  TdmReport = class(TForm)
    frDBDataSet2: TfrxDBDataSet;
    frDBDataSet1: TfrxDBDataSet;
    frReport1: TfrxReport;
    frDesigner1: TfrxDesigner;
    TePageControl1: TPageControl;
    TeTabSheet1: TTabSheet;
    TeTabSheet2: TTabSheet;
    TePanel1: TPanel;
    frPreview1: TfrxPreview;
    bCetak: TButton;
    bTutup: TButton;
    mmo: TMemo;
    dsTemp: TDataSource;
    procedure bTutupClick(Sender: TObject);
    procedure bCetakClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FLstData: TStrings;
    { Private declarations }
    sbaris : Integer;
    FTextReportFile: string;
    procedure SetBfrPrintPakaiBarcode;
  public
    procedure cetakpo;
    procedure EksekusiReport(aReportName, aMainSQL : String; aSecondarySQL : String
        = ''; AisTextReport  : Boolean = False; AFontSize : Integer = 8; aCmdTy:
        integer = 0; aBrsPo: integer = 0);
    function IsBisaDesignReport: Boolean;
    procedure kOpenQuery(var aQry: TDataset; aSQL: string);
    property LstData: TStrings read FLstData write FLstData;
    { Public declarations }
  end;

var
  dmReport: TdmReport;

implementation

Uses uRetnoUnit, uTSCommonDlg, udmMain, HPHelp, StrUtils;

{$R *.dfm}

procedure TdmReport.EksekusiReport(aReportName, aMainSQL : String;
    aSecondarySQL : String = ''; AisTextReport  : Boolean = False; AFontSize :
    Integer = 8; aCmdTy: integer = 0; aBrsPo: integer = 0);
var
  sReportFile: string;
begin
  sbaris := aBrsPo;
  FormatSettings.DecimalSeparator := '.';
  FormatSettings.ThousandSeparator := ',';

  mmo.Lines.Clear;
  frPreview1.Clear;

  sReportFile := GetReportPath + aReportName + '.frf';

//  kOpenQuery(IBQ1, aMainSQL);

  if trim(aSecondarySQL) <> '' then  // kalo query 2 ada
  begin
//    kOpenQuery(IBQ2, aSecondarySQL);
  end;


  if IsBisaDesignReport then
  begin
    if not frReport1.LoadFromFile(sReportFile) then
    begin
      frReport1.FileName := sReportFile;
      frReport1.DesignReport;
    end
    else
    begin
      if (CommonDlg.Confirm('Anda Punya Hak Untuk Mendesain Table' + #13 + 'Apakah Anda Akan Melakukan Desain Laporan?') = mrYES) then
      begin
        frReport1.FileName := sReportFile;
        frReport1.DesignReport;
      end else
      begin
        if aCmdTy = 0  then
        begin

        end
        else if aCmdTy = 1 then
        begin
          SetBfrPrintPakaiBarcode;
        end;

        frReport1.PrepareReport;

        if AisTextReport then
        begin
          try
            FTextReportFile       := cGetAppPath + aReportName + '.txt'; // StringReplace(sReportFile,ExtractFileExt(sReportFile),'.txt',[rfReplaceAll]);
            mmo.Lines.LoadFromFile(FTextReportFile);
            mmo.Font.Size         := AFontSize;
            TePageControl1.ActivePageIndex := 0;
            ShowModal;
          finally
            if FileExists(FTextReportFile) then
              DeleteFile(FTextReportFile);
          end;
        end  else begin
          frReport1.Preview := frPreview1;
          frReport1.ShowReport;
          TePageControl1.ActivePageIndex := 1;
          ShowModal;
        end;
      end;
    end;
  end;


end;

function TdmReport.IsBisaDesignReport: Boolean;
begin
  // TODO -cMM: TDataModule1.IsBisaDesignReport default body inserted
  Result := True;
end;

procedure TdmReport.kOpenQuery(var aQry: TDataset; aSQL: string);
begin
  // TODO -cMM: TdmReportNew.kOpenQuery default body inserted
    {if not Assigned(aQry.Connection) then
    begin
         aQry.Connection:= dmMain.connGoro;
    end;

    if not Assigned(aQry.Transaction) then
    begin
         aQry.Transaction:= dmMain.transGoro;
    end;

    aQry.SQL.Clear;
    aQry.SQL.add(Asql);
    try
      aQry.open;
    except
          raise;
    end;
    }
end;

procedure TdmReport.bTutupClick(Sender: TObject);
begin
  Close;
end;

procedure TdmReport.bCetakClick(Sender: TObject);


begin
  if TePageControl1.TabIndex = 1 then
    frReport1.ShowReport //PreparedReportDlg
  else
  begin
    if  sbaris > 0 then
      cetakpo()
    else
      PrintFile(FTextReportFile);
  end;
end;

// procedure baru .. zainal
procedure TdmReport.cetakpo;
var
  i      : Integer ;
  Myfile : TextFile ;
  s      : string;
  f      : Textfile;
begin

    AssignFile(Myfile,'c:\cetakpo.txt');
    Rewrite(MyFile);

     // setting font kecil
    Write(myfile,chr(27));
    write(myfile,chr(33));
    writeln(myfile,chr(5));

    // line spacing
    Write(myfile,chr(27));
    write(myfile,chr(51));
    writeln(myfile,chr(22));

    // kursor eject
    Write(myfile,chr(27));
    write(myfile,chr(67));
    writeln(myfile,chr(sbaris));

       for i:=0  to mmo.Lines.Count -1 do
       begin
          s := mmo.Lines[i];
          if (LeftStr(Trim(s),8) = 'PT. TIGA') and (i <> mmo.Lines.Count-2) and (i <> 0) then
          begin
             Writeln(myfile,chr(12));
          end;
           Writeln(MyFile,s);
       end;

       // mengembalikan line spacing
       write(myfile,chr(27));
       writeln(myfile,chr(50));

       // mengembalikan eject
       write(myfile,chr(27));
       writeln(myfile,chr(66));

   System.CloseFile(MyFile);


  // cetak di dos prompt
    AssignFile(f, 'c:\cetak.bat');
    ReWrite(f);
    Writeln(f, 'type c:\cetakpo.txt >> lpt1 ');
    Writeln(f, 'del c:\cetak.bat');
    Writeln(f, 'del c:\cetakpo.txt');
    Closefile(f); 
    WinExec('c:\cetak.bat',SW_HIDE);

end;

procedure TdmReport.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TdmReport.FormShow(Sender: TObject);
begin
  bCetak.SetFocus;
end;

procedure TdmReport.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';
  FormatSettings.ThousandSeparator := ',';
  FLstData := TStringList.Create;
end;

procedure TdmReport.SetBfrPrintPakaiBarcode;
var
  aX: Integer;
  iLenDelta: Integer;
  aVisible: Boolean;
  iLenTgl: Integer;
  iLenItem: Integer;
  iMaxTgl: Integer;
  i: Integer;
begin
      iMaxTgl   := StrToInt(FLstData.Strings[0]);
      iLenTgl   := StrToInt(FLstData.Strings[1]);
      aX        := StrToInt(FLstData.Strings[2]);
      iLenItem  := Floor(iLenTgl / (iMaxTgl - 1));
      for i := 1 to 31  do  //maksimal jumlah tanggal dalam 1 bln
      begin
        if i > iMaxTgl then
          aVisible  := False
        else
          aVisible  := True;

        if i = iMaxTgl then
        begin
          iLenDelta := iLenTgl - (i * iLenItem);
        end
        else
          iLenDelta := 0;
 
      end;
end;

procedure TdmReport.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FLstData);
end;

end.








