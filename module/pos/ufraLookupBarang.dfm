object fraLookupBarang: TfraLookupBarang
  Left = 0
  Top = 0
  Width = 569
  Height = 315
  TabOrder = 0
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 569
    Height = 52
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      569
      52)
    object lblNamaBarang: TLabel
      Left = 6
      Top = 9
      Width = 112
      Height = 14
      Caption = 'Nama Barang [F5]'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object edNamaBarang: TEdit
      Left = 132
      Top = 6
      Width = 430
      Height = 20
      Anchors = [akLeft, akTop, akRight]
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      OnChange = edNamaBarangChange
      OnKeyDown = edNamaBarangKeyDown
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
  object pnlInfo: TPanel
    Left = 0
    Top = 260
    Width = 569
    Height = 34
    Align = alBottom
    Color = clYellow
    TabOrder = 1
    Visible = False
    DesignSize = (
      569
      34)
    object lblInfo: TLabel
      Left = 12
      Top = 8
      Width = 88
      Height = 15
      Anchors = [akLeft, akBottom]
      Caption = 'Warning !!!'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -20
      Font.Name = 'Fixedsys'
      Font.Style = []
      ParentFont = False
    end
  end
  object cxGrid: TcxGrid
    Left = 0
    Top = 52
    Width = 569
    Height = 208
    Align = alClient
    TabOrder = 2
    LockedStateImageOptions.Text = 'Mohon ditunggu...'
    LookAndFeel.NativeStyle = False
    object sgBarang: TcxGridDBTableView
      OnDblClick = sgBarangDblClick
      OnKeyDown = sgBarangKeyDown
      Navigator.Buttons.CustomButtons = <>
      FindPanel.DisplayMode = fpdmManual
      FindPanel.InfoText = 'ketik teks yang dicari...'
      OnTopRecordIndexChanged = sgBarangTopRecordIndexChanged
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
      object cxcolPLU: TcxGridDBColumn
        Caption = 'PLU'
      end
      object cxcolSatuan: TcxGridDBColumn
        Caption = 'Satuan'
      end
      object cxcolNamaBarang: TcxGridDBColumn
        Caption = 'Nama Barang'
        Width = 146
      end
      object cxcolHargaDasar: TcxGridDBColumn
        Caption = 'Harga Dasar'
        Width = 89
      end
      object cxcolDiskon: TcxGridDBColumn
        Caption = 'Diskon'
      end
      object cxcolHargaBersih: TcxGridDBColumn
        Caption = 'Harga Bersih'
        Width = 87
      end
    end
    object grdlvlLookupMember: TcxGridLevel
      GridView = sgBarang
    end
  end
  object pbBarang: TcxProgressBar
    Left = 0
    Top = 294
    Align = alBottom
    TabOrder = 3
    Visible = False
    Width = 569
  end
  object pmLookup: TPopupMenu
    Left = 105
    Top = 51
  end
  object tmrInfo: TTimer
    Enabled = False
    Interval = 500
    OnTimer = tmrInfoTimer
    Left = 72
    Top = 104
  end
end
