unit ufrmMasterCustomer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster,  ufraFooter5Button,
  StdCtrls, ExtCtrls, ActnList, jpeg, IB, AdvObj;

type
  TfrmMasterCustomer = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    actlst1: TActionList;
    actAddMasterCustomer: TAction;
    actEditMasterCustomer: TAction;
    actDeleteMasterCustomer: TAction;
    actRefreshMasterCustomer: TAction;
    pnl1: TPanel;
    pnl2: TPanel;
    edtCustName: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    strgGrid: TAdvStringGrid;
    lbl3: TLabel;
    lbl4: TLabel;
    edtPostCode: TEdit;
    edtCity: TEdit;
    edtFaxNo: TEdit;
    edtTelephone: TEdit;
    edtTitle: TEdit;
    lbl5: TLabel;
    edtContactPerson: TEdit;
    edtAddress: TEdit;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    edtSupName: TEdit;
    edtSupCode: TEdit;
    edtCustDesc: TEdit;
    lbl9: TLabel;
    lbl10: TLabel;
    Image1: TImage;
    pnl3: TPanel;
    lbl11: TLabel;
    Label1: TLabel;
    edtCustCode: TEdit;
    edtSearchCustomerName: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure actAddMasterCustomerExecute(Sender: TObject);
    procedure actEditMasterCustomerExecute(Sender: TObject);
    procedure actDeleteMasterCustomerExecute(Sender: TObject);
    procedure actRefreshMasterCustomerExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure strgGridRowChanging(Sender: TObject; OldRow, NewRow: Integer;
      var Allow: Boolean);
    procedure edtCustCodeChange(Sender: TObject);
    procedure edtSearchCustomerNameChange(Sender: TObject);
    procedure fraFooter5Button1btnCloseClick(Sender: TObject);
  private
    procedure RefreshData();
    procedure FindDataGrid(AText: string; ACol: Integer);
    function GetStatusPKP(aIsPKP : Integer): string;
    function GetStatusPPH23(aIsPPH23 : Integer): string;
    procedure InisialisasiGrid;
    procedure SetDataAlamat(aBaris : Integer; aAlamat : String; aKota : String;
        aKodePos : String);
    procedure SetDataKontakPerson(aBaris : Integer; aKontakPerson : String; aTittle
        : String);
    procedure SetDataPrincipal(aBaris : Integer; aIsPrincipal : Integer; aKode :
        String; aNama : String);
    procedure SetDataTelDanFax(aBaris : Integer; aTelp : String; aFax : String);
    procedure SetKodeDanNamaCustomer(aBaris : Integer; aKode : String; aNama :
        String);
    procedure AturLebarKolom;    
  public

    { Public declarations }
  end;

var
  frmMasterCustomer: TfrmMasterCustomer;

implementation

uses ufrmDialogMasterCustomer, uTSCommonDlg, Math, DB,
     uConstanta, uNewCustomer, uRetnoUnit;

const
    _Kol_CODE                  : Byte = 0;
    _Kol_PKP                   : Byte = 1;
    _Kol_TAX_NO                : Byte = 2;
    _Kol_PPH                   : Byte = 3;
    _Kol_NPWP                  : Byte = 4;
    _Kol_TYPE_PAYM             : Byte = 5;
    _Kol_TERM_PAYM             : Byte = 6;
    _Kol_CUST_NAME             : Byte = 7;
    _Kol_CUST_ADDRESS          : Byte = 8;
    _Kol_CUST_CITY             : Byte = 9;
    _Kol_CUST_TELP             : Byte = 10;
    _Kol_CUST_POST_CODE        : Byte = 11;
    _Kol_CUST_FAX              : Byte = 12;
    _Kol_CUST_CONTACT_PERSON   : Byte = 13;
    _Kol_CUST_TITLE            : Byte = 14;
    _Kol_CUST_DESCRIPTION      : Byte = 15;
    _Kol_CUST_SUP_CODE         : Byte = 16;
    _Kol_SUP_NAME              : Byte = 17;
    _Kol_CUST_ID               : Byte = 18;

