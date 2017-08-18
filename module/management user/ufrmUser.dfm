inherited frmUser: TfrmUser
  Left = 339
  Top = 395
  Caption = 'User'
  ClientHeight = 325
  ClientWidth = 607
  OldCreateOrder = True
  ExplicitWidth = 623
  ExplicitHeight = 364
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 607
    Height = 239
    ExplicitWidth = 539
    ExplicitHeight = 115
    object cxGrid: TcxGrid
      Left = 11
      Top = 11
      Width = 585
      Height = 217
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 517
      ExplicitHeight = 93
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
    Width = 607
    ExplicitWidth = 539
    inherited lblHeader: TLabel
      Height = 18
    end
  end
  inline fraFooter5Button1: TfraFooter5Button
    Left = 0
    Top = 269
    Width = 607
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
    ExplicitWidth = 539
    inherited pnlFooter: TPanel
      Width = 607
      ExplicitWidth = 539
      inherited btnClose: TcxButton
        Left = 525
        ExplicitLeft = 457
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
      Width = 607
      ExplicitWidth = 539
      inherited lbl5: TLabel
        Left = 517
        ExplicitLeft = 452
      end
    end
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
