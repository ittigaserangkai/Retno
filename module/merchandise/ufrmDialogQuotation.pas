unit ufrmDialogQuotation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialogBrowse, ExtCtrls, StdCtrls,
  ufrmQuotation, uRetnoUnit,DB,jpeg, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData,
  System.Actions, Vcl.ActnList, ufraFooterDialog3Button, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxDropDownEdit, cxCalendar, cxTextEdit, cxMaskEdit, cxButtonEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, cxGroupBox, cxCheckBox,
  Vcl.Menus, cxButtons, cxCurrencyEdit, ufrmMasterDialog, cxGridBandedTableView,
  cxSplitter, cxGridDBBandedTableView;

type

  TfrmDialogQuotation = class(TfrmMasterDialog)
    cxGroupBox1: TcxGroupBox;
    Label6: TLabel;
    cxLookupTipeHarga: TcxExtLookupComboBox;
    Label7: TLabel;
    cxExtLookupComboBox1: TcxExtLookupComboBox;
    dtAwalFilter: TcxDateEdit;
    Label8: TLabel;
    Label9: TLabel;
    cxDateEdit1: TcxDateEdit;
    ckIsADS: TcxCheckBox;
    edtProductName: TcxTextEdit;
    Label10: TLabel;
    Label11: TLabel;
    cxTextEdit1: TcxTextEdit;
    cxGroupBox3: TcxGroupBox;
    Label2: TLabel;
    btnDelKonv: TcxButton;
    btnAddKonversi: TcxButton;
    cxGridMasterLevel1: TcxGridLevel;
    cxGridMaster: TcxGrid;
    cxGrdDBMaster: TcxGridDBBandedTableView;
    cxGridDetail: TcxGrid;
    cxGridLevel1: TcxGridLevel;
    cxGrdDBDetail: TcxGridDBTableView;
    cxSplitter1: TcxSplitter;
    cxGrdDBMasterColumn1: TcxGridDBBandedColumn;
    cxGrdDBMasterColumn2: TcxGridDBBandedColumn;
    cxGrdDBMasterColumn3: TcxGridDBBandedColumn;
    cxGrdDBMasterColumn4: TcxGridDBBandedColumn;
    cxGrdDBMasterColumn5: TcxGridDBBandedColumn;
    cxGrdDBMasterColumn6: TcxGridDBBandedColumn;
    cxGrdDBMasterColumn7: TcxGridDBBandedColumn;
    cxGrdDBMasterColumn8: TcxGridDBBandedColumn;
    cxGrdDBMasterColumn9: TcxGridDBBandedColumn;
    cxGrdDBMasterColumn10: TcxGridDBBandedColumn;
    cxGrdDBMasterColumn11: TcxGridDBBandedColumn;
    cxGrdDBMasterColumn12: TcxGridDBBandedColumn;
    cxGrdDBMasterColumn13: TcxGridDBBandedColumn;
    cxGrdDBDetailColumn1: TcxGridDBColumn;
    cxGrdDBDetailColumn2: TcxGridDBColumn;
    cxGrdDBDetailColumn3: TcxGridDBColumn;
    cxGrdDBDetailColumn4: TcxGridDBColumn;
    cxGrdDBDetailColumn5: TcxGridDBColumn;
    cxGrdDBDetailColumn6: TcxGridDBColumn;
    cxGrdDBDetailColumn7: TcxGridDBColumn;
  private
  public
  end;


var
  frmDialogQuotation: TfrmDialogQuotation;


implementation

uses  uTSCommonDlg, ufrmSearchProduct, DateUtils, Math, uConstanta, uAppUtils;

{$R *.dfm}

end.
