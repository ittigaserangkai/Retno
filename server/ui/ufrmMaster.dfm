object frmMaster: TfrmMaster
  Left = 403
  Top = 353
  Caption = 'Form Master'
  ClientHeight = 312
  ClientWidth = 529
  Color = clBtnFace
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
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object pnlBody: TPanel
    Left = 0
    Top = 30
    Width = 529
    Height = 282
    Align = alClient
    BevelOuter = bvLowered
    BorderWidth = 10
    Caption = 'pnlBody'
    Color = 15198183
    TabOrder = 0
  end
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 529
    Height = 30
    Align = alTop
    BevelOuter = bvLowered
    Color = 14079702
    TabOrder = 1
    object lblHeader: TLabel
      Left = 8
      Top = 7
      Width = 178
      Height = 13
      Caption = 'LABEL HEADER GOES HERE..'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
end
