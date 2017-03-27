inherited frmAdjustmentCashier: TfrmAdjustmentCashier
  Left = 214
  Top = 89
  Caption = 'Adjustment Cashier'
  ClientHeight = 402
  ClientWidth = 664
  OldCreateOrder = True
  ExplicitWidth = 680
  ExplicitHeight = 441
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 664
    Height = 313
    BorderWidth = 0
    ExplicitWidth = 664
    ExplicitHeight = 257
    inherited pgcBrowse: TcxPageControl
      Left = 1
      Top = 38
      Width = 662
      Height = 178
      TabOrder = 1
      ExplicitLeft = 1
      ExplicitTop = 38
      ExplicitWidth = 662
      ExplicitHeight = 218
      ClientRectBottom = 177
      ClientRectRight = 661
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 660
        ExplicitHeight = 216
        inherited cxGrid: TcxGrid
          Width = 660
          Height = 141
          ExplicitWidth = 660
          ExplicitHeight = 216
        end
        object pnl5: TPanel
          Left = 288
          Top = 48
          Width = 369
          Height = 57
          BevelOuter = bvLowered
          BorderWidth = 10
          TabOrder = 1
          Visible = False
          object lbl16: TLabel
            Left = 11
            Top = 11
            Width = 347
            Height = 35
            Align = alClient
            Alignment = taCenter
            Caption = 
              'Program Adjustment harus dicetak setelah transaksi,'#13#10'untuk mengu' +
              'pdate ke setting / POS..!'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Trebuchet MS'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitTop = 35
          end
        end
        object Panel1: TPanel
          Left = 0
          Top = 141
          Width = 660
          Height = 35
          Align = alBottom
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 2
          ExplicitLeft = 11
          ExplicitTop = 76
          ExplicitWidth = 640
          object lbl5: TLabel
            Left = 8
            Top = 6
            Width = 53
            Height = 16
            Caption = 'Card name'
          end
          object lbl6: TLabel
            Left = 192
            Top = 6
            Width = 24
            Height = 16
            Caption = 'Note'
          end
          object lbl8: TcxLabel
            Left = 495
            Top = 6
            Cursor = crHandPoint
            Caption = 'Print And Update (Ctrl - P)'
            ParentFont = False
            Transparent = True
          end
          object edtCardName: TEdit
            Left = 64
            Top = 6
            Width = 121
            Height = 22
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 0
          end
          object edtNote: TEdit
            Left = 220
            Top = 6
            Width = 265
            Height = 22
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 1
          end
        end
      end
    end
    object pnl1: TPanel
      Left = 1
      Top = 1
      Width = 662
      Height = 37
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      object lbl2: TLabel
        Left = 252
        Top = 7
        Width = 23
        Height = 16
        Caption = 'Shift'
      end
      object lbl1: TLabel
        Left = 14
        Top = 7
        Width = 24
        Height = 16
        Caption = 'Date'
      end
      object lbl3: TLabel
        Left = 145
        Top = 8
        Width = 47
        Height = 16
        Caption = 'POS Code'
      end
      object lbl4: TLabel
        Left = 336
        Top = 7
        Width = 51
        Height = 16
        Caption = 'Cashier Id'
      end
      object edtShiftCode: TEdit
        Left = 278
        Top = 7
        Width = 49
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 2
        ParentCtl3D = False
        TabOrder = 2
        OnKeyPress = edtShiftCodeKeyPress
      end
      object dtTgl: TcxDateEdit
        Left = 40
        Top = 7
        TabOrder = 0
        OnKeyPress = dtTglKeyPress
        Width = 97
      end
      object edtPOSCode: TEdit
        Left = 195
        Top = 7
        Width = 49
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 2
        ParentCtl3D = False
        TabOrder = 1
        OnKeyPress = edtPOSCodeKeyPress
      end
      object edtCashierCode: TEdit
        Left = 390
        Top = 7
        Width = 57
        Height = 22
        Ctl3D = False
        MaxLength = 4
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 3
      end
      object edtCashierName: TEdit
        Left = 448
        Top = 7
        Width = 110
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 4
      end
    end
    object pnl3: TPanel
      Left = 1
      Top = 216
      Width = 662
      Height = 96
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 2
      ExplicitLeft = 11
      ExplicitTop = 111
      ExplicitWidth = 640
      object lbl9: TLabel
        Left = 7
        Top = 4
        Width = 107
        Height = 18
        Caption = 'PAYMENT CASHIER:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl10: TLabel
        Left = 8
        Top = 23
        Width = 24
        Height = 16
        Caption = 'Cash'
      end
      object lbl11: TLabel
        Left = 8
        Top = 46
        Width = 59
        Height = 16
        Caption = 'Credit Card'
      end
      object lbl12: TLabel
        Left = 8
        Top = 69
        Width = 54
        Height = 16
        Caption = 'Debit Card'
      end
      object lbl13: TLabel
        Left = 200
        Top = 47
        Width = 88
        Height = 16
        Caption = 'Assalaam Voucher'
      end
      object lbl14: TLabel
        Left = 200
        Top = 70
        Width = 82
        Height = 16
        Caption = 'Deposit Voucher'
      end
      object lbl15: TLabel
        Left = 408
        Top = 21
        Width = 74
        Height = 16
        Caption = 'Other Voucher'
      end
      object Label1: TLabel
        Left = 200
        Top = 23
        Width = 71
        Height = 16
        Caption = 'Discount Card'
      end
      object pnl4: TPanel
        Left = 406
        Top = 50
        Width = 233
        Height = 40
        BevelInner = bvSpace
        BevelOuter = bvLowered
        TabOrder = 0
        object lbl7: TLabel
          Left = 8
          Top = 8
          Width = 84
          Height = 18
          Caption = 'Physical Cash'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Trebuchet MS'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object curredtPhysicCash: TcxCurrencyEdit
          Left = 96
          Top = 8
          ParentFont = False
          TabOrder = 0
          Width = 129
        end
      end
      object curredtCash: TcxCurrencyEdit
        Left = 80
        Top = 23
        TabOrder = 1
        Width = 105
      end
      object curredtCredit: TcxCurrencyEdit
        Left = 80
        Top = 46
        TabOrder = 2
        Width = 105
      end
      object curredtDebit: TcxCurrencyEdit
        Left = 80
        Top = 69
        TabOrder = 3
        Width = 105
      end
      object curredtVoucher: TcxCurrencyEdit
        Left = 292
        Top = 47
        TabOrder = 5
        Width = 105
      end
      object curredtDeposit: TcxCurrencyEdit
        Left = 292
        Top = 70
        TabOrder = 6
        Width = 105
      end
      object curredtVoucherLain: TcxCurrencyEdit
        Left = 500
        Top = 21
        TabOrder = 7
        Width = 105
      end
      object curredtDiscCC: TcxCurrencyEdit
        Left = 292
        Top = 23
        TabOrder = 4
        Width = 105
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 664
    ExplicitWidth = 664
    inherited lblFilterData: TcxLabel
      Left = 310
      ExplicitLeft = 310
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 371
      ExplicitLeft = 371
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 487
      ExplicitLeft = 487
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 582
      ExplicitLeft = 582
    end
    inherited lblsdFilter: TcxLabel
      Left = 463
      ExplicitLeft = 463
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 346
    Width = 664
    ExplicitTop = 346
    ExplicitWidth = 664
    inherited pnlFooter: TPanel
      Width = 664
      ExplicitWidth = 664
      inherited btnAdd: TcxButton
        Action = actAdd
      end
      inherited btnUpdate: TcxButton
        Action = actEdit
        Visible = False
      end
      inherited btnPrint: TcxButton
        Action = actPrint
      end
      inherited btnClose: TcxButton
        Left = 587
        Action = actClose
        ExplicitLeft = 587
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 664
      ExplicitWidth = 664
      inherited lbEscape: TLabel
        Left = 590
        Height = 17
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actAdd: TAction
      OnExecute = actAddExecute
    end
  end
end
