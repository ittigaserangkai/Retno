object fraProgressBar: TfraProgressBar
  Left = 0
  Top = 0
  Width = 472
  Height = 35
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Trebuchet MS'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 472
    Height = 35
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 10
    TabOrder = 0
    DesignSize = (
      472
      35)
    object lblKeterangan: TLabel
      Left = 9
      Top = 1
      Width = 12
      Height = 16
      Caption = '...'
    end
    object pb1: TcxProgressBar
      Left = 8
      Top = 17
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Width = 455
    end
  end
end
