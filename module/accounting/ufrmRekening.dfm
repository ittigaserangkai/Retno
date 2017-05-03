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
    Height = 288
    ExplicitWidth = 773
    ExplicitHeight = 288
    inherited pgcBrowse: TcxPageControl
      Width = 751
      Height = 266
      TabOrder = 1
      Visible = False
      ExplicitWidth = 751
      ExplicitHeight = 266
      ClientRectBottom = 265
      ClientRectRight = 750
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 749
        ExplicitHeight = 264
        inherited cxGrid: TcxGrid
          Width = 749
          Height = 264
          ExplicitWidth = 749
          ExplicitHeight = 264
        end
      end
    end
    object pnlAll: TPanel
      Left = 11
      Top = 11
      Width = 751
      Height = 266
      Align = alClient
      BorderWidth = 10
      Color = 15198183
      TabOrder = 0
      object cxDBTreeList: TcxDBTreeList
        Left = 11
        Top = 11
        Width = 729
        Height = 244
        Align = alClient
        Bands = <
          item
          end>
        Navigator.Buttons.CustomButtons = <>
        OptionsData.Editing = False
        RootValue = -1
        TabOrder = 0
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
    ExplicitWidth = 773
    inherited lblHeader: TLabel
      Width = 53
      Caption = 'ACCOUNT'
      ExplicitWidth = 53
    end
    inherited lblFilterData: TcxLabel
      Left = 419
      ExplicitLeft = 419
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 480
      ExplicitLeft = 480
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 596
      ExplicitLeft = 596
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 691
      ExplicitLeft = 691
    end
    inherited lblsdFilter: TcxLabel
      Left = 572
      ExplicitLeft = 572
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 321
    Width = 773
    ExplicitTop = 321
    ExplicitWidth = 773
    inherited pnlFooter: TPanel
      Width = 773
      ExplicitWidth = 773
      inherited btnAdd: TcxButton
        Action = actAdd
      end
      inherited btnUpdate: TcxButton
        Action = actEdit
      end
      inherited btnPrint: TcxButton
        Action = actPrint
      end
      inherited btnClose: TcxButton
        Left = 696
        Action = actClose
        ExplicitLeft = 696
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 773
      ExplicitWidth = 773
      inherited lbEscape: TLabel
        Left = 699
        Height = 17
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actAdd: TAction
      OnExecute = actAddExecute
    end
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
  end
end
