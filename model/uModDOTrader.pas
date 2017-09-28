unit uModDOTrader;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs, uModApp, uModPOTrader;

type
  TModDOTrader = class(TModApp)
  private
    FDOT_POTrader: TModPOTrader;
  published
    property DOT_POTrader: TModPOTrader read FDOT_POTrader write FDOT_POTrader;
  end;


implementation



end.
