object dmMain: TdmMain
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 517
  Top = 138
  Height = 355
  Width = 295
  object connGoro: TIBDatabase
    Params.Strings = (
      'user_name=op'
      'password=operator'
      'sql_role_name=operator')
    LoginPrompt = False
    DefaultTransaction = transGoro
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 16
    Top = 8
  end
  object transGoro: TIBTransaction
    Active = False
    DefaultDatabase = connGoro
    AutoStopAction = saNone
    Left = 16
    Top = 56
  end
  object qrMultiPurpose: TIBQuery
    Database = connGoro
    Transaction = transGoro
    BufferChunks = 1000
    CachedUpdates = False
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
    Left = 168
    Top = 8
  end
  object qrUpdate: TIBQuery
    Database = connGoro
    Transaction = transGoro
    BufferChunks = 1000
    CachedUpdates = False
    Left = 168
    Top = 56
  end
  object qrDelete: TIBQuery
    Database = connGoro
    Transaction = transGoro
    BufferChunks = 1000
    CachedUpdates = False
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
    CommandHandlers = <
      item
        CmdDelimiter = '$'
        Command = 'POSTEDKUPONBOTOL'
        Disconnect = False
        Name = 'cmdPOSTransactKuponBotol'
        OnCommand = tcpServerStorecmdPOSTransactKuponBotolCommand
        ParamDelimiter = '$'
        ReplyExceptionCode = 0
        ReplyNormal.NumericCode = 0
        Tag = 0
      end
      item
        CmdDelimiter = '$'
        Command = 'POSTEDVOUCHER'
        Disconnect = False
        Name = 'cmdPOSTransactVoucher'
        OnCommand = tcpServerStorecmdPOSTransactVoucherCommand
        ParamDelimiter = '$'
        ReplyExceptionCode = 0
        ReplyNormal.NumericCode = 0
        Tag = 0
      end
      item
        CmdDelimiter = '$'
        Command = 'REFRESHSERVERUP'
        Disconnect = False
        Name = 'cmdRefreshServerUp'
        OnCommand = tcpServerStorecmdRefreshServerUpCommand
        ParamDelimiter = '$'
        ReplyExceptionCode = 0
        ReplyNormal.NumericCode = 0
        Tag = 0
      end
      item
        CmdDelimiter = '$'
        Command = 'REFRESHSERVERDOWN'
        Disconnect = False
        Name = 'cmdRefreshServerDown'
        OnCommand = tcpServerStorecmdRefreshServerDownCommand
        ParamDelimiter = '$'
        ReplyExceptionCode = 0
        ReplyNormal.NumericCode = 0
        Tag = 0
      end
      item
        CmdDelimiter = '$'
        Command = 'REFRESHRESETCASHIER'
        Disconnect = False
        Name = 'cmdRefreshResetCashier'
        OnCommand = tcpServerStorecmdRefreshResetCashierCommand
        ParamDelimiter = '$'
        ReplyExceptionCode = 0
        ReplyNormal.NumericCode = 0
        Tag = 0
      end>
    DefaultPort = 0
    Greeting.NumericCode = 0
    MaxConnectionReply.NumericCode = 0
    ReplyExceptionCode = 0
    ReplyTexts = <>
    ReplyUnknownCommand.NumericCode = 0
    Left = 88
    Top = 104
  end
  object tcpClientStore: TIdTCPClient
    MaxLineAction = maException
    ReadTimeout = 0
    Port = 0
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
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 160
    Top = 256
  end
  object TransPOS: TIBTransaction
    Active = False
    DefaultDatabase = dbPOS
    AutoStopAction = saNone
    Left = 192
    Top = 256
  end
  object QrPOS: TIBQuery
    Database = dbPOS
    Transaction = TransPOS
    BufferChunks = 1000
    CachedUpdates = False
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
