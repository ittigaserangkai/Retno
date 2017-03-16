inherited frmGenerateVoucher: TfrmGenerateVoucher
  Left = 162
  Top = 129
  Caption = 'frmGenerateVoucher'
  ClientHeight = 432
  ClientWidth = 698
  OldCreateOrder = True
  ExplicitWidth = 714
  ExplicitHeight = 471
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 698
    Height = 346
    ExplicitWidth = 120
    ExplicitHeight = 328
    object pnl1: TPanel
      Left = 11
      Top = 11
      Width = 676
      Height = 150
      Align = alTop
      BorderWidth = 5
      ParentColor = True
      TabOrder = 0
      ExplicitWidth = 98
      object strgAgreement: TAdvStringGrid
        Left = 6
        Top = 6
        Width = 664
        Height = 138
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
        OnGetAlignment = strgAgreementGetAlignment
        OnRowChanging = strgAgreementRowChanging
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
      end
    end
    object pnl2: TPanel
      Left = 11
      Top = 161
      Width = 676
      Height = 174
      Align = alClient
      BorderWidth = 5
      ParentColor = True
      TabOrder = 1
      ExplicitWidth = 98
      ExplicitHeight = 156
      object strgVoucher: TAdvStringGrid
        Left = 6
        Top = 6
        Width = 664
        Height = 162
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
        OnGetAlignment = strgVoucherGetAlignment
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
        ExplicitHeight = 143
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 698
    ExplicitWidth = 120
  end
  inline fraFooter5Button1: TfraFooter5Button
    Left = 0
    Top = 376
    Width = 698
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
      Width = 698
      ExplicitWidth = 120
      inherited bvlSeparator: TBevel
        Left = 260
        ExplicitLeft = 260
      end
      inherited btnDelete: TsuiButton [1]
        Left = 94
        Action = actDeletelGenerateVoucher
        ExplicitLeft = 94
      end
      inherited btnClose: TsuiButton [2]
        Left = 616
        ExplicitLeft = 38
      end
      inherited btnAdd: TsuiButton [3]
        Caption = 'Add'
        Action = actAddGenerateVoucher
      end
      inherited btnUpdate: TsuiButton [4]
        Left = 181
        Caption = 'Detail'
        Action = actDetailGenerateVoucher
        ExplicitLeft = 181
      end
      inherited btnRefresh: TsuiButton
        Left = 272
        Action = actRefreshlGenerateVoucher
        ExplicitLeft = 272
      end
    end
    inherited pnlSortCut: TPanel
      Width = 698
      ExplicitWidth = 120
      inherited lbl3: TLabel [0]
        Left = 87
        ExplicitLeft = 87
      end
      inherited lbl1: TLabel [1]
      end
      inherited lbl2: TLabel [2]
        Left = 179
        Width = 75
        Caption = 'CTRL-E [Detail]'
        ExplicitLeft = 179
        ExplicitWidth = 75
      end
      inherited lbl5: TLabel
        Left = 608
        ExplicitLeft = 616
      end
    end
  end
  object actlstInputSupplierForNotSO: TActionList
    Left = 600
    Top = 30
    object actAddGenerateVoucher: TAction
      Caption = 'Add'
      OnExecute = actAddGenerateVoucherExecute
    end
    object actDetailGenerateVoucher: TAction
      Caption = 'Detail'
      OnExecute = actDetailGenerateVoucherExecute
    end
    object actDeletelGenerateVoucher: TAction
      Caption = 'Delete'
      OnExecute = actDeletelGenerateVoucherExecute
    end
    object actRefreshlGenerateVoucher: TAction
      Caption = 'Refresh'
      OnExecute = actRefreshlGenerateVoucherExecute
    end
  end
end
