object ServerContainer: TServerContainer
  OldCreateOrder = False
  Height = 271
  Width = 415
  object DSServer: TDSServer
    Left = 48
    Top = 11
  end
  object DSServerClass: TDSServerClass
    OnGetClass = DSServerClassGetClass
    Server = DSServer
    Left = 96
    Top = 11
  end
end
