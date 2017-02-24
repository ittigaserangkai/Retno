unit uConn;

interface

type
  TParamType = (ptInteger, ptString, ptBoolean, ptDateTime, ptCurrency, ptVariant, ptDouble);
  TParam = record
    tipe: TParamType;
    data: Variant;
  end;
  // TConnectionStatus = (Disconnect =0 , Connected = 1);
  TFormMode = (fmEdited, fmLoaded);
  TTipeKoneksi = (Disconnect = 0, ADO = 1, Interbase = 2, MSSQL = 3);
  //TTag = set of byte;

  TArr = array of TParam;
  TArrData = array of TArr;
  TArrVar = array of Variant;

implementation

end.
