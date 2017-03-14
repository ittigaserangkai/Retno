inherited frmDialogMerk: TfrmDialogMerk
  Caption = 'Update Data Merk'
  ClientHeight = 265
  ClientWidth = 608
  ExplicitWidth = 624
  ExplicitHeight = 304
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 608
    Height = 209
    ExplicitWidth = 608
    ExplicitHeight = 209
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
      Left = 92
      Top = 36
      Width = 317
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 8
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
      MaxLength = 128
      ParentCtl3D = False
      TabOrder = 1
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 209
    Width = 608
    ExplicitTop = 209
    ExplicitWidth = 608
    inherited pnlFooter: TPanel
      Width = 608
      ExplicitWidth = 608
      inherited btnClose: TcxButton
        Left = 531
        ExplicitLeft = 531
      end
      inherited btnSave: TcxButton
        Left = 428
        Action = actSave
        ExplicitLeft = 428
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
    end
    inherited pnlSortCut: TPanel
      Width = 608
      ExplicitWidth = 608
      inherited lbCTRLEnter: TLabel
        Height = 16
        ExplicitHeight = 16
      end
      inherited lbEscape: TLabel
        Height = 16
      end
      inherited lbCTRLDel: TLabel
        Height = 16
        ExplicitHeight = 16
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 464
    Top = 80
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
end
