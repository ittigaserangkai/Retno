object fraFooterDialog2Button: TfraFooterDialog2Button
  Left = 0
  Top = 0
  Width = 440
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
    Width = 440
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
    DesignSize = (
      440
      35)
    object btnClose: TcxButton
      Left = 358
      Top = 3
      Width = 72
      Height = 27
      Cursor = crHandPoint
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Cancel'
      OptionsImage.ImageIndex = 4
      OptionsImage.Images = DMClient.imgListButton
      TabOrder = 0
      OnClick = btnCloseClick
    end
    object btnSave: TcxButton
      Left = 271
      Top = 3
      Width = 80
      Height = 27
      Cursor = crHandPoint
      Anchors = [akRight, akBottom]
      Caption = 'Save'
      Default = True
      OptionsImage.ImageIndex = 32
      OptionsImage.Images = DMClient.imgListButton
      TabOrder = 1
    end
  end
  object pnlSortCut: TPanel
    Left = 0
    Top = 0
    Width = 440
    Height = 21
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 13284267
    TabOrder = 1
    DesignSize = (
      440
      21)
    object lbl4: TLabel
      Left = 275
      Top = 3
      Width = 62
      Height = 16
      Anchors = [akRight, akBottom]
      Caption = 'Enter [Save]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
    end
    object lbl5: TLabel
      Left = 350
      Top = 3
      Width = 79
      Height = 16
      Anchors = [akRight, akBottom]
      Caption = 'Escape [Cancel]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
    end
  end
end
