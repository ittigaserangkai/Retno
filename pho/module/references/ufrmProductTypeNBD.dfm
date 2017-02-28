inherited frmProductTypeNBD: TfrmProductTypeNBD
  Left = 329
  Top = 287
  Caption = 'NBD'#39's Product Type'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Height = 240
    object pnl1: TPanel
      Left = 11
      Top = 95
      Width = 520
      Height = 134
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      object lbl1: TLabel
        Left = 17
        Top = 16
        Width = 33
        Height = 16
        AutoSize = False
        Caption = 'Owner'
      end
      object lbl2: TLabel
        Left = 17
        Top = 43
        Width = 104
        Height = 16
        AutoSize = False
        Caption = 'Cost Center Desc'
      end
      object lbl3: TLabel
        Left = 17
        Top = 70
        Width = 104
        Height = 16
        AutoSize = False
        Caption = 'Account Name (DB)'
      end
      object lbl4: TLabel
        Left = 17
        Top = 97
        Width = 104
        Height = 16
        AutoSize = False
        Caption = 'Account Name (CR)'
      end
      object edtOwner: TEdit
        Left = 116
        Top = 13
        Width = 73
        Height = 22
        Ctl3D = False
        MaxLength = 4
        ParentCtl3D = False
        TabOrder = 0
        Text = 'MARKETING'
      end
      object edtCostCenterDesc: TEdit
        Left = 116
        Top = 40
        Width = 277
        Height = 22
        Ctl3D = False
        MaxLength = 20
        ParentCtl3D = False
        TabOrder = 1
        Text = 'DESC COST CENTER'
      end
      object edtAccNameDB: TEdit
        Left = 116
        Top = 67
        Width = 277
        Height = 22
        Ctl3D = False
        MaxLength = 20
        ParentCtl3D = False
        TabOrder = 2
        Text = 'PIUTANG VVV'
      end
      object edtAccNameCR: TEdit
        Left = 116
        Top = 94
        Width = 277
        Height = 22
        Ctl3D = False
        MaxLength = 20
        ParentCtl3D = False
        TabOrder = 3
        Text = 'PENDAPATAN VVV'
      end
    end
    object pnl2: TPanel
      Left = 11
      Top = 11
      Width = 520
      Height = 84
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 1
      object strgGrid: TAdvStringGrid
        Left = 2
        Top = 2
        Width = 516
        Height = 80
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
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goRowSelect]
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
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
        OnRowChanging = strgGridRowChanging
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
        ColWidths = (
          64
          64
          64
          64
          64)
      end
    end
  end
  inline fraFooter5Button1: TfraFooter5Button
    Left = 0
    Top = 270
    Width = 542
    Height = 56
    Align = alBottom
    AutoScroll = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    inherited pnlFooter: TPanel
      Width = 542
      inherited btnClose: TsuiButton
        Left = 460
      end
      inherited btnAdd: TsuiButton
        Caption = 'Add'
        Action = actAddProductTypeNBD
      end
      inherited btnUpdate: TsuiButton
        Caption = 'Edit'
        Action = actEditProductTypeNBD
      end
      inherited btnDelete: TsuiButton
        Action = actDeleteProductTypeNBD
      end
      inherited btnRefresh: TsuiButton
        Action = actRefreshProductTypeNBD
      end
    end
    inherited pnlSortCut: TPanel
      Width = 542
      inherited lbl5: TLabel
        Left = 452
      end
    end
  end
  object actlst1: TActionList
    Left = 504
    Top = 8
    object actAddProductTypeNBD: TAction
      Caption = 'Add'
      OnExecute = actAddProductTypeNBDExecute
    end
    object actEditProductTypeNBD: TAction
      Caption = 'Edit'
      OnExecute = actEditProductTypeNBDExecute
    end
    object actDeleteProductTypeNBD: TAction
      Caption = 'Delete'
      OnExecute = actDeleteProductTypeNBDExecute
    end
    object actRefreshProductTypeNBD: TAction
      Caption = 'Refresh'
      OnExecute = actRefreshProductTypeNBDExecute
    end
  end
end
