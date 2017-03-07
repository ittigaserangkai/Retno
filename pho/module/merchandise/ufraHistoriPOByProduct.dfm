object fraHistoriPOByProduct: TfraHistoriPOByProduct
  Left = 0
  Top = 0
  Width = 598
  Height = 240
  TabOrder = 0
  object pnl1: TPanel
    Left = 0
    Top = 23
    Width = 598
    Height = 217
    Align = alClient
    BevelOuter = bvLowered
    BorderWidth = 20
    TabOrder = 0
    DesignSize = (
      598
      217)
    object lblAdd: TcxLabel
      Left = 441
      Top = 4
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'Add'
      Enabled = False
      ParentFont = False
    end
    object lblEdit: TcxLabel
      Left = 471
      Top = 4
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'Edit'
      Enabled = False
      ParentFont = False
    end
    object lblDelete: TcxLabel
      Left = 501
      Top = 4
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'Delete'
      Enabled = False
      ParentFont = False
    end
    object lblClose: TcxLabel
      Left = 542
      Top = 4
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'Close'
      ParentFont = False
      OnClick = lblCloseClick
    end
    object cxGrid: TcxGrid
      Left = 21
      Top = 21
      Width = 556
      Height = 175
      Align = alClient
      TabOrder = 4
      ExplicitWidth = 647
      ExplicitHeight = 101
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
  object pnl4: TPanel
    Left = 0
    Top = 0
    Width = 598
    Height = 23
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = 'HISTORY PO BY PRODUCT'
    Color = 15422804
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
end
