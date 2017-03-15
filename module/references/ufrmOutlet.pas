unit ufrmOutlet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, ufraFooter5Button, StdCtrls, ExtCtrls,
  uConn, uRetnoUnit, System.Actions, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC,
  Vcl.ActnList;

type
  TfrmOutlet = class(TfrmMasterBrowse)
  private
  public
    { Public declarations }
  end;

var
  frmOutlet: TfrmOutlet;

implementation

uses uTSCommonDlg, ufrmDialogOutlet, uConstanta;

{$R *.dfm}

end.
