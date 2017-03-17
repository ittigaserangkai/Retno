unit ufrmLokasi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, ufraFooter5Button, StdCtrls, ExtCtrls, Grids, DB,
  ActnList, uConn, uRetnoUnit, System.Actions, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid;

type
  TfrmLokasi = class(TfrmMaster)
    fraFooter5Button1: TfraFooter5Button;
    actlstLokasi: TActionList;
    actAddLokasi: TAction;
    actEditLokasi: TAction;
    actDeleteLokasi: TAction;
    actRefreshLokasi: TAction;
    cxGridViewLocation: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGrid: TcxGrid;

    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actEditLokasiExecute(Sender: TObject);
    procedure actAddLokasiExecute(Sender: TObject);
    procedure actDeleteLokasiExecute(Sender: TObject);
    procedure actRefreshLokasiExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
//  FNewLocation : TNewLocation;
    { Private declarations }
    function GetData(): TDataSet;

  public
  aKodeLama : String;
    { Public declarations }
  end;

var
  frmLokasi: TfrmLokasi;

implementation

uses uTSCommonDlg, ufrmDialogLokasi, uConstanta;

{$R *.dfm}

procedure TfrmLokasi.FormDestroy(Sender: TObject);
begin
  inherited;
  frmLokasi := nil;
end;

procedure TfrmLokasi.FormShow(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'LOCATION';
   actRefreshLokasiExecute(Self);
end;

procedure TfrmLokasi.actEditLokasiExecute(Sender: TObject);
begin
  // check is Unit Id is specified?
//  if MasterNewUnit.ID=0 then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    //frmMain.cbbUnit.SetFocus;
    Exit;
  end;
//  if(MasterNewUnit.ID <> 0) then
  begin
//   if strgGrid.Cells[0,strgGrid.row]=' ' then Exit;
    if not Assigned(frmDialogLokasi) then
      Application.CreateForm(TfrmDialogLokasi, frmDialogLokasi);

  {  frmDialogLokasi.Caption := 'Edit Location';
   frmDialogLokasi.FormMode    := fmEdit;
    frmDialogLokasi.LokasiCode  := strgGrid.Cells[0,strgGrid.Row];
    frmDialogLokasi.code        := strgGrid.Cells[0,strgGrid.Row];
    frmDialogLokasi.rack        := strgGrid.Cells[1,strgGrid.Row];
    frmDialogLokasi.bay         := strgGrid.Cells[2,strgGrid.Row];
    frmDialogLokasi.shelve      := strgGrid.Cells[3,strgGrid.Row];
    frmDialogLokasi.position    := strgGrid.Cells[4,strgGrid.Row];
    frmDialogLokasi.name        := strgGrid.Cells[5,strgGrid.Row];
    frmDialogLokasi.typeLok     := strgGrid.Cells[6,strgGrid.Row];
    frmDialogLokasi.capacity    := StrToInt(strgGrid.Cells[7,strgGrid.Row]);
    frmDialogLokasi.descrp      := strgGrid.Cells[8,strgGrid.Row];

    if strgGrid.Cells[9,strgGrid.Row] = 'Active' then
      frmDialogLokasi.isActive := 1
    else frmDialogLokasi.isActive := 0;


   {  if not Assigned(frmDialogLokasi) then
      Application.CreateForm(TfrmDialogLokasi, frmDialogLokasi);  }

      frmDialogLokasi.Caption := 'Edit Location';
      frmDialogLokasi.FormMode    := fmEdit;

      SetFormPropertyAndShowDialog(frmDialogLokasi);

   { if (frmDialogLokasi.IsProcessSuccessfull) then
    begin
      actRefreshLokasiExecute(Self);
      CommonDlg.ShowConfirm(atEdit);
    end
    else
      CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);   }
    end;
    frmDialogLokasi.Free;

end;

procedure TfrmLokasi.actAddLokasiExecute(Sender: TObject);
begin
  // check is Unit Id is specified?
//  if MasterNewUnit.ID=0 then
  begin
    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);
    //frmMain.cbbUnit.SetFocus;
    Exit;
  end;
//  if(MasterNewUnit.ID <> 0) then
  begin
    if not Assigned(frmDialogLokasi) then
      Application.CreateForm(TfrmDialogLokasi, frmDialogLokasi);

    frmDialogLokasi.Caption := 'Add Location';
    frmDialogLokasi.FormMode := fmAdd;

    SetFormPropertyAndShowDialog(frmDialogLokasi);
    if (frmDialogLokasi.IsProcessSuccessfull) then
    begin
     actRefreshLokasiExecute(Self);
     CommonDlg.ShowConfirm(atAdd);
    end;
  end
