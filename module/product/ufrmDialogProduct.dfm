inherited frmDialogProduct: TfrmDialogProduct
  Left = 307
  Top = 98
  Caption = 'Update Data Barang'
  ClientHeight = 422
  ClientWidth = 917
  Constraints.MinHeight = 32
  Constraints.MinWidth = 130
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 933
  ExplicitHeight = 461
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 917
    Height = 366
    ExplicitWidth = 776
    ExplicitHeight = 390
    object pgcMain: TcxPageControl
      Left = 2
      Top = 2
      Width = 913
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
      Properties.ActivePage = tsKonversi
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
      ExplicitLeft = -126
      ExplicitTop = 3
      ExplicitWidth = 772
      ExplicitHeight = 386
      ClientRectBottom = 362
      ClientRectLeft = 137
      ClientRectRight = 913
      ClientRectTop = 0
      object tsInfo: TcxTabSheet
        Caption = 'F1 [Informasi Barang]'
        ImageIndex = 26
        ExplicitLeft = 0
        ExplicitTop = 32
        ExplicitWidth = 772
        ExplicitHeight = 354
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
        object lbCategory: TLabel
          Left = 13
          Top = 233
          Width = 30
          Height = 16
          Caption = 'Group'
        end
        object lbDivision: TLabel
          Left = 13
          Top = 208
          Width = 63
          Height = 16
          Caption = 'Merchandise'
        end
        object lbGroup: TLabel
          Left = 13
          Top = 283
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
          Left = 200
          Top = 10
          Width = 25
          Height = 32
          Caption = 'Merk'#13#10
        end
        object lbLocation: TLabel
          Left = 13
          Top = 184
          Width = 44
          Height = 16
          Caption = 'Location'
        end
        object lbOutlet: TLabel
          Left = 13
          Top = 159
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
          Top = 34
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
          Top = 307
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
          Top = 59
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
          Top = 258
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
          Left = 441
          Top = 137
          Enabled = False
          PanelStyle.Active = True
          TabOrder = 18
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
        object cxLookupJenisPajak: TcxExtLookupComboBox
          Tag = 1
          Left = 101
          Top = 304
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
          TabOrder = 19
          Text = 'PCS'
          Visible = False
          Width = 38
        end
        object edtBrgGalong: TcxTextEdit
          Left = 556
          Top = 205
          TabOrder = 20
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
          TabOrder = 21
          Visible = False
          Width = 237
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
        object edtCommonUOM: TcxTextEdit
          Tag = 2
          Left = 574
          Top = 255
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 22
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
          Width = 92
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
          TabOrder = 23
          Text = 'PCS'
          Visible = False
          Width = 38
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
            TabOrder = 2
            Transparent = True
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
            TabOrder = 0
            Transparent = True
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
            TabOrder = 3
            Transparent = True
            ExplicitTop = 71
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
            TabOrder = 4
            Transparent = True
            ExplicitTop = 95
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
            ExplicitTop = 119
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
            TabOrder = 1
            Transparent = True
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
        object gbPurchase: TcxGroupBox
          Left = 440
          Top = 35
          Caption = ' Purchase : '
          TabOrder = 17
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
          object cxLookupSatPurchase: TcxExtLookupComboBox
            Tag = 1
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
          TabOrder = 24
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
          TabOrder = 25
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
          TabOrder = 26
          Visible = False
          Width = 41
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
          Width = 776
          object cxGroupBox3: TcxGroupBox
            Left = 2
            Top = 333
            Align = alBottom
            PanelStyle.Active = True
            Style.BorderStyle = ebsNone
            Style.Edges = [bRight, bBottom]
            TabOrder = 1
            Height = 27
            Width = 772
            object Label2: TLabel
              AlignWithMargins = True
              Left = 606
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
              ExplicitLeft = 168
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
              ExplicitTop = 0
            end
          end
          object cxGridKonversi: TcxGrid
            Left = 2
            Top = 22
            Width = 772
            Height = 311
            Align = alClient
            TabOrder = 0
            LookAndFeel.NativeStyle = False
            ExplicitTop = 2
            ExplicitWidth = 766
            ExplicitHeight = 331
            object cxGrdDBKonversi: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              OnCellClick = cxGrdDBSupplierCellClick
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              FilterRow.ApplyChanges = fracImmediately
              OptionsBehavior.FocusCellOnTab = True
              OptionsBehavior.FocusFirstCellOnNewRecord = True
              OptionsBehavior.GoToNextCellOnEnter = True
              OptionsBehavior.FocusCellOnCycle = True
              OptionsData.Appending = True
              OptionsView.GroupByBox = False
              object clKonvSatuan: TcxGridDBColumn
                DataBinding.FieldName = 'Satuan'
                PropertiesClassName = 'TcxExtLookupComboBoxProperties'
                Width = 83
              end
              object clKonvValue: TcxGridDBColumn
                Caption = 'Konversi'
                DataBinding.FieldName = 'KONVSAT_SCALE'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.AssignedValues.DisplayFormat = True
                Properties.Nullable = False
                Width = 68
              end
              object clKonvBarcode: TcxGridDBColumn
                Caption = 'Barcode'
                DataBinding.FieldName = 'KONVSAT_BARCODE'
                Width = 406
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
            Width = 772
            AnchorX = 774
          end
        end
      end
      object tsSupplier: TcxTabSheet
        Caption = 'F3 [Barang Supplier]'
        ImageIndex = 10
        ExplicitLeft = 0
        ExplicitTop = 32
        ExplicitWidth = 772
        ExplicitHeight = 354
        object gbSupplier: TcxGroupBox
          Left = 0
          Top = 146
          Align = alBottom
          PanelStyle.Active = True
          Style.BorderStyle = ebsNone
          TabOrder = 0
          ExplicitTop = 138
          Height = 216
          Width = 776
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
            Top = 29
            PanelStyle.Active = True
            Style.BorderStyle = ebsNone
            TabOrder = 14
            Transparent = True
            Height = 122
            Width = 132
            object ckActive: TcxCheckBox
              AlignWithMargins = True
              Left = 5
              Top = 23
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alTop
              Caption = 'Active'
              Properties.ImmediatePost = True
              State = cbsChecked
              TabOrder = 1
              Transparent = True
              ExplicitWidth = 121
            end
            object ckPrimer: TcxCheckBox
              AlignWithMargins = True
              Left = 5
              Top = 2
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alTop
              Caption = 'Supplier Primer'
              Properties.ImmediatePost = True
              State = cbsChecked
              TabOrder = 0
              Transparent = True
              ExplicitWidth = 121
            end
            object ckBKP: TcxCheckBox
              AlignWithMargins = True
              Left = 5
              Top = 65
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alTop
              Caption = 'Barang Kena Pajak'
              Properties.ImmediatePost = True
              State = cbsChecked
              TabOrder = 2
              Transparent = True
              ExplicitLeft = 7
              ExplicitTop = 74
              ExplicitWidth = 121
            end
            object ckEnableCN: TcxCheckBox
              AlignWithMargins = True
              Left = 5
              Top = 44
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alTop
              Caption = 'Enable CN'
              Properties.ImmediatePost = True
              State = cbsChecked
              TabOrder = 3
              Transparent = True
              OnKeyDown = ckEnableCNKeyDown
              ExplicitLeft = 13
              ExplicitTop = 50
              ExplicitWidth = 121
            end
          end
          object crBRSSellingPrice: TcxCurrencyEdit
            Left = 307
            Top = 182
            EditValue = 0.000000000000000000
            Properties.Alignment.Horz = taLeftJustify
            Properties.DisplayFormat = ',0.00;(,0.00)'
            Properties.OnEditValueChanged = crBRSSellingPricePropertiesEditValueChanged
            Style.LookAndFeel.NativeStyle = False
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
        end
        object gbSupplierGrid: TcxGroupBox
          Left = 0
          Top = 0
          Align = alClient
          PanelStyle.Active = True
          Style.BorderStyle = ebsNone
          TabOrder = 1
          Height = 146
          Width = 776
          object pnlGridSupplierBtn: TcxGroupBox
            Left = 2
            Top = 117
            Align = alBottom
            PanelStyle.Active = True
            Style.BorderStyle = ebsNone
            Style.Edges = [bRight, bBottom]
            TabOrder = 0
            ExplicitTop = 109
            Height = 27
            Width = 772
            object lbSuppShortCut1: TLabel
              AlignWithMargins = True
              Left = 518
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
              TabOrder = 0
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
              TabOrder = 2
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
            Width = 772
            Height = 115
            Align = alClient
            TabOrder = 1
            TabStop = False
            LookAndFeel.Kind = lfUltraFlat
            LookAndFeel.NativeStyle = False
            ExplicitTop = 1
            ExplicitWidth = 766
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
                Caption = 'Primer'
                DataBinding.FieldName = 'BRGSUP_IS_PRIMARY'
                PropertiesClassName = 'TcxCheckBoxProperties'
                Properties.ValueChecked = 1
                Properties.ValueUnchecked = 0
                Width = 49
              end
              object clSuppSupplier: TcxGridDBColumn
                DataBinding.FieldName = 'Supplier'
                PropertiesClassName = 'TcxExtLookupComboBoxProperties'
                Width = 233
              end
              object clSuppPurchasePrice: TcxGridDBColumn
                Caption = 'Purchase Price'
                DataBinding.FieldName = 'BRGSUP_BUY_PRICE'
                Width = 79
              end
              object clSuppDisc1: TcxGridDBColumn
                Caption = 'Disc 1 (%)'
                DataBinding.FieldName = 'BRGSUP_DISC1'
                Width = 53
              end
              object clSuppDisc2: TcxGridDBColumn
                Caption = 'Disc 2 (%)'
                DataBinding.FieldName = 'BRGSUP_DISC2'
                Width = 53
              end
              object clSuppDisc3: TcxGridDBColumn
                Caption = 'Disc 3'
                DataBinding.FieldName = 'BRGSUP_DISC3'
              end
              object clSuppMargin: TcxGridDBColumn
                Caption = 'Margin (%)'
                DataBinding.FieldName = 'BRGSUP_MARK_UP'
                Width = 57
              end
              object clSuppActive: TcxGridDBColumn
                Caption = 'Active'
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
        ExplicitLeft = 0
        ExplicitTop = 32
        ExplicitWidth = 772
        ExplicitHeight = 354
        object gbSellingPrice: TcxGroupBox
          Left = 0
          Top = 146
          Align = alBottom
          PanelStyle.Active = True
          Style.BorderStyle = ebsNone
          TabOrder = 0
          ExplicitTop = 138
          Height = 216
          Width = 776
          object Label3: TLabel
            Left = 14
            Top = 9
            Width = 54
            Height = 16
            Alignment = taRightJustify
            Caption = 'Tipe Harga'
          end
          object Label4: TLabel
            Left = 34
            Top = 34
            Width = 34
            Height = 16
            Alignment = taRightJustify
            Caption = 'Satuan'
          end
          object Label5: TLabel
            Left = 25
            Top = 58
            Width = 43
            Height = 16
            Alignment = taRightJustify
            Caption = 'Konversi'
          end
          object cxExtLookupComboBox1: TcxExtLookupComboBox
            Tag = 1
            Left = 74
            Top = 6
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
            Width = 156
          end
          object cxExtLookupComboBox2: TcxExtLookupComboBox
            Tag = 1
            Left = 74
            Top = 31
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 1
            Width = 82
          end
          object cxCurrencyEdit1: TcxCurrencyEdit
            Left = 74
            Top = 55
            EditValue = 0.000000000000000000
            Properties.Alignment.Horz = taLeftJustify
            Properties.DisplayFormat = ',0.00;(,0.00)'
            Properties.OnEditValueChanged = crBRSMarginPropertiesEditValueChanged
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 2
            Width = 52
          end
        end
        object gbSellingPriceGrid: TcxGroupBox
          Left = 0
          Top = 0
          Align = alClient
          PanelStyle.Active = True
          Style.BorderStyle = ebsNone
          TabOrder = 1
          Height = 146
          Width = 776
          object cxGroupBox5: TcxGroupBox
            Left = 2
            Top = 117
            Align = alBottom
            PanelStyle.Active = True
            Style.BorderStyle = ebsNone
            Style.Edges = [bRight, bBottom]
            TabOrder = 0
            ExplicitTop = 109
            Height = 27
            Width = 772
            object Label29: TLabel
              AlignWithMargins = True
              Left = 518
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
              TabOrder = 0
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Trebuchet MS'
              Font.Style = []
              ParentFont = False
              OnClick = btnDelSuppClick
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
              OnClick = btnAddSuppClick
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
              TabOrder = 2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Trebuchet MS'
              Font.Style = []
              ParentFont = False
              OnClick = btnUpdateSuppClick
            end
          end
          object cxGridSellingPrice: TcxGrid
            Left = 2
            Top = 2
            Width = 772
            Height = 115
            Align = alClient
            TabOrder = 1
            TabStop = False
            LookAndFeel.NativeStyle = False
            ExplicitWidth = 768
            ExplicitHeight = 107
            object cxGrdDBSellingPrice: TcxGridDBTableView
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
            end
            object cxGridLevel1: TcxGridLevel
              GridView = cxGrdDBSellingPrice
            end
          end
        end
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 366
    Width = 917
    ExplicitTop = 390
    ExplicitWidth = 776
    inherited pnlFooter: TPanel
      Width = 917
      ExplicitWidth = 776
      inherited btnClose: TcxButton
        Left = 840
        Action = actDelete
        ExplicitLeft = 699
      end
      inherited btnSave: TcxButton
        Left = 747
        Action = actSave
        ExplicitLeft = 606
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 670
        ExplicitLeft = 529
      end
    end
    inherited pnlSortCut: TPanel
      Width = 917
      ExplicitWidth = 776
      inherited lbCTRLEnter: TLabel
        Left = 742
        ExplicitLeft = 601
      end
      inherited lbEscape: TLabel
        Left = 833
        ExplicitLeft = 692
      end
      inherited lblCTRLP: TLabel
        Left = 666
        ExplicitLeft = 525
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 712
    Top = 168
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
end
