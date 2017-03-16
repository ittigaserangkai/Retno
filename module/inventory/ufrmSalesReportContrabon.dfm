inherited frmSalesReportContrabon: TfrmSalesReportContrabon
  Left = 263
  Caption = 'Sales Report Contrabon'
  ClientHeight = 461
  ClientWidth = 933
  OldCreateOrder = True
  ExplicitWidth = 949
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 933
    Height = 375
    ExplicitWidth = 120
    ExplicitHeight = 354
    object pnlTop: TPanel
      Left = 11
      Top = 11
      Width = 911
      Height = 62
      Align = alTop
      Color = 15198183
      TabOrder = 0
      object lbl1: TLabel
        Left = 16
        Top = 13
        Width = 37
        Height = 16
        Caption = 'Periode'
      end
      object lbl2: TLabel
        Left = 208
        Top = 13
        Width = 11
        Height = 16
        Caption = 'To'
      end
      object lbl3: TLabel
        Left = 486
        Top = 9
        Width = 39
        Height = 16
        Caption = 'Supplier'
        Visible = False
      end
      object lbl4: TLabel
        Left = 886
        Top = 9
        Width = 11
        Height = 16
        Caption = 'To'
        Visible = False
      end
      object lbl5: TLabel
        Left = 486
        Top = 36
        Width = 39
        Height = 16
        Caption = 'Supplier'
        Visible = False
      end
      object dtTglFrom: TJvDateEdit
        Left = 82
        Top = 10
        Width = 113
        Height = 22
        ButtonFlat = True
        Flat = True
        ParentFlat = False
        NumGlyphs = 2
        ShowNullDate = False
        TabOrder = 0
        OnKeyUp = dtTglFromKeyUp
      end
      object dtTglTo: TJvDateEdit
        Left = 234
        Top = 10
        Width = 113
        Height = 22
        ButtonFlat = True
        Flat = True
        ParentFlat = False
        NumGlyphs = 2
        ShowNullDate = False
        TabOrder = 1
        OnKeyUp = dtTglToKeyUp
      end
      object edtsuplierNameFrom: TEdit
        Left = 670
        Top = 6
        Width = 209
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 3
        Visible = False
      end
      object edtSuplierNamaTo: TEdit
        Left = 670
        Top = 33
        Width = 209
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 5
        Visible = False
      end
      object btnView: TsuiButton
        Left = 353
        Top = 8
        Width = 72
        Height = 27
        Cursor = crHandPoint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Caption = '&View'
        AutoSize = False
        ParentFont = False
        OnEnter = btnViewEnter
        OnExit = btnViewExit
        UIStyle = BlueGlass
        TabOrder = 6
        Transparent = True
        ModalResult = 0
        FocusedRectMargin = 2
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000C30E0000C30E00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          FFFFFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF500019500019FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9F9F9F9FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF663333993300500019FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFF9F9F9FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF663333993300993300500019FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFFFF00FF9F9F9FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF000000993300993300993300500019FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFFFF00FFFF00FF9F9F9FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF0000009933009933009933009933005000
          19FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFFFF00FFFF00FFFF00FF9F9F9FFFFFFFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF000000993300CC6600993300CC66009933
          00500019FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFFFF00FFFF00FFFF00FFFF00FF9F9F9FFFFFFFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF000000CC6600993300CC6600993300CC66
          00993300500019FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF9F9F9FFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF000000CC6600CC6600CC6600CC6600CC66
          00CC6600663333FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFFFF00FFFF00FFFF00FFFF00FFFFFFFF9F9F9FFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF663333FF9900CC6600FF9900CC6600FF99
          00663333FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFFFF00FFFF00FFFF00FFFFFFFF9F9F9FFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF663333FF9900FF9900FF9900FF99006633
          33FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFFFF00FFFF00FFFFFFFF9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF663333FF9900FF9900FF9900663333FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFFFF00FFFFFFFF9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF663333FFE2B4FFE2B4663333FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFFFFFFFF9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF663333FFFFDE663333FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFFFFFF9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF663333663333FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9F9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Layout = blGlyphLeft
        Spacing = 4
        MouseContinuouslyDownInterval = 100
        OnClick = btnViewClick
        ResHandle = 0
      end
      object edKodeSupplier1: TEditBtn
        Left = 552
        Top = 6
        Width = 113
        Height = 22
        ReturnIsTab = False
        Flat = False
        Etched = False
        FocusBorder = False
        RightAlign = False
        TabOrder = 2
        Text = '0'
        Visible = False
        Version = '1.5.1.0'
        OnClickBtn = edKodeSupplier1ClickBtn
      end
      object edKodeSupplier2: TEditBtn
        Left = 552
        Top = 33
        Width = 113
        Height = 22
        ReturnIsTab = False
        Flat = False
        Etched = False
        FocusBorder = False
        RightAlign = False
        TabOrder = 4
        Text = '0'
        Visible = False
        Version = '1.5.1.0'
        OnClickBtn = edKodeSupplier2ClickBtn
      end
    end
    object pnlMiddle: TPanel
      Left = 11
      Top = 73
      Width = 911
      Height = 291
      Align = alClient
      BorderWidth = 5
      Color = 15198183
      TabOrder = 1
      ExplicitTop = 53
      ExplicitWidth = 98
      ExplicitHeight = 290
      object spl1: TSplitter
        Left = 581
        Top = 6
        Height = 279
        ExplicitHeight = 290
      end
      object sgData: TAdvColumnGrid
        Left = 6
        Top = 6
        Width = 575
        Height = 279
        Cursor = crDefault
        Align = alLeft
        ColCount = 8
        Ctl3D = True
        DefaultRowHeight = 21
        DrawingStyle = gdsClassic
        RowCount = 5
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing]
        ParentCtl3D = False
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        OnGetAlignment = sgDataGetAlignment
        OnRowChanging = sgDataRowChanging
        OnClickCell = sgDataClickCell
        OnCanEditCell = sgDataCanEditCell
        OnGetFloatFormat = sgDataGetFloatFormat
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
        CellNode.TreeColor = clSilver
        ColumnHeaders.Strings = (
          'No'
          'Kode'
          'Nama'
          'Gross Sales'
          'Diskon'
          'PPN'
          'Diskon AMC'
          'Total Sales')
        ControlLook.FixedGradientHoverFrom = clGray
        ControlLook.FixedGradientHoverTo = clWhite
        ControlLook.FixedGradientDownFrom = clGray
        ControlLook.FixedGradientDownTo = clSilver
        ControlLook.ControlStyle = csWinXP
        ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
        ControlLook.DropDownHeader.Font.Color = clWindowText
        ControlLook.DropDownHeader.Font.Height = -11
        ControlLook.DropDownHeader.Font.Name = 'Tahoma'
        ControlLook.DropDownHeader.Font.Style = []
        ControlLook.DropDownHeader.Visible = True
        ControlLook.DropDownHeader.Buttons = <>
        ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
        ControlLook.DropDownFooter.Font.Color = clWindowText
        ControlLook.DropDownFooter.Font.Height = -11
        ControlLook.DropDownFooter.Font.Name = 'Tahoma'
        ControlLook.DropDownFooter.Font.Style = []
        ControlLook.DropDownFooter.Visible = True
        ControlLook.DropDownFooter.Buttons = <>
        Filter = <>
        FilterDropDown.Font.Charset = DEFAULT_CHARSET
        FilterDropDown.Font.Color = clWindowText
        FilterDropDown.Font.Height = -11
        FilterDropDown.Font.Name = 'MS Sans Serif'
        FilterDropDown.Font.Style = []
        FilterDropDown.Height = 200
        FilterDropDown.Width = 200
        FilterDropDownClear = '(All)'
        FixedFont.Charset = DEFAULT_CHARSET
        FixedFont.Color = clWindowText
        FixedFont.Height = -11
        FixedFont.Name = 'Tahoma'
        FixedFont.Style = [fsBold]
        FloatFormat = '%.2f'
        PrintSettings.DateFormat = 'dd/mm/yyyy'
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
        PrintSettings.PageNumSep = '/'
        SearchFooter.Font.Charset = DEFAULT_CHARSET
        SearchFooter.Font.Color = clWindowText
        SearchFooter.Font.Height = -11
        SearchFooter.Font.Name = 'Tahoma'
        SearchFooter.Font.Style = []
        SortSettings.Column = 0
        Version = '3.1.2.2'
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
            DropDownCount = 8
            EditLength = 0
            Editor = edNormal
            FilterCaseSensitive = False
            Fixed = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = 'No'
            HeaderAlignment = taLeftJustify
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
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
            DropDownCount = 8
            EditLength = 0
            Editor = edNormal
            FilterCaseSensitive = False
            Fixed = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = 'Kode'
            HeaderAlignment = taLeftJustify
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
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
            DropDownCount = 8
            EditLength = 0
            Editor = edNormal
            FilterCaseSensitive = False
            Fixed = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = 'Nama'
            HeaderAlignment = taLeftJustify
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
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
            DropDownCount = 8
            EditLength = 0
            Editor = edNormal
            FilterCaseSensitive = False
            Fixed = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = 'Gross Sales'
            HeaderAlignment = taLeftJustify
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
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
            DropDownCount = 8
            EditLength = 0
            Editor = edNormal
            FilterCaseSensitive = False
            Fixed = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = 'Diskon'
            HeaderAlignment = taLeftJustify
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
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
            DropDownCount = 8
            EditLength = 0
            Editor = edNormal
            FilterCaseSensitive = False
            Fixed = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = 'PPN'
            HeaderAlignment = taLeftJustify
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
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
            DropDownCount = 8
            EditLength = 0
            Editor = edNormal
            FilterCaseSensitive = False
            Fixed = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = 'Diskon AMC'
            HeaderAlignment = taLeftJustify
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
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
            DropDownCount = 8
            EditLength = 0
            Editor = edNormal
            FilterCaseSensitive = False
            Fixed = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = 'Total Sales'
            HeaderAlignment = taLeftJustify
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
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
        ExplicitHeight = 278
        ColWidths = (
          64
          64
          64
          64
          64
          64
          64
          64)
      end
      object sgDataDetail: TAdvColumnGrid
        Left = 584
        Top = 6
        Width = 321
        Height = 279
        Cursor = crDefault
        Align = alClient
        ColCount = 12
        Ctl3D = True
        DefaultRowHeight = 21
        DrawingStyle = gdsClassic
        RowCount = 5
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected]
        ParentCtl3D = False
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 1
        OnGetAlignment = sgDataDetailGetAlignment
        OnCanEditCell = sgDataDetailCanEditCell
        OnGetFloatFormat = sgDataDetailGetFloatFormat
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
        CellNode.TreeColor = clSilver
        ColumnHeaders.Strings = (
          'No'
          'PLU'
          'UOM'
          'Qty'
          'Harga'
          'Diskon'
          'PPN %'
          'Gross Sales'
          'Total Diskon'
          'PPN Total'
          'Diskon AMC'
          'Total')
        ControlLook.FixedGradientHoverFrom = clGray
        ControlLook.FixedGradientHoverTo = clWhite
        ControlLook.FixedGradientDownFrom = clGray
        ControlLook.FixedGradientDownTo = clSilver
        ControlLook.ControlStyle = csWinXP
        ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
        ControlLook.DropDownHeader.Font.Color = clWindowText
        ControlLook.DropDownHeader.Font.Height = -11
        ControlLook.DropDownHeader.Font.Name = 'Tahoma'
        ControlLook.DropDownHeader.Font.Style = []
        ControlLook.DropDownHeader.Visible = True
        ControlLook.DropDownHeader.Buttons = <>
        ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
        ControlLook.DropDownFooter.Font.Color = clWindowText
        ControlLook.DropDownFooter.Font.Height = -11
        ControlLook.DropDownFooter.Font.Name = 'Tahoma'
        ControlLook.DropDownFooter.Font.Style = []
        ControlLook.DropDownFooter.Visible = True
        ControlLook.DropDownFooter.Buttons = <>
        Filter = <>
        FilterDropDown.Font.Charset = DEFAULT_CHARSET
        FilterDropDown.Font.Color = clWindowText
        FilterDropDown.Font.Height = -11
        FilterDropDown.Font.Name = 'MS Sans Serif'
        FilterDropDown.Font.Style = []
        FilterDropDown.Height = 200
        FilterDropDown.Width = 200
        FilterDropDownClear = '(All)'
        FixedFont.Charset = DEFAULT_CHARSET
        FixedFont.Color = clWindowText
        FixedFont.Height = -11
        FixedFont.Name = 'Tahoma'
        FixedFont.Style = [fsBold]
        FloatFormat = '%.2f'
        PrintSettings.DateFormat = 'dd/mm/yyyy'
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
        PrintSettings.PageNumSep = '/'
        SearchFooter.Font.Charset = DEFAULT_CHARSET
        SearchFooter.Font.Color = clWindowText
        SearchFooter.Font.Height = -11
        SearchFooter.Font.Name = 'Tahoma'
        SearchFooter.Font.Style = []
        SortSettings.Column = 0
        Version = '3.1.2.2'
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
            DropDownCount = 8
            EditLength = 0
            Editor = edNormal
            FilterCaseSensitive = False
            Fixed = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = 'No'
            HeaderAlignment = taLeftJustify
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
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
            DropDownCount = 8
            EditLength = 0
            Editor = edNormal
            FilterCaseSensitive = False
            Fixed = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = 'PLU'
            HeaderAlignment = taLeftJustify
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
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
            DropDownCount = 8
            EditLength = 0
            Editor = edNormal
            FilterCaseSensitive = False
            Fixed = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = 'UOM'
            HeaderAlignment = taLeftJustify
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
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
            DropDownCount = 8
            EditLength = 0
            Editor = edNormal
            FilterCaseSensitive = False
            Fixed = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = 'Qty'
            HeaderAlignment = taLeftJustify
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
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
            DropDownCount = 8
            EditLength = 0
            Editor = edNormal
            FilterCaseSensitive = False
            Fixed = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = 'Harga'
            HeaderAlignment = taLeftJustify
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
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
            DropDownCount = 8
            EditLength = 0
            Editor = edNormal
            FilterCaseSensitive = False
            Fixed = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = 'Diskon'
            HeaderAlignment = taLeftJustify
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
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
            DropDownCount = 8
            EditLength = 0
            Editor = edNormal
            FilterCaseSensitive = False
            Fixed = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = 'PPN %'
            HeaderAlignment = taLeftJustify
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
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
            DropDownCount = 8
            EditLength = 0
            Editor = edNormal
            FilterCaseSensitive = False
            Fixed = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = 'Gross Sales'
            HeaderAlignment = taLeftJustify
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
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
            DropDownCount = 8
            EditLength = 0
            Editor = edNormal
            FilterCaseSensitive = False
            Fixed = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = 'Total Diskon'
            HeaderAlignment = taLeftJustify
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
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
            DropDownCount = 8
            EditLength = 0
            Editor = edNormal
            FilterCaseSensitive = False
            Fixed = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = 'PPN Total'
            HeaderAlignment = taLeftJustify
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
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
            DropDownCount = 8
            EditLength = 0
            Editor = edNormal
            FilterCaseSensitive = False
            Fixed = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = 'Diskon AMC'
            HeaderAlignment = taLeftJustify
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
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
            DropDownCount = 8
            EditLength = 0
            Editor = edNormal
            FilterCaseSensitive = False
            Fixed = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = 'Total'
            HeaderAlignment = taLeftJustify
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
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
        ExplicitWidth = 334
        ExplicitHeight = 278
        ColWidths = (
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64
          64)
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 933
    ExplicitWidth = 120
    inherited lblHeader: TLabel
      Width = 150
      Caption = 'SALES REPORT CONTRABON'
      ExplicitWidth = 150
    end
  end
  inline fraFooter5Button1: TfraFooter5Button
    Left = 0
    Top = 405
    Width = 933
    Height = 56
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitTop = -56
    ExplicitWidth = 120
    inherited pnlFooter: TPanel
      Width = 933
      ExplicitWidth = 120
      inherited bvlSeparator: TBevel
        Left = 334
        Visible = False
        ExplicitLeft = 334
      end
      inherited btnClose: TsuiButton
        Left = 851
        ExplicitLeft = 38
      end
      inherited btnAdd: TsuiButton
        Width = 102
        Caption = '&Print Rekap'
        Enabled = False
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000C40E0000C40E00000000000000000000FF00FF7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F404040FF00FFFF00FF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFF00FF606060
          FFFFFFDCDCDCFFFFFFDCDCDCFFFFFFDCDCDCFFFFFFDCDCDCFFFFFFDCDCDCFFFF
          FFDCDCDC404040FF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF
          606060DCDCDCD78300D78300D78300D78300D78300D78300D78300D78300DCDC
          DC404040FF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF663333
          663333DE9A3EBFBFBFDE9A3EBFBFBFDE9A3EBFBFBFDE9A3EBFBFBFDE9A3E4040
          40663333663333FF00FFFF00FF7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7FFFFFFFFF00FFB97A00
          FFCC996633336633336633336633336633336633336633336633336633336633
          33CC6600663333FF00FFFF00FF7F7F7FFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFF00FF7F7F7FFFFFFFFF00FFB97A00
          FFCC99FFCC99FF9900FFCC99FF9900FFCC99FF9900FFCC99FF9900FFCC997F7F
          7FCC6600663333FF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFB97A00
          FFCC99FF9900FFCC99FF9900FFCC99FF9900FFCC99FF9900FFCC990033FF0033
          FFCC6600663333FF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFF00FF7F7F7FFFFFFFFF00FFB97A00
          FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC9900CCFF00CC
          FFCC6600663333FF00FFFF00FF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFF7F7F7FFFFFFFFF00FFB97A00
          FFFFDE9933009933009933009933009933009933009933009933009933009933
          00CC6600663333FF00FFFF00FF7F7F7FFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF7F7F7FFFFFFFFF00FFDE9A3E
          B97A00993300FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC999933
          00993300DE9A3EFF00FFFF00FF7F7F7FFFFFFF7F7F7FFFFFFFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFF7F7F7FFFFFFFFF00FFFF00FF
          B97A009F9F9FDCDCDCBFBFBFDCDCDCBFBFBFDCDCDCBFBFBFDCDCDCBFBFBF6060
          60993300FF00FFFF00FFFF00FFFF00FF7F7F7F7F7F7FFFFFFFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF7F7F7F7F7F7FFFFFFFFF00FFFF00FFFF00FF
          FF00FF9F9F9FFFFFFFDCDCDCFFFFFFDCDCDCBFBFBFDCDCDCBFBFBFBFBFBF6060
          60FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF
          00FFFF00FFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FF
          FF00FF9F9F9FDCDCDCFFFFFFDCDCDCFFFFFFDCDCDC7F7F7F6060606060606060
          60FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF
          00FFFF00FF7F7F7F7F7F7F7F7F7F7F7F7FFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF9F9F9FFFFFFFFFFFFFFFFFFFDCDCDCBFBFBF9F9F9FFFFFFF606060FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF
          00FFFF00FF7F7F7FFFFFFF7F7F7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF9F9F9FFFFFFFFFFFFFDCDCDCFFFFFFDCDCDC9F9F9F606060FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF7F7F7F7F7F7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9FFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        OnClick = fraFooter5Button1btnAddClick
        ExplicitWidth = 102
      end
      inherited btnUpdate: TsuiButton
        Left = 120
        Width = 97
        Caption = 'Print &Detil'
        Enabled = False
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000C40E0000C40E00000000000000000000FF00FF7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F404040FF00FFFF00FF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFF00FF606060
          FFFFFFDCDCDCFFFFFFDCDCDCFFFFFFDCDCDCFFFFFFDCDCDCFFFFFFDCDCDCFFFF
          FFDCDCDC404040FF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF
          606060DCDCDCD78300D78300D78300D78300D78300D78300D78300D78300DCDC
          DC404040FF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF663333
          663333DE9A3EBFBFBFDE9A3EBFBFBFDE9A3EBFBFBFDE9A3EBFBFBFDE9A3E4040
          40663333663333FF00FFFF00FF7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7FFFFFFFFF00FFB97A00
          FFCC996633336633336633336633336633336633336633336633336633336633
          33CC6600663333FF00FFFF00FF7F7F7FFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFF00FF7F7F7FFFFFFFFF00FFB97A00
          FFCC99FFCC99FF9900FFCC99FF9900FFCC99FF9900FFCC99FF9900FFCC997F7F
          7FCC6600663333FF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFB97A00
          FFCC99FF9900FFCC99FF9900FFCC99FF9900FFCC99FF9900FFCC990033FF0033
          FFCC6600663333FF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFF00FF7F7F7FFFFFFFFF00FFB97A00
          FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC9900CCFF00CC
          FFCC6600663333FF00FFFF00FF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFF7F7F7FFFFFFFFF00FFB97A00
          FFFFDE9933009933009933009933009933009933009933009933009933009933
          00CC6600663333FF00FFFF00FF7F7F7FFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF7F7F7FFFFFFFFF00FFDE9A3E
          B97A00993300FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC99FFCC999933
          00993300DE9A3EFF00FFFF00FF7F7F7FFFFFFF7F7F7FFFFFFFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFF7F7F7FFFFFFFFF00FFFF00FF
          B97A009F9F9FDCDCDCBFBFBFDCDCDCBFBFBFDCDCDCBFBFBFDCDCDCBFBFBF6060
          60993300FF00FFFF00FFFF00FFFF00FF7F7F7F7F7F7FFFFFFFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF7F7F7F7F7F7FFFFFFFFF00FFFF00FFFF00FF
          FF00FF9F9F9FFFFFFFDCDCDCFFFFFFDCDCDCBFBFBFDCDCDCBFBFBFBFBFBF6060
          60FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF
          00FFFF00FFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FF
          FF00FF9F9F9FDCDCDCFFFFFFDCDCDCFFFFFFDCDCDC7F7F7F6060606060606060
          60FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF
          00FFFF00FF7F7F7F7F7F7F7F7F7F7F7F7FFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF9F9F9FFFFFFFFFFFFFFFFFFFDCDCDCBFBFBF9F9F9FFFFFFF606060FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF
          00FFFF00FF7F7F7FFFFFFF7F7F7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF9F9F9FFFFFFFFFFFFFDCDCDCFFFFFFDCDCDC9F9F9F606060FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF7F7F7F7F7F7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9FFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        OnClick = fraFooter5Button1btnUpdateClick
        ExplicitLeft = 120
        ExplicitWidth = 97
      end
      inherited btnDelete: TsuiButton
        Left = 256
        Visible = False
        ExplicitLeft = 256
      end
      inherited btnRefresh: TsuiButton
        Left = 344
        Visible = False
        ExplicitLeft = 344
      end
    end
    inherited pnlSortCut: TPanel
      Width = 933
      ExplicitWidth = 120
      inherited lbl1: TLabel
        Left = 32
        Width = 76
        Caption = 'CTRL-T [Rekap]'
        ExplicitLeft = 32
        ExplicitWidth = 76
      end
      inherited lbl2: TLabel
        Left = 131
        Width = 69
        Caption = 'CTRL-E [Detil]'
        ExplicitLeft = 131
        ExplicitWidth = 69
      end
      inherited lbl3: TLabel
        Left = 256
        Visible = False
        ExplicitLeft = 256
      end
      inherited lbl4: TLabel
        Left = 355
        Visible = False
        ExplicitLeft = 355
      end
      inherited lbl5: TLabel
        Left = 843
        ExplicitLeft = 856
      end
    end
  end
end
