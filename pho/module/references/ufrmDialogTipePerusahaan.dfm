inherited frmDialogTipePerusahaan: TfrmDialogTipePerusahaan
  Left = 278
  Top = 233
  Caption = 'frmDialogTipePerusahaan'
  ClientHeight = 141
  ClientWidth = 368
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 384
  ExplicitHeight = 180
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 368
    Height = 85
    ExplicitWidth = 368
    ExplicitHeight = 85
    object lbl1: TLabel
      Left = 44
      Top = 15
      Width = 25
      Height = 16
      Alignment = taRightJustify
      Caption = 'Code'
    end
    object Lbl2: TLabel
      Left = 42
      Top = 42
      Width = 27
      Height = 16
      Alignment = taRightJustify
      Caption = 'Name'
    end
    object edtCode: TEdit
      Left = 80
      Top = 14
      Width = 82
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 4
      ParentCtl3D = False
      TabOrder = 0
    end
    object edtName: TEdit
      Left = 80
      Top = 42
      Width = 265
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 128
      ParentCtl3D = False
      TabOrder = 1
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 85
    Width = 368
    ExplicitTop = 85
    ExplicitWidth = 368
    inherited pnlFooter: TPanel
      Width = 368
      ExplicitWidth = 368
      inherited btnClose: TcxButton
        Left = 286
        ExplicitLeft = 286
      end
      inherited btnSave: TcxButton
        Left = 199
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 199
      end
      inherited btnDelete: TcxButton
        Top = 4
        OnClick = btnDeleteClick
        ExplicitTop = 4
      end
    end
    inherited pnlSortCut: TPanel
      Width = 368
      ExplicitWidth = 368
      inherited lbl4: TLabel
        Left = 183
        ExplicitLeft = 185
      end
      inherited lbl5: TLabel
        Left = 278
        ExplicitLeft = 280
      end
    end
  end
end
