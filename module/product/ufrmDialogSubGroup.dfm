inherited frmDialogSubGroup: TfrmDialogSubGroup
  Caption = 'Update Data Sub Group'
  ClientHeight = 239
  ClientWidth = 507
  ExplicitWidth = 523
  ExplicitHeight = 278
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 507
    Height = 183
    object lbDivision: TLabel
      Left = 32
      Top = 45
      Width = 76
      Height = 16
      Alignment = taRightJustify
      Caption = 'Merchan Group'
    end
    object lbKode: TLabel
      Left = 51
      Top = 71
      Width = 57
      Height = 16
      Alignment = taRightJustify
      Caption = 'Kode Group'
    end
    object lbNama: TLabel
      Left = 28
      Top = 98
      Width = 80
      Height = 16
      Alignment = taRightJustify
      Caption = 'Nama Sub Group'
    end
    object cxLookupMerGroup: TcxExtLookupComboBox
      Left = 115
      Top = 42
      Hint = 'Klik F5 untuk membuat Master Baru'
      ParentShowHint = False
      Properties.CharCase = ecUpperCase
      Properties.ImmediatePost = True
      Properties.ValidateOnEnter = False
      ShowHint = True
      TabOrder = 0
      Width = 222
    end
    object edtCode: TEdit
      Left = 116
      Top = 69
      Width = 69
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 4
      ParentCtl3D = False
      TabOrder = 1
    end
    object edtName: TEdit
      Left = 116
      Top = 96
      Width = 317
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 128
      ParentCtl3D = False
      TabOrder = 2
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 183
    Width = 507
    inherited pnlFooter: TPanel
      Width = 507
      inherited btnClose: TcxButton
        Left = 430
        Action = actCancel
      end
      inherited btnSave: TcxButton
        Left = 337
        Action = actSave
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
    end
    inherited pnlSortCut: TPanel
      Width = 507
      inherited lbCTRLEnter: TLabel
        Left = 332
        Height = 15
      end
      inherited lbEscape: TLabel
        Left = 423
        Height = 15
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 400
    Top = 40
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
end
