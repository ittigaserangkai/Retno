unit uNetUtils;

interface

uses
    Winsock;

function GetIPFromHost(var HostName, IPaddr, WSAErr: string): Boolean;

implementation

function GetIPFromHost(var HostName, IPaddr, WSAErr: string): Boolean;
var
  HEnt: pHostEnt;
  WSAData: TWSAData;
  i: TInAddr;
begin
  Result := False;
  IPaddr := ''; // '0.0.0.0'
  if WSAStartup($0101, WSAData) <> 0 then begin
    WSAErr := 'Winsock is not responding."';
    Exit;
  end;
  HEnt := GetHostByName(PAnsiChar(AnsiString(HostName)));
  if Assigned(HEnt) then
  begin
    i := PInAddr(HEnt^.h_Addr_List^)^;
    IPaddr := string(WinSock.inet_ntoa(i));
    Result := True;
  end
  else begin
   case WSAGetLastError of
    WSANOTINITIALISED:WSAErr:='WSANotInitialised';
    WSAENETDOWN      :WSAErr:='WSAENetDown';
    WSAEINPROGRESS   :WSAErr:='WSAEInProgress';
   end;
  end;
  WSACleanup;
end;

end.
