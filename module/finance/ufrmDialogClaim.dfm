inherited frmDialogClaim: TfrmDialogClaim
  Caption = 'Claim'
  ClientHeight = 611
  ClientWidth = 852
  ExplicitWidth = 868
  ExplicitHeight = 650
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 852
    Height = 555
    BevelInner = bvNone
    ExplicitWidth = 852
    ExplicitHeight = 555
    object pnlHeader: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 844
      Height = 148
      Align = alTop
      TabOrder = 0
      object lblTTF: TLabel
        Left = 56
        Top = 61
        Width = 34
        Height = 16
        Caption = 'No TTF'
      end
      object lblTgkClaim: TLabel
        Left = 53
        Top = 88
        Width = 37
        Height = 16
        Caption = 'Tanggal'
      end
      object lblDescription: TLabel
        Left = 433
        Top = 88
        Width = 46
        Height = 16
        Caption = 'Deskripsi'
      end
      object lblTglKembali: TLabel
        Left = 13
        Top = 115
        Width = 77
        Height = 16
        Caption = 'Tanggal Kembali'
      end
      object lblDueDate: TLabel
        Left = 417
        Top = 7
        Width = 62
        Height = 16
        Caption = 'Jatuh Tempo'
      end
      object lblAkun: TLabel
        Left = 416
        Top = 34
        Width = 63
        Height = 16
        Caption = 'Akun Hutang'
      end
      object lblNoClaim: TLabel
        Left = 225
        Top = 60
        Width = 42
        Height = 16
        Caption = 'No Claim'
      end
      object dtTglClaim: TcxDateEdit
        Left = 95
        Top = 85
        Properties.SaveTime = False
        Properties.ShowTime = False
        TabOrder = 3
        Width = 121
      end
      object edTTFNo: TcxTextEdit
        Left = 95
        Top = 57
        TabOrder = 1
        Text = 'edTTFNo'
        Width = 121
      end
      object memDescription: TcxMemo
        Left = 484
        Top = 84
        Lines.Strings = (
          'memDescription')
        TabOrder = 7
        Height = 51
        Width = 270
      end
      object dtReturnDate: TcxDateEdit
        Left = 95
        Top = 111
        Properties.SaveTime = False
        Properties.ShowTime = False
        TabOrder = 4
        Width = 121
      end
      object dtDueDate: TcxDateEdit
        Left = 484
        Top = 3
        Properties.SaveTime = False
        Properties.ShowTime = False
        TabOrder = 5
        Width = 121
      end
      object cbbAccount: TcxExtLookupComboBox
        Left = 484
        Top = 30
        Properties.OnEditValueChanged = cbbAccountPropertiesEditValueChanged
        TabOrder = 6
        Width = 121
      end
      object edAKunHutang: TcxTextEdit
        Left = 484
        Top = 57
        TabStop = False
        Enabled = False
        TabOrder = 8
        Text = 'edTTFNo'
        Width = 270
      end
      object edNoClaim: TcxTextEdit
        Left = 273
        Top = 57
        TabOrder = 2
        Text = 'edTTFNo'
        Width = 116
      end
      object edOrgName: TcxTextEdit
        Left = 95
        Top = 30
        TabStop = False
        Enabled = False
        TabOrder = 9
        Text = 'edTTFNo'
        Width = 294
      end
      object ckOrganization: TCheckBox
        Left = 7
        Top = 8
        Width = 83
        Height = 17
        Caption = 'Organization'
        Checked = True
        State = cbChecked
        TabOrder = 10
        OnClick = ckOrganizationClick
      end
      object ckAutoDueDate: TCheckBox
        Left = 611
        Top = 7
        Width = 102
        Height = 17
        Caption = 'Auto Generate'
        Checked = True
        State = cbChecked
        TabOrder = 11
        OnClick = ckAutoDueDateClick
      end
      object edOrgCode: TcxButtonEdit
        Left = 95
        Top = 5
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = edOrgCodePropertiesButtonClick
        Properties.OnEditValueChanged = edOrgCodePropertiesEditValueChanged
        TabOrder = 0
        Width = 121
      end
    end
    object pnlSummary: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 489
      Width = 844
      Height = 62
      Align = alBottom
      TabOrder = 1
      DesignSize = (
        844
        62)
      object lblDO: TLabel
        Left = 177
        Top = 5
        Width = 90
        Height = 18
        Anchors = [akTop, akRight]
        Caption = 'Goods Receiving'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 163
      end
      object lblCN: TLabel
        Left = 252
        Top = 32
        Width = 15
        Height = 18
        Anchors = [akTop, akRight]
        Caption = 'CN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 238
      end
      object lblDN: TLabel
        Left = 443
        Top = 5
        Width = 15
        Height = 18
        Anchors = [akTop, akRight]
        Caption = 'DN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 429
      end
      object lblOther: TLabel
        Left = 427
        Top = 32
        Width = 33
        Height = 18
        Anchors = [akTop, akRight]
        Caption = 'Other'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 413
      end
      object lblTotal: TLabel
        Left = 615
        Top = 5
        Width = 27
        Height = 18
        Anchors = [akTop, akRight]
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 601
      end
      object crTotalDO: TcxCurrencyEdit
        Left = 271
        Top = 2
        TabStop = False
        Anchors = [akTop, akRight]
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        Properties.ReadOnly = True
        Style.BorderStyle = ebsUltraFlat
        Style.Color = clInfoBk
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Trebuchet MS'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Width = 120
      end
      object crTotalCN: TcxCurrencyEdit
        Left = 271
        Top = 29
        TabStop = False
        Anchors = [akTop, akRight]
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        Properties.ReadOnly = True
        Style.BorderStyle = ebsUltraFlat
        Style.Color = clInfoBk
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Trebuchet MS'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        Width = 120
      end
      object crTotalDN: TcxCurrencyEdit
        Left = 462
        Top = 2
        TabStop = False
        Anchors = [akTop, akRight]
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        Properties.ReadOnly = True
        Style.BorderStyle = ebsUltraFlat
        Style.Color = clInfoBk
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Trebuchet MS'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        Width = 120
      end
      object crTotalOther: TcxCurrencyEdit
        Left = 462
        Top = 29
        TabStop = False
        Anchors = [akTop, akRight]
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        Properties.ReadOnly = True
        Style.BorderStyle = ebsUltraFlat
        Style.Color = clInfoBk
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Trebuchet MS'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 3
        Width = 120
      end
      object crTotal: TcxCurrencyEdit
        Left = 644
        Top = 2
        TabStop = False
        Anchors = [akTop, akRight]
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        Properties.ReadOnly = True
        Style.BorderStyle = ebsUltraFlat
        Style.Color = clInfoBk
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Trebuchet MS'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.NativeStyle = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 4
        Width = 120
      end
    end
    object pnlData: TPanel
      Left = 1
      Top = 155
      Width = 850
      Height = 331
      Align = alClient
      TabOrder = 2
      object cxgrdClaim: TcxGrid
        Left = 1
        Top = 1
        Width = 848
        Height = 294
        Align = alClient
        TabOrder = 0
        LevelTabs.CaptionAlignment = taLeftJustify
        LevelTabs.ImageBorder = 5
        LevelTabs.Images = DMClient.imgListButton
        LevelTabs.Slants.Positions = []
        LevelTabs.Style = 6
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        RootLevelOptions.DetailFrameColor = clWhite
        RootLevelOptions.DetailTabsPosition = dtpTop
        RootLevelStyles.Tab = DMClient.cxStyleTabGrid
        RootLevelStyles.TabsBackground = DMClient.cxStyleTabGridBg
        OnFocusedViewChanged = cxgrdClaimFocusedViewChanged
        object cxGridDBTableCN: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.#;(,0.##)'
              Kind = skSum
              Column = cxGridColCNNominal
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          Styles.ContentEven = DMClient.cxStyleGridEven
          Styles.Header = DMClient.cxStyleGridHeader
          object cxGridColCNNP: TcxGridDBColumn
            Caption = 'NP'
            DataBinding.FieldName = 'DO_NP'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            Width = 129
          end
          object cxGridColCNPO: TcxGridDBColumn
            Caption = 'PO'
            DataBinding.FieldName = 'PO_NO'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            Width = 132
          end
          object cxGridColCNTgl: TcxGridDBColumn
            Caption = 'Tanggal'
            DataBinding.FieldName = 'CN_DATE'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.ReadOnly = True
            Properties.SaveTime = False
            Properties.ShowTime = False
            HeaderAlignmentHorz = taCenter
            Width = 85
          end
          object cxGridColCNNominal: TcxGridDBColumn
            Caption = 'Nominal'
            DataBinding.FieldName = 'CLMD_CN_TOTAL'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.#;(,0.##)'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Width = 108
          end
        end
        object cxGridDBTableDN: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.##;(,0.##)'
              Column = cxGridColDNNominal
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          Styles.ContentEven = DMClient.cxStyleGridEven
          Styles.Header = DMClient.cxStyleGridHeader
          object cxGridColDNNP: TcxGridDBColumn
            Caption = 'NP'
            DataBinding.FieldName = 'DO_NP'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Width = 124
          end
          object cxGridColDNPO: TcxGridDBColumn
            Caption = 'PO'
            DataBinding.FieldName = 'PO_NO'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Width = 134
          end
          object cxGridColDNTgl: TcxGridDBColumn
            Caption = 'Tanggal'
            DataBinding.FieldName = 'DN_DATE'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.ReadOnly = True
            Properties.SaveTime = False
            Properties.ShowTime = False
            HeaderAlignmentHorz = taCenter
            Width = 86
          end
          object cxGridColDNNominal: TcxGridDBColumn
            Caption = 'Nominal'
            DataBinding.FieldName = 'CLMD_DN_TOTAL'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.##;(,0.##)'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Width = 106
          end
        end
        object cxGridDBTableOther: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skSum
              Column = cxGridColOtherNominal
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          Styles.ContentEven = DMClient.cxStyleGridEven
          Styles.Header = DMClient.cxStyleGridHeader
          object cxGridColOtherCostCenter: TcxGridDBColumn
            Caption = 'Cost Center'
            DataBinding.FieldName = 'CLMD_Other_CostCenter'
            PropertiesClassName = 'TcxExtLookupComboBoxProperties'
            HeaderAlignmentHorz = taCenter
            Width = 136
          end
          object cxGridColOtherAccountCode: TcxGridDBColumn
            Caption = 'Kode'
            DataBinding.FieldName = 'CLMD_Other_Rekening'
            PropertiesClassName = 'TcxExtLookupComboBoxProperties'
            Properties.OnEditValueChanged = cxGridColOtherAccountCodePropertiesEditValueChanged
            HeaderAlignmentHorz = taCenter
            Width = 141
          end
          object cxGridColOtherAccountName: TcxGridDBColumn
            Caption = 'Nama'
            DataBinding.FieldName = 'REK_NAME'
            PropertiesClassName = 'TcxExtLookupComboBoxProperties'
            Properties.ImmediatePost = True
            Properties.OnEditValueChanged = cxGridColOtherAccountNamePropertiesEditValueChanged
            HeaderAlignmentHorz = taCenter
            Width = 227
          end
          object cxGridColOtherNominal: TcxGridDBColumn
            Caption = 'Nominal'
            DataBinding.FieldName = 'CLMD_OTHER_TOTAL'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.##;(,0.##)'
            Properties.OnEditValueChanged = cxGridColOtherNominalPropertiesEditValueChanged
            HeaderAlignmentHorz = taCenter
            Width = 97
          end
        end
        object cxGridDBTableGR: TcxGridDBBandedTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.##;(,0.##)'
              Kind = skSum
              Column = cxGridColGRNominal
            end
            item
              Format = ',0.##;(,0.##)'
              Kind = skSum
              Column = cxGridColGRNominalFakturPajak
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Inserting = False
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          Styles.ContentEven = DMClient.cxStyleGridEven
          Styles.Header = DMClient.cxStyleGridHeader
          Bands = <
            item
              Caption = 'Goods Receiving'
              Styles.Header = DMClient.cxStyleGridHeader
              Width = 438
            end
            item
              Caption = 'Faktur Pajak'
              Styles.Header = DMClient.cxStyleGridHeader
              Width = 291
            end>
          object cxGridColGRNP: TcxGridDBBandedColumn
            Caption = 'NP'
            DataBinding.FieldName = 'DO_NP'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Width = 111
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object cxGridColGRPO: TcxGridDBBandedColumn
            Caption = 'PO'
            DataBinding.FieldName = 'PO_NO'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Width = 80
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object cxGridColGRNoFaktur: TcxGridDBBandedColumn
            Caption = 'No Faktur'
            DataBinding.FieldName = 'CLMD_DO_INV_NO'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = False
            HeaderAlignmentHorz = taCenter
            Width = 92
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object cxGridColGRTglFakturPajak: TcxGridDBBandedColumn
            Caption = 'Tanggal'
            DataBinding.FieldName = 'CLMD_DO_INV_TAX_DATE'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.ReadOnly = False
            Properties.SaveTime = False
            Properties.ShowTime = False
            HeaderAlignmentHorz = taCenter
            Width = 53
            Position.BandIndex = 1
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object cxGridColGRNoFakturPajak: TcxGridDBBandedColumn
            Caption = 'No'
            DataBinding.FieldName = 'CLMD_DO_INV_TAX_NO'
            HeaderAlignmentHorz = taCenter
            Width = 149
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object cxGridColGRNominalFakturPajak: TcxGridDBBandedColumn
            Caption = 'Nominal'
            DataBinding.FieldName = 'CLMD_DO_PPN'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.##;(,0.##)'
            HeaderAlignmentHorz = taCenter
            Width = 88
            Position.BandIndex = 1
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object cxGridColGRTglFaktur: TcxGridDBBandedColumn
            Caption = 'Tgl Faktur'
            DataBinding.FieldName = 'DO_DATE'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.ReadOnly = True
            Properties.SaveTime = False
            Properties.ShowTime = False
            HeaderAlignmentHorz = taCenter
            Width = 66
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object cxGridColGRNominal: TcxGridDBBandedColumn
            Caption = 'Nominal'
            DataBinding.FieldName = 'CLMD_DO_TOTAL'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.##;(,0.##)'
            HeaderAlignmentHorz = taCenter
            Width = 89
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
        end
        object cxGridDBTableCS: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.GroupByBox = False
          Styles.Header = DMClient.cxStyleGridHeader
          object cxGridColCSNo: TcxGridDBColumn
            Caption = 'Tanggal'
            DataBinding.FieldName = 'CLMD_CS_DATE'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Width = 205
          end
          object cxGridColCSDate: TcxGridDBColumn
            Caption = 'Net Sales'
            DataBinding.FieldName = 'CLMD_CS_NETSALES'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.##;(,0.##)'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Width = 165
          end
        end
        object cxgrdlvlGR: TcxGridLevel
          Caption = 'Goods Receiving [F1]  '
          GridView = cxGridDBTableGR
          ImageIndex = 39
        end
        object cxgrdlvlCN: TcxGridLevel
          Caption = 'Credit Note [F2] '
          GridView = cxGridDBTableCN
          ImageIndex = 42
        end
        object cxgrdlvlDN: TcxGridLevel
          Caption = 'Debit Note [F3] '
          GridView = cxGridDBTableDN
          ImageIndex = 41
        end
        object cxgrdlvlOther: TcxGridLevel
          Caption = 'Other [F4] '
          GridView = cxGridDBTableOther
          ImageIndex = 6
        end
        object cxgrdlvlCS: TcxGridLevel
          Caption = 'Contrabon Sales [F5] '
          GridView = cxGridDBTableCS
          ImageIndex = 51
        end
      end
      object pnlButtonData: TPanel
        Left = 1
        Top = 295
        Width = 848
        Height = 35
        Align = alBottom
        Padding.Right = 3
        TabOrder = 1
        object btnAddDN: TcxButton
          AlignWithMargins = True
          Left = 734
          Top = 4
          Width = 110
          Height = 27
          Margins.Left = 0
          Margins.Right = 0
          Align = alRight
          Caption = 'Tambah DN [ALT+D]'
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnClick = btnAddDNClick
        end
        object btnDelItem: TcxButton
          AlignWithMargins = True
          Left = 95
          Top = 4
          Width = 80
          Height = 27
          Margins.Right = 0
          Align = alLeft
          Caption = '&Hapus'
          OptionsImage.ImageIndex = 8
          OptionsImage.Images = DMClient.imgListButton
          TabOrder = 1
          OnClick = btnDelItemClick
        end
        object btnAdd: TcxButton
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 88
          Height = 27
          Margins.Right = 0
          Align = alLeft
          Caption = '&Tambah'
          OptionsImage.ImageIndex = 0
          OptionsImage.Images = DMClient.imgListButton
          TabOrder = 2
          OnClick = btnAddClick
        end
        object btnDetail: TcxButton
          AlignWithMargins = True
          Left = 178
          Top = 4
          Width = 90
          Height = 27
          Margins.Right = 0
          Align = alLeft
          Caption = 'D&etail'
          OptionsImage.ImageIndex = 26
          OptionsImage.Images = DMClient.imgListButton
          TabOrder = 3
          OnClick = btnDetailClick
        end
        object btnAddGR: TcxButton
          AlignWithMargins = True
          Left = 514
          Top = 4
          Width = 110
          Height = 27
          Margins.Left = 0
          Margins.Right = 0
          Align = alRight
          Caption = 'Tambah GR [ALT+G]'
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = False
          TabOrder = 4
          OnClick = btnAddGRClick
        end
        object btnAddCN: TcxButton
          AlignWithMargins = True
          Left = 624
          Top = 4
          Width = 110
          Height = 27
          Margins.Left = 0
          Margins.Right = 0
          Align = alRight
          Caption = 'Tambah CN [ALT+C]'
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = False
          TabOrder = 5
          OnClick = btnAddCNClick
        end
        object btnAddCS: TcxButton
          AlignWithMargins = True
          Left = 360
          Top = 4
          Width = 154
          Height = 27
          Margins.Left = 0
          Margins.Right = 0
          Align = alRight
          Caption = 'Tambah Contrabon [ALT+K]'
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = False
          TabOrder = 6
          OnClick = btnAddCSClick
        end
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 555
    Width = 852
    ExplicitTop = 555
    ExplicitWidth = 852
    inherited pnlFooter: TPanel
      Width = 852
      ExplicitWidth = 852
      inherited btnClose: TcxButton
        Left = 775
        Action = actCancel
        ExplicitLeft = 775
      end
      inherited btnSave: TcxButton
        Left = 682
        Action = actSave
        ExplicitLeft = 682
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 605
        Action = actPrint
        ExplicitLeft = 605
      end
    end
    inherited pnlSortCut: TPanel
      Width = 852
      ExplicitWidth = 852
      inherited lbCTRLEnter: TLabel
        Left = 677
        Height = 15
        ExplicitLeft = 677
      end
      inherited lbEscape: TLabel
        Left = 768
        Height = 15
        ExplicitLeft = 768
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 601
        Height = 15
        ExplicitLeft = 601
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 752
    Top = 24
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
    object actViewPO: TAction
      Caption = 'PO Detail [Alt+P]'
      ShortCut = 32848
      OnExecute = actViewPOExecute
    end
    object actViewAdj: TAction
      Caption = 'Adjustment [Alt+J]'
      ShortCut = 32842
      OnExecute = actViewAdjExecute
    end
    object actAddCN: TAction
      Caption = 'Tambah CN [Alt+C]'
      ShortCut = 32835
    end
    object actAddDN: TAction
      Caption = 'Tambah DN [Alt+D]'
      ShortCut = 32836
    end
  end
end
