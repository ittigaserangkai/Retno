unit ufrmCXMsgInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls,
  cxEdit, cxStyles,
  cxDBData, Menus, cxButtons, cxTextEdit,
  cxMemo, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxGroupBox,
  cxCheckBox, cxSpinEdit, cxCurrencyEdit, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxCustomData, cxFilter, cxData, cxDataStorage, StdCtrls, ExtCtrls,
  cxNavigator, Datasnap.DBClient, Data.DB;

type
  TfrmCXMsgInfo = class(TForm)
    pnTop: TcxGroupBox;
    pnButtom: TcxGroupBox;
    cxGrdMain: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    mmPesan: TcxMemo;
    btnCancel: TcxButton;
    btnSaveExcel: TcxButton;
    btnOK: TcxButton;
    btnIgnore: TcxButton;
    btnNo: TcxButton;
    btnYes: TcxButton;
    SaveDialog1: TSaveDialog;
    PopupMenu1: TPopupMenu;
    CheckAll1: TMenuItem;
    UnCheckAll1: TMenuItem;
    cxStyleRepository1: TcxStyleRepository;
    styleEven: TcxStyle;
    Timer1: TTimer;
    styleDefault: TcxStyle;
    styleInfoBk: TcxStyle;
    procedure CheckAll1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UnCheckAll1Click(Sender: TObject);
    procedure btnSaveExcelClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FCDSResult: TClientDataset;
    FAutoFreeForm: Boolean;
    property AutoFreeForm: Boolean read FAutoFreeForm write FAutoFreeForm;
    { Private declarations }
  public
    procedure EnableColumns(GridDBView: TcxGridDBTableView; ColNames: Array Of
        String);
    procedure HideColumnByNames(GridDBView: TcxGridDBTableView; ColNames: Array Of
        String);
    procedure PrepareButtons(Buttons: TMsgDlgButtons; EnableSave: Boolean);
    procedure PrepareDataSetFrom(Source: TDataSet; ShowChecked: Boolean);
    procedure PrepareGrid(HideCols, EditableCols: Array Of String; ShowChecked:
        Boolean = False);
    procedure SetChecked(CheckState: Boolean);
    procedure SetWarningLabel;
    class function ShowMsgGrid(ListMessage: WideString; CDSInput: TClientDataset;
        Buttons: TMsgDlgButtons; HideCols, EditableCols: Array Of String;
        ShowChecked: Boolean = False; AllowSaveExcel: Boolean = False):
        TfrmCXMsgInfo; overload;
    class function ShowSimpleMsg(ListMessage: WideString; CDSInput: TDataSet;
        HiddenCols: Array Of String; ShowModal: Boolean = True): TfrmCXMsgInfo;
        overload;
    class function ShowWarning(ListMessage: WideString; CDSInput: TClientDataset;
        HideCols: Array Of String): TfrmCXMsgInfo; overload;
    property CDSResult: TClientDataset read FCDSResult write FCDSResult;
    { Public declarations }
  end;

var
  frmCXMsgInfo: TfrmCXMsgInfo;
  ModalResults: array[TMsgDlgBtn] of Integer = (
    mrYes, mrNo, mrOk, mrCancel, mrAbort, mrRetry, mrIgnore, mrAll, mrNoToAll,
    mrYesToAll, 0, mrClose);

const
  CheckFieldName : String = 'CHECKED';


implementation

uses uDBUtils, uDXUtils;


{$R *.dfm}

procedure TfrmCXMsgInfo.HideColumnByNames(GridDBView: TcxGridDBTableView;
    ColNames: Array Of String);
var i:Integer;
begin
  for i:=Low(ColNames) to High(ColNames) do
  begin
    If assigned(GridDBView.GetColumnByFieldName(ColNames[i])) then
    begin
      GridDBView.GetColumnByFieldName(ColNames[i]).Visible := False;
    end;
  end;
end;

procedure TfrmCXMsgInfo.EnableColumns(GridDBView: TcxGridDBTableView; ColNames:
    Array Of String);
