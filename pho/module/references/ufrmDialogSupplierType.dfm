inherited frmDialogSupplierType: TfrmDialogSupplierType
  Left = 301
  Top = 192
  Caption = 'frmDialogSupplierType'
  ClientHeight = 162
  ClientWidth = 347
  Constraints.MinHeight = 32
  OldCreateOrder = True
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
  inherited footerDialogMaster: TfraFooterDialog2Button
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
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 178
      end
    end
    inherited pnlSortCut: TPanel
      Width = 347
      ExplicitWidth = 347
      inherited lbl4: TLabel
        Left = 163
        ExplicitLeft = 163
      end
      inherited lbl5: TLabel
        Left = 257
        ExplicitLeft = 257
      end
    end
  end
end
