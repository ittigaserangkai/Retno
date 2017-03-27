inherited frmDialogProduct: TfrmDialogProduct
  Left = 307
  Top = 98
  Caption = 'Update Data Barang'
  ClientHeight = 408
  ClientWidth = 776
  Constraints.MinHeight = 32
  Constraints.MinWidth = 130
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 792
  ExplicitHeight = 447
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 776
    Height = 352
    ExplicitWidth = 776
    ExplicitHeight = 352
    object lbProductCode: TLabel
      Left = 13
      Top = 10
      Width = 67
      Height = 16
      Caption = 'Product Code'
    end
    object lbShortname: TLabel
      Left = 13
      Top = 59
      Width = 57
      Height = 16
      Caption = 'Short Name'
    end
    object lbProductname: TLabel
      Left = 13
      Top = 34
      Width = 69
      Height = 16
      Caption = 'Product Name'
    end
    object lbStockCS: TLabel
      Left = 13
      Top = 84
      Width = 46
      Height = 16
      Caption = 'Stock/CS'
    end
    object lbProductType: TLabel
      Left = 13
      Top = 109
      Width = 65
      Height = 16
      Caption = 'Product Type'
    end
    object lbUOMStock: TLabel
      Left = 13
      Top = 134
      Width = 54
      Height = 16
      Caption = 'UOM Stock'
    end
    object lbOutlet: TLabel
      Left = 13
      Top = 159
      Width = 32
      Height = 16
      Caption = 'Outlet'
    end
    object lbCatalog: TLabel
      Left = 433
      Top = 10
      Width = 70
      Height = 16
      Caption = 'Catalog Code'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbGroup: TLabel
      Left = 13
      Top = 283
      Width = 43
      Height = 16
      Caption = 'Kategori'
    end
    object lbDivision: TLabel
      Left = 13
      Top = 208
      Width = 63
      Height = 16
      Caption = 'Merchandise'
    end
    object lbRefPajak: TLabel
      Left = 13
      Top = 308
      Width = 55
      Height = 16
      Caption = 'Jenis Pajak'
    end
    object lbLocation: TLabel
      Left = 13
      Top = 184
      Width = 44
      Height = 16
      Caption = 'Location'
    end
    object lbCategory: TLabel
      Left = 13
      Top = 233
      Width = 30
      Height = 16
      Caption = 'Group'
    end
    object lbSubCategory: TLabel
      Left = 13
      Top = 258
      Width = 50
      Height = 16
      Caption = 'Sub Group'
    end
    object lbAlloc1: TLabel
      Left = 467
      Top = 258
      Width = 63
      Height = 16
      Caption = 'Allocation(%)'
      Visible = False
    end
    object lbAlloc2: TLabel
      Left = 467
      Top = 283
      Width = 63
      Height = 16
      Caption = 'Allocation(%)'
      Visible = False
    end
    object lbAlloc3: TLabel
      Left = 467
      Top = 308
      Width = 63
      Height = 16
      Caption = 'Allocation(%)'
      Visible = False
    end
    object lbProductGallon: TLabel
      Left = 459
      Top = 208
      Width = 67
      Height = 16
      Caption = 'Product Code'
      Visible = False
    end
    object lbSafetyStock: TLabel
      Left = 227
      Top = 85
      Width = 63
      Height = 16
      Caption = 'Safety Stock'
    end
    object lbl9: TLabel
      Left = 200
      Top = 10
      Width = 25
      Height = 32
      Caption = 'Merk'#13#10
    end
    object lbHari: TLabel
      Left = 351
      Top = 85
      Width = 21
      Height = 16
      Caption = 'Hari'
    end
    object edtShortName: TcxTextEdit
      Tag = 1
      Left = 101
      Top = 56
      Properties.CharCase = ecUpperCase
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 4
      Width = 309
    end
    object edtProductName: TcxTextEdit
      Tag = 1
      Left = 101
      Top = 31
      HelpType = htKeyword
      HelpKeyword = 'Nama Produk'
      Properties.CharCase = ecUpperCase
      Properties.OnEditValueChanged = edtProductNamePropertiesEditValueChanged
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 3
      Width = 309
    end
    object edtCatalog: TcxTextEdit
      Tag = 1
      Left = 507
      Top = 7
      HelpType = htKeyword
      HelpKeyword = 'Kode Katalog'
      Properties.CharCase = ecUpperCase
      Style.Color = clMoneyGreen
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 2
      Width = 239
    end
    object intedtCommonAllocation: TcxCurrencyEdit
      Left = 532
      Top = 255
      EditValue = 0
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = ',0;(0)'
      Style.Color = clWindow
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 19
      Visible = False
      Width = 41
    end
    object edtCommonUOM: TcxTextEdit
      Tag = 2
      Left = 574
      Top = 255
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 20
      Text = 'PCS'
      Visible = False
      Width = 38
    end
    object edtAsgrossUOM: TcxTextEdit
      Tag = 2
      Left = 574
      Top = 280
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 22
      Text = 'PCS'
      Visible = False
      Width = 38
    end
    object intedtAsgrossAllocation: TcxCurrencyEdit
      Left = 532
      Top = 280
      EditValue = 0
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = ',0;(0)'
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 21
      Visible = False
      Width = 41
    end
    object intedtTraderAllocation: TcxCurrencyEdit
      Left = 532
      Top = 305
      EditValue = 0
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = ',0;(0)'
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 23
      Visible = False
      Width = 41
    end
    object edtTraderUOM: TcxTextEdit
      Tag = 2
      Left = 574
      Top = 305
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 24
      Text = 'PCS'
      Visible = False
      Width = 38
    end
    object cbStock: TcxComboBox
      Tag = 1
      Left = 101
      Top = 81
      ParentShowHint = False
      Properties.CharCase = ecUpperCase
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'STOCK'
        'CS')
      ShowHint = True
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 5
      Text = 'STOCK'
      Width = 120
    end
    object cxLookupTipeBarang: TcxExtLookupComboBox
      Tag = 1
      Left = 101
      Top = 106
      Hint = 'Klik F5 untuk membuat Master Baru'
      ParentShowHint = False
      Properties.CharCase = ecUpperCase
      Properties.ImmediatePost = True
      ShowHint = True
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 7
      Width = 188
    end
    object cxLookupSatuan: TcxExtLookupComboBox
      Tag = 1
      Left = 101
      Top = 131
      Hint = 'Klik F5 untuk membuat Master Baru'
      ParentShowHint = False
      Properties.CharCase = ecUpperCase
      Properties.ImmediatePost = True
      ShowHint = True
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 8
      Width = 120
    end
    object cxLookupOutlet: TcxExtLookupComboBox
      Tag = 1
      Left = 101
      Top = 156
      Hint = 'Klik F5 untuk membuat Master Baru'
      ParentShowHint = False
      Properties.CharCase = ecUpperCase
      Properties.ImmediatePost = True
      ShowHint = True
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 9
      Width = 188
    end
    object cxLookupLocation: TcxExtLookupComboBox
      Tag = 1
      Left = 101
      Top = 180
      Hint = 'Klik F5 untuk membuat Master Baru'
      ParentShowHint = False
      Properties.CharCase = ecUpperCase
      Properties.ImmediatePost = True
      ShowHint = True
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 10
      Width = 188
    end
    object cxLookupJenisPajak: TcxExtLookupComboBox
      Tag = 1
      Left = 101
      Top = 305
      Hint = 'Klik F5 untuk membuat Master Baru'
      ParentShowHint = False
      Properties.CharCase = ecUpperCase
      Properties.ImmediatePost = True
      ShowHint = True
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 15
      Width = 120
    end
    object cxLookupMerchan: TcxExtLookupComboBox
      Tag = 1
      Left = 101
      Top = 205
      Hint = 'Klik F5 untuk membuat Master Baru'
      ParentShowHint = False
      Properties.CharCase = ecUpperCase
      Properties.ImmediatePost = True
      Properties.OnEditValueChanged = cxLookupMerchanPropertiesEditValueChanged
      ShowHint = True
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 11
      Width = 188
    end
    object cxLookupMerchanGroup: TcxExtLookupComboBox
      Tag = 1
      Left = 101
      Top = 230
      Hint = 'Klik F5 untuk membuat Master Baru'
      ParentShowHint = False
      Properties.CharCase = ecUpperCase
      Properties.ImmediatePost = True
      Properties.OnEditValueChanged = cxLookupMerchanGroupPropertiesEditValueChanged
      ShowHint = True
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 12
      Width = 188
    end
    object cxLookupSubGroup: TcxExtLookupComboBox
      Tag = 1
      Left = 101
      Top = 255
      Hint = 'Klik F5 untuk membuat Master Baru'
      ParentShowHint = False
      Properties.CharCase = ecUpperCase
      Properties.ImmediatePost = True
      Properties.OnEditValueChanged = cxLookupSubGroupPropertiesEditValueChanged
      ShowHint = True
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 13
      Width = 188
    end
    object cxLookupKategori: TcxExtLookupComboBox
      Tag = 1
      Left = 101
      Top = 280
      Hint = 'Klik F5 untuk membuat Master Baru'
      ParentShowHint = False
      Properties.CharCase = ecUpperCase
      Properties.ImmediatePost = True
      ShowHint = True
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 14
      Width = 188
    end
    object edtBrgGalong: TcxTextEdit
      Left = 556
      Top = 205
      TabOrder = 17
      Visible = False
      Width = 68
    end
    object edtBrgNamaGalon: TcxTextEdit
      Left = 532
      Top = 205
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 18
      Visible = False
      Width = 237
    end
    object cxLookupMerk: TcxExtLookupComboBox
      Tag = 1
      Left = 227
      Top = 7
      Hint = 'Klik F5 untuk membuat Master Baru'
      HelpType = htKeyword
      HelpKeyword = 'Merk'
      ParentShowHint = False
      Properties.CharCase = ecUpperCase
      Properties.ImmediatePost = True
      Properties.OnEditValueChanged = cxLookupMerkPropertiesEditValueChanged
      ShowHint = True
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonStyle = btsDefault
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 1
      Width = 183
    end
    object edtProductCode: TcxTextEdit
      Tag = 1
      Left = 101
      Top = 7
      HelpType = htKeyword
      HelpKeyword = 'Kode Produk'
      Properties.CharCase = ecUpperCase
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      Width = 92
    end
    object gbPurchase: TcxGroupBox
      Left = 440
      Top = 35
      Caption = ' Purchase : '
      Enabled = False
      TabOrder = 25
      Transparent = True
      Height = 96
      Width = 323
      object lbPLUPurchase: TLabel
        Left = 11
        Top = 21
        Width = 68
        Height = 16
        Caption = 'PLU Purchase'
      end
      object lbUOMPurchase: TLabel
        Left = 11
        Top = 70
        Width = 72
        Height = 16
        Caption = 'UOM Purchase'
        Visible = False
      end
      object edtPLUPurchase: TcxTextEdit
        Left = 88
        Top = 18
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Width = 70
      end
      object edtProductPurchase: TcxTextEdit
        Left = 88
        Top = 42
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        Width = 225
      end
      object cxExtLookupComboBox1: TcxExtLookupComboBox
        Left = 88
        Top = 67
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        Width = 129
      end
    end
    object cxGroupBox2: TcxGroupBox
      Left = 441
      Top = 137
      Enabled = False
      PanelStyle.Active = True
      TabOrder = 26
      Transparent = True
      Height = 62
      Width = 321
      object lbPKMAvg: TLabel
        Left = 13
        Top = 9
        Width = 62
        Height = 16
        Caption = 'PKM Average'
      end
      object lbLastCost: TLabel
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
        Left = 194
        Top = 33
        Width = 6
        Height = 16
        Caption = '/'
      end
      object jvcuredtLastCost: TcxCurrencyEdit
        Left = 87
        Top = 30
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Width = 107
      end
      object edtAverageSls: TcxCurrencyEdit
        Left = 87
        Top = 6
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        Width = 62
      end
      object edtAverageSlsUOM: TcxTextEdit
        Tag = 2
        Left = 150
        Top = 6
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        Text = 'CRT'
        Width = 38
      end
      object edtLastCOGSUOM: TcxTextEdit
        Tag = 2
        Left = 201
        Top = 30
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 3
        Text = 'CRT'
        Width = 41
      end
    end
    object gbOption: TcxGroupBox
      Left = 299
      Top = 111
      PanelStyle.Active = True
      Style.BorderStyle = ebsFlat
      TabOrder = 16
      Transparent = True
      Height = 202
      Width = 132
      object cbTurunan: TcxCheckBox
        AlignWithMargins = True
        Left = 5
        Top = 44
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        Caption = 'Is Product Turunan'
        Properties.ImmediatePost = True
        TabOrder = 0
        Transparent = True
        ExplicitTop = 2
        ExplicitWidth = 121
      end
      object cbActive: TcxCheckBox
        AlignWithMargins = True
        Left = 5
        Top = 2
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        Caption = 'Is Active'
        Properties.ImmediatePost = True
        TabOrder = 1
        Transparent = True
        ExplicitLeft = 13
        ExplicitTop = 0
        ExplicitWidth = 121
      end
      object cbisDecimal: TcxCheckBox
        AlignWithMargins = True
        Left = 5
        Top = 65
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        Caption = 'Is Decimal'
        Properties.ImmediatePost = True
        TabOrder = 2
        Transparent = True
        ExplicitTop = 50
        ExplicitWidth = 121
      end
      object cbIsTaxInclude: TcxCheckBox
        AlignWithMargins = True
        Left = 5
        Top = 86
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        Caption = 'Price Include Tax'
        Properties.ImmediatePost = True
        TabOrder = 3
        Transparent = True
        ExplicitTop = 74
        ExplicitWidth = 121
      end
      object cbisDeposit: TcxCheckBox
        AlignWithMargins = True
        Left = 5
        Top = 128
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        Caption = 'Product Deposit'
        Properties.ImmediatePost = True
        TabOrder = 6
        Transparent = True
        ExplicitTop = 140
        ExplicitWidth = 121
      end
      object chkIsDiscAMC: TcxCheckBox
        AlignWithMargins = True
        Left = 5
        Top = 107
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        Caption = 'Is Disc PAS'
        Properties.ImmediatePost = True
        TabOrder = 5
        Transparent = True
        ExplicitLeft = 7
        ExplicitTop = 106
        ExplicitWidth = 121
      end
      object chkIsBasic: TcxCheckBox
        AlignWithMargins = True
        Left = 5
        Top = 23
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        Caption = 'Is Basic Item'
        Properties.ImmediatePost = True
        TabOrder = 4
        Transparent = True
        ExplicitLeft = 7
        ExplicitTop = 26
        ExplicitWidth = 121
      end
      object chkIsGalon: TcxCheckBox
        AlignWithMargins = True
        Left = 5
        Top = 149
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        Caption = 'Is Galon'
        Properties.ImmediatePost = True
        TabOrder = 7
        Transparent = True
        Visible = False
        ExplicitTop = 170
        ExplicitWidth = 121
      end
    end
    object edtSSBARANG: TcxSpinEdit
      Left = 295
      Top = 82
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 6
      Width = 53
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 352
    Width = 776
    ExplicitTop = 352
    ExplicitWidth = 776
    inherited pnlFooter: TPanel
      Width = 776
      ExplicitWidth = 776
      inherited btnClose: TcxButton
        Left = 699
        Action = actDelete
        ExplicitLeft = 699
      end
      inherited btnSave: TcxButton
        Left = 606
        Action = actSave
        ExplicitLeft = 606
      end
      inherited btnDelete: TcxButton
        Action = actDelete
        ExplicitLeft = 4
        ExplicitTop = 5
      end
    end
    inherited pnlSortCut: TPanel
      Width = 776
      ExplicitWidth = 776
      inherited lbCTRLEnter: TLabel
        Left = 601
        ExplicitLeft = 601
      end
      inherited lbEscape: TLabel
        Left = 692
        ExplicitLeft = 692
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 664
    Top = 240
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
end
