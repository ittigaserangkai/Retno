inherited frmGenerateVoucher: TfrmGenerateVoucher
  Left = 215
  Top = 138
  Caption = 'frmGenerateVoucher'
  ClientHeight = 425
  ClientWidth = 708
  OldCreateOrder = True
  ExplicitWidth = 724
  ExplicitHeight = 464
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 708
    Height = 336
    ExplicitWidth = 120
    ExplicitHeight = 269
    inherited pgcBrowse: TcxPageControl
      Width = 706
      Height = 191
      TabOrder = 1
      ExplicitTop = 151
      ExplicitWidth = 118
      ExplicitHeight = 117
      ClientRectBottom = 190
      ClientRectRight = 705
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 116
        ExplicitHeight = 115
        inherited cxGrid: TcxGrid
          Width = 704
          Height = 189
          ExplicitWidth = 116
          ExplicitHeight = 115
        end
      end
    end
    object pnl2: TPanel
      Left = 1
      Top = 192
      Width = 706
      Height = 143
      Align = alBottom
      BorderWidth = 5
      ParentColor = True
      TabOrder = 0
      object cxgrdVoucher: TcxGrid
        Left = 6
        Top = 6
        Width = 694
        Height = 131
        Align = alClient
        TabOrder = 0
        LockedStateImageOptions.Text = 'Mohon ditunggu...'
        LookAndFeel.NativeStyle = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 116
        ExplicitHeight = 115
        object grdVoucher: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          FindPanel.DisplayMode = fpdmManual
          FindPanel.InfoText = 'ketik teks yang dicari...'
          OnCellDblClick = cxGridViewCellDblClick
          DataController.Filter.Options = [fcoCaseInsensitive]
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          DataController.OnDetailExpanded = cxGridViewDataControllerDetailExpanded
          FilterRow.InfoText = 
            'Klik untuk memfilter data / Atau gunakan CTRL-F untuk panel filt' +
            'er'
          FilterRow.Visible = True
          FilterRow.ApplyChanges = fracImmediately
          NewItemRow.InfoText = 'Baris baru'
          OptionsData.Editing = False
          OptionsView.NoDataToDisplayInfoText = '<Data kosong>'
          OptionsView.GroupByBox = False
          Styles.ContentEven = DMClient.cxStyleGridEven
          Styles.Header = DMClient.cxStyleGridHeader
        end
        object grdlvlVoucher: TcxGridLevel
          GridView = grdVoucher
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 708
    ExplicitWidth = 120
    inherited lblFilterData: TcxLabel
      Left = 354
      ExplicitLeft = -234
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 415
      ExplicitLeft = -173
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 531
      ExplicitLeft = -57
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 626
      ExplicitLeft = 38
    end
    inherited lblsdFilter: TcxLabel
      Left = 507
      ExplicitLeft = -81
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 369
    Width = 708
    ExplicitTop = -112
    ExplicitWidth = 120
    inherited pnlFooter: TPanel
      Width = 708
      ExplicitWidth = 120
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
        Left = 631
        Action = actClose
        ExplicitLeft = 43
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 708
      ExplicitWidth = 120
      inherited lbEscape: TLabel
        Left = 634
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
  object SaveDialog1: TSaveDialog
    DefaultExt = '*.csv'
    Filter = 'Coma Separated Value|*.CSV'
    Title = 'Save To'
    Left = 569
    Top = 31
  end
end
