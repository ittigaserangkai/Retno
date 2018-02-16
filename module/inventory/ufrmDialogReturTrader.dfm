inherited frmDialogReturTrader: TfrmDialogReturTrader
  Left = 135
  Top = 66
  Caption = 'Dialog Retur Trader'
  ClientHeight = 481
  ClientWidth = 797
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 813
  ExplicitHeight = 520
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 797
    Height = 425
    ExplicitWidth = 797
    ExplicitHeight = 425
    object pnl1: TPanel
      Left = 2
      Top = 2
      Width = 793
      Height = 145
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      object lbl1: TLabel
        Left = 21
        Top = 37
        Width = 44
        Height = 16
        Caption = 'Retur No'
      end
      object lbl2: TLabel
        Left = 263
        Top = 37
        Width = 55
        Height = 16
        Caption = 'Retur Date'
      end
      object lblOrganizasi: TLabel
        Left = 11
        Top = 65
        Width = 53
        Height = 16
        Caption = 'Organisasi'
      end
      object lblDesc: TLabel
        Left = 260
        Top = 93
        Width = 58
        Height = 16
        Caption = 'Keterangan'
      end
      object lblDONo: TLabel
        Left = 34
        Top = 9
        Width = 31
        Height = 16
        Caption = 'DO No'
      end
      object lblDODate: TLabel
        Left = 276
        Top = 9
        Width = 42
        Height = 16
        Caption = 'DO Date'
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
        Top = 37
        Width = 33
        Height = 16
        Caption = 'Diskon'
      end
      object lblPPN: TLabel
        Left = 565
        Top = 65
        Width = 19
        Height = 16
        Caption = 'PPN'
      end
      object lblTotal: TLabel
        Left = 560
        Top = 93
        Width = 24
        Height = 16
        Caption = 'Total'
      end
      object lblGudang: TLabel
        Left = 281
        Top = 65
        Width = 37
        Height = 16
        Caption = 'Gudang'
      end
      object dtTgl: TcxDateEdit
        Left = 336
        Top = 33
        TabOrder = 5
        Width = 146
      end
      object edNoBukti: TcxTextEdit
        Left = 71
        Top = 33
        Enabled = False
        TabOrder = 1
        Width = 146
      end
      object edOrganization: TcxButtonEdit
        Tag = 1
        Left = 71
        Top = 61
        HelpType = htKeyword
        HelpKeyword = 'Organisasi'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.CharCase = ecUpperCase
        Properties.MaxLength = 0
        Properties.ReadOnly = True
        TabOrder = 2
        Width = 146
      end
      object edOrganizationName: TcxButtonEdit
        Left = 71
        Top = 89
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
      object memDescription: TcxMemo
        Left = 336
        Top = 89
        TabOrder = 7
        Height = 50
        Width = 193
      end
      object edDONo: TcxButtonEdit
        Tag = 1
        Left = 71
        Top = 5
        HelpType = htKeyword
        HelpKeyword = 'Organisasi'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.CharCase = ecUpperCase
        Properties.MaxLength = 0
        Properties.OnButtonClick = edDONoPropertiesButtonClick
        TabOrder = 0
        Width = 146
      end
      object dtDODate: TcxDateEdit
        Left = 336
        Top = 5
        Enabled = False
        TabOrder = 4
        Width = 146
      end
      object edSubTotal: TcxCurrencyEdit
        Left = 597
        Top = 5
        Enabled = False
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 8
        Width = 180
      end
      object edDisc: TcxCurrencyEdit
        Left = 597
        Top = 33
        Enabled = False
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 9
        Width = 180
      end
      object edPPN: TcxCurrencyEdit
        Left = 597
        Top = 61
        Enabled = False
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 10
        Width = 180
      end
      object edTotal: TcxCurrencyEdit
        Left = 597
        Top = 89
        Enabled = False
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 11
        Width = 180
      end
      object cbbGudang: TcxExtLookupComboBox
        Left = 336
        Top = 61
        TabOrder = 6
        Width = 145
      end
    end
    object cxGrid: TcxGrid
      Left = 2
      Top = 147
      Width = 793
      Height = 276
      Align = alClient
      TabOrder = 1
      LockedStateImageOptions.Text = 'Mohon ditunggu...'
      RootLevelOptions.DetailTabsPosition = dtpTop
      object cxGridDBTableDOTrader: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        FindPanel.InfoText = 'ketik teks yang dicari...'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0.00;(,0.00)'
            Kind = skSum
            Column = cxGridColPODTotal
          end>
        DataController.Summary.SummaryGroups = <>
        FilterRow.InfoText = 'klik untuk memfilter data'
        NewItemRow.InfoText = 'Baris baru'
        OptionsData.CancelOnExit = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.NoDataToDisplayInfoText = '<Data kosong>'
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.ContentEven = DMClient.cxStyleGridEven
        object cxGridColPODKode: TcxGridDBColumn
          Caption = 'Kode'
          DataBinding.FieldName = 'PLU'
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          HeaderAlignmentHorz = taCenter
          Width = 107
        end
        object cxGridColPODNama: TcxGridDBColumn
          Caption = 'Nama'
          DataBinding.FieldName = 'NamaBarang'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 200
        end
        object cxGridColPODUOM: TcxGridDBColumn
          Caption = 'UOM'
          DataBinding.FieldName = 'RETITEM_SATUAN'
          PropertiesClassName = 'TcxExtLookupComboBoxProperties'
          HeaderAlignmentHorz = taCenter
          Width = 60
        end
        object cxGridColPODHarga: TcxGridDBColumn
          Caption = 'Harga'
          DataBinding.FieldName = 'RETITEM_SELLPRICE'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;($,0.00)'
          HeaderAlignmentHorz = taCenter
          Width = 88
        end
        object cxGridColPODQtyPO: TcxGridDBColumn
          Caption = 'Qty DO'
          DataBinding.FieldName = 'RETITEM_QTY'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.##;(,0.##)'
          HeaderAlignmentHorz = taCenter
          Width = 70
        end
        object cxGridColPODQtyDO: TcxGridDBColumn
          Caption = 'Qty Retur'
          DataBinding.FieldName = 'RETITEM_QTY'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.##;(,0.##)'
          Properties.OnEditValueChanged = cxGridColPODQtyDOPropertiesEditValueChanged
          HeaderAlignmentHorz = taCenter
          Styles.Content = DMClient.cxStyleMoneyGreen
          Width = 70
        end
        object cxGridColPODDisc: TcxGridDBColumn
          Caption = 'Disc %'
          DataBinding.FieldName = 'RETITEM_DISC'
          HeaderAlignmentHorz = taCenter
          Width = 60
        end
        object cxGridColPODPPN: TcxGridDBColumn
          Caption = 'PPN %'
          DataBinding.FieldName = 'RETITEM_PPN'
          HeaderAlignmentHorz = taCenter
          Width = 60
        end
        object cxGridColPODTotal: TcxGridDBColumn
          Caption = 'Total'
          DataBinding.FieldName = 'RETITEM_TOTAL'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          HeaderAlignmentHorz = taCenter
          Width = 131
        end
      end
      object cxgrdlvlDOTrader: TcxGridLevel
        Caption = 'DO Trader Item'
        GridView = cxGridDBTableDOTrader
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 425
    Width = 797
    ExplicitTop = 425
    ExplicitWidth = 797
    inherited pnlFooter: TPanel
      Width = 797
      ExplicitWidth = 797
      inherited btnClose: TcxButton
        Left = 720
        Action = actCancel
        ExplicitLeft = 720
      end
      inherited btnSave: TcxButton
        Left = 627
        Action = actSave
        ExplicitLeft = 627
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 550
        Action = actPrint
        ExplicitLeft = 550
      end
    end
    inherited pnlSortCut: TPanel
      Width = 797
      ExplicitWidth = 797
      inherited lbCTRLEnter: TLabel
        Left = 622
        Height = 15
        ExplicitLeft = 622
      end
      inherited lbEscape: TLabel
        Left = 713
        Height = 15
        ExplicitLeft = 713
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 546
        Height = 15
        ExplicitLeft = 546
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 384
    Top = 216
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
end
