inherited frmInventoryMovement: TfrmInventoryMovement
  Caption = 'Inventory Movement'
  ClientHeight = 448
  ClientWidth = 644
  ExplicitWidth = 660
  ExplicitHeight = 487
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 644
    Height = 362
    object Panel2: TPanel
      Left = 3
      Top = 3
      Width = 638
      Height = 110
      Align = alTop
      TabOrder = 0
      object Label2: TLabel
        Left = 32
        Top = 7
        Width = 37
        Height = 16
        Alignment = taRightJustify
        Caption = 'Periode'
      end
      object Label3: TLabel
        Left = 167
        Top = 7
        Width = 17
        Height = 16
        Alignment = taRightJustify
        Caption = 's/d'
      end
      object dtStart: TcxDateEdit
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
        Top = 76
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
        Top = 80
        Width = 56
        Height = 17
        Caption = 'Gudang'
        TabOrder = 2
        OnClick = ckGudangClick
      end
      object cxLookupSupplier: TcxExtLookupComboBox
        Tag = 1
        Left = 75
        Top = 52
        Hint = 'Klik F5 untuk membuat Master Baru'
        ParentShowHint = False
        Properties.CharCase = ecUpperCase
        Properties.ImmediatePost = True
        ShowHint = True
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 3
        Width = 323
      end
      object cxLookupGroup: TcxExtLookupComboBox
        Tag = 1
        Left = 75
        Top = 28
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
        Width = 204
      end
      object ckSupplier: TCheckBox
        Left = 17
        Top = 56
        Width = 56
        Height = 17
        Caption = 'Supplier'
        TabOrder = 5
        OnClick = ckSupplierClick
      end
      object CheckBox2: TCheckBox
        Left = 285
        Top = 31
        Width = 104
        Height = 17
        Caption = 'Tampilkan Saldo 0'
        TabOrder = 6
      end
      object ckGroup: TCheckBox
        Left = 17
        Top = 31
        Width = 50
        Height = 17
        Caption = 'Group'
        TabOrder = 7
        OnClick = ckGroupClick
      end
      object dtEnd: TcxDateEdit
        AlignWithMargins = True
        Left = 190
        Top = 4
        Margins.Top = 4
        Margins.Bottom = 4
        EditValue = 0d
        Properties.DateButtons = [btnClear, btnToday]
        Properties.SaveTime = False
        Properties.ShowTime = False
        TabOrder = 8
        Width = 89
      end
    end
    object cxGrid: TcxGrid
      AlignWithMargins = True
      Left = 6
      Top = 116
      Width = 632
      Height = 240
      Align = alClient
      TabOrder = 1
      LockedStateImageOptions.Text = 'Mohon ditunggu...'
      LookAndFeel.NativeStyle = False
      ExplicitTop = 92
      ExplicitWidth = 686
      ExplicitHeight = 245
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
    Width = 644
    inherited lblHeader: TLabel
      Width = 114
      Height = 18
      Caption = 'Inventory Movement'
      ExplicitWidth = 114
    end
  end
  inherited pnlFooter: TPanel
    Top = 413
    Width = 644
    inherited btnClose: TcxButton
      Left = 567
    end
  end
  inherited pnlShortCut: TPanel
    Top = 392
    Width = 644
    inherited lbEscape: TLabel
      Left = 570
      Height = 17
    end
  end
  inherited actReport: TActionList
    Left = 560
    Top = 64
    inherited actRefresh: TAction
      OnExecute = actRefreshExecute
    end
    inherited actExport: TAction
      OnExecute = actExportExecute
    end
  end
end
