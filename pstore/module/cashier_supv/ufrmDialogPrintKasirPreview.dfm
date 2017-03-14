inherited frmDialogPrintKasirPreview: TfrmDialogPrintKasirPreview
  Left = 326
  Top = 149
  Caption = 'Print Preview'
  ClientHeight = 479
  ClientWidth = 408
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 424
  ExplicitHeight = 518
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 408
    Height = 423
    BorderWidth = 2
    ExplicitWidth = 410
    ExplicitHeight = 449
    object pnlTop: TPanel
      Left = 4
      Top = 4
      Width = 400
      Height = 380
      Align = alClient
      BevelOuter = bvLowered
      BorderWidth = 2
      Color = 15198183
      TabOrder = 0
      ExplicitWidth = 402
      ExplicitHeight = 406
      object mmoPrint: TMemo
        Left = 3
        Top = 3
        Width = 394
        Height = 374
        Align = alClient
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
        WordWrap = False
        ExplicitWidth = 396
        ExplicitHeight = 400
      end
    end
    object pnlBottom: TPanel
      Left = 4
      Top = 384
      Width = 400
      Height = 35
      Align = alBottom
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 1
      ExplicitTop = 410
      ExplicitWidth = 402
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 423
    Width = 408
    ExplicitTop = 449
    ExplicitWidth = 410
    inherited pnlFooter: TPanel
      Width = 408
      ExplicitWidth = 410
      inherited btnClose: TcxButton
        Left = 331
        ExplicitLeft = 333
      end
      inherited btnSave: TcxButton
        Left = 238
        Action = actSave
        Caption = 'Save File'
        ExplicitLeft = 240
      end
      inherited btnDelete: TcxButton
        Action = actDelete
        Caption = 'Print'
        OptionsImage.ImageIndex = 28
      end
    end
    inherited pnlSortCut: TPanel
      Width = 408
      ExplicitWidth = 410
      inherited lbCTRLEnter: TLabel
        Left = 233
        Height = 15
        Visible = False
        ExplicitLeft = 221
      end
      inherited lbEscape: TLabel
        Left = 324
        Height = 15
        ExplicitLeft = 315
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
end
