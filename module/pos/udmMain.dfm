object dmMain: TdmMain
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 355
  Width = 295
  object connGoro: TIBDatabase
    Params.Strings = (
      'user_name=op'
      'password=operator'
      'sql_role_name=operator')
    LoginPrompt = False
    DefaultTransaction = transGoro
    ServerType = 'IBServer'
    Left = 16
    Top = 8
  end
  object transGoro: TIBTransaction
    DefaultDatabase = connGoro
    Left = 16
    Top = 56
  end
  object qrMultiPurpose: TIBQuery
    Database = connGoro
    Transaction = transGoro
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 88
    Top = 8
  end
  object spMultiPurpose: TIBStoredProc
    Database = connGoro
    Transaction = transGoro
    Left = 88
    Top = 56
  end
  object qrInsert: TIBQuery
    Database = connGoro
    Transaction = transGoro
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 168
    Top = 8
  end
  object qrUpdate: TIBQuery
    Database = connGoro
    Transaction = transGoro
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 168
    Top = 56
  end
  object qrDelete: TIBQuery
    Database = connGoro
    Transaction = transGoro
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 168
    Top = 104
  end
  object spInsert: TIBStoredProc
    Database = connGoro
    Transaction = transGoro
    Left = 224
    Top = 8
  end
  object spUpdate: TIBStoredProc
    Database = connGoro
    Transaction = transGoro
    Left = 224
    Top = 56
  end
  object spDelete: TIBStoredProc
    Database = connGoro
    Transaction = transGoro
    Left = 224
    Top = 104
  end
  object tcpServerStore: TIdTCPServer
    Bindings = <>
    DefaultPort = 0
    Left = 88
    Top = 104
  end
  object tcpClientStore: TIdTCPClient
    ConnectTimeout = 0
    IPVersion = Id_IPv4
    Port = 0
    ReadTimeout = 0
    Left = 96
    Top = 152
  end
  object appevnMain: TApplicationEvents
    OnException = appevnMainException
    Left = 24
    Top = 152
  end
  object dbPOS: TIBDatabase
    LoginPrompt = False
    DefaultTransaction = TransPOS
    ServerType = 'IBServer'
    Left = 160
    Top = 256
  end
  object TransPOS: TIBTransaction
    DefaultDatabase = dbPOS
    Left = 192
    Top = 256
  end
  object QrPOS: TIBQuery
    Database = dbPOS
    Transaction = TransPOS
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 224
    Top = 256
  end
  object adoConn: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\data\Sigit\Proje' +
      'ct\Payroll\absensi\Database\dbAbsensi.mdb;Persist Security Info=' +
      'False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 164
    Top = 216
  end
  object adoQry: TADOQuery
    Connection = adoConn
    Parameters = <>
    Left = 195
    Top = 216
  end
  object adoCmd: TADOCommand
    Connection = adoConn
    Parameters = <>
    Left = 226
    Top = 216
  end
end
