inherited frmRekening: TfrmRekening
  Left = 204
  Top = 121
  Caption = 'Account'
  ClientHeight = 377
  ClientWidth = 756
  OldCreateOrder = True
  ExplicitWidth = 772
  ExplicitHeight = 416
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 756
    Height = 291
    ExplicitWidth = 741
    ExplicitHeight = 425
    object pnlTop: TPanel
      Left = 11
      Top = 11
      Width = 734
      Height = 46
      Align = alTop
      Color = 15198183
      TabOrder = 0
      ExplicitWidth = 719
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
      Width = 734
      Height = 223
      Align = alClient
      BorderWidth = 10
      Color = 15198183
      TabOrder = 1
      ExplicitWidth = 719
      ExplicitHeight = 357
      object strgGrid: TStringGrid
        Left = 584
        Top = 88
        Width = 105
        Height = 233
        ColCount = 2
        TabOrder = 0
      end
      object cxDBTreeList: TcxDBTreeList
        Left = 11
        Top = 11
        Width = 712
        Height = 201
        Align = alClient
        Bands = <
          item
          end>
        Navigator.Buttons.CustomButtons = <>
        RootValue = -1
        TabOrder = 1
        ExplicitLeft = 30
        ExplicitTop = 16
        ExplicitWidth = 250
        ExplicitHeight = 150
        object cxDBTreeListcxDBTreeListColumn1: TcxDBTreeListColumn
          DataBinding.FieldName = 'REK_CODE'
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxDBTreeListcxDBTreeListColumn2: TcxDBTreeListColumn
          DataBinding.FieldName = 'REK_NAME'
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxDBTreeListcxDBTreeListColumn3: TcxDBTreeListColumn
          Visible = False
          DataBinding.FieldName = 'REK_PARENT_CODE'
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 756
    ExplicitWidth = 741
    inherited lblHeader: TLabel
      Width = 53
      Caption = 'ACCOUNT'
      ExplicitWidth = 53
    end
  end
  inline fraFooter5Button1: TfraFooter5Button [2]
    Left = 0
    Top = 321
    Width = 756
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
      Width = 756
      ExplicitWidth = 741
      inherited btnClose: TcxButton
        Left = 674
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
      Width = 756
      ExplicitWidth = 741
      inherited lbl5: TLabel
        Left = 666
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
