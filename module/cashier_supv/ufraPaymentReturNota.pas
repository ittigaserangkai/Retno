unit ufraPaymentReturNota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxLabel, cxTextEdit, cxCurrencyEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
  Vcl.ExtCtrls;

type
  TfraPaymentNotaRetur = class(TFrame)
    pnl1: TPanel;
    pnl2: TPanel;
    lbl1: TLabel;
    curredt1: TcxCurrencyEdit;
    pnl5: TPanel;
    lbl8: TLabel;
    curredt4: TcxCurrencyEdit;
    pnl6: TPanel;
    cbp1: TcxExtLookupComboBox;
    lbl2: TLabel;
    pnl4: TPanel;
    lbl3: TLabel;
    curredt2: TcxCurrencyEdit;
    pnl3: TPanel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    cbp2: TcxExtLookupComboBox;
    edt1: TEdit;
    curredt3: TcxCurrencyEdit;
    edt2: TEdit;
    lbl9: TcxLabel;
    procedure FrameExit(Sender: TObject);
    procedure cbp1KeyPress(Sender: TObject; var Key: Char);
  private
  public
    procedure ParseDataComboBox();
    procedure ParseDataCard();
  end;

var
  fraPaymentReturNota: TfraPaymentNotaRetur;

implementation

{$R *.dfm}

{ TfraPaymentNotaRetur }

procedure TfraPaymentNotaRetur.ParseDataComboBox;
begin
  {with cbp1 do
  begin
    ClearGridData;
    ColCount := 3;
    RowCount := 3;

    AddRow(['ID', 'CODE', 'DESCRIPTION']);
    AddRow(['1', '1', 'CASH']);
    AddRow(['2', '2', 'CARD']);

    FixedRows := 1;
    SizeGridToData;
    Text := '';
  end;
  }
end;

procedure TfraPaymentNotaRetur.FrameExit(Sender: TObject);
begin
  fraPaymentReturNota.Parent := nil;
end;

procedure TfraPaymentNotaRetur.ParseDataCard;
begin
  {with cbp2 do
  begin   
    ClearGridData;
    ColCount := 4;
    RowCount := 4;

    AddRow(['Id', 'CARD CODE.','CARD NAME','CREDIT/DEBET']);
    AddRow(['1', '01','BCA CARD','CREDIT']);
    AddRow(['2', '02','BCA DEBET - CARD','DEBET']);
    AddRow(['3', '03','VISA CARD','CREDIT']);

    FixedRows := 1;
    SizeGridToData;
    Text := '';
  end;
  }
end;

procedure TfraPaymentNotaRetur.cbp1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then
  begin
    if (cbp1.Text = '1') then
    begin
      cbp1.Text := '1';
      curredt2.Value := 49004;
      curredt2.SetFocus;
    end
    else if (cbp1.Text = '2') then
    begin
      cbp1.Text := '2';
      curredt2.Value := 0;
      cbp2.SetFocus;
    end;
  end;
end;

end.
