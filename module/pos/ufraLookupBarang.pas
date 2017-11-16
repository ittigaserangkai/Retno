unit ufraLookupBarang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, Menus, cxGraphics, Vcl.ExtCtrls,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxContainer, cxProgressBar, cxTextEdit,
  cxCurrencyEdit;

type
  TfraLookupBarang = class(TFrame)
    pnlHeader: TPanel;
    edNamaBarang: TEdit;
    lblNamaBarang: TLabel;
    pmLookup: TPopupMenu;
    rbDepan: TRadioButton;
    rbSemua: TRadioButton;
    pnlInfo: TPanel;
    lblInfo: TLabel;
    tmrInfo: TTimer;
    cxGrid: TcxGrid;
    grdlvlLookupMember: TcxGridLevel;
    pbBarang: TcxProgressBar;
    sgBarang: TcxGridTableView;
    sgBarangColumn1: TcxGridColumn;
    sgBarangColumn2: TcxGridColumn;
    sgBarangColumn3: TcxGridColumn;
    sgBarangColumn4: TcxGridColumn;
    sgBarangColumn5: TcxGridColumn;
    sgBarangColumn6: TcxGridColumn;
    sgBarangColumn7: TcxGridColumn;
  private
  public
  end;

implementation

uses
  Math, ufrmTransaksi, udmMain, uDXUtils;



{$R *.dfm}

end.
