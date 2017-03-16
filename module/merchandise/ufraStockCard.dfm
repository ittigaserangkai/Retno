object fraStockCard: TfraStockCard
  Left = 0
  Top = 0
  Width = 720
  Height = 366
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Trebuchet MS'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object pnl4: TPanel
    Left = 0
    Top = 0
    Width = 720
    Height = 23
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = 'STOCK CARD'
    Color = 15422804
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pnl1: TPanel
    Left = 0
    Top = 23
    Width = 257
    Height = 343
    Align = alLeft
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 15198183
    TabOrder = 1
    object lbl1: TLabel
      Left = 10
      Top = 7
      Width = 38
      Height = 16
      Caption = 'Periode'
    end
    object lbl5: TLabel
      Left = 10
      Top = 31
      Width = 46
      Height = 16
      Caption = 'Stock for'
    end
    object lbl6: TLabel
      Left = 10
      Top = 55
      Width = 48
      Height = 16
      Caption = 'Beginning'
    end
    object lbl7: TLabel
      Left = 10
      Top = 79
      Width = 48
      Height = 16
      Caption = 'Receiving'
    end
    object lbl8: TLabel
      Left = 10
      Top = 101
      Width = 57
      Height = 16
      Caption = 'Transfer IN'
    end
    object lbl9: TLabel
      Left = 10
      Top = 125
      Width = 59
      Height = 16
      Caption = 'Credit Note'
    end
    object lbl10: TLabel
      Left = 10
      Top = 148
      Width = 54
      Height = 16
      Caption = 'Debit Note'
    end
    object lbl15: TLabel
      Left = 10
      Top = 311
      Width = 33
      Height = 16
      BiDiMode = bdLeftToRight
      Caption = 'Ending'
      ParentBiDiMode = False
    end
    object lbl14: TLabel
      Left = 10
      Top = 240
      Width = 44
      Height = 16
      BiDiMode = bdLeftToRight
      Caption = 'Wastage'
      ParentBiDiMode = False
    end
    object lbl13: TLabel
      Left = 10
      Top = 216
      Width = 67
      Height = 16
      BiDiMode = bdLeftToRight
      Caption = 'Transfer OUT'
      ParentBiDiMode = False
    end
    object lbl12: TLabel
      Left = 10
      Top = 195
      Width = 24
      Height = 16
      BiDiMode = bdLeftToRight
      Caption = 'Sales'
      ParentBiDiMode = False
    end
    object Label1: TLabel
      Left = 10
      Top = 171
      Width = 28
      Height = 16
      Caption = 'Retur'
    end
    object Label2: TLabel
      Left = 10
      Top = 263
      Width = 57
      Height = 16
      BiDiMode = bdLeftToRight
      Caption = 'Adjustment'
      ParentBiDiMode = False
    end
    object Label3: TLabel
      Left = 10
      Top = 287
      Width = 71
      Height = 16
      BiDiMode = bdLeftToRight
      Caption = 'Stock Opname'
      ParentBiDiMode = False
    end
    object cbbBulan: TComboBox
      Left = 88
      Top = 4
      Width = 77
      Height = 24
      BevelKind = bkSoft
      Style = csDropDownList
      Ctl3D = False
      ItemHeight = 16
      ItemIndex = 3
      ParentCtl3D = False
      TabOrder = 0
      Text = 'April'
      OnChange = cbbBulanChange
      Items.Strings = (
        'Januari'
        'Februari'
        'Maret'
        'April'
        'Mei'
        'Juni'
        'Juli'
        'Agustus'
        'September'
        'Oktober'
        'November'
        'Desember')
    end
    object spnedtTahun: TJvSpinEdit
      Left = 169
      Top = 5
      Width = 65
      Height = 22
      Decimal = 0
      MaxValue = 2100.000000000000000000
      MinValue = 1990.000000000000000000
      Value = 2007.000000000000000000
      OnBottomClick = cbbBulanChange
      OnTopClick = cbbBulanChange
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      OnExit = cbbBulanChange
      OnKeyDown = spnedtTahunKeyDown
    end
    object cbbStockFor: TComboBox
      Left = 88
      Top = 29
      Width = 77
      Height = 24
      BevelKind = bkSoft
      Style = csDropDownList
      Ctl3D = False
      ItemHeight = 16
      ItemIndex = 0
      ParentCtl3D = False
      TabOrder = 2
      Text = 'All'
      OnChange = cbbBulanChange
      Items.Strings = (
        'All'
        'Common'
        'Trader'
        'Asgross')
    end
    object intedtBeginning: TJvValidateEdit
      Left = 88
      Top = 54
      Width = 146
      Height = 22
      Alignment = taRightJustify
      ClipBoardCommands = [caCopy]
      GroupIndex = -1
      MaxPixel.Font.Charset = DEFAULT_CHARSET
      MaxPixel.Font.Color = clWindowText
      MaxPixel.Font.Height = -11
      MaxPixel.Font.Name = 'MS Sans Serif'
      MaxPixel.Font.Style = []
      Modified = False
      SelStart = 0
      SelLength = 0
      Ctl3D = False
      ParentCtl3D = False
      PasswordChar = #0
      ReadOnly = True
      TabOrder = 3
    end
    object intedtReceiving: TJvValidateEdit
      Left = 88
      Top = 77
      Width = 146
      Height = 22
      Alignment = taRightJustify
      ClipBoardCommands = [caCopy]
      GroupIndex = -1
      MaxPixel.Font.Charset = DEFAULT_CHARSET
      MaxPixel.Font.Color = clWindowText
      MaxPixel.Font.Height = -11
      MaxPixel.Font.Name = 'MS Sans Serif'
      MaxPixel.Font.Style = []
      Modified = False
      SelStart = 0
      SelLength = 0
      Ctl3D = False
      ParentCtl3D = False
      PasswordChar = #0
      ReadOnly = True
      TabOrder = 4
    end
    object intedtTransferIn: TJvValidateEdit
      Left = 88
      Top = 100
      Width = 146
      Height = 22
      Alignment = taRightJustify
      ClipBoardCommands = [caCopy]
      GroupIndex = -1
      MaxPixel.Font.Charset = DEFAULT_CHARSET
      MaxPixel.Font.Color = clWindowText
      MaxPixel.Font.Height = -11
      MaxPixel.Font.Name = 'MS Sans Serif'
      MaxPixel.Font.Style = []
      Modified = False
      SelStart = 0
      SelLength = 0
      Ctl3D = False
      ParentCtl3D = False
      PasswordChar = #0
      ReadOnly = True
      TabOrder = 5
    end
    object intedtCN: TJvValidateEdit
      Left = 88
      Top = 123
      Width = 146
      Height = 22
      Alignment = taRightJustify
      ClipBoardCommands = [caCopy]
      GroupIndex = -1
      MaxPixel.Font.Charset = DEFAULT_CHARSET
      MaxPixel.Font.Color = clWindowText
      MaxPixel.Font.Height = -11
      MaxPixel.Font.Name = 'MS Sans Serif'
      MaxPixel.Font.Style = []
      Modified = False
      SelStart = 0
      SelLength = 0
      Ctl3D = False
      ParentCtl3D = False
      PasswordChar = #0
      ReadOnly = True
      TabOrder = 6
    end
    object intedtDN: TJvValidateEdit
      Left = 88
      Top = 146
      Width = 146
      Height = 22
      Alignment = taRightJustify
      ClipBoardCommands = [caCopy]
      GroupIndex = -1
      MaxPixel.Font.Charset = DEFAULT_CHARSET
      MaxPixel.Font.Color = clWindowText
      MaxPixel.Font.Height = -11
      MaxPixel.Font.Name = 'MS Sans Serif'
      MaxPixel.Font.Style = []
      Modified = False
      SelStart = 0
      SelLength = 0
      Ctl3D = False
      ParentCtl3D = False
      PasswordChar = #0
      ReadOnly = True
      TabOrder = 7
    end
    object intedtRetur: TJvValidateEdit
      Left = 88
      Top = 169
      Width = 146
      Height = 22
      Alignment = taRightJustify
      ClipBoardCommands = [caCopy]
      GroupIndex = -1
      MaxPixel.Font.Charset = DEFAULT_CHARSET
      MaxPixel.Font.Color = clWindowText
      MaxPixel.Font.Height = -11
      MaxPixel.Font.Name = 'MS Sans Serif'
      MaxPixel.Font.Style = []
      Modified = False
      SelStart = 0
      SelLength = 0
      Ctl3D = False
      ParentCtl3D = False
      PasswordChar = #0
      ReadOnly = True
      TabOrder = 8
    end
    object intedtSales: TJvValidateEdit
      Left = 88
      Top = 192
      Width = 146
      Height = 22
      Alignment = taRightJustify
      ClipBoardCommands = [caCopy]
      GroupIndex = -1
      MaxPixel.Font.Charset = DEFAULT_CHARSET
      MaxPixel.Font.Color = clWindowText
      MaxPixel.Font.Height = -11
      MaxPixel.Font.Name = 'MS Sans Serif'
      MaxPixel.Font.Style = []
      Modified = False
      SelStart = 0
      SelLength = 0
      Ctl3D = False
      ParentCtl3D = False
      PasswordChar = #0
      ReadOnly = True
      TabOrder = 9
    end
    object intedtTransferOut: TJvValidateEdit
      Left = 88
      Top = 215
      Width = 146
      Height = 22
      Alignment = taRightJustify
      ClipBoardCommands = [caCopy]
      GroupIndex = -1
      MaxPixel.Font.Charset = DEFAULT_CHARSET
      MaxPixel.Font.Color = clWindowText
      MaxPixel.Font.Height = -11
      MaxPixel.Font.Name = 'MS Sans Serif'
      MaxPixel.Font.Style = []
      Modified = False
      SelStart = 0
      SelLength = 0
      Ctl3D = False
      ParentCtl3D = False
      PasswordChar = #0
      ReadOnly = True
      TabOrder = 10
    end
    object intedtWastage: TJvValidateEdit
      Left = 88
      Top = 238
      Width = 146
      Height = 22
      Alignment = taRightJustify
      ClipBoardCommands = [caCopy]
      GroupIndex = -1
      MaxPixel.Font.Charset = DEFAULT_CHARSET
      MaxPixel.Font.Color = clWindowText
      MaxPixel.Font.Height = -11
      MaxPixel.Font.Name = 'MS Sans Serif'
      MaxPixel.Font.Style = []
      Modified = False
      SelStart = 0
      SelLength = 0
      Ctl3D = False
      ParentCtl3D = False
      PasswordChar = #0
      ReadOnly = True
      TabOrder = 11
    end
    object intedtEnding: TJvValidateEdit
      Left = 88
      Top = 309
      Width = 146
      Height = 22
      Alignment = taRightJustify
      ClipBoardCommands = [caCopy]
      GroupIndex = -1
      MaxPixel.Font.Charset = DEFAULT_CHARSET
      MaxPixel.Font.Color = clWindowText
      MaxPixel.Font.Height = -11
      MaxPixel.Font.Name = 'MS Sans Serif'
      MaxPixel.Font.Style = []
      Modified = False
      SelStart = 0
      SelLength = 0
      Ctl3D = False
      ParentCtl3D = False
      PasswordChar = #0
      ReadOnly = True
      TabOrder = 14
    end
    object intedtAdjustment: TJvValidateEdit
      Left = 88
      Top = 261
      Width = 146
      Height = 22
      Alignment = taRightJustify
      ClipBoardCommands = [caCopy]
      GroupIndex = -1
      MaxPixel.Font.Charset = DEFAULT_CHARSET
      MaxPixel.Font.Color = clWindowText
      MaxPixel.Font.Height = -11
      MaxPixel.Font.Name = 'MS Sans Serif'
      MaxPixel.Font.Style = []
      Modified = False
      SelStart = 0
      SelLength = 0
      Ctl3D = False
      ParentCtl3D = False
      PasswordChar = #0
      ReadOnly = True
      TabOrder = 12
    end
    object intedtStockOpname: TJvValidateEdit
      Left = 88
      Top = 285
      Width = 146
      Height = 22
      Alignment = taRightJustify
      ClipBoardCommands = [caCopy]
      GroupIndex = -1
      MaxPixel.Font.Charset = DEFAULT_CHARSET
      MaxPixel.Font.Color = clWindowText
      MaxPixel.Font.Height = -11
      MaxPixel.Font.Name = 'MS Sans Serif'
      MaxPixel.Font.Style = []
      Modified = False
      SelStart = 0
      SelLength = 0
      Ctl3D = False
      ParentCtl3D = False
      PasswordChar = #0
      ReadOnly = True
      TabOrder = 13
    end
  end
  object pnl2: TPanel
    Left = 257
    Top = 23
    Width = 463
    Height = 343
    Align = alClient
    BevelOuter = bvLowered
    BorderWidth = 20
    TabOrder = 2
    DesignSize = (
      463
      343)
    object lblClose: TJvLabel
      Left = 410
      Top = 4
      Width = 26
      Height = 16
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'Close'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = lblCloseClick
      HotTrack = True
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clRed
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Trebuchet MS'
      HotTrackFont.Style = [fsBold, fsUnderline]
    end
    object strgGrid: TAdvStringGrid
      Left = 21
      Top = 21
      Width = 421
      Height = 248
      Cursor = crDefault
      Align = alClient
      ColCount = 5
      DefaultRowHeight = 21
      DefaultDrawing = False
      FixedCols = 0
      RowCount = 2
      FixedRows = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      GridLineWidth = 1
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected]
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
      OnClick = strgGridClick
      GridLineColor = clSilver
      ActiveCellShow = False
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'Tahoma'
      ActiveCellFont.Style = [fsBold]
      ActiveCellColor = clGray
      ActiveCellColorTo = clNone
      Bands.Active = True
      Bands.PrimaryColor = 14935011
      Bands.PrimaryLength = 1
      Bands.SecondaryColor = clWindow
      Bands.SecondaryLength = 1
      Bands.Print = False
      AutoNumAlign = False
      AutoSize = False
      VAlignment = vtaTop
      EnhTextSize = False
      EnhRowColMove = True
      SizeWithForm = False
      Multilinecells = False
      OnGetAlignment = strgGridGetAlignment
      DragDropSettings.OleAcceptFiles = True
      DragDropSettings.OleAcceptText = True
      SortSettings.AutoColumnMerge = False
      SortSettings.Column = 0
      SortSettings.Show = False
      SortSettings.IndexShow = False
      SortSettings.IndexColor = clYellow
      SortSettings.Full = True
      SortSettings.SingleColumn = False
      SortSettings.IgnoreBlanks = False
      SortSettings.BlankPos = blFirst
      SortSettings.AutoFormat = True
      SortSettings.Direction = sdAscending
      SortSettings.InitSortDirection = sdAscending
      SortSettings.FixedCols = False
      SortSettings.NormalCellsOnly = False
      SortSettings.Row = 0
      SortSettings.UndoSort = False
      FloatingFooter.Color = clBtnFace
      FloatingFooter.Column = 0
      FloatingFooter.FooterStyle = fsFixedLastRow
      FloatingFooter.Visible = False
      ControlLook.Color = clBlack
      ControlLook.CheckSize = 15
      ControlLook.RadioSize = 10
      ControlLook.ControlStyle = csWinXP
      ControlLook.DropDownAlwaysVisible = False
      ControlLook.ProgressMarginX = 2
      ControlLook.ProgressMarginY = 2
      EnableBlink = False
      EnableHTML = True
      EnableWheel = True
      Flat = False
      Look = glXP
      HintColor = clInfoBk
      SelectionColor = 15387318
      SelectionTextColor = clBlack
      SelectionRectangle = False
      SelectionResizer = False
      SelectionRTFKeep = False
      HintShowCells = False
      HintShowLargeText = False
      HintShowSizing = False
      PrintSettings.FooterSize = 0
      PrintSettings.HeaderSize = 0
      PrintSettings.Time = ppNone
      PrintSettings.Date = ppNone
      PrintSettings.DateFormat = 'dd/mm/yyyy'
      PrintSettings.PageNr = ppNone
      PrintSettings.Title = ppNone
      PrintSettings.Font.Charset = DEFAULT_CHARSET
      PrintSettings.Font.Color = clWindowText
      PrintSettings.Font.Height = -11
      PrintSettings.Font.Name = 'MS Sans Serif'
      PrintSettings.Font.Style = []
      PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
      PrintSettings.FixedFont.Color = clWindowText
      PrintSettings.FixedFont.Height = -11
      PrintSettings.FixedFont.Name = 'MS Sans Serif'
      PrintSettings.FixedFont.Style = []
      PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
      PrintSettings.HeaderFont.Color = clWindowText
      PrintSettings.HeaderFont.Height = -11
      PrintSettings.HeaderFont.Name = 'MS Sans Serif'
      PrintSettings.HeaderFont.Style = []
      PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
      PrintSettings.FooterFont.Color = clWindowText
      PrintSettings.FooterFont.Height = -11
      PrintSettings.FooterFont.Name = 'MS Sans Serif'
      PrintSettings.FooterFont.Style = []
      PrintSettings.Borders = pbSingle
      PrintSettings.BorderStyle = psSolid
      PrintSettings.Centered = True
      PrintSettings.RepeatFixedRows = False
      PrintSettings.RepeatFixedCols = False
      PrintSettings.LeftSize = 0
      PrintSettings.RightSize = 0
      PrintSettings.ColumnSpacing = 0
      PrintSettings.RowSpacing = 0
      PrintSettings.TitleSpacing = 0
      PrintSettings.Orientation = poPortrait
      PrintSettings.PageNumberOffset = 0
      PrintSettings.MaxPagesOffset = 0
      PrintSettings.FixedWidth = 0
      PrintSettings.FixedHeight = 0
      PrintSettings.UseFixedHeight = False
      PrintSettings.UseFixedWidth = False
      PrintSettings.FitToPage = fpNever
      PrintSettings.PageNumSep = '/'
      PrintSettings.NoAutoSize = False
      PrintSettings.NoAutoSizeRow = False
      PrintSettings.PrintGraphics = False
      PrintSettings.UseDisplayFont = True
      HTMLSettings.Width = 100
      HTMLSettings.XHTML = False
      Navigation.AdvanceDirection = adLeftRight
      Navigation.InsertPosition = pInsertBefore
      Navigation.HomeEndKey = heFirstLastColumn
      Navigation.TabToNextAtEnd = False
      Navigation.TabAdvanceDirection = adLeftRight
      ColumnSize.Location = clRegistry
      CellNode.Color = clSilver
      CellNode.ExpandOne = False
      CellNode.NodeColor = clBlack
      CellNode.NodeIndent = 12
      CellNode.ShowTree = True
      CellNode.TreeColor = clSilver
      MaxEditLength = 0
      Grouping.HeaderColor = clNone
      Grouping.HeaderColorTo = clNone
      Grouping.HeaderTextColor = clNone
      Grouping.MergeHeader = False
      Grouping.MergeSummary = False
      Grouping.Summary = False
      Grouping.SummaryColor = clNone
      Grouping.SummaryColorTo = clNone
      Grouping.SummaryTextColor = clNone
      IntelliPan = ipVertical
      URLColor = clBlue
      URLShow = False
      URLFull = False
      URLEdit = False
      ScrollType = ssNormal
      ScrollColor = clNone
      ScrollWidth = 16
      ScrollSynch = False
      ScrollProportional = False
      ScrollHints = shNone
      OemConvert = False
      FixedFooters = 0
      FixedRightCols = 0
      FixedColWidth = 64
      FixedRowHeight = 21
      FixedFont.Charset = DEFAULT_CHARSET
      FixedFont.Color = clWindowText
      FixedFont.Height = -11
      FixedFont.Name = 'Tahoma'
      FixedFont.Style = [fsBold]
      FixedAsButtons = False
      FloatFormat = '%.2f'
      IntegralHeight = False
      WordWrap = True
      Lookup = False
      LookupCaseSensitive = False
      LookupHistory = False
      BackGround.Top = 0
      BackGround.Left = 0
      BackGround.Display = bdTile
      BackGround.Cells = bcNormal
      Filter = <>
    end
    object pnl3: TPanel
      Left = 21
      Top = 269
      Width = 421
      Height = 53
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 1
      object lbl3: TLabel
        Left = 8
        Top = 4
        Width = 39
        Height = 16
        Caption = 'Doc No.'
      end
      object lbl4: TLabel
        Left = 200
        Top = 4
        Width = 46
        Height = 16
        Caption = 'Doc Type'
      end
      object lbl11: TLabel
        Left = 8
        Top = 27
        Width = 28
        Height = 16
        Caption = 'Desc.'
      end
      object edtDocNo: TEdit
        Left = 49
        Top = 4
        Width = 126
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        Text = '00192990'
      end
      object edtDocType: TEdit
        Left = 249
        Top = 4
        Width = 126
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        Text = 'Receiving'
      end
      object edtDescription: TEdit
        Left = 49
        Top = 27
        Width = 328
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 2
        Text = '00192990'
      end
    end
  end
end
