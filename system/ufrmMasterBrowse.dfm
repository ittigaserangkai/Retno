inherited frmMasterBrowse: TfrmMasterBrowse
  Caption = 'form Master Browse Data'
  ClientHeight = 403
  ClientWidth = 701
  OnKeyDown = nil
  ExplicitWidth = 717
  ExplicitHeight = 442
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Top = 33
    Width = 701
    Height = 314
    Color = clWindow
    ExplicitTop = 33
    ExplicitWidth = 701
    ExplicitHeight = 314
    object pgcBrowse: TcxPageControl
      Left = 11
      Top = 11
      Width = 679
      Height = 292
      Align = alClient
      TabOrder = 0
      Properties.ActivePage = tsBrowse
      Properties.CustomButtons.Buttons = <>
      Properties.HideTabs = True
      Properties.Options = [pcoAlwaysShowGoDialogButton, pcoGradient, pcoGradientClientArea, pcoRedrawOnResize, pcoUsePageColorForTab]
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      ClientRectBottom = 291
      ClientRectLeft = 1
      ClientRectRight = 678
      ClientRectTop = 1
      object tsBrowse: TcxTabSheet
        Caption = 'Browse Data'
        ImageIndex = 0
        ParentColor = False
        object cxGrid: TcxGrid
          Left = 0
          Top = 0
          Width = 677
          Height = 290
          Align = alClient
          TabOrder = 0
          LockedStateImageOptions.Text = 'Mohon ditunggu...'
          LookAndFeel.NativeStyle = False
          object cxGridView: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            FindPanel.DisplayMode = fpdmManual
            FindPanel.InfoText = 'ketik teks yang dicari...'
            DataController.Filter.Options = [fcoCaseInsensitive]
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            FilterRow.InfoText = 
              'Klik untuk memfilter data / Atau gunakan CTRL-F untuk panel filt' +
              'er'
            FilterRow.Visible = True
            FilterRow.ApplyChanges = fracImmediately
            NewItemRow.InfoText = 'Baris baru'
            OptionsData.Editing = False
            OptionsView.NoDataToDisplayInfoText = '<Data kosong>'
            OptionsView.GroupByBox = False
            Styles.ContentEven = DMClient.cxStyleGridHeader
            Styles.Header = DMClient.cxStyleGridEven
          end
          object cxlvMaster: TcxGridLevel
            GridView = cxGridView
          end
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 701
    Height = 33
    ExplicitWidth = 701
    ExplicitHeight = 33
    inherited lblHeader: TLabel
      Left = 6
      Height = 21
      Margins.Left = 5
      ExplicitLeft = 6
    end
    object lblFilterData: TcxLabel
      Left = 347
      Top = 1
      Align = alRight
      AutoSize = False
      Caption = 'Filter Data'
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      Visible = False
      Height = 31
      Width = 58
      AnchorY = 17
    end
    object dtAwalFilter: TcxDateEdit
      AlignWithMargins = True
      Left = 408
      Top = 5
      Margins.Top = 4
      Margins.Bottom = 4
      Align = alRight
      EditValue = 0d
      Properties.DateButtons = [btnClear, btnToday]
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 1
      Visible = False
      Width = 89
    end
    object dtAkhirFilter: TcxDateEdit
      AlignWithMargins = True
      Left = 524
      Top = 5
      Margins.Top = 4
      Margins.Bottom = 4
      Align = alRight
      EditValue = 0d
      Properties.DateButtons = [btnClear, btnToday]
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 2
      Visible = False
      Width = 89
    end
    object btnSearch: TcxButton
      AlignWithMargins = True
      Left = 619
      Top = 3
      Width = 78
      Height = 27
      Cursor = crHandPoint
      Margins.Top = 2
      Margins.Bottom = 2
      Align = alRight
      Action = actRefresh
      OptionsImage.Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF195000195000195000195000195000FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFF9F9F9F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00990019500000990033CC6633CC6633CC66009900195000FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7F7F7F7FFF00FFFF
        00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00990033CC6666FF9966FF9966FF9933CC6633CC660099001950
        00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFF7F7F7FFFFFFFFFFFFFFF
        FFFFFFFFFFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FF
        FF00FF00990033CC66009900009900009900009900CCFFCC33CC6633CC660099
        00195000FF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFF7F7F7F7F7F7F7F
        7F7F7F7F7FFFFFFFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FF
        FF00FF009900009900FF00FFFF00FFFF00FFFF00FF33CC66CCFFCC33CC6633CC
        66195000FF00FFFF00FFFF00FFFF00FFFF00FF7F7F7F7F7F7FFF00FFFF00FFFF
        00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF7F7F7FFFFFFFFFFFFFFF00FFFF00FF
        FF00FF009900FF00FFFF00FFFF00FF00990000990019500066FF9933CC6633CC
        6633CC66195000195000FF00FFFF00FFFF00FF7F7F7FFF00FFFFFFFFFF00FF9F
        9F9F9F9F9F7F7F7FFFFFFFFF00FFFF00FF7F7F7F7F7F7F7F7F7FFF00FFFF00FF
        FF00FFFF00FFFF00FF195000FF00FFFF00FF009900CCFFCC66FF9966FF9966FF
        99009900195000FF00FFFF00FFFF00FFFF00FFFF00FFFFFFFF7F7F7FFFFFFFFF
        00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF
        FF00FFFF00FF009900009900195000FF00FFFF00FF009900CCFFCC66FF990099
        00195000FF00FFFF00FFFF00FFFF00FFFF00FFFFFFFF7F7F7FFF00FF7F7F7FFF
        FFFFFF00FF7F7F7FFFFFFFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FF
        FF00FF00990033CC6633CC66009900195000FF00FFFF00FF0099000099001950
        00FF00FFFF00FFFF00FFFF00FFFF00FFFFFFFF7F7F7FFF00FFFF00FFFF00FF7F
        7F7FFFFFFFFF00FF7F7F7FFFFFFF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FF
        00990033CC6633CC6633CC6633CC66009900195000FF00FFFF00FF009900FF00
        FFFF00FFFF00FFFF00FFFF00FFFFFFFF7F7F7FFFFFFFFFFFFFFF00FFFF00FFFF
        00FF7F7F7FFFFFFFFF00FF7F7F7FFFFFFFFFFFFFFF00FFFF00FFFF00FF009900
        00990000990066FF9933CC66009900195000195000195000FF00FFFF00FFFF00
        FF195000FF00FFFF00FFFF00FF9F9F9F9F9F9F7F7F7FFFFFFFFF00FFFF00FF7F
        7F7F9F9F9F9F9F9FFF00FFFF00FFFFFFFF7F7F7FFFFFFFFF00FFFF00FFFF00FF
        FF00FF00990066FF9966FF99009900195000FF00FFFF00FFFF00FFFF00FF1950
        00195000FF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF9F
        9F9FFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFFFF00FFFF00FFFF00FF
        FF00FF009900CCFFCC66FF9966FF990099001950001950001950001950000099
        00195000FF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFDCDCDCFF00FFFF
        00FF9F9F9F7F7F7F7F7F7F7F7F7FDCDCDC9F9F9FFFFFFFFF00FFFF00FFFF00FF
        FF00FFFF00FF009900CCFFCC66FF9966FF9933CC6633CC6633CC660099000099
        00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFDCDCDCFF
        00FFFF00FFFF00FFFF00FFFF00FFDCDCDCDCDCDCFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF009900CCFFCC66FF9966FF9933CC660099000099000099
        00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF7F7F7F9F9F9FFFFFFFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF009900009900009900009900009900FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7F7F
        7F7F7F7F7F7F7F7F9F9F9FFFFFFFFF00FFFF00FFFF00FFFF00FF}
      OptionsImage.NumGlyphs = 2
      TabOrder = 4
    end
    object lblsdFilter: TcxLabel
      AlignWithMargins = True
      Left = 500
      Top = 4
      Margins.Left = 0
      Margins.Right = 0
      Align = alRight
      AutoSize = False
      Caption = 's/d'
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      Visible = False
      Height = 25
      Width = 21
      AnchorY = 17
    end
  end
  inline fraFooter4Button1: TfraFooter4Button
    Left = 0
    Top = 347
    Width = 701
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
    ExplicitWidth = 701
    inherited pnlFooter: TPanel
      Width = 701
      ExplicitWidth = 701
      inherited btnClose: TcxButton
        Left = 624
        ExplicitLeft = 624
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 701
      ExplicitWidth = 701
      inherited lbEscape: TLabel
        Left = 627
        ExplicitLeft = 627
      end
    end
  end
  object actlstBrowse: TActionList
    Left = 568
    Top = 152
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
      OnExecute = actCloseExecute
    end
    object actPrint: TAction
      Caption = '&Print'
      ShortCut = 16464
    end
    object actRefresh: TAction
      Caption = '&Refresh'
      OnExecute = actRefreshExecute
    end
    object actExport: TAction
      Caption = 'E&xport'
      OnExecute = actExportExecute
    end
  end
end
