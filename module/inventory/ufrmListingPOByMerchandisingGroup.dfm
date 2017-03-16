inherited frmListingPOByMerchandisingGroup: TfrmListingPOByMerchandisingGroup
  Left = 400
  Top = 203
  Width = 579
  Height = 440
  Caption = 'Listing Purchase Order By Merchandising Group'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 571
    Height = 327
    BorderWidth = 0
    object Label2: TLabel
      Left = 16
      Top = 19
      Width = 41
      Height = 16
      Caption = 'PO Date'
    end
    object Label3: TLabel
      Left = 200
      Top = 19
      Width = 12
      Height = 16
      Caption = 'To'
    end
    object Label1: TLabel
      Left = 16
      Top = 51
      Width = 32
      Height = 16
      Caption = 'Status'
    end
    object Label4: TLabel
      Left = 16
      Top = 83
      Width = 39
      Height = 16
      Caption = 'Division'
    end
    object dtp1: TDateTimePicker
      Left = 96
      Top = 17
      Width = 97
      Height = 24
      Date = 39391.525717592600000000
      Time = 39391.525717592600000000
      TabOrder = 0
    end
    object dtp2: TDateTimePicker
      Left = 219
      Top = 17
      Width = 97
      Height = 24
      Date = 39391.525717592600000000
      Time = 39391.525717592600000000
      TabOrder = 1
    end
    object btnPrint: TsuiButton
      Left = 12
      Top = 120
      Width = 80
      Height = 30
      Cursor = crHandPoint
      Caption = 'Print'
      AutoSize = False
      OnEnter = btnPrintEnter
      OnExit = btnPrintExit
      UIStyle = BlueGlass
      TabOrder = 6
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
      OnClick = btnPrintClick
      ResHandle = 0
    end
    object cbpStatusPO: TColumnComboBox
      Left = 96
      Top = 50
      Width = 125
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
      TabOrder = 2
      TitleColor = 4227327
      ListParentColor = False
      OnChange = cbpStatusPOChange
      Cells = (
        ''
        '')
    end
    object cbpMerchGroup: TColumnComboBox
      Left = 96
      Top = 82
      Width = 125
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
      TabOrder = 4
      TitleColor = 4227327
      ListParentColor = False
      OnChange = cbpMerchGroupChange
      Cells = (
        ''
        '')
    end
    object edtStatusPO: TEdit
      Left = 234
      Top = 50
      Width = 223
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 3
    end
    object edtMerchGroup: TEdit
      Left = 234
      Top = 82
      Width = 223
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 5
    end
  end
  inherited pnlHeader: TPanel
    Width = 571
    inherited lblHeader: TLabel
      Width = 288
      Caption = 'LISTING PURCHASE ORDER BY MERCHANDISING GROUP'
    end
  end
  inline footer1: TfraFooter5Button
    Left = 0
    Top = 357
    Width = 571
    Height = 56
    Align = alBottom
    AutoScroll = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    inherited pnlFooter: TPanel
      Width = 571
      inherited btnClose: TsuiButton
        Left = 489
      end
      inherited btnAdd: TsuiButton
        Visible = False
      end
      inherited btnUpdate: TsuiButton
        Visible = False
      end
      inherited btnDelete: TsuiButton
        Visible = False
      end
      inherited btnRefresh: TsuiButton
        Visible = False
        OnClick = footer1btnRefreshClick
      end
    end
    inherited pnlSortCut: TPanel
      Width = 571
      inherited lbl1: TLabel
        Visible = False
      end
      inherited lbl2: TLabel
        Visible = False
      end
      inherited lbl3: TLabel
        Visible = False
      end
      inherited lbl4: TLabel
        Visible = False
      end
      inherited lbl5: TLabel
        Left = 481
      end
    end
  end
end
