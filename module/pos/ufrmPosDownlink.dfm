object frmPosDownlink: TfrmPosDownlink
  Left = 544
  Top = 121
  ClientHeight = 256
  ClientWidth = 610
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 610
    Height = 30
    Align = alTop
    BevelOuter = bvLowered
    Color = 14079702
    TabOrder = 0
    object lblHeader: TLabel
      Left = 8
      Top = 7
      Width = 80
      Height = 14
      Caption = 'Update Master'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 30
    Width = 610
    Height = 227
    Align = alTop
    TabOrder = 1
    object lblState: TLabel
      Left = 416
      Top = 80
      Width = 120
      Height = 13
      Caption = 'lblState: Encryption state:'
    end
    object chkFile: TCheckBox
      Left = 24
      Top = 18
      Width = 97
      Height = 17
      Caption = 'From File'
      TabOrder = 0
      OnClick = chkFileClick
    end
    object edtFileNm: TEdit
      Left = 122
      Top = 15
      Width = 255
      Height = 21
      BevelKind = bkFlat
      BorderStyle = bsNone
      TabOrder = 1
    end
    object btnBrowse: TButton
      Left = 378
      Top = 15
      Width = 27
      Height = 20
      Caption = '....'
      TabOrder = 2
      OnClick = btnBrowseClick
    end
    object btnOk: TButton
      Left = 416
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Ok'
      TabOrder = 3
      OnClick = btnOkClick
    end
    object btnClose: TButton
      Left = 531
      Top = 197
      Width = 74
      Height = 25
      Caption = 'Close'
      TabOrder = 4
      OnClick = btnCloseClick
    end
    object chkDB: TCheckBox
      Left = 24
      Top = 50
      Width = 97
      Height = 17
      Caption = 'From database'
      Checked = True
      State = cbChecked
      TabOrder = 5
      OnClick = chkDBClick
    end
    object grp1: TGroupBox
      Left = 128
      Top = 48
      Width = 265
      Height = 153
      Caption = 'Update Master'
      TabOrder = 6
      object chkBarang: TCheckBox
        Left = 16
        Top = 84
        Width = 137
        Height = 16
        Caption = 'Barang / Harga Jual'
        TabOrder = 0
      end
      object chkVoucher: TCheckBox
        Left = 16
        Top = 108
        Width = 97
        Height = 16
        Caption = 'Voucher'
        TabOrder = 1
      end
      object chkKupon: TCheckBox
        Left = 152
        Top = 60
        Width = 97
        Height = 16
        Caption = 'Kupon Botol'
        TabOrder = 2
      end
      object chkMember: TCheckBox
        Left = 152
        Top = 84
        Width = 97
        Height = 16
        Caption = 'Member'
        TabOrder = 3
      end
      object chkKasir: TCheckBox
        Left = 16
        Top = 60
        Width = 97
        Height = 16
        Caption = 'Login Kasir'
        TabOrder = 4
      end
      object chkAll: TCheckBox
        Left = 16
        Top = 24
        Width = 97
        Height = 17
        Caption = 'check  All'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        OnClick = chkAllClick
      end
      object chkBank: TCheckBox
        Left = 152
        Top = 108
        Width = 97
        Height = 16
        Caption = 'Card'
        TabOrder = 6
      end
    end
    object btnLoadDB: TButton
      Left = 416
      Top = 40
      Width = 75
      Height = 25
      Caption = 'Load DB'
      TabOrder = 7
      OnClick = btnLoadDBClick
    end
    object btnCheckDB: TButton
      Left = 512
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Check DB'
      TabOrder = 8
      OnClick = btnCheckDBClick
    end
  end
  object OpDlg: TOpenDialog
    Filter = 'Text File (*.txt)|*.txt'
    Left = 328
    Top = 16
  end
end
