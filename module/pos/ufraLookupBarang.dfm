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
    object sgBarang: TcxGridTableView
      OnDblClick = sgBarangDblClick
      OnKeyDown = sgBarangKeyDown
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object sgBarangColumn1: TcxGridColumn
        Caption = 'PLU'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Styles.Header = frmTransaksi.cxStyleBold
        Width = 27
      end
      object sgBarangColumn2: TcxGridColumn
        Caption = 'Satuan'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Styles.Header = frmTransaksi.cxStyleBold
        Width = 45
      end
      object sgBarangColumn3: TcxGridColumn
        Caption = 'Nama Barang'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Styles.Header = frmTransaksi.cxStyleBold
        Width = 80
      end
      object sgBarangColumn4: TcxGridColumn
        Caption = 'Harga Dasar'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Styles.Header = frmTransaksi.cxStyleBold
        Width = 75
      end
      object sgBarangColumn5: TcxGridColumn
        Caption = 'Diskon'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Styles.Header = frmTransaksi.cxStyleBold
        Width = 43
      end
      object sgBarangColumn6: TcxGridColumn
        Caption = 'Harga'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Styles.Header = frmTransaksi.cxStyleBold
        Width = 51
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
