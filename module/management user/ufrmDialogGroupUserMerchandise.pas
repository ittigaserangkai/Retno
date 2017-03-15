unit ufrmDialogGroupUserMerchandise;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls, SUIForm,
  StdCtrls, EditBtn, uNewGroup, System.Actions, Vcl.ActnList,
  ufraFooterDialog3Button;

type
  TfrmDialogGroupUserMerchandise = class(TfrmMasterDialog)
    procedure FormShow(Sender: TObject);
    procedure footerDialogMasterbtnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtGrpIDClickBtn(Sender: TObject);
    procedure edtMerIDClickBtn(Sender: TObject);
    procedure edtGrpIDKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtMerIDKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FMerID: Integer;
    FGrpID: Integer;
    { Private declarations }
    FGrpUsrMer : TGroupUserMerchandise;
    FIsProcessSuccessfull: Boolean;
    procedure ClearAttribut;
    procedure SetData;
  public
    function GetSQLGroupUser: string;
    function GetSQLMerchan: string;
    procedure LookUpData(aSender: TObject; aKey: Word);
    property MerID: Integer read FMerID write FMerID;
    property GrpID: Integer read FGrpID write FGrpID;
    property IsProcessSuccessfull: Boolean read FIsProcessSuccessfull write
        FIsProcessSuccessfull;
    { Public declarations }
  end;

var
  frmDialogGroupUserMerchandise: TfrmDialogGroupUserMerchandise;

implementation

{$R *.dfm}
uses uRMSUnit, uGTSUICommonDlg;

procedure TfrmDialogGroupUserMerchandise.ClearAttribut;
begin
  edtGrpID.Clear;
  edtGrpNm.Clear;
  edtGrpDesc.Clear;
  edtMerID.Clear;
  edtMerCode.Clear;
  edtMerNm.Clear;
end;

procedure TfrmDialogGroupUserMerchandise.FormShow(Sender: TObject);
begin
  inherited;
  ClearAttribut;
  FGrpUsrMer := TGroupUserMerchandise.CreateWithUser(self, FLoginId);

  SetData;
end;

procedure TfrmDialogGroupUserMerchandise.footerDialogMasterbtnSaveClick(
  Sender: TObject);
begin
  inherited;
  FGrpUsrMer.UpdateData(StrToInt(edtGrpID.Text), StrToInt(edtMerID.Text),
      DialogUnit);
  if FGrpUsrMer.SaveToDB(FGrpID, FMerID, DialogUnit) then
  begin
    cCommitTrans;

    if not FIsProcessSuccessfull then
      FIsProcessSuccessfull := True;

    CommonDlg.ShowMessage('Sukses simpan data');
    ClearAttribut;
    if FMerID <> 0 then
      Close;
  end
  else
  begin
    cRollbackTrans;
    CommonDlg.ShowError('Gagal simpan data');
  end;    
end;

procedure TfrmDialogGroupUserMerchandise.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  inherited;
//  Action  := caFree;
end;

procedure TfrmDialogGroupUserMerchandise.FormDestroy(Sender: TObject);
begin
//  inherited;
  FreeAndNil(FGrpUsrMer);
//  frmDialogGroupUserMerchandise := nil;
end;

procedure TfrmDialogGroupUserMerchandise.SetData;
var
  sSQL: string;
begin
  if FGrpUsrMer.LoadByID(FGrpID, FMerID, DialogUnit) then
  begin
    sSQL  := 'SELECT a.GUM_GRO_ID, a.GUM_MERCHAN_ID, b.GRO_NAME, b.GRO_DESCRIPTION,'
        + ' c.MERCHAN_CODE, c.MERCHAN_NAME'
        + ' FROM GROUP_USER_MERCHANDISE A'
        + ' INNER JOIN AUT$GROUP B on a.GUM_GRO_ID = b.GRO_ID'
        + ' and a.GUM_GRO_UNT_ID = b.GRO_UNT_ID'
        + ' inner join REF$MERCHANDISE c on a.GUM_MERCHAN_ID = c.MERCHAN_ID'
        + ' and a.GUM_GRO_ID = '+ IntToStr(FGrpID)
        + ' and a.GUM_MERCHAN_ID = '+ IntToStr(FMerID)
        + ' and a.GUM_GRO_UNT_ID = ' + IntToStr(DialogUnit);

    with cOpenQuery(sSQL) do
    begin
      try
        edtGrpID.Text   := FieldByName('GUM_GRO_ID').AsString;
        edtGrpNm.Text   := FieldByName('GRO_NAME').AsString;
        edtGrpDesc.Text := FieldByName('GRO_DESCRIPTION').AsString;
        edtMerID.Text   := FieldByName('GUM_MERCHAN_ID').AsString;
        edtMerCode.Text := FieldByName('MERCHAN_CODE').AsString;
        edtMerNm.Text   := FieldByName('MERCHAN_NAME').AsString;
      finally
        free;
      end;
    end;  
  end;
end;

procedure TfrmDialogGroupUserMerchandise.FormCreate(Sender: TObject);
begin
  inherited;
  FMerID  := 0;
  FGrpID  := 0;
end;

function TfrmDialogGroupUserMerchandise.GetSQLGroupUser: string;
var
  sSQL: string;
begin
  sSQL := 'select GRO_ID as ID, GRO_NAME as NAME, GRO_DESCRIPTION AS DESCRIPTION'
        + ' from AUT$GROUP where GRO_UNT_ID = '+ IntToStr(DialogUnit);

  Result := sSQL;
end;

function TfrmDialogGroupUserMerchandise.GetSQLMerchan: string;
begin
  Result := 'select MERCHAN_ID AS ID, MERCHAN_CODE AS CODE,'
        + ' MERCHAN_NAME AS NAME'
        + ' from REF$MERCHANDISE';
end;

procedure TfrmDialogGroupUserMerchandise.LookUpData(aSender: TObject; aKey:
    Word);
begin
  if (aSender = edtGrpID) then
  begin
    IF (aKey = VK_f5) then
    begin
      with cLookUp('Daftar Grup User', GetSQLGroupUser) do
      begin
        try
          if Strings[0] <> '' then
          begin
            edtGrpID.Text   := Strings[0];
            edtGrpNm.Text   := Strings[1];
            edtGrpDesc.Text := Strings[2];
          end;
        finally
          Free;
        end;
      END;
    end
    ELSE If aKey = Vk_Return then
    begin

    end;
  end
  else if (aSender = edtMerID) then
  begin
    IF (aKey = VK_f5) then
    begin
      with cLookUp('Daftar Merchandise', GetSQLMerchan) do
      begin
        try
          if Strings[0] <> '' then
          begin
            edtMerID.Text   := Strings[0];
            edtMerCode.Text := Strings[1];
            edtMerNm.Text   := Strings[2];
          end;
        finally
          Free;
        end;
      END;
    end
    ELSE If aKey = Vk_Return then
    begin

    end;
  end;

end;

procedure TfrmDialogGroupUserMerchandise.edtGrpIDClickBtn(Sender: TObject);
begin
  inherited;
  LookUpData(edtGrpID, VK_f5);
end;

procedure TfrmDialogGroupUserMerchandise.edtMerIDClickBtn(Sender: TObject);
begin
  inherited;
   LookUpData(edtMerID, VK_f5);
end;

procedure TfrmDialogGroupUserMerchandise.edtGrpIDKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
    LookUpData(edtGrpID, VK_f5);
end;

procedure TfrmDialogGroupUserMerchandise.edtMerIDKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  LookUpData(edtMerID, VK_f5);
end;

end.
