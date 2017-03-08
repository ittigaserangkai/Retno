inherited frmSatuan: TfrmSatuan
  Left = 223
  Top = 160
  Caption = 'Unit Of Measure'
  ClientHeight = 334
  ClientWidth = 542
  OldCreateOrder = True
  ExplicitTop = -18
  ExplicitWidth = 558
  ExplicitHeight = 373
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 542
    Height = 248
    ExplicitWidth = 542
    ExplicitHeight = 248
    object cxGrid: TcxGrid
      Left = 11
      Top = 11
      Width = 520
      Height = 226
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
      ExplicitTop = 49
      ExplicitWidth = 601
      ExplicitHeight = 292
      object cxGrdBrowse: TcxGridDBTableView
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
        GridView = cxGrdBrowse
        object lvDetail: TcxGridLevel
          Caption = 'Detail Data'
          Visible = False
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 542
    ExplicitWidth = 542
  end
  inline fraFooter5Button1: TfraFooter5Button [2]
    Left = 0
    Top = 278
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
    ExplicitTop = 278
    ExplicitWidth = 542
    inherited pnlFooter: TPanel
      Width = 542
      ExplicitWidth = 542
      inherited btnClose: TcxButton
        Left = 460
        ExplicitLeft = 460
      end
      inherited btnAdd: TcxButton
        Action = actAddSatuan
      end
      inherited btnUpdate: TcxButton
        Action = actEditSatuan
      end
      inherited btnDelete: TcxButton
        Action = actDeleteSatuan
      end
      inherited btnRefresh: TcxButton
        Action = actRefreshSatuan
      end
    end
    inherited pnlSortCut: TPanel
      Width = 542
      ExplicitWidth = 542
      inherited lbl5: TLabel
        Left = 452
        ExplicitLeft = 452
      end
    end
  end
  inherited cxStyle: TcxStyleRepository
    PixelsPerInch = 96
  end
  object actlstSatuan: TActionList
    Left = 488
    Top = 8
    object actAddSatuan: TAction
      Caption = 'Add'
      OnExecute = actAddSatuanExecute
    end
    object actEditSatuan: TAction
      Caption = 'Edit'
      OnExecute = actEditSatuanExecute
    end
    object actDeleteSatuan: TAction
      Caption = 'Delete'
      OnExecute = actDeleteSatuanExecute
    end
    object actRefreshSatuan: TAction
      Caption = 'Refresh'
      OnExecute = actRefreshSatuanExecute
    end
  end
end
