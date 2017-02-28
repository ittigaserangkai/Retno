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
    ExplicitTop = 0
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
  inherited footerDialogMaster: TfraFooterDialog2Button
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
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 180
      end
    end
    inherited pnlSortCut: TPanel
      Width = 347
      ExplicitWidth = 349
      inherited lbl4: TLabel
        Left = 163
        ExplicitLeft = 165
      end
      inherited lbl5: TLabel
        Left = 257
        ExplicitLeft = 259
      end
    end
  end
end
