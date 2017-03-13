unit ufrmMasterBrowse;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMaster, cxStyles,
  cxClasses, Vcl.StdCtrls, Vcl.ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxLabel, ufraFooter4Button, Vcl.Menus, cxButtons, System.Actions, Vcl.ActnList,
  uInterface, ufrmMasterDialog, dxBarBuiltInMenu, cxPC, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter;

type
  TfrmMasterBrowse = class(TfrmMaster)
    fraFooter4Button1: TfraFooter4Button;
    lblFilterData: TcxLabel;
    dtAwalFilter: TcxDateEdit;
    dtAkhirFilter: TcxDateEdit;
    btnSearch: TcxButton;
    actlstBrowse: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actClose: TAction;
    actPrint: TAction;
    actRefresh: TAction;
    lblsdFilter: TcxLabel;
    pgcBrowse: TcxPageControl;
    tsBrowse: TcxTabSheet;
    cxGrid: TcxGrid;
    cxGridView: TcxGridDBTableView;
    cxlvMaster: TcxGridLevel;
    procedure actCloseExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FAutoRefreshData: Boolean;
    { Private declarations }
  protected
    function ShowDialogForm(DlgFormClass: TMasterDlgClass; AID: String = ''):
        Integer;
  public
    procedure RefreshData; dynamic; abstract;
    { Public declarations }
  published
    property AutoRefreshData: Boolean read FAutoRefreshData write FAutoRefreshData;
  end;

var
  frmMasterBrowse: TfrmMasterBrowse;

implementation

uses
  System.DateUtils, ufrmDialogBank;

{$R *.dfm}

procedure TfrmMasterBrowse.actCloseExecute(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TfrmMasterBrowse.actRefreshExecute(Sender: TObject);
begin
  inherited;
  RefreshData;
end;

procedure TfrmMasterBrowse.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmMasterBrowse.FormCreate(Sender: TObject);
begin
  inherited;
  dtAwalFilter.Date   := StartOfTheMonth(Now);
  dtAkhirFilter.Date  := Now;
  AutoRefreshData     := True;
end;

procedure TfrmMasterBrowse.FormShow(Sender: TObject);
begin
  inherited;
  actRefresh.Execute;
end;

function TfrmMasterBrowse.ShowDialogForm(DlgFormClass: TMasterDlgClass; AID:
    String = ''): Integer;
var
  frm: TfrmMasterDialog;
  MyInterface: ICRUDAble;
begin
  frm := DlgFormClass.Create(Application);
  Try
    if Supports(frm, ICRUDAble, MyInterface) then
      if Assigned(MyInterface) and (AID<>'') then MyInterface.LoadData(AID);

    Result := frm.ShowModal;
    if (AutoRefreshData) and (Result = mrOk) then
      RefreshData;
  Finally
    frm.Free;
  End;
end;

end.
