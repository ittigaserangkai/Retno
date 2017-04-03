inherited frmDOForTrader: TfrmDOForTrader
  Left = 289
  Top = 80
  Caption = 'DO For Assgros'
  ClientHeight = 445
  ClientWidth = 675
  OldCreateOrder = True
  ExplicitWidth = 691
  ExplicitHeight = 484
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 675
    Height = 359
    BevelInner = bvLowered
    BevelOuter = bvSpace
    BorderWidth = 0
    ExplicitWidth = 675
    ExplicitHeight = 359
    object Panel1: TPanel
      Left = 2
      Top = 2
      Width = 671
      Height = 68
      Align = alTop
      Color = 15198183
      TabOrder = 0
      object lbl1: TLabel
        Left = 14
        Top = 7
        Width = 81
        Height = 16
        Caption = 'Date of Delivery'
      end
      object lblPilih: TLabel
        Left = 12
        Top = 37
        Width = 43
        Height = 16
        Caption = 'Options:'
      end
      object Label1: TLabel
        Left = 199
        Top = 10
        Width = 11
        Height = 16
        Caption = 'To'
      end
      object dtTgl1: TcxDateEdit
        Left = 104
        Top = 6
        Width = 89
        Height = 22
        ButtonFlat = True
        Flat = True
        ParentFlat = False
        NumGlyphs = 2
        ShowNullDate = False
        TabOrder = 0
        OnKeyUp = dtTgl1KeyUp
      end
      object dtTgl2: TcxDateEdit
        Left = 217
        Top = 6
        Width = 89
        Height = 22
        ButtonFlat = True
        Flat = True
        ParentFlat = False
        NumGlyphs = 2
        ShowNullDate = False
        TabOrder = 1
        OnKeyUp = dtTgl1KeyUp
      end
      object cbPilih: TComboBox
        Left = 104
        Top = 32
        Width = 140
        Height = 24
        BevelKind = bkSoft
        Style = csDropDownList
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 2
        OnChange = cbPilihChange
      end
      object btnShow: TcxButton
        Left = 256
        Top = 30
        Width = 49
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
        TabOrder = 3
        Transparent = True
        ModalResult = 0
        FocusedRectMargin = 2
        Layout = blGlyphLeft
        Spacing = 4
        MouseContinuouslyDownInterval = 100
        OnClick = btnShowClick
      end
      object btnShowReport: TcxButton
        Left = 312
        Top = 30
        Width = 153
        Height = 27
        Cursor = crHandPoint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Caption = 'Print Report DO Assgros'
        AutoSize = False
        Visible = False
        ParentFont = False
        OnEnter = btnShowReportEnter
        OnExit = btnShowReportExit
        UIStyle = BlueGlass
        TabOrder = 4
        Transparent = True
        ModalResult = 0
        FocusedRectMargin = 2
        Layout = blGlyphLeft
        Spacing = 4
        MouseContinuouslyDownInterval = 100
        OnClick = btnShowReportClick
      end
      object btnPrintDOwoDisc: TcxButton
        Left = 472
        Top = 30
        Width = 129
        Height = 27
        Cursor = crHandPoint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Caption = 'Print w/o Disc Member'
        AutoSize = False
        Visible = False
        ParentFont = False
        OnEnter = btnPrintDOwoDiscEnter
        OnExit = btnPrintDOwoDiscExit
        UIStyle = BlueGlass
        TabOrder = 5
        Transparent = True
        ModalResult = 0
        FocusedRectMargin = 2
        Layout = blGlyphLeft
        Spacing = 4
        MouseContinuouslyDownInterval = 100
        OnClick = btnPrintDOwoDiscClick
      end
    end
    object Panel2: TPanel
      Left = 2
      Top = 70
      Width = 671
      Height = 287
      Align = alClient
      BorderWidth = 10
      Caption = 'Panel2'
      TabOrder = 1
      object strgGrid: TAdvStringGrid
        Left = 11
        Top = 11
        Width = 426
        Height = 265
        Cursor = crDefault
        Align = alClient
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
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goRowSelect]
        ParentCtl3D = False
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        OnKeyDown = strgGridKeyDown
        HoverRowCells = [hcNormal, hcSelected]
        OnGetAlignment = strgGridGetAlignment
        OnCanEditCell = strgGridCanEditCell
        OnGetFloatFormat = strgGridGetFloatFormat
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
        Bands.Active = True
        Bands.PrimaryColor = 14935011
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
        FilterEdit.TypeNames.Strings = (
          'Starts with'
          'Ends with'
          'Contains'
          'Not contains'
          'Equal'
          'Not equal'
          'Larger than'
          'Smaller than'
          'Clear')
        FixedFont.Charset = DEFAULT_CHARSET
        FixedFont.Color = clWindowText
        FixedFont.Height = -11
        FixedFont.Name = 'Tahoma'
        FixedFont.Style = [fsBold]
        FloatFormat = '%.2f'
        HoverButtons.Buttons = <>
        HoverButtons.Position = hbLeftFromColumnLeft
        HTMLSettings.ImageFolder = 'images'
        HTMLSettings.ImageBaseName = 'img'
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
        SortSettings.DefaultFormat = ssAutomatic
        SortSettings.Column = 0
        Version = '8.1.3.0'
        ColWidths = (
          64
          64
          64
          64
          64)
        RowHeights = (
          21
          21)
      end
      object pnlBayar: TPanel
        Left = 437
        Top = 11
        Width = 223
        Height = 265
        Align = alRight
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Color = 15198183
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        Visible = False
        object Label2: TLabel
          Left = 12
          Top = 45
          Width = 25
          Height = 16
          Caption = 'Kasir'
        end
        object Label3: TLabel
          Left = 12
          Top = 69
          Width = 63
          Height = 16
          Caption = 'No Transaksi'
        end
        object Label4: TLabel
          Left = 12
          Top = 93
          Width = 24
          Height = 16
          Caption = 'Cash'
        end
        object Label5: TLabel
          Left = 12
          Top = 117
          Width = 32
          Height = 16
          Caption = 'Credit'
        end
        object Label6: TLabel
          Left = 12
          Top = 141
          Width = 56
          Height = 16
          Caption = 'Cara Bayar'
        end
        object Label7: TLabel
          Left = 12
          Top = 165
          Width = 44
          Height = 16
          Caption = 'No Kartu'
        end
        object Label8: TLabel
          Left = 12
          Top = 189
          Width = 62
          Height = 16
          Caption = 'No Otorisasi'
        end
        object Label9: TLabel
          Left = 12
          Top = 13
          Width = 35
          Height = 16
          Caption = 'No. DO'
        end
        object btnPrintReal: TcxButton
          Left = 32
          Top = 212
          Width = 65
          Height = 27
          Cursor = crHandPoint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Caption = 'Cetak'
          AutoSize = False
          ParentFont = False
          OnEnter = btnPrintRealEnter
          OnExit = btnPrintRealExit
          UIStyle = BlueGlass
          TabOrder = 4
          Transparent = True
          ModalResult = 0
          FocusedRectMargin = 2
          Layout = blGlyphLeft
          Spacing = 4
          MouseContinuouslyDownInterval = 100
          OnClick = btnPrintRealClick
        end
        object edtNoTransaksi: TEdit
          Left = 80
          Top = 65
          Width = 125
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 7
        end
        object edtNoKartu: TEdit
          Left = 80
          Top = 161
          Width = 125
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 2
          OnKeyUp = edtNoKartuKeyUp
        end
        object edtNoOtorisasi: TEdit
          Left = 80
          Top = 185
          Width = 125
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 3
          OnKeyUp = edtNoOtorisasiKeyUp
        end
        object cbpKasir: TcxExtLookupComboBox
          Left = 80
          Top = 40
          Width = 125
          Height = 24
          Color = clWindow
          Version = '1.5.0.1'
          Visible = True
          Ctl3D = False
          Columns = <>
          ComboItems = <>
          EditColumn = -1
          EditHeight = 18
          EmptyText = ''
          EmptyTextStyle = []
          DropWidth = 0
          DropHeight = 200
          Enabled = True
          GridLines = False
          ItemIndex = -1
          LookupColumn = 0
          LabelCaption = ''
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'Tahoma'
          LabelFont.Style = []
          ParentCtl3D = False
          SortColumn = 0
          TabOrder = 0
          OnChange = cbpKasirChange
          OnKeyUp = cbpKasirKeyUp
        end
        object cbpCredit: TcxExtLookupComboBox
          Left = 80
          Top = 136
          Width = 125
          Height = 24
          Color = clWindow
          Version = '1.5.0.1'
          Visible = True
          Ctl3D = False
          Columns = <>
          ComboItems = <>
          EditColumn = -1
          EditHeight = 18
          EmptyText = ''
          EmptyTextStyle = []
          DropWidth = 0
          DropHeight = 200
          Enabled = True
          GridLines = False
          ItemIndex = -1
          LookupColumn = 0
          LabelCaption = ''
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'Tahoma'
          LabelFont.Style = []
          ParentCtl3D = False
          SortColumn = 0
          TabOrder = 1
          OnChange = cbpCreditChange
          OnKeyUp = cbpCreditKeyUp
        end
        object btnBatal: TcxButton
          Left = 120
          Top = 212
          Width = 65
          Height = 27
          Cursor = crHandPoint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Caption = 'Batal'
          AutoSize = False
          ParentFont = False
          OnEnter = btnBatalEnter
          OnExit = btnBatalExit
          UIStyle = BlueGlass
          TabOrder = 5
          Transparent = True
          ModalResult = 0
          FocusedRectMargin = 2
          Layout = blGlyphLeft
          Spacing = 4
          MouseContinuouslyDownInterval = 100
          OnClick = btnBatalClick
        end
        object edtNoDO: TEdit
          Left = 80
          Top = 9
          Width = 125
          Height = 22
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 6
        end
        object currCash: TcxCurrencyEdit
          Left = 81
          Top = 89
          Width = 121
          Height = 22
          Flat = True
          ParentFlat = False
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          TabOrder = 8
        end
        object currCredit: TcxCurrencyEdit
          Left = 81
          Top = 113
          Width = 121
          Height = 22
          Flat = True
          ParentFlat = False
          CriticalPoints.MaxValueIncluded = False
          CriticalPoints.MinValueIncluded = False
          TabOrder = 9
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 675
    ExplicitWidth = 675
    inherited lblHeader: TLabel
      Height = 18
    end
  end
  inline fraFooter5Button1: TfraFooter5Button
    Left = 0
    Top = 389
    Width = 675
    Height = 56
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitTop = 389
    ExplicitWidth = 675
    inherited pnlFooter: TPanel
      Width = 675
      ExplicitWidth = 675
      inherited bvlSeparator: TBevel
        Left = 154
        ExplicitLeft = 154
      end
      inherited btnClose: TcxButton
        Left = 593
        ExplicitLeft = 593
      end
      inherited btnAdd: TcxButton
        Width = 134
        Caption = 'Create DO Assgros'
        OnEnter = fraFooter5Button1btnAddEnter
        OnClick = fraFooter5Button1btnAddClick
        ExplicitWidth = 134
      end
      inherited btnUpdate: TcxButton
        Left = 166
        Caption = 'Detil'
        OnEnter = fraFooter5Button1btnUpdateEnter
        OnClick = fraFooter5Button1btnUpdateClick
        ExplicitLeft = 166
      end
      inherited btnDelete: TcxButton
        Left = 333
        Width = 108
        Caption = '&Realiasasi DO'
        OptionsImage.Glyph.Data = {
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
        OnClick = fraFooter5Button1btnDeleteClick
        ExplicitLeft = 333
        ExplicitWidth = 108
      end
      inherited btnRefresh: TcxButton
        Left = 248
        Caption = '&Edit'
        OptionsImage.Glyph.Data = {
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
        OnEnter = fraFooter5Button1btnRefreshEnter
        OnClick = fraFooter5Button1btnRefreshClick
        ExplicitLeft = 248
      end
    end
    inherited pnlSortCut: TPanel
      Width = 675
      ExplicitWidth = 675
      inherited lbl1: TLabel
        Left = 444
        Width = 140
        Caption = 'CTRL-C [Create DO Assgros]'
        ExplicitLeft = 444
        ExplicitWidth = 140
      end
      inherited lbl2: TLabel
        Left = 158
        Width = 70
        Caption = 'CTRL-D [Detil]'
        ExplicitLeft = 158
        ExplicitWidth = 70
      end
      inherited lbl3: TLabel
        Left = 323
        Width = 106
        Caption = 'CTRL-R [Realisasi DO]'
        ExplicitLeft = 323
        ExplicitWidth = 106
      end
      inherited lbl4: TLabel
        Left = 243
        Width = 66
        Caption = 'CTRL-E [Edit]'
        ExplicitLeft = 243
        ExplicitWidth = 66
      end
      inherited lbl5: TLabel
        Left = 585
        ExplicitLeft = 593
      end
    end
  end
  object actlstDOForTrader: TActionList
    Left = 498
    Top = 36
    object actCreateDOTrader: TAction
      Caption = 'actCreateDOTrader'
      OnExecute = actCreateDOTraderExecute
    end
    object actDetilPOTrader: TAction
      Caption = 'actDetilPOTrader'
      OnExecute = actDetilPOTraderExecute
    end
    object actDeleteDOTrader: TAction
      Caption = 'actDeleteDOTrader'
    end
  end
end
