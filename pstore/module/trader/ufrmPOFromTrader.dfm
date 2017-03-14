inherited frmPOFromAssgros: TfrmPOFromAssgros
  Left = 287
  Top = 181
  Caption = 'PO From Trader/Assgros'
  ClientHeight = 371
  ClientWidth = 674
  OldCreateOrder = True
  ExplicitWidth = 690
  ExplicitHeight = 410
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 674
    Height = 285
    BorderWidth = 0
    ExplicitWidth = 120
    ExplicitHeight = 280
    object pnl1: TPanel
      Left = 1
      Top = 1
      Width = 672
      Height = 110
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitWidth = 118
      object lbl1: TLabel
        Left = 15
        Top = 6
        Width = 77
        Height = 16
        Caption = 'PO Trader Date'
      end
      object lbl2: TLabel
        Left = 15
        Top = 31
        Width = 70
        Height = 16
        Caption = 'PO Trader No.'
      end
      object lbl3: TLabel
        Left = 15
        Top = 81
        Width = 33
        Height = 16
        Caption = 'Trader'
      end
      object lbl4: TLabel
        Left = 464
        Top = 8
        Width = 32
        Height = 16
        Caption = 'Status'
      end
      object lbl5: TLabel
        Left = 464
        Top = 32
        Width = 50
        Height = 16
        Caption = 'Lead Time'
      end
      object lbl6: TLabel
        Left = 464
        Top = 80
        Width = 41
        Height = 16
        Caption = 'Total PO'
      end
      object lbl8: TLabel
        Left = 592
        Top = 34
        Width = 24
        Height = 16
        Caption = 'Days'
      end
      object lbl9: TLabel
        Left = 464
        Top = 56
        Width = 26
        Height = 16
        Caption = 'T.O.P'
      end
      object lbl10: TLabel
        Left = 592
        Top = 58
        Width = 24
        Height = 16
        Caption = 'Days'
      end
      object lbl11: TLabel
        Left = 17
        Top = 57
        Width = 59
        Height = 16
        Caption = 'Trader Type'
      end
      object Label1: TLabel
        Left = 312
        Top = 32
        Width = 20
        Height = 16
        Caption = '(F5)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
      end
      object edtTraderCode: TEdit
        Left = 97
        Top = 81
        Width = 64
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 2
        Text = 'AG001'
      end
      object edtTraderName: TEdit
        Left = 163
        Top = 81
        Width = 294
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 3
        Text = 'ASSGROS ASSALAM BARU'
      end
      object dtTgl: TJvDateEdit
        Left = 97
        Top = 6
        Width = 89
        Height = 22
        ButtonFlat = True
        Flat = True
        ParentFlat = False
        NumGlyphs = 2
        ShowNullDate = False
        TabOrder = 1
        OnKeyUp = dtTglKeyUp
      end
      object cbpPOTraderNo: TColumnComboBox
        Left = 193
        Top = 6
        Width = 112
        Height = 24
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
        TabOrder = 9
        TitleColor = 10150911
        Visible = False
        ListParentColor = False
        OnChange = cbpPOTraderNoChange
        OnKeyUp = cbpPOTraderNoKeyUp
        Cells = (
          ''
          '')
      end
      object edtStatus: TEdit
        Left = 528
        Top = 8
        Width = 89
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 5
        Text = 'Open'
      end
      object edtLeadTime: TEdit
        Left = 528
        Top = 32
        Width = 57
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 6
        Text = '3'
      end
      object edtTOP: TEdit
        Left = 528
        Top = 56
        Width = 57
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 7
        Text = '7'
      end
      object curredtTotalPrice: TJvValidateEdit
        Left = 528
        Top = 80
        Width = 134
        Height = 22
        Flat = True
        ParentFlat = False
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        EditText = '1'
        TabOrder = 8
      end
      object edtTraderType: TEdit
        Left = 97
        Top = 57
        Width = 208
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 4
        Text = 'ASSGROS'
      end
      object edtPOTraderNo: TEdit
        Left = 97
        Top = 32
        Width = 208
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        OnChange = edtPOTraderNoChange
        OnKeyUp = edtPOTraderNoKeyUp
      end
    end
    object pnl2: TPanel
      Left = 1
      Top = 111
      Width = 672
      Height = 173
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 2
      TabOrder = 1
      ExplicitWidth = 118
      ExplicitHeight = 168
      object strgGrid: TAdvStringGrid
        Left = 2
        Top = 2
        Width = 668
        Height = 169
        Cursor = crDefault
        Align = alClient
        ColCount = 9
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
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing, goRowSelect]
        ParentCtl3D = False
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        OnGetAlignment = strgGridGetAlignment
        OnGetFloatFormat = strgGridGetFloatFormat
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
          'PLU'
          'PRODUCT NAME'
          'UOM'
          'BARCODE'
          'QTY'
          'PRICE'
          'DISCOUNT MEMBER'
          'SUB TOTAL')
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
        ScrollWidth = 16
        SearchFooter.Font.Charset = DEFAULT_CHARSET
        SearchFooter.Font.Color = clWindowText
        SearchFooter.Font.Height = -11
        SearchFooter.Font.Name = 'Tahoma'
        SearchFooter.Font.Style = []
        SortSettings.Column = 0
        Version = '5.8.0.2'
        ExplicitWidth = 114
        ExplicitHeight = 164
        ColWidths = (
          64
          64
          64
          64
          64
          64
          69
          122
          74)
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 674
    ExplicitWidth = 120
  end
  inline fraFooter5Button1: TfraFooter5Button
    Left = 0
    Top = 315
    Width = 674
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
      Width = 674
      ExplicitWidth = 120
      inherited bvlSeparator: TBevel
        Left = 174
        ExplicitLeft = 174
      end
      inherited btnClose: TsuiButton
        Left = 592
        ExplicitLeft = 38
      end
      inherited btnAdd: TsuiButton
        OnClick = fraFooter5Button1btnAddClick
      end
      inherited btnUpdate: TsuiButton
        Left = 289
        Caption = '&Print'
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
        ExplicitLeft = 289
      end
      inherited btnDelete: TsuiButton
        Left = 91
        Caption = '&Edit'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
          000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
          00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
          F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
          0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
          FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
          FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
          0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
          00333377737FFFFF773333303300000003333337337777777333}
        OnClick = fraFooter5Button1btnDeleteClick
        ExplicitLeft = 91
      end
      inherited btnRefresh: TsuiButton
        Left = 187
        OnClick = fraFooter5Button1btnRefreshClick
        ExplicitLeft = 187
      end
    end
    inherited pnlSortCut: TPanel
      Width = 674
      ExplicitWidth = 120
      inherited lbl1: TLabel
        Left = 14
        ExplicitLeft = 14
      end
      inherited lbl2: TLabel
        Visible = False
      end
      inherited lbl3: TLabel
        Left = 282
        Width = 70
        Caption = 'CTRL-P [Print]'
        ExplicitLeft = 282
        ExplicitWidth = 70
      end
      inherited lbl4: TLabel
        Left = 183
        ExplicitLeft = 183
      end
      inherited lbl5: TLabel
        Left = 584
        ExplicitLeft = 592
      end
    end
  end
  object actlst1: TActionList
    Left = 632
    Top = 38
    object actAddPOFromAssgros: TAction
      Caption = '&Add'
      OnExecute = actAddPOFromAssgrosExecute
    end
    object actEditPOFromAssgros: TAction
      Caption = '&Edit'
      OnExecute = actEditPOFromAssgrosExecute
    end
    object actDeletePOFromAssgros: TAction
      Caption = '&Delete'
      OnExecute = actDeletePOFromAssgrosExecute
    end
    object actRefreshPOFromAssgros: TAction
      Caption = '&Refresh'
      OnExecute = actRefreshPOFromAssgrosExecute
    end
  end
end
