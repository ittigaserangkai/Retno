inherited frmListingNDB: TfrmListingNDB
  Left = 257
  Top = 226
  Width = 473
  Height = 117
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Listing Non Produk Dagangan'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 465
    Height = 53
    object lbl1: TLabel
      Left = 8
      Top = 18
      Width = 41
      Height = 16
      Caption = 'Periode '
    end
    object TeLabel1: TTeLabel
      Left = 163
      Top = 18
      Width = 19
      Height = 16
      Performance = kspNoBuffer
      Caption = 's.d.'
      Color = clBtnFace
      ParentColor = False
      ThemeObject = 'default'
    end
    object dtAwal: TDateTimePicker
      Left = 56
      Top = 14
      Width = 104
      Height = 24
      Date = 40036.465052384260000000
      Time = 40036.465052384260000000
      TabOrder = 0
    end
    object dtAkhir: TDateTimePicker
      Left = 185
      Top = 14
      Width = 104
      Height = 24
      Date = 40036.465091261580000000
      Time = 40036.465091261580000000
      TabOrder = 1
    end
    object Button1: TButton
      Left = 292
      Top = 14
      Width = 57
      Height = 25
      Caption = 'OK'
      TabOrder = 2
      OnClick = Button1Click
    end
    object btnClose: TButton
      Left = 356
      Top = 14
      Width = 77
      Height = 25
      Caption = 'Close [Esc]'
      TabOrder = 3
      OnClick = btnCloseClick
    end
  end
  inherited pnlHeader: TPanel
    Width = 465
  end
end
