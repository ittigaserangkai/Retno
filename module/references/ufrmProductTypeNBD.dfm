inherited frmProductTypeNBD: TfrmProductTypeNBD
  Left = 329
  Top = 287
  Caption = 'NBD'#39's Product Type'
  ClientHeight = 336
  ClientWidth = 537
  OldCreateOrder = True
  ExplicitTop = 8
  ExplicitWidth = 553
  ExplicitHeight = 375
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 537
    Height = 247
    ExplicitWidth = 537
    ExplicitHeight = 191
    inherited pgcBrowse: TcxPageControl
      Width = 515
      Height = 91
      TabOrder = 1
      ExplicitWidth = 515
      ExplicitHeight = 91
      ClientRectBottom = 90
      ClientRectRight = 514
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        inherited cxGrid: TcxGrid
          Width = 515
          Height = 91
          ExplicitWidth = 515
          ExplicitHeight = 35
        end
      end
    end
    object pnl1: TPanel
      Left = 11
      Top = 102
      Width = 515
      Height = 134
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      ExplicitTop = 46
      object lbl1: TLabel
        Left = 17
        Top = 16
        Width = 33
        Height = 16
        AutoSize = False
        Caption = 'Owner'
      end
      object lbl2: TLabel
        Left = 17
        Top = 43
        Width = 104
        Height = 16
        AutoSize = False
        Caption = 'Cost Center Desc'
      end
      object lbl3: TLabel
        Left = 17
        Top = 70
        Width = 104
        Height = 16
        AutoSize = False
        Caption = 'Account Name (DB)'
      end
      object lbl4: TLabel
        Left = 17
        Top = 97
        Width = 104
        Height = 16
        AutoSize = False
        Caption = 'Account Name (CR)'
      end
      object edtOwner: TEdit
        Left = 116
        Top = 13
        Width = 73
        Height = 22
        Ctl3D = False
        MaxLength = 4
        ParentCtl3D = False
        TabOrder = 0
        Text = 'MARKETING'
      end
      object edtCostCenterDesc: TEdit
        Left = 116
        Top = 40
        Width = 277
        Height = 22
        Ctl3D = False
        MaxLength = 20
        ParentCtl3D = False
        TabOrder = 1
        Text = 'DESC COST CENTER'
      end
      object edtAccNameDB: TEdit
        Left = 116
        Top = 67
        Width = 277
        Height = 22
        Ctl3D = False
        MaxLength = 20
        ParentCtl3D = False
        TabOrder = 2
        Text = 'PIUTANG VVV'
      end
      object edtAccNameCR: TEdit
        Left = 116
        Top = 94
        Width = 277
        Height = 22
        Ctl3D = False
        MaxLength = 20
        ParentCtl3D = False
        TabOrder = 3
        Text = 'PENDAPATAN VVV'
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 537
    ExplicitWidth = 537
    inherited lblFilterData: TcxLabel
      Left = 183
      ExplicitLeft = 183
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 244
      ExplicitLeft = 244
      ExplicitHeight = 24
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 360
      ExplicitLeft = 360
      ExplicitHeight = 24
    end
    inherited btnSearch: TcxButton
      Left = 455
      ExplicitLeft = 455
    end
    inherited lblsdFilter: TcxLabel
      Left = 336
      ExplicitLeft = 336
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 280
    Width = 537
    ExplicitTop = 280
    ExplicitWidth = 537
    inherited pnlFooter: TPanel
      Width = 537
      ExplicitWidth = 537
      inherited btnAdd: TcxButton
        Action = actAddProductTypeNBD
      end
      inherited btnUpdate: TcxButton
        Action = actEditProductTypeNBD
      end
      inherited btnPrint: TcxButton
        Action = actPrint
      end
      inherited btnClose: TcxButton
        Left = 455
        Action = actClose
        ExplicitLeft = 455
      end
    end
    inherited pnlShortCut: TPanel
      inherited lbEscape: TLabel
        Height = 16
      end
    end
  end
  object actlst1: TActionList
    Left = 504
    Top = 8
    object actAddProductTypeNBD: TAction
      Caption = 'Add'
      OnExecute = actAddProductTypeNBDExecute
    end
    object actEditProductTypeNBD: TAction
      Caption = 'Edit'
      OnExecute = actEditProductTypeNBDExecute
    end
    object actDeleteProductTypeNBD: TAction
      Caption = 'Delete'
      OnExecute = actDeleteProductTypeNBDExecute
    end
    object actRefreshProductTypeNBD: TAction
      Caption = 'Refresh'
      OnExecute = actRefreshProductTypeNBDExecute
    end
  end
end
