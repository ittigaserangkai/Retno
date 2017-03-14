object frmMasterDialog: TfrmMasterDialog
  Left = 561
  Top = 158
  Caption = 'Form Master Dialog'
  ClientHeight = 332
  ClientWidth = 554
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
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 16
  object pnlBody: TPanel
    Left = 0
    Top = 0
    Width = 554
    Height = 276
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 15198183
    TabOrder = 0
  end
  inline footerDialogMaster: TfraFooterDialog3Button
    Left = 0
    Top = 276
    Width = 554
    Height = 56
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ExplicitTop = 276
    ExplicitWidth = 554
    inherited pnlFooter: TPanel
      Width = 554
      ExplicitWidth = 554
      inherited btnClose: TcxButton
        Left = 477
        Cancel = False
        ModalResult = 2
        DragKind = dkDock
        ExplicitLeft = 477
      end
      inherited btnSave: TcxButton
        Left = 384
        ExplicitLeft = 384
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
    end
    inherited pnlSortCut: TPanel
      Width = 554
      ExplicitWidth = 554
      inherited lbCTRLEnter: TLabel
        Left = 379
        ExplicitLeft = 379
      end
      inherited lbEscape: TLabel
        Left = 470
        ExplicitLeft = 470
      end
    end
  end
  object actlstMasterDialog: TActionList
    Left = 512
    Top = 48
    object actDelete: TAction
      Caption = 'Delete'
      ShortCut = 16430
    end
    object actSave: TAction
      Caption = 'Save'
    end
    object actCancel: TAction
      Caption = 'actCancel'
      OnExecute = actCancelExecute
    end
  end
end
