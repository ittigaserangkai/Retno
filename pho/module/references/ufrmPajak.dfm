inherited frmPajak: TfrmPajak
  Left = 261
  Top = 178
  Caption = 'Tax'
  ClientHeight = 314
  ClientWidth = 532
  OldCreateOrder = True
  ExplicitWidth = 548
  ExplicitHeight = 353
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 532
    Height = 228
    ExplicitHeight = 226
    object strgGrid: TAdvStringGrid
      Left = 11
      Top = 11
      Width = 510
      Height = 206
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
      OnSelectCell = strgGridSelectCell
      HoverRowCells = [hcNormal, hcSelected]
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
      ExplicitWidth = 98
      ExplicitHeight = 204
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
  end
  inherited pnlHeader: TPanel
    Width = 532
  end
  inline fraFooter5Button1: TfraFooter5Button
    Left = 0
    Top = 258
    Width = 532
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
      Width = 532
      ExplicitWidth = 120
      inherited btnClose: TcxButton
        Left = 450
        ExplicitLeft = 38
      end
      inherited btnAdd: TcxButton
        Action = actAddPajak
      end
      inherited btnUpdate: TcxButton
        Action = actEditPajak
      end
      inherited btnDelete: TcxButton
        Action = actDeletePajak
      end
      inherited btnRefresh: TcxButton
        Action = actRefreshPajak
      end
    end
    inherited pnlSortCut: TPanel
      Width = 532
      ExplicitWidth = 120
      inherited lbl5: TLabel
        Left = 442
        ExplicitLeft = 452
      end
    end
  end
  object actlstPajak: TActionList
    Left = 440
    Top = 8
    object actAddPajak: TAction
      Caption = 'Add'
      OnExecute = actAddPajakExecute
    end
    object actEditPajak: TAction
      Caption = 'Edit'
      OnExecute = actEditPajakExecute
    end
    object actDeletePajak: TAction
      Caption = 'Delete'
      OnExecute = actDeletePajakExecute
    end
    object actRefreshPajak: TAction
      Caption = 'Refresh'
      OnExecute = actRefreshPajakExecute
    end
  end
end
