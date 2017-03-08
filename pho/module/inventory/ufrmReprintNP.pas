{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
unit ufrmReprintNP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, ufraFooter1Button, StdCtrls, ExtCtrls, SUIButton, JclStrings,
  ActnList, uRMSUnit;

type
  TfrmReprintNP = class(TfrmMaster)
    frafoo1: TfraFooter1Button;
    lbl1: TLabel;
    edt1: TEdit;
    btn1: TsuiButton;
    btn2: TsuiButton;
    btn3: TsuiButton;
    btn4: TsuiButton;
    actlst1: TActionList;
    actReprintNP: TAction;
    actCheckListReprintNP: TAction;
    actShowDetailReprintNP: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edt1KeyPress(Sender: TObject; var Key: Char);
    procedure btn1Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure actReprintNPExecute(Sender: TObject);
    procedure actCheckListReprintNPExecute(Sender: TObject);
    procedure actShowDetailReprintNPExecute(Sender: TObject);
    procedure edt1Exit(Sender: TObject);
    procedure btn2Enter(Sender: TObject);
    procedure btn3Enter(Sender: TObject);
    procedure btn4Enter(Sender: TObject);
    procedure btn1Enter(Sender: TObject);
    procedure btn1Exit(Sender: TObject);
    procedure btn4Exit(Sender: TObject);
    procedure btn3Exit(Sender: TObject);
    procedure btn2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReprintNP: TfrmReprintNP;
  ParamList: TStringList;

implementation

uses uGTSUICommonDlg,suithemes,  ufrmDeliveryOrder, uConstanta,
   uSearchPO, uConn, udmReport, ufrmDialogPrintPreview;

{$R *.dfm}

procedure TfrmReprintNP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  //frmMain.DestroyMenu((Sender as TForm));
  Action := caFree;
end;

procedure TfrmReprintNP.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'REPRINT / CHECK LIST NP';
end;

procedure TfrmReprintNP.FormDestroy(Sender: TObject);
begin
  inherited;
  frmReprintNP := nil;
end;

procedure TfrmReprintNP.edt1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    if (Trim(edt1.Text) = '') then
    begin
      CommonDlg.ShowError(ER_PO_IS_NOT_EXIST);
      edt1.SetFocus;
    end
    else
      edt1.Text := StrPadLeft(Trim(edt1.Text), 10, '0');
  end;
end;

procedure TfrmReprintNP.btn1Click(Sender: TObject);
var
  sSQL: string;
begin
  {
  if not Assigned(frmDialogSearchPO) then
    Application.CreateForm(TfrmDialogSearchPO, frmDialogSearchPO);
  frmDialogSearchPO.frmSuiMasterDialog.Caption := 'Search PO...';
  frmDialogSearchPO.Modul:= tmReprintNP;
  if (frmDialogSearchPO.IsProcessSuccessfull) then
  begin
    edt1.Text := frmDialogSearchPO.strgGrid.Cells[2,frmDialogSearchPO.strgGrid.Row];
    edt1.SetFocus;
  end;
  frmDialogSearchPO.Free;
  }

  sSQL := 'select po_no as Nobukti, PO_date as Tanggal , po_so_no as Nomorso'
          + ' from po'
          + ' where po_unt_id = ' + IntToStr(MasterNewUnit.ID)
          + ' and po_stapo_id = 5';

  with cLookUp('Daftar PO', sSQL) do
  begin
    try
      if Trim(Strings[0]) = '' then
        Exit;

      edt1.Text := Strings[0];
      edt1.SetFocus;
    finally
      Free;
    end;
  end;

end;

procedure TfrmReprintNP.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if(Key = Ord('C'))and(ssctrl in Shift) then
    actReprintNPExecute(self);
  if(Key = Ord('D'))and(ssctrl in Shift) then
    actCheckListReprintNPExecute(self);
  if(Key = Ord('H'))and(ssctrl in Shift) then
    actShowDetailReprintNPExecute(self);
  if(Key = VK_F2) then
    btn1Click(self);       
end;

procedure TfrmReprintNP.FormActivate(Sender: TObject);
begin
  inherited;
  //frmMain.CreateMenu((Sender as TForm));
end;

procedure TfrmReprintNP.actReprintNPExecute(Sender: TObject);
var SeparatorDate: Char;
    data: TResultDataSet;
    arrParam: TArr;
begin
  if (edt1.Text <> '') then
  begin
//    if (CommonDlg.Confirm('Are you sure to reprint NP (PO NO.: '+ edt1.Text +')?') = mrYes) then
//    begin
//      commonDlg.ShowConfirmGlobal(PRINT_NP_SUCCESSFULLY);
//    end;

    SeparatorDate:= FormatSettings.DateSeparator;

    try
      FormatSettings.DateSeparator:= '/';

      SetLength(arrParam,1);
      arrParam[0].tipe:= ptString;
      arrParam[0].data:= Trim(edt1.Text);

      if not Assigned(SearchPO) then
        SearchPO:= TSearchPO.Create;
      data:= SearchPO.GetDataNP(arrParam);

      if not Assigned(ParamList) then
        ParamList := TStringList.Create;

      if not data.IsEmpty then begin
        data.First;
        ParamList.Add(data.FieldByName('do_np').AsString); //0
        ParamList.Add(edt1.Text); //1
        ParamList.Add(FloatToStr(data.FieldByName('DO_COLIE_ORDER_RECV').AsFloat)); //2
        ParamList.Add(FloatToStr(data.FieldByName('do_colie_bonus').AsFloat)); //3
        ParamList.Add(FLoginFullname); //4
      end
      else begin
        ParamList.Add(''); //0
        ParamList.Add(edt1.Text); //1
        ParamList.Add(''); //2
        ParamList.Add(''); //3
        ParamList.Add(FLoginFullname); //4
        ParamList.Add(MasterNewUnit.Nama); //5
      end;

      if not assigned(frmDialogPrintPreview) then
        frmDialogPrintPreview:= TfrmDialogPrintPreview.Create(Application);

      frmDialogPrintPreview.ListParams:= ParamList;
      frmDialogPrintPreview.FilePath:= FFilePathReport+'frCetakNP.fr3';
      SetFormPropertyAndShowDialog(frmDialogPrintPreview);
//      with dmReport do begin
//        Params := ParamList;
//        //frxDBDataset.DataSet := dataKuponBotol;
//        pMainReport.LoadFromFile(ExtractFilePath(Application.ExeName) + '/template/frCetakNP.fr3');
//        pMainReport.ShowReport(True);
//        //pMainReport.Print;
//      end;
    finally
      FormatSettings.DateSeparator:= SeparatorDate;
      frmDialogPrintPreview.Free;
      FreeAndNil(ParamList);
      FreeAndNil(SearchPO);
    end;
  end
  else
  begin
    CommonDlg.ShowError('Please entry number of PO first.');
    edt1.SetFocus;
  end;
end;

procedure TfrmReprintNP.actCheckListReprintNPExecute(Sender: TObject);
var SeparatorDate: Char;
    data: TResultDataSet;
    arrParam: TArr;
begin
  if (edt1.Text <> '') then begin
    if (CommonDlg.Confirm('Are you sure you want to print check list NP (PO NO. : '+ edt1.Text +')?') = mrYes) then begin
      SeparatorDate:= FormatSettings.DateSeparator;

      try
        FormatSettings.DateSeparator:= '/';

        SetLength(arrParam,1);
        arrParam[0].tipe:= ptString;
        arrParam[0].data:= edt1.Text;

        if not Assigned(SearchPO) then
          SearchPO:= TSearchPO.Create;
        data:= SearchPO.CheckListNP(arrParam);

        if not Assigned(ParamList) then
          ParamList := TStringList.Create;
        ParamList.Add(edt1.Text); //0
        ParamList.Add(FLoginFullname); //1
        if not data.IsEmpty then begin
          data.First;
          ParamList.Add(data.FieldByName('O_SUP_NAME').AsString); //2
          ParamList.Add(data.FieldByName('O_DO_NO').AsString); //3      
          ParamList.Add(FormatDateTime('dd/mm/yy', data.FieldByName('O_PO_DATE').AsDateTime)); //4
          ParamList.Add(FormatDateTime('dd/mm/yy', data.FieldByName('O_DO_DATE').AsDateTime)); //5
          ParamList.Add(data.FieldByName('O_NP').AsString); //6
          ParamList.Add(data.FieldByName('O_MERCHAN').AsString); //7
        end
        else begin
          ParamList.Add(''); //2
          ParamList.Add(''); //3
          ParamList.Add(''); //4
          ParamList.Add(''); //5
          ParamList.Add(''); //6
          ParamList.Add(''); //7
        end;
        ParamList.Add(MasterNewUnit.Nama); //8

        if not assigned(frmDialogPrintPreview) then
          frmDialogPrintPreview:= TfrmDialogPrintPreview.Create(Application);

//        frmDialogPrintPreview.IsTextReport := True;
        frmDialogPrintPreview.ListParams:= ParamList;
        frmDialogPrintPreview.RecordSet:= data;
        frmDialogPrintPreview.FilePath:= FFilePathReport+'frCheckListText.fr3';
        SetFormPropertyAndShowDialog(frmDialogPrintPreview);

        frmDialogPrintPreview.Free;

//        with dmReport do begin
//          Params := ParamList;
//          frxDBDataset.DataSet := data;
//          pMainReport.LoadFromFile(ExtractFilePath(Application.ExeName) + '/template/frCheckList.fr3');
//          pMainReport.ShowReport(True);
//        end;
      finally
        FreeAndNil(ParamList);
        FreeAndNil(SearchPO);
        FormatSettings.DateSeparator:= SeparatorDate;
      end;
    end;
  end
  else
  begin
    CommonDlg.ShowError('Please entry number of PO first.');
    edt1.SetFocus;
  end;    
end;

procedure TfrmReprintNP.actShowDetailReprintNPExecute(Sender: TObject);
begin
  if not assigned(frmDeliveryOrder) then
    frmDeliveryOrder := TfrmDeliveryOrder.Create(Application);

  frmDeliveryOrder.edtPONo.Text:= edt1.Text;
  frmDeliveryOrder.lblHeader.Caption := 'DETAIL NP';
  frmDeliveryOrder.Show;
end;

procedure TfrmReprintNP.edt1Exit(Sender: TObject);
begin
  inherited;
  if Trim(edt1.Text) <> '' then
    edt1.Text := StrPadLeft(Trim(edt1.Text), 10, '0');
end;

procedure TfrmReprintNP.btn2Enter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmReprintNP.btn3Enter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmReprintNP.btn4Enter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmReprintNP.btn1Enter(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := DeepBlue;
end;

procedure TfrmReprintNP.btn1Exit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

procedure TfrmReprintNP.btn4Exit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

procedure TfrmReprintNP.btn3Exit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

procedure TfrmReprintNP.btn2Exit(Sender: TObject);
begin
  inherited;
  (Sender as TsuiButton).UIStyle := BlueGlass;
end;

end.

