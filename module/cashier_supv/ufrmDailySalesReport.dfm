inherited frmDailySalesReport: TfrmDailySalesReport
  Caption = 'Daily Sales Report'
  ClientHeight = 448
  ClientWidth = 644
  ExplicitWidth = 660
  ExplicitHeight = 487
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 644
    Height = 392
    ExplicitWidth = 644
    ExplicitHeight = 392
    object Panel2: TPanel
      Left = 3
      Top = 3
      Width = 638
      Height = 38
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
        TabOrder = 1
        Width = 89
      end
    end
    object cxGrid: TcxGrid
      AlignWithMargins = True
      Left = 6
      Top = 44
      Width = 632
      Height = 342
      Align = alClient
      TabOrder = 1
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
      object cxlvMaster: TcxGridLevel
        GridView = cxGridView
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 644
    ExplicitWidth = 644
    inherited lblHeader: TLabel
      Width = 98
      Caption = 'Daily Sales Report'
      ExplicitWidth = 98
    end
  end
  inherited pnlFooter: TPanel
    Top = 413
    Width = 644
    ExplicitTop = 413
    ExplicitWidth = 644
    inherited btnClose: TcxButton
      Left = 567
      ExplicitLeft = 567
    end
  end
  inherited pnlShortCut: TPanel
    Top = 392
    Width = 644
    ExplicitTop = 392
    ExplicitWidth = 644
    inherited lbEscape: TLabel
      Left = 570
      Height = 17
      ExplicitLeft = 570
    end
  end
  inherited actReport: TActionList
    Left = 560
    Top = 64
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
  end
end
