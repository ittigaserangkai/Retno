unit uInterface;

interface

type
  ICRUDAble = interface(IInterface)
    procedure LoadData(AID : String); stdcall;
  end;

implementation

end.
