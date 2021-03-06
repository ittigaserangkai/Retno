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
    ExplicitWidth = 643
    ExplicitHeight = 316
    inherited pgcBrowse: TcxPageControl
      Width = 641
      Height = 314
      ExplicitWidth = 641
      ExplicitHeight = 314
      ClientRectBottom = 313
      ClientRectRight = 640
      inherited tsBrowse: TcxTabSheet
        ExplicitWidth = 639
        ExplicitHeight = 312
        inherited cxGrid: TcxGrid
          Width = 639
          Height = 257
          ExplicitWidth = 639
          ExplicitHeight = 257
          inherited cxGridView: TcxGridDBTableView
            OnFocusedRecordChanged = cxGridViewFocusedRecordChanged
          end
        end
        object pnl3: TPanel
          Left = 0
          Top = 257
          Width = 639
          Height = 55
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 1
          object lbl3: TLabel
            Left = 9
            Top = 6
            Width = 68
            Height = 16
            Caption = 'Cashier Name'
          end
          object lbl4: TLabel
            Left = 9
            Top = 32
            Width = 67
            Height = 16
            Caption = 'Supervisor ID'
          end
          object lbl5: TLabel
            Left = 344
            Top = 6
            Width = 57
            Height = 16
            Caption = 'Grand Total'
          end
          object curredtGrandTot: TcxCurrencyEdit
            Left = 407
            Top = 3
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;(,0.00)'
            Properties.ReadOnly = True
            TabOrder = 2
            Width = 121
          end
          object edtCashierName: TcxTextEdit
            Left = 82
            Top = 3
            Properties.ReadOnly = True
            TabOrder = 0
            Width = 121
          end
          object edtSupervisorID: TcxTextEdit
            Left = 82
            Top = 29
            Properties.ReadOnly = True
            TabOrder = 1
            Width = 121
          end
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Tag = 1
    Width = 643
    ExplicitWidth = 643
    inherited lblHeader: TLabel
      Tag = 1
    end
    inherited lblFilterData: TcxLabel
      Tag = 1
      Left = 337
      Visible = True
      ExplicitLeft = 343
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Tag = 1
      Left = 398
      Visible = True
      ExplicitLeft = 398
    end
    inherited dtAkhirFilter: TcxDateEdit
      Tag = 1
      Left = 245
      ExplicitLeft = 245
    end
    inherited btnSearch: TcxButton
      Tag = 1
      Left = 561
      ExplicitLeft = 561
    end
    inherited lblsdFilter: TcxLabel
      Tag = 1
      Left = 490
      AutoSize = True
      Caption = 'Shift'
      Visible = True
      ExplicitLeft = 490
      ExplicitWidth = 27
      AnchorY = 17
    end
    object edtShift: TcxTextEdit
      Tag = 1
      AlignWithMargins = True
      Left = 520
      Top = 4
      Align = alRight
      Properties.Alignment.Horz = taCenter
      TabOrder = 5
      OnKeyPress = edtShiftKeyPress
      ExplicitHeight = 21
      Width = 35
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 349
    Width = 643
    ExplicitTop = 349
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
        ExplicitLeft = 569
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
