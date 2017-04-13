inherited frmExportToMDB: TfrmExportToMDB
  Left = 551
  Top = 303
  Caption = 'Export To MDB'
  ClientHeight = 337
  ClientWidth = 536
  OldCreateOrder = True
  ExplicitWidth = 552
  ExplicitHeight = 376
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 536
    Height = 307
    ExplicitWidth = 120
    ExplicitHeight = 307
    object Panel1: TPanel
      Left = 11
      Top = 11
      Width = 514
      Height = 70
      Align = alTop
      TabOrder = 0
      ExplicitWidth = 98
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
      Width = 514
      Height = 215
      Align = alClient
      Color = 12582911
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
      WordWrap = False
      ExplicitWidth = 98
      ExplicitHeight = 211
    end
  end
  inherited pnlHeader: TPanel
    Width = 536
    ExplicitWidth = 120
    inherited lblHeader: TLabel
      Width = 104
      Caption = 'Export Data To MDB'
      ExplicitWidth = 104
    end
  end
end
