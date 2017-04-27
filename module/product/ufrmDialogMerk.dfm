inherited frmDialogMerk: TfrmDialogMerk
  Caption = 'Update Data Merk'
  ClientHeight = 176
  ClientWidth = 475
  ExplicitWidth = 491
  ExplicitHeight = 215
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 475
    Height = 120
    ExplicitWidth = 475
    ExplicitHeight = 120
    object Label1: TLabel
      Left = 26
      Top = 37
      Width = 55
      Height = 16
      Alignment = taRightJustify
      Caption = 'Nama Merk'
    end
    object lbl1: TLabel
      Left = 25
      Top = 65
      Width = 56
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Deskripsi'
    end
    object edNama: TEdit
      Tag = 1
      Left = 92
      Top = 36
      Width = 317
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
    end
    object edDescription: TEdit
      Left = 92
      Top = 64
      Width = 317
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 120
    Width = 475
    ExplicitTop = 120
    ExplicitWidth = 475
    inherited pnlFooter: TPanel
      Width = 475
      ExplicitWidth = 475
      inherited btnClose: TcxButton
        Left = 398
        Action = actCancel
        ExplicitLeft = 398
      end
      inherited btnSave: TcxButton
        Left = 305
        Action = actSave
        ExplicitLeft = 305
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 228
        ExplicitLeft = 228
      end
    end
    inherited pnlSortCut: TPanel
      Width = 475
      ExplicitWidth = 475
      inherited lbCTRLEnter: TLabel
        Left = 300
        ExplicitLeft = 300
      end
      inherited lbEscape: TLabel
        Left = 391
        ExplicitLeft = 391
      end
      inherited lblCTRLP: TLabel
        Left = 224
        ExplicitLeft = 224
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 448
    Top = 16
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
end
