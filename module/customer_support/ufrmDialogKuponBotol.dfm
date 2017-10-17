inherited frmDialogKuponBotol: TfrmDialogKuponBotol
  Caption = 'Voucher Kupon Botol'
  ClientHeight = 375
  ClientWidth = 634
  ExplicitWidth = 650
  ExplicitHeight = 414
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 634
    Height = 170
    Align = alTop
    ExplicitWidth = 634
    ExplicitHeight = 170
    object cxLabel1: TcxLabel
      Tag = 2
      Left = 8
      Top = 6
      Caption = 'Date'
      Transparent = True
    end
    object dtpTanggal: TcxDateEdit
      Left = 88
      Top = 5
      Properties.ReadOnly = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.Color = clInfoBk
      TabOrder = 1
      Width = 89
    end
    object cxLabel2: TcxLabel
      Tag = 2
      Left = 8
      Top = 32
      Caption = 'Voucher No'
      Transparent = True
    end
    object edtKodeMember: TcxButtonEdit
      Left = 88
      Top = 57
      Hint = '[Input Card No.]'
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = edtKodeMemberPropertiesButtonClick
      TabOrder = 3
      Text = '[Input Card No.]'
      Width = 137
    end
    object cxLabel3: TcxLabel
      Tag = 2
      Left = 8
      Top = 58
      Caption = 'Member Code'
      Transparent = True
    end
    object edTransactionNo: TcxTextEdit
      Left = 88
      Top = 31
      Properties.ReadOnly = False
      Style.Color = clInfoBk
      TabOrder = 5
      Width = 137
    end
    object cxLabel4: TcxLabel
      Tag = 2
      Left = 8
      Top = 84
      Caption = 'member name'
      Transparent = True
    end
    object edtMemberName: TcxTextEdit
      Left = 88
      Top = 83
      Properties.ReadOnly = True
      Style.Color = clInfoBk
      TabOrder = 7
      Width = 265
    end
    object cxLabel7: TcxLabel
      Tag = 2
      Left = 8
      Top = 110
      Caption = 'Description'
      Transparent = True
    end
    object edtKeterangan: TcxTextEdit
      Left = 88
      Top = 109
      Properties.ReadOnly = False
      Style.Color = clWindow
      TabOrder = 9
      Width = 265
    end
    object cxLabel8: TcxLabel
      Tag = 2
      Left = 8
      Top = 136
      Caption = 'Total Price'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Trebuchet MS'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Transparent = True
    end
    object curredtTotalPrice: TcxCurrencyEdit
      Left = 88
      Top = 135
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.00;(,0.00)'
      Properties.ReadOnly = True
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Trebuchet MS'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 11
      Width = 137
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 319
    Width = 634
    ExplicitTop = 319
    ExplicitWidth = 634
    inherited pnlFooter: TPanel
      Width = 634
      ExplicitWidth = 634
      inherited btnClose: TcxButton
        Left = 557
        Action = actCancel
        ExplicitLeft = 557
      end
      inherited btnSave: TcxButton
        Left = 464
        Action = actSave
        ExplicitLeft = 464
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 387
        Action = actPrint
        ExplicitLeft = 387
      end
    end
    inherited pnlSortCut: TPanel
      Width = 634
      ExplicitWidth = 634
      inherited lbCTRLEnter: TLabel
        Left = 459
        Height = 15
        ExplicitLeft = 459
      end
      inherited lbEscape: TLabel
        Left = 550
        Height = 15
        ExplicitLeft = 550
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 383
        Height = 15
        ExplicitLeft = 383
      end
    end
  end
  object cxGroupBox5: TcxGroupBox [2]
    Left = 0
    Top = 170
    Align = alTop
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    Style.Edges = [bRight, bBottom]
    TabOrder = 2
    Height = 27
    Width = 634
    object Label29: TLabel
      AlignWithMargins = True
      Left = 380
      Top = 6
      Width = 249
      Height = 18
      Margins.Top = 4
      Margins.Bottom = 1
      Align = alRight
      Caption = 'ALT-T [Tambah]  | ALT-U [Update]  |  ALT-D [Delete]'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ExplicitHeight = 16
    end
    object btnDeletePrice: TcxButton
      AlignWithMargins = True
      Left = 85
      Top = 2
      Width = 80
      Height = 23
      Cursor = crHandPoint
      Margins.Left = 0
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alLeft
      Caption = '&Delete'
      OptionsImage.ImageIndex = 8
      OptionsImage.Images = DMClient.imgListButton
      TabOrder = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      OnClick = btnDeletePriceClick
    end
    object btnAddPrice: TcxButton
      AlignWithMargins = True
      Left = 2
      Top = 2
      Width = 80
      Height = 23
      Cursor = crHandPoint
      Margins.Left = 0
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alLeft
      Caption = '&Tambah'
      LookAndFeel.Kind = lfUltraFlat
      OptionsImage.ImageIndex = 0
      OptionsImage.Images = DMClient.imgListButton
      TabOrder = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      OnClick = btnAddPriceClick
    end
  end
  object cxGrid: TcxGrid [3]
    Left = 0
    Top = 197
    Width = 634
    Height = 122
    Align = alClient
    TabOrder = 3
    LockedStateImageOptions.Text = 'Mohon ditunggu...'
    LookAndFeel.NativeStyle = False
    object cxGridView: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      FindPanel.DisplayMode = fpdmManual
      FindPanel.InfoText = 'ketik teks yang dicari...'
      DataController.Filter.Options = [fcoCaseInsensitive]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.InfoText = 
        'Klik untuk memfilter data / Atau gunakan CTRL-F untuk panel filt' +
        'er'
      FilterRow.Visible = True
      FilterRow.ApplyChanges = fracImmediately
      NewItemRow.InfoText = 'Baris baru'
      OptionsData.Editing = False
      OptionsView.NoDataToDisplayInfoText = '<Data kosong>'
      OptionsView.GroupByBox = False
      Styles.ContentEven = DMClient.cxStyleGridEven
      Styles.Header = DMClient.cxStyleGridHeader
    end
    object cxGridViewDetail: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = ',0.00;(,0.00)'
          Kind = skSum
          Position = spFooter
          Column = colTotal
        end
        item
          Format = ',0.00;(,0.00)'
          Kind = skSum
          Column = colTotal
        end
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
          Position = spFooter
          Column = colQty
        end
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
          Column = colQty
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.00;(,0.00)'
          Kind = skSum
          Column = colTotal
        end
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
          Column = colQty
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object colPLU: TcxGridColumn
        Caption = 'PLU'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Properties.DropDownAutoSize = True
        Properties.DropDownSizeable = True
        Properties.ImmediatePost = True
        Properties.OnValidate = colPLUPropertiesValidate
        HeaderAlignmentHorz = taCenter
        Styles.Header = DMClient.cxStyleGridHeader
        Width = 37
      end
      object colProductName: TcxGridColumn
        Caption = 'PRODUCT NAME'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Styles.Content = DMClient.cxStyleInfoBK
        Styles.Header = DMClient.cxStyleGridHeader
        Width = 98
      end
      object colUoM: TcxGridColumn
        Caption = 'UOM'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Properties.ImmediatePost = True
        Properties.OnInitPopup = colUoMPropertiesInitPopup
        HeaderAlignmentHorz = taCenter
        Styles.Content = DMClient.cxStyleInfoBK
        Styles.Header = DMClient.cxStyleGridHeader
        Width = 40
      end
      object colQty: TcxGridColumn
        Caption = 'QTY'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        Properties.ImmediatePost = True
        Properties.ReadOnly = False
        Properties.SpinButtons.Visible = False
        Properties.OnValidate = colQtyPropertiesValidate
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Styles.Header = DMClient.cxStyleGridHeader
        Width = 40
      end
      object colSellPrice: TcxGridColumn
        Caption = 'SELL PRICE'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        Properties.ImmediatePost = True
        Properties.ReadOnly = True
        Properties.SpinButtons.Visible = False
        HeaderAlignmentHorz = taCenter
        Styles.Content = DMClient.cxStyleInfoBK
        Styles.Header = DMClient.cxStyleGridHeader
        Width = 73
      end
      object colDisc: TcxGridColumn
        Caption = 'DISC'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        Properties.ImmediatePost = True
        Properties.ReadOnly = True
        Properties.SpinButtons.Visible = False
        HeaderAlignmentHorz = taCenter
        Styles.Content = DMClient.cxStyleInfoBK
        Styles.Header = DMClient.cxStyleGridHeader
        Width = 40
      end
      object colSellPriceDisc: TcxGridColumn
        Caption = 'SELL PRICE DISC'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        Properties.ImmediatePost = True
        Properties.ReadOnly = True
        Properties.SpinButtons.Visible = False
        HeaderAlignmentHorz = taCenter
        Styles.Content = DMClient.cxStyleInfoBK
        Styles.Header = DMClient.cxStyleGridHeader
        Width = 99
      end
      object colTotal: TcxGridColumn
        Caption = 'TOTAL'
        PropertiesClassName = 'TcxSpinEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        Properties.ImmediatePost = True
        Properties.ReadOnly = True
        Properties.SpinButtons.Visible = False
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Styles.Content = DMClient.cxStyleInfoBK
        Styles.Header = DMClient.cxStyleGridHeader
        Width = 51
      end
    end
    object cxlvMaster: TcxGridLevel
      GridView = cxGridViewDetail
    end
  end
  inherited actlstMasterDialog: TActionList
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
end
