object dmMain: TdmMain
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 310
  Width = 319
  object transGoro: TFDTransaction
    Connection = connGoro
    Left = 16
    Top = 56
  end
  object qrMultiPurpose: TFDQuery
    Connection = connGoro
    Transaction = transGoro
    Left = 88
    Top = 8
  end
  object spMultiPurpose: TFDStoredProc
    Connection = connGoro
    Transaction = transGoro
    Left = 88
    Top = 56
  end
  object qrInsert: TFDQuery
    Connection = connGoro
    Transaction = transGoro
    Left = 168
    Top = 8
  end
  object qrUpdate: TFDQuery
    Connection = connGoro
    Transaction = transGoro
    Left = 168
    Top = 56
  end
  object qrDelete: TFDQuery
    Connection = connGoro
    Transaction = transGoro
    Left = 168
    Top = 104
  end
  object spInsert: TFDStoredProc
    Connection = connGoro
    Transaction = transGoro
    Left = 224
    Top = 8
  end
  object spUpdate: TFDStoredProc
    Connection = connGoro
    Transaction = transGoro
    Left = 224
    Top = 56
  end
  object spDelete: TFDStoredProc
    Connection = connGoro
    Transaction = transGoro
    Left = 224
    Top = 104
  end
  object adoConn: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\data\Sigit\Proje' +
      'ct\Payroll\absensi\Database\dbAbsensi.mdb;Persist Security Info=' +
      'False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 150
    Top = 212
  end
  object adoQry: TADOQuery
    Connection = adoConn
    Parameters = <>
    Left = 193
    Top = 200
  end
  object fdMSSQLdl1: TFDPhysMSSQLDriverLink
    Left = 240
    Top = 184
  end
  object connGoro: TFDConnection
    Transaction = transGoro
    Left = 16
    Top = 24
  end
  object ADea1: TFDEventAlerter
    Connection = connGoro
    Left = 280
    Top = 128
  end
  object dbPOS: TFDConnection
    Transaction = TransPOS
    Left = 72
    Top = 208
  end
  object TransPOS: TFDTransaction
    Connection = dbPOS
    Left = 112
    Top = 208
  end
end
