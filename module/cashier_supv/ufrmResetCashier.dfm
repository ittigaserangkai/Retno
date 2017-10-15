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
    ExplicitWidth = 582
    ExplicitHeight = 235
    inherited pgcBrowse: TcxPageControl
      Top = 35
      Width = 580
      Height = 199
      TabOrder = 1
      ExplicitTop = 40
      ExplicitWidth = 580
      ExplicitHeight = 194
      ClientRectBottom = 198
      ClientRectRight = 579
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 578
        ExplicitHeight = 192
        inherited cxGrid: TcxGrid
          Width = 578
          Height = 197
          ExplicitTop = 25
          ExplicitWidth = 578
          ExplicitHeight = 167
        end
      end
    end
    object pnl1: TPanel
      Left = 1
      Top = 1
      Width = 580
      Height = 34
      Align = alTop
      Anchors = [akTop, akRight]
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      object pnl3: TPanel
        Left = 296
        Top = 2
        Width = 282
        Height = 30
        Align = alRight
        BevelOuter = bvNone
        Color = 15198183
        TabOrder = 0
        ExplicitHeight = 35
        object btnResetCashier: TcxButton
          Left = 5
          Top = 1
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
          Top = 1
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
      object lblClearAll: TcxLabel
        Left = 86
        Top = 7
        Cursor = crHandPoint
        ParentCustomHint = False
        Caption = 'Clear All'
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        Style.TextColor = clMenuHighlight
        Transparent = True
        OnClick = lblClearAllClick
        OnMouseEnter = lblClearAllMouseEnter
        OnMouseLeave = lblClearAllMouseLeave
      end
      object lblCheckAll: TcxLabel
        Left = 24
        Top = 7
        Cursor = crHandPoint
        ParentCustomHint = False
        Caption = 'Check All'
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        Style.TextColor = clMenuHighlight
        Transparent = True
        OnClick = lblCheckAllClick
        OnMouseEnter = lblCheckAllMouseEnter
        OnMouseLeave = lblCheckAllMouseLeave
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 582
    ExplicitWidth = 582
    inherited lblFilterData: TcxLabel
      Left = 282
      Visible = True
      ExplicitLeft = 282
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 190
      ExplicitLeft = 190
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 343
      Properties.OnEditValueChanged = dtAkhirFilterPropertiesEditValueChanged
      Visible = True
      ExplicitLeft = 343
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 500
      ExplicitLeft = 500
    end
    inherited lblsdFilter: TcxLabel
      Left = 435
      Caption = 'Shift'
      ExplicitLeft = 435
      AnchorY = 17
    end
    object edtShift: TcxTextEdit
      Tag = 1
      AlignWithMargins = True
      Left = 459
      Top = 4
      Align = alRight
      ParentShowHint = False
      Properties.Alignment.Horz = taCenter
      ShowHint = False
      TabOrder = 5
      OnEnter = edtShiftEnter
      OnExit = edtShiftExit
      OnKeyPress = edtShiftKeyPress
      Width = 35
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
