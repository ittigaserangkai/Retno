inherited frmDialogAdjustmentCashier: TfrmDialogAdjustmentCashier
  Left = 247
  Top = 197
  Caption = 'frmDialogAdjustmentCashier'
  ClientHeight = 309
  ClientWidth = 580
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 596
  ExplicitHeight = 348
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 580
    Height = 253
    ExplicitWidth = 580
    ExplicitHeight = 253
    object pnl1: TPanel
      Left = 2
      Top = 2
      Width = 576
      Height = 38
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      object lbl1: TLabel
        Left = 14
        Top = 10
        Width = 24
        Height = 16
        Caption = 'Date'
      end
      object lbl3: TLabel
        Left = 145
        Top = 11
        Width = 47
        Height = 16
        Caption = 'POS Code'
      end
      object lbl2: TLabel
        Left = 252
        Top = 10
        Width = 23
        Height = 16
        Caption = 'Shift'
      end
      object lbl4: TLabel
        Left = 336
        Top = 10
        Width = 52
        Height = 16
        Caption = 'Cashier ID'
      end
      object dtTgl: TcxDateEdit
        Left = 40
        Top = 7
        TabStop = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        Width = 97
      end
      object edtPOSCode: TEdit
        Left = 195
        Top = 7
        Width = 49
        Height = 22
        TabStop = False
        Ctl3D = False
        Enabled = False
        MaxLength = 1
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
      end
      object edtShift: TEdit
        Left = 278
        Top = 7
        Width = 49
        Height = 22
        TabStop = False
        Ctl3D = False
        Enabled = False
        MaxLength = 1
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 2
      end
      object edtCashierId: TEdit
        Left = 390
        Top = 7
        Width = 57
        Height = 22
        TabStop = False
        Ctl3D = False
        Enabled = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 3
      end
      object edtCashierName: TEdit
        Left = 448
        Top = 7
        Width = 110
        Height = 22
        TabStop = False
        Ctl3D = False
        Enabled = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 4
      end
    end
    object pnl2: TPanel
      Left = 2
      Top = 40
      Width = 576
      Height = 211
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 1
      object lbl5: TLabel
        Left = 14
        Top = 9
        Width = 53
        Height = 16
        Caption = 'Cash Value'
      end
      object lbl6: TLabel
        Left = 14
        Top = 33
        Width = 52
        Height = 16
        Caption = 'Card Code'
      end
      object lbl7: TLabel
        Left = 14
        Top = 59
        Width = 59
        Height = 16
        Caption = 'Credit Card'
      end
      object lbl8: TLabel
        Left = 14
        Top = 83
        Width = 54
        Height = 16
        Caption = 'Debit Card'
      end
      object lbl9: TLabel
        Left = 14
        Top = 107
        Width = 82
        Height = 16
        Caption = 'Deposit Voucher'
      end
      object lbl10: TLabel
        Left = 14
        Top = 131
        Width = 88
        Height = 16
        Caption = 'Assalaam Voucher'
      end
      object lbl11: TLabel
        Left = 14
        Top = 155
        Width = 74
        Height = 16
        Caption = 'Other Voucher'
      end
      object lbl12: TLabel
        Left = 14
        Top = 179
        Width = 24
        Height = 16
        Caption = 'Note'
      end
      object curredtCash: TcxCurrencyEdit
        Left = 113
        Top = 6
        TabOrder = 0
        OnEnter = curredtDepositEnter
        OnExit = curredtDepositExit
        OnKeyPress = curredtCashKeyPress
        Width = 105
      end
      object cbpCard: TcxExtLookupComboBox
        Left = 113
        Top = 30
        TabOrder = 1
        OnKeyPress = cbpCardKeyPress
        Width = 254
      end
      object curredtCredit: TcxCurrencyEdit
        Left = 113
        Top = 56
        TabOrder = 2
        OnEnter = curredtDepositEnter
        OnExit = curredtDepositExit
        OnKeyPress = curredtCreditKeyPress
        Width = 105
      end
      object curredtDeposit: TcxCurrencyEdit
        Left = 113
        Top = 104
        TabOrder = 4
        OnEnter = curredtDepositEnter
        OnExit = curredtDepositExit
        OnKeyPress = curredtDepositKeyPress
        Width = 105
      end
      object curredtVoucher: TcxCurrencyEdit
        Left = 113
        Top = 128
        TabOrder = 5
        OnEnter = curredtDepositEnter
        OnExit = curredtDepositExit
        OnKeyPress = curredtVoucherKeyPress
        Width = 105
      end
      object curredtVoucherLain: TcxCurrencyEdit
        Left = 113
        Top = 152
        TabOrder = 6
        OnEnter = curredtDepositEnter
        OnExit = curredtDepositExit
        OnKeyPress = curredtVoucherLainKeyPress
        Width = 105
      end
      object edtNote: TEdit
        Left = 113
        Top = 176
        Width = 248
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 7
      end
      object curredtDebit: TcxCurrencyEdit
        Left = 113
        Top = 80
        TabOrder = 3
        OnEnter = curredtDepositEnter
        OnExit = curredtDepositExit
        OnKeyPress = curredtDepositKeyPress
        Width = 105
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 253
    Width = 580
    ExplicitTop = 253
    ExplicitWidth = 580
    inherited pnlFooter: TPanel
      Width = 580
      TabOrder = 1
      ExplicitWidth = 580
      inherited btnClose: TcxButton
        Left = 503
        Action = actCancel
        ExplicitLeft = 503
      end
      inherited btnSave: TcxButton
        Left = 410
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 410
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 333
        ExplicitLeft = 333
      end
    end
    inherited pnlSortCut: TPanel
      Width = 580
      TabOrder = 0
      ExplicitWidth = 580
      inherited lbCTRLEnter: TLabel
        Left = 405
        Height = 15
        ExplicitLeft = 405
      end
      inherited lbEscape: TLabel
        Left = 496
        Height = 15
        ExplicitLeft = 496
      end
      inherited lbCTRLDel: TLabel
        Height = 15
      end
      inherited lblCTRLP: TLabel
        Left = 329
        ExplicitLeft = 329
      end
    end
  end
end
