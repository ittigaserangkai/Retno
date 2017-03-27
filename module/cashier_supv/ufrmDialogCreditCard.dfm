inherited frmDialogCreditCard: TfrmDialogCreditCard
  Left = 377
  Top = 174
  Caption = 'frmDialogCreditCard'
  ClientHeight = 291
  ClientWidth = 325
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 341
  ExplicitHeight = 330
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 325
    Height = 235
    ExplicitWidth = 325
    ExplicitHeight = 235
    object lbl1: TLabel
      Left = 22
      Top = 14
      Width = 52
      Height = 16
      Caption = 'Card Code'
    end
    object lbl2: TLabel
      Left = 22
      Top = 39
      Width = 54
      Height = 16
      Caption = 'Card Name'
    end
    object lbl3: TLabel
      Left = 22
      Top = 93
      Width = 25
      Height = 16
      Caption = 'Limit'
    end
    object lbl4: TLabel
      Left = 22
      Top = 140
      Width = 44
      Height = 16
      Caption = 'Discount'
    end
    object lbl6: TLabel
      Left = 22
      Top = 65
      Width = 65
      Height = 16
      Caption = 'Credit/Debit'
    end
    object lbl7: TLabel
      Left = 141
      Top = 144
      Width = 7
      Height = 16
      Caption = '%'
    end
    object Label1: TLabel
      Left = 22
      Top = 116
      Width = 36
      Height = 16
      Caption = 'Charge'
    end
    object Label2: TLabel
      Left = 141
      Top = 120
      Width = 7
      Height = 16
      Caption = '%'
    end
    object edtCardCode: TEdit
      Left = 95
      Top = 14
      Width = 65
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 4
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
    end
    object edtCardName: TEdit
      Left = 95
      Top = 39
      Width = 202
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
    end
    object cboisCredit: TComboBox
      Left = 95
      Top = 65
      Width = 113
      Height = 24
      BevelKind = bkSoft
      Style = csDropDownList
      CharCase = ecUpperCase
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      Items.Strings = (
        'CREDIT'
        'DEBIT')
    end
    object chkIsActive: TCheckBox
      Left = 95
      Top = 167
      Width = 66
      Height = 17
      Caption = 'is Active'
      Checked = True
      State = cbChecked
      TabOrder = 6
    end
    object edtLimit: TcxCurrencyEdit
      Left = 95
      Top = 93
      TabOrder = 3
      OnEnter = edtLimitEnter
      Width = 114
    end
    object fedtDisc: TcxCurrencyEdit
      Left = 95
      Top = 140
      TabOrder = 5
      OnExit = fedtDiscExit
      Width = 41
    end
    object chkIsCachBack: TCheckBox
      Left = 95
      Top = 186
      Width = 97
      Height = 17
      Caption = 'Cash Back'
      TabOrder = 7
    end
    object fedtCharge: TcxCurrencyEdit
      Left = 95
      Top = 116
      TabOrder = 4
      OnExit = fedtChargeExit
      Width = 41
    end
    object chkIsKring: TCheckBox
      Left = 95
      Top = 205
      Width = 97
      Height = 17
      Caption = 'Is Kring'
      TabOrder = 8
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 235
    Width = 325
    ExplicitTop = 235
    ExplicitWidth = 325
    inherited pnlFooter: TPanel
      Width = 325
      ExplicitWidth = 325
      inherited btnClose: TcxButton
        Left = 248
        Action = actCancel
        ExplicitLeft = 248
      end
      inherited btnSave: TcxButton
        Left = 79
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 79
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 171
        ExplicitLeft = 171
      end
    end
    inherited pnlSortCut: TPanel
      Width = 325
      ExplicitWidth = 325
      inherited lbCTRLEnter: TLabel
        Left = -33
        Height = 15
        ExplicitLeft = -33
      end
      inherited lbEscape: TLabel
        Left = 241
        Height = 15
        ExplicitLeft = 241
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 165
        ExplicitLeft = 165
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
  end
end
