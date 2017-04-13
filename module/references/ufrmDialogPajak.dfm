inherited frmDialogPajak: TfrmDialogPajak
  Left = 342
  Top = 87
  Caption = 'frmDialogPajak'
  ClientHeight = 302
  ClientWidth = 438
  OldCreateOrder = True
  ExplicitWidth = 454
  ExplicitHeight = 341
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 438
    Height = 246
    ExplicitWidth = 438
    ExplicitHeight = 246
    object lbl1: TLabel
      Left = 32
      Top = 42
      Width = 27
      Height = 16
      Alignment = taRightJustify
      Caption = 'Name'
    end
    object Lbl2: TLabel
      Left = 40
      Top = 70
      Width = 19
      Height = 16
      Alignment = taRightJustify
      Caption = 'PPN'
    end
    object lbl3: TLabel
      Left = 23
      Top = 98
      Width = 36
      Height = 16
      Alignment = taRightJustify
      Caption = 'PPN BM'
    end
    object Label1: TLabel
      Left = 34
      Top = 14
      Width = 25
      Height = 16
      Alignment = taRightJustify
      Caption = 'Code'
    end
    object lbl4: TLabel
      Left = 125
      Top = 71
      Width = 7
      Height = 16
      Caption = '%'
    end
    object lbl5: TLabel
      Left = 125
      Top = 98
      Width = 7
      Height = 16
      Caption = '%'
    end
    object edtNamaPajak: TEdit
      Left = 69
      Top = 40
      Width = 276
      Height = 22
      Ctl3D = False
      MaxLength = 64
      ParentCtl3D = False
      TabOrder = 1
    end
    object edtCodePajak: TEdit
      Left = 69
      Top = 12
      Width = 97
      Height = 22
      Ctl3D = False
      MaxLength = 4
      ParentCtl3D = False
      TabOrder = 0
    end
    object edtPPN: TcxCalcEdit
      Left = 69
      Top = 68
      EditValue = 0.000000000000000000
      TabOrder = 2
      Width = 33
    end
    object edtPPNBM: TcxCalcEdit
      Left = 69
      Top = 98
      EditValue = 0.000000000000000000
      TabOrder = 3
      Width = 33
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 246
    Width = 438
    ExplicitTop = 246
    ExplicitWidth = 438
    inherited pnlFooter: TPanel
      Width = 438
      ExplicitWidth = 438
      inherited btnClose: TcxButton
        Left = 361
        Action = actCancel
        ExplicitLeft = 361
      end
      inherited btnSave: TcxButton
        Left = 192
        Action = actSave
        ExplicitLeft = 192
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 284
      end
    end
    inherited pnlSortCut: TPanel
      Width = 438
      ExplicitWidth = 438
      inherited lbCTRLEnter: TLabel
        Left = 80
        Height = 15
        ExplicitLeft = 80
      end
      inherited lbEscape: TLabel
        Left = 354
        Height = 15
        ExplicitLeft = 354
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 278
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 128
    Top = 160
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
end
