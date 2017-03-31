inherited frmExportOfflinePOS_a: TfrmExportOfflinePOS_a
  Left = 305
  Top = 207
  Caption = 'Export Transaksi POS Offline'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    BorderWidth = 0
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 540
      Height = 47
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 12
        Width = 38
        Height = 16
        Caption = 'Tanggal'
      end
      object dtTanggal: TDateTimePicker
        Left = 72
        Top = 8
        Width = 97
        Height = 24
        Date = 40025.356299363430000000
        Time = 40025.356299363430000000
        TabOrder = 0
      end
      object btnExport: TButton
        Left = 174
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Export'
        TabOrder = 1
        OnClick = btnExportClick
      end
    end
    object mmoExport: TMemo
      Left = 1
      Top = 48
      Width = 540
      Height = 254
      Align = alClient
      Color = 12582911
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
      WordWrap = False
    end
  end
  inherited pnlHeader: TPanel
    inherited lblHeader: TLabel
      Width = 157
      Caption = 'Export Transaksi POS Offline'
    end
  end
  object dlgSave: TSaveDialog
    DefaultExt = '*.txt'
    Filter = 'Text File (*.txt)|*.txt|All Files|*.*'
    Left = 256
    Top = 40
  end
end