;//  else
//    CommonDlg.ShowError(ER_UNIT_NOT_SPECIFIC);

  frmDialogLokasi.Free;
end;

procedure TfrmLokasi.actDeleteLokasiExecute(Sender: TObject);
begin
//  if strgGrid.Cells[0,strgGrid.row]=' ' then Exit;
//  if (CommonDlg.Confirm('Are you sure you wish to delete Location ('+strgGrid.Cells[1,strgGrid.row]+')?') = mrYes) then
  begin
//  aKodeLama := strgGrid.Cells[0,strgGrid.row];
//  if FNewLocation.LoadByKode(aKodeLama) then
  begin
   { if FNewLocation.RemoveFromDB then
    begin
      cCommitTrans;
      CommonDlg.ShowMessage('Data berhasil Dihapus');
       actRefreshLokasiExecute(self);
      exit;
    end
    else begin
      cRollbackTrans;
      CommonDlg.ShowMessage('Data Gagal Dihapus');
    end;
    }
  end;
  end;


    // todo: put your code to delete data here..
    // code goes here..
   { if not assigned(Lokasi) then
      Lokasi := TLokasi.Create;

    if Lokasi.DeleteLokasi(strgGrid.Cells[0,strgGrid.row]) then
    begin
      actRefreshLokasiExecute(Self);
      CommonDlg.ShowConfirm(atDelete);
    end; }

end;

function TfrmLokasi.GetData(): TDataSet;
begin
  // inisiate the business model
{  if not assigned(Lokasi) then
    Lokasi := TLokasi.Create;

    Result := Lokasi.GetListLokasi(MasterNewUnit.ID)
    }
end;

procedure TfrmLokasi.actRefreshLokasiExecute(Sender: TObject);
var
  dataLokasi: TDataSet;
  i, countData:Integer;
begin
  dataLokasi := GetData();
  countData := dataLokasi.RecordCount;
  {
  with strgGrid do
  begin
    Clear;
    RowCount := countData+1;
    ColCount := 10;

    Cells[0,0]:=' CODE ';
    Cells[1,0]:=' RACK ';
    Cells[2,0]:=' BAY  ';
    Cells[3,0]:=' SHELVE';
    Cells[4,0]:=' POSITION';
    Cells[5,0]:=' NAME ';
    Cells[6,0]:=' TYPE ';
    Cells[7,0]:=' CAPACITY ';
    Cells[8,0]:=' DESCRIPTIONS ';
    Cells[9,0]:=' IS ACTIVE ';

    if RowCount > 1 then
    begin
      i := 1;
      while not dataLokasi.Eof do
      begin
        Cells[0, i] := dataLokasi.FieldByName('LOK_CODE').AsString;
        Cells[1, i] := dataLokasi.FieldByName('LOK_RACK').AsString;
        Cells[2, i] := dataLokasi.FieldByName('LOK_BAY').AsString;
        Cells[3, i] := dataLokasi.FieldByName('LOK_SHELVE').AsString;
        Cells[4, i] := dataLokasi.FieldByName('LOK_POSITION').AsString;
        Cells[5, i] := dataLokasi.FieldByName('LOK_NAME').AsString;
        Cells[6, i] := dataLokasi.FieldByName('LOK_TYPE').AsString;
        Cells[7, i] := dataLokasi.FieldByName('LOK_CAPACITY').AsString;
        Cells[8, i] := dataLokasi.FieldByName('LOK_DESCRIPTION').AsString;

        if dataLokasi.FieldByName('LOK_IS_ACTIVE').AsInteger = 1 then
          Cells[9, i] := 'Active'
        else Cells[9, i] := 'Not Active';


        dataLokasi.Next;
        Inc(i);
      end;
    end
    else
    begin
      RowCount := 2;
      Cells[0, 1] := ' ';
      Cells[1, 1] := ' ';
      Cells[2, 1] := ' ';
      Cells[3, 1] := ' ';
      Cells[4, 1] := ' ';
      Cells[5, 1] := ' ';

    end;

    FixedRows := 1;
    AutoSize := true;
  end; }
  //=== R ====
end;

procedure TfrmLokasi.FormActivate(Sender: TObject);
begin
  inherited;
  //frmMain.CreateMenu((sender as TForm));
end;

procedure TfrmLokasi.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  //frmMain.DestroyMenu((sender as TForm));
end;

procedure TfrmLokasi.FormCreate(Sender: TObject);
begin
  inherited;
//  FNewLocation := TNewLocation.Create(self);
end;

end.
