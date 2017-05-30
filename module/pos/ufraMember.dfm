object fraMember: TfraMember
  Left = 0
  Top = 0
  Width = 428
  Height = 194
  TabOrder = 0
  object cxGrid: TcxGrid
    Left = 0
    Top = 58
    Width = 428
    Height = 115
    Align = alClient
    TabOrder = 2
    LockedStateImageOptions.Text = 'Mohon ditunggu...'
    LookAndFeel.NativeStyle = False
    object sgLookup: TcxGridDBTableView
      OnDblClick = sgLookupDblClick
      OnKeyDown = sgLookupKeyDown
      Navigator.Buttons.CustomButtons = <>
      FindPanel.DisplayMode = fpdmManual
      FindPanel.InfoText = 'ketik teks yang dicari...'
      DataController.Filter.Options = [fcoCaseInsensitive]
      DataController.Filter.PercentWildcard = '*'
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
      object cxcolKode: TcxGridDBColumn
        Caption = 'Kode'
      end
      object cxcolNama: TcxGridDBColumn
        Caption = 'Nama'
        Width = 130
      end
      object cxcolAlamat: TcxGridDBColumn
        Caption = 'Alamat'
        Width = 127
      end
      object cxcolAktif: TcxGridDBColumn
        Caption = 'Aktif'
      end
      object cxcolValid: TcxGridDBColumn
        Caption = 'Valid'
      end
    end
    object grdlvlLookupMember: TcxGridLevel
      GridView = sgLookup
    end
  end
  object pbLookup: TcxProgressBar
    Left = 0
    Top = 173
    Align = alBottom
    TabOrder = 1
    Visible = False
    Width = 428
  end
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 428
    Height = 58
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentColor = True
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      428
      58)
    object Label1: TLabel
      Left = 6
      Top = 9
      Width = 112
      Height = 14
      Caption = 'Nama Member [F5]'
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
      Width = 289
      Height = 20
      Anchors = [akLeft, akTop, akRight]
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      OnChange = edNamaChange
      OnKeyDown = edNamaKeyDown
    end
    object rbDepan: TRadioButton
      Left = 132
      Top = 30
      Width = 124
      Height = 17
      Caption = 'Dari Depan [F2]'
      Checked = True
      TabOrder = 1
      TabStop = True
    end
    object rbSemua: TRadioButton
      Left = 267
      Top = 30
      Width = 142
      Height = 17
      Caption = 'Semua Posisi [F3]'
      TabOrder = 2
      TabStop = True
    end
  end
  object pmLookup: TPopupMenu
    Left = 105
    Top = 51
    object ExporttoCSV1: TMenuItem
      Caption = 'Export to CSV'
      OnClick = ExporttoCSV1Click
    end
  end
  object dlgSaveLookup: TSaveDialog
    DefaultExt = 'CSV'
    Filter = 'Comma Separated Value (*.CSV)|*.CSV|Any File (*.*)|*.*'
    Left = 147
    Top = 18
  end
end
