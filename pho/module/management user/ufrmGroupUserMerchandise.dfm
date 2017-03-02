inherited frmGroupUserMerchandise: TfrmGroupUserMerchandise
  Left = 314
  Top = 133
  Caption = 'Group User Merchandise'
  ClientHeight = 369
  ClientWidth = 523
  OldCreateOrder = True
  ExplicitWidth = 539
  ExplicitHeight = 408
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 523
    Height = 339
    BorderWidth = 0
    ExplicitWidth = 120
    ExplicitHeight = 171
    object strgGrid: TAdvStringGrid
      Left = 1
      Top = 1
      Width = 521
      Height = 277
      Cursor = crDefault
      Align = alClient
      ColCount = 7
      Ctl3D = True
      DefaultRowHeight = 21
      DrawingStyle = gdsClassic
      FixedCols = 0
      RowCount = 3
      FixedRows = 2
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
        'No'
        'ID'
        'Name'
        'Description'
        'ID'
        'Code'
        'Name')
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
      ExplicitWidth = 118
      ExplicitHeight = 109
      ColWidths = (
        64
        64
        78
        90
        64
        64
        64)
    end
    inline fraFooter5Button1: TfraFooter5Button
      Left = 1
      Top = 278
      Width = 521
      Height = 60
      Align = alBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      ExplicitLeft = 1
      ExplicitTop = 110
      ExplicitWidth = 118
      ExplicitHeight = 60
      inherited pnlFooter: TPanel
        Top = 25
        Width = 521
        ExplicitTop = 25
        ExplicitWidth = 118
        inherited btnClose: TsuiButton
          Left = 439
          ExplicitLeft = 36
        end
        inherited btnAdd: TsuiButton
          Caption = 'Add'
          Action = actAdd
        end
        inherited btnUpdate: TsuiButton
          Caption = 'Edit'
          Action = actEdit
        end
        inherited btnDelete: TsuiButton
          Action = actDelete
        end
        inherited btnRefresh: TsuiButton
          Action = actRefresh
        end
      end
      inherited pnlSortCut: TPanel
        Width = 521
        Height = 25
        ExplicitWidth = 118
        ExplicitHeight = 25
        inherited lbl1: TLabel
          Top = 7
          ExplicitTop = 7
        end
        inherited lbl2: TLabel
          Top = 7
          ExplicitTop = 7
        end
        inherited lbl3: TLabel
          Top = 7
          ExplicitTop = 7
        end
        inherited lbl4: TLabel
          Top = 7
          ExplicitTop = 7
        end
        inherited lbl5: TLabel
          Left = 440
          Top = 7
          ExplicitLeft = 459
          ExplicitTop = 7
        end
        inherited Label1: TLabel
          Top = 7
          ExplicitTop = 7
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 523
    ExplicitWidth = 120
    inherited lblHeader: TLabel
      Width = 109
      Caption = 'Group User Division'
      ExplicitWidth = 109
    end
  end
  object actlst1: TActionList
    Left = 304
    Top = 16
    object actAdd: TAction
      Caption = 'actAdd'
      OnExecute = actAddExecute
    end
    object actDelete: TAction
      Caption = 'actDelete'
      OnExecute = actDeleteExecute
    end
    object actEdit: TAction
      Caption = 'actEdit'
      OnExecute = actEditExecute
    end
    object actRefresh: TAction
      Caption = 'actRefresh'
      OnExecute = actRefreshExecute
    end
  end
end
