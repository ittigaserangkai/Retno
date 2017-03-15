inherited frmDialogTipePengirimanPO: TfrmDialogTipePengirimanPO
  Left = 223
  Top = 162
  Caption = 'frmDialogTipePengirimanPO'
  ClientHeight = 140
  ClientWidth = 347
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 363
  ExplicitHeight = 179
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 347
    Height = 84
    ExplicitWidth = 349
    ExplicitHeight = 110
    object lbl1: TLabel
      Left = 38
      Top = 10
      Width = 25
      Height = 16
      Caption = 'Code'
    end
    object lbl2: TLabel
      Left = 38
      Top = 38
      Width = 23
      Height = 16
      Caption = 'Type'
    end
    object edtKodeTipePengirimanPO: TEdit
      Left = 73
      Top = 12
      Width = 95
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 4
      ParentCtl3D = False
      TabOrder = 0
    end
    object edtTipePengirimanPO: TEdit
      Left = 73
      Top = 40
      Width = 248
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 16
      ParentCtl3D = False
      TabOrder = 1
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 84
    Width = 347
    ExplicitTop = 110
    ExplicitWidth = 349
    inherited pnlFooter: TPanel
      Width = 347
      ExplicitWidth = 349
      inherited btnClose: TcxButton
        Left = 265
        ExplicitLeft = 267
      end
      inherited btnSave: TcxButton
        Left = 178
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 180
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
    end
    inherited pnlSortCut: TPanel
      Width = 347
      ExplicitWidth = 349
      inherited lbCTRLEnter: TLabel
        Height = 16
        ExplicitHeight = 16
      end
      inherited lbEscape: TLabel
        Height = 16
      end
      inherited lbCTRLDel: TLabel
        Height = 16
        ExplicitHeight = 16
      end
    end
  end
end
