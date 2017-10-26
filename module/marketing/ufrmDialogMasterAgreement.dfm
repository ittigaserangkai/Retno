inherited frmDialogMasterAgreement: TfrmDialogMasterAgreement
  Left = 220
  Top = 193
  Caption = 'Dialog Master Agreement'
  ClientHeight = 500
  ClientWidth = 914
  Constraints.MinHeight = 32
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 930
  ExplicitHeight = 539
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 914
    Height = 444
    BorderWidth = 10
    ExplicitWidth = 914
    ExplicitHeight = 444
    object pnl1: TPanel
      Left = 12
      Top = 12
      Width = 890
      Height = 229
      Align = alTop
      ParentColor = True
      TabOrder = 0
      object lblInput: TLabel
        Left = 24
        Top = 33
        Width = 67
        Height = 16
        Caption = 'Supplier Code'
      end
      object lblComboGrid: TLabel
        Left = 24
        Top = 7
        Width = 76
        Height = 16
        Caption = 'Customer Code'
      end
      object lbl9: TLabel
        Left = 24
        Top = 62
        Width = 69
        Height = 16
        Caption = 'No Agreement'
      end
      object lbl3: TLabel
        Left = 24
        Top = 89
        Width = 73
        Height = 16
        Caption = 'Effective Date'
      end
      object lbl4: TLabel
        Left = 208
        Top = 67
        Width = 4
        Height = 16
        Caption = '-'
      end
      object lbl10: TLabel
        Left = 24
        Top = 148
        Width = 64
        Height = 16
        Caption = 'Term Periode'
      end
      object lbl7: TLabel
        Left = 279
        Top = 150
        Width = 46
        Height = 16
        Caption = 'Invoice #'
      end
      object lbl8: TLabel
        Left = 24
        Top = 175
        Width = 45
        Height = 16
        Caption = 'Tax Code'
      end
      object lbl1: TLabel
        Left = 24
        Top = 203
        Width = 58
        Height = 16
        Caption = 'Description'
      end
      object lbl11: TLabel
        Left = 216
        Top = 175
        Width = 27
        Height = 16
        Caption = 'Pajak'
      end
      object lbl12: TLabel
        Left = 378
        Top = 175
        Width = 34
        Height = 16
        Caption = 'PPH 23'
      end
      object lbl6: TLabel
        Left = 165
        Top = 150
        Width = 35
        Height = 16
        Caption = '/ bulan'
      end
      object lbl13: TLabel
        Left = 188
        Top = 89
        Width = 4
        Height = 16
        Caption = '-'
      end
      object lblTipeBayar: TLabel
        Left = 313
        Top = 116
        Width = 84
        Height = 16
        Caption = 'Tipe Pembayaran'
      end
      object Label1: TLabel
        Left = 23
        Top = 116
        Width = 66
        Height = 16
        Caption = 'Invoice Start'
      end
      object edtSupName: TEdit
        Left = 196
        Top = 32
        Width = 300
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
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
        Top = 60
        Width = 173
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 2
      end
      object dtStart: TcxDateEdit
        Left = 104
        Top = 87
        TabOrder = 4
        OnExit = dtStartExit
        Width = 80
      end
      object dtEnd: TcxDateEdit
        Left = 196
        Top = 87
        TabOrder = 6
        Width = 80
      end
      object edtDesc: TEdit
        Left = 103
        Top = 201
        Width = 393
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 3
      end
      object cbbPKP: TComboBox
        Left = 103
        Top = 172
        Width = 80
        Height = 24
        BevelKind = bkSoft
        Style = csDropDownList
        Ctl3D = False
        ItemIndex = 1
        ParentCtl3D = False
        TabOrder = 5
        Text = 'PKP'
        OnChange = cbbPKPChange
        Items.Strings = (
          'NON PKP'
          'PKP')
      end
      object cbbPPH: TComboBox
        Left = 418
        Top = 172
        Width = 80
        Height = 24
        BevelKind = bkSoft
        Style = csDropDownList
        Ctl3D = False
        ItemIndex = 0
        ParentCtl3D = False
        TabOrder = 8
        Text = 'NON PPH'
        Items.Strings = (
          'NON PPH'
          'PPH')
      end
      object intedtInvoice: TcxCurrencyEdit
        Left = 336
        Top = 144
        EditValue = 1.000000000000000000
        TabOrder = 9
        OnExit = intedtInvoiceExit
        Width = 49
      end
      object intedtPeriode: TcxCurrencyEdit
        Left = 104
        Top = 144
        EditValue = 1.000000000000000000
        TabOrder = 7
        OnKeyUp = intedtPeriodeKeyUp
        Width = 49
      end
      object cbCustCode: TcxLookupComboBox
        Left = 104
        Top = 3
        Properties.ListColumns = <>
        TabOrder = 10
        Width = 89
      end
      object cbSupCode: TcxLookupComboBox
        Left = 104
        Top = 31
        Properties.ListColumns = <>
        TabOrder = 11
        Width = 89
      end
      object cbbTipeBayar: TComboBox
        Left = 408
        Top = 113
        Width = 90
        Height = 24
        BevelKind = bkSoft
        Style = csDropDownList
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 12
        Items.Strings = (
          'Cash'
          'BG'
          'Cheque')
      end
      object cbPajak: TComboBox
        Left = 255
        Top = 172
        Width = 80
        Height = 24
        BevelKind = bkSoft
        Style = csDropDownList
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 13
        OnChange = cbbPKPChange
        Items.Strings = (
          'PPN'
          'PPh'
          'PPNBm')
      end
      object cxDateEdit1: TcxDateEdit
        Left = 103
        Top = 114
        TabOrder = 14
        OnExit = dtStartExit
        Width = 80
      end
    end
    object pnl2: TPanel
      Left = 12
      Top = 374
      Width = 890
      Height = 58
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 1
      object lbl5: TLabel
        Left = 60
        Top = 8
        Width = 49
        Height = 16
        Caption = 'Unit Price'
      end
      object lbl14: TLabel
        Left = 517
        Top = 8
        Width = 24
        Height = 16
        Caption = 'Total'
      end
      object lblNewRow: TLabel
        Left = 256
        Top = 12
        Width = 92
        Height = 16
        Cursor = crHandPoint
        Caption = 'New Row (Ctrl + T)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = lblNewRowClick
      end
      object lblRemoveRow: TLabel
        Left = 364
        Top = 12
        Width = 109
        Height = 16
        Cursor = crHandPoint
        Caption = 'Remove Row (Ctrl + R)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = lblRemoveRowClick
      end
      object lblSearchProduct: TLabel
        Left = 302
        Top = 31
        Width = 133
        Height = 16
        Cursor = crHandPoint
        Caption = 'F5 to Search Product Code'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = lblSearchProductClick
      end
      object edtUnitPrice: TEdit
        Left = 122
        Top = 6
        Width = 79
        Height = 22
        Ctl3D = False
        MaxLength = 4
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        Text = '0'
      end
      object curredtTotal: TcxCurrencyEdit
        Left = 552
        Top = 8
        TabOrder = 1
        Width = 137
      end
    end
    object pcDialogAgreement: TcxPageControl
      Left = 12
      Top = 241
      Width = 890
      Height = 133
      Align = alClient
      TabOrder = 2
      Properties.ActivePage = tsKontrak
      Properties.CustomButtons.Buttons = <>
      ExplicitTop = 219
      ExplicitHeight = 155
      ClientRectBottom = 129
      ClientRectLeft = 4
      ClientRectRight = 886
      ClientRectTop = 27
      object tsKontrak: TcxTabSheet
        Caption = 'F2 - Detil Agreement'
        ImageIndex = 0
        ExplicitHeight = 124
        object cxGrid: TcxGrid
          Left = 0
          Top = 0
          Width = 882
          Height = 102
          Align = alClient
          TabOrder = 0
          LockedStateImageOptions.Text = 'Mohon ditunggu...'
          LookAndFeel.NativeStyle = False
          ExplicitHeight = 124
          object grdGridView: TcxGridDBTableView
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
          object grdlvlMaster: TcxGridLevel
            GridView = grdGridView
          end
        end
      end
      object tsJadwalInvoice: TcxTabSheet
        Caption = 'F3 - Invoice Schedule'
        ImageIndex = 1
        ExplicitHeight = 124
        object cxgrd1: TcxGrid
          Left = 0
          Top = 0
          Width = 882
          Height = 102
          Align = alClient
          TabOrder = 0
          LockedStateImageOptions.Text = 'Mohon ditunggu...'
          LookAndFeel.NativeStyle = False
          ExplicitHeight = 124
          object grdInvoice: TcxGridDBTableView
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
            object cxcol1: TcxGridDBColumn
              Caption = 'No.'
            end
            object cxcol2: TcxGridDBColumn
              Caption = 'Invoice Date'
              Width = 75
            end
            object cxcol3: TcxGridDBColumn
              Caption = 'Invoice Term(s)'
              Width = 96
            end
            object cxcol4: TcxGridDBColumn
              Caption = 'Invoice No'
              Width = 81
            end
            object cxcol5: TcxGridDBColumn
              Caption = 'Invoice DueDate'
              Width = 106
            end
            object cxcol6: TcxGridDBColumn
              Caption = 'Status'
            end
            object cxcol7: TcxGridDBColumn
              Caption = 'Total Invoice'
              Width = 88
            end
          end
          object grdlvlMaster1: TcxGridLevel
            GridView = grdInvoice
          end
        end
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 444
    Width = 914
    ExplicitTop = 444
    ExplicitWidth = 914
    inherited pnlFooter: TPanel
      Width = 914
      ExplicitWidth = 914
      inherited btnClose: TcxButton
        Left = 837
        Action = actCancel
        ExplicitLeft = 837
      end
      inherited btnSave: TcxButton
        Left = 744
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 744
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 667
        Action = actPrint
        ExplicitLeft = 667
      end
    end
    inherited pnlSortCut: TPanel
      Width = 914
      ExplicitWidth = 914
      inherited lbCTRLEnter: TLabel
        Left = 739
        Height = 15
        ExplicitLeft = 739
      end
      inherited lbEscape: TLabel
        Left = 830
        Height = 15
        ExplicitLeft = 830
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 663
        Height = 15
        ExplicitLeft = 663
      end
    end
  end
end
