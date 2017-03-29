inherited frmDisplayPOSMonitor: TfrmDisplayPOSMonitor
  Left = 191
  Top = 225
  Caption = 'Display POS Monitor'
  ClientHeight = 350
  ClientWidth = 765
  OldCreateOrder = True
  ExplicitWidth = 781
  ExplicitHeight = 389
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 765
    Height = 261
    BorderWidth = 0
    ExplicitWidth = 765
    ExplicitHeight = 205
    inherited pgcBrowse: TcxPageControl
      Left = 1
      Top = 40
      Width = 763
      Height = 220
      TabOrder = 1
      ExplicitLeft = 1
      ExplicitTop = 40
      ExplicitWidth = 763
      ExplicitHeight = 164
      ClientRectBottom = 219
      ClientRectRight = 762
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 761
        ExplicitHeight = 162
        inherited cxGrid: TcxGrid
          Width = 761
          Height = 198
          ExplicitWidth = 761
          ExplicitHeight = 162
        end
        object pnl3: TPanel
          Left = 0
          Top = 198
          Width = 761
          Height = 20
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          ExplicitLeft = 1
          ExplicitTop = 184
          ExplicitWidth = 763
          DesignSize = (
            761
            20)
          object lbl11: TcxLabel
            Left = 7
            Top = 4
            Cursor = crHandPoint
            Anchors = [akLeft, akBottom]
            Caption = 'Detail Cashback per-POS (Ctrl-D)'
            ParentFont = False
            Transparent = True
            OnClick = lbl11Click
          end
        end
      end
    end
    object pnl1: TPanel
      Left = 1
      Top = 1
      Width = 763
      Height = 39
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
      object lbl3: TLabel
        Left = 147
        Top = 8
        Width = 23
        Height = 16
        Caption = 'Shift'
      end
      object dtNow: TcxDateEdit
        Left = 45
        Top = 8
        TabOrder = 0
        OnKeyPress = dtNowKeyPress
        Width = 89
      end
      object edtShift: TEdit
        Left = 174
        Top = 8
        Width = 35
        Height = 22
        Ctl3D = False
        MaxLength = 2
        ParentCtl3D = False
        TabOrder = 1
        Text = '01'
        OnKeyDown = edtShiftKeyDown
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 765
    ExplicitWidth = 765
    inherited lblFilterData: TcxLabel
      Left = 411
      ExplicitLeft = 411
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 472
      ExplicitLeft = 472
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 588
      ExplicitLeft = 588
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 683
      ExplicitLeft = 683
    end
    inherited lblsdFilter: TcxLabel
      Left = 564
      ExplicitLeft = 564
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 294
    Width = 765
    ExplicitTop = 294
    ExplicitWidth = 765
    inherited pnlFooter: TPanel
      Width = 765
      ExplicitWidth = 765
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
        Left = 688
        Action = actClose
        ExplicitLeft = 688
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 765
      ExplicitWidth = 765
      inherited lbEscape: TLabel
        Left = 691
        Height = 17
      end
    end
  end
end
