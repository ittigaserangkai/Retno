inherited frmMasterBrowse: TfrmMasterBrowse
  Caption = 'form Master Browse Data'
  ClientHeight = 338
  ClientWidth = 540
  ExplicitWidth = 556
  ExplicitHeight = 377
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Top = 33
    Width = 540
    Height = 249
    ExplicitTop = 33
    ExplicitWidth = 540
    ExplicitHeight = 249
    object cxGrid: TcxGrid
      Left = 11
      Top = 11
      Width = 518
      Height = 227
      Align = alClient
      TabOrder = 0
      LockedStateImageOptions.Text = 'Mohon ditunggu...'
      object cxGridView: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        FindPanel.InfoText = 'ketik teks yang dicari...'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        FilterRow.InfoText = 'klik untuk memfilter data'
        FilterRow.Visible = True
        NewItemRow.InfoText = 'Baris baru'
        OptionsView.NoDataToDisplayInfoText = '<Data kosong>'
        OptionsView.GroupByBox = False
      end
      object cxlvMaster: TcxGridLevel
        GridView = cxGridView
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 540
    Height = 33
    ExplicitWidth = 540
    ExplicitHeight = 33
    object lblFilterData: TcxLabel
      Left = 246
      Top = 13
      Anchors = [akTop, akRight]
      Caption = 'Filter Data'
    end
    object dtAwalFilter: TcxDateEdit
      Left = 310
      Top = 9
      Anchors = [akTop, akRight]
      EditValue = 0d
      Properties.DateButtons = [btnClear, btnToday]
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 1
      Width = 89
    end
    object lblsdFilter: TcxLabel
      Left = 406
      Top = 13
      Anchors = [akTop, akRight]
      Caption = 's.d.'
    end
    object dtAkhirFilter: TcxDateEdit
      Left = 438
      Top = 9
      Anchors = [akTop, akRight]
      EditValue = 0d
      Properties.DateButtons = [btnClear, btnToday]
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 3
      Width = 89
    end
  end
  inline fraFooter4Button1: TfraFooter4Button [2]
    Left = 0
    Top = 282
    Width = 540
    Height = 56
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitTop = 282
    ExplicitWidth = 540
    inherited pnlFooter: TPanel
      Width = 540
      ExplicitWidth = 540
      inherited btnClose: TcxButton
        Left = 458
        ExplicitLeft = 458
      end
    end
    inherited pnlSortCut: TPanel
      Width = 540
      ExplicitWidth = 540
      inherited lbl5: TLabel
        Left = 450
        ExplicitLeft = 444
      end
    end
  end
  inherited cxStyle: TcxStyleRepository
    Left = 352
    Top = 32
    PixelsPerInch = 96
  end
end
