inherited frmDialogBankCashOut: TfrmDialogBankCashOut
  Caption = 'Bank Cash Out'
  ClientHeight = 536
  ClientWidth = 897
  OnDestroy = FormDestroy
  ExplicitTop = -97
  ExplicitWidth = 913
  ExplicitHeight = 575
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 897
    Height = 480
    ExplicitWidth = 885
    ExplicitHeight = 480
    object pnlBCOHeader: TPanel
      Left = 2
      Top = 2
      Width = 893
      Height = 130
      Align = alTop
      BevelKind = bkFlat
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitWidth = 881
      object lblNoBukti: TLabel
        Left = 22
        Top = 7
        Width = 42
        Height = 16
        Caption = 'No Bukti'
      end
      object lblTanggal: TLabel
        Left = 27
        Top = 34
        Width = 37
        Height = 16
        Caption = 'Tanggal'
      end
      object lblOrganizasi: TLabel
        Left = 11
        Top = 61
        Width = 53
        Height = 16
        Caption = 'Organisasi'
      end
      object lblBank: TLabel
        Left = 339
        Top = 7
        Width = 24
        Height = 16
        Caption = 'Bank'
      end
      object lblKeteranan: TLabel
        Left = 305
        Top = 34
        Width = 58
        Height = 16
        Caption = 'Keterangan'
      end
      object lblTotal: TLabel
        Left = 339
        Top = 99
        Width = 30
        Height = 16
        Caption = 'TOTAL'
      end
      object cbbBank: TcxExtLookupComboBox
        Tag = 1
        Left = 371
        Top = 3
        HelpType = htKeyword
        HelpKeyword = 'Bank'
        Properties.DropDownAutoSize = True
        Properties.DropDownSizeable = True
        Properties.ImmediatePost = True
        Properties.MaxLength = 0
        TabOrder = 4
        Width = 223
      end
      object lvSumary: TcxListView
        Left = 599
        Top = 30
        Width = 250
        Height = 60
        Columns = <
          item
            AutoSize = True
            Caption = 'Desc'
          end
          item
            Alignment = taRightJustify
            AutoSize = True
            Caption = 'Nominal'
          end>
        Enabled = False
        Items.ItemData = {
          05950000000300000000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF000000
          00024100500001300030BCD42F00000000FFFFFFFFFFFFFFFF01000000FFFFFF
          FF00000000094C00610069006E002D004C00610069006E0001300078B1D42F00
          000000FFFFFFFFFFFFFFFF01000000FFFFFFFF000000000B50006F0074002000
          5400610067006900680061006E00013000B8A1D42FFFFFFFFFFFFF}
        ParentFont = False
        ReadOnly = True
        RowSelect = True
        ShowColumnHeaders = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.Shadow = False
        Style.TransparentBorder = True
        Style.IsFontAssigned = True
        TabOrder = 8
        ViewStyle = vsReport
      end
      object lvCheque: TcxListView
        Left = 599
        Top = 3
        Width = 250
        Height = 24
        Columns = <
          item
            AutoSize = True
            Caption = 'Desc'
          end
          item
            Alignment = taRightJustify
            AutoSize = True
            Caption = 'Nominal'
          end>
        Enabled = False
        Items.ItemData = {
          052F0000000100000000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF000000
          0006430068006500710075006500013000407C0737FFFF}
        ParentFont = False
        ReadOnly = True
        RowSelect = True
        ShowColumnHeaders = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.Shadow = False
        Style.TransparentBorder = True
        Style.IsFontAssigned = True
        TabOrder = 7
        ViewStyle = vsReport
      end
      object edOrganizationName: TcxButtonEdit
        Left = 78
        Top = 84
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
            Visible = False
          end>
        Properties.MaxLength = 0
        TabOrder = 3
        Width = 199
      end
      object edNoBukti: TcxButtonEdit
        Tag = 1
        Left = 78
        Top = 3
        HelpType = htKeyword
        HelpKeyword = 'No Bukti'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
            Visible = False
          end>
        Properties.MaxLength = 0
        Properties.ReadOnly = True
        TabOrder = 0
        Text = 'Otomatis'
        Width = 199
      end
      object edSummaryAll: TcxCurrencyEdit
        Tag = 1
        Left = 371
        Top = 91
        AutoSize = False
        EditValue = 0.000000000000000000
        Enabled = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        Properties.ReadOnly = True
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -17
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.TextColor = clRed
        Style.IsFontAssigned = True
        TabOrder = 6
        Height = 30
        Width = 478
      end
      object edOrganization: TcxButtonEdit
        Tag = 1
        Left = 78
        Top = 57
        HelpType = htKeyword
        HelpKeyword = 'Organisasi'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.MaxLength = 0
        Properties.OnButtonClick = beBusinessPartnerPropertiesButtonClick
        Properties.OnValidate = edOrganizationPropertiesValidate
        TabOrder = 2
        Width = 199
      end
      object dtTanggal: TcxDateEdit
        Tag = 1
        Left = 78
        Top = 30
        HelpType = htKeyword
        HelpKeyword = 'Tanggal'
        Properties.ImmediatePost = True
        Properties.ShowTime = False
        TabOrder = 1
        Width = 199
      end
      object memDesc: TcxMemo
        Tag = -1
        Left = 371
        Top = 30
        Properties.ScrollBars = ssVertical
        TabOrder = 5
        Height = 60
        Width = 223
      end
    end
    object cxgrdDetail: TcxGrid
      Left = 2
      Top = 132
      Width = 893
      Height = 346
      Align = alClient
      TabOrder = 1
      RootLevelOptions.DetailTabsPosition = dtpTop
      ExplicitWidth = 881
      object cxGridTableAPList: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0.00;(,0.00)'
            Kind = skSum
            Column = cxGridColAPNominal
          end
          item
            Format = ',0.00;(,0.00)'
            Kind = skSum
            Column = cxGridColAPSisa
          end
          item
            Format = ',0.00;(,0.00)'
            Kind = skSum
            Column = cxGridColAPBayar
          end>
        DataController.Summary.SummaryGroups = <>
        DataController.OnAfterDelete = cxGridTableAPListDataControllerAfterDelete
        DataController.OnAfterPost = cxGridTableAPListDataControllerAfterPost
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsData.Appending = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.ContentEven = DMClient.cxStyleGridEven
        Styles.Header = DMClient.cxStyleGridHeader
        object cxGridColAPAP: TcxGridColumn
          AlternateCaption = 'BCOAP_AP'
          Caption = 'AP'
          PropertiesClassName = 'TcxExtLookupComboBoxProperties'
          Properties.ImmediatePost = True
          Properties.OnEditValueChanged = cxGridColAPAPPropertiesEditValueChanged
          Properties.OnValidate = cxGridColAPAPPropertiesValidate
          HeaderAlignmentHorz = taCenter
          Width = 87
        end
        object cxGridColAPTanggal: TcxGridColumn
          Caption = 'Tanggal'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.ReadOnly = True
          Properties.ShowTime = False
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColAPJatuhTempo: TcxGridColumn
          Caption = 'Jatuh Tempo'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.ReadOnly = True
          Properties.ShowTime = False
          HeaderAlignmentHorz = taCenter
          Width = 86
        end
        object cxGridColAPRekeningID: TcxGridColumn
          AlternateCaption = 'BCOAP_Rekening'
          Caption = 'Kode Rek.'
          PropertiesClassName = 'TcxExtLookupComboBoxProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 90
        end
        object cxGridColAPRekening: TcxGridColumn
          Caption = 'Rekening'
          PropertiesClassName = 'TcxExtLookupComboBoxProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 150
        end
        object cxGridColAPKeterangan: TcxGridColumn
          AlternateCaption = 'BCOAP_Keterangan'
          Caption = 'Keterangan'
          HeaderAlignmentHorz = taCenter
          Width = 124
        end
        object cxGridColAPNominal: TcxGridColumn
          Caption = 'Nominal'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 100
        end
        object cxGridColAPSisa: TcxGridColumn
          Caption = 'Sisa'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 100
        end
        object cxGridColAPBayar: TcxGridColumn
          AlternateCaption = 'BCOAP_Nominal'
          Caption = 'Bayar'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          HeaderAlignmentHorz = taCenter
          Width = 100
        end
      end
      object cxGridTableOther: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0.00;(,0.00)'
            Kind = skSum
            Column = cxGridColOtherBayar
          end>
        DataController.Summary.SummaryGroups = <>
        DataController.OnAfterDelete = cxGridTableOtherDataControllerAfterDelete
        DataController.OnAfterPost = cxGridTableOtherDataControllerAfterPost
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsData.Appending = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.ContentEven = DMClient.cxStyleGridEven
        Styles.Header = DMClient.cxStyleGridHeader
        object cxGridColOtherKode: TcxGridColumn
          AlternateCaption = 'BCOOTH_Rekening'
          Caption = 'Kode'
          PropertiesClassName = 'TcxExtLookupComboBoxProperties'
          Properties.ImmediatePost = True
          Properties.OnValidate = cxGridColOtherKodePropertiesValidate
          HeaderAlignmentHorz = taCenter
          Width = 121
        end
        object cxGridColOtherNama: TcxGridColumn
          Caption = 'Nama'
          PropertiesClassName = 'TcxExtLookupComboBoxProperties'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Width = 123
        end
        object cxGridColOtherCostCenter: TcxGridColumn
          AlternateCaption = 'BCOOTH_CostCenter'
          Caption = 'Cost Center'
          PropertiesClassName = 'TcxExtLookupComboBoxProperties'
          HeaderAlignmentHorz = taCenter
          Width = 124
        end
        object cxGridColOtherKeterangan: TcxGridColumn
          AlternateCaption = 'BCOOTH_Keterangan'
          Caption = 'Keterangan'
          HeaderAlignmentHorz = taCenter
          Width = 147
        end
        object cxGridColOtherBayar: TcxGridColumn
          AlternateCaption = 'BCOOTH_Nominal'
          Caption = 'Bayar'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          HeaderAlignmentHorz = taCenter
          Width = 107
        end
      end
      object cxGridTableCheque: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0.00;(,0.00)'
            Kind = skSum
            Column = cxGridColChequeBayar
          end>
        DataController.Summary.SummaryGroups = <>
        DataController.OnAfterDelete = cxGridTableChequeDataControllerAfterDelete
        DataController.OnAfterInsert = cxGridTableChequeDataControllerAfterInsert
        DataController.OnAfterPost = cxGridTableChequeDataControllerAfterPost
        DataController.OnBeforeInsert = cxGridTableChequeDataControllerBeforeInsert
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsData.Appending = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.ContentEven = DMClient.cxStyleGridEven
        Styles.Header = DMClient.cxStyleGridHeader
        object cxGridColChequeNo: TcxGridColumn
          AlternateCaption = 'BCOCHE_No'
          Caption = 'Nomor'
          HeaderAlignmentHorz = taCenter
          Width = 104
        end
        object cxGridColChequeJatuhTempo: TcxGridColumn
          AlternateCaption = 'BCOCHE_JatuhTempo'
          Caption = 'Jatuh Tempo'
          PropertiesClassName = 'TcxDateEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 133
        end
        object cxGridColChequeKeterangan: TcxGridColumn
          AlternateCaption = 'BCOCHE_Keterangan'
          Caption = 'Keterangan'
          Width = 103
        end
        object cxGridColChequeBayar: TcxGridColumn
          AlternateCaption = 'BCOCHE_Nominal'
          Caption = 'Bayar'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          HeaderAlignmentHorz = taCenter
          Width = 116
        end
      end
      object cxGridTablePotongTagihan: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0.00;(,0.00)'
            Kind = skSum
            Column = cxGridColPotagNominal
          end
          item
            Format = ',0.00;(,0.00)'
            Kind = skSum
            Column = cxGridColPotagSisa
          end
          item
            Format = ',0.00;(,0.00)'
            Kind = skSum
            Column = cxGridColPotagBayar
          end>
        DataController.Summary.SummaryGroups = <>
        DataController.OnAfterDelete = cxGridTablePotongTagihanDataControllerAfterDelete
        DataController.OnAfterPost = cxGridTablePotongTagihanDataControllerAfterPost
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsData.Appending = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.ContentEven = DMClient.cxStyleGridEven
        Styles.Header = DMClient.cxStyleGridHeader
        object cxGridColPotagAR: TcxGridColumn
          AlternateCaption = 'BCOAR_AR'
          Caption = 'AR'
          PropertiesClassName = 'TcxExtLookupComboBoxProperties'
          Properties.ImmediatePost = True
          Properties.OnEditValueChanged = cxGridColPotagARPropertiesEditValueChanged
          HeaderAlignmentHorz = taCenter
          Width = 105
        end
        object cxGridColPotagTgl: TcxGridColumn
          Caption = 'Tanggal'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.ReadOnly = True
          Properties.SaveTime = False
          Properties.ShowTime = False
          HeaderAlignmentHorz = taCenter
          Width = 87
        end
        object cxGridColPotagDueDate: TcxGridColumn
          Caption = 'Jatuh Tempo'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.ReadOnly = True
          Properties.SaveTime = False
          Properties.ShowTime = False
          HeaderAlignmentHorz = taCenter
          Width = 86
        end
        object cxGridColPotagRekeningID: TcxGridColumn
          AlternateCaption = 'BCOAR_Rekening'
          Caption = 'Kode Rek.'
          PropertiesClassName = 'TcxExtLookupComboBoxProperties'
          HeaderAlignmentHorz = taCenter
          Width = 79
        end
        object cxGridColPotagRekening: TcxGridColumn
          Caption = 'Rekening'
          PropertiesClassName = 'TcxExtLookupComboBoxProperties'
          HeaderAlignmentHorz = taCenter
          Width = 124
        end
        object cxGridColPotagKeterangan: TcxGridColumn
          AlternateCaption = 'BCOAR_Keterangan'
          Caption = 'Keterangan'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 102
        end
        object cxGridColPotagNominal: TcxGridColumn
          Caption = 'Nominal'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.#;(,0#)'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 110
        end
        object cxGridColPotagSisa: TcxGridColumn
          Caption = 'Sisa'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.#;(,0#)'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 104
        end
        object cxGridColPotagBayar: TcxGridColumn
          AlternateCaption = 'BCOAR_Nominal'
          Caption = 'Bayar'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.#;(,0#)'
          HeaderAlignmentHorz = taCenter
          Width = 105
        end
      end
      object cxgrdlvlAPList: TcxGridLevel
        Caption = 'Klaim'
        GridView = cxGridTableAPList
      end
      object cxgrdlvlPotongTagihan: TcxGridLevel
        Caption = 'Potong Tagihan'
        GridView = cxGridTablePotongTagihan
      end
      object cxgrdlvlOther: TcxGridLevel
        Caption = 'Lain-Lain'
        GridView = cxGridTableOther
      end
      object cxgrdlvlCheque: TcxGridLevel
        Caption = 'Cheque'
        GridView = cxGridTableCheque
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 480
    Width = 897
    ExplicitTop = 480
    ExplicitWidth = 885
    inherited pnlFooter: TPanel
      Width = 897
      ExplicitWidth = 885
      inherited btnClose: TcxButton
        Left = 820
        Action = actCancel
        ExplicitLeft = 808
      end
      inherited btnSave: TcxButton
        Left = 727
        Action = actSave
        ExplicitLeft = 715
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 650
        Action = actPrint
        ExplicitLeft = 638
      end
    end
    inherited pnlSortCut: TPanel
      Width = 897
      ExplicitWidth = 885
      inherited lbCTRLEnter: TLabel
        Left = 722
        Height = 15
        ExplicitLeft = 710
      end
      inherited lbEscape: TLabel
        Left = 813
        Height = 15
        ExplicitLeft = 801
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 646
        Height = 15
        ExplicitLeft = 634
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 424
    Top = 208
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
  end
end
