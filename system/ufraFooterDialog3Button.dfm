object fraFooterDialog3Button: TfraFooterDialog3Button
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
    object btnClose: TcxButton
      AlignWithMargins = True
      Left = 363
      Top = 4
      Width = 72
      Height = 27
      Cursor = crHandPoint
      Margins.Top = 2
      Margins.Bottom = 2
      Align = alRight
      Cancel = True
      Caption = 'Cancel'
      OptionsImage.ImageIndex = 4
      OptionsImage.Images = DMClient.imgListButton
      TabOrder = 1
    end
    object btnSave: TcxButton
      AlignWithMargins = True
      Left = 270
      Top = 4
      Width = 80
      Height = 27
      Cursor = crHandPoint
      Margins.Top = 2
      Margins.Right = 10
      Margins.Bottom = 2
      Align = alRight
      Caption = 'Save'
      OptionsImage.ImageIndex = 32
      OptionsImage.Images = DMClient.imgListButton
      TabOrder = 0
    end
    object btnDelete: TcxButton
      AlignWithMargins = True
      Left = 5
      Top = 4
      Width = 72
      Height = 27
      Cursor = crHandPoint
      Margins.Top = 2
      Margins.Bottom = 2
      Align = alLeft
      Caption = 'Delete'
      OptionsImage.ImageIndex = 8
      OptionsImage.Images = DMClient.imgListButton
      TabOrder = 2
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
    object lbCTRLEnter: TLabel
      AlignWithMargins = True
      Left = 265
      Top = 3
      Width = 85
      Height = 15
      Margins.Top = 1
      Margins.Bottom = 1
      Align = alRight
      Caption = 'Ctrl-Enter [Save]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ExplicitHeight = 16
    end
    object lbEscape: TLabel
      AlignWithMargins = True
      Left = 356
      Top = 3
      Width = 79
      Height = 15
      Margins.Top = 1
      Margins.Bottom = 1
      Align = alRight
      Caption = 'Escape [Cancel]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ExplicitHeight = 16
    end
    object lbCTRLDel: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 3
      Width = 87
      Height = 15
      Margins.Top = 1
      Margins.Bottom = 1
      Align = alLeft
      Caption = 'CTRL-Del [Delete]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ExplicitHeight = 16
    end
  end
end
