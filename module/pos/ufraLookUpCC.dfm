object fraLookUpCC: TfraLookUpCC
  Left = 0
  Top = 0
  Width = 244
  Height = 150
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 244
    Height = 150
    Align = alClient
    Caption = 'Panel1'
    ParentColor = True
    TabOrder = 0
    ExplicitHeight = 158
    object pnlHeader: TPanel
      Left = 1
      Top = 1
      Width = 242
      Height = 31
      ParentColor = True
      TabOrder = 0
      DesignSize = (
        242
        31)
      object Label1: TLabel
        Left = 6
        Top = 9
        Width = 105
        Height = 14
        Caption = 'Nama Kartu [F5]'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object edNama: TEdit
        Left = 132
        Top = 6
        Width = 103
        Height = 19
        Anchors = [akLeft, akTop, akRight]
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        OnChange = edNamaChange
        OnKeyDown = edNamaKeyDown
      end
    end
    object cxGrid: TcxGrid
      Left = 1
      Top = 1
      Width = 242
      Height = 148
      Align = alClient
      TabOrder = 1
      LockedStateImageOptions.Text = 'Mohon ditunggu...'
      LookAndFeel.NativeStyle = False
      ExplicitTop = 32
      ExplicitHeight = 125
      object cxGridView: TcxGridDBTableView
        OnKeyDown = cxGridViewKeyDown
        Navigator.Buttons.CustomButtons = <>
        FindPanel.DisplayMode = fpdmManual
        FindPanel.InfoText = 'ketik teks yang dicari...'
        DataController.Filter.Options = [fcoCaseInsensitive]
        DataController.Filter.PercentWildcard = '*'
        DataController.Filter.Active = True
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        FilterRow.InfoText = 
          'Klik untuk memfilter data / Atau gunakan CTRL-F untuk panel filt' +
          'er'
        FilterRow.Visible = True
        FilterRow.ApplyChanges = fracImmediately
        NewItemRow.InfoText = 'Baris baru'
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
end
