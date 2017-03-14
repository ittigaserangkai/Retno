inherited frmDialogCostCenter: TfrmDialogCostCenter
  Caption = 'Cost Center'
  ClientHeight = 155
  ClientWidth = 442
  ExplicitWidth = 458
  ExplicitHeight = 194
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 442
    Height = 99
    ExplicitWidth = 442
    ExplicitHeight = 99
    object lblCode: TLabel
      Left = 16
      Top = 16
      Width = 25
      Height = 16
      Alignment = taRightJustify
      Caption = 'Code'
    end
    object LblName: TLabel
      Left = 14
      Top = 44
      Width = 27
      Height = 16
      Alignment = taRightJustify
      Caption = 'Name'
    end
    object edtCode: TEdit
      Left = 54
      Top = 14
      Width = 113
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 4
      ParentCtl3D = False
      TabOrder = 0
    end
    object edtName: TEdit
      Left = 54
      Top = 44
      Width = 267
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 16
      ParentCtl3D = False
      TabOrder = 1
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 99
    Width = 442
    ExplicitTop = 99
    ExplicitWidth = 442
    inherited pnlFooter: TPanel
      Width = 442
      ExplicitWidth = 442
      inherited btnClose: TcxButton
        Left = 365
        Action = actCancel
        ExplicitLeft = 365
      end
      inherited btnSave: TcxButton
        Left = 262
        Action = actSave
        ExplicitLeft = 262
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
    end
    inherited pnlSortCut: TPanel
      Width = 442
      ExplicitWidth = 442
      inherited lbl4: TLabel
        Left = 262
        Height = 15
        ExplicitLeft = 262
      end
      inherited lbl5: TLabel
        Left = 361
        Height = 15
        ExplicitLeft = 361
      end
      inherited lbl3: TLabel
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
