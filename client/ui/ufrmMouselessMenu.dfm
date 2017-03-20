object frmMouselesMenu: TfrmMouselesMenu
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmMouselesMenu'
  ClientHeight = 420
  ClientWidth = 600
  Color = clSilver
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 600
    Height = 50
    Align = alTop
    TabOrder = 0
    object lblCaption: TLabel
      AlignWithMargins = True
      Left = 11
      Top = 11
      Width = 63
      Height = 35
      Margins.Left = 10
      Margins.Top = 10
      Align = alLeft
      Caption = 'lblCaption'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitHeight = 18
    end
  end
  object pnlBot: TPanel
    Left = 0
    Top = 375
    Width = 600
    Height = 45
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 360
    object lbCTRLDel: TLabel
      AlignWithMargins = True
      Left = 453
      Top = 11
      Width = 77
      Height = 30
      Margins.Left = 10
      Margins.Top = 10
      Align = alRight
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Pilihan >>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 392
    end
    object Label1: TLabel
      AlignWithMargins = True
      Left = 11
      Top = 11
      Width = 85
      Height = 30
      Margins.Left = 10
      Margins.Top = 10
      Align = alLeft
      Caption = 'Escape (Keluar)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ExplicitHeight = 18
    end
    object edtPilihan: TEdit
      AlignWithMargins = True
      Left = 536
      Top = 4
      Width = 60
      Height = 37
      Align = alRight
      Alignment = taRightJustify
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelWidth = 5
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      NumbersOnly = True
      ParentFont = False
      TabOrder = 0
      Text = '0'
      OnKeyDown = edtPilihanKeyDown
      OnKeyPress = edtPilihanKeyPress
      ExplicitHeight = 26
    end
  end
  object pnlBody: TPanel
    AlignWithMargins = True
    Left = 10
    Top = 53
    Width = 580
    Height = 319
    Margins.Left = 10
    Margins.Right = 10
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitLeft = 48
    ExplicitTop = 112
    ExplicitWidth = 185
    ExplicitHeight = 41
  end
end
