object frmTransaksi: TfrmTransaksi
  Left = 276
  Top = 123
  BorderStyle = bsNone
  Caption = 'Penjualan'
  ClientHeight = 529
  ClientWidth = 888
  Color = 13303754
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    888
    529)
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 3
    Top = 458
    Width = 143
    Height = 23
    Anchors = [akLeft, akBottom]
    Caption = 'Kode Barang'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblHargaKontrabon: TLabel
    Left = 354
    Top = 458
    Width = 65
    Height = 23
    Anchors = [akLeft, akBottom]
    Caption = 'Harga'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object pnl1: TPanel
    Left = 0
    Top = 58
    Width = 888
    Height = 61
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 13303754
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 9
      Top = 9
      Width = 84
      Height = 14
      Caption = 'No Pelanggan'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 9
      Top = 33
      Width = 98
      Height = 14
      Caption = 'Nama Pelanggan'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 378
      Top = 33
      Width = 140
      Height = 14
      Caption = 'Transaksi Terakhir #'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl3: TLabel
      Left = 506
      Top = 9
      Width = 126
      Height = 14
      Caption = 'F1 = ShortCut Keys'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edNoTrnTerakhir: TEnhancedEdit
      Left = 534
      Top = 30
      Width = 110
      Height = 22
      TabStop = False
      Color = 11796403
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      Text = '0'
      Format = ffGeneral
      ValueInt = 0
      ColorGotFocused = clWindow
    end
    object edNoPelanggan: TEnhancedEdit
      Left = 120
      Top = 6
      Width = 103
      Height = 20
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      Text = '0'
      OnExit = edNoPelangganExit
      OnKeyDown = edNoPelangganKeyDown
      Format = ffGeneral
      ValueInt = 0
      ColorGotFocused = clYellow
    end
    object edNamaPelanggan: TEnhancedEdit
      Left = 120
      Top = 30
      Width = 229
      Height = 20
      TabStop = False
      Color = 11796403
      Ctl3D = False
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Text = '0'
      Format = ffGeneral
      ValueInt = 0
      ColorGotFocused = clWindow
    end
    object sgHeader: TAdvColumnGrid
      Left = 248
      Top = -13
      Width = 202
      Height = 39
      Cursor = crDefault
      ColCount = 3
      DefaultRowHeight = 21
      DefaultDrawing = False
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      GridLineWidth = 1
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected]
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 3
      Visible = False
      GridLineColor = clSilver
      ActiveCellShow = False
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'Tahoma'
      ActiveCellFont.Style = [fsBold]
      ActiveCellColor = clGray
      ActiveCellColorTo = clNone
      Bands.PrimaryColor = clInfoBk
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
      Columns = <
        item
          AutoMinSize = 0
          AutoMaxSize = 0
          Alignment = taLeftJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          ColumnPopupType = cpFixedCellsRClick
          EditLength = 0
          Editor = edNormal
          FilterCaseSensitive = False
          Fixed = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MinSize = 0
          MaxSize = 0
          Password = False
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintColor = clWhite
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          ReadOnly = False
          ShowBands = False
          SortStyle = ssAutomatic
          SpinMax = 0
          SpinMin = 0
          SpinStep = 1
          Tag = 0
          Width = 64
        end
        item
          AutoMinSize = 0
          AutoMaxSize = 0
          Alignment = taLeftJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          ColumnPopupType = cpFixedCellsRClick
          EditLength = 0
          Editor = edNormal
          FilterCaseSensitive = False
          Fixed = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MinSize = 0
          MaxSize = 0
          Password = False
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintColor = clWhite
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          ReadOnly = False
          ShowBands = False
          SortStyle = ssAutomatic
          SpinMax = 0
          SpinMin = 0
          SpinStep = 1
          Tag = 0
          Width = 64
        end
        item
          AutoMinSize = 0
          AutoMaxSize = 0
          Alignment = taLeftJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          ColumnPopupType = cpFixedCellsRClick
          EditLength = 0
          Editor = edNormal
          FilterCaseSensitive = False
          Fixed = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MinSize = 0
          MaxSize = 0
          Password = False
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintColor = clWhite
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          ReadOnly = False
          ShowBands = False
          SortStyle = ssAutomatic
          SpinMax = 0
          SpinMin = 0
          SpinStep = 1
          Tag = 0
          Width = 64
        end>
      FilterDropDown.Color = clWindow
      FilterDropDown.ColumnWidth = False
      FilterDropDown.Font.Charset = DEFAULT_CHARSET
      FilterDropDown.Font.Color = clWindowText
      FilterDropDown.Font.Height = -11
      FilterDropDown.Font.Name = 'MS Sans Serif'
      FilterDropDown.Font.Style = []
      FilterDropDown.Height = 200
      FilterDropDown.Width = 200
      ColWidths = (
        64
        64
        64)
    end
  end
  object sgTransaksi: TAdvColumnGrid
    Left = 0
    Top = 119
    Width = 888
    Height = 328
    Cursor = crDefault
    TabStop = False
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = 13303754
    ColCount = 10
    DefaultRowHeight = 21
    DefaultDrawing = False
    FixedCols = 1
    RowCount = 2
    FixedRows = 1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    GridLineWidth = 1
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goRangeSelect, goDrawFocusSelected, goColSizing]
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 2
    OnDblClick = sgTransaksiDblClick
    OnKeyDown = sgTransaksiKeyDown
    OnSelectCell = sgTransaksiSelectCell
    GridLineColor = clSilver
    ActiveCellShow = False
    ActiveCellFont.Charset = DEFAULT_CHARSET
    ActiveCellFont.Color = clWindowText
    ActiveCellFont.Height = -11
    ActiveCellFont.Name = 'Tahoma'
    ActiveCellFont.Style = [fsBold]
    ActiveCellColor = clGray
    ActiveCellColorTo = clNone
    Bands.PrimaryColor = clInfoBk
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
    OnGetAlignment = sgTransaksiGetAlignment
    OnCanEditCell = sgTransaksiCanEditCell
    OnCellValidate = sgTransaksiCellValidate
    OnGetEditorType = sgTransaksiGetEditorType
    OnGetFloatFormat = sgTransaksiGetFloatFormat
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
    FixedFont.Charset = ANSI_CHARSET
    FixedFont.Color = clWindowText
    FixedFont.Height = -12
    FixedFont.Name = 'Courier New'
    FixedFont.Style = [fsBold]
    FixedAsButtons = False
    FloatFormat = '%.2f'
    IntegralHeight = False
    WordWrap = True
    ColumnHeaders.Strings = (
      'No'
      'PLU'
      'Nama Barang'
      'Jumlah'
      'Harga'
      'Disc'
      'Man. Disc'
      'Total'
      'isDecimal'
      'IsDiscGMC')
    Lookup = False
    LookupCaseSensitive = False
    LookupHistory = False
    BackGround.Top = 0
    BackGround.Left = 0
    BackGround.Display = bdTile
    BackGround.Cells = bcNormal
    Filter = <>
    Columns = <
      item
        AutoMinSize = 0
        AutoMaxSize = 0
        Alignment = taCenter
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = 13303754
        ColumnPopupType = cpFixedCellsRClick
        EditLength = 0
        Editor = edNormal
        FilterCaseSensitive = False
        Fixed = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Header = 'No'
        MinSize = 0
        MaxSize = 0
        Password = False
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintColor = clWhite
        PrintFont.Charset = ANSI_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -13
        PrintFont.Name = 'Courier New'
        PrintFont.Style = []
        ReadOnly = False
        ShowBands = False
        SortStyle = ssAutomatic
        SpinMax = 0
        SpinMin = 0
        SpinStep = 1
        Tag = 0
        Width = 64
      end
      item
        AutoMinSize = 0
        AutoMaxSize = 0
        Alignment = taCenter
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = 13303754
        ColumnPopupType = cpFixedCellsRClick
        EditLength = 0
        Editor = edNormal
        FilterCaseSensitive = False
        Fixed = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Header = 'PLU'
        MinSize = 0
        MaxSize = 0
        Password = False
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintColor = clWhite
        PrintFont.Charset = ANSI_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -13
        PrintFont.Name = 'Courier New'
        PrintFont.Style = []
        ReadOnly = True
        ShowBands = False
        SortStyle = ssAutomatic
        SpinMax = 0
        SpinMin = 0
        SpinStep = 1
        Tag = 0
        Width = 64
      end
      item
        AutoMinSize = 0
        AutoMaxSize = 0
        Alignment = taCenter
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = 13303754
        ColumnPopupType = cpFixedCellsRClick
        EditLength = 0
        Editor = edNormal
        FilterCaseSensitive = False
        Fixed = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Header = 'Nama Barang'
        MinSize = 0
        MaxSize = 0
        Password = False
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintColor = clWhite
        PrintFont.Charset = ANSI_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -13
        PrintFont.Name = 'Courier New'
        PrintFont.Style = []
        ReadOnly = True
        ShowBands = False
        SortStyle = ssAutomatic
        SpinMax = 0
        SpinMin = 0
        SpinStep = 1
        Tag = 0
        Width = 90
      end
      item
        AutoMinSize = 0
        AutoMaxSize = 0
        Alignment = taCenter
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = 13303754
        ColumnPopupType = cpFixedCellsRClick
        EditLength = 0
        Editor = edFloat
        FilterCaseSensitive = False
        Fixed = False
        FloatFormat = '%.2n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Header = 'Jumlah'
        MinSize = 0
        MaxSize = 0
        Password = False
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintColor = clWhite
        PrintFont.Charset = ANSI_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -13
        PrintFont.Name = 'Courier New'
        PrintFont.Style = []
        ReadOnly = False
        ShowBands = False
        SortStyle = ssAutomatic
        SpinMax = 0
        SpinMin = 0
        SpinStep = 1
        Tag = 0
        Width = 64
      end
      item
        AutoMinSize = 0
        AutoMaxSize = 0
        Alignment = taCenter
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = 13303754
        ColumnPopupType = cpFixedCellsRClick
        EditLength = 0
        Editor = edNormal
        FilterCaseSensitive = False
        Fixed = False
        FloatFormat = '%.2n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Header = 'Harga'
        MinSize = 0
        MaxSize = 0
        Password = False
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintColor = clWhite
        PrintFont.Charset = ANSI_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -13
        PrintFont.Name = 'Courier New'
        PrintFont.Style = []
        ReadOnly = True
        ShowBands = False
        SortStyle = ssAutomatic
        SpinMax = 0
        SpinMin = 0
        SpinStep = 1
        Tag = 0
        Width = 64
      end
      item
        AutoMinSize = 0
        AutoMaxSize = 0
        Alignment = taCenter
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = 13303754
        ColumnPopupType = cpFixedCellsRClick
        EditLength = 0
        Editor = edNormal
        FilterCaseSensitive = False
        Fixed = False
        FloatFormat = '%.2n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Header = 'Disc'
        MinSize = 0
        MaxSize = 0
        Password = False
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintColor = clWhite
        PrintFont.Charset = ANSI_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -13
        PrintFont.Name = 'Courier New'
        PrintFont.Style = []
        ReadOnly = True
        ShowBands = False
        SortStyle = ssAutomatic
        SpinMax = 0
        SpinMin = 0
        SpinStep = 1
        Tag = 0
        Width = 64
      end
      item
        AutoMinSize = 0
        AutoMaxSize = 0
        Alignment = taCenter
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = 13303754
        ColumnPopupType = cpFixedCellsRClick
        EditLength = 0
        Editor = edNormal
        FilterCaseSensitive = False
        Fixed = False
        FloatFormat = '%.2n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Header = 'Man. Disc'
        MinSize = 0
        MaxSize = 0
        Password = False
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintColor = clWhite
        PrintFont.Charset = ANSI_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -13
        PrintFont.Name = 'Courier New'
        PrintFont.Style = []
        ReadOnly = True
        ShowBands = False
        SortStyle = ssAutomatic
        SpinMax = 0
        SpinMin = 0
        SpinStep = 1
        Tag = 0
        Width = 99
      end
      item
        AutoMinSize = 0
        AutoMaxSize = 0
        Alignment = taLeftJustify
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = 13303754
        ColumnPopupType = cpFixedCellsRClick
        EditLength = 0
        Editor = edNormal
        FilterCaseSensitive = False
        Fixed = False
        FloatFormat = '%.2n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Header = 'Total'
        MinSize = 0
        MaxSize = 0
        Password = False
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintColor = clWhite
        PrintFont.Charset = ANSI_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -13
        PrintFont.Name = 'Courier New'
        PrintFont.Style = []
        ReadOnly = True
        ShowBands = False
        SortStyle = ssAutomatic
        SpinMax = 0
        SpinMin = 0
        SpinStep = 1
        Tag = 0
        Width = 100
      end
      item
        AutoMinSize = 0
        AutoMaxSize = 0
        Alignment = taLeftJustify
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = 13303754
        ColumnPopupType = cpFixedCellsRClick
        EditLength = 0
        Editor = edNormal
        FilterCaseSensitive = False
        Fixed = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Header = 'isDecimal'
        MinSize = 0
        MaxSize = 0
        Name = 'isDecimal'
        Password = False
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintColor = clWhite
        PrintFont.Charset = ANSI_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -13
        PrintFont.Name = 'Courier New'
        PrintFont.Style = []
        ReadOnly = True
        ShowBands = False
        SortStyle = ssAutomatic
        SpinMax = 0
        SpinMin = 0
        SpinStep = 1
        Tag = 0
        Width = 0
      end
      item
        AutoMinSize = 0
        AutoMaxSize = 0
        Alignment = taLeftJustify
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = 13303754
        ColumnPopupType = cpFixedCellsRClick
        EditLength = 0
        Editor = edNormal
        FilterCaseSensitive = False
        Fixed = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Header = 'IsDiscGMC'
        MinSize = 0
        MaxSize = 0
        Name = 'IsDiscGMC'
        Password = False
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintColor = clWhite
        PrintFont.Charset = ANSI_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -13
        PrintFont.Name = 'Courier New'
        PrintFont.Style = []
        ReadOnly = False
        ShowBands = False
        SortStyle = ssAutomatic
        SpinMax = 0
        SpinMin = 0
        SpinStep = 1
        Tag = 0
        Width = 0
      end>
    FilterDropDown.Color = clWindow
    FilterDropDown.ColumnWidth = False
    FilterDropDown.Font.Charset = DEFAULT_CHARSET
    FilterDropDown.Font.Color = clWindowText
    FilterDropDown.Font.Height = -11
    FilterDropDown.Font.Name = 'MS Sans Serif'
    FilterDropDown.Font.Style = []
    FilterDropDown.Height = 200
    FilterDropDown.Width = 200
    ColWidths = (
      64
      64
      90
      64
      64
      64
      99
      100
      0
      0)
    object pnlotorisasi: TPanel
      Left = 569
      Top = 59
      Width = 281
      Height = 128
      Align = alCustom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = clGray
      TabOrder = 3
      Visible = False
      object lbl4: TLabel
        Left = 9
        Top = 30
        Width = 32
        Height = 16
        Caption = 'User'
      end
      object lbl5: TLabel
        Left = 10
        Top = 58
        Width = 64
        Height = 16
        Caption = 'Password'
      end
      object bvl1: TBevel
        Left = 2
        Top = 2
        Width = 277
        Height = 9
        Align = alTop
        Shape = bsTopLine
      end
      object lbl6: TLabel
        Left = 58
        Top = 4
        Width = 161
        Height = 22
        Caption = 'OTORISASI PASSWORD'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtUsername: TEdit
        Left = 96
        Top = 30
        Width = 153
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        OnKeyDown = edtUsernameKeyDown
      end
      object edtPassword: TEdit
        Left = 96
        Top = 58
        Width = 153
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        PasswordChar = '*'
        TabOrder = 1
        OnKeyDown = edtPasswordKeyDown
      end
      object btnOk: TButton
        Left = 96
        Top = 93
        Width = 75
        Height = 25
        Caption = '&Ok'
        TabOrder = 2
        OnClick = btnOkClick
      end
      object btnCancel: TButton
        Left = 184
        Top = 94
        Width = 75
        Height = 25
        Caption = '&Cancel'
        TabOrder = 3
        OnClick = btnCancelClick
      end
    end
  end
  object edHargaKontrabon: TEnhancedEdit
    Left = 435
    Top = 455
    Width = 169
    Height = 29
    Anchors = [akLeft, akBottom]
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 5
    Text = '0'
    Visible = False
    OnKeyDown = edHargaKontrabonKeyDown
    Alignment = taRightJustify
    Format = ffNumber
    ValueInt = 0
    ColorGotFocused = clYellow
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 491
    Width = 888
    Height = 38
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 13303754
    TabOrder = 6
    DesignSize = (
      888
      38)
    object btnHapus: TButton
      Left = 6
      Top = 6
      Width = 86
      Height = 25
      Caption = 'Hapus [Del]'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object btnBayar: TButton
      Left = 96
      Top = 6
      Width = 87
      Height = 25
      Caption = 'Bayar [F9]'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnBayarClick
    end
    object btnReset: TButton
      Left = 186
      Top = 6
      Width = 86
      Height = 25
      Caption = 'Reset [F12]'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnResetClick
    end
    object pnlInfo: TPanel
      Left = 282
      Top = 2
      Width = 604
      Height = 34
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = clYellow
      TabOrder = 0
      Visible = False
      DesignSize = (
        604
        34)
      object lblInfo: TLabel
        Left = 12
        Top = 8
        Width = 88
        Height = 15
        Anchors = [akLeft, akBottom]
        Caption = 'Warning !!!'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -20
        Font.Name = 'Fixedsys'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object pnlTotal: TPanel
    Left = 0
    Top = 0
    Width = 888
    Height = 58
    Align = alTop
    TabOrder = 0
    object lblTotal: TLabel
      Left = 165
      Top = 1
      Width = 722
      Height = 56
      Align = alClient
      Alignment = taRightJustify
      Caption = 'Rp. 0,00 '
      Color = clYellow
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -47
      Font.Name = 'EditSys'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbl2: TLabel
      Left = 1
      Top = 1
      Width = 164
      Height = 56
      Align = alLeft
      Alignment = taRightJustify
      Caption = ' Total ='
      Color = clYellow
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -47
      Font.Name = 'EditSys'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
  end
  object edPLU: TEdit
    Left = 156
    Top = 455
    Width = 175
    Height = 29
    Anchors = [akLeft, akBottom]
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 4
    OnEnter = edPLUEnter
    OnExit = edPLUExit
    OnKeyDown = edPLUKeyDown
  end
  inline fraLookupBarang: TfraLookupBarang
    Left = 246
    Top = 192
    Width = 300
    Height = 150
    TabOrder = 3
    Visible = False
    inherited pbBarang: TAdvProgressBar
      Top = 98
      Width = 300
    end
    inherited sgBarang: TAdvColumnGrid
      Width = 300
      Height = 46
    end
    inherited pnlHeader: TPanel
      Width = 300
      ParentColor = True
      inherited edNamaBarang: TEdit
        Width = 480
      end
    end
    inherited pnlInfo: TPanel
      Top = 116
      Width = 300
    end
  end
  inline fraMember: TfraMember
    Left = 71
    Top = 227
    Width = 281
    Height = 146
    TabOrder = 7
    Visible = False
    inherited pbLookup: TAdvProgressBar
      Top = 128
      Width = 281
    end
    inherited sgLookup: TAdvColumnGrid
      Width = 281
      Height = 70
    end
    inherited pnlHeader: TPanel
      Width = 281
      inherited edNama: TEdit
        Width = 142
      end
    end
  end
  object tmrInfo: TTimer
    Enabled = False
    Interval = 500
    OnTimer = tmrInfoTimer
    Left = 408
    Top = 434
  end
  object ActionList1: TActionList
    Left = 208
    Top = 151
  end
end
