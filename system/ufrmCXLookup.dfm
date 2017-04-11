object frmCXLookup: TfrmCXLookup
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  ClientHeight = 389
  ClientWidth = 686
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 686
    Height = 33
    Align = alTop
    BevelEdges = [beLeft, beTop, beRight]
    BevelKind = bkTile
    BevelOuter = bvNone
    Color = 14079702
    TabOrder = 1
    ExplicitWidth = 676
    object lblHeader: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 7
      Width = 146
      Height = 21
      Margins.Left = 5
      Margins.Top = 7
      Align = alLeft
      Caption = 'LABEL HEADER GOES HERE..'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitHeight = 14
    end
    object lblFilterData: TcxLabel
      Left = 329
      Top = 0
      Align = alRight
      AutoSize = False
      Caption = 'Filter Data'
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      ExplicitLeft = 319
      Height = 31
      Width = 58
      AnchorY = 16
    end
    object StartDate: TcxDateEdit
      AlignWithMargins = True
      Left = 390
      Top = 4
      Margins.Top = 4
      Margins.Bottom = 4
      Align = alRight
      EditValue = 0d
      Properties.DateButtons = [btnClear, btnToday]
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 1
      ExplicitLeft = 380
      Width = 89
    end
    object EndDate: TcxDateEdit
      AlignWithMargins = True
      Left = 506
      Top = 4
      Margins.Top = 4
      Margins.Bottom = 4
      Align = alRight
      EditValue = 0d
      Properties.DateButtons = [btnClear, btnToday]
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 2
      ExplicitLeft = 496
      Width = 89
    end
    object btnRefresh: TcxButton
      AlignWithMargins = True
      Left = 601
      Top = 2
      Width = 78
      Height = 27
      Cursor = crHandPoint
      Margins.Top = 2
      Margins.Bottom = 2
      Align = alRight
      Caption = '&Refresh'
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
      TabOrder = 4
      OnClick = btnRefreshClick
      ExplicitLeft = 591
    end
    object lblsdFilter: TcxLabel
      AlignWithMargins = True
      Left = 482
      Top = 3
      Margins.Left = 0
      Margins.Right = 0
      Align = alRight
      AutoSize = False
      Caption = 's/d'
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      ExplicitLeft = 472
      Height = 25
      Width = 21
      AnchorY = 16
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 354
    Width = 686
    Height = 35
    Align = alBottom
    BevelKind = bkTile
    BevelOuter = bvNone
    Color = 14079702
    TabOrder = 2
    ExplicitTop = 344
    ExplicitWidth = 676
    object btnClose: TcxButton
      AlignWithMargins = True
      Left = 607
      Top = 2
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
      TabOrder = 0
      OnClick = btnCloseClick
      ExplicitLeft = 597
    end
    object btnOK: TcxButton
      AlignWithMargins = True
      Left = 521
      Top = 2
      Width = 80
      Height = 27
      Cursor = crHandPoint
      Margins.Top = 2
      Margins.Bottom = 2
      Align = alRight
      Caption = 'Select'
      OptionsImage.ImageIndex = 13
      OptionsImage.Images = DMClient.imgListButton
      TabOrder = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnOKClick
      ExplicitLeft = 511
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 333
    Width = 686
    Height = 21
    Align = alBottom
    BevelEdges = [beLeft, beTop, beRight]
    BevelKind = bkTile
    BevelOuter = bvNone
    Color = 14079702
    TabOrder = 3
    ExplicitTop = 323
    ExplicitWidth = 676
    object lbEscape: TLabel
      AlignWithMargins = True
      Left = 607
      Top = 1
      Width = 72
      Height = 17
      Margins.Top = 1
      Margins.Bottom = 1
      Align = alRight
      Caption = 'Escape [Close]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 597
      ExplicitHeight = 16
    end
    object Label1: TLabel
      AlignWithMargins = True
      Left = 522
      Top = 1
      Width = 69
      Height = 17
      Margins.Top = 1
      Margins.Right = 13
      Margins.Bottom = 1
      Align = alRight
      Caption = 'Enter [Select]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 512
      ExplicitHeight = 16
    end
  end
  object cxGrid: TcxGrid
    Left = 0
    Top = 33
    Width = 686
    Height = 300
    Align = alClient
    TabOrder = 0
    LockedStateImageOptions.Text = 'Mohon ditunggu...'
    LookAndFeel.NativeStyle = False
    ExplicitWidth = 676
    ExplicitHeight = 290
    object cxGridView: TcxGridDBTableView
      OnDblClick = cxGridViewDblClick
      OnKeyDown = cxGridViewKeyDown
      Navigator.Buttons.CustomButtons = <>
      FindPanel.DisplayMode = fpdmManual
      FindPanel.InfoText = 'ketik teks yang dicari...'
      DataController.Filter.Options = [fcoCaseInsensitive]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.InfoText = 
        'Klik untuk memfilter data / Atau gunakan CTRL-F untuk panel filt' +
        'er'
      FilterRow.Visible = True
      FilterRow.ApplyChanges = fracImmediately
      NewItemRow.InfoText = 'Baris baru'
      OptionsData.Editing = False
      OptionsView.NoDataToDisplayInfoText = '<Data kosong>'
      OptionsView.GroupByBox = False
      Styles.ContentEven = DMClient.cxStyleGridHeader
      Styles.Header = DMClient.cxStyleGridEven
    end
    object cxlvMaster: TcxGridLevel
      GridView = cxGridView
    end
  end
end
