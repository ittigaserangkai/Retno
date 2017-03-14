object fraHistoriPOByProduct: TfraHistoriPOByProduct
  Left = 0
  Top = 0
  Width = 598
  Height = 240
  TabOrder = 0
  object pnl1: TPanel
    Left = 0
    Top = 23
    Width = 598
    Height = 217
    Align = alClient
    BevelOuter = bvLowered
    BorderWidth = 20
    TabOrder = 0
    DesignSize = (
      598
      217)
    object lblAdd: TcxLabel
      Left = 441
      Top = 4
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'Add'
      Enabled = False
      ParentFont = False
    end
    object lblEdit: TcxLabel
      Left = 471
      Top = 4
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'Edit'
      Enabled = False
      ParentFont = False
    end
    object lblDelete: TcxLabel
      Left = 501
      Top = 4
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'Delete'
      Enabled = False
      ParentFont = False
    end
    object lblClose: TcxLabel
      Left = 542
      Top = 4
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'Close'
      ParentFont = False
      OnClick = lblCloseClick
    end
    object cxGrid: TcxGrid
      Left = 21
      Top = 21
      Width = 556
      Height = 175
      Align = alClient
      TabOrder = 4
      LockedStateImageOptions.Text = 'Mohon ditunggu...'
      LookAndFeel.NativeStyle = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 677
      ExplicitHeight = 290
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
        Styles.ContentEven = DMClient.cxStyleGridHeader
        Styles.Header = DMClient.cxStyleGridEven
      end
      object cxlvMaster: TcxGridLevel
        GridView = cxGridView
      end
    end
  end
  object pnl4: TPanel
    Left = 0
    Top = 0
    Width = 598
    Height = 23
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = 'HISTORY PO BY PRODUCT'
    Color = 15422804
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
end