{$R *.dfm}

procedure TfrmMasterCustomer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmMasterCustomer.FormDestroy(Sender: TObject);
begin
  inherited;
  frmMasterCustomer := nil;
end;

procedure TfrmMasterCustomer.actAddMasterCustomerExecute(Sender: TObject);
begin
  if MasterNewUnit.ID = 0 then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    Exit;
  end;

  try
    Application.CreateForm(TfrmDialogMasterCustomer, frmDialogMasterCustomer);

    frmDialogMasterCustomer.frmSuiMasterDialog.Caption := 'Add Customer Master';
    frmDialogMasterCustomer.SetMasterCustomerId(0);

    SetFormPropertyAndShowDialog(frmDialogMasterCustomer);
    actRefreshMasterCustomerExecute(Self);
  finally
    FreeAndNil(frmDialogMasterCustomer);
  end; 
end;

procedure TfrmMasterCustomer.actEditMasterCustomerExecute(Sender: TObject);
begin
  if strgGrid.Cells[_Kol_CUST_ID, strgGrid.row] = '0' then Exit;
  if MasterNewUnit.ID = 0 then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    Exit;
  end;

  try
    Application.CreateForm(TfrmDialogMasterCustomer, frmDialogMasterCustomer);

    frmDialogMasterCustomer.frmSuiMasterDialog.Caption := 'Edit Customer Master';
    frmDialogMasterCustomer.SetMasterCustomerId(strgGrid.Ints[_Kol_CUST_ID, strgGrid.row]);

    SetFormPropertyAndShowDialog(frmDialogMasterCustomer);
    actRefreshMasterCustomerExecute(Self); 
  finally
    FreeAndNil(frmDialogMasterCustomer);
  end;
end;

procedure TfrmMasterCustomer.actDeleteMasterCustomerExecute(Sender: TObject);
var
  FNewCustomer: TNewCustomer;
begin
  if strgGrid.Cells[_Kol_CUST_ID, strgGrid.row]='0' then Exit;
  if (CommonDlg.Confirm('Anda Yakin Akan Menhapus Data (Kode : '+strgGrid.Cells[_Kol_CODE,strgGrid.row]+')?') = mrYes) then
  begin
    FNewCustomer := TNewCustomer.CreateWithUser(Self, FLoginId, FLoginUnitId);
    try
       if FNewCustomer.LoadByID(StrToInt(strgGrid.Cells[_Kol_CUst_ID, strgGrid.row]), MasterNewUnit.ID) then
       begin
         try
            FNewCustomer.RemoveFromDB ;
            cCommitTrans;
            actRefreshMasterCustomerExecute(Self);
            CommonDlg.ShowConfirm(atDelete);

         except
          on e: EIBError do
          begin
            CommonDlg.ShowError('Sudah ada Transaksi di ' + copy(E.Message,pos('table',E.Message),Length(E.Message)- pos('table',E.Message)) + #13
            + ' Tidak dapat di hapus ' );
          end;
         end;
       end;
    finally
        FNewCustomer.Free;
        cRollbackTrans;
    end;
  end;
end;

procedure TfrmMasterCustomer.RefreshData;
var
  Data: TDataSet;
  i: Integer;
  IsAllow: Boolean;
