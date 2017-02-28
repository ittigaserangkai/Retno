inherited frmUnit: TfrmUnit
  Left = 163
  Top = 152
  Caption = 'Store Unit'
  ClientHeight = 201
  ClientWidth = 771
  OldCreateOrder = True
  ExplicitWidth = 787
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 771
    Height = 115
    BorderWidth = 2
    ExplicitWidth = 779
    ExplicitHeight = 247
    object strgGrid: TAdvStringGrid
      Left = 3
      Top = 3
      Width = 773
      Height = 241
      Cursor = crDefault
      Align = alClient
      ColCount = 8
      Ctl3D = True
      DefaultRowHeight = 21
      DrawingStyle = gdsClassic
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
        'KODE'
        'NAMA'
        'KETERANGAN'
        'ALAMAT'
        'NPWP'
        'TIPE'
        'AKTIF')
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
      FixedColWidth = 40
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
        40
        64
        111
        107
        125
        129
        115
        64)
    end
  end
  inherited pnlHeader: TPanel
    Width = 771
    ExplicitWidth = 779
  end
  inline fraFooter5Button1: TfraFooter5Button
    Left = 0
    Top = 145
    Width = 771
    Height = 56
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitTop = 277
    ExplicitWidth = 779
    inherited pnlFooter: TPanel
      Width = 779
      ExplicitWidth = 779
      inherited btnClose: TsuiButton
        Left = 697
        ExplicitLeft = 697
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
        Action = actRefreshUnit
      end
    end
    inherited pnlSortCut: TPanel
      Width = 779
      ExplicitWidth = 779
      inherited lbl5: TLabel
        Left = 689
        ExplicitLeft = 689
      end
    end
  end
  object actlstUnit: TActionList
    Left = 440
    Top = 8
    object actAddUnit: TAction
      Caption = 'Add'
      OnExecute = actAddUnitExecute
    end
    object actEditUnit: TAction
      Caption = 'Edit'
      OnExecute = actEditUnitExecute
    end
    object actDeleteUnit: TAction
      Caption = 'Delete'
      OnExecute = actDeleteUnitExecute
    end
    object actRefreshUnit: TAction
      Caption = 'Refresh'
      OnExecute = actRefreshUnitExecute
    end
  end
end
