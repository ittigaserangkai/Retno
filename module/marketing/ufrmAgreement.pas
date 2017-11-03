unit ufrmAgreement;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmMasterBrowse, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, System.Actions,
  Vcl.ActnList, ufraFooter4Button, Vcl.StdCtrls, cxButtons, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid, cxPC, Vcl.ExtCtrls;

type
  TfrmAgreement = class(TfrmMasterBrowse)
    cxGridViewColumn1: TcxGridDBColumn;
    cxGridViewColumn2: TcxGridDBColumn;
    cxGridViewColumn3: TcxGridDBColumn;
    cxGridViewColumn4: TcxGridDBColumn;
    cxGridViewColumn5: TcxGridDBColumn;
    cxGridViewColumn6: TcxGridDBColumn;
    cxGridViewColumn7: TcxGridDBColumn;
    procedure actAddExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAgreement: TfrmAgreement;

implementation

uses ufrmDialogMasterAgreement;

{$R *.dfm}

procedure TfrmAgreement.actAddExecute(Sender: TObject);
begin
  inherited;
  ShowDialogForm(TfrmDialogMasterAgreement);
end;

end.
