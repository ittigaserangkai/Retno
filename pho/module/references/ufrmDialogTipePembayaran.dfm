inherited frmDialogTipePembayaran: TfrmDialogTipePembayaran
  Left = 241
  Top = 178
  Caption = 'frmDialogTipePembayaran'
  ClientHeight = 354
  ClientWidth = 667
  Constraints.MinHeight = 32
  Constraints.MinWidth = 130
  OldCreateOrder = True
  ExplicitWidth = 683
  ExplicitHeight = 393
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 667
    Height = 298
    ExplicitTop = -1
    ExplicitWidth = 667
    ExplicitHeight = 298
    object lbl1: TLabel
      Left = 40
      Top = 13
      Width = 25
      Height = 16
      Caption = 'Code'
    end
    object lbl2: TLabel
      Left = 40
      Top = 38
      Width = 23
      Height = 16
      Caption = 'Type'
    end
    object edtKodeTipePembayaran: TEdit
      Left = 74
      Top = 14
      Width = 86
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 4
      ParentCtl3D = False
      TabOrder = 0
    end
    object edtTipePembayaran: TEdit
      Left = 74
      Top = 41
      Width = 247
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 16
      ParentCtl3D = False
      TabOrder = 1
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 298
    Width = 667
    ExplicitTop = 82
    ExplicitWidth = 353
    inherited pnlFooter: TPanel
      Width = 667
      ExplicitWidth = 353
      inherited btnClose: TcxButton
        Left = 590
        ExplicitLeft = 276
      end
      inherited btnSave: TcxButton
        Left = 497
        Action = nil
        OptionsImage.ImageIndex = 32
        ExplicitLeft = 183
      end
      inherited btnDelete: TcxButton
        Action = nil
      end
    end
    inherited pnlSortCut: TPanel
      Width = 667
      ExplicitWidth = 353
      inherited lbCTRLEnter: TLabel
        Left = 492
      end
      inherited lbEscape: TLabel
        Left = 583
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
