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
    ExplicitWidth = 679
    ExplicitHeight = 323
    inherited pgcBrowse: TcxPageControl
      Width = 677
      Height = 321
      TabOrder = 1
      ExplicitWidth = 677
      ExplicitHeight = 321
      ClientRectBottom = 320
      ClientRectRight = 676
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 675
        ExplicitHeight = 319
        inherited cxGrid: TcxGrid
          Width = 675
          Height = 263
          ExplicitWidth = 675
          ExplicitHeight = 263
          inherited cxGridView: TcxGridDBTableView
            OnFocusedRecordChanged = cxGridViewFocusedRecordChanged
          end
        end
        object pnl3: TPanel
          Left = 0
          Top = 263
          Width = 675
          Height = 56
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 1
          DesignSize = (
            675
            56)
          object lbl3: TLabel
            Left = 8
            Top = 7
            Width = 68
            Height = 16
            Caption = 'Cashier Name'
          end
          object lbl4: TLabel
            Left = 8
            Top = 32
            Width = 53
            Height = 16
            Caption = 'Supervisor'
          end
          object lblTime: TLabel
            Left = 216
            Top = 7
            Width = 27
            Height = 16
            Caption = 'Time:'
          end
          object lbl7: TcxLabel
            Tag = 1
            Left = 217
            Top = 31
            Cursor = crHandPoint
            Anchors = [akLeft, akBottom]
            Caption = 'History Cash Dropping - Final Payment (F7)'
            Transparent = True
            OnClick = lbl7Click
          end
          object edtClock: TcxTimeEdit
            Left = 249
            Top = 4
            EditValue = 0d
            TabOrder = 1
            Width = 81
          end
          object edtSupervisor: TcxTextEdit
            Left = 82
            Top = 30
            Properties.ReadOnly = True
            TabOrder = 2
            Width = 121
          end
          object edtCashierName: TcxTextEdit
            Left = 82
            Top = 4
            Properties.ReadOnly = True
            TabOrder = 3
            Width = 121
          end
        end
      end
    end
    object pnl5: TPanel
      Left = 209
      Top = 104
      Width = 369
      Height = 81
      BevelOuter = bvLowered
      BorderWidth = 10
      TabOrder = 0
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
      Left = 373
      AutoSize = True
      Visible = True
      ExplicitLeft = 373
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 281
      ExplicitLeft = 281
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 434
      Visible = True
      ExplicitLeft = 434
    end
    inherited btnSearch: TcxButton
      Left = 597
      ExplicitLeft = 597
    end
    inherited lblsdFilter: TcxLabel
      Left = 526
      AutoSize = True
      Caption = 'Shift'
      Visible = True
      ExplicitLeft = 526
      ExplicitWidth = 27
      AnchorY = 17
    end
    object edtShift: TcxTextEdit
      Tag = 1
      AlignWithMargins = True
      Left = 556
      Top = 4
      Align = alRight
      ParentShowHint = False
      Properties.Alignment.Horz = taCenter
      ShowHint = False
      TabOrder = 5
      OnKeyPress = edtShiftKeyPress
      Width = 35
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 356
    Width = 679
    ExplicitTop = 356
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
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 256
    Top = 88
  end
end
