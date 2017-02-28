unit ufraProgressBar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxProgressBar;

type
  TfraProgressBar = class(TFrame)
    pnl1: TPanel;
    lblKeterangan: TLabel;
    pb1: TcxProgressBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
