unit ufrmSettingSellingPrice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMaster, StdCtrls, ExtCtrls, ufraFooter1Button, SUIButton,
  JvTypedEdit, JvEdit, ActnList;

type
  TfrmSettingSellingPrice = class(TfrmMaster)
    frafoo1: TfraFooter1Button;
    cbbPriceType: TComboBox;
    lbl1: TLabel;
    Panel1: TPanel;
    btnSetMarkup: TsuiButton;
    lbl2: TLabel;
    fedtMarkup: TJvValidateEdit;
    curredtDiscNominal: TJvValidateEdit;
    btnSetDiscNominal: TsuiButton;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    actSettingSellingPrice: TActionList;
    actSetMarkup: TAction;
    actSetDiscNominal: TAction;
    procedure FormCreate(Sender: TObject);
    procedure actSetMarkupExecute(Sender: TObject);
    procedure actSetDiscNominalExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSettingSellingPrice: TfrmSettingSellingPrice;

implementation

{$R *.dfm}

procedure TfrmSettingSellingPrice.FormCreate(Sender: TObject);
begin
  inherited;
  lblHeader.Caption := 'SETTING SELLING PRICE BY PRICE TYPE';
end;

procedure TfrmSettingSellingPrice.actSetMarkupExecute(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmSettingSellingPrice.actSetDiscNominalExecute(
  Sender: TObject);
begin
  inherited;
  //
end;

end.
