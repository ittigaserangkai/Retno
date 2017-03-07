inherited frmMasterBrowse: TfrmMasterBrowse
  Caption = 'form Master Browse Data'
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Top = 33
    Height = 244
    object cxGrid: TcxGrid
      Left = 11
      Top = 11
      Width = 512
      Height = 222
      Align = alClient
      TabOrder = 0
      LockedStateImageOptions.Text = 'Mohon ditunggu...'
      ExplicitLeft = 64
      ExplicitTop = 32
      ExplicitWidth = 250
      ExplicitHeight = 200
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
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridView
      end
    end
  end
  inherited pnlHeader: TPanel
    Height = 33
    ExplicitHeight = 33
    object lblFilterData: TcxLabel
      Left = 240
      Top = 13
      Anchors = [akTop, akRight]
      Caption = 'Filter Data'
    end
    object dtAwalFilter: TcxDateEdit
      Left = 304
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
      Left = 400
      Top = 13
      Anchors = [akTop, akRight]
      Caption = 's.d.'
    end
    object dtAkhirFilter: TcxDateEdit
      Left = 432
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
    Top = 277
    Width = 534
    Height = 56
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitLeft = -42
    ExplicitTop = 247
    inherited pnlFooter: TPanel
      Width = 534
      inherited btnClose: TcxButton
        Left = 452
      end
    end
    inherited pnlSortCut: TPanel
      Width = 534
      inherited lbl5: TLabel
        Left = 444
      end
    end
  end
  inherited cxStyle: TcxStyleRepository
    Left = 352
    Top = 32
    PixelsPerInch = 96
  end
end
