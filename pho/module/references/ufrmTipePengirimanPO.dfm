inherited frmTipePengirimanPO: TfrmTipePengirimanPO
  Left = 213
  Top = 174
  Caption = 'PO Delivery'#39's Type'
  ClientHeight = 310
  ClientWidth = 540
  OldCreateOrder = True
  ExplicitWidth = 556
  ExplicitHeight = 349
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 540
    Height = 224
    ExplicitWidth = 120
    ExplicitHeight = 221
    object cxGrid: TcxGrid
      Left = 11
      Top = 11
      Width = 518
      Height = 202
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 104
      ExplicitTop = 64
      ExplicitWidth = 250
      ExplicitHeight = 200
      object cxGridViewTipePengiriman: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridViewTipePengiriman
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 540
    ExplicitWidth = 120
  end
  inline fraFooter5Button1: TfraFooter5Button
    Left = 0
    Top = 254
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
        Action = actAddTipePengirimanPO
        Caption = 'Add'
      end
      inherited btnUpdate: TcxButton
        Action = actEditTipePengirimanPO
        Caption = 'Edit'
      end
      inherited btnDelete: TcxButton
        Action = actDeleteTipePengirimanPO
      end
      inherited btnRefresh: TcxButton
        Action = actRefreshTipePengirimanPO
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
  object actlstTipePengirimanPO: TActionList
    Left = 440
    Top = 8
    object actAddTipePengirimanPO: TAction
      Caption = 'actAddTipePengirimanPO'
      OnExecute = actAddTipePengirimanPOExecute
    end
    object actEditTipePengirimanPO: TAction
      Caption = 'actEditTipePengirimanPO'
      OnExecute = actEditTipePengirimanPOExecute
    end
    object actDeleteTipePengirimanPO: TAction
      Caption = 'actDeleteTipePengirimanPO'
      OnExecute = actDeleteTipePengirimanPOExecute
    end
    object actRefreshTipePengirimanPO: TAction
      Caption = 'actRefreshTipePengirimanPO'
      OnExecute = actRefreshTipePengirimanPOExecute
    end
  end
end
