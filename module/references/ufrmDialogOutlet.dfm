inherited frmDialogOutlet: TfrmDialogOutlet
  Left = 392
  Top = 270
  Caption = 'uNewSalesOutletuNewSalesOutlet'
  ClientHeight = 162
  ClientWidth = 395
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 411
  ExplicitHeight = 201
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 395
    Height = 106
    ExplicitWidth = 395
    ExplicitHeight = 106
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
    Top = 106
    Width = 395
    ExplicitTop = 106
    ExplicitWidth = 395
    inherited pnlFooter: TPanel
      Width = 395
      ExplicitWidth = 395
      inherited btnClose: TcxButton
        Left = 318
        Action = actCancel
        ExplicitLeft = 318
      end
      inherited btnSave: TcxButton
        Left = 225
        Action = actSave
        ExplicitLeft = 225
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
    end
    inherited pnlSortCut: TPanel
      Width = 395
      ExplicitWidth = 395
      inherited lbCTRLEnter: TLabel
        Left = 305
        Height = 15
        ExplicitLeft = 305
      end
      inherited lbEscape: TLabel
        Left = 220
        Height = 15
        ExplicitLeft = 220
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
