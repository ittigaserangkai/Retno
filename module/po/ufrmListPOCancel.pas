unit ufrmListPOCancel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, ufrmPurchaseOrder,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer, dxCore, cxDateUtils,
  Vcl.Menus, System.Actions, Vcl.ActnList, ufraFooter4Button, cxButtons,
  cxDropDownEdit, cxCalendar, cxLabel, cxTextEdit, cxMaskEdit, cxButtonEdit,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxPC;

type
  TfrmListPOCancel = class(TfrmPurchaseOrder)
  private
    { Private declarations }
  public
    function GetSQLStatusPO: string; override;
    { Public declarations }
  end;

var
  frmListPOCancel: TfrmListPOCancel;

implementation

{$R *.dfm}

/// nama from disamakan dengan unitnamenya mis : unit ufrmPurchaseOrder, nama form = frmPurchaseOrder [hilangkan huruf u di depan]

function TfrmListPOCancel.GetSQLStatusPO: string;
begin
  Result := 'SELECT stapo_id || ''    '' || '
            + ' upper(stapo_name)  '
            + ' FROM ref$status_po '
            + ' WHERE stapo_id =3'; 

end;

end.


