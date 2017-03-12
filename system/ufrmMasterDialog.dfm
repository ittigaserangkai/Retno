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
        AlignWithMargins = True
        Left = 477
        Top = 4
        Margins.Top = 2
        Margins.Bottom = 2
        Align = alRight
        Cancel = False
        ModalResult = 2
        DragKind = dkDock
        ExplicitLeft = 477
        ExplicitTop = 4
      end
      inherited btnSave: TcxButton
        AlignWithMargins = True
        Left = 374
        Top = 4
        Margins.Top = 2
        Margins.Right = 20
        Margins.Bottom = 2
        Align = alRight
        Action = actSave
        Default = False
        DragKind = dkDock
        ExplicitLeft = 374
        ExplicitTop = 4
      end
      inherited btnDelete: TcxButton
        AlignWithMargins = True
        Left = 5
        Top = 4
        Margins.Top = 2
        Margins.Bottom = 2
        Align = alLeft
        Action = actDelete
        ExplicitLeft = 5
        ExplicitTop = 4
      end
    end
    inherited pnlSortCut: TPanel
      Width = 554
      ExplicitWidth = 554
      inherited lbl4: TLabel
        AlignWithMargins = True
        Left = 374
        Width = 91
        Height = 15
        Margins.Top = 1
        Margins.Right = 5
        Margins.Bottom = 1
        Align = alRight
        Caption = 'CTRL-Enter [Save]'
        ExplicitLeft = 374
        ExplicitWidth = 91
      end
      inherited lbl5: TLabel
        AlignWithMargins = True
        Left = 473
        Height = 15
        Margins.Top = 1
        Margins.Right = 0
        Margins.Bottom = 1
        Align = alRight
        ExplicitLeft = 473
      end
      inherited lbl3: TLabel
        AlignWithMargins = True
        Left = 5
        Height = 15
        Margins.Top = 1
        Margins.Bottom = 1
        Align = alLeft
        ExplicitLeft = 5
      end
    end
  end
  object actlstMasterDialog: TActionList
    Left = 480
    Top = 136
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
