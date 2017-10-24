inherited frmCashDropping: TfrmCashDropping
  Left = 193
  Top = 185
  Caption = 'Cash Dropping'
  ClientHeight = 457
  ClientWidth = 775
  OldCreateOrder = True
  ExplicitWidth = 791
  ExplicitHeight = 496
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 775
    Height = 368
    ExplicitWidth = 775
    ExplicitHeight = 312
    inherited pgcBrowse: TcxPageControl
      Top = 39
      Width = 773
      Height = 328
      TabOrder = 2
      ExplicitTop = 39
      ExplicitWidth = 773
      ExplicitHeight = 272
      ClientRectBottom = 327
      ClientRectRight = 772
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 771
        ExplicitHeight = 326
        inherited cxGrid: TcxGrid
          Width = 771
          Height = 270
          ExplicitWidth = 771
          ExplicitHeight = 270
        end
        object pnl3: TPanel
          Left = 0
          Top = 270
          Width = 771
          Height = 56
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 1
          DesignSize = (
            771
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
          object lbl8: TcxLabel
            Left = 217
            Top = 32
            Cursor = crHandPoint
            Anchors = [akLeft, akBottom]
            Caption = 'History Cash Dropping (F7)'
            ParentFont = False
            Transparent = True
            OnClick = lbl8Click
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
      Width = 773
      Height = 38
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      object lbl1: TLabel
        Left = 16
        Top = 7
        Width = 24
        Height = 16
        Caption = 'Date'
      end
      object lbl2: TLabel
        Left = 151
        Top = 7
        Width = 23
        Height = 16
        Caption = 'Shift'
      end
      object edtShift: TEdit
        Left = 176
        Top = 7
        Width = 49
        Height = 22
        Ctl3D = False
        MaxLength = 25
        ParentCtl3D = False
        TabOrder = 1
        OnChange = edtShiftChange
        OnEnter = edtShiftEnter
        OnExit = edtShiftExit
        OnKeyPress = edtShiftKeyPress
      end
      object dt1: TcxDateEdit
        Left = 43
        Top = 7
        TabOrder = 0
        Width = 97
      end
    end
    object pnl5: TPanel
      Left = 109
      Top = 80
      Width = 369
      Height = 81
      BevelOuter = bvLowered
      BorderWidth = 10
      TabOrder = 1
      Visible = False
      object lbl16: TLabel
        Left = 11
        Top = 11
        Width = 321
        Height = 54
        Align = alClient
        Alignment = taCenter
        Caption = 
          'Program hanya menampilkan dan hanya '#13#10'bisa dilakukan pada termin' +
          'al / POS yang masih aktif'#13#10'(Belum di RESET) pada hari ini..!'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 775
    ExplicitWidth = 775
    inherited lblFilterData: TcxLabel
      Left = 421
      ExplicitLeft = 421
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 482
      ExplicitLeft = 482
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 598
      ExplicitLeft = 598
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 693
      ExplicitLeft = 693
    end
    inherited lblsdFilter: TcxLabel
      Left = 574
      ExplicitLeft = 574
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 401
    Width = 775
    ExplicitTop = 345
    ExplicitWidth = 775
    inherited pnlFooter: TPanel
      Width = 775
      ExplicitWidth = 775
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
        Left = 698
        Action = actClose
        ExplicitLeft = 698
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 775
      ExplicitWidth = 775
      inherited lbEscape: TLabel
        Left = 701
        ExplicitLeft = 701
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actAdd: TAction
      OnExecute = actAddExecute
    end
  end
end
