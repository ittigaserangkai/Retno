inherited frmDialogProduct: TfrmDialogProduct
  Left = 307
  Top = 98
  Caption = 'frmDialogProduct'
  ClientHeight = 481
  ClientWidth = 758
  Constraints.MinHeight = 32
  Constraints.MinWidth = 130
  OldCreateOrder = True
  ExplicitWidth = 774
  ExplicitHeight = 520
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 758
    Height = 425
    ExplicitWidth = 758
    ExplicitHeight = 425
    object lbl2: TLabel
      Left = 13
      Top = 6
      Width = 67
      Height = 16
      Caption = 'Product Code'
    end
    object lbl3: TLabel
      Left = 13
      Top = 52
      Width = 57
      Height = 16
      Caption = 'Short Name'
    end
    object lbl4: TLabel
      Left = 13
      Top = 29
      Width = 69
      Height = 16
      Caption = 'Product Name'
    end
    object lbl5: TLabel
      Left = 13
      Top = 75
      Width = 46
      Height = 16
      Caption = 'Stock/CS'
    end
    object lbl6: TLabel
      Left = 13
      Top = 100
      Width = 65
      Height = 16
      Caption = 'Product Type'
    end
    object lbl8: TLabel
      Left = 13
      Top = 125
      Width = 54
      Height = 16
      Caption = 'UOM Stock'
    end
    object lbl10: TLabel
      Left = 13
      Top = 150
      Width = 32
      Height = 16
      Caption = 'Outlet'
    end
    object lbl23: TLabel
      Left = 431
      Top = 7
      Width = 70
      Height = 16
      Caption = 'Catalog Code'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4246527
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl26: TLabel
      Left = 13
      Top = 276
      Width = 30
      Height = 16
      Caption = 'Group'
    end
    object lbl27: TLabel
      Left = 13
      Top = 200
      Width = 39
      Height = 16
      Caption = 'Division'
    end
    object lbl20: TLabel
      Left = 13
      Top = 301
      Width = 72
      Height = 16
      Caption = 'Sales Tax Code'
    end
    object lbl7: TLabel
      Left = 13
      Top = 175
      Width = 44
      Height = 16
      Caption = 'Location'
    end
    object lbl30: TLabel
      Left = 13
      Top = 225
      Width = 47
      Height = 16
      Caption = 'Category'
    end
    object lbl31: TLabel
      Left = 13
      Top = 251
      Width = 67
      Height = 16
      Caption = 'Sub Category'
    end
    object lbl21: TLabel
      Left = 531
      Top = 254
      Width = 63
      Height = 16
      Caption = 'Allocation(%)'
      Visible = False
    end
    object lbl22: TLabel
      Left = 531
      Top = 279
      Width = 63
      Height = 16
      Caption = 'Allocation(%)'
      Visible = False
    end
    object lbl24: TLabel
      Left = 531
      Top = 304
      Width = 63
      Height = 16
      Caption = 'Allocation(%)'
      Visible = False
    end
    object Label1: TLabel
      Left = 13
      Top = 326
      Width = 67
      Height = 16
      Caption = 'Product Code'
      Visible = False
    end
    object Label3: TLabel
      Left = 13
      Top = 352
      Width = 34
      Height = 16
      Caption = 'Author'
    end
    object Label4: TLabel
      Left = 13
      Top = 377
      Width = 45
      Height = 16
      Caption = 'Publisher'
    end
    object lblLabel2: TLabel
      Left = 309
      Top = 279
      Width = 63
      Height = 16
      Caption = 'Safety Stock'
    end
    object lbl9: TLabel
      Left = 373
      Top = 9
      Width = 33
      Height = 16
      Caption = '(Merk)'
    end
    object Label2: TLabel
      Left = 453
      Top = 279
      Width = 21
      Height = 16
      Caption = 'Hari'
    end
    object cbTurunan: TcxCheckBox
      Left = 308
      Top = 79
      Caption = 'Is Product Turunan'
      TabOrder = 16
      OnKeyPress = cbTurunanKeyPress
    end
    object edtProductCode: TEdit
      Left = 101
      Top = 6
      Width = 70
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      OnKeyPress = edtProductCodeKeyPress
    end
    object edtShortName: TEdit
      Left = 101
      Top = 52
      Width = 309
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
      OnKeyPress = edtShortNameKeyPress
    end
    object edtBrandName: TEdit
      Left = 101
      Top = 29
      Width = 309
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      OnExit = edtBrandNameExit
      OnKeyPress = edtBrandNameKeyPress
    end
    object edtCatalog: TEdit
      Left = 507
      Top = 6
      Width = 247
      Height = 22
      Color = 10150911
      Ctl3D = False
      MaxLength = 13
      ParentCtl3D = False
      TabOrder = 29
      OnKeyPress = edtCatalogKeyPress
    end
    object cbActive: TcxCheckBox
      Left = 308
      Top = 99
      Caption = 'Is Active'
      TabOrder = 17
      OnKeyPress = cbActiveKeyPress
    end
    object pnl1: TPanel
      Left = 429
      Top = 126
      Width = 327
      Height = 59
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Enabled = False
      TabOrder = 31
      object lbl25: TLabel
        Left = 13
        Top = 31
        Width = 47
        Height = 16
        Caption = 'Last Cost'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl41: TLabel
        Left = 236
        Top = 30
        Width = 6
        Height = 16
        Caption = '/'
      end
      object lbl29: TLabel
        Left = 13
        Top = 7
        Width = 62
        Height = 16
        Caption = 'PKM Average'
      end
      object jvcuredtLastCost: TcxCurrencyEdit
        Left = 127
        Top = 29
        TabOrder = 1
        Width = 107
      end
      object edtLastCOGSUOM: TEdit
        Left = 245
        Top = 29
        Width = 41
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 3
        Text = 'CRT'
      end
      object edtAverageSlsUOM: TEdit
        Left = 190
        Top = 5
        Width = 38
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 2
        Text = 'CRT'
      end
      object edtAverageSls: TcxCurrencyEdit
        Left = 127
        Top = 5
        TabOrder = 0
        Width = 62
      end
    end
    object cbisDecimal: TcxCheckBox
      Left = 308
      Top = 120
      Caption = 'Is Decimal'
      TabOrder = 18
      OnKeyPress = cbisDecimalKeyPress
    end
    object cbIsTaxInclude: TcxCheckBox
      Left = 308
      Top = 141
      Caption = 'Price Include Tax'
      TabOrder = 19
      OnKeyPress = cbIsTaxIncludeKeyPress
    end
    object grpPurchase: TGroupBox
      Left = 429
      Top = 31
      Width = 326
      Height = 93
      Caption = 'Purchase: '
      TabOrder = 30
      object lbl28: TLabel
        Left = 8
        Top = 19
        Width = 68
        Height = 16
        Caption = 'PLU Purchase'
      end
      object lbl1: TLabel
        Left = 7
        Top = 66
        Width = 72
        Height = 16
        Caption = 'UOM Purchase'
        Visible = False
      end
      object edtPLUPurchase: TEdit
        Left = 82
        Top = 18
        Width = 70
        Height = 22
        Ctl3D = False
        MaxLength = 7
        ParentCtl3D = False
        TabOrder = 0
        OnExit = edtPLUPurchaseExit
        OnKeyUp = edtPLUPurchaseKeyUp
      end
      object edtProductPurchase: TEdit
        Left = 82
        Top = 41
        Width = 235
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
      end
      object edtUOMName: TEdit
        Left = 153
        Top = 64
        Width = 100
        Height = 22
        Ctl3D = False
        MaxLength = 6
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 2
        Visible = False
      end
      object edtUOMPurchase: TEdit
        Left = 82
        Top = 64
        Width = 65
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 3
        Visible = False
      end
    end
    object intedtCommonAllocation: TcxCurrencyEdit
      Left = 596
      Top = 251
      EditValue = 0
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = ',0;(0)'
      Style.Color = clWindow
      TabOrder = 23
      Visible = False
      OnExit = intedtCommonAllocationExit
      Width = 41
    end
    object edtCommonUOM: TEdit
      Left = 638
      Top = 251
      Width = 38
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 24
      Text = 'PCS'
      Visible = False
    end
    object edtAsgrossUOM: TEdit
      Left = 638
      Top = 276
      Width = 38
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 26
      Text = 'PCS'
      Visible = False
    end
    object intedtAsgrossAllocation: TcxCurrencyEdit
      Left = 596
      Top = 276
      EditValue = 0
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = ',0;(0)'
      TabOrder = 25
      Visible = False
      OnExit = intedtCommonAllocationExit
      Width = 41
    end
    object intedtTraderAllocation: TcxCurrencyEdit
      Left = 596
      Top = 301
      EditValue = 0
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = ',0;(0)'
      TabOrder = 27
      Visible = False
      OnExit = intedtCommonAllocationExit
      Width = 41
    end
    object edtTraderUOM: TEdit
      Left = 638
      Top = 301
      Width = 38
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 28
      Text = 'PCS'
      Visible = False
    end
    object cbisDeposit: TcxCheckBox
      Left = 308
      Top = 161
      Caption = 'Product Deposit'
      TabOrder = 20
      OnKeyPress = cbIsTaxIncludeKeyPress
    end
    object cbpStok: TComboBox
      Left = 101
      Top = 75
      Width = 125
      Height = 24
      BevelKind = bkFlat
      Style = csDropDownList
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 4
      Items.Strings = (
        'STOK'
        'CS')
    end
    object cbpProductType: TComboBox
      Left = 101
      Top = 100
      Width = 145
      Height = 24
      BevelKind = bkFlat
      Style = csDropDownList
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 5
    end
    object cbpUOMStok: TComboBox
      Left = 101
      Top = 125
      Width = 145
      Height = 24
      BevelKind = bkFlat
      Style = csDropDownList
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 6
    end
    object cbpOutlet: TComboBox
      Left = 101
      Top = 150
      Width = 145
      Height = 24
      BevelKind = bkFlat
      Style = csDropDownList
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 7
    end
    object cbpLocation: TComboBox
      Left = 101
      Top = 175
      Width = 145
      Height = 24
      BevelKind = bkFlat
      Style = csDropDownList
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 8
    end
    object cbpTax: TComboBox
      Left = 101
      Top = 301
      Width = 145
      Height = 24
      BevelKind = bkFlat
      Style = csDropDownList
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 9
    end
    object cbpMerchan: TComboBox
      Left = 101
      Top = 200
      Width = 145
      Height = 24
      BevelKind = bkFlat
      Style = csDropDownList
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 10
      OnChange = cbpMerchanChange
    end
    object cbpMerchanGrup: TComboBox
      Left = 101
      Top = 225
      Width = 145
      Height = 24
      BevelKind = bkFlat
      Style = csDropDownList
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 11
      OnChange = cbpMerchanGrupChange
    end
    object cbpSubGroup: TComboBox
      Left = 101
      Top = 251
      Width = 145
      Height = 24
      BevelKind = bkFlat
      Style = csDropDownList
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 12
      OnChange = cbpSubGroupChange
    end
    object cbpKategori: TComboBox
      Left = 101
      Top = 276
      Width = 145
      Height = 24
      BevelKind = bkFlat
      Style = csDropDownList
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 13
    end
    object chkIsGalon: TcxCheckBox
      Left = 308
      Top = 183
      Caption = 'Is Galon'
      TabOrder = 21
      Visible = False
      OnClick = chkIsGalonClick
      OnKeyPress = cbIsTaxIncludeKeyPress
    end
    object edtBrgGalong: TEdit
      Left = 101
      Top = 326
      Width = 70
      Height = 22
      Ctl3D = False
      MaxLength = 6
      ParentCtl3D = False
      TabOrder = 14
      Visible = False
      OnKeyDown = edtBrgGalongKeyDown
    end
    object edtBrgNamaGalon: TEdit
      Left = 172
      Top = 326
      Width = 238
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 15
      Visible = False
      OnKeyPress = edtProductNameKeyPress
    end
    object chkIsDiscAMC: TcxCheckBox
      Left = 308
      Top = 206
      Caption = 'Is Disc AMC'
      TabOrder = 22
      OnClick = chkIsGalonClick
      OnKeyPress = cbIsTaxIncludeKeyPress
    end
    object edtAuthorId: TEdit
      Left = 101
      Top = 350
      Width = 68
      Height = 22
      Hint = 'TEKAN F5 UNTUK LOOKUP'
      Ctl3D = False
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 32
      Text = '00000'
      OnKeyDown = edtAuthorIdKeyDown
    end
    object edtAuthorNm: TEdit
      Left = 172
      Top = 350
      Width = 237
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 33
      Text = 'TIDAK ADA'
    end
    object edtPubsID: TEdit
      Left = 101
      Top = 374
      Width = 68
      Height = 22
      Hint = 'TEKAN F5 UNTUK LOOKUP'
      Ctl3D = False
      ParentCtl3D = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 34
      Text = '00000'
      OnKeyDown = edtPubsIDKeyDown
    end
    object edtPubsNm: TEdit
      Left = 172
      Top = 374
      Width = 237
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 35
      Text = 'TIDAK ADA'
    end
    object edtSSSubGroup: TcxCurrencyEdit
      Left = 248
      Top = 276
      Hint = 'Safety Stock Default yang di ambil dari Sub Group'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 36
      Visible = False
      Width = 49
    end
    object edtSSBARANG: TcxCurrencyEdit
      Left = 376
      Top = 276
      TabOrder = 37
      Width = 73
    end
    object chkIsBasic: TcxCheckBox
      Left = 308
      Top = 230
      Caption = 'Is Basic Item'
      TabOrder = 38
      OnClick = chkIsGalonClick
      OnKeyPress = chkIsBasicKeyPress
    end
    object cbbProductName: TComboBox
      Left = 178
      Top = 4
      Width = 189
      Height = 24
      TabOrder = 1
      OnKeyPress = cbbProductNameKeyPress
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 425
    Width = 758
    ExplicitTop = 425
    ExplicitWidth = 758
    inherited pnlFooter: TPanel
      Width = 758
      ExplicitWidth = 758
      inherited btnClose: TcxButton
        Left = 676
        ExplicitLeft = 676
      end
      inherited btnSave: TcxButton
        Left = 591
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 591
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
    end
    inherited pnlSortCut: TPanel
      Width = 758
      ExplicitWidth = 758
      inherited lbCTRLEnter: TLabel
        Height = 16
        ExplicitHeight = 16
      end
      inherited lbEscape: TLabel
        Height = 16
      end
      inherited lbCTRLDel: TLabel
        Height = 16
        ExplicitHeight = 16
      end
    end
  end
  object ActionList1: TActionList
    Left = 672
    Top = 62
    object actPluIsActive: TAction
      Caption = 'actPluIsActive'
    end
  end
end
