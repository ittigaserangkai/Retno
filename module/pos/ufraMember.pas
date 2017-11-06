unit ufraMember;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ExtCtrls, Menus, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  cxProgressBar;

type
  TfraMember = class(TFrame)
    cxcolAktif: TcxGridColumn;
    cxcolAlamat: TcxGridColumn;
    cxcolKode: TcxGridColumn;
    cxcolNama: TcxGridColumn;
    cxcolValid: TcxGridColumn;
    cxGrid: TcxGrid;
    edNama: TEdit;
    grdlvlLookupMember: TcxGridLevel;
    Label1: TLabel;
    pbLookup: TcxProgressBar;
    pnlHeader: TPanel;
    rbDepan: TRadioButton;
    rbSemua: TRadioButton;
    sgLookup: TcxGridTableView;
  private
  public
  end;

implementation


{$R *.dfm}

end.
