inherited frmExportToMDB: TfrmExportToMDB
  Left = 551
  Top = 303
  Caption = 'Export To MDB'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    object Panel1: TPanel
      Left = 11
      Top = 11
      Width = 512
      Height = 70
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 12
        Width = 126
        Height = 16
        Caption = 'Tanggal Terakhir Export :'
      end
      object Label2: TLabel
        Left = 16
        Top = 44
        Width = 72
        Height = 16
        Caption = 'Tanggal Mulai :'
      end
      object btnExport: TButton
        Left = 246
        Top = 40
        Width = 75
        Height = 25
        Caption = '&Export'
        TabOrder = 2
        OnClick = btnExportClick
      end
      object dtTanggal: TDateTimePicker
        Left = 144
        Top = 40
        Width = 97
        Height = 24
        Date = 40025.356299363430000000
        Format = 'dd MMM yyyy'
        Time = 40025.356299363430000000
        TabOrder = 1
      end
      object dtLastExport: TDateTimePicker
        Left = 144
        Top = 8
        Width = 97
        Height = 24
        Date = 40025.356299363430000000
        Format = 'dd MMM yyyy'
        Time = 40025.356299363430000000
        Enabled = False
        TabOrder = 0
      end
    end
    object mmoExport: TMemo
      Left = 11
      Top = 81
      Width = 512
      Height = 211
      Align = alClient
      Color = 12582911
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
      WordWrap = False
      ExplicitHeight = 199
    end
  end
  inherited pnlHeader: TPanel
    inherited lblHeader: TLabel
      Width = 104
      Caption = 'Export Data To MDB'
      ExplicitWidth = 104
    end
  end
end
