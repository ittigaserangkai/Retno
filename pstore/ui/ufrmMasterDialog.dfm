object frmMasterDialog: TfrmMasterDialog
  Left = 230
  Top = 169
  Caption = 'Form Master Dialog'
  ClientHeight = 288
  ClientWidth = 566
  Color = clBtnFace
  Constraints.MinHeight = 33
  Constraints.MinWidth = 270
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
  OnDestroy = FormDestroy
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 16
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
    TabOrder = 0
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
        Left = 397
        Default = False
        ExplicitLeft = 399
      end
    end
    inherited pnlSortCut: TPanel
      Width = 566
      ExplicitWidth = 568
      inherited lbl4: TLabel
        Left = 381
        Width = 91
        Caption = 'Ctrl - Enter [Save]'
        ExplicitLeft = 383
        ExplicitWidth = 91
      end
      inherited lbl5: TLabel
        Left = 476
        ExplicitLeft = 478
      end
    end
  end
  object pnlBody: TPanel
    Left = 0
    Top = 0
    Width = 566
    Height = 232
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = 'pnlBody'
    Color = 15198183
    TabOrder = 1
    ExplicitTop = 30
    ExplicitWidth = 568
    ExplicitHeight = 228
  end
end
