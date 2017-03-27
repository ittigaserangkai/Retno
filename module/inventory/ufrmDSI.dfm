inherited frmDSI: TfrmDSI
  Left = 297
  Top = 177
  Caption = 'Kartu Stock (DSI)'
  ClientHeight = 407
  ClientWidth = 630
  OldCreateOrder = True
  ExplicitWidth = 646
  ExplicitHeight = 446
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 630
    Height = 318
    BorderWidth = 0
    ExplicitWidth = 630
    ExplicitHeight = 262
    inherited pgcBrowse: TcxPageControl
      Left = 1
      Top = 67
      Width = 628
      Height = 250
      TabOrder = 1
      ExplicitLeft = 1
      ExplicitTop = 67
      ExplicitWidth = 628
      ExplicitHeight = 194
      ClientRectBottom = 249
      ClientRectRight = 627
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 626
        ExplicitHeight = 192
        inherited cxGrid: TcxGrid
          Width = 626
          Height = 248
          ExplicitWidth = 626
          ExplicitHeight = 192
        end
      end
    end
    object pnl1: TPanel
      Left = 1
      Top = 1
      Width = 628
      Height = 66
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      object lbl1: TLabel
        Left = 8
        Top = 8
        Width = 96
        Height = 16
        Caption = 'Merchandise Group'
      end
      object lbl2: TLabel
        Left = 35
        Top = 35
        Width = 67
        Height = 16
        Caption = 'Product Code'
      end
      object cbbMerchan: TComboBox
        Left = 111
        Top = 8
        Width = 161
        Height = 24
        BevelKind = bkSoft
        Style = csDropDownList
        Ctl3D = False
        ItemIndex = 0
        ParentCtl3D = False
        TabOrder = 0
        Text = 'All'
        Items.Strings = (
          'All'
          'HARD LINE'
          'SOFT LINE'
          'FRESH & FROZEN'
          'STATIONERY'
          'HOUSE HOLD'
          'ELECTRONIC & TOOLKIT'
          'DRY FOOD')
      end
      object edt1: TEdit
        Left = 111
        Top = 35
        Width = 82
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        OnKeyPress = edt1KeyPress
      end
      object edt2: TEdit
        Left = 199
        Top = 35
        Width = 258
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 2
        OnKeyPress = edt2KeyPress
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 630
    ExplicitWidth = 630
    inherited lblFilterData: TcxLabel
      Left = 276
      ExplicitLeft = 276
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 337
      ExplicitLeft = 337
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 453
      ExplicitLeft = 453
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 548
      ExplicitLeft = 548
    end
    inherited lblsdFilter: TcxLabel
      Left = 429
      ExplicitLeft = 429
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 351
    Width = 630
    ExplicitTop = 295
    ExplicitWidth = 630
    inherited pnlFooter: TPanel
      Width = 630
      ExplicitWidth = 630
      inherited btnAdd: TcxButton
        Action = actAdd
        Visible = False
      end
      inherited btnUpdate: TcxButton
        Action = actEdit
        Visible = False
      end
      inherited btnPrint: TcxButton
        Action = actPrint
      end
      inherited btnClose: TcxButton
        Left = 553
        Action = actClose
        ExplicitLeft = 553
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 630
      ExplicitWidth = 630
      inherited lbEscape: TLabel
        Left = 556
        Height = 17
      end
    end
  end
end
