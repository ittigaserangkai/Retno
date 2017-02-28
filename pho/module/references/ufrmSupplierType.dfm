inherited frmSupplierType: TfrmSupplierType
  Top = 282
  Caption = 'Supplier Type'
  ClientHeight = 336
  ClientWidth = 542
  OldCreateOrder = True
  ExplicitWidth = 558
  ExplicitHeight = 375
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 542
    Height = 250
    ExplicitWidth = 120
    ExplicitHeight = 247
    object cxGrid: TcxGrid
      Left = 11
      Top = 11
      Width = 520
      Height = 228
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 524
      ExplicitHeight = 216
      object cxGridViewTipeSupplier: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridViewTipeSupplier
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 542
    ExplicitWidth = 120
  end
  inline fraFooter5Button1: TfraFooter5Button
    Left = 0
    Top = 280
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
    ExplicitTop = -56
    ExplicitWidth = 120
    inherited pnlFooter: TPanel
      Width = 542
      ExplicitWidth = 120
      inherited btnClose: TcxButton
        Left = 460
        OnClick = fraFooter5Button1btnCloseClick
        ExplicitLeft = 38
      end
      inherited btnAdd: TcxButton
        Action = actAddSupplierType
      end
      inherited btnUpdate: TcxButton
        Action = actEditSupplierType
      end
      inherited btnDelete: TcxButton
        Action = actDeleteSupplierType
      end
      inherited btnRefresh: TcxButton
        Action = actRefreshSupplierType
      end
    end
    inherited pnlSortCut: TPanel
      Width = 542
      ExplicitWidth = 120
      inherited lbl5: TLabel
        Left = 452
        ExplicitLeft = 452
      end
    end
  end
  object actlstSupplierType: TActionList
    Left = 464
    Top = 16
    object actAddSupplierType: TAction
      Caption = 'Add'
      OnExecute = actAddSupplierTypeExecute
    end
    object actEditSupplierType: TAction
      Caption = 'Edit'
      OnExecute = actEditSupplierTypeExecute
    end
    object actDeleteSupplierType: TAction
      Caption = 'Delete'
      OnExecute = actDeleteSupplierTypeExecute
    end
    object actRefreshSupplierType: TAction
      Caption = 'Refresh'
      OnExecute = actRefreshSupplierTypeExecute
    end
  end
end
