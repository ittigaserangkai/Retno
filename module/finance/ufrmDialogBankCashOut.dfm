inherited frmDialogBankCashOut: TfrmDialogBankCashOut
  Caption = 'Bank Cash Out'
  ClientHeight = 466
  ClientWidth = 799
  ExplicitTop = -33
  ExplicitWidth = 815
  ExplicitHeight = 505
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 799
    Height = 410
    ExplicitWidth = 828
    ExplicitHeight = 410
    object pnlDetail2: TPanel
      Left = 2
      Top = 2
      Width = 795
      Height = 119
      Align = alTop
      BevelKind = bkFlat
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitWidth = 824
      object cbBank: TcxExtLookupComboBox
        Left = 360
        Top = 3
        Properties.DropDownAutoSize = True
        Properties.DropDownSizeable = True
        Properties.ImmediatePost = True
        Properties.MaxLength = 0
        TabOrder = 4
        Width = 223
      end
      object lvSumary: TcxListView
        Left = 588
        Top = 30
        Width = 200
        Height = 50
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
        TabOrder = 8
        ViewStyle = vsReport
      end
      object lvCheque: TcxListView
        Left = 588
        Top = 3
        Width = 200
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
      object edRefNum: TcxButtonEdit
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
      object edReceiveNum: TcxButtonEdit
        Left = 78
        Top = 3
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
            Visible = False
          end>
        Properties.MaxLength = 0
        Properties.ReadOnly = True
        TabOrder = 0
        Width = 199
      end
      object ceSummaryDetail: TcxCurrencyEdit
        Left = 360
        Top = 84
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
      object beBusinessPartner: TcxButtonEdit
        Left = 78
        Top = 57
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.MaxLength = 0
        TabOrder = 2
        Width = 199
      end
      object deReceiveDate: TcxDateEdit
        Left = 78
        Top = 30
        Properties.ImmediatePost = True
        Properties.ShowTime = False
        TabOrder = 1
        Width = 199
      end
      object memDesc: TcxMemo
        Tag = -1
        Left = 360
        Top = 30
        Properties.ScrollBars = ssVertical
        TabOrder = 5
        Height = 50
        Width = 223
      end
      object lbl24: TcxLabel
        Left = 27
        Top = 5
        Caption = 'No Bukti'
        Properties.Alignment.Horz = taLeftJustify
        Transparent = True
      end
      object lbl13: TcxLabel
        Left = 32
        Top = 32
        Caption = 'Tanggal'
        Properties.Alignment.Horz = taLeftJustify
        Transparent = True
      end
      object lbl1: TcxLabel
        Left = 16
        Top = 59
        Caption = 'Organisasi'
        Properties.Alignment.Horz = taLeftJustify
        Transparent = True
      end
      object lbl17: TcxLabel
        Left = 24
        Top = 86
        Caption = 'Penerima'
        Properties.Alignment.Horz = taLeftJustify
        Transparent = True
      end
      object lbl7: TcxLabel
        Left = 297
        Top = 5
        Caption = 'Bank / Kas'
        Properties.Alignment.Horz = taLeftJustify
        Transparent = True
      end
      object lbl15: TcxLabel
        Left = 293
        Top = 32
        Caption = 'Keterangan'
        Properties.Alignment.Horz = taLeftJustify
        Transparent = True
      end
      object lbl12: TcxLabel
        Left = 313
        Top = 86
        Caption = 'Nominal'
        Properties.Alignment.Horz = taLeftJustify
        Transparent = True
      end
    end
    object cxgrdDetail: TcxGrid
      Left = 2
      Top = 121
      Width = 795
      Height = 287
      Align = alClient
      TabOrder = 1
      RootLevelOptions.DetailTabsPosition = dtpTop
      ExplicitLeft = -1
      ExplicitTop = 122
      object cxGridTableAPList: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Column = cxGridColAPNominal
          end
          item
            Column = cxGridColAPSisa
          end
          item
            Column = cxGridColAPBayar
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.ContentEven = DMClient.cxStyleGridEven
        Styles.Header = DMClient.cxStyleGridHeader
        object cxGridColAPAP: TcxGridColumn
          Caption = 'AP'
          PropertiesClassName = 'TcxExtLookupComboBoxProperties'
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColAPTanggal: TcxGridColumn
          Caption = 'Tanggal'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColAPJatuhTempo: TcxGridColumn
          Caption = 'Jatuh Tempo'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 86
        end
        object cxGridColAPRekening: TcxGridColumn
          Caption = 'Rekening'
          PropertiesClassName = 'TcxExtLookupComboBoxProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 88
        end
        object cxGridColAPKeterangan: TcxGridColumn
          Caption = 'Keterangan'
          HeaderAlignmentHorz = taCenter
          Width = 124
        end
        object cxGridColAPNominal: TcxGridColumn
          Caption = 'Nominal'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;(,0.00)'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 100
        end
        object cxGridColAPSisa: TcxGridColumn
          Caption = 'Sisa'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;(,0.00)'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 100
        end
        object cxGridColAPBayar: TcxGridColumn
          Caption = 'Bayar'
          PropertiesClassName = 'TcxCurrencyEditProperties'
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
            Column = cxGridColOtherBayar
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.ContentEven = DMClient.cxStyleGridEven
        Styles.Header = DMClient.cxStyleGridHeader
        object cxGridColOtherKode: TcxGridColumn
          Caption = 'Kode'
          PropertiesClassName = 'TcxExtLookupComboBoxProperties'
          HeaderAlignmentHorz = taCenter
          Width = 121
        end
        object cxGridColOtherNama: TcxGridColumn
          Caption = 'Nama'
          PropertiesClassName = 'TcxExtLookupComboBoxProperties'
          HeaderAlignmentHorz = taCenter
          Width = 123
        end
        object cxGridColOtherKeterangan: TcxGridColumn
          Caption = 'Keterangan'
          HeaderAlignmentHorz = taCenter
          Width = 147
        end
        object cxGridColOtherBayar: TcxGridColumn
          Caption = 'Bayar'
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
            Column = cxGridColChequeBayar
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.ContentEven = DMClient.cxStyleGridEven
        Styles.Header = DMClient.cxStyleGridHeader
        object cxGridColChequeNo: TcxGridColumn
          Caption = 'Nomor'
          HeaderAlignmentHorz = taCenter
          Width = 104
        end
        object cxGridColChequeJatuhTempo: TcxGridColumn
          Caption = 'Jatuh Tempo'
          PropertiesClassName = 'TcxDateEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 133
        end
        object cxGridColChequeBayar: TcxGridColumn
          Caption = 'Bayar'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          HeaderAlignmentHorz = taCenter
          Width = 116
        end
      end
      object cxgrdlvlAPList: TcxGridLevel
        Caption = 'Klaim'
        GridView = cxGridTableAPList
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
    Top = 410
    Width = 799
    ExplicitTop = 410
    ExplicitWidth = 828
    inherited pnlFooter: TPanel
      Width = 799
      ExplicitWidth = 828
      inherited btnClose: TcxButton
        Left = 722
        Action = actCancel
        ExplicitLeft = 751
      end
      inherited btnSave: TcxButton
        Left = 629
        Action = actSave
        ExplicitLeft = 658
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 552
        Action = actPrint
        ExplicitLeft = 581
      end
    end
    inherited pnlSortCut: TPanel
      Width = 799
      ExplicitWidth = 828
      inherited lbCTRLEnter: TLabel
        Left = 624
        Height = 15
        ExplicitLeft = 653
      end
      inherited lbEscape: TLabel
        Left = 715
        Height = 15
        ExplicitLeft = 744
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 548
        Height = 15
        ExplicitLeft = 577
      end
    end
  end
end
