inherited frmHariLibur: TfrmHariLibur
  Left = 293
  Top = 220
  Caption = 'Day Off'
  ClientHeight = 339
  ClientWidth = 538
  OldCreateOrder = True
  ExplicitWidth = 554
  ExplicitHeight = 378
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 538
    Height = 253
    ExplicitWidth = 120
    ExplicitHeight = 247
    object cxGrid: TcxGrid
      Left = 11
      Top = 11
      Width = 516
      Height = 231
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 120
      ExplicitTop = 32
      ExplicitWidth = 250
      ExplicitHeight = 200
      object cxGridViewHariLibur: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridViewHariLibur
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 538
    ExplicitWidth = 120
  end
  inline fraFooter5Button1: TfraFooter5Button
    Left = 0
    Top = 283
    Width = 538
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
      Width = 538
      ExplicitWidth = 120
      inherited btnClose: TcxButton
        Left = 458
        ExplicitLeft = 40
      end
      inherited btnAdd: TcxButton
        Action = actAddHariLibur
        Caption = 'Add'
      end
      inherited btnUpdate: TcxButton
        Action = actEditHariLibur
        Caption = 'Edit'
      end
      inherited btnDelete: TcxButton
        Action = actDeleteHariLibur
      end
      inherited btnRefresh: TcxButton
        Action = actRefreshHariLibur
      end
    end
    inherited pnlSortCut: TPanel
      Width = 538
      ExplicitWidth = 120
      inherited lbl5: TLabel
        Left = 450
        ExplicitLeft = 452
      end
    end
  end
  object actlstHariLibur: TActionList
    Left = 464
    Top = 8
    object actAddHariLibur: TAction
      Caption = 'actAddHariLibur'
      OnExecute = actAddHariLiburExecute
    end
    object actEditHariLibur: TAction
      Caption = 'actEditHariLibur'
      OnExecute = actEditHariLiburExecute
    end
    object actDeleteHariLibur: TAction
      Caption = 'actDeleteHariLibur'
      OnExecute = actDeleteHariLiburExecute
    end
    object actRefreshHariLibur: TAction
      Caption = 'actRefreshHariLibur'
      OnExecute = actRefreshHariLiburExecute
    end
  end
end
