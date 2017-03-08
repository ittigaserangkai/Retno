inherited frmDialogTipePembayaran: TfrmDialogTipePembayaran
  Left = 241
  Top = 178
  Caption = 'frmDialogTipePembayaran'
  ClientHeight = 138
  ClientWidth = 353
  Constraints.MinHeight = 32
  Constraints.MinWidth = 130
  OldCreateOrder = True
  ExplicitWidth = 369
  ExplicitHeight = 177
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 353
    Height = 82
    ExplicitWidth = 353
    ExplicitHeight = 82
    object lbl1: TLabel
      Left = 40
      Top = 13
      Width = 25
      Height = 16
      Caption = 'Code'
    end
    object lbl2: TLabel
      Left = 40
      Top = 38
      Width = 23
      Height = 16
      Caption = 'Type'
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
    Top = 82
    Width = 353
    ExplicitTop = 82
    ExplicitWidth = 353
    inherited pnlFooter: TPanel
      Width = 353
      ExplicitWidth = 353
      inherited btnClose: TcxButton
        Left = 271
        ExplicitLeft = 271
      end
      inherited btnSave: TcxButton
        Left = 184
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 184
      end
    end
    inherited pnlSortCut: TPanel
      Width = 353
      ExplicitWidth = 353
      inherited lbl4: TLabel
        Left = 169
        ExplicitLeft = 171
      end
      inherited lbl5: TLabel
        Left = 263
        ExplicitLeft = 265
      end
    end
  end
end
