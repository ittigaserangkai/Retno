inherited frmResetCashier: TfrmResetCashier
  Caption = 'Reset Cashier'
  ClientHeight = 324
  ClientWidth = 582
  OldCreateOrder = True
  ExplicitWidth = 598
  ExplicitHeight = 363
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 582
    Height = 235
    BorderWidth = 0
    ExplicitWidth = 582
    ExplicitHeight = 235
    inherited pgcBrowse: TcxPageControl
      Left = 1
      Top = 40
      Width = 580
      Height = 194
      TabOrder = 1
      ExplicitLeft = 1
      ExplicitTop = 40
      ExplicitWidth = 580
      ExplicitHeight = 194
      ClientRectBottom = 193
      ClientRectRight = 579
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 578
        ExplicitHeight = 192
        inherited cxGrid: TcxGrid
          Top = 25
          Width = 578
          Height = 167
          ExplicitTop = 25
          ExplicitWidth = 578
          ExplicitHeight = 167
        end
        object pnl2: TPanel
          Left = 0
          Top = 0
          Width = 578
          Height = 25
          Align = alTop
          BevelOuter = bvLowered
          BorderWidth = 20
          TabOrder = 1
          object lbl4: TLabel
            Left = 73
            Top = 3
            Width = 4
            Height = 16
            Caption = '-'
          end
          object lbl8: TcxLabel
            Left = 24
            Top = 3
            Cursor = crHandPoint
            Caption = 'Check All'
            ParentFont = False
            Transparent = True
            OnClick = lbl8Click
          end
          object lbl3: TcxLabel
            Left = 81
            Top = 3
            Cursor = crHandPoint
            Caption = 'Clear All'
            ParentFont = False
            Transparent = True
            OnClick = lbl3Click
          end
        end
      end
    end
    object pnl1: TPanel
      Left = 1
      Top = 1
      Width = 580
      Height = 39
      Align = alTop
      Anchors = [akTop, akRight]
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      object lbl1: TLabel
        Left = 20
        Top = 11
        Width = 24
        Height = 16
        Caption = 'Date'
      end
      object lbl2: TLabel
        Left = 148
        Top = 11
        Width = 23
        Height = 16
        Caption = 'Shift'
        Visible = False
      end
      object edtShift: TEdit
        Left = 173
        Top = 8
        Width = 35
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        Text = '1'
        Visible = False
        OnChange = edtShiftChange
        OnEnter = edtShiftEnter
        OnExit = edtShiftExit
        OnKeyPress = edtShiftKeyPress
      end
      object dtActivate: TcxDateEdit
        Left = 46
        Top = 8
        TabOrder = 1
        OnExit = dtActivateExit
        OnKeyPress = edtShiftKeyPress
        Width = 89
      end
      object pnl3: TPanel
        Left = 296
        Top = 2
        Width = 282
        Height = 35
        Align = alRight
        BevelOuter = bvNone
        Color = 15198183
        TabOrder = 2
        object btnResetCashier: TcxButton
          Left = 5
          Top = 4
          Width = 130
          Height = 27
          Cursor = crHandPoint
          Action = actResetCashier
          TabOrder = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object btnUnResetCashier: TcxButton
          Left = 136
          Top = 4
          Width = 145
          Height = 27
          Cursor = crHandPoint
          Action = actUnResetCashier
          TabOrder = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 582
    ExplicitWidth = 582
    inherited lblFilterData: TcxLabel
      Left = 228
      ExplicitLeft = 228
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 289
      ExplicitLeft = 289
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 405
      ExplicitLeft = 405
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 500
      ExplicitLeft = 500
    end
    inherited lblsdFilter: TcxLabel
      Left = 381
      ExplicitLeft = 381
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 268
    Width = 582
    ExplicitTop = 268
    ExplicitWidth = 582
    inherited pnlFooter: TPanel
      Width = 582
      ExplicitWidth = 582
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
        Left = 505
        Action = actClose
        ExplicitLeft = 505
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 582
      ExplicitWidth = 582
      inherited lbEscape: TLabel
        Left = 508
        Height = 17
        ExplicitLeft = 508
      end
    end
  end
  inherited actlstBrowse: TActionList
    object actResetCashier: TAction
      Caption = 'Reset (ctrl-[Enter])'
      ImageIndex = 14
      OnExecute = actResetCashierExecute
    end
    object actUnResetCashier: TAction
      Caption = 'UnReset (shift-[Enter])'
      ImageIndex = 20
      OnExecute = actUnResetCashierExecute
    end
  end
end
