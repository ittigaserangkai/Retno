inherited frmDialogCompany: TfrmDialogCompany
  Caption = 'frmDialogCompany'
  ClientHeight = 181
  ClientWidth = 386
  ExplicitWidth = 402
  ExplicitHeight = 220
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 386
    Height = 125
    ExplicitWidth = 386
    ExplicitHeight = 125
    object lblCode: TLabel
      Left = 16
      Top = 16
      Width = 25
      Height = 16
      Alignment = taRightJustify
      Caption = 'Code'
    end
    object lblLblName: TLabel
      Left = 14
      Top = 44
      Width = 27
      Height = 16
      Alignment = taRightJustify
      Caption = 'Name'
    end
    object edtCode: TEdit
      Left = 54
      Top = 14
      Width = 113
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 4
      ParentCtl3D = False
      TabOrder = 0
    end
    object edtName: TEdit
      Left = 54
      Top = 44
      Width = 267
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 16
      ParentCtl3D = False
      TabOrder = 1
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 125
    Width = 386
    ExplicitTop = 125
    ExplicitWidth = 386
    inherited pnlFooter: TPanel
      Width = 386
      ExplicitWidth = 386
      inherited btnClose: TcxButton
        Left = 309
        Action = actCancel
        ExplicitLeft = 309
      end
      inherited btnSave: TcxButton
        Left = 216
        Action = actSave
        ExplicitLeft = 216
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 139
      end
    end
    inherited pnlSortCut: TPanel
      Width = 386
      ExplicitWidth = 386
      inherited lbCTRLEnter: TLabel
        Left = 211
        Height = 15
        ExplicitLeft = 211
      end
      inherited lbEscape: TLabel
        Left = 302
        Height = 15
        ExplicitLeft = 302
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 135
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 464
    Top = 24
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
