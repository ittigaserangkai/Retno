inherited frmAdjustmentCashback: TfrmAdjustmentCashback
  Left = 162
  Top = 212
  Caption = 'Adjustment Cashback'
  ClientHeight = 416
  ClientWidth = 678
  OldCreateOrder = True
  ExplicitWidth = 694
  ExplicitHeight = 455
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 678
    Height = 330
    BorderWidth = 0
    ExplicitWidth = 678
    ExplicitHeight = 330
    object pnl1: TPanel
      Left = 1
      Top = 1
      Width = 676
      Height = 38
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      object lbl1: TLabel
        Left = 10
        Top = 7
        Width = 24
        Height = 16
        Caption = 'Date'
      end
      object lbl3: TLabel
        Left = 138
        Top = 7
        Width = 79
        Height = 16
        Caption = 'Transaction No.'
      end
      object dtAdjustment: TcxDateEdit
        Left = 37
        Top = 7
        TabOrder = 0
        OnKeyPress = dtAdjustmentKeyPress
        Width = 89
      end
      object edtNoTrans: TEdit
        Left = 220
        Top = 6
        Width = 185
        Height = 22
        TabOrder = 1
      end
    end
    object pnl2: TPanel
      Left = 1
      Top = 39
      Width = 676
      Height = 290
      Align = alClient
      BevelOuter = bvLowered
      BorderWidth = 10
      TabOrder = 1
      object lbl4: TLabel
        Left = 10
        Top = 8
        Width = 52
        Height = 16
        Caption = 'Member Id'
      end
      object lbl6: TLabel
        Left = 10
        Top = 30
        Width = 51
        Height = 16
        Caption = 'Cashier Id'
      end
      object lbl5: TLabel
        Left = 10
        Top = 53
        Width = 47
        Height = 16
        Caption = 'POS Code'
      end
      object lbl7: TLabel
        Left = 129
        Top = 53
        Width = 23
        Height = 16
        Caption = 'Shift'
      end
      object lbl9: TLabel
        Left = 10
        Top = 94
        Width = 108
        Height = 16
        Caption = 'Card Code / Card No.'
      end
      object lbl10: TLabel
        Left = 10
        Top = 117
        Width = 54
        Height = 16
        Caption = 'Card Name'
      end
      object lbl11: TLabel
        Left = 10
        Top = 140
        Width = 69
        Height = 16
        Caption = 'Authorize No.'
      end
      object lbl12: TLabel
        Left = 344
        Top = 92
        Width = 86
        Height = 16
        Caption = 'Transaction Date'
      end
      object lbl13: TLabel
        Left = 344
        Top = 115
        Width = 86
        Height = 16
        Caption = 'Total Transaction'
      end
      object lbl14: TLabel
        Left = 344
        Top = 138
        Width = 94
        Height = 16
        Caption = 'Payment with Card'
      end
      object lbl15: TLabel
        Left = 10
        Top = 190
        Width = 93
        Height = 16
        Caption = 'Withdraw "Before"'
      end
      object lbl16: TLabel
        Left = 10
        Top = 213
        Width = 99
        Height = 16
        Caption = 'Withdraw "Actually"'
      end
      object lbl17: TLabel
        Left = 10
        Top = 236
        Width = 95
        Height = 16
        Caption = 'Adjustment Value'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 33023
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object lbl18: TLabel
        Left = 248
        Top = 236
        Width = 75
        Height = 16
        Caption = 'Cashback Note'
      end
      object bvl1: TBevel
        Left = 8
        Top = 181
        Width = 650
        Height = 17
        Shape = bsTopLine
      end
      object edtMemberCode: TEdit
        Left = 68
        Top = 7
        Width = 100
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
      end
      object edtMemberName: TEdit
        Left = 170
        Top = 7
        Width = 391
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
      end
      object edtCashierCode: TEdit
        Left = 68
        Top = 30
        Width = 57
        Height = 22
        Ctl3D = False
        MaxLength = 4
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 2
      end
      object edtCashierName: TEdit
        Left = 127
        Top = 30
        Width = 110
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 3
      end
      object edtPOSCode: TEdit
        Left = 68
        Top = 53
        Width = 51
        Height = 22
        Ctl3D = False
        MaxLength = 2
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 4
      end
      object edtShiftCode: TEdit
        Left = 156
        Top = 53
        Width = 35
        Height = 22
        Ctl3D = False
        MaxLength = 1
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 5
      end
      object edtCardCode: TEdit
        Left = 120
        Top = 94
        Width = 51
        Height = 22
        Ctl3D = False
        MaxLength = 2
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 6
      end
      object edtCardNo: TEdit
        Left = 173
        Top = 94
        Width = 135
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 7
      end
      object edtCardName: TEdit
        Left = 120
        Top = 117
        Width = 188
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 8
      end
      object edtCardAuthorize: TEdit
        Left = 120
        Top = 140
        Width = 188
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 9
      end
      object dtTransact: TcxDateEdit
        Left = 445
        Top = 92
        TabOrder = 10
        Width = 116
      end
      object curredtTotalTransact: TcxCurrencyEdit
        Left = 445
        Top = 115
        TabOrder = 11
        Width = 156
      end
      object curredtPaymentCard: TcxCurrencyEdit
        Left = 445
        Top = 138
        TabOrder = 12
        Width = 156
      end
      object curredtCashbackBefore: TcxCurrencyEdit
        Left = 120
        Top = 190
        TabOrder = 13
        Width = 117
      end
      object curredtCashbackActually: TcxCurrencyEdit
        Left = 120
        Top = 213
        TabOrder = 14
        Width = 117
      end
      object curredtAdjustValue: TcxCurrencyEdit
        Left = 120
        Top = 236
        TabOrder = 15
        Width = 117
      end
      object edtNote: TEdit
        Left = 327
        Top = 236
        Width = 330
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 16
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 678
    ExplicitWidth = 678
  end
  inline fraFooter5Button1: TfraFooter5Button
    Left = 0
    Top = 360
    Width = 678
    Height = 56
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitTop = 360
    ExplicitWidth = 678
    inherited pnlFooter: TPanel
      Width = 678
      ExplicitWidth = 678
      inherited bvlSeparator: TBevel
        Left = 91
        ExplicitLeft = 91
      end
      inherited btnClose: TcxButton
        Left = 596
        ExplicitLeft = 596
      end
      inherited btnAdd: TcxButton
        Action = actAddAdjustmentCashback
      end
      inherited btnUpdate: TcxButton
        Left = 185
        Visible = False
        ExplicitLeft = 185
      end
      inherited btnDelete: TcxButton
        Left = 264
        Visible = False
        ExplicitLeft = 264
      end
      inherited btnRefresh: TcxButton
        Left = 101
        Action = actRefreshAdjustmentCashback
        ExplicitLeft = 101
      end
    end
    inherited pnlSortCut: TPanel
      Width = 678
      ExplicitWidth = 678
      inherited lbl2: TLabel
        Left = 195
        Visible = False
        ExplicitLeft = 195
      end
      inherited lbl3: TLabel
        Left = 272
        Visible = False
        ExplicitLeft = 272
      end
      inherited lbl4: TLabel
        Left = 99
        ExplicitLeft = 99
      end
      inherited lbl5: TLabel
        Left = 588
        ExplicitLeft = 596
      end
    end
  end
  object actlst1: TActionList
    Left = 625
    Top = 77
    object actAddAdjustmentCashback: TAction
      Caption = '&Add'
      OnExecute = actAddAdjustmentCashbackExecute
    end
    object actRefreshAdjustmentCashback: TAction
      Caption = '&Refresh'
      OnExecute = actRefreshAdjustmentCashbackExecute
    end
  end
end
