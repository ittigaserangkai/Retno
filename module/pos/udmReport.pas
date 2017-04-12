unit udmReport;

interface

uses
  SysUtils, Classes, frxClass, frxExportTXT, frxDMPExport, frxDBSet,
  frxExportXLS, frxExportXML;

type
  TdmReport = class(TDataModule)
    frxDBDataset: TfrxDBDataset;
    pMainReport: TfrxReport;
    frxeText: TfrxTXTExport;
    frxlsxprt1: TfrxXLSExport;
    frxmlxprt1: TfrxXMLExport;
    procedure pMainReportGetValue(const VarName: String;
      var Value: Variant);
  private
    FParams: TStringList;
    procedure SetParams(const Value: TStringList);
  public
    property Params: TStringList read FParams write SetParams;
  end;

var
  dmReport: TdmReport;

implementation

{$R *.dfm}

{ TdmReport }

procedure TdmReport.SetParams(const Value: TStringList);
begin
  FParams := Value;
end;

procedure TdmReport.pMainReportGetValue(const VarName: String;
  var Value: Variant);
var i: Integer;
begin
  for i:=0 to Params.Count do
  begin
    if CompareText(VarName, 'Param'+IntToStr(i)) = 0 then
      Value := Params.Strings[i];
  end;
end;

end.
