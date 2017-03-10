unit ufrmPurchaseOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, ufraFooter1Button, SUIButton, ComCtrls, StdCtrls,
  ExtCtrls, SUIComboBox, frxClass, DB, IBQuery, frxDBSet, ADODB, EditBtn,
  Grids, BaseGrid, AdvGrid, AdvCGrid, AdvObj;

type
  TfrmPurchaseOrder = class(TfrmMasterBrowse)
    fraFooter1Button1: TfraFooter1Button;
    Panel1: TPanel;
    Panel2: TPanel;
    btnShowPO: TsuiButton;
    Label2: TLabel;
    lbl1: TLabel;
    lbl4: TLabel;
    edtBtnSuplier1: TEditBtn;
    edtBtnSuplier2: TEditBtn;
    Label1: TLabel;
    cboStatusPO: TcxComboBox;
    dtp1: TDateTimePicker;
    Label3: TLabel;
    dtp2: TDateTimePicker;
    Grid: TAdvColumnGrid;
    btnShow: TsuiButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnShowPOClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtBtnSuplier1ClickBtn(Sender: TObject);
    procedure edtBtnSuplier2ClickBtn(Sender: TObject);
    procedure edtBtnSuplier1KeyPress(Sender: TObject; var Key: Char);
    procedure edtBtnSuplier2KeyPress(Sender: TObject; var Key: Char);
    procedure btnShowPOEnter(Sender: TObject);
    procedure btnShowPOExit(Sender: TObject);
    procedure btnShowClick(Sender: TObject);
    procedure GridGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure GridGetFloatFormat(Sender: TObject; ACol, ARow: Integer;
      var IsFloat: Boolean; var FloatFormat: String);
  private
    { Private declarations }
    sSQL  : string;

  protected
    function GetSQLStatusPO: string; dynamic;
    function GetSupCode    : string; virtual;
  public
    { Public declarations }
  end;

  /// nama from disamakan dengan unitnamenya mis : unit ufrmPurchaseOrder, nama form = frmPurchaseOrder [hilangkan huruf u di depan]
  /// combo supplier1 dan supplier2 diganti aj dengan editbutton

var
  frmPurchaseOrder: TfrmPurchaseOrder;

implementation

uses uConn, suithemes, udmReport, uPurchaseOrder, DateUtils, 
  ufrmDialogPrintPreview, uGTSUICommonDlg, uRMSUnit, udmReportNew;

{$R *.dfm}

procedure TfrmPurchaseOrder.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  //////frmMain.DestroyMenu((Sender as TForm));
  Action := caFree;
end;

procedure TfrmPurchaseOrder.FormDestroy(Sender: TObject);
begin
  inherited;

  frmPurchaseOrder:= nil;
end;

procedure TfrmPurchaseOrder.FormShow(Sender: TObject);
begin
  inherited;
  dtp1.Date:= Now;
  dtp2.Date:= Now;
end;

procedure TfrmPurchaseOrder.btnShowPOClick(Sender: TObject);
var
  iPOUnitID: Integer;
  strDtFrst     : string;
  strDtNext     : string;
  sStapo_ID,
  sTmp          : string;


