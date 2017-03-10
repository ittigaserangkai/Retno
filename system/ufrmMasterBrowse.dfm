inherited frmMasterBrowse: TfrmMasterBrowse
  Caption = 'form Master Browse Data'
  ClientHeight = 403
  ClientWidth = 746
  ExplicitWidth = 762
  ExplicitHeight = 442
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Top = 33
    Width = 746
    Height = 314
    ExplicitTop = 33
    ExplicitWidth = 655
    ExplicitHeight = 314
    object cxGrid: TcxGrid
      Left = 11
      Top = 11
      Width = 724
      Height = 292
      Align = alClient
      TabOrder = 0
      LockedStateImageOptions.Text = 'Mohon ditunggu...'
      ExplicitWidth = 633
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
    Width = 746
    Height = 33
    ExplicitWidth = 655
    ExplicitHeight = 33
    object lblFilterData: TcxLabel
      Left = 423
      Top = 1
      Align = alRight
      Caption = 'Filter Data'
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      ExplicitLeft = 281
      ExplicitTop = 10
      ExplicitHeight = 20
      AnchorY = 17
    end
    object dtAwalFilter: TcxDateEdit
      AlignWithMargins = True
      Left = 484
      Top = 5
      Margins.Top = 4
      Align = alRight
      EditValue = 0d
      Properties.DateButtons = [btnClear, btnToday]
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 1
      ExplicitLeft = 441
      ExplicitTop = 7
      ExplicitHeight = 31
      Width = 89
    end
    object lblsdFilter: TcxLabel
      Left = 576
      Top = 1
      Align = alRight
      Caption = 's.d.'
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      ExplicitLeft = 611
      ExplicitTop = 7
      AnchorY = 17
    end
    object dtAkhirFilter: TcxDateEdit
      AlignWithMargins = True
      Left = 602
      Top = 5
      Margins.Top = 4
      Align = alRight
      EditValue = 0d
      Properties.DateButtons = [btnClear, btnToday]
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 3
      ExplicitLeft = 465
      ExplicitTop = 8
      Width = 89
    end
    object btnSearch: TcxButton
      AlignWithMargins = True
      Left = 697
      Top = 4
      Width = 45
      Height = 25
      Cursor = crHandPoint
      Align = alRight
      Action = actRefresh
      OptionsImage.Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        FFFFFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF500019500019FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
        9F9F9F9F9FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF663333993300500019FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
        9F9FFFFFFF9F9F9FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF663333993300993300500019FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
        9F9FFFFFFFFF00FF9F9F9FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF000000993300993300993300500019FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
        9F9FFFFFFFFF00FFFF00FF9F9F9FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF0000009933009933009933009933005000
        19FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
        9F9FFFFFFFFF00FFFF00FFFF00FF9F9F9FFFFFFFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF000000993300CC6600993300CC66009933
        00500019FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
        9F9FFFFFFFFF00FFFF00FFFF00FFFF00FF9F9F9FFFFFFFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF000000CC6600993300CC6600993300CC66
        00993300500019FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
        9F9FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF9F9F9FFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF000000CC6600CC6600CC6600CC6600CC66
        00CC6600663333FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
        9F9FFFFFFFFF00FFFF00FFFF00FFFF00FFFFFFFF9F9F9FFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF663333FF9900CC6600FF9900CC6600FF99
        00663333FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
        9F9FFFFFFFFF00FFFF00FFFF00FFFFFFFF9F9F9FFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF663333FF9900FF9900FF9900FF99006633
        33FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
        9F9FFFFFFFFF00FFFF00FFFFFFFF9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF663333FF9900FF9900FF9900663333FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
        9F9FFFFFFFFF00FFFFFFFF9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF663333FFE2B4FFE2B4663333FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
        9F9FFFFFFFFFFFFF9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF663333FFFFDE663333FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
        9F9FFFFFFF9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF663333663333FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F
        9F9F9F9F9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      OptionsImage.NumGlyphs = 2
      TabOrder = 4
      ExplicitLeft = 564
      ExplicitTop = 8
      ExplicitHeight = 24
    end
  end
  inline fraFooter4Button1: TfraFooter4Button [2]
    Left = 0
    Top = 347
    Width = 746
    Height = 56
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitTop = 347
    ExplicitWidth = 655
    inherited pnlFooter: TPanel
      Width = 746
      ExplicitWidth = 655
      inherited btnClose: TcxButton
        Left = 664
        Action = actClose
        ExplicitLeft = 573
      end
      inherited btnAdd: TcxButton
        Action = actAdd
      end
      inherited btnUpdate: TcxButton
        Action = actEdit
      end
      inherited btnPrint: TcxButton
        Action = actPrint
      end
    end
    inherited pnlSortCut: TPanel
      Width = 746
      ExplicitWidth = 655
      inherited lbl5: TLabel
        Left = 656
        ExplicitLeft = 444
      end
    end
  end
  inherited cxStyle: TcxStyleRepository
    Left = 328
    Top = 88
    PixelsPerInch = 96
  end
  object actlstBrowse: TActionList
    Left = 528
    Top = 88
    object actAdd: TAction
      Caption = 'A&dd'
      ShortCut = 16451
    end
    object actEdit: TAction
      Caption = '&Edit / Lihat'
      ShortCut = 16453
    end
    object actClose: TAction
      Caption = 'Close'
    end
    object actPrint: TAction
      Caption = '&Print'
      ShortCut = 16464
    end
    object actRefresh: TAction
    end
  end
end
