inherited frmGeneratePKMAverage: TfrmGeneratePKMAverage
  Left = 311
  Top = 251
  Caption = ''
  ClientHeight = 488
  ClientWidth = 592
  OldCreateOrder = True
  ExplicitWidth = 608
  ExplicitHeight = 527
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 592
    Height = 402
    ExplicitHeight = 465
    object sgData: TAdvColumnGrid
      Left = 11
      Top = 139
      Width = 570
      Height = 252
      Cursor = crDefault
      Align = alClient
      Color = clInfoBk
      ColCount = 3
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
      TabOrder = 0
      OnEditChange = sgDataEditChange
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'Tahoma'
      ActiveCellFont.Style = [fsBold]
      CellNode.TreeColor = clSilver
      ColumnHeaders.Strings = (
        'No'
        'PLU'
        'Qty')
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
      ScrollWidth = 16
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
          Alignment = taCenter
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
        end>
      ExplicitWidth = 98
      ExplicitHeight = 315
      ColWidths = (
        64
        64
        64)
    end
    object AdvGridTmp: TAdvStringGrid
      Left = 688
      Top = 144
      Width = 377
      Height = 281
      Cursor = crDefault
      ColCount = 3
      DefaultRowHeight = 21
      DrawingStyle = gdsClassic
      FixedCols = 0
      RowCount = 5
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected]
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 1
      Visible = False
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'Tahoma'
      ActiveCellFont.Style = [fsBold]
      CellNode.TreeColor = clSilver
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
      FilterDropDown.Font.Name = 'Tahoma'
      FilterDropDown.Font.Style = []
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
      ScrollWidth = 19
      SearchFooter.Font.Charset = DEFAULT_CHARSET
      SearchFooter.Font.Color = clWindowText
      SearchFooter.Font.Height = -11
      SearchFooter.Font.Name = 'Tahoma'
      SearchFooter.Font.Style = []
      SortSettings.Column = 0
      Version = '5.8.0.2'
    end
    object pnl1: TPanel
      Left = 11
      Top = 11
      Width = 570
      Height = 128
      Align = alTop
      Color = 15198183
      TabOrder = 2
      ExplicitWidth = 98
      object Label3: TLabel
        Left = 390
        Top = 100
        Width = 34
        Height = 16
        Caption = 'Search'
      end
      object Label2: TLabel
        Left = 6
        Top = 35
        Width = 63
        Height = 16
        Caption = 'Merchandise'
      end
      object lbl3: TLabel
        Left = 6
        Top = 9
        Width = 37
        Height = 16
        Caption = 'Periode'
      end
      object Label1: TLabel
        Left = 6
        Top = 62
        Width = 42
        Height = 16
        Caption = 'No Bukti'
      end
      object edtSearch: TEdit
        Left = 440
        Top = 97
        Width = 94
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        OnChange = edtSearchChange
      end
      object btnTransfer: TsuiButton
        Left = 467
        Top = 57
        Width = 72
        Height = 27
        Cursor = crHandPoint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Caption = 'Transfer'
        AutoSize = False
        ParentFont = False
        OnEnter = btnTransferEnter
        OnExit = btnTransferExit
        UIStyle = BlueGlass
        TabOrder = 1
        Transparent = True
        ModalResult = 0
        FocusedRectMargin = 2
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000C40E0000C40E00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF
          FF00FFFF00FFFF00FFBFBFBFDCDCDCBFBFBFDCDCDCBFBFBFDCDCDCBFBFBFBFBF
          BFBFBFBFBFBFBF7F7F7FFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FDCDCDC7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFF00FFFF00FF
          FF00FF005032005032005032005032DCDCDCBFBFBFDCDCDCBFBFBFDCDCDCBFBF
          BFBFBFBFBFBFBF7F7F7FFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF
          FF00FF009900009900009900005032BFBFBFDCDCDCBFBFBFDCDCDCBFBFBFDCDC
          DCBFBFBFBFBFBF7F7F7FFF00FFFF00FFFF00FF7F7F7F7F7F7F7F7F7F7F7F7FFF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF
          FF00FF00990033CC66009900005032DCDCDCDCDCDCDCDCDCBFBFBFDCDCDCBFBF
          BFDCDCDCBFBFBF7F7F7FFF00FFFF00FFFF00FF7F7F7FFF00FFFF00FF7F7F7FFF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFF009900009900
          00990000990033CC6633CC66005032005032005032005032DCDCDCBFBFBFDCDC
          DCBFBFBFDCDCDC7F7F7FFFFFFFFFFFFFFFFFFF7F7F7FFF00FFFF00FF7F7F7FFF
          FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FFFF00FF7F7F7FFFFFFF009900CCFFCC
          66FF9933CC6633CC6633CC6633CC66009900009900005032DCDCDCDCDCDCBFBF
          BFDCDCDCBFBFBF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFF00FFFF00FF7F7F7F7F
          7F7F7F7F7F7F7F7FFFFFFFFF00FFFF00FFFF00FF7F7F7FFFFFFF009900CCFFCC
          66FF9966FF9933CC6633CC6633CC6633CC66009900005032DCDCDCDCDCDCDCDC
          DCBFBFBFDCDCDC7F7F7F7F7F7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FF7F7F7FFFFFFF009900009900
          009900009900CCFFCC33CC66009900009900009900005032DCDCDCDCDCDCDCDC
          DCDCDCDCBFBFBF7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FFFF
          00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF
          FF00FF009900CCFFCC66FF99005032FFFFFFDCDCDCFFFFFFDCDCDCFFFFFFDCDC
          DCBFBFBFDCDCDC7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFF00FF7F7F7F7F
          7F7F7F7F7F7F7F7FFFFFFFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF
          FF00FF009900CCFFCC66FF99005032DCDCDCFFFFFFDCDCDCFFFFFFDCDCDCDCDC
          DCDCDCDCBFBFBF7F7F7FFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FF7F7F7FFF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF
          FF00FF009900009900009900005032FFFFFFDCDCDCFFFFFFDCDCDCFFFFFFDCDC
          DCDCDCDCDCDCDC7F7F7FFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FF7F7F7FFF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF
          FF00FFFF00FFFF00FFBFBFBFFFFFFFFFFFFFFFFFFFDCDCDCFFFFFFDCDCDCFFFF
          FFDCDCDCBFBFBF7F7F7FFF00FFFF00FFFF00FF7F7F7F7F7F7F7F7F7F7F7F7FFF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF
          FF00FFFF00FFFF00FFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDCFFFFFFDCDC
          DCDCDCDCDCDCDC7F7F7FFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF
          FF00FFFF00FFFF00FFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BFBFBFBFBFBFBF7F7F7FFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F}
        Layout = blGlyphLeft
        Spacing = 4
        MouseContinuouslyDownInterval = 100
        OnClick = btnTransferClick
        ResHandle = 0
      end
      object btnPkmAvDPrint: TsuiButton
        Left = 380
        Top = 57
        Width = 77
        Height = 27
        Cursor = crHandPoint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Caption = 'Print'
        AutoSize = False
        ParentFont = False
        OnEnter = btnPkmAvDPrintEnter
        OnExit = btnPkmAvDPrintExit
        UIStyle = BlueGlass
        TabOrder = 2
        Transparent = True
        ModalResult = 0
        FocusedRectMargin = 2
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
        Layout = blGlyphLeft
        Spacing = 4
        MouseContinuouslyDownInterval = 100
        OnClick = btnPkmAvDPrintClick
        ResHandle = 0
      end
      object btnProses: TsuiButton
        Left = 435
        Top = 30
        Width = 80
        Height = 27
        Cursor = crHandPoint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Caption = 'Proses'
        AutoSize = False
        ParentFont = False
        OnEnter = btnProsesEnter
        OnExit = btnProsesExit
        UIStyle = BlueGlass
        TabOrder = 3
        Transparent = True
        ModalResult = 0
        FocusedRectMargin = 2
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000C40E0000C40E00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFF00FFFF00FFFF00FFFF00FFFF
          FFFFFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF500019
          500019FF00FFFF00FFFF00FFFF00FF500019500019FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF9F9F9F9F9F9FFFFFFFFF00FFFF00FFFF00FF9F
          9F9F9F9F9FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF663333
          993300500019FF00FFFF00FFFF00FF663333993300500019FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF9F9F9FFF00FF9F9F9FFFFFFFFF00FFFF00FF9F
          9F9FFFFFFF9F9F9FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF663333
          993300993300500019FF00FFFF00FF663333993300993300500019FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF9F9F9FFF00FFFF00FF9F9F9FFFFFFFFF00FF9F
          9F9FFFFFFFFF00FF9F9F9FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF663333
          993300993300993300500019FF00FF663333993300993300993300500019FF00
          FFFF00FFFF00FFFF00FFFF00FF9F9F9FFF00FFFF00FFFF00FF9F9F9FFFFFFF9F
          9F9FFFFFFFFF00FFFF00FF9F9F9FFFFFFFFF00FFFF00FFFF00FFFF00FF663333
          9933009933009933009933005000196633339933009933009933009933005000
          19FF00FFFF00FFFF00FFFF00FF9F9F9FFF00FFFF00FFFF00FFFF00FF9F9F9F9F
          9F9FFFFFFFFF00FFFF00FFFF00FF9F9F9FFFFFFFFF00FFFF00FFFF00FF663333
          CC6600993300CC6600993300CC6600663333993300CC6600993300CC66009933
          00500019FF00FFFF00FFFF00FF9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FF9F
          9F9FFF00FFFF00FFFF00FFFF00FFFF00FF9F9F9FFFFFFFFF00FFFF00FF663333
          993300CC6600993300CC6600993300993300CC6600993300CC6600993300CC66
          00993300500019FF00FFFF00FF9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F9F9FFF00FFFF00FF663333
          CC6600CC6600CC6600CC6600CC6600CC6600CC6600CC6600CC6600CC6600CC66
          00CC6600663333FF00FFFF00FF9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FFFF
          FFFFFFFFFFFF00FFFF00FFFF00FFFF00FFFFFFFF9F9F9FFF00FFFF00FF663333
          CC6600FF9900CC6600FF9900CC6600663333FF9900CC6600FF9900CC6600FF99
          00663333FF00FFFF00FFFF00FF9F9F9FFF00FFFF00FFFF00FFFF00FFFFFFFF9F
          9F9FFFFFFFFF00FFFF00FFFF00FFFFFFFF9F9F9FFF00FFFF00FFFF00FF663333
          FF9900FF9900FF9900FF9900663333663333FF9900FF9900FF9900FF99006633
          33FF00FFFF00FFFF00FFFF00FF9F9F9FFF00FFFF00FFFF00FFFFFFFF9F9F9F9F
          9F9FFFFFFFFF00FFFF00FFFFFFFF9F9F9FFF00FFFF00FFFF00FFFF00FF663333
          FF9900FF9900FF9900663333FF00FF663333FF9900FF9900FF9900663333FF00
          FFFF00FFFF00FFFF00FFFF00FF9F9F9FFF00FFFF00FFFFFFFF9F9F9FFF00FF9F
          9F9FFFFFFFFF00FFFFFFFF9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FF663333
          FF9900FF9900663333FF00FFFF00FF663333FFE2B4FFE2B4663333FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF9F9F9FFF00FFFFFFFF9F9F9FFF00FFFF00FF9F
          9F9FFFFFFFFFFFFF9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF663333
          FFFFDE663333FF00FFFF00FFFF00FF663333FFFFDE663333FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF9F9F9FFFFFFF9F9F9FFF00FFFF00FFFF00FF9F
          9F9FFFFFFF9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF663333
          663333FF00FFFF00FFFF00FFFF00FF663333663333FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF9F9F9F9F9F9FFF00FFFF00FFFF00FFFF00FF9F
          9F9F9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Layout = blGlyphLeft
        Spacing = 4
        MouseContinuouslyDownInterval = 100
        OnClick = btnProsesClick
        ResHandle = 0
      end
      object edtMerchandName: TEdit
        Left = 165
        Top = 32
        Width = 265
        Height = 22
        Ctl3D = False
        Enabled = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 4
      end
      object edtNoBukti: TEdit
        Left = 101
        Top = 59
        Width = 265
        Height = 22
        AutoSize = False
        Ctl3D = False
        Enabled = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 5
      end
      object cbpMerchandise: TColumnComboBox
        Left = 102
        Top = 32
        Width = 61
        Height = 22
        ColCount = 2
        Ctl3D = False
        DefaultRowHeight = 24
        DropDownCount = 8
        DropDownWidth = 0
        ListColor = clWindow
        ListDefaultDrawing = True
        ListCursor = crDefault
        Options = [loColLines, loRowLines, loThumbTracking]
        RowCount = 1
        Style = csIncSrchEdit
        ParentCtl3D = False
        TabOrder = 6
        TitleColor = 4227327
        ListParentColor = False
        OnChange = cbpMerchandiseChange
        OnExit = cbpMerchandiseExit
        Cells = (
          ''
          '')
      end
      object dtmTanggal: TDateTimePicker
        Left = 102
        Top = 5
        Width = 186
        Height = 24
        Date = 39871.552991898150000000
        Time = 39871.552991898150000000
        TabOrder = 7
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 592
  end
  inline frftr5btn1: TfraFooter5Button
    Left = 0
    Top = 432
    Width = 592
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
      Width = 592
      ExplicitTop = 6
      ExplicitWidth = 592
      DesignSize = (
        592
        35)
      inherited btnClose: TsuiButton
        Left = 510
        OnClick = frftr5btn1btnCloseClick
        ExplicitLeft = 38
      end
      inherited btnAdd: TsuiButton
        Caption = 'Save'
        OnClick = frftr5btn1btnAddClick
      end
      inherited btnUpdate: TsuiButton
        Caption = 'Edit'
        OnClick = frftr5btn1btnUpdateClick
      end
      inherited btnDelete: TsuiButton
        Visible = False
      end
      inherited btnRefresh: TsuiButton
        Left = 251
        OnClick = frftr5btn1btnRefreshClick
        ExplicitLeft = 251
      end
    end
    inherited pnlSortCut: TPanel
      Width = 592
      ExplicitWidth = 120
      DesignSize = (
        592
        21)
      inherited lbl1: TLabel
        Width = 66
        Caption = 'CTRL-E [Edit]'
        ExplicitWidth = 66
      end
      inherited lbl2: TLabel
        Visible = False
      end
      inherited lbl3: TLabel
        Visible = False
      end
      inherited lbl5: TLabel
        Left = 502
        ExplicitLeft = 510
      end
    end
  end
end
