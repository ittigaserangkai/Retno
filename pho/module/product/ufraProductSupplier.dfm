object fraProductSupplier: TfraProductSupplier
  Left = 0
  Top = 0
  Width = 635
  Height = 339
  VertScrollBar.ButtonSize = 10
  VertScrollBar.Smooth = True
  VertScrollBar.Size = 10
  DockSite = True
  Ctl3D = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Trebuchet MS'
  Font.Style = []
  ParentCtl3D = False
  ParentFont = False
  TabOrder = 0
  object pnl4: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 23
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = 'PRODUCT SUPLIER'
    Color = 15422804
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pnlAddEdit: TPanel
    Left = 0
    Top = 120
    Width = 635
    Height = 219
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 15198183
    TabOrder = 1
    object lbl2: TLabel
      Left = 12
      Top = 6
      Width = 67
      Height = 16
      Caption = 'Supplier Code'
    end
    object lbl3: TLabel
      Left = 12
      Top = 29
      Width = 19
      Height = 16
      Caption = 'TOP'
    end
    object lbl4: TLabel
      Left = 283
      Top = 76
      Width = 27
      Height = 16
      Alignment = taRightJustify
      Caption = 'Disc1'
    end
    object lbl5: TLabel
      Left = 283
      Top = 99
      Width = 27
      Height = 16
      Alignment = taRightJustify
      Caption = 'Disc2'
    end
    object lbl7: TLabel
      Left = 283
      Top = 122
      Width = 27
      Height = 16
      Alignment = taRightJustify
      Caption = 'Disc3'
    end
    object lbl8: TLabel
      Left = 363
      Top = 74
      Width = 7
      Height = 16
      Caption = '%'
      Visible = False
    end
    object lbl10: TLabel
      Left = 363
      Top = 96
      Width = 7
      Height = 16
      Caption = '%'
      Visible = False
    end
    object lbl15: TLabel
      Left = 236
      Top = 53
      Width = 74
      Height = 16
      Alignment = taRightJustify
      Caption = 'Purchase Price'
    end
    object lbl16: TLabel
      Left = 250
      Top = 145
      Width = 60
      Height = 16
      Alignment = taRightJustify
      Caption = 'Purch - Disc'
    end
    object lbl18: TLabel
      Left = 12
      Top = 52
      Width = 64
      Height = 16
      Caption = 'Expired Time'
    end
    object lbl32: TLabel
      Left = 137
      Top = 52
      Width = 24
      Height = 16
      Caption = 'Days'
    end
    object lbl19: TLabel
      Left = 12
      Top = 99
      Width = 72
      Height = 16
      Caption = 'UOM Purchase'
    end
    object lbl33: TLabel
      Left = 12
      Top = 75
      Width = 67
      Height = 16
      Caption = 'Delivery Time'
    end
    object lbl34: TLabel
      Left = 136
      Top = 74
      Width = 24
      Height = 16
      Caption = 'Days'
    end
    object lbl20: TLabel
      Left = 12
      Top = 123
      Width = 74
      Height = 16
      Caption = 'Stock In Order'
    end
    object lbl21: TLabel
      Left = 12
      Top = 146
      Width = 76
      Height = 16
      Caption = 'Min/Max Order'
    end
    object lbl23: TLabel
      Left = 121
      Top = 144
      Width = 6
      Height = 16
      Caption = '/'
    end
    object lbl11: TLabel
      Left = 12
      Top = 172
      Width = 48
      Height = 16
      Caption = 'BKP/BTKP'
    end
    object lblKetBKP: TLabel
      Left = 12
      Top = 197
      Width = 184
      Height = 16
      Caption = '( different from Sup Merchan Group )'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
    end
    object lbl6: TLabel
      Left = 137
      Top = 31
      Width = 24
      Height = 16
      Caption = 'Days'
    end
    object lbl9: TLabel
      Left = 276
      Top = 168
      Width = 34
      Height = 16
      Alignment = taRightJustify
      Caption = 'Margin'
    end
    object lbl12: TLabel
      Left = 365
      Top = 170
      Width = 7
      Height = 16
      Caption = '%'
      Visible = False
    end
    object lbl13: TLabel
      Left = 252
      Top = 29
      Width = 58
      Height = 16
      Alignment = taRightJustify
      Caption = 'Selling Price'
      Visible = False
    end
    object Label1: TLabel
      Left = 459
      Top = 60
      Width = 23
      Height = 16
      Caption = 'UOM'
    end
    object Label2: TLabel
      Left = 459
      Top = 115
      Width = 58
      Height = 16
      Caption = 'Selling Price'
    end
    object Label3: TLabel
      Left = 459
      Top = 84
      Width = 54
      Height = 16
      Caption = 'Qty / UOM'
    end
    object Label4: TLabel
      Left = 459
      Top = 34
      Width = 51
      Height = 16
      Caption = 'Price Type'
    end
    object Label5: TLabel
      Left = 459
      Top = 139
      Width = 44
      Height = 16
      Caption = 'Discount'
    end
    object lbl42: TLabel
      Left = 571
      Top = 140
      Width = 7
      Height = 16
      Caption = '%'
    end
    object Label6: TLabel
      Left = 459
      Top = 161
      Width = 46
      Height = 16
      Caption = 'Sell - Disc'
    end
    object Bevel1: TBevel
      Left = 432
      Top = 8
      Width = 9
      Height = 169
      Shape = bsLeftLine
    end
    object edtSupNameBwh: TEdit
      Left = 163
      Top = 4
      Width = 246
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
    end
    object intedtTOP: TcxCurrencyEdit
      Left = 92
      Top = 27
      TabOrder = 2
      Width = 29
    end
    object edtDisc1: TcxCurrencyEdit
      Left = 315
      Top = 73
      ParentFont = False
      TabOrder = 15
      OnKeyPress = edtDisc1KeyPress
      Width = 46
    end
    object edtDisc2: TcxCurrencyEdit
      Left = 315
      Top = 96
      ParentFont = False
      TabOrder = 16
      OnKeyPress = edtDisc2KeyPress
      Width = 46
    end
    object edtDisc3: TcxCurrencyEdit
      Left = 315
      Top = 121
      ParentFont = False
      TabOrder = 17
      OnKeyPress = edtDisc3KeyPress
      Width = 94
    end
    object edtPPrceDisc: TcxCurrencyEdit
      Left = 315
      Top = 144
      ParentFont = False
      TabOrder = 18
      Width = 94
    end
    object intedtExpTime: TcxCurrencyEdit
      Left = 92
      Top = 50
      TabOrder = 3
      Width = 29
    end
    object intedtDelvrTime: TcxCurrencyEdit
      Left = 92
      Top = 73
      TabOrder = 4
      Width = 29
    end
    object chkEnableCN: TcxCheckBox
      Left = 173
      Top = 133
      Caption = 'Enable CN'
      TabOrder = 11
      Transparent = True
    end
    object chkIsSupPrim: TcxCheckBox
      Left = 173
      Top = 111
      Caption = 'Supplier Primer'
      TabOrder = 10
      Transparent = True
    end
    object cbbIsBKP: TComboBox
      Left = 92
      Top = 167
      Width = 69
      Height = 24
      BevelKind = bkSoft
      Style = csDropDownList
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 9
      Items.Strings = (
        'BKP'
        'BTKP')
    end
    object intedtStockIn: TcxCurrencyEdit
      Left = 92
      Top = 121
      TabOrder = 6
      Width = 29
    end
    object intedtMinOrd: TcxCurrencyEdit
      Left = 92
      Top = 144
      TabOrder = 7
      Width = 29
    end
    object intedtMaxOrd: TcxCurrencyEdit
      Left = 127
      Top = 144
      TabOrder = 8
      Width = 34
    end
    object edtSupCode: TEdit
      Left = 92
      Top = 4
      Width = 68
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      OnChange = edtSupCodeChange
      OnExit = edtSupCodeExit
      OnKeyUp = edtSupCodeKeyUp
    end
    object chkIsActive: TcxCheckBox
      Left = 173
      Top = 154
      Caption = 'Active'
      TabOrder = 12
      Transparent = True
    end
    object edtMarkup: TcxCurrencyEdit
      Left = 315
      Top = 167
      ParentFont = False
      TabOrder = 19
      OnKeyPress = edtMarkupKeyPress
      Width = 46
    end
    object edtSellingPrice: TcxCurrencyEdit
      Left = 315
      Top = 27
      TabStop = False
      ParentFont = False
      TabOrder = 13
      Visible = False
      Width = 94
    end
    object cbbUOM: TComboBox
      Left = 92
      Top = 96
      Width = 69
      Height = 24
      BevelKind = bkSoft
      Style = csDropDownList
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 5
      Items.Strings = (
        'BKP'
        'BTKP')
    end
    object cbbUOMSell: TComboBox
      Left = 523
      Top = 57
      Width = 94
      Height = 24
      BevelKind = bkSoft
      Style = csDropDownList
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 20
      OnExit = cbbUOMSellExit
    end
    object jvcuredtSellPrice: TcxCurrencyEdit
      Left = 523
      Top = 113
      ParentFont = False
      TabOrder = 21
      OnKeyPress = jvcuredtSellPriceKeyPress
      Width = 94
    end
    object cbbPriceType: TComboBox
      Left = 523
      Top = 32
      Width = 94
      Height = 24
      BevelKind = bkSoft
      Style = csDropDownList
      Ctl3D = False
      ItemIndex = 1
      ParentCtl3D = False
      TabOrder = 22
      Text = 'CRAZY PRICE'
      Items.Strings = (
        'COMMON'
        'CRAZY PRICE'
        'TRADER'
        'ASGROSS')
    end
    object fedtQty: TcxCurrencyEdit
      Left = 523
      Top = 82
      TabOrder = 23
      Width = 41
    end
    object fedtDiscPercent: TcxCurrencyEdit
      Left = 523
      Top = 136
      ParentFont = False
      TabOrder = 24
      OnKeyPress = fedtDiscPercentKeyPress
      Width = 41
    end
    object edSell: TcxCurrencyEdit
      Left = 523
      Top = 159
      ParentFont = False
      TabOrder = 25
      Width = 94
    end
    object chSaveEditedSellPrice: TcxCheckBox
      Left = 459
      Top = 5
      Caption = 'Change Selling Price'
      Enabled = False
      State = cbsChecked
      TabOrder = 26
      Transparent = True
      OnClick = chSaveEditedSellPriceClick
    end
    object edtPurchPrice: TcxCurrencyEdit
      Left = 315
      Top = 50
      ParentFont = False
      TabOrder = 14
      OnKeyPress = edtPurchPriceKeyPress
      Width = 94
    end
    object btnSave: TcxButton
      Left = 368
      Top = 187
      Width = 65
      Height = 25
      Caption = 'Save'
      OptionsImage.Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000FF00FF663333
        6633336633336633336633336633336633336633336633336633336633336633
        33663333663333FF00FFFF00FF60606060606060606060606060606060606060
        6060606060606060606060606060606060606060606060000000FF00FFD78300
        FFCACC993300D4E3FFD4E3FFD4D4FFD4E3FFD4D4FFD4E3FFD4D4FFD4D4FF9933
        00DE9A3E663333FF00FFFF00FF606060FFFFFF606060FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF606060FFFFFF606060FFFFFFFF00FFD78300
        FFE2B4993300D4E3FFCC9999CC9999CC9999CC9999CC9999CC9999D4D4FF9933
        00DE9A3E663333FF00FFFF00FF606060FFFFFF606060FFFFFFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF606060FFFFFF606060FFFFFFFF00FFD78300
        FFCACC993300D4E3FFD4E3FFD4E3FFD4E3FFD4D4FFD4E3FFD4D4FFD4E3FF9933
        00DE9A3E663333FF00FFFF00FF606060FFFFFF606060FFFFFFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF606060FFFFFF606060FFFFFFFF00FFD78300
        FFE2B4993300F0D4FFCC9999CC9999CC9999CC9999CC9999CC9999D4D4FF9933
        00DE9A3E663333FF00FFFF00FF606060FFFFFF606060FFFFFFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF606060FFFFFF606060FFFFFFFF00FFD78300
        FFCACC993300D4E3FFF0D4FFD4E3FFD4E3FFD4E3FFD4E3FFD4D4FFD4E3FF9933
        00DE9A3E663333FF00FFFF00FF606060FFFFFF606060FFFFFFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF606060FFFFFF606060FFFFFFFF00FFD78300
        FFE2B4FFCACC993300993300993300993300993300993300993300993300CC99
        99DE9A3E663333FF00FFFF00FF606060FFFFFFFF00FF60606060606060606060
        6060606060606060606060606060FF00FFFF00FF606060FFFFFFFF00FFD78300
        FFCACCFFCC99FFCACCCC9999FFCACCCC9999FFCC99CC9999FFCC99CC9999CC99
        99DE9A3E663333FF00FFFF00FF606060FFFFFFFF00FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF606060FFFFFFFF00FFD78300
        FFE2B4FFCACCFFCC99FFCACCCC9999FFCACCCC9999FFCC99CC9999FFCC99CC99
        99DE9A3E663333FF00FFFF00FF606060FFFFFFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF606060FFFFFFFF00FFD78300
        FFCACCFFCC99FFCACCFFCC99FFCACCCC9999FFCACCCC9999FFCC99CC9999FFCC
        99DE9A3E663333FF00FFFF00FF606060FFFFFFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF606060FFFFFFFF00FFD78300
        FFE2B4FFCACC606060404040404040404040404040404040404040FFCC99CC99
        99DE9A3E663333FF00FFFF00FF606060FFFFFFFF00FF60606060606060606060
        6060606060606060606060FF00FFFF00FFFF00FF606060FFFFFFFF00FFD78300
        FFCACCFFCC99606060DCDCDCDCDCDCBFBFBF9F9F9FBFBFBF7F7F7F404040FFCC
        99DE9A3E663333FF00FFFF00FF606060FFFFFFFF00FF606060FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF606060FF00FFFF00FF606060FFFFFFFF00FFD78300
        FFE2B4FFCACC606060DCDCDCFFFFFFDCDCDCBFBFBF9F9F9FBFBFBF404040CC99
        99DE9A3E663333FF00FFFF00FF606060FFFFFFFF00FF606060FFFFFFFF00FFFF
        00FFFF00FFFF00FFFF00FF606060FFFFFFFF00FF606060FFFFFFFF00FFD78300
        FFCACCFFCC99606060DCDCDCFFFFFFDCDCDCDCDCDCBFBFBF9F9F9F404040CC99
        99DE9A3E663333FF00FFFF00FF606060FFFFFFFF00FF606060FFFFFFFF00FFFF
        00FFFF00FFFF00FFFF00FF606060FFFFFFFF00FF606060FFFFFFFF00FFD78300
        D78300D78300D78300D78300D78300D78300D78300D78300D78300D78300D783
        00D78300FF00FFFF00FFFF00FF60606060606060606060606060606060606060
        6060606060606060606060606060606060606060FFFFFFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF}
      OptionsImage.NumGlyphs = 2
      TabOrder = 27
      OnClick = btnSaveClick
    end
    object btnCancel: TcxButton
      Left = 436
      Top = 187
      Width = 61
      Height = 25
      Caption = 'Cancel'
      OptionsImage.Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF500000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF606060FFFFFFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFCC6600CC6600500000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF606060FFFFFF606060FFFFFFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        CC6600D78300D78300CC6600500000FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF606060FFFFFFFF00FFFF00FF606060FF
        FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCC6600
        FF9900DE9A3ED78300D78300CC6600500000FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF606060FFFFFFFF00FFFF00FFFF00FFFF00FF60
        6060FFFFFFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFCC6600FFCC99
        FF9900FF9900DE9A3ED78300D78300CC6600500000FF00FFFF00FFFF00FF5000
        00500000500000500000606060FFFFFFFFFFFFFFFFFFFF00FFFF00FFFF00FFFF
        00FF606060FFFFFFFF00FFFF00FF606060606060606060606060D78300CC6600
        CC6600FF9900FF9900DE9A3E500000500000500000FF00FFFF00FFFF00FFCC66
        00CC6600CC6600500000606060606060606060FFFFFFFF00FFFF00FF60606060
        6060606060FFFFFFFF00FFFF00FF606060FFFFFFFF00FF606060FF00FFFF00FF
        CC6600FFAA00FF9900FF9900500000FF00FFFF00FFFF00FFFF00FFFF00FFCC66
        00D78300CC6600500000FF00FFFF00FF606060FFFFFFFF00FFFF00FF606060FF
        FFFFFFFFFFFFFFFFFF00FFFF00FF606060FFFFFFFF00FF606060FF00FFFF00FF
        CC6600FFCC99FFAA00FF9900CC6600500000FF00FFFF00FFFF00FFCC6600D783
        00D78300CC6600500000FF00FFFF00FF606060FFFFFFFF00FFFF00FFFF00FF60
        6060FFFFFFFF00FFFF00FF606060FFFFFFFF00FFFFFFFF606060FF00FFFF00FF
        FF00FFCC6600FFCC99FFAA00FF9900CC6600500000500000500000D78300D783
        00D78300500000FF00FFFF00FFFF00FFFF00FF606060FFFFFFFF00FFFF00FFFF
        00FF606060606060606060FFFFFFFF00FFFF00FF606060FF00FFFF00FFFF00FF
        FF00FFCC6600FFCC99FFCC99FFAA00FF9900CC6600CC6600CC6600DE9A3ED783
        00D78300500000FF00FFFF00FFFF00FFFF00FF606060FFFFFFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFF606060FF00FFFF00FFFF00FF
        FF00FFFF00FFCC6600FFCC99FFCC99FFAA00FF9900FF9900FF9900DE9A3EDE9A
        3E500000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF606060FFFFFFFFFFFFFF
        00FFFF00FFFF00FFFF00FFFFFFFFFFFFFF606060FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFCC6600CC6600FFCC99FFAA00FF9900FF9900CC6600CC66
        00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF606060606060FF
        FFFFFFFFFFFFFFFFFFFFFF606060606060FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFCC6600CC6600CC6600CC6600FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF60
        6060606060606060606060FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      OptionsImage.NumGlyphs = 2
      TabOrder = 28
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 23
    Width = 635
    Height = 97
    Align = alClient
    BevelOuter = bvLowered
    BorderWidth = 5
    TabOrder = 2
    object pnl3: TPanel
      Left = 6
      Top = 6
      Width = 623
      Height = 26
      Align = alTop
      BevelOuter = bvNone
      Ctl3D = True
      ParentColor = True
      ParentCtl3D = False
      TabOrder = 0
      DesignSize = (
        623
        26)
      object lbl1: TLabel
        Left = 8
        Top = 3
        Width = 69
        Height = 16
        Caption = 'Supplier Name'
      end
      object lblAdd: TcxLabel
        Left = 498
        Top = 8
        Cursor = crHandPoint
        Anchors = [akTop, akRight]
        Caption = 'Add'
        ParentFont = False
        Transparent = True
        OnClick = lblAddClick
      end
      object lblEdit: TcxLabel
        Left = 524
        Top = 8
        Cursor = crHandPoint
        Anchors = [akTop, akRight]
        Caption = 'Edit'
        ParentFont = False
        Transparent = True
        OnClick = lblEditClick
      end
      object lblDelete: TcxLabel
        Left = 551
        Top = 8
        Cursor = crHandPoint
        Anchors = [akTop, akRight]
        Caption = 'Delete'
        ParentFont = False
        Transparent = True
        OnClick = lblDeleteClick
      end
      object lblClose: TcxLabel
        Left = 589
        Top = 8
        Cursor = crHandPoint
        Anchors = [akTop, akRight]
        Caption = 'Close'
        ParentFont = False
        Transparent = True
        OnClick = lblCloseClick
      end
      object lblView: TcxLabel
        Left = 468
        Top = 8
        Cursor = crHandPoint
        Anchors = [akTop, akRight]
        Caption = 'View'
        ParentFont = False
        Transparent = True
        OnClick = lblViewClick
      end
      object edtSupNameUP: TEdit
        Left = 86
        Top = 2
        Width = 379
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object cxGrid: TcxGrid
      Left = 6
      Top = 32
      Width = 623
      Height = 59
      Align = alClient
      TabOrder = 1
      object cxGridViewProductSupplier: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.NoDataToDisplayInfoText = '<No Data>'
        OptionsView.GroupByBox = False
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridViewProductSupplier
      end
    end
  end
  object actlst1: TActionList
    Left = 592
    Top = 96
    object actView: TAction
      Caption = 'actView'
      OnExecute = actViewExecute
    end
    object actAdd: TAction
      Caption = 'actAdd'
      OnExecute = actAddExecute
    end
    object actEdit: TAction
      Caption = 'actEdit'
      OnExecute = actEditExecute
    end
    object actDelete: TAction
      Caption = 'actDelete'
      OnExecute = actDeleteExecute
    end
  end
end
