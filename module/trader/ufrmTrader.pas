unit ufrmTrader;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterBrowse, ActnList, ufraFooter5Button, StdCtrls, ExtCtrls,
  uRetnoUnit, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, cxCurrencyEdit, System.Actions,
  ufraFooter4Button, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC;

type
  TfrmTrader = class(TfrmMasterBrowse)
    pnl2: TPanel;
    bvl1: TBevel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    edtLeadTime: TEdit;
    edtTOP: TEdit;
    edtContactPerson: TEdit;
    edtTelp: TEdit;
    edtFax: TEdit;
    edtNPWP: TEdit;
    edtDesc: TEdit;
    lbl9: TLabel;
    Label1: TLabel;
    edTipeByar: TEdit;
    Panel1: TPanel;
    edtCari: TEdit;
    Label2: TLabel;
    lbl10: TLabel;
    edtCreditLimit: TcxCurrencyEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure strgGridRowChanging(Sender: TObject; OldRow, NewRow: Integer;
      var Allow: Boolean);
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure edtCariChange(Sender: TObject);
    procedure strgGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure ParseHeaderGrid(jmlData: Integer);
    procedure ParseDataGrid();
  public
    { Public declarations }
  end;

var
  frmTrader: TfrmTrader;

implementation

uses ufrmDialogTrader, ufrmDialogPlafonTrader, uTSCommonDlg, ufrmSearchPO;

{$R *.dfm}

procedure TfrmTrader.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmTrader.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'Master Trader';
  ParseDataGrid;
end;

procedure TfrmTrader.FormDestroy(Sender: TObject);
begin
  inherited;
  frmTrader := nil;
end;

procedure TfrmTrader.ParseDataGrid;
var intI: Integer;
    tempBool: Boolean;
begin

end;

procedure TfrmTrader.ParseHeaderGrid(jmlData: Integer);
begin
  {
  with strgGrid do
  begin
    Clear;
    RowCount := jmlData + 1;
    ColCount := 7;

    Cells[0,0] := 'NO.';
    Cells[1,0] := 'TRADER CODE';
    Cells[2,0] := 'TRADER NAME';
    Cells[3,0] := 'ADDRESS';
    Cells[4,0] := 'TRADER';
    Cells[5,0] := 'MEMBER CODE';
    Cells[6,0] := 'MEMBER NAME';

    if jmlData < 1 then
    begin
      RowCount := 2;
      Cells[0,1] := '';
      Cells[1,1] := '';
      Cells[2,1] := '';
      Cells[3,1] := '';
      Cells[4,1] := '';
      Cells[14,1] := '0';
      Cells[15,1] := '0';
    end;

    FixedRows := 1;
    AutoSize := true;
  end;
  }
end;

procedure TfrmTrader.strgGridRowChanging(Sender: TObject; OldRow,
  NewRow: Integer; var Allow: Boolean);
begin
  inherited;
  {edtLeadTime.Text := strgGrid.Cells[7,NewRow];
  edtTOP.Text := strgGrid.Cells[8,NewRow];
  edtContactPerson.Text := strgGrid.Cells[9,NewRow];
  edtTelp.Text := strgGrid.Cells[10,NewRow];
  edtFax.Text := strgGrid.Cells[11,NewRow];
  edtNPWP.Text := strgGrid.Cells[12,NewRow];
  edtDesc.Text := strgGrid.Cells[13,NewRow];
  edTipeByar.Text := strgGrid.Cells[17,NewRow];
  edtCreditLimit.Text := strgGrid.Cells[18,NewRow];
  }
end;

procedure TfrmTrader.actAddExecute(Sender: TObject);
begin
  inherited;
  if not Assigned(frmDialogTrader) then
    Application.CreateForm(TfrmDialogTrader, frmDialogTrader);

  frmDialogTrader.Caption := 'Add Trader';
  frmDialogTrader.FormMode := fmAdd;
  //frmDialogTrader.pgcTipeTrader.ActivePageIndex := 0;
  SetFormPropertyAndShowDialog(frmDialogTrader);

  if (frmDialogTrader.IsProcessSuccessfull) then
  begin
    actRefreshExecute(Self);
    CommonDlg.ShowConfirmSuccessfull(atAdd);
    cxGrid.Setfocus;
  end;

  frmDialogTrader.Free;
end;

procedure TfrmTrader.actEditExecute(Sender: TObject);
begin
  inherited;
//  if strgGrid.Cells[14,strgGrid.Row] = '0' then Exit;
  if not Assigned(frmDialogTrader) then
    Application.CreateForm(TfrmDialogTrader, frmDialogTrader);

  frmDialogTrader.Caption := 'Edit Trader';
  frmDialogTrader.FormMode := fmEdit;
//  frmDialogTrader.TraderID := StrToInt(strgGrid.Cells[14,strgGrid.Row]);
//  frmDialogTrader.edtCode.Text := strgGrid.Cells[1,strgGrid.Row];
//  frmDialogTrader.edtName.Text := strgGrid.Cells[2,strgGrid.Row];
//  frmDialogTrader.edtAddress.Text := strgGrid.Cells[3,strgGrid.Row];

