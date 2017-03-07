inherited frmPajak: TfrmPajak
  Left = 261
  Top = 178
  Caption = 'Tax'
  ClientHeight = 372
  ClientWidth = 740
  OldCreateOrder = True
  ExplicitWidth = 756
  ExplicitHeight = 411
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 740
    Height = 286
    ExplicitWidth = 740
    ExplicitHeight = 324
    object cxGrid: TcxGrid
      Left = 11
      Top = 11
      Width = 718
      Height = 264
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      ExplicitHeight = 302
      object cxGridBrowse: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Filter.Options = [fcoCaseInsensitive]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
          end>
        DataController.Summary.SummaryGroups = <>
        FilterRow.Visible = True
        FilterRow.ApplyChanges = fracImmediately
        OptionsCustomize.ColumnHiding = True
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.GroupByBox = False
        Styles.ContentEven = styleGridEven
        Styles.Header = styleGridHeader
      end
      object cxGrdDetail: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.GroupByBox = False
      end
      object lvMaster: TcxGridLevel
        Caption = 'Master Data'
        GridView = cxGridBrowse
        object lvDetail: TcxGridLevel
          Caption = 'Detail Data'
          Visible = False
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 740
    ExplicitWidth = 740
  end
  inline fraFooter5Button1: TfraFooter5Button [2]
    Left = 0
    Top = 316
    Width = 740
    Height = 56
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitTop = 354
    ExplicitWidth = 740
    inherited pnlFooter: TPanel
      Width = 740
      ExplicitWidth = 740
      inherited btnClose: TcxButton
        Left = 658
        ExplicitLeft = 658
      end
      inherited btnAdd: TcxButton
        Top = 4
        Action = actAddPajak
        ExplicitTop = 4
      end
      inherited btnUpdate: TcxButton
        Action = actEditPajak
      end
      inherited btnDelete: TcxButton
        Action = actDeletePajak
      end
      inherited btnRefresh: TcxButton
        Action = actRefreshPajak
      end
    end
    inherited pnlSortCut: TPanel
      Width = 740
      ExplicitWidth = 740
      inherited lbl5: TLabel
        Left = 650
        ExplicitLeft = 452
      end
    end
  end
  inherited cxStyle: TcxStyleRepository
    PixelsPerInch = 96
  end
  object actlstPajak: TActionList
    Left = 440
    Top = 8
    object actAddPajak: TAction
      Caption = 'Add'
      OnExecute = actAddPajakExecute
    end
    object actEditPajak: TAction
      Caption = 'Edit'
      OnExecute = actEditPajakExecute
    end
    object actDeletePajak: TAction
      Caption = 'Delete'
      OnExecute = actDeletePajakExecute
    end
    object actRefreshPajak: TAction
      Caption = 'Refresh'
      OnExecute = actRefreshPajakExecute
    end
  end
  object DataSource1: TDataSource
    Left = 449
    Top = 173
  end
end
