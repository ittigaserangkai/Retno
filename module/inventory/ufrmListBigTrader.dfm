inherited frmListBigTrader: TfrmListBigTrader
  Left = 331
  Top = 263
  Caption = 'Listing Big Trader'
  ClientHeight = 224
  ClientWidth = 479
  OldCreateOrder = True
  ExplicitWidth = 495
  ExplicitHeight = 263
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 479
    Height = 194
    ExplicitWidth = 479
    ExplicitHeight = 194
    object lbl1: TLabel
      Left = 10
      Top = 14
      Width = 37
      Height = 16
      Caption = 'Periode'
    end
    object lbl2: TLabel
      Left = 10
      Top = 43
      Width = 97
      Height = 16
      Caption = 'Sampai Rangking Ke'
    end
    object lbl3: TLabel
      Left = 270
      Top = 14
      Width = 19
      Height = 16
      Caption = 's.d.'
    end
    object lbl4: TLabel
      Left = 10
      Top = 73
      Width = 71
      Height = 16
      Caption = 'Penjualan Dari'
    end
    object dtpAkhir: TDateTimePicker
      Left = 290
      Top = 10
      Width = 119
      Height = 24
      BevelOuter = bvNone
      BevelKind = bkFlat
      Date = 40196.621523252320000000
      Format = 'dd MMM yyyy'
      Time = 40196.621523252320000000
      TabOrder = 1
    end
    object dtpAwal: TDateTimePicker
      Left = 140
      Top = 10
      Width = 119
      Height = 24
      BevelOuter = bvNone
      BevelKind = bkFlat
      Date = 40196.621535914360000000
      Format = 'dd MMM yyyy'
      Time = 40196.621535914360000000
      TabOrder = 0
    end
    object edRangking: TcxCurrencyEdit
      Left = 140
      Top = 40
      EditValue = 0
      TabOrder = 2
      Width = 119
    end
    object btnCetak: TButton
      Left = 270
      Top = 70
      Width = 75
      Height = 25
      Caption = 'Cetak'
      TabOrder = 4
      OnClick = btnCetakClick
    end
    object btnClose: TButton
      Left = 350
      Top = 70
      Width = 75
      Height = 25
      Caption = 'Close'
      TabOrder = 5
      OnClick = btnCloseClick
    end
    object cbbPenjualanDari: TComboBox
      Left = 140
      Top = 69
      Width = 119
      Height = 24
      BevelKind = bkFlat
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 3
      Text = 'TRADER'
      Items.Strings = (
        'TRADER'
        'MEMBER')
    end
  end
  inherited pnlHeader: TPanel
    Width = 479
    ExplicitWidth = 479
    inherited lblHeader: TLabel
      Width = 97
      Height = 18
      Caption = 'Listing Big Trader'
      ExplicitWidth = 97
    end
  end
end