begin
  inherited;
  iPOUnitID := GetPOUnitID(MasterNewUnit.ID);

  if (cboStatusPO.Text = '') or (cboStatusPO.ItemIndex < 0) then
  begin
    CommonDlg.ShowErrorEmpty('Status PO');
    cboStatusPO.SetFocus;
    Exit;
  end;

  FormatSettings.DateSeparator   := '/';   /// := kasih spasi , luruskan :=
  FormatSettings.ShortDateFormat := 'mm/dd/yyyy';
  strDtFrst       := FormatDateTime('mm/dd/yyyyy', dtp1.Date) + ' 00:00:00';
  strDtNext       := FormatDateTime('mm/dd/yyyyy', dtp2.Date) + ' 23:59:59';
  sStapo_ID       := Trim(copy(cboStatusPO.Text,1, pos(' ',cboStatusPO.Text)));
  sTmp            := trim(copy(cboStatusPO.Text, pos(' ',cboStatusPO.Text)+1,
                          length(cboStatusPO.Text)- pos(' ',cboStatusPO.Text)));

  /// := kasih spasi , luruskan := sampe sini
  ///rtp.tppersh_code || '' '' || '
  sSQL:= 'SELECT '+ GetCompanyHeader(FLoginFullname,MasterNewUnit.Nama,   /// mas SQLnya dirapikan ya , + tambah spasi
                                        dtp1.DateTime, dtp2.DateTime)
        + ' s.sup_code, smg.supmg_code, '
        + ' s.sup_name as sup_name, p.po_date '
        + ' as po_date, p.po_no, '
        + ' p.po_so_no, p.po_colie, p.PO_DISC, p.po_ppn, '
        + ' p.po_ppnbm, p.PO_DISC + p.po_ppn + p.po_ppnbm as po_purchase, p.po_total '
        + ' from po p '
        + ' inner join suplier_merchan_grup smg on p.po_supmg_sub_code = smg.supmg_sub_code  '
        + ' inner join suplier s on smg.supmg_code = s.sup_code  '
        + ' left outer join ref$tipe_perusahaan rtp on s.sup_tppersh_id = rtp.tppersh_id '
        + ' where s.SUP_CODE >= ' +  QuotedStr(edtBtnSuplier1.Text)
        + ' AND s.SUP_CODE <= ' +   QuotedStr(edtBtnSuplier2.Text)
        + ' AND p.PO_DATE >= ' +   QuotedStr(strDtFrst)
        + ' AND p.PO_DATE <= ' +   QuotedStr(strDtNext)
        + ' AND (p.PO_STAPO_ID = ' +   QuotedStr(sStapo_ID)
        + ' ) '
        + ' AND P.PO_UNT_ID = ' + IntToStr(iPOUnitID)
        + ' ORDER BY s.SUP_CODE ASC,rtp.tppersh_code ASC, s.sup_name ASC, '
        + ' po_date ASC, p.po_no ASC';

      dmReportNew.EksekusiReport('frcetakPO_listing', sSQL,'',True);
end;

procedure TfrmPurchaseOrder.FormActivate(Sender: TObject);
begin
  inherited;
  frmPurchaseOrder.Caption := 'LISTING PURCHASE ORDER';
end;

procedure TfrmPurchaseOrder.FormCreate(Sender: TObject);
begin
  inherited;
  frmPurchaseOrder.Caption := 'LISTING PURCHASE ORDER';

  edtBtnSuplier1.Text:='';
  edtBtnSuplier2.Text:='';

  sSQL:= GetSQLStatusPO;

  cboStatusPO.Clear;
  with cOpenQuery(sSQL) do
  begin
    try
      while not Eof do /// indentasinya kurang satu spasi
      begin
        cboStatusPO.Items.Add(Fields[0].Text);
        Next;
      end;
    finally
      Free;
    end;
  end;


end;


function TfrmPurchaseOrder.GetSQLStatusPO: string;
begin

  Result := 'SELECT stapo_id || ''    '' || '
            +' UPPER(stapo_name)'
            +' FROM ref$status_po'

            +' ORDER BY stapo_id';

end;

function TfrmPurchaseOrder.GetSupCode: string;
begin
  sSQL:= 'SELECT sup_code, sup_name '
          + ' FROM suplier ';

  with cLookUp('Daftar Supplier', sSQL,200,1) do
   begin
     try
       if Trim(Strings[0]) = '' then
          Result := ''
       else
          Result := Strings[0];

     finally
       Free;
     end;

   end;

end;

procedure TfrmPurchaseOrder.edtBtnSuplier1ClickBtn(Sender: TObject);
begin
  inherited;

  edtBtnSuplier1.Text := GetSupCode;

end;

procedure TfrmPurchaseOrder.edtBtnSuplier2ClickBtn(Sender: TObject);
begin
  inherited;

  edtBtnSuplier2.Text := GetSupCode;

end;



procedure TfrmPurchaseOrder.edtBtnSuplier1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := UpCase(Key);
end;

procedure TfrmPurchaseOrder.edtBtnSuplier2KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := UpCase(Key);
end;

procedure TfrmPurchaseOrder.btnShowPOEnter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmPurchaseOrder.btnShowPOExit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

procedure TfrmPurchaseOrder.btnShowClick(Sender: TObject);
var
  strDtFrst     : string;
  strDtNext     : string;
  sStapo_ID,
  sTmp          : string;
  iPOUnitID     : integer;
  sfilter       : string;
