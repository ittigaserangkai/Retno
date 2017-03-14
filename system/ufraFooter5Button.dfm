object fraFooter5Button: TfraFooter5Button
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
    DesignSize = (
      576
      35)
    object bvlSeparator: TBevel
      Left = 246
      Top = 1
      Width = 9
      Height = 31
      Anchors = [akLeft, akBottom]
      Shape = bsLeftLine
    end
    object btnClose: TcxButton
      Left = 494
      Top = 3
      Width = 72
      Height = 27
      Cursor = crHandPoint
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Close'
      OptionsImage.ImageIndex = 6
      OptionsImage.Images = DMClient.imgListButton
      TabOrder = 0
      OnClick = btnCloseClick
    end
    object btnAdd: TcxButton
      Left = 11
      Top = 3
      Width = 72
      Height = 27
      Cursor = crHandPoint
      Anchors = [akLeft, akBottom]
      Caption = 'A&dd'
      OptionsImage.ImageIndex = 0
      OptionsImage.Images = DMClient.imgListButton
      TabOrder = 1
    end
    object btnUpdate: TcxButton
      Left = 89
      Top = 3
      Width = 72
      Height = 27
      Cursor = crHandPoint
      Anchors = [akLeft, akBottom]
      Caption = '&Edit'
      OptionsImage.ImageIndex = 10
      OptionsImage.Images = DMClient.imgListButton
      TabOrder = 2
    end
    object btnDelete: TcxButton
      Left = 168
      Top = 3
      Width = 72
      Height = 27
      Cursor = crHandPoint
      Anchors = [akLeft, akBottom]
      Caption = 'Delete'
      OptionsImage.ImageIndex = 8
      OptionsImage.Images = DMClient.imgListButton
      TabOrder = 3
    end
    object btnRefresh: TcxButton
      Left = 256
      Top = 3
      Width = 72
      Height = 27
      Cursor = crHandPoint
      Anchors = [akLeft, akBottom]
      Caption = 'Refresh'
      OptionsImage.ImageIndex = 30
      OptionsImage.Images = DMClient.imgListButton
      TabOrder = 4
    end
  end
  object pnlSortCut: TPanel
    Left = 0
    Top = 0
    Width = 576
    Height = 21
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 13284267
    TabOrder = 1
    DesignSize = (
      576
      21)
    object lbl1: TLabel
      Left = 16
      Top = 3
      Width = 65
      Height = 16
      Anchors = [akLeft, akBottom]
      Caption = 'CTRL-C [Add]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
    end
    object lbl2: TLabel
      Left = 91
      Top = 3
      Width = 66
      Height = 16
      Anchors = [akLeft, akBottom]
      Caption = 'CTRL-E [Edit]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
    end
    object lbl3: TLabel
      Left = 168
      Top = 3
      Width = 87
      Height = 16
      Anchors = [akLeft, akBottom]
      Caption = 'CTRL-Del [Delete]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
    end
    object lbl4: TLabel
      Left = 267
      Top = 3
      Width = 90
      Height = 16
      Anchors = [akLeft, akBottom]
      Caption = 'CTRL-F5 [Refresh]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
    end
    object lbl5: TLabel
      Left = 486
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
