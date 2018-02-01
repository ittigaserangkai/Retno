inherited frmMasterDialogBrowse: TfrmMasterDialogBrowse
  Caption = 'frmMasterDialogBrowse'
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    object cxGrid: TcxGrid
      Left = 2
      Top = 2
      Width = 550
      Height = 272
      Align = alClient
      TabOrder = 0
      LockedStateImageOptions.Text = 'Mohon ditunggu...'
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
  inherited footerDialogMaster: TfraFooterDialog3Button
    inherited pnlFooter: TPanel
      inherited btnClose: TcxButton
        Action = actCancel
      end
      inherited btnSave: TcxButton
        Action = actSave
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Action = actPrint
      end
    end
  end
end
