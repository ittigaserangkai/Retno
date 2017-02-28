object frmMaster: TfrmMaster
  Left = 368
  Top = 149
  Caption = 'Form Master'
  ClientHeight = 333
  ClientWidth = 534
  Color = clWindow
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Trebuchet MS'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object pnlBody: TPanel
    Left = 0
    Top = 30
    Width = 534
    Height = 303
    Align = alClient
    BevelOuter = bvLowered
    BorderWidth = 10
    Color = 15198183
    TabOrder = 1
  end
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 534
    Height = 30
    Align = alTop
    BevelOuter = bvLowered
    Color = 14079702
    TabOrder = 0
    object lblHeader: TLabel
      Left = 8
      Top = 7
      Width = 146
      Height = 14
      Caption = 'LABEL HEADER GOES HERE..'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
end
