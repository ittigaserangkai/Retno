inherited frmSysParm: TfrmSysParm
  Left = 269
  Top = 109
  Caption = 'System Parameter'
  ClientHeight = 477
  ClientWidth = 627
  OldCreateOrder = True
  ExplicitWidth = 643
  ExplicitHeight = 516
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 627
    Height = 393
    ExplicitWidth = 120
    ExplicitHeight = 385
    object pnlMain: TPanel
      Left = 11
      Top = 89
      Width = 605
      Height = 293
      Align = alClient
      BorderWidth = 10
      Color = 15198183
      TabOrder = 0
      ExplicitWidth = 98
      ExplicitHeight = 285
      object strgGrid: TAdvStringGrid
        Left = 11
        Top = 11
        Width = 583
        Height = 271
        Cursor = crDefault
        Align = alClient
        ColCount = 6
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
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goRowSelect]
        ParentCtl3D = False
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        OnGetAlignment = strgGridGetAlignment
        OnRowChanging = strgGridRowChanging
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
        ExplicitWidth = 76
        ExplicitHeight = 263
      end
    end
    object pnlTop: TPanel
      Left = 11
      Top = 11
      Width = 605
      Height = 78
      Align = alTop
      Color = 15198183
      TabOrder = 1
      ExplicitWidth = 98
      object btnShow: TsuiButton
        Left = 270
        Top = 46
        Width = 72
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
      object grp1: TGroupBox
        Left = 1
        Top = 1
        Width = 265
        Height = 73
        Caption = 'Pencarian'
        TabOrder = 1
        object edtSearchKode: TEdit
          Left = 72
          Top = 21
          Width = 161
          Height = 20
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          TabOrder = 2
        end
        object edtSearchNama: TEdit
          Left = 72
          Top = 45
          Width = 161
          Height = 20
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          TabOrder = 3
        end
        object chkKode: TCheckBox
          Left = 16
          Top = 23
          Width = 41
          Height = 17
          Caption = 'Kode'
          TabOrder = 0
        end
        object chkNama: TCheckBox
          Left = 16
          Top = 47
          Width = 49
          Height = 17
          Caption = 'Nama'
          TabOrder = 1
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 627
    ExplicitWidth = 120
    inherited lblHeader: TLabel
      Width = 112
      Caption = 'SYSTEM PARAMETER'
      ExplicitWidth = 112
    end
  end
  inline fraFooter5Button1: TfraFooter5Button
    Left = 0
    Top = 423
    Width = 627
    Height = 54
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitTop = -54
    ExplicitWidth = 120
    ExplicitHeight = 54
    inherited pnlFooter: TPanel
      Top = 19
      Width = 627
      ExplicitTop = 19
      ExplicitWidth = 120
      inherited btnClose: TsuiButton
        Left = 545
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
      Width = 627
      Height = 19
      ExplicitWidth = 120
      ExplicitHeight = 19
      inherited lbl1: TLabel
        Top = 1
        ExplicitTop = 1
      end
      inherited lbl2: TLabel
        Top = 1
        Caption = 'CTRL-E (Edit)'
        ExplicitTop = 1
      end
      inherited lbl3: TLabel
        Top = 1
        Visible = False
        ExplicitTop = 1
      end
      inherited lbl4: TLabel
        Top = 1
        ExplicitTop = 1
      end
      inherited lbl5: TLabel
        Left = 537
        Top = 1
        ExplicitLeft = 547
        ExplicitTop = 1
      end
    end
  end
end
