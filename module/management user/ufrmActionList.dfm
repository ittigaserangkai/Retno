inherited frmActionList: TfrmActionList
  Left = 340
  Top = 191
  Caption = 'frmActionList'
  ClientHeight = 393
  ClientWidth = 648
  OldCreateOrder = True
  ExplicitWidth = 664
  ExplicitHeight = 432
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 648
    Height = 312
    ExplicitWidth = 120
    ExplicitHeight = 267
    object pnlBodyUp: TPanel
      Left = 11
      Top = 11
      Width = 626
      Height = 78
      Align = alTop
      Color = 15198183
      TabOrder = 0
      ExplicitWidth = 98
      object opCari: TRadioGroup
        Left = 1
        Top = 1
        Width = 624
        Height = 76
        Align = alClient
        Caption = 'Pencarian'
        ItemIndex = 0
        Items.Strings = (
          'ID'
          'Name'
          'Description')
        TabOrder = 0
        ExplicitWidth = 96
      end
      object edtPencarian: TEdit
        Left = 104
        Top = 32
        Width = 201
        Height = 24
        BevelInner = bvLowered
        BevelKind = bkFlat
        BorderStyle = bsNone
        TabOrder = 1
      end
      object chkFilter: TCheckBox
        Left = 312
        Top = 35
        Width = 97
        Height = 17
        Caption = 'Active Filter'
        TabOrder = 2
      end
    end
    object strgGrid: TAdvStringGrid
      Left = 11
      Top = 89
      Width = 626
      Height = 179
      Cursor = crDefault
      Align = alClient
      ColCount = 4
      Ctl3D = True
      DefaultRowHeight = 21
      DrawingStyle = gdsClassic
      FixedCols = 0
      RowCount = 5
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goTabs, goRowSelect]
      ParentCtl3D = False
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 1
      OnGetAlignment = strgGridGetAlignment
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'Tahoma'
      ActiveCellFont.Style = [fsBold]
      Bands.Active = True
      Bands.PrimaryColor = 14935011
      CellNode.TreeColor = clSilver
      ColumnHeaders.Strings = (
        'NO'
        'ID'
        'NAME'
        'DESCRIPTION')
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
      FixedColWidth = 39
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
      Version = '5.8.0.2'
      ExplicitWidth = 98
      ExplicitHeight = 134
      ColWidths = (
        39
        57
        155
        236)
    end
    object pnlBotton: TPanel
      Left = 11
      Top = 268
      Width = 626
      Height = 33
      Align = alBottom
      Color = 15198183
      TabOrder = 2
      ExplicitTop = 223
      ExplicitWidth = 98
      DesignSize = (
        626
        33)
      object btnAuto: TsuiButton
        Left = 500
        Top = 3
        Width = 115
        Height = 27
        Cursor = crHandPoint
        Anchors = [akRight, akBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Caption = 'Auto Generate'
        AutoSize = False
        ParentFont = False
        UIStyle = BlueGlass
        TabOrder = 0
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
        OnClick = btnAutoClick
        ResHandle = 0
        ExplicitLeft = -28
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 648
    ExplicitWidth = 120
  end
  inline fraFooter5Button1: TfraFooter5Button
    Left = 0
    Top = 342
    Width = 648
    Height = 51
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitTop = -51
    ExplicitWidth = 120
    ExplicitHeight = 51
    inherited pnlFooter: TPanel
      Top = 16
      Width = 648
      ExplicitTop = 16
      ExplicitWidth = 120
      DesignSize = (
        648
        35)
      inherited btnClose: TsuiButton
        Left = 566
        ExplicitLeft = 38
      end
      inherited btnAdd: TsuiButton
        Caption = 'Add'
        OnClick = fraFooter5Button1btnAddClick
      end
      inherited btnUpdate: TsuiButton
        Caption = 'Edit'
        OnClick = fraFooter5Button1btnUpdateClick
      end
      inherited btnDelete: TsuiButton
        OnClick = fraFooter5Button1btnDeleteClick
      end
      inherited btnRefresh: TsuiButton
        OnClick = fraFooter5Button1btnRefreshClick
      end
    end
    inherited pnlSortCut: TPanel
      Width = 648
      Height = 16
      ExplicitWidth = 120
      ExplicitHeight = 16
      DesignSize = (
        648
        16)
      inherited lbl1: TLabel
        Top = -2
        ExplicitTop = -2
      end
      inherited lbl2: TLabel
        Top = -2
        ExplicitTop = -2
      end
      inherited lbl3: TLabel
        Top = -2
        ExplicitTop = -2
      end
      inherited lbl4: TLabel
        Top = -2
        ExplicitTop = -2
      end
      inherited lbl5: TLabel
        Left = 558
        Top = -2
        ExplicitLeft = 555
        ExplicitTop = -2
      end
    end
  end
end
