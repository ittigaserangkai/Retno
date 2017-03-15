inherited frmMasterProductNBD: TfrmMasterProductNBD
  Left = 231
  Top = 141
  Caption = 'NBD'#39's Master Product'
  ClientHeight = 398
  ClientWidth = 659
  OldCreateOrder = True
  ExplicitTop = 8
  ExplicitWidth = 675
  ExplicitHeight = 437
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Top = 74
    Width = 659
    Height = 268
    ExplicitTop = 74
    ExplicitWidth = 120
    ExplicitHeight = 208
    object pnl1: TPanel [0]
      Left = 11
      Top = 123
      Width = 637
      Height = 134
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 1
      ExplicitTop = 63
      ExplicitWidth = 98
      object lbl1: TLabel
        Left = 17
        Top = 15
        Width = 97
        Height = 16
        AutoSize = False
        Caption = 'Product Desription'
      end
      object lbl2: TLabel
        Left = 17
        Top = 42
        Width = 104
        Height = 16
        AutoSize = False
        Caption = 'Product Type'
      end
      object lbl3: TLabel
        Left = 17
        Top = 70
        Width = 104
        Height = 16
        AutoSize = False
        Caption = 'Account (DB)'
      end
      object lbl4: TLabel
        Left = 17
        Top = 97
        Width = 104
        Height = 16
        AutoSize = False
        Caption = 'Account (CR)'
      end
      object edtProductDesc: TEdit
        Left = 116
        Top = 13
        Width = 389
        Height = 22
        Ctl3D = False
        MaxLength = 4
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        Text = 'MARKETING'
      end
      object edtProductType: TEdit
        Left = 116
        Top = 40
        Width = 77
        Height = 22
        Ctl3D = False
        MaxLength = 20
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
        Text = 'DESC COST CENTER'
      end
      object edtProductTypeName: TEdit
        Left = 197
        Top = 40
        Width = 196
        Height = 22
        Ctl3D = False
        MaxLength = 20
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 2
        Text = 'PIUTANG VVV'
      end
      object edtAccountDB: TEdit
        Left = 116
        Top = 68
        Width = 77
        Height = 22
        Ctl3D = False
        MaxLength = 20
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 3
        Text = 'DESC COST CENTER'
      end
      object edtAccountNameDB: TEdit
        Left = 197
        Top = 68
        Width = 196
        Height = 22
        Ctl3D = False
        MaxLength = 20
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 4
        Text = 'PIUTANG VVV'
      end
      object edtAccountCR: TEdit
        Left = 116
        Top = 95
        Width = 77
        Height = 22
        Ctl3D = False
        MaxLength = 20
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 5
        Text = 'DESC COST CENTER'
      end
      object edtAccountNameCR: TEdit
        Left = 197
        Top = 95
        Width = 196
        Height = 22
        Ctl3D = False
        MaxLength = 20
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 6
        Text = 'PIUTANG VVV'
      end
    end
    inherited pgcBrowse: TcxPageControl
      Width = 637
      Height = 112
      ExplicitWidth = 637
      ExplicitHeight = 112
      ClientRectBottom = 111
      ClientRectRight = 636
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        inherited cxGrid: TcxGrid
          Width = 637
          Height = 112
          ExplicitLeft = 2
          ExplicitTop = 2
          ExplicitWidth = 633
          ExplicitHeight = 52
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 659
    ExplicitWidth = 659
    inherited lblFilterData: TcxLabel
      Left = 305
      ExplicitLeft = 305
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 366
      ExplicitLeft = -214
      ExplicitHeight = 24
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 482
      ExplicitLeft = -86
      ExplicitHeight = 24
    end
    inherited btnSearch: TcxButton
      Left = 577
      ExplicitLeft = 577
    end
    inherited lblsdFilter: TcxLabel
      Left = 458
      ExplicitLeft = 458
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 342
    Width = 659
    TabOrder = 3
    ExplicitTop = -112
    ExplicitWidth = 120
    inherited pnlFooter: TPanel
      Width = 659
      ExplicitWidth = 120
      inherited btnAdd: TcxButton
        Action = actAddMasterProductNBD
      end
      inherited btnUpdate: TcxButton
        Action = actEditMasterProductNBD
      end
      inherited btnPrint: TcxButton
        Action = actPrint
      end
      inherited btnClose: TcxButton
        Left = 577
        Action = actClose
        ExplicitLeft = 38
      end
    end
    inherited pnlShortCut: TPanel
      inherited lbEscape: TLabel
        Height = 16
      end
    end
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 33
    Width = 659
    Height = 41
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 2
    ExplicitWidth = 120
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 61
      Height = 16
      Caption = 'Search Data'
    end
    object edtSearch: TEdit
      Left = 80
      Top = 8
      Width = 121
      Height = 22
      TabOrder = 0
      OnChange = edtSearchChange
    end
  end
  object actlst1: TActionList
    Left = 504
    Top = 8
    object actAddMasterProductNBD: TAction
      Caption = 'Add'
      OnExecute = actAddMasterProductNBDExecute
    end
    object actEditMasterProductNBD: TAction
      Caption = 'Edit / Lihat'
      OnExecute = actEditMasterProductNBDExecute
    end
    object actDeleteMasterProductNBD: TAction
      Caption = 'Delete'
      OnExecute = actDeleteMasterProductNBDExecute
    end
    object actRefreshMasterProductNBD: TAction
      Caption = 'Refresh'
      OnExecute = actRefreshMasterProductNBDExecute
    end
  end
end
