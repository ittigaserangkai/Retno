unit ufrmDialogPrintKasirPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, StdCtrls,
  ExtCtrls, ComCtrls, System.Actions, Vcl.ActnList, ufraFooterDialog3Button;

type
  TfrmDialogPrintKasirPreview = class(TfrmMasterDialog)
    pnlTop: TPanel;
    pnlBottom: TPanel;
    mmoPrint: TMemo;
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDialogPrintKasirPreview: TfrmDialogPrintKasirPreview;

implementation

uses uTemplatePrintText;

{$R *.dfm}

procedure TfrmDialogPrintKasirPreview.actDeleteExecute(Sender: TObject);
var
  _print_dialog: TPrintDialog;
  _string_file: string;
begin
  inherited;
  _print_dialog := TPrintDialog.Create(Self);

  if _print_dialog.Execute then
  begin
    _string_file := ExtractFilePath(Application.ExeName) + GENERAL_TEXT_FILE_NAME_TEMPORARY;
    mmoPrint.Lines.SaveToFile(_string_file);
    PrintFile(_string_file);
    if FileExists(_string_file) then
      DeleteFile(_string_file);
  end;
end;

procedure TfrmDialogPrintKasirPreview.actSaveExecute(Sender: TObject);
var
  _save_dialog: TSaveDialog;
begin
  inherited;
  _save_dialog := TSaveDialog.Create(Self);

  if _save_dialog.Execute then
  begin
    mmoPrint.Lines.SaveToFile(_save_dialog.FileName);
  end;
end;

procedure TfrmDialogPrintKasirPreview.FormDestroy(Sender: TObject);
begin
  inherited;
  frmDialogPrintKasirPreview := nil;
end;

end.
