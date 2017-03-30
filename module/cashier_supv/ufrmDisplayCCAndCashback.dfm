inherited frmDisplayCCAndCashback: TfrmDisplayCCAndCashback
  Left = 76
  Caption = 'Display Credit Card And Cashback'
  ClientHeight = 394
  ClientWidth = 785
  OldCreateOrder = True
  ExplicitWidth = 801
  ExplicitHeight = 433
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 785
    Height = 305
    BorderWidth = 0
    ExplicitWidth = 785
    ExplicitHeight = 249
    inherited pgcBrowse: TcxPageControl
      Left = 1
      Top = 42
      Width = 783
      Height = 181
      TabOrder = 1
      ExplicitLeft = 1
      ExplicitTop = 42
      ExplicitWidth = 783
      ExplicitHeight = 206
      ClientRectBottom = 180
      ClientRectRight = 782
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 781
        ExplicitHeight = 204
        inherited cxGrid: TcxGrid
          Width = 781
          Height = 179
          ExplicitWidth = 781
          ExplicitHeight = 204
        end
      end
    end
    object pnl1: TPanel
      Left = 1
      Top = 1
      Width = 783
      Height = 41
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      object lbl1: TLabel
        Left = 16
        Top = 8
        Width = 24
        Height = 16
        Caption = 'Date'
      end
      object lbl2: TLabel
        Left = 144
        Top = 8
        Width = 96
        Height = 16
        Caption = 'POS Code From - To'
      end
      object lbl3: TLabel
        Left = 285
        Top = 10
        Width = 4
        Height = 16
        Caption = '-'
      end
      object dtDate: TcxDateEdit
        Left = 45
        Top = 8
        TabOrder = 0
        OnKeyPress = dtDateKeyPress
        Width = 89
      end
      object edtPos1: TEdit
        Left = 248
        Top = 8
        Width = 33
        Height = 22
        Ctl3D = False
        MaxLength = 2
        ParentCtl3D = False
        TabOrder = 1
        Text = '01'
        OnKeyPress = edtPos1KeyPress
      end
      object edtPos2: TEdit
        Left = 293
        Top = 8
        Width = 33
        Height = 22
        Ctl3D = False
        MaxLength = 2
        ParentCtl3D = False
        TabOrder = 2
        Text = '03'
        OnKeyPress = edtPos2KeyPress
      end
    end
    object pnl3: TPanel
      Left = 1
      Top = 223
      Width = 783
      Height = 81
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 2
      ExplicitTop = 124
      ExplicitWidth = 781
      object lbl4: TLabel
        Left = 10
        Top = 6
        Width = 69
        Height = 16
        Caption = 'Authorize No.'
      end
      object lbl5: TLabel
        Left = 10
        Top = 30
        Width = 54
        Height = 16
        Caption = 'Card Name'
      end
      object lbl6: TLabel
        Left = 336
        Top = 8
        Width = 68
        Height = 16
        Caption = 'Cashier Name'
      end
      object lbl7: TLabel
        Left = 336
        Top = 30
        Width = 23
        Height = 16
        Caption = 'Shift'
      end
      object lbl8: TLabel
        Left = 336
        Top = 56
        Width = 85
        Height = 16
        Caption = 'Transaction Time'
      end
      object edtAuthNo: TEdit
        Left = 83
        Top = 6
        Width = 121
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
      end
      object edtCardNm: TEdit
        Left = 83
        Top = 30
        Width = 238
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
      end
      object edtCNm: TEdit
        Left = 427
        Top = 6
        Width = 158
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 2
      end
      object edtShiftNm: TEdit
        Left = 427
        Top = 30
        Width = 46
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 3
      end
      object edtTransDT: TEdit
        Left = 427
        Top = 54
        Width = 78
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 4
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 785
    ExplicitWidth = 785
    inherited lblFilterData: TcxLabel
      Left = 431
      ExplicitLeft = 431
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 492
      ExplicitLeft = 492
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 608
      ExplicitLeft = 608
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 703
      ExplicitLeft = 703
    end
    inherited lblsdFilter: TcxLabel
      Left = 584
      ExplicitLeft = 584
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 338
    Width = 785
    ExplicitTop = 338
    ExplicitWidth = 785
    inherited pnlFooter: TPanel
      Width = 785
      ExplicitWidth = 785
      inherited btnAdd: TcxButton
        Action = actAdd
      end
      inherited btnUpdate: TcxButton
        Action = actEdit
      end
      inherited btnPrint: TcxButton
        Action = actPrint
      end
      inherited btnClose: TcxButton
        Left = 708
        Action = actClose
        ExplicitLeft = 708
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 785
      ExplicitWidth = 785
      inherited lbEscape: TLabel
        Left = 711
        ExplicitLeft = 711
      end
    end
  end
end
