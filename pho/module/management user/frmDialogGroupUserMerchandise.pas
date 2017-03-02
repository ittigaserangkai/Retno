unit frmDialogGroupUserMerchandise;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMasterDialog, ufraFooterDialog2Button, ExtCtrls, SUIForm,
  StdCtrls, EditBtn;

type
  TfrmMasterDialog2 = class(TfrmMasterDialog)
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtGrpID: TEditBtn;
    edtGrpNm: TEdit;
    edtGrpDesc: TEdit;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    edtMerID: TEditBtn;
    edtMerCode: TEdit;
    edtMerDesc: TEdit;
    Label7: TLabel;
    edtMerNm: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMasterDialog2: TfrmMasterDialog2;

implementation

{$R *.dfm}

end.
