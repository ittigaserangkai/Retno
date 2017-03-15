inherited frmDialogMerchandiseGroup: TfrmDialogMerchandiseGroup
  Caption = 'Update Merchandise Group'
  ClientHeight = 232
  ClientWidth = 458
  ExplicitWidth = 474
  ExplicitHeight = 271
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 458
    Height = 176
    ExplicitWidth = 458
    ExplicitHeight = 176
    object lbKode: TLabel
      Left = 33
      Top = 71
      Width = 51
      Height = 16
      Alignment = taRightJustify
      Caption = 'Kode Grup'
    end
    object lbNama: TLabel
      Left = 30
      Top = 98
      Width = 54
      Height = 16
      Alignment = taRightJustify
      Caption = 'Nama Grup'
    end
    object lbDivision: TLabel
      Left = 22
      Top = 45
      Width = 63
      Height = 16
      Caption = 'Merchandise'
    end
    object edtCode: TEdit
      Left = 92
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
      Left = 92
      Top = 96
      Width = 317
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 128
      ParentCtl3D = False
      TabOrder = 2
    end
    object cxLookupMerchan: TcxExtLookupComboBox
      Left = 91
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
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 176
    Width = 458
    ExplicitTop = 176
    ExplicitWidth = 458
    inherited pnlFooter: TPanel
      Width = 458
      ExplicitWidth = 458
      inherited btnClose: TcxButton
        Left = 381
        Action = actCancel
        ExplicitLeft = 381
      end
      inherited btnSave: TcxButton
        Left = 288
        Action = actSave
        ExplicitLeft = 288
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
    end
    inherited pnlSortCut: TPanel
      Width = 458
      ExplicitWidth = 458
      inherited lbCTRLEnter: TLabel
        Left = 283
        Height = 15
        ExplicitLeft = 283
      end
      inherited lbEscape: TLabel
        Left = 374
        Height = 15
        ExplicitLeft = 374
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 384
    Top = 16
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
end
