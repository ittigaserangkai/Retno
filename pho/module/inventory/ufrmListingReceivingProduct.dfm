inherited frmListingReceivingProduct: TfrmListingReceivingProduct
  Left = 241
  Top = 206
  Width = 672
  Height = 217
  Caption = 'Listing Receiving Product'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 664
    Height = 92
    BorderWidth = 0
    object pnlTop: TPanel
      Left = 1
      Top = 1
      Width = 662
      Height = 96
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      DesignSize = (
        662
        96)
      object lbl3: TLabel
        Left = 16
        Top = 10
        Width = 52
        Height = 16
        Caption = 'Date From'
      end
      object lbl4: TLabel
        Left = 15
        Top = 36
        Width = 67
        Height = 16
        Caption = 'Supplier Code'
      end
      object lbl5: TLabel
        Left = 238
        Top = 10
        Width = 12
        Height = 16
        Caption = 'To'
      end
      object lbl2: TLabel
        Left = 15
        Top = 65
        Width = 81
        Height = 16
        Caption = 'Supplier Address'
      end
      object btnShowRP: TsuiButton
        Left = 472
        Top = 60
        Width = 85
        Height = 27
        Cursor = crHandPoint
        Caption = 'Show'
        AutoSize = False
        Visible = False
        OnEnter = btnShowRPEnter
        OnExit = btnShowRPExit
        UIStyle = BlueGlass
        TabOrder = 6
        Transparent = True
        ModalResult = 0
        FocusedRectMargin = 2
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
        Layout = blGlyphLeft
        Spacing = 4
        MouseContinuouslyDownInterval = 100
        OnClick = btnShowRPClick
        ResHandle = 0
      end
      object dtTglFrom: TJvDateEdit
        Left = 107
        Top = 8
        Width = 121
        Height = 22
        ButtonFlat = False
        Ctl3D = False
        NumGlyphs = 2
        ParentCtl3D = False
        TabOrder = 0
        OnKeyPress = dtTglFromKeyPress
      end
      object dtTglTo: TJvDateEdit
        Left = 257
        Top = 8
        Width = 121
        Height = 22
        ButtonFlat = False
        Ctl3D = False
        NumGlyphs = 2
        ParentCtl3D = False
        TabOrder = 1
        OnKeyPress = dtTglToKeyPress
      end
      object edtSupName: TEdit
        Left = 234
        Top = 35
        Width = 231
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 3
      end
      object edtSupAddress: TEdit
        Left = 107
        Top = 62
        Width = 358
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 5
      end
      object edtSupCode: TEditBtn
        Left = 107
        Top = 35
        Width = 121
        Height = 22
        Ctl3D = False
        ReturnIsTab = False
        Flat = False
        Etched = False
        FocusBorder = False
        ParentCtl3D = False
        RightAlign = False
        TabOrder = 2
        Text = '0'
        OnKeyDown = edtSupCodeKeyDown
        OnKeyPress = edtSupCodeKeyPress
        OnClickBtn = edtSupCodeClickBtn
      end
      object chkSupplier: TCheckBox
        Left = 472
        Top = 38
        Width = 65
        Height = 17
        Caption = 'Semua'
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 4
        OnClick = chkSupplierClick
      end
      object btnPrintDetail: TButton
        Left = 544
        Top = 23
        Width = 75
        Height = 25
        Anchors = []
        Caption = 'btnPrintDetail'
        TabOrder = 7
        Visible = False
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 664
    inherited lblHeader: TLabel
      Width = 155
      Caption = 'LISTING RECEIVING PRODUCT'
    end
  end
  inline fraFooter5Button1: TfraFooter5Button
    Left = 0
    Top = 122
    Width = 664
    Height = 68
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
      Top = 24
      Width = 664
      Height = 44
      inherited bvlSeparator: TBevel
        Left = 278
        Top = 5
        Height = 30
        Visible = False
      end
      inherited btnClose: TsuiButton
        Left = 582
        Top = 5
        Height = 31
      end
      inherited btnAdd: TsuiButton
        Top = 5
        Height = 31
        Caption = 'Print'
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
        OnClick = fraFooter5Button1btnAddClick
      end
      inherited btnUpdate: TsuiButton
        Top = 5
        Width = 96
        Height = 31
        Caption = 'Print Detil'
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
      end
      inherited btnDelete: TsuiButton
        Left = 200
        Top = 5
        Height = 31
        Visible = False
      end
      inherited btnRefresh: TsuiButton
        Left = 292
        Top = 5
        Height = 31
        Visible = False
      end
    end
    inherited pnlSortCut: TPanel
      Width = 664
      Height = 24
      inherited lbl1: TLabel
        Top = 6
        Visible = False
      end
      inherited lbl2: TLabel
        Top = 6
        Visible = False
      end
      inherited lbl3: TLabel
        Top = 6
        Visible = False
      end
      inherited lbl4: TLabel
        Top = 6
        Visible = False
      end
      inherited lbl5: TLabel
        Left = 574
        Top = 6
      end
    end
  end
  object actlst1: TActionList
    Left = 516
    Top = 12
    object actRefreshListingReceivingProduct: TAction
      Caption = 'Show Listing'
    end
    object actPrintListingReceivingProduct: TAction
      Caption = 'Print'
      OnExecute = actPrintListingReceivingProductExecute
    end
    object actPrintDetilListingReceivingProduct: TAction
      Caption = 'Print Detil'
      OnExecute = actPrintDetilListingReceivingProductExecute
    end
  end
  object qryShowRec: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      #39'PO'#39' as Tipe, '
      'a.date_create as "Date Created",'
      'a.do_no as "DO No.", '
      'a.do_date as "DO Date",'
      'a.do_np as "DO NP",'
      'c.sup_code as "Suplier Code",'
      'c.sup_name as "Suplier Name",'
      'a.op_create as "OP Create",'
      'b.dod_qty_order_recv as "DOD Qty Order Receive",'
      'b.dod_disc1 as "DOD Disc1",'
      'b.dod_disc2 as "DOD Disc2",'
      'b.dod_disc3 as "DOD Disc3", '
      'b.dod_ppn_persen as "DOD PPn%",'
      'b.dod_ppnbm_persen as "PPn BM%"'
      'from dord a, do_detil b, suplier c'
      'where a.do_no = b.dod_do_no'
      'and a.do_unt_id = b.dod_do_unt_id'
      'and a.do_sup_code = c.sup_code'
      'and a.do_sup_unt_id = c.sup_unt_id')
    Left = 401
    Top = 7
  end
  object qryPrintDtl: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      '  MER.MERCHAN_CODE,'
      '  MER.MERCHAN_NAME,'
      '  DORD.DATE_CREATE,'
      '  EXTRACTDATE(PO.PO_DATE) AS PO_DATE,'
      '  DORD.DO_NP,'
      '  DORD.DO_NO,'
      '  DORD.DO_PO_NO,'
      '  SUP.SUP_CODE,'
      '  RTP.TPPERSH_CODE,'
      '  SUP.SUP_NAME,'
      '  DORD.DO_SO_NO,'
      '  SO.SO_DATE,'
      '  BRG.BRG_CODE,'
      '  BRG.BRG_ALIAS,'
      '  DOD.DOD_QTY_ORDER,'
      '  DOD.DOD_QTY_ORDER_RECV,'
      '  DOD.DOD_PRICE,'
      '  DOD.DOD_TOTAL,'
      '  DOD.DOD_PPN,'
      '  DOD.DOD_PPNBM,'
      '  DOD.DOD_TOTAL_TAX,'
      '  DOD.DOD_SAT_CODE_ORDER,'
      '  DOD.DOD_DISC1,'
      '  DOD.DOD_DISC2,'
      '  DOD.DOD_DISC3,'
      '  PO.PO_DISC,'
      '  dod.DOD_PPN_PERSEN,'
      '  dod.DOD_PPNBM_PERSEN'
      'FROM'
      '  DORD'
      '  LEFT OUTER JOIN DO_DETIL DOD ON (DORD.DO_NO = DOD.DOD_DO_NO)'
      '  AND (DORD.DO_UNT_ID = DOD.DOD_DO_UNT_ID)'
      
        '  LEFT OUTER JOIN BARANG BRG ON (DOD.DOD_BRG_CODE = BRG.BRG_CODE' +
        ')'
      '  AND (DOD.DOD_BRG_UNT_ID = BRG.BRG_UNT_ID)'
      '  LEFT OUTER JOIN PO ON (DORD.DO_PO_NO = PO.PO_NO)'
      '  AND (DORD.DO_PO_UNT_ID = PO.PO_UNT_ID)'
      '  LEFT OUTER JOIN SO ON (PO.PO_SO_NO = SO.SO_NO)'
      '  AND (PO.PO_SO_UNT_ID = SO.SO_UNT_ID)'
      
        '  LEFT OUTER JOIN REF$MERCHANDISE_GRUP MG ON (DORD.DO_MERCHANGRU' +
        'P_ID = MG.MERCHANGRUP_ID)'
      '  AND (DORD.DO_MERCHANGRUP_UNT_ID = MG.MERCHANGRUP_UNT_ID)'
      
        '  LEFT OUTER JOIN REF$MERCHANDISE MER ON (MG.MERCHANGRUP_MERCHAN' +
        '_ID = MER.MERCHAN_ID)'
      '  AND (MG.MERCHANGRUP_MERCHAN_UNT_ID = MER.MERCHAN_UNT_ID)'
      
        '  LEFT OUTER JOIN SUPLIER SUP ON (DORD.DO_SUP_CODE = SUP.SUP_COD' +
        'E)'
      '  AND (DORD.DO_SUP_UNT_ID = SUP.SUP_UNT_ID)'
      
        '  LEFT OUTER JOIN REF$TIPE_PERUSAHAAN RTP ON (SUP.SUP_TPPERSH_ID' +
        ' = RTP.TPPERSH_ID)')
    Left = 441
    Top = 7
  end
end
