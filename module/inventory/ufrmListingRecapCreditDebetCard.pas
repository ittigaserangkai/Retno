unit ufrmListingRecapCreditDebetCard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, SUIButton, ComCtrls, ufraFooter1Button, StdCtrls,
  ExtCtrls;

type
  TfrmListingRecapCreditDebetCard = class(TfrmMaster)
    fraFooter1Button1: TfraFooter1Button;
    Label2: TLabel;
    dtp1: TDateTimePicker;
    btnPrint: TsuiButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPrintEnter(Sender: TObject);
    procedure btnPrintExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListingRecapCreditDebetCard: TfrmListingRecapCreditDebetCard;

implementation

uses uListingRecapCreditDebetCard,suithemes, uConn, udmReport,
  ufrmDialogPrintPreview;

{$R *.dfm}

procedure TfrmListingRecapCreditDebetCard.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  Action:= caFree;
end;

procedure TfrmListingRecapCreditDebetCard.FormDestroy(Sender: TObject);
begin
  inherited;

  if Assigned(ListingRecapCreditDebetCard) then
    ListingRecapCreditDebetCard.Free;

  frmListingRecapCreditDebetCard:= nil;
end;

procedure TfrmListingRecapCreditDebetCard.btnPrintClick(Sender: TObject);
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

    if not Assigned(ListingRecapCreditDebetCard) then
      ListingRecapCreditDebetCard:= TListingRecapCreditDebetCard.Create;

    unitId:= MasterNewUnit.ID;

    SetLength(arrParam,2);
    arrParam[0].tipe:= ptDateTime;
    arrParam[0].data:= dtp1.Date;
    arrParam[1].tipe:= ptInteger;
    arrParam[1].data:= unitId;
    data:= ListingRecapCreditDebetCard.GetDataRecapCreditDebetCard(arrParam);

    if not Assigned(ParamList) then
      ParamList := TStringList.Create;

    ParamList.Add(FormatDateTime('dd/mm/yyyy', dtp1.Date)); //0
    ParamList.Add(MasterNewUnit.Nama); //1

    if not assigned(frmDialogPrintPreview) then
      frmDialogPrintPreview:= TfrmDialogPrintPreview.Create(Application);

  try
    with frmDialogPrintPreview do
    begin
      ListParams := ParamList;
      RecordSet  := data;
      FilePath   := FFilePathReport + 'frListRecapCreditDebetCard.fr3';
      SetFormPropertyAndShowDialog(frmDialogPrintPreview);
    end;
  finally
    frmDialogPrintPreview.Free;
  end;

//    with dmReport do begin
//      Params := ParamList;
//      frxDBDataset.DataSet := data;
//      pMainReport.LoadFromFile(ExtractFilePath(Application.ExeName) + '/template/frListRecapCreditDebetCard.fr3');
//      pMainReport.ShowReport(True);
//    end;
  finally
    FreeAndNil(ParamList);
    FreeAndNil(ListingRecapCreditDebetCard);
    frmDialogPrintPreview.free;
    DateSeparator:= SeparatorDate;
  end;
end;

procedure TfrmListingRecapCreditDebetCard.FormCreate(Sender: TObject);
begin
  inherited;

  dtp1.Date:= Now;
end;

procedure TfrmListingRecapCreditDebetCard.btnPrintEnter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmListingRecapCreditDebetCard.btnPrintExit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

end.
 