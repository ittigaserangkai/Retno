inherited frmDisplayPOSTransaction: TfrmDisplayPOSTransaction
  Left = 126
  Top = 137
  Caption = 'Display POS Transaction'
  ClientHeight = 343
  ClientWidth = 759
  OldCreateOrder = True
  ExplicitWidth = 775
  ExplicitHeight = 382
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 759
    Height = 254
    ExplicitWidth = 759
    ExplicitHeight = 198
    inherited pgcBrowse: TcxPageControl
      Top = 40
      Width = 757
      Height = 213
      TabOrder = 1
      ExplicitTop = 40
      ExplicitWidth = 757
      ExplicitHeight = 157
      ClientRectBottom = 212
      ClientRectRight = 756
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 755
        ExplicitHeight = 211
        inherited cxGrid: TcxGrid
          Width = 755
          Height = 192
          ExplicitWidth = 755
          ExplicitHeight = 155
        end
        object pnl3: TPanel
          Left = 0
          Top = 192
          Width = 755
          Height = 19
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          DesignSize = (
            755
            19)
          object lbl11: TcxLabel
            Left = 2
            Top = 2
            Cursor = crHandPoint
            Anchors = [akLeft, akBottom]
            Caption = 'Detail (Ctrl-D)'
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
      Width = 757
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
      object lbl2: TLabel
        Left = 144
        Top = 8
        Width = 47
        Height = 16
        Caption = 'POS Code'
      end
      object dtNow: TcxDateEdit
        Left = 45
        Top = 8
        TabOrder = 0
        Width = 89
      end
      object edtPos: TEdit
        Left = 198
        Top = 8
        Width = 51
        Height = 22
        Ctl3D = False
        MaxLength = 2
        ParentCtl3D = False
        TabOrder = 1
        Text = '01'
        OnKeyPress = edtPosKeyPress
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 759
    ExplicitWidth = 759
    inherited lblFilterData: TcxLabel
      Left = 405
      ExplicitLeft = 405
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 466
      ExplicitLeft = 466
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 582
      ExplicitLeft = 582
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 677
      ExplicitLeft = 677
    end
    inherited lblsdFilter: TcxLabel
      Left = 558
      ExplicitLeft = 558
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 287
    Width = 759
    ExplicitTop = 287
    ExplicitWidth = 759
    inherited pnlFooter: TPanel
      Width = 759
      ExplicitWidth = 759
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
        Left = 682
        Action = actClose
        ExplicitLeft = 682
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 759
      ExplicitWidth = 759
      inherited lbEscape: TLabel
        Left = 685
        ExplicitLeft = 685
      end
    end
  end
end
