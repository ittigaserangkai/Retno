inherited frmDialogPOFromTrader: TfrmDialogPOFromTrader
  Caption = 'Dialog PO From Trader'
  ClientHeight = 436
  ClientWidth = 786
  ExplicitWidth = 802
  ExplicitHeight = 475
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 786
    Height = 380
    ExplicitWidth = 786
    ExplicitHeight = 380
    object pnl1: TPanel
      Left = 2
      Top = 2
      Width = 782
      Height = 118
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      object lblPONo: TLabel
        Left = 30
        Top = 8
        Width = 34
        Height = 16
        Caption = 'PO No.'
      end
      object lblPODate: TLabel
        Left = 23
        Top = 36
        Width = 41
        Height = 16
        Caption = 'PO Date'
      end
      object lblLeadTime: TLabel
        Left = 250
        Top = 35
        Width = 50
        Height = 16
        Caption = 'Lead Time'
      end
      object lblTOP: TLabel
        Left = 398
        Top = 35
        Width = 26
        Height = 16
        Caption = 'T.O.P'
      end
      object lblIsMember: TLabel
        Left = 237
        Top = 8
        Width = 63
        Height = 16
        Caption = 'Tipe Member'
      end
      object lblOrganizasi: TLabel
        Left = 11
        Top = 62
        Width = 53
        Height = 16
        Caption = 'Organisasi'
      end
      object lblDesc: TLabel
        Left = 242
        Top = 62
        Width = 58
        Height = 16
        Caption = 'Keterangan'
      end
      object lblSubTotal: TLabel
        Left = 540
        Top = 9
        Width = 44
        Height = 16
        Caption = 'Sub Total'
      end
      object lblDisc: TLabel
        Left = 551
        Top = 35
        Width = 33
        Height = 16
        Caption = 'Diskon'
      end
      object lblPPN: TLabel
        Left = 565
        Top = 62
        Width = 19
        Height = 16
        Caption = 'PPN'
      end
      object lblTotal: TLabel
        Left = 560
        Top = 89
        Width = 24
        Height = 16
        Caption = 'Total'
      end
      object dtTgl: TcxDateEdit
        Left = 71
        Top = 31
        TabOrder = 1
        Width = 146
      end
      object edNoBukti: TcxTextEdit
        Left = 71
        Top = 4
        Enabled = False
        TabOrder = 0
        Width = 146
      end
      object edOrganization: TcxButtonEdit
        Tag = 1
        Left = 71
        Top = 58
        HelpType = htKeyword
        HelpKeyword = 'Organisasi'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.CharCase = ecUpperCase
        Properties.MaxLength = 0
        Properties.OnButtonClick = edOrganizationPropertiesButtonClick
        TabOrder = 2
        Width = 146
      end
      object edOrganizationName: TcxButtonEdit
        Left = 71
        Top = 85
        Enabled = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
            Visible = False
          end>
        Properties.MaxLength = 0
        TabOrder = 3
        Width = 146
      end
      object edTipeMember: TcxTextEdit
        Left = 309
        Top = 5
        Enabled = False
        TabOrder = 4
        Width = 185
      end
      object edLeadTime: TcxTextEdit
        Left = 309
        Top = 31
        Enabled = False
        TabOrder = 5
        Width = 60
      end
      object edTOP: TcxTextEdit
        Left = 434
        Top = 31
        Enabled = False
        TabOrder = 6
        Width = 60
      end
      object memDescription: TcxMemo
        Left = 309
        Top = 58
        TabOrder = 7
        Height = 51
        Width = 185
      end
      object edSubTotal: TcxCurrencyEdit
        Left = 597
        Top = 4
        Enabled = False
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 8
        Width = 180
      end
      object edDisc: TcxCurrencyEdit
        Left = 597
        Top = 31
        Enabled = False
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 9
        Width = 180
      end
      object edPPN: TcxCurrencyEdit
        Left = 597
        Top = 58
        Enabled = False
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 10
        Width = 180
      end
      object edTotal: TcxCurrencyEdit
        Left = 597
        Top = 85
        Enabled = False
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 11
        Width = 180
      end
    end
    object cxGrid: TcxGrid
      Left = 2
      Top = 120
      Width = 782
      Height = 258
      Align = alClient
      TabOrder = 1
      LockedStateImageOptions.Text = 'Mohon ditunggu...'
      RootLevelOptions.DetailTabsPosition = dtpTop
      object cxGridDBTablePOTrader: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        FindPanel.InfoText = 'ketik teks yang dicari...'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        FilterRow.InfoText = 'klik untuk memfilter data'
        NewItemRow.InfoText = 'Baris baru'
        OptionsView.NoDataToDisplayInfoText = '<Data kosong>'
        OptionsView.GroupByBox = False
        object cxGridColPODKode: TcxGridDBColumn
          Caption = 'Kode'
          HeaderAlignmentHorz = taCenter
          Width = 91
        end
        object cxGridColPODNama: TcxGridDBColumn
          Caption = 'Nama'
          HeaderAlignmentHorz = taCenter
          Width = 209
        end
        object cxGridColPODUOM: TcxGridDBColumn
          Caption = 'UOM'
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColPODHarga: TcxGridDBColumn
          Caption = 'Harga'
          HeaderAlignmentHorz = taCenter
          Width = 88
        end
        object cxGridColPODQty: TcxGridDBColumn
          Caption = 'Qty'
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColPODDisc: TcxGridDBColumn
          Caption = 'Disc'
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColPODPPN: TcxGridDBColumn
          Caption = 'PPN'
          HeaderAlignmentHorz = taCenter
        end
        object cxGridColPODTotal: TcxGridDBColumn
          Caption = 'Total'
          HeaderAlignmentHorz = taCenter
          Width = 131
        end
      end
      object cxgrdlvlPOTrader: TcxGridLevel
        Caption = 'PO Trader Item'
        GridView = cxGridDBTablePOTrader
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 380
    Width = 786
    ExplicitTop = 380
    ExplicitWidth = 786
    inherited pnlFooter: TPanel
      Width = 786
      ExplicitWidth = 786
      inherited btnClose: TcxButton
        Left = 709
        Action = actCancel
        ExplicitLeft = 709
      end
      inherited btnSave: TcxButton
        Left = 616
        Action = actSave
        ExplicitLeft = 616
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 539
        Action = actPrint
        ExplicitLeft = 539
      end
    end
    inherited pnlSortCut: TPanel
      Width = 786
      ExplicitWidth = 786
      inherited lbCTRLEnter: TLabel
        Left = 611
        Height = 15
        ExplicitLeft = 611
      end
      inherited lbEscape: TLabel
        Left = 702
        Height = 15
        ExplicitLeft = 702
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 535
        Height = 15
        ExplicitLeft = 535
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 744
    Top = 216
  end
end
