object frmMasterDialog: TfrmMasterDialog
  Left = 561
  Top = 158
  Caption = 'Form Master Dialog'
  ClientHeight = 288
  ClientWidth = 566
  Color = clWindow
  Constraints.MinHeight = 33
  Constraints.MinWidth = 270
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Trebuchet MS'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
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
    Width = 566
    Height = 232
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 15198183
    TabOrder = 0
    ExplicitTop = 30
    ExplicitWidth = 568
    ExplicitHeight = 228
  end
  inline footerDialogMaster: TfraFooterDialog2Button
    Left = 0
    Top = 232
    Width = 566
    Height = 56
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ExplicitTop = 258
    ExplicitWidth = 568
    inherited pnlFooter: TPanel
      Width = 566
      ExplicitWidth = 568
      inherited btnClose: TcxButton
        Left = 484
        Cancel = False
        ExplicitLeft = 486
      end
      inherited btnSave: TcxButton
        Left = 357
        Default = False
        ExplicitLeft = 359
      end
    end
    inherited pnlSortCut: TPanel
      Width = 566
      ExplicitWidth = 568
      inherited lbl4: TLabel
        Left = 353
        ExplicitLeft = 355
      end
      inherited lbl5: TLabel
        Left = 454
        ExplicitLeft = 456
      end
    end
  end
end