var i:Integer;
begin
  for i:=Low(ColNames) to High(ColNames) do
  begin
    If assigned(GridDBView.GetColumnByFieldName(ColNames[i])) then
    begin
      GridDBView.GetColumnByFieldName(ColNames[i]).Editing := True;
    end;
  end;
end;

procedure TfrmCXMsgInfo.PrepareDataSetFrom(Source: TDataSet; ShowChecked:
    Boolean);
var
  i: Integer;
  lFieldName: string;
  lRecNo: Integer;
begin
  If Assigned(FCDSResult) then FCDSResult.Free;

  FCDSResult := TClientDataSet.Create(nil);

  FCDSResult.FieldDefs.Assign(Source.FieldDefs);

  If ShowChecked then
    FCDSResult.AddField(CheckFieldName , ftBoolean);

  for i := 0 to CDSResult.FieldDefs.Count-1 do
    FCDSResult.FieldDefs.Items[i].Required := False;

//  for i := 0 to CDSResult.Fields.Count-1 do
//  begin
//    CDSResult.Fields[i].ReadOnly := False;
//    CDSResult.Fields[i].Required := False;
//  end;

  FCDSResult.CreateDataSet;

  lRecNo := Source.RecNo;
  Source.DisableControls;
  Try
    Source.First;
    While not Source.Eof do
    begin
      CDSResult.Append;
      for i:=0 to Source.FieldCount-1 do
      begin
        lFieldName := Source.Fields[i].FieldName;
        CDSResult.FieldByName(lFieldName).Value := Source.FieldByName(lFieldName).Value;
      end;
      Source.Next;
      CDSResult.Post;
    end;
  Finally
    Source.RecNo := lRecNo;
    Source.EnableControls;
  end;
end;

procedure TfrmCXMsgInfo.PrepareGrid(HideCols, EditableCols: Array Of String;
    ShowChecked: Boolean = False);
var
  i: Integer;
  lDataType: TFieldType;
begin
  If not Assigned(FCDSResult) then exit;
  With cxGrdMain do
  begin
    if not Assigned(DataController.DataSource) then
      DataController.DataSource := TDataSource.Create(self);
     DataController.DataSource.DataSet := CDSResult;
     DataController.CreateAllItems(True);

    for i:=0 to ColumnCount-1 do
    begin
      lDataType := CDSResult.FieldByName( Columns[i].DataBinding.FieldName).DataType;
      If lDataType in [ftFloat, ftCurrency, ftFMTBcd]
      then begin
        Columns[i].PropertiesClass := TcxCurrencyEditProperties;
//        TcxCurrencyEditProperties( Columns[i].Properties).DisplayFormat := ',0.00;(,0.00)';
        TcxCurrencyEditProperties( Columns[i].Properties).DisplayFormat := ',0.##;(,0.##)';
        TcxCurrencyEditProperties( Columns[i].Properties).Alignment.Horz := taRightJustify;
        If Assigned(Columns[i].Properties) then Columns[i].Properties.ReadOnly := True;
      end else If (lDataType = ftBoolean) then
      begin
        Columns[i].PropertiesClass := TcxCheckBoxProperties;
      end else If (lDataType = ftInteger) then
      begin
        Columns[i].PropertiesClass := TcxSpinEditProperties;
      end;

      If Columns[i].DataBinding.FieldName = CheckFieldName then
        Columns[i].Options.Editing := True
      else
        Columns[i].Options.Editing := False;
    end;
  end;

  HideColumnByNames( cxGrdMain, HideCols);
  If not ShowChecked then
  begin
    HideColumnByNames(cxGrdMain, [CheckFieldName]);
    cxGrdMain.PopupMenu := nil;
  end;

  EnableColumns( cxGrdMain, EditableCols);
  cxGrdMain.ApplyBestFit;
end;


procedure TfrmCXMsgInfo.btnSaveExcelClick(Sender: TObject);
begin
  cxGrdMain.ExportToXLS;
end;

procedure TfrmCXMsgInfo.CheckAll1Click(Sender: TObject);
begin
  SetChecked(True);
end;

procedure TfrmCXMsgInfo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  If Self.AutoFreeForm then
    Action := caFree;
end;

procedure TfrmCXMsgInfo.FormKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  if Key = VK_ESCAPE then Self.Close;
end;

