object frmTransaksiKring: TfrmTransaksiKring
  Left = 201
  Top = 182
  BorderStyle = bsNone
  Caption = 'Penjualan Kring 33'
  ClientHeight = 453
  ClientWidth = 806
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTotal: TPanel
    Left = 0
    Top = 0
    Width = 806
    Height = 58
    Align = alTop
    TabOrder = 0
    object lblTotal: TLabel
      Left = 612
      Top = 1
      Width = 193
      Height = 55
      Align = alClient
      Alignment = taRightJustify
      Caption = 'Rp. 0,00 '
      Color = clYellow
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -47
      Font.Name = 'EditSys'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbl2: TLabel
      Left = 1
      Top = 1
      Width = 164
      Height = 55
      Align = alLeft
      Alignment = taRightJustify
      Caption = ' Total ='
      Color = clYellow
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -47
      Font.Name = 'EditSys'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 58
    Width = 806
    Height = 61
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 13303754
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 9
      Top = 9
      Width = 77
      Height = 14
      Caption = 'No. DO / PO'
    end
    object Label2: TLabel
      Left = 9
      Top = 33
      Width = 98
      Height = 14
      Caption = 'Nama Pelanggan'
    end
    object Label4: TLabel
      Left = 225
      Top = 9
      Width = 7
      Height = 14
      Caption = '/'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 378
      Top = 9
      Width = 140
      Height = 14
      Caption = 'Transaksi Terakhir #'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edNomorPO: TcxTextEdit
      Left = 234
      Top = 6
      Enabled = False
      TabOrder = 1
      Width = 103
    end
    object edNamaPelanggan: TcxTextEdit
      Left = 225
      Top = 30
      Enabled = False
      TabOrder = 2
      Width = 412
    end
    object edNomorDO: TcxTextEdit
      Left = 120
      Top = 6
      TabOrder = 0
      OnKeyDown = edNomorDOKeyDown
      Width = 103
    end
    object edNoTrnTerakhir: TcxCurrencyEdit
      Left = 534
      Top = 6
      TabStop = False
      Enabled = False
      ParentFont = False
      TabOrder = 3
      Width = 103
    end
    object edNoPelanggan: TcxTextEdit
      Left = 120
      Top = 30
      Enabled = False
      TabOrder = 4
      Width = 103
    end
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 415
    Width = 806
    Height = 38
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 13303754
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    DesignSize = (
      806
      38)
    object Label5: TLabel
      Left = 6
      Top = 9
      Width = 135
      Height = 17
      Caption = '[F9] Pembayaran'
    end
    object pnlInfo: TPanel
      Left = 168
      Top = 2
      Width = 636
      Height = 34
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = clYellow
      TabOrder = 0
      Visible = False
      DesignSize = (
        636
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
  end
  object cxTransaksi: TcxGrid
    Left = 0
    Top = 119
    Width = 806
    Height = 328
    Align = alTop
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    LockedStateImageOptions.Text = 'Mohon ditunggu...'
    LookAndFeel.NativeStyle = False
    ExplicitLeft = -82
    ExplicitWidth = 888
    object sgTransaksi: TcxGridDBTableView
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
      object cxcolNo: TcxGridDBColumn
        Caption = 'No'
      end
      object cxcolPLU: TcxGridDBColumn
        Caption = 'PLU'
        Width = 66
      end
      object cxcolNamaBarang: TcxGridDBColumn
        Caption = 'Nama Barang'
        Width = 113
      end
      object cxcolJumlah: TcxGridDBColumn
        Caption = 'Jumlah'
      end
      object cxcolHarga: TcxGridDBColumn
        Caption = 'Harga'
      end
      object cxcolDisc: TcxGridDBColumn
        Caption = 'Disc'
      end
      object cxcolTotal: TcxGridDBColumn
        Caption = 'Total'
        Width = 94
      end
      object cxcolIsDecimal: TcxGridDBColumn
        Caption = 'isDecimal'
        Width = 22
      end
    end
    object grdlvlTransaksi: TcxGridLevel
      GridView = sgTransaksi
    end
  end
  object tmrInfo: TTimer
    Enabled = False
    Interval = 500
    OnTimer = tmrInfoTimer
    Left = 402
    Top = 419
  end
end
