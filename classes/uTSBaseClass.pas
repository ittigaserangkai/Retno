unit uTSBaseClass;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs;

type
  TSBaseClassClass = class Of TSBaseClass;

  TComponentMode = (csNone, csCreated, csLoaded);
  TSBaseClass = class(TComponent)
  private
    FMode: TComponentMode;
  published
    property Mode: TComponentMode read FMode write FMode;
    property State: TComponentMode read FMode write FMode;
  public
    constructor Create(aOwner : TComponent); override;
    function ExportToXML: WideString; dynamic;
  end;



implementation

constructor TSBaseClass.Create(aOwner : TComponent);
begin
  inherited Create(aOwner);
  State := csNone;
end;

function TSBaseClass.ExportToXML: WideString;
begin

  Result := '';
  ShowMessage('Export to XML');
end;



end.
