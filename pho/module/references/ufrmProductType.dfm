inherited frmProductType: TfrmProductType
  Left = 190
  Top = 168
  Caption = 'Product Type'
  ClientHeight = 342
  ClientWidth = 546
  OldCreateOrder = True
  ExplicitWidth = 562
  ExplicitHeight = 381
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 546
    Height = 256
    ExplicitWidth = 120
    ExplicitHeight = 247
    object cxGrid: TcxGrid
      Left = 11
      Top = 11
      Width = 524
      Height = 234
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 64
      ExplicitTop = 56
      ExplicitWidth = 250
      ExplicitHeight = 200
      object cxGridViewTipeProduk: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridViewTipeProduk
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 546
    ExplicitWidth = 120
  end
  inline fraFooter5Button1: TfraFooter5Button
    Left = 0
    Top = 286
    Width = 546
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
      Width = 546
      ExplicitWidth = 120
      inherited btnClose: TcxButton
        Left = 464
        OnClick = fraFooter5Button1btnCloseClick
        ExplicitLeft = 38
      end
      inherited btnAdd: TcxButton
        Action = actAddProductType
      end
      inherited btnUpdate: TcxButton
        Action = actEditProductType
      end
      inherited btnDelete: TcxButton
        Action = actDeleteProductType
      end
      inherited btnRefresh: TcxButton
        Action = actRefreshProductType
      end
    end
    inherited pnlSortCut: TPanel
      Width = 546
      ExplicitWidth = 120
      inherited lbl5: TLabel
        Left = 456
        ExplicitLeft = 452
      end
    end
  end
  object actlst1: TActionList
    Left = 504
    Top = 8
    object actAddProductType: TAction
      Caption = 'Add'
      OnExecute = actAddProductTypeExecute
    end
    object actEditProductType: TAction
      Caption = 'Edit'
      OnExecute = actEditProductTypeExecute
    end
    object actDeleteProductType: TAction
      Caption = 'Delete'
      OnExecute = actDeleteProductTypeExecute
    end
    object actRefreshProductType: TAction
      Caption = 'Refresh'
      OnExecute = actRefreshProductTypeExecute
    end
  end
end
