inherited frmDialogKategori: TfrmDialogKategori
  Caption = 'Update Data Kategori'
  ClientHeight = 314
  ClientWidth = 557
  ExplicitWidth = 573
  ExplicitHeight = 353
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 557
    Height = 258
    object lbDivision: TLabel
      Left = 74
      Top = 61
      Width = 50
      Height = 16
      Alignment = taRightJustify
      Caption = 'Sub Group'
    end
    object lbKode: TLabel
      Left = 54
      Top = 88
      Width = 70
      Height = 16
      Alignment = taRightJustify
      Caption = 'Kode Kategori'
    end
    object lbNama: TLabel
      Left = 51
      Top = 114
      Width = 73
      Height = 16
      Alignment = taRightJustify
      Caption = 'Nama Kategori'
    end
    object cxLookupSubGroup: TcxExtLookupComboBox
      Left = 132
      Top = 58
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
      Left = 132
      Top = 86
      Width = 69
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 4
      ParentCtl3D = False
      TabOrder = 1
    end
    object edtName: TEdit
      Left = 132
      Top = 112
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
    Top = 258
    Width = 557
    inherited pnlFooter: TPanel
      Width = 557
      inherited btnClose: TcxButton
        Left = 480
        Action = actCancel
      end
      inherited btnSave: TcxButton
        Left = 387
        Action = actSave
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
    end
    inherited pnlSortCut: TPanel
      Width = 557
      inherited lbCTRLEnter: TLabel
        Left = 382
        Height = 15
      end
      inherited lbEscape: TLabel
        Left = 473
        Height = 15
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
end
