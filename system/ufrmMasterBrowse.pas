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
  cxLabel, ufraFooter4Button, Vcl.Menus, cxButtons, System.Actions, Vcl.ActnList, uInterface;

type
  TfrmMasterBrowse = class(TfrmMaster)
    fraFooter4Button1: TfraFooter4Button;
    lblFilterData: TcxLabel;
    dtAwalFilter: TcxDateEdit;
    lblsdFilter: TcxLabel;
    dtAkhirFilter: TcxDateEdit;
    cxGridView: TcxGridDBTableView;
    cxlvMaster: TcxGridLevel;
    cxGrid: TcxGrid;
    btnSearch: TcxButton;
    actlstBrowse: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actClose: TAction;
    actPrint: TAction;
    actRefresh: TAction;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ShowDialogForm(AFormDialog : ICRUDAble; AID : String = '');
    { Public declarations }
  end;

var
  frmMasterBrowse: TfrmMasterBrowse;

implementation
uses
  System.DateUtils;

{$R *.dfm}

procedure TfrmMasterBrowse.FormCreate(Sender: TObject);
begin
  inherited;
  dtAwalFilter.Date  := StartOfTheMonth(Now);
  dtAkhirFilter.Date := Now;
end;

procedure TfrmMasterBrowse.ShowDialogForm(AFormDialog : ICRUDAble; AID : String
    = '');
begin
//  AFormDialog.LoadData(AID);
//  AFormDialog.
end;

end.
