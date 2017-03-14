inherited frmDialogSupplierType: TfrmDialogSupplierType
  Left = 301
  Top = 192
  Caption = 'frmDialogSupplierType'
  ClientHeight = 162
  ClientWidth = 347
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 347
    Height = 106
    ExplicitWidth = 347
    ExplicitHeight = 106
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
      Left = 72
      Top = 14
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
    Top = 106
    Width = 347
    ExplicitTop = 106
    ExplicitWidth = 347
    inherited pnlFooter: TPanel
      Width = 347
      ExplicitWidth = 347
      inherited btnClose: TcxButton
        Left = 265
        ExplicitLeft = 265
      end
      inherited btnSave: TcxButton
        Left = 178
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 178
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
    end
    inherited pnlSortCut: TPanel
      Width = 347
      ExplicitWidth = 347
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
