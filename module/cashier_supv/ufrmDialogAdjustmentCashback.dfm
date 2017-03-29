inherited frmDialogAdjustmentCashback: TfrmDialogAdjustmentCashback
  Left = 280
  Top = 178
  Caption = 'frmDialogAdjustmentCashback'
  ClientHeight = 422
  ClientWidth = 655
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 671
  ExplicitHeight = 461
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 655
    Height = 366
    ExplicitWidth = 657
    ExplicitHeight = 392
    object pnl2: TPanel
      Left = 2
      Top = 92
      Width = 651
      Height = 170
      Align = alClient
      BevelOuter = bvLowered
      Enabled = False
      TabOrder = 1
      ExplicitWidth = 653
      ExplicitHeight = 196
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
        Top = 90
        Width = 108
        Height = 16
        Caption = 'Card Code / Card No.'
      end
      object lbl10: TLabel
        Left = 10
        Top = 113
        Width = 54
        Height = 16
        Caption = 'Card Name'
      end
      object lbl11: TLabel
        Left = 10
        Top = 136
        Width = 69
        Height = 16
        Caption = 'Authorize No.'
      end
      object lbl12: TLabel
        Left = 383
        Top = 91
        Width = 86
        Height = 16
        Caption = 'Transaction Date'
      end
      object lbl13: TLabel
        Left = 383
        Top = 114
        Width = 86
        Height = 16
        Caption = 'Total Transaction'
      end
      object lbl14: TLabel
        Left = 383
        Top = 137
        Width = 94
        Height = 16
        Caption = 'Payment with Card'
      end
      object edtMemberCode: TEdit
        Left = 68
        Top = 7
        Width = 100
        Height = 22
        TabStop = False
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
      end
      object edtMemberName: TEdit
        Left = 170
        Top = 7
        Width = 315
        Height = 22
        TabStop = False
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
      end
      object edtCashierName: TEdit
        Left = 127
        Top = 30
        Width = 181
        Height = 22
        TabStop = False
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 3
      end
      object edtCashierId: TEdit
        Left = 68
        Top = 30
        Width = 57
        Height = 22
        TabStop = False
        Ctl3D = False
        MaxLength = 4
        ParentCtl3D = False
        TabOrder = 2
      end
      object edtPOSCode: TEdit
        Left = 68
        Top = 53
        Width = 51
        Height = 22
        TabStop = False
        Ctl3D = False
        MaxLength = 2
        ParentCtl3D = False
        TabOrder = 4
      end
      object edtShiftCode: TEdit
        Left = 156
        Top = 53
        Width = 35
        Height = 22
        TabStop = False
        Ctl3D = False
        MaxLength = 1
        ParentCtl3D = False
        TabOrder = 5
      end
      object edtCardCode: TEdit
        Left = 120
        Top = 90
        Width = 51
        Height = 22
        TabStop = False
        Ctl3D = False
        MaxLength = 2
        ParentCtl3D = False
        TabOrder = 6
        Text = '00'
      end
      object edtCardNo: TEdit
        Left = 173
        Top = 90
        Width = 135
        Height = 22
        TabStop = False
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 7
      end
      object edtCardName: TEdit
        Left = 120
        Top = 113
        Width = 188
        Height = 22
        TabStop = False
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 9
      end
      object edtCardAuthorize: TEdit
        Left = 120
        Top = 136
        Width = 188
        Height = 22
        TabStop = False
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 11
      end
      object dtTransact: TcxDateEdit
        Left = 484
        Top = 91
        TabStop = False
        TabOrder = 8
        Width = 116
      end
      object curredtTotalTransact: TcxCurrencyEdit
        Left = 484
        Top = 114
        TabStop = False
        TabOrder = 10
        Width = 116
      end
      object curredtPaymentCard: TcxCurrencyEdit
        Left = 484
        Top = 137
        TabStop = False
        TabOrder = 12
        Width = 117
      end
    end
    object pnl3: TPanel
      Left = 2
      Top = 262
      Width = 651
      Height = 102
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 2
      ExplicitTop = 288
      ExplicitWidth = 653
      object lbl16: TLabel
        Left = 10
        Top = 30
        Width = 99
        Height = 16
        Caption = 'Withdraw "Actually"'
      end
      object lbl15: TLabel
        Left = 10
        Top = 6
        Width = 93
        Height = 16
        Caption = 'Withdraw "Before"'
      end
      object lbl17: TLabel
        Left = 10
        Top = 53
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
        Transparent = True
      end
      object lbl18: TLabel
        Left = 10
        Top = 75
        Width = 75
        Height = 16
        Caption = 'Cashback Note'
      end
      object curredtCashbackActually: TcxCurrencyEdit
        Left = 120
        Top = 28
        TabOrder = 1
        OnKeyPress = curredtCashbackActuallyKeyPress
        Width = 117
      end
      object curredtCashbackBefore: TcxCurrencyEdit
        Left = 120
        Top = 5
        TabStop = False
        TabOrder = 0
        Width = 117
      end
      object curredtAdjustCashback: TcxCurrencyEdit
        Left = 120
        Top = 51
        TabOrder = 2
        Width = 117
      end
      object edtNote: TEdit
        Left = 120
        Top = 74
        Width = 369
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 3
      end
    end
    object pgcPage: TPageControl
      Left = 2
      Top = 2
      Width = 651
      Height = 90
      ActivePage = tsOthersDay
      Align = alTop
      Style = tsFlatButtons
      TabOrder = 0
      ExplicitWidth = 653
      object tsSameDay: TTabSheet
        Caption = 'Same Day'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
      object tsOthersDay: TTabSheet
        Caption = 'Others Day'
        ImageIndex = 1
        OnShow = tsOthersDayShow
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 645
        ExplicitHeight = 0
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 643
          Height = 56
          Align = alClient
          BevelOuter = bvNone
          Color = 15198183
          TabOrder = 0
          ExplicitWidth = 645
          object lbl19: TLabel
            Left = 9
            Top = 32
            Width = 85
            Height = 16
            Caption = 'Adjustment Code'
          end
          object lbl20: TLabel
            Left = 353
            Top = 31
            Width = 79
            Height = 16
            Caption = 'Transaction No.'
          end
          object lbl21: TLabel
            Left = 10
            Top = 6
            Width = 24
            Height = 16
            Caption = 'Date'
          end
          object dtAdjustCashback: TcxDateEdit
            Left = 96
            Top = 6
            TabOrder = 0
            OnKeyPress = dtAdjustCashbackKeyPress
            Width = 89
          end
          object cbpAdjustCode: TcxExtLookupComboBox
            Left = 96
            Top = 30
            TabOrder = 1
            Width = 165
          end
          object edtNoTrans: TEdit
            Left = 436
            Top = 26
            Width = 185
            Height = 22
            TabOrder = 2
          end
        end
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 366
    Width = 655
    ExplicitTop = 392
    ExplicitWidth = 657
    inherited pnlFooter: TPanel
      Width = 655
      TabOrder = 1
      ExplicitWidth = 657
      inherited btnClose: TcxButton
        Left = 578
        Action = actCancel
        ExplicitLeft = 580
      end
      inherited btnSave: TcxButton
        Left = 485
        Action = actSave
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 487
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
      inherited btnPrint: TcxButton
        Left = 408
        ExplicitLeft = 410
      end
    end
    inherited pnlSortCut: TPanel
      Width = 655
      TabOrder = 0
      ExplicitWidth = 657
      inherited lbCTRLEnter: TLabel
        Left = 480
        ExplicitLeft = 480
      end
      inherited lbEscape: TLabel
        Left = 571
        ExplicitLeft = 571
      end
      inherited lblCTRLP: TLabel
        Left = 404
        ExplicitLeft = 404
      end
    end
  end
end
