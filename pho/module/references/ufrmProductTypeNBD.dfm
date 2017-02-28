inherited frmProductTypeNBD: TfrmProductTypeNBD
  Left = 329
  Top = 287
  Caption = 'NBD'#39's Product Type'
  ClientHeight = 336
  ClientWidth = 537
  OldCreateOrder = True
  ExplicitWidth = 553
  ExplicitHeight = 375
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 537
    Height = 250
    ExplicitWidth = 120
    ExplicitHeight = 247
    object pnl1: TPanel
      Left = 11
      Top = 105
      Width = 515
      Height = 134
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      ExplicitTop = 102
      ExplicitWidth = 98
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
    object pnl2: TPanel
      Left = 11
      Top = 11
      Width = 515
      Height = 94
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 1
      ExplicitWidth = 98
      ExplicitHeight = 91
      object cxGrid: TcxGrid
        Left = 2
        Top = 2
        Width = 511
        Height = 90
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 11
        ExplicitTop = 11
        ExplicitWidth = 227
        ExplicitHeight = 513
        object cxGridViewTipeProdukNBD: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridViewTipeProdukNBD
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 537
    ExplicitWidth = 120
  end
  inline fraFooter5Button1: TfraFooter5Button
    Left = 0
    Top = 280
    Width = 537
    Height = 56
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitTop = -56
    ExplicitWidth = 120
    inherited pnlFooter: TPanel
      Width = 537
      ExplicitWidth = 120
      inherited btnClose: TcxButton
        Left = 455
        ExplicitLeft = 38
      end
      inherited btnAdd: TcxButton
        Action = actAddProductTypeNBD
      end
      inherited btnUpdate: TcxButton
        Action = actEditProductTypeNBD
      end
      inherited btnDelete: TcxButton
        Action = actDeleteProductTypeNBD
      end
      inherited btnRefresh: TcxButton
        Action = actRefreshProductTypeNBD
      end
    end
    inherited pnlSortCut: TPanel
      Width = 537
      ExplicitWidth = 120
      inherited lbl5: TLabel
        Left = 447
        ExplicitLeft = 452
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
