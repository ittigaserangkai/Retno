object frmExportOfflinePOS: TfrmExportOfflinePOS
  Left = 475
  Top = 141
  Caption = 'Export Transaksi POS'
  ClientHeight = 307
  ClientWidth = 558
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBody: TPanel
    Left = 0
    Top = 30
    Width = 558
    Height = 277
    Align = alClient
    BevelOuter = bvLowered
    Color = 15198183
    TabOrder = 0
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 556
      Height = 47
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 12
        Width = 39
        Height = 13
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
      object chkOnline: TCheckBox
        Left = 272
        Top = 16
        Width = 97
        Height = 17
        Caption = 'Online'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
    end
    object mmoExport: TMemo
      Left = 1
      Top = 48
      Width = 556
      Height = 228
      Align = alClient
      Color = 12582911
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
      WordWrap = False
    end
  end
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 558
    Height = 30
    Align = alTop
    BevelOuter = bvLowered
    Color = 14079702
    TabOrder = 1
    object lblHeader: TLabel
      Left = 8
      Top = 7
      Width = 117
      Height = 14
      Caption = 'Export Transaksi POS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object dlgSave: TSaveDialog
    DefaultExt = '*.txt'
    Filter = 'Text File (*.txt)|*.txt|All Files|*.*'
    Left = 432
    Top = 40
  end
  object idmlExpPOS: TIdMailBox
    Left = 337
    Top = 39
  end
end
