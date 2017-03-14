object fraFooter1Button: TfraFooter1Button
  Left = 0
  Top = 0
  Width = 443
  Height = 56
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Trebuchet MS'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object pnlFooter: TPanel
    Left = 0
    Top = 21
    Width = 443
    Height = 35
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 15198183
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object btnClose: TcxButton
      Left = 351
      Top = 4
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'Close'
      OptionsImage.ImageIndex = 6
      OptionsImage.Images = DMClient.imgListButton
      TabOrder = 0
      OnClick = btnCloseClick
    end
  end
  object pnlSortCut: TPanel
    Left = 0
    Top = 0
    Width = 443
    Height = 21
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 13284267
    TabOrder = 1
    DesignSize = (
      443
      21)
    object lbl5: TLabel
      Left = 354
      Top = 3
      Width = 72
      Height = 16
      Anchors = [akRight, akBottom]
      Caption = 'Escape [Close]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
    end
  end
end