begin
  inherited;
  iPOUnitID := GetPOUnitID(MasterNewUnit.ID);
  if (cboStatusPO.Text = '') or (cboStatusPO.ItemIndex < 0) then
  begin
    CommonDlg.ShowErrorEmpty('Status PO');
    cboStatusPO.SetFocus;
    Exit;
  end;

  if (edtBtnSuplier1.Text ='') and (edtBtnSuplier2.Text ='') then
      sfilter :=''
  else
      sfilter := 'and s.SUP_CODE >= ' +  QuotedStr(edtBtnSuplier1.Text) + ' AND s.SUP_CODE <= ' +   QuotedStr(edtBtnSuplier2.Text);

  FormatSettings.DateSeparator   := '/';   /// := kasih spasi , luruskan :=
  FormatSettings.ShortDateFormat := 'mm/dd/yyyy';
  strDtFrst       := FormatDateTime('mm/dd/yyyyy', dtp1.Date) + ' 00:00:00';
  strDtNext       := FormatDateTime('mm/dd/yyyyy', dtp2.Date) + ' 23:59:59';

  sStapo_ID       := Trim(copy(cboStatusPO.Text,1, pos(' ',cboStatusPO.Text)));
  sTmp            := trim(copy(cboStatusPO.Text, pos(' ',cboStatusPO.Text)+1,
                          length(cboStatusPO.Text)- pos(' ',cboStatusPO.Text)));


  /// := kasih spasi , luruskan := sampe sini
  ///rtp.tppersh_code || '' '' || '
  sSQL:= 'SELECT s.sup_code as "Suplier Code", smg.supmg_code as "Division Code", '
        + ' s.sup_name as "Suplier", p.po_date'
        + ' as "Tgl PO", p.po_no as "No PO", '
        + ' p.po_so_no as "No SO", p.po_colie as "Colie", p.PO_DISC as "PO Disc", p.po_ppn as "PO PPn", '
        + ' p.po_ppnbm as "PO PPNBM", p.PO_DISC + p.po_ppn + p.po_ppnbm as "PO Purchase", p.po_total as "PO Total" '
        + ' from po p '
        + ' inner join suplier_merchan_grup smg on p.po_supmg_sub_code = smg.supmg_sub_code  '
        + ' inner join suplier s on smg.supmg_code = s.sup_code '
        + ' left outer join ref$tipe_perusahaan rtp on s.sup_tppersh_id = rtp.tppersh_id '
        + ' where  p.PO_DATE >= ' +   QuotedStr(strDtFrst)
        + ' AND p.PO_DATE <= ' +   QuotedStr(strDtNext)
        +  sfilter
        + ' AND (p.PO_STAPO_ID = ' +   QuotedStr(sStapo_ID)
        + ' ) '
        + ' AND P.PO_UNT_ID = ' + IntToStr(iPOUnitID)
        + ' ORDER BY s.SUP_CODE ASC,rtp.tppersh_code ASC, s.sup_name ASC, '
        + ' po_date ASC, p.po_no ASC';

   cQueryToGrid(sSQL,Grid);
   Grid.AutoSize := True;
end;

procedure TfrmPurchaseOrder.GridGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  inherited;
  if ARow = 0 then
  HAlign := taCenter;
  if (ACol in [0,1,2,3,4,5,6]) and (ARow > 0) then
  HAlign := taLeftJustify;
  if (ACol in [7,8,9,10,11,12]) and (ARow > 0) then
  HAlign := taRightJustify;
end;

procedure TfrmPurchaseOrder.GridGetFloatFormat(Sender: TObject; ACol,
  ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  inherited;
  FloatFormat := '%.3n';
  if (ACol in [7]) and (ARow > 0) then
    IsFloat := True
  else
  if (ACol in [8,9,10,11,12]) and (ARow > 0) then
  begin
    FloatFormat := '%.2n';
    IsFloat := True;
  end
  else
    IsFloat := False;
//
//  FloatFormat := '%.2n';
//  if (ACol in [7,8,9,10,11,12]) and (ARow <> 0) then
//  IsFloat := True
//  else
//  IsFloat := False;
end;

end.





