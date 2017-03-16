object fraAlokasiStock: TfraAlokasiStock
  Left = 0
  Top = 0
  Width = 439
  Height = 240
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Trebuchet MS'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object pnl1: TPanel
    Left = 0
    Top = 23
    Width = 439
    Height = 183
    Align = alClient
    BevelOuter = bvLowered
    BorderWidth = 20
    TabOrder = 0
    DesignSize = (
      439
      183)
    object lblClose: TcxLabel
      Left = 388
      Top = 4
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'Close'
      ParentFont = False
      Transparent = True
      OnClick = lblCloseClick
    end
    object cxGrid: TcxGrid
      Left = 21
      Top = 21
      Width = 397
      Height = 141
      Align = alClient
      TabOrder = 1
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
    Width = 439
    Height = 23
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = 'STOCK ALOCATION'
    Color = 15422804
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object pnl2: TPanel
    Left = 0
    Top = 206
    Width = 439
    Height = 34
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 15198183
    TabOrder = 2
    object lbl1: TLabel
      Left = 23
      Top = 6
      Width = 76
      Height = 16
      Caption = 'Current Stock'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4246527
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edt28: TEdit
      Left = 173
      Top = 5
      Width = 38
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
      Text = 'PCS'
    end
    object ecCurrentStock: TcxCurrencyEdit
      Left = 104
      Top = 5
      TabOrder = 1
      Width = 65
    end
  end
end
