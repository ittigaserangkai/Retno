inherited frmDialogMasterAgreement: TfrmDialogMasterAgreement
  Left = 220
  Top = 193
  Caption = 'Dialog Master Agreement'
  ClientHeight = 500
  ClientWidth = 745
  Constraints.MinHeight = 32
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 761
  ExplicitHeight = 539
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 745
    Height = 444
    ExplicitWidth = 914
    ExplicitHeight = 444
    object pnl1: TPanel
      Left = 2
      Top = 2
      Width = 741
      Height = 231
      Align = alTop
      ParentColor = True
      TabOrder = 0
      object lblComboGrid: TLabel
        Left = 24
        Top = 7
        Width = 76
        Height = 16
        Caption = 'Customer Code'
      end
      object lbl9: TLabel
        Left = 24
        Top = 35
        Width = 69
        Height = 16
        Caption = 'No Agreement'
      end
      object lbl3: TLabel
        Left = 24
        Top = 62
        Width = 73
        Height = 16
        Caption = 'Effective Date'
      end
      object lbl4: TLabel
        Left = 208
        Top = 40
        Width = 4
        Height = 16
        Caption = '-'
      end
      object lbl10: TLabel
        Left = 24
        Top = 121
        Width = 64
        Height = 16
        Caption = 'Term Periode'
      end
      object lbl7: TLabel
        Left = 279
        Top = 123
        Width = 46
        Height = 16
        Caption = 'Invoice #'
      end
      object lbl8: TLabel
        Left = 24
        Top = 148
        Width = 45
        Height = 16
        Caption = 'Tax Code'
      end
      object lbl1: TLabel
        Left = 24
        Top = 176
        Width = 58
        Height = 16
        Caption = 'Description'
      end
      object lbl11: TLabel
        Left = 216
        Top = 148
        Width = 27
        Height = 16
        Caption = 'Pajak'
      end
      object lbl12: TLabel
        Left = 378
        Top = 148
        Width = 34
        Height = 16
        Caption = 'PPH 23'
      end
      object lbl6: TLabel
        Left = 159
        Top = 123
        Width = 26
        Height = 16
        Caption = 'bulan'
      end
      object lbl13: TLabel
        Left = 188
        Top = 62
        Width = 4
        Height = 16
        Caption = '-'
      end
      object lblTipeBayar: TLabel
        Left = 241
        Top = 90
        Width = 84
        Height = 16
        Caption = 'Tipe Pembayaran'
      end
      object Label1: TLabel
        Left = 23
        Top = 89
        Width = 66
        Height = 16
        Caption = 'Invoice Start'
      end
      object lbl14: TLabel
        Left = 24
        Top = 205
        Width = 24
        Height = 16
        Caption = 'Total'
      end
      object edtCustName: TEdit
        Left = 196
        Top = 5
        Width = 300
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
      end
      object edtNoAgreement: TEdit
        Left = 104
        Top = 33
        Width = 173
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
      end
      object dtStart: TcxDateEdit
        Left = 104
        Top = 60
        TabOrder = 3
        OnExit = dtStartExit
        Width = 80
      end
      object dtEnd: TcxDateEdit
        Left = 196
        Top = 60
        TabOrder = 5
        Width = 80
      end
      object edtDesc: TEdit
        Left = 103
        Top = 174
        Width = 393
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 2
      end
      object cbbPKP: TComboBox
        Left = 103
        Top = 145
        Width = 80
        Height = 24
        BevelKind = bkSoft
        Style = csDropDownList
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 4
        OnChange = cbbPKPChange
        Items.Strings = (
          'BKP'
          'JKP')
      end
      object cbbPPH: TComboBox
        Left = 418
        Top = 145
        Width = 80
        Height = 24
        BevelKind = bkSoft
        Style = csDropDownList
        Ctl3D = False
        ItemIndex = 0
        ParentCtl3D = False
        TabOrder = 7
        Text = 'NON PPH'
        Items.Strings = (
          'NON PPH'
          'PPH')
      end
      object intedtInvoice: TcxCurrencyEdit
        Left = 336
        Top = 117
        EditValue = 1.000000000000000000
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 8
        OnExit = intedtInvoiceExit
        Width = 49
      end
      object intedtPeriode: TcxCurrencyEdit
        Left = 104
        Top = 117
        EditValue = 1.000000000000000000
        Properties.DisplayFormat = ',0.00;(,0.00)'
        TabOrder = 6
        OnKeyUp = intedtPeriodeKeyUp
        Width = 49
      end
      object cbCustCode: TcxLookupComboBox
        Left = 104
        Top = 3
        Properties.ListColumns = <>
        TabOrder = 9
        Width = 89
      end
      object cbbTipeBayar: TComboBox
        Left = 336
        Top = 86
        Width = 162
        Height = 24
        BevelKind = bkSoft
        Style = csDropDownList
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 10
        Items.Strings = (
          'Cash'
          'BG'
          'Cheque')
      end
      object cbPajak: TComboBox
        Left = 255
        Top = 145
        Width = 80
        Height = 24
        BevelKind = bkSoft
        Style = csDropDownList
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 11
        OnChange = cbbPKPChange
        Items.Strings = (
          'PPN'
          'PPh'
          'PPNBm')
      end
      object cxDateEdit1: TcxDateEdit
        Left = 103
        Top = 87
        TabOrder = 12
        OnExit = dtStartExit
        Width = 80
      end
      object curredtTotal: TcxCurrencyEdit
        Left = 103
        Top = 202
        TabOrder = 13
        Width = 137
      end
    end
    object cxGrid: TcxGrid
      Left = 2
      Top = 233
      Width = 741
      Height = 209
      Align = alClient
      TabOrder = 1
      LockedStateImageOptions.Text = 'Mohon ditunggu...'
      LookAndFeel.NativeStyle = False
      RootLevelOptions.DetailTabsPosition = dtpTop
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 902
      ExplicitHeight = 144
      object grdGridDetail: TcxGridDBTableView
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
        object cxcolGridViewColumn2: TcxGridDBColumn
          Caption = 'Product Code'
          Width = 109
        end
        object cxcolGridViewColumn3: TcxGridDBColumn
          Caption = 'Product Description'
          Width = 199
        end
        object cxcolGridViewColumn4: TcxGridDBColumn
          Caption = 'Qty Order'
          Width = 85
        end
        object cxcolDetilUnitPrice: TcxGridDBColumn
          Caption = 'Unit Price'
          Width = 79
        end
        object cxcolDetilSubTotal: TcxGridDBColumn
          Caption = 'Sub Total'
          Width = 105
        end
        object cxcolGridViewColumn5: TcxGridDBColumn
          Caption = 'Total Amount'
          Width = 110
        end
      end
      object grdGridInvoice: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        FindPanel.DisplayMode = fpdmManual
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
        object grdGridInvoiceColumn1: TcxGridDBColumn
          Caption = 'No.'
        end
        object grdGridInvoiceColumn2: TcxGridDBColumn
          Caption = 'Invoice Date'
          Width = 97
        end
        object grdGridInvoiceColumn3: TcxGridDBColumn
          Caption = 'Invoice Term(s)'
          Width = 110
        end
        object grdGridInvoiceColumn4: TcxGridDBColumn
          Caption = 'Invoice No'
          Width = 116
        end
        object grdGridInvoiceColumn5: TcxGridDBColumn
          Caption = 'Invoice DueDate'
          Width = 102
        end
        object grdGridInvoiceColumn6: TcxGridDBColumn
          Caption = 'Status'
          Width = 93
        end
        object grdGridInvoiceColumn7: TcxGridDBColumn
          Caption = 'Total Invoice'
          Width = 113
        end
      end
      object grdlvlDetail: TcxGridLevel
        Caption = 'F2 - Detil Agreement'
        GridView = grdGridDetail
      end
      object grdlvlInvoice: TcxGridLevel
        Caption = 'F3 - Invoice Schedule'
        GridView = grdGridInvoice
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 444
    Width = 745
    ExplicitTop = 444
    ExplicitWidth = 914
    inherited pnlFooter: TPanel
      Width = 745
      ExplicitWidth = 914
      inherited btnClose: TcxButton
        Left = 668
        Action = actCancel
        ExplicitLeft = 837
      end
      inherited btnSave: TcxButton
        Left = 575
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 744
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 498
        Action = actPrint
        ExplicitLeft = 667
      end
    end
    inherited pnlSortCut: TPanel
      Width = 745
      ExplicitWidth = 914
      inherited lbCTRLEnter: TLabel
        Left = 570
        Height = 15
        ExplicitLeft = 739
      end
      inherited lbEscape: TLabel
        Left = 661
        Height = 15
        ExplicitLeft = 830
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 494
        Height = 15
        ExplicitLeft = 663
      end
    end
  end
end
