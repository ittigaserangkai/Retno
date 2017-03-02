inherited frmUser: TfrmUser
  Left = 339
  Top = 395
  Caption = 'User'
  ClientHeight = 201
  ClientWidth = 539
  OldCreateOrder = True
  ExplicitWidth = 555
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 539
    Height = 115
    ExplicitWidth = 120
    ExplicitHeight = 115
    object cxGrid: TcxGrid
      Left = 11
      Top = 11
      Width = 517
      Height = 93
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 104
      ExplicitTop = 40
      ExplicitWidth = 250
      ExplicitHeight = 200
      object cxGridDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridDBTableView1
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 539
    ExplicitWidth = 120
  end
  inline fraFooter5Button1: TfraFooter5Button [2]
    Left = 0
    Top = 145
    Width = 539
    Height = 56
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitTop = 145
    ExplicitWidth = 120
    inherited pnlFooter: TPanel
      Width = 539
      ExplicitWidth = 120
      inherited btnClose: TcxButton
        Left = 457
        ExplicitLeft = 38
      end
      inherited btnAdd: TcxButton
        Action = actAddUser
      end
      inherited btnUpdate: TcxButton
        Action = actEditUser
      end
      inherited btnDelete: TcxButton
        Action = actDeleteUser
      end
      inherited btnRefresh: TcxButton
        Action = actRefreshUser
      end
    end
    inherited pnlSortCut: TPanel
      Width = 539
      ExplicitWidth = 120
      inherited lbl5: TLabel
        Left = 449
        ExplicitLeft = 452
      end
    end
  end
  inherited cxStyle: TcxStyleRepository
    PixelsPerInch = 96
  end
  object actlstMerchandiseGroup: TActionList
    Left = 472
    Top = 8
    object actAddUser: TAction
      Caption = 'Add'
      OnExecute = actAddUserExecute
    end
    object actEditUser: TAction
      Caption = 'Edit'
      OnExecute = actEditUserExecute
    end
    object actDeleteUser: TAction
      Caption = 'Delete'
      OnExecute = actDeleteUserExecute
    end
    object actRefreshUser: TAction
      Caption = 'Refresh'
      OnExecute = actRefreshUserExecute
    end
  end
end
