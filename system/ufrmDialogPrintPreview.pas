unit ufrmDialogPrintPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls, StdCtrls, DB,
  frxClass, frxPreview, System.Actions, Vcl.ActnList, ufraFooterDialog3Button,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxTextEdit, cxMemo;

type
  TfrmDialogPrintPreview = class(TfrmMasterDialog)
    pnlTop: TPanel;
    dlgSaveFile: TSaveDialog;
    mmoPreview: TcxMemo;
    fpwPreview: TfrxPreview;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    FFilePath: string;
    FListParams: TStringList;
    FRecordSet: TDataSet;
    FIsTextReport: Boolean;
    FMainSQL: string;
    FSecondarySQL: string;
    FTextReportFile: string;
    procedure LoadDataPrintPreview;
    procedure SetFilePath(const Value: string);
    procedure SetListParams(const Value: TStringList);
    procedure SetRecordSet(const Value: TDataSet);
  public
    IsReportLama: Boolean;
    function IsBisaDesignReport: Boolean;
    procedure ShowReport(aReportFile : String; aMainSQL : String; aSecondarySQL :
        String;  aIsTextReport : Boolean = False);
    property FilePath: string read FFilePath write SetFilePath;
    property IsTextReport: Boolean read FIsTextReport write FIsTextReport;
    property ListParams: TStringList read FListParams write SetListParams;
    property MainSQL: string read FMainSQL write FMainSQL;
    property RecordSet: TDataSet read FRecordSet write SetRecordSet;
    property SecondarySQL: string read FSecondarySQL write FSecondarySQL;
    property TextReportFile: string read FTextReportFile write FTextReportFile;
  end;

const
  DEFAULT_HEIGHT = 640;
  DEFAULT_WIDTH = 800;

var
  frmDialogPrintPreview: TfrmDialogPrintPreview;

implementation

uses uRetnounit, frxDBSet, uTSCommonDlg, TypInfo;

{$R *.dfm}

procedure TfrmDialogPrintPreview.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  IsReportLama := True;
  Action := caFree;
end;

procedure TfrmDialogPrintPreview.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogPrintPreview := nil;
end;

procedure TfrmDialogPrintPreview.LoadDataPrintPreview;
begin
  {with dmReport do
  begin
    Params := ListParams;
    frxDBDataset.DataSet := RecordSet;
    pMainReport.LoadFromFile(FilePath);
    pMainReport.PrepareReport;
    pMainReport.Preview := fpwPreview;
  end;

	if IsTextReport then
  begin
	  with dmReport do
  	begin
	    //frxeText.ShowDialog := False;
  	  frxeText.EmptyLines := True;
    	frxeText.PrintAfter := False;
	    frxeText.LeadSpaces := False;
      TextReportFile := StringReplace(FilePath,ExtractFileExt(FilePath),'.txt',[rfReplaceAll]);
  	  frxeText.FileName := TextReportFile;
    	pMainReport.Export(frxeText);
    end;

  	mmoPreview.Clear;
  	mmoPreview.Lines.LoadFromFile(TextReportFile);
    fpwPreview.Visible := False;
		mmoPreview.Visible := True;
  	Exit;
  end;

  mmoPreview.Visible := False;
  fpwPreview.Visible := True;
  with dmReport do
  begin
    Params := ListParams;
    frxDBDataset.DataSet := RecordSet;
    pMainReport.LoadFromFile(FilePath);
    pMainReport.PrepareReport;
    pMainReport.Preview := fpwPreview;
    Self.Show;
    pMainReport.ShowReport;
  end;
  }
end;

procedure TfrmDialogPrintPreview.SetFilePath(const Value: string);
begin
  FFilePath := Value;
end;

procedure TfrmDialogPrintPreview.SetListParams(const Value: TStringList);
begin
  FListParams := Value;
end;

procedure TfrmDialogPrintPreview.SetRecordSet(const Value: TDataSet);
begin
  FRecordSet := Value;
end;

procedure TfrmDialogPrintPreview.FormShow(Sender: TObject);
begin
  inherited;

  if IsReportLama then
  begin
    frmDialogPrintPreview.Height  := DEFAULT_HEIGHT;
    frmDialogPrintPreview.Width   := DEFAULT_WIDTH;
    LoadDataPrintPreview;
  end;

end;

procedure TfrmDialogPrintPreview.btnSaveClick(Sender: TObject);
begin
  inherited;
  {
  if savetoexcel then
  with dmReport do
  begin
    pMainReport.Export(frxmlxprt1);
  end
  else
  if savetofile then
  begin
    dlgSaveFile.InitialDir := ExtractFilePath(Application.ExeName);
    if dlgSaveFile.Execute then
    begin
      with dmReport do
      begin
        frxeText.PrintAfter := False;
        frxeText.ShowDialog := False;
        frxeText.OEMCodepage := True;
        if dlgSaveFile.FilterIndex = 1 then
          frxeText.FileName := dlgSaveFile.FileName + '.txt'
        else
          frxeText.FileName := dlgSaveFile.FileName;

        dmReport.pMainReport.Export(frxeText);
      end;
    end;
  end
  else
  if cetaktoprinter then
    dmReport.pMainReport.Print;
  }

end;

function TfrmDialogPrintPreview.IsBisaDesignReport: Boolean;
begin
  Result := True;
end;

procedure TfrmDialogPrintPreview.ShowReport(aReportFile : String; aMainSQL :
    String; aSecondarySQL : String;  aIsTextReport : Boolean = False);
var
  sReportFile: string;
begin
  IsReportLama := False;
  sReportFile := GetReportPath + aReportFile+ '.fr3';
  {
  with dmReport do
  begin
    Params := TStringList.Create;
    Params.Clear;
    
    frxDBDataset.DataSet := cOpenQuery(aMainSQL);
    pMainReport.DataSets.Clear;
    pMainReport.DataSets.Add(frxDBDataset);

    if not pMainReport.LoadFromFile(sReportFile) then
    begin
      pMainReport.FileName := sReportFile;
      pMainReport.DesignReport;
    end;

    if IsBisaDesignReport then
    begin
      if (CommonDlg.Confirm('Anda Punya Hak Untuk Mendesain Table' + #13 + 'Apakah Anda Akan Melakukan Desain Laporan?') = mrYES) then
      begin
        pMainReport.DesignReport ;
        Exit;
      end else begin
        if aIsTextReport then
        begin
          pMainReport.PrepareReport;
          frxeText.EmptyLines := True;
          frxeText.PrintAfter := False;
          frxeText.LeadSpaces := False;
          TextReportFile := StringReplace(sReportFile,ExtractFileExt(sReportFile),'.txt',[rfReplaceAll]);
          frxeText.FileName := TextReportFile;
          pMainReport.Export(frxeText);

          pMainReport.Preview := fpwPreview;

          mmoPreview.Clear;
          mmoPreview.Lines.LoadFromFile(TextReportFile);
          fpwPreview.Visible := False;
          mmoPreview.Visible := True;

        end else begin
          pMainReport.PrepareReport;
          fpwPreview.Visible := True;
          pMainReport.Preview := fpwPreview;
          pMainReport.ShowReport;
          pMainReport.Export(frxeText);
        end;

        ShowModal;
      end;
    end;
  end;
  }
end;

procedure TfrmDialogPrintPreview.FormCreate(Sender: TObject);
begin
  inherited;
  IsReportLama := True;
end;

end.
