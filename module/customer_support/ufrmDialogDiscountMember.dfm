inherited frmDialogDiscountMember: TfrmDialogDiscountMember
  Left = 424
  Caption = 'frmDialogDiscountMember'
  ClientHeight = 204
  ClientWidth = 445
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 461
  ExplicitHeight = 243
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 445
    Height = 148
    ExplicitWidth = 445
    ExplicitHeight = 148
    object Label9: TLabel
      Left = 67
      Top = 18
      Width = 11
      Height = 16
      Alignment = taRightJustify
      Caption = 'ID'
    end
    object Label1: TLabel
      Left = 12
      Top = 42
      Width = 65
      Height = 16
      Alignment = taRightJustify
      BiDiMode = bdLeftToRight
      Caption = 'Member Type'
      ParentBiDiMode = False
    end
    object Label10: TLabel
      Left = 12
      Top = 67
      Width = 65
      Height = 16
      Alignment = taRightJustify
      BiDiMode = bdLeftToRight
      Caption = 'Minimal Value'
      ParentBiDiMode = False
    end
    object Label2: TLabel
      Left = 9
      Top = 92
      Width = 68
      Height = 16
      Alignment = taRightJustify
      BiDiMode = bdLeftToRight
      Caption = 'Maximal Value'
      ParentBiDiMode = False
    end
    object Label3: TLabel
      Left = 33
      Top = 117
      Width = 44
      Height = 16
      Alignment = taRightJustify
      BiDiMode = bdLeftToRight
      Caption = 'Discount'
      ParentBiDiMode = False
    end
    object edtId: TEdit
      Left = 80
      Top = 14
      Width = 57
      Height = 22
      Hint = 'TEKAN F5  UNTUK LOOKUP'
      TabStop = False
      CharCase = ecUpperCase
      Color = 15198183
      Ctl3D = False
      ParentCtl3D = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
    end
    object edtMemTypeID: TEdit
      Left = 80
      Top = 39
      Width = 65
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      OnKeyDown = edtMemTypeIDKeyDown
    end
    object edtDiscount: TcxCurrencyEdit
      Left = 80
      Top = 110
      TabOrder = 4
      Width = 110
    end
    object edtMemTypeNm: TEdit
      Left = 149
      Top = 39
      Width = 220
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 5
    end
    object edtMinVal: TcxCurrencyEdit
      Left = 80
      Top = 63
      ParentFont = False
      TabOrder = 2
      Width = 161
    end
    object edtMaxVal: TcxCurrencyEdit
      Left = 79
      Top = 87
      ParentFont = False
      TabOrder = 3
      Width = 162
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 148
    Width = 445
    ExplicitTop = 148
    ExplicitWidth = 445
    inherited pnlFooter: TPanel
      Width = 445
      ExplicitWidth = 445
      inherited btnClose: TcxButton
        Left = 368
        Action = actCancel
        ExplicitLeft = 368
      end
      inherited btnSave: TcxButton
        Left = 275
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 275
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 198
        ExplicitLeft = 198
      end
    end
    inherited pnlSortCut: TPanel
      Width = 445
      ExplicitWidth = 445
      inherited lbCTRLEnter: TLabel
        Left = 270
        Height = 15
        ExplicitLeft = 270
      end
      inherited lbEscape: TLabel
        Left = 361
        Height = 15
        ExplicitLeft = 361
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 194
        ExplicitLeft = 194
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
  end
end
