object fraFooter4Button: TfraFooter4Button
  Left = 0
  Top = 0
  Width = 576
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
    Width = 576
    Height = 35
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 15198183
    TabOrder = 0
    object bvlSeparator: TBevel
      AlignWithMargins = True
      Left = 250
      Top = 5
      Width = 9
      Height = 25
      Margins.Left = 80
      Align = alLeft
      Shape = bsRightLine
      ExplicitLeft = 218
      ExplicitTop = 6
      ExplicitHeight = 31
    end
    object btnAdd: TcxButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 72
      Height = 27
      Cursor = crHandPoint
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alLeft
      Caption = 'A&dd'
      OptionsImage.ImageIndex = 0
      OptionsImage.Images = DMClient.imgListButton
      TabOrder = 0
    end
    object btnUpdate: TcxButton
      AlignWithMargins = True
      Left = 80
      Top = 4
      Width = 88
      Height = 27
      Cursor = crHandPoint
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alLeft
      Caption = 'E&dit / Lihat'
      OptionsImage.ImageIndex = 10
      OptionsImage.Images = DMClient.imgListButton
      TabOrder = 1
    end
    object btnPrint: TcxButton
      AlignWithMargins = True
      Left = 264
      Top = 4
      Width = 72
      Height = 27
      Cursor = crHandPoint
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alLeft
      Caption = '&Print'
      OptionsImage.ImageIndex = 28
      OptionsImage.Images = DMClient.imgListButton
      TabOrder = 2
    end
    object btnClose: TcxButton
      AlignWithMargins = True
      Left = 499
      Top = 4
      Width = 72
      Height = 27
      Cursor = crHandPoint
      Margins.Top = 2
      Margins.Bottom = 2
      Align = alRight
      Cancel = True
      Caption = 'Close'
      OptionsImage.ImageIndex = 6
      OptionsImage.Images = DMClient.imgListButton
      TabOrder = 3
    end
    object cxButton1: TcxButton
      AlignWithMargins = True
      Left = 340
      Top = 4
      Width = 75
      Height = 27
      Margins.Left = 2
      Margins.Top = 2
      Margins.Bottom = 2
      Align = alLeft
      Caption = 'E&xport'
      OptionsImage.ImageIndex = 34
      OptionsImage.Images = DMClient.imgListButton
      TabOrder = 4
    end
  end
  object pnlShortCut: TPanel
    Left = 0
    Top = 0
    Width = 576
    Height = 21
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 13284267
    TabOrder = 1
    object lbCTRLC: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 3
      Width = 65
      Height = 15
      Margins.Top = 1
      Margins.Bottom = 1
      Align = alLeft
      AutoSize = False
      Caption = 'CTRL-C [Add]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ExplicitHeight = 16
    end
    object lbCTRLE: TLabel
      AlignWithMargins = True
      Left = 88
      Top = 3
      Width = 66
      Height = 15
      Margins.Left = 15
      Margins.Top = 1
      Margins.Bottom = 1
      Align = alLeft
      AutoSize = False
      Caption = 'CTRL-E [Edit]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ExplicitTop = 4
    end
    object lbEscape: TLabel
      Left = 502
      Top = 2
      Width = 72
      Height = 16
      Align = alRight
      Caption = 'Escape [Close]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
    end
    object lbCTRLP: TLabel
      AlignWithMargins = True
      Left = 267
      Top = 3
      Width = 70
      Height = 15
      Margins.Left = 110
      Margins.Top = 1
      Margins.Bottom = 1
      Align = alLeft
      AutoSize = False
      Caption = 'CTRL-P [Print]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ExplicitTop = 2
    end
  end
end
