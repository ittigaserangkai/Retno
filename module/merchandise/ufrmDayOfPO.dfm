object frmDayofPO: TfrmDayofPO
  Left = 435
  Top = 174
  AlphaBlend = True
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Day of process PO'
  ClientHeight = 188
  ClientWidth = 201
  Color = clBtnFace
  Constraints.MinHeight = 32
  Constraints.MinWidth = 130
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Trebuchet MS'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object pnlBody: TPanel
    Left = 0
    Top = 0
    Width = 201
    Height = 165
    Align = alClient
    BevelOuter = bvNone
    Color = 15198183
    TabOrder = 0
    ExplicitTop = 29
    ExplicitHeight = 160
    object pnlHeader: TPanel
      Left = 0
      Top = 0
      Width = 201
      Height = 32
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'Day Of Process PO'
      Color = 13284267
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object chksun: TCheckBox
      Left = 67
      Top = 35
      Width = 87
      Height = 17
      Cursor = crHandPoint
      Caption = 'Sunday'
      TabOrder = 1
    end
    object chkmon: TCheckBox
      Left = 67
      Top = 54
      Width = 87
      Height = 17
      Cursor = crHandPoint
      Caption = 'Monday'
      TabOrder = 2
    end
    object chktue: TCheckBox
      Left = 67
      Top = 71
      Width = 87
      Height = 17
      Cursor = crHandPoint
      Caption = 'Tuesday'
      TabOrder = 3
    end
    object chkwed: TCheckBox
      Left = 67
      Top = 88
      Width = 87
      Height = 17
      Cursor = crHandPoint
      Caption = 'Wednesday'
      TabOrder = 4
    end
    object chkthu: TCheckBox
      Left = 67
      Top = 105
      Width = 87
      Height = 17
      Cursor = crHandPoint
      Caption = 'Thursday'
      TabOrder = 5
    end
    object chkfri: TCheckBox
      Left = 67
      Top = 123
      Width = 87
      Height = 17
      Cursor = crHandPoint
      Caption = 'Friday'
      TabOrder = 6
    end
    object chksat: TCheckBox
      Left = 67
      Top = 141
      Width = 87
      Height = 17
      Cursor = crHandPoint
      Caption = 'Saturday'
      TabOrder = 7
    end
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 165
    Width = 201
    Height = 23
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 15198183
    TabOrder = 1
    ExplicitTop = 189
    object lbl8: TLabel
      Left = 120
      Top = 3
      Width = 74
      Height = 16
      Caption = '[Enter on Exit]'
    end
  end
end
