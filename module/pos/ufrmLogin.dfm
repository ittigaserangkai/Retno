object frmLogin: TfrmLogin
  Left = 418
  Top = 310
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Login'
  ClientHeight = 152
  ClientWidth = 344
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Courier New'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    344
    152)
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 3
    Top = 6
    Width = 80
    Height = 16
    Caption = 'Cashier ID'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 3
    Top = 81
    Width = 64
    Height = 16
    Caption = 'Password'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
  end
  object sbLogin: TStatusBar
    Left = 0
    Top = 133
    Width = 344
    Height = 19
    Anchors = [akLeft, akTop, akRight, akBottom]
    Panels = <
      item
        Alignment = taCenter
        Text = '16-07-1981'
        Width = 60
      end
      item
        Alignment = taCenter
        Text = '10:52:23'
        Width = 50
      end
      item
        Alignment = taCenter
        Text = 'POS Code: 99'
        Width = 73
      end
      item
        Text = 'Shift:'
        Width = 50
      end>
    ExplicitWidth = 239
  end
  object edCashierID: TcxTextEdit
    Left = 3
    Top = 24
    Anchors = [akLeft, akTop, akRight]
    ParentFont = False
    StyleFocused.Color = clYellow
    TabOrder = 1
    OnKeyDown = edCashierIDKeyDown
    ExplicitWidth = 226
    Width = 331
  end
  object edNama: TcxTextEdit
    Left = 3
    Top = 51
    Anchors = [akLeft, akTop, akRight]
    Enabled = False
    ParentFont = False
    TabOrder = 2
    ExplicitWidth = 226
    Width = 331
  end
  object edPassword: TcxTextEdit
    Left = 2
    Top = 102
    Anchors = [akLeft, akTop, akRight]
    ParentFont = False
    StyleFocused.Color = clYellow
    TabOrder = 3
    OnKeyDown = edPasswordKeyDown
    ExplicitWidth = 226
    Width = 331
  end
  object tmrLogin: TTimer
    OnTimer = tmrLoginTimer
    Left = 117
    Top = 81
  end
end
