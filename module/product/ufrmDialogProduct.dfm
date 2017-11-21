inherited frmDialogProduct: TfrmDialogProduct
  Left = 307
  Top = 98
  Caption = 'Update Data Barang'
  ClientHeight = 422
  ClientWidth = 819
  Constraints.MinHeight = 32
  Constraints.MinWidth = 130
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 835
  ExplicitHeight = 461
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 819
    Height = 366
    ExplicitWidth = 819
    ExplicitHeight = 366
    object pgcMain: TcxPageControl
      Left = 2
      Top = 2
      Width = 815
      Height = 362
      Align = alClient
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      Properties.ActivePage = tsInfo
      Properties.CustomButtons.Buttons = <>
      Properties.Images = DMClient.imgListButton
      Properties.Rotate = True
      Properties.Style = 9
      Properties.TabCaptionAlignment = taLeftJustify
      Properties.TabHeight = 45
      Properties.TabPosition = tpLeft
      Properties.TabSlants.Kind = skCutCorner
      Properties.TabSlants.Positions = [spRight]
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      TabSlants.Kind = skCutCorner
      TabSlants.Positions = [spRight]
      OnChange = pgcMainChange
      ClientRectBottom = 362
      ClientRectLeft = 137
      ClientRectRight = 815
      ClientRectTop = 0
      object tsInfo: TcxTabSheet
        Caption = 'F1 [Informasi Barang]'
        ImageIndex = 26
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
          Top = 305
          Width = 63
          Height = 16
          Caption = 'Allocation(%)'
          Visible = False
        end
        object lbCatalog: TLabel
          Left = 391
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
        object lbCategory: TLabel
          Left = 13
          Top = 256
          Width = 30
          Height = 16
          Caption = 'Group'
        end
        object lbDivision: TLabel
          Left = 13
          Top = 231
          Width = 63
          Height = 16
          Caption = 'Merchandise'
        end
        object lbGroup: TLabel
          Left = 13
          Top = 306
          Width = 43
          Height = 16
          Caption = 'Kategori'
        end
        object lbHari: TLabel
          Left = 351
          Top = 85
          Width = 21
          Height = 16
          Caption = 'Hari'
        end
        object lbl9: TLabel
          Left = 194
          Top = 11
          Width = 25
          Height = 16
          Caption = 'Merk'
        end
        object lbLocation: TLabel
          Left = 13
          Top = 207
          Width = 44
          Height = 16
          Caption = 'Location'
        end
        object lbOutlet: TLabel
          Left = 13
          Top = 182
          Width = 32
          Height = 16
          Caption = 'Outlet'
        end
        object lbProductCode: TLabel
          Left = 13
          Top = 10
          Width = 67
          Height = 16
          Caption = 'Product Code'
        end
        object lbProductGallon: TLabel
          Left = 459
          Top = 208
          Width = 67
          Height = 16
          Caption = 'Product Code'
          Visible = False
        end
        object lbProductname: TLabel
          Left = 13
          Top = 59
          Width = 69
          Height = 16
          Caption = 'Product Name'
        end
        object lbProductType: TLabel
          Left = 13
          Top = 109
          Width = 65
          Height = 16
          Caption = 'Product Type'
        end
        object lbRefPajak: TLabel
          Left = 13
          Top = 330
          Width = 55
          Height = 16
          Caption = 'Jenis Pajak'
        end
        object lbSafetyStock: TLabel
          Left = 227
          Top = 85
          Width = 63
          Height = 16
          Caption = 'Safety Stock'
        end
        object lbShortname: TLabel
          Left = 13
          Top = 35
          Width = 57
          Height = 16
          Caption = 'Short Name'
        end
        object lbStockCS: TLabel
          Left = 13
          Top = 84
          Width = 46
          Height = 16
          Caption = 'Stock/CS'
        end
        object lbSubCategory: TLabel
          Left = 13
          Top = 281
          Width = 50
          Height = 16
          Caption = 'Sub Group'
        end
        object lbUOMStock: TLabel
          Left = 13
          Top = 134
          Width = 54
          Height = 16
          Caption = 'UOM Stock'
        end
        object lbUOMPurchase: TLabel
          Left = 13
          Top = 158
          Width = 72
          Height = 16
          Caption = 'UOM Purchase'
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
        object cxGroupBox2: TcxGroupBox
          Left = 503
          Top = 241
          Enabled = False
          PanelStyle.Active = True
          TabOrder = 19
          Transparent = True
          Visible = False
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
        object cxLookupJenisPajak: TcxExtLookupComboBox
          Tag = 1
          Left = 101
          Top = 327
          Hint = 'Klik F5 untuk membuat Master Baru'
          ParentShowHint = False
          Properties.CharCase = ecUpperCase
          Properties.ImmediatePost = True
          ShowHint = True
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 16
          Width = 120
        end
        object cxLookupKategori: TcxExtLookupComboBox
          Tag = 1
          Left = 101
          Top = 303
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
          Width = 188
        end
        object cxLookupLocation: TcxExtLookupComboBox
          Tag = 1
          Left = 101
          Top = 203
          Hint = 'Klik F5 untuk membuat Master Baru'
          ParentShowHint = False
          Properties.CharCase = ecUpperCase
          Properties.ImmediatePost = True
          ShowHint = True
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 11
          Width = 188
        end
        object cxLookupMerchan: TcxExtLookupComboBox
          Tag = 1
          Left = 101
          Top = 228
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
          TabOrder = 12
          Width = 188
        end
        object cxLookupMerchanGroup: TcxExtLookupComboBox
          Tag = 1
          Left = 101
          Top = 253
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
          TabOrder = 13
          Width = 188
        end
        object cxLookupMerk: TcxExtLookupComboBox
          Tag = 1
          Left = 225
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
          OnKeyDown = cxLookupMerkKeyDown
          Width = 141
        end
        object cxLookupOutlet: TcxExtLookupComboBox
          Tag = 1
          Left = 101
          Top = 179
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
        object cxLookupSatuan: TcxExtLookupComboBox
          Tag = 1
          Left = 101
          Top = 131
          Hint = 'Klik F5 untuk membuat Master Baru'
          ParentShowHint = False
          Properties.CharCase = ecUpperCase
          Properties.ImmediatePost = True
          Properties.OnEditValueChanged = cxLookupSatuanPropertiesEditValueChanged
          ShowHint = True
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 8
          Width = 120
        end
        object cxLookupSubGroup: TcxExtLookupComboBox
          Tag = 1
          Left = 101
          Top = 278
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
          TabOrder = 14
          Width = 188
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
        object edtAsgrossUOM: TcxTextEdit
          Tag = 2
          Left = 574
          Top = 280
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 20
          Text = 'PCS'
          Visible = False
          Width = 38
        end
        object edtBrgGalong: TcxTextEdit
          Left = 556
          Top = 205
          TabOrder = 21
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
          TabOrder = 22
          Visible = False
          Width = 237
        end
        object edtCatalog: TcxTextEdit
          Tag = 1
          Left = 465
          Top = 7
          HelpType = htKeyword
          HelpKeyword = 'Kode Katalog'
          Properties.CharCase = ecUpperCase
          Style.Color = clWindow
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 2
          Width = 142
        end
        object edtCommonUOM: TcxTextEdit
          Tag = 2
          Left = 574
          Top = 255
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 23
          Text = 'PCS'
          Visible = False
          Width = 38
        end
        object edtProductCode: TcxTextEdit
          Tag = 1
          Left = 101
          Top = 7
          HelpType = htKeyword
          HelpKeyword = 'Kode Produk'
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 6
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 0
          Width = 88
        end
        object edtProductName: TcxTextEdit
          Tag = 1
          Left = 101
          Top = 56
          HelpType = htKeyword
          HelpKeyword = 'Nama Produk'
          Properties.CharCase = ecUpperCase
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 4
          Width = 328
        end
        object edtShortName: TcxTextEdit
          Tag = 1
          Left = 101
          Top = 32
          Properties.CharCase = ecUpperCase
          Properties.OnEditValueChanged = edtShortNamePropertiesEditValueChanged
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 3
          Width = 265
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
        object edtTraderUOM: TcxTextEdit
          Tag = 2
          Left = 574
          Top = 297
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 24
          Text = 'PCS'
          Visible = False
          Width = 38
        end
        object gbOption: TcxGroupBox
          Left = 299
          Top = 111
          PanelStyle.Active = True
          Style.BorderStyle = ebsFlat
          TabOrder = 17
          Transparent = True
          Height = 221
          Width = 130
          object cbTurunan: TcxCheckBox
            AlignWithMargins = True
            Left = 5
            Top = 170
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Is Product Turunan'
            Properties.ImmediatePost = True
            TabOrder = 2
            Transparent = True
            Visible = False
            ExplicitTop = 128
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
            TabOrder = 0
            Transparent = True
          end
          object cbisDecimal: TcxCheckBox
            AlignWithMargins = True
            Left = 5
            Top = 50
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Is Decimal'
            Properties.ImmediatePost = True
            TabOrder = 3
            Transparent = True
            ExplicitTop = 47
          end
          object cbIsTaxInclude: TcxCheckBox
            AlignWithMargins = True
            Left = 5
            Top = 98
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Price Include Tax'
            Properties.ImmediatePost = True
            TabOrder = 4
            Transparent = True
            ExplicitTop = 71
          end
          object cbisDeposit: TcxCheckBox
            AlignWithMargins = True
            Left = 5
            Top = 146
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Product Deposit'
            Properties.ImmediatePost = True
            TabOrder = 6
            Transparent = True
            ExplicitTop = 116
          end
          object chkIsDiscAMC: TcxCheckBox
            AlignWithMargins = True
            Left = 5
            Top = 122
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Is Disc PAS'
            Properties.ImmediatePost = True
            TabOrder = 5
            Transparent = True
            ExplicitTop = 95
          end
          object chkIsBasic: TcxCheckBox
            AlignWithMargins = True
            Left = 5
            Top = 26
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Is Basic Item'
            Properties.ImmediatePost = True
            TabOrder = 1
            Transparent = True
          end
          object chkIsGalon: TcxCheckBox
            AlignWithMargins = True
            Left = 5
            Top = 194
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Is Galon'
            Properties.ImmediatePost = True
            TabOrder = 7
            Transparent = True
            Visible = False
            ExplicitLeft = 7
            ExplicitTop = 170
          end
          object chkPOSLookup: TcxCheckBox
            AlignWithMargins = True
            Left = 5
            Top = 74
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Lookup POS'
            Properties.ImmediatePost = True
            TabOrder = 8
            Transparent = True
          end
        end
        object gbPurchase: TcxGroupBox
          Left = 492
          Top = 267
          Caption = ' Purchase : '
          TabOrder = 18
          Transparent = True
          Visible = False
          Height = 71
          Width = 221
          object lbPLUPurchase: TLabel
            Left = 11
            Top = 21
            Width = 68
            Height = 16
            Caption = 'PLU Purchase'
          end
          object edtPLUPurchase: TcxTextEdit
            Left = 88
            Top = 18
            Properties.CharCase = ecUpperCase
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
            Properties.CharCase = ecUpperCase
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 1
            Width = 225
          end
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
          TabOrder = 25
          Visible = False
          Width = 41
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
          TabOrder = 26
          Visible = False
          Width = 41
        end
        object intedtTraderAllocation: TcxCurrencyEdit
          Left = 532
          Top = 297
          EditValue = 0
          Properties.Alignment.Horz = taRightJustify
          Properties.DecimalPlaces = 0
          Properties.DisplayFormat = ',0;(0)'
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 27
          Visible = False
          Width = 41
        end
        object cxLookupSatPurchase: TcxExtLookupComboBox
          Tag = 1
          Left = 101
          Top = 155
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 9
          Width = 120
        end
      end
      object tsKonversi: TcxTabSheet
        Caption = 'F2 [Konversi Satuan]'
        ImageIndex = 34
        object cxGroupBox1: TcxGroupBox
          Left = 0
          Top = 0
          Align = alClient
          PanelStyle.Active = True
          Style.BorderStyle = ebsNone
          TabOrder = 0
          Height = 362
          Width = 678
          object cxGroupBox3: TcxGroupBox
            Left = 2
            Top = 333
            Align = alBottom
            PanelStyle.Active = True
            Style.BorderStyle = ebsNone
            Style.Edges = [bRight, bBottom]
            TabOrder = 1
            Height = 27
            Width = 674
            object Label2: TLabel
              AlignWithMargins = True
              Left = 508
              Top = 6
              Width = 161
              Height = 18
              Margins.Top = 4
              Margins.Bottom = 1
              Align = alRight
              Caption = 'ALT-T [Tambah]  |  ALT-D [Delete]'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Trebuchet MS'
              Font.Style = []
              ParentFont = False
              ExplicitHeight = 16
            end
            object btnDelKonv: TcxButton
              AlignWithMargins = True
              Left = 85
              Top = 2
              Width = 80
              Height = 23
              Cursor = crHandPoint
              Margins.Left = 0
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alLeft
              Caption = '&Delete'
              OptionsImage.ImageIndex = 8
              OptionsImage.Images = DMClient.imgListButton
              TabOrder = 0
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Trebuchet MS'
              Font.Style = []
              ParentFont = False
              OnClick = btnDelKonvClick
            end
            object btnAddKonversi: TcxButton
              AlignWithMargins = True
              Left = 2
              Top = 2
              Width = 80
              Height = 23
              Cursor = crHandPoint
              Margins.Left = 0
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alLeft
              Caption = '&Tambah'
              LookAndFeel.Kind = lfUltraFlat
              OptionsImage.ImageIndex = 0
              OptionsImage.Images = DMClient.imgListButton
              TabOrder = 1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Trebuchet MS'
              Font.Style = []
              ParentFont = False
              OnClick = btnAddKonversiClick
            end
          end
          object cxGridKonversi: TcxGrid
            Left = 2
            Top = 22
            Width = 674
            Height = 311
            Align = alClient
            TabOrder = 0
            OnExit = cxGridKonversiExit
            LookAndFeel.NativeStyle = False
            object cxGrdDBKonversi: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              FilterRow.ApplyChanges = fracImmediately
              OptionsBehavior.FocusCellOnTab = True
              OptionsBehavior.FocusFirstCellOnNewRecord = True
              OptionsBehavior.GoToNextCellOnEnter = True
              OptionsBehavior.FocusCellOnCycle = True
              OptionsData.Appending = True
              OptionsData.CancelOnExit = False
              OptionsView.GroupByBox = False
              object clKonvSatuan: TcxGridDBColumn
                Caption = 'SATUAN'
                DataBinding.FieldName = 'Satuan'
                PropertiesClassName = 'TcxExtLookupComboBoxProperties'
                Properties.ImmediatePost = True
                Width = 113
              end
              object clKonvValue: TcxGridDBColumn
                Caption = 'KONVERSI (IN PCS)'
                DataBinding.FieldName = 'KONVSAT_SCALE'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.AssignedValues.DisplayFormat = True
                Properties.Nullable = False
                Width = 97
              end
              object clKonvBarcode: TcxGridDBColumn
                Caption = 'BARCODE'
                DataBinding.FieldName = 'KONVSAT_BARCODE'
                PropertiesClassName = 'TcxTextEditProperties'
                Width = 217
              end
            end
            object cxGridLevel2: TcxGridLevel
              GridView = cxGrdDBKonversi
            end
          end
          object cxLabel1: TcxLabel
            Left = 2
            Top = 2
            Align = alTop
            AutoSize = False
            Caption = '** Konversi terhadap satuan terkecil , misal ke PCS **'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Trebuchet MS'
            Style.Font.Style = [fsItalic]
            Style.IsFontAssigned = True
            Properties.Alignment.Horz = taRightJustify
            Height = 20
            Width = 674
            AnchorX = 676
          end
        end
      end
      object tsSupplier: TcxTabSheet
        Caption = 'F3 [Barang Supplier]'
        ImageIndex = 10
        object gbSupplier: TcxGroupBox
          Left = 0
          Top = 146
          Align = alBottom
          PanelStyle.Active = True
          Style.BorderStyle = ebsNone
          TabOrder = 0
          Height = 216
          Width = 678
          object lbSupplier: TLabel
            Left = 72
            Top = 10
            Width = 39
            Height = 16
            Alignment = taRightJustify
            Caption = 'Supplier'
          end
          object lbDays1: TLabel
            Left = 173
            Top = 185
            Width = 24
            Height = 16
            Caption = 'Days'
            Visible = False
          end
          object lbTOP: TLabel
            Left = 92
            Top = 185
            Width = 19
            Height = 16
            Alignment = taRightJustify
            Caption = 'TOP'
            Visible = False
          end
          object lbDays2: TLabel
            Left = 173
            Top = 35
            Width = 24
            Height = 16
            Caption = 'Days'
          end
          object lbDays3: TLabel
            Left = 173
            Top = 60
            Width = 24
            Height = 16
            Caption = 'Days'
          end
          object Label6: TLabel
            Left = 39
            Top = 85
            Width = 72
            Height = 16
            Alignment = taRightJustify
            Caption = 'UOM Purchase'
          end
          object Label7: TLabel
            Left = 37
            Top = 110
            Width = 74
            Height = 16
            Alignment = taRightJustify
            Caption = 'Stock In Order'
          end
          object lbExpiredDate: TLabel
            Left = 47
            Top = 35
            Width = 64
            Height = 16
            Alignment = taRightJustify
            Caption = 'Expired Time'
          end
          object lbDeliveryTime: TLabel
            Left = 44
            Top = 60
            Width = 67
            Height = 16
            Alignment = taRightJustify
            Caption = 'Delivery Time'
          end
          object Label10: TLabel
            Left = 61
            Top = 135
            Width = 50
            Height = 16
            Alignment = taRightJustify
            Caption = 'Min Order'
          end
          object lbSellingPrice: TLabel
            Left = 246
            Top = 185
            Width = 58
            Height = 16
            Alignment = taRightJustify
            Caption = 'Selling Price'
          end
          object lbPurchasePrice: TLabel
            Left = 227
            Top = 35
            Width = 74
            Height = 16
            Alignment = taRightJustify
            Caption = 'Purchase Price'
          end
          object lbDisc1: TLabel
            Left = 274
            Top = 60
            Width = 30
            Height = 16
            Alignment = taRightJustify
            Caption = 'Disc 1'
          end
          object Label15: TLabel
            Left = 360
            Top = 60
            Width = 7
            Height = 16
            Alignment = taRightJustify
            Caption = '%'
          end
          object Label16: TLabel
            Left = 360
            Top = 85
            Width = 7
            Height = 16
            Alignment = taRightJustify
            Caption = '%'
          end
          object lbDisc2: TLabel
            Left = 274
            Top = 85
            Width = 30
            Height = 16
            Alignment = taRightJustify
            Caption = 'Disc 2'
          end
          object lbDisc3: TLabel
            Left = 274
            Top = 110
            Width = 30
            Height = 16
            Alignment = taRightJustify
            Caption = 'Disc 3'
          end
          object lbPurchaseNet: TLabel
            Left = 237
            Top = 135
            Width = 67
            Height = 16
            Alignment = taRightJustify
            Caption = 'Purchase Net'
          end
          object lbMargin: TLabel
            Left = 267
            Top = 160
            Width = 34
            Height = 16
            Alignment = taRightJustify
            Caption = 'Margin'
          end
          object Label21: TLabel
            Left = 360
            Top = 160
            Width = 7
            Height = 16
            Alignment = taRightJustify
            Caption = '%'
          end
          object Label1: TLabel
            Left = 58
            Top = 160
            Width = 53
            Height = 16
            Alignment = taRightJustify
            Caption = 'Max Order'
          end
          object cxLookupSupplier: TcxExtLookupComboBox
            Tag = 1
            Left = 117
            Top = 7
            Hint = 'Klik F5 untuk membuat Master Baru'
            ParentShowHint = False
            Properties.CharCase = ecUpperCase
            Properties.ImmediatePost = True
            ShowHint = True
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 0
            Width = 290
          end
          object spTOP: TcxSpinEdit
            Left = 117
            Top = 182
            Properties.ReadOnly = True
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 15
            Visible = False
            Width = 53
          end
          object spExpiredTime: TcxSpinEdit
            Left = 117
            Top = 32
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 1
            Width = 53
          end
          object spDelivery: TcxSpinEdit
            Left = 117
            Top = 57
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 2
            Width = 53
          end
          object cxLookupBRSUom: TcxExtLookupComboBox
            Tag = 1
            Left = 117
            Top = 82
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 3
            Width = 104
          end
          object crStockInOrder: TcxCurrencyEdit
            Left = 117
            Top = 107
            EditValue = 0.000000000000000000
            Properties.Alignment.Horz = taLeftJustify
            Properties.DisplayFormat = ',0.00;(,0.00)'
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 4
            Width = 50
          end
          object crMinOrder: TcxCurrencyEdit
            Left = 117
            Top = 132
            EditValue = 0.000000000000000000
            Properties.Alignment.Horz = taLeftJustify
            Properties.DisplayFormat = ',0.00;(,0.00)'
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 5
            Width = 50
          end
          object crMaxOrder: TcxCurrencyEdit
            Left = 117
            Top = 157
            EditValue = 0.000000000000000000
            Properties.Alignment.Horz = taLeftJustify
            Properties.DisplayFormat = ',0.00;(,0.00)'
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 6
            Width = 50
          end
          object gbSuppOption: TcxGroupBox
            Left = 413
            Top = 53
            PanelStyle.Active = True
            Style.BorderStyle = ebsNone
            TabOrder = 14
            Transparent = True
            Height = 148
            Width = 132
            object ckActive: TcxCheckBox
              AlignWithMargins = True
              Left = 5
              Top = 50
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alTop
              Caption = 'Active'
              Properties.ImmediatePost = True
              State = cbsChecked
              TabOrder = 1
              Transparent = True
              ExplicitTop = 44
            end
            object ckPrimarySupp: TcxCheckBox
              AlignWithMargins = True
              Left = 5
              Top = 26
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alTop
              Caption = 'Supplier Primer'
              Properties.ImmediatePost = True
              State = cbsChecked
              TabOrder = 0
              Transparent = True
              ExplicitTop = 23
            end
            object ckBKP: TcxCheckBox
              AlignWithMargins = True
              Left = 5
              Top = 74
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alTop
              Caption = 'Barang Kena Pajak'
              Properties.ImmediatePost = True
              State = cbsChecked
              TabOrder = 2
              Transparent = True
              ExplicitTop = 71
            end
            object ckEnableCN: TcxCheckBox
              AlignWithMargins = True
              Left = 5
              Top = 98
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alTop
              Caption = 'Enable CN'
              Properties.ImmediatePost = True
              State = cbsChecked
              TabOrder = 3
              Transparent = True
              ExplicitLeft = 3
              ExplicitTop = 138
            end
            object ckIsSOBlacklist: TcxCheckBox
              AlignWithMargins = True
              Left = 5
              Top = 2
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alTop
              Caption = 'Is SO Blacklist'
              Properties.ImmediatePost = True
              TabOrder = 4
              Transparent = True
            end
          end
          object crBRSSellingPrice: TcxCurrencyEdit
            Left = 307
            Top = 181
            EditValue = 0.000000000000000000
            ParentFont = False
            Properties.Alignment.Horz = taLeftJustify
            Properties.DisplayFormat = ',0.00;(,0.00)'
            Properties.OnEditValueChanged = crBRSSellingPricePropertiesEditValueChanged
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Trebuchet MS'
            Style.Font.Style = []
            Style.LookAndFeel.NativeStyle = False
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 13
            Width = 100
          end
          object crBRSPurchasePrice: TcxCurrencyEdit
            Left = 307
            Top = 32
            EditValue = 0.000000000000000000
            Properties.Alignment.Horz = taLeftJustify
            Properties.DisplayFormat = ',0.00;(,0.00)'
            Properties.OnEditValueChanged = crBRSPurchasePricePropertiesEditValueChanged
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 7
            Width = 100
          end
          object crBRSDisc1: TcxCurrencyEdit
            Left = 307
            Top = 57
            EditValue = 0.000000000000000000
            Properties.Alignment.Horz = taLeftJustify
            Properties.DisplayFormat = ',0.00;(,0.00)'
            Properties.OnEditValueChanged = crBRSDisc1PropertiesEditValueChanged
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 8
            Width = 52
          end
          object crBRSDisc2: TcxCurrencyEdit
            Left = 307
            Top = 82
            EditValue = 0.000000000000000000
            Properties.Alignment.Horz = taLeftJustify
            Properties.DisplayFormat = ',0.00;(,0.00)'
            Properties.OnEditValueChanged = crBRSDisc2PropertiesEditValueChanged
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 9
            Width = 52
          end
          object crBRSDisc3: TcxCurrencyEdit
            Left = 307
            Top = 107
            EditValue = 0.000000000000000000
            Properties.Alignment.Horz = taLeftJustify
            Properties.DisplayFormat = ',0.00;(,0.00)'
            Properties.OnEditValueChanged = crBRSDisc3PropertiesEditValueChanged
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 10
            Width = 100
          end
          object crBRSPurchaseNet: TcxCurrencyEdit
            Left = 307
            Top = 132
            TabStop = False
            EditValue = 0.000000000000000000
            Properties.Alignment.Horz = taLeftJustify
            Properties.DisplayFormat = ',0.00;(,0.00)'
            Properties.ReadOnly = True
            Properties.OnEditValueChanged = crPurchaseNetPropertiesEditValueChanged
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 11
            Width = 100
          end
          object crBRSMargin: TcxCurrencyEdit
            Left = 307
            Top = 157
            EditValue = 0.000000000000000000
            Properties.Alignment.Horz = taLeftJustify
            Properties.DisplayFormat = ',0.00;(,0.00)'
            Properties.OnEditValueChanged = crBRSMarginPropertiesEditValueChanged
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 12
            Width = 52
          end
          object ckFilterSupMG: TcxCheckBox
            Tag = 3
            AlignWithMargins = True
            Left = 418
            Top = 6
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Caption = 'Filtered By Merchan Grup'
            Properties.ImmediatePost = True
            State = cbsChecked
            TabOrder = 16
            Transparent = True
            OnClick = ckFilterSupMGClick
          end
        end
        object gbSupplierGrid: TcxGroupBox
          Left = 0
          Top = 0
          Align = alClient
          PanelStyle.Active = True
          Style.BorderStyle = ebsNone
          TabOrder = 1
          Height = 146
          Width = 678
          object pnlGridSupplierBtn: TcxGroupBox
            Left = 2
            Top = 117
            Align = alBottom
            PanelStyle.Active = True
            Style.BorderStyle = ebsNone
            Style.Edges = [bRight, bBottom]
            TabOrder = 0
            Height = 27
            Width = 674
            object lbSuppShortCut1: TLabel
              AlignWithMargins = True
              Left = 420
              Top = 6
              Width = 249
              Height = 18
              Margins.Top = 4
              Margins.Bottom = 1
              Align = alRight
              Caption = 'ALT-T [Tambah]  | ALT-U [Update]  |  ALT-D [Delete]'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Trebuchet MS'
              Font.Style = []
              ParentFont = False
              ExplicitHeight = 16
            end
            object btnDelSupp: TcxButton
              AlignWithMargins = True
              Left = 168
              Top = 2
              Width = 80
              Height = 23
              Cursor = crHandPoint
              Margins.Left = 0
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alLeft
              Caption = '&Delete'
              OptionsImage.ImageIndex = 8
              OptionsImage.Images = DMClient.imgListButton
              TabOrder = 2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Trebuchet MS'
              Font.Style = []
              ParentFont = False
              OnClick = btnDelSuppClick
            end
            object btnAddSupp: TcxButton
              AlignWithMargins = True
              Left = 2
              Top = 2
              Width = 80
              Height = 23
              Cursor = crHandPoint
              Margins.Left = 0
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alLeft
              Caption = '&Tambah'
              LookAndFeel.Kind = lfUltraFlat
              OptionsImage.ImageIndex = 0
              OptionsImage.Images = DMClient.imgListButton
              TabOrder = 1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Trebuchet MS'
              Font.Style = []
              ParentFont = False
              OnClick = btnAddSuppClick
            end
            object btnUpdateSupp: TcxButton
              AlignWithMargins = True
              Left = 85
              Top = 2
              Width = 80
              Height = 23
              Cursor = crHandPoint
              Margins.Left = 0
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alLeft
              Caption = '&Update'
              OptionsImage.ImageIndex = 13
              OptionsImage.Images = DMClient.imgListButton
              TabOrder = 0
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Trebuchet MS'
              Font.Style = []
              ParentFont = False
              OnClick = btnUpdateSuppClick
            end
          end
          object cxGridSupplier: TcxGrid
            Left = 2
            Top = 2
            Width = 674
            Height = 115
            Align = alClient
            TabOrder = 1
            TabStop = False
            LookAndFeel.Kind = lfUltraFlat
            LookAndFeel.NativeStyle = False
            object cxGrdDBSupplier: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              OnCellClick = cxGrdDBSupplierCellClick
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              FilterRow.ApplyChanges = fracImmediately
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsSelection.CellSelect = False
              OptionsView.GroupByBox = False
              object clSuppPrimer: TcxGridDBColumn
                Caption = 'PRIMER'
                DataBinding.FieldName = 'BRGSUP_IS_PRIMARY'
                PropertiesClassName = 'TcxCheckBoxProperties'
                Properties.ValueChecked = 1
                Properties.ValueUnchecked = 0
                Width = 49
              end
              object clSuppSupplier: TcxGridDBColumn
                Caption = 'SUPPLIER 2'
                DataBinding.FieldName = 'Supplier_Merchan'
                PropertiesClassName = 'TcxExtLookupComboBoxProperties'
                Width = 233
              end
              object clSuppPurchasePrice: TcxGridDBColumn
                Caption = 'PURCH PRICE'
                DataBinding.FieldName = 'BRGSUP_BUY_PRICE'
                Width = 79
              end
              object clSuppDisc1: TcxGridDBColumn
                Caption = 'DISC1 (%)'
                DataBinding.FieldName = 'BRGSUP_DISC1'
                Width = 53
              end
              object clSuppDisc2: TcxGridDBColumn
                Caption = 'DISC2 (%)'
                DataBinding.FieldName = 'BRGSUP_DISC2'
                Width = 53
              end
              object clSuppDisc3: TcxGridDBColumn
                Caption = 'DISC3'
                DataBinding.FieldName = 'BRGSUP_DISC3'
              end
              object clSuppMargin: TcxGridDBColumn
                Caption = 'MARGIN (%)'
                DataBinding.FieldName = 'BRGSUP_MARK_UP'
                Width = 68
              end
              object clSuppActive: TcxGridDBColumn
                Caption = 'ACTIVE'
                DataBinding.FieldName = 'BRGSUP_IS_ACTIVE'
                PropertiesClassName = 'TcxCheckBoxProperties'
                Properties.ValueChecked = 1
                Properties.ValueUnchecked = 0
                Width = 51
              end
            end
            object cxGridSupplierLevel1: TcxGridLevel
              GridView = cxGrdDBSupplier
            end
          end
        end
      end
      object tsSellingPrice: TcxTabSheet
        Caption = 'F4 [Selling Price]'
        ImageIndex = 37
        object gbSellingPrice: TcxGroupBox
          Left = 0
          Top = 180
          Align = alBottom
          PanelStyle.Active = True
          Style.BorderStyle = ebsNone
          TabOrder = 0
          Height = 182
          Width = 678
          object Label3: TLabel
            Left = 16
            Top = 6
            Width = 54
            Height = 16
            Alignment = taRightJustify
            Caption = 'Tipe Harga'
          end
          object Label4: TLabel
            Left = 256
            Top = 8
            Width = 34
            Height = 16
            Alignment = taRightJustify
            Caption = 'Satuan'
          end
          object Label5: TLabel
            Left = 385
            Top = 7
            Width = 19
            Height = 16
            Alignment = taRightJustify
            Caption = 'Qty'
          end
          object cxLookupTipeHarga: TcxExtLookupComboBox
            Tag = 1
            Left = 76
            Top = 4
            Hint = 'Klik F5 untuk membuat Master Baru'
            ParentShowHint = False
            Properties.CharCase = ecUpperCase
            Properties.ImmediatePost = True
            ShowHint = True
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 0
            Width = 166
          end
          object cxLookupSatuanJual: TcxExtLookupComboBox
            Tag = 1
            Left = 296
            Top = 4
            Properties.ImmediatePost = True
            Properties.OnEditValueChanged = cxLookupSatuanJualPropertiesEditValueChanged
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 1
            Width = 82
          end
          object crKonversi: TcxCurrencyEdit
            Left = 410
            Top = 4
            TabStop = False
            EditValue = 0.000000000000000000
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;(,0.00)'
            Properties.ReadOnly = True
            Style.Color = clInfoBk
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 2
            Width = 52
          end
          object pnlSellingPriceProp: TcxGroupBox
            Left = 18
            Top = 27
            PanelStyle.Active = True
            Style.BorderStyle = ebsNone
            TabOrder = 3
            Height = 157
            Width = 232
            object Label8: TLabel
              Left = 51
              Top = 6
              Width = 58
              Height = 16
              Alignment = taRightJustify
              Caption = 'Selling Price'
            end
            object Label9: TLabel
              Left = 47
              Top = 31
              Width = 62
              Height = 16
              Alignment = taRightJustify
              Caption = 'Discount (%)'
            end
            object Label11: TLabel
              Left = 42
              Top = 56
              Width = 67
              Height = 16
              Alignment = taRightJustify
              Caption = 'Discount (Rp)'
            end
            object Label14: TLabel
              Left = 42
              Top = 129
              Width = 67
              Height = 16
              Alignment = taRightJustify
              Caption = 'Selling Margin'
            end
            object Label13: TLabel
              Left = 19
              Top = 105
              Width = 90
              Height = 16
              Alignment = taRightJustify
              Caption = 'Selling Price Coret'
            end
            object Label23: TLabel
              Left = 22
              Top = 80
              Width = 87
              Height = 16
              Alignment = taRightJustify
              Caption = 'Selling Price Net'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Trebuchet MS'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object crSellingPrice: TcxCurrencyEdit
              Left = 115
              Top = 3
              EditValue = 0.000000000000000000
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00;(,0.00)'
              Properties.OnEditValueChanged = crSellingPricePropertiesEditValueChanged
              Style.LookAndFeel.NativeStyle = False
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.NativeStyle = False
              TabOrder = 0
              Width = 109
            end
            object crSellDiscPercent: TcxCurrencyEdit
              Left = 115
              Top = 28
              EditValue = 0.000000000000000000
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00;(,0.00)'
              Properties.OnEditValueChanged = crSellDiscPercentPropertiesEditValueChanged
              Style.LookAndFeel.NativeStyle = False
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.NativeStyle = False
              TabOrder = 1
              Width = 109
            end
            object crSellDiscRP: TcxCurrencyEdit
              Left = 115
              Top = 53
              EditValue = 0.000000000000000000
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00;(,0.00)'
              Properties.OnEditValueChanged = crSellDiscRPPropertiesEditValueChanged
              Style.LookAndFeel.NativeStyle = False
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.NativeStyle = False
              TabOrder = 2
              Width = 109
            end
            object crSellingPriceNet: TcxCurrencyEdit
              Left = 115
              Top = 76
              TabStop = False
              EditValue = 0.000000000000000000
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00;(,0.00)'
              Properties.ReadOnly = True
              Style.Color = clInfoBk
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -12
              Style.Font.Name = 'Trebuchet MS'
              Style.Font.Style = []
              Style.LookAndFeel.NativeStyle = False
              Style.IsFontAssigned = True
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.NativeStyle = False
              TabOrder = 3
              Width = 109
            end
            object crSellingPriceCoret: TcxCurrencyEdit
              Left = 115
              Top = 102
              EditValue = 0.000000000000000000
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00;(,0.00)'
              Style.LookAndFeel.NativeStyle = False
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.NativeStyle = False
              TabOrder = 4
              Width = 109
            end
            object crSellMargin: TcxCurrencyEdit
              Left = 115
              Top = 126
              TabStop = False
              EditValue = 0.000000000000000000
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00;(,0.00)'
              Properties.ReadOnly = True
              Style.Color = clInfoBk
              Style.LookAndFeel.NativeStyle = False
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.NativeStyle = False
              TabOrder = 5
              Width = 109
            end
          end
          object pnlSellingPriceDisc: TcxGroupBox
            Left = 266
            Top = 35
            PanelStyle.Active = True
            Style.BorderStyle = ebsUltraFlat
            TabOrder = 4
            Height = 133
            Width = 362
            object Label12: TLabel
              Left = 134
              Top = 7
              Width = 19
              Height = 16
              Alignment = taRightJustify
              Caption = 'Qty'
            end
            object Label17: TLabel
              Left = 134
              Top = 32
              Width = 19
              Height = 16
              Alignment = taRightJustify
              Caption = 'Qty'
            end
            object Label18: TLabel
              Left = 41
              Top = 81
              Width = 41
              Height = 16
              Alignment = taRightJustify
              Caption = 'Mark Up'
            end
            object Label19: TLabel
              Left = 14
              Top = 106
              Width = 68
              Height = 16
              Alignment = taRightJustify
              Caption = 'Max QTY Disc'
            end
            object Label20: TLabel
              Left = 160
              Top = 81
              Width = 46
              Height = 16
              Alignment = taRightJustify
              Caption = 'Purchase'
            end
            object Label22: TLabel
              Left = 157
              Top = 106
              Width = 49
              Height = 16
              Alignment = taRightJustify
              Caption = 'AVG PRice'
            end
            object ckLimitCrazyPrice: TcxCheckBox
              Left = 3
              Top = 4
              Caption = 'Is Limit Crazy Price'
              TabOrder = 0
            end
            object ckIsADS: TcxCheckBox
              Left = 3
              Top = 29
              Caption = 'Is ADS'
              TabOrder = 3
            end
            object ckIsMailer: TcxCheckBox
              Left = 3
              Top = 54
              Caption = 'Is Mailer'
              TabOrder = 6
            end
            object crLimitQTYCrazy: TcxCurrencyEdit
              Left = 158
              Top = 4
              EditValue = 0.000000000000000000
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00;(,0.00)'
              Style.LookAndFeel.NativeStyle = False
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.NativeStyle = False
              TabOrder = 1
              Width = 52
            end
            object crLimitPriceCrazy: TcxCurrencyEdit
              Left = 212
              Top = 4
              EditValue = 0.000000000000000000
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00;(,0.00)'
              Style.LookAndFeel.NativeStyle = False
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.NativeStyle = False
              TabOrder = 2
              Width = 133
            end
            object crPriceADS: TcxCurrencyEdit
              Left = 212
              Top = 29
              EditValue = 0.000000000000000000
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00;(,0.00)'
              Style.LookAndFeel.NativeStyle = False
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.NativeStyle = False
              TabOrder = 5
              Width = 133
            end
            object crQTYADS: TcxCurrencyEdit
              Left = 158
              Top = 29
              EditValue = 0.000000000000000000
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00;(,0.00)'
              Style.LookAndFeel.NativeStyle = False
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.NativeStyle = False
              TabOrder = 4
              Width = 52
            end
            object crSellMarkUP: TcxCurrencyEdit
              Left = 87
              Top = 78
              EditValue = 0.000000000000000000
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00;(,0.00)'
              Style.LookAndFeel.NativeStyle = False
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.NativeStyle = False
              TabOrder = 7
              Width = 52
            end
            object crMaxQTYDisc: TcxCurrencyEdit
              Left = 87
              Top = 103
              EditValue = 0.000000000000000000
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00;(,0.00)'
              Style.LookAndFeel.NativeStyle = False
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.NativeStyle = False
              TabOrder = 8
              Width = 52
            end
            object crLastPurchasePrice: TcxCurrencyEdit
              Left = 212
              Top = 78
              TabStop = False
              EditValue = 0.000000000000000000
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00;(,0.00)'
              Properties.ReadOnly = True
              Style.Color = clInfoBk
              Style.LookAndFeel.NativeStyle = False
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.NativeStyle = False
              TabOrder = 9
              Width = 133
            end
            object crAveragePrice: TcxCurrencyEdit
              Left = 212
              Top = 103
              TabStop = False
              EditValue = 0.000000000000000000
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00;(,0.00)'
              Properties.ReadOnly = True
              Style.Color = clInfoBk
              Style.LookAndFeel.NativeStyle = False
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.NativeStyle = False
              TabOrder = 10
              Width = 133
            end
          end
        end
        object gbSellingPriceGrid: TcxGroupBox
          Left = 0
          Top = 0
          Align = alClient
          PanelStyle.Active = True
          Style.BorderStyle = ebsNone
          TabOrder = 1
          Height = 180
          Width = 678
          object cxGroupBox5: TcxGroupBox
            Left = 2
            Top = 151
            Align = alBottom
            PanelStyle.Active = True
            Style.BorderStyle = ebsNone
            Style.Edges = [bRight, bBottom]
            TabOrder = 0
            Height = 27
            Width = 674
            object Label29: TLabel
              AlignWithMargins = True
              Left = 420
              Top = 6
              Width = 249
              Height = 18
              Margins.Top = 4
              Margins.Bottom = 1
              Align = alRight
              Caption = 'ALT-T [Tambah]  | ALT-U [Update]  |  ALT-D [Delete]'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Trebuchet MS'
              Font.Style = []
              ParentFont = False
              ExplicitHeight = 16
            end
            object btnDeletePrice: TcxButton
              AlignWithMargins = True
              Left = 168
              Top = 2
              Width = 80
              Height = 23
              Cursor = crHandPoint
              Margins.Left = 0
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alLeft
              Caption = '&Delete'
              OptionsImage.ImageIndex = 8
              OptionsImage.Images = DMClient.imgListButton
              TabOrder = 2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Trebuchet MS'
              Font.Style = []
              ParentFont = False
              OnClick = btnDeletePriceClick
            end
            object btnAddPrice: TcxButton
              AlignWithMargins = True
              Left = 2
              Top = 2
              Width = 80
              Height = 23
              Cursor = crHandPoint
              Margins.Left = 0
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alLeft
              Caption = '&Tambah'
              LookAndFeel.Kind = lfUltraFlat
              OptionsImage.ImageIndex = 0
              OptionsImage.Images = DMClient.imgListButton
              TabOrder = 1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Trebuchet MS'
              Font.Style = []
              ParentFont = False
              OnClick = btnAddPriceClick
            end
            object btnUpdatePrice: TcxButton
              AlignWithMargins = True
              Left = 85
              Top = 2
              Width = 80
              Height = 23
              Cursor = crHandPoint
              Margins.Left = 0
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alLeft
              Caption = '&Update'
              OptionsImage.ImageIndex = 13
              OptionsImage.Images = DMClient.imgListButton
              TabOrder = 0
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Trebuchet MS'
              Font.Style = []
              ParentFont = False
              OnClick = btnUpdatePriceClick
            end
          end
          object cxGridSellingPrice: TcxGrid
            Left = 2
            Top = 2
            Width = 674
            Height = 149
            Align = alClient
            TabOrder = 1
            TabStop = False
            LookAndFeel.NativeStyle = False
            object cxGrdDBSellingPrice: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              OnCellClick = cxGrdDBSellingPriceCellClick
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              FilterRow.ApplyChanges = fracImmediately
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsSelection.CellSelect = False
              OptionsView.GroupByBox = False
              object clSellTipeHarga: TcxGridDBColumn
                Caption = 'TIPE HARGA'
                DataBinding.FieldName = 'TipeHarga'
                PropertiesClassName = 'TcxExtLookupComboBoxProperties'
                HeaderAlignmentHorz = taCenter
                Width = 142
              end
              object clSellSatuan: TcxGridDBColumn
                Caption = 'SATUAN'
                DataBinding.FieldName = 'Satuan'
                PropertiesClassName = 'TcxExtLookupComboBoxProperties'
                HeaderAlignmentHorz = taCenter
                Width = 81
              end
              object clSellPrice: TcxGridDBColumn
                Caption = 'SELLING PRICE'
                DataBinding.FieldName = 'BHJ_SELL_PRICE'
                HeaderAlignmentHorz = taRightJustify
                Width = 107
              end
              object clSellDiscPercent: TcxGridDBColumn
                Caption = 'DISC %'
                DataBinding.FieldName = 'BHJ_DISC_PERSEN'
                HeaderAlignmentHorz = taRightJustify
                Width = 83
              end
              object clSellDiscRP: TcxGridDBColumn
                Caption = 'DISC RP'
                DataBinding.FieldName = 'BHJ_DISC_NOMINAL'
                HeaderAlignmentHorz = taRightJustify
                Width = 70
              end
              object clSellPriceMargin: TcxGridDBColumn
                Caption = 'MARGIN'
                DataBinding.FieldName = 'BHJ_MARK_UP'
                HeaderAlignmentHorz = taRightJustify
              end
              object cxGrdDBSellingPriceColumn1: TcxGridDBColumn
                Caption = 'SELLING PRICE (NET)'
                DataBinding.FieldName = 'BHJ_SELL_PRICE_DISC'
                HeaderAlignmentHorz = taRightJustify
                Width = 117
              end
            end
            object cxGridLevel1: TcxGridLevel
              GridView = cxGrdDBSellingPrice
            end
          end
        end
      end
      object cxTabSheet1: TcxTabSheet
        Caption = 'F7 [Alokasi Stock]'
        Enabled = False
      end
      object cxTabSheet2: TcxTabSheet
        Caption = 'F6 [History PO]'
        Enabled = False
      end
      object tsImport: TcxTabSheet
        Caption = 'Import Data'
        ImageIndex = 6
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 678
          Height = 33
          Align = alTop
          BevelOuter = bvNone
          Color = 14079702
          TabOrder = 0
          object btnImport: TcxButton
            AlignWithMargins = True
            Left = 411
            Top = 2
            Width = 129
            Height = 29
            Cursor = crHandPoint
            Margins.Top = 2
            Margins.Bottom = 2
            Align = alRight
            Caption = 'Load From XLS'
            OptionsImage.ImageIndex = 6
            OptionsImage.Images = DMClient.imgListButton
            TabOrder = 0
            OnClick = btnImportClick
          end
          object edFileName: TcxButtonEdit
            Tag = 2
            AlignWithMargins = True
            Left = 3
            Top = 3
            Align = alClient
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.OnButtonClick = edFileNamePropertiesButtonClick
            TabOrder = 1
            Text = 'D:\Products.xlsx'
            Width = 402
          end
          object cxButton1: TcxButton
            AlignWithMargins = True
            Left = 546
            Top = 2
            Width = 129
            Height = 29
            Cursor = crHandPoint
            Margins.Top = 2
            Margins.Bottom = 2
            Align = alRight
            Caption = 'Proses Import'
            OptionsImage.ImageIndex = 34
            OptionsImage.Images = DMClient.imgListButton
            TabOrder = 2
            OnClick = cxButton1Click
          end
        end
        object cxGrid1: TcxGrid
          Left = 0
          Top = 33
          Width = 493
          Height = 329
          Align = alClient
          TabOrder = 1
          LockedStateImageOptions.Text = 'Mohon ditunggu...'
          LookAndFeel.NativeStyle = False
          object cxGrdXLS: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            FindPanel.DisplayMode = fpdmManual
            FindPanel.InfoText = 'ketik teks yang dicari...'
            DataController.Filter.Options = [fcoCaseInsensitive]
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            FilterRow.InfoText = 
              'Klik untuk memfilter data / Atau gunakan CTRL-F untuk panel filt' +
              'er'
            FilterRow.Visible = True
            FilterRow.ApplyChanges = fracDelayed
            NewItemRow.InfoText = 'Baris baru'
            OptionsData.Editing = False
            OptionsView.NoDataToDisplayInfoText = '<Data kosong>'
            Styles.ContentEven = DMClient.cxStyleGridEven
            Styles.Header = DMClient.cxStyleGridHeader
          end
          object cxGridLevel3: TcxGridLevel
            GridView = cxGrdXLS
          end
        end
        object mmLog: TMemo
          Left = 493
          Top = 33
          Width = 185
          Height = 329
          Align = alRight
          Lines.Strings = (
            'mmLog')
          ScrollBars = ssBoth
          TabOrder = 2
        end
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 366
    Width = 819
    ExplicitTop = 366
    ExplicitWidth = 819
    inherited pnlFooter: TPanel
      Width = 819
      ExplicitWidth = 819
      inherited btnClose: TcxButton
        Left = 742
        Action = actDelete
        ExplicitLeft = 742
      end
      inherited btnSave: TcxButton
        Left = 649
        Action = actSave
        ExplicitLeft = 649
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 572
        Action = actPrint
        ExplicitLeft = 572
      end
    end
    inherited pnlSortCut: TPanel
      Width = 819
      ExplicitWidth = 819
      inherited lbCTRLEnter: TLabel
        Left = 644
        Height = 15
        ExplicitLeft = 644
      end
      inherited lbEscape: TLabel
        Left = 735
        Height = 15
        ExplicitLeft = 735
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 568
        Height = 15
        ExplicitLeft = 568
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 768
    Top = 192
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
  object OpDialog: TOpenDialog
    Filter = 'Excel 2007 above|*.xlsx'
    Left = 883
    Top = 244
  end
end
