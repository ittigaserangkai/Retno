unit ufrmWorksheetReportByValue;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, SUIButton, ComCtrls, ufraFooter1Button, StdCtrls,
  ExtCtrls, Mask, JvToolEdit, ActnList;

type
  TfrmWorksheet = class(TfrmMaster)
    fraFooter1Button1: TfraFooter1Button;
    Panel1: TPanel;
    dtp1: TJvDateEdit;
    lbl1: TLabel;
    btnPrint: TsuiButton;
    actlstWorksheet: TActionList;
    actPrintWorksheet: TAction;
    actSaveToFile: TAction;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actPrintWorksheetExecute(Sender: TObject);
    procedure actSaveToFileExecute(Sender: TObject);
    procedure btnPrintEnter(Sender: TObject);
    procedure btnPrintExit(Sender: TObject);
  private
  public
  end;

var
  frmWorksheet: TfrmWorksheet;

implementation

uses uConn, suithemes, udmReport, uWorksheet, ufrmDialogPrintPreview;

{$R *.dfm}

procedure TfrmWorksheet.FormShow(Sender: TObject);
begin
  inherited;

  dtp1.Date:= Now;
end;

procedure TfrmWorksheet.FormDestroy(Sender: TObject);
begin
  inherited;

  frmWorksheet:= nil;
end;

procedure TfrmWorksheet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  Action:= caFree;
end;

procedure TfrmWorksheet.actPrintWorksheetExecute(Sender: TObject);
var
  SeparatorDate: Char;
  data: TResultDataSet;
  arrParam: TArr;
  ParamList: TStringList;
  unitId: Integer;
begin
  inherited;

  SeparatorDate:= DateSeparator;

  if not Assigned(frmDialogPrintPreview) then
    frmDialogPrintPreview:= TfrmDialogPrintPreview.Create(Application);
    
  try
    DateSeparator:= '/';

    if not Assigned(Worksheet) then
      Worksheet:= TWorksheet.Create;

    unitId:= MasterNewUnit.ID;

    SetLength(arrParam,2);
    arrParam[0].tipe:= ptDateTime;
    arrParam[0].data:= dtp1.Date;
    arrParam[1].tipe:= ptInteger;
    arrParam[1].data:= unitId;
    data:= Worksheet.GetListDataWorksheet(arrParam);

    if not Assigned(ParamList) then
      ParamList := TStringList.Create;

    ParamList.Add(FormatDateTime('dd/mm/yyyy', dtp1.Date)); //0
    ParamList.Add(FLoginFullname); //1
    ParamList.Add(MasterNewUnit.Nama); //2

    with frmDialogPrintPreview do
    begin
      ListParams:= ParamList;
      RecordSet := data;
      FilePath  := FFilePathReport + 'frWorksheetReportByValue.fr3';
      SetFormPropertyAndShowDialog(frmDialogPrintPreview);
    end;

  finally
    FreeAndNil(ParamList);
    FreeAndNil(Worksheet);
    frmDialogPrintPreview.Free;
    DateSeparator:= SeparatorDate;
  end;
end;

procedure TfrmWorksheet.actSaveToFileExecute(Sender: TObject);
var
  SeparatorDate: Char;
  data: TResultDataSet;
  arrParam: TArr;
  ParamList: TStringList;
  unitId: Integer;
begin
  inherited;
  SeparatorDate:= DateSeparator;
  try
    DateSeparator:= '/';

    if not Assigned(Worksheet) then
      Worksheet:= TWorksheet.Create;

    unitId:= MasterNewUnit.ID;

    SetLength(arrParam,2);
    arrParam[0].tipe:= ptDateTime;
    arrParam[0].data:= dtp1.Date;
    arrParam[1].tipe:= ptInteger;
    arrParam[1].data:= unitId;
    data:= Worksheet.GetListDataWorksheet(arrParam);
    
    if not Assigned(ParamList) then
      ParamList := TStringList.Create;

    ParamList.Add(FormatDateTime('dd/mm/yyyy', dtp1.Date)); //0
    ParamList.Add(FLoginUsername); //1
    ParamList.Add(MasterNewUnit.Nama); //2

    with dmReport do begin
      Params := ParamList;
      frxDBDataset.DataSet := data;
      pMainReport.LoadFromFile(ExtractFilePath(Application.ExeName) + '/template/frWorksheetReportByValue.fr3');
      pMainReport.PrepareReport;
      pMainReport.Export(frxeText);
    end;
  finally
    FreeAndNil(ParamList);
    FreeAndNil(Worksheet);
    DateSeparator:= SeparatorDate;
  end;
end;

procedure TfrmWorksheet.btnPrintEnter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmWorksheet.btnPrintExit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

end.
