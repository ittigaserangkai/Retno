object frmPayment: TfrmPayment
  Left = 405
  Top = 142
  Caption = 'Pembayaran'
  ClientHeight = 544
  ClientWidth = 754
  Color = 13303754
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTotal: TPanel
    Left = 0
    Top = 0
    Width = 754
    Height = 58
    Align = alTop
    Color = clYellow
    TabOrder = 1
    object lblTotal: TLabel
      Left = 1
      Top = 6
      Width = 752
      Height = 51
      Align = alBottom
      Alignment = taCenter
      AutoSize = False
      Caption = 'P E M B A Y A R A N'
      Color = clYellow
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -40
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbl1: TLabel
      Left = 1
      Top = 1
      Width = 752
      Height = 5
      Align = alClient
      AutoSize = False
    end
  end
  object Panel12: TPanel
    Left = 0
    Top = 58
    Width = 754
    Height = 82
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentColor = True
    ParentFont = False
    TabOrder = 2
    object Label5: TLabel
      Left = 9
      Top = 12
      Width = 91
      Height = 14
      Caption = 'Total Belanja'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 9
      Top = 36
      Width = 91
      Height = 14
      Caption = 'Brg. Disc AMC'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 9
      Top = 60
      Width = 63
      Height = 14
      Caption = 'Disc. AMC'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl7: TLabel
      Left = 132
      Top = 57
      Width = 7
      Height = 14
      Caption = '%'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl8: TLabel
      Left = 359
      Top = 4
      Width = 275
      Height = 22
      Caption = 'Nilai Yang Harus Dibayar:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtTotalBelanja: TcxCurrencyEdit
      Left = 147
      Top = 6
      TabStop = False
      ParentFont = False
      TabOrder = 1
      Width = 181
    end
    object edtDiscGMCNominal: TcxCurrencyEdit
      Left = 147
      Top = 54
      TabStop = False
      ParentFont = False
      TabOrder = 3
      Width = 181
    end
    object edtBrgDiscGMC: TcxCurrencyEdit
      Left = 147
      Top = 30
      TabStop = False
      ParentFont = False
      TabOrder = 2
      Width = 181
    end
    object edtDiscGMCPersen: TcxCurrencyEdit
      Left = 84
      Top = 54
      TabStop = False
      ParentFont = False
      TabOrder = 0
      Width = 46
    end
    object edtNilaiBayar: TcxCurrencyEdit
      Left = 357
      Top = 33
      TabStop = False
      AutoSize = False
      ParentColor = True
      ParentFont = False
      TabOrder = 4
      Height = 33
      Width = 277
    end
  end
  object pnlPayment: TPanel
    Left = 0
    Top = 140
    Width = 754
    Height = 366
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentColor = True
    TabOrder = 3
    DesignSize = (
      754
      366)
    object lblResetVoucher: TLabel
      Left = 528
      Top = 159
      Width = 105
      Height = 12
      Caption = 'Reset Voucher [F12]'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object lbl10: TLabel
      Left = 33
      Top = 60
      Width = 35
      Height = 14
      Caption = 'Jenis'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl11: TLabel
      Left = 33
      Top = 84
      Width = 98
      Height = 14
      Caption = 'Biaya / Charge'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl12: TLabel
      Left = 33
      Top = 132
      Width = 35
      Height = 14
      Caption = 'Nilai'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl13: TLabel
      Left = 33
      Top = 180
      Width = 35
      Height = 14
      Caption = 'Nomor'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl14: TLabel
      Left = 33
      Top = 204
      Width = 91
      Height = 14
      Caption = 'No. Otorisasi'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl9: TLabel
      Left = 102
      Top = 15
      Width = 35
      Height = 14
      Caption = 'Nilai'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object bvl1: TBevel
      Left = 378
      Top = 177
      Width = 256
      Height = 10
      Shape = bsTopLine
    end
    object lbl17: TLabel
      Left = 381
      Top = 59
      Width = 35
      Height = 14
      Caption = 'Botol'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl18: TLabel
      Left = 381
      Top = 36
      Width = 70
      Height = 14
      Caption = 'Tr Botol #'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl19: TLabel
      Left = 381
      Top = 117
      Width = 21
      Height = 14
      Caption = 'TSN'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl20: TLabel
      Left = 381
      Top = 142
      Width = 63
      Height = 14
      Caption = 'Lain-lain'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl16: TLabel
      Left = 378
      Top = 182
      Width = 90
      Height = 18
      Caption = 'Sisa Uang'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object bvl2: TBevel
      Left = 30
      Top = 225
      Width = 296
      Height = 10
      Shape = bsTopLine
      Visible = False
    end
    object Label16: TLabel
      Left = 381
      Top = 93
      Width = 63
      Height = 14
      Caption = 'Voucher #'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 6
      Top = 14
      Width = 72
      Height = 17
      Caption = '1. Tunai'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -15
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 6
      Top = 39
      Width = 72
      Height = 17
      Caption = '2. Kartu'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -15
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblCashback: TLabel
      Left = 30
      Top = 239
      Width = 72
      Height = 17
      Caption = 'Cashback'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -15
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label32: TLabel
      Left = 354
      Top = 12
      Width = 72
      Height = 17
      Caption = '3. Kupon'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -15
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 33
      Top = 156
      Width = 28
      Height = 14
      Caption = 'Disc'
      FocusControl = Edit1
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 33
      Top = 108
      Width = 56
      Height = 14
      Caption = 'Bayar CC'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtBayarCC: TcxCurrencyEdit
      Left = 147
      Top = 102
      ParentFont = False
      TabOrder = 30
      OnExit = edtBayarCCExit
      OnKeyDown = edtBayarCCKeyDown
      Width = 181
    end
    object edtCCDiscNominal: TcxCurrencyEdit
      Left = 147
      Top = 150
      ParentFont = False
      TabOrder = 29
      Width = 181
    end
    object strgTmpVoucher: TStringGrid
      Left = 676
      Top = 5
      Width = 78
      Height = 73
      ColCount = 2
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      TabOrder = 17
      Visible = False
      ColWidths = (
        64
        64)
      RowHeights = (
        24)
    end
    object strgTempLainLain: TStringGrid
      Left = 686
      Top = 38
      Width = 78
      Height = 73
      ColCount = 3
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      TabOrder = 18
      Visible = False
      ColWidths = (
        64
        64
        64)
      RowHeights = (
        24)
    end
    object pnlPembulatan: TPanel
      Left = 378
      Top = 230
      Width = 256
      Height = 20
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 19
      Visible = False
      object LblPembulatan: TLabel
        Left = 93
        Top = 3
        Width = 160
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object Label18: TLabel
        Left = 3
        Top = 1
        Width = 84
        Height = 14
        Caption = 'Pembulatan :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
    end
    object edtNilaiTunai: TcxCurrencyEdit
      Left = 147
      Top = 9
      ParentFont = False
      TabOrder = 0
      OnKeyDown = edtNilaiTunaiKeyDown
      Width = 181
    end
    object edtChargeCreditCard: TcxCurrencyEdit
      Left = 147
      Top = 78
      Enabled = False
      ParentFont = False
      TabOrder = 3
      Width = 181
    end
    object edtNilaiCC: TcxCurrencyEdit
      Left = 147
      Top = 126
      ParentFont = False
      TabOrder = 4
      OnExit = edtNilaiCCExit
      OnKeyDown = edtNilaiCCKeyDown
      Width = 181
    end
    object edtNomorCC: TcxMaskEdit
      Left = 147
      Top = 174
      ParentFont = False
      TabOrder = 5
      Text = '1234-5678-9123-4567'
      OnKeyDown = edtNomorCCKeyDown
      Width = 180
    end
    object edtBotolValue: TcxCurrencyEdit
      Left = 498
      Top = 54
      Enabled = False
      ParentFont = False
      TabOrder = 10
      Width = 136
    end
    object edtGoroValue: TcxCurrencyEdit
      Left = 498
      Top = 111
      Enabled = False
      ParentFont = False
      TabOrder = 13
      OnKeyDown = edtGoroValueKeyDown
      Width = 136
    end
    object edtVoucherValue: TcxCurrencyEdit
      Left = 498
      Top = 135
      ParentFont = False
      TabOrder = 15
      OnKeyDown = edtVoucherValueKeyDown
      Width = 136
    end
    object edtJenisKartuCode: TcxCurrencyEdit
      Left = 147
      Top = 54
      ParentFont = False
      TabOrder = 1
      OnExit = edtJenisKartuCodeExit
      OnKeyDown = edtJenisKartuCodeKeyDown
      Width = 28
    end
    object edtJenisKartuName: TcxCurrencyEdit
      Left = 177
      Top = 54
      Enabled = False
      ParentFont = False
      TabOrder = 2
      Width = 151
    end
    object edtNoOtorisasiCC: TcxCurrencyEdit
      Left = 147
      Top = 198
      ParentFont = False
      TabOrder = 6
      OnKeyDown = edtNoOtorisasiCCKeyDown
      Width = 181
    end
    object edtNoTransBotol: TcxCurrencyEdit
      Left = 468
      Top = 30
      ParentFont = False
      TabOrder = 8
      OnExit = edtNoTransBotolExit
      OnKeyDown = edtNoTransBotolKeyDown
      OnKeyPress = edtNoTransBotolKeyPress
      Width = 166
    end
    object edtNoVoucher: TcxCurrencyEdit
      Left = 468
      Top = 87
      ParentFont = False
      TabOrder = 11
      OnExit = edtNoVoucherExit
      OnKeyDown = edtNoVoucherKeyDown
      Width = 166
    end
    object edtCashBack: TcxCurrencyEdit
      Left = 30
      Top = 265
      ParentFont = False
      TabOrder = 7
      Visible = False
      OnExit = edtCashBackExit
      OnKeyDown = edtCashBackKeyDown
      Width = 298
    end
    inline fraLookUpCC: TfraLookUpCC
      Left = 175
      Top = 54
      Width = 244
      Height = 158
      TabOrder = 20
      Visible = False
      ExplicitLeft = 175
      ExplicitTop = 54
      inherited Panel1: TPanel
        inherited pnlHeader: TPanel
          inherited edNama: TEdit
            OnKeyDown = fraLookUpCCedNamaKeyDown
          end
        end
      end
    end
    object mmoBackup: TMemo
      Left = 663
      Top = 102
      Width = 92
      Height = 89
      Lines.Strings = (
        'mmoBackup')
      TabOrder = 21
      Visible = False
      WordWrap = False
    end
    object mmoTemp: TMemo
      Left = 663
      Top = 126
      Width = 92
      Height = 89
      Lines.Strings = (
        'mmoTemp')
      TabOrder = 22
      Visible = False
      WordWrap = False
    end
    object mmoHeadStruk: TMemo
      Left = 663
      Top = 150
      Width = 92
      Height = 89
      Lines.Strings = (
        'mmoHeadStruk')
      TabOrder = 23
      Visible = False
      WordWrap = False
    end
    object mmoIsiStruk: TMemo
      Left = 663
      Top = 171
      Width = 97
      Height = 135
      Anchors = [akLeft, akTop, akBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      Lines.Strings = (
        'mmoIsiStruk')
      ParentFont = False
      TabOrder = 24
      Visible = False
      WordWrap = False
    end
    object mmoFooterStruk: TMemo
      Left = 663
      Top = 195
      Width = 92
      Height = 89
      Lines.Strings = (
        'mmoFooterStruk')
      TabOrder = 25
      Visible = False
      WordWrap = False
    end
    object edtSisaUang: TcxCurrencyEdit
      Left = 378
      Top = 201
      TabStop = False
      ParentFont = False
      TabOrder = 16
      Width = 256
    end
    object mmoIsiCB: TMemo
      Left = 663
      Top = 222
      Width = 92
      Height = 89
      Lines.Strings = (
        'mmoFooterStruk')
      TabOrder = 26
      Visible = False
      WordWrap = False
    end
    object edtBotolQty: TcxCurrencyEdit
      Left = 468
      Top = 54
      Enabled = False
      ParentFont = False
      TabOrder = 9
      Width = 28
    end
    object edtGoroQty: TcxCurrencyEdit
      Left = 468
      Top = 111
      Enabled = False
      ParentFont = False
      TabOrder = 12
      OnKeyDown = edtGoroQtyKeyDown
      Width = 28
    end
    object edtVoucherQty: TcxCurrencyEdit
      Left = 468
      Top = 135
      ParentFont = False
      TabOrder = 14
      OnKeyDown = edtVoucherQtyKeyDown
      Width = 28
    end
    object pnlInfo: TPanel
      Left = 2
      Top = 330
      Width = 750
      Height = 34
      Align = alBottom
      Color = clYellow
      TabOrder = 27
      Visible = False
      DesignSize = (
        750
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
    object edtCCDisc: TcxCurrencyEdit
      Left = 27
      Top = 334
      ParentFont = False
      TabOrder = 28
      Visible = False
      Width = 30
    end
  end
  object Panel10: TPanel
    Left = 0
    Top = 506
    Width = 754
    Height = 38
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentColor = True
    TabOrder = 0
    object Edit1: TEdit
      Left = 6
      Top = 6
      Width = 355
      Height = 23
      TabStop = False
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentColor = True
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Text = '[1]Tunai  [2]Kartu  [3]Kupon  [C]Cetak'
    end
    object edtPilihan: TcxCurrencyEdit
      Left = 363
      Top = 7
      ParentFont = False
      TabOrder = 1
      OnKeyDown = edtPilihanKeyDown
      Width = 28
    end
  end
  object tmrInfo: TTimer
    Enabled = False
    Interval = 500
    OnTimer = tmrInfoTimer
    Left = 408
    Top = 434
  end
end
