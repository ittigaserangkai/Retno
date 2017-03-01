inherited frmBank: TfrmBank
  Left = 284
  Top = 210
  Caption = 'Bank'
  ClientHeight = 438
  ClientWidth = 623
  OldCreateOrder = True
  ExplicitWidth = 639
  ExplicitHeight = 477
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 623
    Height = 352
    ExplicitWidth = 539
    ExplicitHeight = 257
    object pnlBodyUp: TPanel
      Left = 11
      Top = 11
      Width = 601
      Height = 38
      Align = alTop
      Color = 15198183
      TabOrder = 0
      Visible = False
      ExplicitWidth = 517
      object Label1: TLabel
        Left = 8
        Top = 12
        Width = 41
        Height = 16
        Caption = 'Search :'
      end
      object edtPencarian: TEdit
        Left = 52
        Top = 8
        Width = 201
        Height = 24
        BevelInner = bvLowered
        BevelKind = bkFlat
        BorderStyle = bsNone
        TabOrder = 0
        OnChange = edtPencarianChange
        OnKeyPress = edtPencarianKeyPress
      end
    end
    object cxGrid: TcxGrid
      Left = 11
      Top = 49
      Width = 601
      Height = 292
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      ExplicitLeft = 16
      ExplicitTop = 55
      ExplicitWidth = 595
      ExplicitHeight = 286
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
    Width = 623
    ExplicitWidth = 539
    inherited lblHeader: TLabel
      Width = 69
      Caption = 'Master Bank'
      ExplicitWidth = 69
    end
  end
  inline fraFooter5Button1: TfraFooter5Button [2]
    Left = 0
    Top = 382
    Width = 623
    Height = 56
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitTop = 287
    ExplicitWidth = 539
    inherited pnlFooter: TPanel
      Width = 623
      ExplicitWidth = 539
      inherited btnClose: TcxButton
        Left = 541
        ExplicitLeft = 457
      end
      inherited btnAdd: TcxButton
        Action = actAddBank
      end
      inherited btnUpdate: TcxButton
        Action = actEditBank
      end
      inherited btnDelete: TcxButton
        Action = actDeleteBank
      end
      inherited btnRefresh: TcxButton
        Action = actRefreshBank
      end
    end
    inherited pnlSortCut: TPanel
      Width = 623
      ExplicitWidth = 539
      inherited lbl5: TLabel
        Left = 533
        ExplicitLeft = 452
      end
    end
  end
  object actlstBank: TActionList
    Left = 544
    Top = 8
    object actAddBank: TAction
      Caption = 'Add'
      OnExecute = actAddBankExecute
    end
    object actEditBank: TAction
      Caption = 'Edit'
      OnExecute = actEditBankExecute
    end
    object actDeleteBank: TAction
      Caption = 'Delete'
      OnExecute = actDeleteBankExecute
    end
    object actRefreshBank: TAction
      Caption = 'Refresh'
      OnExecute = actRefreshBankExecute
    end
  end
  inherited cxStyle: TcxStyleRepository
    PixelsPerInch = 96
  end
end
