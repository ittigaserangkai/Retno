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
      Width = 24
      Height = 16
      Caption = 'Kode'
    end
    object lbl2: TLabel
      Left = 38
      Top = 43
      Width = 27
      Height = 16
      Caption = 'Nama'
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
    ExplicitTop = 298
    ExplicitWidth = 667
    inherited pnlFooter: TPanel
      Width = 667
      ExplicitWidth = 667
      inherited btnClose: TcxButton
        Left = 590
        Action = actCancel
        ExplicitLeft = 590
      end
      inherited btnSave: TcxButton
        Left = 497
        Action = nil
        OnClick = actSaveExecute
        ExplicitLeft = 497
        ExplicitTop = 5
      end
      inherited btnDelete: TcxButton
        Action = nil
      end
      inherited btnPrint: TcxButton
        Left = 420
        Action = actPrint
      end
    end
    inherited pnlSortCut: TPanel
      Width = 667
      ExplicitWidth = 667
      inherited lbCTRLEnter: TLabel
        Left = 492
        Height = 15
        ExplicitLeft = 492
      end
      inherited lbEscape: TLabel
        Left = 583
        Height = 15
        ExplicitLeft = 583
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 416
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
