unit ufrmDialogDiscountMember;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, StdCtrls, System.Actions, Vcl.ActnList,
  ufraFooterDialog3Button, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit, cxCurrencyEdit,
  Vcl.ExtCtrls;

type
  TfrmDialogDiscountMember = class(TfrmMasterDialog)
    Label9: TLabel;
    edtId: TEdit;
    edtMemTypeID: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtDiscount: TcxCurrencyEdit;
    edtMemTypeNm: TEdit;
    edtMinVal: TcxCurrencyEdit;
    edtMaxVal: TcxCurrencyEdit;
    procedure actDeleteExecute(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure edtMemTypeIDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FUnitID   : Integer;
    FLoginId  : integer;
    FID       : integer;
//    FDiscMem  : TDiscountMember;

    procedure SetData;
    procedure ClearData;
    procedure GetDataMemberType;
  public
    { Public declarations }
    procedure ShowWithId(aUnitID: Integer; aLoginID: Integer; aId: integer = 0);
  end;

var
  frmDialogDiscountMember: TfrmDialogDiscountMember;

implementation

{$R *.dfm}
uses uTSCommonDlg, uRetnoUnit;

procedure TfrmDialogDiscountMember.actDeleteExecute(Sender: TObject);
begin
  inherited;
  {
  if MessageDlg('Apakah yakin akan menghapus Discount Member ' +
          strgGrid.Cells[_KolNm , iy] + ' ?',
          mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
    if FDiscMem.LoadByID(strgGrid.Ints[_kolId, iy], FUnitID ) then
    begin
      try
        if FDiscMem.RemoveFromDB then
        begin
          cCommitTrans;
          CommonDlg.ShowMessage('Sukses Hapus Discount Member');
          GetRec;
        end
        else
        begin
          cRollbackTrans;
          CommonDlg.ShowError('Gagal Hapus Discount Member');
        end;
      finally
        cRollbackTrans;
      end;
    end
    else
    begin
       CommonDlg.ShowConfirmGlobal ('Data yang dihapus tidak ada!');
    end;
  end;
  }
end;

procedure TfrmDialogDiscountMember.SetData;
begin
  {if FId <> 0 then
  begin
    if FDiscMem.LoadByID(FID, FUnitID) then
    begin
      edtId.Text        := IntToStr(FID);
      edtMemTypeID.Text := IntToStr(FDiscMem.DiscMemTypeId);
      edtMinVal.Value   := FDiscMem.DiscMemMinVal;
      edtMaxVal.Value   := FDiscMem.DiscMemMaxVal;
      edtDiscount.Value := FDiscMem.DiscMemDiscount;
    end;
  end
  else
  begin
      ClearData;
  end;
  }
end;

procedure TfrmDialogDiscountMember.ClearData;
begin
  edtId.Clear;
  edtMemTypeID.Clear;
  edtMemTypeNm.Clear;
  edtMinVal.Clear;
  edtMaxVal.Clear;
  edtDiscount.Clear;
end;

procedure TfrmDialogDiscountMember.ShowWithId(aUnitID: Integer; aLoginID: Integer; aId: integer = 0);
begin
  FUnitID   := aUnitID;
  FLoginId  := aLoginID;
  FId       := aId;

//  FDiscMem := TDiscountMember.Create(nil);

  SetData;
  Self.ShowModal;
end;

procedure TfrmDialogDiscountMember.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin
  inherited;
  {
  if edtMinVal.Value < edtMaxVal.Value then
  begin
    try
      with FDiscMem do
      begin
        UpdateData(edtDiscount.Value, FID, edtMaxVal.Value, edtMinVal.Value,
                    StrToInt(edtMemTypeID.Text), FUnitID);

        if not SaveToDB then
        begin
          cRollbackTrans;
          CommonDlg.ShowError('Gagal Simpan Data Discount Member.');
        end
        else
        begin
          cCommitTrans;
          CommonDlg.ShowMessage('Data Discount Member telah disimpan.');
          Close;
        end;

      end;
    finally
      cRollbackTrans;
    end;
  end
  else
  begin
    CommonDlg.ShowError('Batas minimum tidak boleh melebihi batas maximum.');
  end;
  }
end;

procedure TfrmDialogDiscountMember.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action  := caFree;
  inherited;

end;

procedure TfrmDialogDiscountMember.FormDestroy(Sender: TObject);
begin
//  FreeAndNil(FDiscMem);
  frmDialogDiscountMember := nil;
  inherited;

end;

procedure TfrmDialogDiscountMember.edtMemTypeIDKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;

  IF Key = vk_f5 then
    GetDataMemberType;
end;

procedure TfrmDialogDiscountMember.GetDataMemberType;
var
  sSQL  : string;
begin
  sSQL := 'Select TPMEMBER_ID as "Member ID", TPMEMBER_NAME as "Member Name"'
        + 'from REF$TIPE_MEMBER ';
//  GetDataIdNm('Get Data Member Type', sSQL, edtMemTypeID, edtMemTypeNm);

end;

end.
