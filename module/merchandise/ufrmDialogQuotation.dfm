inherited frmDialogQuotation: TfrmDialogQuotation
  Left = 30
  Top = 143
  Caption = 'Input Quotation'
  ClientHeight = 611
  ClientWidth = 968
  Constraints.MinHeight = 32
  ExplicitTop = -205
  ExplicitWidth = 984
  ExplicitHeight = 650
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 968
    Height = 555
    BevelInner = bvNone
    BevelOuter = bvNone
    ExplicitWidth = 968
    ExplicitHeight = 555
    object cxGroupBox1: TcxGroupBox
      Left = 0
      Top = 0
      Align = alTop
      PanelStyle.Active = True
      Style.BorderStyle = ebsNone
      TabOrder = 0
      Transparent = True
      DesignSize = (
        968
        80)
      Height = 80
      Width = 968
      object Label6: TLabel
        Left = 48
        Top = 53
        Width = 45
        Height = 16
        Alignment = taRightJustify
        Caption = 'Suppplier'
      end
      object Label7: TLabel
        Left = 17
        Top = 30
        Width = 76
        Height = 16
        Alignment = taRightJustify
        Caption = 'Merchan Group'
      end
      object Label8: TLabel
        Left = 353
        Top = 7
        Width = 59
        Height = 16
        Alignment = taRightJustify
        Caption = 'Effective At'
      end
      object Label9: TLabel
        Left = 510
        Top = 7
        Width = 45
        Height = 16
        Alignment = taRightJustify
        Caption = 'End Date'
      end
      object Label10: TLabel
        Left = 373
        Top = 30
        Width = 37
        Height = 16
        Alignment = taRightJustify
        Caption = 'Remark'
      end
      object Label11: TLabel
        Left = 25
        Top = 7
        Width = 67
        Height = 16
        Alignment = taRightJustify
        Caption = 'Quotation No'
      end
      object cxLookupSupplierMerchan: TcxExtLookupComboBox
        Tag = 1
        Left = 99
        Top = 50
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
        Width = 227
      end
      object cxLookupMerchan: TcxExtLookupComboBox
        Tag = 1
        Left = 99
        Top = 27
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
        TabOrder = 1
        Width = 227
      end
      object dtEffective: TcxDateEdit
        AlignWithMargins = True
        Left = 417
        Top = 4
        Margins.Top = 4
        Margins.Bottom = 4
        EditValue = 0d
        Properties.DateButtons = [btnClear, btnToday]
        Properties.SaveTime = False
        Properties.ShowTime = False
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        Width = 87
      end
      object dtEnd: TcxDateEdit
        AlignWithMargins = True
        Left = 561
        Top = 4
        Margins.Top = 4
        Margins.Bottom = 4
        EditValue = 0d
        Properties.DateButtons = [btnClear, btnToday]
        Properties.SaveTime = False
        Properties.ShowTime = False
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 3
        Width = 87
      end
      object ckIsMailer: TcxCheckBox
        Left = 260
        Top = 4
        Caption = 'Is Mailer'
        Properties.Alignment = taLeftJustify
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        State = cbsGrayed
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 4
        Transparent = True
      end
      object edQuotNo: TcxTextEdit
        Tag = 1
        Left = 99
        Top = 4
        HelpType = htKeyword
        HelpKeyword = 'Nama Produk'
        Properties.CharCase = ecUpperCase
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 5
        Width = 155
      end
      object mmRemark: TcxMemo
        Left = 417
        Top = 28
        TabOrder = 6
        Height = 47
        Width = 231
      end
      object gbSuppOption: TcxGroupBox
        Left = 662
        Top = 0
        PanelStyle.Active = True
        Style.BorderStyle = ebsNone
        TabOrder = 7
        Transparent = True
        Height = 49
        Width = 259
        object ckShowPPN: TcxCheckBox
          AlignWithMargins = True
          Left = 5
          Top = 2
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alTop
          Caption = 'Tampilkan Harga Beli +PPN'
          Properties.ImmediatePost = True
          Properties.OnEditValueChanged = ckShowPPNPropertiesEditValueChanged
          State = cbsChecked
          TabOrder = 0
          Transparent = True
        end
        object chkUpdateSellPrice: TcxCheckBox
          AlignWithMargins = True
          Left = 5
          Top = 26
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alTop
          Caption = 'Perubahan Harga Beli Merubah Sell Price'
          Properties.ImmediatePost = True
          State = cbsChecked
          TabOrder = 1
          Transparent = True
        end
      end
      object btnActivate: TcxButton
        AlignWithMargins = True
        Left = 877
        Top = 50
        Width = 86
        Height = 28
        Cursor = crHandPoint
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Anchors = [akTop, akRight]
        Caption = 'Aktifkan'
        LookAndFeel.Kind = lfUltraFlat
        OptionsImage.ImageIndex = 13
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 8
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnActivateClick
      end
    end
    object cxGridMaster: TcxGrid
      AlignWithMargins = True
      Left = 3
      Top = 83
      Width = 869
      Height = 311
      Align = alClient
      TabOrder = 1
      LookAndFeel.NativeStyle = False
      object cxGrdDBHeader: TcxGridDBBandedTableView
        PopupMenu = pmHeader
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        FilterRow.Visible = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        OptionsView.BandHeaderHeight = 25
        OptionsView.BandHeaderLineCount = 2
        Styles.ContentEven = DMClient.cxStyleInfoBK
        Bands = <
          item
            Caption = 'PLU'
            Width = 66
          end
          item
            Caption = 'Nama Barang'
            Width = 229
          end
          item
            Caption = 'Satuan Beli'
            Width = 52
          end
          item
            Caption = 'Harga Beli'
            Width = 444
          end
          item
            Caption = 'Harga Ex PPN'
            Position.BandIndex = 3
            Position.ColIndex = 0
            Width = 88
          end
          item
            Caption = 'Disc1 %'
            Position.BandIndex = 3
            Position.ColIndex = 1
            Width = 50
          end
          item
            Caption = 'Disc2 %'
            Position.BandIndex = 3
            Position.ColIndex = 2
            Width = 47
          end
          item
            Caption = 'Disc3'
            Position.BandIndex = 3
            Position.ColIndex = 3
            Width = 68
          end
          item
            Caption = 'Harga Net'
            Position.BandIndex = 3
            Position.ColIndex = 4
            Width = 101
          end
          item
            Caption = 'Margin'
            Visible = False
            Width = 50
          end
          item
            Caption = 'Harga Jual'
            Visible = False
            Width = 286
          end
          item
            Caption = 'Hrg Bersih'
            Position.BandIndex = 10
            Position.ColIndex = 3
            Width = 83
          end
          item
            Caption = 'Disc RP'
            Position.BandIndex = 10
            Position.ColIndex = 2
            Width = 72
          end
          item
            Caption = 'Disc %'
            Position.BandIndex = 10
            Position.ColIndex = 1
            Width = 39
          end
          item
            Caption = 'Harga'
            Position.BandIndex = 10
            Position.ColIndex = 0
            Width = 95
          end
          item
            Caption = 'Hrg PPN'
            Position.BandIndex = 10
            Position.ColIndex = 4
          end
          item
            Caption = 'Harga Net +PPN'
            Position.BandIndex = 3
            Position.ColIndex = 5
            Width = 95
          end
          item
            Caption = 'Update'#13' Hrg Jual'
            Width = 58
          end>
        object colHeaderBrgCode: TcxGridDBBandedColumn
          DataBinding.FieldName = 'BrgCode'
          PropertiesClassName = 'TcxTextEditProperties'
          Options.Editing = False
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object colHeaderBrgName: TcxGridDBBandedColumn
          DataBinding.FieldName = 'BrgName'
          PropertiesClassName = 'TcxTextEditProperties'
          Options.Editing = False
          Position.BandIndex = 1
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object colHeaderSatuan: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Satuan'
          PropertiesClassName = 'TcxExtLookupComboBoxProperties'
          Options.Editing = False
          Position.BandIndex = 2
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object colHeaderBuyPrice: TcxGridDBBandedColumn
          DataBinding.FieldName = 'BuyPrice'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.#;(,0.#)'
          Properties.OnEditValueChanged = colHeaderBuyPricePropertiesEditValueChanged
          Width = 87
          Position.BandIndex = 4
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object colHeaderBuyDisc1: TcxGridDBBandedColumn
          DataBinding.FieldName = 'BuyDisc1'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.#;(,0.#)'
          Properties.OnEditValueChanged = colHeaderBuyDisc1PropertiesEditValueChanged
          Width = 51
          Position.BandIndex = 5
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object colHeaderBuyDisc2: TcxGridDBBandedColumn
          DataBinding.FieldName = 'BuyDisc2'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.#;(,0.#)'
          Properties.OnEditValueChanged = colHeaderBuyDisc2PropertiesEditValueChanged
          Width = 51
          Position.BandIndex = 6
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object colHeaderBuyDisc3: TcxGridDBBandedColumn
          DataBinding.FieldName = 'BuyDisc3'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.#;(,0.#)'
          Properties.OnEditValueChanged = colHeaderBuyDisc3PropertiesEditValueChanged
          Width = 64
          Position.BandIndex = 7
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object colHeaderMargin: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Margin'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0;(,0)'
          Position.BandIndex = 9
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object colHeaderSellPrice: TcxGridDBBandedColumn
          DataBinding.FieldName = 'SellPrice'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0;(,0)'
          Position.BandIndex = 14
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object colHeaderSellDiscPerc: TcxGridDBBandedColumn
          DataBinding.FieldName = 'SellDiscPercent'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0;(,0)'
          Position.BandIndex = 13
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object colHeaderSellDiscRp: TcxGridDBBandedColumn
          DataBinding.FieldName = 'SellDiscRp'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0;(,0)'
          Position.BandIndex = 12
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object colHeaderSellNetPrice: TcxGridDBBandedColumn
          DataBinding.FieldName = 'SellNetPrice'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0;(,0)'
          Position.BandIndex = 11
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object colHeaderSellPricePPN: TcxGridDBBandedColumn
          Caption = '+ PPN'
          DataBinding.FieldName = 'SellPricePPN'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0;(,0)'
          Position.BandIndex = 15
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object colHeaderBuyPricePPN: TcxGridDBBandedColumn
          DataBinding.FieldName = 'BUYPRICE_INC_PPN'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.#;(,0.#)'
          Options.Editing = False
          Styles.Content = DMClient.cxStyleMoneyGreen
          Width = 91
          Position.BandIndex = 16
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object colHeaderUpdateSellPrice: TcxGridDBBandedColumn
          DataBinding.FieldName = 'IsUpdateSellPrice'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.Alignment = taCenter
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          Width = 20
          Position.BandIndex = 17
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object colHeaderBuyNetPrice: TcxGridDBBandedColumn
          DataBinding.FieldName = 'BUYPRICE_INC_DISC'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0;(,0)'
          Position.BandIndex = 8
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
      end
      object cxGridMasterLevel1: TcxGridLevel
        GridView = cxGrdDBHeader
      end
    end
    object cxSplitter1: TcxSplitter
      Left = 0
      Top = 397
      Width = 968
      Height = 8
      HotZoneClassName = 'TcxXPTaskBarStyle'
      AlignSplitter = salBottom
      Control = pnlDetail
    end
    object pnlDetail: TcxGroupBox
      Left = 0
      Top = 405
      Align = alBottom
      PanelStyle.Active = True
      Style.BorderStyle = ebsNone
      Style.TransparentBorder = False
      TabOrder = 3
      Transparent = True
      Height = 150
      Width = 968
      object cxGridDetail: TcxGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 869
        Height = 144
        Align = alClient
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        RootLevelOptions.DetailTabsPosition = dtpTop
        object cxGrdDBDetail: TcxGridDBTableView
          PopupMenu = pmDetail
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.CancelOnExit = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 28
          OptionsView.Indicator = True
          Styles.ContentEven = DMClient.cxStyleInfoBK
          object colDetailTipeHarga: TcxGridDBColumn
            Caption = 'Tipe Harga'
            DataBinding.FieldName = 'TipeHarga'
            PropertiesClassName = 'TcxExtLookupComboBoxProperties'
            HeaderAlignmentHorz = taCenter
            Width = 120
          end
          object colDetailSatuan: TcxGridDBColumn
            DataBinding.FieldName = 'Satuan'
            PropertiesClassName = 'TcxExtLookupComboBoxProperties'
            Properties.OnEditValueChanged = colDetailSatuanPropertiesEditValueChanged
            HeaderAlignmentHorz = taCenter
            Width = 44
          end
          object colDetailKonversi: TcxGridDBColumn
            DataBinding.FieldName = 'Konversi'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Width = 59
          end
          object cxGrdDBDetailColumn1: TcxGridDBColumn
            Caption = 'Harga Beli + PPN'
            DataBinding.FieldName = 'BUYPRICE_INC_PPN'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.#;(,0.#)'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Width = 95
          end
          object colDetailMargin: TcxGridDBColumn
            Caption = 'Margin %'
            DataBinding.FieldName = 'Margin'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.#;(,0.#)'
            Properties.OnEditValueChanged = colDetailMarginPropertiesEditValueChanged
            HeaderAlignmentHorz = taCenter
            Styles.Content = DMClient.cxStyleMoneyGreen
          end
          object colDetailSellPricePPN: TcxGridDBColumn
            Caption = 'PPN %'
            DataBinding.FieldName = 'PPN'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.#;(,0.#)'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Styles.Content = DMClient.cxStyleMoneyGreen
            Width = 58
          end
          object colDetailSellPrice: TcxGridDBColumn
            Caption = 'Harga Jual + PPN'
            DataBinding.FieldName = 'SellPrice'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.#;(,0.#)'
            Properties.OnEditValueChanged = colDetailSellPricePropertiesEditValueChanged
            HeaderAlignmentHorz = taCenter
            Width = 104
          end
          object colDetailSellDiscPerc: TcxGridDBColumn
            Caption = 'Disc %'
            DataBinding.FieldName = 'SellDiscPercent'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.#;(,0.#)'
            Properties.OnEditValueChanged = colDetailSellDiscPercPropertiesEditValueChanged
            HeaderAlignmentHorz = taCenter
          end
          object colDetailSellDiscRp: TcxGridDBColumn
            Caption = 'Disc RP'
            DataBinding.FieldName = 'SellDiscRp'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.#;(,0.#)'
            Properties.OnEditValueChanged = colDetailSellDiscRpPropertiesEditValueChanged
            HeaderAlignmentHorz = taCenter
          end
          object colDetailSellNetPrice: TcxGridDBColumn
            Caption = 'Harga Jual Inc Disc'
            DataBinding.FieldName = 'SellNetPrice'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.#;(,0.#)'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Styles.Content = DMClient.cxStyleMoneyGreen
            Width = 118
          end
          object cxGrdDBDetailColumn2: TcxGridDBColumn
            DataBinding.FieldName = 'BuyPrice'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.#;(,0.#)'
            Visible = False
            HeaderAlignmentHorz = taCenter
            Width = 65
          end
          object cxGrdDBDetailColumn3: TcxGridDBColumn
            DataBinding.FieldName = 'BuyDisc1'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.#;(,0.#)'
            Visible = False
            HeaderAlignmentHorz = taCenter
            Width = 65
          end
          object cxGrdDBDetailColumn4: TcxGridDBColumn
            DataBinding.FieldName = 'BuyDisc2'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.#;(,0.#)'
            Visible = False
            HeaderAlignmentHorz = taCenter
            Width = 65
          end
          object cxGrdDBDetailColumn5: TcxGridDBColumn
            DataBinding.FieldName = 'BuyDisc3'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.#;(,0.#)'
            Visible = False
            HeaderAlignmentHorz = taCenter
            Width = 65
          end
        end
        object cxGridLevel1: TcxGridLevel
          Caption = 'Harga Jual Satuan'
          GridView = cxGrdDBDetail
        end
      end
      object cxGroupBox2: TcxGroupBox
        AlignWithMargins = True
        Left = 875
        Top = 3
        Margins.Left = 0
        Align = alRight
        PanelStyle.Active = True
        Style.BorderStyle = ebsNone
        Style.TextStyle = []
        Style.TransparentBorder = False
        TabOrder = 1
        Transparent = True
        Height = 144
        Width = 90
        object btnAddSat: TcxButton
          AlignWithMargins = True
          Left = 2
          Top = 2
          Width = 86
          Height = 34
          Cursor = crHandPoint
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Align = alTop
          Caption = 'Tambah Hrg'
          LookAndFeel.Kind = lfUltraFlat
          OptionsImage.ImageIndex = 2
          OptionsImage.Images = DMClient.imgListButton
          TabOrder = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Trebuchet MS'
          Font.Style = []
          ParentFont = False
          OnClick = btnAddSatClick
        end
        object btnDelSat: TcxButton
          AlignWithMargins = True
          Left = 2
          Top = 40
          Width = 86
          Height = 34
          Cursor = crHandPoint
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Align = alTop
          Caption = 'Hapus Hrg'
          OptionsImage.ImageIndex = 22
          OptionsImage.Images = DMClient.imgListButton
          TabOrder = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Trebuchet MS'
          Font.Style = []
          ParentFont = False
          OnClick = btnDelSatClick
        end
      end
    end
    object cxGroupBox3: TcxGroupBox
      AlignWithMargins = True
      Left = 875
      Top = 83
      Margins.Left = 0
      Align = alRight
      PanelStyle.Active = True
      Style.BorderStyle = ebsNone
      Style.TextStyle = []
      Style.TransparentBorder = False
      TabOrder = 4
      Transparent = True
      Height = 311
      Width = 90
      object btnAddProd: TcxButton
        AlignWithMargins = True
        Left = 2
        Top = 2
        Width = 86
        Height = 34
        Cursor = crHandPoint
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alTop
        Caption = 'Tambah Brg'
        LookAndFeel.Kind = lfUltraFlat
        OptionsImage.ImageIndex = 2
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
        OnClick = btnAddProdClick
      end
      object btnDelProd: TcxButton
        AlignWithMargins = True
        Left = 2
        Top = 40
        Width = 86
        Height = 34
        Cursor = crHandPoint
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alTop
        Caption = 'Hapus Brg'
        OptionsImage.ImageIndex = 22
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
        OnClick = btnDelProdClick
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 555
    Width = 968
    ExplicitTop = 555
    ExplicitWidth = 968
    inherited pnlFooter: TPanel
      Width = 968
      ExplicitWidth = 968
      inherited btnClose: TcxButton
        Left = 891
        Action = actCancel
        ExplicitLeft = 891
      end
      inherited btnSave: TcxButton
        Left = 798
        Action = actSave
        ExplicitLeft = 798
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 721
        Action = actPrint
        ExplicitLeft = 721
      end
    end
    inherited pnlSortCut: TPanel
      Width = 968
      ExplicitWidth = 968
      inherited lbCTRLEnter: TLabel
        Left = 793
        Height = 15
        ExplicitLeft = 793
      end
      inherited lbEscape: TLabel
        Left = 884
        Height = 15
        ExplicitLeft = 884
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 717
        Height = 15
        ExplicitLeft = 717
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 944
    Top = 8
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
  object pmHeader: TPopupMenu
    OwnerDraw = True
    Left = 240
    Top = 240
    object SetHargaBeliHargaIncludePPN1: TMenuItem
      Caption = 'Set Harga Beli = Harga Include PPN'
      OnClick = SetHargaBeliHargaIncludePPN1Click
    end
  end
  object pmDetail: TPopupMenu
    Left = 248
    Top = 301
    object SetHargaJualiHargaIncludePPN1: TMenuItem
      Caption = 'Set Harga Jual = Harga Include PPN'
      OnClick = SetHargaJualiHargaIncludePPN1Click
    end
  end
end
