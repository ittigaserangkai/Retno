unit ufrmImportFromStore;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, EditBtn, ExtCtrls;

type
  TfrmImportFromStore = class(TForm)
    pnlBody: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    btnLoad: TButton;
    edtFileName: TEditBtn;
    btSimpan: TButton;
    mmoImport: TMemo;
    pnlHeader: TPanel;
    lblHeader: TLabel;
    OpenDialog1: TOpenDialog;
    procedure edtFileNameClickBtn(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure btSimpanClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FUnitID: Integer;
  public
    { Public declarations }
    function OlahStringField(aArrayOfField : String; aTableName : String): string;
    function OlahStringSQL(aStringSQL : String): string;
    function SimpanDataStore: Boolean;
    property UnitID: Integer read FUnitID write FUnitID;
  end;

var
  frmImportFromStore: TfrmImportFromStore;

implementation
uses uretnounit, uTSCommonDlg;

{$R *.dfm}

procedure TfrmImportFromStore.edtFileNameClickBtn(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    edtFileName.Text := OpenDialog1.FileName;
  end;
end;

procedure TfrmImportFromStore.btnLoadClick(Sender: TObject);
begin
  mmoImport.Lines.LoadFromFile(edtFileName.Text);
end;

procedure TfrmImportFromStore.btSimpanClick(Sender: TObject);
begin
  {
  try
    if SimPanDataStore then
    begin
      cCommitTrans;
      CommonDlg.ShowMessage('Simpan Data Store');
      FormShow(nil);
    end
    else
    begin
      cRollbackTrans;
      CommonDlg.ShowError('Gagal Data Store');
    end;
  finally
    cRollbackTrans;
  end;
  }
end;

function TfrmImportFromStore.SimpanDataStore: Boolean;
var
  sNamaTable: string;
  sSQL: string;
  SS: TStrings;
  sInsertInto: string;
  i: Integer;
begin
  Result := False;

  SS := TStringList.Create;
  try
    for i := 0 to mmoImport.Lines.Count - 1 do
    begin

      if (Pos('<TABLE>', mmoImport.Lines[i]) > 0)
                    and (Pos('</TABLE>', mmoImport.Lines[i]) > 0) then // table
      begin
        sNamaTable := StringReplace(mmoImport.Lines[i],'<TABLE>','', [rfReplaceAll,rfIgnoreCase]);
        sNamaTable := StringReplace(sNamaTable,'</TABLE>','', [rfReplaceAll,rfIgnoreCase]);

        sInsertInto := '';
        sSQL        := '';
      end
      else if (Pos('<FIELD>', mmoImport.Lines[i]) > 0)
                and (Pos('</FIELD>', mmoImport.Lines[i]) > 0) then // nama field
      begin
        sInsertInto := OlahStringField(mmoImport.Lines[i], sNamaTable);
      end
      else if (Pos('<SQL>', mmoImport.Lines[i]) > 0) and (Pos('</SQL>', mmoImport.Lines[i]) > 0) then // SQL
      begin
        sSQL := sInsertInto + 'values(' +  OlahStringSQL(mmoImport.Lines[i]) + ');';
        SS.Add(sSQL);
      end;
    end;

    SS.SaveToFile(cGetAppPath + 'InsertDataStore.txt');

    {
    if kExecuteSQLs(123, SS) then
      Result := True;
     }
  finally
    SS.Free;
  end;

end;

procedure TfrmImportFromStore.FormShow(Sender: TObject);
begin
//  ClearByTag(Self, [0]);
end;

function TfrmImportFromStore.OlahStringField(aArrayOfField : String; aTableName
    : String): string;
var
  sStringField: string;
begin
  sStringField := StringReplace(aArrayOfField,'<FIELD>','', [rfReplaceAll,rfIgnoreCase]); // menghilangkan <FIELD>
  sStringField := StringReplace(sStringField,'</FIELD>','', [rfReplaceAll,rfIgnoreCase]); // menghilangkan </FIELD>
  sStringField := StringReplace(sStringField, '~',',', [rfReplaceAll,rfIgnoreCase]) ; // menghilangkan ~
  sStringField := Copy(sStringField, 1, Length(sStringField) - 1); // menhilangkan koma terkahir
  Result := 'insert into ' + aTableName + ' (' + sStringField + ')';
end;

function TfrmImportFromStore.OlahStringSQL(aStringSQL : String): string;
var
  sStringSQL: string;
begin
  //Result := '';
  sStringSQL  := StringReplace(aStringSQL,'<SQL>','', [rfReplaceAll, rfIgnoreCase]);
  sStringSQL  := StringReplace(sStringSQL,'</SQL>','', [rfReplaceAll, rfIgnoreCase]);
  sStringSQL  := StringReplace(sStringSQL,'~',''',''', [rfReplaceAll, rfIgnoreCase]);
  sStringSQL  := StringReplace(sStringSQL,''''',''','null,''', [rfReplaceAll, rfIgnoreCase]);
  sStringSQL  := Copy(sStringSQL, 1, Length(sStringSQL) - 2);
  sStringSQL  := '''' +  sStringSQL;// + '''';
  Result      := sStringSQL;
end;

procedure TfrmImportFromStore.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;



end.
