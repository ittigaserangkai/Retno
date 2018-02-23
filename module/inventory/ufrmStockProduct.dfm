inherited frmStockProduct: TfrmStockProduct
  Caption = 'Stock Barang'
  ClientHeight = 429
  ClientWidth = 698
  ExplicitWidth = 714
  ExplicitHeight = 468
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 698
    Height = 373
    ExplicitWidth = 698
    ExplicitHeight = 373
    object Panel2: TPanel
      Left = 3
      Top = 3
      Width = 692
      Height = 62
      Align = alTop
      TabOrder = 0
      object Label2: TLabel
        Left = 24
        Top = 7
        Width = 47
        Height = 16
        Alignment = taRightJustify
        Caption = 'Stock Per'
      end
      object dtEnd: TcxDateEdit
        AlignWithMargins = True
        Left = 75
        Top = 4
        Margins.Top = 4
        Margins.Bottom = 4
        EditValue = 0d
        Properties.DateButtons = [btnClear, btnToday]
        Properties.SaveTime = False
        Properties.ShowTime = False
        TabOrder = 0
        Width = 89
      end
      object cxLookupGudang: TcxExtLookupComboBox
        Tag = 1
        Left = 75
        Top = 29
        Hint = 'Klik F5 untuk membuat Master Baru'
        ParentShowHint = False
        Properties.CharCase = ecUpperCase
        Properties.ImmediatePost = True
        ShowHint = True
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        Width = 323
      end
      object ckGudang: TCheckBox
        Left = 17
        Top = 33
        Width = 56
        Height = 17
        Caption = 'Gudang'
        TabOrder = 2
        OnClick = ckGudangClick
      end
      object cxLookupSupplier: TcxExtLookupComboBox
        Tag = 1
        Left = 491
        Top = 4
        Hint = 'Klik F5 untuk membuat Master Baru'
        TabStop = False
        ParentShowHint = False
        Properties.CharCase = ecUpperCase
        Properties.ImmediatePost = True
        ShowHint = True
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 3
        Visible = False
        Width = 323
      end
      object cxLookupGroup: TcxExtLookupComboBox
        Tag = 1
        Left = 227
        Top = 5
        Hint = 'Klik F5 untuk membuat Master Baru'
        ParentShowHint = False
        Properties.CharCase = ecUpperCase
        Properties.ImmediatePost = True
        ShowHint = True
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 4
        Width = 171
      end
      object ckSupplier: TCheckBox
        Left = 433
        Top = 8
        Width = 56
        Height = 17
        TabStop = False
        Caption = 'Supplier'
        TabOrder = 5
        Visible = False
        OnClick = ckSupplierClick
      end
      object chkSaldoNol: TCheckBox
        Left = 425
        Top = 33
        Width = 104
        Height = 17
        Caption = 'Tampilkan Saldo 0'
        TabOrder = 6
      end
      object ckGroup: TCheckBox
        Left = 176
        Top = 8
        Width = 50
        Height = 17
        Caption = 'Group'
        TabOrder = 7
        OnClick = ckGroupClick
      end
    end
    object cxGrid: TcxGrid
      AlignWithMargins = True
      Left = 6
      Top = 68
      Width = 686
      Height = 299
      Align = alClient
      TabOrder = 1
      LockedStateImageOptions.Text = 'Mohon ditunggu...'
      LookAndFeel.NativeStyle = False
      ExplicitTop = 92
      ExplicitHeight = 275
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
      object cxlvMaster: TcxGridLevel
        GridView = cxGridView
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 698
    ExplicitWidth = 698
    inherited lblHeader: TLabel
      Width = 85
      Caption = 'STOCK BARANG'
      ExplicitWidth = 85
    end
  end
  inherited pnlFooter: TPanel
    Top = 394
    Width = 698
    ExplicitTop = 394
    ExplicitWidth = 698
    inherited btnClose: TcxButton
      Left = 621
      ExplicitLeft = 621
    end
  end
  inherited pnlShortCut: TPanel
    Top = 373
    Width = 698
    ExplicitTop = 373
    ExplicitWidth = 698
    inherited lbEscape: TLabel
      Left = 624
      Height = 17
      ExplicitLeft = 624
    end
  end
  inherited actReport: TActionList
    Left = 632
    Top = 64
    inherited actRefresh: TAction
      OnExecute = actRefreshExecute
    end
    inherited actExport: TAction
      OnExecute = actExportExecute
    end
  end
end