begin
  Data := GetDataMasterCustomerWSup(MasterNewUnit.ID);
  try
    InisialisasiGrid;

    i := 0;
    Data.First;
    while not data.Eof do
    begin
      Application.ProcessMessages;
      Inc(i);
      
      SetKodeDanNamaCustomer(i, Data.FieldByName('CUST_CODE').AsString, Data.FieldByName('CUST_NAME').AsString);

      strgGrid.Cells[_Kol_PKP, i]                := GetStatusPKP(Data.FieldByName('CUST_IS_PKP').AsInteger);
      strgGrid.Cells[_Kol_TAX_NO, i]             := Data.FieldByName('CUST_LR_TAX').AsString;
      strgGrid.Cells[_Kol_PPH, i]                := GetStatusPPH23(Data.FieldByName('CUST_IS_PPH23').AsInteger);

      strgGrid.Cells[_Kol_NPWP, i]               := Data.FieldByName('CUST_NPWP').AsString;
      strgGrid.Cells[_Kol_TYPE_PAYM, i]          := Data.FieldByName('TPBYR_NAME').AsString;
      strgGrid.Cells[_Kol_TERM_PAYM, i]          := Data.FieldByName('CUST_TOP').AsString;

      SetDataAlamat                             (i, Data.FieldByName('CUST_ADDRESS').AsString,Data.FieldByName('CUST_CITY').AsString, Data.FieldByName('CUST_POST_CODE').AsString);
      SetDataTelDanFax                          (i, Data.FieldByName('CUST_TELP').AsString, Data.FieldByName('CUST_FAX').AsString);
      SetDataKontakPerson                       (i, Data.FieldByName('CUST_CONTACT_PERSON').AsString, Data.FieldByName('CUST_TITLE').AsString);
      SetDataPrincipal                          (i, Data.FieldByName('CUST_IS_PRINCIPAL').AsInteger, Data.FieldByName('CUST_SUP_CODE').AsString, Data.FieldByName('SUP_NAME').AsString);

      strgGrid.Cells[_Kol_CUST_DESCRIPTION, i]   := Data.FieldByName('CUST_DESCRIPTION').AsString;
      strgGrid.Cells[_Kol_CUST_ID, i]            := Data.FieldByName('CUST_ID').AsString;

      Data.Next;

      if not Data.Eof then
      begin

        strgGrid.AddRow;
      end;
    end;

    strgGridRowChanging(Self,0,1,IsAllow);
    strgGrid.SetFocus;
  finally
    data.Free;
    AturLebarKolom;
  end;
end;

procedure TfrmMasterCustomer.actRefreshMasterCustomerExecute(Sender: TObject);
begin
  RefreshData();
end;

procedure TfrmMasterCustomer.AturLebarKolom;
begin
  strgGrid.AutoSizeColumns(True, 5);
  //strgGrid.ColWidths[_Kol_CUST_ID] := 0;
end;

