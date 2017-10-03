inherited frmDialogCustomerInvoice: TfrmDialogCustomerInvoice
  Caption = 'Dialog Customer Invoice'
  ClientHeight = 502
  ClientWidth = 805
  ExplicitWidth = 821
  ExplicitHeight = 541
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 805
    Height = 446
    object pnlHeader: TPanel
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 795
      Height = 116
      Align = alTop
      TabOrder = 0
      ExplicitTop = 2
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
      object lblKeteranan: TLabel
        Left = 294
        Top = 7
        Width = 58
        Height = 16
        Caption = 'Keterangan'
      end
      object lblTotal: TLabel
        Left = 328
        Top = 88
        Width = 24
        Height = 16
        Caption = 'Total'
      end
      object edOrganizationName: TcxButtonEdit
        Left = 78
        Top = 84
        Enabled = False
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
        Enabled = False
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
        Properties.OnButtonClick = edOrganizationPropertiesButtonClick
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
      object edSummaryAll: TcxCurrencyEdit
        Tag = 1
        Left = 360
        Top = 84
        TabStop = False
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
        Height = 24
        Width = 428
      end
      object lvSumary: TcxListView
        Left = 589
        Top = 3
        Width = 200
        Height = 78
        TabStop = False
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
          055C0000000200000000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF000000
          00024100500001300028BD0C3900000000FFFFFFFFFFFFFFFF01000000FFFFFF
          FF00000000094C00610069006E002D004C00610069006E0001300080BC0C39FF
          FFFFFF}
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
        TabOrder = 5
        ViewStyle = vsReport
      end
      object memDesc: TcxMemo
        Tag = -1
        Left = 360
        Top = 3
        Properties.ScrollBars = ssVertical
        TabOrder = 4
        Height = 78
        Width = 223
      end
    end
    object cxgrdDetail: TcxGrid
      Left = 2
      Top = 124
      Width = 801
      Height = 320
      Align = alClient
      TabOrder = 1
      RootLevelOptions.DetailTabsPosition = dtpTop
      ExplicitTop = 121
      ExplicitWidth = 795
      ExplicitHeight = 287
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
          HeaderAlignmentHorz = taCenter
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
          Caption = 'RekeningID'
          Visible = False
          Width = 78
        end
        object cxGridColAPRekening: TcxGridColumn
          Caption = 'Rekening'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 88
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
      object cxgrdlvlAPList: TcxGridLevel
        Caption = 'AR New'
        GridView = cxGridTableAPList
      end
      object cxgrdlvlOther: TcxGridLevel
        Caption = 'AP Minus'
        GridView = cxGridTableOther
      end
      object cxgrdlvlCheque: TcxGridLevel
        Caption = 'Potong AP'
        GridView = cxGridTableCheque
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 446
    Width = 805
    inherited pnlFooter: TPanel
      Width = 805
      inherited btnClose: TcxButton
        Left = 728
        Action = actCancel
      end
      inherited btnSave: TcxButton
        Left = 635
        Action = actSave
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 558
        Action = actPrint
      end
    end
    inherited pnlSortCut: TPanel
      Width = 805
      inherited lbCTRLEnter: TLabel
        Left = 630
        Height = 15
      end
      inherited lbEscape: TLabel
        Left = 721
        Height = 15
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 554
        Height = 15
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 632
    Top = 240
  end
end
