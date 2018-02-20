inherited frmDialogDOForTrader: TfrmDialogDOForTrader
  Caption = 'Dialog DO For Trader'
  ClientHeight = 561
  ClientWidth = 858
  ExplicitTop = -87
  ExplicitWidth = 874
  ExplicitHeight = 600
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 858
    Height = 505
    ExplicitWidth = 858
    ExplicitHeight = 505
    object pnl1: TPanel
      Left = 2
      Top = 2
      Width = 854
      Height = 133
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 0
      DesignSize = (
        854
        133)
      object lbl1: TLabel
        Left = 30
        Top = 37
        Width = 31
        Height = 16
        Caption = 'DO No'
      end
      object lbl2: TLabel
        Left = 302
        Top = 9
        Width = 41
        Height = 16
        Caption = 'PO Date'
      end
      object lblOrganizasi: TLabel
        Left = 11
        Top = 65
        Width = 53
        Height = 16
        Caption = 'Organisasi'
      end
      object lblDesc: TLabel
        Left = 285
        Top = 93
        Width = 58
        Height = 16
        Caption = 'Keterangan'
      end
      object lblDONo: TLabel
        Left = 34
        Top = 9
        Width = 30
        Height = 16
        Caption = 'PO No'
      end
      object lblDODate: TLabel
        Left = 301
        Top = 37
        Width = 42
        Height = 16
        Caption = 'DO Date'
      end
      object lblSubTotal: TLabel
        Left = 603
        Top = 9
        Width = 44
        Height = 16
        Anchors = [akTop, akRight]
        Caption = 'Sub Total'
        ExplicitLeft = 617
      end
      object lblDisc: TLabel
        Left = 614
        Top = 37
        Width = 33
        Height = 16
        Anchors = [akTop, akRight]
        Caption = 'Diskon'
        ExplicitLeft = 628
      end
      object lblPPN: TLabel
        Left = 628
        Top = 65
        Width = 19
        Height = 16
        Anchors = [akTop, akRight]
        Caption = 'PPN'
        ExplicitLeft = 642
      end
      object lblTotal: TLabel
        Left = 623
        Top = 93
        Width = 24
        Height = 16
        Anchors = [akTop, akRight]
        Caption = 'Total'
        ExplicitLeft = 637
      end
      object lblGudang: TLabel
        Left = 306
        Top = 65
        Width = 37
        Height = 16
        Caption = 'Gudang'
      end
      object dtPODate: TcxDateEdit
        Left = 361
        Top = 5
        TabOrder = 1
        Width = 146
      end
      object edNoBukti: TcxTextEdit
        Left = 71
        Top = 33
        Enabled = False
        TabOrder = 0
        Width = 170
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
        Width = 170
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
        Width = 170
      end
      object memDescription: TcxMemo
        Left = 361
        Top = 89
        TabOrder = 4
        Height = 40
        Width = 193
      end
      object edPONo: TcxButtonEdit
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
        Properties.OnButtonClick = edPONoPropertiesButtonClick
        TabOrder = 5
        OnExit = edPONoExit
        Width = 170
      end
      object dtDODate: TcxDateEdit
        Left = 361
        Top = 33
        TabOrder = 6
        Width = 146
      end
      object edSubTotal: TcxCurrencyEdit
        Left = 660
        Top = 5
        Anchors = [akTop, akRight]
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        Style.BorderStyle = ebsUltraFlat
        Style.Color = clBtnFace
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Trebuchet MS'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 7
        Width = 180
      end
      object edDisc: TcxCurrencyEdit
        Left = 660
        Top = 33
        Anchors = [akTop, akRight]
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        Style.BorderStyle = ebsUltraFlat
        Style.Color = clBtnFace
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Trebuchet MS'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 8
        Width = 180
      end
      object edPPN: TcxCurrencyEdit
        Left = 660
        Top = 61
        Anchors = [akTop, akRight]
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        Style.BorderStyle = ebsUltraFlat
        Style.Color = clBtnFace
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Trebuchet MS'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 9
        Width = 180
      end
      object edTotal: TcxCurrencyEdit
        Left = 660
        Top = 89
        Anchors = [akTop, akRight]
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        Style.BorderStyle = ebsUltraFlat
        Style.Color = clBtnFace
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Trebuchet MS'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 10
        Width = 180
      end
      object cbbGudang: TcxExtLookupComboBox
        Left = 361
        Top = 61
        TabOrder = 11
        Width = 145
      end
    end
    object cxGrid: TcxGrid
      Left = 2
      Top = 174
      Width = 854
      Height = 329
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
          Properties.ReadOnly = True
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
          DataBinding.FieldName = 'DOTITEM_SATUAN'
          PropertiesClassName = 'TcxExtLookupComboBoxProperties'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 60
        end
        object cxGridColPODHarga: TcxGridDBColumn
          Caption = 'Harga'
          DataBinding.FieldName = 'DOTITEM_SELLPRICE'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;($,0.00)'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 88
        end
        object cxGridColPODQtyPO: TcxGridDBColumn
          Caption = 'Qty PO'
          DataBinding.FieldName = 'POTITEM_QTY'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.##;(,0.##)'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 70
        end
        object cxGridColPODQtyDO: TcxGridDBColumn
          Caption = 'Qty DO'
          DataBinding.FieldName = 'DOTITEM_QTY'
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
          DataBinding.FieldName = 'DOTITEM_DISC'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.##;(,0.##)'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 60
        end
        object cxGridColPODPPN: TcxGridDBColumn
          Caption = 'PPN %'
          DataBinding.FieldName = 'DOTITEM_PPN'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.##;(,0.##)'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 60
        end
        object cxGridColPODTotal: TcxGridDBColumn
          Caption = 'Total'
          DataBinding.FieldName = 'DOTITEM_TOTAL'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;(,0.00)'
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          Width = 131
        end
      end
      object cxgrdlvlDOTrader: TcxGridLevel
        Caption = 'DO Trader Item'
        GridView = cxGridDBTableDOTrader
      end
    end
    object cxGroupBox1: TcxGroupBox
      Left = 2
      Top = 135
      Align = alTop
      PanelStyle.Active = True
      ParentBackground = False
      ParentColor = False
      Style.BorderStyle = ebsNone
      Style.Color = clInfoBk
      TabOrder = 2
      Transparent = True
      Visible = False
      Height = 39
      Width = 854
      object cxLabel1: TcxLabel
        AlignWithMargins = True
        Left = 5
        Top = 5
        Align = alLeft
        Caption = 'Kode / Barcode Barang : '
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowFrame
        Style.Font.Height = -13
        Style.Font.Name = 'Trebuchet MS'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Properties.Alignment.Vert = taVCenter
        Transparent = True
        AnchorY = 20
      end
      object txtBarCode: TcxTextEdit
        AlignWithMargins = True
        Left = 168
        Top = 5
        Align = alLeft
        ParentFont = False
        Style.Color = clInfoBk
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Trebuchet MS'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 1
        OnKeyDown = txtBarCodeKeyDown
        Width = 386
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 505
    Width = 858
    ExplicitTop = 505
    ExplicitWidth = 858
    inherited pnlFooter: TPanel
      Width = 858
      ExplicitWidth = 858
      inherited btnClose: TcxButton
        Left = 781
        Action = actCancel
        ExplicitLeft = 781
      end
      inherited btnSave: TcxButton
        Left = 688
        Action = actSave
        ExplicitLeft = 688
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 611
        Action = actPrint
        ExplicitLeft = 611
      end
    end
    inherited pnlSortCut: TPanel
      Width = 858
      ExplicitWidth = 858
      inherited lbCTRLEnter: TLabel
        Left = 683
        Height = 15
        ExplicitLeft = 683
      end
      inherited lbEscape: TLabel
        Left = 774
        Height = 15
        ExplicitLeft = 774
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 607
        Height = 15
        ExplicitLeft = 607
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 656
    Top = 344
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
  object pmItem: TPopupMenu
    Left = 416
    Top = 384
    object LoadAllItemFromPO1: TMenuItem
      Caption = 'Load All Item From PO'
      OnClick = LoadAllItemFromPO1Click
    end
    object ClearAllItems1: TMenuItem
      Caption = 'Clear All Items'
      OnClick = ClearAllItems1Click
    end
  end
end
