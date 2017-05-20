inherited frmDialogDaftarKompetitor: TfrmDialogDaftarKompetitor
  Left = 372
  Top = 292
  Caption = 'Update Data Kompetitor'
  ClientHeight = 161
  ClientWidth = 384
  Constraints.MinHeight = 32
  OldCreateOrder = True
  OnDestroy = FormDestroy
  ExplicitWidth = 400
  ExplicitHeight = 200
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 384
    Height = 105
    ExplicitWidth = 367
    ExplicitHeight = 92
    object lbl1: TLabel
      Left = 13
      Top = 35
      Width = 87
      Height = 16
      Alignment = taRightJustify
      Caption = 'Competitor Name'
    end
    object lbl2: TLabel
      Left = 13
      Top = 9
      Width = 85
      Height = 16
      Caption = 'Competitor Code'
    end
    object edtCompCode: TEdit
      Left = 113
      Top = 7
      Width = 73
      Height = 22
      Ctl3D = False
      MaxLength = 8
      ParentCtl3D = False
      TabOrder = 0
    end
    object edtNama: TEdit
      Left = 113
      Top = 33
      Width = 248
      Height = 22
      Ctl3D = False
      MaxLength = 64
      ParentCtl3D = False
      TabOrder = 1
    end
    object chkIsActive: TCheckBox
      Left = 113
      Top = 61
      Width = 66
      Height = 17
      Caption = 'is Active'
      TabOrder = 2
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 105
    Width = 384
    ExplicitTop = 92
    ExplicitWidth = 367
    inherited pnlFooter: TPanel
      Width = 384
      ExplicitWidth = 367
      inherited btnClose: TcxButton
        Left = 307
        Action = actCancel
        ExplicitLeft = 290
      end
      inherited btnSave: TcxButton
        Left = 214
        Action = actSave
        ExplicitLeft = 197
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 137
        ExplicitLeft = 120
      end
    end
    inherited pnlSortCut: TPanel
      Width = 384
      ExplicitWidth = 367
      inherited lbCTRLEnter: TLabel
        Left = 209
        ExplicitLeft = 192
      end
      inherited lbEscape: TLabel
        Left = 300
        ExplicitLeft = 283
      end
      inherited lblCTRLP: TLabel
        Left = 133
        ExplicitLeft = 116
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 192
    Top = 40
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
end
