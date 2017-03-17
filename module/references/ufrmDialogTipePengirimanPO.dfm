inherited frmDialogTipePengirimanPO: TfrmDialogTipePengirimanPO
  Left = 223
  Top = 162
  Caption = 'frmDialogTipePengirimanPO'
  ClientHeight = 371
  ClientWidth = 548
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 564
  ExplicitHeight = 410
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 548
    Height = 315
    ExplicitWidth = 347
    ExplicitHeight = 84
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
      Tag = 1
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
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 315
    Width = 548
    ExplicitTop = 84
    ExplicitWidth = 347
    inherited pnlFooter: TPanel
      Width = 548
      ExplicitWidth = 347
      inherited btnClose: TcxButton
        Left = 471
        Action = actCancel
        ExplicitLeft = 270
      end
      inherited btnSave: TcxButton
        Left = 378
        Action = actSave
        ExplicitLeft = 177
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
    end
    inherited pnlSortCut: TPanel
      Width = 548
      ExplicitWidth = 347
      inherited lbCTRLEnter: TLabel
        Left = 373
        Height = 15
        ExplicitLeft = 172
      end
      inherited lbEscape: TLabel
        Left = 464
        Height = 15
        ExplicitLeft = 263
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
