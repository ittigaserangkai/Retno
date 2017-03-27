inherited frmFinalPayment: TfrmFinalPayment
  Left = 384
  Top = 135
  Caption = 'Final Payment'
  ClientHeight = 412
  ClientWidth = 679
  OldCreateOrder = True
  ExplicitWidth = 695
  ExplicitHeight = 451
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 679
    Height = 323
    BorderWidth = 0
    ExplicitWidth = 679
    ExplicitHeight = 267
    inherited pgcBrowse: TcxPageControl
      Left = 1
      Top = 38
      Width = 677
      Height = 284
      TabOrder = 2
      ExplicitLeft = 1
      ExplicitTop = 38
      ExplicitWidth = 677
      ExplicitHeight = 228
      ClientRectBottom = 283
      ClientRectRight = 676
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 675
        ExplicitHeight = 226
        inherited cxGrid: TcxGrid
          Width = 675
          Height = 226
          ExplicitWidth = 675
          ExplicitHeight = 226
        end
        object pnl3: TPanel
          Left = 0
          Top = 226
          Width = 675
          Height = 56
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 1
          ExplicitLeft = 11
          ExplicitTop = 161
          ExplicitWidth = 655
          DesignSize = (
            675
            56)
          object lbl3: TLabel
            Left = 8
            Top = 6
            Width = 68
            Height = 16
            Caption = 'Cashier Name'
          end
          object lbl4: TLabel
            Left = 8
            Top = 30
            Width = 53
            Height = 16
            Caption = 'Supervisor'
          end
          object lbl5: TLabel
            Left = 216
            Top = 8
            Width = 27
            Height = 16
            Caption = 'Time:'
          end
          object lbl7: TcxLabel
            Left = 217
            Top = 32
            Cursor = crHandPoint
            Anchors = [akLeft, akBottom]
            Caption = 'History Cash Dropping - Final Payment (F7)'
            ParentFont = False
            Transparent = True
            OnClick = lbl7Click
          end
          object edtCashierName: TEdit
            Left = 80
            Top = 6
            Width = 121
            Height = 22
            Ctl3D = False
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 0
            Text = 'Ani'
          end
          object edtSupervisor: TEdit
            Left = 80
            Top = 30
            Width = 121
            Height = 22
            Ctl3D = False
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 1
            Text = 'Adi Nugroho'
          end
        end
      end
    end
    object pnl1: TPanel
      Left = 1
      Top = 1
      Width = 677
      Height = 37
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      object lbl1: TLabel
        Left = 14
        Top = 7
        Width = 24
        Height = 16
        Caption = 'Date'
      end
      object lbl2: TLabel
        Left = 150
        Top = 7
        Width = 23
        Height = 16
        Caption = 'Shift'
      end
      object dtDate: TcxDateEdit
        Left = 40
        Top = 7
        TabOrder = 0
        OnKeyUp = dtDateKeyUp
        Width = 97
      end
      object edtShift: TEdit
        Left = 176
        Top = 7
        Width = 49
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 2
        ParentCtl3D = False
        TabOrder = 1
        Text = '01'
        OnKeyPress = edtShiftKeyPress
      end
    end
    object pnl5: TPanel
      Left = 232
      Top = 128
      Width = 369
      Height = 81
      BevelOuter = bvLowered
      BorderWidth = 10
      TabOrder = 1
      Visible = False
      object lbl16: TLabel
        Left = 11
        Top = 11
        Width = 347
        Height = 59
        Align = alClient
        Alignment = taCenter
        Caption = 
          'Progam hanya menampilkan dan digunakan'#13#10'pada transaksi kasir yg ' +
          'sudah di "RESET", hari ini'#13#10'atau transaksi yg kemarin..!'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 306
        ExplicitHeight = 54
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 679
    ExplicitWidth = 679
    inherited lblFilterData: TcxLabel
      Left = 325
      ExplicitLeft = 325
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 386
      ExplicitLeft = 386
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 502
      ExplicitLeft = 502
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 597
      ExplicitLeft = 597
    end
    inherited lblsdFilter: TcxLabel
      Left = 478
      ExplicitLeft = 478
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 356
    Width = 679
    ExplicitTop = 300
    ExplicitWidth = 679
    inherited pnlFooter: TPanel
      Width = 679
      ExplicitWidth = 679
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
        Left = 602
        Action = actClose
        ExplicitLeft = 602
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 679
      ExplicitWidth = 679
      inherited lbEscape: TLabel
        Left = 605
        Height = 17
        ExplicitLeft = 605
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actAdd: TAction
      OnExecute = actAddExecute
    end
  end
end
