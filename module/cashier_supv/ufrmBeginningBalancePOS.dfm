inherited frmBeginningBalancePOS: TfrmBeginningBalancePOS
  Caption = 'Beginning Balance'
  ClientHeight = 405
  ClientWidth = 643
  OldCreateOrder = True
  ExplicitWidth = 659
  ExplicitHeight = 444
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 643
    Height = 316
    BorderWidth = 0
    ExplicitWidth = 643
    ExplicitHeight = 260
    inherited pgcBrowse: TcxPageControl
      Left = 1
      Top = 41
      Width = 641
      Height = 274
      ExplicitLeft = 1
      ExplicitTop = 41
      ExplicitWidth = 641
      ExplicitHeight = 218
      ClientRectBottom = 273
      ClientRectRight = 640
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 639
        ExplicitHeight = 216
        inherited cxGrid: TcxGrid
          Width = 639
          Height = 217
          ExplicitWidth = 639
          ExplicitHeight = 216
        end
        object pnl3: TPanel
          Left = 0
          Top = 217
          Width = 639
          Height = 55
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 1
          ExplicitLeft = 1
          ExplicitTop = 204
          ExplicitWidth = 641
          object lbl3: TLabel
            Left = 9
            Top = 5
            Width = 68
            Height = 16
            Caption = 'Cashier Name'
          end
          object lbl4: TLabel
            Left = 9
            Top = 29
            Width = 67
            Height = 16
            Caption = 'Supervisor ID'
          end
          object lbl5: TLabel
            Left = 344
            Top = 4
            Width = 57
            Height = 16
            Caption = 'Grand Total'
          end
          object edtCashierName: TEdit
            Left = 82
            Top = 5
            Width = 121
            Height = 22
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 0
            Text = 'Ani'
          end
          object edtSupervisorID: TEdit
            Left = 82
            Top = 29
            Width = 121
            Height = 22
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 1
            Text = '091'
          end
          object curredtGrandTot: TcxCurrencyEdit
            Left = 406
            Top = 4
            TabOrder = 2
            Width = 121
          end
        end
      end
    end
    object pnl1: TPanel
      Left = 1
      Top = 1
      Width = 641
      Height = 40
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 1
      ExplicitWidth = 639
      object lbl1: TLabel
        Left = 14
        Top = 10
        Width = 24
        Height = 16
        Caption = 'Date'
      end
      object lbl2: TLabel
        Left = 154
        Top = 10
        Width = 23
        Height = 16
        Caption = 'Shift'
      end
      object dt1: TcxDateEdit
        Left = 41
        Top = 8
        TabOrder = 0
        Width = 97
      end
      object edtShift: TEdit
        Left = 181
        Top = 8
        Width = 34
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        MaxLength = 2
        ParentCtl3D = False
        TabOrder = 1
        Text = '1'
        OnChange = edtShiftChange
        OnEnter = edtShiftEnter
        OnExit = edtShiftExit
        OnKeyPress = edtShiftKeyPress
      end
      object btnPrint: TcxButton
        Left = 238
        Top = 4
        Width = 72
        Height = 27
        Cursor = crHandPoint
        Action = actPrint
        TabOrder = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 643
    ExplicitWidth = 643
    inherited lblFilterData: TcxLabel
      Left = 289
      ExplicitLeft = 289
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 350
      ExplicitLeft = 350
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 466
      ExplicitLeft = 466
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 561
      ExplicitLeft = 561
    end
    inherited lblsdFilter: TcxLabel
      Left = 442
      ExplicitLeft = 442
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 349
    Width = 643
    ExplicitTop = 293
    ExplicitWidth = 643
    inherited pnlFooter: TPanel
      Width = 643
      ExplicitWidth = 643
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
        Left = 566
        Action = actClose
        ExplicitLeft = 566
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 643
      ExplicitWidth = 643
      inherited lbEscape: TLabel
        Left = 569
        Height = 17
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actAdd: TAction
      OnExecute = actAddExecute
    end
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
  end
end
