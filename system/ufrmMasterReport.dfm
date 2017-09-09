inherited frmMasterReport: TfrmMasterReport
  Caption = 'frmMasterReport'
  ClientHeight = 316
  ClientWidth = 487
  ExplicitWidth = 503
  ExplicitHeight = 355
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Top = 0
    Width = 487
    Height = 260
    BorderWidth = 2
    ExplicitWidth = 487
    ExplicitHeight = 230
  end
  inherited pnlHeader: TPanel
    Width = 487
    Height = 0
    Visible = False
    ExplicitWidth = 487
    ExplicitHeight = 0
    inherited lblHeader: TLabel
      Height = 18
    end
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 281
    Width = 487
    Height = 35
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 15198183
    TabOrder = 2
    object btnClose: TcxButton
      AlignWithMargins = True
      Left = 410
      Top = 4
      Width = 72
      Height = 27
      Cursor = crHandPoint
      Margins.Top = 2
      Margins.Bottom = 2
      Align = alRight
      Action = actClose
      Cancel = True
      OptionsImage.Images = DMClient.imgListButton
      TabOrder = 0
    end
    object btnPrint: TcxButton
      AlignWithMargins = True
      Left = 88
      Top = 4
      Width = 72
      Height = 27
      Cursor = crHandPoint
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alLeft
      Action = actPrint
      OptionsImage.Images = DMClient.imgListButton
      TabOrder = 1
    end
    object cxButton1: TcxButton
      AlignWithMargins = True
      Left = 164
      Top = 4
      Width = 75
      Height = 27
      Margins.Left = 2
      Margins.Top = 2
      Margins.Bottom = 2
      Align = alLeft
      Action = actExport
      OptionsImage.Images = DMClient.imgListButton
      TabOrder = 2
    end
    object btnSearch: TcxButton
      AlignWithMargins = True
      Left = 5
      Top = 4
      Width = 78
      Height = 27
      Cursor = crHandPoint
      Margins.Top = 2
      Margins.Bottom = 2
      Align = alLeft
      Action = actRefresh
      OptionsImage.Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF195000195000195000195000195000FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFF9F9F9F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00990019500000990033CC6633CC6633CC66009900195000FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7F7F7F7FFF00FFFF
        00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00990033CC6666FF9966FF9966FF9933CC6633CC660099001950
        00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFF7F7F7FFFFFFFFFFFFFFF
        FFFFFFFFFFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FF
        FF00FF00990033CC66009900009900009900009900CCFFCC33CC6633CC660099
        00195000FF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFF7F7F7F7F7F7F7F
        7F7F7F7F7FFFFFFFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FF
        FF00FF009900009900FF00FFFF00FFFF00FFFF00FF33CC66CCFFCC33CC6633CC
        66195000FF00FFFF00FFFF00FFFF00FFFF00FF7F7F7F7F7F7FFF00FFFF00FFFF
        00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF7F7F7FFFFFFFFFFFFFFF00FFFF00FF
        FF00FF009900FF00FFFF00FFFF00FF00990000990019500066FF9933CC6633CC
        6633CC66195000195000FF00FFFF00FFFF00FF7F7F7FFF00FFFFFFFFFF00FF9F
        9F9F9F9F9F7F7F7FFFFFFFFF00FFFF00FF7F7F7F7F7F7F7F7F7FFF00FFFF00FF
        FF00FFFF00FFFF00FF195000FF00FFFF00FF009900CCFFCC66FF9966FF9966FF
        99009900195000FF00FFFF00FFFF00FFFF00FFFF00FFFFFFFF7F7F7FFFFFFFFF
        00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF
        FF00FFFF00FF009900009900195000FF00FFFF00FF009900CCFFCC66FF990099
        00195000FF00FFFF00FFFF00FFFF00FFFF00FFFFFFFF7F7F7FFF00FF7F7F7FFF
        FFFFFF00FF7F7F7FFFFFFFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FF
        FF00FF00990033CC6633CC66009900195000FF00FFFF00FF0099000099001950
        00FF00FFFF00FFFF00FFFF00FFFF00FFFFFFFF7F7F7FFF00FFFF00FFFF00FF7F
        7F7FFFFFFFFF00FF7F7F7FFFFFFF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FF
        00990033CC6633CC6633CC6633CC66009900195000FF00FFFF00FF009900FF00
        FFFF00FFFF00FFFF00FFFF00FFFFFFFF7F7F7FFFFFFFFFFFFFFF00FFFF00FFFF
        00FF7F7F7FFFFFFFFF00FF7F7F7FFFFFFFFFFFFFFF00FFFF00FFFF00FF009900
        00990000990066FF9933CC66009900195000195000195000FF00FFFF00FFFF00
        FF195000FF00FFFF00FFFF00FF9F9F9F9F9F9F7F7F7FFFFFFFFF00FFFF00FF7F
        7F7F9F9F9F9F9F9FFF00FFFF00FFFFFFFF7F7F7FFFFFFFFF00FFFF00FFFF00FF
        FF00FF00990066FF9966FF99009900195000FF00FFFF00FFFF00FFFF00FF1950
        00195000FF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF9F
        9F9FFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFFFF00FFFF00FFFF00FF
        FF00FF009900CCFFCC66FF9966FF990099001950001950001950001950000099
        00195000FF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFDCDCDCFF00FFFF
        00FF9F9F9F7F7F7F7F7F7F7F7F7FDCDCDC9F9F9FFFFFFFFF00FFFF00FFFF00FF
        FF00FFFF00FF009900CCFFCC66FF9966FF9933CC6633CC6633CC660099000099
        00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFDCDCDCFF
        00FFFF00FFFF00FFFF00FFFF00FFDCDCDCDCDCDCFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF009900CCFFCC66FF9966FF9933CC660099000099000099
        00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF7F7F7F9F9F9FFFFFFFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF009900009900009900009900009900FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7F7F
        7F7F7F7F7F7F7F7F9F9F9FFFFFFFFF00FFFF00FFFF00FFFF00FF}
      OptionsImage.NumGlyphs = 2
      TabOrder = 3
    end
  end
  object pnlShortCut: TPanel
    Left = 0
    Top = 260
    Width = 487
    Height = 21
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 13284267
    TabOrder = 3
    object lbCTRLP: TLabel
      AlignWithMargins = True
      Left = 94
      Top = 3
      Width = 70
      Height = 15
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
      ExplicitLeft = 271
      ExplicitTop = 2
    end
    object lbEscape: TLabel
      Left = 413
      Top = 2
      Width = 72
      Height = 17
      Align = alRight
      Caption = 'Escape [Close]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ExplicitHeight = 16
    end
    object Label1: TLabel
      AlignWithMargins = True
      Left = 7
      Top = 3
      Width = 81
      Height = 15
      Margins.Left = 5
      Margins.Top = 1
      Margins.Bottom = 1
      Align = alLeft
      AutoSize = False
      Caption = 'ALT+R [Refresh]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 112
    end
  end
  object actReport: TActionList
    Images = DMClient.imgListButton
    Left = 328
    Top = 8
    object actClose: TAction
      Caption = 'Close'
      ImageIndex = 8
      OnExecute = actCloseExecute
    end
    object actPrint: TAction
      Caption = '&Print'
      ImageIndex = 28
      ShortCut = 16464
    end
    object actRefresh: TAction
      Caption = '&Refresh'
      ImageIndex = 30
    end
    object actExport: TAction
      Caption = 'E&xport'
      ImageIndex = 34
    end
  end
end
