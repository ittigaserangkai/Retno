inherited frmRekening: TfrmRekening
  Left = 204
  Top = 121
  Caption = 'Account'
  ClientHeight = 377
  ClientWidth = 773
  OldCreateOrder = True
  ExplicitWidth = 789
  ExplicitHeight = 416
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 773
    Height = 291
    ExplicitWidth = 756
    ExplicitHeight = 291
    object pnlAll: TPanel
      Left = 11
      Top = 11
      Width = 751
      Height = 269
      Align = alClient
      BorderWidth = 10
      Color = 15198183
      TabOrder = 0
      ExplicitTop = 57
      ExplicitWidth = 734
      ExplicitHeight = 223
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
        Width = 729
        Height = 247
        Align = alClient
        Bands = <
          item
          end>
        Navigator.Buttons.CustomButtons = <>
        OptionsData.Editing = False
        RootValue = -1
        TabOrder = 1
        ExplicitWidth = 712
        ExplicitHeight = 201
        object cxDBTreeListcxDBTreeListColumn1: TcxDBTreeListColumn
          Visible = False
          DataBinding.FieldName = 'REK_CODE'
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxDBTreeListcxDBTreeListColumn2: TcxDBTreeListColumn
          Visible = False
          DataBinding.FieldName = 'REK_NAME'
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxDBTreeListcxDBTreeListColumn3: TcxDBTreeListColumn
          Visible = False
          DataBinding.FieldName = 'REK_DESCRIPTION'
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxDBTreeListcxDBTreeListColumn4: TcxDBTreeListColumn
          Visible = False
          DataBinding.FieldName = 'REKENING_ID'
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxDBTreeListcxDBTreeListColumn5: TcxDBTreeListColumn
          DataBinding.FieldName = 'REKENING'
          Position.ColIndex = 4
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 773
    ExplicitWidth = 756
    inherited lblHeader: TLabel
      Width = 53
      Height = 18
      Caption = 'ACCOUNT'
      ExplicitWidth = 53
    end
  end
  inline fraFooter5Button1: TfraFooter5Button
    Left = 0
    Top = 321
    Width = 773
    Height = 56
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitTop = 321
    ExplicitWidth = 756
    inherited pnlFooter: TPanel
      Width = 773
      ExplicitWidth = 756
      inherited btnClose: TcxButton
        Left = 691
        OnClick = btnCloseClick
        ExplicitLeft = 674
      end
      inherited btnAdd: TcxButton
        Action = actAddRekening
      end
      inherited btnUpdate: TcxButton
        Action = actEditRekening
      end
      inherited btnDelete: TcxButton
        Action = actDeleteRekening
        Visible = False
      end
      inherited btnRefresh: TcxButton
        Action = actRefreshRekening
      end
    end
    inherited pnlSortCut: TPanel
      Width = 773
      ExplicitWidth = 756
      inherited lbl3: TLabel
        Left = 263
        Visible = False
        ExplicitLeft = 263
      end
      inherited lbl4: TLabel
        Left = 167
        ExplicitLeft = 167
      end
      inherited lbl5: TLabel
        Left = 683
        ExplicitLeft = 644
      end
    end
  end
  object actlstRekening: TActionList
    Left = 210
    Top = 111
    object actAddRekening: TAction
      Caption = '&Add'
      ShortCut = 16451
      OnExecute = actAddRekeningExecute
    end
    object actEditRekening: TAction
      Caption = '&Edit'
      ShortCut = 16453
      OnExecute = actEditRekeningExecute
    end
    object actDeleteRekening: TAction
      Caption = '&Delete'
      Enabled = False
      OnExecute = actDeleteRekeningExecute
    end
    object actRefreshRekening: TAction
      Caption = '&Refresh'
      ShortCut = 16500
      OnExecute = actRefreshRekeningExecute
    end
  end
end
