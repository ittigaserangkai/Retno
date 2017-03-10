unit ufrmDayOfPO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uTSCommonDlg, uRetnoUnit;

type
  TfrmDayofPO = class(TForm)
    pnlBody: TPanel;
    pnlHeader: TPanel;
    chksun: TCheckBox;
    chkmon: TCheckBox;
    chktue: TCheckBox;
    chkwed: TCheckBox;
    chkthu: TCheckBox;
    chkfri: TCheckBox;
    chksat: TCheckBox;
    pnlFooter: TPanel;
    lbl8: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FIsProcessSuccessfull: boolean;
    FIsStore: Integer;
//    FNewsuplierMerchGoup : TNewSupplierMerGroup;
    FSelfUnitID: Integer;
    function GetSelfUnitID: Integer;
    procedure SetIsProcessSuccessfull(const Value: Boolean);
  public
    procedure SetCheckBox(CheckBox: TCheckBox; aNilai: Integer);
    property IsStore: Integer read FIsStore write FIsStore;
    property SelfUnitID: Integer read GetSelfUnitID write FSelfUnitID;
    { Public declarations }

  published
    property IsProcessSuccessfull: boolean read FIsProcessSuccessfull write SetIsProcessSuccessfull;
  end;

var
  frmDayofPO: TfrmDayofPO;

implementation

uses ufrmSupplier;

{$R *.dfm}

procedure TfrmDayofPO.FormCreate(Sender: TObject);
begin
  KeyPreview := true;
//  FNewsuplierMerchGoup := TNewSupplierMerGroup.Create(Self);

end;

procedure TfrmDayofPO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmDayofPO.FormDestroy(Sender: TObject);
begin
  frmDayofPO := nil;
end;

procedure TfrmDayofPO.FormShow(Sender: TObject);
var
  sKodeMErchan: string;
begin
  {clearbyTag(Self,[0]);

  sKodeMErchan := frmSupplier.SKodeMerchan;
  FNewsuplierMerchGoup.LoadByKode(sKodeMErchan);
  SetCheckBox(chksun,FNewsuplierMerchGoup.IsSun);
  SetCheckBox(chkmon,FNewsuplierMerchGoup.IsMon);
  SetCheckBox(chktue,FNewsuplierMerchGoup.IsTue);
  SetCheckBox(chkwed,FNewsuplierMerchGoup.IsWed);
  SetCheckBox(chkthu,FNewsuplierMerchGoup.IsThu);
  SetCheckBox(chkfri,FNewsuplierMerchGoup.IsFri);
  SetCheckBox(chksat,FNewsuplierMerchGoup.IsSat);
   }

end;

procedure TfrmDayOfPO.SetIsProcessSuccessfull(const Value: boolean);
begin
  FIsProcessSuccessfull := Value;
end;

procedure TfrmDayofPO.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  ismon,istue,iswed,isthu,isfri,issat,issun:ShortInt;
begin
  if (Key = VK_RETURN) then
  begin
    if chkmon.Checked then ismon := 1 else ismon := 0;
    if chktue.Checked then istue := 1 else istue := 0;
    if chkwed.Checked then iswed := 1 else iswed := 0;
    if chkthu.Checked then isthu := 1 else isthu := 0;
    if chkfri.Checked then isfri := 1 else isfri := 0;
    if chksat.Checked then issat := 1 else issat := 0;
    if chksun.Checked then issun := 1 else issun := 0;


    if IsStore = 0 then
    begin
//      FIsProcessSuccessfull := Suplier.UpdateDayOfPO(frmSupplier.UntID4update,frmSupplier.MerID4update,
//                               frmSupplier.SupCode4update,ismon,istue,iswed,isthu,
//                               isfri,issat,issun);
    end;
                               
    Close;
  end;
  
  if (Key = VK_ESCAPE) then
    Close;

end;

function TfrmDayofPO.GetSelfUnitID: Integer;
begin
  Result := FSelfUnitID;
  if FSelfUnitID = 0 then
  begin
    CommonDlg.ShowError('Unit Belum Dipilih');
    Application.Terminate;
  end;
end;

procedure TfrmDayofPO.SetCheckBox(CheckBox: TCheckBox; aNilai: Integer);
begin
  if aNilai = 1 then
    CheckBox.Checked := True
  else
    CheckBox.Checked := False
end;

end.
