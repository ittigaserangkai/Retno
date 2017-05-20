inherited frmDialogCreditCard: TfrmDialogCreditCard
  Left = 377
  Top = 174
  Caption = 'Update Data Credit Card'
  ClientHeight = 411
  ClientWidth = 384
  Constraints.MinHeight = 32
  OldCreateOrder = True
  OnDestroy = FormDestroy
  ExplicitWidth = 400
  ExplicitHeight = 450
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 384
    Height = 355
    ExplicitWidth = 384
    ExplicitHeight = 355
    object lbl1: TLabel
      Left = 26
      Top = 24
      Width = 52
      Height = 16
      Caption = 'Card Code'
    end
    object lbl2: TLabel
      Left = 26
      Top = 54
      Width = 54
      Height = 16
      Caption = 'Card Name'
    end
    object lbl3: TLabel
      Left = 26
      Top = 115
      Width = 25
      Height = 16
      Caption = 'Limit'
    end
    object lbl4: TLabel
      Left = 26
      Top = 175
      Width = 44
      Height = 16
      Caption = 'Discount'
    end
    object lbl6: TLabel
      Left = 26
      Top = 85
      Width = 65
      Height = 16
      Caption = 'Debit/Credit'
    end
    object lbl7: TLabel
      Left = 182
      Top = 175
      Width = 7
      Height = 16
      Caption = '%'
    end
    object Label1: TLabel
      Left = 26
      Top = 145
      Width = 36
      Height = 16
      Caption = 'Charge'
    end
    object Label2: TLabel
      Left = 182
      Top = 145
      Width = 7
      Height = 16
      Caption = '%'
    end
    object Label3: TLabel
      Left = 26
      Top = 274
      Width = 45
      Height = 16
      Caption = 'Rekening'
    end
    object Label4: TLabel
      Left = 26
      Top = 304
      Width = 99
      Height = 16
      Caption = 'Rekening Cash Back'
    end
    object edtCardCode: TEdit
      Left = 135
      Top = 22
      Width = 65
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 4
      ParentCtl3D = False
      TabOrder = 0
    end
    object edtCardName: TEdit
      Left = 135
      Top = 52
      Width = 202
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
    end
    object cboisCredit: TComboBox
      Left = 135
      Top = 82
      Width = 113
      Height = 24
      BevelKind = bkSoft
      Style = csDropDownList
      CharCase = ecUpperCase
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      Items.Strings = (
        'DEBIT'
        'CREDIT')
    end
    object chkIsActive: TCheckBox
      Left = 135
      Top = 202
      Width = 66
      Height = 17
      Caption = 'is Active'
      TabOrder = 6
    end
    object edtLimit: TcxCurrencyEdit
      Left = 135
      Top = 112
      Properties.DisplayFormat = ',0.00;(,0.00)'
      TabOrder = 3
      OnEnter = edtLimitEnter
      Width = 113
    end
    object fedtDisc: TcxCurrencyEdit
      Left = 135
      Top = 172
      Properties.DisplayFormat = ',0.##;(,0.##)'
      TabOrder = 5
      OnExit = fedtDiscExit
      Width = 41
    end
    object chkIsCachBack: TCheckBox
      Left = 135
      Top = 225
      Width = 83
      Height = 17
      Caption = 'Cash Back'
      TabOrder = 7
    end
    object fedtCharge: TcxCurrencyEdit
      Left = 135
      Top = 142
      Properties.DisplayFormat = ',0.##;(,0.##)'
      TabOrder = 4
      OnExit = fedtChargeExit
      Width = 41
    end
    object chkIsKring: TCheckBox
      Left = 135
      Top = 248
      Width = 65
      Height = 17
      Caption = 'Is Kring'
      TabOrder = 8
    end
    object cxLookupAccount: TcxExtLookupComboBox
      Left = 135
      Top = 271
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 9
      Width = 202
    end
    object cxLookupAccountCashBack: TcxExtLookupComboBox
      Left = 135
      Top = 301
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 10
      Width = 202
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 355
    Width = 384
    ExplicitTop = 355
    ExplicitWidth = 384
    inherited pnlFooter: TPanel
      Width = 384
      ExplicitWidth = 384
      inherited btnClose: TcxButton
        Left = 307
        Action = actCancel
        ExplicitLeft = 307
      end
      inherited btnSave: TcxButton
        Left = 214
        Action = actSave
        ExplicitLeft = 214
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 137
        ExplicitLeft = 137
      end
    end
    inherited pnlSortCut: TPanel
      Width = 384
      ExplicitWidth = 384
      inherited lbCTRLEnter: TLabel
        Left = 209
        ExplicitLeft = 209
      end
      inherited lbEscape: TLabel
        Left = 300
        ExplicitLeft = 300
      end
      inherited lblCTRLP: TLabel
        Left = 133
        ExplicitLeft = 133
      end
    end
  end
  inherited actlstMasterDialog: TActionList
    Left = 320
    Top = 88
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
  end
end
