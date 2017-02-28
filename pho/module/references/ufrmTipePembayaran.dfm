inherited frmTipePembayaran: TfrmTipePembayaran
  Left = 248
  Top = 217
  Caption = 'Payment Type'
  ClientHeight = 335
  ClientWidth = 535
  OldCreateOrder = True
  ExplicitWidth = 551
  ExplicitHeight = 374
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 535
    Height = 249
    ExplicitWidth = 120
    ExplicitHeight = 249
    object cxGrid: TcxGrid
      Left = 11
      Top = 11
      Width = 513
      Height = 227
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 227
      ExplicitHeight = 513
      object cxGridViewTipePembayaran: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridViewTipePembayaran
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 535
    ExplicitWidth = 120
  end
  inline fraFooter5Button1: TfraFooter5Button
    Left = 0
    Top = 279
    Width = 535
    Height = 56
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitTop = 279
    ExplicitWidth = 120
    inherited pnlFooter: TPanel
      Width = 535
      ExplicitWidth = 120
      inherited btnClose: TcxButton
        Left = 453
        ExplicitLeft = 38
      end
      inherited btnAdd: TcxButton
        Action = actAddTipePembayaran
        Caption = 'Add'
      end
      inherited btnUpdate: TcxButton
        Action = actEditTipePembayaran
        Caption = 'Edit'
      end
      inherited btnDelete: TcxButton
        Action = actDeleteTipePembayaran
      end
      inherited btnRefresh: TcxButton
        Action = actRefreshTipePembayaran
      end
    end
    inherited pnlSortCut: TPanel
      Width = 535
      ExplicitWidth = 120
      inherited lbl5: TLabel
        Left = 445
        ExplicitLeft = 452
      end
    end
  end
  object actlstTipePembayaran: TActionList
    Left = 472
    Top = 8
    object actAddTipePembayaran: TAction
      Caption = 'actAddTipePembayaran'
      OnExecute = actAddTipePembayaranExecute
    end
    object actEditTipePembayaran: TAction
      Caption = 'actEditTipePembayaran'
      OnExecute = actEditTipePembayaranExecute
    end
    object actDeleteTipePembayaran: TAction
      Caption = 'actDeleteTipePembayaran'
      OnExecute = actDeleteTipePembayaranExecute
    end
    object actRefreshTipePembayaran: TAction
      Caption = 'actRefreshTipePembayaran'
      OnExecute = actRefreshTipePembayaranExecute
    end
  end
end
