inherited frmDialogMerchandise: TfrmDialogMerchandise
  Caption = 'Update Data Merchandise'
  ClientHeight = 198
  ClientWidth = 465
  ExplicitWidth = 481
  ExplicitHeight = 237
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 465
    Height = 142
    ExplicitWidth = 465
    ExplicitHeight = 142
    object lbKode: TLabel
      Left = 49
      Top = 29
      Width = 24
      Height = 16
      Alignment = taRightJustify
      Caption = 'Kode'
    end
    object lbNama: TLabel
      Left = 17
      Top = 57
      Width = 56
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Nama'
    end
    object edtCode: TEdit
      Left = 84
      Top = 28
      Width = 69
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 4
      ParentCtl3D = False
      TabOrder = 0
    end
    object edtName: TEdit
      Left = 84
      Top = 56
      Width = 317
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 128
      ParentCtl3D = False
      TabOrder = 1
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 142
    Width = 465
    ExplicitTop = 142
    ExplicitWidth = 465
    inherited pnlFooter: TPanel
      Width = 465
      ExplicitWidth = 465
      inherited btnClose: TcxButton
        Left = 388
        Action = actCancel
        ExplicitLeft = 388
      end
      inherited btnSave: TcxButton
        Left = 295
        Action = actSave
        ExplicitLeft = 295
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
    end
    inherited pnlSortCut: TPanel
      Width = 465
      ExplicitWidth = 465
      inherited lbCTRLEnter: TLabel
        Left = 290
        ExplicitLeft = 290
      end
      inherited lbEscape: TLabel
        Left = 381
        ExplicitLeft = 381
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 328
    Top = 88
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
end
