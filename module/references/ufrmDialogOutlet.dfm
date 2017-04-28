inherited frmDialogOutlet: TfrmDialogOutlet
  Left = 392
  Top = 270
  Anchors = [akLeft]
  Caption = 'uNewSalesOutletuNewSalesOutlet'
  ClientHeight = 342
  ClientWidth = 651
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 667
  ExplicitHeight = 381
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 651
    Height = 286
    ExplicitWidth = 651
    ExplicitHeight = 286
    object lbl1: TLabel
      Left = 44
      Top = 13
      Width = 25
      Height = 16
      Caption = 'Code'
    end
    object Label1: TLabel
      Left = 42
      Top = 40
      Width = 27
      Height = 16
      Caption = 'Name'
    end
    object Label2: TLabel
      Left = 42
      Top = 68
      Width = 58
      Height = 16
      Caption = 'Description'
    end
    object edtCode: TEdit
      Tag = 1
      Left = 111
      Top = 11
      Width = 83
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 4
      ParentCtl3D = False
      TabOrder = 0
    end
    object edtName: TEdit
      Tag = 1
      Left = 111
      Top = 38
      Width = 227
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 128
      ParentCtl3D = False
      TabOrder = 1
    end
    object edtDescription: TEdit
      Left = 111
      Top = 66
      Width = 227
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 128
      ParentCtl3D = False
      TabOrder = 2
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 286
    Width = 651
    ExplicitTop = 286
    ExplicitWidth = 651
    inherited pnlFooter: TPanel
      Width = 651
      ExplicitWidth = 651
      inherited btnClose: TcxButton
        Left = 574
        Action = actCancel
        ExplicitLeft = 574
      end
      inherited btnSave: TcxButton
        Left = 481
        Action = actSave
        ExplicitLeft = 481
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 404
        ExplicitLeft = 404
      end
    end
    inherited pnlSortCut: TPanel
      Width = 651
      inherited lbCTRLEnter: TLabel
        Left = 476
        ExplicitLeft = 561
      end
      inherited lbEscape: TLabel
        Left = 567
        ExplicitLeft = 588
        ExplicitTop = 7
        ExplicitHeight = 15
      end
      inherited lblCTRLP: TLabel
        Left = 400
        ExplicitLeft = 400
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
    inherited actCancel: TAction
      Caption = 'Cancel'
    end
  end
end
