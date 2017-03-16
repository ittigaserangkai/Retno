inherited frmKuponBotol: TfrmKuponBotol
  Left = 251
  Top = 192
  Caption = 'TRANSAKSI KUPON BOTOL'
  ClientHeight = 466
  ClientWidth = 752
  KeyPreview = True
  OldCreateOrder = True
  ExplicitWidth = 768
  ExplicitHeight = 505
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 752
    Height = 380
    ExplicitHeight = 380
    object pnl1: TPanel
      Left = 11
      Top = 11
      Width = 730
      Height = 122
      Align = alTop
      ParentColor = True
      TabOrder = 0
      object lblComboGrid: TLabel
        Left = 6
        Top = 63
        Width = 67
        Height = 16
        Caption = 'Member Code'
      end
      object lbl13: TLabel
        Left = 384
        Top = 39
        Width = 32
        Height = 16
        Caption = 'Status'
      end
      object lbl1: TLabel
        Left = 6
        Top = 15
        Width = 24
        Height = 16
        Caption = 'Date'
      end
      object lbl3: TLabel
        Left = 6
        Top = 39
        Width = 57
        Height = 16
        Caption = 'Voucher No'
      end
      object lbl4: TLabel
        Left = 384
        Top = 63
        Width = 58
        Height = 16
        Caption = 'Description'
      end
      object lbl5: TLabel
        Left = 6
        Top = 87
        Width = 69
        Height = 16
        Caption = 'Member Name'
      end
      object lbl2: TLabel
        Left = 384
        Top = 15
        Width = 73
        Height = 16
        Caption = 'POS Trans. No.'
      end
      object edtMemberName: TEdit
        Left = 96
        Top = 81
        Width = 265
        Height = 22
        Ctl3D = False
        Enabled = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
      end
      object edtKodeMember: TEdit
        Left = 96
        Top = 57
        Width = 136
        Height = 22
        Ctl3D = False
        Enabled = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
      end
      object edtStatus: TEdit
        Left = 471
        Top = 33
        Width = 106
        Height = 22
        Ctl3D = False
        Enabled = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 2
      end
      object edtKeterangan: TEdit
        Left = 471
        Top = 57
        Width = 256
        Height = 22
        Ctl3D = False
        Enabled = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 3
      end
      object dtpTanggal: TJvDateEdit
        Left = 96
        Top = 9
        Width = 103
        Height = 22
        ButtonFlat = True
        Flat = True
        ParentFlat = False
        NumGlyphs = 2
        ShowNullDate = False
        TabOrder = 4
        OnKeyPress = dtpTanggalKeyPress
      end
      object edtPOSTransNo: TEdit
        Left = 471
        Top = 9
        Width = 106
        Height = 22
        Ctl3D = False
        Enabled = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 5
      end
      object edTransactionNo: TAdvEditBtn
        Left = 96
        Top = 33
        Width = 136
        Height = 22
        Flat = False
        FocusColor = clWindow
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'MS Sans Serif'
        LabelFont.Style = []
        Lookup.Separator = ';'
        Color = clWindow
        Ctl3D = False
        Enabled = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clSilver
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsItalic]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = False
        TabOrder = 6
        Text = '[Input Voucher No.]'
        Visible = True
        OnEnter = edTransactionNoEnter
        OnExit = edTransactionNoExit
        Version = '1.3.2.8'
        ButtonStyle = bsButton
        ButtonWidth = 16
        Etched = False
        ButtonCaption = '...'
        OnClickBtn = edTransactionNoClickBtn
      end
    end
    object strgGrid: TAdvStringGrid
      Left = 11
      Top = 133
      Width = 730
      Height = 195
      Cursor = crDefault
      Align = alClient
      ColCount = 8
      Ctl3D = True
      DefaultRowHeight = 21
      DrawingStyle = gdsClassic
      FixedCols = 0
      RowCount = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing]
      ParentCtl3D = False
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 1
      OnGetAlignment = strgGridGetAlignment
      OnGetFloatFormat = strgGridGetFloatFormat
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'Tahoma'
      ActiveCellFont.Style = [fsBold]
      AutoSize = True
      Bands.Active = True
      Bands.PrimaryColor = 14935011
      CellNode.TreeColor = clSilver
      ColumnHeaders.Strings = (
        'PLU'
        'PRODUCT NAME'
        'UOM'
        'QTY'
        'SELL PRICE'
        'DISC'
        'SELL PRICE DISC'
        'TOTAL')
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
      FixedColWidth = 33
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
      ColWidths = (
        33
        99
        38
        34
        73
        39
        103
        48)
    end
    object pnl2: TPanel
      Left = 11
      Top = 328
      Width = 730
      Height = 41
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 2
      object lbl6: TLabel
        Left = 408
        Top = 7
        Width = 95
        Height = 19
        Caption = 'Total Price:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn2: TsuiButton
        Left = 7
        Top = 6
        Width = 125
        Height = 27
        Cursor = crHandPoint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Caption = 'Print (CTRL-P)'
        AutoSize = False
        ParentFont = False
        OnEnter = btn2Enter
        OnExit = btn2Exit
        UIStyle = BlueGlass
        TabOrder = 0
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
        OnClick = actPrintKuponBotolExecute
        ResHandle = 0
      end
      object curredtTotalPrice: TJvValidateEdit
        Left = 512
        Top = 7
        Width = 217
        Height = 25
        Flat = True
        ParentFlat = False
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 752
    inherited lblHeader: TLabel
      Width = 140
      Caption = 'TRANSAKSI KUPON BOTOL'
      ExplicitWidth = 140
    end
  end
  inline fraFooter5Button1: TfraFooter5Button
    Left = 0
    Top = 410
    Width = 752
    Height = 56
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitTop = 410
    ExplicitWidth = 752
    inherited pnlFooter: TPanel
      Width = 752
      ExplicitWidth = 752
      inherited bvlSeparator: TBevel
        Left = 258
        ExplicitLeft = 258
      end
      inherited btnClose: TsuiButton
        Left = 670
        ExplicitLeft = 670
      end
      inherited btnAdd: TsuiButton
        Caption = '&Add'
        Action = actAddKuponBotol
      end
      inherited btnUpdate: TsuiButton
        Action = actEditKuponBotol
      end
      inherited btnDelete: TsuiButton
        Left = 172
        Action = actDeleteKuponBotol
        ExplicitLeft = 172
      end
      inherited btnRefresh: TsuiButton
        Left = 272
        Action = actRefreshKuponBotol
        ExplicitLeft = 272
      end
    end
    inherited pnlSortCut: TPanel
      Width = 752
      ExplicitWidth = 752
      inherited lbl5: TLabel
        Left = 662
        ExplicitLeft = 670
      end
    end
  end
  object actlst1: TActionList
    Left = 716
    Top = 49
    object actPrintKuponBotol: TAction
      Caption = '&Print'
      OnExecute = actPrintKuponBotolExecute
    end
    object actDeleteKuponBotol: TAction
      Caption = 'Delete'
      OnExecute = actDeleteKuponBotolExecute
    end
    object actRefreshKuponBotol: TAction
      Caption = 'Refresh'
      OnExecute = actRefreshKuponBotolExecute
    end
    object actAddKuponBotol: TAction
      Caption = '&Add'
      OnExecute = actAddKuponBotolExecute
    end
    object actEditKuponBotol: TAction
      Caption = '&Edit'
      OnExecute = actEditKuponBotolExecute
    end
    object actAfterPrintKuponBotol: TAction
      Caption = 'actAfterPrintKuponBotol'
      OnExecute = actAfterPrintKuponBotolExecute
    end
  end
end
