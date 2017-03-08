object fraSellingPrice: TfraSellingPrice
  Left = 0
  Top = 0
  Width = 792
  Height = 313
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Trebuchet MS'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object pnl4: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 23
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = 'DETAIL SELLING PRICE'
    Color = 15422804
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pnl1: TPanel
    Left = 0
    Top = 23
    Width = 792
    Height = 121
    Align = alClient
    BevelOuter = bvLowered
    BorderWidth = 20
    TabOrder = 1
    DesignSize = (
      792
      121)
    object lblClose: TcxLabel
      Left = 766
      Top = 5
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'Close'
      ParentFont = False
      Transparent = True
      OnClick = lblCloseClick
    end
    object lblAdd: TcxLabel
      Left = 672
      Top = 5
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'Add'
      ParentFont = False
      Transparent = True
      OnClick = lblAddClick
    end
    object lblDelete: TcxLabel
      Left = 730
      Top = 5
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'Delete'
      ParentFont = False
      Transparent = True
      OnClick = lblDeleteClick
    end
    object lblEdit: TcxLabel
      Left = 700
      Top = 5
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'Edit'
      ParentFont = False
      Transparent = True
      OnClick = lblEditClick
    end
    object lblView: TcxLabel
      Left = 640
      Top = 5
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'View'
      ParentFont = False
      Transparent = True
      OnClick = lblViewClick
    end
    object cxGrid: TcxGrid
      Left = 21
      Top = 21
      Width = 750
      Height = 79
      Align = alClient
      TabOrder = 0
      object cxGridViewSellingPrice: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        OnEditing = cxGridViewSellingPriceEditing
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.NoDataToDisplayInfoText = '<No Data>'
        OptionsView.GroupByBox = False
        Styles.Content = frmProduct.cxStyle1
        object cxGridViewSellingPriceColumn1: TcxGridDBColumn
          Caption = 'Kode Satuan'
          Styles.Content = frmProduct.cxStyle1
        end
        object cxGridViewSellingPriceColumn2: TcxGridDBColumn
          Caption = 'Konversi Value'
          Styles.Content = frmProduct.cxStyle1
        end
        object cxGridViewSellingPriceColumn3: TcxGridDBColumn
          Caption = 'Tipe Harga'
          Styles.Content = frmProduct.cxStyle3
        end
        object cxGridViewSellingPriceColumn4: TcxGridDBColumn
          Caption = 'Harga Jual'
          Styles.Content = frmProduct.cxStyle2
        end
        object cxGridViewSellingPriceColumn5: TcxGridDBColumn
          Caption = 'Disc (%)'
          Styles.Content = frmProduct.cxStyle2
        end
        object cxGridViewSellingPriceColumn6: TcxGridDBColumn
          Caption = 'Disc(Rp)'
          Styles.Content = frmProduct.cxStyle2
        end
        object cxGridViewSellingPriceColumn7: TcxGridDBColumn
          Caption = 'Harga Jual Diskon'
          Styles.Content = frmProduct.cxStyle2
        end
        object cxGridViewSellingPriceColumn8: TcxGridDBColumn
          Caption = 'Limit Qty'
          Styles.Content = frmProduct.cxStyle4
        end
        object cxGridViewSellingPriceColumn9: TcxGridDBColumn
          Caption = 'Limit Qty Subsidi'
          Styles.Content = frmProduct.cxStyle4
        end
        object cxGridViewSellingPriceColumn10: TcxGridDBColumn
          Caption = 'Mailer'
          Styles.Content = frmProduct.cxStyle4
        end
        object cxGridViewSellingPriceColumn11: TcxGridDBColumn
          Caption = 'Harga Beli'
        end
        object cxGridViewSellingPriceColumn12: TcxGridDBColumn
          Caption = 'Uom Beli'
        end
        object cxGridViewSellingPriceColumn13: TcxGridDBColumn
          Caption = 'Harga Rata-Rata'
        end
        object cxGridViewSellingPriceColumn14: TcxGridDBColumn
          Caption = 'Uom Harga Rata-Rata'
        end
        object cxGridViewSellingPriceColumn15: TcxGridDBColumn
          Caption = 'ID'
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridViewSellingPrice
      end
    end
  end
  object pnlAddEdit: TPanel
    Left = 0
    Top = 144
    Width = 792
    Height = 169
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 15198183
    TabOrder = 2
    DesignSize = (
      792
      169)
    object lbl1: TLabel
      Left = 5
      Top = 32
      Width = 23
      Height = 16
      Caption = 'UOM'
    end
    object lbl2: TLabel
      Left = 5
      Top = 79
      Width = 58
      Height = 16
      Caption = 'Selling Price'
    end
    object lbl3: TLabel
      Left = 206
      Top = 8
      Width = 62
      Height = 16
      Caption = 'Discount (%)'
    end
    object lbl4: TLabel
      Left = 206
      Top = 30
      Width = 67
      Height = 16
      Caption = 'Discount (Rp)'
    end
    object lbl42: TLabel
      Left = 371
      Top = 9
      Width = 7
      Height = 16
      Caption = '%'
    end
    object lbl7: TLabel
      Left = 5
      Top = 56
      Width = 54
      Height = 16
      Caption = 'Qty / UOM'
    end
    object lbl10: TLabel
      Left = 318
      Top = 277
      Width = 95
      Height = 16
      Caption = 'Selling Price Disc.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4246527
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl11: TLabel
      Left = 3
      Top = 6
      Width = 51
      Height = 16
      Caption = 'Price Type'
    end
    object Label1: TLabel
      Left = 207
      Top = 75
      Width = 90
      Height = 16
      Caption = 'Selling Price Coret'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 207
      Top = 102
      Width = 95
      Height = 16
      Caption = 'Selling Price Margin'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 456
      Top = 139
      Width = 328
      Height = 16
      Anchors = [akLeft, akBottom]
      Caption = 
        'CTRL-F1 [Add]  CTRL-F2 [Edit]  CTRL-F3 [Del]  CTRL-Escape [Close' +
        ']'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 383
      Top = 103
      Width = 7
      Height = 16
      Caption = '%'
    end
    object cbbUOM: TComboBox
      Left = 70
      Top = 29
      Width = 97
      Height = 24
      BevelKind = bkSoft
      Style = csDropDownList
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 4
      OnExit = cbbUOMExit
      OnKeyPress = cbbUOMKeyPress
    end
    object jvcuredtSellPrice: TcxCurrencyEdit
      Left = 70
      Top = 78
      EditValue = 1000.000000000000000000
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 2
      Properties.DisplayFormat = ',0.00;(,0.00)'
      TabOrder = 8
      OnKeyPress = jvcuredtSellPriceKeyPress
      Width = 112
    end
    object fedtDiscPercent: TcxCurrencyEdit
      Left = 305
      Top = 5
      EditValue = 1000.000000000000000000
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 2
      Properties.DisplayFormat = ',0.00;(,0.00)'
      TabOrder = 2
      OnExit = fedtDiscPercentExit
      OnKeyPress = fedtDiscPercentKeyPress
      Width = 62
    end
    object jvcuredtDiscNominal: TcxCurrencyEdit
      Left = 305
      Top = 28
      EditValue = 1000.000000000000000000
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 2
      Properties.DisplayFormat = ',0.00;(,0.00)'
      TabOrder = 3
      OnExit = jvcuredtDiscNominalExit
      OnKeyPress = jvcuredtDiscNominalKeyPress
      Width = 112
    end
    object jvcuredtSellPriceDisc: TcxCurrencyEdit
      Left = 305
      Top = 51
      EditValue = 1000.000000000000000000
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 2
      Properties.DisplayFormat = ',0.00;(,0.00)'
      TabOrder = 5
      OnKeyPress = jvcuredtSellPriceDiscKeyPress
      Width = 112
    end
    object cbbPriceType: TComboBox
      Left = 70
      Top = 3
      Width = 97
      Height = 24
      BevelKind = bkSoft
      Style = csDropDownList
      Ctl3D = False
      ItemIndex = 1
      ParentCtl3D = False
      TabOrder = 1
      Text = 'CRAZY PRICE'
      OnKeyPress = cbbPriceTypeKeyPress
      Items.Strings = (
        'COMMON'
        'CRAZY PRICE'
        'TRADER'
        'ASGROSS')
    end
    object pnl3: TPanel
      Left = 424
      Top = 2
      Width = 359
      Height = 131
      BevelOuter = bvLowered
      TabOrder = 0
      object lblMaxQtyDisc: TLabel
        Left = 7
        Top = 106
        Width = 66
        Height = 16
        Caption = 'Max Qty Disc'
      end
      object lbl5: TLabel
        Left = 7
        Top = 82
        Width = 41
        Height = 16
        Caption = 'Mark Up'
      end
      object lbl8: TLabel
        Left = 123
        Top = 82
        Width = 7
        Height = 16
        Caption = '%'
      end
      object lbl13: TLabel
        Left = 131
        Top = 6
        Width = 19
        Height = 16
        Caption = 'Qty'
      end
      object lbl14: TLabel
        Left = 132
        Top = 31
        Width = 19
        Height = 16
        Caption = 'Qty'
      end
      object Label2: TLabel
        Left = 142
        Top = 82
        Width = 46
        Height = 16
        Caption = 'Purchase'
      end
      object Label3: TLabel
        Left = 142
        Top = 106
        Width = 47
        Height = 16
        Caption = 'AVG Price'
      end
      object chkIsLimit: TCheckBox
        Left = 5
        Top = 7
        Width = 122
        Height = 17
        Caption = 'Is Limit Crazy Price'
        TabOrder = 2
        OnClick = chkIsLimitClick
        OnExit = chkIsLimitExit
        OnKeyPress = chkIsLimitKeyPress
      end
      object chkIsADS: TCheckBox
        Left = 5
        Top = 31
        Width = 97
        Height = 17
        Caption = 'Is ADS'
        TabOrder = 5
        OnClick = chkIsADSClick
        OnExit = chkIsADSExit
        OnKeyPress = chkIsADSKeyPress
      end
      object jvcuredtPriceLimit: TcxCurrencyEdit
        Left = 194
        Top = 5
        EditValue = 1000.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 1
        OnKeyPress = jvcuredtPriceLimitKeyPress
        Width = 112
      end
      object jvcuredtPriceADS: TcxCurrencyEdit
        Left = 194
        Top = 28
        EditValue = 1000.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 4
        OnKeyPress = jvcuredtPriceADSKeyPress
        Width = 112
      end
      object intedtQtyLimit: TcxCurrencyEdit
        Left = 152
        Top = 5
        EditValue = 1000.000000000000000000
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 0
        OnKeyPress = intedtQtyLimitKeyPress
        Width = 41
      end
      object intedtQtyADS: TcxCurrencyEdit
        Left = 152
        Top = 28
        EditValue = 1000.000000000000000000
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 3
        OnKeyPress = intedtQtyADSKeyPress
        Width = 41
      end
      object fedtMarkUp: TcxCurrencyEdit
        Left = 77
        Top = 79
        EditValue = 1000.000000000000000000
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 7
        OnKeyPress = fedtMarkUpKeyPress
        Width = 44
      end
      object chkIsMailer: TCheckBox
        Left = 5
        Top = 56
        Width = 97
        Height = 17
        Caption = 'Is Mailer'
        TabOrder = 6
        OnClick = chkIsADSClick
        OnExit = chkIsMailerExit
        OnKeyPress = chkIsMailerKeyPress
      end
      object edtMaxQtyDisc: TcxCurrencyEdit
        Left = 77
        Top = 103
        EditValue = 1000.000000000000000000
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 10
        OnKeyPress = edtMaxQtyDiscKeyPress
        Width = 44
      end
      object edtUomPurchase: TEdit
        Left = 312
        Top = 79
        Width = 42
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 9
        Text = 'edtUomPurchase'
      end
      object edtUOMSTock: TEdit
        Left = 312
        Top = 103
        Width = 42
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 12
        Text = 'edtUOMSTock'
      end
      object edtPurchPrice: TcxCurrencyEdit
        Left = 193
        Top = 79
        EditValue = 1000.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 8
        OnExit = fedtDiscPercentExit
        Width = 117
      end
      object edtAVGPrice: TcxCurrencyEdit
        Left = 193
        Top = 103
        EditValue = 1000.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 11
        Width = 117
      end
    end
    object fedtQty: TcxCurrencyEdit
      Left = 70
      Top = 54
      EditValue = 1000.000000000000000000
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 2
      Properties.DisplayFormat = ',0.00;(,0.00)'
      TabOrder = 6
      OnKeyPress = fedtQtyKeyPress
      Width = 41
    end
    object jvcuredtSellPriceCoret: TcxCurrencyEdit
      Left = 305
      Top = 75
      EditValue = 1000.000000000000000000
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 2
      Properties.DisplayFormat = ',0.00;(,0.00)'
      TabOrder = 7
      OnKeyPress = jvcuredtSellPriceCoretKeyPress
      Width = 112
    end
    object edtSellMargin: TcxCurrencyEdit
      Left = 305
      Top = 100
      EditValue = 1000.000000000000000000
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 2
      Properties.DisplayFormat = ',0.00;(,0.00)'
      TabOrder = 9
      OnExit = edtSellMarginExit
      OnKeyPress = edtSellMarginKeyPress
      Width = 72
    end
    object cxCurrencyEdit1: TcxCurrencyEdit
      Left = 304
      Top = 128
      EditValue = 1000.000000000000000000
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 2
      Properties.DisplayFormat = ',0.00;(,0.00)'
      TabOrder = 10
      Width = 113
    end
    object btnCancel: TcxButton
      Left = 132
      Top = 131
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
      TabOrder = 11
      OnClick = btnSaveClick
    end
    object btnSave: TcxButton
      Left = 64
      Top = 131
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
      TabOrder = 12
      OnClick = btnSaveClick
    end
  end
  object actSellPrice: TActionList
    Left = 624
    Top = 59
    object actAddSellPrice: TAction
      Caption = 'actAddSellPrice'
      OnExecute = Action1Execute
    end
  end
end
