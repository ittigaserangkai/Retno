inherited frmDialogClaim: TfrmDialogClaim
  Caption = 'Claim'
  ClientHeight = 486
  ClientWidth = 844
  ExplicitWidth = 860
  ExplicitHeight = 525
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 844
    Height = 430
    BevelInner = bvNone
    ExplicitWidth = 844
    ExplicitHeight = 430
    object pnlHeader: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 836
      Height = 149
      Align = alTop
      TabOrder = 0
      object lblSupplier: TLabel
        Left = 26
        Top = 17
        Width = 57
        Height = 16
        Caption = 'Supplier MG'
      end
      object lblTTF: TLabel
        Left = 49
        Top = 71
        Width = 34
        Height = 16
        Caption = 'No TTF'
      end
      object lblTgkClaim: TLabel
        Left = 46
        Top = 98
        Width = 37
        Height = 16
        Caption = 'Tanggal'
      end
      object lblDescription: TLabel
        Left = 411
        Top = 98
        Width = 46
        Height = 16
        Caption = 'Deskripsi'
      end
      object lblTglKembali: TLabel
        Left = 6
        Top = 125
        Width = 77
        Height = 16
        Caption = 'Tanggal Kembali'
      end
      object lblDueDate: TLabel
        Left = 411
        Top = 17
        Width = 62
        Height = 16
        Caption = 'Jatuh Tempo'
      end
      object lblAkun: TLabel
        Left = 410
        Top = 44
        Width = 63
        Height = 16
        Caption = 'Akun Hutang'
      end
      object lblNoClaim: TLabel
        Left = 223
        Top = 71
        Width = 42
        Height = 16
        Caption = 'No Claim'
      end
      object Label1: TLabel
        Left = 21
        Top = 40
        Width = 46
        Height = 16
        Caption = 'Deskripsi'
      end
      object cbbSupplierMG: TcxExtLookupComboBox
        Left = 93
        Top = 13
        TabOrder = 0
        Width = 121
      end
      object dtTglClaim: TcxDateEdit
        Left = 93
        Top = 94
        TabOrder = 2
        Width = 121
      end
      object edTTFNo: TcxTextEdit
        Left = 93
        Top = 67
        TabOrder = 1
        Text = 'edTTFNo'
        Width = 121
      end
      object memDescription: TcxMemo
        Left = 483
        Top = 94
        Lines.Strings = (
          'memDescription')
        TabOrder = 7
        Height = 51
        Width = 270
      end
      object dtReturnDate: TcxDateEdit
        Left = 93
        Top = 121
        TabOrder = 3
        Width = 121
      end
      object dtDueDate: TcxDateEdit
        Left = 483
        Top = 13
        TabOrder = 4
        Width = 121
      end
      object cbbAccount: TcxExtLookupComboBox
        Left = 483
        Top = 40
        TabOrder = 5
        Width = 121
      end
      object edAKunHutang: TcxTextEdit
        Left = 483
        Top = 67
        Enabled = False
        TabOrder = 6
        Text = 'edTTFNo'
        Width = 270
      end
      object edNoClaim: TcxTextEdit
        Left = 271
        Top = 67
        TabOrder = 8
        Text = 'edTTFNo'
        Width = 116
      end
      object edNamaSupplierMG: TcxTextEdit
        Left = 93
        Top = 40
        Enabled = False
        TabOrder = 9
        Text = 'edTTFNo'
        Width = 294
      end
    end
    object pnlSummary: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 367
      Width = 836
      Height = 59
      Align = alBottom
      TabOrder = 1
      DesignSize = (
        836
        59)
      object lblDO: TLabel
        Left = 172
        Top = 7
        Width = 81
        Height = 16
        Anchors = [akTop, akRight]
        Caption = 'Goods Receiving'
      end
      object lblCN: TLabel
        Left = 239
        Top = 34
        Width = 14
        Height = 16
        Anchors = [akTop, akRight]
        Caption = 'CN'
      end
      object lblDN: TLabel
        Left = 447
        Top = 7
        Width = 14
        Height = 16
        Anchors = [akTop, akRight]
        Caption = 'DN'
      end
      object lblOther: TLabel
        Left = 431
        Top = 34
        Width = 30
        Height = 16
        Anchors = [akTop, akRight]
        Caption = 'Other'
      end
      object lblTotal: TLabel
        Left = 649
        Top = 7
        Width = 24
        Height = 16
        Anchors = [akTop, akRight]
        Caption = 'Total'
      end
      object edNomGR: TcxCurrencyEdit
        Left = 259
        Top = 3
        Anchors = [akTop, akRight]
        Enabled = False
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 0
        Width = 153
      end
      object edCN: TcxCurrencyEdit
        Left = 259
        Top = 30
        Anchors = [akTop, akRight]
        Enabled = False
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 1
        Width = 153
      end
      object edDN: TcxCurrencyEdit
        Left = 467
        Top = 3
        Anchors = [akTop, akRight]
        Enabled = False
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 2
        Width = 153
      end
      object edOther: TcxCurrencyEdit
        Left = 467
        Top = 30
        Anchors = [akTop, akRight]
        Enabled = False
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 3
        Width = 153
      end
      object edTotal: TcxCurrencyEdit
        Left = 679
        Top = 3
        Anchors = [akTop, akRight]
        Enabled = False
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 4
        Width = 153
      end
    end
    object pnlData: TPanel
      Left = 1
      Top = 156
      Width = 842
      Height = 208
      Align = alClient
      TabOrder = 2
      object cxgrdClaim: TcxGrid
        Left = 1
        Top = 1
        Width = 672
        Height = 206
        Align = alClient
        TabOrder = 0
        RootLevelOptions.DetailTabsPosition = dtpTop
        object cxGridDBTableCN: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
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
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColCNPO: TcxGridDBColumn
            Caption = 'PO'
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColCNTgl: TcxGridDBColumn
            Caption = 'Tanggal'
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColCNNominal: TcxGridDBColumn
            Caption = 'Nominal'
            HeaderAlignmentHorz = taCenter
          end
        end
        object cxGridDBTableDN: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Column = cxGridColDNNominal
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          Styles.ContentEven = DMClient.cxStyleGridEven
          Styles.Header = DMClient.cxStyleGridHeader
          object cxGridColDNNP: TcxGridDBColumn
            Caption = 'NP'
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColDNPO: TcxGridDBColumn
            Caption = 'PO'
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColDNTgl: TcxGridDBColumn
            Caption = 'Tanggal'
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColDNNominal: TcxGridDBColumn
            Caption = 'Nominal'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;(,0.00)'
            HeaderAlignmentHorz = taCenter
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
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          Styles.ContentEven = DMClient.cxStyleGridEven
          Styles.Header = DMClient.cxStyleGridHeader
          object cxGridColOtherCostCenter: TcxGridDBColumn
            Caption = 'Cost Center'
            HeaderAlignmentHorz = taCenter
            Width = 89
          end
          object cxGridColOtherAccountCode: TcxGridDBColumn
            Caption = 'Kode'
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColOtherAccountName: TcxGridDBColumn
            Caption = 'Nama'
            HeaderAlignmentHorz = taCenter
          end
          object cxGridColOtherNominal: TcxGridDBColumn
            Caption = 'Nominal'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;(,0.00)'
            HeaderAlignmentHorz = taCenter
            Width = 97
          end
        end
        object cxGridDBTableGR: TcxGridDBBandedTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Column = cxGridColGRNominal
            end
            item
              Column = cxGridColGRNominalFakturPajak
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          Styles.ContentEven = DMClient.cxStyleGridEven
          Styles.Header = DMClient.cxStyleGridHeader
          Bands = <
            item
              Caption = 'Goods Receiving'
              Styles.Header = DMClient.cxStyleGridHeader
              Width = 355
            end
            item
              Caption = 'Faktur Pajak'
              Styles.Header = DMClient.cxStyleGridHeader
              Width = 243
            end>
          object cxGridColGRNP: TcxGridDBBandedColumn
            Caption = 'NP'
            HeaderAlignmentHorz = taCenter
            Width = 90
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object cxGridColGRPO: TcxGridDBBandedColumn
            Caption = 'PO'
            HeaderAlignmentHorz = taCenter
            Width = 61
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object cxGridColGRNoFaktur: TcxGridDBBandedColumn
            Caption = 'No Faktur'
            HeaderAlignmentHorz = taCenter
            Width = 61
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object cxGridColGRTglFakturPajak: TcxGridDBBandedColumn
            Caption = 'Tanggal'
            HeaderAlignmentHorz = taCenter
            Position.BandIndex = 1
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object cxGridColGRNoFakturPajak: TcxGridDBBandedColumn
            Caption = 'No'
            HeaderAlignmentHorz = taCenter
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object cxGridColGRNominalFakturPajak: TcxGridDBBandedColumn
            Caption = 'Nominal'
            HeaderAlignmentHorz = taCenter
            Position.BandIndex = 1
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object cxGridColGRTglFaktur: TcxGridDBBandedColumn
            Caption = 'Tgl Faktur'
            HeaderAlignmentHorz = taCenter
            Width = 61
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object cxGridColGRNominal: TcxGridDBBandedColumn
            Caption = 'Nominal'
            HeaderAlignmentHorz = taCenter
            Width = 82
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
        end
        object cxgrdlvlGR: TcxGridLevel
          Caption = 'Goods Receiving'
          GridView = cxGridDBTableGR
        end
        object cxgrdlvlCN: TcxGridLevel
          Caption = 'Credit Note'
          GridView = cxGridDBTableCN
        end
        object cxgrdlvlDN: TcxGridLevel
          Caption = 'Debit Note'
          GridView = cxGridDBTableDN
        end
        object cxgrdlvlOther: TcxGridLevel
          Caption = 'Other'
          GridView = cxGridDBTableOther
        end
      end
      object pnlButtonData: TPanel
        Left = 673
        Top = 1
        Width = 168
        Height = 206
        Align = alRight
        TabOrder = 1
        object bPoDetail: TcxButton
          AlignWithMargins = True
          Left = 4
          Top = 1
          Width = 160
          Height = 25
          Margins.Top = 0
          Align = alTop
          Action = actViewPO
          TabOrder = 0
        end
        object bViewAdjustment: TcxButton
          AlignWithMargins = True
          Left = 4
          Top = 29
          Width = 160
          Height = 25
          Margins.Top = 0
          Align = alTop
          Action = actViewAdj
          TabOrder = 1
        end
        object bAddDN: TcxButton
          AlignWithMargins = True
          Left = 4
          Top = 85
          Width = 160
          Height = 25
          Margins.Top = 0
          Align = alTop
          Action = actAddDN
          TabOrder = 2
        end
        object bAddCN: TcxButton
          AlignWithMargins = True
          Left = 4
          Top = 57
          Width = 160
          Height = 25
          Margins.Top = 0
          Align = alTop
          Action = actAddCN
          TabOrder = 3
        end
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 430
    Width = 844
    ExplicitTop = 430
    ExplicitWidth = 844
    inherited pnlFooter: TPanel
      Width = 844
      ExplicitWidth = 844
      inherited btnClose: TcxButton
        Left = 767
        Action = actCancel
        ExplicitLeft = 767
      end
      inherited btnSave: TcxButton
        Left = 674
        Action = actSave
        ExplicitLeft = 674
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 597
        Action = actPrint
        ExplicitLeft = 597
      end
    end
    inherited pnlSortCut: TPanel
      Width = 844
      ExplicitWidth = 844
      inherited lbCTRLEnter: TLabel
        Left = 669
        Height = 15
        ExplicitLeft = 669
      end
      inherited lbEscape: TLabel
        Left = 760
        Height = 15
        ExplicitLeft = 760
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 593
        Height = 15
        ExplicitLeft = 593
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 784
    Top = 16
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
      OnExecute = actAddCNExecute
    end
    object actAddDN: TAction
      Caption = 'Tambah DN [Alt+D]'
      ShortCut = 32836
      OnExecute = actAddDNExecute
    end
  end
end
