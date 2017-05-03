object frmTransaksi: TfrmTransaksi
  Left = 276
  Top = 123
  BorderStyle = bsNone
  Caption = 'Penjualan'
  ClientHeight = 529
  ClientWidth = 888
  Color = 13303754
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
  WindowState = wsMaximized
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    888
    529)
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 3
    Top = 458
    Width = 143
    Height = 23
    Anchors = [akLeft, akBottom]
    Caption = 'Kode Barang'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblHargaKontrabon: TLabel
    Left = 354
    Top = 458
    Width = 65
    Height = 23
    Anchors = [akLeft, akBottom]
    Caption = 'Harga'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object pnl1: TPanel
    Left = 0
    Top = 58
    Width = 888
    Height = 61
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 13303754
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 9
      Top = 9
      Width = 84
      Height = 14
      Caption = 'No Pelanggan'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 9
      Top = 33
      Width = 98
      Height = 14
      Caption = 'Nama Pelanggan'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 378
      Top = 33
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
    object lbl3: TLabel
      Left = 506
      Top = 9
      Width = 126
      Height = 14
      Caption = 'F1 = ShortCut Keys'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edNoPelanggan: TcxTextEdit
      Left = 120
      Top = 6
      TabOrder = 0
      OnExit = edNoPelangganExit
      OnKeyDown = edNoPelangganKeyDown
      Width = 105
    end
    object edNamaPelanggan: TcxTextEdit
      Left = 120
      Top = 32
      Properties.ReadOnly = True
      TabOrder = 1
      Width = 233
    end
    object edNoTrnTerakhir: TcxTextEdit
      Left = 528
      Top = 32
      Properties.ReadOnly = True
      TabOrder = 2
      Width = 121
    end
  end
  object edHargaKontrabon: TcxCurrencyEdit
    Left = 435
    Top = 455
    Anchors = [akLeft, akBottom]
    ParentFont = False
    Properties.DisplayFormat = 'Rp.,0.00;(Rp.,0.00)'
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -21
    Style.Font.Name = 'Courier New'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 4
    Visible = False
    OnKeyDown = edHargaKontrabonKeyDown
    Width = 169
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 491
    Width = 888
    Height = 38
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 13303754
    TabOrder = 5
    DesignSize = (
      888
      38)
    object btnHapus: TButton
      Left = 6
      Top = 6
      Width = 86
      Height = 25
      Caption = 'Hapus [Del]'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object btnBayar: TButton
      Left = 96
      Top = 6
      Width = 87
      Height = 25
      Caption = 'Bayar [F9]'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnBayarClick
    end
    object btnReset: TButton
      Left = 186
      Top = 6
      Width = 86
      Height = 25
      Caption = 'Reset [F12]'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnResetClick
    end
    object pnlInfo: TPanel
      Left = 282
      Top = 2
      Width = 604
      Height = 34
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = clYellow
      TabOrder = 0
      Visible = False
      DesignSize = (
        604
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
  object pnlTotal: TPanel
    Left = 0
    Top = 0
    Width = 888
    Height = 58
    Align = alTop
    TabOrder = 0
    object lblTotal: TLabel
      Left = 165
      Top = 1
      Width = 722
      Height = 56
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
      ExplicitLeft = 694
      ExplicitWidth = 193
      ExplicitHeight = 55
    end
    object lbl2: TLabel
      Left = 1
      Top = 1
      Width = 164
      Height = 56
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
      ExplicitHeight = 55
    end
  end
  object edPLU: TEdit
    Left = 156
    Top = 455
    Width = 175
    Height = 29
    Anchors = [akLeft, akBottom]
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 3
    OnEnter = edPLUEnter
    OnExit = edPLUExit
    OnKeyDown = edPLUKeyDown
  end
  inline fraLookupBarang: TfraLookupBarang
    Left = 246
    Top = 192
    Width = 300
    Height = 150
    TabOrder = 2
    Visible = False
    ExplicitLeft = 246
    ExplicitTop = 192
    ExplicitWidth = 300
    ExplicitHeight = 150
    inherited pnlHeader: TPanel
      Width = 300
      ParentColor = True
      ExplicitWidth = 300
      inherited edNamaBarang: TEdit
        Width = 480
        ExplicitWidth = 480
      end
    end
    inherited pnlInfo: TPanel
      Top = 116
      Width = 300
      ExplicitTop = 116
      ExplicitWidth = 300
    end
    inherited cxGrid: TcxGrid
      Width = 300
      Height = 43
      ExplicitWidth = 300
      ExplicitHeight = 43
    end
    inherited pbBarang: TcxProgressBar
      Top = 95
      ExplicitTop = 95
      ExplicitWidth = 300
      Width = 300
    end
  end
  inline fraMember: TfraMember
    Left = 71
    Top = 227
    Width = 281
    Height = 146
    TabOrder = 6
    Visible = False
    ExplicitLeft = 71
    ExplicitTop = 227
    ExplicitWidth = 281
    ExplicitHeight = 146
    inherited cxGrid: TcxGrid
      Width = 281
      Height = 67
      ExplicitWidth = 281
      ExplicitHeight = 67
    end
    inherited pbLookup: TcxProgressBar
      Top = 125
      ExplicitTop = 125
      ExplicitWidth = 281
      Width = 281
    end
    inherited pnlHeader: TPanel
      Width = 281
      ExplicitWidth = 281
      inherited edNama: TEdit
        Width = 142
        ExplicitWidth = 142
      end
    end
  end
  object cxTransaksi: TcxGrid
    Left = 0
    Top = 119
    Width = 888
    Height = 328
    Align = alTop
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    LockedStateImageOptions.Text = 'Mohon ditunggu...'
    LookAndFeel.NativeStyle = False
    object sgTransaksi: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.InfoPanel.DisplayMask = '[RecordIndex] / [RecordCount]'
      FindPanel.InfoText = 'Cari Data'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.InfoText = 'Filter Row'
      NewItemRow.InfoText = 'Data Baru'
      OptionsData.Appending = True
      OptionsView.NoDataToDisplayInfoText = '<Data Kosong>'
      OptionsView.ExpandButtonsForEmptyDetails = False
      OptionsView.GroupByBox = False
      object colNo: TcxGridColumn
      end
    end
    object grdlvlTransaksi: TcxGridLevel
      GridView = sgTransaksi
    end
  end
  object pnlotorisasi: TPanel
    Left = 601
    Top = 222
    Width = 281
    Height = 128
    Align = alCustom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = clGray
    TabOrder = 8
    Visible = False
    object lbl4: TLabel
      Left = 9
      Top = 30
      Width = 22
      Height = 13
      Caption = 'User'
    end
    object lbl5: TLabel
      Left = 10
      Top = 58
      Width = 46
      Height = 13
      Caption = 'Password'
    end
    object bvl1: TBevel
      Left = 2
      Top = 2
      Width = 277
      Height = 9
      Align = alTop
      Shape = bsTopLine
    end
    object lbl6: TLabel
      Left = 58
      Top = 4
      Width = 161
      Height = 22
      Caption = 'OTORISASI PASSWORD'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtUsername: TEdit
      Left = 96
      Top = 30
      Width = 153
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      OnKeyDown = edtUsernameKeyDown
    end
    object edtPassword: TEdit
      Left = 96
      Top = 58
      Width = 153
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      PasswordChar = '*'
      TabOrder = 1
      OnKeyDown = edtPasswordKeyDown
    end
    object btnOk: TButton
      Left = 96
      Top = 93
      Width = 75
      Height = 25
      Caption = '&Ok'
      TabOrder = 2
      OnClick = btnOkClick
    end
    object btnCancel: TButton
      Left = 184
      Top = 94
      Width = 75
      Height = 25
      Caption = '&Cancel'
      TabOrder = 3
      OnClick = btnCancelClick
    end
  end
  object tmrInfo: TTimer
    Enabled = False
    Interval = 500
    OnTimer = tmrInfoTimer
    Left = 408
    Top = 434
  end
  object ActionList1: TActionList
    Left = 208
    Top = 151
  end
end
