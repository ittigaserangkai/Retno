inherited frmSatuan: TfrmSatuan
  Left = 223
  Top = 160
  Caption = 'Unit Of Measure'
  ClientHeight = 334
  ClientWidth = 542
  OldCreateOrder = True
  ExplicitWidth = 558
  ExplicitHeight = 373
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 542
    Height = 248
    ExplicitWidth = 542
    ExplicitHeight = 248
    object cxGrid: TcxGrid
      Left = 11
      Top = 11
      Width = 520
      Height = 226
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 8
      ExplicitTop = 8
      ExplicitWidth = 521
      ExplicitHeight = 233
      object cxGridViewSatuan: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridViewSatuan
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 542
    ExplicitWidth = 542
  end
  inline fraFooter5Button1: TfraFooter5Button
    Left = 0
    Top = 278
    Width = 542
    Height = 56
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitTop = 278
    ExplicitWidth = 542
    inherited pnlFooter: TPanel
      Width = 542
      ExplicitWidth = 542
      inherited btnClose: TcxButton
        Left = 460
        ExplicitLeft = 460
      end
      inherited btnAdd: TcxButton
        Action = actAddSatuan
      end
      inherited btnUpdate: TcxButton
        Action = actEditSatuan
      end
      inherited btnDelete: TcxButton
        Action = actDeleteSatuan
      end
      inherited btnRefresh: TcxButton
        Action = actRefreshSatuan
      end
    end
    inherited pnlSortCut: TPanel
      Width = 542
      ExplicitWidth = 542
      inherited lbl5: TLabel
        Left = 452
        ExplicitLeft = 452
      end
    end
  end
  object actlstSatuan: TActionList
    Left = 488
    Top = 8
    object actAddSatuan: TAction
      Caption = 'Add'
      OnExecute = actAddSatuanExecute
    end
    object actEditSatuan: TAction
      Caption = 'Edit'
      OnExecute = actEditSatuanExecute
    end
    object actDeleteSatuan: TAction
      Caption = 'Delete'
      OnExecute = actDeleteSatuanExecute
    end
    object actRefreshSatuan: TAction
      Caption = 'Refresh'
      OnExecute = actRefreshSatuanExecute
    end
  end
end