procedure TfrmMasterCustomer.FormShow(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'CUSTOMER MASTER';
  actRefreshMasterCustomerExecute(Self);
end;

procedure TfrmMasterCustomer.strgGridRowChanging(Sender: TObject; OldRow,
  NewRow: Integer; var Allow: Boolean);
begin
  inherited;
  edtCustName.Text      := strgGrid.Cells[_Kol_CUST_NAME,NewRow];
  edtAddress.Text       := strgGrid.Cells[_Kol_CUST_ADDRESS,NewRow];
  edtCity.Text          := strgGrid.Cells[_Kol_CUST_CITY,NewRow];
  edtTelephone.Text     := strgGrid.Cells[_Kol_CUST_TELP,NewRow];
  edtPostCode.Text      := strgGrid.Cells[_Kol_CUST_POST_CODE,NewRow];
  edtFaxNo.Text         := strgGrid.Cells[_Kol_CUST_FAX,NewRow];
  edtContactPerson.Text := strgGrid.Cells[_Kol_CUST_CONTACT_PERSON,NewRow];
  edtTitle.Text         := strgGrid.Cells[_Kol_CUST_TITLE,NewRow];
  edtCustDesc.Text      := strgGrid.Cells[_Kol_CUST_DESCRIPTION,NewRow];
  edtSupCode.Text       := strgGrid.Cells[_Kol_CUST_SUP_CODE,NewRow];
  edtSupName.Text       := strgGrid.Cells[_Kol_SUP_NAME,NewRow];
end;

procedure TfrmMasterCustomer.FindDataGrid(AText: string; ACol: Integer);
var
  resPoint: TPoint;
  b: Boolean;
begin
  if (AText <> '') then
  begin
    resPoint := strgGrid.Find(Point(ACol,0),AText,[fnIncludeFixed, fnIncludeHiddenColumns]);
    if (resPoint.Y <> -1) then
    begin
      strgGrid.ScrollInView(resPoint.X, resPoint.Y);
      strgGrid.SelectRows(resPoint.Y, 1);
      b := True;
      strgGridRowChanging(Self, -1, resPoint.Y, b);
    end;
  end;
end;

procedure TfrmMasterCustomer.edtCustCodeChange(Sender: TObject);
begin
  inherited;
  FindDataGrid(edtCustCode.Text, 0);
end;

procedure TfrmMasterCustomer.edtSearchCustomerNameChange(Sender: TObject);
begin
  inherited;
  FindDataGrid(edtSearchCustomerName.Text, 7);
end;

procedure TfrmMasterCustomer.fraFooter5Button1btnCloseClick(
  Sender: TObject);
begin
  inherited;
  fraFooter5Button1.btnCloseClick(Sender);
end;

function TfrmMasterCustomer.GetStatusPKP(aIsPKP : Integer): string;
begin
  if aIsPKP = 1 then
    Result := 'PKP'
  else
    Result := 'NON PKP';
end;

function TfrmMasterCustomer.GetStatusPPH23(aIsPPH23 : Integer): string;
begin
  if aIsPPH23 = 1 then
    Result := 'PPH'
  else
  Result := 'NON PPH'
end;

procedure TfrmMasterCustomer.InisialisasiGrid;
begin
  with strgGrid do
  begin
    //HEADER
    Cells[_Kol_CODE, 0]      := 'CODE';
    Cells[_Kol_PKP, 0]       := 'PKP/NON PKP';
    Cells[_Kol_TAX_NO, 0]    := 'TAX. NO';
    Cells[_Kol_PPH, 0]       := 'PPH/NON PPH';
    Cells[_Kol_NPWP, 0]      := 'NPWP';
    Cells[_Kol_TYPE_PAYM, 0] := 'TYPE OF PAYM.';
    Cells[_Kol_TERM_PAYM, 0] := 'TERM OF PAYM.';

    ClearAdvStringGrid(strgGrid);
  end;  
end;

procedure TfrmMasterCustomer.SetDataAlamat(aBaris : Integer; aAlamat : String;
    aKota : String; aKodePos : String);
begin
  strgGrid.Cells[_Kol_CUST_ADDRESS, aBaris]        := aAlamat;
  strgGrid.Cells[_Kol_CUST_CITY, aBaris]           := aKota;
  strgGrid.Cells[_Kol_CUST_POST_CODE, aBaris]      := aKodePos;
end;

procedure TfrmMasterCustomer.SetDataKontakPerson(aBaris : Integer;
    aKontakPerson : String; aTittle : String);
begin
  strgGrid.Cells[_Kol_CUST_CONTACT_PERSON, aBaris] := aKontakPerson;
  strgGrid.Cells[_Kol_CUST_TITLE, aBaris]          := aTittle;
end;

procedure TfrmMasterCustomer.SetDataPrincipal(aBaris : Integer; aIsPrincipal :
    Integer; aKode : String; aNama : String);
begin
  if aIsPrincipal = 1 then
  begin
    strgGrid.Cells[_Kol_CUST_SUP_CODE, aBaris] := aKode;
    strgGrid.Cells[_Kol_SUP_NAME, aBaris]      := aNama;
  end
  else
  begin
    strgGrid.Cells[_Kol_CUST_SUP_CODE, aBaris] := ' ';
    strgGrid.Cells[_Kol_SUP_NAME, aBaris]      := ' ';
  end;
end;

procedure TfrmMasterCustomer.SetDataTelDanFax(aBaris : Integer; aTelp : String;
    aFax : String);
begin
  strgGrid.Cells[_Kol_CUST_TELP, aBaris]  := aTelp;
  strgGrid.Cells[_Kol_CUST_FAX, aBaris]   := aFax;
end;

procedure TfrmMasterCustomer.SetKodeDanNamaCustomer(aBaris : Integer; aKode :
    String; aNama : String);
begin
  strgGrid.Cells[_Kol_CODE, aBaris]       := aKode;
  strgGrid.Cells[_Kol_CUST_NAME, aBaris]  := aNama;
end;

end.