procedure TfrmCXMsgInfo.FormShow(Sender: TObject);
begin
  If btnOK.Visible then btnOK.SetFocus
  else If btnYes.Visible then btnYes.SetFocus
  else if btnIgnore.Visible then btnIgnore.SetFocus;
end;

procedure TfrmCXMsgInfo.PrepareButtons(Buttons: TMsgDlgButtons; EnableSave:
    Boolean);
var
  B: TMsgDlgBtn;
  ibutton: Integer;
  //lControl: TWinControl;
begin
  for ibutton := 0 to pnButtom.ControlCount-1 do
  begin
    If pnButtom.Controls[ibutton] is TcxButton then
    begin
      TcxButton(pnButtom.Controls[ibutton]).Visible := False;

      for B := Low(TMsgDlgBtn) to High(TMsgDlgBtn) do
      //for i := Low(Buttons) to High(Buttons) do
      begin
        If B in Buttons then
        begin
          If TcxButton(pnButtom.Controls[ibutton]).ModalResult = ModalResults[B] then
            TcxButton(pnButtom.Controls[ibutton]).Visible := True;
        end;
      end;
    end;
  end;
  btnSaveExcel.Visible := EnableSave;
end;

procedure TfrmCXMsgInfo.SetChecked(CheckState: Boolean);
var
  lCDS: TClientDataset;
begin
  lCDS := TClientDataSet.Create(Self);
  Try
    lCDS.CloneCursor(CDSResult, True);
    lCDS.First;
    While not lCDS.Eof do
    begin
      lCDS.Edit;
      lCDS.FieldByName(CheckFieldName).AsBoolean := CheckState;
      lCDS.Post;
      lCDS.Next;
    end;
  Finally
    lCDS.Free;
  end;
end;

procedure TfrmCXMsgInfo.SetWarningLabel;
begin
  timer1.Enabled := True;
//  mmPesan.Style.TextColor := clRed;
end;

class function TfrmCXMsgInfo.ShowMsgGrid(ListMessage: WideString; CDSInput:
    TClientDataset; Buttons: TMsgDlgButtons; HideCols, EditableCols: Array Of
    String; ShowChecked: Boolean = False; AllowSaveExcel: Boolean = False):
    TfrmCXMsgInfo;
begin
  Result := TfrmCXMsgInfo.Create(Application);
  Result.AutoFreeForm := False;
  Result.mmPesan.Text := ListMessage;
  Result.PrepareButtons(Buttons, AllowSaveExcel);
  Result.PrepareDataSetFrom(CDSInput, ShowChecked);
  Result.PrepareGrid(HideCols, EditableCols, ShowChecked);
end;

class function TfrmCXMsgInfo.ShowSimpleMsg(ListMessage: WideString; CDSInput:
    TDataSet; HiddenCols: Array Of String; ShowModal: Boolean = True):
    TfrmCXMsgInfo;
begin
  Result := TfrmCXMsgInfo.Create(Application);
  Result.AutoFreeForm := True;
  Result.mmPesan.Text := ListMessage;
  Result.PrepareButtons([mbOK], True);
  Result.PrepareDataSetFrom(CDSInput, False);
  Result.PrepareGrid(HiddenCols, [], False);
  if ShowModal then
    Result.ShowModal;
end;

class function TfrmCXMsgInfo.ShowWarning(ListMessage: WideString; CDSInput:
    TClientDataset; HideCols: Array Of String): TfrmCXMsgInfo;
begin
  Result := TfrmCXMsgInfo.ShowMsgGrid(ListMessage, CDSInput,[mbOK], HideCols, [], False, True);
  Result.AutoFreeForm := True;
  Result.SetWarningLabel;
  Result.ShowModal;
end;

procedure TfrmCXMsgInfo.Timer1Timer(Sender: TObject);
begin
  If mmPesan.Style.TextColor = clBlack then
    mmPesan.Style.TextColor := clRed
  else
    mmPesan.Style.TextColor := clBlack;
  Self.Refresh;
end;

procedure TfrmCXMsgInfo.UnCheckAll1Click(Sender: TObject);
begin
  SetChecked(False);
end;

end.
