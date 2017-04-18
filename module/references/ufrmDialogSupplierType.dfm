inherited frmDialogSupplierType: TfrmDialogSupplierType
  Left = 301
  Top = 192
  Caption = 'frmDialogSupplierType'
  ClientHeight = 327
  ClientWidth = 563
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 579
  ExplicitHeight = 366
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 563
    Height = 271
    ExplicitWidth = 563
    ExplicitHeight = 271
    object lbl1: TLabel
      Left = 32
      Top = 41
      Width = 27
      Height = 16
      Caption = 'Name'
      FocusControl = edtName
    end
    object lbl2: TLabel
      Left = 34
      Top = 14
      Width = 25
      Height = 16
      Caption = 'Code'
      FocusControl = edtCode
    end
    object edtName: TEdit
      Tag = 1
      Left = 72
      Top = 41
      Width = 257
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 128
      ParentCtl3D = False
      TabOrder = 1
    end
    object edtCode: TEdit
      Tag = 1
      Left = 72
      Top = 13
      Width = 79
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 4
      ParentCtl3D = False
      TabOrder = 0
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 271
    Width = 563
    ExplicitTop = 271
    ExplicitWidth = 563
    inherited pnlFooter: TPanel
      Width = 563
      ExplicitWidth = 563
      inherited btnClose: TcxButton
        Left = 486
        Action = actCancel
        ExplicitLeft = 486
      end
      inherited btnSave: TcxButton
        Left = 393
        Action = actSave
        ExplicitLeft = 393
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 316
        ExplicitLeft = 316
      end
    end
    inherited pnlSortCut: TPanel
      Width = 563
      ExplicitWidth = 563
      inherited lbCTRLEnter: TLabel
        Left = 473
        Height = 15
        ExplicitLeft = 473
      end
      inherited lbEscape: TLabel
        Left = 388
        Height = 15
        ExplicitLeft = 388
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 312
        ExplicitLeft = 312
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 112
    Top = 104
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
end
