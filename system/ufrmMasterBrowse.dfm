inherited frmMasterBrowse: TfrmMasterBrowse
  Caption = 'form Master Browse Data'
  ClientHeight = 338
  ClientWidth = 577
  ExplicitWidth = 593
  ExplicitHeight = 377
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Top = 33
    Width = 577
    Height = 249
    ExplicitTop = 33
    ExplicitWidth = 540
    ExplicitHeight = 249
    object cxGrid: TcxGrid
      Left = 11
      Top = 11
      Width = 555
      Height = 227
      Align = alClient
      TabOrder = 0
      LockedStateImageOptions.Text = 'Mohon ditunggu...'
      ExplicitWidth = 518
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
    Width = 577
    Height = 33
    ExplicitWidth = 540
    ExplicitHeight = 33
    DesignSize = (
      577
      33)
    object lblFilterData: TcxLabel
      Left = 283
      Top = 18
      Anchors = [akTop, akRight]
      Caption = 'Filter Data'
      ExplicitLeft = 246
    end
    object dtAwalFilter: TcxDateEdit
      Left = 347
      Top = 9
      Anchors = [akTop, akRight]
      EditValue = 0d
      Properties.DateButtons = [btnClear, btnToday]
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 1
      ExplicitLeft = 310
      Width = 89
    end
    object lblsdFilter: TcxLabel
      Left = 443
      Top = 13
      Anchors = [akTop, akRight]
      Caption = 's.d.'
      ExplicitLeft = 406
    end
    object dtAkhirFilter: TcxDateEdit
      Left = 475
      Top = 9
      Anchors = [akTop, akRight]
      EditValue = 0d
      Properties.DateButtons = [btnClear, btnToday]
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 3
      ExplicitLeft = 438
      Width = 89
    end
  end
  inline fraFooter4Button1: TfraFooter4Button [2]
    Left = 0
    Top = 282
    Width = 577
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
      Width = 577
      ExplicitWidth = 540
      inherited btnClose: TcxButton
        Left = 495
        ExplicitLeft = 458
      end
      inherited btnAdd: TcxButton
        Left = 14
        ExplicitLeft = 14
      end
    end
    inherited pnlSortCut: TPanel
      Width = 577
      ExplicitWidth = 540
      inherited lbl5: TLabel
        Left = 487
        ExplicitLeft = 444
      end
    end
  end
  inherited cxStyle: TcxStyleRepository
    Left = 358
    Top = 105
    PixelsPerInch = 96
  end
end
