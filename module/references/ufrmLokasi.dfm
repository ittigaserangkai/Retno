inherited frmLokasi: TfrmLokasi
  Left = 336
  Top = 287
  Caption = 'Location'
  ClientHeight = 341
  ClientWidth = 540
  OldCreateOrder = True
  ExplicitWidth = 556
  ExplicitHeight = 380
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 540
    Height = 255
    ExplicitWidth = 120
    ExplicitHeight = 247
    object cxGrid: TcxGrid
      Left = 11
      Top = 11
      Width = 518
      Height = 233
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 112
      ExplicitTop = 120
      ExplicitWidth = 250
      ExplicitHeight = 200
      object cxGridViewLocation: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridViewLocation
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 540
    ExplicitWidth = 120
  end
  inline fraFooter5Button1: TfraFooter5Button
    Left = 0
    Top = 285
    Width = 540
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
      Width = 540
      ExplicitWidth = 120
      inherited btnClose: TcxButton
        Left = 458
        ExplicitLeft = 38
      end
      inherited btnAdd: TcxButton
        Action = actAddLokasi
      end
      inherited btnUpdate: TcxButton
        Left = 91
        Action = actEditLokasi
        ExplicitLeft = 91
      end
      inherited btnDelete: TcxButton
        Action = actDeleteLokasi
      end
      inherited btnRefresh: TcxButton
        Action = actRefreshLokasi
      end
    end
    inherited pnlSortCut: TPanel
      Width = 540
      ExplicitWidth = 120
      inherited lbl5: TLabel
        Left = 450
        ExplicitLeft = 452
      end
    end
  end
  object actlstLokasi: TActionList
    Left = 440
    Top = 16
    object actAddLokasi: TAction
      Caption = 'Add'
      OnExecute = actAddLokasiExecute
    end
    object actEditLokasi: TAction
      Caption = 'Edit'
      OnExecute = actEditLokasiExecute
    end
    object actDeleteLokasi: TAction
      Caption = 'Delete'
      OnExecute = actDeleteLokasiExecute
    end
    object actRefreshLokasi: TAction
      Caption = 'Refresh'
      OnExecute = actRefreshLokasiExecute
    end
  end
end
