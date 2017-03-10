inherited frmMasterDialogBrowse: TfrmMasterDialogBrowse
  Caption = 'frmMasterDialogBrowse'
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    object cxGrid: TcxGrid
      Left = 2
      Top = 2
      Width = 562
      Height = 228
      Align = alClient
      TabOrder = 0
      LockedStateImageOptions.Text = 'Mohon ditunggu...'
      ExplicitLeft = 11
      ExplicitTop = 11
      ExplicitWidth = 518
      ExplicitHeight = 227
      object cxGridView: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        FindPanel.InfoText = 'ketik teks yang dicari...'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        FilterRow.InfoText = 'klik untuk memfilter data'
        FilterRow.Visible = True
        NewItemRow.InfoText = 'Baris baru'
        OptionsView.NoDataToDisplayInfoText = '<Data kosong>'
        OptionsView.GroupByBox = False
      end
      object cxlvMaster: TcxGridLevel
        GridView = cxGridView
      end
    end
  end
end
