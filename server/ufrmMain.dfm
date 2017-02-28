object frmMain: TfrmMain
  Left = 271
  Top = 114
  Caption = 'Retno - Retail And Online System'
  ClientHeight = 351
  ClientWidth = 272
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grpRestServer: TGroupBox
    Left = 0
    Top = 181
    Width = 272
    Height = 170
    Align = alClient
    Caption = 'Rest Server'
    TabOrder = 0
    ExplicitWidth = 267
    ExplicitHeight = 83
    object Label1: TLabel
      Left = 10
      Top = 51
      Width = 20
      Height = 13
      Caption = 'Port'
    end
    object ButtonStart: TButton
      Left = 10
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Start'
      TabOrder = 0
      OnClick = ButtonStartClick
    end
    object ButtonStop: TButton
      Left = 91
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Stop'
      TabOrder = 1
      OnClick = ButtonStopClick
    end
    object EditPort: TEdit
      Left = 45
      Top = 47
      Width = 121
      Height = 21
      TabOrder = 2
      Text = '8080'
    end
    object ButtonOpenBrowser: TButton
      Left = 172
      Top = 16
      Width = 84
      Height = 52
      Caption = 'Open Browser'
      TabOrder = 3
      OnClick = ButtonOpenBrowserClick
    end
    object Button1: TButton
      Left = 10
      Top = 88
      Width = 75
      Height = 25
      Caption = 'Test'
      TabOrder = 4
      OnClick = Button1Click
    end
  end
  object grpDB: TGroupBox
    Left = 0
    Top = 0
    Width = 272
    Height = 181
    Align = alTop
    Caption = 'Koneksi Database'
    TabOrder = 1
    ExplicitWidth = 267
    object lblServer: TLabel
      Left = 29
      Top = 51
      Width = 32
      Height = 13
      Caption = 'Server'
    end
    object lblUser: TLabel
      Left = 39
      Top = 99
      Width = 22
      Height = 13
      Caption = 'User'
    end
    object lblPassword: TLabel
      Left = 15
      Top = 123
      Width = 46
      Height = 13
      Caption = 'Password'
    end
    object lblEngine: TLabel
      Left = 29
      Top = 27
      Width = 32
      Height = 13
      Caption = 'Engine'
    end
    object lblDatabase: TLabel
      Left = 15
      Top = 75
      Width = 46
      Height = 13
      Caption = 'Database'
    end
    object lblPort: TLabel
      Left = 181
      Top = 51
      Width = 20
      Height = 13
      Caption = 'Port'
    end
    object edServer: TcxTextEdit
      Left = 78
      Top = 47
      TabOrder = 1
      Text = '127.0.0.1'
      Width = 96
    end
    object edUser: TcxTextEdit
      Left = 78
      Top = 95
      TabOrder = 4
      Text = 'sa'
      Width = 178
    end
    object edPassword: TcxTextEdit
      Left = 78
      Top = 119
      Properties.EchoMode = eemPassword
      Properties.PasswordChar = '*'
      TabOrder = 5
      Text = 'masterkey'
      Width = 178
    end
    object cbbEngine: TComboBox
      Left = 78
      Top = 23
      Width = 178
      Height = 21
      Style = csDropDownList
      ItemIndex = 1
      TabOrder = 0
      Text = 'MSSQL'
      Items.Strings = (
        'PG'
        'MSSQL'
        'MYSQL'
        'ORA'
        'IB')
    end
    object edDatabase: TcxTextEdit
      Left = 78
      Top = 71
      TabOrder = 3
      Text = 'assalamHO'
      Width = 178
    end
    object edPort: TcxTextEdit
      Left = 209
      Top = 47
      TabOrder = 2
      Text = '1433'
      Width = 47
    end
    object btnKonekDB: TButton
      Left = 169
      Top = 146
      Width = 87
      Height = 25
      Caption = 'Connect'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = btnKonekDBClick
    end
  end
  object AE: TApplicationEvents
    OnIdle = AEIdle
    Left = 200
    Top = 32
  end
  object ImageList1: TImageList
    Left = 168
    Top = 24
  end
end
