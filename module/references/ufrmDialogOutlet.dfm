inherited frmDialogOutlet: TfrmDialogOutlet
  Left = 392
  Top = 270
  Caption = 'uNewSalesOutletuNewSalesOutlet'
  ClientHeight = 133
  ClientWidth = 326
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 342
  ExplicitHeight = 172
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 326
    Height = 77
    ExplicitWidth = 326
    ExplicitHeight = 77
    object lbl1: TLabel
      Left = 44
      Top = 12
      Width = 25
      Height = 16
      Caption = 'Code'
    end
    object Label1: TLabel
      Left = 42
      Top = 39
      Width = 27
      Height = 16
      Caption = 'Name'
    end
    object edtCode: TEdit
      Left = 86
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
      Left = 86
      Top = 38
      Width = 227
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 128
      ParentCtl3D = False
      TabOrder = 1
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 77
    Width = 326
    ExplicitTop = 77
    ExplicitWidth = 326
    inherited pnlFooter: TPanel
      Width = 326
      ExplicitWidth = 326
      inherited btnClose: TcxButton
        Left = 249
        Action = actCancel
        ExplicitLeft = 249
      end
      inherited btnSave: TcxButton
        Left = 156
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 156
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
    end
    inherited pnlSortCut: TPanel
      Width = 326
      ExplicitWidth = 326
      inherited lbCTRLEnter: TLabel
        Left = 236
        Height = 15
        ExplicitLeft = 236
      end
      inherited lbEscape: TLabel
        Left = 151
        Height = 15
        ExplicitLeft = 151
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
    end
  end
end
