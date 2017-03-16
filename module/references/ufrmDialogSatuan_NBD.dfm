inherited frmDialogSatuan_NBD: TfrmDialogSatuan_NBD
  Left = 296
  Top = 258
  Caption = 'frmDialogSatuan_NBD'
  ClientHeight = 173
  ClientWidth = 373
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 389
  ExplicitHeight = 212
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 373
    Height = 117
    ExplicitWidth = 375
    ExplicitHeight = 143
    object lbl1: TLabel
      Left = 48
      Top = 27
      Width = 25
      Height = 16
      Alignment = taRightJustify
      Caption = 'Code'
    end
    object Lbl2: TLabel
      Left = 46
      Top = 55
      Width = 27
      Height = 16
      Alignment = taRightJustify
      Caption = 'Name'
    end
    object edtCode: TEdit
      Left = 86
      Top = 25
      Width = 113
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 4
      ParentCtl3D = False
      TabOrder = 0
    end
    object edtName: TEdit
      Left = 86
      Top = 55
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
    Top = 117
    Width = 373
    ExplicitTop = 143
    ExplicitWidth = 375
    inherited pnlFooter: TPanel
      Width = 373
      ExplicitWidth = 375
      inherited btnClose: TcxButton
        Left = 291
        ExplicitLeft = 293
      end
      inherited btnSave: TcxButton
        Left = 204
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 206
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
    end
    inherited pnlSortCut: TPanel
      Width = 373
      ExplicitWidth = 375
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