//  frmDialogTrader.edtCreditLimit.Enabled := actEditCLTrader.Enabled;
//  frmDialogTrader.edtCreditLimit.Value := strgGrid.Floats[18, strgGrid.Row];
//  if strgGrid.Cells[4,strgGrid.Row] = 'ASSGROS' then
//    frmDialogTrader.cbJenis.ItemIndex := frmDialogTrader.cbJenis.Items.IndexOf('ASSGROS')
//  else
    frmDialogTrader.cbJenis.ItemIndex := frmDialogTrader.cbJenis.Items.IndexOf('TRADER');

  SetFormPropertyAndShowDialog(frmDialogTrader);

  if (frmDialogTrader.IsProcessSuccessfull) then
  begin
    actRefreshExecute(Self);
    CommonDlg.ShowConfirmSuccessfull(atEdit);
    cxGrid.Setfocus;
  end;

  frmDialogTrader.Free;
end;

procedure TfrmTrader.actRefreshExecute(Sender: TObject);
begin
  inherited;
  ParseDataGrid();
end;

procedure TfrmTrader.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F5 then
  begin
    if not Assigned(frmDialogSearchPO) then
      frmDialogSearchPO := TfrmDialogSearchPO.Create(Self);
    frmDialogSearchPO.Modul := tmTrader;
    SetFormPropertyAndShowDialog(frmDialogSearchPO);

    if frmDialogSearchPO.IsProcessSuccessfull = true then
    begin
      ParseHeaderGrid(1);
      with frmDialogSearchPO do
      begin
        TraderData.First;
//        Self.strgGrid.Cells[0, 1] := '1';
//        Self.strgGrid.Cells[1, 1] := TraderData.FieldByName('TRD_CODE').AsString;
//        Self.strgGrid.Cells[2, 1] := TraderData.FieldByName('TRD_NAME').AsString;
//        Self.strgGrid.Cells[3, 1] := TraderData.FieldByName('TRD_ADDRESS').AsString;
//        Self.strgGrid.Cells[4, 1] := TraderData.FieldByName('TRD_IS_ASSGROS').AsString;
//        Self.strgGrid.Cells[5, 1] := TraderData.FieldByName('MEMBER_CARD_NO').AsString;
//        Self.strgGrid.Cells[6, 1] := TraderData.FieldByName('MEMBER_NAME').AsString;
        Self.edtLeadTime.Text := TraderData.FieldByName('TRD_LEAD_TIME').AsString;
        Self.edtTOP.Text := TraderData.FieldByName('TRD_TOP').AsString;
        Self.edtContactPerson.Text := TraderData.FieldByName('TRD_CONTACT_PERSON').AsString;
        Self.edtDesc.Text := TraderData.FieldByName('TRD_DESCRIPTION').AsString;
        Self.edtTelp.Text := TraderData.FieldByName('TRD_TELP').AsString;
        Self.edtFax.Text := TraderData.FieldByName('TRD_FAX').AsString;
        Self.edtNPWP.Text := TraderData.FieldByName('TRD_NPWP').AsString;
      end;

    end;

    frmDialogSearchPO.Free;
  end;
end;

procedure TfrmTrader.FormActivate(Sender: TObject);
begin
  inherited;
//
end;

procedure TfrmTrader.edtCariChange(Sender: TObject);
begin
  inherited;
//  findDataonGrid(edtCari.Text,strgGrid);
end;

procedure TfrmTrader.strgGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
   if (Key=VK_F1) then
   begin
//     if strgGrid.Cells[14,strgGrid.Row] = '0' then Exit;
     if not Assigned(frmDialogPlafonTrader) then
        Application.CreateForm(TfrmDialogPlafonTrader, frmDialogPlafonTrader);

        frmDialogPlafonTrader.Caption := 'Add Plafon';
        //  frmDialogPlafonTrader.FormMode := fmEdit;
//        frmDialogPlafonTrader.TraderID := StrToInt(strgGrid.Cells[14,strgGrid.Row]);
//        frmDialogPlafonTrader.edtCode.Text := strgGrid.Cells[1,strgGrid.Row];
//        frmDialogPlafonTrader.edtName.Text := strgGrid.Cells[2,strgGrid.Row];
//        frmDialogPlafonTrader.edtAddress.Text := strgGrid.Cells[3,strgGrid.Row];
//        frmDialogPlafonTrader.edtPlafonex.Value:=strgGrid.Floats[19, strgGrid.Row];
//        if strgGrid.Cells[4,strgGrid.Row] = 'ASSGROS' then
//            frmDialogPlafonTrader.cbJenis.ItemIndex := frmDialogPlafonTrader.cbJenis.Items.IndexOf('ASSGROS')
//        else
            frmDialogPlafonTrader.cbJenis.ItemIndex := frmDialogPlafonTrader.cbJenis.Items.IndexOf('TRADER');
            

        SetFormPropertyAndShowDialog(frmDialogPlafonTrader);

        if (frmDialogPlafonTrader.IsProcessSuccessfull) then
        begin
          actRefreshExecute(Self);
          CommonDlg.ShowConfirmSuccessfull(atEdit);
          cxGrid.Setfocus;
        end;
        frmDialogPlafonTrader.Free;
   end;

end;

end.


