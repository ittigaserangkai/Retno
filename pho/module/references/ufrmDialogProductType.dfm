inherited frmDialogProductType: TfrmDialogProductType
  Left = 281
  Top = 215
  Caption = 'frmDialogProductType'
  ClientHeight = 137
  ClientWidth = 396
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 412
  ExplicitHeight = 176
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 396
    Height = 81
    ExplicitWidth = 396
    ExplicitHeight = 81
    object lbl1: TLabel
      Left = 42
      Top = 14
      Width = 33
      Height = 16
      AutoSize = False
      Caption = 'Code'
    end
    object lbl2: TLabel
      Left = 42
      Top = 41
      Width = 33
      Height = 16
      AutoSize = False
      Caption = 'Name'
    end
    object edtCode: TEdit
      Left = 84
      Top = 13
      Width = 73
      Height = 22
      Ctl3D = False
      MaxLength = 4
      ParentCtl3D = False
      TabOrder = 0
    end
    object edtName: TEdit
      Left = 84
      Top = 40
      Width = 277
      Height = 22
      Ctl3D = False
      MaxLength = 20
      ParentCtl3D = False
      TabOrder = 1
    end
  end
  inherited footerDialogMaster: TfraFooterDialog2Button
    Top = 81
    Width = 396
    ExplicitTop = 81
    ExplicitWidth = 396
    inherited pnlFooter: TPanel
      Width = 396
      ExplicitWidth = 396
      inherited btnClose: TcxButton
        Left = 314
        ExplicitLeft = 314
      end
      inherited btnSave: TcxButton
        Left = 227
        OnClick = btnSaveClick
        ExplicitLeft = 227
      end
    end
    inherited pnlSortCut: TPanel
      Width = 396
      ExplicitWidth = 396
      inherited lbl4: TLabel
        Left = 212
        ExplicitLeft = 214
      end
      inherited lbl5: TLabel
        Left = 306
        ExplicitLeft = 308
      end
    end
  end
end
