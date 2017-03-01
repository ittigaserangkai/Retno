inherited frmRekening: TfrmRekening
  Left = 204
  Top = 121
  Caption = 'Account'
  ClientHeight = 511
  ClientWidth = 741
  OldCreateOrder = True
  ExplicitWidth = 757
  ExplicitHeight = 550
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 741
    Height = 425
    ExplicitWidth = 741
    ExplicitHeight = 425
    object pnlTop: TPanel
      Left = 11
      Top = 11
      Width = 719
      Height = 46
      Align = alTop
      Color = 15198183
      TabOrder = 0
      object lbl1: TLabel
        Left = 8
        Top = 16
        Width = 67
        Height = 16
        Caption = 'Account Type'
      end
      object cbpRekGroup: TcxLookupComboBox
        Left = 96
        Top = 12
        Properties.ListColumns = <>
        TabOrder = 0
        Width = 121
      end
    end
    object pnlAll: TPanel
      Left = 11
      Top = 57
      Width = 719
      Height = 357
      Align = alClient
      BorderWidth = 10
      Color = 15198183
      TabOrder = 1
      object strgGrid: TStringGrid
        Left = 584
        Top = 88
        Width = 105
        Height = 233
        ColCount = 2
        TabOrder = 0
        ColWidths = (
          64
          64)
        RowHeights = (
          24
          24
          24
          24
          24)
      end
      object TlistRekening: TcxTreeList
        Left = 11
        Top = 11
        Width = 697
        Height = 335
        Align = alClient
        Bands = <
          item
          end>
        Navigator.Buttons.CustomButtons = <>
        TabOrder = 1
        object cxTreeList1Column1: TcxTreeListColumn
          Caption.Text = 'ACCOUNT CODE'
          DataBinding.ValueType = 'String'
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxTreeList1Column2: TcxTreeListColumn
          Caption.Text = 'ACCOUNT NAME'
          DataBinding.ValueType = 'String'
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxTreeList1Column3: TcxTreeListColumn
          Caption.Text = 'ACCOUNT LEVEL'
          DataBinding.ValueType = 'String'
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxTreeList1Column4: TcxTreeListColumn
          Caption.Text = 'ACCOUNT DESCRIPTION'
          DataBinding.ValueType = 'String'
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxTreeList1Column5: TcxTreeListColumn
          Caption.Text = 'PARENT CODE'
          DataBinding.ValueType = 'String'
          Position.ColIndex = 4
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxTreeList1Column6: TcxTreeListColumn
          Caption.Text = 'NORMAL BALANCE'
          DataBinding.ValueType = 'String'
          Position.ColIndex = 5
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxTreeList1Column7: TcxTreeListColumn
          Caption.Text = 'H / D'
          DataBinding.ValueType = 'String'
          Position.ColIndex = 6
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 741
    ExplicitWidth = 741
    inherited lblHeader: TLabel
      Width = 53
      Caption = 'ACCOUNT'
      ExplicitWidth = 53
    end
  end
  inline fraFooter5Button1: TfraFooter5Button [2]
    Left = 0
    Top = 455
    Width = 741
    Height = 56
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitTop = 455
    ExplicitWidth = 741
    inherited pnlFooter: TPanel
      Width = 741
      ExplicitWidth = 741
      inherited btnClose: TcxButton
        Left = 659
        ExplicitLeft = 659
      end
      inherited btnAdd: TcxButton
        Action = actAddRekening
      end
      inherited btnUpdate: TcxButton
        Action = actEditRekening
      end
      inherited btnDelete: TcxButton
        Action = actDeleteRekening
      end
      inherited btnRefresh: TcxButton
        Action = actRefreshRekening
      end
    end
    inherited pnlSortCut: TPanel
      Width = 741
      ExplicitWidth = 741
      inherited lbl5: TLabel
        Left = 651
        ExplicitLeft = 644
      end
    end
  end
  inherited cxStyle: TcxStyleRepository
    PixelsPerInch = 96
  end
  object actlstRekening: TActionList
    Left = 683
    Top = 367
    object actAddRekening: TAction
      Caption = '&Add'
      OnExecute = actAddRekeningExecute
    end
    object actEditRekening: TAction
      Caption = '&Edit'
      OnExecute = actEditRekeningExecute
    end
    object actDeleteRekening: TAction
      Caption = '&Delete'
      OnExecute = actDeleteRekeningExecute
    end
    object actRefreshRekening: TAction
      Caption = '&Refresh'
      OnExecute = actRefreshRekeningExecute
    end
  end
end
