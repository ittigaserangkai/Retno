inherited frmListQuotation: TfrmListQuotation
  Left = 224
  Top = 150
  ActiveControl = edtKodeSup1
  Caption = 'List Quotation'
  ClientHeight = 472
  ClientWidth = 645
  OldCreateOrder = True
  ExplicitWidth = 661
  ExplicitHeight = 511
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 645
    Height = 383
    ExplicitWidth = 645
    ExplicitHeight = 327
    inherited pgcBrowse: TcxPageControl
      Top = 121
      Width = 623
      Height = 251
      TabOrder = 1
      ExplicitTop = 121
      ExplicitWidth = 623
      ExplicitHeight = 65
      ClientRectBottom = 250
      ClientRectRight = 622
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 621
        ExplicitHeight = 63
        object lbl9: TLabel [0]
          Left = 0
          Top = 0
          Width = 621
          Height = 18
          Align = alTop
          Caption = 'Quotation List'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Trebuchet MS'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 2
          ExplicitTop = 2
          ExplicitWidth = 79
        end
        object lbl2: TLabel [1]
          Left = 0
          Top = 97
          Width = 621
          Height = 18
          Align = alTop
          Caption = 'Detail Quotation List'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Trebuchet MS'
          Font.Style = []
          ParentFont = False
          ExplicitTop = 90
        end
        inherited cxGrid: TcxGrid
          Top = 18
          Width = 621
          Height = 79
          Align = alTop
          ExplicitTop = 18
          ExplicitWidth = 621
          ExplicitHeight = 79
        end
        object cxgrdDetail: TcxGrid
          Left = 0
          Top = 115
          Width = 621
          Height = 134
          Align = alClient
          TabOrder = 1
          LockedStateImageOptions.Text = 'Mohon ditunggu...'
          LookAndFeel.NativeStyle = False
          ExplicitTop = 128
          ExplicitHeight = 65
          object grdViewDetail: TcxGridDBTableView
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
          object grdlvlDetail: TcxGridLevel
            GridView = grdViewDetail
          end
        end
      end
    end
    object pnlTop: TPanel
      Left = 11
      Top = 11
      Width = 623
      Height = 110
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      object lbl8: TLabel
        Left = 296
        Top = 9
        Width = 12
        Height = 18
        Caption = 'to'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
      end
      object lbl1: TLabel
        Left = 14
        Top = 8
        Width = 79
        Height = 18
        Caption = 'Supplier Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
      end
      object lbl6: TLabel
        Left = 14
        Top = 35
        Width = 84
        Height = 18
        Caption = 'CheckOut Date'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
      end
      object lbl10: TLabel
        Left = 296
        Top = 37
        Width = 12
        Height = 18
        Caption = 'to'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
      end
      object btnShowList: TcxButton
        Left = 14
        Top = 71
        Width = 120
        Height = 30
        Cursor = crHandPoint
        Caption = 'Show Listing'
        OptionsImage.ImageIndex = 14
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btnShowListClick
        OnKeyPress = btnShowListKeyPress
      end
      object dtTgl1: TcxDateEdit
        Left = 102
        Top = 36
        TabOrder = 2
        OnKeyPress = dtTgl1KeyPress
        Width = 183
      end
      object dtTgl2: TcxDateEdit
        Left = 320
        Top = 36
        TabOrder = 3
        OnKeyPress = dtTgl2KeyPress
        Width = 181
      end
      object edtKodeSup1: TcxButtonEdit
        Left = 103
        Top = 8
        Properties.Buttons = <
          item
          end>
        TabOrder = 0
        Text = '-'
        OnKeyPress = edtKodeSup1KeyPress
        OnKeyUp = edtKodeSup1KeyUp
        Width = 121
      end
      object edtKodeSup2: TcxButtonEdit
        Left = 319
        Top = 8
        Properties.Buttons = <
          item
          end>
        TabOrder = 1
        Text = '-'
        OnKeyPress = edtKodeSup2KeyPress
        OnKeyUp = edtKodeSup2KeyUp
        Width = 121
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 645
    ExplicitWidth = 645
    inherited lblFilterData: TcxLabel
      Left = 291
      ExplicitLeft = 291
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 352
      ExplicitLeft = 352
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 468
      ExplicitLeft = 468
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 563
      ExplicitLeft = 563
    end
    inherited lblsdFilter: TcxLabel
      Left = 444
      ExplicitLeft = 444
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 416
    Width = 645
    ExplicitTop = 360
    ExplicitWidth = 645
    inherited pnlFooter: TPanel
      Width = 645
      ExplicitWidth = 645
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
        Left = 568
        Action = actClose
        ExplicitLeft = 568
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 645
      ExplicitWidth = 645
      inherited lbEscape: TLabel
        Left = 571
        Height = 17
        ExplicitLeft = 571
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
  end
end
