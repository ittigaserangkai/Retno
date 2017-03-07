inherited frmProduct: TfrmProduct
  Left = 287
  Top = 78
  Caption = 'Product Master'
  ClientHeight = 495
  ClientWidth = 924
  KeyPreview = True
  OldCreateOrder = True
  OnResize = FormResize
  ExplicitWidth = 940
  ExplicitHeight = 534
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 924
    Height = 409
    BorderWidth = 0
    ExplicitWidth = 924
    ExplicitHeight = 409
    object pnl1: TPanel
      Left = 161
      Top = 1
      Width = 762
      Height = 407
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      object lblCompanyCode: TLabel
        Left = 684
        Top = 7
        Width = 73
        Height = 16
        Caption = 'Company Code'
        Visible = False
      end
      object lbl2: TLabel
        Left = 12
        Top = 5
        Width = 67
        Height = 16
        Caption = 'Product Code'
      end
      object lbl3: TLabel
        Left = 12
        Top = 75
        Width = 57
        Height = 16
        Caption = 'Short Name'
      end
      object lbl4: TLabel
        Left = 12
        Top = 28
        Width = 59
        Height = 16
        Caption = 'Brand Name'
      end
      object lbl5: TLabel
        Left = 12
        Top = 97
        Width = 46
        Height = 16
        Caption = 'Stock/CS'
      end
      object lbl6: TLabel
        Left = 12
        Top = 119
        Width = 65
        Height = 16
        Caption = 'Product Type'
      end
      object lbl7: TLabel
        Left = 12
        Top = 144
        Width = 60
        Height = 16
        Caption = 'Active Code'
      end
      object lbl8: TLabel
        Left = 12
        Top = 168
        Width = 54
        Height = 16
        Caption = 'UOM Stock'
      end
      object lbl9: TLabel
        Left = 234
        Top = 167
        Width = 46
        Height = 16
        Caption = 'Purchase'
        Visible = False
      end
      object lbl10: TLabel
        Left = 12
        Top = 191
        Width = 32
        Height = 16
        Caption = 'Outlet'
      end
      object lbl17: TLabel
        Left = 12
        Top = 228
        Width = 79
        Height = 16
        Caption = 'Max. Qty Order'
      end
      object lbl18: TLabel
        Left = 210
        Top = 229
        Width = 78
        Height = 16
        Caption = 'Stock On Order'
      end
      object lbl19: TLabel
        Left = 12
        Top = 251
        Width = 62
        Height = 16
        Caption = 'PKM Average'
      end
      object lbl20: TLabel
        Left = 209
        Top = 253
        Width = 72
        Height = 16
        Caption = 'Sales Tax Code'
      end
      object lbl23: TLabel
        Left = 420
        Top = 5
        Width = 66
        Height = 16
        Caption = 'Catalog Code'
      end
      object lbl24: TLabel
        Left = 420
        Top = 28
        Width = 47
        Height = 16
        Caption = 'Category'
      end
      object lbl25: TLabel
        Left = 420
        Top = 52
        Width = 67
        Height = 16
        Caption = 'Sub Category'
      end
      object lbl26: TLabel
        Left = 420
        Top = 76
        Width = 30
        Height = 16
        Caption = 'Group'
      end
      object lbl27: TLabel
        Left = 420
        Top = 98
        Width = 39
        Height = 16
        Caption = 'Division'
      end
      object lbl28: TLabel
        Left = 356
        Top = 404
        Width = 76
        Height = 16
        Caption = 'Current Stock'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4246527
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lbl29: TLabel
        Left = 420
        Top = 143
        Width = 80
        Height = 16
        Caption = 'Primary Supplier'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
      end
      object lbl31: TLabel
        Left = 420
        Top = 190
        Width = 64
        Height = 16
        Caption = 'Expired Time'
      end
      object lbl32: TLabel
        Left = 530
        Top = 189
        Width = 24
        Height = 16
        Caption = 'Days'
      end
      object lbl33: TLabel
        Left = 565
        Top = 190
        Width = 67
        Height = 16
        Caption = 'Delivery Time'
      end
      object lbl34: TLabel
        Left = 677
        Top = 189
        Width = 24
        Height = 16
        Caption = 'Days'
      end
      object lbl36: TLabel
        Left = 620
        Top = 213
        Width = 6
        Height = 16
        Caption = '/'
      end
      object lbl37: TLabel
        Left = 422
        Top = 121
        Width = 66
        Height = 16
        Caption = 'Selling Price'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4246527
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl38: TLabel
        Left = 420
        Top = 235
        Width = 52
        Height = 16
        Caption = 'Last COGS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4246527
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl39: TLabel
        Left = 420
        Top = 259
        Width = 35
        Height = 16
        Caption = 'Margin'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4246527
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl40: TLabel
        Left = 622
        Top = 121
        Width = 6
        Height = 16
        Caption = '/'
      end
      object lbl41: TLabel
        Left = 620
        Top = 236
        Width = 6
        Height = 16
        Caption = '/'
      end
      object lbl42: TLabel
        Left = 572
        Top = 260
        Width = 7
        Height = 16
        Caption = '%'
      end
      object lbl45: TLabel
        Left = 686
        Top = 48
        Width = 67
        Height = 16
        Caption = 'Deposit Value'
        Visible = False
      end
      object lbl46: TLabel
        Left = 261
        Top = 324
        Width = 50
        Height = 16
        Caption = 'Create By'
      end
      object lbl51: TLabel
        Left = 268
        Top = 100
        Width = 48
        Height = 16
        Caption = 'BKP/BTKP'
      end
      object lbl52: TLabel
        Left = 144
        Top = 190
        Width = 44
        Height = 16
        Caption = 'Location'
      end
      object Label1: TLabel
        Left = 420
        Top = 284
        Width = 48
        Height = 16
        Caption = 'Last Cost'
      end
      object lbl1: TLabel
        Left = 12
        Top = 53
        Width = 69
        Height = 16
        Caption = 'Product Name'
      end
      object lbl53: TLabel
        Left = 176
        Top = 5
        Width = 36
        Height = 16
        Caption = 'Status:'
      end
      object lbl54: TLabel
        Left = 11
        Top = 323
        Width = 61
        Height = 16
        Caption = 'Validated By'
      end
      object lblValid: TLabel
        Left = 215
        Top = 5
        Width = 30
        Height = 16
        Caption = 'Valid!'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl55: TLabel
        Left = 285
        Top = 188
        Width = 72
        Height = 16
        Caption = 'PLU Purchase:'
      end
      object Label2: TLabel
        Left = 420
        Top = 213
        Width = 81
        Height = 16
        Caption = 'Purchase Price'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4246527
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl35: TLabel
        Left = 12
        Top = 275
        Width = 28
        Height = 16
        Caption = 'Stock'
      end
      object lbl56: TLabel
        Left = 244
        Top = 277
        Width = 40
        Height = 16
        Caption = 'Saldo Rp'
      end
      object Label3: TLabel
        Left = 620
        Top = 283
        Width = 6
        Height = 16
        Caption = '/'
      end
      object Label4: TLabel
        Left = 12
        Top = 299
        Width = 63
        Height = 16
        Caption = 'Safety Stock'
      end
      object lbl11: TLabel
        Left = 10
        Top = 348
        Width = 34
        Height = 16
        Caption = 'Author'
      end
      object lbl12: TLabel
        Left = 266
        Top = 348
        Width = 45
        Height = 16
        Caption = 'Publisher'
      end
      object lbl21: TcxLabel
        Left = 142
        Top = 378
        Cursor = crHandPoint
        Caption = 'F2 for alokasi stock...'
        ParentFont = False
        Transparent = True
      end
      object lbl22: TcxLabel
        Left = 12
        Top = 378
        Cursor = crHandPoint
        Caption = 'F1 for product bonus...'
        ParentFont = False
        Transparent = True
      end
      object lbl30: TcxLabel
        Left = 265
        Top = 378
        Cursor = crHandPoint
        Caption = 'F3 for detail selling price...'
        ParentFont = False
        Transparent = True
      end
      object lbl43: TcxLabel
        Left = 549
        Top = 374
        Cursor = crHandPoint
        Caption = 'F2 detail...'
        ParentFont = False
        Transparent = True
      end
      object lbl44: TcxLabel
        Left = 412
        Top = 378
        Cursor = crHandPoint
        Caption = 'F4 for product turunan...'
        ParentFont = False
        Transparent = True
      end
      object lbl50: TcxLabel
        Left = 679
        Top = 145
        Cursor = crHandPoint
        Caption = 'F3 detail...'
        ParentFont = False
        Transparent = True
      end
      object edtProductName: TEdit
        Left = 100
        Top = 51
        Width = 310
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        Text = 'WHITE STICK 30 X 10 S / 12 GR'
      end
      object edtShortName: TEdit
        Left = 100
        Top = 74
        Width = 310
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 2
        Text = 'INDOCAFE WHITE STICK 30 X 10 S'
      end
      object edtBrandName: TEdit
        Left = 100
        Top = 28
        Width = 310
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
        Text = 'INDOCAFE'
      end
      object edtStock: TEdit
        Left = 100
        Top = 97
        Width = 126
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 3
        Text = 'Stock / CS'
      end
      object edtProducttype: TEdit
        Left = 100
        Top = 120
        Width = 126
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 5
        Text = 'Traditional Market'
      end
      object edtActive: TEdit
        Left = 100
        Top = 143
        Width = 126
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 6
        Text = 'Active'
      end
      object edtUOMStockCode: TEdit
        Left = 100
        Top = 166
        Width = 38
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 9
        Text = 'PCS'
      end
      object edtUOMPurchaseCode: TEdit
        Left = 284
        Top = 165
        Width = 38
        Height = 22
        TabStop = False
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 11
        Text = 'CRT'
        Visible = False
      end
      object edtUOMStockName: TEdit
        Left = 139
        Top = 166
        Width = 87
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 10
        Text = 'PIECES'
      end
      object edtUOMPurchaseName: TEdit
        Left = 323
        Top = 165
        Width = 87
        Height = 22
        TabStop = False
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 12
        Text = 'CARTON'
        Visible = False
      end
      object edtOutlet: TEdit
        Left = 100
        Top = 189
        Width = 38
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 13
        Text = 'GNRL'
      end
      object fedtMaxQtyOrder: TcxCurrencyEdit
        Left = 99
        Top = 227
        TabOrder = 16
        Width = 62
      end
      object edtMaxQtyOrderUOM: TEdit
        Left = 162
        Top = 227
        Width = 38
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 17
        Text = 'CRT'
      end
      object fedtStockOnOrder: TcxCurrencyEdit
        Left = 291
        Top = 228
        TabOrder = 18
        Width = 62
      end
      object edtStockOnOrderUOM: TEdit
        Left = 354
        Top = 228
        Width = 38
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 19
        Text = 'CRT'
      end
      object fedtAverageSls: TcxCurrencyEdit
        Left = 99
        Top = 250
        TabOrder = 20
        Width = 62
      end
      object edtAverageSlsUOM: TEdit
        Left = 162
        Top = 250
        Width = 38
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 21
        Text = 'CRT'
      end
      object edtSalesTaxCode: TEdit
        Left = 291
        Top = 251
        Width = 62
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 22
        Text = 'Ppn'
      end
      object edtCatalog: TEdit
        Left = 508
        Top = 4
        Width = 165
        Height = 22
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 23
        Text = '88988909878898789'
      end
      object edtGroupCode: TEdit
        Left = 508
        Top = 27
        Width = 38
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 24
        Text = '2'
      end
      object edtGroupName: TEdit
        Left = 547
        Top = 27
        Width = 126
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 25
        Text = 'GROCERY'
      end
      object edtSubGroupCode: TEdit
        Left = 508
        Top = 50
        Width = 38
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 26
        Text = '300'
      end
      object edtSubGroupName: TEdit
        Left = 547
        Top = 50
        Width = 126
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 27
        Text = 'DIET FOOD'
      end
      object edtCategoryName: TEdit
        Left = 547
        Top = 73
        Width = 126
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 29
        Text = 'MILK'
      end
      object edtCategoryCode: TEdit
        Left = 508
        Top = 73
        Width = 38
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 28
        Text = '030'
      end
      object edtMerchandName: TEdit
        Left = 547
        Top = 96
        Width = 126
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 31
        Text = 'DRY FOOD'
      end
      object edtMerchandCode: TEdit
        Left = 508
        Top = 96
        Width = 38
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 30
        Text = '3'
      end
      object fedtCurrentStock: TcxCurrencyEdit
        Left = 444
        Top = 404
        TabOrder = 32
        Visible = False
        Width = 62
      end
      object edtCurrentStockUOM: TEdit
        Left = 507
        Top = 404
        Width = 38
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 33
        Text = 'PCS'
        Visible = False
      end
      object edtPrimarySupplierCode: TEdit
        Left = 508
        Top = 142
        Width = 70
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 36
        Text = 'TPOSL'
      end
      object edtPrimarySupplierName: TEdit
        Left = 420
        Top = 165
        Width = 255
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 38
        Text = 'PT. TEMPO SOLO'
      end
      object intedtExpiredTime: TcxCurrencyEdit
        Left = 486
        Top = 188
        TabOrder = 39
        Width = 41
      end
      object intedtDeliveryTime: TcxCurrencyEdit
        Left = 634
        Top = 188
        TabOrder = 40
        Width = 41
      end
      object cbEnabledCN: TcxCheckBox
        Left = 601
        Top = 141
        Caption = 'Enable CN'
        TabOrder = 37
        Transparent = True
      end
      object jvcuredtPurchasingPrice: TcxCurrencyEdit
        Left = 506
        Top = 211
        ParentFont = False
        TabOrder = 41
        Width = 107
      end
      object edtPurchasingPriceUOM: TEdit
        Left = 634
        Top = 211
        Width = 41
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 42
        Text = 'CRT'
      end
      object jvcuredtSellingPrice: TcxCurrencyEdit
        Left = 508
        Top = 119
        ParentFont = False
        TabOrder = 34
        Width = 107
      end
      object edtSellingPriceUOM: TEdit
        Left = 636
        Top = 119
        Width = 41
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 35
        Text = 'CRT'
      end
      object edtLastCOGSUOM: TEdit
        Left = 634
        Top = 234
        Width = 41
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 44
        Text = 'CRT'
      end
      object jvcuredtLastCOGS: TcxCurrencyEdit
        Left = 506
        Top = 234
        ParentFont = False
        TabOrder = 43
        Width = 107
      end
      object fedtMargin: TcxCurrencyEdit
        Left = 506
        Top = 257
        ParentFont = False
        TabOrder = 45
        Width = 62
      end
      object cbEnableDec: TcxCheckBox
        Left = 619
        Top = 258
        Caption = 'Enable Qty in Dec'
        TabOrder = 46
        Transparent = True
      end
      object jvcuredtDepositValue: TcxCurrencyEdit
        Left = 685
        Top = 64
        TabOrder = 53
        Visible = False
        Width = 75
      end
      object edtUser: TEdit
        Left = 391
        Top = 323
        Width = 53
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 52
        Text = 'Eni'
      end
      object dtTgl: TcxDateEdit
        Left = 314
        Top = 323
        TabOrder = 51
        Width = 75
      end
      object cbTurunan: TcxCheckBox
        Left = 284
        Top = 141
        Caption = 'Is Product Turunan'
        TabOrder = 8
        Transparent = True
      end
      object edtLocation: TEdit
        Left = 191
        Top = 189
        Width = 73
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 14
      end
      object edtBKP: TEdit
        Left = 317
        Top = 97
        Width = 93
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 4
        Text = 'INDOCAFE'
      end
      object jvcuredtLastCost: TcxCurrencyEdit
        Left = 506
        Top = 280
        ParentFont = False
        TabOrder = 47
        Width = 107
      end
      object dt1: TcxDateEdit
        Left = 76
        Top = 322
        TabOrder = 49
        Width = 77
      end
      object edt1: TEdit
        Left = 154
        Top = 322
        Width = 53
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 50
        Text = 'Eni'
      end
      object cbIsTaxInclude: TcxCheckBox
        Left = 284
        Top = 121
        Caption = 'Price Include Tax'
        TabOrder = 7
        Transparent = True
      end
      object edtPLUPurchase: TEdit
        Left = 284
        Top = 204
        Width = 125
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 15
      end
      object cbIsDiskonGMC: TcxCheckBox
        Left = 619
        Top = 306
        Caption = 'Discount Member'
        TabOrder = 54
        Transparent = True
      end
      object cbIsDeposit: TcxCheckBox
        Left = 619
        Top = 329
        Caption = 'Product Deposit'
        TabOrder = 55
        Transparent = True
      end
      object fedtStockQty: TcxCurrencyEdit
        Left = 99
        Top = 274
        TabOrder = 57
        Width = 62
      end
      object edtStockUOM: TEdit
        Left = 163
        Top = 274
        Width = 70
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 58
      end
      object fedtStockRp: TcxCurrencyEdit
        Left = 290
        Top = 275
        ParentFont = False
        TabOrder = 61
        Width = 107
      end
      object edtUOMLastCost: TEdit
        Left = 634
        Top = 280
        Width = 41
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 48
        Text = 'CRT'
      end
      object edSafetyStock: TcxCurrencyEdit
        Left = 99
        Top = 298
        TabOrder = 59
        Width = 62
      end
      object edtSSUOM: TEdit
        Left = 163
        Top = 298
        Width = 70
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 60
      end
      object edtAuthorId: TEdit
        Left = 74
        Top = 346
        Width = 38
        Height = 22
        Hint = 'TEKAN F5 UNTUK LOOKUP'
        Ctl3D = False
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 62
        Text = '00000'
      end
      object edtAuthorNm: TEdit
        Left = 113
        Top = 346
        Width = 126
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 63
        Text = 'TIDAK ADA'
      end
      object edtPubsNm: TEdit
        Left = 353
        Top = 346
        Width = 126
        Height = 22
        TabStop = False
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 64
        Text = 'TIDAK ADA'
      end
      object edtPubsID: TEdit
        Left = 314
        Top = 346
        Width = 38
        Height = 22
        Hint = 'TEKAN F5 UNTUK LOOKUP'
        Ctl3D = False
        ParentCtl3D = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 65
        Text = '00000'
      end
      object chkBasicItem: TcxCheckBox
        Left = 619
        Top = 353
        Caption = 'Basic Item'
        TabOrder = 56
        Transparent = True
      end
      object btnValidateProduct: TcxButton
        Left = 288
        Top = 2
        Width = 121
        Height = 25
        Cursor = crHandPoint
        Action = actValidateProduct
        OptionsImage.Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          1800000000000006000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF005019FF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFF7F7F7FFF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF005019009900005019FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFF7F7F7FFF00FF7F
          7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF005019009900009900009900005019FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFF7F7F7FFF00FFFF00FFFF
          00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF00501933CC6633CC6600B93D00B93D009900005019FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFF7F7F7FFF00FFFF00FFFF00FFFF
          00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          00501933CC6666FF9900B93D33CC6600B93D00B93D009900005019FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFFFFFF7F7F7FFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF005019
          33CC6666FF9933CC6666FF9933CC6633CC6600B93D00B93D009900005019FF00
          FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FF006600
          66FF9933CC6666FF9933CC6666FF9966FF9933CC6600B93D00B93D0099000050
          19FF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFFFFFFFF
          00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FF006600
          66FF9966FF9933CC6666FF99006600CCFFCC66FF9933CC6600B93D00B93D0099
          00005019FF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFFFFFF7F7F7FFF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF006600
          CCFFCC66FF9966FF99006600FF00FF006600CCFFCC66FF9933CC6600B93D00B9
          3D009900005019FF00FFFF00FF7F7F7FFFFFFFFF00FFFFFFFF7F7F7FFF00FF7F
          7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FF006600
          CCFFCCCCFFCC006600FF00FFFF00FFFF00FF006600CCFFCC66FF9933CC6600B9
          3D00B93D005019FF00FFFF00FF7F7F7FFFFFFFFFFFFF7F7F7FFF00FFFF00FFFF
          00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FF006600
          CCFFCC006600FF00FFFF00FFFF00FFFF00FFFF00FF006600CCFFCC66FF9933CC
          6600B93D005019FF00FFFF00FF7F7F7FFFFFFF7F7F7FFF00FFFF00FFFF00FFFF
          00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FF006600
          006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600CCFFCC66FF
          9933CC66005019FF00FFFF00FF7F7F7F7F7F7FFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600CCFF
          CC66FF99005019FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FF7F7F7FFFFFFFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0066
          00CCFFCC005019FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFF7F7F7FFFFFFFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FF006600005019FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7F7F7F7FFFFFFFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FF005019FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFF}
        OptionsImage.NumGlyphs = 2
        TabOrder = 72
      end
      object cbpProductCode: TcxButtonEdit
        Left = 100
        Top = 2
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = cbpProductCodePropertiesButtonClick
        TabOrder = 73
        Text = 'cbpProductCode'
        OnEnter = cbpProductCodeEnter
        OnExit = cbpProductCodeExit
        OnKeyDown = cbpProductCodeKeyDown
        OnKeyUp = cbpProductCodeKeyUp
        Width = 73
      end
      object cbpCompCode: TcxExtLookupComboBox
        Left = 685
        Top = 24
        TabOrder = 74
        Width = 57
      end
    end
    object dxNavBarLeftSide: TdxNavBar
      Left = 1
      Top = 1
      Width = 160
      Height = 407
      Align = alLeft
      ActiveGroupIndex = 0
      TabOrder = 1
      View = 0
      object dxNavGroupSettingProduct: TdxNavBarGroup
        Caption = 'Setting Product'
        SelectedLinkIndex = -1
        TopVisibleLinkIndex = 0
        Links = <
          item
            Item = dxNavItemHistoryPO
          end
          item
            Item = dxNavItemStockCard
          end
          item
            Item = dxNavItemProductSupplier
          end
          item
            Item = dxNavItemUoMConvertion
          end>
      end
      object dxNavGroupOtherInfo: TdxNavBarGroup
        Caption = 'Other Information'
        SelectedLinkIndex = -1
        TopVisibleLinkIndex = 0
        Links = <
          item
            Item = dxNavItemOtherInfo
          end>
      end
      object dxNavItemUoMConvertion: TdxNavBarItem
        Caption = '[ Ctrl-K ] UOM Conversion'
      end
      object dxNavItemProductSupplier: TdxNavBarItem
        Caption = '[ Ctrl-P ] Product Supplier'
      end
      object dxNavItemStockCard: TdxNavBarItem
        Caption = '[ Ctrl-S ] Stock Card'
      end
      object dxNavItemHistoryPO: TdxNavBarItem
        Caption = '[ Ctrl-A ] History PO'
      end
      object dxNavItemOtherInfo: TdxNavBarItem
        Caption = 'Other Information'
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 924
    ExplicitWidth = 924
    object lblInvalid: TcxLabel
      Left = 496
      Top = 8
      Caption = 'Invalid'
      Style.TextColor = clRed
      Properties.LabelEffect = cxleExtrude
      Properties.LabelStyle = cxlsRaised
    end
  end
  inline fraFooter5Button1: TfraFooter5Button [2]
    Left = 0
    Top = 439
    Width = 924
    Height = 56
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitTop = 439
    ExplicitWidth = 924
    inherited pnlFooter: TPanel
      Width = 924
      ExplicitWidth = 924
      inherited btnClose: TcxButton
        Left = 842
        Cancel = False
        OnClick = fraFooter5Button1btnCloseClick
        ExplicitLeft = 842
      end
      inherited btnAdd: TcxButton
        Action = actAddProduct
      end
      inherited btnUpdate: TcxButton
        Action = actEditProduct
      end
      inherited btnDelete: TcxButton
        Action = actDeleteProduct
      end
      inherited btnRefresh: TcxButton
        Action = actRefreshProduct
      end
    end
    inherited pnlSortCut: TPanel
      Width = 924
      ExplicitWidth = 924
      inherited lbl5: TLabel
        Left = 834
        ExplicitLeft = 830
      end
    end
  end
  inherited cxStyle: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 14086654
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = 14548991
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor]
      Color = 15138790
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor]
      Color = 16767449
    end
  end
  object actlst1: TActionList
    Left = 536
    Top = 3
    object actAddProduct: TAction
      Caption = '&Add'
      OnExecute = actAddProductExecute
    end
    object actEditProduct: TAction
      Caption = '&Edit'
      OnExecute = actEditProductExecute
    end
    object actDeleteProduct: TAction
      Caption = '&Delete'
      OnExecute = actDeleteProductExecute
    end
    object actRefreshProduct: TAction
      Caption = '&Refresh'
      OnExecute = actRefreshProductExecute
    end
    object actValidateProduct: TAction
      Caption = 'Validate Product'
      OnExecute = actValidateProductExecute
    end
    object actProductSupplier: TAction
      Caption = 'actProductSupplier'
      OnExecute = actProductSupplierExecute
    end
    object actUomConversion: TAction
      Caption = 'actUomConversion'
      OnExecute = actUomConversionExecute
    end
    object actStockCard: TAction
      Caption = 'actStockCard'
      OnExecute = actStockCardExecute
    end
    object actHistoryPo: TAction
      Caption = 'actHistoryPo'
      OnExecute = actHistoryPoExecute
    end
    object actBonusProduct: TAction
      Caption = 'actBonusProduct'
      OnExecute = actBonusProductExecute
    end
    object actAlokasiStock: TAction
      Caption = 'actAlokasiStock'
      OnExecute = actAlokasiStockExecute
    end
    object actSellingPrice: TAction
      Caption = 'actSellingPrice'
      OnExecute = actSellingPriceExecute
    end
    object actProductTurunan: TAction
      Caption = 'actProductTurunan'
      OnExecute = actProductTurunanExecute
    end
  end
end
