inherited frmMemberActivation: TfrmMemberActivation
  Left = 260
  Top = 125
  BorderStyle = bsSingle
  Caption = 'Member Activation'
  ClientHeight = 482
  ClientWidth = 670
  OldCreateOrder = True
  ExplicitWidth = 676
  ExplicitHeight = 511
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 670
    Height = 396
    BorderWidth = 0
    ExplicitWidth = 670
    ExplicitHeight = 396
    object pnl1: TPanel
      Left = 1
      Top = 61
      Width = 668
      Height = 218
      Align = alClient
      BevelOuter = bvLowered
      BorderWidth = 20
      Caption = 'pnl1'
      TabOrder = 1
      DesignSize = (
        668
        218)
      object lblCheckAll: TJvLabel
        Left = 6
        Top = 3
        Width = 45
        Height = 16
        Cursor = crHandPoint
        Caption = 'Check All'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMenuHighlight
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsUnderline]
        ParentFont = False
        Transparent = True
        OnClick = lblCheckAllClick
        HotTrack = True
      end
      object lblClearAll: TJvLabel
        Left = 57
        Top = 3
        Width = 40
        Height = 16
        Cursor = crHandPoint
        Caption = 'Clear All'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMenuHighlight
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsUnderline]
        ParentFont = False
        Transparent = True
        OnClick = lblClearAllClick
        HotTrack = True
      end
      object strgGrid: TAdvStringGrid
        Left = 6
        Top = 21
        Width = 655
        Height = 190
        Cursor = crDefault
        Anchors = [akLeft, akTop, akRight, akBottom]
        ColCount = 6
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
        TabOrder = 0
        OnGetCellColor = strgGridGetCellColor
        OnGetAlignment = strgGridGetAlignment
        OnRowChanging = strgGridRowChanging
        OnCanEditCell = strgGridCanEditCell
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
        Bands.Active = True
        Bands.PrimaryColor = 14935011
        CellNode.TreeColor = clSilver
        ColumnHeaders.Strings = (
          ''
          'ID CARD NO.'
          'MEMBER NAME'
          'CARD TYPE'
          'TYPE MEMBER'
          'STATUS')
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
        FixedColWidth = 24
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
          24
          100
          175
          100
          110
          88)
      end
    end
    object pnl4: TPanel
      Left = 1
      Top = 279
      Width = 668
      Height = 116
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 2
      object lbl5: TLabel
        Left = 9
        Top = 36
        Width = 58
        Height = 16
        Caption = 'Doc. Status'
      end
      object lbl4: TLabel
        Left = 9
        Top = 90
        Width = 75
        Height = 16
        Caption = 'Valid >>    From'
      end
      object lbl3: TLabel
        Left = 9
        Top = 63
        Width = 69
        Height = 16
        Caption = 'Register Date'
      end
      object lbl14: TLabel
        Left = 369
        Top = 9
        Width = 71
        Height = 16
        Caption = 'Printed Status'
      end
      object lbl15: TLabel
        Left = 192
        Top = 90
        Width = 11
        Height = 16
        Caption = 'To'
      end
      object lbl17: TLabel
        Left = 9
        Top = 9
        Width = 75
        Height = 16
        Caption = 'Company Name'
      end
      object lbl2: TLabel
        Left = 369
        Top = 36
        Width = 87
        Height = 16
        Caption = 'Member Card Fee'
      end
      object edtDocStatus: TEdit
        Left = 96
        Top = 33
        Width = 91
        Height = 22
        Ctl3D = False
        Enabled = False
        MaxLength = 4
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
      end
      object dtValidFrom: TJvDateEdit
        Left = 96
        Top = 87
        Width = 89
        Height = 22
        ButtonFlat = True
        Flat = True
        ParentFlat = False
        NumGlyphs = 2
        ShowNullDate = False
        TabOrder = 4
      end
      object dtValidTo: TJvDateEdit
        Left = 213
        Top = 87
        Width = 89
        Height = 22
        ButtonFlat = True
        Flat = True
        ParentFlat = False
        NumGlyphs = 2
        ShowNullDate = False
        TabOrder = 5
      end
      object dtRegister: TJvDateEdit
        Left = 96
        Top = 60
        Width = 89
        Height = 22
        ButtonFlat = True
        Flat = True
        ParentFlat = False
        NumGlyphs = 2
        ReadOnly = True
        ShowNullDate = False
        TabOrder = 2
      end
      object edtPrintedStatus: TEdit
        Left = 468
        Top = 6
        Width = 109
        Height = 22
        Ctl3D = False
        Enabled = False
        MaxLength = 4
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 3
      end
      object edtCompName: TEdit
        Left = 96
        Top = 6
        Width = 206
        Height = 22
        Ctl3D = False
        Enabled = False
        MaxLength = 4
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
      end
      object edtMemberCardFee: TJvValidateEdit
        Left = 468
        Top = 33
        Width = 109
        Height = 22
        Flat = True
        ParentFlat = False
        ClipboardCommands = [caCopy]
        CriticalPoints.MaxValueIncluded = False
        CriticalPoints.MinValueIncluded = False
        ReadOnly = True
        TabOrder = 6
      end
      object mmo1: TMemo
        Left = 373
        Top = 62
        Width = 289
        Height = 47
        TabStop = False
        Alignment = taCenter
        Color = 33023
        Ctl3D = False
        Lines.Strings = (
          'Member Yang Bisa Activasi/Reactivasi Adalah Yang '
          'Statusnya Not Active')
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 7
      end
    end
    object pnl2: TPanel
      Left = 1
      Top = 1
      Width = 668
      Height = 60
      Align = alTop
      Anchors = [akTop, akRight]
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      object pnl3: TPanel
        Left = 528
        Top = 2
        Width = 138
        Height = 56
        Align = alRight
        BevelOuter = bvNone
        Color = 15198183
        TabOrder = 4
        object btnShow: TsuiButton
          Left = 41
          Top = 15
          Width = 86
          Height = 27
          Cursor = crHandPoint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Caption = 'Show'
          AutoSize = False
          ParentFont = False
          OnEnter = btnShowEnter
          OnExit = btnShowExit
          UIStyle = BlueGlass
          TabOrder = 0
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
          OnClick = btnShowClick
          ResHandle = 0
        end
      end
      object rbByMember: TRadioButton
        Left = 9
        Top = 9
        Width = 113
        Height = 17
        Caption = 'By Card Number'
        Checked = True
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 0
        TabStop = True
      end
      object rbBySelected: TRadioButton
        Left = 9
        Top = 33
        Width = 127
        Height = 17
        Caption = 'By Selected Member'
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 2
      end
      object edtCardNo: TAdvEditBtn
        Left = 144
        Top = 6
        Width = 130
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
        TabOrder = 1
        Text = '[Input Card Number]'
        Visible = True
        OnEnter = edtCardNoEnter
        OnExit = edtCardNoExit
        OnKeyPress = edtCardNoKeyPress
        Version = '1.3.2.8'
        ButtonStyle = bsButton
        ButtonWidth = 16
        Etched = False
        ButtonCaption = '...'
        OnClickBtn = edtCardNoClickBtn
      end
      object edCompany: TAdvEditBtn
        Left = 144
        Top = 30
        Width = 226
        Height = 22
        EditType = etUppercase
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
        TabOrder = 3
        Text = '[Select Company]'
        Visible = True
        OnEnter = edCompanyEnter
        OnExit = edCompanyExit
        OnKeyPress = edtCardNoKeyPress
        Version = '1.3.2.8'
        ButtonStyle = bsButton
        ButtonWidth = 16
        Etched = False
        ButtonCaption = '...'
        OnClickBtn = edCompanyClickBtn
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 670
    ExplicitWidth = 670
    inherited lblHeader: TLabel
      Width = 104
      Caption = 'Member Activation'
      ExplicitWidth = 104
    end
  end
  inline fraFooter5Button1: TfraFooter5Button
    Left = 0
    Top = 426
    Width = 670
    Height = 56
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitTop = 426
    ExplicitWidth = 670
    inherited pnlFooter: TPanel
      Width = 670
      TabOrder = 1
      ExplicitWidth = 670
      inherited bvlSeparator: TBevel
        Left = 298
        ExplicitLeft = 298
      end
      inherited btnClose: TsuiButton
        Left = 588
        TabOrder = 4
        ExplicitLeft = 588
      end
      inherited btnAdd: TsuiButton
        Width = 110
        Caption = 'Activate (F9)'
        TabOrder = 0
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
        OnClick = actMemberActivationExecute
        ExplicitWidth = 110
      end
      inherited btnUpdate: TsuiButton
        Left = 135
        Visible = False
        TabOrder = 1
        ExplicitLeft = 135
      end
      inherited btnDelete: TsuiButton
        Left = 214
        Caption = '&Delete'
        Visible = False
        TabOrder = 2
        ExplicitLeft = 214
      end
      inherited btnRefresh: TsuiButton
        Left = 315
        Caption = '&Refresh'
        Visible = False
        TabOrder = 3
        ExplicitLeft = 315
      end
    end
    inherited pnlSortCut: TPanel
      Width = 670
      TabOrder = 0
      ExplicitWidth = 670
      inherited lbl1: TLabel
        Left = 103
        Visible = False
        ExplicitLeft = 103
      end
      inherited lbl2: TLabel
        Left = 178
        Visible = False
        ExplicitLeft = 178
      end
      inherited lbl3: TLabel
        Left = 255
        Visible = False
        ExplicitLeft = 255
      end
      inherited lbl4: TLabel
        Left = 354
        Visible = False
        ExplicitLeft = 354
      end
      inherited lbl5: TLabel
        Left = 580
        ExplicitLeft = 580
      end
      inherited Label1: TLabel
        Left = 11
        Visible = True
        ExplicitLeft = 11
      end
    end
  end
  object actlst1: TActionList
    Left = 118
    object actMemberActivation: TAction
      Caption = 'actMemberActivation'
      OnExecute = actMemberActivationExecute
    end
  end
  object grdFindMember: TAdvGridFindDialog
    AutoPosition = False
    Grid = strgGrid
    MsgNotFound = 'Could not find text'
    MsgNoMoreFound = 'No more occurences of text '
    TxtCaption = 'Find text'
    TxtTextToFind = 'Text to find'
    TxtDirection = 'Direction'
    TTxtDirForward1 = 'Forward (top to bottom)'
    TTxtDirForward2 = 'Forward (left to right)'
    TTxtDirBackward1 = 'Backward (bottom to top)'
    TTxtDirBackward2 = 'Backward (right to left)'
    TxtScope = 'Scope'
    TxtScopeAllCells = 'All cells'
    TxtScopeCurrRow = 'Current row only'
    TxtScopeCurrCol = 'Current column only'
    TxtScopeSelectedCells = 'Selected cells'
    TxtOptions = 'Options'
    TxtOptionsCase = '&Case sensitive'
    TxtOptionsWholeWords = '&Whole words only'
    TxtOptionsMatchFirst = '&Match from first char'
    TxtOptionsIgnoreHTML = '&Ignore HTML tags'
    TxtOptionsFixedCells = '&Find in fixed cells'
    TxtOptionsWildcards = 'Match with &wildcards'
    TxtBtnOk = 'Ok'
    TxtBtnCancel = 'Cancel'
    Left = 395
    Top = 278
  end
end
