unit ufraLoading;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ExtCtrls;

type
  TfraLoading = class(TFrame)
    Panel1: TPanel;
    imgLoading: TImage;
    lblLoading: TLabel;
  private
    FLoadingMessage: string;
    procedure SetLoadingMessage(const Value: string);
  public         
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property LoadingMessage: string read FLoadingMessage write SetLoadingMessage;
  end;

implementation

{$R *.dfm}

{ TfraLoading }

constructor TfraLoading.Create(AOwner: TComponent);
begin
  inherited;
  //wgLoading.Enabled := true;
end;

destructor TfraLoading.Destroy;
begin
  //wgLoading.Enabled := false;
  inherited;
end;

procedure TfraLoading.SetLoadingMessage(const Value: string);
begin
  FLoadingMessage := Value;
  
  lblLoading.Caption := Value;
  lblLoading.Alignment := taLeftJustify;
  lblLoading.AutoSize := true;
end;

end.
