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
  Vcl.Menus, cxButtons, cxCurrencyEdit;

type

  TfrmDialogQuotation = class(TfrmMasterDialogBrowse)
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
    cxGridViewColumn1: TcxGridDBColumn;
    cxGridViewColumn2: TcxGridDBColumn;
    cxGridViewColumn3: TcxGridDBColumn;
    cxGridViewColumn4: TcxGridDBColumn;
    cxGridViewColumn5: TcxGridDBColumn;
    cxGridViewColumn6: TcxGridDBColumn;
    cxGridViewColumn7: TcxGridDBColumn;
    cxGridViewColumn8: TcxGridDBColumn;
    cxGridViewColumn9: TcxGridDBColumn;
    cxGridViewColumn10: TcxGridDBColumn;
  private
  public
  end;


var
  frmDialogQuotation: TfrmDialogQuotation;


implementation

uses  uTSCommonDlg, ufrmSearchProduct, DateUtils, Math, uConstanta, uAppUtils;

{$R *.dfm}

end.
