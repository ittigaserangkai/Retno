inherited frmDialogPOFromTrader: TfrmDialogPOFromTrader
  Caption = 'Dialog PO From Trader'
  ClientHeight = 436
  ClientWidth = 787
  ExplicitWidth = 803
  ExplicitHeight = 475
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 787
    Height = 380
    ExplicitWidth = 787
    ExplicitHeight = 380
    object pnl1: TPanel
      Left = 2
      Top = 2
      Width = 783
      Height = 112
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
        Top = 35
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
        Top = 60
        Width = 53
        Height = 16
        Caption = 'Organisasi'
      end
      object lblDesc: TLabel
        Left = 526
        Top = 8
        Width = 58
        Height = 16
        Caption = 'Keterangan'
      end
      object lblTotal: TLabel
        Left = 259
        Top = 60
        Width = 41
        Height = 16
        Caption = 'Total PO'
      end
      object dtTgl: TcxDateEdit
        Left = 71
        Top = 31
        Properties.SaveTime = False
        Properties.ShowTime = False
        TabOrder = 1
        Width = 146
      end
      object edNoBukti: TcxTextEdit
        Left = 71
        Top = 5
        Enabled = False
        Properties.ReadOnly = True
        TabOrder = 0
        Width = 146
      end
      object edOrganization: TcxButtonEdit
        Tag = 1
        Left = 71
        Top = 57
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
        Top = 83
        Enabled = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
            Visible = False
          end>
        Properties.MaxLength = 0
        Properties.ReadOnly = True
        TabOrder = 3
        Width = 423
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
        Left = 590
        Top = 5
        TabOrder = 8
        Height = 102
        Width = 185
      end
      object edTotal: TcxCurrencyEdit
        Left = 309
        Top = 57
        Enabled = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        Properties.ReadOnly = True
        TabOrder = 7
        Width = 185
      end
    end
    object cxGrid: TcxGrid
      Left = 2
      Top = 114
      Width = 783
      Height = 229
      Align = alClient
      TabOrder = 1
      LockedStateImageOptions.Text = 'Mohon ditunggu...'
      RootLevelOptions.DetailTabsPosition = dtpTop
      object cxGridDBTablePOTrader: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        FindPanel.InfoText = 'ketik teks yang dicari...'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0.00;(,0.00)'
            Kind = skSum
            Column = cxGridColPODTotal
          end
          item
            Format = ',0.00;(,0.00)'
            Kind = skSum
            Column = cxGridColPODQty
          end>
        DataController.Summary.SummaryGroups = <>
        FilterRow.InfoText = 'klik untuk memfilter data'
        NewItemRow.InfoText = 'Baris baru'
        OptionsView.NoDataToDisplayInfoText = '<Data kosong>'
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        object cxGridColPODBarang: TcxGridDBColumn
          Visible = False
          MinWidth = 60
          Width = 70
        end
        object cxGridColPODKode: TcxGridDBColumn
          Caption = 'Kode'
          DataBinding.FieldName = 'BRG_KODE'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          Properties.OnEditValueChanged = cxGridColPODKodePropertiesEditValueChanged
          HeaderAlignmentHorz = taCenter
          MinWidth = 60
          Width = 70
        end
        object cxGridColPODNama: TcxGridDBColumn
          Caption = 'Nama'
          DataBinding.FieldName = 'BRG_NAMA'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          MinWidth = 60
          Width = 70
        end
        object cxGridColPODUOM: TcxGridDBColumn
          Caption = 'UOM'
          DataBinding.FieldName = 'BRG_UOM'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          MinWidth = 60
          Width = 70
        end
        object cxGridColPODHarga: TcxGridDBColumn
          Caption = 'Harga'
          DataBinding.FieldName = 'POTITEM_SELLPRICE'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;(,0.00)'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          MinWidth = 60
          Width = 70
        end
        object cxGridColPODQty: TcxGridDBColumn
          Caption = 'Qty'
          DataBinding.FieldName = 'POTITEM_QTY'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;(,0.00)'
          Properties.OnEditValueChanged = cxGridColPODQtyPropertiesEditValueChanged
          HeaderAlignmentHorz = taCenter
          MinWidth = 60
          Width = 70
        end
        object cxGridColPODDisc: TcxGridDBColumn
          Caption = 'Disc'
          DataBinding.FieldName = 'POTITEM_DISC'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;(,0.00)'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          MinWidth = 60
          Width = 70
        end
        object cxGridColPODPPN: TcxGridDBColumn
          Caption = 'PPN'
          DataBinding.FieldName = 'POTITEM_PPN'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;(,0.00)'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          MinWidth = 60
          Width = 70
        end
        object cxGridColPODTotal: TcxGridDBColumn
          Caption = 'Total'
          DataBinding.FieldName = 'POTITEM_TOTAL'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;(,0.00)'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          MinWidth = 60
          Width = 70
        end
      end
      object cxgrdlvlPOTrader: TcxGridLevel
        Caption = 'PO Trader Item'
        GridView = cxGridDBTablePOTrader
      end
    end
    object Panel1: TPanel
      Left = 2
      Top = 343
      Width = 783
      Height = 35
      Align = alBottom
      TabOrder = 2
      object Label1: TLabel
        Left = 3
        Top = 9
        Width = 62
        Height = 16
        Caption = 'Kode Barang'
      end
      object edPLU: TcxTextEdit
        Left = 71
        Top = 6
        TabOrder = 0
        OnKeyDown = edPLUKeyDown
        Width = 146
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 380
    Width = 787
    ExplicitTop = 380
    ExplicitWidth = 787
    inherited pnlFooter: TPanel
      Width = 787
      ExplicitWidth = 787
      inherited btnClose: TcxButton
        Left = 710
        Action = actCancel
        ExplicitLeft = 710
      end
      inherited btnSave: TcxButton
        Left = 617
        Action = actSave
        ExplicitLeft = 617
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 540
        Action = actPrint
        ExplicitLeft = 540
      end
    end
    inherited pnlSortCut: TPanel
      Width = 787
      ExplicitWidth = 787
      inherited lbCTRLEnter: TLabel
        Left = 612
        ExplicitLeft = 612
      end
      inherited lbEscape: TLabel
        Left = 703
        ExplicitLeft = 703
      end
      inherited lblCTRLP: TLabel
        Left = 536
        ExplicitLeft = 536
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 744
    Top = 216
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
